Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5624910E29C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jan 2024 12:33:41 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/2] Cache xe_device info for lease fd
Date: Fri, 22 Apr 2022 07:34:56 +0530
Message-Id: <20220422020458.2877-1-mohammed.thasleem@intel.com>
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

In case of xe device for lessor fd, the xe_device struct gets
created and cached during drm_open. But for the lessee fd,
the xe_device info struct is not created and cached.

Mohammed Thasleem (2):
  HAX/DO_NOT_MERGE: Patch adding to test to kms_lease
  tests/kms_lease: Cache xe_device info for lease fd

 tests/intel-ci/xe-fast-feedback.testlist | 283 ++---------------------
 tests/kms_lease.c                        |  14 ++
 2 files changed, 35 insertions(+), 262 deletions(-)

-- 
2.25.1
