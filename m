Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F61810E6EF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 20:26:40 +0000 (UTC)
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/2] CLOS Based Cache Reservation test
Date: Fri, 22 Dec 2023 02:04:17 +0530
Message-Id: <20231221203419.3924552-1-pallavi.mishra@intel.com>
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

This series introduces a basic test for CLOS feature.

PVC and XE2 expose control over each Cache through the Class of Service (CLOS)
feature. CLOS allows to define which portions of a cache may be
used for a given allocation through a set of Waymask controls grouped
into multiple sets.

For each CLOS set, and supported cache, there is a Waymask to configure
the Ways in that cache that may be used to cache memory requests for that
CLOS.

KMD: https://lore.kernel.org/intel-xe/20231220012705.3784972-1-pallavi.mishra@intel.com/T/#u

v2: Address review comments (Kamil)

Pallavi Mishra (2):
  drm-uapi/xe_drm: Add support for CLOS interface
  tests/intel/xe_clos: CLOS Based Cache Reservation test

 include/drm-uapi/xe_drm.h |  70 +++++++++++++++++++
 tests/intel/xe_clos.c     | 141 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 3 files changed, 212 insertions(+)
 create mode 100644 tests/intel/xe_clos.c

-- 
2.25.1
