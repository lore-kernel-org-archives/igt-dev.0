Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA41E6E87E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 22:17:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 14 Oct 2021 01:17:25 +0300
Message-Id: <20211013221727.6392-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] tests/i915/kms_flip_tiling: Drop
 useless i915 include
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Nothing here needs any i915 specfic things. Drop the header.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_flip_tiling.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index e2e6619baeca..8eecb20c49b9 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -29,7 +29,6 @@
 #include <stdio.h>
 #include <string.h>
 
-#include "i915/gem.h"
 #include "igt.h"
 
 IGT_TEST_DESCRIPTION("Test page flips and tiling scenarios");
-- 
2.32.0
