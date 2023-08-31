Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86A910E5DA
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 09:28:56 +0000 (UTC)
Date: Thu, 31 Aug 2023 11:28:51 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ilja Friedel <ihf@google.com>
Message-ID: <20230831112851.2b5c19b7@maurocar-mobl2>
In-Reply-To: <CAAea8Y3a_RjknGcn6-v9CVUVpcmMuASnJKfn73KGtQzbXo0TcA@mail.gmail.com>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-5-mauro.chehab@linux.intel.com>
 <20230710181709.234ki5ihaoh6cj5l@kamilkon-desk1>
 <CAJUqKUo9rKSqQ6h17gbiEWVhQSaAsvwD51_fmpBr+MTm_R7Rug@mail.gmail.com>
 <CAAea8Y3a_RjknGcn6-v9CVUVpcmMuASnJKfn73KGtQzbXo0TcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/7] tests/meson.build: create
 testlists for tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 30 Aug 2023 14:49:10 -0700
Ilja Friedel <ihf@google.com> wrote:

> Hi Mauro,
>=20
> on ChromeOS we are cross-compiling binaries inside of portage/gentoo
> servers for consumer devices. Which means these servers are typically
> unable to execute the binaries. (For instance on Intel and AMD they will
> try to load libdrm_intel.so/libdrm_amdgpu.so even though the servers don't
> have a GPU and don't need these libraries). Hence we have testplan disabl=
ed
> while building on the server. (We run the test binaries later on the
> devices.) Now this change reintroduces executing the compiled binaries on
> the server just when building them, for a testplan phase that will never
> happen on the server. Would it be possible to place the equivalent of "if
> testplan" around this code?
>=20
> As an aside, we don't run into problems compiling for Qualcomm/ARM. I am
> unclear why, as I don't see qemu or similar running. So maybe there alrea=
dy
> is a way to disable this?

Please don't top post. It makes harder to add comments at the right
order :-)

>=20
> Thank you,
>=20
> Ilja.
>=20
> On Wed, Aug 30, 2023 at 2:41=E2=80=AFPM Mark Yacoub <markyacoub@chromium.=
org> wrote:
>=20
> > This is causing issues for IGT ChromeOS. Adding +ihf@google.com for
> > more context.

The testlist files are used for two purposes:

1. for documentation build;
2. for CI automation to run the tests.

While right now Intel CI doesn't depend on the produced testlists,
this may change in the future. So, instead of making the testlist
build dependent of testplan, the better seems to verify if the
build is not a cross-compilation, e. g. with a patch similar to
the enclosed one.

Could you please check if this will address the issue? I don't have
a cross-compilation environment handy to test it, so it would be
easier if you could test it for me.

Regards,
Mauro

---

[PATCH i-g-t] tests/meson.build: only generate testlists on native builds

cross-compiling will produce binaries that don't run at the
build machine. On such cases, we cannot produce testlist files.

Detect it, to avoid IGT builds to fail on cross builds.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

diff --git a/tests/meson.build b/tests/meson.build
index c683e468da78..adb178d0bd39 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -370,11 +370,13 @@ foreach prog : test_progs
 	test_executables +=3D testexe
 	test_list +=3D prog
 	name =3D prog.split('/').get(-1)
-	testlist_files +=3D custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
+	if not meson.is_cross_build()
+		testlist_files +=3D custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
 endforeach
=20
 foreach prog : i915_progs
@@ -387,11 +389,13 @@ foreach prog : i915_progs
 	test_executables +=3D testexe
 	test_list +=3D prog
 	name =3D prog.split('/').get(-1)
-	testlist_files +=3D custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
+	if not meson.is_cross_build()
+		testlist_files +=3D custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
 endforeach
=20
 if build_xe
@@ -405,11 +409,13 @@ if build_xe
 		test_list +=3D prog
 		test_executables +=3D testexe
 		name =3D prog.split('/').get(-1)
-		testlist_files +=3D custom_target(name + '.testlist',
-			     build_by_default : true,
-			     command : [testexe, '--show-testlist'],
-			     capture : true,
-			     output : name + '.testlist')
+		if not meson.is_cross_build()
+			testlist_files +=3D custom_target(name + '.testlist',
+				    build_by_default : true,
+				    command : [testexe, '--show-testlist'],
+				    capture : true,
+				    output : name + '.testlist')
+		endif
 	endforeach
 	build_info +=3D 'Xe **experimental** tests enabled.'
 endif
@@ -435,11 +441,13 @@ if chamelium.found()
 		test_list +=3D prog
 		test_executables +=3D testexe
 		name =3D prog.split('/').get(-1)
-		testlist_files +=3D custom_target(name + '.testlist',
-			     build_by_default : true,
-			     command : [testexe, '--show-testlist'],
-			     capture : true,
-			     output : name + '.testlist')
+		if not meson.is_cross_build()
+			testlist_files +=3D custom_target(name + '.testlist',
+				    build_by_default : true,
+				    command : [testexe, '--show-testlist'],
+				    capture : true,
+				    output : name + '.testlist')
+		endif
 	endforeach
 	test_deps +=3D chamelium
=20
@@ -452,11 +460,13 @@ if chamelium.found()
 				install : true)
 	test_list +=3D name
 	test_executables +=3D testexe
-	testlist_files +=3D custom_target(name + '.testlist',
-		     build_by_default : true,
-		     command : [testexe, '--show-testlist'],
-		     capture : true,
-		     output : name + '.testlist')
+	if not meson.is_cross_build()
+		testlist_files +=3D custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
 endif
=20
 subdir('amdgpu')
@@ -468,11 +478,13 @@ subdir('vc4')
 subdir('vmwgfx')
=20
 gen_testlist =3D find_program('generate_testlist.sh')
-test_list_target =3D custom_target('testlist',
-	      output : 'test-list.txt',
-	      command : [ gen_testlist, '@OUTPUT@', test_list ],
-	      install : true,
-	      install_dir : libexecdir)
+if not meson.is_cross_build()
+	test_list_target =3D custom_target('testlist',
+		    output : 'test-list.txt',
+		    command : [ gen_testlist, '@OUTPUT@', test_list ],
+		    install : true,
+		    install_dir : libexecdir)
+endif
=20
 test_executables +=3D executable('gem_concurrent_all', 'i915/gem_concurren=
t_all.c',
 	   dependencies : test_deps + [ libatomic ],
@@ -481,11 +493,13 @@ test_executables +=3D executable('gem_concurrent_all'=
, 'i915/gem_concurrent_all.c'
 	   install : true)
 test_list +=3D 'gem_concurrent_all'
=20
-test_list_full_target =3D custom_target('testlist-full',
-	      output : 'test-list-full.txt',
-	      command : [ gen_testlist, '@OUTPUT@', test_list ],
-	      install : true,
-	      install_dir : libexecdir)
+if not meson.is_cross_build()
+	test_list_full_target =3D custom_target('testlist-full',
+		    output : 'test-list-full.txt',
+		    command : [ gen_testlist, '@OUTPUT@', test_list ],
+		    install : true,
+		    install_dir : libexecdir)
+endif
=20
 test_script =3D find_program('igt_command_line.sh')
 foreach prog : test_list
@@ -497,11 +511,13 @@ testexe =3D executable('gem_stress', 'i915/gem_stress=
.c',
 	   install_dir : libexecdir,
 	   install_rpath : libexecdir_rpathdir,
 	   dependencies : igt_deps)
-testlist_files +=3D custom_target('gem_stress.testlist',
-                build_by_default : true,
-                command : [testexe, '--show-testlist'],
-                capture : true,
-                output : 'gem_stress.testlist')
+if not meson.is_cross_build()
+	testlist_files +=3D custom_target('gem_stress.testlist',
+			build_by_default : true,
+			command : [testexe, '--show-testlist'],
+			capture : true,
+			output : 'gem_stress.testlist')
+endif
=20
 image_files =3D [
   '1080p-left.png',
