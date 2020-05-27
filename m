Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13666E2DF
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2020 11:10:19 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Wed, 27 May 2020 16:35:07 +0530
Message-Id: <20200527110507.16902-3-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
References: <20200527110507.16902-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] [RFC 2/2] tests/kms_content_protection: Remove
 pre-existing SRM table before the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, petri.latvala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is to check the case with missing SRM, which should be treated as
device with no revoked keys.

Kernel patch fixing such a bug :
https://patchwork.freedesktop.org/patch/361346/?series=75939&rev=2

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_content_protection.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index a6a64a28..257d3dd8 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -783,6 +783,10 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.drm_fd);
+
+		/* Remove pre-existing srm table */
+		igt_assert_f(!remove("/lib/firmware/display_hdcp_srm.bin"),
+			     "Failed to delete previous srm table\n");
 	}
 
 	for (i = 0; i < ARRAY_SIZE(hdcp_protocol); i++) {
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
