Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A31610E4B3
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Jul 2022 03:05:42 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 20:05:33 -0700
Message-Id: <cover.1656731010.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Fix compile warnings with gcc 12.1.1
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix compile warnings with gcc 12.1.1

Ashutosh Dixit (4):
  lib/igt_device_scan: Fix -Wdangling-pointer
  tests/drm_read: Fix -Wdeprecated-declarations
  tests/kms_cursor_crc: Fix -Wformat-truncation
  lib/amdgpu/amd_command_submission: Fix -Wuse-after-free

 lib/amdgpu/amd_command_submission.c | 2 +-
 lib/igt_device_scan.c               | 2 +-
 tests/drm_read.c                    | 2 +-
 tests/kms_cursor_crc.c              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1
