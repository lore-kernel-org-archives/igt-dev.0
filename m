Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDB4CD342F
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 02:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06A10EC6F;
	Wed,  6 May 2026 02:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPxm44o6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B219510E4D6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 02:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778035503; x=1809571503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yM+X8lwGb/1R4j/rf4q0Xk9CkaxqRk2jnCbSMEF/I9A=;
 b=kPxm44o6fFujWY/8GaMLtdSuG2MW2Gd2GnfT8gc2NFO+PXsFoD5S6jUh
 aP0y7ig/9hI0eFMypOBsvbtFnUaIKrnB8xgMQRz7dxhVan8ksC1ntJDVz
 nP8ptawUhIQNLBJy3wrwgQw8ICnMavs1Xaxtm3EbhPYdv2K6ih9O0w/BJ
 UpZSq3W4P7jwPfYhHpY/YGOur69tWmDI/Gav+LwHjq9nb4vZvT7UzXLV4
 DP8mZjf/Kl2xk8XqtvChtVnWXHVLK+sfFiiBilVfPMoWQYQHLs9/ym/EV
 /PNyBJ8PKpAHVnk5enAfGLi4s5wZLTmFnuSS1mz6U/hTsSDgs3z3V1dfA Q==;
X-CSE-ConnectionGUID: 5iGcTL3OTQGYoFos0E6wYg==
X-CSE-MsgGUID: 77IO1pU6QKKmTfnfgV4s7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78780561"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78780561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:44:53 -0700
X-CSE-ConnectionGUID: oNZ6on2FRMuDS3XU/8eL5w==
X-CSE-MsgGUID: FKFxPFNYT5K5nJx/He9QnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="239964069"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:44:52 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v5 0/2] Wa_14026633728
Date: Wed,  6 May 2026 08:14:41 +0530
Message-ID: <20260506024443.612636-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series introduces Wa_14026633728. For it's introduction, changes
are made in lib/intel_wa to ensure we check from debugfs whether a
workaround is enabled via the KMD or not.

v1: Add workaround patch.
v2: Fix commit title, description and code description.
v3: Check if the wa exists and reuse it, also, fix a warning for C90
rule.
v4: Introduce changes in lib/intel_wa to ensure we are properly checking
the debugfs file for the workaround.
v5: Fix commit message and description for the first patch which adds
the change to check a device workaround. Also, drop > 0 condition from
the oa_exponent check in the second patch.

Shekhar Chauhan (2):
  lib/intel_wa: Check for device workarounds
  tests/intel/xe_oa: Wa_14026633728

 lib/intel_wa.c      | 40 ++++++++++++++++++++++++++--------------
 tests/intel/xe_oa.c | 12 ++++++++++--
 2 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.53.0

