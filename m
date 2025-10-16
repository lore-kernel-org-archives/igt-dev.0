Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50912CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A8410E9B7;
	Thu, 16 Oct 2025 11:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fXrb7iHs";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7483210E9C1
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 11:00:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so6569585e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760612414; x=1761217214; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZdqMSXm0zfPWhB9P4Uddw1NYwKWFxn7o9W6HhG7oU2g=;
 b=fXrb7iHsDQrZMSj6KdInhLW76xmEJsVqWdoJ2z0Cbk8hW9RJw9F749AJ6XuY588nrc
 IEo26ExQ6HQfQAv3++AWTor0FI8RUUMvL/v/4lwY8MEqf56GHL76BSXwlp6oW5HOPDmL
 RisskQsB9kTrphYpFG8+KYj5O66Nj/eaZBF56HGYkmcxAtjC7adTAoutNC+9vDu5F9qC
 oHAMYJ6C+P9SDCePorbYiPq4BG7VYq36xs8MQlaqwHYt9cStUG/sjJGtuYpfFlVk4U1+
 PPMNyAQmhZUIopFDytJPjGW+S4gmsuhqjmPk7jmpibP0aTrbQd41J3TYtZy0RR4E0IIN
 oP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760612414; x=1761217214;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdqMSXm0zfPWhB9P4Uddw1NYwKWFxn7o9W6HhG7oU2g=;
 b=WamgE9fnSh4zZjWbdM290Dzizugs5OVNa5RFwtT53HOLONtUS4ydoeEBPz2BmfQd4c
 Z3HPrgC5hr6BH6p2/3g7inDXlm1aRI+ieVl+5ImC/JhP0lj6wCJLWt0I0lPuE7Egt0R4
 +lK74dLkSRi8f5oliQlbBjye1ysR0hOcPDuG50yAyeNNQguCM6UgmLF7NP6tO8zju0ZO
 x5oEHV3//O+yhpTBvHzkz7Keqtxw4yDqsZPxb+plZntYPkLaprK0Bh3zNms3+CGBt0uI
 YrD7HsCB+JSVKziPsyq+BE2dUIjxzP2STCGiLw1SbXSUBJ2/bPVSslINScpDXgDTuipZ
 1I8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyTDi4F3p0cmJU1wkh8bXvtLDaaH+QGUtgrx+kUVVvgAveM66xQRXwCKOO7qFKPPvIJPMp5deC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzA5LBu4XjSFhHbySPhuSr+PFX7HZgDXB4VaN2ZZ4IpGztJsGl
 PcxlseFP/jw4+LrzV/a4sngmpWrPEjjzxRRX0lvg/vU1LUX1npOP3ZSe
X-Gm-Gg: ASbGncukwrz44/6PFJ5xotYQDigfY+F1grj1P3efLpEyb/rvlc7Q5RZhemHnZkb8vRX
 Ay/AzLj/QSmW4+ZX7AWHVJO1Rs728gr6K0cFizvg6hKBi5xD2GW9OqJzjSSC8p4Z3CJdH/kpCPM
 pPsld2JH16Ctj0fFCntaR76LoQ+o65j7OASLyBPdC3BJgP/tCzsXExXEZrhAnZmta2ONk9P5gnX
 FLm1u3Z05LAitluvYsJS+L8lovNPjjWs9+9gL17iEGtawT3Wl7FXkyCUqpBuVMuQJllA+sR5DOI
 SjBlm0pfGNTDsDAwbkH8vOLgkDPJEAzzDEwo1YKQVPemt6U0raVUYnz5btYavDKIt8VQnMQDCuS
 LYl0yeO+CXQjgMLoibM8ZSH/5OXJ0OQ6WG0eDPQfrig/zNhycuCO+WDkzrjxEbiwS7Sg/rmLjGf
 NgEDTzPtkylw==
X-Google-Smtp-Source: AGHT+IExZNc4KA3YtP7MoacNMTGBwkEnZWXL/9YpAp+mZV475LRUYlu9nQGvBdj83rtLXG76p0/G9w==
X-Received: by 2002:a05:600c:34cc:b0:46e:59dd:1b4d with SMTP id
 5b1f17b1804b1-46fa9aa2076mr241858505e9.16.1760612413334; 
 Thu, 16 Oct 2025 04:00:13 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711435b06fsm24377055e9.0.2025.10.16.04.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 04:00:12 -0700 (PDT)
Date: Thu, 16 Oct 2025 13:00:10 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 juhapekka.heikkila@gmail.com
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
Message-ID: <aPDQOgFtR0aMo4_C@fedora>
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
 <20251015181649.ca7psctqj2vj2dt2@kamilkon-DESK.igk.intel.com>
 <d67971d5-8bc5-4a4d-becf-59696631f21d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d67971d5-8bc5-4a4d-becf-59696631f21d@bootlin.com>
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

Hi everyone,

Thanks for CCing me Louis.

On Thu, Oct 16, 2025 at 10:40:32AM +0200, Louis Chauvet wrote:
> 
> 
> Le 15/10/2025 à 20:16, Kamil Konieczny a écrit :
> > Hi Mark,
> > On 2025-10-09 at 12:53:24 -0400, Mark Yacoub wrote:
> > > Hi Kamil,
> > > 
> > > Thanks for your feedback. I'd like to elaborate on my use case to provide
> > > more context about the problem I'm trying to solve.
> > > 
> > > I am building IGT for Android, and the same build system is deployed on
> > > both physical hardware and virtual machines. On the hardware, the
> > > appropriate hardware driver is correctly detected, so there are no issues
> > > there. However, on the VM, VKMS is running, but it's currently excluded
> > > from `DRIVER_ANY`, which prevents the tests from running against it. I need
> > > the tests to execute on VKMS in this scenario.
> > > 
> > > Using `IGT_FORCE_DRIVER` would require me to fork the build processes for
> > > hardware and VM, which I would prefer to avoid. My goal is to maintain a
> > 
> > You do not need to fork it nor recompile, this is env var for
> > CI run with tests, it uses the same igt binaries only makes them
> > using a forced driver when opening card. Now it do not work as
> > no user before needed to force it into vgem or VKMS.
> > 
> > In theory you could define it like: export IGT_FORCE_DRIVER=vkms
> > and then all kms tests and core_ ones should honor it.
> 
> +CC: José
> 
> Hi,
> 
> I had the same issue this week, but IGT_FORCE_DRIVER is not enough: all the
> tests using DRIVER_ANY are skipped.
> 
> # export IGT_DEVICE=drm:/dev/dri/card0
> # export IGT_FORCE_DRIVER=vkms
> # export IGT_LOG_LEVEL=debug
> # /usr/libexec/igt-gpu-tools/kms_plane
> (kms_plane:125) igt_core-DEBUG: Notice: using IGT_DEVICE env:
> (kms_plane:125) igt_core-DEBUG: [drm:/dev/dri/card0]
> [IGT] kms_plane: executing
> IGT-Version: 2.2-g6d82d231ced6 (x86_64) (Linux:
> 6.17.0-rc6-01217-g1ddd2876eeb9 x86_64)
> Using IGT_SRANDOM=1760602572 for randomisation
> (kms_plane:125) drmtest-DEBUG: Looking for devices to open using filter 0:
> drm:/dev/dri/card0
> (kms_plane:125) drmtest-DEBUG: Filter matched /dev/dri/card0 |
> (kms_plane:125) igt_kmod-DEBUG: Module vkms already inserted
> Test requirement not met in function drm_open_driver, file
> ../igt/lib/drmtest.c:735:
> Test requirement: !(fd<0)
> No known gpu found for chipset flags 0x4294965755 (any)
> Last errno: 2, No such file or directory
> Subtest pixel-format: SKIP (0.000s)
> Subtest pixel-format-source-clamping: SKIP (0.000s)
> Subtest plane-position-covered: SKIP (0.000s)
> Subtest plane-position-hole: SKIP (0.000s)
> Subtest plane-position-hole-dpms: SKIP (0.000s)
> Subtest plane-panning-top-left: SKIP (0.000s)
> Subtest plane-panning-bottom-right: SKIP (0.000s)
> Subtest plane-panning-bottom-right-suspend: SKIP (0.000s)
> Subtest planar-pixel-format-settings: SKIP (0.000s)
> [IGT] kms_plane: exiting, ret=77
> (kms_plane:125) igt_core-DEBUG: Exiting with status code 77
> 
> José suggested this fix, it seems to properly use vkms if IGT_FORCE_DRIVER
> is set:
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index a1fb0b5ba..f630bc157 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -350,7 +350,7 @@ int __drm_open_device(const char *name, unsigned int
> chipset)
> 
>         modulename_to_chipset(dev_name, &chip);
> 
> -       if ((chipset & chip) == chip) {
> +       if ((chipset & chip) == chip || (forced && strcmp(forced, dev_name)
> == 0)) {
>                 log_opened_device_path(name);
>                 return fd;
>         }
> 
> @Mark, is it enough for you?
> @José, do you want to send the proper patch?

Sorry I couldn't send a patch earlier, I have been pretty busy this week.

The reason why VKMS is excluded from DRIVERS_ANY is that, when a test
selects any driver ("drm_open_driver(DRIVER_ANY)") hardware drivers are
prioritized over virtual drivers (vgem, vkms or virtio) to avoid them
being accidentally selected due to device-load ordering.

There is a nice comment in drmtest.h explaining it with more detail. So, in
my opinion, VKMS is correctly excluded from DRIVERS_ANY.

However, I'd expect that setting the IGT_FORCE_DRIVER environment variable to
"vkms" would actually use VKMS for testing.
I have refined a bit the initial workaround I discuss with  Louis 2 days ago
and I think this could be an acceptable solution:

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a1fb0b5ba..8f295d436 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -350,6 +350,14 @@ int __drm_open_device(const char *name, unsigned int chipset)
 
        modulename_to_chipset(dev_name, &chip);
 
+       /*
+        * Virtual drivers like vgem or vkms are excluded from DRIVER_ANY and
+        * therefore it is not possible to use them in tests using the
+        * IGT_FORCE_DRIVER environment variable. Include them when forced.
+        */
+       if (forced && chipset == DRIVER_ANY)
+               chipset |= chip;
+
        if ((chipset & chip) == chip) {
                log_opened_device_path(name);
                return fd;
 
I don't know if making that check even more precise would be a better solution.
For example, calling a "is_virtual_driver()" helper:

  if (forced && chipset == DRIVER_ANY && is_virtual_driver(chip))
          chipset |= chip;

I can send a patch with that fix, but I'd appreciate as much feedback as possible
as this code is used by every tests and I don't have enough experience with IGT
to make sure it doesn't introduce a bug.

Best wishes,
Jose

> 
> Hav a nice day,
> Louis Chauvet
> 
> > Regards,
> > Kamil
> > 
> > > unified build system and allow IGT to run on whatever driver is present. Is
> > > there a way to achieve this?
> > > 
> > > I understand that the current code prioritizes the hardware driver, which
> > > is a desirable behavior. I'm trying to understand the potential issues that
> > > might arise if VKMS were not excluded in other contexts.
> > > 
> > > Thank you!
> > > Mark
> > > 
> > > 
> > > On Thu, Oct 9, 2025 at 12:46 PM Kamil Konieczny <
> > > kamil.konieczny@linux.intel.com> wrote:
> > > 
> > > > Hi Mark,
> > > > On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
> > > > > [Why]
> > > > > VKMS (Virtual VKMS) is typically running on a virtual machine where it's
> > > > > expected to be without a contention with a hardware driver.
> > > > > When it's there, we would like to run IGT on it.
> > > > > 
> > > > > [How]
> > > > > Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
> > > > > up.
> > > > > 
> > > > > Tested: Ran kms_bw on Android's VM with VKMS enabled.
> > > > > 
> > > > > Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
> > > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > > ---
> > > > >   lib/drmtest.h | 4 +---
> > > > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > > > index 8416aa491..ab991da57 100644
> > > > > --- a/lib/drmtest.h
> > > > > +++ b/lib/drmtest.h
> > > > > @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int
> > > > name_size);
> > > > >    * on a system with them as well as a supported driver, you can end up
> > > > >    * with a near-100% skip rate if you don't explicitly specify the
> > > > device,
> > > > >    * depending on device-load ordering.
> > > > > - *
> > > > > - * Exclude VKMS to prefer hardware drivers.
> > > > >    */
> > > > > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> > > > > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VIRTIO)
> > > > 
> > > > Nak, this is bad as there could be vkms module also on host.
> > > > 
> > > > Let me work on improving IGT_FORCE_DRIVER.
> > > > 
> > > > Regards,
> > > > Kamil
> > > > 
> > > > > 
> > > > >   /*
> > > > >    * Compile friendly enum for i915/xe.
> > > > > --
> > > > > 2.51.0.740.g6adb054d12-goog
> > > > > 
> > > > 
> 
> -- 
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
