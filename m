Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFBAD358CE
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 07:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904B810E269;
	Thu, 29 Jan 2026 07:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iz9SMxlj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AE410E269
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769672865; x=1801208865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uH2gIGTlZXZ0ij1yKkY2CK3btvfUjxxd7MtQXZIirCQ=;
 b=iz9SMxlj+OIQgFLU93ApFj5MrXn/9RjJQ/cwPi+MouBIdCX+DldcvNUq
 j4Myhc565bvihPp+V3DYybMfszbGt/FRJ0yrCFmctQ3vSq8XHPxBGEe1R
 pJ3qSUx+QELV5ugZRzxdILoQXI7j8UGGHtgJkZPNTMi/lRtlPtIvWd6qy
 t7Rsa8wv1e3/yeNfIv6Eva1eRFf6LrTBbp4p0uSIzwW1ISjQ2U+5eQNlt
 cAr9codpST5nyExzE/adg4fdgw9yeC36Fje3ZvHOoe7mKD7/laPursHO4
 ScvHC5uJ7Bgnrq5k+Ulcs90kN6RnViEmpvBmHCOsJa8BkkC2GHrAempQh A==;
X-CSE-ConnectionGUID: 8DlX3KmtTuOsm+xhbTIPOQ==
X-CSE-MsgGUID: r9xS1P1GSuSAaSMJK3OmWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70874120"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70874120"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:47:45 -0800
X-CSE-ConnectionGUID: vQZyEgw3SRGUB5pord8GTA==
X-CSE-MsgGUID: dW5L0gRJSWqwJB7nuNYneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213373233"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:47:43 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 karthik.b.s@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v6 1/2] tests/chamelium/kms_chamelium: Add
 connector_test() macro
Date: Thu, 29 Jan 2026 13:15:19 +0530
Message-ID: <20260129074520.397133-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260129074520.397133-1-mohammed.bilal@intel.com>
References: <20260129074520.397133-1-mohammed.bilal@intel.com>
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

Update connector handling to iterate over all matching connected ports and
execute tests accordingly, while fixing unintended fixture execution and
skipping cleanly when no matching connector is present.

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

