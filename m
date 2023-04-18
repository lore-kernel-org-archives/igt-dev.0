Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48510E69C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 07:25:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 09:25:26 +0200
Message-Id: <20230418072535.14946-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 01/10] lib/xe_ioctl: Add missing header
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
