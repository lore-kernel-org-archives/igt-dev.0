Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF8BC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 22:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EA410E12E;
	Mon, 29 Jul 2024 22:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X97/m4UV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1510E12E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 22:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722290583; x=1753826583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OwDkKiPgrgQggiK1wQaCyrgSrO1BRzUeDmnNRNoAFk8=;
 b=X97/m4UVrEPp5gEVfgypTcKbBLAlowS2og1YPoytKLZ5RzigDm4/hTrm
 22rwMwhasf7+TdCAEk43Y7zNS1ssgfcsC67k2WcO5bf1upqSyvKnNJOmU
 Gp7AFBPk1r4m2EangeR9EMXNKoGBnplJ5u4AecC5ZNPdn7W2/3EG6heCa
 WgRL1Hc8/3Pr7FBy65k1xIYSNtyBpnTTf6zIIRcwZKNp2pVb3gNC8LoTw
 Tp7rWo644VxqYos3WIMz7LaT1BrWiyesCF6wia3DdYjY2S0ZsEr62rEUs
 ANPBlrE8vNfBQXaKrKccGaJfA+d2MnQGI6ISN3HtHyaWkGNzbrfyka6vZ A==;
X-CSE-ConnectionGUID: sHExTOkcRi+gATiIvfg4Vg==
X-CSE-MsgGUID: RrInS94jQOmqqi25XzMoXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="22987210"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="22987210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 15:03:02 -0700
X-CSE-ConnectionGUID: EiLg/HI+R6ihF7D3+qBWfw==
X-CSE-MsgGUID: oVHG2DixQCSMyeXW5Diy3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="58902447"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 15:03:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 1/2] lib: Add u32 variants of igt_assert_{lt,lte}
Date: Mon, 29 Jul 2024 15:02:50 -0700
Message-ID: <20240729220251.3353533-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

igt.cocci assumes that u32 variants of the comparison assertions exist,
so add the two that were missing.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_core.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 084d94da7..82f474c5f 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -915,6 +915,15 @@ void igt_describe_f(const char *fmt, ...);
  */
 #define igt_assert_lte(n1, n2) igt_assert_cmpint(n1, <=, >, n2)
 
+/**
+ * igt_assert_lte_u32:
+ * @n1: first integer
+ * @n2: second integer
+ *
+ * Like igt_assert_lte(), but for uint32_t.
+ */
+#define igt_assert_lte_u32(n1, n2) igt_assert_cmpuint(n1, <=, >, n2)
+
 /**
  * igt_assert_lte_u64:
  * @n1: first integer
@@ -954,6 +963,15 @@ void igt_describe_f(const char *fmt, ...);
  */
 #define igt_assert_lt(n1, n2) igt_assert_cmpint(n1, <, >=, n2)
 
+/**
+ * igt_assert_lt_u32:
+ * @n1: first integer
+ * @n2: second integer
+ *
+ * Like igt_assert_lt(), but for uint32_t.
+ */
+#define igt_assert_lt_u32(n1, n2) igt_assert_cmpuint(n1, <, >=, n2)
+
 /**
  * igt_assert_lt_u64:
  * @n1: first integer
-- 
2.45.2

