Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA934C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D4110E7B9;
	Fri, 23 May 2025 08:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gG0MvhAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767610E7B9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 08:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747987321; x=1779523321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=va9MN9rYT/VoVyYmd+L6URtF9eoALpGvCR9gddr1hwk=;
 b=gG0MvhApQY10QVG0BJDrGFWinQz4o8W61j5UkUE+Kq7nlx0JxE1O5ZTC
 H2YlQCmYalHl2P0DKkZJf0DTWa32nNPbKER0E1XxYzRlOF1UnKPzPfL0R
 a2z4M73fkpen6IVGNrKE9ScyeBaLE+RlHGv8ZG5ozulUntonyPbT9mQJv
 SkbGSPbwNtR+lnY7kr9Pw+YjZLAMaqSCR/VAJHShvsqbNxUBNZ8WR5B18
 J4v8KKYc8+XY9aHah0Nf712XsBvztQ5a+jhh0Y3WmZ+MDZNjMDOKOCNWr
 u+gTSCBYljfTD8VGQ5EOrqphycebARqy29JCdFEpDBnZ1idocAD+0Htpt Q==;
X-CSE-ConnectionGUID: 9v+a/gyYTYiPastiS2qKBw==
X-CSE-MsgGUID: si3jpzSsQXSNkpnkhspWsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50091252"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50091252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:02:01 -0700
X-CSE-ConnectionGUID: ojjfZDY7T8W1r+BY1dcv7w==
X-CSE-MsgGUID: nuP3vrvXSWO1Z1yvnxjC5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="146270055"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:01:59 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 07/11] tests/xe_copy_basic: add testcase with large
 buffer size
Date: Fri, 23 May 2025 10:01:22 +0200
Message-ID: <20250523080126.75295-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
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
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_copy_basic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 569f250cc4..bed3e39426 100644
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
 				 { 0, 0x369, 1 },
 				 { 0, 0x3fff, 1 },
-				 { 0, 0xfffe, 1 } };
+				 { 0, 0xfffe, 1 },
+				 { 0, 0x8fffe, 1 } };
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-- 
2.43.0

