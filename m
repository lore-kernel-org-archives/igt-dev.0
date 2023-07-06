Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4C510E49D
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 09:09:43 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 6 Jul 2023 17:09:18 +0800
Message-ID: <20230706090926.533548-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [i-g-t,v3 0/8] Fix some bugs in amd_freesync_video_mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fix several bugs in tests/amdgpu/amd_freesync_video_mode.c

v2: Fix some errors that report from checkpatch.pl.
v3: Add amd_freesync_video_mode to meson.build in alphabetical order.

Tom Chung (8):
  tests/amdgpu/amd_freesync_video_mode: Adjust indents and spacing
  tests/amdgpu/amd_freesync_video_mode: Fix memory leak and corruption
  tests/amdgpu/amd_freesync_video_mode: Fix wrong resolution setting
    during the test
  tests/amdgpu/amd_freesync_video_mode: Add some code from kms_vrr to
    resolve tearing issue
  tests/amdgpu/amd_freesync_video_mode: Add/remove some test progress
    messages
  tests/amdgpu/amd_freesync_video_mode: Move the vrr setting and display
    reset
  tests/amdgpu/amd_freesync_video_mode: Fix wrong resolution setting for
    some panel
  tests/amdgpu/amd_freesync_video_mode: Add amd_freesync_video_mode to
    meson.build

 tests/amdgpu/amd_freesync_video_mode.c | 677 +++++++++++++------------
 tests/amdgpu/meson.build               |   1 +
 2 files changed, 357 insertions(+), 321 deletions(-)

-- 
2.25.1
