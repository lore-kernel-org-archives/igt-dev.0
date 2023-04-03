Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F4210E3F0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:45:29 +0000 (UTC)
Date: Mon, 3 Apr 2023 12:45:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230403104524.x7ssrgycwagrw675@zkempczy-mobl2>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
 <20230327134119.2429388-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327134119.2429388-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] compute_square_kernel.cl: add CL
 file used at xe_compute.c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 03:41:15PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Provide the cl file that it was used to produce the OpenCL
> Kernel used by xe_compute, and document how the binary at
> xe_compute.h was produced.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  lib/xe/xe_compute.c             | 3 ++-
>  opencl/compute_square_kernel.cl | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>  create mode 100644 opencl/compute_square_kernel.cl
> 
> diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
> index 8c0f8c87d50f..2165eada8931 100644
> --- a/lib/xe/xe_compute.c
> +++ b/lib/xe/xe_compute.c
> @@ -18,7 +18,8 @@
>  #define GPGPU_WALKER			0x7105000d
>  #define MI_BATCH_BUFFER_END		(0xA << 23)
>  
> -// generated with: ocloc -file kernel.cl -device tgllp && xxd -i kernel_Gen12LPlp.gen
> +// generated with:
> +// ocloc -file opencl/compute_square_kernel.cl -device tgllp && xxd -i compute_square_kernel_Gen12LPlp.bin
>  unsigned char tgllp_kernel_square_bin[] = {
>  	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
>  	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> diff --git a/opencl/compute_square_kernel.cl b/opencl/compute_square_kernel.cl
> new file mode 100644
> index 000000000000..f6260fb934dc
> --- /dev/null
> +++ b/opencl/compute_square_kernel.cl
> @@ -0,0 +1,5 @@
> +__kernel void square(__global float* input, __global float* output, const unsigned int count) {
> +  int i = get_global_id(0);
> +  if(i < count)
> +    output[i] = input[i] * input[i];
> +}
> -- 
> 2.39.2
>

Looks good:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

