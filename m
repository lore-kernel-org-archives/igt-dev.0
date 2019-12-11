Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82B46EA32
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:43 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:16 -0800
Message-Id: <20191211005235.67897-11-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/29] drm-uapi: patch sync_file.h to depend
 on drm.h
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

linux/sync_file.h isn't strictly part of the drm uapi and so
doesn't include drm.h. drm.h contains some compatibility #defines
for non-Linux platforms for things like __u32 which synf_file
needs.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 include/drm-uapi/sync_file.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/drm-uapi/sync_file.h b/include/drm-uapi/sync_file.h
index b4f2db00..4713b5b9 100644
--- a/include/drm-uapi/sync_file.h
+++ b/include/drm-uapi/sync_file.h
@@ -12,8 +12,7 @@
 #ifndef _LINUX_SYNC_H
 #define _LINUX_SYNC_H
 
-#include <linux/ioctl.h>
-#include <linux/types.h>
+#include "drm.h"
 
 /**
  * struct sync_merge_data - data passed to merge ioctl
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
