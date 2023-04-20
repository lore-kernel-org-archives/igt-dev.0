Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F412C10EB6C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 06:39:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 08:38:59 +0200
Message-Id: <20230420063908.66568-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
References: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 01/10] lib/xe_ioctl: Add missing header
 for direct resolving
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

xe_ioctl.h user expects all types resolving. Add missing stddef.h
header which contains size_t definition.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_ioctl.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index d8c40eda01..049cd183d6 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -11,6 +11,7 @@
 #ifndef XE_IOCTL_H
 #define XE_IOCTL_H
 
+#include <stddef.h>
 #include <stdint.h>
 #include <xe_drm.h>
 
-- 
2.34.1
