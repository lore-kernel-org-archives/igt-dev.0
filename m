Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D77113A49
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jul 2022 17:59:21 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Jul 2022 19:59:12 +0200
Message-Id: <20220706175912.6983-1-nirmoy.das@intel.com>
In-Reply-To: <20220706120143.1268-1-nirmoy.das@intel.com>
References: <20220706120143.1268-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t 3/3] i915/gem_exec_capture: fix
 needs_recoverable_ctx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com, chris.p.wilson@intel.com, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

needs_recoverable_ctx() should check for graphics_ver instead of
display_ver. Use intel_graphics_ver() now that we have it.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6356
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_exec_capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index a25f529bc..6950b2d2c 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -607,10 +607,13 @@ static bool kernel_supports_probed_size(int fd)
 
 static bool needs_recoverable_ctx(int fd)
 {
+	uint16_t devid;
+
 	if (!kernel_supports_probed_size(fd))
 		return false;
 
-	return gem_has_lmem(fd) || intel_display_ver(intel_get_drm_devid(fd)) > 12;
+	devid = intel_get_drm_devid(fd);
+	return gem_has_lmem(fd) ||  intel_graphics_ver(devid) > IP_VER(12, 0);
 }
 
 #define find_first_available_engine(fd, ctx, e, saved) \
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928
