Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5DBC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC3310E3B9;
	Mon, 19 May 2025 15:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQyk72DE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BBF10E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667544; x=1779203544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCtZvQAv2uMtkjARD2U6nFwLmPac17dYnQZojBjeyQk=;
 b=MQyk72DE/uzbwDGW05RQUc+wg+oIZ05REbv+uPPXnGO8BDeAdpEH/p4y
 iLAHXWjj1yLHUPh7f/o8yt1hPckNvaBQa9O+cibH1MXWoKEPUobDnGcSl
 Rm9ezjviINJBDorGT3wPm20B0jr4TYVdicVuKetalHSw6+A4cjyXuPa/v
 gz5ul7oV0qH65dTMAi9MIjbVFGDaJZrj16rReMxie4hW6INeEX03Tefko
 2jwprv4scxCcSkgbJFI0kdv3Z5YVnHVbPrulZGJigIZbHs9Go7mfgi9ej
 UdYwNQS6Rtek5CJ1pTgf4g/u6MAqLNd2wO3lupcUYAnL6a8loo3xBuAEm A==;
X-CSE-ConnectionGUID: Qxn1K8JzQnGAP5Ao3bdYpg==
X-CSE-MsgGUID: 9rU0dFl+Shi2s5EiFEuGsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710573"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710573"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:24 -0700
X-CSE-ConnectionGUID: IG3hVyKFTHOJce0lBldswQ==
X-CSE-MsgGUID: z81KrnU8SL2cWlIPPDzhKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139288004"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:21 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v9 10/14] lib/igt_core: Conditionally define __noreturn
 for non-Android platforms
Date: Mon, 19 May 2025 15:11:31 +0000
Message-ID: <20250519151135.43874-11-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
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

Ensure __noreturn is defined only if it is not already defined,
addressing compatibility with Android where __noreturn is predefined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 45170e215..2db579423 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -86,7 +86,9 @@
 #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
 #endif
 
+#ifndef __noreturn
 #define __noreturn __attribute__((noreturn))
+#endif
 #define __maybe_unused __attribute__((unused))
 
 extern const char* __igt_test_description __attribute__((weak));
-- 
2.49.0

