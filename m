Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E9E10E60E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:11 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:41 +0000
Message-Id: <20231129145457.7-5-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 04/20] xe_query: Add missing include
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

When trying to use xe_for_each_mem_region from a caller
that is not importing the igt_aux.h, the following build issue
will occur:

../lib/xe/xe_query.h:76:38: error: implicit declaration of function ‘igt_fls’ [-Werror=implicit-function-declaration]
   76 |         for (uint64_t __i = 0; __i < igt_fls(__memreg); __i++) \

So, to avoid a dependency chain, let's include from the file
that is using the helper.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/xe/xe_query.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 38e9aa440..7b3fc3100 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -11,6 +11,8 @@
 
 #include <stdint.h>
 #include <xe_drm.h>
+
+#include "igt_aux.h"
 #include "igt_list.h"
 #include "igt_sizes.h"
 
-- 
2.34.1
