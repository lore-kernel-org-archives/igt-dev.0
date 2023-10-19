Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5225E10E095
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 02:39:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------wxFcNEVulzNnAhF3klE0dOKW"
Message-ID: <ea01dc87-ca55-4217-9e7f-226e6bd4500d@amd.com>
Date: Wed, 18 Oct 2023 22:39:37 -0400
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231018053336.107138-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231018053336.107138-1-jesse.zhang@amd.com>
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

--------------wxFcNEVulzNnAhF3klE0dOKW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jesse,

It looks much better now, thanks!

I tested locally your patch.

There are some formatting issues , for example:

vprosyak@desktop-host:~/src/igt-gpu-tools$ ../linux/scripts/checkpatch.pl -f --no-tree /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c
WARNING: Use of volatile is usually wrong: see Documentation/process/volatile-considered-harmful.rst
#267: FILE: /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:267:
+    volatile unsigned char *bo1_cpu, *bo2_cpu;

ERROR: "(foo**)" should be "(foo **)"
#296: FILE: /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:296:
+                    (void**)&bo1_cpu, &bo1_mc,

ERROR: "(foo*)" should be "(foo *)"
#301: FILE: /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:301:
+    memset((void*)bo1_cpu, 0xaa, sdma_write_length);

ERROR: "(foo**)" should be "(foo **)"
#308: FILE: /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:308:
+                    (void**)&bo2_cpu, &bo2_mc,

ERROR: "(foo*)" should be "(foo *)"
#313: FILE: /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:313:
+    memset((void*)bo2_cpu, 0, sdma_write_length);

total: 4 errors, 1 warnings, 398 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

/home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c has style problems, please review.


I still have some comments to be addressed see below

Thanks, Vitaly

On 2023-10-18 01:33, Jesse Zhang wrote:
> Issue corrupted header or slow sdma linear copy
> to trigger SDMA hang test.
>
> V2:
>   - avoid generating warning,
>     and optimize logical code (Vitlaly)
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
>  lib/amdgpu/amd_deadlock_helpers.c | 148 ++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_deadlock_helpers.h |   7 ++
>  tests/amdgpu/amd_deadlock.c       |  16 ++++
>  3 files changed, 171 insertions(+)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index a6be5f02a..8f2d63772 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -248,3 +248,151 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
>  	free_cmd_base(base_cmd);
>  	amdgpu_cs_ctx_free(context_handle);
>  }
> +
> +void
> +amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
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
> +	int j, r;
> +	uint32_t expired, ib_size;
> +	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
These 2 lines below are not required , 'hw_ip_info' is not used.
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
> +	base_cmd->attach_buf(base_cmd, ib_result_cpu, ib_size);

Can you use the following ASIC independent function :

sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,

              const struct amdgpu_ring_context *context,

              uint32_t *pm4_dw)

The existent example is into 'amdgpu_command_submission_copy_linear_helper'.


Then you need corrupt/overwrite header with value  '0x23decd3d' based on your proposal and the following function could be used:

static void
cmd_emit_at_offset(struct amdgpu_cmd_base  *base, uint32_t value, uint32_t offset_dwords)

with appropriate comment.


> +	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
> +		base_cmd->emit(base_cmd, 0x23decd3d);
> +		base_cmd->emit(base_cmd, (sdma_write_length - 1));
> +		base_cmd->emit(base_cmd, 0);
> +		base_cmd->emit(base_cmd, (0xffffffff & bo1_mc));
> +		base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo1_mc) >> 32));
> +		base_cmd->emit(base_cmd, (0xffffffff & bo2_mc));
> +		base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo2_mc) >> 32));
> +	} else {
We can use also here sdma_ring_copy_linear in the loop
> +		for (j = 1; j < 0x20000; j++) {
> +			base_cmd->emit(base_cmd, SDMA_PACKET(SDMA_OPCODE_COPY,
> +						SDMA_COPY_SUB_OPCODE_LINEAR,
> +						0));
> +			base_cmd->emit(base_cmd, (sdma_write_length - 1));
> +			base_cmd->emit(base_cmd, 0);
> +			base_cmd->emit(base_cmd, (0xffffffff & bo1_mc));
> +			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo1_mc) >> 32));
> +			base_cmd->emit(base_cmd, (0xffffffff & bo2_mc));
> +			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo2_mc) >> 32));
> +			base_cmd->emit(base_cmd, SDMA_PACKET(SDMA_OPCODE_COPY,
> +						SDMA_COPY_SUB_OPCODE_LINEAR,
> +						0));
> +			base_cmd->emit(base_cmd, (sdma_write_length - 1));
> +			base_cmd->emit(base_cmd, 0);
> +			base_cmd->emit(base_cmd, (0xffffffff & bo2_mc));
> +			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo2_mc) >> 32));
> +			base_cmd->emit(base_cmd, (0xffffffff & bo1_mc));
> +			base_cmd->emit(base_cmd, ((0xffffffff00000000 & bo1_mc) >> 32));
> +		}
> +	}

The whole logic would be become much cleaner , like into 

void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,

                          const struct amdgpu_ip_block_version *ip_block)

We can use 'struct amdgpu_ring_context *ring_context;' and avoid multiple variable on the stack .


Using the approach mentioned above the code would become much cleaner even if the similar routine 'bad_access_helper' uses

'base_cmd->emit' has several custom operations that are not generic, and we do not currently have it as part of 'struct amdgpu_ip_func'

Also there is another change required (add return value)

from

void amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
                struct amdgpu_ring_context *ring_context)

to

*int* amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type,
                struct amdgpu_ring_context *ring_context)

and the return value could be checked  as following into existent logic.

 (r != 0 && r != -ECANCELED && r != -ETIME)


If the above approach cannot be implemented,  let me know then we can back to your existing logic.

> +
> +	/* exec command */
> +	memset(&ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
> +	ib_info.ib_mc_address = ib_result_mc_address;
> +	ib_info.size = base_cmd->cdw;
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
--------------wxFcNEVulzNnAhF3klE0dOKW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jesse,</p>
    <p>It looks much better now, thanks!</p>
    <p>I tested locally your patch.</p>
    <p>There are some formatting issues , for example:<br>
    </p>
    <p>vprosyak@desktop-host:~/src/igt-gpu-tools$
      ../linux/scripts/checkpatch.pl -f --no-tree
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c<br>
      WARNING: Use of volatile is usually wrong: see
      Documentation/process/volatile-considered-harmful.rst<br>
      #267: FILE:
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:267:<br>
      +&nbsp;&nbsp;&nbsp; volatile unsigned char *bo1_cpu, *bo2_cpu;<br>
      <br>
      ERROR: &quot;(foo**)&quot; should be &quot;(foo **)&quot;<br>
      #296: FILE:
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:296:<br>
      +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; (void**)&amp;bo1_cpu, &amp;bo1_mc,<br>
      <br>
      ERROR: &quot;(foo*)&quot; should be &quot;(foo *)&quot;<br>
      #301: FILE:
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:301:<br>
      +&nbsp;&nbsp;&nbsp; memset((void*)bo1_cpu, 0xaa, sdma_write_length);<br>
      <br>
      ERROR: &quot;(foo**)&quot; should be &quot;(foo **)&quot;<br>
      #308: FILE:
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:308:<br>
      +&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; (void**)&amp;bo2_cpu, &amp;bo2_mc,<br>
      <br>
      ERROR: &quot;(foo*)&quot; should be &quot;(foo *)&quot;<br>
      #313: FILE:
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c:313:<br>
      +&nbsp;&nbsp;&nbsp; memset((void*)bo2_cpu, 0, sdma_write_length);<br>
      <br>
      total: 4 errors, 1 warnings, 398 lines checked<br>
      <br>
      NOTE: For some of the reported defects, checkpatch may be able to<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mechanically convert to the typical style using --fix or
      --fix-inplace.<br>
      <br>
      /home/vprosyak/src/igt-gpu-tools/lib/amdgpu/amd_deadlock_helpers.c
      has style problems, please review.<br>
    </p>
    <p><br>
    </p>
    <p>I still have some comments to be addressed see below</p>
    <p>Thanks, Vitaly<br>
    </p>
    <div class="moz-cite-prefix">On 2023-10-18 01:33, Jesse Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231018053336.107138-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">Issue corrupted header or slow sdma linear copy
to trigger SDMA hang test.

V2:
  - avoid generating warning,
    and optimize logical code (Vitlaly)

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Luben Tuikov <a class="moz-txt-link-rfc2396E" href="mailto:luben.tuikov@amd.com">&lt;luben.tuikov@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:Jesse.Zhang@amd.com">&lt;Jesse.Zhang@amd.com&gt;</a>
Signed-off-by: Tim Huang <a class="moz-txt-link-rfc2396E" href="mailto:tim.huang@amd.com">&lt;tim.huang@amd.com&gt;</a>
---
 lib/amdgpu/amd_deadlock_helpers.c | 148 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_deadlock_helpers.h |   7 ++
 tests/amdgpu/amd_deadlock.c       |  16 ++++
 3 files changed, 171 insertions(+)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index a6be5f02a..8f2d63772 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -248,3 +248,151 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 	free_cmd_base(base_cmd);
 	amdgpu_cs_ctx_free(context_handle);
 }
+
+void
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
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
+	int j, r;
+	uint32_t expired, ib_size;
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
</pre>
    </blockquote>
    These 2 lines below are not required , 'hw_ip_info' is not used.<br>
    <blockquote type="cite" cite="mid:20231018053336.107138-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
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
+	base_cmd-&gt;attach_buf(base_cmd, ib_result_cpu, ib_size);</pre>
    </blockquote>
    <p>Can you use the following ASIC independent function :<br>
    </p>
    <p>sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,</p>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct amdgpu_ring_context *context,<br>
    <p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *pm4_dw)</p>
    <p>The existent example is into
      'amdgpu_command_submission_copy_linear_helper'.<br>
    </p>
    <p><br>
    </p>
    <p>Then you need corrupt/overwrite header with value&nbsp; <span style="white-space: pre-wrap">'0x23decd3d' based on your proposal and the following function could be used:</span></p>
    <p>static void<br>
      cmd_emit_at_offset(struct amdgpu_cmd_base&nbsp; *base, uint32_t value,
      uint32_t offset_dwords)</p>
    <p>with appropriate comment.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20231018053336.107138-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	if (hang_type == DMA_CORRUPTED_HEADER_HANG) {
+		base_cmd-&gt;emit(base_cmd, 0x23decd3d);
+		base_cmd-&gt;emit(base_cmd, (sdma_write_length - 1));
+		base_cmd-&gt;emit(base_cmd, 0);
+		base_cmd-&gt;emit(base_cmd, (0xffffffff &amp; bo1_mc));
+		base_cmd-&gt;emit(base_cmd, ((0xffffffff00000000 &amp; bo1_mc) &gt;&gt; 32));
+		base_cmd-&gt;emit(base_cmd, (0xffffffff &amp; bo2_mc));
+		base_cmd-&gt;emit(base_cmd, ((0xffffffff00000000 &amp; bo2_mc) &gt;&gt; 32));
+	} else {</pre>
    </blockquote>
    We can use also here sdma_ring_copy_linear in the loop<br>
    <blockquote type="cite" cite="mid:20231018053336.107138-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+		for (j = 1; j &lt; 0x20000; j++) {
+			base_cmd-&gt;emit(base_cmd, SDMA_PACKET(SDMA_OPCODE_COPY,
+						SDMA_COPY_SUB_OPCODE_LINEAR,
+						0));
+			base_cmd-&gt;emit(base_cmd, (sdma_write_length - 1));
+			base_cmd-&gt;emit(base_cmd, 0);
+			base_cmd-&gt;emit(base_cmd, (0xffffffff &amp; bo1_mc));
+			base_cmd-&gt;emit(base_cmd, ((0xffffffff00000000 &amp; bo1_mc) &gt;&gt; 32));
+			base_cmd-&gt;emit(base_cmd, (0xffffffff &amp; bo2_mc));
+			base_cmd-&gt;emit(base_cmd, ((0xffffffff00000000 &amp; bo2_mc) &gt;&gt; 32));
+			base_cmd-&gt;emit(base_cmd, SDMA_PACKET(SDMA_OPCODE_COPY,
+						SDMA_COPY_SUB_OPCODE_LINEAR,
+						0));
+			base_cmd-&gt;emit(base_cmd, (sdma_write_length - 1));
+			base_cmd-&gt;emit(base_cmd, 0);
+			base_cmd-&gt;emit(base_cmd, (0xffffffff &amp; bo2_mc));
+			base_cmd-&gt;emit(base_cmd, ((0xffffffff00000000 &amp; bo2_mc) &gt;&gt; 32));
+			base_cmd-&gt;emit(base_cmd, (0xffffffff &amp; bo1_mc));
+			base_cmd-&gt;emit(base_cmd, ((0xffffffff00000000 &amp; bo1_mc) &gt;&gt; 32));
+		}
+	}</pre>
    </blockquote>
    <p>The whole logic would be become much cleaner , like into&nbsp;</p>
    <p>void
      amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle
      device,</p>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; const struct amdgpu_ip_block_version
    *ip_block)<br>
    <p>We can use 'struct amdgpu_ring_context *ring_context;' and avoid
      multiple variable on the stack .<br>
    </p>
    <br>
    Using the approach mentioned above the code would become much
    cleaner even if the similar routine 'bad_access_helper' uses<br>
    <p>'base_cmd-&gt;emit' has several custom operations that are not
      generic, and we do not currently have it as part of 'struct
      amdgpu_ip_func'</p>
    <p>Also there is another change required (add return value) <br>
    </p>
    <p>from<br>
    </p>
    <p>void amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
      unsigned int ip_type,<br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; struct amdgpu_ring_context *ring_context)</p>
    <p>to <br>
    </p>
    <p><b>int</b> amdgpu_test_exec_cs_helper(amdgpu_device_handle
      device, unsigned int ip_type,<br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; struct amdgpu_ring_context *ring_context)</p>
    <p>and the return value could be checked&nbsp; as following into existent
      logic.<br>
    </p>
    <p>&nbsp;(r != 0 &amp;&amp; r != -ECANCELED &amp;&amp; r != -ETIME)</p>
    <p><br>
    </p>
    <p>If the above approach cannot be implemented,&nbsp; let me know then we
      can back to your existing logic.<br>
      <span style="white-space: pre-wrap"></span></p>
    <pre class="moz-quote-pre" wrap="">
</pre>
    <p></p>
    <p></p>
    <blockquote type="cite" cite="mid:20231018053336.107138-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">
+
+	/* exec command */
+	memset(&amp;ib_info, 0, sizeof(struct amdgpu_cs_ib_info));
+	ib_info.ib_mc_address = ib_result_mc_address;
+	ib_info.size = base_cmd-&gt;cdw;
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
</pre>
    </blockquote>
  </body>
</html>

--------------wxFcNEVulzNnAhF3klE0dOKW--
