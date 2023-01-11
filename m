Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FC010E0C2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 18:12:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jan 2023 19:12:02 +0100
Message-Id: <20230111181205.55997-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix kms_cursor_legacy ENOSPC issue
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

Previously we had luck when framebuffer offset was after bb offset
so objects didn't overlap. When reloc allocator started to keep
offsets for same handle to avoid rebind batch from second spinner
started overlapping framebuffer in the allocator leading ENOSPC.

Additionally series has allocator debug fix which I noticed during
debugging this issue.

Zbigniew Kempczyński (3):
  lib/intel_allocator: Fix alignment variable used in debug path
  lib/igt_dummyload: Don't assume dependency object size
  tests/kms_cursor_legacy: Add dependency size for spinner creation

 lib/igt_dummyload.c       | 4 +++-
 lib/igt_dummyload.h       | 1 +
 lib/intel_allocator.c     | 2 +-
 tests/kms_cursor_legacy.c | 3 ++-
 4 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.34.1
