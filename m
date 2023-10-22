Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADB910E062
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Oct 2023 16:00:32 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 22 Oct 2023 17:52:26 +0200
Message-Id: <20231022155226.3484622-8-bernd@kuhls.net>
In-Reply-To: <20231022155226.3484622-1-bernd@kuhls.net>
References: <20231022155226.3484622-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 7/7] benchmarks/gem_syslatency.c: Fix musl build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Stefano Ragni <st3r4g@protonmail.com>

Original patch was added to void-linux:
https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7

Bug report with request to split the original patch into some
functional changes:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Fixes build error:
../benchmarks/gem_syslatency.c:166:13: error: ‘union <anonymous>’ has no member named ‘sigev_notify_thread_id’
  166 |         sev.sigev_notify_thread_id = gettid();

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 benchmarks/gem_syslatency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 312c428b7..e0740fc11 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -46,6 +46,8 @@
 #include <linux/unistd.h>
 #endif
 
+#define sigev_notify_thread_id sigev_notify_function
+
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
 #include "igt_aux.h"
-- 
2.39.2
