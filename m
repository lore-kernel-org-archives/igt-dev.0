Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAA610F0FA
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 10:08:38 +0000 (UTC)
Date: Mon, 1 Aug 2022 13:07:17 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <Yuel1WvKY4mtDjhc@platvala-desk.ger.corp.intel.com>
References: <20220715192200.1782193-1-markyacoub@chromium.org>
 <20220729145154.1101502-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729145154.1101502-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH v2] lib/igt_chamelium: Check for error instead
 of port id for invalid
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

On Fri, Jul 29, 2022 at 10:51:54AM -0400, Mark Yacoub wrote:
> [Why]
> Chamelium V3 has a valid port 0 so 0 should not be rejected.
> 
> [How]
> Check if there is an error set from g_key_file_get_integer instead of
> depending on port id.
> 
> v1:
> Use GError instead of check for port ID range.
> 
> Test: ./kms_chamelium --run-subtest dp-hp
> Tested on: Volteer & cv3
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_chamelium.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index c7b99ebc..fbdb87ac 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2311,7 +2311,7 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
>  		port->id = g_key_file_get_integer(igt_key_file, group,
>  						  "ChameliumPortID",
>  						  &error);
> -		if (!port->id) {
> +		if (error) {
>  			igt_warn("Failed to read chamelium port ID for %s: %s\n",
>  				 map_name, error->message);
>  			ret = false;
> -- 
> 2.37.1.455.g008518b4e5-goog
> 
