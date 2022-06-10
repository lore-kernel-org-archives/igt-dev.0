Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE4411AC23
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 09:15:38 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Fri, 10 Jun 2022 14:41:50 +0530
Message-Id: <20220610091153.4089928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/3] tests/kms_pipe_crc_basic: IGT test cleanup
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

Convert all possible subtests to dynamic and sanitize the system
statte before starting/exiting the subtest. This series will also
rename the tests in BAT with updated ones.

Bhanuprakash Modem (3):
  tests/kms_pipe_crc_basic: Convert tests to dynamic
  tests/kms_pipe_crc_basic: Test Cleanup
  tests/intel-ci: Rename kms_pipe_crc_basic subtests in BAT

 tests/intel-ci/fast-feedback.testlist |  19 ++-
 tests/kms_pipe_crc_basic.c            | 162 +++++++++++++++-----------
 2 files changed, 104 insertions(+), 77 deletions(-)

--
2.35.1
