Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361CE6EA35
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:52 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:31 -0800
Message-Id: <20191211005235.67897-26-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 25/29] lib/intel_os: Implement get_avail_ram
 and get_total_swap for FreeBSD
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

FreeBSD provides these values through sysctl.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/intel_os.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/intel_os.c b/lib/intel_os.c
index 8458d39a..d476e9bc 100644
--- a/lib/intel_os.c
+++ b/lib/intel_os.c
@@ -44,6 +44,8 @@
 #include <sys/sysinfo.h>
 #elif defined(HAVE_SWAPCTL) /* Solaris */
 #include <sys/swap.h>
+#elif defined(__FreeBSD__)
+#include <sys/sysctl.h>
 #endif
 #include <sys/resource.h>
 
@@ -148,6 +150,14 @@ intel_get_avail_ram_mb(void)
         npages = sysconf(_SC_AVPHYS_PAGES);
 
 	retval = (uint64_t) pagesize * npages;
+#elif defined(__FreeBSD__)
+	int hw_physmem[] = {CTL_HW, HW_PHYSMEM};
+	size_t size = sizeof(retval);
+	int ret;
+	ret = sysctl(hw_physmem, ARRAY_SIZE(hw_physmem), &retval, &size, NULL,
+		     0);
+	if (ret != 0 || size != sizeof(retval))
+		retval = 0;
 #else
 #error "Unknown how to get available RAM for this OS"
 #endif
@@ -210,6 +220,12 @@ intel_get_total_swap_mb(void)
 	free(buf);
 
 	retval = (uint64_t) pagesize * totalpages;
+#elif defined(__FreeBSD__)
+	size_t size = sizeof(retval);
+	int ret;
+	ret = sysctlbyname("vm.swap_total", &retval, &size, NULL, 0);
+	if (ret != 0 || size != sizeof(retval))
+		retval = 0;
 #else
 #warning "Unknown how to get swap size for this OS"
 	return 0;
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
