Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B53CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 12:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C43810EA2B;
	Fri, 24 Oct 2025 12:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTNauqrq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257D310EA2B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761308334; x=1792844334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GBWeaoTCWtZ4+fsQkQyfWfAawCWYWN38C32w6Q5L/Yk=;
 b=VTNauqrqIT80zFTxijDKbFk7gKEYA6mFod9Tc7iHnboffnyjs6zjNdf5
 cJahdtGQS7UM8GjXhyyfoWUB1bgvU7V5BksaQhujaKd6fHr/dfWW/S4DZ
 tTlYIG8yjKvp450DOAZMADA9tLfe8TUpe+r8Q6gC9H2fNK8toEQSZUhoW
 r3CWUwp7wvF+gtpjaCP/ZEY3TUipO+eu9Q6Jv8oEet8wwWQ10bNFznhBp
 ntgA6LD3z+1arJtlO42PvQUNSuLfcDU0a0hkzRiDKU7uCr2XSyaNkiDRP
 RJrJcseYF3gr5/CAbnkw/rld/NTB45O+TFuty9Pq+vhN1XPHcGZtSutPH g==;
X-CSE-ConnectionGUID: Ze87f1uzSiSDTxK/6P56FQ==
X-CSE-MsgGUID: junKpL8bQGevKNpiAg0Tag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74093045"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74093045"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:18:54 -0700
X-CSE-ConnectionGUID: vtnUrIlwQKGuLqpLBsNoaw==
X-CSE-MsgGUID: BQtWe16vTciEghUd50yhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="188481645"
Received: from dalessan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:18:52 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/pciids: Split out BMG-G21
Date: Fri, 24 Oct 2025 14:15:16 +0200
Message-ID: <20251024121517.73013-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
References: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
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

Sync with two kernel commits in drm-next, first one adds only
kernel macro, not affecting igt, while 2nd splits out few PCI
ids from BMG into BMG-G21.

edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
Link: https://lore.kernel.org/r/20250808-intel-pci-device-v1-1-ce3545d86502@intel.com

78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
Link: https://lore.kernel.org/r/20251013200944.2499947-40-matthew.d.roper@intel.com

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 76f8d26f9..0cd12616d 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -26,6 +26,11 @@
 #define __PCIIDS_H__
 
 #ifdef __KERNEL__
+#define INTEL_PCI_DEVICE(_id, _info) { \
+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
+	.driver_data = (kernel_ulong_t)(_info), \
+}
+
 #define INTEL_VGA_DEVICE(_id, _info) { \
 	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
@@ -844,7 +849,7 @@
 	MACRO__(0x64B0, ## __VA_ARGS__)
 
 /* BMG */
-#define INTEL_BMG_IDS(MACRO__, ...) \
+#define INTEL_BMG_G21_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
 	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
@@ -853,7 +858,10 @@
 	MACRO__(0xE210, ## __VA_ARGS__), \
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE216, ## __VA_ARGS__)
+
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
-- 
2.51.1

