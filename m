Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE9410E254
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 15:15:18 +0000 (UTC)
Date: Tue, 18 Oct 2022 17:13:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Y07Ckrg6eBe/qtJv@zkempczy-mobl2>
References: <20221018091001.18552-1-kamil.konieczny@linux.intel.com>
 <20221018091001.18552-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018091001.18552-2-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: refactor filer
 adding
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

On Tue, Oct 18, 2022 at 11:10:00AM +0200, Kamil Konieczny wrote:
> Refactor filter adding loop.

Eh, one thing not visible here - patch subject - s/filer/filter/

--
Zbigniew

> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 15be3844..6f5b90e6 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1775,13 +1775,15 @@ int igt_device_filter_add(const char *filters)
>  
>  	while ((filter = strsep(&dup, ";"))) {
>  		bool is_valid = is_filter_valid(filter);
> +		struct device_filter *df;
>  		igt_warn_on(!is_valid);
> -		if (is_valid) {
> -			struct device_filter *df = malloc(sizeof(*df));
> -			strncpy(df->filter, filter, sizeof(df->filter)-1);
> -			igt_list_add_tail(&df->link, &device_filters);
> -			count++;
> -		}
> +		if (!is_valid)
> +			continue;
> +
> +		df = malloc(sizeof(*df));
> +		strncpy(df->filter, filter, sizeof(df->filter)-1);
> +		igt_list_add_tail(&df->link, &device_filters);
> +		count++;
>  	}
>  
>  	free(dup_orig);
> -- 
> 2.34.1
> 
