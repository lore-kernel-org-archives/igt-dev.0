Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69871C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2532710E92F;
	Thu,  6 Mar 2025 09:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3bI+92P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B06410E92F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254913; x=1772790913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6g7Q4cQS9gyZLbDTKP0MWDMZ8sXT13C8dstOgUNOk7o=;
 b=h3bI+92P+8Y7mSFUs/uZ6jD/9GPySebypP76ypTnoBXahu/TLFzL0oRh
 AVYrP+qQW5akQm4T2Yy9OYEDgYnllk/RCzeEHdf5ofzMXuH3jh8uZZS7U
 gXcRX1dCi3VSueQ4sQ43PCxdWxQWeOd3MgZdCjVL6QLCsO3Nu7AzzFFFU
 NG3VWuiEKrH/iP5r2zTjqoA/y1pFHvAIc0Ped+bGUnCcHv+MIDeFsbAMH
 Kj6GrtxE4XURixeiI20IqwAj2a3kllsgt0Avy8NkIEQPGgYx45kXH3O7O
 IsQQVxLfhVo9si74xsqS/PW5w41iFgqiMDCev/SheM7CwE3SmhK64qT8h w==;
X-CSE-ConnectionGUID: cFnlB8tORpu7J6yLGDA0XQ==
X-CSE-MsgGUID: ta8g+DgMR3iwTrWDxSlwfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839193"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:13 -0800
X-CSE-ConnectionGUID: oVjKQsuZSFGI3QIyVYWSBQ==
X-CSE-MsgGUID: tXq2tRD9SNCDoTHX1Id4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160915"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:11 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 3/6] tests/intel/xe_fault_injection: Add helper to
 start injecting fault after x iterations
Date: Thu,  6 Mar 2025 15:40:38 +0530
Message-Id: <20250306101041.26827-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
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

As per the current implementation, the fault is injected on the first call
of the error injection function. Introduce an environment variable
IGT_FAULT_INJECT_ITERATION using which, an error can be injected at
specific function call.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 019ddfb7f..1bf8ef1d8 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -42,6 +42,18 @@ struct fault_injection_params {
 	uint32_t space;
 };
 
+/**
+ *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION
+ *  using which an error can be injected at specific function call.
+ */
+static int get_fault_inject_iter(void)
+{
+	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
+
+	/* Return 0 if not exported / -ve value */
+	return env ? (atoi(env) > 0 ? atoi(env) : 0) : 0;
+}
+
 static int fail_function_open(void)
 {
 	int debugfs_fail_function_dir_fd;
-- 
2.35.3

