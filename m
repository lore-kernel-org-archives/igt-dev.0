Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A7210E765
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 09:34:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  7 Apr 2022 15:02:55 +0530
Message-Id: <20220407093255.1365917-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_setmode: Fix the corner case in
 handling 5k+ modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In below example, second combination (Pipe-B & Pipe-A) is invalid
as bigjoiner come in to the picture. Somehow we missed this corner
case in earlier fix, hence fixing now.

Starting dynamic subtest: pipe-A-DP-1-pipe-B-DP-4
  Test id#1 CRTC count 2
    CRTC[115] [Pipe A] Mode: 3840x2160@30Hz Connectors: DP-1[384]
    CRTC[203] [Pipe B] Mode: 7680x4320@30Hz Connectors: DP-4[416]
Dynamic subtest pipe-A-DP-1-pipe-B-DP-4: SUCCESS (0.509s)
Starting dynamic subtest: pipe-B-DP-1-pipe-A-DP-4
  Test id#2 CRTC count 2
    CRTC[203] [Pipe B] Mode: 3840x2160@30Hz Connectors: DP-1[384]
    CRTC[115] [Pipe A] Mode: 7680x4320@30Hz Connectors: DP-4[416]
Dynamic subtest pipe-B-DP-1-pipe-A-DP-4: FAIL (0.272s)

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 969ad75c..ba48dee8 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -679,7 +679,8 @@ static void test_one_combination(const struct test_config *tconf,
 			 */
 			if ((crtc->mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
 			    ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
-			     (i < (crtc_count - 1) && abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1))) {
+			     (i < (crtc_count - 1) && abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1) ||
+			     (i > 0 && abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
 			}
-- 
2.35.1
