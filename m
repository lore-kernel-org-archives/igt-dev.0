Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CD910E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:16:37 +0000 (UTC)
Date: Mon, 31 Oct 2022 11:16:33 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Y1+ggeFbrp6PZpvp@zkempczy-mobl2>
References: <20221028145704.30669-1-kamil.konieczny@linux.intel.com>
 <20221028145704.30669-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028145704.30669-3-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] lib/igt_device_scan: add
 card=all filter selector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 04:57:04PM +0200, Kamil Konieczny wrote:
> Allow to select all discrete cards on system with the help of
> card=all or card=* filter, for example:
> 
> pci:vendor=intel,device=discrete,card=all
> 
> or
> 
> pci:vendor=intel,device=discrete,card=*
> 
> This will add max of 64 cards filters with card=0..63 but will
> stop adding at card index not present on system. If no card will
> match only one filter for card=0 will be added.
> 
> v2: increase number of filters from 16 to 64, add stopper for
>   non-matching card to avoid filter splat (Petri)
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 43 ++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 6f5b90e6..f643d3de 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -120,6 +120,13 @@
>   *
>   *   It selects the second one.
>   *
> + *   |[<!-- language="plain" -->
> + *   pci:vendor=8086,device=1234,card=all
> + *   pci:vendor=8086,device=1234,card=*
> + *   ]|
> + *
> + *   This will add 0..15 card selectors.
> + *
>   *   We may use device codename or pseudo-codename (integrated/discrete)
>   *   instead of pci device id:
>   *
> @@ -1753,6 +1760,8 @@ static bool is_filter_valid(const char *fstr)
>  	return true;
>  }
>  
> +#define MAX_PCI_CARDS 64
> +
>  /**
>   * igt_device_filter_add
>   * @filters: filter(s) to be stored in filter array
> @@ -1776,14 +1785,42 @@ int igt_device_filter_add(const char *filters)
>  	while ((filter = strsep(&dup, ";"))) {
>  		bool is_valid = is_filter_valid(filter);
>  		struct device_filter *df;
> +		char *multi;
> +
>  		igt_warn_on(!is_valid);
>  		if (!is_valid)
>  			continue;
>  
>  		df = malloc(sizeof(*df));
> -		strncpy(df->filter, filter, sizeof(df->filter)-1);
> -		igt_list_add_tail(&df->link, &device_filters);
> -		count++;
> +		if (!strncmp(filter, "sriov:", 6)) {
> +			multi = NULL;
> +		} else {
> +			multi = strstr(filter, "card=all");
> +			if (!multi)
> +				multi = strstr(filter, "card=*");
> +		}
> +
> +		if (!multi) {
> +			strncpy(df->filter, filter, sizeof(df->filter)-1);
> +			igt_list_add_tail(&df->link, &device_filters);
> +			count++;
> +		} else {
> +			multi[5] = 0;
> +			for (int i = 0; i < MAX_PCI_CARDS; ++i) {
> +				struct igt_device_card card;
> +				if (i)
> +					df = malloc(sizeof(*df));
> +
> +				snprintf(df->filter, sizeof(df->filter)-1, "%s%d", filter, i);
> +				if (i && !igt_device_card_match(df->filter, &card)) { /* add at least card=0 */
> +					free(df);
> +					break;
> +				}
> +
> +				igt_list_add_tail(&df->link, &device_filters);
> +				count++;
> +			}

So essentially card=all|* is direct filter generator. As you're checking
existence of device you're safe imo loop again until no card will be
matched. So change for() to while(1) for me looks safe, we won't be
bounded at all.

Pros of your code is that test writer can iterate over IGT_DEVICE instead
of hardcoding filter in the test. So for some scenarios it can be useful
I think. Anyway it is harmless from my point of view so:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew


> +		}
>  	}
>  
>  	free(dup_orig);
> -- 
> 2.34.1
> 
