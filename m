Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEA410E30F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 13:27:50 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Date: Tue, 17 Oct 2023 12:54:28 +0000
Message-ID: <20231017125428.607100-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/drmtest.h: make ALIGN work with
 uint64_t values
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Let alignment be the same type as aligned value.
Based on kernel code.

This should fix code like:

uint32_t a = 4096;
uint64_t v = 32768ULL * 32768 * 4;

v = ALIGN(v, a);

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/drmtest.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..524d81b7a 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -87,7 +87,8 @@ void __set_forced_driver(const char *name);
  *
  * Macro to align a value @v to a specified unit @a.
  */
-#define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
+#define ALIGN(v, a) ALIGN_MASK(v, (typeof(v))(a) - 1)
+#define ALIGN_MASK(v, mask) (((v) + (mask)) & ~(mask))
 
 /**
  * ALIGN_DOWN:
-- 
2.42.0


