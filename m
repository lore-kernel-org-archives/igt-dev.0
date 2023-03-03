Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092BB10E030
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Mar 2023 11:07:40 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:07:11 +0100
Message-Id: <20230303110715.8183-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Introduce KUnit
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

This series is a continuation of Isabella's work on introducing
KUnit to IGT.

Co-authored-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Isabella Basso (4):
  lib/igt_kmod: rename kselftest functions to ktest
  lib/igt_kmod.c: check if module is builtin before attempting to unload
    it
  lib/igt_kmod: add compatibility for KUnit
  tests: DRM selftests: switch to KUnit

 lib/igt_kmod.c       | 109 ++++++++++++--
 lib/igt_kmod.h       |  14 +-
 lib/igt_ktap.c       | 334 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_ktap.h       |  31 ++++
 lib/meson.build      |   1 +
 tests/drm_buddy.c    |   4 +-
 tests/drm_mm.c       |   4 +-
 tests/kms_selftest.c |  17 ++-
 8 files changed, 494 insertions(+), 20 deletions(-)
 create mode 100644 lib/igt_ktap.c
 create mode 100644 lib/igt_ktap.h

-- 
2.34.1
