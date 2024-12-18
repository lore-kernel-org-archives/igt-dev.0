Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F63AE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 12:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADCE10EB8A;
	Wed, 18 Dec 2024 12:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zb+v+2or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6E010EB8A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734523296; x=1766059296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PzUgZQ4dBCdUxd8MoE7aEPseC1RBKcNdaYXPZAFFavI=;
 b=Zb+v+2org9zKC5qpDOdjj6mni66f37jZ5s/9Ni1JSj9tpwvRjxcmOU2g
 zIdq+f8JW+knDkVV094couDjDiOTcoz33lIB8Zng1SkmlH4QHhoP/HY9O
 OoaJADTruxPmAot/jWLfqQd9XEFLWSGR7+JjOgydWNZlQEsMe6qdLtrCx
 jg9/047OW6cYJq2u5B8bca/Mw0ffoHXNh47znVhuXAel+f/IrshQnOyPw
 6EtJJ//M14EnZTQov9nHRK4MMoEo2jLtPxcZ3O8jYHrv8v2LHyOJ30p5r
 5yvxAPjNT3qpF94d0lbEIVaNmaj/oY6bf2A/mTQWUBxfm9LyMcI/HC55O w==;
X-CSE-ConnectionGUID: H/NQWU+kRmuajUeTEgGLAg==
X-CSE-MsgGUID: 2WDFBAdKTIWDNnszG8040Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35143195"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35143195"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:36 -0800
X-CSE-ConnectionGUID: 48T+Wl02SMqIun5w/qTFiw==
X-CSE-MsgGUID: OVdhpHinR6+6xuJtPN9cww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98076286"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:32 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 4/5] lib/igt_sriov_device: Add helper functions for VF
 range validation
Date: Wed, 18 Dec 2024 13:00:55 +0100
Message-Id: <20241218120056.779962-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
References: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
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

Add __is_valid_range() to check if a VF range is valid. Introduce
igt_sriov_random_vf_in_range() to get a random VF number within a
specified range. Update for_random_sriov_vf to use the new helper
functions for better range handling.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.h | 82 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 75 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index 4b63ceb22..de25a7d98 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -34,6 +34,45 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 
+/**
+ * __is_valid_range - Helper to check VF range is valid
+ * @start_vf: Starting VF number
+ * @end_vf: Ending VF number
+ * @total_vfs: Total number of VFs
+ *
+ * Return: true if the range is valid, false otherwise.
+ */
+static inline bool __is_valid_range(unsigned int start_vf, unsigned int end_vf,
+				    unsigned int total_vfs)
+{
+	return !igt_warn_on_f(start_vf > end_vf || end_vf > total_vfs || start_vf == 0,
+			      "start_vf=%u, end_vf=%u, total_vfs=%u\n",
+			      start_vf, end_vf, total_vfs);
+}
+
+/**
+ * igt_sriov_random_vf_in_range - Get a random VF number within a specified range
+ * @pf_fd: PF device file descriptor
+ * @start: Starting VF number in the range
+ * @end: Ending VF number in the range
+ *
+ * Returns a random VF number within the specified range [start, end].
+ * If the range is invalid (start > end, end > total VFs,
+ * or start == 0), the function returns 0.
+ *
+ * Return: A random VF number within the range, or 0 if the range is invalid.
+ */
+static inline unsigned int
+igt_sriov_random_vf_in_range(int pf_fd, unsigned int start, unsigned int end)
+{
+	unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+
+	if (!__is_valid_range(start, end, total_vfs))
+		return 0;
+
+	return start + random() % (end - start + 1);
+}
+
 /**
  * for_each_sriov_vf - Helper for running code on each VF
  * @__pf_fd: PF device file descriptor
@@ -48,17 +87,46 @@ bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 #define for_each_sriov_num_vfs for_each_sriov_vf
 
 /**
- * for_random_sriov_vf - Helper for running code on random VF
+ * for_random_sriov_vf_in_range - Iterate over a random VF in a specified range
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number in the range
+ * @__end: Ending VF number in the range
+ * @__vf_num: Variable to store the random VF number
+ *
+ * Iterates over a random VF number within the specified range [__start, __end].
+ * The loop runs only if the range is valid and a random
+ * VF number is successfully selected.
+ */
+#define for_random_sriov_vf_in_range(__pf_fd, __start, __end, __vf_num) \
+	for (unsigned int __vf_num = igt_sriov_random_vf_in_range(__pf_fd, __start, __end); \
+	     __vf_num != 0; __vf_num = 0)
+
+/**
+ * for_random_sriov_vf_starting_from - Iterate over a random VF starting from a specified VF
+ * @__pf_fd: PF device file descriptor
+ * @__start: Starting VF number
+ * @__vf_num: Variable to store the random VF number
+ *
+ * This macro iterates over a random VF number starting from the specified
+ * VF number @__start to the total number of VFs associated with the given
+ * PF @__pf_fd.
+ */
+#define for_random_sriov_vf_starting_from(__pf_fd, __start, __vf_num) \
+	for_random_sriov_vf_in_range(__pf_fd, __start, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
+
+/**
+ * for_random_sriov_vf - Iterate over a random VF for a given PF
  * @__pf_fd: PF device file descriptor
- * @__vf_num: stores random VF
+ * @__vf_num: Variable to store the random VF number
  *
- * Helper allows to run code using random VF number (stored in @__vf_num)
- * picked from the range of all VFs associated with given PF @__pf_fd.
+ * Iterates over a random VF number selected from the range
+ * of all VFs associated with the given PF @__pf_fd. The loop runs only
+ * if a random VF number is successfully selected.
  */
 #define for_random_sriov_vf(__pf_fd, __vf_num) \
-	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
-	     __tmp < 1; \
-	     ++__tmp)
+	for_random_sriov_vf_in_range(__pf_fd, 1, igt_sriov_get_total_vfs(__pf_fd), __vf_num)
+
+/* for_random_sriov_num_vfs - Alias for for_random_sriov_vf */
 #define for_random_sriov_num_vfs for_random_sriov_vf
 
 /**
-- 
2.31.1

