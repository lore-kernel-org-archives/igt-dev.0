Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4CB6E871
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 13:17:05 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 16:16:30 +0300
Message-ID: <20200407131633.1350311-4-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/kms: Commit reasonable defaults on
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

v2: commit only if we have pipes and outputs

Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7f9fafb3..4ffc3ed2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2066,6 +2066,12 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	/* Set reasonable default values for every object in the display. */
 	igt_display_reset(display);
 
+	/* Commit those resonable defaults to clean up fbcon/etc leftover state */
+	if (display->n_pipes && display->n_outputs) {
+		igt_display_commit2(display,
+				    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	}
+
 out:
 	LOG_UNINDENT(display);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
