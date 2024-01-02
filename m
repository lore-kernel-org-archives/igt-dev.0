Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D90C10E121
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jan 2024 08:11:13 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/2] Cache xe_device info for lease fd
Date: Tue,  2 Jan 2024 13:39:21 +0530
Message-Id: <20240102080923.97366-1-mohammed.thasleem@intel.com>
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
 tests/kms_lease.c                        |  10 +
 2 files changed, 31 insertions(+), 262 deletions(-)

-- 
2.25.1
