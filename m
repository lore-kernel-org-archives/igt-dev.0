Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECCC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4210E5CD;
	Tue, 20 May 2025 19:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNM1G/uq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CAB10E5CD
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747770803; x=1779306803;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UECNVfI0z14lID3Rqkh479tfv2XVgW6ftuXtJQrYMCQ=;
 b=ZNM1G/uqFe4h71RsTUdVbvWAnujI4bk28pDRD8u2pzfrOAnGQWB9G2lD
 Es723W1xSC3y2wBft8Ycip4ZdMicPTL5SrCPvs6YUrL1NPOjSXNv7Mbc5
 Kw9cZF9Jf1LQc8aYecysO8zk7i3YfktlF6CUcBFajbmemFi4fB/8L75Q6
 xhQ1OOmaWOBmGZH9s3wifAo9RB7YNgdX2mpjmEe/VTDzvCrGv61fzIO7g
 n2XHdLdszuRYfGNA8Ls01ru5zBwRRtUIRt0tkfI5D3jFYLzFfvsdQg1+r
 uBYNRZ0ksMhHib2NBCXTzfv3abf1hCZwnUbp6dPAmsnKoaFw6R43GdArH A==;
X-CSE-ConnectionGUID: MWqz6gwPQOSq81MeZHlPtw==
X-CSE-MsgGUID: vJUOvGgORZKAL0eva7nYvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60379833"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60379833"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:53:22 -0700
X-CSE-ConnectionGUID: CZXQAw5aSdi7aoeoLmzXCQ==
X-CSE-MsgGUID: hpRNkraUTrCbG8/SgD53vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139836102"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:53:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH] tests/intel/xe_oa: Ignore other errors when looking for
 buffer overflow
Date: Tue, 20 May 2025 12:52:50 -0700
Message-ID: <20250520195249.326080-2-umesh.nerlige.ramappa@intel.com>
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

Occassionally other error bits will result in EIO and prematurely end
the buffer-fill test. For this test, ignore other errors.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4565
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 73841a359daf..2022c5cb3955 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2520,7 +2520,6 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 	char *buf = malloc(1024);
 	bool overflow_seen;
 	u32 oa_status;
-	int len;
 
 	igt_debug("oa_period %s\n", pretty_print_oa_period(oa_period));
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
@@ -2535,16 +2534,22 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 
 	errno = 0;
 	/* Read 0 bytes repeatedly until you see an EIO */
-	while ((len = read(stream_fd, buf, 0)) == -1 && (errno == EINTR || errno == ENOSPC)) {
+	while (-1 == read(stream_fd, buf, 0)) {
+		if (errno == EIO) {
+			oa_status = get_stream_status(stream_fd);
+			overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
+			if (overflow_seen)
+				break;
+		}
 		usleep(100);
 	}
-	igt_assert_eq(len, -1);
-	igt_assert_eq(errno, EIO);
+	igt_assert(overflow_seen);
 
-	/* Ensure buffer overflowed */
+	/* Make sure the buffer overflow is cleared */
+	read(stream_fd, buf, 0);
 	oa_status = get_stream_status(stream_fd);
 	overflow_seen = oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW;
-	igt_assert(overflow_seen);
+	igt_assert_eq(overflow_seen, 0);
 
 	__perf_close(stream_fd);
 }
-- 
2.43.0

