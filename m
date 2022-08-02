Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A35A8ED6E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 09:52:52 +0000 (UTC)
Date: Tue, 2 Aug 2022 11:52:48 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yujz8G8ZAvPZQpA3@zkempczy-mobl2>
References: <20220802092756.26693-1-zbigniew.kempczynski@intel.com>
 <Yujwcwhuwr8S4xU/@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yujwcwhuwr8S4xU/@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest: Don't log a warning when
 drm driver is not loaded
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 02, 2022 at 12:37:55PM +0300, Petri Latvala wrote:
> On Tue, Aug 02, 2022 at 11:27:56AM +0200, Zbigniew Kempczyński wrote:
> > Some drivers left machine with drm driver unloaded. When IGT_DEVICE is
> > set first call to __get_card_for_nth_filter() won't find the drm device
> > and outputs a warning.  Lets avoid logging a warning when we're not sure
> > drm driver is loaded.
> > 
> > Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6498
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > ---
> >  lib/drmtest.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 4f9d8a11cb..58d2f7f998 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -348,12 +348,15 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
> >   *
> >   * @card: pointer to the igt_device_card structure to be filled
> >   * when a card is found.
> > + * @do_warn: write out a warning when filter cannot match the device. Used for
> > + * case when drm module is not loaded but filter (IGT_DEVICE) is set.
> >   *
> >   * Returns:
> >   * True if card according to the added filter was found,
> >   * false othwerwise.
> >   */
> > -static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
> > +static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card,
> > +				      bool do_warn)
> >  {
> >  	const char *filter;
> >  
> > @@ -366,7 +369,8 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
> >  			return true;
> >  		}
> >  
> > -		igt_warn("No card matches the filter!\n");
> > +		if (do_warn)
> > +			igt_warn("No card matches the filter!\n");
> >  	}
> >  
> >  	return false;
> > @@ -434,11 +438,11 @@ int __drm_open_driver_another(int idx, int chipset)
> >  		struct igt_device_card card;
> >  		bool found;
> >  
> > -		found = __get_card_for_nth_filter(idx, &card);
> > +		found = __get_card_for_nth_filter(idx, &card, false);
> >  
> >  		if (!found) {
> >  			drm_load_module(chipset);
> > -			found = __get_card_for_nth_filter(idx, &card);
> > +			found = __get_card_for_nth_filter(idx, &card, true);
> 
> If you make get_card_for_nth warn here, you get the warning
> twice. There's a warning printed three lines below (outside of this
> diff's context).
> 
> >  		}
> >  
> >  		if (!found || !strlen(card.card))
> > @@ -483,7 +487,7 @@ int __drm_open_driver_render(int chipset)
> >  		struct igt_device_card card;
> >  		bool found;
> >  
> > -		found = __get_card_for_nth_filter(0, &card);
> > +		found = __get_card_for_nth_filter(0, &card, true);
> 
> This is the only call site that needs 'true'. Making me think whether
> it's cleaner to just remove the warning from get_card_for_nth
> altogether and just add it here.

vkms doesn't have render node. And I would assume other drivers may
not instantiate render node as well. So we wouldn't drop any warning
at all. 

--
Zbigniew

> 
> 
> -- 
> Petri Latvala
> 
> 
> >  
> >  		if (!found || !strlen(card.render))
> >  			return -1;
> > -- 
> > 2.34.1
> > 
