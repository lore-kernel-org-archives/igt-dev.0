Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB41D10EECD
 for <igt-dev@lists.freedesktop.org>; Fri, 27 May 2022 08:17:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 13:43:49 +0530
Message-Id: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 0/4] runner: Introduce --resolution to
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

Allow finer control of taking default DRM display mode for subtests
instead of taking the preferred mode exposed by the Kernel.

Example:
Eventhough we have an 8K panel, Kernel may expose 4K or lesser mode
as a preferred mode. So all subtests will take this mode as a default
may cause losing the coverage.

This series will set the environment variable based on the user request,
and parse this environment variable in IGT and take the decision to
choose the mode from the available list.

The default is still to take the preferred mode exposed by the Kernel.
Other options are:
 * highest: Choose the mode with highest possible resolution.
 * lowest:  Choose the mode with lowest possible resolution.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (4):
  runner: Introduce --resolution to igt_runner
  runner: Unit tests for the --resolution option
  lib/igt_kms: Add support for --resolution from igt_runner
  HAX: Add debug prints in choosing the default mode

 lib/igt_kms.c         | 61 +++++++++++++++++++++++++++++++++++++++++--
 runner/executor.c     |  3 +++
 runner/runner_tests.c | 36 +++++++++++++++++++++++++
 runner/settings.c     | 47 +++++++++++++++++++++++++++++++++
 runner/settings.h     |  7 +++++
 5 files changed, 152 insertions(+), 2 deletions(-)

--
2.35.1
