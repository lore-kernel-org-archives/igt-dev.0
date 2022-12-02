Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4A010E700
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 15:43:07 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Dec 2022 12:42:23 -0300
Message-Id: <20221202154228.45766-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/5] VC4 IGT Tests Updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series aims to update the VC4 IGT tests. The first three patches contain
some janitorial duties related to the existing tests: creating a folder for the
VC4 tests, removing some unused includes, and adding a macro with the default
PAGE_SIZE. The fourth patch adds an igt_require to all the VC4 tests to
check that the tests are not running on BCM2711. The final patch includes
new tests for the VC4's performance monitors.

This series was tested on the Raspberry Pi 3 Model B and Raspberry Pi 4 Model B,
and the HTML outputs of the VC4 tests are available on:

- Raspberry Pi 4: https://mairacanal.fedorapeople.org/igt-results/rpi4-v2/html/
- Raspberry Pi 3: https://mairacanal.fedorapeople.org/igt-results/rpi3-v2/html/

Best Regards,
- Maíra Canal

v1 -> v2:
- Install VC4 tests on build/tests/vc4/ instead of build/tests/ (Melissa Wen).
- Use the syncobj capability to identify vc4 and vc5 (Melissa Wen).
- Change the order of the commits (Melissa Wen).
- Add Petri Latvala tags.

Maíra Canal (5):
  tests/vc4: Move VC4 tests to their own folder
  tests/vc4: Remove unused or redundant includes
  lib/igt_vc4: Add PAGE_SIZE macro to VC4
  tests/vc4: Skip VC4 tests if they are running on BCM2711/RaspberryPi4
  tests/vc4_perfmon: Create test for VC4's Perfmon IOCTLs

 lib/igt_vc4.c                      |  60 ++++++++++---
 lib/igt_vc4.h                      |   9 ++
 meson.build                        |   8 ++
 tests/meson.build                  |  10 +--
 tests/vc4/meson.build              |  20 +++++
 tests/{ => vc4}/vc4_create_bo.c    |  15 +---
 tests/{ => vc4}/vc4_dmabuf_poll.c  |  14 +--
 tests/{ => vc4}/vc4_label_bo.c     |  21 ++---
 tests/{ => vc4}/vc4_lookup_fail.c  |  14 +--
 tests/vc4/vc4_perfmon.c            | 138 +++++++++++++++++++++++++++++
 tests/{ => vc4}/vc4_purgeable_bo.c |  10 ---
 tests/{ => vc4}/vc4_tiling.c       |  27 ++----
 tests/{ => vc4}/vc4_wait_bo.c      |  14 +--
 tests/{ => vc4}/vc4_wait_seqno.c   |  15 +---
 tests/vc4_ci/vc4.testlist          |  80 +++++++++--------
 15 files changed, 298 insertions(+), 157 deletions(-)
 create mode 100644 tests/vc4/meson.build
 rename tests/{ => vc4}/vc4_create_bo.c (89%)
 rename tests/{ => vc4}/vc4_dmabuf_poll.c (91%)
 rename tests/{ => vc4}/vc4_label_bo.c (85%)
 rename tests/{ => vc4}/vc4_lookup_fail.c (90%)
 create mode 100644 tests/vc4/vc4_perfmon.c
 rename tests/{ => vc4}/vc4_purgeable_bo.c (97%)
 rename tests/{ => vc4}/vc4_tiling.c (88%)
 rename tests/{ => vc4}/vc4_wait_bo.c (92%)
 rename tests/{ => vc4}/vc4_wait_seqno.c (89%)

-- 
2.38.1
