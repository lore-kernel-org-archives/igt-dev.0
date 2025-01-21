Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC44C0218B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 22:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7503510E64D;
	Tue, 21 Jan 2025 22:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivdi2XhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69FD10E1FF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737500272; x=1769036272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=38QKS+LcNIEmVzQ7xtdYAVo2uchTZ8Jw9PxClmyxM/o=;
 b=ivdi2XhSGy7d/Epr1VBWvICeLW1CqaXFcPh5kJZb/snWl94d4d8TZOmT
 Y3iF30srwrg1myDOZmUvmQHffPIkHJLEPrQ2hYPGKgWvkEmPQfmRLigMd
 jrIjf2AljpT4gXvHqj79ecQ5LszY8QZY5Dnn6+Zt0wQFiZCLfO5YIXIlk
 FTRz/QEt0AR3JqAQrKCJPy3bbVhjqpiu8XysZYh8LhRy5I2y125K4jOS1
 7rGRW07pPPhsOSpFc3FkNCyRyYIovD90EmLA9SdeE1FAgNNx59I7yQvw5
 dGEEK0SCyF7szLKVxcJLmfE9ZtYiwqipZVd02kZYz+DT2X2NSejw+OHmr A==;
X-CSE-ConnectionGUID: cf5DI0fZQcKEJS/AFw/jwQ==
X-CSE-MsgGUID: aVd1t9coRiWWbceDKVCWZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55352722"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="55352722"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
X-CSE-ConnectionGUID: yn5TsQ6nQxq0w7SryGoIZA==
X-CSE-MsgGUID: /9Km0COBSraZUeKYReMGkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="111933663"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 14:57:52 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 0/7] Add igt_runner's cmdline to results
Date: Tue, 21 Jan 2025 14:57:26 -0800
Message-ID: <20250121225733.808978-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Help devs to reproduce what CI is running by dumping what is the command
line being used. While it's true that in the shard case we don't have
the testlist, just seeing the right incantation of command line is a
great improvement.

I plan to follow this with the env vars, but first want to get this
in. It seems we already have an environment.txt saved, however that
doesn't contain the igt_runner's env, only options passed via -e to
igt_runner which is then forwarded to each test. I'm wondering if this
is a source of bugs when using igt_resume:  if the environment doesn't
match, it will run with different options on each execution. (answer:
yes, it is a source of bugs if the exact environment is not re-created
for running igt_resume)

v2:
  - Fix more leaks as prep commits
  - Fix leaking argv that got lost in all other pre-existent leaks
  - Add dummy array to the reference.json files so it passes runner's
    own tests.

Lucas De Marchi (7):
  runner/settings: Deduplicate cleanup
  runner/settings: Use wrapper functions for each type
  runner/settings: Drop extra strdup
  runner/settings: Fix code_coverage_script leak
  runner: Free settings at the end
  runner/settings: Serialize command line
  runner/resultgen: Add cmdline to results.json

 .../aborted-after-a-test/reference.json       |   1 +
 .../aborted-on-boot/reference.json            |   1 +
 .../dmesg-escapes/reference.json              |   1 +
 .../dmesg-results/reference.json              |   1 +
 .../reference.json                            |   1 +
 .../reference.json                            |   1 +
 .../dmesg-warn-level/reference.json           |   1 +
 .../reference.json                            |   1 +
 .../dynamic-subtests-keep-all/reference.json  |   3 +-
 .../reference.json                            |   1 +
 .../reference.json                            |   3 +-
 .../reference.json                            |   3 +-
 .../empty-result-files/reference.json         |   1 +
 .../graceful-notrun/reference.json            |   1 +
 .../reference.json                            |   1 +
 .../json_tests_data/normal-run/reference.json |   1 +
 .../reference.json                            |   1 +
 .../notrun-results/reference.json             |   1 +
 .../piglit-style-dmesg/reference.json         |   1 +
 .../unprintable-characters/reference.json     |   1 +
 .../warnings-with-dmesg-warns/reference.json  |   1 +
 .../json_tests_data/warnings/reference.json   |   1 +
 runner/resultgen.c                            |   7 +-
 runner/resume.c                               |   2 +
 runner/runner.c                               |   2 +
 runner/settings.c                             | 130 +++++++++++++-----
 runner/settings.h                             |   5 +
 27 files changed, 136 insertions(+), 38 deletions(-)

-- 
2.48.0

