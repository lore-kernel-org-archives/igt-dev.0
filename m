Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350E710E319
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 19:04:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------0X0XIyL6ke8iOL90Pp5jDBKm"
Message-ID: <4c1d25be-8db4-46af-af23-58ab85888afc@amd.com>
Date: Tue, 17 Oct 2023 15:04:11 -0400
Content-Language: en-US
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231017063113.4156984-1-jesse.zhang@amd.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231017063113.4156984-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amd_dispatch: add negative test
 for SDMA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Tim Huang <tim.huang@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------0X0XIyL6ke8iOL90Pp5jDBKm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jesse,

Please, find inline below.

Thanks, Vitaly

On 2023-10-17 02:31, Jesse Zhang wrote:
> Issue corrupted header or slow sdma linear copy
> to trigger SDMA hang test.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Tim Huang <tim.huang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 144 ++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_deadlock_helpers.h |   4 +
>  tests/amdgpu/amd_deadlock.c       |  26 ++++--
>  3 files changed, 169 insertions(+), 5 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index a6be5f02a..4f450fbcc 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -248,3 +248,147 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
>  	free_cmd_base(base_cmd);
>  	amdgpu_cs_ctx_free(context_handle);
>  }

Please, use 'unsigned int' or uint32_t vs 'unsigned' .

It generates some warning on latest gcc.

We still have some places where it is not removed yet, but if you add a new function ,please, do not use just 'unsigned'.

> +
> +void
> +amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, unsigned hang_type)
> +{
> +	const int sdma_write_length = 1024;
> +	amdgpu_context_handle context_handle;
> +	amdgpu_bo_handle ib_result_handle;
> +	amdgpu_bo_handle bo1, bo2;
> +	amdgpu_bo_handle resources[3];
> +	amdgpu_bo_list_handle bo_list;
> +	void *ib_result_cpu;
> +	struct amdgpu_cs_ib_info ib_info;
> +	struct amdgpu_cs_request ibs_request;
> +	struct amdgpu_cs_fence fence_status;
> +	uint64_t bo1_mc, bo2_mc;
> +	uint64_t ib_result_mc_address;
> +	volatile unsigned char *bo1_cpu, *bo2_cpu;
> +	amdgpu_va_handle bo1_va_handle, bo2_va_handle;
> +	amdgpu_va_handle va_handle;
> +	struct drm_amdgpu_info_hw_ip hw_ip_info;
> +	int i, j, r;
> +	uint32_t expired, ib_size;
> +	uint32_t *ptr;
> +
> +	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &hw_ip_info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +	if (hang_type == DMA_CORRUPTED_HEADER_HANG)
> +		ib_size = 4096;
> +	else
> +		ib_size = 4096 * 0x20000;
> +
> +	r = amdgpu_bo_alloc_and_map(device_handle, ib_size, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT, 0,
> +				    &ib_result_handle, &ib_result_cpu,
> +				    &ib_result_mc_address, &va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map(device_handle,
> +				    sdma_write_length, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT,
> +				    0, &bo1,
> +				    (void**)&bo1_cpu, &bo1_mc,
> +				    &bo1_va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* set bo1 */
> +	memset((void*)bo1_cpu, 0xaa, sdma_write_length);
> +
> +	/* allocate UC bo2 for sDMA use */
> +	r = amdgpu_bo_alloc_and_map(device_handle,
> +				    sdma_write_length, 4096,
> +				    AMDGPU_GEM_DOMAIN_GTT,
> +				    0, &bo2,
> +				    (void**)&bo2_cpu, &bo2_mc,
> +				    &bo2_va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* clear bo2 */
> +	memset((void*)bo2_cpu, 0, sdma_write_length);
> +
> +	resources[0] = bo1;
> +	resources[1] = bo2;
> +	resources[2] = ib_result_handle;
> +	r = amdgpu_bo_list_create(device_handle, 3,
> +				  resources, NULL, &bo_list);
> +
> +	/* fulfill PM4: with bad copy linear header */
> +	ptr = ib_result_cpu;
> +	i = 0;
> +	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
> +		ptr[i++] = 0x23decd3d;
> +		ptr[i++] = sdma_write_length - 1;
> +		ptr[i++] = 0;
> +		ptr[i++] = 0xffffffff & bo1_mc;
> +		ptr[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
> +		ptr[i++] = 0xffffffff & bo2_mc;
> +		ptr[i++] = (0xffffffff00000000 & bo2_mc) >> 32;
> +	} else {

Please, use function 'sdma_ring_copy_linear' from amd_ip_blocks.c .

By our IGT design we would like to avoid ASIC(SDMA in this context) dependent packet creation  at top layer,

you can use 'static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs' or introduce the new function if necessary.

If function 'sdma_ring_copy_linear' does not fit , you can use another approach in following form , for example:

base_cmd->emit(base_cmd, (ib_result_mc_address ...) & 0xfffffffc);

It is available in amd_deadlock_helpers.c

> +		for (j = 1; j < 0x20000; j++) {
> +			ptr[i++] = 0x1;
> +			ptr[i++] = sdma_write_length - 1;
> +			ptr[i++] = 0;
> +			ptr[i++] = 0xffffffff & bo1_mc;
> +			ptr[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
> +			ptr[i++] = 0xffffffff & bo2_mc;
> +			ptr[i++] = (0xffffffff00000000 & bo2_mc) >> 32;
> +			ptr[i++] = 0x1;
> +			ptr[i++] = sdma_write_length - 1;
> +			ptr[i++] = 0;
> +			ptr[i++] = 0xffffffff & bo2_mc;
> +			ptr[i++] = (0xffffffff00000000 & bo2_mc) >> 32;
> +			ptr[i++] = 0xffffffff & bo1_mc;
> +			ptr[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
> +		}
> +	}
> +
> +	/* exec command */
> +	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
> +	ib_info.ib_mc_address = ib_result_mc_address;
> +	ib_info.size = i;
> +
> +	memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
> +	ibs_request.ip_type = AMDGPU_HW_IP_DMA;
> +	ibs_request.ring = 0;
> +	ibs_request.number_of_ibs = 1;
> +	ibs_request.ibs = &ib_info;
> +	ibs_request.resources = bo_list;
> +	ibs_request.fence_info.handle = NULL;
> +
> +	r = amdgpu_cs_submit(context_handle, 0, &ibs_request, 1);
> +	igt_assert_eq(r, 0);
> +
> +	memset(&fence_status, 0, sizeof(struct amdgpu_cs_fence));
> +	fence_status.context = context_handle;
> +	fence_status.ip_type = AMDGPU_HW_IP_DMA;
> +	fence_status.ip_instance = 0;
> +	fence_status.ring = 0;
> +	fence_status.fence = ibs_request.seq_no;
> +
> +	r = amdgpu_cs_query_fence_status(&fence_status,
> +					 AMDGPU_TIMEOUT_INFINITE,
> +					 0, &expired);
> +	if (r != 0 && r != -ECANCELED && r != -ETIME)
> +		igt_assert(0);
> +
> +	r = amdgpu_bo_list_destroy(bo_list);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
> +				     ib_result_mc_address, 4096);
> +
> +	amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
> +				     sdma_write_length);
> +
> +	amdgpu_bo_unmap_and_free(bo2, bo2_va_handle, bo2_mc,
> +				     sdma_write_length);
> +	/* end of test */
> +	r = amdgpu_cs_ctx_free(context_handle);
> +	igt_assert_eq(r, 0);
> +}
> diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
> index cc8eba7f7..3ce74dae7 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.h
> +++ b/lib/amdgpu/amd_deadlock_helpers.h
> @@ -24,11 +24,15 @@
>  #ifndef __AMD_DEADLOCK_HELPERS_H__
>  #define __AMD_DEADLOCK_HELPERS_H__
>  
Please, use enum vs defines.
> +#define DMA_CORRUPTED_HEADER_HANG	1
> +#define DMA_SLOW_LINEARCOPY_HANG	2
>  void
>  amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
>  
>  void
>  bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
>  
> +void
> +amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, unsigned hang_type);
>  #endif
>  
> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
> index 6147b7636..9f799a4a7 100644
> --- a/tests/amdgpu/amd_deadlock.c
> +++ b/tests/amdgpu/amd_deadlock.c
> @@ -36,7 +36,7 @@ igt_main
>  		asic_rings_readness(device, 1, arr_cap);
>  
>  	}

Are you sure that we can remove '-' between words in 'igt_describe' macro?

I think, IGT can complain when there is test failure about invalid characters.
> -	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
> +	igt_describe("Test GPU reset by flooding sdma ring with jobs");
>  	igt_subtest_with_dynamic("amdgpu-deadlock-sdma") {
>  		if (arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("amdgpu-deadlock-sdma")
> @@ -44,7 +44,7 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
> +	igt_describe("Test GPU reset by access gfx illegal reg");
>  	igt_subtest_with_dynamic("amdgpu-gfx-illegal-reg-access") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-illegal-reg-access")
> @@ -52,7 +52,7 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
> +	igt_describe("Test GPU reset by access gfx illegal mem addr");
>  	igt_subtest_with_dynamic("amdgpu-gfx-illegal-mem-access") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-illegal-mem-access")
> @@ -61,7 +61,7 @@ igt_main
>  	}
>  
>  
> -	igt_describe("Test-GPU-reset-by-flooding-gfx-ring-with-jobs");
> +	igt_describe("Test GPU reset by flooding gfx ring with jobs");
>  	igt_subtest_with_dynamic("amdgpu-deadlock-gfx") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-deadlock-gfx")
> @@ -69,7 +69,7 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
> +	igt_describe("Test GPU reset by flooding compute ring with jobs");
>  	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-deadlock-compute")
> @@ -77,6 +77,22 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("Test GPU reset by sdma corrupted header with jobs");
> +	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-test") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
> +			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset by sdma slow linear copy with jobs");
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
--------------0X0XIyL6ke8iOL90Pp5jDBKm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jesse,</p>
    <p>Please, find inline below.</p>
    <p>Thanks, Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2023-10-17 02:31, Jesse Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231017063113.4156984-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">Issue corrupted header or slow sdma linear copy
to trigger SDMA hang test.

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>
Signed-off-by: Tim Huang <a class="moz-txt-link-rfc2396E" href="mailto:tim.huang@amd.com">&lt;tim.huang@amd.com&gt;</a>
---
 lib/amdgpu/amd_deadlock_helpers.c | 144 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |   4 +
 tests/amdgpu/amd_deadlock.c       |  26 ++++--
 3 files changed, 169 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index a6be5f02a..4f450fbcc 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -248,3 +248,147 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	free_cmd_base(base_cmd);
 	amdgpu_cs_ctx_free(context_handle);
 }</pre>
    </blockquote>
    <p>Please, use 'unsigned int' or uint32_t vs 'unsigned' .</p>
    <p>It generates some warning on latest gcc.</p>
    <p>We still have some places where it is not removed yet, but if you
      add a new function ,please, do not use just 'unsigned'.<br>
    </p>
    <blockquote type="cite" cite="mid:20231017063113.4156984-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, unsigned hang_type)
+{
+	const int sdma_write_length = 1024;
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle ib_result_handle;
+	amdgpu_bo_handle bo1, bo2;
+	amdgpu_bo_handle resources[3];
+	amdgpu_bo_list_handle bo_list;
+	void *ib_result_cpu;
+	struct amdgpu_cs_ib_info ib_info;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_fence fence_status;
+	uint64_t bo1_mc, bo2_mc;
+	uint64_t ib_result_mc_address;
+	volatile unsigned char *bo1_cpu, *bo2_cpu;
+	amdgpu_va_handle bo1_va_handle, bo2_va_handle;
+	amdgpu_va_handle va_handle;
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
+	int i, j, r;
+	uint32_t expired, ib_size;
+	uint32_t *ptr;
+
+	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &amp;hw_ip_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_cs_ctx_create(device_handle, &amp;context_handle);
+	igt_assert_eq(r, 0);
+
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG)
+		ib_size = 4096;
+	else
+		ib_size = 4096 * 0x20000;
+
+	r = amdgpu_bo_alloc_and_map(device_handle, ib_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &amp;ib_result_handle, &amp;ib_result_cpu,
+				    &amp;ib_result_mc_address, &amp;va_handle);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				    sdma_write_length, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT,
+				    0, &amp;bo1,
+				    (void**)&amp;bo1_cpu, &amp;bo1_mc,
+				    &amp;bo1_va_handle);
+	igt_assert_eq(r, 0);
+
+	/* set bo1 */
+	memset((void*)bo1_cpu, 0xaa, sdma_write_length);
+
+	/* allocate UC bo2 for sDMA use */
+	r = amdgpu_bo_alloc_and_map(device_handle,
+				    sdma_write_length, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT,
+				    0, &amp;bo2,
+				    (void**)&amp;bo2_cpu, &amp;bo2_mc,
+				    &amp;bo2_va_handle);
+	igt_assert_eq(r, 0);
+
+	/* clear bo2 */
+	memset((void*)bo2_cpu, 0, sdma_write_length);
+
+	resources[0] = bo1;
+	resources[1] = bo2;
+	resources[2] = ib_result_handle;
+	r = amdgpu_bo_list_create(device_handle, 3,
+				  resources, NULL, &amp;bo_list);
+
+	/* fulfill PM4: with bad copy linear header */
+	ptr = ib_result_cpu;
+	i = 0;
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
+		ptr[i++] = 0x23decd3d;
+		ptr[i++] = sdma_write_length - 1;
+		ptr[i++] = 0;
+		ptr[i++] = 0xffffffff &amp; bo1_mc;
+		ptr[i++] = (0xffffffff00000000 &amp; bo1_mc) &gt;&gt; 32;
+		ptr[i++] = 0xffffffff &amp; bo2_mc;
+		ptr[i++] = (0xffffffff00000000 &amp; bo2_mc) &gt;&gt; 32;
+	} else {</pre>
    </blockquote>
    <p>Please, use function 'sdma_ring_copy_linear' from amd_ip_blocks.c
      .</p>
    <p>By our IGT design we would like to avoid ASIC(SDMA in this
      context) dependent packet creation&nbsp; at top layer,</p>
    <p>you can use 'static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs' or
      introduce the new function if necessary.</p>
    <p>If function 'sdma_ring_copy_linear' does not fit , you can use
      another approach in following form , for example: <br>
    </p>
    <p>base_cmd-&gt;emit(base_cmd, (ib_result_mc_address ...) &amp;
      0xfffffffc);</p>
    <p>It is available in amd_deadlock_helpers.c<br>
    </p>
    <blockquote type="cite" cite="mid:20231017063113.4156984-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+		for (j = 1; j &lt; 0x20000; j++) {
+			ptr[i++] = 0x1;
+			ptr[i++] = sdma_write_length - 1;
+			ptr[i++] = 0;
+			ptr[i++] = 0xffffffff &amp; bo1_mc;
+			ptr[i++] = (0xffffffff00000000 &amp; bo1_mc) &gt;&gt; 32;
+			ptr[i++] = 0xffffffff &amp; bo2_mc;
+			ptr[i++] = (0xffffffff00000000 &amp; bo2_mc) &gt;&gt; 32;
+			ptr[i++] = 0x1;
+			ptr[i++] = sdma_write_length - 1;
+			ptr[i++] = 0;
+			ptr[i++] = 0xffffffff &amp; bo2_mc;
+			ptr[i++] = (0xffffffff00000000 &amp; bo2_mc) &gt;&gt; 32;
+			ptr[i++] = 0xffffffff &amp; bo1_mc;
+			ptr[i++] = (0xffffffff00000000 &amp; bo1_mc) &gt;&gt; 32;
+		}
+	}
+
+	/* exec command */
+	memset(&amp;ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = i;
+
+	memset(&amp;ibs_request, 0, sizeof(struct amdgpu_cs_request));
+	ibs_request.ip_type = AMDGPU_HW_IP_DMA;
+	ibs_request.ring = 0;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &amp;ib_info;
+	ibs_request.resources = bo_list;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_cs_submit(context_handle, 0, &amp;ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	memset(&amp;fence_status, 0, sizeof(struct amdgpu_cs_fence));
+	fence_status.context = context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_DMA;
+	fence_status.ip_instance = 0;
+	fence_status.ring = 0;
+	fence_status.fence = ibs_request.seq_no;
+
+	r = amdgpu_cs_query_fence_status(&amp;fence_status,
+					 AMDGPU_TIMEOUT_INFINITE,
+					 0, &amp;expired);
+	if (r != 0 &amp;&amp; r != -ECANCELED &amp;&amp; r != -ETIME)
+		igt_assert(0);
+
+	r = amdgpu_bo_list_destroy(bo_list);
+	igt_assert_eq(r, 0);
+
+	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
+				     ib_result_mc_address, 4096);
+
+	amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
+				     sdma_write_length);
+
+	amdgpu_bo_unmap_and_free(bo2, bo2_va_handle, bo2_mc,
+				     sdma_write_length);
+	/* end of test */
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+}
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index cc8eba7f7..3ce74dae7 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -24,11 +24,15 @@
 #ifndef __AMD_DEADLOCK_HELPERS_H__
 #define __AMD_DEADLOCK_HELPERS_H__
 </pre>
    </blockquote>
    Please, use enum vs defines.<br>
    <blockquote type="cite" cite="mid:20231017063113.4156984-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+#define DMA_CORRUPTED_HEADER_HANG	1
+#define DMA_SLOW_LINEARCOPY_HANG	2
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned ip_type);
 
 void
 bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned ip_type);
 
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, unsigned hang_type);
 #endif
 
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 6147b7636..9f799a4a7 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -36,7 +36,7 @@ igt_main
 		asic_rings_readness(device, 1, arr_cap);
 
 	}</pre>
    </blockquote>
    <p>Are you sure that we can remove '-' between words in
      'igt_describe' macro?</p>
    I think, IGT can complain when <span style="white-space: pre-wrap">there is test failure about invalid characters.
</span>
    <blockquote type="cite" cite="mid:20231017063113.4156984-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">-	igt_describe(&quot;Test-GPU-reset-by-flooding-sdma-ring-with-jobs&quot;);
+	igt_describe(&quot;Test GPU reset by flooding sdma ring with jobs&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-sdma&quot;) {
 		if (arr_cap[AMD_IP_DMA]) {
 			igt_dynamic_f(&quot;amdgpu-deadlock-sdma&quot;)
@@ -44,7 +44,7 @@ igt_main
 		}
 	}
 
-	igt_describe(&quot;Test-GPU-reset-by-access-gfx-illegal-reg&quot;);
+	igt_describe(&quot;Test GPU reset by access gfx illegal reg&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-gfx-illegal-reg-access&quot;) {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f(&quot;amdgpu-illegal-reg-access&quot;)
@@ -52,7 +52,7 @@ igt_main
 		}
 	}
 
-	igt_describe(&quot;Test-GPU-reset-by-access-gfx-illegal-mem-addr&quot;);
+	igt_describe(&quot;Test GPU reset by access gfx illegal mem addr&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-gfx-illegal-mem-access&quot;) {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f(&quot;amdgpu-illegal-mem-access&quot;)
@@ -61,7 +61,7 @@ igt_main
 	}
 
 
-	igt_describe(&quot;Test-GPU-reset-by-flooding-gfx-ring-with-jobs&quot;);
+	igt_describe(&quot;Test GPU reset by flooding gfx ring with jobs&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-gfx&quot;) {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f(&quot;amdgpu-deadlock-gfx&quot;)
@@ -69,7 +69,7 @@ igt_main
 		}
 	}
 
-	igt_describe(&quot;Test-GPU-reset-by-flooding-compute-ring-with-jobs&quot;);
+	igt_describe(&quot;Test GPU reset by flooding compute ring with jobs&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-compute&quot;) {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f(&quot;amdgpu-deadlock-compute&quot;)
@@ -77,6 +77,22 @@ igt_main
 		}
 	}
 
+	igt_describe(&quot;Test GPU reset by sdma corrupted header with jobs&quot;);
+	igt_subtest_with_dynamic(&quot;amdgpu-deadlock-sdma-corrupted-header-test&quot;) {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f(&quot;amdgpu-deadlock-sdma-corrupted-header-test&quot;)
+			amdgpu_hang_sdma_helper(device, DMA_CORRUPTED_HEADER_HANG);
+		}
+	}
+
+	igt_describe(&quot;Test GPU reset by sdma slow linear copy with jobs&quot;);
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
</pre>
    </blockquote>
  </body>
</html>

--------------0X0XIyL6ke8iOL90Pp5jDBKm--
