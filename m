Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2710E111
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 14:13:22 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 0/3] Cache xe_device info for lease fd
Date: Wed, 17 Jan 2024 19:43:20 +0530
Message-Id: <20240117141323.14994-1-mohammed.thasleem@intel.com>
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In case of xe device for lessor fd, the xe_device struct gets
created and cached during drm_open. But for the lessee fd,
the xe_device info struct is not created and cached.

Mohammed Thasleem (3):
  tests/kms_lease: Cache xe_device info for lease fd
  lib/igt_kms: Update the check for igt_require
  HAX/DO_NOT_MERGE: Patch adding to test to kms_lease

 lib/igt_kms.c                            |   2 +-
 tests/intel-ci/xe-fast-feedback.testlist | 283 ++---------------------
 tests/kms_lease.c                        |  10 +
 3 files changed, 32 insertions(+), 263 deletions(-)

-- 
2.25.1


