Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F0C10E12A
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 13:14:27 +0000 (UTC)
Date: Fri, 29 Jul 2022 16:12:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <YuPczW1iwuH0oJnq@platvala-desk.ger.corp.intel.com>
References: <20220715192200.1782193-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715192200.1782193-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] lib/igt_chamelium: Extend check of valid
 ports to port=0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, amstan@google.com, ihf@google.com,
 igt-dev@lists.freedesktop.org, seanpaul@chromium.org, markyacoub@google.com,
 khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 03:22:00PM -0400, Mark Yacoub wrote:
> [Why]
> Chamelium V3 has a valid port at 0 so 0 should not be rejected.
> 
> [How]
> Check for port values between 0 and CHAMELIUM_MAX_PORTS which should
> also include the V2 ports range.
> 
> Test: ./kms_chamelium --run-subtest dp-hp
> Tested on: Volteer & cv3
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 55cbfa12..5d68372b 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2311,7 +2311,7 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
>  		port->id = g_key_file_get_integer(igt_key_file, group,
>  						  "ChameliumPortID",
>  						  &error);
> -		if (!port->id) {
> +		if (port->id < 0 || port->id > CHAMELIUM_MAX_PORTS) {

You rather need to check whether 'error' is set to something. 0 might
be a valid port id in v3 but it's also what g_key_file_get_integer
returns on error.


-- 
Petri Latvala


>  			igt_warn("Failed to read chamelium port ID for %s: %s\n",
>  				 map_name, error->message);
>  			ret = false;
> -- 
> 2.37.0.170.g444d1eabd0-goog
> 
