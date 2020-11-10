Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A8A89AA6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 13:00:54 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201110073121.192006-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20201110073121.192006-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 10 Nov 2020 13:00:51 +0000
Message-ID: <160501325126.29434.3551992167366359553@build.alporthouse.com>
Subject: Re: [igt-dev] [i-g-t] lib/i915: Identify Jasperlake
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>, hariom.pandey@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tejas Upadhyay (2020-11-10 07:31:21)
> Recently we did split of EHL/JSL thus we need to indentify
> Jasperlake.
> 
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  lib/intel_device_info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index e1132d9c..054b98c0 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -423,6 +423,7 @@ static const struct pci_id_match intel_device_match[] = {
>         INTEL_ICL_11_IDS(&intel_icelake_info),
>  
>         INTEL_EHL_IDS(&intel_elkhartlake_info),
> +       INTEL_JSL_IDS(&intel_elkhartlake_info),

You could give it it's platform name as well. Might be useful later.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
