Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6C610E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:38 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:33 +0800
Message-ID: <20230621065733.840316-8-chiahsuan.chung@amd.com>
In-Reply-To: <20230621065733.840316-1-chiahsuan.chung@amd.com>
References: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 8/8] tests/amdgpu/amd_freesync_video_mode:
 Add amd_freesync_video_mode to meson.build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add amd_freesync_video_mode to meson.build file.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index ce081c35a..2226e5079 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -24,6 +24,7 @@ if libdrm_amdgpu.found()
 			  'amd_psr',
 			  'amd_plane',
 			  'amd_ilr',
+			  'amd_freesync_video_mode',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.34.1
