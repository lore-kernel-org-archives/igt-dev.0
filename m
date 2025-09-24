Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F3ACAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 14:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8504310E73C;
	Wed, 24 Sep 2025 14:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VB8XHnXb";
	dkim-atps=neutral
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7410710E73C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 14:36:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2698e4795ebso68367155ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758724566; x=1759329366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dmtP7Isjpnv91zSQZtw4xvkfs35aC8ISVIMqgc9O8T8=;
 b=VB8XHnXbo+zWiQwHOjzXYdtRzH4EDrifQcIgXog2y2XnuyGalL+C/iXGTZL5PFDgTH
 8iNg8d/Wr3LNa9Kdlxl6iAMSMvAYZfb3iywUYOOOS9FVIlh8idy15WxxLBt4pHFLiXu1
 cMqhb3hebIUzXEHc9fblq11dx0RXHIfBS7fGr1K2rDZLbxCsZWiqW5o27Om3kmpNRDli
 S0dZU6d+zsNAwQSifG7maf497m+1m7J+5e+swgf90+HubcA5/1TzvaqO8dMnoKp5zNqO
 mlM3GfQuplgOSJ1Rdyqz5aWB4zeiMIjvMg2MatdP0SSlzb1RDTdMtEg58lbXVmYJkBAd
 oTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758724566; x=1759329366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dmtP7Isjpnv91zSQZtw4xvkfs35aC8ISVIMqgc9O8T8=;
 b=DgY/FhB8tMIqPfQeGbM1i96pl4TNrQyioO8dhY/xCQGm9TsWLUvXq8r1VbAT59VntW
 /eP4L6MTXos7U0adV7xd5Hxi/+dc2O4dGXK5oTFafXQQJpdLMJGzu0nc6MHAGTQelQWB
 IRNfQLoCJoXZp1+1BCXyx8/gzfMPFUSrKrFhNjrgLTa7QPZpXD/+7+TSuN3G/8q7Iesx
 FhngQfZX9wFRkyEuUI9L1pyvvEcGrj8srzC5Xisl+nntPhc6lYcVu5je1nFcGrLJNLPH
 WYxgv1MxXGSYesHjMxw3XNlNINd6zYp955041JvAB5I45+V6f+2odKwvKP/Ktv15NYQf
 OThw==
X-Gm-Message-State: AOJu0YzCOsES3TiOuJTbjB7wAYhVdNYffw+zglGHxnEdLvG42/LV2A19
 cKcULlucI7QJ7bn9FdvT/iIQOSWeCqjB6d9mv47wUl9AlJZaS9Q9d0e4aI/92LGcwcsiXhCPLz4
 hnZP0D/4qmZ8I3/rJcpB1IgvI8zgSxgM=
X-Gm-Gg: ASbGncvSwYKi7jMfAAUxqRDSowAlaXsVlyt3wn7AOGzlLdTCS7FIDQqL5ko1RKKpP4S
 kej+Z1ibmEZn/tz5kFDVbr6aU9OxBdGU2E7oULPcu4WsaAA+dD7Ae8kM4UW7Aeiv4c80ZHREipG
 5UzsTzTmSm+feX198x38ao20tM0+c35b+F/qiRwVL35K6wHFLzNtto8R6O0CeIHixtlmDg/UhWC
 6mwdGG84A==
X-Google-Smtp-Source: AGHT+IEh/TtOXI24xWo8gm7o/CPfhKDztB6Yiurn4rPwq+vE+9f/x7zSf8pE0yhY7jEfSzWBoJcND91E4UFPqleLiNY=
X-Received: by 2002:a17:902:e741:b0:268:500:5ec7 with SMTP id
 d9443c01a7336-27cc09e3cddmr90395235ad.2.1758724565631; Wed, 24 Sep 2025
 07:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250924133038.45835-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250924133038.45835-1-kamil.konieczny@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 24 Sep 2025 17:35:54 +0300
X-Gm-Features: AS18NWCULtdtIjCOu6-6IHIBJi9uSF4kgCCPs5PrHhGFgkLyNftgNe--k_lx-HM
Message-ID: <CAJ=qYWTg+HCtEf9qpc7hd_8h81QCVcXhUWpRBLO-7YPW2kvbjg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] Revert "tools/gputop/gputop: Enable support for
 multiple GPUs and instances"
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, 
 Soham Purkait <soham.purkait@intel.com>, Riana Tauro <riana.tauro@intel.com>, 
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Wed, Sep 24, 2025 at 4:30=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> This reverts commit 08eb5310bd1d4c9bfee7e268e7e6242d3283b28e.
>
> It introduced regression, it fails to run with non-root:
>
> tursulin@x1:~$ ~/build/igt-gpu-tools/build/tools/gputop/gputop
> (gputop:18642) xe/xe_query-CRITICAL: Test assertion failure function
> xe_query_config_new, file ../lib/xe/xe_query.c:38:
> (gputop:18642) xe/xe_query-CRITICAL: Failed assertion: igt_ioctl(fd,
>
> 11880 openat(AT_FDCWD, "/dev/dri/card0", O_RDWR) =3D -1 EACCES (Permissio=
n
> denied)
>
> and when run with root it prevents running kms test:
>
> IGT-Version: 2.1-g3f9506ebd (x86_64) (Linux: 6.17.0-rc7+ x86_64)
> Using IGT_SRANDOM=3D1758710179 for randomisation
> Opened device: /dev/dri/card0
> (kms_flip_tiling:18628) igt_debugfs-WARNING: clients:
>               command  tgid dev master a   uid      magic
>                                               name                   id
>                gputop 18625   0   y    y     0          0
>                                            <unset>                   95
>       kms_flip_tiling 18628   0   n    y     0          0
>                                            <unset>                   96
> Test requirement not met in function igt_device_set_master, file
> ../lib/igt_device.c:65:
> Test requirement: __igt_device_set_master(fd) =3D=3D 0
> Can't become DRM master, please check if no other DRM client is running.
>
> I checked previous gputop and it works fine with i915,
> current one fails:
>
> kamil$ build/tools/gputop/gputop
> No device found.
>
> ls /dev/dri
> by-path  card1  renderD128
>
> Reported-by: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/{gputop =3D> }/gputop.c | 236 ++++++------------------------------
>  tools/gputop/meson.build    |   6 -
>  tools/meson.build           |   6 +-
>  3 files changed, 44 insertions(+), 204 deletions(-)
>  rename tools/{gputop =3D> }/gputop.c (65%)
>  delete mode 100644 tools/gputop/meson.build
>
> diff --git a/tools/gputop/gputop.c b/tools/gputop.c
> similarity index 65%
> rename from tools/gputop/gputop.c
> rename to tools/gputop.c
> index 3e1f3badc..f577a1750 100644
> --- a/tools/gputop/gputop.c
> +++ b/tools/gputop.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: MIT
>  /*
> - * Copyright =C2=A9 2023-2025 Intel Corporation
> + * Copyright =C2=A9 2023 Intel Corporation
>   */
>
>  #include <assert.h>
> @@ -14,149 +14,66 @@
>  #include <math.h>
>  #include <poll.h>
>  #include <signal.h>
> -#include <stdbool.h>
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
>  #include <sys/stat.h>
> -#include <sys/sysmacros.h>
>  #include <sys/types.h>
> -#include <termios.h>
>  #include <unistd.h>
> +#include <termios.h>
> +#include <sys/sysmacros.h>
> +#include <stdbool.h>
>
> -#include "drmtest.h"
>  #include "igt_core.h"
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
> -#include "igt_perf.h"
>  #include "igt_profiling.h"
> -#include "xe_gputop.h"
> -#include "xe/xe_query.h"
> -
> -/**
> - * Supported Drivers
> - *
> - * Adhere to the following requirements when implementing support for th=
e
> - * new driver:
> - * @drivers: Update drivers[] with driver string.
> - * @sizeof_gputop_obj: Update this function as per new driver support in=
cluded.
> - * @operations: Update the respective operations of the new driver:
> - * gputop_init,
> - * discover_engines,
> - * pmu_init,
> - * pmu_sample,
> - * print_engines,
> - * clean_up
> - * @per_driver_contexts: Update per_driver_contexts[] array of type "str=
uct gputop_driver" with the
> - * initial values.
> - */
> -static const char * const drivers[] =3D {
> -       "xe",
> -    /* Keep the last one as NULL */
> -       NULL
> -};
> -
> -static size_t sizeof_gputop_obj(int driver_num)
> -{
> -       switch (driver_num) {
> -       case 0:
> -               return sizeof(struct xe_gputop);
> -       default:
> -               fprintf(stderr,
> -                       "Driver number does not exist.\n");
> -               exit(EXIT_FAILURE);
> -       }
> -}
> -
> -/**
> - * Supported operations on driver instances. Update the ops[] array for
> - * each individual driver specific function. Maintain the sequence as pe=
r
> - * drivers[] array.
> - */
> -struct device_operations ops[] =3D {
> -       {
> -               xe_gputop_init,
> -               xe_populate_engines,
> -               xe_pmu_init,
> -               xe_pmu_sample,
> -               xe_print_engines,
> -               xe_clean_up
> -       }
> -};
> -
> -/*
> - * per_driver_contexts[] array of type struct gputop_driver which keeps =
track of the devices
> - * and related info discovered per driver.
> - */
> -struct gputop_driver per_driver_contexts[] =3D {
> -       {false, 0, NULL}
> -};
> +#include "drmtest.h"
>
>  enum utilization_type {
>         UTILIZATION_TYPE_ENGINE_TIME,
>         UTILIZATION_TYPE_TOTAL_CYCLES,
>  };
>
> -static void gputop_clean_up(void)
> -{
> -       for (int i =3D 0; drivers[i]; i++) {
> -               ops[i].clean_up(per_driver_contexts[i].instances, per_dri=
ver_contexts[i].len);
> -               free(per_driver_contexts[i].instances);
> -               per_driver_contexts[i].device_present =3D false;
> -               per_driver_contexts[i].len =3D 0;
> -       }
> -}
> +static const char *bars[] =3D { " ", "=E2=96=8F", "=E2=96=8E", "=E2=96=
=8D", "=E2=96=8C", "=E2=96=8B", "=E2=96=8A", "=E2=96=89", "=E2=96=88" };
> +
> +#define ANSI_HEADER "\033[7m"
> +#define ANSI_RESET "\033[0m"
>
> -static int find_driver(struct igt_device_card *card)
> +static void n_spaces(const unsigned int n)
>  {
> -       for (int i =3D 0; drivers[i]; i++) {
> -               if (strcmp(drivers[i], card->driver) =3D=3D 0)
> -                       return i;
> -       }
> -       return -1;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < n; i++)
> +               putchar(' ');
>  }
>
> -static int populate_device_instances(const char *filter)
> +static void print_percentage_bar(double percent, int max_len)
>  {
> -       struct igt_device_card *cards =3D NULL;
> -       struct igt_device_card *card_inplace =3D NULL;
> -       struct gputop_driver *driver_entry =3D  NULL;
> -       int driver_no;
> -       int count, final_count =3D 0;
> -
> -       count =3D igt_device_card_match_all(filter, &cards);
> -       for (int j =3D 0; j < count; j++) {
> -               if (strcmp(cards[j].subsystem, "pci") !=3D 0)
> -                       continue;
> +       int bar_len, i, len =3D max_len - 1;
> +       const int w =3D 8;
>
> -               driver_no =3D find_driver(&cards[j]);
> -               if (driver_no < 0)
> -                       continue;
> +       len -=3D printf("|%5.1f%% ", percent);
>
> -               driver_entry =3D &per_driver_contexts[driver_no];
> -               if (!driver_entry->device_present)
> -                       driver_entry->device_present =3D true;
> -               driver_entry->len++;
> -               driver_entry->instances =3D realloc(driver_entry->instanc=
es,
> -                                                 driver_entry->len * siz=
eof_gputop_obj(driver_no));
> -               if (!driver_entry->instances) {
> -                       fprintf(stderr,
> -                               "Device instance realloc failed (%s)\n",
> -                               strerror(errno));
> -                       exit(EXIT_FAILURE);
> -               }
> -               card_inplace =3D (struct igt_device_card *)
> -                               calloc(1, sizeof(struct igt_device_card))=
;
> -               memcpy(card_inplace, &cards[j], sizeof(struct igt_device_=
card));
> -               ops[driver_no].gputop_init(driver_entry->instances, (driv=
er_entry->len - 1),
> -                       card_inplace);
> -               final_count++;
> -       }
> -       if (count)
> -               free(cards);
> -       return final_count;
> +       /* no space left for bars, do what we can */
> +       if (len < 0)
> +               len =3D 0;
> +
> +       bar_len =3D ceil(w * percent * len / 100.0);
> +       if (bar_len > w * len)
> +               bar_len =3D w * len;
> +
> +       for (i =3D bar_len; i >=3D w; i -=3D w)
> +               printf("%s", bars[w]);
> +       if (i)
> +               printf("%s", bars[i]);
> +
> +       len -=3D (bar_len + (w - 1)) / w;
> +       n_spaces(len);
> +
> +       putchar('|');
>  }
>
>  static int
> @@ -416,7 +333,6 @@ static void clrscr(void)
>  struct gputop_args {
>         long n_iter;
>         unsigned long delay_usec;
> -       char *device;
>  };
>
>  static void help(char *full_path)
> @@ -434,18 +350,16 @@ static void help(char *full_path)
>                "\t-h, --help                show this help\n"
>                "\t-d, --delay =3DSEC[.TENTHS] iterative delay as SECS [.T=
ENTHS]\n"
>                "\t-n, --iterations =3DNUMBER  number of executions\n"
> -              "\t-D, --device              Device filter\n"
>                , short_program_name);
>  }
>
>  static int parse_args(int argc, char * const argv[], struct gputop_args =
*args)
>  {
> -       static const char cmdopts_s[] =3D "hn:d:D:";
> +       static const char cmdopts_s[] =3D "hn:d:";
>         static const struct option cmdopts[] =3D {
>                {"help", no_argument, 0, 'h'},
>                {"delay", required_argument, 0, 'd'},
>                {"iterations", required_argument, 0, 'n'},
> -              {"device", required_argument, 0, 'D'},
>                { }
>         };
>
> @@ -453,7 +367,6 @@ static int parse_args(int argc, char * const argv[], =
struct gputop_args *args)
>         memset(args, 0, sizeof(*args));
>         args->n_iter =3D -1;
>         args->delay_usec =3D 2 * USEC_PER_SEC;
> -       args->device =3D NULL;
>
>         for (;;) {
>                 int c, idx =3D 0;
> @@ -477,9 +390,6 @@ static int parse_args(int argc, char * const argv[], =
struct gputop_args *args)
>                                 return -1;
>                         }
>                         break;
> -               case 'D':
> -                       args->device =3D optarg;
> -                       break;
>                 case 'h':
>                         help(argv[0]);
>                         return 0;
> @@ -519,55 +429,6 @@ int main(int argc, char **argv)
>         n =3D args.n_iter;
>         period_us =3D args.delay_usec;
>
> -       if (!populate_device_instances(args.device ? args.device
> -                                      : "device:subsystem=3Dpci,card=3Da=
ll")) {
> -               printf("No device found.\n");
> -               gputop_clean_up();
> -               exit(1);
> -       }
> -
> -       for (int i =3D 0; drivers[i]; i++) {
> -               if (!per_driver_contexts[i].device_present)
> -                       continue;
> -
> -               for (int j =3D 0; j < per_driver_contexts[i].len; j++) {
> -                       if (!ops[i].init_engines(per_driver_contexts[i].i=
nstances, j)) {
> -                               fprintf(stderr,
> -                                       "Failed to initialize engines! (%=
s)\n",
> -                                       strerror(errno));
> -                                       gputop_clean_up();
> -                               return EXIT_FAILURE;
> -                       }
> -                       ret =3D ops[i].pmu_init(per_driver_contexts[i].in=
stances, j);
> -
> -                       if (ret) {
> -                               fprintf(stderr,
> -                                       "Failed to initialize PMU! (%s)\n=
",
> -                                       strerror(errno));
> -                               if (errno =3D=3D EACCES && geteuid())
> -                                       fprintf(stderr,
> -                                               "\n"
> -                                               "When running as a normal=
 user CAP_PERFMON is required to access performance\n"
> -                                               "monitoring. See \"man 7 =
capabilities\", \"man 8 setcap\", or contact your\n"
> -                                               "distribution vendor for =
assistance.\n"
> -                                               "\n"
> -                                               "More information can be =
found at 'Perf events and tool security' document:\n"
> -                                               "https://www.kernel.org/d=
oc/html/latest/admin-guide/perf-security.html\n");
> -
> -                               igt_devices_free();
> -                               gputop_clean_up();
> -                               return EXIT_FAILURE;
> -                       }
> -               }
> -       }
> -
> -       for (int i =3D 0; drivers[i]; i++) {
> -               for (int j =3D 0;
> -                    per_driver_contexts[i].device_present && j < per_dri=
ver_contexts[i].len;
> -                    j++)
> -                       ops[i].pmu_sample(per_driver_contexts[i].instance=
s, j);
> -       }
> -
>         clients =3D igt_drm_clients_init(NULL);
>         if (!clients)
>                 exit(1);
> @@ -588,33 +449,14 @@ int main(int argc, char **argv)
>
>         while ((n !=3D 0) && !stop_top) {
>                 struct igt_drm_client *c, *prevc =3D NULL;
> -               int k, engine_w =3D 0, lines =3D 0;
> +               int i, engine_w =3D 0, lines =3D 0;
>
>                 igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> -
> -               for (int i =3D 0; drivers[i]; i++) {
> -                       for (int j =3D 0;
> -                            per_driver_contexts[i].device_present &&
> -                            j < per_driver_contexts[i].len;
> -                            j++)
> -                               ops[i].pmu_sample(per_driver_contexts[i].=
instances, j);
> -               }
> -
>                 igt_drm_clients_sort(clients, client_cmp);
>
>                 update_console_size(&con_w, &con_h);
>                 clrscr();
>
> -               for (int i =3D 0; drivers[i]; i++) {
> -                       for (int j =3D 0;
> -                            per_driver_contexts[i].device_present &&
> -                            j < per_driver_contexts[i].len;
> -                            j++) {
> -                               lines =3D ops[i].print_engines(per_driver=
_contexts[i].instances, j,
> -                                                        lines, con_w, co=
n_h);
> -                       }
> -               }
> -
>                 if (!clients->num_clients) {
>                         const char *msg =3D " (No GPU clients yet. Start =
workload to see stats)";
>
> @@ -622,7 +464,7 @@ int main(int argc, char **argv)
>                                (int)(con_w - strlen(msg) - 1), msg);
>                 }
>
> -               igt_for_each_drm_client(clients, c, k) {
> +               igt_for_each_drm_client(clients, c, i) {
>                         assert(c->status !=3D IGT_DRM_CLIENT_PROBE);
>                         if (c->status !=3D IGT_DRM_CLIENT_ALIVE)
>                                 break; /* Active clients are first in the=
 array. */
> @@ -646,11 +488,11 @@ int main(int argc, char **argv)
>         }
>
>         igt_drm_clients_free(clients);
> -       gputop_clean_up();
>
>         if (profiled_devices !=3D NULL) {
>                 igt_devices_configure_profiling(profiled_devices, false);
>                 igt_devices_free_profiling(profiled_devices);
>         }
> +
>         return 0;
>  }
> diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> deleted file mode 100644
> index f82962834..000000000
> --- a/tools/gputop/meson.build
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -gputop_src =3D [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> -executable('gputop',
> -          sources : gputop_src,
> -           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib=
_igt_drm_fdinfo,lib_igt_profiling,math],
> -           install : true,
> -           install_rpath : bindir_rpathdir)
> diff --git a/tools/meson.build b/tools/meson.build
> index 99a732942..8185ba160 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -70,6 +70,11 @@ if libudev.found()
>                    install : true)
>  endif
>
> +executable('gputop', 'gputop.c',
> +           install : true,
> +           install_rpath : bindir_rpathdir,
> +           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_ig=
t_profiling,math])
> +
>  intel_l3_parity_src =3D [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c=
' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
>            dependencies : tool_deps,
> @@ -118,4 +123,3 @@ endif
>  subdir('i915-perf')
>  subdir('xe-perf')
>  subdir('null_state_gen')
> -subdir('gputop')
> --
> 2.51.0
>
