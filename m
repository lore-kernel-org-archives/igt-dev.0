Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBA410E6E1
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 20:55:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Oct 2022 20:55:08 +0000
Message-Id: <20221027205535.12824-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
References: <20221027205535.12824-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 01/28] lib/i915/perf-config: Bump up the
 soversion
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

Add soversion update that was missed as part of the below patch:

"lib/i915/perf-config: extend the device info"

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index 1fa6d6ee..50ffd8cd 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -321,7 +321,7 @@ lib_igt_i915_perf_build = shared_library(
   dependencies: lib_igt_chipset,
   include_directories : inc,
   install: true,
-  soversion: '1')
+  soversion: '1.3')
 
 lib_igt_i915_perf = declare_dependency(
   link_with : lib_igt_i915_perf_build,
-- 
2.25.1
