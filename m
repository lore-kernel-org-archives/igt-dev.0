Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327D56E80B
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 07:50:40 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 19 Aug 2021 13:12:54 +0530
Message-Id: <20210819074254.1129285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_setmode: Handle unsupported modes for
 invalid crtc test
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
to report back that applied config was failed or not. Thus added
ENOENT error.

Test affected (fail -> pass after change) :
igt@kms_setmode@invalid-clone-single-[crtc|crtc-stealing]

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_setmode.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 89220b83..f322a373 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -569,8 +569,10 @@ int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
 	for (int i = 0; i < crtc->cconfs->connector->count_modes; i++) {
 		uint32_t *ids;
 
-		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i]))
+		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i])) {
+			ret = -ENOENT;
 			continue;
+		}
 
 		crtc->mode = crtc->cconfs->connector->modes[i];
 
@@ -622,6 +624,9 @@ int __test_crtc_config(struct crtc_config *crtcs, int crtc_count,
 		return ret;
 	}
 
+	if (ret < 0)
+		*config_failed = true;
+
 	/* When all crtcs[base].modes are tried & failed to fit into link BW. */
 	return ret;
 }
-- 
2.31.1
