Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833F310E3CA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 14:19:03 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.1.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A2ED5580E5D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 07:19:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qvIFF-000fqe-38
 for igt-dev@lists.freedesktop.org; Tue, 24 Oct 2023 16:18:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Oct 2023 16:11:03 +0200
Message-ID: <20231024141855.160633-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] better sync test_list.py with igt_runner
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

This patch series comes after:
	https://patchwork.freedesktop.org/series/125401/

(The three patches from it were added here, to allow CI to test
the new patches)

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

Mauro Carvalho Chehab (4):
  igt_runner: don't require root for dry_run
  scripts/test_list.py: better handle list of tests
  runner/job_list: use case-insensitive regular expressions
  runner/runner_tests: change a regex to match case-insensitive

Petri Latvala (3):
  runner: Normalize testlist entries that don't list subtests
  runner/runner_tests: Unit tests for binary-name-only testlist entries
  runner/runner_tests: Fix name of no-subtests in unit tests

 runner/job_list.c                | 22 +++++++++-
 runner/runner_tests.c            | 74 +++++++++++++++++++++++++++++++-
 runner/settings.c                |  3 +-
 scripts/test_list.py             | 54 ++++++++++++++++-------
 tests/intel/kms_test_config.json |  2 +-
 tests/intel/xe_test_config.json  |  1 +
 6 files changed, 136 insertions(+), 20 deletions(-)

-- 
2.41.0
