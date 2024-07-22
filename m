Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F318C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 10:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F9010E091;
	Mon, 22 Jul 2024 10:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6E76eqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D29F10E091
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721643749; x=1753179749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D9DT1gWxA86FvNcNMP/TmwjrprA/pfUusxXpEubewqg=;
 b=n6E76eqfm+GaB2p3VWIqO5/GMsyNaNDTerMA4ED9J4WA6pnO8xerkdAm
 K7Lf1eF8iTWwtsnjVMbufZj4v2Wioecx3tZ19m4/93oJCy0LDFNRx84le
 FbjWPQjgxejTsue3Sigi+aDtFvjOv4b7Q6nhEkWOpyvuoHFMCG5weDS8i
 BSv3Nlyyievg3Nj7qu882QjeaIJhDFG4ejpULe1IPU5ASFQp0orYxWApW
 2EXiJGX41IwJeq8zixNeD9UmvRGa/tde7kZwDbmcg+NnxyMMvwBr0d3ym
 7DtgIxSEYcHC+9UnftOyZgoG+SZrzdJuL6ddjrWhyioO2iYPcYeeAsZH2 g==;
X-CSE-ConnectionGUID: rDadqPKgRnWLMxtsrHuIdg==
X-CSE-MsgGUID: c2vWbDgdTOu0XhcuTTWMBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30631073"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="30631073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:22:29 -0700
X-CSE-ConnectionGUID: fZHRJGGaSQGMQ4TdqrM8hQ==
X-CSE-MsgGUID: iVwG92oRRWOnwI9zoZlu6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56013549"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:22:27 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2] lib/intel_compute: Enable compute tests for BMG
Date: Mon, 22 Jul 2024 12:22:19 +0200
Message-Id: <20240722102219.109909-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nirmoy Das <nirmoy.das@intel.com>

BMG is XE2 based so compute tests should run as it is.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
v2: Keep pciids which were released in the kernel
    Drop BMG prefix in commit msg
---
 lib/intel_compute.c                | 10 ++++++++++
 lib/intel_compute_square_kernels.c |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 72025a4811..6458f539c6 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1449,6 +1449,11 @@ static const struct {
 		.compute_exec = xehpc_compute_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(20, 01),
+		.compute_exec = xe2lpg_compute_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_exec,
@@ -1719,6 +1724,11 @@ static const struct {
 			     bool threadgroup_preemption);
 	uint32_t compat;
 } intel_compute_preempt_batches[] = {
+	{
+		.ip_ver = IP_VER(20, 01),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_preempt_exec,
diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
index efd55da0b9..a1f3b46da5 100644
--- a/lib/intel_compute_square_kernels.c
+++ b/lib/intel_compute_square_kernels.c
@@ -3866,6 +3866,15 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
 		.size = sizeof(xehpc_kernel_square_bin),
 		.kernel = xehpc_kernel_square_bin,
 	},
+	{
+		.ip_ver = IP_VER(20, 01),
+		.size = sizeof(xe2lpg_kernel_square_bin),
+		.kernel = xe2lpg_kernel_square_bin,
+		.long_kernel = xe2lpg_kernel_inc_bin,
+		.long_kernel_size = sizeof(xe2lpg_kernel_inc_bin),
+		.sip_kernel = xe2lpg_kernel_sip_bin,
+		.sip_kernel_size = sizeof(xe2lpg_kernel_sip_bin),
+	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.size = sizeof(xe2lpg_kernel_square_bin),
-- 
2.34.1

