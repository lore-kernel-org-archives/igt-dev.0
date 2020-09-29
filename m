Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5B989B99
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 07:53:19 +0000 (UTC)
Date: Tue, 29 Sep 2020 09:53:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200929075305.GA52098@zkempczy-mobl2>
References: <20200928131502.41354-1-zbigniew.kempczynski@intel.com>
 <20200928152920.GV7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200928152920.GV7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Reinitialize print mutex
 in child process
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2020 at 06:29:20PM +0300, Petri Latvala wrote:
> On Mon, Sep 28, 2020 at 03:15:02PM +0200, Zbigniew Kempczyński wrote:
> > IGT are prone to deadlock in igt_log() in following scenario:
> > 
> > 1. Parent process creates additional thread which for example
> >    is doing endless loop
> > 2. Thread sometimes is logging to console using igt_info().
> >    This locks and unlocks print_mutex.
> > 3. If in the meantime parent process will spawn it can be
> >    spawned with print_mutex locked. If in the child process
> >    it will do igt_info() it will deadlock.
> > 
> > We should reinitialize print_mutex in child process to avoid
> > use inherited value.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > ---
> 
> Are you able to type up a unit test in lib/tests/ that reproduces this
> deadlock?

I've attached patch which exposes the deadlock. Unfortunately I don't
think the test which produces thousands of log lines is much usable
in the future. In the patch I intentionally increased critical
section time to 1 second to spot the problem. In my opinion patch I've 
sent yesterday should work and I don't know should we add additional
test to verify this scenario in the future.

--
Zbigniew


--3MwIy2ne0vdjdPXF
Content-Type: text/x-diff; charset="iso-8859-1"
Content-Disposition: attachment;
	filename="0001-lib-igt_core-Expose-deadlock-in-igt-logging.patch"
Content-Transfer-Encoding: quoted-printable

From 998d15a647091c5db0ddee8ad52804cbbff2bd7f Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Zbigniew=3D20Kempczy=3DC5=3D84ski?=3D
 <zbigniew.kempczynski@intel.com>
Date: Tue, 29 Sep 2020 09:43:14 +0200
Subject: [PATCH i-g-t] lib/igt_core: Expose deadlock in igt logging

Just for expose.
---
 lib/igt_core.c         | 13 +++++++--
 tests/Makefile.sources |  1 +
 tests/core_logging.c   | 66 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |  1 +
 4 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 tests/core_logging.c

diff --git a/lib/igt_core.c b/lib/igt_core.c
index cedd8168..c26927cd 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2271,8 +2271,12 @@ static void children_exit_handler(int sig)
 		;
 }
=20
+static pthread_mutex_t print_mutex =3D PTHREAD_MUTEX_INITIALIZER;
+
 bool __igt_fork(void)
 {
+	int ret;
+
 	internal_assert(!test_with_subtests || in_subtest,
 			"forking is only allowed in subtests or igt_simple_main\n");
 	internal_assert(!test_child,
@@ -2300,6 +2304,11 @@ bool __igt_fork(void)
 		igt_assert(0);
 	case 0:
 		test_child =3D true;
+		/* Below fixes issue */
+		//pthread_mutex_init(&print_mutex, NULL);
+		ret =3D pthread_mutex_trylock(&print_mutex);
+		internal_assert(ret =3D=3D 0, "Mutex was locked during fork\n");
+		pthread_mutex_unlock(&print_mutex);
 		exit_handler_count =3D 0;
 		reset_helper_process_list();
 		oom_adjust_for_doom();
@@ -2737,8 +2746,6 @@ void igt_vlog(const char *domain, enum igt_log_level =
level, const char *format,
 		"NONE"
 	};
=20
-	static pthread_mutex_t print_mutex =3D PTHREAD_MUTEX_INITIALIZER;
-
 	assert(format);
=20
 #ifdef __GLIBC__
@@ -2816,6 +2823,8 @@ void igt_vlog(const char *domain, enum igt_log_level =
level, const char *format,
 		fwrite(line, sizeof(char), strlen(line), file);
 	}
=20
+	/* Extend critical section time */
+	sleep(1);
 	pthread_mutex_unlock(&print_mutex);
=20
 out:
diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index f32ea9cf..e027cab1 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -19,6 +19,7 @@ TESTS_progs =3D \
 	core_getstats \
 	core_getversion \
 	core_hotunplug \
+	core_logging \
 	core_setmaster \
 	core_setmaster_vs_auth \
 	debugfs_test \
diff --git a/tests/core_logging.c b/tests/core_logging.c
new file mode 100644
index 00000000..826ec85b
--- /dev/null
+++ b/tests/core_logging.c
@@ -0,0 +1,66 @@
+/*
+ * Copyright =A9 2020 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software=
"),
+ * to deal in the Software without restriction, including without limitati=
on
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the ne=
xt
+ * paragraph) shall be included in all copies or substantial portions of t=
he
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include "igt.h"
+#include <pthread.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+IGT_TEST_DESCRIPTION("Tests is IGT logging prone to deadlock");
+
+#define TIMEOUT 10
+
+static void *thread_loop(void *data)
+{
+	int cnt =3D 0;
+
+	igt_until_timeout(TIMEOUT) {
+		igt_info("... %d\n", cnt++);
+	}
+
+	return NULL;
+}
+
+static void test_deadlock(void)
+{
+	pthread_t thread;
+
+	pthread_create(&thread, NULL, thread_loop, NULL);
+
+	igt_until_timeout(TIMEOUT) {
+		igt_fork(child, 1) {
+			igt_info("child [%d]\n", getpid());
+		}
+		//igt_waitchildren_timeout(1, "deadlock found");
+		igt_waitchildren();
+	}
+
+	pthread_join(thread, NULL);
+}
+
+igt_main
+{
+	igt_subtest("test-deadlock")
+		test_deadlock();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 515f7528..ebdc1aba 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -4,6 +4,7 @@ test_progs =3D [
 	'core_getstats',
 	'core_getversion',
 	'core_hotunplug',
+	'core_logging',
 	'core_setmaster',
 	'core_setmaster_vs_auth',
 	'debugfs_test',
--=20
2.26.0


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--3MwIy2ne0vdjdPXF--
