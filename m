Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D8C10E3A0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 10:51:46 +0000 (UTC)
Message-ID: <1dda1af1-e38e-3c3a-d9d1-946009e14caa@linux.intel.com>
Date: Tue, 26 Sep 2023 11:51:41 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-7-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230926084451.1732748-7-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 06/14] benchmarks/gem_wsim: fix
 conflicting SSEU #define and enum
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 26/09/2023 09:44, Marcin Bernatowicz wrote:
> One SSEU is in enum w_step and then as #define SSEU (1 << 3).
> Fix this.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index aeb959364..3b01340bf 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -238,7 +238,7 @@ static struct drm_i915_gem_context_param_sseu device_sseu = {
>   
>   #define SYNCEDCLIENTS	(1<<1)
>   #define DEPSYNC		(1<<2)
> -#define SSEU		(1<<3)
> +#define FLAG_SSEU	(1<<3)

Right, it worked with no side effects because enum SSEU is above the 
highest flag bit.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Prefix all flags with FLAG_ while at it?

Regards,

Tvrtko

>   
>   static const char *ring_str_map[NUM_ENGINES] = {
>   	[DEFAULT] = "DEFAULT",
> @@ -2597,7 +2597,7 @@ int main(int argc, char **argv)
>   			/* Fall through */
>   		case 'w':
>   			w_args = add_workload_arg(w_args, ++nr_w_args, optarg,
> -						  prio, flags & SSEU);
> +						  prio, flags & FLAG_SSEU);
>   			break;
>   		case 'p':
>   			prio = atoi(optarg);
> @@ -2626,7 +2626,7 @@ int main(int argc, char **argv)
>   			flags |= SYNCEDCLIENTS;
>   			break;
>   		case 's':
> -			flags ^= SSEU;
> +			flags ^= FLAG_SSEU;
>   			break;
>   		case 'd':
>   			flags |= DEPSYNC;
