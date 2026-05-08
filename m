Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241A9CD3427
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 02:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF8210E2D6;
	Fri,  8 May 2026 02:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6CwIStM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97B410E2D6
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 02:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778206417; x=1809742417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4zyq50lhesrnn0DiFuWigQEEdguAF4yksgcR3UWT0J0=;
 b=D6CwIStMi8w7LYv5hJjl7AX/rpI7efsW3uiM41Gn/w6k3SGPz+gB01KQ
 7U5G8Oy9Hdv1DOiAPlDkc0jn+9hTaRZFYw88U3WmrwsKEAN/Du65hMrbn
 JGGz8YkFOGgYhU0BBSJe2Hz20H4z+KwueapVzmhm/To+VLtOE47cXjjcr
 /1XGCVsJbkgdcmrY33V81uKscMFoprXyqK21hScubqAMMxeEqRvDJYXts
 78hVr1+gCSWkX17YaEoEuaqtvQp+iCDrElWw7YA7DGRMYtcXlc0016owp
 o+GytRKOJojsUlrM3QZw422+Izi5gNv1GXCFD4UxPkASb3JNKZzvr+BcS A==;
X-CSE-ConnectionGUID: V1w1xwI+SdCnJaQhTIFYjg==
X-CSE-MsgGUID: d5o3gJuEQ3C26S8U05ANpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90633025"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="90633025"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 19:13:36 -0700
X-CSE-ConnectionGUID: SQY/bcDUQ+CkDhEn4S2gyg==
X-CSE-MsgGUID: nxrEX6sXSpa9MRD4dL3afw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="241615615"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 19:13:35 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v7 0/2] Wa_14026633728
Date: Fri,  8 May 2026 07:43:27 +0530
Message-ID: <20260508021329.876072-1-shekhar.chauhan@intel.com>
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
v4: Moved from a single patch to a series of 2 patches, made a mistake
on the numbering. After v3, v5 follows.
v5: Introduce changes in lib/intel_wa to ensure we are properly checking
the debugfs file for the workaround.
v6: Roll back to original design for increasing oa_exponent to keep it
simple.
v7: Removed a comment and fixed tabs vs spaces issue in xe_oa test.

Shekhar Chauhan (2):
  lib/intel_wa: Check for device workarounds
  tests/intel/xe_oa: Wa_14026633728

 lib/intel_wa.c      | 40 ++++++++++++++++++++++++++--------------
 tests/intel/xe_oa.c | 13 +++++++++++++
 2 files changed, 39 insertions(+), 14 deletions(-)

-- 
2.53.0

