Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBD210E406
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Oct 2023 13:43:30 +0000 (UTC)
Date: Thu, 5 Oct 2023 15:43:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231005134326.yz4u2wo54m7nq3eg@zkempczy-mobl2>
References: <20231004164946.138398-1-kamil.konieczny@linux.intel.com>
 <20231004164946.138398-4-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004164946.138398-4-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8 3/6] lib/drmtest: drop checks for
 opened device for filters
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

On Wed, Oct 04, 2023 at 06:49:39PM +0200, Kamil Konieczny wrote:
> When using filters honor user choice and don't restrict opens
> to non-opened devices. This will allow a user to test some
> multiGPU tests with repeated filter for card zero:
> 
> --device=pci:vendor=Intel,device=discrete,card=0\;pci:vendor=Intel,device=discrete,card=0
> 
> If the user want it just allow this. Also while at this, move
> debug print into filter loop as there is already one for
> non-filter.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 43524c5ad..dbfa0282d 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -454,8 +454,8 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
>   *   * device scanning is executed,
>   *   * idx-th filter (starting with 0, filters are semicolon separated) is used
>   *   * if there is no idx-th filter, goto 2
> - *   * first device maching the filter is selected
> - *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
> + *   * device maching the requested filter is selected
> + *   * if it's not matched we fail with -1
>   *   * otherwise open the device and return the fd
>   *
>   * 2. compatibility mode - open the first DRM device we can find that is not
> @@ -497,11 +497,11 @@ int __drm_open_driver_another(int idx, int chipset)
>  {
>  	int fd = -1;
>  
> -	igt_debug("card idx: %d chipset: %d\n", idx, chipset);
>  	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
>  		struct igt_device_card card;
>  		bool found;
>  
> +		igt_debug("card idx: %d chipset: %d\n", idx, chipset);
>  		found = __get_card_for_nth_filter(idx, &card);
>  
>  		if (!found) {
> @@ -510,16 +510,14 @@ int __drm_open_driver_another(int idx, int chipset)
>  			found = __get_card_for_nth_filter(idx, &card);
>  		}
>  
> -		if (!found || !strlen(card.card))
> -			igt_warn("No card matches the filter! [%s]\n",
> -				 igt_device_filter_get(idx));
> -		else if (_is_already_opened(card.card, idx))
> -			igt_warn("card maching filter %d is already opened\n", idx);
> -		else {
> -			igt_debug("card idx: %d found: %s\n", idx, card.card);
> +		if (!found || !strlen(card.card)) {
> +			igt_warn("No card matches the filter! [%s]%s\n",
> +				 igt_device_filter_get(idx),
> +				 found && !strlen(card.card) ? " (card empty)" : "");
> +		} else {
> +			igt_debug("card %d found: [%s]\n", idx, card.card);
>  			fd = __open_driver_exact(card.card, chipset);
>  		}
> -
>  	} else {
>  		/* no filter for device idx, let's open whatever is available */
>  		igt_debug("No filter for device idx: %d\n", idx);
> -- 
> 2.42.0
> 

Great. From now on there's much easier to test multigpu on single gpu.
To be honest I've no idea why we introduced this check - from my
perspective I see no reason to disallow picking same card couple
of times with filter selection.

For above:
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew
