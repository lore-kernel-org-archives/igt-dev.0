Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663966EA2E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:43 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:07 -0800
Message-Id: <20191211005235.67897-2-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/29] Remove unused includes
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

<linux/unistd.h> and <malloc.h> are not needed and are not
available on other platforms.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 benchmarks/gem_syslatency.c     | 2 --
 tests/i915/gem_reloc_overflow.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 40230630..30722d85 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -42,8 +42,6 @@
 #include <limits.h>
 #include "drm.h"
 
-#include <linux/unistd.h>
-
 #define sigev_notify_thread_id _sigev_un._tid
 
 static volatile int done;
diff --git a/tests/i915/gem_reloc_overflow.c b/tests/i915/gem_reloc_overflow.c
index c9d1f207..75af2659 100644
--- a/tests/i915/gem_reloc_overflow.c
+++ b/tests/i915/gem_reloc_overflow.c
@@ -37,7 +37,6 @@
 #include <inttypes.h>
 #include <errno.h>
 #include <unistd.h>
-#include <malloc.h>
 #include <limits.h>
 #include <sys/ioctl.h>
 #include <sys/stat.h>
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
