Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996A610E6CC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 08:25:23 +0000 (UTC)
Message-ID: <419417d1-f7e1-698c-360a-7153d5a0a93b@linux.intel.com>
Date: Fri, 29 Sep 2023 09:08:18 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
 <20230928174535.2074462-6-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230928174535.2074462-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 05/17] benchmarks/gem_wsim: extract
 duration parsing code to new function
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


On 28/09/2023 18:45, Marcin Bernatowicz wrote:
> Moved code from parse_workload to separate function.
> 
> v2:
> - keep "field" parameter name (instead of "_desc") (Tvrtko)
> - emit error messages from parse_duration, caller returns NULL
>    on parse_duration failure  (Tvrtko)
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 70 ++++++++++++++++++++++++-------------------
>   1 file changed, 40 insertions(+), 30 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 3c3779b72..71d1c55ae 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -860,6 +860,44 @@ static long __duration(long dur, double scale)
>   	return round(scale * dur);
>   }
>   
> +static int
> +parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, char *field)
> +{
> +	char *sep = NULL;
> +	long tmpl;
> +
> +	if (field[0] == '*') {
> +		if (intel_gen(intel_get_drm_devid(fd)) < 8) {
> +			wsim_err("Infinite batch at step %u needs Gen8+!\n", nr_steps);
> +			return -1;
> +		}
> +		dur->unbound = true;
> +	} else {
> +		tmpl = strtol(field, &sep, 10);
> +		if (tmpl <= 0 || tmpl == LONG_MIN || tmpl == LONG_MAX) {
> +			wsim_err("Invalid duration at step %u!\n", nr_steps);
> +			return -1;
> +		}
> +
> +		dur->min = __duration(tmpl, scale_dur);
> +
> +		if (sep && *sep == '-') {
> +			tmpl = strtol(sep + 1, NULL, 10);
> +			if (tmpl <= 0 || __duration(tmpl, scale_dur) <= dur->min ||
> +			    tmpl == LONG_MIN || tmpl == LONG_MAX) {
> +				wsim_err("Invalid maximum duration at step %u!\n", nr_steps);
> +				return -1;
> +			}
> +
> +			dur->max = __duration(tmpl, scale_dur);
> +		} else {
> +			dur->max = dur->min;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   #define int_field(_STEP_, _FIELD_, _COND_, _ERR_) \
>   	if ((field = strtok_r(fstart, ".", &fctx))) { \
>   		tmp = atoi(field); \
> @@ -1121,38 +1159,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   		}
>   
>   		if ((field = strtok_r(fstart, ".", &fctx))) {
> -			char *sep = NULL;
> -			long int tmpl;
> -
>   			fstart = NULL;
>   
> -			if (field[0] == '*') {
> -				check_arg(intel_gen(intel_get_drm_devid(fd)) < 8,
> -					  "Infinite batch at step %u needs Gen8+!\n",
> -					  nr_steps);
> -				step.duration.unbound = true;
> -			} else {
> -				tmpl = strtol(field, &sep, 10);
> -				check_arg(tmpl <= 0 || tmpl == LONG_MIN ||
> -					  tmpl == LONG_MAX,
> -					  "Invalid duration at step %u!\n",
> -					  nr_steps);
> -				step.duration.min = __duration(tmpl, scale_dur);
> -
> -				if (sep && *sep == '-') {
> -					tmpl = strtol(sep + 1, NULL, 10);
> -					check_arg(tmpl <= 0 ||
> -						__duration(tmpl, scale_dur) <= step.duration.min ||
> -						tmpl == LONG_MIN ||
> -						tmpl == LONG_MAX,
> -						"Invalid maximum duration at step %u!\n",
> -						nr_steps);
> -					step.duration.max = __duration(tmpl,
> -								       scale_dur);
> -				} else {
> -					step.duration.max = step.duration.min;
> -				}
> -			}
> +			if (parse_duration(nr_steps, &step.duration, scale_dur, field))
> +				return NULL;
>   
>   			valid++;
>   		}

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
