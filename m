Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA983E8304A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 03:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A9F10E4EA;
	Tue,  3 Feb 2026 03:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsslM8Kl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8977110E301
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 03:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770090464; x=1801626464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zWyDr71zFEIobxI6RdTLlH8rvxYZIBVqII7m5GCwkck=;
 b=RsslM8Kl9e/cZg6SXImUjhtwlUcT77KT1vU6QGr/EPjyM89aNKjxuBaB
 Qkl7M0Sr3rgp/iHks7e24XnKmnKP8uSgjSCKSV0qEA3ofElyf4SqPQh13
 fF1uQaounlFeTdZqdMH790DfMCcSiDnbTNmcYohbFG1N8//EdI/vLTCP9
 CxAJqy++GfQ76CmR8ZaRoP5sFxw46LD2jwHO3wW9fCjwI8tNVcE+B8Z3m
 am3Hx6dPD9sAmOBC5SoM1/jpZaBRQNyt6fmAmJj+2t6wyc5qt4isiVzZi
 756HG8D+AYvLn6t8Xu1cJYbvAfN5l94sbVts9oM37Gu8SVGMMonjfYLIc Q==;
X-CSE-ConnectionGUID: jlhLjaU4T6uqvZ8Tgn+8qw==
X-CSE-MsgGUID: 2IUcq6hPQ8uJFeEBwTJkJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58834604"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="58834604"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:42 -0800
X-CSE-ConnectionGUID: 7NUKLP7EQ8yIYtzzF/KoMA==
X-CSE-MsgGUID: cGrcZsdtSNSKRLi21grb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="247313453"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:47:41 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v7 1/3] tests/chamelium/kms_chamelium: Add
 connector_test() macro
Date: Tue,  3 Feb 2026 09:15:44 +0530
Message-ID: <20260203034546.1516152-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260203034546.1516152-1-mohammed.bilal@intel.com>
References: <20260203034546.1516152-1-mohammed.bilal@intel.com>
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

Introduce a unified connector_test() helper macro that iterates over all
matching connected ports and executes tests accordingly, ensuring clean
skipping when no matching connector is present and avoiding unintended
fixture execution.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_helper.h | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/kms_chamelium_helper.h
index 6dbde8b76..ac776998f 100644
--- a/tests/chamelium/kms_chamelium_helper.h
+++ b/tests/chamelium/kms_chamelium_helper.h
@@ -40,6 +40,39 @@
 	for_each_port(p, port) if (chamelium_port_get_type(port) == \
 				   DRM_MODE_CONNECTOR_##type__)
 
+/**
+ * connector_test() - Run a subtest for all ports of a given connector type
+ *
+ * Defines a subtest that iterates over all available Chamelium ports and
+ * executes the provided test function for each port matching the requested
+ * connector type. If no matching port is found, the subtest is skipped
+ * cleanly.
+ *
+ * This helper avoids repeated connector-iteration logic and provides a
+ * consistent pattern for running connector-specific tests.
+ */
+
+#define connector_test(name__, connector_type__, data__, test_fn__, ...)		\
+	do {										\
+		igt_subtest(name__) {							\
+			int p__;							\
+			struct chamelium_port *port__;					\
+			bool found__ = false;						\
+			for_each_port(p__, port__) {					\
+				if (chamelium_port_get_type(port__) !=			\
+					DRM_MODE_CONNECTOR_##connector_type__)		\
+					continue;					\
+				igt_info("%s: testing port %s\n", name__,		\
+					 chamelium_port_get_name(port__));		\
+				found__ = true;						\
+				test_fn__(data__, port__, ##__VA_ARGS__);		\
+			}								\
+			if (!found__)							\
+				igt_skip(#connector_type__				\
+					" connector not available");			\
+			}								\
+	} while (0)									\
+
 /*
  * The chamelium data structure is used to store all the information known about
  * chamelium to run the tests.
-- 
2.48.1

