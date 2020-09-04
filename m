Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329A96EB1D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2020 07:31:57 +0000 (UTC)
From: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Date: Fri, 4 Sep 2020 07:31:46 +0000
Message-ID: <0fef87a956224330bba6bae75a4b7297@intel.com>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
 <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
 <20200903115409.GA3720@zkempczy-mobl2>
In-Reply-To: <20200903115409.GA3720@zkempczy-mobl2>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: Fix device
 selection filter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> Sent: Thursday, September 3, 2020 5:24 PM
> To: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: Fix device
> selection filter
> =

> On Thu, Sep 03, 2020 at 04:31:09PM +0530, Ayaz A Siddiqui wrote:
> > DRM subsystem filter in intel_gpu_top was not working due to missing
> > PCI_SLOT_NAME property. Using the parent device in case of drm
> > subsystem leads to fix this issue.
> >
> > Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > ---
> >  lib/igt_device_scan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c index
> > 345bae76d..3583c69c7 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -1263,7 +1263,7 @@ bool igt_device_card_match(const char *filter,
> struct igt_device_card *card)
> >  	/* We take first one if more than one card matches filter */
> >  	dev =3D igt_list_first_entry(&igt_devs.filtered, dev, link);
> >
> > -	__copy_dev_to_card(dev, card);
> > +	__copy_dev_to_card(is_pci_subsystem(dev) ? dev : dev->parent,
> card);
> >
> >  	return true;
> >  }
> =

> The only doubt I got: - is that i915 driver behavior or all drm cards do =
the
> same?
I haven't check and In case of other drm card we may not have pmu also.
Regards
-Ayaz
 =

> =

> --
> Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
