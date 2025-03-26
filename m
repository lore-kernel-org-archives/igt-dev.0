Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438CFC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 22:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E707010E73C;
	Wed, 26 Mar 2025 22:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPKLUGt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E113810E73C
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 22:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743027453; x=1774563453;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tYRMoQ8IqBK94oRhzIL4NpHKUqz+1SGG30PtP9eNFOE=;
 b=HPKLUGt0RHx1n6QethCvOKgcRhz6jvbPef3LwLNvmV1MgejZFsrOuCcp
 AYugXgFXN4pY69VBfcNCSyQFuSIiaz/1wquEP2W7+ei8aRhTr+ElN1gAi
 iTC7zoUlL1luC2SM5/hagE/o1q1i183gbVYuQ4QSP0K4H2l6eU2Y8W2a4
 DnUfQdO1vkgUoyfBogWys3Mac9MSI3kfyZGULrkv+7z1GhegvHMji3PS5
 TfN/6bXF49Nmm4sPyDtrDI86Nfky48WObop0/ih+QbCAiVNDaqNND1DKq
 +Xfx0SC1GOLDcoCCuWH1meXArGkjLBRO1iWY6DmrggBxLiJ13AayUzrT7 w==;
X-CSE-ConnectionGUID: /g963AHVTkWW1KauPiTyqQ==
X-CSE-MsgGUID: /Ttrfv/dS4O6jWCSbXvcUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44442366"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44442366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:17:32 -0700
X-CSE-ConnectionGUID: xM+e5NXGRJCPsvmJAJJVQg==
X-CSE-MsgGUID: 8zQfl/58TU+zu1zZwbO1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="124870507"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.215])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:17:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_oa: Print oa_status value in the helper
Date: Wed, 26 Mar 2025 15:17:29 -0700
Message-ID: <20250326221729.884253-1-umesh.nerlige.ramappa@intel.com>
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

OA status value is useful when any bits are set. Print the value in the
helper, so that each call to fetch the oa_status does not need to print
the debug message explicitly.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index caf713c2a6df..0e9fa966464a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -383,6 +383,9 @@ static u32 get_stream_status(int fd)
 
 	do_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_STATUS, &status);
 
+	if (status.oa_status)
+		igt_debug("oa status %llx\n", status.oa_status);
+
 	return status.oa_status;
 }
 
@@ -1337,7 +1340,6 @@ read_2_oa_reports(int format_id,
 			;
 		if (errno == EIO) {
 			oa_status = get_stream_status(stream_fd);
-			igt_debug("oa_status %#x\n", oa_status);
 			continue;
 		}
 
@@ -1773,7 +1775,6 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 				;
 			if (errno == EIO) {
 				oa_status = get_stream_status(stream_fd);
-				igt_debug("oa_status %#x\n", oa_status);
 				continue;
 			}
 
@@ -2505,7 +2506,6 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		(len == -1 && (errno == EINTR || errno == EIO)))) {
 		if (errno == EIO) {
 			oa_status = get_stream_status(stream_fd);
-			igt_debug("oa_status %#x\n", oa_status);
 			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
 		}
 		if (len > 0)
-- 
2.43.0

