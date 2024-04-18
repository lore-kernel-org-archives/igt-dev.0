Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6156C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 11:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9F0113BB9;
	Thu, 18 Apr 2024 11:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5cUQJoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D300C113BB9
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713439597; x=1744975597;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OBKG/fgZKVgXcGR03VuxmRVc/vpNA/LJl7WrE3jtE3Q=;
 b=C5cUQJojE2hrKThXdf4/UpEMLGcvD/gk/gfdz5TcjUi2iWuF2u/gVwVE
 zAEvdwHxNhMMFRpQEFLWEnNC4SO7hp6S+MLZ7fs5C+Z5JV0iUsRpQqRCQ
 jH8nlsZCLuwFghr6PfnwzhpinrmjTkBAvzoCzngIXdLiJUXc4+IFLOYOT
 MVw31lNtBLpggf9BXIA2WEOHuABZx90amGb13/IDWSQCM9oDDTQsSunDH
 j04oTEhj9JkUcKTYn/SV4aZZnyD1uCqbDCRKWOLHMHaccinI7+wjOLowY
 nTDF80dx4HkzgT+9TTRsUGO1mUnCaTX3Fhh27L1zGEUiFz3D6uMKAzwkC A==;
X-CSE-ConnectionGUID: H/+P7AOTQSusCSkDxRAJ/w==
X-CSE-MsgGUID: 2zXsCMSqTPG1LB9ykRNsgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12767433"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="12767433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:26:36 -0700
X-CSE-ConnectionGUID: AR2zSS/sQw2ceJCNZHFqGg==
X-CSE-MsgGUID: hC8MfemsS+2M7qQRlmJ/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23029708"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Apr 2024 04:26:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Apr 2024 14:26:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tools/intel_reg: Fix mchbar register write
Date: Thu, 18 Apr 2024 14:26:33 +0300
Message-ID: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

I somehow lost the write part of the mchbar register support.
Add it back so that we can also write mchbar registers without
having to remember the address of the mirror range.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_reg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 6c37e14d127d..aae5a23956b9 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -586,6 +586,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 	}
 
 	switch (reg->port_desc.port) {
+	case PORT_MCHBAR_32:
 	case PORT_MMIO_32:
 		if (reg->engine) {
 			register_srm(config, reg, &val);
@@ -593,6 +594,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 			OUTREG(reg->mmio_offset + reg->addr, val);
 		}
 		break;
+	case PORT_MCHBAR_16:
 	case PORT_MMIO_16:
 		if (val > 0xffff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
@@ -601,6 +603,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		}
 		OUTREG16(reg->mmio_offset + reg->addr, val);
 		break;
+	case PORT_MCHBAR_8:
 	case PORT_MMIO_8:
 		if (val > 0xff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
-- 
2.43.2

