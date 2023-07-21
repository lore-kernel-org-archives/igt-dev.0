Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C0210E091
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 18:10:55 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Jul 2023 11:10:53 -0700
Message-ID: <20230721181053.1516574-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: Boost command streamer prefetch
 size
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

The actual prefetch size variest by platform and by engine.  MTL's RCS
engine currently has the highest prefetch size of 2KB.

Bspec: 45718
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 0b5c7a4fc..1f9240cd9 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -47,7 +47,7 @@
 
 uint32_t xe_cs_prefetch_size(int fd)
 {
-	return 512;
+	return 2048;
 }
 
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
-- 
2.41.0
