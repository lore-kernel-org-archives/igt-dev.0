Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63978F8925C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 11:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95D710E1A1;
	Tue, 21 Apr 2026 11:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRK26miT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01E110E1A1
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776770236; x=1808306236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l8s0EQpB3XRfffW6tneVfToZ5TIAI6wzE/IsvFBtfKc=;
 b=eRK26miTFq3L6y51gBJeRp9ZVFOyPmsLAkupwxZAzEEfBknKXoLjgQJC
 uo3wHfQzXKeY6K2PGoYOWxsrDwwAzANdJbVVfQOPBvMlEoRaKRJZPwjpA
 /nCopOhON+tw39r++VOESvfzsO9B3mSZxhuVSV/3IFDlofKRT8tB0illE
 sNn7kmMpgsTi7Np4Pk3s/274IolvnCFE2wQ5K+M6JWUJ+hje1qW88usz5
 tQvZ9tvdEFlfshYGgkHf2hIrEXo3SIrBVF88mcOlYz1waDbYeggJzYZyW
 3WwOIsaeC/7QqKRHNIRQ9L4WVYVECrNfikdV/95vaD287LBA23sjnJZpx g==;
X-CSE-ConnectionGUID: cEKykr6nRbab933GdmRoDQ==
X-CSE-MsgGUID: pS3to3eBSpSZhGcBDdwhDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77401505"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="77401505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:15 -0700
X-CSE-ConnectionGUID: BIu2BH/hRjGl55kKilK9PQ==
X-CSE-MsgGUID: ecCA8UGwR/Cove3iK6UhuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="229340681"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 04:17:13 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t 0/4] Add attachments support
Date: Tue, 21 Apr 2026 13:17:10 +0200
Message-ID: <20260421111709.3163253-6-zbigniew.kempczynski@intel.com>
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

Series introduces support for hook/test written attachments.

It is somehow limited and stiff but allows to write anything test/hook
wants in attachments directory. File names which occurred in attachments
directory are added to results.json as well as absolute path to
attachment directory.

Series targets our need to include guc logs for failed tests especially
in the point of time when it occurs.

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
 runner/executor.c                             | 88 +++++++++++++++----
 runner/executor.h                             |  2 +
 runner/resultgen.c                            | 85 ++++++++++++++++++
 tests/intel-ci/hooks/common.helper.sh         | 53 +++++++++++
 .../hooks/copy_guc_log_on_fail.allowlist      |  2 +
 tests/intel-ci/hooks/copy_guc_log_on_fail.sh  | 24 +++++
 tests/intel-ci/hooks/hook-date.allowlist      |  2 +
 tests/intel-ci/hooks/hook-date.sh             | 18 ++++
 tests/intel-ci/hooks/hooks-wrapper.sh         | 15 ++++
 tests/intel-ci/meson.build                    | 11 +++
 11 files changed, 286 insertions(+), 18 deletions(-)
 create mode 100755 tests/intel-ci/hooks/common.helper.sh
 create mode 100644 tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
 create mode 100755 tests/intel-ci/hooks/copy_guc_log_on_fail.sh
 create mode 100644 tests/intel-ci/hooks/hook-date.allowlist
 create mode 100755 tests/intel-ci/hooks/hook-date.sh
 create mode 100755 tests/intel-ci/hooks/hooks-wrapper.sh

-- 
2.43.0

