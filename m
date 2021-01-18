Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DFE89298
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jan 2021 07:39:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 18 Jan 2021 21:02:52 +0530
Message-Id: <20210118153252.14062-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Handle conflicting
 encoders
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

When conflicting encoders are found, driver will disable other
connectors, instead of failing with -EINVAL. So we endup with
test failures.

This patch will update the logic to expect the failure for the
combinations where all connectors are on the same crtc only.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 878e149a9..16648087d 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -255,7 +255,8 @@ static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
 	}
 }
 
-static void setup_crtcs(drmModeRes *resources, struct connector_config *cconf,
+static void setup_crtcs(const struct test_config *tconf,
+			struct connector_config *cconf,
 			int connector_count, struct crtc_config *crtcs,
 			int *crtc_count_ret, bool *config_valid_ret)
 {
@@ -263,6 +264,7 @@ static void setup_crtcs(drmModeRes *resources, struct connector_config *cconf,
 	int crtc_count;
 	bool config_valid;
 	int i;
+	drmModeRes *resources = tconf->resources;
 	int encoder_usage_count[resources->count_encoders];
 
 	kmstest_unset_all_crtcs(drm_fd, resources);
@@ -351,7 +353,8 @@ static void setup_crtcs(drmModeRes *resources, struct connector_config *cconf,
 		drmModeFreeEncoder(encoder);
 	}
 	for (i = 0; i < resources->count_encoders; i++)
-		if (encoder_usage_count[i] > 1)
+		if (encoder_usage_count[i] > 1 &&
+				!!(tconf->flags & TEST_SINGLE_CRTC_CLONE))
 			config_valid = false;
 
 	*crtc_count_ret = crtc_count;
@@ -604,7 +607,7 @@ static void test_one_combination(const struct test_config *tconf,
 	int crtc_count;
 	bool config_valid;
 
-	setup_crtcs(tconf->resources, cconfs, connector_count, crtcs,
+	setup_crtcs(tconf, cconfs, connector_count, crtcs,
 		    &crtc_count, &config_valid);
 
 	if (config_valid == !(tconf->flags & TEST_INVALID))
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
