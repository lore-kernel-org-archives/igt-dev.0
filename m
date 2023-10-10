Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDE010E3B1
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 17:48:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------UW9pFBOs0ZLCm0AO0fq0T6so"
Message-ID: <00e82dce-720f-43ba-b9d6-556589b32170@amd.com>
Date: Tue, 10 Oct 2023 13:48:39 -0400
To: Jesse Zhang <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20231010065001.1785964-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20231010065001.1785964-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amd_dispatch: add negative test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------UW9pFBOs0ZLCm0AO0fq0T6so
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jesse,

Please ,add to the commit message as below.

The change looks good to me.

Reviewed-by : Vitaly Prosyak <vitaly.prosyak@amd.com>

--

Thanks, Vitaly

On 2023-10-10 02:50, Jesse Zhang wrote:
> Dispatch a bad program on gfx/compute ring.
> Check wether they will hang.
Expose the additional parameter 'hung' to the upper layer.

Dispatch existent a binary shader that waits for the register to be changed, 

but it does not occur and as a result, we have GPU reset and check this.

Improve test description.

>
> V2:
>   -add detail description and fix code style(Kamil)
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/amdgpu/amd_dispatch.c   |  4 ++--
>  lib/amdgpu/amd_dispatch.h   |  2 +-
>  tests/amdgpu/amd_dispatch.c | 38 ++++++++++++++++++++++++++++++++-----
>  3 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index 9de3986ba..040381a11 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -524,7 +524,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  	}
>  }
>  
> -void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type)
> +void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
>  {
>  	int r;
>  	struct drm_amdgpu_info_hw_ip info;
> @@ -547,7 +547,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
>  		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
>  					    version);
>  		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
> -					    version, 0);
> +					    version, hang);
>  	}
>  }
>  
> diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
> index c500b5b3f..4df8b1355 100644
> --- a/lib/amdgpu/amd_dispatch.h
> +++ b/lib/amdgpu/amd_dispatch.h
> @@ -27,7 +27,7 @@
>  #include <amdgpu.h>
>  
>  void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
> -			      uint32_t ip_type);
> +			      uint32_t ip_type, int hang);
>  
>  void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					uint32_t ip_type,
> diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
> index 769f26cd0..323284306 100644
> --- a/tests/amdgpu/amd_dispatch.c
> +++ b/tests/amdgpu/amd_dispatch.c
> @@ -24,6 +24,18 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
>  	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
>  }
>  
> +static void
> +amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
> +{
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 1);
> +}
> +
> +static void
> +amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
> +{
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
> +}
> +
>  static void
>  amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
>  {
> @@ -54,8 +66,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
>  	r = amdgpu_cs_ctx_free(context_handle);
>  	igt_assert_eq(r, 0);
>  
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
> -	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
> +	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
>  }
>  
>  igt_main
> @@ -85,7 +97,7 @@ igt_main
>  		asic_rings_readness(device, 1, arr_cap);
>  
>  	}
> -	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring");
> +	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
>  		if (arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-dispatch-test-compute")
> @@ -93,7 +105,7 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-gfx-ring");
> +	igt_describe("Test GPU reset using a binary shader to slow hang the job on gfx ring");
>  	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
>  		if (arr_cap[AMD_IP_GFX]) {
>  			igt_dynamic_f("amdgpu-dispatch-test-gfx")
> @@ -101,7 +113,23 @@ igt_main
>  		}
>  	}
>  
> -	igt_describe("Test-GPU-reset-using-amdgpu-debugfs-to-hang-the-job-on-gfx-ring");
> +	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
> +			amdgpu_dispatch_hang_gfx(device);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
> +	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
> +			amdgpu_dispatch_hang_compute(device);
> +		}
> +	}
> +
> +	igt_describe("Test GPU reset using amdgpu debugfs to hang the job on gfx ring");
>  	igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE") {
>  		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
>  			igt_dynamic_f("amdgpu-reset-gfx-compute")
--------------UW9pFBOs0ZLCm0AO0fq0T6so
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jesse,</p>
    <p>Please ,add to the commit message as below.</p>
    <p>The change looks good to me.<br>
    </p>
    <p><span style="white-space: pre-wrap">Reviewed-by : Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:luben.tuikov@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
</span></p>
    <p><span style="white-space: pre-wrap">--</span></p>
    <p><span style="white-space: pre-wrap">Thanks, Vitaly
</span></p>
    <p></p>
    <p></p>
    On 2023-10-10 02:50, Jesse Zhang wrote:<br>
    <blockquote type="cite" cite="mid:20231010065001.1785964-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">Dispatch a bad program on gfx/compute ring.
Check wether they will hang.</pre>
    </blockquote>
    Expose the additional parameter 'hung' to the upper layer.<br>
    <p>Dispatch existent a binary shader that waits for the register to
      be changed,&nbsp;</p>
    <p>but it does not occur and as a result, we have GPU reset and
      check this.</p>
    <p>Improve test description.<br>
    </p>
    <blockquote type="cite" cite="mid:20231010065001.1785964-1-jesse.zhang@amd.com">
      <pre class="moz-quote-pre" wrap="">

V2:
  -add detail description and fix code style(Kamil)

Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: Luben Tuikov <a class="moz-txt-link-rfc2396E" href="mailto:luben.tuikov@amd.com">&lt;luben.tuikov@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Cc: Christian Koenig <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
---
 lib/amdgpu/amd_dispatch.c   |  4 ++--
 lib/amdgpu/amd_dispatch.h   |  2 +-
 tests/amdgpu/amd_dispatch.c | 38 ++++++++++++++++++++++++++++++++-----
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 9de3986ba..040381a11 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -524,7 +524,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 }
 
-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
 {
 	int r;
 	struct drm_amdgpu_info_hw_ip info;
@@ -547,7 +547,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
 					    version);
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
-					    version, 0);
+					    version, hang);
 	}
 }
 
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index c500b5b3f..4df8b1355 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -27,7 +27,7 @@
 #include &lt;amdgpu.h&gt;
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-			      uint32_t ip_type);
+			      uint32_t ip_type, int hang);
 
 void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					uint32_t ip_type,
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 769f26cd0..323284306 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -24,6 +24,18 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
 	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
 }
 
+static void
+amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
+{
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 1);
+}
+
+static void
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
+{
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
+}
+
 static void
 amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
 {
@@ -54,8 +66,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
 	r = amdgpu_cs_ctx_free(context_handle);
 	igt_assert_eq(r, 0);
 
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
 }
 
 igt_main
@@ -85,7 +97,7 @@ igt_main
 		asic_rings_readness(device, 1, arr_cap);
 
 	}
-	igt_describe(&quot;Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring&quot;);
+	igt_describe(&quot;Test GPU reset using a binary shader to slow hang the job on compute ring&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-dispatch-test-compute-with-IP-COMPUTE&quot;) {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f(&quot;amdgpu-dispatch-test-compute&quot;)
@@ -93,7 +105,7 @@ igt_main
 		}
 	}
 
-	igt_describe(&quot;Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-gfx-ring&quot;);
+	igt_describe(&quot;Test GPU reset using a binary shader to slow hang the job on gfx ring&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-dispatch-test-gfx-with-IP-GFX&quot;) {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f(&quot;amdgpu-dispatch-test-gfx&quot;)
@@ -101,7 +113,23 @@ igt_main
 		}
 	}
 
-	igt_describe(&quot;Test-GPU-reset-using-amdgpu-debugfs-to-hang-the-job-on-gfx-ring&quot;);
+	igt_describe(&quot;Test GPU reset using a binary shader to hang the job on gfx ring&quot;);
+	igt_subtest_with_dynamic(&quot;amdgpu-dispatch-hang-test-gfx-with-IP-GFX&quot;) {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f(&quot;amdgpu-dispatch-hang-test-gfx&quot;)
+			amdgpu_dispatch_hang_gfx(device);
+		}
+	}
+
+	igt_describe(&quot;Test GPU reset using a binary shader to hang the job on compute ring&quot;);
+	igt_subtest_with_dynamic(&quot;amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE&quot;) {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f(&quot;amdgpu-dispatch-hang-test-compute&quot;)
+			amdgpu_dispatch_hang_compute(device);
+		}
+	}
+
+	igt_describe(&quot;Test GPU reset using amdgpu debugfs to hang the job on gfx ring&quot;);
 	igt_subtest_with_dynamic(&quot;amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE&quot;) {
 		if (arr_cap[AMD_IP_GFX] &amp;&amp; arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f(&quot;amdgpu-reset-gfx-compute&quot;)
</pre>
    </blockquote>
  </body>
</html>

--------------UW9pFBOs0ZLCm0AO0fq0T6so--
