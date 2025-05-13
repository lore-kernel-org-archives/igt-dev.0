Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C23EC3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DC010E5E7;
	Tue, 13 May 2025 18:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5HWkCd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E42B10E5E7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162741; x=1778698741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6R0mhmPwvFpABMKZ63TJuA6G/LswT/AiOlpLuf46T+w=;
 b=h5HWkCd8TTxJ+d9Dcnph+NxqE5OtuDQIxLGxoRiU/OY6YGnCK0/YAbxZ
 O+cBHa7cVgvUGYpOw8AvLqiDns/u7FWC7hbiw/gOO04e/pOS+W8pang12
 Jc1fml1ZELobdwu14Pq8lRJSISgpo05dsMt1SxU329x0C1+zmU98tGNtO
 POBxdcBSv8S6sHcuu8un0ZUFK6biJ96xjJwNyIy35j2L6mrXCQdVjzj/w
 lYgQmPbMj/fEWheA4xV9mrgiNwHOypVDsm/3XegQwAJM4L1Yl/ZippxP5
 m1QIHlJHP/BIGjnyYcsoUVUiScPPlAA3bW6nZX9jl2IOSC2F3u/lOUDWq g==;
X-CSE-ConnectionGUID: kDVxM+i6RF6Bl/MKpMjZkA==
X-CSE-MsgGUID: sBbndegBQQyL3R5QVgPYlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60428174"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="60428174"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:59:01 -0700
X-CSE-ConnectionGUID: mpq6RGU7S8a7+fy4l3V5vw==
X-CSE-MsgGUID: o0rDCKFTQgenElp0u/pDkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137841007"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:59:00 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 11/15] tests/xe_copy_basic: add testcase with large
 buffer size
Date: Tue, 13 May 2025 20:58:06 +0200
Message-ID: <20250513185811.897232-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Maximum possible size for mem-copy/byte is 256KiB. Verify intel_blt
is able to emit multiple mem-copy commands to copy buffer which
is larger than 256KiB.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_copy_basic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 7bec248b06..28c1878be9 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -46,6 +46,7 @@ struct rect {
  * @0x3fff: 0x3fff
  * @0xfd: 0xfd
  * @0xfffe: 0xfffe
+ * @0x8fffe: 0x8fffe
  */
 static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
@@ -99,6 +100,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
  * @0x3fff: 0x3fff
  * @0xfd: 0xfd
  * @0xfffe: 0xfffe
+ * @0x8fffe: 0x8fffe
  */
 static void
 mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
@@ -172,7 +174,8 @@ igt_main
 	struct rect linear[] = { { 0, 0xfd, 1 },
 				 { 0, 0x369, 0x1 },
 				 { 0, 0x3fff, 1 },
-				 { 0, 0xfffe, 1 } };
+				 { 0, 0xfffe, 1 },
+				 { 0, 0x8fffe, 1 } };
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-- 
2.43.0

