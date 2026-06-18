Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F033ACD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 20:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9810E576;
	Thu, 18 Jun 2026 20:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4KLAdCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D746E10EE7F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781815138; x=1813351138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8vN10Cxn3UFzajFBwumCLlkoHmtisbPvzhGbcI/1uuM=;
 b=N4KLAdCkkc5q4Xyd7IX3tGu0l3vyFRaL0TlHzfeRZH4TEZiUaC/TnNjg
 S2ekB564KXpxAoYzcwGryfOkgQ0iIisS4UI8X+gteSwHjotvXsK8tjUtN
 WtMu5I8UL2OlcnJqPyOfLf9MHvNR4x98xDP3lc3ZVn4OqBDouBWW14ENy
 ZG7Fa3NmEI7azJBGTlDezCe6p72ey+B444p9zl6QqUF70VY8OaCm2Z4EP
 C6fLkkhY3xVATY0UOB22Ialr1os9pYoNnXEluBJbgqXKOjlcHPuXbAHTJ
 uDFAM60+dQXHzqPlJESvtPFcaOJZjvNAQm2JGxd0Dz29+gcKiX9RYtf6S Q==;
X-CSE-ConnectionGUID: XLYbpe1OTm6YvDQ5C6W6dg==
X-CSE-MsgGUID: rbzo7k8GRYelZc/gTdLQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82674766"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82674766"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 13:38:57 -0700
X-CSE-ConnectionGUID: f8L9eDZyTJOB7O0uE1qFOA==
X-CSE-MsgGUID: /ZxPeW7aS5SCPLZsfELRSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="244113690"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 13:38:56 -0700
Date: Thu, 18 Jun 2026 22:38:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 2/2] tools/intel_reg: Create default accelerator
 access
Message-ID: <20260618203854.nbnng44udcsoyva2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
 <20260617202600.251889-3-kamil.konieczny@linux.intel.com>
 <874ij0q0ni.wl-ashutosh.dixit@intel.com>
 <20260618115036.j477gmgx7loowtah@kamilkon-DESK.igk.intel.com>
 <8733yjpywy.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8733yjpywy.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2026-06-18 at 09:59:41 -0700, Dixit, Ashutosh wrote:
> On Thu, 18 Jun 2026 04:50:36 -0700, Kamil Konieczny wrote:
> >
> > Hi Dixit,,
> > On 2026-06-17 at 15:09:53 -0700, Dixit, Ashutosh wrote:
> > > On Wed, 17 Jun 2026 13:25:58 -0700, Kamil Konieczny wrote:
> > > >
> > > > Among computing devices there are GPU and accelerators and the
> > > > intel_reg tool worked only with former ones. Create new way for
> > > > finding a compute device and when no Intel GPU is found, then
> > > > search for Intel accelerator. Also, inform user about which type
> > > > of device will be accessed.
> > > >
> > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > ---
> > > >  tools/intel_reg.c | 12 ++++++++++++
> > > >  1 file changed, 12 insertions(+)
> > > >
> > > > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > > > index 49afe91c0..b4f8cd0fd 100644
> > > > --- a/tools/intel_reg.c
> > > > +++ b/tools/intel_reg.c
> > > > @@ -1382,6 +1382,18 @@ int main(int argc, char *argv[])
> > > >				return EXIT_FAILURE;
> > > >		} else {
> > > >			config.pci_dev = intel_get_pci_device();
> > > > +			if (config.pci_dev) {
> > > > +				fprintf(stderr, "Found Intel GPU PCI device 0x%x\n", config.pci_dev->device_id);
> > > > +			} else {
> > > > +				config.pci_dev = intel_get_pci_accelerator_device();
> > > > +				if (config.pci_dev)
> > > > +					fprintf(stderr, "Found Intel accelerator PCI device 0x%x\n", config.pci_dev->device_id);
> > > > +			}
> > > > +
> > > > +			if (!config.pci_dev) {
> > > > +				fprintf(stderr, "Cannot find Intel GPU nor accelerator device\n");
> > > > +				return EXIT_FAILURE;
> > > > +			}
> > >
> > > So what I am not following is why you want to preserve
> > > intel_get_pci_device() to just display class devices? In
> > > https://patchwork.freedesktop.org/series/168385/ intel_get_pci_device() is
> > > extended to both display and acceleretor class devices. So this kind of
> > > modification to the individual tools is not needed at all.
> >
> > But existing tools willl not work for accelerators?
> > They are meant for display/GPU only.
> > cd tools
> > grep -l intel_get_pci_device *c
> > intel_audio_dump.c
> > intel_backlight.c
> > intel_display_bandwidth.c
> > intel_display_poller.c
> > intel_forcewaked.c
> > intel_gpu_time.c
> > intel_gtt.c
> > intel_infoframes.c
> > intel_lid.c
> > intel_panel_fitter.c
> > intel_reg.c
> > intel_reg_checker.c
> > intel_watermark.c
> 
> https://patchwork.freedesktop.org/patch/733334/?series=168385&rev=4
> 
> According to me only the tools calling intel_get_pci_device_display() work
> only with display/gpu.
> 
> See also my comments here:
> https://lore.kernel.org/igt-dev/87wlvyzbn0.wl-ashutosh.dixit@intel.com/
> 
> > Which ones from above could work? Or can you add to cc few devs
> > from Intel accelerators drivers and ask him/her for opinion?
> 
> I don't think we should be spending time refining this at this time. If
> something is not completely right it can be fixed later. We just need to
> provide the correct lib functions in lib/ at this time.
> 
> > >
> > > Note that it is not just intel_reg. Similar modification will need to all
> > > tools which currently call intel_get_pci_device(). They will now all have
> > > to be changed to add the intel_get_pci_accelerator_device() calls,
> > > something which is not needed with
> > > https://patchwork.freedesktop.org/series/168385/ (especially rev1 of that
> > > series). Because we would want most of these tools to "just work" with any
> > > intel device (display or accelerator).
> > >
> > > See also my comments here:
> > > https://lore.kernel.org/igt-dev/87wlvyzbn0.wl-ashutosh.dixit@intel.com/
> > >
> > > Anyway, let's see what other reviewers have to say about this.
> >
> > Well, I just do not like indeterminancy of that function, it was
> > returning whatever a first device was on PCI bus. When it
> > searched for display only it was ok, now you never know which
> > one will be.
> > Second no-go is that accelerators could be non-GPU based and
> > then almost all of our tools will not work.
> 
> Note that accelerators are mostly the same as GPU, except maybe for display
> part, so your assumption "almost all of our tools will not work" is wrong.
> 
> In any case, if you want to keep intel_get_pci_device() for display, you
> need to provide a function, such as intel_get_pci_device_any(), which will
> work for both display and accelerator. We can't have each tool modified to
> add this code, this should be provided as a function in lib/.
> 
> I prefer this naming scheme:
> 
> - intel_get_pci_device() or intel_get_pci_device_any(): for both display and
>   accelerator

I would prefer new name to avoid future confusion but the rename
could be done later.

> 
> - intel_get_pci_device_display() for display.
> 

Ok, we could also take that way, see my reply to your v4 patch.

Regards,
Kamil

> - intel_get_pci_device_accelerator() for accelerator (according to me there
>   is no use cases for only accelerator at this time).
> 
> > >
> > > Thanks.
> > > --
> > > Ashutosh
> > >
> > > >		}
> > > >
> > > >		config.devid = config.pci_dev->device_id;
> > > > --
> > > > 2.54.0
> > > >
