Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFD5C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58B810E420;
	Mon, 29 Jul 2024 16:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTXfs4ty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BC210E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269086; x=1753805086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfg55Rs/p9r4ZpMhr53or16c8+izJv9JAXFecIFhm6g=;
 b=UTXfs4tyH03/kogREKSmok1DHxxXw3B3M15v/wqeUgI1aQF3qlAiXmuC
 MJW4l+4To/pzvINqLcatDSIoZg8qSJJYEWVmtUZG0NmYSjFOYrSKSKGP0
 DF92kG9C5l134aRA3cSiufAc+tIUDCG9gSTYNg0gNcz6KrWxTDTY2Zej7
 xwgRCPCHsIBNsQNdv0q7rYL+mspCD3YWWI+dSruBxj5jTB3V5Wy7US7Jw
 MRDsIrYw45/dTgZ1tyv2gnrBdGHRR2DPRhOp4Ibc/tZ3jR8QLhCpsju2y
 iFfibVh5bOuHtlajcv9su0cf/n1K2h9o3atB0P4zzxOo7cmW/GkCrwNOR g==;
X-CSE-ConnectionGUID: jIULrAxYRNySAzNfTBRTWw==
X-CSE-MsgGUID: cdOj1nZrTW2K96pXpI9QAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427377"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:45 -0700
X-CSE-ConnectionGUID: Y7qkHBF1T6KJUxeEIzpvKg==
X-CSE-MsgGUID: rVe53svrRHWYTRCsTTq3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739138"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:41 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH 45/66] tests/xe_exec_sip: Add nodebug test cases
Date: Mon, 29 Jul 2024 18:01:38 +0200
Message-Id: <20240729160159.37036-46-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Introduce tests that make sure we don't enter SIP when debugging
is disabled.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_exec_sip.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
index a27d3cba6..35d65bcc4 100644
--- a/tests/intel/xe_exec_sip.c
+++ b/tests/intel/xe_exec_sip.c
@@ -285,6 +285,10 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: wait-writesip-nodebug
  * Description: verify that we don't enter SIP after wait with debugging disabled.
  *
+ * SUBTEST: breakpoint-writesip-nodebug
+ * Description: verify that we don't enter SIP after hitting breakpoint in shader
+ *		when debugging is disabled.
+ *
  * SUBTEST: breakpoint-writesip
  * Description: Test that we enter SIP after hitting breakpoint in shader.
  *
@@ -392,6 +396,9 @@ igt_main
 		test_render_and_compute("wait-writesip-nodebug", fd, eci)
 			test_sip(SHADER_WAIT, SIP_WRITE, eci, 0);
 
+		test_render_and_compute("breakpoint-writesip-nodebug", fd, eci)
+			test_sip(SHADER_BREAKPOINT, SIP_WRITE, eci, 0);
+
 		igt_fixture
 			xe_eudebug_enable(fd, was_enabled);
 	}
-- 
2.34.1

