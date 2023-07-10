Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B4710E20F
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 07:58:47 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 10 Jul 2023 15:57:48 +0800
Message-ID: <20230710075749.2377896-9-chiahsuan.chung@amd.com>
In-Reply-To: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
References: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [i-g-t, v4 8/8] tests/amdgpu/amd_freesync_video_mode: Add
 amd_freesync_video_mode to meson.build
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

Add amd_freesync_video_mode to meson.build file.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index e6e6eaabf..f45d9fb95 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -12,6 +12,7 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_deadlock',
 			  'amd_dp_dsc',
+			  'amd_freesync_video_mode',
 			  'amd_hotplug',
 			  'amd_ilr',
 			  'amd_info',
-- 
2.25.1
