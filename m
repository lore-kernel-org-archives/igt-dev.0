Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2D610E1DA
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 08:55:46 +0000 (UTC)
Date: Tue, 14 Nov 2023 09:55:36 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZVM2CL5coi4BKNlS@fdugast-desk.home>
References: <20231107144803.165466-1-zbigniew.kempczynski@intel.com>
 <20231107144803.165466-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231107144803.165466-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_compute: Prepare tgllp
 compute functions to be dg1 ready
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

Hi,

On Tue, Nov 07, 2023 at 03:48:02PM +0100, Zbigniew Kempczyński wrote:
> Preparing dynamic, surface and indirect data states is similar between
> platforms so let's rename it to "xe" prefix. It might be confusing
> at first glance do to "xe" prefix clash between platform and new
> driver but it is closed (static) in this compilation unit.
> Preparing indirect data was rewritten to generate input for kernels.

I see the point but still I believe using "xe" as prefix here is very
confusing as it is used in other IGT files to prefix functions which
are specific to the Xe KMD.

As those functions are static, is a prefix needed at all? How about
going with simply "create_indirect_data" and so on?

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 110 ++++++++++++--------------------------------
>  1 file changed, 30 insertions(+), 80 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 7f1ea90e72..0c7a87dab3 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -203,120 +203,70 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
>   */
>  
>  /**
> - * tgllp_create_indirect_data:
> + * xe_create_indirect_data:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @addr_input: input buffer gpu offset
>   * @addr_output: output buffer gpu offset
>   *
>   * Prepares indirect data for compute pipeline.
>   */
> -static void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> -				       uint64_t addr_input,
> -				       uint64_t addr_output)
> +static void xe_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				     uint64_t addr_input,
> +				     uint64_t addr_output,
> +				     uint32_t end_value)
>  {
> -	int b = 0;
> +	uint32_t val = 0;
> +	int b = 0, curr = 0;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000200;
> +
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_input >> 32;
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +
>  	addr_bo_buffer_batch[b++] = 0x00000400;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x00000200;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00010000;
> -	addr_bo_buffer_batch[b++] = 0x00030002;
> -	addr_bo_buffer_batch[b++] = 0x00050004;
> -	addr_bo_buffer_batch[b++] = 0x00070006;
> -	addr_bo_buffer_batch[b++] = 0x00090008;
> -	addr_bo_buffer_batch[b++] = 0x000B000A;
> -	addr_bo_buffer_batch[b++] = 0x000D000C;
> -	addr_bo_buffer_batch[b++] = 0x000F000E;
> -	addr_bo_buffer_batch[b++] = 0x00110010;
> -	addr_bo_buffer_batch[b++] = 0x00130012;
> -	addr_bo_buffer_batch[b++] = 0x00150014;
> -	addr_bo_buffer_batch[b++] = 0x00170016;
> -	addr_bo_buffer_batch[b++] = 0x00190018;
> -	addr_bo_buffer_batch[b++] = 0x001B001A;
> -	addr_bo_buffer_batch[b++] = 0x001D001C;
> -	addr_bo_buffer_batch[b++] = 0x001F001E;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00210020;
> -	addr_bo_buffer_batch[b++] = 0x00230022;
> -	addr_bo_buffer_batch[b++] = 0x00250024;
> -	addr_bo_buffer_batch[b++] = 0x00270026;
> -	addr_bo_buffer_batch[b++] = 0x00290028;
> -	addr_bo_buffer_batch[b++] = 0x002B002A;
> -	addr_bo_buffer_batch[b++] = 0x002D002C;
> -	addr_bo_buffer_batch[b++] = 0x002F002E;
> -	addr_bo_buffer_batch[b++] = 0x00310030;
> -	addr_bo_buffer_batch[b++] = 0x00330032;
> -	addr_bo_buffer_batch[b++] = 0x00350034;
> -	addr_bo_buffer_batch[b++] = 0x00370036;
> -	addr_bo_buffer_batch[b++] = 0x00390038;
> -	addr_bo_buffer_batch[b++] = 0x003B003A;
> -	addr_bo_buffer_batch[b++] = 0x003D003C;
> -	addr_bo_buffer_batch[b++] = 0x003F003E;
> +
> +	while (val < end_value) {
> +		addr_bo_buffer_batch[b++] = val | ((val + 1) << 16);
> +		val += 2;
> +		if (++curr % 16 == 0)
> +			b += 32;
> +	}

Please add a comment to explain what is happening here.

Francois

>  }
>  
>  /**
> - * tgllp_create_surface_state:
> + * xe_create_surface_state:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @addr_input: input buffer gpu offset
>   * @addr_output: output buffer gpu offset
>   *
>   * Prepares surface state for compute pipeline.
>   */
> -static void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> -				       uint64_t addr_input,
> -				       uint64_t addr_output)
> +static void xe_create_surface_state(uint32_t *addr_bo_buffer_batch,
> +				    uint64_t addr_input,
> +				    uint64_t addr_output)
>  {
>  	int b = 0;
>  
> @@ -387,14 +337,14 @@ static void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
>  }
>  
>  /**
> - * tgllp_create_dynamic_state:
> + * xe_create_dynamic_state:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @offset_kernel: gpu offset of the shader
>   *
>   * Prepares dynamic state for compute pipeline.
>   */
> -static void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> -				       uint64_t offset_kernel)
> +static void xe_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> +				    uint64_t offset_kernel)
>  {
>  	int b = 0;
>  
> @@ -582,9 +532,9 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, TGL_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	tgllp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	tgllp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xe_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> +	xe_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> +	xe_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, 0x40);
>  
>  	dinput = (float *)bo_dict[4].data;
>  	srand(time(NULL));
> @@ -852,7 +802,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> +	xe_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
>  	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
> -- 
> 2.34.1
> 
