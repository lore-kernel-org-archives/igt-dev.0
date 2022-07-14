Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413F2A1854
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 04:17:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Jul 2022 06:17:27 +0200
Message-Id: <20220714041733.19044-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/6] Add codename in device selection
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

Most important in this series is codename + discrete/integrated 
device selectors. Device simulation is far away from being perfect
and I won't insist for merging it - it was written to check some
artificial multi-gpu setups.

v2-v3: addressing review comments (Kamil)

Zbigniew Kempczyński (6):
  lib/igt_device_scan: Migrate pci assignment
  lib/igt_device_scan: Introduce codename for platform selection
  tools/lsgpu: Add codename switch (-c)
  lib/igt_device_scan: Align microseconds to six leading zeros
  lib/igt_device_scan: Add discrete/integrated pseudo-codenames
  lib/igt_device_scan: Simulate udev drm and pci device events

 lib/igt_device_scan.c          | 181 +++++++++++--
 lib/igt_device_scan.h          |   1 +
 lib/igt_device_scan_simulate.c | 450 +++++++++++++++++++++++++++++++++
 tools/lsgpu.c                  |   8 +-
 4 files changed, 623 insertions(+), 17 deletions(-)
 create mode 100644 lib/igt_device_scan_simulate.c

-- 
2.34.1
