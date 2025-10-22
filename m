Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDE4CCD1BE
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 21:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC6D10E84B;
	Wed, 22 Oct 2025 21:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjrGM7w0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9544D10E84C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 21:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761167509; x=1792703509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E+4jPim5VaoHFEKWSmMXQCjIe2DVrYbYlbqlFhUpvKY=;
 b=cjrGM7w0genjZuVapfuj0Vjo2J+ywSH5AV10xIcPsZqPfLqGHPp4HhxA
 woeylSp6kRL4QeTsRkR4hnmfFPW4YzI2eLXLQO47ssEkIs+dI09ezhOAh
 7B/7aC82OwDkek/73mA3MinUlkKWDU7G6oRzgK6k1/gYf4Skp3esxqhrt
 UcG0lfzRYhGtVztlDsUWvk+TZ/0BQl6Yb/Gb01Rvmw19Ngj+SJoB3HSuI
 jqNFbtJKKgeCHZfV2QVL94gNFNcff0jMGN/YOXWVrPstpwmUjjTQonubj
 3sr8ZJV7EDDIodX5mPeEJ8XoKbmWNGXkFPCfKdhubDYHCeLHpjXJSDtGg w==;
X-CSE-ConnectionGUID: 3uneEClxR0OCUcNTxcqoVg==
X-CSE-MsgGUID: UnW9PxLzRCyT2bv5vcuoww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63236573"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63236573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:11:48 -0700
X-CSE-ConnectionGUID: KpAPwfDhTy2AeMiBlt2CDA==
X-CSE-MsgGUID: MbyVAMadSaGpYGZwg8Uozw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183915196"
Received: from dut4411lnl.fm.intel.com ([10.105.10.134])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 14:11:48 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 stuart.summers@intel.com, daniele.ceraolospurio@intel.com
Subject: [PATCH] tests/intel/xe_fault_injection: Force clear injection list on
 task end
Date: Wed, 22 Oct 2025 21:11:48 +0000
Message-ID: <20251022211147.27810-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a call to injection_list_clear at the end of the test to erase any
potential lingering fault injections before performing the kmod bind to
rebind the Xe driver.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_fault_injection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 621af27d4b..4b48816341 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -688,6 +688,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		close(sysfs);
 		drm_close_driver(fd);
+		injection_list_clear();
 		igt_kmod_bind("xe", pci_slot);
 	}
 }
-- 
2.43.0

