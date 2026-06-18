Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBBCCD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 11:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9734910ED7B;
	Thu, 18 Jun 2026 11:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnZrE/DA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC0C10ED7B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781783441; x=1813319441;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lzXUEgzQ8CbocuvYI3tHJd4zgAULAx4ghjWZSQrhXpM=;
 b=fnZrE/DAa4iHPG8SxzoL4DDosWTRhzafyEFP1ibzPFBNZw6VbJSRfByF
 p5KCtVTQqkZvPMTk42lqa8E5g9S4UBVOIaKHElCul2JT/opA/eF0J37Im
 amrZ7yJAPZTPDHIigXHZvvV9Ra1mUIQgj6ng9Hutu1QCoGT5ktc57WKDz
 Y4kLOndNAjXx+Qw5kMn6Is9KjX3lvaTTcniQH0S/hq5iK2VMwLuKIh0h7
 4C7lZFVtVj+e9GZqSCYqxNbVIsDp8q4l6BNYWxTn64Q610VANUP+Nf69F
 Jrtnnyol/gmin16UlitP47aCPEyQ8MggPep+kO32ACYRVuXxlNaALwjPG A==;
X-CSE-ConnectionGUID: dDK5+cHJSsCQJ+EGt7uiBQ==
X-CSE-MsgGUID: aJqLWHFzTzKBFCYlW42B5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82485640"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82485640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 04:50:41 -0700
X-CSE-ConnectionGUID: 8OJsUwvSRgCvnxXNwaTVcA==
X-CSE-MsgGUID: e8EsT9pGRd+nmdkFou95jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="247468181"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 04:50:40 -0700
Date: Thu, 18 Jun 2026 13:50:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 2/2] tools/intel_reg: Create default accelerator
 access
Message-ID: <20260618115036.j477gmgx7loowtah@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
 <20260617202600.251889-3-kamil.konieczny@linux.intel.com>
 <874ij0q0ni.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874ij0q0ni.wl-ashutosh.dixit@intel.com>
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
On 2026-06-17 at 15:09:53 -0700, Dixit, Ashutosh wrote:
> On Wed, 17 Jun 2026 13:25:58 -0700, Kamil Konieczny wrote:
> >
> > Among computing devices there are GPU and accelerators and the
> > intel_reg tool worked only with former ones. Create new way for
> > finding a compute device and when no Intel GPU is found, then
> > search for Intel accelerator. Also, inform user about which type
> > of device will be accessed.
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tools/intel_reg.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/tools/intel_reg.c b/tools/intel_reg.c
> > index 49afe91c0..b4f8cd0fd 100644
> > --- a/tools/intel_reg.c
> > +++ b/tools/intel_reg.c
> > @@ -1382,6 +1382,18 @@ int main(int argc, char *argv[])
> >				return EXIT_FAILURE;
> >		} else {
> >			config.pci_dev = intel_get_pci_device();
> > +			if (config.pci_dev) {
> > +				fprintf(stderr, "Found Intel GPU PCI device 0x%x\n", config.pci_dev->device_id);
> > +			} else {
> > +				config.pci_dev = intel_get_pci_accelerator_device();
> > +				if (config.pci_dev)
> > +					fprintf(stderr, "Found Intel accelerator PCI device 0x%x\n", config.pci_dev->device_id);
> > +			}
> > +
> > +			if (!config.pci_dev) {
> > +				fprintf(stderr, "Cannot find Intel GPU nor accelerator device\n");
> > +				return EXIT_FAILURE;
> > +			}
> 
> So what I am not following is why you want to preserve
> intel_get_pci_device() to just display class devices? In
> https://patchwork.freedesktop.org/series/168385/ intel_get_pci_device() is
> extended to both display and acceleretor class devices. So this kind of
> modification to the individual tools is not needed at all.

But existing tools willl not work for accelerators?
They are meant for display/GPU only.
cd tools
grep -l intel_get_pci_device *c
intel_audio_dump.c
intel_backlight.c
intel_display_bandwidth.c
intel_display_poller.c
intel_forcewaked.c
intel_gpu_time.c
intel_gtt.c
intel_infoframes.c
intel_lid.c
intel_panel_fitter.c
intel_reg.c
intel_reg_checker.c
intel_watermark.c

Which ones from above could work? Or can you add to cc few devs
from Intel accelerators drivers and ask him/her for opinion?

> 
> Note that it is not just intel_reg. Similar modification will need to all
> tools which currently call intel_get_pci_device(). They will now all have
> to be changed to add the intel_get_pci_accelerator_device() calls,
> something which is not needed with
> https://patchwork.freedesktop.org/series/168385/ (especially rev1 of that
> series). Because we would want most of these tools to "just work" with any
> intel device (display or accelerator).
> 
> See also my comments here:
> https://lore.kernel.org/igt-dev/87wlvyzbn0.wl-ashutosh.dixit@intel.com/
> 
> Anyway, let's see what other reviewers have to say about this.

Well, I just do not like indeterminancy of that function, it was
returning whatever a first device was on PCI bus. When it
searched for display only it was ok, now you never know which
one will be.
Second no-go is that accelerators could be non-GPU based and
then almost all of our tools will not work.

Regards,
Kamil


> 
> Thanks.
> --
> Ashutosh
> 
> >		}
> >
> >		config.devid = config.pci_dev->device_id;
> > --
> > 2.54.0
> >
