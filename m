Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20230131113237.3707217-1-tvrtko.ursulin@linux.intel.com>
 <20230131113237.3707217-9-tvrtko.ursulin@linux.intel.com>
 <CAJs_Fx6viBKQwoRofup8z4ZBcGC6dabvLarzT8aoevBEjQe8Ew@mail.gmail.com>
 <c80ae665-0177-355e-e38c-a7cce5043617@linux.intel.com>
In-Reply-To: <c80ae665-0177-355e-e38c-a7cce5043617@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 6 Apr 2023 07:21:45 -0700
Message-ID: <CAF6AEGvP-AfKW7AtJuz3a020_E15fRa_vmKvNOBy_QQo5-zopQ@mail.gmail.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] gputop: Basic vendor agnostic GPU
 top tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 6, 2023 at 4:08=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 05/04/2023 18:57, Rob Clark wrote:
> > On Tue, Jan 31, 2023 at 3:33=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> Rudimentary vendor agnostic example of how lib_igt_drm_clients can be =
used
> >> to display a sorted by card and usage list of processes using GPUs.
> >>
> >> Borrows a bit of code from intel_gpu_top but for now omits the fancy
> >> features like interactive functionality, card selection, client
> >> aggregation, sort modes, JSON output  and pretty engine names. Also no
> >> support for global GPU or system metrics.
> >>
> >> On the other hand it shows clients from all DRM cards which
> >> intel_gpu_top does not do.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > Reviewed-by: Rob Clark <robdclark@chromium.org>
>
> Presumably for 8/8 only?
>
> The rest of the series does not apply any more by now. I need to rebase..

I didn't look closely at the rest of the series (was kinda assuming
that was mostly just moving things around).. but I see you rebased it
so I can take a look.

BR,
-R

> Regards,
>
> Tvrtko
>
> >
> >> ---
> >>   tools/gputop.c    | 260 ++++++++++++++++++++++++++++++++++++++++++++=
++
> >>   tools/meson.build |   5 +
> >>   2 files changed, 265 insertions(+)
> >>   create mode 100644 tools/gputop.c
> >>
> >> diff --git a/tools/gputop.c b/tools/gputop.c
> >> new file mode 100644
> >> index 000000000000..d259cac1ab17
> >> --- /dev/null
> >> +++ b/tools/gputop.c
> >> @@ -0,0 +1,260 @@
> >> +// SPDX-License-Identifier: MIT
> >> +/*
> >> + * Copyright =C2=A9 2022 Intel Corporation
> >> + */
> >> +
> >> +#include <assert.h>
> >> +#include <ctype.h>
> >> +#include <dirent.h>
> >> +#include <errno.h>
> >> +#include <fcntl.h>
> >> +#include <inttypes.h>
> >> +#include <limits.h>
> >> +#include <locale.h>
> >> +#include <math.h>
> >> +#include <poll.h>
> >> +#include <signal.h>
> >> +#include <stdint.h>
> >> +#include <stdio.h>
> >> +#include <stdlib.h>
> >> +#include <string.h>
> >> +#include <sys/ioctl.h>
> >> +#include <sys/stat.h>
> >> +#include <sys/types.h>
> >> +#include <unistd.h>
> >> +#include <termios.h>
> >> +#include <sys/sysmacros.h>
> >> +#include <stdbool.h>
> >> +
> >> +#include "igt_drm_clients.h"
> >> +#include "igt_drm_fdinfo.h"
> >> +
> >> +static const char *bars[] =3D { " ", "=E2=96=8F", "=E2=96=8E", "=E2=
=96=8D", "=E2=96=8C", "=E2=96=8B", "=E2=96=8A", "=E2=96=89", "=E2=96=88" };
> >> +
> >> +static void n_spaces(const unsigned int n)
> >> +{
> >> +       unsigned int i;
> >> +
> >> +       for (i =3D 0; i < n; i++)
> >> +               putchar(' ');
> >> +}
> >> +
> >> +static void print_percentage_bar(double percent, int max_len)
> >> +{
> >> +       int bar_len, i, len =3D max_len - 2;
> >> +       const int w =3D 8;
> >> +
> >> +       assert(max_len > 0);
> >> +
> >> +       bar_len =3D ceil(w * percent * len / 100.0);
> >> +       if (bar_len > w * len)
> >> +               bar_len =3D w * len;
> >> +
> >> +       putchar('|');
> >> +
> >> +       for (i =3D bar_len; i >=3D w; i -=3D w)
> >> +               printf("%s", bars[w]);
> >> +       if (i)
> >> +               printf("%s", bars[i]);
> >> +
> >> +       len -=3D (bar_len + (w - 1)) / w;
> >> +       n_spaces(len);
> >> +
> >> +       putchar('|');
> >> +}
> >> +
> >> +static int
> >> +print_client_header(struct igt_drm_client *c, int lines, int con_w, i=
nt con_h,
> >> +                   int *engine_w)
> >> +{
> >> +       const char *pidname =3D "    PID               NAME ";
> >> +       int ret, len =3D strlen(pidname);
> >> +
> >> +       if (lines++ >=3D con_h || len >=3D con_w)
> >> +               return lines;
> >> +       printf("\033[7m");
> >> +       ret =3D printf("DRM minor %u", c->drm_minor);
> >> +       n_spaces(con_w - ret);
> >> +
> >> +       if (lines++ >=3D con_h)
> >> +               return lines;
> >> +       printf("\n%s", pidname);
> >> +
> >> +       if (c->engines->num_engines) {
> >> +               unsigned int i;
> >> +               int width;
> >> +
> >> +               *engine_w =3D width =3D (con_w - len) / c->engines->nu=
m_engines;
> >> +
> >> +               for (i =3D 0; i <=3D c->engines->max_engine_id; i++) {
> >> +                       const char *name =3D c->engines->names[i];
> >> +                       int name_len =3D strlen(name);
> >> +                       int pad =3D (width - name_len) / 2;
> >> +                       int spaces =3D width - pad - name_len;
> >> +
> >> +                       if (!name)
> >> +                               continue;
> >> +
> >> +                       if (pad < 0 || spaces < 0)
> >> +                               continue;
> >> +
> >> +                       n_spaces(pad);
> >> +                       printf("%s", name);
> >> +                       n_spaces(spaces);
> >> +                       len +=3D pad + name_len + spaces;
> >> +               }
> >> +       }
> >> +
> >> +       n_spaces(con_w - len);
> >> +       printf("\033[0m\n");
> >> +
> >> +       return lines;
> >> +}
> >> +
> >> +
> >> +static bool
> >> +newheader(const struct igt_drm_client *c, const struct igt_drm_client=
 *pc)
> >> +{
> >> +       return !pc || c->drm_minor !=3D pc->drm_minor;
> >> +}
> >> +
> >> +static int
> >> +print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
> >> +            double t, int lines, int con_w, int con_h,
> >> +            unsigned int period_us, int *engine_w)
> >> +{
> >> +       unsigned int i;
> >> +
> >> +       /* Filter out idle clients. */
> >> +       if (!c->total_runtime || c->samples < 2)
> >> +               return lines;
> >> +
> >> +       /* Print header when moving to a different DRM card. */
> >> +       if (newheader(c, *prevc)) {
> >> +               lines =3D print_client_header(c, lines, con_w, con_h, =
engine_w);
> >> +               if (lines >=3D con_h)
> >> +                       return lines;
> >> +       }
> >> +
> >> +       *prevc =3D c;
> >> +
> >> +       printf("%8u %17s ", c->pid, c->print_name);
> >> +       lines++;
> >> +
> >> +       for (i =3D 0; c->samples > 1 && i <=3D c->engines->max_engine_=
id; i++) {
> >> +               double pct;
> >> +
> >> +               if (!c->engines->capacity[i])
> >> +                       continue;
> >> +
> >> +               pct =3D (double)c->val[i] / period_us / 1e3 * 100 /
> >> +                     c->engines->capacity[i];
> >> +
> >> +               /*
> >> +                * Guard against fluctuations between our scanning per=
iod and
> >> +                * GPU times as exported by the kernel in fdinfo.
> >> +                */
> >> +               if (pct > 100.0)
> >> +                       pct =3D 100.0;
> >> +
> >> +               print_percentage_bar(pct, *engine_w);
> >> +       }
> >> +
> >> +       putchar('\n');
> >> +
> >> +       return lines;
> >> +}
> >> +
> >> +static int
> >> +__client_id_cmp(const struct igt_drm_client *a,
> >> +               const struct igt_drm_client *b)
> >> +{
> >> +       if (a->id > b->id)
> >> +               return 1;
> >> +       else if (a->id < b->id)
> >> +               return -1;
> >> +       else
> >> +               return 0;
> >> +}
> >> +
> >> +static int client_cmp(const void *_a, const void *_b, void *unused)
> >> +{
> >> +       const struct igt_drm_client *a =3D _a;
> >> +       const struct igt_drm_client *b =3D _b;
> >> +       long val_a, val_b;
> >> +
> >> +       /* DRM cards into consecutive buckets first. */
> >> +       val_a =3D a->drm_minor;
> >> +       val_b =3D b->drm_minor;
> >> +       if (val_a > val_b)
> >> +               return 1;
> >> +       else if (val_b > val_a)
> >> +               return -1;
> >> +
> >> +       /*
> >> +        * Within buckets sort by last sampling period aggregated runt=
ime, with
> >> +        * client id as a tie-breaker.
> >> +        */
> >> +       val_a =3D a->last_runtime;
> >> +       val_b =3D b->last_runtime;
> >> +       if (val_a =3D=3D val_b)
> >> +               return __client_id_cmp(a, b);
> >> +       else if (val_b > val_a)
> >> +               return 1;
> >> +       else
> >> +               return -1;
> >> +
> >> +}
> >> +
> >> +int main(int argc, char **argv)
> >> +{
> >> +       unsigned int period_us =3D 2e6;
> >> +       struct igt_drm_clients *clients =3D NULL;
> >> +       int con_w =3D -1, con_h =3D -1;
> >> +
> >> +       clients =3D igt_drm_clients_init(NULL);
> >> +       if (!clients)
> >> +               exit(1);
> >> +
> >> +       igt_drm_clients_scan(clients, NULL, NULL, 0);
> >> +
> >> +       for (;;) {
> >> +               struct igt_drm_client *c, *prevc =3D NULL;
> >> +               int i, engine_w =3D 0, lines =3D 0;
> >> +               struct winsize ws;
> >> +
> >> +               if (ioctl(0, TIOCGWINSZ, &ws) !=3D -1) {
> >> +                       con_w =3D ws.ws_col;
> >> +                       con_h =3D ws.ws_row;
> >> +                       if (con_w =3D=3D 0 && con_h =3D=3D 0) {
> >> +                               /* Serial console. */
> >> +                               con_w =3D 80;
> >> +                               con_h =3D 24;
> >> +                       }
> >> +               }
> >> +
> >> +               igt_drm_clients_scan(clients, NULL, NULL, 0);
> >> +               igt_drm_clients_sort(clients, client_cmp);
> >> +
> >> +               printf("\033[H\033[J");
> >> +
> >> +               igt_for_each_drm_client(clients, c, i) {
> >> +                       assert(c->status !=3D IGT_DRM_CLIENT_PROBE);
> >> +                       if (c->status !=3D IGT_DRM_CLIENT_ALIVE)
> >> +                               break; /* Active clients are first in =
the array. */
> >> +
> >> +                       lines =3D print_client(c, &prevc, (double)peri=
od_us / 1e6,
> >> +                                            lines, con_w, con_h, peri=
od_us,
> >> +                                            &engine_w);
> >> +                       if (lines >=3D con_h)
> >> +                               break;
> >> +               }
> >> +
> >> +               if (lines++ < con_h)
> >> +                       printf("\n");
> >> +
> >> +               usleep(period_us);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> diff --git a/tools/meson.build b/tools/meson.build
> >> index c6194fd15daa..0a3973dee90d 100644
> >> --- a/tools/meson.build
> >> +++ b/tools/meson.build
> >> @@ -65,6 +65,11 @@ if libudev.found()
> >>                     install : true)
> >>   endif
> >>
> >> +executable('gputop', 'gputop.c',
> >> +           install : true,
> >> +           install_rpath : bindir_rpathdir,
> >> +           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,mat=
h])
> >> +
> >>   intel_l3_parity_src =3D [ 'intel_l3_parity.c', 'intel_l3_udev_listen=
er.c' ]
> >>   executable('intel_l3_parity', sources : intel_l3_parity_src,
> >>             dependencies : tool_deps,
> >> --
> >> 2.34.1
> >>
