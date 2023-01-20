Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C9810E389
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 17:39:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 23:11:19 +0530
Message-Id: <20230120174119.3937-6-swati2.sharma@intel.com>
In-Reply-To: <20230120174119.3937-1-swati2.sharma@intel.com>
References: <20230120174119.3937-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] lib/igt_fb: add missing include in
 header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Direct include of lib igt_fb header breaks builds with errors

xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’

Fixed it with adding proper include in header.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_fb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 6995b14b..73bdfc86 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -32,6 +32,7 @@
 #include <cairo.h>
 #include <stddef.h>
 #include <stdbool.h>
+#include <stdint.h>
 #include <drm_fourcc.h>
 #include <xf86drmMode.h>
 
-- 
2.25.1
