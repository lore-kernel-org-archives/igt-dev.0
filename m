Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFF210E053
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Oct 2023 03:42:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------ZAAeLrEpqbpH0vkfy7EwVTZk"
Message-ID: <9b9af86e-521d-4842-a29e-2c974c51fe9b@amd.com>
Date: Sat, 21 Oct 2023 23:42:20 -0400
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231020052147.375497-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231020052147.375497-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amd_dispatch: add negative test for SDMA
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

--------------ZAAeLrEpqbpH0vkfy7EwVTZk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jesse,

Please, see below to add a couple of 'defines' and additional comments for clarification.

With this Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

I validated on SIENNA_CICHLID, works fine!

Thanks, Vitaly

On 2023-10-20 01:21, Jesse Zhang wrote:
> Issue corrupted header or slow sdma linear copy
> to trigger SDMA hang test.
>
> V3:
>   - avoid generating warning,
>     and optimize logical code. (Vitaly)
>   - Use existing interfaces
>     to clean up code. (Vitaly)
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
>  lib/amdgpu/amd_command_submission.c | 46 +++++++++------
>  lib/amdgpu/amd_command_submission.h |  3 +-
>  lib/amdgpu/amd_deadlock_helpers.c   | 90 +++++++++++++++++++++++++++++
>  lib/amdgpu/amd_deadlock_helpers.h   |  7 +++
>  tests/amdgpu/amd_basic.c            |  4 +-
>  tests/amdgpu/amd_deadlock.c         | 16 +++++
>  tests/amdgpu/amd_security.c         |  4 +-
>  7 files changed, 148 insertions(+), 22 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 02cf9357b..b674ba640 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -18,7 +18,7 @@
>   */
>  
>  void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
> -				struct amdgpu_ring_context *ring_context)
> +				struct amdgpu_ring_context *ring_context, int expect)
>  {
>  	int r;
>  	uint32_t expired;
> @@ -31,15 +31,23 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
>  
>  	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
>  
> +	if (expect) {
> +		/* allocate IB */
> +		r = amdgpu_bo_alloc_and_map(device, ring_context->write_length, 4096,
> +					    AMDGPU_GEM_DOMAIN_GTT, 0,
> +					    &ib_result_handle, &ib_result_cpu,
> +					    &ib_result_mc_address, &va_handle);
> +	} else {
> +		/* prepare CS */
> +		igt_assert(ring_context->pm4_dw <= 1024);
> +		/* allocate IB */
> +		r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
> +					    AMDGPU_GEM_DOMAIN_GTT, 0,
> +					    &ib_result_handle, &ib_result_cpu,
> +					    &ib_result_mc_address, &va_handle);
>  
> -	/* prepare CS */
> -	igt_assert(ring_context->pm4_dw <= 1024);
>  
> -	/* allocate IB */
> -	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
> -				    AMDGPU_GEM_DOMAIN_GTT, 0,
> -				    &ib_result_handle, &ib_result_cpu,
> -				    &ib_result_mc_address, &va_handle);
> +	}
>  	igt_assert_eq(r, 0);
>  
>  	/* copy PM4 packet to ring from caller */
> @@ -81,9 +89,13 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
>  	r = amdgpu_cs_query_fence_status(&fence_status,
>  					 AMDGPU_TIMEOUT_INFINITE,
>  					 0, &expired);
> -	igt_assert_eq(r, 0);
> -	igt_assert_eq(expired, true);
> -
> +	if (expect) {
> +		igt_assert_neq(r, 0);
> +		igt_assert_neq(expired, true);
> +	} else {
> +		igt_assert_eq(r, 0);
> +		igt_assert_eq(expired, true);
> +	}
>  	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
>  				 ib_result_mc_address, 4096);
>  }
> @@ -145,7 +157,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  
>  			ring_context->ring_id = ring_id;
>  
> -			 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +			 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
>  			/* verify if SDMA test result meets with expected */
>  			i = 0;
> @@ -155,20 +167,20 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  			} else if (ip_block->type == AMDGPU_HW_IP_GFX) {
>  				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
> -				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
>  			} else if (ip_block->type == AMDGPU_HW_IP_DMA) {
>  				/* restore the bo_cpu to compare */
>  				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
>  				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
> -				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
>  				/* restore again, here dest_data should be */
>  				ring_context->bo_cpu_origin = ring_context->bo_cpu[0];
>  				ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
> -				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  				/* here bo_cpu[0] should be unchanged, still is 0x12345678, otherwise failed*/
>  				igt_assert_eq(ring_context->bo_cpu[0], ring_context->bo_cpu_origin);
>  			}
> @@ -236,7 +248,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  			/* fulfill PM4: test DMA const fill */
>  			ip_block->funcs->const_fill(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
> -			amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +			amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
>  			/* verify if SDMA test result meets with expected */
>  			r = ip_block->funcs->compare(ip_block->funcs, ring_context, 4);
> @@ -322,7 +334,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  
>  				ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
> -				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +				amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
>  				/* verify if SDMA test result meets with expected */
>  				r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, 4);
> diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
> index 58f3221a3..44f0cc958 100644
> --- a/lib/amdgpu/amd_command_submission.h
> +++ b/lib/amdgpu/amd_command_submission.h
> @@ -29,7 +29,8 @@
>  #include "amd_ip_blocks.h"
>  
>  void amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
> -				unsigned int ip_type, struct amdgpu_ring_context *ring_context);
> +				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
> +				int expect);
>  
>  void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  						   const struct amdgpu_ip_block_version *ip_block,
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index a6be5f02a..5b7d51d94 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -13,6 +13,7 @@
>  #include "amd_memory.h"
>  #include "amd_deadlock_helpers.h"
>  #include "amd_ip_blocks.h"
> +#include "lib/amdgpu/amd_command_submission.h"
>  
>  #define MAX_JOB_COUNT 200
>  
> @@ -248,3 +249,92 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
>  	free_cmd_base(base_cmd);
>  	amdgpu_cs_ctx_free(context_handle);
>  }

#define MAX_DMABUF_COUNT 0x20000

#define MAX_DWORD_COUNT 256

> +
> +void
> +amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
> +{
> +	int j, r;
> +	uint32_t *ptr, offset;
> +	struct amdgpu_ring_context *ring_context;
> +	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
> +	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
> +		ring_context->write_length = 4096;
> +		ring_context->pm4 = calloc(*MAX_DWORD_COUNT*, sizeof(*ring_context->pm4));
> +		ring_context->pm4_size = *MAX_DWORD_COUNT*;
> +	} else {
> +		ring_context->write_length = *MAX_DWORD_COUNT* * 4 * *MAX_DMABUF_COUNT*;
> +		ring_context->pm4 = calloc(*MAX_DWORD_COUNT* * *MAX_DMABUF_COUNT*, sizeof(*ring_context->pm4));
> +		ring_context->pm4_size = *MAX_DWORD_COUNT* * *MAX_DMABUF_COUNT*;
> +	}
> +	ring_context->secure = false;
> +	ring_context->res_cnt = 2;
> +	igt_assert(ring_context->pm4);
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device_handle, ring_context->write_length, 4096,
> +					AMDGPU_GEM_DOMAIN_GTT, 0,
> +					&ring_context->bo, (void **)&ring_context->bo_cpu,
> +					&ring_context->bo_mc, &ring_context->va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* set bo */
> +	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
> +	r = amdgpu_bo_alloc_and_map(device_handle,
> +				    ring_context->write_length, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT,
> +				    0, &ring_context->bo2,
> +				    (void **)&ring_context->bo2_cpu, &ring_context->bo_mc2,
> +				    &ring_context->va_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	/* set bo2 */
> +	memset((void *)ring_context->bo2_cpu, 0, ring_context->write_length);
> +	ring_context->resources[0] = ring_context->bo;
> +	ring_context->resources[1] = ring_context->bo2;
> +	base_cmd->attach_buf(base_cmd, ring_context->pm4, ring_context->write_length);
> +
> +	/* fulfill PM4: with bad copy linear header */
> +	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
> +		ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> +		base_cmd->emit_at_offset(base_cmd, 0x23decd3d, 0);
> +	} else {
> +		/* Save initialization pm4 */
> +		ptr = ring_context->pm4;
> +		for (j = 1; j < *MAX_DMABUF_COUNT*; j++) {
/* copy from buf1 to buf2 */
> +			ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> +			ring_context->pm4 += ring_context->pm4_dw
> +			ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> +
> +			offset = ring_context->pm4_dw * 2 * j;
/* override  addr of buf1 and buf 2 in order to copy from buf2 to buf1 */
> +			base_cmd->emit_at_offset(base_cmd, (0xffffffff & ring_context->bo_mc2), (offset - 4));
> +			base_cmd->emit_at_offset(base_cmd,
> +					((0xffffffff00000000 & ring_context->bo_mc2) >> 32), (offset - 3));
> +			base_cmd->emit_at_offset(base_cmd, (0xffffffff & ring_context->bo_mc), (offset - 2));
> +			base_cmd->emit_at_offset(base_cmd,
> +					((0xffffffff00000000 & ring_context->bo_mc) >> 32), (offset - 1));
> +			ring_context->pm4 += ring_context->pm4_dw;
> +		}
> +		/* restore pm4 */
> +		ring_context->pm4 = ptr;
> +		/* update the total pm4_dw */
> +		ring_context->pm4_dw = ring_context->pm4_dw * 2 * j;
> +	}
> +
> +	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context, 1);
> +	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
> +						 ring_context->write_length);
> +	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
> +						 ring_context->write_length);
> +	/* clean resources */
> +	free(ring_context->pm4);
> +	/* end of test */
> +	//r = amdgpu_cs_ctx_free(context_handle);
> +	r = amdgpu_cs_ctx_free(ring_context->context_handle);
> +	igt_assert_eq(r, 0);
> +	free_cmd_base(base_cmd);
> +}
> diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
> index cc8eba7f7..9c0d245a9 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.h
> +++ b/lib/amdgpu/amd_deadlock_helpers.h
> @@ -24,11 +24,18 @@
>  #ifndef __AMD_DEADLOCK_HELPERS_H__
>  #define __AMD_DEADLOCK_HELPERS_H__
>  
> +enum  hang_type {
> +	DMA_CORRUPTED_HEADER_HANG,
> +	DMA_SLOW_LINEARCOPY_HANG
> +};
> +
>  void
>  amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
>  
>  void
>  bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
>  
> +void
> +amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
>  #endif
>  
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 88fdbd980..70e45649d 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -307,7 +307,7 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
>  
>  	ip_block->funcs->write_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
>  
> -	 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +	 amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  
>  	r = ip_block->funcs->compare(ip_block->funcs, ring_context, 1);
>  	igt_assert_eq(r, 0);
> @@ -412,7 +412,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
>  			ring_context->resources[2] = ring_context->boa_vram[loop2];
>  			ring_context->resources[3] = ring_context->boa_gtt[loop2];
>  			ip_block->funcs->copy_linear(ip_block->funcs, ring_context, &ring_context->pm4_dw);
> -			amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context);
> +			amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context, 0);
>  			/* fulfill PM4: test DMA copy linear */
>  			r = ip_block->funcs->compare_pattern(ip_block->funcs, ring_context, sdma_write_length);
>  			igt_assert_eq(r, 0);
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 6147b7636..dc7ec4366 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -77,6 +77,22 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test-GPU-reset-by-sdma-corrupted-header-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
> +			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
> +		}
> +	}
> +
> +	igt_describe("Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-slow-linear-copy") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
> +			amdgpu_hang_sdma_helper(device, DMA_SLOW_LINEARCOPY_HANG);
> +		}
> +	}
> +
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
> diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
> index 46180df2e..1a7eba9eb 100644
> --- a/tests/amdgpu/amd_security.c
> +++ b/tests/amdgpu/amd_security.c
> @@ -110,7 +110,7 @@ amdgpu_bo_lcopy(amdgpu_device_handle device,
>  
>  	amdgpu_sdma_lcopy(ring_context->pm4, ring_context->bo_mc2,
>  			ring_context->bo_mc, size, secure);
> -	amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +	amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  	free(ring_context->pm4);
>  }
>  
> @@ -155,7 +155,7 @@ amdgpu_bo_move(amdgpu_device_handle device, int fd,
>  	 * it to the desired location.
>  	 */
>  	amdgpu_sdma_nop(ring_context->pm4, PACKET_NOP_SIZE);
> -	amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context);
> +	amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context, 0);
>  	free(ring_context->pm4);
>  }
>  
--------------ZAAeLrEpqbpH0vkfy7EwVTZk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jesse,</p>
    <p>Please, see below to add a couple of 'defines' and additional
      comments for clarification.<br>
    </p>
    <p>With this Reviewed-by: Vitaly Prosyak
      <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a></p>
    <p>I validated on SIENNA_CICHLID, works fine!<br>
    </p>
    <p>Thanks, Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2023-10-20 01:21, Jesse Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231020052147.375497-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">Issue corrupted header or slow sdma linear copy
to trigger SDMA hang test.

V3:
  - avoid generating warning,
    and optimize logical code. (Vitaly)
  - Use existing interfaces
    to clean up code. (Vitaly)

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Luben Tuikov <a class="moz-txt-link-rfc2396E" href="mailto:luben.tuikov@amd.com">&lt;luben.tuikov@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>
Signed-off-by: Tim Huang <a class="moz-txt-link-rfc2396E" href="mailto:tim.huang@amd.com">&lt;tim.huang@amd.com&gt;</a>
---
 lib/amdgpu/amd_command_submission.c | 46 +++++++++------
 lib/amdgpu/amd_command_submission.h |  3 +-
 lib/amdgpu/amd_deadlock_helpers.c   | 90 +++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h   |  7 +++
 tests/amdgpu/amd_basic.c            |  4 +-
 tests/amdgpu/amd_deadlock.c         | 16 +++++
 tests/amdgpu/amd_security.c         |  4 +-
 7 files changed, 148 insertions(+), 22 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 02cf9357b..b674ba640 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -18,7 +18,7 @@
  */
 
 void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
-				struct amdgpu_ring_context *ring_context)
+				struct amdgpu_ring_context *ring_context, int expect)
 {
 	int r;
 	uint32_t expired;
@@ -31,15 +31,23 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
 
 	amdgpu_bo_handle *all_res = alloca(sizeof(ring_context-&gt;resources[0]) * (ring_context-&gt;res_cnt + 1));
 
+	if (expect) {
+		/* allocate IB */
+		r = amdgpu_bo_alloc_and_map(device, ring_context-&gt;write_length, 4096,
+					    AMDGPU_GEM_DOMAIN_GTT, 0,
+					    &amp;ib_result_handle, &amp;ib_result_cpu,
+					    &amp;ib_result_mc_address, &amp;va_handle);
+	} else {
+		/* prepare CS */
+		igt_assert(ring_context-&gt;pm4_dw &lt;= 1024);
+		/* allocate IB */
+		r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
+					    AMDGPU_GEM_DOMAIN_GTT, 0,
+					    &amp;ib_result_handle, &amp;ib_result_cpu,
+					    &amp;ib_result_mc_address, &amp;va_handle);
 
-	/* prepare CS */
-	igt_assert(ring_context-&gt;pm4_dw &lt;= 1024);
 
-	/* allocate IB */
-	r = amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT, 0,
-				    &amp;ib_result_handle, &amp;ib_result_cpu,
-				    &amp;ib_result_mc_address, &amp;va_handle);
+	}
 	igt_assert_eq(r, 0);
 
 	/* copy PM4 packet to ring from caller */
@@ -81,9 +89,13 @@ void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_typ
 	r = amdgpu_cs_query_fence_status(&amp;fence_status,
 					 AMDGPU_TIMEOUT_INFINITE,
 					 0, &amp;expired);
-	igt_assert_eq(r, 0);
-	igt_assert_eq(expired, true);
-
+	if (expect) {
+		igt_assert_neq(r, 0);
+		igt_assert_neq(expired, true);
+	} else {
+		igt_assert_eq(r, 0);
+		igt_assert_eq(expired, true);
+	}
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 				 ib_result_mc_address, 4096);
 }
@@ -145,7 +157,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 			ring_context-&gt;ring_id = ring_id;
 
-			 amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+			 amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
 			/* verify if SDMA test result meets with expected */
 			i = 0;
@@ -155,20 +167,20 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 			} else if (ip_block-&gt;type == AMDGPU_HW_IP_GFX) {
 				ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
-				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
 			} else if (ip_block-&gt;type == AMDGPU_HW_IP_DMA) {
 				/* restore the bo_cpu to compare */
 				ring_context-&gt;bo_cpu_origin = ring_context-&gt;bo_cpu[0];
 				ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
-				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
 				/* restore again, here dest_data should be */
 				ring_context-&gt;bo_cpu_origin = ring_context-&gt;bo_cpu[0];
 				ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
-				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 				/* here bo_cpu[0] should be unchanged, still is 0x12345678, otherwise failed*/
 				igt_assert_eq(ring_context-&gt;bo_cpu[0], ring_context-&gt;bo_cpu_origin);
 			}
@@ -236,7 +248,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 			/* fulfill PM4: test DMA const fill */
 			ip_block-&gt;funcs-&gt;const_fill(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
-			amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+			amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
 			/* verify if SDMA test result meets with expected */
 			r = ip_block-&gt;funcs-&gt;compare(ip_block-&gt;funcs, ring_context, 4);
@@ -322,7 +334,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 				ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
-				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+				amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
 				/* verify if SDMA test result meets with expected */
 				r = ip_block-&gt;funcs-&gt;compare_pattern(ip_block-&gt;funcs, ring_context, 4);
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 58f3221a3..44f0cc958 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -29,7 +29,8 @@
 #include &quot;amd_ip_blocks.h&quot;
 
 void amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
-				unsigned int ip_type, struct amdgpu_ring_context *ring_context);
+				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
+				int expect);
 
 void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 						   const struct amdgpu_ip_block_version *ip_block,
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index a6be5f02a..5b7d51d94 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -13,6 +13,7 @@
 #include &quot;amd_memory.h&quot;
 #include &quot;amd_deadlock_helpers.h&quot;
 #include &quot;amd_ip_blocks.h&quot;
+#include &quot;lib/amdgpu/amd_command_submission.h&quot;
 
 #define MAX_JOB_COUNT 200
 
@@ -248,3 +249,92 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	free_cmd_base(base_cmd);
 	amdgpu_cs_ctx_free(context_handle);
 }</pre>
    </blockquote>
    <p>#define MAX_DMABUF_COUNT <span style="white-space: pre-wrap">0x20000</span></p>
    <p><span style="white-space: pre-wrap"></span>#define
      MAX_DWORD_COUNT 256</p>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20231020052147.375497-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">+
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+{
+	int j, r;
+	uint32_t *ptr, offset;
+	struct amdgpu_ring_context *ring_context;
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
+
+	ring_context = calloc(1, sizeof(*ring_context));
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
+		ring_context-&gt;write_length = 4096;
+		ring_context-&gt;pm4 = calloc(<b>MAX_DWORD_COUNT</b>, sizeof(*ring_context-&gt;pm4));
+		ring_context-&gt;pm4_size = <b>MAX_DWORD_COUNT</b>;
+	} else {
+		ring_context-&gt;write_length = <b>MAX_DWORD_COUNT</b> * 4 * <b>MAX_DMABUF_COUNT</b>;
+		ring_context-&gt;pm4 = calloc(<b>MAX_DWORD_COUNT</b> * <b>MAX_DMABUF_COUNT</b>, sizeof(*ring_context-&gt;pm4));
+		ring_context-&gt;pm4_size = <b>MAX_DWORD_COUNT</b> * <b>MAX_DMABUF_COUNT</b>;
+	}
+	ring_context-&gt;secure = false;
+	ring_context-&gt;res_cnt = 2;
+	igt_assert(ring_context-&gt;pm4);
+
+	r = amdgpu_cs_ctx_create(device_handle, &amp;ring_context-&gt;context_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle, ring_context-&gt;write_length, 4096,
+					AMDGPU_GEM_DOMAIN_GTT, 0,
+					&amp;ring_context-&gt;bo, (void **)&amp;ring_context-&gt;bo_cpu,
+					&amp;ring_context-&gt;bo_mc, &amp;ring_context-&gt;va_handle);
+	igt_assert_eq(r, 0);
+
+	/* set bo */
+	memset((void *)ring_context-&gt;bo_cpu, 0, ring_context-&gt;write_length);
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				    ring_context-&gt;write_length, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT,
+				    0, &amp;ring_context-&gt;bo2,
+				    (void **)&amp;ring_context-&gt;bo2_cpu, &amp;ring_context-&gt;bo_mc2,
+				    &amp;ring_context-&gt;va_handle2);
+	igt_assert_eq(r, 0);
+
+	/* set bo2 */
+	memset((void *)ring_context-&gt;bo2_cpu, 0, ring_context-&gt;write_length);
+	ring_context-&gt;resources[0] = ring_context-&gt;bo;
+	ring_context-&gt;resources[1] = ring_context-&gt;bo2;
+	base_cmd-&gt;attach_buf(base_cmd, ring_context-&gt;pm4, ring_context-&gt;write_length);
+
+	/* fulfill PM4: with bad copy linear header */
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
+		ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
+		base_cmd-&gt;emit_at_offset(base_cmd, 0x23decd3d, 0);
+	} else {
+		/* Save initialization pm4 */
+		ptr = ring_context-&gt;pm4;
+		for (j = 1; j &lt; <b>MAX_DMABUF_COUNT</b>; j++) {</pre>
    </blockquote>
    /* copy from buf1 to buf2 */<br>
    <blockquote type="cite" cite="mid:20231020052147.375497-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+			ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
+			ring_context-&gt;pm4 += ring_context-&gt;pm4_dw</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20231020052147.375497-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">+			ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
+
+			offset = ring_context-&gt;pm4_dw * 2 * j;</pre>
    </blockquote>
    /* override&nbsp; addr of buf1 and buf 2 in order to copy from buf2 to
    buf1 */
    <blockquote type="cite" cite="mid:20231020052147.375497-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+			base_cmd-&gt;emit_at_offset(base_cmd, (0xffffffff &amp; ring_context-&gt;bo_mc2), (offset - 4));
+			base_cmd-&gt;emit_at_offset(base_cmd,
+					((0xffffffff00000000 &amp; ring_context-&gt;bo_mc2) &gt;&gt; 32), (offset - 3));
+			base_cmd-&gt;emit_at_offset(base_cmd, (0xffffffff &amp; ring_context-&gt;bo_mc), (offset - 2));
+			base_cmd-&gt;emit_at_offset(base_cmd,
+					((0xffffffff00000000 &amp; ring_context-&gt;bo_mc) &gt;&gt; 32), (offset - 1));
+			ring_context-&gt;pm4 += ring_context-&gt;pm4_dw;
+		}
+		/* restore pm4 */
+		ring_context-&gt;pm4 = ptr;
+		/* update the total pm4_dw */
+		ring_context-&gt;pm4_dw = ring_context-&gt;pm4_dw * 2 * j;
+	}
+
+	amdgpu_test_exec_cs_helper(device_handle, ip_block-&gt;type, ring_context, 1);
+	amdgpu_bo_unmap_and_free(ring_context-&gt;bo, ring_context-&gt;va_handle, ring_context-&gt;bo_mc,
+						 ring_context-&gt;write_length);
+	amdgpu_bo_unmap_and_free(ring_context-&gt;bo2, ring_context-&gt;va_handle2, ring_context-&gt;bo_mc2,
+						 ring_context-&gt;write_length);
+	/* clean resources */
+	free(ring_context-&gt;pm4);
+	/* end of test */
+	//r = amdgpu_cs_ctx_free(context_handle);
+	r = amdgpu_cs_ctx_free(ring_context-&gt;context_handle);
+	igt_assert_eq(r, 0);
+	free_cmd_base(base_cmd);
+}
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index cc8eba7f7..9c0d245a9 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -24,11 +24,18 @@
 #ifndef __AMD_DEADLOCK_HELPERS_H__
 #define __AMD_DEADLOCK_HELPERS_H__
 
+enum  hang_type {
+	DMA_CORRUPTED_HEADER_HANG,
+	DMA_SLOW_LINEARCOPY_HANG
+};
+
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
 
 void
 bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
 
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type);
 #endif
 
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 88fdbd980..70e45649d 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -307,7 +307,7 @@ static void amdgpu_userptr_test(amdgpu_device_handle device)
 
 	ip_block-&gt;funcs-&gt;write_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
 
-	 amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+	 amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 
 	r = ip_block-&gt;funcs-&gt;compare(ip_block-&gt;funcs, ring_context, 1);
 	igt_assert_eq(r, 0);
@@ -412,7 +412,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 			ring_context-&gt;resources[2] = ring_context-&gt;boa_vram[loop2];
 			ring_context-&gt;resources[3] = ring_context-&gt;boa_gtt[loop2];
 			ip_block-&gt;funcs-&gt;copy_linear(ip_block-&gt;funcs, ring_context, &amp;ring_context-&gt;pm4_dw);
-			amdgpu_test_exec_cs_helper(device_handle, ip_block-&gt;type, ring_context);
+			amdgpu_test_exec_cs_helper(device_handle, ip_block-&gt;type, ring_context, 0);
 			/* fulfill PM4: test DMA copy linear */
 			r = ip_block-&gt;funcs-&gt;compare_pattern(ip_block-&gt;funcs, ring_context, sdma_write_length);
 			igt_assert_eq(r, 0);
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 6147b7636..dc7ec4366 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -77,6 +77,22 @@ igt_main
 		}
 	}
 
+	igt_describe(&quot;Test-GPU-reset-by-sdma-corrupted-header-with-jobs&quot;);
+	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-sdma-corrupted-header-test&quot;) {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f(&quot;amdgpu-deadlock-sdma-corrupted-header-test&quot;)
+			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
+		}
+	}
+
+	igt_describe(&quot;Test-GPU-reset-by-sdma-slow-linear-copy-with-jobs&quot;);
+	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-sdma-slow-linear-copy&quot;) {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f(&quot;amdgpu-deadlock-sdma-slow-linear-copy&quot;)
+			amdgpu_hang_sdma_helper(device, DMA_SLOW_LINEARCOPY_HANG);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 46180df2e..1a7eba9eb 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -110,7 +110,7 @@ amdgpu_bo_lcopy(amdgpu_device_handle device,
 
 	amdgpu_sdma_lcopy(ring_context-&gt;pm4, ring_context-&gt;bo_mc2,
 			ring_context-&gt;bo_mc, size, secure);
-	amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+	amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 	free(ring_context-&gt;pm4);
 }
 
@@ -155,7 +155,7 @@ amdgpu_bo_move(amdgpu_device_handle device, int fd,
 	 * it to the desired location.
 	 */
 	amdgpu_sdma_nop(ring_context-&gt;pm4, PACKET_NOP_SIZE);
-	amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context);
+	amdgpu_test_exec_cs_helper(device, ip_block-&gt;type, ring_context, 0);
 	free(ring_context-&gt;pm4);
 }
 
</pre>
    </blockquote>
  </body>
</html>

--------------ZAAeLrEpqbpH0vkfy7EwVTZk--
