Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC8C10E774
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 18:45:42 +0000 (UTC)
Date: Wed, 28 Sep 2022 20:45:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <YzSWUSbp7RiarFMI@zkempczy-mobl2>
References: <20220915135739.3542117-1-riana.tauro@intel.com>
 <20220915135739.3542117-2-riana.tauro@intel.com>
 <87tu52ca09.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tu52ca09.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 08:59:18AM -0700, Dixit, Ashutosh wrote:
> On Thu, 15 Sep 2022 06:57:39 -0700, Riana Tauro wrote:
> >
> 
> Hi Riana,
> 
> > igt_devices_scan returns with empty list if devs_scanned
> > is true and function is called after igt_devices_free
> >
> > clear igt_devs.devs_scanned in igt_devices_free.
> 
> The patch seems reasonable but could you please describe where you saw this
> issue? It seems 'igt_devices_scan(true)' (called with force == true) will
> get past this issue. Not too familiar with igt_devices_scan() usage so
> copying some more people.
> 
> Also I am not sure why igt_devices_scan() doesn't simply do this:
> 
> void igt_devices_scan(bool force)
> {
> 	if (force && igt_devs.devs_scanned) {
> 		igt_devices_free();
> 
> 		/* Not needed after this patch */
> 		igt_devs.devs_scanned = false;
> 	}
> 
> 
> 
> Thanks.
> --
> Ashutosh

Agree with you. igt_devices_free() should also mark devs_scanned = false
to ensure it will be rescanned regardless force argument. And freeing
code in igt_devices_scan() is redundant now.

@Riana

Please resubmit with:

void igt_devices_scan(bool force)
{
	if (force && igt_devs.devs_scanned) 
		igt_devices_free();

	... rest is ok ...
}

and add igt_devs.devs_scanned = false to igt_devices_free().

IMO CI shouldn't complain and this redundancy will be removed.

Thanks
--
Zbigniew

> 
> 
> >
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  lib/igt_device_scan.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index eb6b45b8..e7c05d5c 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -1030,6 +1030,7 @@ void igt_devices_free(void)
> >		igt_device_free(dev);
> >		free(dev);
> >	}
> > +	igt_devs.devs_scanned = false;
> >  }
> >
> >  /**
> > --
> > 2.25.1
> >
