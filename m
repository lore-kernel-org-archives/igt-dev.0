Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B5EC021A2
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F372C10EBB5;
	Fri,  7 Feb 2025 23:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ajbmr0sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258BA10E335
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F2egTIJ+kvBI57u3nW5TloWODVa/8m+GSSzz+gZp6ZM=;
 b=Ajbmr0sgfB1LZzrp1b8YjEguXVz5mU8wIYDJ5Lt1SE/48b8avrgw+7be
 ERICVG6cqPdGe/rYo58d/x21tQURD9/D/JztF1nKvJlqMRVtlljRETlN7
 hDyi5WTv6bgmOlaUvLVoNRhR5rywq/hFxEJPnmLfwl12qvo+QrEdbPOX8
 qJywAB0NvKJcRBzIWg8wRDkNiR7TBxRyG8sP2aGa36dBp3anqlEEXV6v2
 dU1wHZA940HCBOX42aV0dbOx3hrzieVqG7nbLh8suvcn/5iOF9L5edEZ2
 4gpHtXF61bREf6eCg6OsRm67wcusNHeOWfMSGgHjQ/GTdYlSKOOhepFJS Q==;
X-CSE-ConnectionGUID: MxgHpx1hTJuntZu0HJWjTQ==
X-CSE-MsgGUID: ZWa6JEGwSdiCA8VQ/2I3cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281769"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281769"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: oFQI+SgBRhuCEh1JSWSxlA==
X-CSE-MsgGUID: bcIH6aLqQpSbMnNNpskjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425853"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 00/10] Add igt_runner's cmdline to results
Date: Fri,  7 Feb 2025 15:09:34 -0800
Message-ID: <20250207231039.2883195-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

CI: minor adjustements. Let's make sure it passes CI.

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
 runner/runner_tests.c                         |   1 +
 runner/settings.c                             | 277 ++++++++++++++----
 runner/settings.h                             |   4 +
 28 files changed, 257 insertions(+), 64 deletions(-)

-- 
2.48.1

