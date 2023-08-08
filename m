Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE7810E094
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 06:35:12 +0000 (UTC)
Date: Tue, 8 Aug 2023 08:35:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <20230808063508.okuv67u32eegvf5c@zkempczy-mobl2>
References: <20230808010017.37819-1-ashutosh.dixit@intel.com>
 <20230808010017.37819-15-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808010017.37819-15-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 14/20] tests/i915/perf: Fix
 has_class_instance for xe
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

On Mon, Aug 07, 2023 at 06:00:11PM -0700, Ashutosh Dixit wrote:
> PMU is not available for xe so implement has_class_instance for xe without
> PMU.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/perf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

I reviewed this likely in reversed order - I mean "Temporarily skip
render_copy for xe" before this so if PMU is currently not available
for xe it makes sense to disable it temporarily. Anyway some comment
would be highly welcome before the condition.

--
Zbigniew

> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 78e68462ad06..df6cb7edd017 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -5816,6 +5816,12 @@ static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
>  {
>  	int fd;
>  
> +	if (is_xe_device(drm_fd)) {
> +		if (class == I915_ENGINE_CLASS_RENDER && !IS_PONTEVECCHIO(devid))
> +			return true;
> +		return false;
> +	}
> +
>  	fd = perf_i915_open(i915, I915_PMU_ENGINE_BUSY(class, instance));
>  	if (fd >= 0) {
>  		close(fd);
> -- 
> 2.41.0
> 
