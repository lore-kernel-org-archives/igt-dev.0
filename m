Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050CECDD1CD
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 16:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D4810ECEE;
	Fri, 27 Sep 2024 16:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXWw1iTD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4F10ECEE
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727454797; x=1758990797;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=BZStcbXE+FzjzdvVAc8WkqhJx4YDHCR/lI+I/MO4HYo=;
 b=aXWw1iTD3Wqu0XEjHo8ZwKVoG/moGsiyZWp3jI3j4OebuO2SRvkZ6824
 egonhGqqoNLI2DBhehegu0O8USK+RdEpQMBm5w++rDwcwz/0UKaPXUc2B
 88wH5bMq4bZjw2uXHj39CLUPomvWumHO/SAcL4W48TFnerGhxE5/0lqmy
 5U1kq9M/QBpNmKZiBqX9gSNdkJChsaRQ2TaBPg1bcQsUeub/1pet1i1DJ
 F771w8ZYn2sbRTSOh5sfmlmi8K2Es6IH/ksNTytINNegvMQlZPm/vvjgx
 ak15dTVk2g7Zqjxic7bhM0vMWKNaY3e1YEN5lJLVyZDkmVKzawaFQjez9 w==;
X-CSE-ConnectionGUID: +afrGDmPSeuo+3Qmy7gUMg==
X-CSE-MsgGUID: tgzi+wEwQ3Cjq7jaHp312g==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26738129"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26738129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 09:33:16 -0700
X-CSE-ConnectionGUID: WHptpDc6Tj+cwaEKpnP3Jw==
X-CSE-MsgGUID: mZgNiWEYRZ67vnKucqyxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72743825"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 09:33:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 19:33:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] lib/intel_compute: Fix compiler warnings on x86-32
Date: Fri, 27 Sep 2024 19:33:07 +0300
Message-ID: <20240927163307.10159-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

x86-32 gcc is not happy:
../lib/intel_compute.c: In function ‘xehp_compute_exec_compute’:
../lib/intel_compute.c:862:48: warning: right shift count >= width of type [-Wshift-count-overflow]
  862 |         addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;
      |                                                ^~

Just use ULL for all the address constants.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_compute.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 1cc39f645c2e..3ab9ace7932c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -27,20 +27,20 @@
 #define SIZE_BATCH			0x1000
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x1000)
-#define ADDR_BATCH			0x100000UL
-#define ADDR_INPUT			0x200000UL
-#define ADDR_OUTPUT			0x300000UL
-#define ADDR_SURFACE_STATE_BASE		0x400000UL
-#define ADDR_DYNAMIC_STATE_BASE		0x500000UL
+#define ADDR_BATCH			0x100000ULL
+#define ADDR_INPUT			0x200000ULL
+#define ADDR_OUTPUT			0x300000ULL
+#define ADDR_SURFACE_STATE_BASE		0x400000ULL
+#define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
 #define ADDR_INDIRECT_OBJECT_BASE	0x100000000
 #define OFFSET_INDIRECT_DATA_START	0xFFFD0000
 #define OFFSET_KERNEL			0xFFFE0000
 
-#define ADDR_GENERAL_STATE_BASE		0x80000000UL
-#define ADDR_INSTRUCTION_STATE_BASE	0x90000000UL
+#define ADDR_GENERAL_STATE_BASE		0x80000000ULL
+#define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
 #define OFFSET_BINDING_TABLE		0x1000
 
-#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000UL
+#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 /*
-- 
2.45.2

