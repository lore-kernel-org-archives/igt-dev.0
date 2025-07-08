Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B9CC83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 15:17:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C52C10E688;
	Tue,  8 Jul 2025 15:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4pF7NbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B8F10E688
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751987824; x=1783523824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3nos51pYw8kuFG9B/7AZ6esajBXPT8plqwNvMwKamsc=;
 b=F4pF7NbZRbasgp80bk+s/NMrSfH3NpI/sGpXOiFihTT5uG7yGkEJAlwJ
 aaYfxIkFSRY+Tx1Lx3oAhkxwYsSy0Wp2X91D1W3HV7S8fD5Hk0iBJ+Dog
 Y5cwW5I8cvSqlYh+qbQIuMe40fCyH5ocdaMHeGqANhSW0WDbbOcN4s+dE
 YDJLV3440TyfVY8HN1sOvi8DX1Rnfteujb+k4jmQ8QPeZI8ZIH36wGY1c
 SH2p9NQA6nYMbmu6iQp4LKk+18wDBIjbC/ymGAbXX+B6PDuUbMKR42HpB
 UboUn1MGyKS+UL4LbRaS3lVAMQLi5OZ4ZUlPMlg60OX1fjwkxMu3STu7T g==;
X-CSE-ConnectionGUID: /T0eWQL6Sfm4cwV1vCoj6A==
X-CSE-MsgGUID: KYiWA5v2SxOYmKvUAU3/kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53346915"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53346915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:17:04 -0700
X-CSE-ConnectionGUID: 1JZHUt4ZSN2U9AwyqPG+2w==
X-CSE-MsgGUID: qkbYARVzRhe+aRg2aXMLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="156008682"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 08:17:04 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Look at errno only when system calls
 fail
Date: Tue,  8 Jul 2025 08:16:59 -0700
Message-ID: <20250708151659.3556357-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

errno is set only when system calls fail, so it is incorrect to look at
errno when system calls succeed.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5339
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index cb59918ef9..724fea73f0 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1431,7 +1431,7 @@ read_2_oa_reports(int format_id,
 
 		while ((ret = read(stream_fd, buf + len, buf_size)) < 0 && errno == EINTR)
 			;
-		if (errno == EIO) {
+		if (ret < 0 && errno == EIO) {
 			oa_status = get_stream_status(stream_fd);
 			continue;
 		}
@@ -1869,7 +1869,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 
 			while ((ret = read(stream_fd, buf, buf_size)) < 0 && errno == EINTR)
 				;
-			if (errno == EIO) {
+			if (ret < 0 && errno == EIO) {
 				oa_status = get_stream_status(stream_fd);
 				continue;
 			}
@@ -2532,7 +2532,6 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
-	errno = 0;
 	/* Read 0 bytes repeatedly until you see an EIO */
 	while (-1 == read(stream_fd, buf, 0)) {
 		if (errno == EIO) {
@@ -2607,7 +2606,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 	       ((len = read(stream_fd, &buf[total_len], buf_size - total_len)) > 0 ||
 		(len == -1 && (errno == EINTR || errno == EIO)))) {
 		/* Assert only for default OA buffer size */
-		if (errno == EIO && !oa_buffer_size) {
+		if (len < 0 && errno == EIO && !oa_buffer_size) {
 			oa_status = get_stream_status(stream_fd);
 			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
 		}
-- 
2.48.1

