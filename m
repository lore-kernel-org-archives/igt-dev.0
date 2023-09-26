Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A5D10E0C8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 10:40:40 +0000 (UTC)
Message-ID: <ef59ed08-799c-5ab2-a02c-a5754326eceb@linux.intel.com>
Date: Tue, 26 Sep 2023 11:40:36 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-5-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230926084451.1732748-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 04/14] benchmarks/gem_wsim: fix duration
 range check
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
> When scale duration (-f) command line option is provided,
> the max duration check does not take it into account, fix it.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 65061461d..4f0deb095 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1148,7 +1148,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   				if (sep && *sep == '-') {
>   					tmpl = strtol(sep + 1, NULL, 10);
>   					check_arg(tmpl <= 0 ||
> -						tmpl <= step.duration.min ||
> +						__duration(tmpl, scale_dur) <= step.duration.min ||

Right!

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

>   						tmpl == LONG_MIN ||
>   						tmpl == LONG_MAX,
>   						"Invalid duration range at step %u!\n",

Could improve the error message with 's/duration range/maximum 
duration/' while at it if you want.

Regards,

Tvrtko
