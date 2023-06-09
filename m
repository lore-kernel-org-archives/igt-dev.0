Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7A010E678
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 10:08:34 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 15:42:00 +0530
Message-Id: <20230609101205.2803975-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] RFC Enable kms_frontbuffer_tracking on
 XE
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
  RFC tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as
    of now
  tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported
    for xe as of now
  RFC lib/ioctl_wrappers: GEM_SET_DOMAIN ioctl not supported on xe
  RFC tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC,
    BLT, RENDER

 tests/i915/kms_frontbuffer_tracking.c | 84 +++++++++++++++++++--------
 1 file changed, 61 insertions(+), 23 deletions(-)

-- 
2.34.1
