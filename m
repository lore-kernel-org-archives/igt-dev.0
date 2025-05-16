Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD4AC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 18:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57A010EB67;
	Fri, 16 May 2025 18:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvlRwVBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD210EB6D
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747420074; x=1778956074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCtZvQAv2uMtkjARD2U6nFwLmPac17dYnQZojBjeyQk=;
 b=PvlRwVBXC4pDPlY4yYLQhI8lXK3zuSSCFOVwpVHM75O1U3EyldgNgOAu
 VWP+bjB/L3z/2zs1NLIIiLvsUuQ88lyKW+5BdJVq/vZBklKxl3AVmfnol
 AZjjGv/YfLd4QA3YKk1EGpRU57DDkFQ/1y3cXQpmnJufiobEk7FDfuKfM
 3NQzzD/RifUO39/DoEMqKwx0WnRJXDVcYJm0iig8s5Qo7pbmpL3sOnMFV
 vHA53dOlaFK0VGlFppk14ej2TlARC/E0hS8q+C/7HRqF1s4j+z9d0rGzL
 8oddNkkvHJ9C+tTE06iBjXtpQG4WmZiyjZtq+V+Nh+K9hXDHDSiS0/V+e A==;
X-CSE-ConnectionGUID: yhCOIt7WT/iVRN1cqLaQng==
X-CSE-MsgGUID: M0WdMp11SS2u4pBg0SqhNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60059911"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60059911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:27:54 -0700
X-CSE-ConnectionGUID: c8dzBNpKSH+GOjX7Ju1dmQ==
X-CSE-MsgGUID: Q4rX9sNZRKem2kghiOY6Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143736973"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa004.jf.intel.com with ESMTP; 16 May 2025 11:27:52 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com, adrinael@adrinael.net,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v8 10/14] lib/igt_core: Conditionally define __noreturn
 for non-Android platforms
Date: Fri, 16 May 2025 18:27:00 +0000
Message-ID: <20250516182704.97912-11-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
References: <20250516182704.97912-1-jeevaka.badrappan@intel.com>
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

