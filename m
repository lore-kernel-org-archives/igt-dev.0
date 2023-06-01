Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4A010E02E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 05:05:18 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 10:39:22 +0530
Message-Id: <20230601050928.2487611-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] RFC Enable kms_frontbuffer_tracking on
 XE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series is intended to extend kms_frontbuffer_tracking
test to be supported on xe driver

Kunal Joshi (6):
  RFC tests/i915/kms_frontbuffer_tracking: Add xe support
  RFC Added is_xe to check if xe device
  RFC tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as
    of now
  tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported
    for xe as of now
  RFC lib/ioctl_wrappers: GEM_SET_DOMAIN ioctl not supported on xe
  RFC tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC,
    BLT, RENDER

 lib/ioctl_wrappers.c                  |  7 ++-
 tests/i915/kms_frontbuffer_tracking.c | 84 +++++++++++++++++++--------
 2 files changed, 65 insertions(+), 26 deletions(-)

-- 
2.25.1
