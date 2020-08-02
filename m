Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66DF6E15D
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Aug 2020 15:23:56 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Sun,  2 Aug 2020 17:23:07 +0200
Message-Id: <20200802152309.4826-18-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
References: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v22 17/19] fix: lib/intel_bufops: add 64bit
 bpp
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

to be squashed
---
 lib/intel_bufops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index d077b1ac..681e46df 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -706,7 +706,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 	igt_assert(bops);
 	igt_assert(buf);
 	igt_assert(width > 0 && height > 0);
-	igt_assert(bpp == 8 || bpp == 16 || bpp == 32);
+	igt_assert(bpp == 8 || bpp == 16 || bpp == 32 || bpp == 64);
 	igt_assert(alignment % 2 == 0);
 
 	memset(buf, 0, sizeof(*buf));
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
