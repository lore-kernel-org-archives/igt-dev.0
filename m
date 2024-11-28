Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7784D69114
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 15:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690E310ECF6;
	Thu, 28 Nov 2024 15:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iz+9MKUW";
	dkim-atps=neutral
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B6810ECF6
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 15:41:05 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2ea1e605193so789385a91.0
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732808465; x=1733413265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IOdDaOmtwDyWITxohHhTIu981VoLyNlayfw1ZNjlo4=;
 b=iz+9MKUWnMHfcM0+pnBL2i5lhmcAvB3RcOwEiwgHitwXnTfM2LiB81vbcLVTPBoK39
 I+uoC9RofPj5deNUc8IjWPfP3p1wb0S2NEI9xUxxH2hpl8TSE07oT16zJOPs3mrf/h7O
 2MIbyIXx1j1KMP+sifjL/REKl6yoXlEsXNUnCfDpteWGzi4V9fy1v4qQIoSW5LggLc++
 tfYb4HLe0KJPU3i/etgwehY+gKMxiAy99vM/7c7PsTS4TGN0odqQ4ATYdNBniIrjgkH0
 VgLfjNcXoEhCpf+DBM/N9QTAgFoj/GlgbJXIS4WgNYtWweFtA1oQKOdmBEO2KQCRAnYJ
 UqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732808465; x=1733413265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IOdDaOmtwDyWITxohHhTIu981VoLyNlayfw1ZNjlo4=;
 b=R4719oG1CYYmD0zyvAVxi+zMJC6EK+PQNRz5cONIuzxi2koJHpC2W+uSnUtucDhFzt
 MxSZ/CTE1H9os5MTMfNqFOuvf5X4V0KrPdJVGv6rLdUwi0yysEeHVATEUYWIM9SUG3Vn
 E3aeVMnj2e9twgcobJvsvqPgXaw2S+d7iA2KFZM5SyEgCSyWNoqPpBtoQgvhuUa9ec4G
 yA5TVG2CJtcf+0a71+gQ99oGxAernU2zUL4mTdE7PFswS6fwP8pbI3sG3REA/p9i1v/x
 W7+94zE2ZwlV6fzzHOzYQb/bSfiBPHdgSflkhwu1xZpUQlttmT/3u+OUG2J1mzhuczTf
 XJuQ==
X-Gm-Message-State: AOJu0YzwSemNIVM9Ri0WXSnVsXMF16twswMEXNIflQaPipRDFYClw+vC
 WUQ6W3/yG9UXBKv9N+wIuPT8402U+jERWCigCVUYb2nzWL+Ygbfq3cbUF4b1eviUBN8Kr9n0v4q
 hqdA8KYIvJq3g7nsnp5/WJxNhOdleBwF6D0k=
X-Gm-Gg: ASbGncta/BIQSMHGxaaw3BNZDd/wK6jeC7+wwwwArX0hViBs0fIffENY0K/syifygeG
 kk/a+Df4eiRlZSI+voiLxCDn/r6oIIpPRjw==
X-Google-Smtp-Source: AGHT+IH/qUj+Nvz6/2eHDupBBOcsWhs/50Cm3hJdrE/vAFhMR0ovSkdNcQyntjevMNCSdH9JhMMf38r8lEtXqbQpDm4=
X-Received: by 2002:a17:90b:4d8f:b0:2ea:b0f9:ff73 with SMTP id
 98e67ed59e1d1-2ee093d5f46mr8635208a91.25.1732808464534; Thu, 28 Nov 2024
 07:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
 <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
 <Z0S_9YaQta79ooeQ@intel.com>
 <CAJ=qYWRYeg7mbbQGAGHbkHu8sAC0+Rq5J2CfZinFVniX7jsjMg@mail.gmail.com>
 <CAJ=qYWQfxw4DoeRGaf_EwJN0DYM0BxUaWQofFhs6mHKRqOG_rA@mail.gmail.com>
 <Z0XDFpvsdlB45R8T@intel.com>
 <CAJ=qYWTfuqkjQQ9eQDK8UaGDZ-xe3tvidt6kOX6sYgEYzk2uNw@mail.gmail.com>
 <CAJ=qYWRcsbwmsG+aQBEKqd_c80XrTPorn0+Ji+P5H4TNu=ze2A@mail.gmail.com>
 <Z0hlv5a4fXjVuJnw@intel.com>
In-Reply-To: <Z0hlv5a4fXjVuJnw@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 28 Nov 2024 17:40:53 +0200
Message-ID: <CAJ=qYWR=q46BpQvO7BC3BRCGBFN4WFu42FW4yQG1EXD+iEqirQ@mail.gmail.com>
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

On Thu, Nov 28, 2024 at 2:45=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Wed, Nov 27, 2024 at 03:21:17PM +0200, Juha-Pekka Heikkil=C3=A4 wrote:
> > On Tue, Nov 26, 2024 at 7:12=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
> > <juhapekka.heikkila@gmail.com> wrote:
> > >
> > > On Tue, Nov 26, 2024 at 3:00=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@in=
tel.com> wrote:
> > > >
> > > > On Tue, Nov 26, 2024 at 10:07:37AM +0200, Juha-Pekka Heikkil=C3=A4 =
wrote:
> > > > > Seems I accidentally replied only to Rodrigo so I'll add igt-dev =
back here.
> > > > >
> > > > > On Mon, Nov 25, 2024 at 10:03=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
> > > > > <juhapekka.heikkila@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Nov 25, 2024 at 8:20=E2=80=AFPM Rodrigo Vivi <rodrigo.v=
ivi@intel.com> wrote:
> > > > > > >
> > > > > > > On Mon, Nov 25, 2024 at 06:19:58PM +0200, Juha-Pekka Heikkila=
 wrote:
> > > > > > > > Add hibernate test which bring entire system down for short
> > > > > > > > hibernate. This mode is added to suspend tests to be run
> > > > > > > > manually with '-r' flag because this is not ci friendly tes=
t,
> > > > > > > > on hibernate ci would lose connection to the hibernated box=
.
> > > > > > >
> > > > > > > I know that nowadays it is a beast to get hibernate to work i=
n the distros,
> > > > > > > but afaik our CI is prepared for that, otherwise we wouldn't =
be able to
> > > > > > > get these:
> > > > > > >
> > > > > > > https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilt=
er=3Ds4
> > > > > >
> > > > > > If you go see those test machine bootlogs you see there is no r=
esume
> > > > > > configured. I think all these current s4 tests work with pm_tes=
t hence
> > > > > > also original problem where tests didn't reproduce that broken =
ccs
> > > > > > after resume. If you try running on your own box any of these s=
4 tests
> > > > > > you'll see they don't go fully down. I wanted to have a test th=
at does
> > > > > > the same as real hibernate.
> > > >
> > > > hmmm... something indeed changed because of CI.
> > > >
> > > > I originally implemented them without SUSPEND_TEST_DEVICES, in a wa=
y that
> > > > the machine was going fully down in my ADL+DG2 machine.
> > > >
> > > > But commit 4b767566bbc ("tests/intel/xe_pm: S4 to go up to devices =
only")
> > > > modified that to make it work for CI.
> > > >
> > > > So, perhaps we can do both, have the manual setup with -r and no TE=
ST
> > > > and have the one with TEST but not fully down.
> > > >
> > > > Have you reproduced the CSS reported bug? Then have you tried the s=
olution
> > > > with the TEST?
> > >
> > > I suspect I earlier got lot of frozen test machines, with these test
> > > it always affect testing of new test. This test I now have here does
> > > reproduce that ccs bug with kernel where it's not fixed.
> > >
> > > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > For this test to work kernel resume point need to be set us=
ing swapfile, from
> > > > > > > > kernel command line is checked if there is found something =
along the lines of
> > > > > > > > "resume=3D/dev/nvme0n1p2 resume_offset=3D73527296" or so to=
 verify hibernate
> > > > > > > > will be successfull.
> > > > > > >
> > > > > > > Indeed painful nowadays... I can't even believe this gap came=
 from user
> > > > > > > report... is anyone really still using hibernation nowadays?!=
 :)
> > > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmai=
l.com>
> > > > > > > > ---
> > > > > > > >  tests/intel/kms_ccs.c | 162 ++++++++++++++++++++++++++++++=
+++++++++++-
> > > > > > > >  1 file changed, 159 insertions(+), 3 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> > > > > > > > index 3e9a57863..fd2fe9d3d 100644
> > > > > > > > --- a/tests/intel/kms_ccs.c
> > > > > > > > +++ b/tests/intel/kms_ccs.c
> > > > > > > > @@ -190,6 +190,7 @@ typedef struct {
> > > > > > > >       bool user_seed;
> > > > > > > >       enum igt_commit_style commit;
> > > > > > > >       int fb_list_length;
> > > > > > > > +     bool do_hibernate;
> > > > > > > >       struct {
> > > > > > > >               struct igt_fb fb;
> > > > > > > >               int width, height;
> > > > > > > > @@ -271,6 +272,154 @@ static const struct {
> > > > > > > >   */
> > > > > > > >  #define MAX_SPRITE_PLANE_WIDTH 2000
> > > > > > > >
> > > > > > > > +/* constants for hibenate test */
> > > > > > > > +#define RTC_WAKE_CMD "rtcwake -m no -s %d"
> > > > > > >
> > > > > > > Why are you calling rtcwake directly instead of using
> > > > > > > igt_system_suspend_autoresume(SUSPEND_STATE_DISK...) ?!
> > > > > > >
> > > > > > > Please check lib/igt_aux lib/igt_pm and tests/xe/xe_pm
> > > > > >
> > > > > > I wanted rtc only to wake up the machine. On
> > > > > > igt_system_suspend_autoresume(..) I'd get pm_test handling whic=
h I
> > > > > > want to avoid here.
> > > >
> > > > you can do that.... just pass SUSPEND_TEST_NONE instead of
> > > > SUSPEND_TEST_DEVICES as the second argument. So, a lot of the logic
> > > > here can be simplified.
> > > >
> > > > And as I told perhaps we can have 3 cases:
> > > >
> > > > hibernate-manual:
> > > >  igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> > > >                                SUSPEND_TEST_NONE);
> > > > hibernate-auto:
> > > > igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> > > >                               SUSPEND_TEST_DEVICES);
> > > > suspend:
> > > > igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > >                               SUSPEND_TEST_NONE);
> > >
> > > I'll try that, if that reproduce the bug then I can cut out those
> > > hibernate_system(..) and set_rtc_wake_timer(..) and move
> > > check_hibernation_support(..) to libigt. For reproducing I'll anyway
> > > need to go to lab to see the machine, when I try these on ril system
> > > it seems to want to restore my machine when it first time stay down
> > > instead of resuming.
> >
> > There is something fishy going on with
> > igt_system_suspend_autoresume(..). When I try to use
> > SUSPEND_STATE_DISK and SUSPEND_TEST_NONE, lnl boxes I've tried never
> > successfully hibernated. These boxes start to go down but don't power
> > off and I see same code always stuck on board led display. I'm not
> > able to pinpoint the issue since I'm not so familiar with pm code. On
> > same boxes, the hibernate code I have on this patch did work 5/5. As
> > above mentioned difference is I use rtc to wake the system but I on my
> > own go write  /sys/power/state. While it should do the same thing,
> > something is different..no idea could it be just some firmware issue
> > vs timing but result is anyway different. I had quick try with mtl and
> > i915 igt_system_suspend_autoresume(..) where things did work as
> > expected.
>
> hmm that's indeed interesting... the autoresume uses rtcwake anyway no?
> perhaps some different option passed to rtcwake?
>
> well, to be honest, I have seen many cases where our autoresume gets
> stuck in different platforms with differents levels of suspend :/
>
> Maybe we could try to improve our autoresume to ensure it is taking
> your safer sequence here? or at least have your safer sequence as
> an alternative inside the lib/igt_pm as well?
>

I now know what affect the hibernate. I'll need to get lnl boxes here
updated with new fw. Disconnecting all type-c cables made hibernate
through igt_system_suspend_autoresume(..) reliable. I think I would
prefer igt_system_suspend_autoresume type hibernate for test as it
probably is closer to what distros are doing.

Once have latest fw will need to see does this problem still exist. In
any case I'll move code around a bit and move that resume point check
into libigt

/Juha-Pekka

> >
> > >
> > > >
> > > >
> > > > > >
> > > > > > >
> > > > > > > > +#define PROC_CMDLINE "/proc/cmdline"
> > > > > > > > +#define SYS_POWER_STATE "/sys/power/state"
> > > > > > > > +#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
> > > > > > > > +
> > > > > > > > +static void check_hibernation_support(void)
> > > > > > > > +{
> > > > > > > > +     int fd;
> > > > > > > > +     char buffer[2048];
> > > > > > > > +     ssize_t bytes_read;
> > > > > > > > +     FILE *cmdline;
> > > > > > > > +
> > > > > > > > +     /* Check if hibernation is supported in /sys/power/st=
ate */
> > > > > > > > +     fd =3D open(SYS_POWER_STATE, O_RDONLY);
> > > > > > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/stat=
e");
> > > > > > > > +     bytes_read =3D read(fd, buffer, sizeof(buffer) - 1);
> > > > > > > > +     close(fd);
> > > > > > > > +
> > > > > > > > +     igt_require_f(bytes_read > 0, "Failed to read /sys/po=
wer/state");
> > > > > > > > +
> > > > > > > > +     buffer[bytes_read] =3D '\0';
> > > > > > > > +     igt_require_f(strstr(buffer, "disk") !=3D NULL,
> > > > > > > > +                   "Hibernation (suspend to disk) is not s=
upported on this system.\n");
> > > > > > > > +
> > > > > > > > +     /* Check if resume is configured in kernel command li=
ne */
> > > > > > > > +     cmdline =3D fopen(PROC_CMDLINE, "r");
> > > > > > > > +     igt_require_f(cmdline, "Failed to open /proc/cmdline"=
);
> > > > > > > > +     fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> > > > > > > > +     fclose(cmdline);
> > > > > > > > +
> > > > > > > > +     igt_require_f(strstr(buffer, "resume=3D"),
> > > > > > > > +                   "Kernel does not have 'resume' paramete=
r configured for hibernation.\n");
> > > > > > > > +}
> > > > > > >
> > > > > > > we should probably have this in the igt_pm lib to be used in =
other places
> > > > > > > like xe_pm. I remember we had discussions when s4 started fai=
ling in CI,
> > > > > > > but apparently the solution was to make CI to work with it in=
stead of
> > > > > > > protecting our s4 tests...
> > > > > >
> > > > > > I was last week talking with Jari Tahvanainen about this. Our c=
i is
> > > > > > not configured for the machines really hibernating, he suggeste=
d we
> > > > > > first start with one test, start to run it in special box, and =
we go
> > > > > > on from there .. so, here we are :)
> > > > > > I agree final destination for this function should be in lib/ l=
ike in
> > > > > > igt_pm or so.
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +static void set_rtc_wake_timer(int seconds)
> > > > > > > > +{
> > > > > > > > +     char command[256];
> > > > > > > > +
> > > > > > > > +     snprintf(command, sizeof(command), RTC_WAKE_CMD, seco=
nds);
> > > > > > > > +
> > > > > > > > +     igt_require_f(system(command) =3D=3D 0,
> > > > > > > > +                   "Failed to set RTC wake timer.\n");
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void hibernate_system(void)
> > > > > > > > +{
> > > > > > > > +     int fd;
> > > > > > > > +
> > > > > > > > +     fd =3D open(SYS_POWER_STATE, O_WRONLY);
> > > > > > > > +     igt_require_f(fd > 0, "Failed to open /sys/power/stat=
e");
> > > > > > > > +
> > > > > > > > +     if (write(fd, "disk", 4) !=3D 4) {
> > > > > > > > +             close(fd);
> > > > > > > > +             igt_require_f(0, "Failed to write 'disk' to /=
sys/power/state");
> > > > > > > > +     }
> > > > > > > > +     close(fd);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void ensure_grub_boots_same_kernel(void)
> > > > > > >
> > > > > > > I don't believe that this should be to the test case to ensur=
e.
> > > > > > > This should be ensured by the infra to support these s4 testc=
ases.
> > > > > >
> > > > > > This is bit so-so. If guys would run this test on their own box=
es to
> > > > > > do some debugging, forgetting to always set the correct kernel =
for the
> > > > > > next in-test reboot would cause incorrect results.
> > > > > >
> > > > > > >
> > > > > > > > +{
> > > > > > > > +     char cmdline[1024];
> > > > > > > > +     char current_kernel[256];
> > > > > > > > +     char last_menuentry[512] =3D "";
> > > > > > > > +     char grub_entry[512];
> > > > > > > > +     char command[1024];
> > > > > > > > +     FILE *cmdline_file, *grub_cfg;
> > > > > > > > +     char line[1024];
> > > > > > > > +     bool kernel_found =3D false;
> > > > > > > > +     char *kernel_arg;
> > > > > > > > +     char *kernel_end;
> > > > > > > > +
> > > > > > > > +     /* Read /proc/cmdline to get the current kernel image=
 */
> > > > > > > > +     cmdline_file =3D fopen(PROC_CMDLINE, "r");
> > > > > > > > +     igt_require_f(cmdline_file, "Failed to open /proc/cmd=
line");
> > > > > > > > +
> > > > > > > > +     if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> > > > > > > > +             fclose(cmdline_file);
> > > > > > > > +             igt_require_f(0, "Failed to read /proc/cmdlin=
e");
> > > > > > > > +     }
> > > > > > > > +     fclose(cmdline_file);
> > > > > > > > +
> > > > > > > > +     /* Parse the kernel image from cmdline */
> > > > > > > > +     kernel_arg =3D strstr(cmdline, "BOOT_IMAGE=3D");
> > > > > > > > +     igt_require_f(kernel_arg, "BOOT_IMAGE=3D not found in=
 /proc/cmdline\n");
> > > > > > > > +
> > > > > > > > +     kernel_arg +=3D strlen("BOOT_IMAGE=3D");
> > > > > > > > +     kernel_end =3D strchr(kernel_arg, ' ');
> > > > > > > > +
> > > > > > > > +     if (!kernel_end)
> > > > > > > > +             kernel_end =3D kernel_arg + strlen(kernel_arg=
);
> > > > > > > > +
> > > > > > > > +     snprintf(current_kernel, sizeof(current_kernel), "%.*=
s",
> > > > > > > > +              (int)(kernel_end - kernel_arg), kernel_arg);
> > > > > > > > +     igt_debug("Current kernel image: %s\n", current_kerne=
l);
> > > > > > > > +
> > > > > > > > +     /* Open GRUB config file to find matching entry */
> > > > > > > > +     grub_cfg =3D fopen(GRUB_CFG_PATH, "r");
> > > > > > > > +     igt_require_f(grub_cfg, "Failed to open GRUB configur=
ation file");
> > > > > > > > +
> > > > > > > > +
> > > > > > > > +     while (fgets(line, sizeof(line), grub_cfg)) {
> > > > > > > > +             /* Check if the line contains a menuentry */
> > > > > > > > +             if (strstr(line, "menuentry")) {
> > > > > > > > +             /* Store the menuentry line */
> > > > > > > > +                     char *start =3D strchr(line, '\'');
> > > > > > > > +                     char *end =3D start ? strchr(start + =
1, '\'') : NULL;
> > > > > > > > +
> > > > > > > > +                     if (start && end) {
> > > > > > > > +                             snprintf(last_menuentry,
> > > > > > > > +                                      sizeof(last_menuentr=
y),
> > > > > > > > +                                      "%.*s", (int)(end - =
start - 1),
> > > > > > > > +                                      start + 1);
> > > > > > > > +                     }
> > > > > > > > +             }
> > > > > > > > +
> > > > > > > > +             /* Check if the current line contains the ker=
nel */
> > > > > > > > +             if (strstr(line, current_kernel)) {
> > > > > > > > +                     /* Use the last seen menuentry as the=
 match */
> > > > > > > > +                     snprintf(grub_entry, sizeof(grub_entr=
y), "%s",
> > > > > > > > +                              last_menuentry);
> > > > > > > > +                     kernel_found =3D true;
> > > > > > > > +                     break;
> > > > > > > > +             }
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     fclose(grub_cfg);
> > > > > > > > +
> > > > > > > > +     igt_require_f(kernel_found, "Failed to find matching =
GRUB entry for kernel: %s\n",
> > > > > > > > +                   current_kernel);
> > > > > > > > +
> > > > > > > > +     /* Set the GRUB boot target using grub-reboot */
> > > > > > > > +     snprintf(command, sizeof(command), "grub-reboot \"%s\=
"", grub_entry);
> > > > > > > > +     igt_require_f(system(command) =3D=3D 0, "Failed to se=
t GRUB boot target to: %s\n",
> > > > > > > > +                   grub_entry);
> > > > > > > > +
> > > > > > > > +     igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %=
s)\n",
> > > > > > > > +               current_kernel, grub_entry);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void hibernate_autoresume(int resume_delay)
> > > > > > > > +{
> > > > > > > > +     check_hibernation_support();
> > > > > > > > +     set_rtc_wake_timer(resume_delay);
> > > > > > > > +     ensure_grub_boots_same_kernel();
> > > > > > > > +     hibernate_system();
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static void addfb_init(struct igt_fb *fb, struct drm_mode_=
fb_cmd2 *f)
> > > > > > > >  {
> > > > > > > >       int i;
> > > > > > > > @@ -839,8 +988,11 @@ static bool try_config(data_t *data, e=
num test_fb_flags fb_flags,
> > > > > > > >
> > > > > > > >       if (ret =3D=3D 0 && !(fb_flags & TEST_BAD_ROTATION_90=
) && crc) {
> > > > > > > >               if (data->flags & TEST_SUSPEND && fb_flags & =
FB_COMPRESSED) {
> > > > > > > > -                     igt_system_suspend_autoresume(SUSPEND=
_STATE_MEM,
> > > > > > > > -                                                   SUSPEND=
_TEST_NONE);
> > > > > > > > +                     if (data->do_hibernate)
> > > > > > > > +                             hibernate_autoresume(30);
> > > > > > > > +                     else
> > > > > > > > +                             igt_system_suspend_autoresume=
(SUSPEND_STATE_MEM,
> > > > > > > > +                                                          =
 SUSPEND_TEST_NONE);
> > > > > > > >
> > > > > > > >                       /* on resume check flat ccs is still =
compressed */
> > > > > > > >                       if (is_xe_device(data->drm_fd) &&
> > > > > > > > @@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int o=
pt_index, void *opt_data)
> > > > > > > >               data->user_seed =3D true;
> > > > > > > >               data->seed =3D strtoul(optarg, NULL, 0);
> > > > > > > >               break;
> > > > > > > > +     case 'r':
> > > > > > > > +             data->do_hibernate =3D true;
> > > > > > > > +             break;
> > > > > > > >       default:
> > > > > > > >               return IGT_OPT_HANDLER_ERROR;
> > > > > > > >       }
> > > > > > > > @@ -1056,9 +1211,10 @@ static data_t data;
> > > > > > > >  static const char *help_str =3D
> > > > > > > >  "  -c\t\tCheck the presence of compression meta-data\n"
> > > > > > > >  "  -s <seed>\tSeed for random number generator\n"
> > > > > > > > +"  -r\t\tOn suspend test do full hibernate with reboot\n"
> > > > > > > >  ;
> > > > > > > >
> > > > > > > > -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> > > > > > > > +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
> > > > > > > >  {
> > > > > > > >       igt_fixture {
> > > > > > > >               data.drm_fd =3D drm_open_driver_master(DRIVER=
_INTEL | DRIVER_XE);
> > > > > > > > --
> > > > > > > > 2.45.2
> > > > > > > >
