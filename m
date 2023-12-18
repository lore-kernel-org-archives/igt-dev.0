Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB1910E370
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:43:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v3 0/9] tests/kms_vrr: Modify kms_vrr to allow flicker
 profiling
Date: Mon, 18 Dec 2023 13:51:58 +0530
Message-Id: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Do some cleanup in the kms_vrr test and add some optional command line
arguments to alter the target refresh rate for the test. This allows us
to profile VRR flicker on panels at the low end of the refresh range.
This series also adds a new 'maxmin' subtest which alternates the rate
between max and min every frame.

V2:
- Address the review comments from Bhanu
- Add a new maxmin subtest which alternates the rate b/w max & min every frame.

V3: As communicated in IRC channel #igt, I am doing this revision on behalf of
Sean Paul.
- Rebase
- Add testplan documentaion for 'maxmin' subtest
- Minor cleanups
- Hax patch to test VRR in BAT

Bhanuprakash Modem (1):
  HAX/DO_NOT_MERGE: Test VRR only in BAT

Sean Paul (8):
  tests/kms_vrr: Move fb0 and fb1 to an array
  tests/kms_vrr: Move vtest_ns into data_t
  tests/kms_vrr: Allow test rate to be altered from the command line
  tests/kms_vrr: Allow test duration to be specified from the command
    line
  tests/kms_vrr: Change the pattern displayed in the test
  tests/kms_vrr: Add ability to flip static image for flicker profiling
  tests/kms_vrr: Allow for multiple rates in a test
  tests/kms_vrr: Add a max/min test to oscillate between rates

 tests/intel-ci/fast-feedback.testlist    | 181 +--------------
 tests/intel-ci/xe-fast-feedback.testlist | 269 +----------------------
 tests/kms_vrr.c                          | 241 ++++++++++++++------
 3 files changed, 186 insertions(+), 505 deletions(-)

--
2.40.0
