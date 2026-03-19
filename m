Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491131091916
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 21:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8510E15A;
	Thu, 19 Mar 2026 21:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iez9SiIw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4507E10E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 21:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773957090; x=1805493090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X/gE9LJUwAxPLxorxvsEpNBRbbFCJlu+F2XoM8vo9TE=;
 b=Iez9SiIwOkWmy/aUSK+gHhUf+4guWiSREWYajJ26L42AXM6NwsTGHgKJ
 XnaqsaAmj22BPoSE4CMQChAhYUwXlfdc2o2QV/KWB5Z9OxwzbRa+WDUlB
 bjXC5SU30b2wtqCTzDctU92mJY70eulGCgvGr0v1GBNKGlySuEyextfDs
 sVFOdsQL+67og8GfXGcod/K3wOjVGkCo6oh4IYy9ozofYaZ71YiKu1dC0
 7N3u1Aa4NjGZnt3x0u75kw0kX2y9iOFhsVinGTRg2cHWdiEyyDXI687BE
 80g4ejdg6mNlMxRu6HjldarwjktCSCBGUW/VetHS2Mn2/mLCHbzN/DlFz w==;
X-CSE-ConnectionGUID: jbWi3fYwQ/2UNr7pEqjNFA==
X-CSE-MsgGUID: 5UwLHfa6SU2Dcctft8YXZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75010849"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75010849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:30 -0700
X-CSE-ConnectionGUID: qylu0L7PQZmgIydQNPppwg==
X-CSE-MsgGUID: w0QXKODZR+eDJpPeA6By0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253576810"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:51:28 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t 0/4] RFC: Add attachments support
Date: Thu, 19 Mar 2026 22:51:25 +0100
Message-ID: <20260319215124.2066611-6-zbigniew.kempczynski@intel.com>
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
wants to attachments directory and if naming contract will be fulfiled
content in base64 form will be included in appropriate subtest/dynsubtest
results.json part.

Series targets our need to include guc logs for failed tests especially
in the point of time when it occurs. Problem which needs to be addressed
with this series attitude is copying guc logs is time consuming process.
One of potential solution might be to just do copy of guc logs for
predefined list of tests we're interested with, or skip doing this for
some tests.

Any input how we can make this better is welcome.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Zbigniew Kempczyński (4):
  runner: Rename dirfd to avoid clash with dirfd()
  runner: Create attachments directory to use by hooks
  runner: Add attachments directory content in subtests results
  scripts/hooks: Example guc log copy script to attachments dir

 lib/igt_hook.c                    |  4 ++
 runner/executor.c                 | 27 ++++++---
 runner/executor.h                 |  2 +
 runner/resultgen.c                | 98 +++++++++++++++++++++++++++++++
 scripts/hooks/guc_copy_on_fail.sh | 24 ++++++++
 5 files changed, 148 insertions(+), 7 deletions(-)
 create mode 100755 scripts/hooks/guc_copy_on_fail.sh

-- 
2.43.0

