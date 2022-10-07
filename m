Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2F10E138
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 23:28:13 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id q18so471995ils.12
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 16:28:13 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 18:27:55 -0500
Message-Id: <20221007232757.3210308-5-jfree@freebsd.org>
In-Reply-To: <20221007232757.3210308-1-jfree@freebsd.org>
References: <20221007232757.3210308-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 4/6] lib/igt_os.c: Add FreeBSD system
 info collection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use sysctlbyname() to gather RAM and swap information for
any FreeBSD system using igt.

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 lib/igt_os.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_os.c b/lib/igt_os.c
index bdd5d933..ac8960f8 100644
--- a/lib/igt_os.c
+++ b/lib/igt_os.c
@@ -44,6 +44,8 @@
 #include <sys/sysinfo.h>
 #elif defined(HAVE_SWAPCTL) /* Solaris */
 #include <sys/swap.h>
+#elif defined(__FreeBSD__)
+#include <sys/sysctl.h>
 #endif
 #include <sys/resource.h>
 
@@ -148,6 +150,15 @@ igt_get_avail_ram_mb(void)
 	npages = sysconf(_SC_AVPHYS_PAGES);
 
 	retval = (uint64_t) pagesize * npages;
+#elif defined(__FreeBSD__)
+	uint64_t npages, pagesize;
+	size_t npages_len = sizeof(npages);
+	size_t pagesize_len = sizeof(pagesize);
+
+	sysctlbyname("vm.stats.vm.v_free_count", &npages, &npages_len, NULL, 0);
+	sysctlbyname("vm.stats.vm.v_page_size", &pagesize, &pagesize_len, NULL, 0);
+
+	retval = pagesize * npages;
 #else
 #error "Unknown how to get available RAM for this OS"
 #endif
@@ -210,6 +221,13 @@ igt_get_total_swap_mb(void)
 	free(buf);
 
 	retval = (uint64_t) pagesize * totalpages;
+#elif defined(__FreeBSD__)
+	uint64_t swap_total;
+	size_t swap_total_len = sizeof(swap_total);
+
+	sysctlbyname("vm.swap_total", &swap_total, &swap_total_len, NULL, 0);
+
+	retval = swap_total;
 #else
 #warning "Unknown how to get swap size for this OS"
 	return 0;
-- 
2.37.3
