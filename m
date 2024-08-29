Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53FEC71151
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 05:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B8810E315;
	Thu, 29 Aug 2024 05:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D53wjJ9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E4010E315
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724909049; x=1756445049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z3+Dq8qfgB9DUPIRy5eLSUImhlcIGliWtrqB2tonuAA=;
 b=D53wjJ9mYxjvRftVwexqp47PlUPC1T/g9vr78Gqzgk6OYlgT+PYC7zOc
 RybJJqkH/u4XPIcyACrNIZb/Hs4k/RfNDYmwVjTyh56bSmcddpnc4ykih
 DTCfw++wOD/s6ff0l0w+dA47XYDb1nXdtmVHaI74odzJV33EdD0+AxUii
 rbWR+Y+Js4sS6NNCWb0XBIz44FbfkhMJ4kdWnS8ZH9aOoSETXiidbIezl
 d5m54t5yRxZO+8iqxYK639dRqcZzPZju+/MEkVY8Fmh2bhezoxpuVqPxF
 fLkFEcq184n5w9mYj5pm4+1U5Yp83VeqvRotIhBQb+0tw9rCay4ek05Ts w==;
X-CSE-ConnectionGUID: tCbKFSkpS8+XZuITaaj7gQ==
X-CSE-MsgGUID: gqZKEFYqSAyyo4tfyVWdow==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27352868"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="27352868"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:08 -0700
X-CSE-ConnectionGUID: CIjj7iyUTHqALoOBxK24pQ==
X-CSE-MsgGUID: PMbqlTqlTbS/TF8f0mRiZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="94200498"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 2/5] lib/igt_core: Add igt_assert_lt_double()
Date: Wed, 28 Aug 2024 22:23:51 -0700
Message-ID: <20240829052354.1872909-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829052354.1872909-1-lucas.demarchi@intel.com>
References: <20240829052354.1872909-1-lucas.demarchi@intel.com>
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

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
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

