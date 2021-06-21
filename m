Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100076E027
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 12:57:38 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 21 Jun 2021 14:57:18 +0200
Message-Id: <20210621125724.1592104-2-boris.brezillon@collabora.com>
In-Reply-To: <20210621125724.1592104-1-boris.brezillon@collabora.com>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/7] tests/panfrost: Make sure we open a DUMB
 capable node for prime tests
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

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 tests/panfrost_prime.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/panfrost_prime.c b/tests/panfrost_prime.c
index 351d46f2f7e6..f9818108a662 100644
--- a/tests/panfrost_prime.c
+++ b/tests/panfrost_prime.c
@@ -35,12 +35,36 @@
 #include <sys/ioctl.h>
 #include "panfrost_drm.h"
 
+static int igt_panfrost_open_kms_driver(void)
+{
+	for (unsigned i = 0; i < 2; i++) {
+		uint64_t cap_dumb_buf = 0, cap_prime = 0;
+		char path[32];
+		int fd;
+
+		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
+
+		fd = open(path, O_RDWR);
+		if (fd < 0)
+			continue;
+
+		drmGetCap(fd, DRM_CAP_DUMB_BUFFER, &cap_dumb_buf);
+		drmGetCap(fd, DRM_CAP_PRIME, &cap_prime);
+		if (cap_dumb_buf && (cap_prime & DRM_PRIME_CAP_EXPORT))
+			return fd;
+
+		close(fd);
+	}
+
+	return -1;
+}
+
 igt_main
 {
 	int fd, kms_fd;
 
 	igt_fixture {
-		kms_fd = drm_open_driver_master(DRIVER_ANY);
+		kms_fd = igt_panfrost_open_kms_driver();
 		fd = drm_open_driver(DRIVER_PANFROST);
 	}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
