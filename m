Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA91891EC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 10:31:49 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu,  5 Mar 2020 09:03:37 +0530
Message-Id: <1583379218-30115-2-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
References: <1583379218-30115-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_fb: Added macro to retrieve
 char code of format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added a macro to retrieve the fourcc of the pixel format.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_fb.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 587f7a4..0383d83 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -48,6 +48,8 @@
 #define IGT_FORMAT_FMT "%c%c%c%c(0x%08x)"
 #define IGT_FORMAT_ARGS(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
 		((f) >> 16) & 0xff, ((f) >> 24) & 0xff, (f)
+#define IGT_FORMAT_ARGS_CODE(f) ((f) >> 0) & 0xff, ((f) >> 8) & 0xff, \
+		((f) >> 16) & 0xff, ((f) >> 24) & 0xff
 
 /**
  * igt_fb_t:
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
