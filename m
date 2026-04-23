Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307D8F99362
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20BA10F093;
	Thu, 23 Apr 2026 10:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyTCJ6Dc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBDC10F093
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776941720; x=1808477720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hC/1H+2VPHlEd28Tfhh1hzN2Mo7iEKBlT0Sqkqcbl6s=;
 b=TyTCJ6Dcc2bSica3rXu//gYk+5GSd1NPkY8wt5cIWRu7Neq+xQhWQ4RN
 aShm8sBZKWmDhoiM8xeJJc7R6KKckytR+CtWLDPXrN9G1fGny7lz3+ZIE
 a6XPR7hxZ7TcR7+brw5zIUX3G3UI742f//AkJenlkj1PqrEDkVMTS1J9O
 +SQTn0KSp1r9SgvN5rXQkHcaDhhlqwjPm4jzHhPrHplBts7mpDgA+Hk77
 Tv+QfWzSnZsviNBm6+HQOK37/+AWG0sn9NlO6WLV6a07hiL9Pt20S8qGU
 0wt7PfeebujRTFgNSZG0AMcsWnDRlTw1c5vZUqYDsYbBZE55/UuQcLk5Z Q==;
X-CSE-ConnectionGUID: d22WLCJaR86ph/feZ33qEg==
X-CSE-MsgGUID: k6bh/UJ2Q2Oft/eEHsMW7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77889787"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77889787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:55:20 -0700
X-CSE-ConnectionGUID: Wg6yqIgDTO6MPg0dHz1bSw==
X-CSE-MsgGUID: Aysey7QESzqUDkEeBpag7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="256106231"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:55:18 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 0/4] Add attachments support
Date: Thu, 23 Apr 2026 12:55:15 +0200
Message-ID: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
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

v2: verify getcwd() doesn't fail

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
 runner/resultgen.c                            | 84 ++++++++++++++++++
 tests/intel-ci/hooks/common.helper.sh         | 53 +++++++++++
 .../hooks/copy_guc_log_on_fail.allowlist      |  2 +
 tests/intel-ci/hooks/copy_guc_log_on_fail.sh  | 24 +++++
 tests/intel-ci/hooks/hook-date.allowlist      |  2 +
 tests/intel-ci/hooks/hook-date.sh             | 18 ++++
 tests/intel-ci/hooks/hooks-wrapper.sh         | 15 ++++
 tests/intel-ci/meson.build                    | 11 +++
 11 files changed, 285 insertions(+), 18 deletions(-)
 create mode 100755 tests/intel-ci/hooks/common.helper.sh
 create mode 100644 tests/intel-ci/hooks/copy_guc_log_on_fail.allowlist
 create mode 100755 tests/intel-ci/hooks/copy_guc_log_on_fail.sh
 create mode 100644 tests/intel-ci/hooks/hook-date.allowlist
 create mode 100755 tests/intel-ci/hooks/hook-date.sh
 create mode 100755 tests/intel-ci/hooks/hooks-wrapper.sh

-- 
2.43.0

