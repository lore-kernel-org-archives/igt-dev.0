Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA5910E08D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 08:00:10 +0000 (UTC)
Date: Fri, 28 Apr 2023 09:59:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230428075945.htkhprsz5cf2o7hq@kamilkon-desk1>
References: <20230428062224.21322-1-zbigniew.kempczynski@intel.com>
 <20230428062224.21322-13-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428062224.21322-13-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v8 12/17] tests/xe-fast-feedback: Add
 xe_intel_bb test to BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-04-28 at 08:22:19 +0200, Zbigniew Kempczyński wrote:
> Verifies intel-bb integration with xe.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 987e72ef4b..3d0603fd94 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -106,6 +106,24 @@ igt@xe_guc_pc@freq_range_idle
>  igt@xe_guc_pc@rc6_on_idle
>  igt@xe_guc_pc@rc0_on_exec
>  igt@xe_huc_copy@huc_copy
> +igt@xe_intel_bb@add-remove-objects
> +igt@xe_intel_bb@bb-with-allocator
> +igt@xe_intel_bb@blit-reloc
> +igt@xe_intel_bb@blit-simple
> +igt@xe_intel_bb@create-in-region
> +igt@xe_intel_bb@delta-check
> +igt@xe_intel_bb@destroy-bb
> +igt@xe_intel_bb@full-batch
> +igt@xe_intel_bb@intel-bb-blit-none
> +igt@xe_intel_bb@intel-bb-blit-x
> +igt@xe_intel_bb@intel-bb-blit-y
> +igt@xe_intel_bb@lot-of-buffers
> +igt@xe_intel_bb@offset-control
> +igt@xe_intel_bb@purge-bb
> +igt@xe_intel_bb@render
> +igt@xe_intel_bb@reset-bb
> +igt@xe_intel_bb@simple-bb
> +igt@xe_intel_bb@simple-bb-ctx
>  igt@xe_mmap@system
>  igt@xe_mmap@vram
>  igt@xe_mmap@vram-system
> -- 
> 2.34.1
> 
