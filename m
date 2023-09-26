Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0910E39E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 10:28:34 +0000 (UTC)
Message-ID: <71490d86-049a-9426-1b81-e71f00729a7f@linux.intel.com>
Date: Tue, 26 Sep 2023 11:28:30 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-4-marcin.bernatowicz@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230926084451.1732748-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 03/14] benchmarks/gem_wsim: fix scaling
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


On 26/09/2023 09:44, Marcin Bernatowicz wrote:
> Period steps take scale time (-F) command line option into account.
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
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   benchmarks/gem_wsim.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 90a36f7de..65061461d 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -899,8 +899,14 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>   				int_field(DELAY, delay, tmp <= 0,
>   					  "Invalid delay at step %u!\n");
>   			} else if (!strcmp(field, "p")) {
> -				int_field(PERIOD, period, tmp <= 0,
> -					  "Invalid period at step %u!\n");
> +				field = strtok_r(fstart, ".", &fctx);
> +				if (field) {
> +					tmp = atoi(field);
> +					check_arg(tmp <= 0, "Invalid period at step %u!\n", nr_steps);
> +					step.type = PERIOD;
> +					step.period = __duration(tmp, scale_time);
> +					goto add_step;
> +				}

Why not do it with fewer added lines of code where the delay steps are currently scaled?

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 7b5e62a3be53..486ab0124063 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1186,6 +1186,8 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
  add_step:
                 if (step.type == DELAY)
                         step.delay = __duration(step.delay, scale_time);
+               else if (step.type == PERIOD)
+                       step.period = __duration(step.period, scale_time);
  
                 step.idx = nr_steps++;
                 step.request = -1;

Regards,

Tvrtko

>   			} else if (!strcmp(field, "P")) {
>   				unsigned int nr = 0;
>   				while ((field = strtok_r(fstart, ".", &fctx))) {
