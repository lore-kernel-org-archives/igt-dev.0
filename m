Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126AE6EE24
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 15:35:34 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 16 Sep 2021 18:35:14 +0300
Message-Id: <20210916153515.21369-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/kms_invalid_mode: Test
 clock==(U)INT_MAX
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

Test against some big clock values to make sure we can't trick the
kernel into bypassing the validation via an integer overflows/etc.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_invalid_mode.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/i915/kms_invalid_mode.c b/tests/i915/kms_invalid_mode.c
index 6d56a378d141..722aa816fca1 100644
--- a/tests/i915/kms_invalid_mode.c
+++ b/tests/i915/kms_invalid_mode.c
@@ -23,6 +23,7 @@
  */
 
 #include "igt.h"
+#include <limits.h>
 #include <stdbool.h>
 
 IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
@@ -107,6 +108,20 @@ adjust_mode_zero_clock(data_t *data, drmModeModeInfoPtr mode)
 	return true;
 }
 
+static bool
+adjust_mode_int_max_clock(data_t *data, drmModeModeInfoPtr mode)
+{
+	mode->clock = INT_MAX;
+	return true;
+}
+
+static bool
+adjust_mode_uint_max_clock(data_t *data, drmModeModeInfoPtr mode)
+{
+	mode->clock = UINT_MAX;
+	return true;
+}
+
 static bool
 adjust_mode_zero_hdisplay(data_t *data, drmModeModeInfoPtr mode)
 {
@@ -244,6 +259,12 @@ static const struct {
 	{ .name = "zero-clock",
 	  .adjust_mode = adjust_mode_zero_clock,
 	},
+	{ .name = "int-max-clock",
+	  .adjust_mode = adjust_mode_int_max_clock,
+	},
+	{ .name = "uint-max-clock",
+	  .adjust_mode = adjust_mode_uint_max_clock,
+	},
 	{ .name = "zero-hdisplay",
 	  .adjust_mode = adjust_mode_zero_hdisplay,
 	},
-- 
2.32.0
