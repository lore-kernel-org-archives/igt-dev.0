Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71267C369A2
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 23:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3E610E2A1;
	Wed,  9 Apr 2025 23:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FWvwjxOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2CB10E2A1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744241696; x=1775777696;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DzBgjCE4FYU5fDAgT7oA1WtwEad++0J34sQDJxIM3io=;
 b=FWvwjxOa0JfP0Vt338dNZo3HeNSnUNUlfd4GTr+hz/BeN3zDjV475tvP
 fMCH/CC5w6+bv7EHwKHvVFDGLXcwtD/PIpfzBCX5hIXMFTVZGRlr6cbCS
 qgVo8jxc2BL4XiNlxPttgsFul31HCkBjQmhBESuEyqBd0TbEwvDPLrF2L
 QzqYTnNWloPw4seRu+T52hE7jJ6Vyz+LFLfqtCKLAZG2igYOGTyQ1RXdm
 lGVPbTW87gGuwqMkYxYPn8vpTNzFgz2HqX8gJA3RMogvRJpdfPDKIwfRF
 1prl77bD0ZdVNiflYJNkw4vjiL/iSmdiqT6FjwRgfoi8kK8m3LBrdoFJp A==;
X-CSE-ConnectionGUID: 866IRUzMSgiPux592Alsfw==
X-CSE-MsgGUID: nsCCCbXaQieJFtk18cPKgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44880526"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="44880526"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 16:34:52 -0700
X-CSE-ConnectionGUID: kgzYDD87R1qwgeDEnZTIeQ==
X-CSE-MsgGUID: krH49A8HTVK/DiPNUeH9LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="128585028"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.215])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 16:34:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Get stream status on read error
Date: Wed,  9 Apr 2025 16:34:41 -0700
Message-ID: <20250409233441.143402-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Whenever read fails, get stream status so we know the state of OA status
bits.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 67acc74b3279..f3521c3d602e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2294,6 +2294,7 @@ static void test_polling_small_buf(void)
 	errno = 0;
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
+	get_stream_status(stream_fd);
 	igt_assert_eq(errno, ENOSPC);
 
 	/* Poll with 0 timeout and expect POLLIN flag to be set */
@@ -2568,6 +2569,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 	errno = 0;
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
+	get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
@@ -2584,6 +2586,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 	/* Ensure num_reports can be read */
 	while ((ret = read(stream_fd, buf, sizeof(buf))) < 0 && errno == EINTR)
 		;
+	get_stream_status(stream_fd);
 	igt_assert_eq(ret, sizeof(buf));
 
 	__perf_close(stream_fd);
@@ -2727,6 +2730,7 @@ test_non_sampling_read_error(void)
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
+	get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	__perf_close(stream_fd);
@@ -2768,6 +2772,7 @@ test_disabled_read_error(void)
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
+	get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	__perf_close(stream_fd);
@@ -2786,6 +2791,7 @@ test_disabled_read_error(void)
 
 	ret = read(stream_fd, buf, sizeof(buf));
 	igt_assert_eq(ret, -1);
+	get_stream_status(stream_fd);
 	igt_assert_eq(errno, EINVAL);
 
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
-- 
2.43.0

