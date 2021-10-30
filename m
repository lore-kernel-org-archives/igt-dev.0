Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019286EA97
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Oct 2021 00:01:31 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 29 Oct 2021 17:07:43 -0700
Message-Id: <20211030000744.231762-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/meson: Fix build
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Getting:
../lib/meson.build:158:4: ERROR: Function does not take positional arguments.
with meson 0.60.

Acording to documentation underscorify() do not take any arguments as
it will be executed over the string/object instace of the class.
https://mesonbuild.com/Reference-manual_elementary_str.html#strunderscorify

Not sure why older versions was not complaning about it.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index c3080fc82..297b0ad26 100644
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
2.33.1
