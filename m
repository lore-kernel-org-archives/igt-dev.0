Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF4A10E6CC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 08:29:23 +0000 (UTC)
Message-ID: <856aad30-db03-4fe7-e70b-8b7926ebb7c7@linux.intel.com>
Date: Fri, 29 Sep 2023 09:01:00 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
 <20230928174535.2074462-4-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230928174535.2074462-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 03/17] benchmarks/gem_wsim: fix scaling
 of period steps
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
> Period steps take scale time (-F) command line option into account.

"Make period steps.."?

"Periods steps should take.."?

> This allows to scale workload without need to modify .wsim file
> 
> ex. having following example.wsim
> 
> 1.VCS1.3000.0.1
> 1.RCS.500-1000.-1.0
> 1.RCS.3700.0.0
> 1.RCS.1000.-2.0
> 1.VCS2.2300.-2.0
> 1.RCS.4700.-1.0
> 1.VCS2.600.-1.1
> p.16000
> 
> we can scale the whole workload x10 with:
> 
> gem_wsim -w example.wsim -f 10 -F 10
> 
> -f is for batch duration steps, -F for period and delay steps

Actually I am having a little bit of a second thought here. Thinking 
that perhaps it was deliberate to not scale periods.

Think of it like this. -f 0.5 simulates a twice as fast GPU. -F 2 
simulates a twice as slow CPU.

In both cases if something wants to hit 60 fps, it still wants to hit 60 
fps. What use case for scaling the period do you have in mind?

Regards,

Tvrtko

> v2:
> - apply same approach as with DELAY step (Tvrtko)
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 42690d3d0..41557517c 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1186,6 +1186,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   add_step:
>   		if (step.type == DELAY)
>   			step.delay = __duration(step.delay, scale_time);
> +		else if (step.type == PERIOD)
> +			step.period = __duration(step.period, scale_time);
>   
>   		step.idx = nr_steps++;
>   		step.request = -1;
