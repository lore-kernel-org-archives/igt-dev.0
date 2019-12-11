Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CF16EA35
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:51 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:27 -0800
Message-Id: <20191211005235.67897-22-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 21/29] lib: undefine FreeBSD libc's ALIGN
 macro
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

On FreeBSD, if you include many of the non-POSIX headers, you get
inflicted with a definition of an ALIGN() macro that has something
to do with network protocols. Here we include a header that
provides it and then undefine it so that we can provide our own
definition.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/drmtest.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 632c616b..0fc59311 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -33,6 +33,10 @@
 #include <stdint.h>
 #include <sys/mman.h>
 #include <errno.h>
+#if defined(__FreeBSD__)
+# include <sys/param.h>
+# undef ALIGN
+#endif
 
 #include <xf86drm.h>
 
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
