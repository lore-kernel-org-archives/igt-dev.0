Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70799CCD185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 18:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD0E10E8AB;
	Wed, 15 Oct 2025 18:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diEjjZ52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EEE10E8AB
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 18:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760552239; x=1792088239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6ITRPKlW5modPyaSgiKOefj9FlY7Z52bPoa3R2Gl9Ug=;
 b=diEjjZ52eEp1HSLIFjnEDa8Hl0W9GYEg2rxZDs5wAmLVGQEKN6JanJkP
 5p22c/bvS3nztlDP4l8SjZgqcKRZXgjsw+b/F3GfP4NbFiUkYZCEeBGqo
 lqoyOXntU1OksMq52/YVw/QubT+20oZVce4hGZrS9UhIAhBJxxKhnBO3q
 qPcQZZJeyVINAneWI0fb9YAGs/YdV207LOL9+YOo4533/7feMaiT4XUiS
 FiZQKomKLAiGEvlIyfKxPvajBP6O23lHqRLWXUE7mVXEuvLKTKBM6rgq4
 qXME6ltt0WiWXSqD10NutpbAwwKH8CpyVCVPQh7Pk6NQ3mLj4kcbWF1bJ w==;
X-CSE-ConnectionGUID: sofIm1saTkCyUmfOjWiHbQ==
X-CSE-MsgGUID: zyCHb+V9Qieth8alc+j+WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61944268"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="61944268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:17:11 -0700
X-CSE-ConnectionGUID: 8K3xeJmXQ4e2lFtsFWYXvQ==
X-CSE-MsgGUID: N4lwBA8PSLGWOVvXniCGFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182033018"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 11:17:09 -0700
Date: Wed, 15 Oct 2025 20:16:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com,
 juhapekka.heikkila@gmail.com
Subject: Re: [PATCH i-g-t] lib/drmtest: Remove VKMS from Exclusion list
Message-ID: <20251015181649.ca7psctqj2vj2dt2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 louis.chauvet@bootlin.com, juhapekka.heikkila@gmail.com
References: <20251008160209.463702-1-markyacoub@google.com>
 <20251009164600.btzj5kiscl5ftdl7@kamilkon-DESK.igk.intel.com>
 <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC0gqY7ZeCZPP8WHPq8uS-sOZVGpi8Fnzn-uDsWdt4jW72B8RA@mail.gmail.com>
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

Hi Mark,
On 2025-10-09 at 12:53:24 -0400, Mark Yacoub wrote:
> Hi Kamil,
> 
> Thanks for your feedback. I'd like to elaborate on my use case to provide
> more context about the problem I'm trying to solve.
> 
> I am building IGT for Android, and the same build system is deployed on
> both physical hardware and virtual machines. On the hardware, the
> appropriate hardware driver is correctly detected, so there are no issues
> there. However, on the VM, VKMS is running, but it's currently excluded
> from `DRIVER_ANY`, which prevents the tests from running against it. I need
> the tests to execute on VKMS in this scenario.
> 
> Using `IGT_FORCE_DRIVER` would require me to fork the build processes for
> hardware and VM, which I would prefer to avoid. My goal is to maintain a

You do not need to fork it nor recompile, this is env var for
CI run with tests, it uses the same igt binaries only makes them
using a forced driver when opening card. Now it do not work as
no user before needed to force it into vgem or VKMS.

In theory you could define it like: export IGT_FORCE_DRIVER=vkms
and then all kms tests and core_ ones should honor it.

Regards,
Kamil

> unified build system and allow IGT to run on whatever driver is present. Is
> there a way to achieve this?
> 
> I understand that the current code prioritizes the hardware driver, which
> is a desirable behavior. I'm trying to understand the potential issues that
> might arise if VKMS were not excluded in other contexts.
> 
> Thank you!
> Mark
> 
> 
> On Thu, Oct 9, 2025 at 12:46 PM Kamil Konieczny <
> kamil.konieczny@linux.intel.com> wrote:
> 
> > Hi Mark,
> > On 2025-10-08 at 12:02:09 -0400, Mark Yacoub wrote:
> > > [Why]
> > > VKMS (Virtual VKMS) is typically running on a virtual machine where it's
> > > expected to be without a contention with a hardware driver.
> > > When it's there, we would like to run IGT on it.
> > >
> > > [How]
> > > Delete VKMS from DRIVER_ANY's exclusion list to allow IGT to be picked
> > > up.
> > >
> > > Tested: Ran kms_bw on Android's VM with VKMS enabled.
> > >
> > > Change-Id: Ib13ad9261b8c2617370c02d0ffb5aa878bf3d8f8
> > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > ---
> > >  lib/drmtest.h | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/lib/drmtest.h b/lib/drmtest.h
> > > index 8416aa491..ab991da57 100644
> > > --- a/lib/drmtest.h
> > > +++ b/lib/drmtest.h
> > > @@ -63,10 +63,8 @@ int __get_drm_device_name(int fd, char *name, int
> > name_size);
> > >   * on a system with them as well as a supported driver, you can end up
> > >   * with a near-100% skip rate if you don't explicitly specify the
> > device,
> > >   * depending on device-load ordering.
> > > - *
> > > - * Exclude VKMS to prefer hardware drivers.
> > >   */
> > > -#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VKMS | DRIVER_VIRTIO)
> > > +#define DRIVER_ANY   ~(DRIVER_VGEM | DRIVER_VIRTIO)
> >
> > Nak, this is bad as there could be vkms module also on host.
> >
> > Let me work on improving IGT_FORCE_DRIVER.
> >
> > Regards,
> > Kamil
> >
> > >
> > >  /*
> > >   * Compile friendly enum for i915/xe.
> > > --
> > > 2.51.0.740.g6adb054d12-goog
> > >
> >
