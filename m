Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910F9CCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 23:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB8710E059;
	Fri, 10 Oct 2025 23:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hD03vAym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D6C10E059
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 23:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760138746; x=1791674746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JtOeiNr+WZx7UzO4gdO1fa0B1FryGBYE8wL826GFlXY=;
 b=hD03vAymfTETGiycL2vHXIrH0hbidqAJSfTHlHZjRGRWAsNp7KrCUBN4
 JSTN4gdGPRFWjZ3dZOqrjPXtRraKbif2mst27DqiME5kC+/jJR9DuusXk
 dbR9IA7WPCeBB0rt1ZAeeoOXQH38BOvkgesXgHA1kuiQpuLD7qQynpA1J
 vgpitR7GHXjgA8GJnwrYLvSt0vDcXEtJC4vHlLudx2LeL46sGViRvpbiA
 WgyehOcIRYm6AXgqnRsXKM0J7UlFheSf1wfLLNL3cK7aUgOQYZMifLzHD
 07edAkQCz0BgKjn39CGoAO2JEYzDWsdpYX0+Ia7fnu4FwP3yi2apeWBZW A==;
X-CSE-ConnectionGUID: QWgv+12zTyO2wJE+K0uVMw==
X-CSE-MsgGUID: S4v9pLcJS2+ErGkJUI4fZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="66016977"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="66016977"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 16:25:45 -0700
X-CSE-ConnectionGUID: HrokITnQSaCODVuAV7+t/Q==
X-CSE-MsgGUID: aqL6kKjFT0qz3g1RHSosgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="185108804"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.174])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 16:25:42 -0700
Date: Sat, 11 Oct 2025 02:25:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: "Wang, X" <x.wang@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Nguyen, Brian3" <brian3.nguyen@intel.com>,
 "Zuo, Alex" <alex.zuo@intel.com>,
 "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe
 devices
Message-ID: <aOmV8yQHOB9Pa_1d@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251008210236.396859-1-x.wang@intel.com>
 <20251008210236.396859-2-x.wang@intel.com>
 <20251008220136.GC1207432@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046071C5781D386651043FC86EEA@SA3PR11MB8046.namprd11.prod.outlook.com>
 <20251009235740.GH1207432@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009235740.GH1207432@mdroper-desk1.amr.corp.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Oct 09, 2025 at 04:57:40PM -0700, Matt Roper wrote:
> On Thu, Oct 09, 2025 at 11:00:57AM -0700, Wang, X wrote:
> > 
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: Wednesday, October 8, 2025 15:02
> > > To: Wang, X <x.wang@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Lin,
> > > Shuicheng <shuicheng.lin@intel.com>; Nguyen, Brian3
> > > <brian3.nguyen@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Goyal, Nakshtra
> > > <nakshtra.goyal@intel.com>; Bhadane, Dnyaneshwar
> > > <dnyaneshwar.bhadane@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> > > Subject: Re: [PATCH v3 1/6] lib: Add runtime device info query APIs for xe devices
> > > 
> > > On Wed, Oct 08, 2025 at 09:02:31PM +0000, Xin Wang wrote:
> > > > Introduce new APIs to query device information at runtime for xe devices:
> > > > - intel_query_gen(int fd): Get graphics generation
> > > > - intel_query_graphics_ver(int fd): Get combined graphics version
> > > > - intel_query_device_info(int fd): Get device info structure
> > > 
> > > High-level question:  across our existing IGT codebase, how many places
> > > in the code truly need to lookup IP versions based solely on the PCI ID
> > > and don't have any access to an actual device (in the form of an fd)?
> > > From a quick skim, it seems like the vast majority of our code has some
> > > pattern along the lines of
> > > 
> > >         int fd = ...;
> > >         uint16_t devid = intel_get_drm_devid(fd);
> > > 
> > >         if (intel_graphics_ver(devid) >= ...)
> > >                 ...
> > > 
> > > Aside from a few exceptions[*] it seems like the path of least
> > > resistance would be to adjust the signature of our existing intel_gen()
> > > and intel_graphics_ver() functions to just take an fd instead of a
> > > devid.  Initially those functions could call intel_get_drm_devid()
> > > internally to get a device ID and do a device info lookup, and then
> > > subsequent patches could add additional logic to do a proper ioctl query
> > > first, and then only fall back to the device info in cases where the
> > > query isn't possible (i.e., i915 driver and/or pre-GMD_ID platform).
> > > 
> > > [*] From a quick skim of the code, the main exceptions that jumped out
> > > at me as truly needing a devid rather than an fd were:
> > > 
> > >  - The printing/dumping functions in lib/instdone.c that get called by
> > >    tools/intel_error_decode.c.  These wind up being a bit different
> > >    because they're specifically used by a tool that analyzes error
> > >    dumps; the device ID used during error dump processing either comes
> > >    from the error dump file on disk or from the tool's command line.
> > >    The device itself isn't opened and may not even be available since
> > >    the error decoding can be executed on a different platform than the
> > >    dump itself originally came from.
> > > 
> > >  - Tools like intel_reg, intel_gtt, etc. that scan the list of PCI
> > >    devices and use libpciaccess to map+access BARs without ever
> > >    opening the DRM file handle.  In fact, these tools can potentially
> > >    run without the driver loaded at all since all they care about is PCI
> > >    device enumeration and raw access to the BARs.
> > > 
> > > Since the exceptions noted above are all tools (and mostly old tools
> > > that nobody actively updates anymore), I'd be inclined to let the tests
> > > and other parts of the codebase that are actively developed continue
> > > using the existing function names (intel_gen, intel_graphics_ver, etc.),
> > > just with a signature change to take an fd instead of devid.  Then We
> > > can create a separate set of dedicated functions (e.g.,
> > > "i915_graphics_ver_from_devid()") for the special cases where lookups by
> > > device ID are unavoidable.  Since lookups by device ID simply aren't
> > > possible going forward, this will also help us figure out if there are
> > > cases where our current tools are simply going to stop working and need
> > > 
> > > 
> > > Matt
> > > 
> > Project-Wide Replacement Analysis
> > If we search the entire project for intel_get_device_info|intel_gen|intel_graphics_ver, we find:
> > 
> > 136 files
> > 483 occurrences
> > 
> > Option 1: Keep Function Names, Change Parameters
> > If we choose to keep the original function names but change their parameters to use FD instead of devid, we would need to:
> > 
> > Modify all 136 files
> > Update every usage
> > I understand that keeping the function names unchanged would be more convenient for developers.
> > 
> > Option 2: Introduce New API Names for XE and make compatible with i915
> > If we instead introduce new API names - intel_query_device_info|intel_query_gen|intel_query_graphics_ver - and only modify files related to XE testing, then:
> > 
> > We only need to modify 36 files
> > With 127 occurrences
> > 
> > I suggest we should not modify the legacy i915 code, because our goal is solely to fix issues on XE hardware. The i915 code has been running stably for many years, and it's better to leave it untouched.
> 
> I don't think the goal should be to minimize lines/files changed, but
> rather to do a full refactor that makes the codebase easy to
> understand/develop/maintain going forward.  If people writing new IGT
> code have two different APIs that look very similar, but have
> hard-to-understand hardware and driver differences in when a specific
> API can be used, or when either one might work properly, then it's going
> to lead to a lot of confusion, bad copy-pastes, and bugs.
> 
> In the end we're going to wind up with two API's no matter what --- one
> device-based, and one pciid-based.  I think the device (FD) API is the
> one we want to use almost everywhere because it matches the semantics of
> what we're really trying to do (lookup the version associated with a
> specific device); we should discourage use of the PCI ID API anywhere
> that isn't one of the special-case tools that doesn't operate on a DRM
> fd.  So that means one of two ways forward:
> 
>  - Update the signature of the existing functions, and keep them the
>    preferred functions to use throughout most of IGT
> 
>  - Demote the the existing functions the tool-only API and switch all of
>    the other current tools and tests that currently call them over to
>    using a new FD-based API.
> 
> Both of those are going to require widespread refactor across the IGT
> codebase.  But I think either one is still preferable to trying to
> minimize the diff.  If we just bolt on another API, but then don't
> actually use it in most of the places where it makes sense, I think it's
> going to cause a lot more confusion and bugs in the long term.

Agreed. People must keep refactoring the codebase, otherwise it
will bitrot into an unmaintanable mess.

In this case I think it could be done following this simple rule:
anything that has an fd already can use the fd based API, anything
that doesn't have an fd should stick to the devid based API. Should
probalby be able to do the bulk of that with cocci. Afterwards you
can evaluate on a case-by-case basis whether more conversions are
warranted.

But to be clear we do need the no-fd API for the tools. I've lost
count how many times I've fixed the mmio stuff to not need the fd
after my tools stopped working correctly.

I'm not sure anyone needs the no-fd API for non-display stuff though?
I suppose the GPU error decoder might need it? But that only works 
correctly for old hardware, and for new stuff you just use the
decoder from mesa. So that one least shouldn't require any future
maintenance (adding new PCI IDs and such).

The other related mess is that intel_graphics_ver() returns the
full IP version, but intel_display_ver() hands out the major version
only. Someone should look into unifying all that. Probably we 
should have foo_ver() and foo_ver_full() just like in kernel land.

-- 
Ville Syrjälä
Intel
