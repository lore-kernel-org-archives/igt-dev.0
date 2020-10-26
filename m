Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D7B6E885
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 08:30:58 +0000 (UTC)
Date: Mon, 26 Oct 2020 10:30:54 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201026083054.GV7444@platvala-desk.ger.corp.intel.com>
References: <20201023031859.60295-1-ashutosh.dixit@intel.com>
 <20201023075927.GQ7444@platvala-desk.ger.corp.intel.com>
 <20201023080324.GR7444@platvala-desk.ger.corp.intel.com>
 <87lffxgcmp.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lffxgcmp.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 08:55:58AM -0700, Dixit, Ashutosh wrote:
> On Fri, 23 Oct 2020 01:03:24 -0700, Petri Latvala wrote:
> >
> > On Fri, Oct 23, 2020 at 10:59:27AM +0300, Petri Latvala wrote:
> > > On Thu, Oct 22, 2020 at 08:18:59PM -0700, Ashutosh Dixit wrote:
> > > > Align with kernel commits:
> > > >
> > > > 605f9c290c1a2 ("drm/i915: Sort ICL PCI IDs")
> > > > 514dc424ce4f5 ("drm/i915: Sort CNL PCI IDs")
> > > > 32d4ec9a1681d ("drm/i915: Sort CFL PCI IDs")
> > > > df3478af1d73c ("drm/i915: Sort CML PCI IDs")
> > > > cd988984cbea0 ("drm/i915: Sort KBL PCI IDs")
> > > > b04d36f737712 ("drm/i915: Sort SKL PCI IDs")
> > > > 9c0b2d30441b5 ("drm/i915: Sort HSW PCI IDs")
> > > > 79033a0a78984 ("drm/i915: Ocd the HSW PCI ID hex numbers")
> > > > cfb3db8fdae25 ("drm/i915: Try to fix the SKL GT3/4 vs. GT3e/4e comments")
> > > > 03e399020cd20 ("drm/i915: Add SKL GT1.5 PCI IDs")
> > > > 812f044df08cc ("drm/i915: Reclassify SKL 0x1923 and 0x1927 as ULT")
> > > > 194909a32aed0 ("drm/i915: Reclassify SKL 0x192a as GT3")
> > > > 82e84284ab7dd ("drm/i915: Update Haswell PCI IDs")
> > > > 24ea098b7c0d8 ("drm/i915/jsl: Split EHL/JSL platform info and PCI ids")
> > > > b50b7991b739c ("drm/i915/dg1: add more PCI ids")
> > > >
> > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > ---
> > >
> > > I get really confused by commit messages like this. Which commit is
> > > this now copied from, and which repo has that commit?
> 
> Hi Petri, yes I wasn't happy either doing this since it appears a simple
> commit message like "Sync i915_pciids.h with the drm-tip kernel as of
> today" should have been sufficient. But the previous git log for the file
> has followed this format for the commit message. The format is the same as
> that for "git log --oneline" for include/drm/i915_pciids.h on drm-tip,
> newest commits on top.
> 
> But yes, I should have said it's the drm-tip kernel.

The main thing I'm looking for is if this version of the header is in
drm-next already or is it only in dinq. Not a dealbreaker, but useful
information.

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
