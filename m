Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5672412B04B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 09:44:53 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue, 28 Jun 2022 11:44:28 +0200
Message-Id: <20220628094435.854519-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] Add the --environment flag
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

This series adds a new flag/argument to the igt_runner, --environment.

It sets the provided KEY=VALUE pair as the environment variable for
executed test processes. If just the KEY is provided, the currently-set
value is reused (and the run fails if it's not set for the runner).

The most important thing about this feature is that all the variables
set this way are saved for resumed runs as well. This lets developers
easily try something out from the terminal without having to remember
to set the same vars/reuse a wrapper to continue a run.

Ryszard Knop (7):
  runner: rename free_settings to clear_settings
  runner: make the usage function variadic
  igt_list: Add the igt_list_empty_or_null helper
  runner: Add the --environment flag
  runner: Serialize the provided environment flags
  runner: Set requested env vars during execution
  runner: Add help for the --environment flag

 lib/igt_list.c        |   5 +
 lib/igt_list.h        |   1 +
 runner/executor.c     |  10 +-
 runner/resultgen.c    |   2 +-
 runner/runner_tests.c |  12 +-
 runner/settings.c     | 385 ++++++++++++++++++++++++++++++++++--------
 runner/settings.h     |  15 +-
 7 files changed, 350 insertions(+), 80 deletions(-)

-- 
2.36.1
