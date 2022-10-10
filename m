Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E35F10E6B7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 18:59:10 +0000 (UTC)
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Oct 2022 12:01:07 -0700
Message-Id: <20221010190107.1576732-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/igt_kmod: Make sure the mei modules are
 loaded when i915 is
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The mei modules are required on DG2 to use the GSC child device, which
is in turn responsible for loading HuC. We're observing a sporadic
failure in CI (see ref below) where it looks like the mei modules are
not automatically loaded by the kernel the fist time i915 exposes the
child device while being loaded by IGT, but are then loaded fine when
i915 is reloaded by another test later on.

To make sure that the modules get loaded, explicitly modprobe them after
i915 is loaded.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/7029
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/igt_kmod.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index bcf7dfeb..c9a9c2db 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -394,6 +394,9 @@ igt_i915_driver_load(const char *opts)
 	}
 
 	bind_fbcon(true);
+	igt_kmod_load("mei_gsc", NULL);
+	igt_kmod_load("mei_hdcp", NULL);
+	igt_kmod_load("mei_pxp", NULL);
 	igt_kmod_load("snd_hda_intel", NULL);
 
 	return 0;
-- 
2.37.3
