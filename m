Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A299610E62A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:19:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 13:41:49 +0530
Message-Id: <20230825081153.883708-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/4] Add XE support for Async flip tests
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

Add XE support for Async flip tests

Bhanuprakash Modem (4):
  tests/kms_async_flips: Add XE support
  tests/i915/kms_big_fb: Fix testplan documentation
  tests/intel-ci: Drop async flip tests from xe blocklist
  HAX: Add Async flips to XE BAT

 tests/i915/kms_big_fb.c                  | 13 ++++++--
 tests/intel-ci/xe-fast-feedback.testlist | 38 ++++++++++++++++++++++++
 tests/intel-ci/xe.blocklist.txt          |  1 -
 tests/kms_async_flips.c                  | 12 ++------
 4 files changed, 52 insertions(+), 12 deletions(-)

--
2.40.0
