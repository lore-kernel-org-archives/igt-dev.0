Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791D510E1E5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 08:42:22 +0000 (UTC)
Date: Thu, 17 Nov 2022 10:42:34 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Y3Xz+hR0i1oFpYOm@platvala-desk.ger.corp.intel.com>
References: <20221102115851.2223804-1-anshuman.gupta@intel.com>
 <20221102115851.2223804-3-anshuman.gupta@intel.com>
 <87k03uog5t.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k03uog5t.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] test/i915_pm_rpm: Verify bridge
 binds with pcieport driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 16, 2022 at 11:25:34AM -0800, Dixit, Ashutosh wrote:
> On Wed, 02 Nov 2022 04:58:51 -0700, Anshuman Gupta wrote:
> >
> > @@ -1559,15 +1559,20 @@ static bool device_in_pci_d3(struct pci_device *pci_dev)
> >
> >  static void pci_d3_state_subtest(void)
> >  {
> > -	struct pci_device *pci_dev;
> > +	struct pci_device *pci_dev, *bridge_pci_dev;
> >
> >	igt_require(has_runtime_pm);
> >
> >	pci_dev = igt_device_get_pci_device(drm_fd);
> > +	bridge_pci_dev = pci_device_get_parent_bridge(pci_dev);
> >
> >	disable_all_screens_and_wait(&ms_data);
> >	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
> >
> > +	if (gem_has_lmem(drm_fd))
> > +		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
> > +			      "pci bridge device does not bind with pcieport driver\n");
> 
> This test is in BAT/fast-feedback list. Not sure if tests in BAT list are
> allowed to skip?

They are.


-- 
Petri Latvala
