Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548CC6E027
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 12:57:38 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 21 Jun 2021 14:57:19 +0200
Message-Id: <20210621125724.1592104-3-boris.brezillon@collabora.com>
In-Reply-To: <20210621125724.1592104-1-boris.brezillon@collabora.com>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/7] lib/panfrost: Handle the NULL case in
 igt_panfrost_free_bo()
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
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

So we don't have to bother checking the value before calling this
function.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 lib/igt_panfrost.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
index 8b0c2b7743ea..4bbb5ddf4076 100644
--- a/lib/igt_panfrost.c
+++ b/lib/igt_panfrost.c
@@ -72,6 +72,9 @@ igt_panfrost_gem_new(int fd, size_t size)
 void
 igt_panfrost_free_bo(int fd, struct panfrost_bo *bo)
 {
+        if (!bo)
+                return;
+
         if (bo->map)
                 munmap(bo->map, bo->size);
         gem_close(fd, bo->handle);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
