Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522EF8DFF9
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 18:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89B10EA48;
	Fri, 17 Apr 2026 18:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqdMwe6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AC610EA48
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 18:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776449526; x=1807985526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5OvcawiyA7Xo4VKwQOzxwqzipoH3O2eMpvYhvTnhLfI=;
 b=AqdMwe6FfrQGH/ay+bf/3K+DEC1gdEX6IEyPYn+YSZ+EATFaDocSoKUw
 FGX2LX8zCJ4O33m0AQIzS2Ljbpg9RnEElCuq9Kg1GbexlhJeK0tRvumXN
 M3oIPczai79Zc/ChYbk6kfYWy63cLdhO/tFQ4MITCTV0AddHevs9ctjxz
 Q5KwqUTVUW2i9Qzv7enq4DeewuaqzAAeMhMei47ogabVfn7bkk6At31mT
 QeJrgFF77kgJmfSIWmnCracu/99qPQg/eCAUcu1LtSxitRYo0P/mh5fiQ
 NCGW4KZaaeORX2S7EOSRPbcK/zjfdbPy3S02vtX9UdAlnOg786qu+RWV4 g==;
X-CSE-ConnectionGUID: hugkDf/4QlmLs5fP11KAxg==
X-CSE-MsgGUID: jf1mmGTrTOuFMQRd+iCCPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77480842"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77480842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:12:06 -0700
X-CSE-ConnectionGUID: fmLZ9TeiR625cDJ59w9JGg==
X-CSE-MsgGUID: wtkOxm3NQHKci6EX84xvRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="236070112"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 11:12:05 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_core: Create asserts for pointer
 comparision
Date: Fri, 17 Apr 2026 20:11:56 +0200
Message-ID: <20260417181157.177299-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
References: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
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

Create two macros for pointer comparisions, igt_assert_eq_ptr
and igt_assert_neq_ptr. They will print corresponding pointers
on fail. This will allow us to remove ugly casts, for example

igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);

could be rewritten into

igt_assert_eq_ptr(ptr, MAP_FAILED);

v2: add cast to 'void *' in macro (Zbigniew)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 6845f853c..9fe3997e7 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -723,6 +723,48 @@ void igt_describe_f(const char *fmt, ...);
  */
 #define igt_fail_on_f(expr, f...) igt_assert_f(!(expr), f)
 
+/**
+ * igt_assert_cmpptr:
+ * @n1: first value
+ * @cmp: compare operator
+ * @ncmp: negated version of @cmp
+ * @n2: second value
+ *
+ * Fails (sub-)test if the condition is not met
+ *
+ * Should be used everywhere where a test compares two pointers.
+ *
+ * Like igt_assert(), but displays the pointers being compared on failure instead
+ * of simply printing the stringified expression.
+ */
+#define igt_assert_cmpptr(n1, cmp, ncmp, n2) \
+	do { \
+		void *__n1 = (void *)(n1); \
+		void *__n2 = (void *)(n2); \
+		if (__n1 cmp __n2) ; else \
+		__igt_fail_assert(IGT_LOG_DOMAIN, __FILE__, __LINE__, __func__, \
+				  #n1 " " #cmp " " #n2, \
+				  "error: %p " #ncmp " %p\n", __n1, __n2); \
+	} while (0)
+
+/**
+ * igt_assert_eq_ptr:
+ * @n1: first pointer
+ * @n2: second pointer
+ *
+ * Like igt_assert_eq(), but for pointers.
+ */
+#define igt_assert_eq_ptr(n1, n2) igt_assert_cmpptr(n1, ==, !=, n2)
+
+/**
+ * igt_assert_neq_ptr:
+ * @n1: first pointer
+ * @n2: second pointer
+ *
+ * Like igt_assert_neq(), but for pointers.
+ */
+#define igt_assert_neq_ptr(n1, n2) igt_assert_cmpptr(n1, !=, ==, n2)
+
 /**
  * igt_assert_cmpint:
  * @n1: first value
-- 
2.53.0

