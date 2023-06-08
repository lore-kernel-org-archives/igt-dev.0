Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283D110E5DB
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 15:48:01 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Jun 2023 08:47:52 -0700
Message-Id: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t 0/4] gem_ctx_freq: multi-gt support and
 disable efficient freq
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

v2: Move ignore_slpc_efficient_freq to lib/igt_pm.c (Vinay)

Ashutosh Dixit (3):
  lib/igt_sysfs: Don't assert in igt_sysfs_dir_id_to_name
  tests/gem_ctx_freq: Disable SLPC efficient freq for the test
  HAX: Add gem_ctx_freq to BAT testlist

Vinay Belgaumkar (1):
  tests/gem_ctx_freq: Add support for multi-gts

 lib/igt_pm.c                          |  17 +++++
 lib/igt_pm.h                          |   1 +
 lib/igt_sysfs.c                       |   4 +-
 tests/i915/gem_ctx_freq.c             | 105 +++++++++++++++++---------
 tests/intel-ci/fast-feedback.testlist |   1 +
 5 files changed, 91 insertions(+), 37 deletions(-)

-- 
2.38.0
