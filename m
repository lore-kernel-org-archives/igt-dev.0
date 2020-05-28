Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9DA6E054
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2020 11:40:17 +0000 (UTC)
Date: Thu, 28 May 2020 14:40:12 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200528114012.n46eu7gflwb3fknk@ahiler-desk1.fi.intel.com>
References: <20200526122417.779145-1-arkadiusz.hiler@intel.com>
 <20200526122417.779145-3-arkadiusz.hiler@intel.com>
 <CAKi4VAJR1JvX8JM0dgZ+8NK6LMFg4WYBxm0C0bQeRc0jUvj3qQ@mail.gmail.com>
 <64c6c573-b06f-3e8d-7c32-8c74e17f54ca@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64c6c573-b06f-3e8d-7c32-8c74e17f54ca@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_device_scan: Add extra
 helpers for intel_gpu_top
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 28, 2020 at 11:27:13AM +0100, Tvrtko Ursulin wrote:
> 
> On 26/05/2020 17:26, Lucas De Marchi wrote:
> > On Tue, May 26, 2020 at 5:25 AM Arkadiusz Hiler
> > <arkadiusz.hiler@intel.com> wrote:
> > > 
> > > From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > > 
> > > Will be used in the next patch.
> > > 
> > > 1. set_pci_slot_name(): stores PCI_SLOT_NAME from prop to device
> > > 2. igt_device_find_first_discrete_card(): try to find first discrete GPU
> > > 3. igt_devices_free(): Free device buffers created during scan
> > > 
> > > Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > > ---
> > >   lib/igt_device_scan.c | 80 ++++++++++++++++++++++++++++++++++++-------
> > >   lib/igt_device_scan.h |  7 +++-
> > >   2 files changed, 74 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > > index be854b01..4daabbd9 100644
> > > --- a/lib/igt_device_scan.c
> > > +++ b/lib/igt_device_scan.c
> > > @@ -164,6 +164,7 @@ struct igt_device {
> > >          /* For pci subsystem */
> > >          char *vendor;
> > >          char *device;
> > > +       char *pci_slot_name;
> > > 
> > >          struct igt_list_head link;
> > >   };
> > > @@ -337,7 +338,21 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
> > >   #define is_drm_subsystem(dev)  (strequal(get_prop_subsystem(dev), "drm"))
> > >   #define is_pci_subsystem(dev)  (strequal(get_prop_subsystem(dev), "pci"))
> > > 
> > > -/* Gets PCI_ID property, splits to xxxx:yyyy and stores
> > > +/*
> > > + * Get PCI_SLOT_NAME property, it should be in format of
> > > + * xxxx:yy:zz.z
> > > + */
> > > +static void set_pci_slot_name(struct igt_device *dev)
> > > +{
> > > +       const char *pci_slot_name = get_prop(dev, "PCI_SLOT_NAME");
> > > +
> > > +       if (!pci_slot_name || (strlen(pci_slot_name) != PCI_SLOT_NAME_SIZE))
> > > +               return;
> > > +       dev->pci_slot_name = strdup(pci_slot_name);
> > > +}
> > > +
> > > +/*
> > > + * Gets PCI_ID property, splits to xxxx:yyyy and stores
> > >    * xxxx to dev->vendor and yyyy to dev->device for
> > >    * faster access.
> > >    */
> > > @@ -410,6 +425,45 @@ static struct igt_device *igt_device_find(const char *subsystem,
> > >          return NULL;
> > >   }
> > > 
> > > +static void
> > > +__copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
> > > +{
> > > +       if (dev->subsystem != NULL)
> > > +               strncpy(card->subsystem, dev->subsystem,
> > > +                       sizeof(card->subsystem) - 1);
> > > +
> > > +       if (dev->drm_card != NULL)
> > > +               strncpy(card->card, dev->drm_card, sizeof(card->card) - 1);
> > > +
> > > +       if (dev->drm_render != NULL)
> > > +               strncpy(card->render, dev->drm_render,
> > > +                       sizeof(card->render) - 1);
> > > +
> > > +       if (dev->pci_slot_name != NULL)
> > > +               strncpy(card->pci_slot_name, dev->pci_slot_name,
> > > +                       PCI_SLOT_NAME_SIZE + 1);
> > > +}
> > > +
> > > +/*
> > > + * Iterate over all igt_devices array and find first discrete card.
> > > + * card->pci_slot_name will be updated only if a discrete card is present.
> > > + */
> > > +void igt_device_find_first_discrete_card(struct igt_device_card *card)
> > > +{
> > > +       struct igt_device *dev;
> > > +
> > > +       igt_list_for_each_entry(dev, &igt_devs.all, link) {
> > > +
> > > +               if (!is_pci_subsystem(dev))
> > > +                       continue;
> > > +
> > > +               if ((strncmp(dev->pci_slot_name, INTEGRATED_GPU_PCI_ID, PCI_SLOT_NAME_SIZE)) != 0) {
> > > +                       __copy_dev_to_card(dev, card);
> > 
> > why do we need to make it prefer discrete? rather than "use the first
> > one if no one was specified"?
> 
> I thought that makes more sense for end user, assuming igpu and discrete,
> that user is more likely to want to look at the latter.
> 
> Otherwise I am also not sure if device enumeration is stable (across boots,
> distros, kernel versions, udevs, systemd, whoever is involved in providing
> the data device scan uses, plus the order of binding the driver to pci
> devices). So from that angle as well it made more sense to pick first
> discrete. Granted the approach falls apart with more than one discrete..
> Problem for another day?

Internally we sort the PCI devices by their syspath, so that should
help with this quarrel.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
