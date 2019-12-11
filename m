Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B797A6EA33
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:51 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:26 -0800
Message-Id: <20191211005235.67897-21-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 20/29] ilog2: Use libc provided fls() on
 FreeBSD
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

FreeBSD's libc provides an fls() function with the same name and
behavior, so simply omit our version on FreeBSD.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 benchmarks/ilog2.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/benchmarks/ilog2.h b/benchmarks/ilog2.h
index 596d7c23..c7d18094 100644
--- a/benchmarks/ilog2.h
+++ b/benchmarks/ilog2.h
@@ -3,12 +3,14 @@
 
 #include <stdint.h>
 
+#if !defined(__FreeBSD__)
 static inline int fls(int x)
 {
         int r = -1;
         asm("bsrl %1,%0" : "=r" (r) : "rm" (x), "0" (-1));
         return r + 1;
 }
+#endif
 
 static inline int fls64(__u64 x)
 {
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
