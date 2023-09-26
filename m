Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.198.163.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AB610E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 10:56:02 +0000 (UTC)
Message-ID: <56fdd2a4-a7f9-a8b6-5332-bb7b2471a61c@linux.intel.com>
Date: Tue, 26 Sep 2023 11:48:52 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-6-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230926084451.1732748-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 05/14] benchmarks/gem_wsim: extract
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


On 26/09/2023 09:44, Marcin Bernatowicz wrote:
> Moved code from parse_workload to separate function.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 67 ++++++++++++++++++++++++-------------------
>   1 file changed, 37 insertions(+), 30 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 4f0deb095..aeb959364 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -860,6 +860,40 @@ static long __duration(long dur, double scale)
>   	return round(scale * dur);
>   }
>   
> +static int
> +parse_duration(unsigned int nr_steps, struct duration *dur, double scale_dur, char *_desc)

Nitpick - underscore _desc reads a bit odd when there is no aliasing or 
anything like that? If you even kept the name 'field' code movement 
would be more preserved. FWIW.

> +{
> +	char *sep = NULL;
> +	long tmpl;
> +
> +	if (_desc[0] == '*') {
> +		if (intel_gen(intel_get_drm_devid(fd)) < 8) {
> +			wsim_err("Infinite batch at step %u needs Gen8+!\n", nr_steps);
> +			return -1;
> +		}
> +		dur->unbound_duration = true;
> +	} else {
> +		tmpl = strtol(_desc, &sep, 10);
> +		if (tmpl <= 0 || tmpl == LONG_MIN || tmpl == LONG_MAX)
> +			return -1;

Hm I see now that the suggestion to improve the error message from the 
previous patch would be lost here.

Would it work to emit wsim_err directly from here and below? Then make 
the caller omit the check_arg and just return NULL.

Regards,

Tvrtko

> +
> +		dur->min = __duration(tmpl, scale_dur);
> +
> +		if (sep && *sep == '-') {
> +			tmpl = strtol(sep + 1, NULL, 10);
> +			if (tmpl <= 0 || __duration(tmpl, scale_dur) <= dur->min ||
> +			    tmpl == LONG_MIN || tmpl == LONG_MAX)
> +				return -1;
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
> @@ -1127,38 +1161,11 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
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
> -				step.duration.unbound_duration = true;
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
> -						"Invalid duration range at step %u!\n",
> -						nr_steps);
> -					step.duration.max = __duration(tmpl,
> -								       scale_dur);
> -				} else {
> -					step.duration.max = step.duration.min;
> -				}
> -			}
> +			tmp = parse_duration(nr_steps, &step.duration, scale_dur, field);
> +			check_arg(tmp < 0,
> +				  "Invalid duration at step %u!\n", nr_steps);
>   
>   			valid++;
>   		}
