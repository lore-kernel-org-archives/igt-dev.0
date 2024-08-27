Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27981C54731
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40BB10E24A;
	Tue, 27 Aug 2024 05:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqsa5I0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82A910E235
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737921; x=1756273921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDPJhmQzIqC6GQ7uuqiq6vAP73WjTrDmXMRyu6Zpxaw=;
 b=aqsa5I0sSyPbAW5nU0ZYx/kDMPRpigIwD6FjeLJh1e/qs/T3G6ruPnt9
 5XoEGWMrg6M1f8tPEPZNUJBVY1dZk72RCDlIZxNUVNAjyfFRFslbAXIvl
 Mj2LNb42MsG6cT3j2nCn8y/vAAsrZGtO2JHsHOeLjjTNLQreMXQJswvXO
 wznoYPCsHMxDBqX91n+WP/sXccaOpCfW9wJjCCG26gDYS+viMeKXyW2RJ
 y/8yzC3FhHGurdvzaSbphy8zNvUHVzih7YsckYNtecEsKbDVYy2cboEW6
 /Ag+3iMAk78IHhI95rADfJgZIWoS7CEaEZNbv1L10ndOk/uKmouyt/Sny g==;
X-CSE-ConnectionGUID: +5VLZdPTTyODlo+RzA1JgQ==
X-CSE-MsgGUID: +dLOI1UeQGqJ6qKgInrEOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355591"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
X-CSE-ConnectionGUID: Qkzm61XFQ0KSOhCnxmuHJQ==
X-CSE-MsgGUID: SJMbaWNvQWCfiGrfszXolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800389"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 03/10] lib/igt_core: Add igt_assert_lt_double()
Date: Mon, 26 Aug 2024 22:51:22 -0700
Message-ID: <20240827055129.1671873-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827055129.1671873-1-lucas.demarchi@intel.com>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
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

Like the for other types. Avoid the lte variant as it's not good
practice to compare a double for equality.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 06c5314bf..84925767c 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -998,6 +998,18 @@ void igt_describe_f(const char *fmt, ...);
  */
 #define igt_assert_lt_s64(n1, n2) igt_assert_cmps64(n1, <, >=, n2)
 
+/**
+ * igt_assert_lt_double:
+ * @n1: first double
+ * @n2: second double
+ *
+ * Fails (sub-)test if the second double is smaller than or equal to the first.
+ *
+ * Like igt_assert(), but displays the values being compared on failure instead
+ * of simply printing the stringified expression.
+ */
+#define igt_assert_lt_double(n1, n2) igt_assert_cmpdouble(n1, <, >=, n2)
+
 /**
  * igt_assert_fd:
  * @fd: file descriptor
-- 
2.43.0

