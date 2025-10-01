Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B7ACCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 15:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5E110E72F;
	Wed,  1 Oct 2025 15:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HP0oM9Jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E635310E72F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759331947; x=1790867947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NPatgFDpdkvpHd/QrU9pOw2g0QrBlObO1HunEz4AD80=;
 b=HP0oM9JbhY8s/amI8VWHvNDGXpccQFWlQ9L686CEBDFgMdl7D2fBW5JI
 3tG+pgJkFtxip+J4rrZxX25X7zhnzkX+YYh8gmWY/cmaBhx8ALIejU8yG
 E9cK0HzW2RUKX+LdISZOzxIMaEGIGS7n/BozeJM3ihupOYKChnujVywhV
 L0Mno+YtOrmi1s546BjW7dJsDarkbw683hjZvtQop2VvMCRyUl9L4g/VB
 yify/CD/Ev4o/hIkDjeTujzZayBQ4x0GdPfpcAYaptLBPsZ8Chw1fSWVA
 MMO3BoQniVoTBT9IyXeZWUqnpACIPJlJ2IHECG38LooiChwKnc2ifjwZD Q==;
X-CSE-ConnectionGUID: M2nDsR5QSEebXkn4GsJohw==
X-CSE-MsgGUID: Li6v7ImQQjmdAB9NPD46/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="64227511"
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="64227511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 08:19:06 -0700
X-CSE-ConnectionGUID: JqZewNeGT42kZIcv9Msxdg==
X-CSE-MsgGUID: +JGLnf+bQbKjWHDJBjTAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="179242949"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa009.fm.intel.com with ESMTP; 01 Oct 2025 08:19:06 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1] tests/intel/xe_fault_injection: Set guc_wait_ucode pf only
Date: Wed,  1 Oct 2025 11:18:57 -0400
Message-Id: <20251001151857.104568-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

guc_wait_ucode is pf only function, set the flag to run normally in the VF
environment.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9e98b3ada..5fca9aefa 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -548,7 +548,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		unsigned int flags;
 		bool pf_only;
 	} probe_fail_functions[] = {
-		{ "guc_wait_ucode" },
+		{ "guc_wait_ucode", 0, true },
 		{ "wait_for_lmem_ready" },
 		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
-- 
2.34.1

