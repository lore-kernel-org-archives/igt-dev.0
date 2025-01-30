Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AD8C02194
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3040A10E36D;
	Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crzRIBCI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B3610E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ChvVqu22ICsC03xA1OKgFeefU6XMYnzsmWCZ7PM3EjY=;
 b=crzRIBCIK4vh1z3mfDM9fg9wMF0qgo1nhGggkzGoaW9LC8QDmFPc7iCn
 bGY/6ZqyWAz9Jud/2lDs1C6F3VnXW2ZfSsSU+RD/pvsI7Ii7lgOuoe4Iw
 eVBCwE3LZ5J5IJdqXtLV4Vq/jEH+Txuymi9NN4iT87lchXhj8pnr1x/9D
 PlaZ0GFcY0khnZViKzK+3CuHQmHqo02vZ6CVc5II5l3wHL9DpxgjrDzer
 ILk0xa0hvVTtnABTkqOi6J8gR6Fgnk1zEm6lAjpeLsiYM2e7bwMf/Flmm
 wRu5jY6xfpLWgrSaHOzlhpC+hDONx0Rx/e4XD7KRr81b+LoyHLTjaPQzy g==;
X-CSE-ConnectionGUID: 75IzRzb0RXek8lCwlSa1oQ==
X-CSE-MsgGUID: rNfoHugkSMSzaOJmv5AYjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567067"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567067"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:11 -0800
X-CSE-ConnectionGUID: WLg/BZx+T5muSK3GXZiqrg==
X-CSE-MsgGUID: +rSrWS4TR6aPzB6vksnzpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539641"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 00/10] Add igt_runner's cmdline to results
Date: Thu, 30 Jan 2025 09:21:39 -0800
Message-ID: <20250130172149.3657144-1-lucas.demarchi@intel.com>
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

v3:
  - Better split patches and reword commit messages according to reviews
    by Gustavo and Peter
  - Add generic escape/unescape functions to be used for metadata.txt.
    Besides preparing for cmdline, it fixes other uses of \n.
  - Provide a single macro to parse array, which adds the proper code
    to parse both the array items and the length

Lucas De Marchi (10):
  runner/settings: Fix code_coverage_script leak
  runner: Free settings at the end
  runner/settings: Deduplicate cleanup
  runner/settings: Use wrapper macros for each type
  runner/settings: Match serialization to parse
  runner/settings: Drop extra strdup
  runner: Fix use of newline on arguments
  runner/settings: Add helpers to serialize/parse array
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
 runner/settings.c                             | 272 ++++++++++++++----
 runner/settings.h                             |   4 +
 27 files changed, 250 insertions(+), 65 deletions(-)

-- 
2.48.0

