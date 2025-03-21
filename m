Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715ECC35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 09:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2747410E764;
	Fri, 21 Mar 2025 09:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhxpAW/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2304710E764
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742550796; x=1774086796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A9gTw9oirAFcafuWPH0IUKw1LAxLS4yA2QgalPu2EAY=;
 b=mhxpAW/t47U894bOy1zrWNosZt0xyWsOi40LQw4gDnkau3RbUcic2fG+
 f6GKrERFRQoLicDc2mdkg29H3+EExjwdr64RnZO0ltFPfkqvalTOpfHXQ
 jxQicO0h36tdTPiAGwpgc3bpSLO+fFvsiihpVQwFMEmXPo63IIJo2BGkY
 auMSwRiI5pwFNiGjEBIadNF0VMg4ZWUVhgMp7kkLnHeRrxw7af6rzD+n0
 Wr/0+n2fKVpqcdiM3rAe62L3TdIyK83HlwQcalPA5R/+AZdN5NTBkQRHG
 9aOJbaiWQFRFN45/RsqRG2yad5xg6NdJKgeF0g6iOipdnm4UC6H7qU623 A==;
X-CSE-ConnectionGUID: j1xwxLHLRh+txxIg7V/t1A==
X-CSE-MsgGUID: cD3GMCQbRaOPuVafldyVag==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="42976575"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="42976575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 02:53:16 -0700
X-CSE-ConnectionGUID: Lbv1nGhsRyGpHaNakUKlYQ==
X-CSE-MsgGUID: pEqoMADSTla/zMC6sKyFJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128187490"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.254.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 02:53:14 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Injection list clear at
 exit
Date: Fri, 21 Mar 2025 10:53:06 +0100
Message-Id: <20250321095306.798153-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Reintroduce clearing of the injection list as an exit handler to ensure
fault injections are properly cleaned up.

Fixes: c0b2d9202f78 ("tests/intel/xe_fault_injection: Use igt_sysfs helpers")

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 5409d19a6..1bd0f51a3 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -137,6 +137,12 @@ static void setup_injection_fault(void)
 	close(dir);
 }
 
+static void cleanup_injection_fault(int sig)
+{
+	/* If nothing specified (‘’) injection list is cleared */
+	injection_list_do(INJECTION_LIST_ADD, "");
+}
+
 static void set_retval(const char function_name[], long long retval)
 {
 	char path[96];
@@ -371,6 +377,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
+		igt_install_exit_handler(cleanup_injection_fault);
 	}
 
 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
-- 
2.31.1

