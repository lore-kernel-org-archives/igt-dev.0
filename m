Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71716F557EC
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 08:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EF110F4A6;
	Mon, 20 Apr 2026 08:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnN/SWUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6BD10F4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776675419; x=1808211419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rCdpIJnoTJkcSO9YMYlvewg+b4NOnSKmQLAMtA2gI1U=;
 b=LnN/SWUNTAf6+If1Pc61K7cmgWxkUAQlN6P3aJR4nhZi0OHJ6DNf5KaO
 BctIfF2ArNQpG3v7jEI6FgrLZusH1rdf40FA1l0JHzMjAW/6bG5V8G5C0
 9yZRGLLHRh1ZxXRHrAIqdearCU4h+4nwHAQdq4I/TDMHMQ/QUGEuJYexF
 ioiC9dbNIw3iliBYXdAcqfVixo0dhUlpfgH78D6bUmkFBgX5/JmgNLk5S
 2bV6c19LAKsKDLNlFqqcGf3/Luu8zMDmBK2yA0C9/A/JPrxytmN37ROa3
 ISm7d46fQa4NpSYdf53RIDxibaaPrHTBnBx9sMn2syMnFjEH1Yws4VaZ8 w==;
X-CSE-ConnectionGUID: TFudNKCDQ32ZYxqBcRK7BA==
X-CSE-MsgGUID: JuoTvLYJQ/GOgh1oLsM1PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88659033"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="88659033"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:56:58 -0700
X-CSE-ConnectionGUID: pnMLrnxARbuMtah0BrRT9A==
X-CSE-MsgGUID: xbDtRGqXRjK8gWHTxR1fRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="269705425"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:56:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v4 0/4] RFC: Add attachments support
Date: Mon, 20 Apr 2026 10:56:54 +0200
Message-ID: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series introduces support for hook/test written attachments.
It is somehow limited and stiff but allows to write anything test/hook
wants in attachments directory. File names which occured in attachments
directory are added to results.json.

Series targets our need to include guc logs for failed tests especially
in the point of time when it occurs.

v2: - added clearing of attachments dir in overwrite mode
    - guc-log hook script is now installed to igt datadir/hooks dir
    - added hook-exec-allowlist to selectively execute hook scripts
v3: - drop hook-exec-allowlist in runner, now scripts are filtering
      allowlist on their own
    - add support for attachments in recursive directories
v4: - change clear results to use path (used then in nftw())
    - introduce hooks-wrapper.sh, common helper for hooks scripts
    - replace if/else to switch/case

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
 runner/executor.c                             | 89 +++++++++++++++----
 runner/executor.h                             |  2 +
 runner/resultgen.c                            | 79 ++++++++++++++++
 tests/intel-ci/hooks/common.helper            | 47 ++++++++++
 .../hooks/copy_guc_log_on_fail.allowlist      |  2 +
 tests/intel-ci/hooks/copy_guc_log_on_fail.sh  | 24 +++++
 tests/intel-ci/hooks/hook-example.allowlist   |  2 +
 tests/intel-ci/hooks/hook-example.sh          | 17 ++++
 tests/intel-ci/hooks/hooks-wrapper.sh         | 12 +++
 tests/intel-ci/meson.build                    | 11 +++
 11 files changed, 271 insertions(+), 18 deletions(-)
 create mode 100755 tests/intel-ci/hooks/common.helper
 create mode 100644 tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
 create mode 100755 tests/intel-ci/hooks/copy_guc_log_on_fail.sh
 create mode 100644 tests/intel-ci/hooks/hook-example.allowlist
 create mode 100755 tests/intel-ci/hooks/hook-example.sh
 create mode 100755 tests/intel-ci/hooks/hooks-wrapper.sh

-- 
2.43.0

