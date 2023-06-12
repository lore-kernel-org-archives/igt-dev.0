Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517AF10E18F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 17:23:22 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Jun 2023 19:23:10 +0200
Message-Id: <20230612172310.30117-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Make igt_while_interruptible()
 thread-safe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

We have the ability to replace the ioctl() call by a wrapper that
performs signal injection (triggering the ioctl to return -EINTR). This
uses a global for handling the signal, which is broken if the test tries
to mixing SIGINT injection and threads. Switch to a thread-local
sigaction.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_aux.c        | 2 +-
 lib/ioctl_wrappers.c | 2 +-
 lib/ioctl_wrappers.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 386e25783..adff1a11d 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -93,7 +93,7 @@
  * fit into any other topic.
  */
 
-static struct __igt_sigiter_global {
+static __thread struct __igt_sigiter_global {
 	pid_t tid;
 	timer_t timer;
 	struct timespec offset;
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index ebd8a2f36..146973f0d 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -89,7 +89,7 @@
  * distinguish them.
  */
 
-int (*igt_ioctl)(int fd, unsigned long request, void *arg) = drmIoctl;
+__thread int (*igt_ioctl)(int fd, unsigned long request, void *arg) = drmIoctl;
 
 
 static int
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 4c232078d..b7d7c2ad9 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -48,7 +48,7 @@
  * This is a wrapper around drmIoctl(), which can be augmented with special code
  * blocks like #igt_while_interruptible.
  */
-extern int (*igt_ioctl)(int fd, unsigned long request, void *arg);
+extern __thread int (*igt_ioctl)(int fd, unsigned long request, void *arg);
 
 /* ioctl_wrappers.c:
  *
-- 
2.39.2
