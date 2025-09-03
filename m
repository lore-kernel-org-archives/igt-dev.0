Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0ECA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 05:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87F10E872;
	Wed,  3 Sep 2025 05:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbjERIjc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E7B10E872
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 05:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756877093; x=1788413093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8F6gnCaFMS8gI9ZajhYU/HY/PtVWLkpC9Lsj0i6QKI8=;
 b=dbjERIjcI8rf9siLyJncSZBySFMotn81UGw9+cdqs+VXaIzIz3CmNmBj
 NZoShCxOi/5t+HhP3CQ+Z1+l4/lax6MQhglYDu9tjprRahDpTwOJTIaNH
 Drfs1rCLAWMnLe2CfvjbkN/fL89Bq+zFt6elB7X19+tPfHD7Ixu20wUIO
 3jfxsEKFs0ULnD2+TYLP+Hdbi2Zv2Ry6COc0SNauS8GaBcSBjaEvPpqI/
 2l3J3DWTbM5c/hK++UeN231XWq81zuxD6nzXy0KzP1izNkFXNe7nkRA/3
 K3VPZfoO2TL1yZ0ziixFgzMNh3SIUnyyV9xalPrRopwzjT+kyqRg/QLkA g==;
X-CSE-ConnectionGUID: nD0ukc21TY27CUSgOFKNcQ==
X-CSE-MsgGUID: Smuvc5J/S6mRHW8Pb2ytQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69881344"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69881344"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 22:24:53 -0700
X-CSE-ConnectionGUID: v903YcFHTHqvJO4f/vOuEQ==
X-CSE-MsgGUID: +tyGUnziTv615efquGID9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="176743692"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 02 Sep 2025 22:24:52 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH v4 i-g-t 4/4] lib/igt_kms: Handle commit failures while
 checking bpc constraints
Date: Wed,  3 Sep 2025 10:37:18 +0530
Message-Id: <20250903050718.1976201-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903050718.1976201-1-chaitanya.kumar.borah@intel.com>
References: <20250903050718.1976201-1-chaitanya.kumar.borah@intel.com>
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

With [1], the kernel may return -EINVAL if the requested bpc exceeds
available bandwidth. Update handling to catch commit failures instead of
exiting, allowing iteration over all modes to find one that supports the
maximum bpc.

[1] https://lore.kernel.org/intel-gfx/20250730055523.2214966-1-chaitanya.kumar.borah@intel.com/

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d240c7ac5..df4a96a17 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6376,7 +6376,9 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		    !igt_check_bigjoiner_support(display))
 			continue;
 
-		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+		if (igt_display_try_commit2(display,
+					    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY))
+			continue;
 
 		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,
 						output->name, bpc))
-- 
2.25.1

