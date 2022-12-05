Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6BB10E256
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 16:48:44 +0000 (UTC)
Date: Mon, 5 Dec 2022 17:48:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y44g51swIr08UCxj@kamilkon-desk1>
References: <20221129151220.131979-1-zbigniew.kempczynski@intel.com>
 <20221129151220.131979-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221129151220.131979-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 01/11] tests/i915_pipe_stress: Remove
 unused bufmgr field
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-29 at 16:12:10 +0100, Zbigniew Kempczyński wrote:
> During rewriting this likely left incidentally even if it is not used.
> Lets get rid of it.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/i915_pipe_stress.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/i915/i915_pipe_stress.c b/tests/i915/i915_pipe_stress.c
> index 6ce2ce1de2..c06bc65d2c 100644
> --- a/tests/i915/i915_pipe_stress.c
> +++ b/tests/i915/i915_pipe_stress.c
> @@ -119,7 +119,6 @@ struct data {
>  	uint64_t modifier;
>  	uint32_t devid;
>  	struct buf_ops *bops;
> -	drm_intel_bufmgr *bufmgr;
>  	drmModeModeInfo *last_mode[IGT_MAX_PIPES];
>  	struct igt_fb fb[IGT_MAX_PIPES * MAX_PLANES];
>  	struct igt_fb cursor_fb[IGT_MAX_PIPES];
> -- 
> 2.34.1
> 
