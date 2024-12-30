Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E28E77194
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 04:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D73D10E214;
	Thu,  2 Jan 2025 04:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLK11+4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC3B10E366
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735548422; x=1767084422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hew7ihM+KbET3q4emY504nj2au6aW4ZHSbnSzjVQ1n4=;
 b=DLK11+4Nb4ItgNRkGhQ79SjklWbYTt+hpl49CEt4M9AZjjoOJcaDBN2H
 P41tEoTdH4pWO3wpb0yObe4+K5g2zl/XcmLoJOw7WgUAlu77nlIDSxmuZ
 nqX96X1zQDeJ6XR9EKGvHWtpSEDe7SYiBYj/vxhIOqMaVptkssYNOUWRP
 dWJEPh6XK7Wm8FXoBOZF+7HnFxkhw1FWCAisSab8bAa008W0COxTLN9il
 E/qfAfbzrajFJgOUrwKvbwON04ZLYNUkyNvGfF7kQlRLIhgJznN3HKKwR
 7atmrnzPZKbZWdqIiF52EfPCvSD6M8cFxn2eq1f/ftGTwuh84eKk+KVzY A==;
X-CSE-ConnectionGUID: NV2GLHvNTP29+P1hkJifxw==
X-CSE-MsgGUID: DFPwtiulQPOb90Iru64X2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35710858"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; d="scan'208";a="35710858"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 00:47:02 -0800
X-CSE-ConnectionGUID: yxdqzxjUR9+josyWjfCPhw==
X-CSE-MsgGUID: MwxCKWYrQC+HOhq8MLAK0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101587604"
Received: from unknown (HELO labhost1.iind.intel.com) ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 30 Dec 2024 00:47:00 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_mmio_send_recv
Date: Mon, 30 Dec 2024 14:32:09 +0530
Message-Id: <20241230090210.17621-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241230090210.17621-1-satyanarayana.k.v.p@intel.com>
References: <20241230090210.17621-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Jan 2025 04:15:54 +0000
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

Use the kernel fault injection infrastructure to test error handling
of xe at probe time when executing xe_guc_mmio_send_recv() so that
more code paths are tested, such as error handling and unwinding.

Error can be injected using:
./xe_fault_injection --run-subtest inject-fault-probe-function-xe_guc_mmio_send_recv

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7ae941367..ef3bbb7ec 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -170,6 +170,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_uc_fw_init:		xe_uc_fw_init
  * @xe_wa_init:			xe_wa_init
  * @xe_wopcm_init:		xe_wopcm_init
+ * @xe_guc_mmio_send_recv:     xe_guc_mmio_send_recv
  */
 static void
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
@@ -301,6 +302,7 @@ igt_main
 		{ "xe_uc_fw_init" },
 		{ "xe_wa_init" },
 		{ "xe_wopcm_init" },
+		{ "xe_guc_mmio_send_recv" },
 		{ }
 	};
 	const struct section vm_create_fail_functions[] = {
-- 
2.35.3

