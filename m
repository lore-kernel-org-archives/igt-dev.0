Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1FEC021B6
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C246710EB02;
	Fri, 21 Feb 2025 16:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nd8neetd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CA810EB02
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156773; x=1771692773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJhKUpZqsK/K96lXryp8qwNrGUzrQMCW8qbtPaGmcK8=;
 b=Nd8neetdSCfYWrOvLepAyopX1brk9coEEXRftyYn4hFMRfsz3o75TcuV
 1ngKWPAwjCNYGa9nVPCO5sJWi1gQHuONePWmCGVzw1Iotxrdk3ycOYdqv
 EoOaE85hoEIjs1VtQKYMFhrD7GrtogFyzNH9po9CsqbAEtoZdWIBpza6o
 ttzK0CSZn2H6zbbDHJAE9eG8ZMOK1+ygMfwyQ9+e/y7M87/Z9q/wFUE/P
 lEcLp4BYFlp9Up5cYZAbkVvgt/TIUCS8fG3itqYh1amsAFQsWdBGen7gl
 rGMfrrs/A2VKBOeUuTWAwK2vWt1FSq7pde7X6LWZScgqjyc5Npuel+FAv Q==;
X-CSE-ConnectionGUID: urLWZRkKQhGi/V95Tbsuvw==
X-CSE-MsgGUID: c79XL7CxS7aVtDogZb2m7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186751"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41186751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:53 -0800
X-CSE-ConnectionGUID: fYqHI8IfT8qNpHuAqbe5Vg==
X-CSE-MsgGUID: LcNehzrSQ2mv9KXc8RQnag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120517627"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:52 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 10/11] lib/igt_core: Add igt_dynamic_subtest_name()
Date: Fri, 21 Feb 2025 22:27:48 +0530
Message-Id: <20250221165749.460347-11-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221165749.460347-1-swati2.sharma@intel.com>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_core.c | 11 +++++++++++
 lib/igt_core.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b95db1b25..c6b17fd35 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1588,6 +1588,17 @@ const char *igt_subtest_name(void)
 	return in_subtest;
 }
 
+/**
+ * igt_dynamic_subtest_name:
+ *
+ * Returns: The name of the currently executed dynamic subtest or NULL if called from
+ * outside a dynamic subtest block.
+ */
+const char *igt_dynamic_subtest_name(void)
+{
+	return in_dynamic_subtest;
+}
+
 /**
  * igt_only_list_subtests:
  *
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 0f2af950b..45170e215 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -380,6 +380,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name);
 	__igt_dynamic_f(igt_unique(__tmpchar), f)
 
 const char *igt_subtest_name(void);
+const char *igt_dynamic_subtest_name(void);
 bool igt_only_list_subtests(void);
 
 void __igt_subtest_group_save(int *, int *);
-- 
2.25.1

