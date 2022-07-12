Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ABD93F9B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 09:57:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Jul 2022 11:57:01 +0200
Message-Id: <20220712095707.22168-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/6] Add codename in device selection
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

v2: addressing review comments (Kamil)

Zbigniew Kempczyński (6):
  lib/igt_device_scan: Migrate pci assignment
  lib/igt_device_scan: Introduce codename for platform selection
  tools/lsgpu: Add codename switch (-c)
  lib/igt_device_scan: Align microseconds to six leading zeros
  lib/igt_device_scan: Add discrete/integrated pseudo-codenames
  lib/igt_device_scan: Simulate udev drm and pci device events

 lib/igt_device_scan.c          | 175 ++++++++++++-
 lib/igt_device_scan.h          |   1 +
 lib/igt_device_scan_simulate.c | 450 +++++++++++++++++++++++++++++++++
 tools/lsgpu.c                  |   8 +-
 4 files changed, 620 insertions(+), 14 deletions(-)
 create mode 100644 lib/igt_device_scan_simulate.c

-- 
2.34.1
