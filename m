Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:44 +0200
Message-ID: <20231011141734.590321-22-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
References: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 09/11] lib/kunit: Prepare for KTAP
 parsing after modprobe completed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We are going to add support for reading a list of kunit test cases
provided by a kunit test module prior to executing those test cases.  That
will be done by first loading kunit modules in list only mode, then
reading the list from /dev/kmsg with our KTAP parser.  Since that parsing
will be performed after the kunit test module is successfully loaded and
there will be no concurrently running modprobe thread, we need to make
synchronization of reads from /dev/kmsg with potential errors modprobe
thread optional.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_kmod.c | 50 ++++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 21c547bf42..5d85732b08 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -805,34 +805,36 @@ static int kunit_kmsg_result_get(struct igt_list_head *results,
 		if (igt_debug_on(igt_kernel_tainted(&taints)))
 			return -ENOTRECOVERABLE;
 
-		err = igt_debug_on(sigaction(SIGCHLD, &sigchld, saved));
-		if (err == -1)
-			return -errno;
-		else if (unlikely(err))
-			return err;
-
-		err = pthread_mutex_lock(&modprobe->lock);
-		switch (err) {
-		case EOWNERDEAD:
-			/* leave the mutex unrecoverable */
-			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
-			__attribute__ ((fallthrough));
-		case ENOTRECOVERABLE:
-			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
-			if (igt_debug_on(modprobe->err))
-				return modprobe->err;
-			break;
-		case 0:
-			break;
-		default:
-			igt_debug("pthread_mutex_lock() error: %d\n", err);
-			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
-			return -err;
+		if (modprobe) {
+			err = igt_debug_on(sigaction(SIGCHLD, &sigchld, saved));
+			if (err == -1)
+				return -errno;
+			else if (unlikely(err))
+				return err;
+
+			err = pthread_mutex_lock(&modprobe->lock);
+			switch (err) {
+			case EOWNERDEAD:
+				/* leave the mutex unrecoverable */
+				igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
+				__attribute__ ((fallthrough));
+			case ENOTRECOVERABLE:
+				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
+				if (igt_debug_on(modprobe->err))
+					return modprobe->err;
+				break;
+			case 0:
+				break;
+			default:
+				igt_debug("pthread_mutex_lock() error: %d\n", err);
+				igt_debug_on(sigaction(SIGCHLD, saved, NULL));
+				return -err;
+			}
 		}
 
 		ret = read(fd, record, BUF_LEN);
 
-		if (!err) {	/* pthread_mutex_lock() succeeded */
+		if (modprobe && !err) {	/* pthread_mutex_lock() succeeded */
 			igt_debug_on(pthread_mutex_unlock(&modprobe->lock));
 			igt_debug_on(sigaction(SIGCHLD, saved, NULL));
 		}
-- 
2.42.0
