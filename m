Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85934C678DA
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 14:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349C810E579;
	Tue, 10 Jun 2025 14:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUigSq4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46110E573
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749566371; x=1781102371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XP9J/8Og+LI4un2P9Txd7C7JchNo1Ava4AvOUvU2xes=;
 b=GUigSq4DrvEfBjlNbhCmEAYV99Wd0p74mvw3c3ENnxT7diho+Y2ELQ4B
 uP1+rVdiAJYF5upmAHCd7THRAUQXLFaautDqnXbBq8aYSJtlUnZPQcCJk
 x7rZjb8/WS2/z7ISDy9fGwhge0Q7Coj6W7Z3UQCZBJi8AB9004mylbRI8
 MA94JDnUb/t+j+99ge+xdEjhOkVVIgp9sa/d6unA+MIqm+qs0JQDkpCuQ
 EieCGgTSS4L52qjQBMcYaluWbq7wiLZ6ajSd+T25NuSfVcH0xLs9OmHUm
 BIYQBY0nLPCoGy8f/OalzAm1YmQFbtAmUj0YM8zN44GNf+hCGREfGjTh9 Q==;
X-CSE-ConnectionGUID: dnPMppbtQLy+O24bVleLKg==
X-CSE-MsgGUID: 2FL2+xTtTo26KQ0OlynPdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51765566"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="51765566"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:39:30 -0700
X-CSE-ConnectionGUID: G2/+8ol7RGeGeZoc9uLpfg==
X-CSE-MsgGUID: upXqL6psTo6xebami9/izA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="150704998"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:39:30 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v5 1/2] tests/intel/xe_fault_injection: Make pci_slot const
Date: Tue, 10 Jun 2025 14:39:29 +0000
Message-ID: <20250610143930.14742-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610143930.14742-1-jonathan.cavitt@intel.com>
References: <20250610143930.14742-1-jonathan.cavitt@intel.com>
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

The pci_slot string is passed to multiple functions in
xe_fault_injection.  It is also unmodified in those functions,
so should be passed as a const.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: John Harrison <john.c.harrison@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9fe6bfe351..7a14ad1729 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -228,7 +228,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wopcm_init:			xe_wopcm_init
  */
 static int
-inject_fault_probe(int fd, char pci_slot[], const char function_name[])
+inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
 {
 	int err = 0;
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
@@ -255,7 +255,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
  * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
  * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
  */
-static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
+static void probe_fail_guc(int fd, const char pci_slot[], const char function_name[],
                struct fault_injection_params *fault_params)
 {
 	int iter_start = 0, iter_end = 0, iter = 0;
-- 
2.43.0

