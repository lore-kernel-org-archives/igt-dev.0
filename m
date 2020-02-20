Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8760C8862C
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 12:58:42 +0000 (UTC)
Date: Thu, 20 Feb 2020 14:58:39 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200220125839.GY25209@platvala-desk.ger.corp.intel.com>
References: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools/i915-perf: workaround overzelous
 compiler warnings
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 02:51:52PM +0200, Lionel Landwerlin wrote:
> Give me a break :)
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  tools/i915-perf/i915_perf_control.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
> index a8d0d30f..dcbc2f59 100644
> --- a/tools/i915-perf/i915_perf_control.c
> +++ b/tools/i915-perf/i915_perf_control.c
> @@ -95,10 +95,12 @@ main(int argc, char *argv[])
>  				struct recorder_command_base base;
>  				struct recorder_command_dump dump;
>  			} *data = malloc(total_len);
> +			char *path = (char *) data->dump.path;
>  
>  			data->base.command = RECORDER_COMMAND_DUMP;
>  			data->base.size = total_len;
> -			snprintf((char *) data->dump.path, strlen(dump_file) + 1, "%s", dump_file);
> +			snprintf(path, strlen(dump_file) + 1, "%s", dump_file);
> +

Same warning still. My compiler is clever enough to see that even with
another pointer indirection, the area pointed at is an array of 0
elements.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
