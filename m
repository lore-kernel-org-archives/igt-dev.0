Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17626E30C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 12:51:22 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 31 Mar 2020 15:38:54 +0300
Message-ID: <20200331123857.1212432-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
References: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/kms: Commit reasonable defaults on
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
