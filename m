Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB24D5A6F2
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 08:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44EC10E08A;
	Tue, 26 Nov 2024 08:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KDm7k9hD";
	dkim-atps=neutral
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C012E10E08A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 08:07:49 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-724f1004c79so2177183b3a.2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732608469; x=1733213269; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoPwKzufAQQfOUG9QXqegS8LSLzWJk69/ETnHOmCw7Q=;
 b=KDm7k9hDAuCXBo9NkvMbK58gNHNOKoj9mCjKmOsDcW4s6/tOsNzCFXzQMrI3ZGHMXw
 S6zq5iESS6xV1uhj7eCy78mkv8yLMOr6ZaU26b1+f9h5WgtHyB71UqWe0MvDR5gd7qKJ
 hFNKp4lqpxBCwfcu90hYjMFN/67mPTmfMX1wuyR6JMDERBqC5H62xupH85C+uKXyBdWU
 IGJw6r0avWsIxsmCgfcRx3+T53/xo+YSBpqB/r59JI9TXs2CpQ4XD0xtlTmjPN6AIDDp
 CGJiufcIx16dk6fHn3Eo43Cz5aKlnxepXutQznukCoadKVWiZq7axp+kyoAcNVUHVRqS
 TABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732608469; x=1733213269;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PoPwKzufAQQfOUG9QXqegS8LSLzWJk69/ETnHOmCw7Q=;
 b=SS01S5LCiecLYLmL0THS1yc+uuCskp7peNf+4Xq89fzdaT0F2DmvNqsYA+YWLgJpAH
 Ym2iruKfAkjrOC48F452odC/dKl4EZHE/p5CLUBEsYTs+DqG9GmTH89Dw1bOolElrU4v
 sFntS6jd/CDZTc2k1Sern8nggfsUDjYKlIi3o+93B3YKmXmUzYpVTAAW0Z2Zinx+gofw
 J33B2HXpZ2ctPIGGcaDDtXBjJ/NQkz127Bs/1riMfDBjsfbp1PrUMyG3OilwVIQ3bs9C
 TKuncSO6xGiOEuWMCeMjgRJ2nzZwOOQqsw+c60maKEsSvEVDLyBA+JHN3Xvdoj8LRcDO
 lrvQ==
X-Gm-Message-State: AOJu0YziMnyC4JIekkro2uG6O5UM0bVXIcwCheqScDXaHEMVDNxC9KTL
 t/ntASIocCDtKT0I0rFXFMYLEXGVx52IYxD+WgJE7Z/78m3FLnve+C5Wam+/zSTvMF559Yi0bBH
 JOonK598o4AsogwJPRBgGmojTpOoStS13b58=
X-Gm-Gg: ASbGncu/DuW38jEAsDYxXQ5Wq9SNesQZ3fouUDg9ztMrpa8duxlg92PhKPIIpMG9eSF
 tqF3jTaewtGwJer86QLmoNUG6yNOqDR5TVA==
X-Google-Smtp-Source: AGHT+IFHXGRxMd3Ye75CIR9pb8ZDwitpNN8EyAZprhKfXHBrZQsHlj7NymfRUjO1x9c/ZfWq/d4cGQgnEt8ZF2iGexg=
X-Received: by 2002:a17:902:f681:b0:212:37e:3fd4 with SMTP id
 d9443c01a7336-2129f2b7457mr203409525ad.57.1732608468931; Tue, 26 Nov 2024
 00:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
 <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
 <Z0S_9YaQta79ooeQ@intel.com>
 <CAJ=qYWRYeg7mbbQGAGHbkHu8sAC0+Rq5J2CfZinFVniX7jsjMg@mail.gmail.com>
In-Reply-To: <CAJ=qYWRYeg7mbbQGAGHbkHu8sAC0+Rq5J2CfZinFVniX7jsjMg@mail.gmail.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 26 Nov 2024 10:07:37 +0200
Message-ID: <CAJ=qYWQfxw4DoeRGaf_EwJN0DYM0BxUaWQofFhs6mHKRqOG_rA@mail.gmail.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
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

Seems I accidentally replied only to Rodrigo so I'll add igt-dev back here.

On Mon, Nov 25, 2024 at 10:03=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
<juhapekka.heikkila@gmail.com> wrote:
>
> On Mon, Nov 25, 2024 at 8:20=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.=
com> wrote:
> >
> > On Mon, Nov 25, 2024 at 06:19:58PM +0200, Juha-Pekka Heikkila wrote:
> > > Add hibernate test which bring entire system down for short
> > > hibernate. This mode is added to suspend tests to be run
> > > manually with '-r' flag because this is not ci friendly test,
> > > on hibernate ci would lose connection to the hibernated box.
> >
> > I know that nowadays it is a beast to get hibernate to work in the dist=
ros,
> > but afaik our CI is prepared for that, otherwise we wouldn't be able to
> > get these:
> >
> > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=3Ds4
>
> If you go see those test machine bootlogs you see there is no resume
> configured. I think all these current s4 tests work with pm_test hence
> also original problem where tests didn't reproduce that broken ccs
> after resume. If you try running on your own box any of these s4 tests
> you'll see they don't go fully down. I wanted to have a test that does
> the same as real hibernate.
>
> >
> > >
> > > For this test to work kernel resume point need to be set using swapfi=
le, from
> > > kernel command line is checked if there is found something along the =
lines of
> > > "resume=3D/dev/nvme0n1p2 resume_offset=3D73527296" or so to verify hi=
bernate
> > > will be successfull.
> >
> > Indeed painful nowadays... I can't even believe this gap came from user
> > report... is anyone really still using hibernation nowadays?! :)
> >
> > >
> > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> > >  tests/intel/kms_ccs.c | 162 ++++++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 159 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > > index 3e9a57863..fd2fe9d3d 100644
> > > --- a/tests/intel/kms_ccs.c
> > > +++ b/tests/intel/kms_ccs.c
> > > @@ -190,6 +190,7 @@ typedef struct {
> > >       bool user_seed;
> > >       enum igt_commit_style commit;
> > >       int fb_list_length;
> > > +     bool do_hibernate;
> > >       struct {
> > >               struct igt_fb fb;
> > >               int width, height;
> > > @@ -271,6 +272,154 @@ static const struct {
> > >   */
> > >  #define MAX_SPRITE_PLANE_WIDTH 2000
> > >
> > > +/* constants for hibenate test */
> > > +#define RTC_WAKE_CMD "rtcwake -m no -s %d"
> >
> > Why are you calling rtcwake directly instead of using
> > igt_system_suspend_autoresume(SUSPEND_STATE_DISK...) ?!
> >
> > Please check lib/igt_aux lib/igt_pm and tests/xe/xe_pm
>
> I wanted rtc only to wake up the machine. On
> igt_system_suspend_autoresume(..) I'd get pm_test handling which I
> want to avoid here.
>
> >
> > > +#define PROC_CMDLINE "/proc/cmdline"
> > > +#define SYS_POWER_STATE "/sys/power/state"
> > > +#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
> > > +
> > > +static void check_hibernation_support(void)
> > > +{
> > > +     int fd;
> > > +     char buffer[2048];
> > > +     ssize_t bytes_read;
> > > +     FILE *cmdline;
> > > +
> > > +     /* Check if hibernation is supported in /sys/power/state */
> > > +     fd =3D open(SYS_POWER_STATE, O_RDONLY);
> > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > +     bytes_read =3D read(fd, buffer, sizeof(buffer) - 1);
> > > +     close(fd);
> > > +
> > > +     igt_require_f(bytes_read > 0, "Failed to read /sys/power/state"=
);
> > > +
> > > +     buffer[bytes_read] =3D '\0';
> > > +     igt_require_f(strstr(buffer, "disk") !=3D NULL,
> > > +                   "Hibernation (suspend to disk) is not supported o=
n this system.\n");
> > > +
> > > +     /* Check if resume is configured in kernel command line */
> > > +     cmdline =3D fopen(PROC_CMDLINE, "r");
> > > +     igt_require_f(cmdline, "Failed to open /proc/cmdline");
> > > +     fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> > > +     fclose(cmdline);
> > > +
> > > +     igt_require_f(strstr(buffer, "resume=3D"),
> > > +                   "Kernel does not have 'resume' parameter configur=
ed for hibernation.\n");
> > > +}
> >
> > we should probably have this in the igt_pm lib to be used in other plac=
es
> > like xe_pm. I remember we had discussions when s4 started failing in CI=
,
> > but apparently the solution was to make CI to work with it instead of
> > protecting our s4 tests...
>
> I was last week talking with Jari Tahvanainen about this. Our ci is
> not configured for the machines really hibernating, he suggested we
> first start with one test, start to run it in special box, and we go
> on from there .. so, here we are :)
> I agree final destination for this function should be in lib/ like in
> igt_pm or so.
>
> >
> > > +
> > > +static void set_rtc_wake_timer(int seconds)
> > > +{
> > > +     char command[256];
> > > +
> > > +     snprintf(command, sizeof(command), RTC_WAKE_CMD, seconds);
> > > +
> > > +     igt_require_f(system(command) =3D=3D 0,
> > > +                   "Failed to set RTC wake timer.\n");
> > > +}
> > > +
> > > +static void hibernate_system(void)
> > > +{
> > > +     int fd;
> > > +
> > > +     fd =3D open(SYS_POWER_STATE, O_WRONLY);
> > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > +
> > > +     if (write(fd, "disk", 4) !=3D 4) {
> > > +             close(fd);
> > > +             igt_require_f(0, "Failed to write 'disk' to /sys/power/=
state");
> > > +     }
> > > +     close(fd);
> > > +}
> > > +
> > > +static void ensure_grub_boots_same_kernel(void)
> >
> > I don't believe that this should be to the test case to ensure.
> > This should be ensured by the infra to support these s4 testcases.
>
> This is bit so-so. If guys would run this test on their own boxes to
> do some debugging, forgetting to always set the correct kernel for the
> next in-test reboot would cause incorrect results.
>
> >
> > > +{
> > > +     char cmdline[1024];
> > > +     char current_kernel[256];
> > > +     char last_menuentry[512] =3D "";
> > > +     char grub_entry[512];
> > > +     char command[1024];
> > > +     FILE *cmdline_file, *grub_cfg;
> > > +     char line[1024];
> > > +     bool kernel_found =3D false;
> > > +     char *kernel_arg;
> > > +     char *kernel_end;
> > > +
> > > +     /* Read /proc/cmdline to get the current kernel image */
> > > +     cmdline_file =3D fopen(PROC_CMDLINE, "r");
> > > +     igt_require_f(cmdline_file, "Failed to open /proc/cmdline");
> > > +
> > > +     if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> > > +             fclose(cmdline_file);
> > > +             igt_require_f(0, "Failed to read /proc/cmdline");
> > > +     }
> > > +     fclose(cmdline_file);
> > > +
> > > +     /* Parse the kernel image from cmdline */
> > > +     kernel_arg =3D strstr(cmdline, "BOOT_IMAGE=3D");
> > > +     igt_require_f(kernel_arg, "BOOT_IMAGE=3D not found in /proc/cmd=
line\n");
> > > +
> > > +     kernel_arg +=3D strlen("BOOT_IMAGE=3D");
> > > +     kernel_end =3D strchr(kernel_arg, ' ');
> > > +
> > > +     if (!kernel_end)
> > > +             kernel_end =3D kernel_arg + strlen(kernel_arg);
> > > +
> > > +     snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> > > +              (int)(kernel_end - kernel_arg), kernel_arg);
> > > +     igt_debug("Current kernel image: %s\n", current_kernel);
> > > +
> > > +     /* Open GRUB config file to find matching entry */
> > > +     grub_cfg =3D fopen(GRUB_CFG_PATH, "r");
> > > +     igt_require_f(grub_cfg, "Failed to open GRUB configuration file=
");
> > > +
> > > +
> > > +     while (fgets(line, sizeof(line), grub_cfg)) {
> > > +             /* Check if the line contains a menuentry */
> > > +             if (strstr(line, "menuentry")) {
> > > +             /* Store the menuentry line */
> > > +                     char *start =3D strchr(line, '\'');
> > > +                     char *end =3D start ? strchr(start + 1, '\'') :=
 NULL;
> > > +
> > > +                     if (start && end) {
> > > +                             snprintf(last_menuentry,
> > > +                                      sizeof(last_menuentry),
> > > +                                      "%.*s", (int)(end - start - 1)=
,
> > > +                                      start + 1);
> > > +                     }
> > > +             }
> > > +
> > > +             /* Check if the current line contains the kernel */
> > > +             if (strstr(line, current_kernel)) {
> > > +                     /* Use the last seen menuentry as the match */
> > > +                     snprintf(grub_entry, sizeof(grub_entry), "%s",
> > > +                              last_menuentry);
> > > +                     kernel_found =3D true;
> > > +                     break;
> > > +             }
> > > +     }
> > > +
> > > +     fclose(grub_cfg);
> > > +
> > > +     igt_require_f(kernel_found, "Failed to find matching GRUB entry=
 for kernel: %s\n",
> > > +                   current_kernel);
> > > +
> > > +     /* Set the GRUB boot target using grub-reboot */
> > > +     snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_e=
ntry);
> > > +     igt_require_f(system(command) =3D=3D 0, "Failed to set GRUB boo=
t target to: %s\n",
> > > +                   grub_entry);
> > > +
> > > +     igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> > > +               current_kernel, grub_entry);
> > > +}
> > > +
> > > +static void hibernate_autoresume(int resume_delay)
> > > +{
> > > +     check_hibernation_support();
> > > +     set_rtc_wake_timer(resume_delay);
> > > +     ensure_grub_boots_same_kernel();
> > > +     hibernate_system();
> > > +}
> > > +
> > >  static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f=
)
> > >  {
> > >       int i;
> > > @@ -839,8 +988,11 @@ static bool try_config(data_t *data, enum test_f=
b_flags fb_flags,
> > >
> > >       if (ret =3D=3D 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) =
{
> > >               if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRES=
SED) {
> > > -                     igt_system_suspend_autoresume(SUSPEND_STATE_MEM=
,
> > > -                                                   SUSPEND_TEST_NONE=
);
> > > +                     if (data->do_hibernate)
> > > +                             hibernate_autoresume(30);
> > > +                     else
> > > +                             igt_system_suspend_autoresume(SUSPEND_S=
TATE_MEM,
> > > +                                                           SUSPEND_T=
EST_NONE);
> > >
> > >                       /* on resume check flat ccs is still compressed=
 */
> > >                       if (is_xe_device(data->drm_fd) &&
> > > @@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int opt_index, =
void *opt_data)
> > >               data->user_seed =3D true;
> > >               data->seed =3D strtoul(optarg, NULL, 0);
> > >               break;
> > > +     case 'r':
> > > +             data->do_hibernate =3D true;
> > > +             break;
> > >       default:
> > >               return IGT_OPT_HANDLER_ERROR;
> > >       }
> > > @@ -1056,9 +1211,10 @@ static data_t data;
> > >  static const char *help_str =3D
> > >  "  -c\t\tCheck the presence of compression meta-data\n"
> > >  "  -s <seed>\tSeed for random number generator\n"
> > > +"  -r\t\tOn suspend test do full hibernate with reboot\n"
> > >  ;
> > >
> > > -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> > > +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> > >  {
> > >       igt_fixture {
> > >               data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL | D=
RIVER_XE);
> > > --
> > > 2.45.2
> > >
