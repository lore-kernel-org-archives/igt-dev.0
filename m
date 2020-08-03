Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D576E265
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2020 12:44:04 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  3 Aug 2020 14:43:08 +0200
Message-Id: <20200803124313.31162-18-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200803124313.31162-1-zbigniew.kempczynski@intel.com>
References: <20200803124313.31162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v25 17/22] fix: lib/intel_bufops: add 64bit
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
index 902d072e..a70a9373 100644
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
