Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75005C54735
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC1D10E20C;
	Tue, 27 Aug 2024 05:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ugi9GZQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C2810E03D
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737374; x=1756273374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDPJhmQzIqC6GQ7uuqiq6vAP73WjTrDmXMRyu6Zpxaw=;
 b=Ugi9GZQWPC0CFfEJLGZfoAf9NyKtILRRq6HOZepq3piF2aOBTAEbfcOX
 vkMJZ23foniJdU63J+fZaSL28Ddrcq9xhWrel7jT5mecl50Vhsj2cw5Rj
 MFE+kGTu7FUn3OvH4D+R900Ma1DXrY/8JGGNRxkG2uxyQTXSSbo+9fBWo
 9NXKu5iY3ROYXZaY6Cm0xv0WHIOjxlvY3SVotNyhusb4b6pE5xHYEtXxX
 z4hZdnmwgn3tIkMRz0oh4ZEjJ8W1Awwm8rIw8ng7gwA2i3LkCZU6calcy
 U/h0ebJ/Q/YmuJugv8ZloAKKasabtgUBNRFqgvVaboJBgZ6Hm9MLvLlns A==;
X-CSE-ConnectionGUID: GRhFBN57R86QucnT1NAjNA==
X-CSE-MsgGUID: JeVP6fVVQqOu9XzIVtrkCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23372150"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23372150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
X-CSE-ConnectionGUID: p3qsyVgRSnubfmxXiHnMwA==
X-CSE-MsgGUID: rF3IIsY1RqOk+Gbm6ybl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67556979"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:42:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 03/10] lib/igt_core: Add igt_assert_lt_double()
Date: Mon, 26 Aug 2024 22:42:15 -0700
Message-ID: <20240827054223.1671414-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827054223.1671414-1-lucas.demarchi@intel.com>
References: <20240827054223.1671414-1-lucas.demarchi@intel.com>
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

