Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Tue, 21 Dec 2021 11:28:50 +0000
Message-ID: <DM6PR11MB4492860E286EBE5F6CB8D1648D7C9@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
 <20211213232914.2523139-5-John.C.Harrison@Intel.com>
In-Reply-To: <20211213232914.2523139-5-John.C.Harrison@Intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 04/11] tests/i915/i915_hangman:
 Explicitly test per engine reset vs full GPU reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Harrison, John C" <john.c.harrison@intel.com>, "IGT-Dev@Lists.FreeDesktop.Org" <IGT-Dev@Lists.FreeDesktop.Org>
Cc: "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
List-ID: <igt-dev@lists.freedesktop.org>

Does this test series cover to prove that it can survive killing one withou=
t killing all the others except RCS+CCS combination(killing one affects oth=
er and shows with the help of reset stats)?


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of John.C.H=
arrison@Intel.com
Sent: 14 December 2021 04:59 AM
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
Subject: [igt-dev] [PATCH i-g-t 04/11] tests/i915/i915_hangman: Explicitly =
test per engine reset vs full GPU reset

From: John Harrison <John.C.Harrison@Intel.com>

Although the hangman test was ensuring that *some* reset functionality was =
enabled, it did not differentiate what kind. The infrastructure required to=
 choose between per engine reset or full GT reset was recently added. So up=
date this test to use it as well.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/i915/i915_hangman.c | 77 +++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c index bd=
787d7b4..f8a48337c 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -323,40 +323,26 @@ static void hangcheck_unterminated(const intel_ctx_t =
*ctx)
 	}
 }
=20
-igt_main
+static void do_tests(const char *name, const char *prefix,
+		     const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
-	const intel_ctx_t *ctx;
-	igt_hang_t hang =3D {};
-
-	igt_fixture {
-		device =3D drm_open_driver(DRIVER_INTEL);
-		igt_require_gem(device);
-
-		ctx =3D intel_ctx_create_all_physical(device);
-
-		hang =3D igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
-
-		sysfs =3D igt_sysfs_open(device);
-		igt_assert(sysfs !=3D -1);
+	char buff[256];
=20
-		igt_require(has_error_state(sysfs));
-	}
-
-	igt_describe("Basic error capture");
-	igt_subtest("error-state-basic")
-		test_error_state_basic();
-
-	igt_describe("Per engine error capture");
-	igt_subtest_with_dynamic("error-state-capture") {
+	snprintf(buff, sizeof(buff), "Per engine error capture (%s reset)", name)=
;
+	igt_describe(buff);
+	snprintf(buff, sizeof(buff), "%s-error-state-capture", prefix);
+	igt_subtest_with_dynamic(buff) {
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
 				test_error_state_capture(ctx, e);
 		}
 	}
=20
-	igt_describe("Per engine hang recovery (spin)");
-	igt_subtest_with_dynamic("engine-hang") {
+	snprintf(buff, sizeof(buff), "Per engine hang recovery (spin, %s reset)",=
 name);
+	igt_describe(buff);
+	snprintf(buff, sizeof(buff), "%s-engine-hang", prefix);
+	igt_subtest_with_dynamic(buff) {
                 int has_gpu_reset =3D 0;
 		struct drm_i915_getparam gp =3D {
 			.param =3D I915_PARAM_HAS_GPU_RESET,
@@ -374,8 +360,10 @@ igt_main
 		}
 	}
=20
-	igt_describe("Per engine hang recovery (invalid CS)");
-	igt_subtest_with_dynamic("engine-error") {
+	snprintf(buff, sizeof(buff), "Per engine hang recovery (invalid CS, %s re=
set)", name);
+	igt_describe(buff);
+	snprintf(buff, sizeof(buff), "%s-engine-error", prefix);
+	igt_subtest_with_dynamic(buff) {
 		int has_gpu_reset =3D 0;
 		struct drm_i915_getparam gp =3D {
 			.param =3D I915_PARAM_HAS_GPU_RESET,
@@ -391,11 +379,46 @@ igt_main
 				test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
 		}
 	}
+}
+
+igt_main
+{
+	const intel_ctx_t *ctx;
+	igt_hang_t hang =3D {};
+
+	igt_fixture {
+		device =3D drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(device);
+
+		ctx =3D intel_ctx_create_all_physical(device);
+
+		hang =3D igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
+
+		sysfs =3D igt_sysfs_open(device);
+		igt_assert(sysfs !=3D -1);
+
+		igt_require(has_error_state(sysfs));
+	}
+
+	igt_describe("Basic error capture");
+	igt_subtest("error-state-basic")
+		test_error_state_basic();
+
=20
 	igt_describe("Check that executing unintialised memory causes a hang");
 	igt_subtest("hangcheck-unterminated")
 		hangcheck_unterminated(ctx);
=20
+	do_tests("GT", "gt", ctx);
+
+	igt_fixture {
+		igt_disallow_hang(device, hang);
+
+		hang =3D igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_=
ENGINE_RESET);
+	}
+
+	do_tests("engine", "engine", ctx);
+
 	igt_fixture {
 		igt_disallow_hang(device, hang);
 		intel_ctx_destroy(device, ctx);
--
2.25.1
