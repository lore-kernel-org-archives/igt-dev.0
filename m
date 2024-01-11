Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8280810E8E7
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 20:32:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------x2FEeMSnwBMtS87gH9mo3MmQ"
Message-ID: <82b68f58-a219-441e-b09f-cafa1185bd98@intel.com>
Date: Thu, 11 Jan 2024 12:32:43 -0800
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_store: don't pass gt_id as bind
 queue
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240111090152.296752-1-matthew.auld@intel.com>
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240111090152.296752-1-matthew.auld@intel.com>
MIME-Version: 1.0
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

--------------x2FEeMSnwBMtS87gH9mo3MmQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 1/11/2024 1:01 AM, Matthew Auld wrote:
> The gt_id of the engine is not a valid bind queue. Typically it is zero
> so we likely don't notice anything, but that might not always be the
> case.
>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Jagmeet Randhawa<jagmeet.randhawa@intel.com>
> ---
>   tests/intel/xe_exec_store.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 870394d3c..3ec84295b 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -217,7 +217,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>   		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
>   								    bo_size, 0,
>   								    ALLOC_STRATEGY_LOW_TO_HIGH);
> -		xe_vm_bind_async(fd, vm, eci->gt_id, bo[i], 0, dst_offset[i], bo_size, sync, 1);
> +		xe_vm_bind_async(fd, vm, 0, bo[i], 0, dst_offset[i], bo_size, sync, 1);
>   	}
>   
>   	batch_map = xe_bo_map(fd, bo[i-1], bo_size);
> @@ -303,7 +303,7 @@ static void persistent(int fd)
>   			      vram_if_possible(fd, engine->instance.gt_id),
>   			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>   
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, sd_batch, 0, addr, batch_size, &sync, 1);
> +	xe_vm_bind_async(fd, vm, 0, sd_batch, 0, addr, batch_size, &sync, 1);
>   	sd_data = xe_bo_map(fd, sd_batch, batch_size);
>   	prt_data = xe_bo_map(fd, prt_batch, batch_size);
>   

Reviewed-by: Jagmeet Randhawa<jagmeet.randhawa@intel.com>

--------------x2FEeMSnwBMtS87gH9mo3MmQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/11/2024 1:01 AM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240111090152.296752-1-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The gt_id of the engine is not a valid bind queue. Typically it is zero
so we likely don't notice anything, but that might not always be the
case.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a>
---
 tests/intel/xe_exec_store.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 870394d3c..3ec84295b 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -217,7 +217,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								    bo_size, 0,
 								    ALLOC_STRATEGY_LOW_TO_HIGH);
-		xe_vm_bind_async(fd, vm, eci-&gt;gt_id, bo[i], 0, dst_offset[i], bo_size, sync, 1);
+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, dst_offset[i], bo_size, sync, 1);
 	}
 
 	batch_map = xe_bo_map(fd, bo[i-1], bo_size);
@@ -303,7 +303,7 @@ static void persistent(int fd)
 			      vram_if_possible(fd, engine-&gt;instance.gt_id),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, engine-&gt;instance.gt_id, sd_batch, 0, addr, batch_size, &amp;sync, 1);
+	xe_vm_bind_async(fd, vm, 0, sd_batch, 0, addr, batch_size, &amp;sync, 1);
 	sd_data = xe_bo_map(fd, sd_batch, batch_size);
 	prt_data = xe_bo_map(fd, prt_batch, batch_size);
 </pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by: </span>Jagmeet Randhawa <a class="moz-txt-link-rfc2396E" href="mailto:jagmeet.randhawa@intel.com">&lt;jagmeet.randhawa@intel.com&gt;</a></pre>
    <blockquote type="cite" cite="mid:20240111090152.296752-1-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------x2FEeMSnwBMtS87gH9mo3MmQ--
