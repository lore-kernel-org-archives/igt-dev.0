Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A07210E082
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 11:12:22 +0000 (UTC)
Date: Tue, 14 Nov 2023 12:12:09 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <ZVNWCdKQqaI3k2Ln@fdugast-desk.home>
References: <20231114104151.67085-1-zbigniew.kempczynski@intel.com>
 <20231114104151.67085-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114104151.67085-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] lib/intel_compute: Prepare tgllp
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

On Tue, Nov 14, 2023 at 11:41:50AM +0100, Zbigniew Kempczyński wrote:
> Preparing dynamic, surface and indirect data states is similar between
> platforms so let's rename it to "xe" prefix. It might be confusing
> at first glance do to "xe" prefix clash between platform and new
> driver but it is closed (static) in this compilation unit.
> Preparing indirect data was rewritten to generate input for kernels.
> 
> v2: avoid name confusion with "xe_" prefix (Francois)

The commit message is no longer valid. Please update it to reflect v2
and with that:

	Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/intel_compute.c | 115 ++++++++++++++------------------------------
>  1 file changed, 35 insertions(+), 80 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 7f1ea90e72..772c22fa37 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -203,120 +203,75 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
>   */
>  
>  /**
> - * tgllp_create_indirect_data:
> + * create_indirect_data:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @addr_input: input buffer gpu offset
>   * @addr_output: output buffer gpu offset
>   *
>   * Prepares indirect data for compute pipeline.
>   */
> -static void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> -				       uint64_t addr_input,
> -				       uint64_t addr_output)
> +static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				 uint64_t addr_input,
> +				 uint64_t addr_output,
> +				 uint32_t end_value)
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
> +	/*
> +	 * Runtime prepares 32 16-bit incremented values packed to single dword.
> +	 * Then it lefts 32 dword gap filled with zeroes. Pattern looks the
> +	 * same for tgl and dg1 (apart of number of values).
> +	 */
> +	while (val < end_value) {
> +		addr_bo_buffer_batch[b++] = val | ((val + 1) << 16);
> +		val += 2;
> +		if (++curr % 16 == 0)
> +			b += 32;
> +	}
>  }
>  
>  /**
> - * tgllp_create_surface_state:
> + * create_surface_state:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @addr_input: input buffer gpu offset
>   * @addr_output: output buffer gpu offset
>   *
>   * Prepares surface state for compute pipeline.
>   */
> -static void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> -				       uint64_t addr_input,
> -				       uint64_t addr_output)
> +static void create_surface_state(uint32_t *addr_bo_buffer_batch,
> +				 uint64_t addr_input,
> +				 uint64_t addr_output)
>  {
>  	int b = 0;
>  
> @@ -387,14 +342,14 @@ static void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
>  }
>  
>  /**
> - * tgllp_create_dynamic_state:
> + * create_dynamic_state:
>   * @addr_bo_buffer_batch: pointer to batch buffer
>   * @offset_kernel: gpu offset of the shader
>   *
>   * Prepares dynamic state for compute pipeline.
>   */
> -static void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> -				       uint64_t offset_kernel)
> +static void create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> +				 uint64_t offset_kernel)
>  {
>  	int b = 0;
>  
> @@ -582,9 +537,9 @@ static void tgl_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, TGL_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	tgllp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> -	tgllp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
> +	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> +	create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
> +	create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT, 0x40);
>  
>  	dinput = (float *)bo_dict[4].data;
>  	srand(time(NULL));
> @@ -852,7 +807,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_bind(&execenv, bo_dict, XEHP_BO_DICT_ENTRIES);
>  
>  	memcpy(bo_dict[0].data, kernel, size);
> -	tgllp_create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> +	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
>  	xehp_create_surface_state(bo_dict[2].data, ADDR_INPUT, ADDR_OUTPUT);
>  	xehp_create_indirect_data(bo_dict[3].data, ADDR_INPUT, ADDR_OUTPUT);
>  	xehp_create_surface_state(bo_dict[7].data, ADDR_INPUT, ADDR_OUTPUT);
> -- 
> 2.34.1
> 
