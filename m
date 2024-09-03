Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF10CD13CF
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 11:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B87010E4BB;
	Tue,  3 Sep 2024 11:44:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBB010E4BB;
 Tue,  3 Sep 2024 11:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_runner/executor=2Ec=3A_De?=
 =?utf-8?q?tect_tests_killed_by_a_signal_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Peter Senna Tschudin" <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Sep 2024 11:44:54 -0000
Message-ID: <172536389490.911886.9267235943796992128@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
In-Reply-To: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: runner/executor.c: Detect tests killed by a signal (rev4)
URL   : https://patchwork.freedesktop.org/series/137879/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
d3a77fc98e89cc94b03be2b0903d44f83480b8a0 tests/kms_content_protection: Set =
screen red/green based on CP Status

Tail of build.log:
[949/1767] Generating source from 'assembler/gram.y'.
[950/1767] Compiling C object 'runner/527aa9f@@igt_runner@sta/resultgen.c.o=
'.
[951/1767] Compiling C object 'tools/f9d35d4@@intel_audio_dump@exe/intel_au=
dio_dump.c.o'.
[952/1767] Generating intel_upload_blit_small.1 with a custom command.
[953/1767] Generating intel_vbt_decode.1 with a custom command.
[954/1767] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/=
intel_kms_frontbuffer_tracking.c.o'.
[955/1767] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-p=
erf.c.o'.
[956/1767] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/main.c.=
o'.
[957/1767] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/overl=
ay.c.o'.
[958/1767] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c=
.o'.
[959/1767] Compiling C object 'runner/527aa9f@@igt_runner@sta/executor.c.o'.
FAILED: runner/527aa9f@@igt_runner@sta/executor.c.o=20
cc -Irunner/527aa9f@@igt_runner@sta -Irunner -I../../../usr/src/igt-gpu-too=
ls/runner -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-g=
pu-tools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-ua=
pi -Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-to=
ols/lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include=
/json-c -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/includ=
e -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winval=
id-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTI=
FY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D=
2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-=
format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -=
Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-p=
rototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized =
-Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-m=
ember -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-=
result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARGEFILE6=
4_SOURCE=3D1 -fPIC -DHAVE_OPING=3D1 -MD -MQ 'runner/527aa9f@@igt_runner@sta=
/executor.c.o' -MF 'runner/527aa9f@@igt_runner@sta/executor.c.o.d' -o 'runn=
er/527aa9f@@igt_runner@sta/executor.c.o' -c ../../../usr/src/igt-gpu-tools/=
runner/executor.c
../../../usr/src/igt-gpu-tools/runner/executor.c: In function =E2=80=98moni=
tor_output=E2=80=99:
../../../usr/src/igt-gpu-tools/runner/executor.c:1516:34: error: implicit d=
eclaration of function =E2=80=98sigdescr_np=E2=80=99 [-Werror=3Dimplicit-fu=
nction-declaration]
 1516 |      strsignal(killed), -killed, sigdescr_np(killed));
      |                                  ^~~~~~~~~~~
../../../usr/src/igt-gpu-tools/runner/executor.c:1516:34: warning: nested e=
xtern declaration of =E2=80=98sigdescr_np=E2=80=99 [-Wnested-externs]
../../../usr/src/igt-gpu-tools/runner/executor.c:1515:56: warning: format =
=E2=80=98%s=E2=80=99 expects argument of type =E2=80=98char *=E2=80=99, but=
 argument 5 has type =E2=80=98int=E2=80=99 [-Wformat=3D]
 1515 |    sprintf(buf, "Test terminated by a signal %s (%d): %s\n",
      |                                                       ~^
      |                                                        |
      |                                                        char *
      |                                                       %d
 1516 |      strsignal(killed), -killed, sigdescr_np(killed));
      |                                  ~~~~~~~~~~~~~~~~~~~   =20
      |                                  |
      |                                  int
cc1: some warnings being treated as errors
[960/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_acmgt1.c.o'.
[961/1767] Linking target overlay/intel-gpu-overlay.
[962/1767] Compiling C object 'assembler/1ca89e8@@brw@sta/brw_eu_emit.c.o'.
[963/1767] Compiling C object 'tests/59830eb@@xe_oa@exe/intel_xe_oa.c.o'.
[964/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_acmgt2.c.o'.
[965/1767] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.=
o'.
[966/1767] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meson-g=
enerated_lex.c.o'.
[967/1767] Compiling C object 'tools/f9d35d4@@intel_vbt_decode@exe/intel_vb=
t_decode.c.o'.
[968/1767] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[969/1767] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_g=
em_exec_schedule.c.o'.
[970/1767] Linking target lib/libigt.so.0.
[971/1767] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meson-g=
enerated_gram.c.o'.
[972/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_acmgt3.c.o'.
[973/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_mtlgt2.c.o'.
[974/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_equations.c.o'.
[975/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_mtlgt3.c.o'.
[976/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_acmgt1.c.o'.
[977/1767] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests=
.c.o'.
[978/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_acmgt2.c.o'.
[979/1767] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_acmgt3.c.o'.
ninja: build stopped: subcommand failed.


