Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBC06E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2020 15:50:26 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 29 Apr 2020 18:49:00 +0300
Message-ID: <20200429154902.201712-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Test modeseting with imported prime
 buffer between any two devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

By default the first two devices that are matching provided chipset requirements
are used (ANY + VGEM). This is sensitive to enumeration order, but as long as
there are only two devices it's fine - PRIME will get tested both directions.

# kms_prime
IGT-Version: 1.25-g0b58fd8c (x86_64) (Linux: 5.7.0-rc2-CI-CI_DRM_8370+ x86_64)
Starting subtest: basic-crc
Starting dynamic subtest: first-to-second
Test requirement not met in function igt_require_pipe_crc, file ../lib/igt_debugfs.c:522:
Test requirement: fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
CRCs not supported on this platform
Last errno: 2, No such file or directory
Dynamic subtest first-to-second: SKIP (0,000s)
Starting dynamic subtest: second-to-first
Dynamic subtest second-to-first: SUCCESS (1,779s)
Subtest basic-crc: SUCCESS (2,024s)

In case there are more than two devices you can specify which ones should be
used or force ordering, e.g.:

# lsgpu
sys:/sys/devices/pci0000:00/0000:00:02.0
    subsystem       : pci
    drm card        : /dev/dri/card0
    drm render      : /dev/dri/renderD128
    vendor          : 8086
    device          : 9A49

sys:/sys/devices/platform/vgem
    subsystem       : platform
    drm card        : /dev/dri/card1
    drm render      : /dev/dri/renderD129

# kms_prime --device "sys:/sys/devices/platform/vgem;pci:vendor=Intel"
IGT-Version: 1.25-g0b58fd8c (x86_64) (Linux: 5.7.0-rc2-CI-CI_DRM_8370+ x86_64)
Starting subtest: basic-crc
Looking for devices to open using filter 0: sys:/sys/devices/platform/vgem
Filter matched /dev/dri/card1 | /dev/dri/renderD129
Looking for devices to open using filter 1: pci:vendor=Intel
Filter matched /dev/dri/card0 | /dev/dri/renderD128
Starting dynamic subtest: first-to-second
Dynamic subtest first-to-second: SUCCESS (1,978s)
Starting dynamic subtest: second-to-first
Test requirement not met in function igt_require_pipe_crc, file ../lib/igt_debugfs.c:522:
Test requirement: fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0
CRCs not supported on this platform
Last errno: 2, No such file or directory
Dynamic subtest second-to-first: SKIP (0,000s)
Subtest basic-crc: SUCCESS (2,944s)

You can also use the IGT_DEVICE environment variable or Common::Device in .igtrc.

Arkadiusz Hiler (2):
  lib: Support multiple filters
  lib/drmtest: Introduce __drm_open_driver_another

 lib/drmtest.c          | 165 +++++++++++++++++++++++++++++++++++------
 lib/drmtest.h          |   1 +
 lib/igt_core.c         |  16 ++--
 lib/igt_device_scan.c  |  87 ++++++++++++++++------
 lib/igt_device_scan.h  |   8 +-
 tests/core_hotunplug.c |   3 +-
 tests/kms_prime.c      | 107 ++++++++++++++++----------
 7 files changed, 288 insertions(+), 99 deletions(-)

-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
