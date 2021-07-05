Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FA789B49
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jul 2021 05:09:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon,  5 Jul 2021 18:26:14 +0530
Message-Id: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Limit the HANG tests to two pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

To save the CI execution time, instead of running on all pipes
restrict the hang tests execution to two pipes (first & last).

If we want to execute on all pipes, we need to pass an extra
argument "-e" indicates extended.

Example: ./build/tests/kms_flip -e --r flip-vs-modeset-vs-hang

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Bhanuprakash Modem (3):
  tests/kms_busy: Limit the execution to two pipes
  tests/kms_flip: Restrict the hang tests execution to two pipes
  tests/intel-ci: Remove hang tests from pre-merge blacklist

 tests/intel-ci/blacklist-pre-merge.txt |  39 -------
 tests/kms_busy.c                       | 149 +++++++++++++++----------
 tests/kms_flip.c                       |  30 ++++-
 3 files changed, 119 insertions(+), 99 deletions(-)

--
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
