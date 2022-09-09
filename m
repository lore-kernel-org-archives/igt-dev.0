Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD3710EC22
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 08:48:07 +0000 (UTC)
Date: Fri, 9 Sep 2022 11:47:02 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <Yxr9hjWf4LVsO034@platvala-desk.ger.corp.intel.com>
References: <20220909074254.2032191-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909074254.2032191-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_chamelium: Fix common
 suspend/hibernate
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

On Fri, Sep 09, 2022 at 01:12:54PM +0530, Kunal Joshi wrote:
> Currently test executes and fails even if no ports are connected to
> chamelium, Added a igt_fixture to prevent that from happening.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/chamelium/kms_chamelium.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> index d97b439a..bd1fa4ad 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -577,19 +577,19 @@ test_suspend_resume_hpd_common(data_t *data, enum igt_suspend_state state,
>  	for (p = 0; p < data->port_count; p++) {
>  		port = data->ports[p];
>  		igt_debug("Testing port %s\n", chamelium_port_get_name(port));
> -	}
>  
> -	igt_modeset_disable_all_outputs(&data->display);
> -	chamelium_reset_state(&data->display, data->chamelium, NULL,
> -			      data->ports, data->port_count);
> +		igt_modeset_disable_all_outputs(&data->display);
> +		chamelium_reset_state(&data->display, data->chamelium, NULL,
> +				      data->ports, data->port_count);
>  
> -	/* Make sure we notice new connectors after resuming */
> -	try_suspend_resume_hpd(data, NULL, state, test, mon, false);
> +		/* Make sure we notice new connectors after resuming */
> +		try_suspend_resume_hpd(data, NULL, state, test, mon, false);
>  
> -	/* Now make sure we notice disconnected connectors after resuming */
> -	try_suspend_resume_hpd(data, NULL, state, test, mon, true);
> +		/* Now make sure we notice disconnected connectors after resuming */
> +		try_suspend_resume_hpd(data, NULL, state, test, mon, true);
>  
> -	igt_cleanup_uevents(mon);
> +		igt_cleanup_uevents(mon);
> +	}


What are these changes here? Did you (accidentally?) make the
suspend-resumes repeated for every port?


-- 
Petri Latvala
