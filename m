Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4878EE77194
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBC910E48A;
	Mon, 30 Dec 2024 10:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+z6nnCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748F10E48A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735554293; x=1767090293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hew7ihM+KbET3q4emY504nj2au6aW4ZHSbnSzjVQ1n4=;
 b=V+z6nnCbTiGGimQ/lJDk675vYAB5oCCH/dRQTZa0k72kwO2ohMcNS17p
 uHZfc9aNTL6BDVfTu7Wl5Jtnl6hqc134nTs2sCExlbGJ1CcunV+LfrB3Y
 EUj0Ndli06/gkiSvMJpOYgq+oBrWd1gVfEfEvfh0OOlLxYa+M18T5qFyu
 5TdGW72dIfe8l+u+7qsdaA3tyCCWwOEBMPw4svdCR/k6o+5PMGkPVTkaU
 AJxDwnkNnEX3aRbJoahHW8ZJb+xVOAuCb0klmv7oNJXU8QF8wzVU07Z4F
 Kf9beEKC+A1CjXeHfqiMFlAoah5yq69tzNePBL9KXNpIPQzSyEdPunw9u g==;
X-CSE-ConnectionGUID: sd5VmURFTxKPHNK++HX0Lg==
X-CSE-MsgGUID: LFqovg4eSXmbhZjysETj9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="36061707"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="36061707"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 02:24:53 -0800
X-CSE-ConnectionGUID: Ad8x2O3DTka0YhcmOcn3wg==
X-CSE-MsgGUID: 7e1n5ZeFTYKeUG43DIxD9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="100516614"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 30 Dec 2024 02:24:51 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_mmio_send_recv
Date: Mon, 30 Dec 2024 16:10:07 +0530
Message-Id: <20241230104008.25403-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
References: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
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

