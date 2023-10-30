Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2D310E1F6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 00:46:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------eZuFsCYsVjI7645N5CYSafMB"
Message-ID: <cc6e0abb-bc85-4102-aae7-bc570cd10917@amd.com>
Date: Sun, 29 Oct 2023 20:45:50 -0400
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231027014819.984129-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231027014819.984129-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 i-g-t] tests/amd_security: add secure write
 test for gfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------eZuFsCYsVjI7645N5CYSafMB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jesse,

The change looks good, it is a great improvement.

I have two comments below :

 - rename new method 'atomic' to 'write_linear_atomic'

- use macro 'lower_32_bits' based Kamil's suggestion

Please, wait for the merge until we validate our CI with all ASICs.
I have basic and security test failures with your new patch on SIENNA_CICHLID.

Which ASIC are you using for testing security tests?

Let's work in teams to address the test failure issue.


Thanks, Vitaly

On 2023-10-26 21:48, Jesse Zhang wrote:
> To verify writes in Trusted Memory Zone(TMZ),
> add secure writing and verify the results of gfx.
>
> V2:
>   - Improve description and coding style.
>      Encoding using helpers for high and low 32 bits (Kamil)
>   - Add i-g-t for the subject and
>     replace the "_" with spaces in igt_describe(Kamil)
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c |   9 +-
>  lib/amdgpu/amd_ip_blocks.c          | 173 ++++++++++++++++------------
>  lib/amdgpu/amd_ip_blocks.h          |   1 +
>  tests/amdgpu/amd_security.c         |  13 ++-
>  4 files changed, 111 insertions(+), 85 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index b674ba640..ddcf3d96e 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -165,20 +165,19 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  				r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
>  				igt_assert_eq(r, 0);
>  			} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
> -				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> -
> +				ip_block->funcs->atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
> -
>  			} else if (ip_block->type == AMDGPU_HW_IP_DMA) {
>  				/* restore the bo_cpu to compare */
>  				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
> -				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> +				ip_block->funcs->atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
>  				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
> +				igt_assert_neq(ring_context->bo_cpu[0], ring_context->bo_cpu_origin);
>  				/* restore again, here dest_data should be */
>  				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
> -				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> +				ip_block->funcs->atomic(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
>  				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  				/* here bo_cpu[0] should be unchanged, still is 0x12345678, otherwise failed*/
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 96130ccd5..81db27817 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -18,6 +18,7 @@
>  #include "amdgpu_asic_addr.h"
>  #include "amd_family.h"
>  #include "amd_gfx_v8_0.h"
> +#include "ioctl_wrappers.h"
>  
>  /*
>   * SDMA functions:
> @@ -34,48 +35,58 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
>  
>  	i = 0;
>  	j = 0;
> -	if (ring_context->secure == false) {
> -		if (func->family_id == AMDGPU_FAMILY_SI)
> -			ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
> -						 ring_context->write_length);
> -		else
> -			ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
> -						 SDMA_WRITE_SUB_OPCODE_LINEAR,
> -						 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
> +	if (func->family_id == AMDGPU_FAMILY_SI)
> +		ring_context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
> +					 ring_context->write_length);
> +	else
> +		ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
> +					 SDMA_WRITE_SUB_OPCODE_LINEAR,
> +					 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
> +
> +	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> +	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
> +	if (func->family_id >= AMDGPU_FAMILY_AI)
> +		ring_context->pm4[i++] = ring_context->write_length - 1;
> +	else
> +		ring_context->pm4[i++] = ring_context->write_length;
>  
> -		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> -		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
> -		if (func->family_id >= AMDGPU_FAMILY_AI)
> -			ring_context->pm4[i++] = ring_context->write_length - 1;
> -		else
> -			ring_context->pm4[i++] = ring_context->write_length;
> +	while (j++ < ring_context->write_length)
> +		ring_context->pm4[i++] = func->deadbeaf;
>  
> -		while (j++ < ring_context->write_length)
> -			ring_context->pm4[i++] = func->deadbeaf;
> -	} else {
> -		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
> +	*pm4_dw = i;
> +
> +	return 0;
> +}
> +
> +static int
> +sdma_ring_atomic(const struct amdgpu_ip_funcs *func,
> +		       const struct amdgpu_ring_context *ring_context,
> +		       uint32_t *pm4_dw)
> +{
> +	uint32_t i = 0;
> +
> +	memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
>  
>  		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
>  		 * loop, 1-loop_until_compare_satisfied.
>  		 * single_pass_atomic, 0-lru
>  		 */
> -		ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
> -					       0,
> -					       SDMA_ATOMIC_LOOP(1) |
> -					       SDMA_ATOMIC_TMZ(1) |
> -					       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));
> -		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> -		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
> -		ring_context->pm4[i++] = 0x12345678;
> -		ring_context->pm4[i++] = 0x0;
> -		ring_context->pm4[i++] = func->deadbeaf;
> -		ring_context->pm4[i++] = 0x0;
> -		ring_context->pm4[i++] = 0x100;
> -	}
> -
> +	ring_context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
> +				       0,
> +				       SDMA_ATOMIC_LOOP(1) |
> +				       (ring_context->secure ? SDMA_ATOMIC_TMZ(1) : SDMA_ATOMIC_TMZ(0)) |
> +				       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));

Please, use Kamil's suggestion about lower_32_bits as well.

It looks to me that the mask 0xffffffff takes extra precautions to clear the last 2 bits, which is unnecessary here, 

we always allocate page-aligned sizes and the base address has an alignment parameter of 4096.
Let's use it everywhere lower_32_bits as below:

> +	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;

ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);

> +	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
> +	ring_context->pm4[i++] = 0x12345678;
> +	ring_context->pm4[i++] = 0x0;
> +	ring_context->pm4[i++] = func->deadbeaf;
> +	ring_context->pm4[i++] = 0x0;
> +	ring_context->pm4[i++] = 0x100;
>  	*pm4_dw = i;
>  
>  	return 0;
> +
>  }
>  
>  static int
> @@ -95,8 +106,8 @@ sdma_ring_const_fill(const struct amdgpu_ip_funcs *func,
>  	} else {
>  		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0,
>  						SDMA_CONSTANT_FILL_EXTRA_SIZE(2));
> -		context->pm4[i++] = 0xffffffff & context->bo_mc;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
> +		context->pm4[i++] = lower_32_bits(context->bo_mc);
> +		context->pm4[i++] = upper_32_bits(context->bo_mc);
>  		context->pm4[i++] = func->deadbeaf;
>  
>  		if (func->family_id >= AMDGPU_FAMILY_AI)
> @@ -121,10 +132,10 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>  		context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_COPY_SI,
>  					  0, 0, 0,
>  					  context->write_length);
> -		context->pm4[i++] = 0xffffffff & context->bo_mc;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
> -		context->pm4[i++] = 0xffffffff & context->bo_mc2;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
> +		context->pm4[i++] = lower_32_bits(context->bo_mc);
> +		context->pm4[i++] = upper_32_bits(context->bo_mc);
> +		context->pm4[i++] = lower_32_bits(context->bo_mc2);
> +		context->pm4[i++] = upper_32_bits(context->bo_mc2);
>  	} else {
>  		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
>  				       SDMA_COPY_SUB_OPCODE_LINEAR,
> @@ -134,10 +145,10 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>  		else
>  			context->pm4[i++] = context->write_length;
>  		context->pm4[i++] = 0;
> -		context->pm4[i++] = 0xffffffff & context->bo_mc;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
> -		context->pm4[i++] = 0xffffffff & context->bo_mc2;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
> +		context->pm4[i++] = lower_32_bits(context->bo_mc);
> +		context->pm4[i++] = upper_32_bits(context->bo_mc);
> +		context->pm4[i++] = lower_32_bits(context->bo_mc2);
> +		context->pm4[i++] = upper_32_bits(context->bo_mc2);
>  	}
>  
>  	*pm4_dw = i;
> @@ -163,37 +174,45 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
>  	i = 0;
>  	j = 0;
>  
> -	if (ring_context->secure == false) {
> -		ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
> -		ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
> -		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> -		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
> -		while (j++ < ring_context->write_length)
> -			ring_context->pm4[i++] = func->deadbeaf;
> -	} else {
> -		memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
> +	ring_context->pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context->write_length);
> +	ring_context->pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
> +	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> +	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
> +	while (j++ < ring_context->write_length)
> +		ring_context->pm4[i++] = func->deadbeaf;
> +
> +	*pm4_dw = i;
> +	return 0;
> +}
> +
> +static int
> +gfx_ring_atomic(const struct amdgpu_ip_funcs *func,
> +		      const struct amdgpu_ring_context *ring_context,
> +		      uint32_t *pm4_dw)
> +{
> +	uint32_t i = 0;
> +
> +	memset(ring_context->pm4, 0, ring_context->pm4_size * sizeof(uint32_t));
>  		ring_context->pm4[i++] = PACKET3(PACKET3_ATOMIC_MEM, 7);
>  
> -		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
> -		 * command, 1-loop_until_compare_satisfied.
> -		 * single_pass_atomic, 0-lru
> -		 * engine_sel, 0-micro_engine
> -		 */
> -		ring_context->pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
> -					ATOMIC_MEM_COMMAND(1) |
> -					ATOMIC_MEM_CACHEPOLICAY(0) |
> -					ATOMIC_MEM_ENGINESEL(0));
> -		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> -		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
> -		ring_context->pm4[i++] = 0x12345678;
> -		ring_context->pm4[i++] = 0x0;
> -		ring_context->pm4[i++] = 0xdeadbeaf;
> -		ring_context->pm4[i++] = 0x0;
> -		ring_context->pm4[i++] = 0x100;
> -	}
> +	/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
> +	 * command, 1-loop_until_compare_satisfied.
> +	 * single_pass_atomic, 0-lru
> +	 * engine_sel, 0-micro_engine
> +	 */
> +	ring_context->pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
> +				ATOMIC_MEM_COMMAND(1) |
> +				ATOMIC_MEM_CACHEPOLICAY(0) |
> +				ATOMIC_MEM_ENGINESEL(0));
> +	ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> +	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
> +	ring_context->pm4[i++] = 0x12345678;
> +	ring_context->pm4[i++] = 0x0;
> +	ring_context->pm4[i++] = 0xdeadbeaf;
> +	ring_context->pm4[i++] = 0x0;
> +	ring_context->pm4[i++] = 0x100;
>  
>  	*pm4_dw = i;
> -
>  	return 0;
>  }
>  
> @@ -212,8 +231,8 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
>  					 PACKET3_DMA_DATA_SI_DST_SEL(0) |
>  					 PACKET3_DMA_DATA_SI_SRC_SEL(2) |
>  					 PACKET3_DMA_DATA_SI_CP_SYNC;
> -		ring_context->pm4[i++] = 0xffffffff & ring_context->bo_mc;
> -		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
> +		ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
> +		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
>  		ring_context->pm4[i++] = ring_context->write_length;
>  	} else {
>  		ring_context->pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
> @@ -224,7 +243,7 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
>  		ring_context->pm4[i++] = func->deadbeaf;
>  		ring_context->pm4[i++] = 0;
>  		ring_context->pm4[i++] = 0xfffffffc & ring_context->bo_mc;
> -		ring_context->pm4[i++] = (0xffffffff00000000 & ring_context->bo_mc) >> 32;
> +		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
>  		ring_context->pm4[i++] = ring_context->write_length;
>  	}
>  	*pm4_dw = i;
> @@ -247,9 +266,9 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>  			   PACKET3_DMA_DATA_SI_DST_SEL(0) |
>  			   PACKET3_DMA_DATA_SI_SRC_SEL(0) |
>  			   PACKET3_DMA_DATA_SI_CP_SYNC |
> -			   (0xffff00000000 & context->bo_mc) >> 32;
> +			   upper_32_bits(context->bo_mc);
>  		context->pm4[i++] = 0xfffffffc & context->bo_mc2;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
> +		context->pm4[i++] = upper_32_bits(context->bo_mc2);
>  		context->pm4[i++] = context->write_length;
>  	} else {
>  		context->pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
> @@ -258,9 +277,9 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
>  			   PACKET3_DMA_DATA_SRC_SEL(0) |
>  			   PACKET3_DMA_DATA_CP_SYNC;
>  		context->pm4[i++] = 0xfffffffc & context->bo_mc;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc) >> 32;
> +		context->pm4[i++] = upper_32_bits(context->bo_mc);
>  		context->pm4[i++] = 0xfffffffc & context->bo_mc2;
> -		context->pm4[i++] = (0xffffffff00000000 & context->bo_mc2) >> 32;
> +		context->pm4[i++] = upper_32_bits(context->bo_mc2);
>  		context->pm4[i++] = context->write_length;
>  	}
>  
> @@ -311,6 +330,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
>  	.deadbeaf = 0xdeadbeaf,
>  	.pattern = 0xaaaaaaaa,
>  	.write_linear = gfx_ring_write_linear,
> +	.atomic = gfx_ring_atomic,
>  	.const_fill = gfx_ring_const_fill,
>  	.copy_linear = gfx_ring_copy_linear,
>  	.compare = x_compare,
> @@ -325,6 +345,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
>  	.deadbeaf = 0xdeadbeaf,
>  	.pattern = 0xaaaaaaaa,
>  	.write_linear = sdma_ring_write_linear,
> +	.atomic = sdma_ring_atomic,
>  	.const_fill = sdma_ring_const_fill,
>  	.copy_linear = sdma_ring_copy_linear,
>  	.compare = x_compare,
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 7f6fb3fb4..09a5e61f9 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -70,6 +70,7 @@ struct amdgpu_ip_funcs {
>  	uint32_t	pattern;
>  	/* functions */
>  	int (*write_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
> +	int (*atomic)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
Please, rename a new method from atomic to 'write_linear_atomic'

 	int (*write_linear_atomic)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);

>  	int (*const_fill)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
>  	int (*copy_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
>  	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 1a7eba9eb..d1146a7ce 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -351,17 +351,22 @@ igt_main
>  		igt_skip_on(!is_security_tests_enable(device, &gpu_info, major, minor));
>  	}
>  
> -	igt_describe("amdgpu_security_alloc_buf_test");
> +	igt_describe("amdgpu security alloc buf test");
>  	igt_subtest("amdgpu-security-alloc-buf-test")
>  	amdgpu_security_alloc_buf_test(device);
>  
> -	igt_describe("amdgpu_command_submission_write_linear_helper");
> -	igt_subtest("write-linear-helper-secure")
> +	igt_describe("amdgpu sdma command submission write linear helper");
> +	igt_subtest("sdma-write-linear-helper-secure")
>  	amdgpu_command_submission_write_linear_helper(device,
>  			get_ip_block(device, AMDGPU_HW_IP_DMA), is_secure);
>  
> +	igt_describe("amdgpu gfx command submission write linear helper");
> +	igt_subtest("gfx-write-linear-helper-secure")
> +	 amdgpu_command_submission_write_linear_helper(device,
> +			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure);
> +
>  	/* dynamic test based on sdma_info.available rings */
> -	igt_describe("amdgpu_secure_bounce");
> +	igt_describe("amdgpu secure bounce");
>  	igt_subtest("amdgpu-secure-bounce")
>  	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
>  			AMDGPU_HW_IP_DMA), is_secure);
--------------eZuFsCYsVjI7645N5CYSafMB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Jesse,<br>
    <br>
    The change looks good, it is a great improvement.<br>
    <p>I have two comments below :</p>
    <p>&nbsp;- rename new method 'atomic' to '<span style="white-space: pre-wrap">write_linear_atomic'</span></p>
    <p><span style="white-space: pre-wrap">- use </span>macro
      'lower_32_bits' based Kamil's suggestion<span style="white-space: pre-wrap"></span></p>
    <p>Please, wait for the merge until we validate our CI with all
      ASICs.<br>
      I have basic and security test failures with your new patch on
      SIENNA_CICHLID. <br>
    </p>
    <p>Which ASIC are you using for testing security tests?<br>
    </p>
    <p>Let's work in teams to address the test failure issue.</p>
    <p><br>
    </p>
    <p>Thanks, Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2023-10-26 21:48, Jesse Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231027014819.984129-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">To verify writes in Trusted Memory Zone(TMZ),
add secure writing and verify the results of gfx.

V2:
  - Improve description and coding style.
     Encoding using helpers for high and low 32 bits (Kamil)
  - Add i-g-t for the subject and
    replace the &quot;_&quot; with spaces in igt_describe(Kamil)

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Luben Tuikov <a class="moz-txt-link-rfc2396E" href="mailto:luben.tuikov@amd.com">&lt;luben.tuikov@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>
Signed-off-by: Tim Huang <a class="moz-txt-link-rfc2396E" href="mailto:tim.huang@amd.com">&lt;tim.huang@amd.com&gt;</a>
---
 lib/amdgpu/amd_command_submission.c |   9 +-
 lib/amdgpu/amd_ip_blocks.c          | 173 ++++++++++++++++------------
 lib/amdgpu/amd_ip_blocks.h          |   1 +
 tests/amdgpu/amd_security.c         |  13 ++-
 4 files changed, 111 insertions(+), 85 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index b674ba640..ddcf3d96e 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -165,20 +165,19 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 				r = ip_block-&gt;funcs-&gt;compare(ip_block-&gt;funcs, ring_context, 1);
 				igt_assert_eq(r, 0);
 			} else if (ip_block-&gt;type == AMDGPU_HW_IP_GFX) {
-				ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
-
+				ip_block-&gt;funcs-&gt;atomic(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
-
 			} else if (ip_block-&gt;type == AMDGPU_HW_IP_DMA) {
 				/* restore the bo_cpu to compare */
 				ring_context-&gt;bo_cpu_origin = ring_context-&gt;bo_cpu[0];
-				ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
+				ip_block-&gt;funcs-&gt;atomic(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
 				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
+				igt_assert_neq(ring_context-&gt;bo_cpu[0], ring_context-&gt;bo_cpu_origin);
 				/* restore again, here dest_data should be */
 				ring_context-&gt;bo_cpu_origin = ring_context-&gt;bo_cpu[0];
-				ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
+				ip_block-&gt;funcs-&gt;atomic(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
 				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 				/* here bo_cpu[0] should be unchanged, still is 0x12345678, otherwise failed*/
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 96130ccd5..81db27817 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -18,6 +18,7 @@
 #include &quot;amdgpu_asic_addr.h&quot;
 #include &quot;amd_family.h&quot;
 #include &quot;amd_gfx_v8_0.h&quot;
+#include &quot;ioctl_wrappers.h&quot;
 
 /*
  * SDMA functions:
@@ -34,48 +35,58 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 
 	i = 0;
 	j = 0;
-	if (ring_context-&gt;secure == false) {
-		if (func-&gt;family_id == AMDGPU_FAMILY_SI)
-			ring_context-&gt;pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
-						 ring_context-&gt;write_length);
-		else
-			ring_context-&gt;pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
-						 SDMA_WRITE_SUB_OPCODE_LINEAR,
-						 ring_context-&gt;secure ? SDMA_ATOMIC_TMZ(1) : 0);
+	if (func-&gt;family_id == AMDGPU_FAMILY_SI)
+		ring_context-&gt;pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
+					 ring_context-&gt;write_length);
+	else
+		ring_context-&gt;pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
+					 SDMA_WRITE_SUB_OPCODE_LINEAR,
+					 ring_context-&gt;secure ? SDMA_ATOMIC_TMZ(1) : 0);
+
+	ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
+	ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-&gt;bo_mc);
+	if (func-&gt;family_id &gt;= AMDGPU_FAMILY_AI)
+		ring_context-&gt;pm4[i++] = ring_context-&gt;write_length - 1;
+	else
+		ring_context-&gt;pm4[i++] = ring_context-&gt;write_length;
 
-		ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
-		ring_context-&gt;pm4[i++] = (0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32;
-		if (func-&gt;family_id &gt;= AMDGPU_FAMILY_AI)
-			ring_context-&gt;pm4[i++] = ring_context-&gt;write_length - 1;
-		else
-			ring_context-&gt;pm4[i++] = ring_context-&gt;write_length;
+	while (j++ &lt; ring_context-&gt;write_length)
+		ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
 
-		while (j++ &lt; ring_context-&gt;write_length)
-			ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
-	} else {
-		memset(ring_context-&gt;pm4, 0, ring_context-&gt;pm4_size * sizeof(uint32_t));
+	*pm4_dw = i;
+
+	return 0;
+}
+
+static int
+sdma_ring_atomic(const struct amdgpu_ip_funcs *func,
+		       const struct amdgpu_ring_context *ring_context,
+		       uint32_t *pm4_dw)
+{
+	uint32_t i = 0;
+
+	memset(ring_context-&gt;pm4, 0, ring_context-&gt;pm4_size * sizeof(uint32_t));
 
 		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
 		 * loop, 1-loop_until_compare_satisfied.
 		 * single_pass_atomic, 0-lru
 		 */
-		ring_context-&gt;pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
-					       0,
-					       SDMA_ATOMIC_LOOP(1) |
-					       SDMA_ATOMIC_TMZ(1) |
-					       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));
-		ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
-		ring_context-&gt;pm4[i++] = (0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32;
-		ring_context-&gt;pm4[i++] = 0x12345678;
-		ring_context-&gt;pm4[i++] = 0x0;
-		ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
-		ring_context-&gt;pm4[i++] = 0x0;
-		ring_context-&gt;pm4[i++] = 0x100;
-	}
-
+	ring_context-&gt;pm4[i++] = SDMA_PACKET(SDMA_OPCODE_ATOMIC,
+				       0,
+				       SDMA_ATOMIC_LOOP(1) |
+				       (ring_context-&gt;secure ? SDMA_ATOMIC_TMZ(1) : SDMA_ATOMIC_TMZ(0)) |
+				       SDMA_ATOMIC_OPCODE(TC_OP_ATOMIC_CMPSWAP_RTN_32));</pre>
    </blockquote>
    <p>Please, use Kamil's suggestion about lower_32_bits as well.</p>
    <p>It looks to me that the mask 0xffffffff takes extra precautions
      to clear the last 2 bits, which is unnecessary here,&nbsp;</p>
    <p>we always allocate page-aligned sizes and the base address has an
      alignment parameter of 4096.<br>
      Let's use it everywhere lower_32_bits as below:<br>
    </p>
    <blockquote type="cite" cite="mid:20231027014819.984129-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap;">
</span></p>
    <p><span style="white-space: pre-wrap;">ring_context-&gt;pm4[i++] = lower_32_bits(ring_context-&gt;bo_mc);</span></p>
    <blockquote type="cite" cite="mid:20231027014819.984129-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-&gt;bo_mc);
+	ring_context-&gt;pm4[i++] = 0x12345678;
+	ring_context-&gt;pm4[i++] = 0x0;
+	ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
+	ring_context-&gt;pm4[i++] = 0x0;
+	ring_context-&gt;pm4[i++] = 0x100;
 	*pm4_dw = i;
 
 	return 0;
+
 }
 
 static int
@@ -95,8 +106,8 @@ sdma_ring_const_fill(const struct amdgpu_ip_funcs *func,
 	} else {
 		context-&gt;pm4[i++] = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0,
 						SDMA_CONSTANT_FILL_EXTRA_SIZE(2));
-		context-&gt;pm4[i++] = 0xffffffff &amp; context-&gt;bo_mc;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc) &gt;&gt; 32;
+		context-&gt;pm4[i++] = lower_32_bits(context-&gt;bo_mc);
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc);
 		context-&gt;pm4[i++] = func-&gt;deadbeaf;
 
 		if (func-&gt;family_id &gt;= AMDGPU_FAMILY_AI)
@@ -121,10 +132,10 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		context-&gt;pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_COPY_SI,
 					  0, 0, 0,
 					  context-&gt;write_length);
-		context-&gt;pm4[i++] = 0xffffffff &amp; context-&gt;bo_mc;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc) &gt;&gt; 32;
-		context-&gt;pm4[i++] = 0xffffffff &amp; context-&gt;bo_mc2;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc2) &gt;&gt; 32;
+		context-&gt;pm4[i++] = lower_32_bits(context-&gt;bo_mc);
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc);
+		context-&gt;pm4[i++] = lower_32_bits(context-&gt;bo_mc2);
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc2);
 	} else {
 		context-&gt;pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
 				       SDMA_COPY_SUB_OPCODE_LINEAR,
@@ -134,10 +145,10 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		else
 			context-&gt;pm4[i++] = context-&gt;write_length;
 		context-&gt;pm4[i++] = 0;
-		context-&gt;pm4[i++] = 0xffffffff &amp; context-&gt;bo_mc;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc) &gt;&gt; 32;
-		context-&gt;pm4[i++] = 0xffffffff &amp; context-&gt;bo_mc2;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc2) &gt;&gt; 32;
+		context-&gt;pm4[i++] = lower_32_bits(context-&gt;bo_mc);
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc);
+		context-&gt;pm4[i++] = lower_32_bits(context-&gt;bo_mc2);
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc2);
 	}
 
 	*pm4_dw = i;
@@ -163,37 +174,45 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	i = 0;
 	j = 0;
 
-	if (ring_context-&gt;secure == false) {
-		ring_context-&gt;pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context-&gt;write_length);
-		ring_context-&gt;pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
-		ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
-		ring_context-&gt;pm4[i++] = (0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32;
-		while (j++ &lt; ring_context-&gt;write_length)
-			ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
-	} else {
-		memset(ring_context-&gt;pm4, 0, ring_context-&gt;pm4_size * sizeof(uint32_t));
+	ring_context-&gt;pm4[i++] = PACKET3(PACKET3_WRITE_DATA, 2 +  ring_context-&gt;write_length);
+	ring_context-&gt;pm4[i++] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM;
+	ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
+	ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-&gt;bo_mc);
+	while (j++ &lt; ring_context-&gt;write_length)
+		ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
+
+	*pm4_dw = i;
+	return 0;
+}
+
+static int
+gfx_ring_atomic(const struct amdgpu_ip_funcs *func,
+		      const struct amdgpu_ring_context *ring_context,
+		      uint32_t *pm4_dw)
+{
+	uint32_t i = 0;
+
+	memset(ring_context-&gt;pm4, 0, ring_context-&gt;pm4_size * sizeof(uint32_t));
 		ring_context-&gt;pm4[i++] = PACKET3(PACKET3_ATOMIC_MEM, 7);
 
-		/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
-		 * command, 1-loop_until_compare_satisfied.
-		 * single_pass_atomic, 0-lru
-		 * engine_sel, 0-micro_engine
-		 */
-		ring_context-&gt;pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
-					ATOMIC_MEM_COMMAND(1) |
-					ATOMIC_MEM_CACHEPOLICAY(0) |
-					ATOMIC_MEM_ENGINESEL(0));
-		ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
-		ring_context-&gt;pm4[i++] = (0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32;
-		ring_context-&gt;pm4[i++] = 0x12345678;
-		ring_context-&gt;pm4[i++] = 0x0;
-		ring_context-&gt;pm4[i++] = 0xdeadbeaf;
-		ring_context-&gt;pm4[i++] = 0x0;
-		ring_context-&gt;pm4[i++] = 0x100;
-	}
+	/* atomic opcode for 32b w/ RTN and ATOMIC_SWAPCMP_RTN
+	 * command, 1-loop_until_compare_satisfied.
+	 * single_pass_atomic, 0-lru
+	 * engine_sel, 0-micro_engine
+	 */
+	ring_context-&gt;pm4[i++] = (TC_OP_ATOMIC_CMPSWAP_RTN_32 |
+				ATOMIC_MEM_COMMAND(1) |
+				ATOMIC_MEM_CACHEPOLICAY(0) |
+				ATOMIC_MEM_ENGINESEL(0));
+	ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
+	ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-&gt;bo_mc);
+	ring_context-&gt;pm4[i++] = 0x12345678;
+	ring_context-&gt;pm4[i++] = 0x0;
+	ring_context-&gt;pm4[i++] = 0xdeadbeaf;
+	ring_context-&gt;pm4[i++] = 0x0;
+	ring_context-&gt;pm4[i++] = 0x100;
 
 	*pm4_dw = i;
-
 	return 0;
 }
 
@@ -212,8 +231,8 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
 					 PACKET3_DMA_DATA_SI_DST_SEL(0) |
 					 PACKET3_DMA_DATA_SI_SRC_SEL(2) |
 					 PACKET3_DMA_DATA_SI_CP_SYNC;
-		ring_context-&gt;pm4[i++] = 0xffffffff &amp; ring_context-&gt;bo_mc;
-		ring_context-&gt;pm4[i++] = (0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32;
+		ring_context-&gt;pm4[i++] = lower_32_bits(ring_context-&gt;bo_mc);
+		ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-&gt;bo_mc);
 		ring_context-&gt;pm4[i++] = ring_context-&gt;write_length;
 	} else {
 		ring_context-&gt;pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
@@ -224,7 +243,7 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
 		ring_context-&gt;pm4[i++] = func-&gt;deadbeaf;
 		ring_context-&gt;pm4[i++] = 0;
 		ring_context-&gt;pm4[i++] = 0xfffffffc &amp; ring_context-&gt;bo_mc;
-		ring_context-&gt;pm4[i++] = (0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32;
+		ring_context-&gt;pm4[i++] = upper_32_bits(ring_context-&gt;bo_mc);
 		ring_context-&gt;pm4[i++] = ring_context-&gt;write_length;
 	}
 	*pm4_dw = i;
@@ -247,9 +266,9 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 			   PACKET3_DMA_DATA_SI_DST_SEL(0) |
 			   PACKET3_DMA_DATA_SI_SRC_SEL(0) |
 			   PACKET3_DMA_DATA_SI_CP_SYNC |
-			   (0xffff00000000 &amp; context-&gt;bo_mc) &gt;&gt; 32;
+			   upper_32_bits(context-&gt;bo_mc);
 		context-&gt;pm4[i++] = 0xfffffffc &amp; context-&gt;bo_mc2;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc2) &gt;&gt; 32;
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc2);
 		context-&gt;pm4[i++] = context-&gt;write_length;
 	} else {
 		context-&gt;pm4[i++] = PACKET3(PACKET3_DMA_DATA, 5);
@@ -258,9 +277,9 @@ gfx_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 			   PACKET3_DMA_DATA_SRC_SEL(0) |
 			   PACKET3_DMA_DATA_CP_SYNC;
 		context-&gt;pm4[i++] = 0xfffffffc &amp; context-&gt;bo_mc;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc) &gt;&gt; 32;
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc);
 		context-&gt;pm4[i++] = 0xfffffffc &amp; context-&gt;bo_mc2;
-		context-&gt;pm4[i++] = (0xffffffff00000000 &amp; context-&gt;bo_mc2) &gt;&gt; 32;
+		context-&gt;pm4[i++] = upper_32_bits(context-&gt;bo_mc2);
 		context-&gt;pm4[i++] = context-&gt;write_length;
 	}
 
@@ -311,6 +330,7 @@ static struct amdgpu_ip_funcs gfx_v8_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = gfx_ring_write_linear,
+	.atomic = gfx_ring_atomic,
 	.const_fill = gfx_ring_const_fill,
 	.copy_linear = gfx_ring_copy_linear,
 	.compare = x_compare,
@@ -325,6 +345,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = sdma_ring_write_linear,
+	.atomic = sdma_ring_atomic,
 	.const_fill = sdma_ring_const_fill,
 	.copy_linear = sdma_ring_copy_linear,
 	.compare = x_compare,
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 7f6fb3fb4..09a5e61f9 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -70,6 +70,7 @@ struct amdgpu_ip_funcs {
 	uint32_t	pattern;
 	/* functions */
 	int (*write_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
+	int (*atomic)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);</pre>
    </blockquote>
    Please, rename a new method from atomic to '<span style="white-space: pre-wrap">write_linear_atomic'</span>
    <pre class="moz-quote-pre" wrap=""> 	int (*write_linear_atomic)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
</pre>
    <blockquote type="cite" cite="mid:20231027014819.984129-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
 	int (*const_fill)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*copy_linear)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, uint32_t *pm4_dw);
 	int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 1a7eba9eb..d1146a7ce 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -351,17 +351,22 @@ igt_main
 		igt_skip_on(!is_security_tests_enable(device, &amp;gpu_info, major, minor));
 	}
 
-	igt_describe(&quot;amdgpu_security_alloc_buf_test&quot;);
+	igt_describe(&quot;amdgpu security alloc buf test&quot;);
 	igt_subtest(&quot;amdgpu-security-alloc-buf-test&quot;)
 	amdgpu_security_alloc_buf_test(device);
 
-	igt_describe(&quot;amdgpu_command_submission_write_linear_helper&quot;);
-	igt_subtest(&quot;write-linear-helper-secure&quot;)
+	igt_describe(&quot;amdgpu sdma command submission write linear helper&quot;);
+	igt_subtest(&quot;sdma-write-linear-helper-secure&quot;)
 	amdgpu_command_submission_write_linear_helper(device,
 			get_ip_block(device, AMDGPU_HW_IP_DMA), is_secure);
 
+	igt_describe(&quot;amdgpu gfx command submission write linear helper&quot;);
+	igt_subtest(&quot;gfx-write-linear-helper-secure&quot;)
+	 amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure);
+
 	/* dynamic test based on sdma_info.available rings */
-	igt_describe(&quot;amdgpu_secure_bounce&quot;);
+	igt_describe(&quot;amdgpu secure bounce&quot;);
 	igt_subtest(&quot;amdgpu-secure-bounce&quot;)
 	amdgpu_secure_bounce(device, fd, &amp;sdma_info, get_ip_block(device,
 			AMDGPU_HW_IP_DMA), is_secure);
</pre>
    </blockquote>
  </body>
</html>

--------------eZuFsCYsVjI7645N5CYSafMB--
