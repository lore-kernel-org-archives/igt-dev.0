Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDA610E232
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 11:44:56 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 17:18:55 +0530
Message-Id: <20230601114856.2500802-5-kunal1.joshi@intel.com>
In-Reply-To: <20230601114856.2500802-1-kunal1.joshi@intel.com>
References: <20230601114856.2500802-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] RFC lib/ioctl_wrappers: GEM_SET_DOMAIN
 ioctl not supported on xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

xe doesn't support GEM_SET_DOMAIN ioctl

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/ioctl_wrappers.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index ebd8a2f3..1180d4c6 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -534,7 +534,12 @@ int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
  */
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
 {
-	int ret = __gem_set_domain(fd, handle, read, write);
+	int ret;
+
+	if (is_xe_device(fd))
+		return;
+
+	ret = __gem_set_domain(fd, handle, read, write);
 
 	if (ret == -ENODEV && gem_has_lmem(fd))
 		igt_assert_eq(gem_wait(fd, handle, 0), 0);
-- 
2.25.1
