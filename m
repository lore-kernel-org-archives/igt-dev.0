Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDE5D6ACCD
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 13:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035A310E141;
	Wed, 27 Nov 2024 13:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b8v9VWSL";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D24E10E141
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 13:21:30 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-724d8422dbaso5333761b3a.0
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 05:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732713690; x=1733318490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CvCQzYdk9Im7wB7xiVwo0kGUmXneZk94W0oEKIj5Tk=;
 b=b8v9VWSLVrszCwAgnmrBJl/9TdkOL+SkWoyM/3+izUSIye5DszZRYbgAjLnZPNcFa8
 DjoI0PTCLCR/0e9Px8JKOQn/C9bzy4ZT6zrF4LAVDRflQpZrvEOS/lVaYNyJBFmJ0fUk
 iufAHeSz885tHjLySnca5mRNR+ctV2yjqAp/N+u88LOwlyW1LGjnubu7D4aFvV67PA6b
 NdXajrEdLSKmuVdvKXV5wRs4HaCS5HIwbl3Gp9KpDKshjbzQq+4EJkAxYq1O/QPPl7f+
 VOduZzwrel1hlHF+oRpt540y3bSiSThEVnPTQouFrDCAL3KQEzWtnTgase9g7x32ZK3Q
 SsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732713690; x=1733318490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CvCQzYdk9Im7wB7xiVwo0kGUmXneZk94W0oEKIj5Tk=;
 b=nmFMzw5C9gtp77hXgsTIXJXw7t3xQ6UaPCMytf2ZAWU7ih1mDqk93MCJl6l0wR9Qiv
 2PpPkiyET28m7lnx3CXrMgZShYu3T/ijgopbVlQRiEa6792LqkctbWHPq3NDEo77UUDq
 xdvCABjU8tRRdhyzLqTr/oZoFoCiVH839F/nW4oYgZDC02UDHa1/0s6/LW8hNvrDPZ8c
 fbY2/Mw06gxZHR0E9Lsr80Z9/WSkvGXJfWzqYz4ERkAkTP07cu5WyRj/MwE8ueAMuXR/
 axsEGmxmZkQumO/BjW766GZlIcugTAC1R2ysUvcRNA1bzzpSXetP2iINiyEQEbbsyhty
 26KQ==
X-Gm-Message-State: AOJu0YyOluYx6NP650BynrBN0Q0+VSLYITz+nAaVSNhYY53L+eAYEWuN
 ETuhT4d3zSoTe8bLkVGoyC6Rg990cfYrTch7q5g3JjfomD+RKUE/4VZi7NRWbf6eCZkIt8urx4b
 vRVn2XWah8U8Hsd3nTwtx3DAA4XH5DRVoM2U=
X-Gm-Gg: ASbGncvM3om/BwjV7PypxBPc0yLL+iP3CThI914vHKSh1cw+sFvOes7omjZcPKzujPY
 o1LGs8myrBXuneC3TkLTs74+JkrhUKzqn4Q==
X-Google-Smtp-Source: AGHT+IHpPBdq3p/mdbtDxDgulDtR7Af96JsGBjOVIQAG5iAuUOQUI62yjadg5cruprLAz/Qo8bZnRAa8fTWAyeYnn88=
X-Received: by 2002:a17:90b:3c82:b0:2ea:adaa:1a5a with SMTP id
 98e67ed59e1d1-2ee097bd797mr3210227a91.26.1732713689852; Wed, 27 Nov 2024
 05:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
 <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
 <Z0S_9YaQta79ooeQ@intel.com>
 <CAJ=qYWRYeg7mbbQGAGHbkHu8sAC0+Rq5J2CfZinFVniX7jsjMg@mail.gmail.com>
 <CAJ=qYWQfxw4DoeRGaf_EwJN0DYM0BxUaWQofFhs6mHKRqOG_rA@mail.gmail.com>
 <Z0XDFpvsdlB45R8T@intel.com>
 <CAJ=qYWTfuqkjQQ9eQDK8UaGDZ-xe3tvidt6kOX6sYgEYzk2uNw@mail.gmail.com>
In-Reply-To: <CAJ=qYWTfuqkjQQ9eQDK8UaGDZ-xe3tvidt6kOX6sYgEYzk2uNw@mail.gmail.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 27 Nov 2024 15:21:17 +0200
Message-ID: <CAJ=qYWRcsbwmsG+aQBEKqd_c80XrTPorn0+Ji+P5H4TNu=ze2A@mail.gmail.com>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
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

On Tue, Nov 26, 2024 at 7:12=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
<juhapekka.heikkila@gmail.com> wrote:
>
> On Tue, Nov 26, 2024 at 3:00=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.=
com> wrote:
> >
> > On Tue, Nov 26, 2024 at 10:07:37AM +0200, Juha-Pekka Heikkil=C3=A4 wrot=
e:
> > > Seems I accidentally replied only to Rodrigo so I'll add igt-dev back=
 here.
> > >
> > > On Mon, Nov 25, 2024 at 10:03=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
> > > <juhapekka.heikkila@gmail.com> wrote:
> > > >
> > > > On Mon, Nov 25, 2024 at 8:20=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@=
intel.com> wrote:
> > > > >
> > > > > On Mon, Nov 25, 2024 at 06:19:58PM +0200, Juha-Pekka Heikkila wro=
te:
> > > > > > Add hibernate test which bring entire system down for short
> > > > > > hibernate. This mode is added to suspend tests to be run
> > > > > > manually with '-r' flag because this is not ci friendly test,
> > > > > > on hibernate ci would lose connection to the hibernated box.
> > > > >
> > > > > I know that nowadays it is a beast to get hibernate to work in th=
e distros,
> > > > > but afaik our CI is prepared for that, otherwise we wouldn't be a=
ble to
> > > > > get these:
> > > > >
> > > > > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=
=3Ds4
> > > >
> > > > If you go see those test machine bootlogs you see there is no resum=
e
> > > > configured. I think all these current s4 tests work with pm_test he=
nce
> > > > also original problem where tests didn't reproduce that broken ccs
> > > > after resume. If you try running on your own box any of these s4 te=
sts
> > > > you'll see they don't go fully down. I wanted to have a test that d=
oes
> > > > the same as real hibernate.
> >
> > hmmm... something indeed changed because of CI.
> >
> > I originally implemented them without SUSPEND_TEST_DEVICES, in a way th=
at
> > the machine was going fully down in my ADL+DG2 machine.
> >
> > But commit 4b767566bbc ("tests/intel/xe_pm: S4 to go up to devices only=
")
> > modified that to make it work for CI.
> >
> > So, perhaps we can do both, have the manual setup with -r and no TEST
> > and have the one with TEST but not fully down.
> >
> > Have you reproduced the CSS reported bug? Then have you tried the solut=
ion
> > with the TEST?
>
> I suspect I earlier got lot of frozen test machines, with these test
> it always affect testing of new test. This test I now have here does
> reproduce that ccs bug with kernel where it's not fixed.
>
> >
> > > >
> > > > >
> > > > > >
> > > > > > For this test to work kernel resume point need to be set using =
swapfile, from
> > > > > > kernel command line is checked if there is found something alon=
g the lines of
> > > > > > "resume=3D/dev/nvme0n1p2 resume_offset=3D73527296" or so to ver=
ify hibernate
> > > > > > will be successfull.
> > > > >
> > > > > Indeed painful nowadays... I can't even believe this gap came fro=
m user
> > > > > report... is anyone really still using hibernation nowadays?! :)
> > > > >
> > > > > >
> > > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.co=
m>
> > > > > > ---
> > > > > >  tests/intel/kms_ccs.c | 162 ++++++++++++++++++++++++++++++++++=
+++++++-
> > > > > >  1 file changed, 159 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > > > > > index 3e9a57863..fd2fe9d3d 100644
> > > > > > --- a/tests/intel/kms_ccs.c
> > > > > > +++ b/tests/intel/kms_ccs.c
> > > > > > @@ -190,6 +190,7 @@ typedef struct {
> > > > > >       bool user_seed;
> > > > > >       enum igt_commit_style commit;
> > > > > >       int fb_list_length;
> > > > > > +     bool do_hibernate;
> > > > > >       struct {
> > > > > >               struct igt_fb fb;
> > > > > >               int width, height;
> > > > > > @@ -271,6 +272,154 @@ static const struct {
> > > > > >   */
> > > > > >  #define MAX_SPRITE_PLANE_WIDTH 2000
> > > > > >
> > > > > > +/* constants for hibenate test */
> > > > > > +#define RTC_WAKE_CMD "rtcwake -m no -s %d"
> > > > >
> > > > > Why are you calling rtcwake directly instead of using
> > > > > igt_system_suspend_autoresume(SUSPEND_STATE_DISK...) ?!
> > > > >
> > > > > Please check lib/igt_aux lib/igt_pm and tests/xe/xe_pm
> > > >
> > > > I wanted rtc only to wake up the machine. On
> > > > igt_system_suspend_autoresume(..) I'd get pm_test handling which I
> > > > want to avoid here.
> >
> > you can do that.... just pass SUSPEND_TEST_NONE instead of
> > SUSPEND_TEST_DEVICES as the second argument. So, a lot of the logic
> > here can be simplified.
> >
> > And as I told perhaps we can have 3 cases:
> >
> > hibernate-manual:
> >  igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> >                                SUSPEND_TEST_NONE);
> > hibernate-auto:
> > igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> >                               SUSPEND_TEST_DEVICES);
> > suspend:
> > igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >                               SUSPEND_TEST_NONE);
>
> I'll try that, if that reproduce the bug then I can cut out those
> hibernate_system(..) and set_rtc_wake_timer(..) and move
> check_hibernation_support(..) to libigt. For reproducing I'll anyway
> need to go to lab to see the machine, when I try these on ril system
> it seems to want to restore my machine when it first time stay down
> instead of resuming.

There is something fishy going on with
igt_system_suspend_autoresume(..). When I try to use
SUSPEND_STATE_DISK and SUSPEND_TEST_NONE, lnl boxes I've tried never
successfully hibernated. These boxes start to go down but don't power
off and I see same code always stuck on board led display. I'm not
able to pinpoint the issue since I'm not so familiar with pm code. On
same boxes, the hibernate code I have on this patch did work 5/5. As
above mentioned difference is I use rtc to wake the system but I on my
own go write  /sys/power/state. While it should do the same thing,
something is different..no idea could it be just some firmware issue
vs timing but result is anyway different. I had quick try with mtl and
i915 igt_system_suspend_autoresume(..) where things did work as
expected.

>
> >
> >
> > > >
> > > > >
> > > > > > +#define PROC_CMDLINE "/proc/cmdline"
> > > > > > +#define SYS_POWER_STATE "/sys/power/state"
> > > > > > +#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
> > > > > > +
> > > > > > +static void check_hibernation_support(void)
> > > > > > +{
> > > > > > +     int fd;
> > > > > > +     char buffer[2048];
> > > > > > +     ssize_t bytes_read;
> > > > > > +     FILE *cmdline;
> > > > > > +
> > > > > > +     /* Check if hibernation is supported in /sys/power/state =
*/
> > > > > > +     fd =3D open(SYS_POWER_STATE, O_RDONLY);
> > > > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > > > > +     bytes_read =3D read(fd, buffer, sizeof(buffer) - 1);
> > > > > > +     close(fd);
> > > > > > +
> > > > > > +     igt_require_f(bytes_read > 0, "Failed to read /sys/power/=
state");
> > > > > > +
> > > > > > +     buffer[bytes_read] =3D '\0';
> > > > > > +     igt_require_f(strstr(buffer, "disk") !=3D NULL,
> > > > > > +                   "Hibernation (suspend to disk) is not suppo=
rted on this system.\n");
> > > > > > +
> > > > > > +     /* Check if resume is configured in kernel command line *=
/
> > > > > > +     cmdline =3D fopen(PROC_CMDLINE, "r");
> > > > > > +     igt_require_f(cmdline, "Failed to open /proc/cmdline");
> > > > > > +     fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> > > > > > +     fclose(cmdline);
> > > > > > +
> > > > > > +     igt_require_f(strstr(buffer, "resume=3D"),
> > > > > > +                   "Kernel does not have 'resume' parameter co=
nfigured for hibernation.\n");
> > > > > > +}
> > > > >
> > > > > we should probably have this in the igt_pm lib to be used in othe=
r places
> > > > > like xe_pm. I remember we had discussions when s4 started failing=
 in CI,
> > > > > but apparently the solution was to make CI to work with it instea=
d of
> > > > > protecting our s4 tests...
> > > >
> > > > I was last week talking with Jari Tahvanainen about this. Our ci is
> > > > not configured for the machines really hibernating, he suggested we
> > > > first start with one test, start to run it in special box, and we g=
o
> > > > on from there .. so, here we are :)
> > > > I agree final destination for this function should be in lib/ like =
in
> > > > igt_pm or so.
> > > >
> > > > >
> > > > > > +
> > > > > > +static void set_rtc_wake_timer(int seconds)
> > > > > > +{
> > > > > > +     char command[256];
> > > > > > +
> > > > > > +     snprintf(command, sizeof(command), RTC_WAKE_CMD, seconds)=
;
> > > > > > +
> > > > > > +     igt_require_f(system(command) =3D=3D 0,
> > > > > > +                   "Failed to set RTC wake timer.\n");
> > > > > > +}
> > > > > > +
> > > > > > +static void hibernate_system(void)
> > > > > > +{
> > > > > > +     int fd;
> > > > > > +
> > > > > > +     fd =3D open(SYS_POWER_STATE, O_WRONLY);
> > > > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/state");
> > > > > > +
> > > > > > +     if (write(fd, "disk", 4) !=3D 4) {
> > > > > > +             close(fd);
> > > > > > +             igt_require_f(0, "Failed to write 'disk' to /sys/=
power/state");
> > > > > > +     }
> > > > > > +     close(fd);
> > > > > > +}
> > > > > > +
> > > > > > +static void ensure_grub_boots_same_kernel(void)
> > > > >
> > > > > I don't believe that this should be to the test case to ensure.
> > > > > This should be ensured by the infra to support these s4 testcases=
.
> > > >
> > > > This is bit so-so. If guys would run this test on their own boxes t=
o
> > > > do some debugging, forgetting to always set the correct kernel for =
the
> > > > next in-test reboot would cause incorrect results.
> > > >
> > > > >
> > > > > > +{
> > > > > > +     char cmdline[1024];
> > > > > > +     char current_kernel[256];
> > > > > > +     char last_menuentry[512] =3D "";
> > > > > > +     char grub_entry[512];
> > > > > > +     char command[1024];
> > > > > > +     FILE *cmdline_file, *grub_cfg;
> > > > > > +     char line[1024];
> > > > > > +     bool kernel_found =3D false;
> > > > > > +     char *kernel_arg;
> > > > > > +     char *kernel_end;
> > > > > > +
> > > > > > +     /* Read /proc/cmdline to get the current kernel image */
> > > > > > +     cmdline_file =3D fopen(PROC_CMDLINE, "r");
> > > > > > +     igt_require_f(cmdline_file, "Failed to open /proc/cmdline=
");
> > > > > > +
> > > > > > +     if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> > > > > > +             fclose(cmdline_file);
> > > > > > +             igt_require_f(0, "Failed to read /proc/cmdline");
> > > > > > +     }
> > > > > > +     fclose(cmdline_file);
> > > > > > +
> > > > > > +     /* Parse the kernel image from cmdline */
> > > > > > +     kernel_arg =3D strstr(cmdline, "BOOT_IMAGE=3D");
> > > > > > +     igt_require_f(kernel_arg, "BOOT_IMAGE=3D not found in /pr=
oc/cmdline\n");
> > > > > > +
> > > > > > +     kernel_arg +=3D strlen("BOOT_IMAGE=3D");
> > > > > > +     kernel_end =3D strchr(kernel_arg, ' ');
> > > > > > +
> > > > > > +     if (!kernel_end)
> > > > > > +             kernel_end =3D kernel_arg + strlen(kernel_arg);
> > > > > > +
> > > > > > +     snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> > > > > > +              (int)(kernel_end - kernel_arg), kernel_arg);
> > > > > > +     igt_debug("Current kernel image: %s\n", current_kernel);
> > > > > > +
> > > > > > +     /* Open GRUB config file to find matching entry */
> > > > > > +     grub_cfg =3D fopen(GRUB_CFG_PATH, "r");
> > > > > > +     igt_require_f(grub_cfg, "Failed to open GRUB configuratio=
n file");
> > > > > > +
> > > > > > +
> > > > > > +     while (fgets(line, sizeof(line), grub_cfg)) {
> > > > > > +             /* Check if the line contains a menuentry */
> > > > > > +             if (strstr(line, "menuentry")) {
> > > > > > +             /* Store the menuentry line */
> > > > > > +                     char *start =3D strchr(line, '\'');
> > > > > > +                     char *end =3D start ? strchr(start + 1, '=
\'') : NULL;
> > > > > > +
> > > > > > +                     if (start && end) {
> > > > > > +                             snprintf(last_menuentry,
> > > > > > +                                      sizeof(last_menuentry),
> > > > > > +                                      "%.*s", (int)(end - star=
t - 1),
> > > > > > +                                      start + 1);
> > > > > > +                     }
> > > > > > +             }
> > > > > > +
> > > > > > +             /* Check if the current line contains the kernel =
*/
> > > > > > +             if (strstr(line, current_kernel)) {
> > > > > > +                     /* Use the last seen menuentry as the mat=
ch */
> > > > > > +                     snprintf(grub_entry, sizeof(grub_entry), =
"%s",
> > > > > > +                              last_menuentry);
> > > > > > +                     kernel_found =3D true;
> > > > > > +                     break;
> > > > > > +             }
> > > > > > +     }
> > > > > > +
> > > > > > +     fclose(grub_cfg);
> > > > > > +
> > > > > > +     igt_require_f(kernel_found, "Failed to find matching GRUB=
 entry for kernel: %s\n",
> > > > > > +                   current_kernel);
> > > > > > +
> > > > > > +     /* Set the GRUB boot target using grub-reboot */
> > > > > > +     snprintf(command, sizeof(command), "grub-reboot \"%s\"", =
grub_entry);
> > > > > > +     igt_require_f(system(command) =3D=3D 0, "Failed to set GR=
UB boot target to: %s\n",
> > > > > > +                   grub_entry);
> > > > > > +
> > > > > > +     igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n=
",
> > > > > > +               current_kernel, grub_entry);
> > > > > > +}
> > > > > > +
> > > > > > +static void hibernate_autoresume(int resume_delay)
> > > > > > +{
> > > > > > +     check_hibernation_support();
> > > > > > +     set_rtc_wake_timer(resume_delay);
> > > > > > +     ensure_grub_boots_same_kernel();
> > > > > > +     hibernate_system();
> > > > > > +}
> > > > > > +
> > > > > >  static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_c=
md2 *f)
> > > > > >  {
> > > > > >       int i;
> > > > > > @@ -839,8 +988,11 @@ static bool try_config(data_t *data, enum =
test_fb_flags fb_flags,
> > > > > >
> > > > > >       if (ret =3D=3D 0 && !(fb_flags & TEST_BAD_ROTATION_90) &&=
 crc) {
> > > > > >               if (data->flags & TEST_SUSPEND && fb_flags & FB_C=
OMPRESSED) {
> > > > > > -                     igt_system_suspend_autoresume(SUSPEND_STA=
TE_MEM,
> > > > > > -                                                   SUSPEND_TES=
T_NONE);
> > > > > > +                     if (data->do_hibernate)
> > > > > > +                             hibernate_autoresume(30);
> > > > > > +                     else
> > > > > > +                             igt_system_suspend_autoresume(SUS=
PEND_STATE_MEM,
> > > > > > +                                                           SUS=
PEND_TEST_NONE);
> > > > > >
> > > > > >                       /* on resume check flat ccs is still comp=
ressed */
> > > > > >                       if (is_xe_device(data->drm_fd) &&
> > > > > > @@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int opt_i=
ndex, void *opt_data)
> > > > > >               data->user_seed =3D true;
> > > > > >               data->seed =3D strtoul(optarg, NULL, 0);
> > > > > >               break;
> > > > > > +     case 'r':
> > > > > > +             data->do_hibernate =3D true;
> > > > > > +             break;
> > > > > >       default:
> > > > > >               return IGT_OPT_HANDLER_ERROR;
> > > > > >       }
> > > > > > @@ -1056,9 +1211,10 @@ static data_t data;
> > > > > >  static const char *help_str =3D
> > > > > >  "  -c\t\tCheck the presence of compression meta-data\n"
> > > > > >  "  -s <seed>\tSeed for random number generator\n"
> > > > > > +"  -r\t\tOn suspend test do full hibernate with reboot\n"
> > > > > >  ;
> > > > > >
> > > > > > -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> > > > > > +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> > > > > >  {
> > > > > >       igt_fixture {
> > > > > >               data.drm_fd =3D drm_open_driver_master(DRIVER_INT=
EL | DRIVER_XE);
> > > > > > --
> > > > > > 2.45.2
> > > > > >
