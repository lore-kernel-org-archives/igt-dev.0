Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB416EA2E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:42 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:08 -0800
Message-Id: <20191211005235.67897-3-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 02/29] lib/igt_chipset: Add missing libdrm
 dependency
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

Without this the build fails because it can not find xf86drm.h.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/meson.build b/lib/meson.build
index 57eb7d93..25ea62d5 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -154,6 +154,7 @@ igt_deps = [ lib_igt ] + lib_deps
 lin_igt_chipset_build = static_library('igt_chipset',
                                        ['intel_chipset.c',
                                         'intel_device_info.c'],
+                                       dependencies : libdrm,
                                        include_directories : inc)
 
 lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
