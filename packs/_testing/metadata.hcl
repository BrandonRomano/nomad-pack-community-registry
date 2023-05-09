# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
app {
  url    = "https://github.com/hashicorp/testing"
  author = "HashiCorp Maintainers"
}

pack {
  name        = "testing - 11"
  description = "Just testing"
  version     = "0.0.1"
}

integration {
  identifier    = "nomad/hashicorp/just-testing"
}
