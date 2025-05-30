Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AA8C3ABB2
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866C710E21B;
	Fri, 30 May 2025 06:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsS4S3cL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFBC10E21B
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587295; x=1780123295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nAcoMzd5mDpbKWHVwkRq3Et1K6XKjr1elbK9Tgg1uKE=;
 b=lsS4S3cLmpdjVwcqk83S4yepLEVhK/rWRYHA2vf5U5xc7UI2triD5YC6
 NeoypSCwbZqESc25TqGfz5Cc5InnENw9DfOR/Ps7NTmsRlZKeH67ed3v4
 U7uUJw/L2g1BIhLhukcYMDiEZFkTAAm9NGf3zToFTw3QA1EKWKHRi/qmV
 jIR12Upfi3qzvKUY/LM4r+1HMCoK3ktGmNxokoIt9h0TH5iCr0TBXh++x
 m7BEGhMp4PzKmsH4hhHaJYkpCsQ2T3nCDm628VJrEr3UoRtKjgdjg6d3J
 gtdltfh7ouZvPQ4RONlv99auxmKmMgWKSdGfc/3vwdmj6n/SDKx1YJ+my g==;
X-CSE-ConnectionGUID: Frwzc5CTQpuZUP6useuO8w==
X-CSE-MsgGUID: Zs+kdtTLTzWJt52zx3jJ6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="73205003"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="73205003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:35 -0700
X-CSE-ConnectionGUID: 5AbrfFJNQFy3nUH5KmV2Sw==
X-CSE-MsgGUID: nPExSETARUWGWxJtO+m2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143755817"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:34 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 07/11] tests/xe_copy_basic: add testcase with large
 buffer size
Date: Fri, 30 May 2025 08:40:46 +0200
Message-ID: <20250530064050.1560398-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index d55991c4f8..ca971f3570 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -45,6 +45,7 @@ struct rect {
  * @0x3fff: 0x3fff
  * @0xfd: 0xfd
  * @0xfffe: 0xfffe
+ * @0x8fffe: 0x8fffe
  */
 static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
@@ -96,6 +97,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
  * @0x3fff: 0x3fff
  * @0xfd: 0xfd
  * @0xfffe: 0xfffe
+ * @0x8fffe: 0x8fffe
  */
 static void
 mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
@@ -168,7 +170,8 @@ igt_main
 	struct rect linear[] = { { 0, 0xfd, 1 },
 				 { 0, 0x369, 1 },
 				 { 0, 0x3fff, 1 },
-				 { 0, 0xfffe, 1 } };
+				 { 0, 0xfffe, 1 },
+				 { 0, 0x8fffe, 1 } };
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-- 
2.43.0

