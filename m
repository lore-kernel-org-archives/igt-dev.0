Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12CBCD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 07:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B145112F21;
	Mon,  1 Jun 2026 07:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lYz1PCN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D77E112F21
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780300311; x=1811836311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aGP4Cs66mPTjD1Mt918aBy8yb7e+tB160r+Gyu+Cqro=;
 b=lYz1PCN6odIJZq7KmDz1fuKEUMzWvf7fgAOoHl2nE3/sa9s0Z0vsOmqY
 jsdtQVjM6EG504b8WDgLESiym1wRqOjuvDGhwGXLpuPfWm2w6sDKVfoPp
 1/aMieFLUSOHz3MUpiFJkBoVWZMu/XJU2wJCIdXDOhwC9SdT2mNnaAeVt
 gB57qCy13yazLs//Ef+PRzjjX3NrvbKt8A1mGZGNzUDhhMIInl7HnZUoR
 LJleNtmUonDN8uV4qZ9+eQ147jxjkYMJoALIup9Ekr2/WluVZvy91i2jU
 a6UD83eh7IBHdVJZ/zt3JJAQ68G0Q0CBfE2Ndsj9AkqIT6k4bTp18HYEA A==;
X-CSE-ConnectionGUID: FKA9JsUbT1uQ1NR4RS7eXg==
X-CSE-MsgGUID: 3pCZeRaGTYy9POGn5QtXng==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="98618971"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="98618971"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:51:50 -0700
X-CSE-ConnectionGUID: s5XB+MINTJ6PIYrloRpLvw==
X-CSE-MsgGUID: e2+lOCSuQhenQ55kyEpi8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243331915"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:51:49 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 0/4] Add attachments support
Date: Mon,  1 Jun 2026 09:51:44 +0200
Message-ID: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
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

Series introduces support for hook/test written attachments.

It is somehow limited and stiff but allows to write anything test/hook
wants in attachments directory. File names which occurred in attachments
directory are added to results.json as well as absolute path to
attachment directory.

Series targets our need to include guc logs for failed tests especially
in the point of time when it occurs.

v2: verify getcwd() doesn't fail
v3: comment nftw() processing and add guc_info copy

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>

Zbigniew Kempczyński (4):
  runner: Rename dirfd to avoid clash with dirfd()
  runner: Create attachments directory to use by hooks
  intel-ci/hooks: Add hooks-wrapper and aux scripts/allowlists
  runner/resultgen: Insert attachments list into results.json

 lib/igt_hook.c                                |  4 +
 runner/executor.c                             | 88 +++++++++++++----
 runner/executor.h                             |  2 +
 runner/resultgen.c                            | 96 +++++++++++++++++++
 tests/intel-ci/hooks/common.helper.sh         | 53 ++++++++++
 .../hooks/copy_guc_log_on_fail.allowlist      |  2 +
 tests/intel-ci/hooks/copy_guc_log_on_fail.sh  | 24 +++++
 tests/intel-ci/hooks/hook-date.allowlist      |  2 +
 tests/intel-ci/hooks/hook-date.sh             | 18 ++++
 tests/intel-ci/hooks/hooks-wrapper.sh         | 15 +++
 tests/intel-ci/meson.build                    | 11 +++
 11 files changed, 297 insertions(+), 18 deletions(-)
 create mode 100755 tests/intel-ci/hooks/common.helper.sh
 create mode 100644 tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
 create mode 100755 tests/intel-ci/hooks/copy_guc_log_on_fail.sh
 create mode 100644 tests/intel-ci/hooks/hook-date.allowlist
 create mode 100755 tests/intel-ci/hooks/hook-date.sh
 create mode 100755 tests/intel-ci/hooks/hooks-wrapper.sh

-- 
2.54.0

