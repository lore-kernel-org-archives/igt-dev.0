Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D6F6E375
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2020 08:43:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Sep 2020 11:42:55 +0300
Message-Id: <20200916084255.27032-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms.h: Remove duplicate docs for
 igt_require_pipe
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Documentation generally goes where the definition is, and for
non-inline functions that's usually in the .c file. igt_require_pipe
docs were duplicated to both the declaration and the definition,
remove the redundant one.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 lib/igt_kms.h | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f41eadaf..09a5eec2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -875,19 +875,8 @@ int igt_connector_sysfs_open(int drm_fd,
 			     drmModeConnector *connector);
 uint32_t igt_reduce_format(uint32_t format);
 
-
-/*
- * igt_require_pipe:
- * @display: pointer to igt_display_t
- * @pipe: pipe which need to check
- *
- * Skip a (sub-)test if the pipe not enabled.
- *
- * Should be used everywhere where a test checks pipe and skip
- * test when pipe is not enabled.
- */
 void igt_require_pipe(igt_display_t *display,
-		enum pipe pipe);
+		      enum pipe pipe);
 
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
