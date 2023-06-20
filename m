Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3A10E257
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 04:28:28 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:02:35 +0530
Message-Id: <20230620043240.3312945-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/5] RFC Enable kms_frontbuffer_tracking on XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series is intended to extend kms_frontbuffer_tracking
test to be supported on xe driver

Kunal Joshi (5):
  RFC tests/i915/kms_frontbuffer_tracking: Add xe support
  tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported
    for xe as of now
  RFC lib/ioctl_wrappers: GEM_SET_DOMAIN ioctl not supported on xe
  RFC tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC,
    BLT, RENDER
  HAX: test kms_frontbuffer_tracking for regression by changes

 tests/i915/kms_frontbuffer_tracking.c |   87 ++-
 tests/intel-ci/fast-feedback.testlist | 1004 ++++++++++++++++++++++++-
 2 files changed, 1066 insertions(+), 25 deletions(-)

-- 
2.25.1
