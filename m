Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DB110E267
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 09:52:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.2.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 118D3580699
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 02:52:10 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qxOwJ-000S7v-3B
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 10:52:07 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 10:49:55 +0100
Message-ID: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/7] better sync test_list.py with
 igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This patch series contains the patches from:
	https://patchwork.freedesktop.org/series/125401/

It contains some additional changes meant to sync how IGT
runner, documentation tools and CI works with regular expressions:

- the IGT runner regular expressions are now case-insensitive.
  As there are several KMS tests have upper case letters to indicate
  port entries. There's no sense of having tests named:
  igt@foo-port-A being different than igt@foo-port-a. One of
  the runner tests were changed to only match if case is not
  sensitive on regular expressions;

- when igt_runner is in dry-run mode, it doesn't need root
  permissions;

- currently, test_list.py is considering testlists as regular
  expressions, but they're really a normal list of tests.
  Change the logic to handle it accordingly.

---

v2:
  - instead of modifying a test for case-insensitive regex, add a
    new subtest.

Mauro Carvalho Chehab (4):
  igt_runner: don't require root for dry_run
  scripts/test_list.py: better handle list of tests
  runner/job_list: use case-insensitive regular expressions
  runner/runner_tests: add a test to check case-insensitive match

Petri Latvala (3):
  runner: Normalize testlist entries that don't list subtests
  runner/runner_tests: Unit tests for binary-name-only testlist entries
  runner/runner_tests: Fix name of no-subtests in unit tests

 runner/job_list.c                | 22 ++++++-
 runner/runner_tests.c            | 99 +++++++++++++++++++++++++++++++-
 runner/settings.c                |  3 +-
 scripts/test_list.py             | 54 ++++++++++++-----
 tests/intel/kms_test_config.json |  2 +-
 tests/intel/xe_test_config.json  |  1 +
 6 files changed, 161 insertions(+), 20 deletions(-)

-- 
2.41.0
