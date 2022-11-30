Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B745B10E072
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 12:43:52 +0000 (UTC)
Date: Wed, 30 Nov 2022 13:43:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y4dQA9epSjIxG3Ft@kamilkon-desk1>
References: <20221123085441.2821638-1-anshuman.gupta@intel.com>
 <20221123085441.2821638-2-anshuman.gupta@intel.com>
 <c04a4be3-b368-e4b0-0cee-4ae3497a88f9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c04a4be3-b368-e4b0-0cee-4ae3497a88f9@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/5] lib/igt_pci: helpers to get PCI
 capabilities offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2022-11-29 at 17:30:54 +0530, Nilawar, Badal wrote:
> Hi Anshuman,
> 
> On 23-11-2022 14:24, Anshuman Gupta wrote:
> > Added helper functions to search for PCI capabilities
> > with help of libpciaccess library.
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Co-developed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >   lib/igt_pci.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >   lib/igt_pci.h   | 32 ++++++++++++++++++++++++++++++++
> >   lib/meson.build |  1 +
> >   3 files changed, 77 insertions(+)
> >   create mode 100644 lib/igt_pci.c
> >   create mode 100644 lib/igt_pci.h
> > 
> > diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> > new file mode 100644
> > index 0000000000..bc0369341d
> > --- /dev/null
> > +++ b/lib/igt_pci.c
> > @@ -0,0 +1,44 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2022 Intel Corporation
> > + */
> > +
> > +#include <pciaccess.h>
> > +#include "igt_pci.h"
> > +
> > +/**
> > + * find_pci_cap_offset:
> > + * @dev: pci device
> > + * @cap_id: searched capability id, 0 means any capability
> > + * @start_offset: offset in config space from which we start searching
> > + *
> > + * return:
> > + * -1 on config read error, 0 if capability is not found,
> > + * otherwise offset at which capability with cap_id is found
> > + */
> > +int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
> > +			   int start_offset)
> > +{
> > +	uint8_t offset;
> > +	uint16_t cap_header;
> > +	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE)
> > +			/ sizeof(cap_header);
> > +
> > +	if (pci_device_cfg_read_u8(dev, &offset, start_offset))
> > +		return -1;
> > +
> > +	while (loop--) {
> > +		if (offset < PCI_TYPE0_1_HEADER_SIZE)
> > +			break;
> > +
> > +		if (pci_device_cfg_read_u16(dev, &cap_header, (offset & 0xFC)))
> > +			return -1;
> > +
> > +		if (!cap_id || cap_id == (cap_header & 0xFF))
> > +			return offset;
> > +
> > +		offset = cap_header >> 8;
> For the last capability, next capability address will always be 0. So above
> instead of using while(loop--) we can use while(offset).
> 
> Regards,
> Badal

This way we are guarded for endless looping, btw check for zero
is just at loop enter (first if).

> > +	}
> > +

I would like to see additional check here:

	if (loop <= 0 && offset)
		return -1;

or maybe assert here ?

> > +	return 0;
> > +}
> > diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> > new file mode 100644
> > index 0000000000..68afd2dacb
> > --- /dev/null
> > +++ b/lib/igt_pci.h
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2022 Intel Corporation
> > + */
> > +
> > +#ifndef __IGT_PCI_H__
> > +#define __IGT_PCI_H__
> > +
> > +#include <stdint.h>
> > +#include <endian.h>
> > +
> > +/* forward declaration */
> > +struct pci_device;
> > +
> > +#define PCI_TYPE0_1_HEADER_SIZE 0x40
> > +#define PCI_CAPS_START 0x34
> > +#define PCI_CFG_SPACE_SIZE 0x100
> > +#define PCIE_CFG_SPACE_SIZE 0x1000
------------ ^
Remove this, it is unused.

> > +
> > +enum pci_cap_id {
> > +	PCI_EXPRESS_CAP_ID = 0x10
> > +};
> > +
> > +int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
> > +			   int start_offset);
> > +
> > +static inline int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
---- ^ ---- ^
Remove this, it is work for optimizitaion in compiler, no need
for it here.
Btw do you expect user to use both functions ?

+cc Marcin

Regards,
Kamil

> > +{
> > +	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
> > +}
> > +
> > +#endif
> > diff --git a/lib/meson.build b/lib/meson.build
> > index cef2d0ff3d..e0fb7ddfed 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -33,6 +33,7 @@ lib_sources = [
> >   	'igt_pipe_crc.c',
> >   	'igt_power.c',
> >   	'igt_primes.c',
> > +	'igt_pci.c',
> >   	'igt_rand.c',
> >   	'igt_stats.c',
> >   	'igt_syncobj.c',
