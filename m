Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FE56E04A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Aug 2021 05:31:26 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 27 Aug 2021 10:53:49 +0530
Message-Id: <20210827052349.1171468-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] tests/kms_setmode: Handle unsupported modes
 for invalid crtc test
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

Unsupported modes in crtc need to return proper error in order
to report back that applied config was failed or not. Thus
previously added ENOENT error but later decided to remove
crtc_supports_mode check which is also possible solution.

Test affected (fail -> pass after change) :
igt@kms_setmode@invalid-clone-single-[crtc|crtc-stealing]

invalid-clone-single-crtc-stealing still fails which is not
related and will be handled with different follow up patch.

Changes since V1:
	- Replaced previous logic with crtc_supports_mode check removal

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_setmode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 89220b83..80665204 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -569,9 +569,6 @@ int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
 	for (int i = 0; i < crtc->cconfs->connector->count_modes; i++) {
 		uint32_t *ids;
 
-		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i]))
-			continue;
-
 		crtc->mode = crtc->cconfs->connector->modes[i];
 
 		get_crtc_config_str(crtc, str_buf[base], sizeof(str_buf[base]));
-- 
2.31.1
