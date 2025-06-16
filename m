Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777A6C7115D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 23:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEA710E465;
	Mon, 16 Jun 2025 23:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0MX1yKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D5110E470
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 23:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750118237; x=1781654237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oR2kvqB73FWRRlBiKjlca3YBdauseABDYgQ/Mo6QHtM=;
 b=L0MX1yKuCiGD/aOsIn/EhRzn949vG3e4e9k3bLTm5EnnxasWSF+STC8q
 b5iLGHr5T7qzaw1QqztBqEuiRK730zd8Q7UY7L4R8RszFchdMQHUMy22Z
 9skCeljs245Ag4yBoNiW61tlysw2ufxXf6oVKyIghV8ax84Fo3AU3WOac
 5BYsLY2izgec+IU7XUM/mNGHjre+rzAinFEecglCjmuN9Tgnr1kVA/XM3
 zHBA1IOPyQoBbl1R1SZ6fHs2GYC9FikIoS4CQm+BITa0fNi/zyvI38fqF
 /h9MO91uABLbGEqAJVyX6jj/hYfQYRgtt30JsZasHvK2g5TUpE5x+z9Ji Q==;
X-CSE-ConnectionGUID: H+S3F1t7TCOmfPyjfcarfw==
X-CSE-MsgGUID: 9w4rCP/RRn28wYfRYcd5/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69719233"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69719233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 16:57:14 -0700
X-CSE-ConnectionGUID: t7oAWqJBTsiV4NE2ifJTiw==
X-CSE-MsgGUID: mjsdNVIXTJCZzHgds9PRSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148502633"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 16:57:13 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel/xe_eu_stall: Do not check for
 presence of data on simulation
Date: Mon, 16 Jun 2025 16:57:08 -0700
Message-ID: <770e4e799caad3d3ea1b2c00ea19f4fc04d88ba1.1750117903.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <3cb3df73daf1b29c309f9fe4331af27b49e0d9c2.1750117903.git.harish.chegondi@intel.com>
References: <3cb3df73daf1b29c309f9fe4331af27b49e0d9c2.1750117903.git.harish.chegondi@intel.com>
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

v2: 1. Move disable IOCTL call to before the assert.
    2. Allocate and free the user buffer in the main routine to prevent
       any memory leak due to an assert.
    3. Rebase.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 16428af9b..36a4471e5 100644
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
@@ -497,7 +498,6 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 	struct sigaction sa = { 0 };
 	int ret, flags;
 	uint64_t total_size;
-	uint8_t *buf;
 
 	uint64_t properties[] = {
 		DRM_XE_EU_STALL_PROP_GT_ID, p_gt_id,
@@ -524,9 +524,6 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 	else
 		igt_info("Workload: GPGPU fill\n");
 
-	buf = malloc(p_user);
-	igt_assert(buf);
-
 	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
@@ -583,11 +580,11 @@ enable:
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
@@ -602,20 +599,21 @@ enable:
 		}
 	} while (child_is_running);
 
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
 	igt_info("Total size read: %" PRIu64 "\n", total_size);
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
@@ -682,6 +680,8 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 			output = fopen(output_file, "w");
 			igt_require(output);
 		}
+		user_buf = malloc(p_user);
+		igt_assert(user_buf);
 	}
 
 	igt_describe("Verify non-blocking read of EU stall data during a workload run");
@@ -721,6 +721,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		test_invalid_event_report_count(drm_fd);
 
 	igt_fixture {
+		free(user_buf);
 		if (output)
 			fclose(output);
 		drm_close_driver(drm_fd);
-- 
2.48.1

