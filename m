Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF3010E1DD
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 14:59:59 +0000 (UTC)
Date: Thu, 20 Oct 2022 16:53:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y1Fg+OBEjR6CTfRQ@kamilkon-desk1>
References: <20221010190107.1576732-1-daniele.ceraolospurio@intel.com>
 <871qr3k0m3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <871qr3k0m3.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_kmod: Make sure the mei modules are
 loaded when i915 is
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-10-19 at 13:41:08 -0700, Dixit, Ashutosh wrote:
> On Mon, 10 Oct 2022 12:01:07 -0700, Daniele Ceraolo Spurio wrote:
> >
> 
> Hi Daniele,
> 
> > The mei modules are required on DG2 to use the GSC child device, which
> > is in turn responsible for loading HuC. We're observing a sporadic
> > failure in CI (see ref below) where it looks like the mei modules are
> > not automatically loaded by the kernel the fist time i915 exposes the
> > child device while being loaded by IGT, but are then loaded fine when
> > i915 is reloaded by another test later on.
> >
> > To make sure that the modules get loaded, explicitly modprobe them after
> > i915 is loaded.
> >
> > References: https://gitlab.freedesktop.org/drm/intel/-/issues/7029
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  lib/igt_kmod.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index bcf7dfeb..c9a9c2db 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -394,6 +394,9 @@ igt_i915_driver_load(const char *opts)
> >	}
> >
> >	bind_fbcon(true);
> > +	igt_kmod_load("mei_gsc", NULL);
> > +	igt_kmod_load("mei_hdcp", NULL);
> > +	igt_kmod_load("mei_pxp", NULL);
> 
> Afaiu there should be no need to do this, correct? If the device appears
> the driver should automatically load and bind to the device. So doing this
> explicity as above can hide issues in this process.

I agree with Ashutosh, we should not hide bugs in driver loading.

> 
> To me the sporadic nature of this issue seems to indicate something wrong
> in the kernel rather than in IGT, which we are trying to paper over with
> this patch. Not sure.
> 
> At least have we verified that doing this fix the issue, have we checked?
> Since the repro rate for GL #7029 is 76% it should be possible to verify or
> does it always pass in IGT pre-merge? At least the one run in Patchwork
> everything is passing.
> 
> Also maybe we should add some debug prints to gem_huc_copy.c which checks
> whether the module is not loaded when the test fails? Or is the module
> loaded but not binding to the device?

This or separate test gem_huc_loaded ? 
We can also try to print better logs in case of fail.

--
Kamil
> 
> There are many "[drm] mei driver not bound, disabling HuC load" in dmesg.
> 
> Or maybe instead of doing this in the lib here we do something in
> gem_huc_copy.c? Can we reload i915 in gem_huc_copy.c when starting the test
> or load these modules in gem_huc_copy.c e.g.?
> 
> Also do we only need to load these modules on platforms on which they are
> needed? Otherwise we will generate unnecessary "could not insert module"
> debug messages?
> 
> So mostly I am not comfortable with this patch. Can we get a second
> opinion?
> 
> Thanks.
> --
> Ashutosh
> 
> >	igt_kmod_load("snd_hda_intel", NULL);
> >
> >	return 0;
> > --
> > 2.37.3
> >
