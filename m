Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EABEC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971E110EE33;
	Wed, 22 May 2024 10:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZi2l+zE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0C10EE33
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374140; x=1747910140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PDx4LhjsfkcW9YvEho7zu02wrr8F9t7SO6WXVYyJmJI=;
 b=LZi2l+zEwN0x8UhDyAxUO3Ls50WF9TEWuvdurwO0NIerNyIrFJp37z3W
 l46sG+Tf7eMpYs625VMZ2mj/egdRVjQFGZpJMCIRDHBdZmQw24zscT6R8
 4dk4MbWFbGLGWoAF4cf8tcckTe9Ca62Q6LGufUgmpANEpTgQ9XQAofiDN
 gNRbzsa8XUxDN4AKHiFmiMynggbkjjrBCdeeIp7O112rQtYrJlM//yH65
 BlygKcQageKlkgBX9HaGrhDLDxKUKHJ587DyGcL/PbXVwFp/E8plynIJO
 vq/fHcScNFk6ZH1FKQiNqmmfT8u+vZfkm5Ji/Q2HJyrykAEdZlwrP9B95 w==;
X-CSE-ConnectionGUID: Uonto4BqSt6qiORNBxnLFQ==
X-CSE-MsgGUID: zJWznSNxRaGN8/eszk0aCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029223"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029223"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:40 -0700
X-CSE-ConnectionGUID: nQvxx+OaQ6KH15z4GmsQCA==
X-CSE-MsgGUID: 2Qnn5CSTTI+pDaTcesYWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827646"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 03/10] lib: sync i915_pciids.h with kernel commit
 7b43a37348b7
Date: Wed, 22 May 2024 13:35:16 +0300
Message-Id: <819bd797a173eb001ce98deb3d9cd721d60d6eaf.1716373923.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716373923.git.jani.nikula@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize i915_pciids.h with kernel commit:

7b43a37348b7 ("drm/i915/pciids: add INTEL_SNB_IDS()")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 05f466ca8ce2..0d48c493dcce 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -151,6 +151,10 @@
 	INTEL_SNB_M_GT1_IDS(info), \
 	INTEL_SNB_M_GT2_IDS(info)
 
+#define INTEL_SNB_IDS(info) \
+	INTEL_SNB_D_IDS(info), \
+	INTEL_SNB_M_IDS(info)
+
 #define INTEL_IVB_M_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x0156, info) /* GT1 mobile */
 
-- 
2.39.2

