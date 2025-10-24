Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA53CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 12:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B11F10EA58;
	Fri, 24 Oct 2025 12:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKopT6p6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C4A10EA58
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761308338; x=1792844338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CYw0IJRvVZA/TKXgVQ1EbL+7y3G74OtHL+s+pAo7Qyo=;
 b=QKopT6p6MPqzWMnxTCTfiDm4vAfdXFfaxckVCUOAE9sl6BSUV/Ai8a4o
 FdjLYnz9LbpvfwWlWvouYesvQXvavBsjWUEyptaOSwPIOryPvlOdujddH
 pzM+BtXszHjb2uugwCk3a3c3Z8fv7/Ae83QtX0dlh2eVUGbT3cKNvkVV3
 rihBHM/8ucvc49YzGKmh5BE9NAEoO80WQUC5V7G1YydKOtk767ef4gyC3
 hkXDgczJH1Tab7QqTI4XKnqp0ljD04ALewRb9/S8GvMqvesIdaGSbz4fr
 eDnfnMfk6Uw6I756dDNQq/ActBSYixkaG2Im0JzxfCNKFORDtZSCF/6Mo A==;
X-CSE-ConnectionGUID: 8J+lL6zCQj2qXbSGUljL6w==
X-CSE-MsgGUID: Trlze+65TfWUlK4RFYiaag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63637322"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="63637322"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:18:58 -0700
X-CSE-ConnectionGUID: WO6bCCRGRPSQdbhsHeDpJw==
X-CSE-MsgGUID: MU51KOpbTYuamvt3d2pe9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="215075077"
Received: from dalessan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 05:18:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v1 2/2] lib/pciids: Add NovaLake NVL-S PCI ids
Date: Fri, 24 Oct 2025 14:15:17 +0200
Message-ID: <20251024121517.73013-3-kamil.konieczny@linux.intel.com>
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

Sync with drm-next commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 0cd12616d..9f095a99d 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -884,4 +884,13 @@
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)
 
+/* NVL-S */
+#define INTEL_NVLS_IDS(MACRO__, ...) \
+	MACRO__(0xD740, ## __VA_ARGS__), \
+	MACRO__(0xD741, ## __VA_ARGS__), \
+	MACRO__(0xD742, ## __VA_ARGS__), \
+	MACRO__(0xD743, ## __VA_ARGS__), \
+	MACRO__(0xD744, ## __VA_ARGS__), \
+	MACRO__(0xD745, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */
-- 
2.51.1

