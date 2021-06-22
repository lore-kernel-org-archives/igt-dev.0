Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9076E44D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 09:02:27 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 22 Jun 2021 11:02:15 +0200
Message-Id: <20210622090221.1741111-3-boris.brezillon@collabora.com>
In-Reply-To: <20210622090221.1741111-1-boris.brezillon@collabora.com>
References: <20210622090221.1741111-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 2/8] lib/panfrost: Handle the NULL case in
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

So we don't have to bother checking the value before calling this
function.

v2:
* No changes

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
