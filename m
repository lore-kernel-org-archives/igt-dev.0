Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A8B10E0C6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 18:48:36 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id z192so18450133yba.0
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Nov 2022 11:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221031163139.73486-1-markyacoub@chromium.org>
 <166723655571.2020.3993909126900647750@emeril.freedesktop.org>
 <CAJUqKUq3We+=cBkBXP4jn2S-KKkg+cd4wLytiKRM_-cd8=+oZQ@mail.gmail.com>
 <Y2DgU6Xl8iHVLxLh@platvala-desk.ger.corp.intel.com>
 <DM4PR11MB6213BC7DC76262039324C25CEC369@DM4PR11MB6213.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6213BC7DC76262039324C25CEC369@DM4PR11MB6213.namprd11.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 1 Nov 2022 14:48:24 -0400
Message-ID: <CAJUqKUqcQ9Q-asRdxBoXPkT18vC9M_yBpe6P-3fQ1HdodD_bzg@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev]
	=?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_k?=
	=?utf-8?q?ms=5Fchamelium=3A_Add_new_EDID_stress_resolution_test_?=
	=?utf-8?b?KHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Rev 4 is good, looks good on the lab. Applied it.

On Tue, Nov 1, 2022 at 1:23 PM Vudum, Lakshminarayana
<lakshminarayana.vudum@intel.com> wrote:
>
> Rev 1 is clean now. But we are Rev 4 and waiting for results?
>
> Lakshmi.
>
> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: Tuesday, November 1, 2022 2:01 AM
> To: Mark Yacoub <markyacoub@chromium.org>
> Cc: Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>; igt-dev@lis=
ts.freedesktop.org
> Subject: Re: [igt-dev] =E2=9C=97 GitLab.Pipeline: warning for kms_chameli=
um: Add new EDID stress resolution test (rev2)
>
> On Mon, Oct 31, 2022 at 01:32:44PM -0400, Mark Yacoub wrote:
> > Hi Lakshminarayana,
> > Something seems off here - I don't think I should modify xf86drmMode
> > in anyway. What do you think is going on? Thanks!
>
> Add #include <stddef.h> to lib/igt_chamelium.h before xf86drmMode.h
>
> --
> Petri Latvala
>
>
>
> >
> > On Mon, Oct 31, 2022 at 1:15 PM Patchwork
> > <patchwork@emeril.freedesktop.org> wrote:
> > >
> > > =3D=3D Series Details =3D=3D
> > >
> > > Series: kms_chamelium: Add new EDID stress resolution test (rev2)
> > > URL   : https://patchwork.freedesktop.org/series/110263/
> > > State : warning
> > >
> > > =3D=3D Summary =3D=3D
> > >
> > > Pipeline status: FAILED.
> > >
> > > see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/725=
691 for the overview.
> > >
> > > build:tests-debian-meson has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/30755321):
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=
=98size_t=E2=80=99
> > >    extern int drmModeCreatePropertyBlob(int fd, const void *data, siz=
e_t size,
> > >                                                                   ^~~=
~~~
> > >   /usr/include/xf86drmMode.h:520:64: note: =E2=80=98size_t=E2=80=99 i=
s defined in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=
=98#include <stddef.h>=E2=80=99?
> > >   /usr/include/xf86drmMode.h:44:1:
> > >   +#include <stddef.h>
> > >
> > >   /usr/include/xf86drmMode.h:520:64:
> > >    extern int drmModeCreatePropertyBlob(int fd, const void *data, siz=
e_t size,
> > >                                                                   ^~~=
~~~
> > >   ninja: build stopped: subcommand failed.
> > >   section_end:1667235976:step_script
> > >   section_start:1667235976:cleanup_file_variables
> > >   Cleaning up project directory and file based variables
> > >   section_end:1667235978:cleanup_file_variables
> > >   ERROR: Job failed: exit code 1
> > >
> > >
> > > build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/30755316):
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=
=98size_t=E2=80=99
> > >     520 | extern int drmModeCreatePropertyBlob(int fd, const void *da=
ta, size_t size,
> > >         |                                                            =
    ^~~~~~
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is =
defined in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98=
#include <stddef.h>=E2=80=99?
> > >      43 | #include <drm.h>
> > >     +++ |+#include <stddef.h>
> > >      44 |
> > >   ninja: build stopped: subcommand failed.
> > >   section_end:1667235986:step_script
> > >   section_start:1667235986:cleanup_file_variables
> > >   Cleaning up project directory and file based variables
> > >   section_end:1667235987:cleanup_file_variables
> > >   ERROR: Job failed: exit code 1
> > >
> > >
> > > build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/30755320):
> > >   [4/983] Linking static target lib/libigt-igt_audio_c.a.
> > >   [5/983] Linking static target lib/libigt-igt_alsa_c.a.
> > >   [6/983] Linking static target lib/libigt-igt_chamelium_stream_c.a.
> > >   [7/983] Compiling C object 'lib/76b5a35@@igt-monitor_edids_monitor_=
edids_helper_c@sta/monitor_edids_monitor_edids_helper.c.o'.
> > >   FAILED: lib/76b5a35@@igt-monitor_edids_monitor_edids_helper_c@sta/m=
onitor_edids_monitor_edids_helper.c.o
> > >   clang -Ilib/76b5a35@@igt-monitor_edids_monitor_edids_helper_c@sta -=
Ilib -I../lib -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/=
syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib6=
4/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/=
include/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr=
/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D6=
4 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include co=
nfig.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statem=
ent -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissin=
g-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wp=
ointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized=
 -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-o=
f-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -W=
no-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplici=
t -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pthread '-=
DIGT_DATADIR=3D"/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/g=
fx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN=3D"monitor_edids/monitor_edids_=
helper"' -MD -MQ 'lib/76b5a35@@igt-monitor_edids_monitor_edids_helper_c@sta=
/monitor_edids_monitor_edids_helper.c.o' -MF 'lib/76b5a35@@igt-monitor_edid=
s_monitor_edids_helper_c@sta/monitor_edids_monitor_edids_helper.c.o.d' -o '=
lib/76b5a35@@igt-monitor_edids_monitor_edids_helper_c@sta/monitor_edids_mon=
itor_edids_helper.c.o' -c ../lib/monitor_edids/monitor_edids_helper.c
> > >   In file included from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   In file included from ../lib/monitor_edids/monitor_edids_helper.h:1=
6:
> > >   In file included from ../lib/igt_chamelium.h:32:
> > >   /usr/include/xf86drmMode.h:520:64: error: unknown type name 'size_t=
'
> > >   extern int drmModeCreatePropertyBlob(int fd, const void *data, size=
_t size,
> > >                                                                  ^
> > >   1 error generated.
> > >   ninja: build stopped: subcommand failed.
> > >   section_end:1667235984:step_script
> > >   section_start:1667235984:cleanup_file_variables
> > >   Cleaning up project directory and file based variables
> > >   section_end:1667235984:cleanup_file_variables
> > >   ERROR: Job failed: exit code 1
> > >
> > >
> > > build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freed=
esktop.org/gfx-ci/igt-ci-tags/-/jobs/30755319):
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=
=98size_t=E2=80=99
> > >     520 | extern int drmModeCreatePropertyBlob(int fd, const void *da=
ta, size_t size,
> > >         |                                                            =
    ^~~~~~
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is =
defined in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98=
#include <stddef.h>=E2=80=99?
> > >      43 | #include <drm.h>
> > >     +++ |+#include <stddef.h>
> > >      44 |
> > >   ninja: build stopped: subcommand failed.
> > >   section_end:1667235978:step_script
> > >   section_start:1667235978:cleanup_file_variables
> > >   Cleaning up project directory and file based variables
> > >   section_end:1667235979:cleanup_file_variables
> > >   ERROR: Job failed: exit code 1
> > >
> > >
> > > build:tests-fedora-no-libunwind has failed (https://gitlab.freedeskto=
p.org/gfx-ci/igt-ci-tags/-/jobs/30755317):
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=
=98size_t=E2=80=99
> > >     520 | extern int drmModeCreatePropertyBlob(int fd, const void *da=
ta, size_t size,
> > >         |                                                            =
    ^~~~~~
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is =
defined in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98=
#include <stddef.h>=E2=80=99?
> > >      43 | #include <drm.h>
> > >     +++ |+#include <stddef.h>
> > >      44 |
> > >   ninja: build stopped: subcommand failed.
> > >   section_end:1667235976:step_script
> > >   section_start:1667235976:cleanup_file_variables
> > >   Cleaning up project directory and file based variables
> > >   section_end:1667235977:cleanup_file_variables
> > >   ERROR: Job failed: exit code 1
> > >
> > >
> > > build:tests-fedora-oldest-meson has failed (https://gitlab.freedeskto=
p.org/gfx-ci/igt-ci-tags/-/jobs/30755318):
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:520:64: error: unknown type name =E2=80=
=98size_t=E2=80=99
> > >     520 | extern int drmModeCreatePropertyBlob(int fd, const void *da=
ta, size_t size,
> > >         |                                                            =
    ^~~~~~
> > >   In file included from ../lib/igt_chamelium.h:32,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.h:1=
6,
> > >                    from ../lib/monitor_edids/monitor_edids_helper.c:1=
1:
> > >   /usr/include/xf86drmMode.h:44:1: note: =E2=80=98size_t=E2=80=99 is =
defined in header =E2=80=98<stddef.h>=E2=80=99; did you forget to =E2=80=98=
#include <stddef.h>=E2=80=99?
> > >      43 | #include <drm.h>
> > >     +++ |+#include <stddef.h>
> > >      44 |
> > >   ninja: build stopped: subcommand failed.
> > >   section_end:1667235989:step_script
> > >   section_start:1667235989:cleanup_file_variables
> > >   Cleaning up project directory and file based variables
> > >   section_end:1667235990:cleanup_file_variables
> > >   ERROR: Job failed: exit code 1
> > >
> > > =3D=3D Logs =3D=3D
> > >
> > > For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-ta=
gs/-/pipelines/725691
