Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD53589D9B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 06:44:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 23 Mar 2020 12:02:46 +0530
Message-Id: <20200323063248.5261-4-anshuman.gupta@intel.com>
In-Reply-To: <20200323063248.5261-1-anshuman.gupta@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/5] tests/i915_pm_lpsp: Skip
 panel-fitter subtest for 1024x768 panels
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

It makes sense to skip the test if edp-panel native resoultion
is limted to 1024x768 rather than failing the test.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index e400c92e..0ce694e6 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -179,10 +179,10 @@ static void edp_subtest(data_t *data, bool use_panel_fitter)
 			 * support LPSP are too new for panels with native
 			 * 1024x768 resolution, so this should force the panel
 			 * fitter. */
-			igt_assert(c->count_modes &&
-				   c->modes[0].hdisplay > 1024);
-			igt_assert(c->count_modes &&
-				   c->modes[0].vdisplay > 768);
+			igt_require(c->count_modes &&
+				    c->modes[0].hdisplay > 1024);
+			igt_require(c->count_modes &&
+				    c->modes[0].vdisplay > 768);
 			data->mode = &std_1024_mode;
 			igt_output_override_mode(output, data->mode);
 		} else {
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
