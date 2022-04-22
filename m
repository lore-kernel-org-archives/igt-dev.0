Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B9810EB12
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 10:49:49 +0000 (UTC)
Date: Fri, 22 Apr 2022 12:49:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmKISFLNrv9kI9pb@kamilkon-DESK1>
References: <20220422072825.11563-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422072825.11563-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_isolation.c - fix to
 poison CACHE_MODE_0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: CQ Tang <cq.tang@intel.com>, Chris P Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-04-22 at 09:28:25 +0200, Zbigniew Kempczyński wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> On DG2, if we poison bit8 of this register 0x7000, it causes the test
> to catch "GPU hung". bit8 is "Depth Related Cache Pipelined Flush
> Disable", set this to enable slow mode.
> This change is to mask off to set bit8 of this register.
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Chris P Wilson <chris.p.wilson@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_ctx_isolation.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index bcb9b73410..95d13969fa 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -116,7 +116,13 @@ static const struct named_register {
>  	{ "OACTXID", GEN8, RCS0, 0x2364 },
>  	{ "PS_INVOCATION_COUNT_2", GEN8, RCS0, 0x2448, 2, .write_mask = ~0x3 },
>  	{ "PS_DEPTH_COUNT_2", GEN8, RCS0, 0x2450, 2 },
> -	{ "Cache_Mode_0", GEN7, RCS0, 0x7000, .masked = true },
> +	{ "Cache_Mode_0", GEN7, RCS0, 0x7000, .masked = true,
> +	  /*
> +	   * bit8 is "Depth Relate Cache Pipelined Flush Disable",
> +	   * set this to enable slow mode, and the test catches
> +	   * "GPU hung" on DG2, so mask off to poison this bit.
> +	   */
> +	  .write_mask = ~0x100 },
>  	{ "Cache_Mode_1", GEN7, RCS0, 0x7004, .masked = true },
>  	{ "GT_MODE", GEN8, RCS0, 0x7008, .masked = true },
>  	{ "L3_Config", GEN_RANGE(8, 11), RCS0, 0x7034 },
> -- 
> 2.32.0

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
