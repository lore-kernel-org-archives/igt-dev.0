Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23676E83A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 12:00:12 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 19 Aug 2021 13:59:39 +0200
Message-Id: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fixes for some kms-related DG1 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

A set of fixes to help DG1 BAT turn green.
At least With IGT softpinning changes, Patch 1 and 2 makes kms_addfb_basic
turn green or get skipped. Patch 3 is a first step towards getting
igt@kms_frontbuffer_tracking@basic working. It might be we should skip the
test completely for DG1 instead. Opinions?

Patch 2 originally carried the following FIXME:
Skipping subtests when get/set tiling IOCTLs are not supported is a
temporary workaround - we should extend these tests by using modifiers
to change the properties of the framebuffer.

Ramalingam C (1):
  lib/igt_fb: Support fbs backed by local memory

Vanshidhar Konda (2):
  lib/ioctl_wrappers: Query if device supports set/get legacy tiling
  tests/kms_addfb_basic: Skip tiling subtests on device without hw
    tiling

 lib/igt_fb.c            |  4 +++-
 lib/ioctl_wrappers.c    | 17 +++++++++++++++++
 lib/ioctl_wrappers.h    |  1 +
 tests/kms_addfb_basic.c |  4 ++++
 4 files changed, 25 insertions(+), 1 deletion(-)

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Apoorva Singh <apoorva1.singh@intel.com>
-- 
2.31.1
