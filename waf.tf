resource "aws_wafregional_web_acl" "project" {
  name        = "tfWebACL"
  metric_name = "tfWebACL"
  tags        = var.tags

  default_action {
    type = "ALLOW"
  }

  rule {
    action {
      type = "BLOCK"
    }

    priority = 1
    rule_id  = aws_wafregional_rule.wafrule.id
    type     = "REGULAR"
  }
}

resource "aws_wafregional_rule" "wafrule" {
  name        = "tfWAFRule"
  metric_name = "tfWAFRule"

  predicate {
    data_id = aws_wafregional_geo_match_set.geo_match_set.id
    negated = false
    type    = "GeoMatch"
  }
  predicate {
    data_id = aws_wafregional_ipset.ipset.id
    negated = false
    type    = "IPMatch"
  }

}

resource "aws_wafregional_geo_match_set" "geo_match_set" {
  name = "geo_match_set"

  geo_match_constraint {
    type  = "Country"
    value = var.blacklisted_country1
  }
  geo_match_constraint {
    type  = "Country"
    value = var.blacklisted_country2
  }

}

resource "aws_wafregional_ipset" "ipset" {
  name = "tfIPSet"

  ip_set_descriptor {
    type  = "IPV4"
    value = var.blacklisted_ip_set1
  }
  ip_set_descriptor {
    type  = "IPV4"
    value = var.blacklisted_ip_set2
  }
}


resource "aws_wafregional_web_acl_association" "project" {
  resource_arn = aws_lb.project.arn
  web_acl_id   = aws_wafregional_web_acl.project.id
}