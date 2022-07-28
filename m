Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5F7112C85
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 15:34:27 +0000 (UTC)
Date: Thu, 28 Jul 2022 17:34:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YuKsf8GySkOZ0xwN@kamilkon-desk1>
References: <cover.1659014747.git.karolina.drobnik@intel.com>
 <83b08fadb586f78b59d3402a63a169206fcf8395.1659014747.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83b08fadb586f78b59d3402a63a169206fcf8395.1659014747.git.karolina.drobnik@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/i915_pm_rps: Write values in
 pm_rps_exit_handler only for min-max configs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-07-28 at 17:06:58 +0200, Karolina Drobnik wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> pm_rps_exit_handler writes min and max frequencies to the corresponding
> sysfs files. In a situation where each test initializes only specific
> handlers, it's possible that the exit handler will dereference a NULL
> value in MIN and MAX file handlers.
> 
> To prevent this, check if the exit handler is called by a subtest
> that initialized handlers to files describing frequency constraints.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_pm_rps.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index 0af46038..a45a6905 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -859,12 +859,14 @@ static void engine_order(int i915)
> 
>  static void pm_rps_exit_handler(int sig)
>  {
> -	if (origfreqs[MIN] > readval(sysfs_files[MAX].filp)) {
> -		writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> -		writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> -	} else {
> -		writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> -		writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> +	if (sysfs_files[MAX].filp) {
> +		if (origfreqs[MIN] > readval(sysfs_files[MAX].filp)) {
> +			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> +			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> +		} else {
> +			writeval(sysfs_files[MIN].filp, origfreqs[MIN]);
> +			writeval(sysfs_files[MAX].filp, origfreqs[MAX]);
> +		}
>  	}
> 
>  	if (lh.igt_proc.running)
> --
> 2.25.1
