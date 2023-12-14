Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878A10E2F2
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 12:32:55 +0000 (UTC)
Date: Thu, 14 Dec 2023 13:32:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v7 6/7] lib/igt_sriov_device: add helpers for VF
 DRM driver bind and unbind
Message-ID: <20231214123237.5hx7gfzxaazqrdmg@kamilkon-desk.igk.intel.com>
References: <20231205081618.18143-1-lukasz.laguna@intel.com>
 <20231205081618.18143-7-lukasz.laguna@intel.com>
 <20231213150018.iwxxzwaipzrepxm4@kamilkon-desk.igk.intel.com>
 <37409f77-2fde-47d9-acd8-2dc552167e1a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37409f77-2fde-47d9-acd8-2dc552167e1a@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lukasz,

On 2023-12-13 at 22:29:32 +0100, Laguna, Lukasz wrote:
> On 12/13/2023 16:00, Kamil Konieczny wrote:
> > Hi Lukasz,
> > On 2023-12-05 at 09:16:17 +0100, Lukasz Laguna wrote:
> > > Helpers allow to bind and unbind a DRM driver for specified VF of a
> > > given PF device.
> > > 
> > > Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > > ---
> > >   lib/igt_sriov_device.c | 52 ++++++++++++++++++++++++++++++++++++++++++
> > >   lib/igt_sriov_device.h |  2 ++
> > >   2 files changed, 54 insertions(+)
> > > 
> > > diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> > > index c643f47d1..354125974 100644
> > > --- a/lib/igt_sriov_device.c
> > > +++ b/lib/igt_sriov_device.c
> > > @@ -5,9 +5,11 @@
> > >   #include <dirent.h>
> > >   #include <errno.h>
> > > +#include <pciaccess.h>
> > >   #include "drmtest.h"
> > >   #include "igt_core.h"
> > > +#include "igt_device.h"
> > >   #include "igt_sriov_device.h"
> > >   #include "igt_sysfs.h"
> > > @@ -287,3 +289,53 @@ bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num)
> > >   	return ret;
> > >   }
> > > +
> > > +static bool __igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num, bool bind)
> > Why bool here? imho better name would be:
> 
> 
> Bool, because it returns only a result from igt_sysfs_set which is bool. I
> see that "ret" is int actually, but I can change it to bool.
> I can also change return type to int and return -1 in case of false from
> igt_sysfs_set(), but it introduces new unnecessary logic and I don't see any
> advantage of such approach.

I was talking about second bool, it is usally bad to have bool params
but I would not force it, I agree that if you are not convinced you
can keep your code as is.

As for
    bool ret;

it looks better, with this:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> 
> > static bool __igt_sriov_set_vf_pci_slot(int pf, unsigned int vf_num, const char *bind)
> 
> 
> It wouldn't be clear to me what's the responsibility of a function with such
> name and how to use it. I prefer to leave current name and form of the
> implementation.
> 
> 
> > > +{
> > > +	int sysfs, ret;
> > > +	struct pci_device *pci_dev;
> > > +	char pci_slot[14];
> > > +
> > > +	igt_assert(vf_num > 0);
> > > +
> > > +	pci_dev = __igt_device_get_pci_device(pf, vf_num);
> > > +	igt_assert_f(pci_dev, "No PCI device for given VF number: %d\n", vf_num);
> > > +	sprintf(pci_slot, "%04x:%02x:%02x.%x",
> > > +		pci_dev->domain_16, pci_dev->bus, pci_dev->dev, pci_dev->func);
> > > +
> > > +	sysfs = igt_sysfs_open(pf);
> > > +	igt_assert_fd(sysfs);
> > > +
> > > +	igt_debug("vf_num: %u, pci_slot: %s\n", vf_num, pci_slot);
> > > +	ret = igt_sysfs_set(sysfs, bind ? "device/driver/bind" : "device/driver/unbind", pci_slot);
> > So here would be:
> > 	ret = igt_sysfs_set(sysfs, bind, pci_slot);
> > 
> > You could also add bind param into prints.
> > 
> > > +
> > > +	close(sysfs);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +/**
> > > + * igt_sriov_bind_vf_drm_driver - Bind DRM driver to VF
> > > + * @pf: PF device file descriptor
> > > + * @vf_num: VF number (1-based to identify single VF)
> > > + *
> > > + * Bind the DRM driver to given VF.
> > > + * It asserts on failure.
> > > + */
> > > +void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num)
> > > +{
> > > +	igt_assert(__igt_sriov_bind_vf_drm_driver(pf, vf_num, true));
> > imho assert on
> > 	__igt_sriov_set_vf_pci_slot(pf, vf_num, "device/driver/bind");
> > 
> > > +}
> > > +
> > > +/**
> > > + * igt_sriov_unbind_vf_drm_driver - Unbind DRM driver from VF
> > > + * @pf: PF device file descriptor
> > > + * @vf_num: VF number (1-based to identify single VF)
> > > + *
> > > + * Unbind the DRM driver from given VF.
> > > + * It asserts on failure.
> > > + */
> > > +void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num)
> > > +{
> > > +	igt_assert(__igt_sriov_bind_vf_drm_driver(pf, vf_num, false));
> > imho assert on
> > 	__igt_sriov_set_vf_pci_slot(pf, vf_num, "device/driver/unbind");
> > 
> > Regards,
> > Kamil
> > 
> > > +}
> > > diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> > > index c442c41a7..a3a08f8e1 100644
> > > --- a/lib/igt_sriov_device.h
> > > +++ b/lib/igt_sriov_device.h
> > > @@ -25,6 +25,8 @@ void igt_sriov_enable_driver_autoprobe(int pf);
> > >   void igt_sriov_disable_driver_autoprobe(int pf);
> > >   int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
> > >   bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
> > > +void igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num);
> > > +void igt_sriov_unbind_vf_drm_driver(int pf, unsigned int vf_num);
> > >   /**
> > >    * for_each_sriov_vf - Helper for running code on each VF
> > > -- 
> > > 2.40.0
> > > 
