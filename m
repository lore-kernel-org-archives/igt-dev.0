Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DFA6ED25
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 12:07:50 +0000 (UTC)
References: <1576149966-11404-1-git-send-email-kunal1.joshi@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <d37b7955-53e3-8d02-25b6-cf5255fece76@linux.intel.com>
Date: Thu, 12 Dec 2019 14:07:45 +0200
MIME-Version: 1.0
In-Reply-To: <1576149966-11404-1-git-send-email-kunal1.joshi@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_chamelium.c: Skip test if
 chamelium
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
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 12/12/2019 13:26, Kunal Joshi wrote:
> If chamelium is not present at the specified IP in the igtrc file,
> tests should be skipped instead of failing.
> Adding a change to skip tests on any network related issue and
> assert on any other issue.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 9971f51..79eddde 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -344,9 +344,12 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
>  				 format_str, va_args);
>  	va_end(va_args);
>  
> -	igt_assert_f(!chamelium->env.fault_occurred,
> -		     "Chamelium RPC call failed: %s\n",
> -		     chamelium->env.fault_string);
> +	if (chamelium->env.fault_code == XMLRPC_NETWORK_ERROR)
> +		igt_skip("Chamelium not found at specified IP");

This message is misleading when the network just did not come back.

I prefer the fact that the test fails as it draws attention to either a
mis-configured igtrc, a network problem, or a chamelium problem.

What is your rationale for this change? Skips are considered as failure
anyway from our bug tracking point of view.

Martin

> +	else
> +		igt_assert_f(!chamelium->env.fault_occurred,
> +				"Chamelium RPC call failed: %s\n",
> +				chamelium->env.fault_string);
>  
>  	return res;
>  }
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
