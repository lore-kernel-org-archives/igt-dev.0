Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 30 May 2022 16:21:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YpTExeHWbUh8P1Cf@platvala-desk.ger.corp.intel.com>
References: <20220527105042.2233128-1-tvrtko.ursulin@linux.intel.com>
 <YpQuhjGGOVBBHrkt@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YpQuhjGGOVBBHrkt@zkempczy-mobl2>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3] lib/igt_device_scan:
 Free filtered devices in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 30, 2022 at 04:40:06AM +0200, Zbigniew Kempczyński wrote:
> On Fri, May 27, 2022 at 11:50:40AM +0100, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > 
> > Fix a possible oversight.
> 
> Yes, properly coded in igt_device_scan() only. Thanks for spotting this.
> 
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >  lib/igt_device_scan.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 3c23fe0eb520..a30433ae2cff 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -814,6 +814,11 @@ void igt_devices_free(void)
> >  		igt_device_free(dev);
> >  		free(dev);
> >  	}
> > +
> > +	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link) {
> > +		igt_list_del(&dev->link);
> > +		free(dev);
> > +	}
> 
> Small nit - I would change the order (filtered list I would remove first).
> igt_device_free() also frees dev->devnode, ... so if we would change the 
> code to be more "parallel" it would be better to avoid use-after-free.
> 
> With this:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Tvrtko is away this week so I made this change and merged.


-- 
Petri Latvala


> 
> --
> Zbigniew
> 
> >  }
> >  
> >  /**
> > -- 
> > 2.32.0
> > 
