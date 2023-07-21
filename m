Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4706210E61D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 05:17:30 +0000 (UTC)
Date: Fri, 21 Jul 2023 07:17:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <20230721051726.kqimho4luacq25b5@zkempczy-mobl2>
References: <20230720231756.3464641-1-ashutosh.dixit@intel.com>
 <20230720231756.3464641-19-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720231756.3464641-19-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 18/20] tests/i915/perf: Fix buf_map for
 xe
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

On Thu, Jul 20, 2023 at 04:17:54PM -0700, Ashutosh Dixit wrote:
> buf_map for xe should use xe_bo_map. Also change gen12_test_mi_rpc to use
> buf_map instead of intel_buf_cpu_map.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/perf.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 27408e7909f5..cd1087b2e954 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -901,15 +901,19 @@ oar_unit_default_format(void)
>   * Temporary wrapper to distinguish mappings on !llc platforms,
>   * where it seems cache over GEM_MMAP_OFFSET is not flushed before execution.
>   */
> -static void *buf_map(int i915, struct intel_buf *buf, bool write)
> +static void *buf_map(int fd, struct intel_buf *buf, bool write)
>  {
>  	void *p;
>  
> -	if (gem_has_llc(i915))
> -		p = intel_buf_cpu_map(buf, write);
> -	else
> -		p = intel_buf_device_map(buf, write);
> -

Please extend those two functions to xe. I think it is more clear
way instead of changing mapping in the tests. Notice bops->driver
field - you don't need to call is_xe_device() then.

--
Zbigniew

> +	if (is_xe_device(fd)) {
> +		buf->ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
> +		p = buf->ptr;
> +	} else {
> +		if (gem_has_llc(fd))
> +			p = intel_buf_cpu_map(buf, write);
> +		else
> +			p = intel_buf_device_map(buf, write);
> +	}
>  	return p;
>  }
>  
> @@ -3620,7 +3624,7 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
>  	intel_bb_flush_render(ibb);
>  	intel_bb_sync(ibb);
>  
> -	intel_buf_cpu_map(buf, false);
> +	buf_map(drm_fd, buf, false);
>  	report32 = buf->ptr;
>  	format_size_32 = format.size >> 2;
>  	dump_report(report32, format_size_32, "mi-rpc");
> -- 
> 2.41.0
> 
