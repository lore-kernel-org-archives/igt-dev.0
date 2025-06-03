Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658AAC61CE5
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 23:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73910E7A9;
	Tue,  3 Jun 2025 23:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHJig8LJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6EB10E740
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748995061; x=1780531061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jtwS2o5rH/0ggcvGx8+kl9otz3ir8liTVUR0m53QcTU=;
 b=AHJig8LJ172cnVIWwhoz/yUEA+x1nG/ipPVw2FFehZUaHoA10s1dbX7x
 O+w42+5/DKgMoV2Bl6EV3wYX7QeB/IOK8jNt3QdMydyDk1a+tTjLyjn21
 pK7LZEs239tJLYAke6sD4Iv5axmR6n7LI8Mw2up3D9UWt84jKp+4BwcY5
 xz/LX6tO67QlxZjkd3cdbntdY7ryQOnabnsgsh58QBggYYKY2O0W4etFk
 5SR3KnQaHAktSeRNv1dtB5bdi+f/LuQ/nxj6NqUL/0FvqlzaUiEp40MEZ
 zs5ymlczULiKQIz1tM3cpZ3R7PM+4c/BWmPuGdPtqC/cprg7S7GX+N8IH g==;
X-CSE-ConnectionGUID: QRYmCsILS9e/qFirzzEEZQ==
X-CSE-MsgGUID: H34wUIjOQIWEoUprjj0Zhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68491403"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="68491403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:57:41 -0700
X-CSE-ConnectionGUID: fZP57ianS6Cq+wpP/hzDig==
X-CSE-MsgGUID: I2Mw/XlkT36jfCpJTjoQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145028901"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:57:41 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_eu_stall: Do not check for presence
 of data on simulation
Date: Tue,  3 Jun 2025 16:57:35 -0700
Message-ID: <37ab7f14480edb308e152d1a9088394407b031e8.1748994982.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
References: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
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

Some simulation models may not have full EU stall sampling support.

v2: 1. Make EU stall fd global and close any open fd before open (Ashutosh)
    2. Move disable IOCTL call to before the assert.
    3. Allocate and free the user buffer in the main routine to prevent
       any memory leak due to an assert.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 1499ec4b4..b3a0ee742 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -65,6 +65,7 @@
 static FILE *output;
 static char *p_args[8];
 static char *output_file;
+static uint8_t *user_buf;
 static uint8_t p_gt_id;
 static uint32_t p_rate;
 static uint32_t p_user = DEFAULT_USER_BUF_SIZE;
@@ -493,7 +494,6 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 	struct sigaction sa = { 0 };
 	int ret, flags;
 	uint64_t total_size;
-	uint8_t *buf;
 
 	uint64_t properties[] = {
 		DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
@@ -520,9 +520,6 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 	else
 		igt_info("Workload: GPGPU fill\n");
 
-	buf = malloc(p_user);
-	igt_assert(buf);
-
 	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
@@ -579,11 +576,11 @@ enable:
 			igt_assert_eq(ret, 1);
 			igt_assert(pollfd.revents & POLLIN);
 		}
-		ret = read(stream_fd, buf, p_user);
+		ret = read(stream_fd, user_buf, p_user);
 		if (ret > 0) {
 			total_size += ret;
 			if (output)
-				print_eu_stall_data(devid, buf, ret);
+				print_eu_stall_data(devid, user_buf, ret);
 			num_samples += ret / query_eu_stall_data->record_size;
 		} else if ((ret < 0) && (errno != EAGAIN)) {
 			if (errno == EINTR)
@@ -598,20 +595,21 @@ enable:
 		}
 	} while (child_is_running);
 
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
 	igt_info("Total size read: %lu\n", total_size);
 	igt_info("Number of samples: %u\n", num_samples);
 	igt_info("Number of drops reported: %u\n", num_drops);
 
 	ret = wait_child(&work_load);
 	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
-	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
+	if (!igt_run_in_simulation())
+		igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
 
-	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
 	if (--iter)
 		goto enable;
 
 	eu_stall_close(stream_fd);
-	free(buf);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
@@ -678,6 +676,8 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 			output = fopen(output_file, "w");
 			igt_require(output);
 		}
+		user_buf = malloc(p_user);
+		igt_assert(user_buf);
 	}
 
 	igt_describe("Verify non-blocking read of EU stall data during a workload run");
@@ -717,6 +717,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		test_invalid_event_report_count(drm_fd);
 
 	igt_fixture {
+		free(user_buf);
 		if (output)
 			fclose(output);
 		drm_close_driver(drm_fd);
-- 
2.48.1

