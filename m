Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7396E08C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 08:17:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 28 Oct 2021 11:05:31 +0300
Message-Id: <20211028080531.8223-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib/meson.build: Fix underscorify call
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
Cc: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>
List-ID: <igt-dev@lists.freedesktop.org>

f.underscorify() is correct, f.underscorify(f) is an error that later
meson versions don't like at all.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/107
Fixes: 588555f77909 ("lib/i915: Extract helpers for determining scheduler capabilities")
Cc: Arkadiusz Hiler <arek@hiler.eu>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index c3080fc8..297b0ad2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -155,7 +155,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 
 lib_intermediates = []
 foreach f: lib_sources
-    name = f.underscorify(f)
+    name = f.underscorify()
     lib = static_library('igt-' + name,
 	[ f, lib_version ],
 	include_directories: inc,
-- 
2.29.2
