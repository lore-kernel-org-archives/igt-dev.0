Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6F36EB82
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Apr 2020 13:04:11 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 3 Apr 2020 16:03:03 +0300
Message-ID: <20200403130306.1272436-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
References: <20200403130306.1272436-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] lib/kms: Commit reasonable defaults on
 display init
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

We often end up with a leftover state from fbcon with a mode enabled on
some of the connecters. Let's clean that up.

Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7f9fafb3..796da1fb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2066,6 +2066,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	/* Set reasonable default values for every object in the display. */
 	igt_display_reset(display);
 
+	/* Commit those resonable defaults to clean up fbcon/etc leftover state */
+	igt_display_commit2(display,
+			    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 out:
 	LOG_UNINDENT(display);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
