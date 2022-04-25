Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5F410E12D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 12:58:34 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:58:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Ymaa+OTa3ZJ2ykBU@platvala-desk.ger.corp.intel.com>
References: <20220422125912.6862-1-anshuman.gupta@intel.com>
 <87y1zx6qzs.wl-ashutosh.dixit@intel.com>
 <6b377d0333494eb1940bd2f96ba15cb8@intel.com>
 <874k2haf9t.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874k2haf9t.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX()
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Apr 24, 2022 at 10:44:14PM -0700, Dixit, Ashutosh wrote:
> On Sun, 24 Apr 2022 22:24:06 -0700, Gupta, Anshuman wrote:
> >
> > > -----Original Message-----
> > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > Sent: Friday, April 22, 2022 9:38 PM
> > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX() support
> > >
> > > On Fri, 22 Apr 2022 05:59:12 -0700, Anshuman Gupta wrote:
> > > >
> > > > Currently IGT is lacking IS_DGFX() macro support.
> > > > There are some power features like D3Cold are only supported on
> > > > discrete card. So IGT test/tools specific to D3Cold requires to
> > > > consume IS_DGFX().
> > > > Adding a is_dgfx field in intel_device_info and initializing it for
> > > > DG1. All future discrete platform would require to initialize this
> > > > field.
> > >
> > > #define IS_DGFX(fd) gem_has_lmem(fd) ?
> > >
> > > gem_has_lmem() is already pretty widely used so maybe we should not
> > > introduce another way to achieve the same goal?
> >
> > Before introducing this , I thought on using gem_has_lmem.
> > But I was not sure in case every discrete platform mandatory to have lmem region.
> > If it is guaranteed that every discrete platform will have lmem memory region ?
> > I will  drop  this patch.
> 
> So not sure what will happen in the future but till now and in the
> forseeable future all dGfx platforms have LMEM, so gem_has_lmem seems fine.
> 
> I think if we introduce IS_DGFX() as in this patch, we should have an
> additional patch to convert all tests using gem_has_lmem() to IS_DGFX() so
> that we don't have multiple ways of tests deciding if something should run
> for dGfx.

The difference between checking for device info data and runtime data
is finding out whether something is expected to work on some kernel
versions or not. Runtime data should always be preferred when it's
available. A stupid example from history: DG1 enablement phase when
lmem access wasn't there yet in the kernel. gem_has_lmem() false,
still dGPU. IS_DGFX() doesn't tell that lmem interfaces are usable for
this device, it just tells that this device is supposed to have
gem_has_lmem() = true.

Best practice is to appease the human reader of the test code: Instead
of something like

if (IS_DGFX(i915))

use

if (i915_can_do_d3cold(i915))

where the function is

bool i915_can_do_d3cold(int i915) {
  /* explain why only DGFX, and all DGFX */
  return IS_DGFX(i915);
}

In my opinion nothing should care directly whether a device is DGFX or
not, but specific requirements can be expressed with IS_DGFX just fine
if there's not a good way to ask the kernel if the capability is
present.

If multiple different requirement checks end up being just "return
IS_DGFX(i915)" it doesn't matter, we're still better off for the case
in the future when someone figures out a better way to control whether
the device can do x. Easier to find all the spots that case about x,
but not y.


-- 
Petri Latvala
