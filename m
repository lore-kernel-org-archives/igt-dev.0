Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA0A10E4A6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 09:10:19 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 6 Jul 2023 17:09:26 +0800
Message-ID: <20230706090926.533548-9-chiahsuan.chung@amd.com>
In-Reply-To: <20230706090926.533548-1-chiahsuan.chung@amd.com>
References: <20230706090926.533548-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [i-g-t, v3 8/8] tests/amdgpu/amd_freesync_video_mode: Add
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
index ce081c35a..9f1165a5b 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -11,6 +11,7 @@ if libdrm_amdgpu.found()
 			  'amd_cp_dma_misc',
 			  'amd_color',
 			  'amd_cs_nop',
+			  'amd_freesync_video_mode',
 			  'amd_hotplug',
 			  'amd_info',
 			  'amd_prime',
-- 
2.25.1
