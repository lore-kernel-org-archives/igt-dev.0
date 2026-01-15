Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A99D46607
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 17:58:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7721810E7BB;
	Thu, 15 Jan 2026 17:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbAvx55A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937B210E7BB
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 17:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768499899; x=1800035899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sRPutV/fsODPwzdB5v+PWUc8iK5fRX5iD7Mjwn7JXmQ=;
 b=IbAvx55AQ5zL4h6MY0TUQ0CgkXfH34u8XgpQYPjdj4BOk9Ap/CaCnjky
 q7SIfXXA52FIimZXWr6LSf9o1YLfyEhD7LkNYL5DSaixQ8r4iVJs/fgfv
 qw28hn2ebM+MgtlO+Bvloc0qKwxrlTJVVadgKSyXCrECME/TdpDh7Qw95
 sp/r1BSDZ4OOwJXsB5PeleeWtZ1PIJ7Htusj1hTWYnuyogm/HKh4khZdR
 BaO2mUNt3QxgWfV+NB0Gg3CjdGyjwxU1rs7jEysGcFRCqS/wCJwE4pqqT
 uwzoonft4Y0eAJ9gipiSWF8mR8zjq2Ewfaa1H85JuNdsqd0OuWpIYaWE1 g==;
X-CSE-ConnectionGUID: uc7lM6zOSGKm17IvyjQadw==
X-CSE-MsgGUID: YRXlCYLaRYqRlsDiLfGpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69017160"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69017160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:19 -0800
X-CSE-ConnectionGUID: EEmYlF9ETdulR88/ow5aTQ==
X-CSE-MsgGUID: uXbv1Lf7SEuXhVoANXlYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204627152"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.58])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:58:15 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>,
 Piotr Kira <piotr.kira@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>
Subject: [PATCH i-g-t v1 0/4] Runner: Use Jansson instead of json-c
Date: Thu, 15 Jan 2026 18:58:06 +0100
Message-ID: <20260115175811.179898-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

      The json-c library has a hard limit of 2GB of its output.
While normally it's not a problem, some very verbose edge cases
make the results.json output go past that limit.

This series converts igt_runner's json-c usage to Jansson.

This is a rebase and code style cleanup of series sent by Ryszard
https://patchwork.freedesktop.org/series/107123/
Use Jansson instead of json-c in igt_runner

v2: rebase on top, cleanups, added licence in python script,
 changed Dockerfiles (Kamil)

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: "Juha-Pekka Heikkilä" <juhapekka.heikkila@gmail.com>
Cc: Mateusz Grabski <mateusz.grabski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Cc: Piotr Kira <piotr.kira@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tvrtko Ursulin <tursulin@igalia.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>

Kamil Konieczny (1):
  Dockerfile.build: Replace json-c with jansson

Ryszard Knop (3):
  runner: Use Jansson in resultgen instead of json-c
  runner/tests: Fix JSON test data
  runner: Add an on-demand test for large files

 Dockerfile.build-debian                       |   2 +-
 Dockerfile.build-debian-arm64                 |   2 +-
 Dockerfile.build-debian-armhf                 |   2 +-
 Dockerfile.build-fedora                       |   2 +-
 .../aborted-after-a-test/reference.json       |   6 +-
 .../aborted-on-boot/reference.json            |   4 +-
 .../dmesg-escapes/reference.json              |   8 +-
 .../empty-result-files/reference.json         |   4 +-
 .../graceful-notrun/reference.json            |   6 +-
 .../reference.json                            |   2 +-
 .../reference.json                            |   2 +-
 .../notrun-results/reference.json             |   2 +-
 .../really-large-files/.gitignore             |   3 +
 .../really-large-files/0/dmesg.txt            |   0
 .../really-large-files/0/err.txt              |   0
 .../really-large-files/0/journal.txt          |   0
 .../really-large-files/0/out.txt              |   1 +
 .../really-large-files/README.txt             |   7 +
 .../really-large-files/SKIP_ME                |   1 +
 .../really-large-files/endtime.txt            |   1 +
 .../really-large-files/generate_data.py       |  23 ++
 .../really-large-files/joblist.txt            |   1 +
 .../really-large-files/metadata.txt           |  12 +
 .../really-large-files/reference.json         |  62 +++
 .../really-large-files/starttime.txt          |   1 +
 .../really-large-files/uname.txt              |   1 +
 runner/meson.build                            |  10 +-
 runner/resultgen.c                            | 384 +++++++++---------
 runner/resultgen.h                            |   2 +-
 runner/runner_json_tests.c                    | 137 +++----
 runner/runner_tests.c                         |  61 +--
 31 files changed, 411 insertions(+), 338 deletions(-)
 create mode 100644 runner/json_tests_data/really-large-files/.gitignore
 create mode 100644 runner/json_tests_data/really-large-files/0/dmesg.txt
 create mode 100644 runner/json_tests_data/really-large-files/0/err.txt
 create mode 100644 runner/json_tests_data/really-large-files/0/journal.txt
 create mode 100644 runner/json_tests_data/really-large-files/0/out.txt
 create mode 100644 runner/json_tests_data/really-large-files/README.txt
 create mode 100644 runner/json_tests_data/really-large-files/SKIP_ME
 create mode 100644 runner/json_tests_data/really-large-files/endtime.txt
 create mode 100644 runner/json_tests_data/really-large-files/generate_data.py
 create mode 100644 runner/json_tests_data/really-large-files/joblist.txt
 create mode 100644 runner/json_tests_data/really-large-files/metadata.txt
 create mode 100644 runner/json_tests_data/really-large-files/reference.json
 create mode 100644 runner/json_tests_data/really-large-files/starttime.txt
 create mode 100644 runner/json_tests_data/really-large-files/uname.txt

-- 
2.52.0

