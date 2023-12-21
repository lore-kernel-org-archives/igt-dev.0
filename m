Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2997410E714
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 20:44:34 +0000 (UTC)
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t v2] tests/xe_create: Use separate VMs per process
Date: Thu, 21 Dec 2023 20:44:08 +0000
Message-ID: <CH0PR11MB54447EF699999A12D73F1EDFE595A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20231220153756.2171550-1-jonathan.cavitt@intel.com>
In-Reply-To: <20231220153756.2171550-1-jonathan.cavitt@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We currently exercise cross-user impact in xe_create by attempting to
concurrently create a large number of exec queues on a single vm using
forked child processes.  This is unrealistic, as multiple users are more
likely to be using separate file descriptors for creating exec queues.

Update the test to reflect this use case.

v2:
- Keep the original test path (which uses a single shared vm across
multiple forked processes) intact, using a flag to denote which path to
take.
- Increase the MAXTIME in the shared vm case.

Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_create.c | 50 ++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 0aa32c788a..6d06708492 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -150,6 +150,11 @@ enum exec_queue_destroy {
 	LEAK
 };
=20
+enum vm_count {
+	MULTI,
+	SHARED
+};
+
 #define MAXEXECQUEUES 2048
 #define MAXTIME 5
=20
@@ -163,16 +168,22 @@ enum exec_queue_destroy {
  *
  * @noleak:				destroy exec_queues in the code
  * @leak:				destroy exec_queues in close() path
+ * @noleak-shared:			same as noleak, but with a shared vm
+ * @leak-shared:			same as leak, but with a shared vm
  */
-static void create_execqueues(int fd, enum exec_queue_destroy ed)
+static void create_execqueues(int fd, enum exec_queue_destroy ed,
+			      enum vm_count vc)
 {
 	struct timespec tv =3D { };
 	uint32_t num_engines, exec_queues_per_process, vm;
 	int nproc =3D sysconf(_SC_NPROCESSORS_ONLN), seconds;
+	int real_timeout =3D MAXTIME * (vc =3D=3D SHARED ? 4 : 1);
=20
-	fd =3D drm_reopen_driver(fd);
-	num_engines =3D xe_number_engines(fd);
-	vm =3D xe_vm_create(fd, 0, 0);
+	if (vc =3D=3D SHARED) {
+		fd =3D drm_reopen_driver(fd);
+		num_engines =3D xe_number_engines(fd);
+		vm =3D xe_vm_create(fd, 0, 0);
+	}
=20
 	exec_queues_per_process =3D max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
 	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_=
per_process);
@@ -184,6 +195,12 @@ static void create_execqueues(int fd, enum exec_queue_=
destroy ed)
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
 		int idx, err, i;
=20
+		if (vc =3D=3D MULTI) {
+			fd =3D drm_reopen_driver(fd);
+			num_engines =3D xe_number_engines(fd);
+			vm =3D xe_vm_create(fd, 0, 0);
+		}
+
 		srandom(n);
=20
 		for (i =3D 0; i < exec_queues_per_process; i++) {
@@ -206,16 +223,23 @@ static void create_execqueues(int fd, enum exec_queue=
_destroy ed)
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 			}
 		}
+
+		if (vc =3D=3D MULTI) {
+			xe_vm_destroy(fd, vm);
+			drm_close_driver(fd);
+		}
 	}
 	igt_waitchildren();
=20
-	xe_vm_destroy(fd, vm);
-	drm_close_driver(fd);
+	if (vc =3D=3D SHARED) {
+		xe_vm_destroy(fd, vm);
+		drm_close_driver(fd);
+	}
=20
 	seconds =3D igt_seconds_elapsed(&tv);
-	igt_assert_f(seconds < MAXTIME,
+	igt_assert_f(seconds < real_timeout,
 		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
-		     MAXEXECQUEUES, seconds, MAXTIME);
+		     MAXEXECQUEUES, seconds, real_timeout);
 }
=20
 /**
@@ -384,10 +408,16 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NU=
LL)
 	}
=20
 	igt_subtest("create-execqueues-noleak")
-		create_execqueues(xe, NOLEAK);
+		create_execqueues(xe, NOLEAK, MULTI);
=20
 	igt_subtest("create-execqueues-leak")
-		create_execqueues(xe, LEAK);
+		create_execqueues(xe, LEAK, MULTI);
+
+	igt_subtest("create-execqueues-noleak-shared")
+		create_execqueues(xe, NOLEAK, SHARED);
+
+	igt_subtest("create-execqueues-leak-shared")
+		create_execqueues(xe, LEAK, SHARED);
=20
 	igt_subtest("create-massive-size") {
 		create_massive_size(xe);
--=20
2.25.1
