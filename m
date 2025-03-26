Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F80C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 10:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CDD10E6A5;
	Wed, 26 Mar 2025 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knazBxPK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC8E10E6A5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742985221; x=1774521221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gokFrsY84Kc62k7SC12geRUh/8K1oKo9BmAENuLEyX4=;
 b=knazBxPKmw62X5vvYbQhdPCJ07Yxn6N6zIBvUBrl48mwSi9F7cDtufhF
 kNkagUZKAvGPUKH6TbT14KLF+StW48Zl5fIzbSqoQEL58iqA2rpXTLSTK
 aLRZirWFAU0RMq3vRIXATcavtQnsdpYJ2qIVlU0anHr6SYXDKowPBCE4A
 cYRvLAUgMB7U0lWcvAmve8MRoNK4gYa+An0zKzmuDVYiPgy7SeaTffwYb
 N30bEpMAnd9kIt9PC61ltvaMHejYlzlUsGSR/XntC5VR/sCSjesDx8Ch3
 8Bqa5KdObyoNZLROjUj7HsLObDvpOjwZiGBc08vCXDTc8TBHl3bVlg4Dd w==;
X-CSE-ConnectionGUID: RNxkz5TeRVOD8JgbhpWtTg==
X-CSE-MsgGUID: v/TEk8DFRpW4Gv4djyzTug==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44144446"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44144446"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:33:41 -0700
X-CSE-ConnectionGUID: jo6oBh9gR8envcwM5sYblQ==
X-CSE-MsgGUID: qKH4ulUuStqYgq7mdtQZNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="161923232"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:33:39 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 2/4] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Wed, 26 Mar 2025 15:57:56 +0530
Message-Id: <20250326102758.2728285-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326102758.2728285-1-santhosh.reddy.guddati@intel.com>
References: <20250326102758.2728285-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Utilise IN_FORMATS_ASYNC property exposed to get the list of
async supported modifier/format pair and improve the test coverage by
iterating through all the supported modifier format pairs.

V2: Improve run_test_with_modifiers to set data formats based on async
    formats.
    Update make_fb to use data formats instead of hard coded format

V3: Update commit message, remove complicated iterations (Chaitanya)

V4: Reduce the format+modifier combinations to reduce time needed to
    execute the tests. (Chaitanya)

V5: Remove unnecessary check for reduced formats. (Chaitanya)

V6: Introduce new test for all formats and modifiers, executing only one
    flip to reduce overall time.
    Update test_with_modifiers to use async modifiers and formats X8888.

V7: split the newly added subtest to separate commit and add condition
    to skip the test if async format modifiers are not available. Also
    remove data->fail as it is not needed with the new support (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..369318368 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -36,6 +36,7 @@
 #include "igt.h"
 #include "igt_aux.h"
 #include "igt_psr.h"
+#include "igt_vec.h"
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <poll.h>
@@ -85,6 +86,9 @@
  *
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
+ *
+ * SUBTEST: async-flip-with-all-modifiers-formats
+ * Description: Verify the async flip functionality with all supported modifiers and formats
  */
 
 #define CURSOR_POS 128
@@ -122,8 +126,15 @@ typedef struct {
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
+	unsigned int plane_format;
+	bool async_mod_formats;
 } data_t;
 
+struct format_mod {
+	uint64_t modifier;
+	uint32_t format;
+};
+
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -193,7 +204,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	rec_width = width / (NUM_FBS * 2);
 
-	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
 			    data->modifier, 0.0, 0.0, 0.5, fb);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
@@ -348,10 +359,19 @@ static void test_async_flip(data_t *data)
 			data->suspend_resume = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
+
+		/* Reduce test execution for all formats and modifiers. One flip should suffice */
+		if (data->async_mod_formats) {
+			igt_assert_f(ret == 0, "Async flip failed with %s modifier and %s format",
+				     igt_fb_modifier_name(data->modifier),
+				     igt_format_str(data->plane_format));
+			break;
+		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
-	if (!data->alternate_sync_async) {
+	if (!data->alternate_sync_async && !data->async_mod_formats) {
 		fps = frame * 1000 / RUN_TIME;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
 			     "FPS should be significantly higher than the refresh rate\n");
@@ -715,12 +735,14 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
+		igt_require_f(data->plane->async_format_mod_count > 0,
+			      "No async format/modifier supported\n");
+
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
 			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
 				continue;
 
-			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
+			data->modifier = data->plane->async_modifiers[i];
 
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
@@ -757,6 +779,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-- 
2.34.1

