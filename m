Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76B7C54798
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 14:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6F10E159;
	Tue, 27 Feb 2024 14:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="RpKZPYsI";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950DD10E159
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 14:57:44 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TkgZc0tMTzDqLB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709045864; bh=tK4fw+9RJUM1x25/cPr49xUxmc7GyAHxuRC5HAmRPUI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=RpKZPYsINN3SmQwg+yBWCOaiLhuizGYpP28GT3/FpT/TMBd8nLs4l8eF0W734gM84
 U7jLYejsDGxD3k0oZKmf+r7NfuAOo2P4QNsRcOoo9wpEe7IK5NEcyz9NZV/2JE18qk
 U0mJ9fqA7Ccv13YfQCUvN8Q/KEXCyNKhBJcXJK+Y=
X-Riseup-User-ID: EEA3F9699C319EA76BCD76D53FA1405C1F5C766816C1F2AE03BE89E52825698C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TkgZb3Q2VzJrXD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 14:57:43 +0000 (UTC)
Message-ID: <eedda462-d89a-48f3-8b61-b747a8439883@riseup.net>
Date: Tue, 27 Feb 2024 11:57:40 -0300
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_GitLab=2EPipeline=3A_warning_for_benchmar?=
 =?UTF-8?Q?ks/kms=5Ffb=5Fstress=3A_Add_command-line_options_to_change_the_pl?=
 =?UTF-8?Q?anes_and_writeback_formats?=
To: igt-dev@lists.freedesktop.org
References: <20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net>
 <170898083796.318338.1124473186815883330@8e613ede5ea5>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <170898083796.318338.1124473186815883330@8e613ede5ea5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 26/02/24 17:53, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: benchmarks/kms_fb_stress: Add command-line options to change th=
e planes and writeback formats
> URL   : https://patchwork.freedesktop.org/series/130399/
> State : warning
>=20
> =3D=3D Summary =3D=3D
>=20
> Pipeline status: FAILED.
>=20
> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/11134=
55 for the overview.
>=20
> build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx=
-ci/igt-ci-tags/-/jobs/55524519):
>                          =3D 0
>   2 warnings generated.
>   ninja: build stopped: subcommand failed.
>   ninja: Entering directory `build'
>   [1/959] Generating version.h with a custom command.
>   [2/213] Linking target benchmarks/gem_wsim.
>   [3/213] Compiling C object 'benchmarks/cb1d2fd@@kms_fb_stress@exe/kms=
_fb_stress.c.o'.
>   FAILED: benchmarks/cb1d2fd@@kms_fb_stress@exe/kms_fb_stress.c.o=20
>   clang -Ibenchmarks/cb1d2fd@@kms_fb_stress@exe -Ibenchmarks -I../bench=
marks -I../include -I../include/drm-uapi -I../include/linux-uapi -Ilib -I=
=2E./lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/u=
sr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr=
/include/libdrm/nouveau -I/usr/include/valgrind -Xclang -fcolor-diagnosti=
cs -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu1=
1 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-func=
tion-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmissing-declaratio=
ns -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wn=
ested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -W=
shadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-in=
itializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-com=
pare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3D=
address -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -We=
rror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werro=
r=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3D=
sequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-m=
alloc -fno-builtin-calloc -pthread -MD -MQ 'benchmarks/cb1d2fd@@kms_fb_st=
ress@exe/kms_fb_stress.c.o' -MF 'benchmarks/cb1d2fd@@kms_fb_stress@exe/km=
s_fb_stress.c.o.d' -o 'benchmarks/cb1d2fd@@kms_fb_stress@exe/kms_fb_stres=
s.c.o' -c ../benchmarks/kms_fb_stress.c
>   ../benchmarks/kms_fb_stress.c:207:9: error: initializer element is no=
t a compile-time constant
>           .kms =3D default_kms,
>                  ^~~~~~~~~~~

Strange, I was using gcc and it didn't give this error

>   1 error generated.
>   ninja: build stopped: subcommand failed.
>   section_end:1708980416:step_script
>   section_start:1708980416:cleanup_file_variables
>   Cleaning up project directory and file based variables
>   section_end:1708980418:cleanup_file_variables
>   ERROR: Job failed: exit code 1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags=
/-/pipelines/1113455
