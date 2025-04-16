Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4130C369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 23:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7523A10EA05;
	Wed, 16 Apr 2025 23:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3rxGCYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6326410E9E3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744845129; x=1776381129;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uS72TaOEf06/LCGiMSYHfSnlAV0WeiSYKkHoq//nRAI=;
 b=H3rxGCYXXqga52VRWOarBV8PCxQctZhEmvdej7pxuUUX3m8a0pLW62lp
 cw0Vte5P0M2ntXr0Bro9ykDDZhP3i2Kgm2GKGc0hJ62SQ8NuWdl22tTDy
 TACW4jG9XgQPK09kARbIr12CciRpuKMUnZNYTwij+pUTGnThj0KF6cFzi
 BuNl4ol+brKgVkp/WV8WzAz1KigD+9/Nlhcg5UnS0wQVjmvihzH8NiI0i
 5bzbVL+s/gwc2DAQS319eUf5/ipSNXpO9Zt+vz5roJs3lRh3k8yh1jI1S
 EKWsx0b4hVBja0AVrYEExuKvjskkIV9nmgFtYFn6GBQAmO2wueaSLFxNO g==;
X-CSE-ConnectionGUID: vfIiZzFjTRKDVKNfTRmL2w==
X-CSE-MsgGUID: Jj2o+GNES+6gS5fQvoa77A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50224840"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="50224840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 16:12:07 -0700
X-CSE-ConnectionGUID: nIHF/uKMTYK0Myo2hRHizA==
X-CSE-MsgGUID: bT1bFG/kQK+ehGuz9IuxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="130576965"
Received: from dut4086lnl.fm.intel.com (HELO DUT4086LNL..) ([10.105.10.52])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 16:12:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Call get_stream_status only on EIO
Date: Wed, 16 Apr 2025 16:12:02 -0700
Message-ID: <20250416231203.13916-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.45.2
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

Turns out that get_stream_status resets errno and anything that checks
errno afterwards fails. This resulted in a bunch of test failures. Fix
it by calling get_stream_status only if errno is EIO and also save and
restore errno within get_stream_status.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4804
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1fc8bfaafee2..360dd8ba00d9 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -380,9 +380,11 @@ static void set_fd_flags(int fd, int flags)
 static u32 get_stream_status(int fd)
 {
 	struct drm_xe_oa_stream_status status;
+	int _e = errno;
 
 	do_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_STATUS, &status);
 	igt_debug("oa status %llx\n", status.oa_status);
+	errno = _e; 
 
 	return status.oa_status;
 }
@@ -2294,7 +2296,8 @@ static void test_polling_small_buf(void)
 	errno = 0;
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
+	if (errno == EIO)
+		get_stream_status(stream_fd);
 	igt_assert_eq(errno, ENOSPC);
 
 	/* Poll with 0 timeout and expect POLLIN flag to be set */
@@ -2569,7 +2572,8 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 	errno = 0;
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
+	if (errno == EIO)
+		get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
@@ -2586,7 +2590,8 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 	/* Ensure num_reports can be read */
 	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
 		;
-	get_stream_status(stream_fd);
+	if (errno == EIO)
+		get_stream_status(stream_fd);
 	igt_assert_eq(ret, sizeof(buf));
 
 	__perf_close(stream_fd);
@@ -2730,7 +2735,8 @@ test_non_sampling_read_error(void)
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
+	if (errno == EIO)
+		get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	__perf_close(stream_fd);
@@ -2772,7 +2778,8 @@ test_disabled_read_error(void)
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
+	if (errno == EIO)
+		get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	__perf_close(stream_fd);
@@ -2791,7 +2798,8 @@ test_disabled_read_error(void)
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
-	get_stream_status(stream_fd);
+	if (errno == EIO)
+		get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-- 
2.45.2

