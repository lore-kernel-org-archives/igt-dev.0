Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA33910E7DF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 18:55:14 +0000 (UTC)
Date: Wed, 17 Jan 2024 19:54:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] gen_opencl_kernel: Fix code generation
Message-ID: <20240117185455.htwbfcrtepex37ic@kamilkon-desk.igk.intel.com>
References: <20240117084251.857237-1-zhoumin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117084251.857237-1-zhoumin@loongson.cn>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Min Zhou <zhoumin@loongson.cn>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Min,
On 2024-01-17 at 16:42:51 +0800, Min Zhou wrote:
> Since commit 1e0900fdb939 ("lib/intel_compute: Migrate xe_compute
> library to intel_compute") had changed the `struct xe_compute_kernels`
> to `struct intel_compute_kernels`, we should update it in the
> ./opencl/gen_opencl_kernel script.
> 
> Signed-off-by: Min Zhou <zhoumin@loongson.cn>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  opencl/gen_opencl_kernel | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/opencl/gen_opencl_kernel b/opencl/gen_opencl_kernel
> index e6f9601e0..15c6313d9 100755
> --- a/opencl/gen_opencl_kernel
> +++ b/opencl/gen_opencl_kernel
> @@ -84,7 +84,7 @@ INCLUDES
>  
>  cat $out_files >>$output_fname
>  
> -echo "const struct xe_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
> +echo "const struct intel_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
>  
>  for i in "${args[@]}"; do
>          out="$dest_dir/${i}_${kernel_name}.h"
> -- 
> 2.39.3
> 
