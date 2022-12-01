Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51CC10E05A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 14:38:35 +0000 (UTC)
Date: Thu, 1 Dec 2022 16:38:57 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <Y4i8YB2kx6wKjqpn@platvala-desk.ger.corp.intel.com>
References: <20221130174217.2261845-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130174217.2261845-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] igt_chameleon: Assert if there are no
 connected ports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, amstan@chromium.org,
 ihf@google.com, igt-dev@lists.freedesktop.org, kalin@google.com,
 seanpaul@chromium.org, matthewtlam@google.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 12:42:17PM -0500, Mark Yacoub wrote:
> [Why]
> The tests are meant to run on devices that have a chameleon connected.
> If autodiscovery finds no port, it means something is off and the DUT is
> not behaving well.
> 
> [How]
> Add an assert if no port is mapped.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 79920de1..4e7a7a8f 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2749,6 +2749,10 @@ unplug_port:
>  	igt_debug("Auto-discovery took %fms and found %i connector(s)\n",
>  		  (float)elapsed_ns / (1000 * 1000), chamelium->port_count);
>  
> +	igt_assert_f(
> +		is_any_port_mapped,
> +		"No port is mapped. We don't expect to have no connected connectors.\n");
> +

If this situation (chamelium is configured but is not suitable for
testing) ever happens, in my opinion an igt_abort would be more
appropriate. Similar to the case where chamelium is configured but
cannot be reached. What do you think?


-- 
Petri Latvala
