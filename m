Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BE089E11
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 04:22:41 +0000 (UTC)
Date: Tue, 29 Sep 2020 06:22:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200929042230.GC2711@zkempczy-mobl2>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
 <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
 <87imbx7hdc.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87imbx7hdc.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: Fix device
 selection filter
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
Cc: igt-dev@lists.freedesktop.org, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 01:53:35PM -0700, Dixit, Ashutosh wrote:
> On Thu, 03 Sep 2020 04:01:09 -0700, Ayaz A Siddiqui wrote:
> >
> > DRM subsystem filter in intel_gpu_top was not working due to missing
> > PCI_SLOT_NAME property. Using the parent device in case of drm subsystem
> > leads to fix this issue.
> >
> > Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > ---
> >  lib/igt_device_scan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 345bae76d..3583c69c7 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -1263,7 +1263,7 @@ bool igt_device_card_match(const char *filter, struct igt_device_card *card)
> >	/* We take first one if more than one card matches filter */
> >	dev = igt_list_first_entry(&igt_devs.filtered, dev, link);
> >
> > -	__copy_dev_to_card(dev, card);
> > +	__copy_dev_to_card(is_pci_subsystem(dev) ? dev : dev->parent, card);
> 
> Also I am wondering if this is required for only drm system then should
> this line be:
> 
>         __copy_dev_to_card(is_drm_subsystem(dev) ? dev->parent : dev, card)
> 
> Also does lsgpu (the only other caller of igt_device_card_match()) work
> with this change?

It is better than with previous patch but after playing with there's
still something I'm not happy with. It is - you're using drm:/path/...
filter to select exact drm device but you got its parent. Returned
card structure will contain "pci" as subsystem string instead of "drm".
This can be confusing but solves the problem accessing to pci slot name
with drm: filter only.

--
Zbigniew

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
