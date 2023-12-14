Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730E10E872
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 01:57:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------K7lbbF70RvB6gmeh0YghN9R0"
Message-ID: <184356be-52d2-4450-9d04-683045319dd1@intel.com>
Date: Wed, 13 Dec 2023 17:57:44 -0800
Subject: Re: [PATCH i-g-t v6 5/5] tests/intel/xe_ccs: Add compression support
 for Lunarlake
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <cover.1702496855.git.akshata.jahagirdar@intel.com>
 <637f94bec53885ab6553e77eb538d02fb8f67f04.1702496856.git.akshata.jahagirdar@intel.com>
 <20231213090227.zmgvbt22zzkczj6t@zkempczy-mobl2>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20231213090227.zmgvbt22zzkczj6t@zkempczy-mobl2>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--------------K7lbbF70RvB6gmeh0YghN9R0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12/13/2023 1:02 AM, Zbigniew Kempczyński wrote:
> On Wed, Dec 13, 2023 at 11:55:09AM -0800, Akshata Jahagirdar wrote:
>> In XE2 IGFX platform, sysmem also participates in compression.
>> So create all blt objects in sysmem itself, and update the pat-index to reflect
>> the compression status. Since we need to align the buffer object size with page
>> size and also have the src size and dst size of CCS copy to be equal,
>> change the default width and height to 1024.
> To be honest 512 x 512 x 32bpp looks much more interesting. From my
> calculations:
>
> num_pages = 512 * 512 * 4 / 4096 -> 256
>
> 256 pages, 8B compression each gives 2048B so regardless page
> granularity this also should work. If not we need to fix the blt
> library.
>
> --
> Zbigniew

Hi, thank you for your comment.

In case of 512 x 512 x 32bpp that is the compressed blt object size.

the ccs size for this blt object = 512 * 512 * 4 / 512 = 2048

While creating the ccs bo of size 2048, it doesn't align properly with 
our page size, thats where the test fails.

Best,

Akshata

>> Signed-off-by: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 45 ++++++++++++++++++++++++++------------------
>>   1 file changed, 27 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index ac0805017..a780140fd 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -63,8 +63,8 @@ static struct param {
>>   	.write_png = false,
>>   	.print_bb = false,
>>   	.print_surface_info = false,
>> -	.width = 512,
>> -	.height = 512,
>> +	.width = 1024,
>> +	.height = 1024,
>>   };
>>   
>>   struct test_config {
>> @@ -99,17 +99,23 @@ static void surf_copy(int xe,
>>   	uint32_t *ccscopy;
>>   	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>>   	uint32_t sysmem = system_memory(xe);
>> +	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
>> +	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
>>   	int result;
>>   
>>   	igt_assert(mid->compression);
>> +	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
>> +		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
>> +		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>> +	}
>>   	ccscopy = (uint32_t *) malloc(ccssize);
>> -	ccs = xe_bo_create(xe, 0, ccssize, sysmem, 0);
>> -	ccs2 = xe_bo_create(xe, 0, ccssize, sysmem, 0);
>> +	ccs = xe_bo_create_caching(xe, 0, ccssize, sysmem, 0, cpu_caching);
>> +	ccs2 = xe_bo_create_caching(xe, 0, ccssize, sysmem, 0, cpu_caching);
>>   
>>   	blt_ctrl_surf_copy_init(xe, &surf);
>>   	surf.print_bb = param.print_bb;
>>   	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
>> -				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
>> +				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
>>   	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
>>   				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>>   	bb_size = xe_get_default_alignment(xe);
>> @@ -157,7 +163,7 @@ static void surf_copy(int xe,
>>   	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
>>   				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
>>   	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
>> -				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
>> +				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
>>   	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
>>   	intel_ctx_xe_sync(ctx, true);
>>   
>> @@ -234,10 +240,10 @@ static int blt_block_copy3(int xe,
>>   	igt_assert_f(blt3, "block-copy3 requires data to do blit\n");
>>   
>>   	alignment = xe_get_default_alignment(xe);
>> -	get_offset(ahnd, blt3->src.handle, blt3->src.size, alignment);
>> -	get_offset(ahnd, blt3->mid.handle, blt3->mid.size, alignment);
>> -	get_offset(ahnd, blt3->dst.handle, blt3->dst.size, alignment);
>> -	get_offset(ahnd, blt3->final.handle, blt3->final.size, alignment);
>> +	get_offset_pat_index(ahnd, blt3->src.handle, blt3->src.size, alignment, blt3->src.pat_index);
>> +	get_offset_pat_index(ahnd, blt3->mid.handle, blt3->mid.size, alignment, blt3->mid.pat_index);
>> +	get_offset_pat_index(ahnd, blt3->dst.handle, blt3->dst.size, alignment, blt3->dst.pat_index);
>> +	get_offset_pat_index(ahnd, blt3->final.handle, blt3->final.size, alignment, blt3->final.pat_index);
>>   	bb_offset = get_offset(ahnd, blt3->bb.handle, blt3->bb.size, alignment);
>>   
>>   	/* First blit src -> mid */
>> @@ -291,8 +297,9 @@ static void block_copy(int xe,
>>   	uint64_t bb_size = xe_get_default_alignment(xe);
>>   	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>>   	uint32_t run_id = mid_tiling;
>> -	uint32_t mid_region = region2, bb;
>> -	uint32_t width = param.width, height = param.height;
>> +	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>> +							!xe_has_vram(xe)) ? region1 : region2;
>> +	uint32_t width = param.width, height = param.height, bb;
>>   	enum blt_compression mid_compression = config->compression;
>>   	int mid_compression_format = param.compression_format;
>>   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
>> @@ -413,8 +420,9 @@ static void block_multicopy(int xe,
>>   	uint64_t bb_size = xe_get_default_alignment(xe);
>>   	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
>>   	uint32_t run_id = mid_tiling;
>> -	uint32_t mid_region = region2, bb;
>> -	uint32_t width = param.width, height = param.height;
>> +	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
>> +							!xe_has_vram(xe)) ? region1 : region2;
>> +	uint32_t width = param.width, height = param.height, bb;
>>   	enum blt_compression mid_compression = config->compression;
>>   	int mid_compression_format = param.compression_format;
>>   	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
>> @@ -539,8 +547,9 @@ static void block_copy_test(int xe,
>>   			region1 = igt_collection_get_value(regions, 0);
>>   			region2 = igt_collection_get_value(regions, 1);
>>   
>> -			/* Compressed surface must be in device memory */
>> -			if (config->compression && !XE_IS_VRAM_MEMORY_REGION(xe, region2))
>> +			/* if not XE2, then Compressed surface must be in device memory */
>> +			if (config->compression && !(AT_LEAST_GEN((intel_get_drm_devid(xe)), 20)) &&
>> +									!XE_IS_VRAM_MEMORY_REGION(xe, region2))
>>   				continue;
>>   
>>   			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
>> @@ -621,8 +630,8 @@ const char *help_str =
>>   	"  -p\tWrite PNG\n"
>>   	"  -s\tPrint surface info\n"
>>   	"  -t\tTiling format (0 - linear, 1 - XMAJOR, 2 - YMAJOR, 3 - TILE4, 4 - TILE64)\n"
>> -	"  -W\tWidth (default 512)\n"
>> -	"  -H\tHeight (default 512)"
>> +	"  -W\tWidth (default 1024)\n"
>> +	"  -H\tHeight (default 1024)"
>>   	;
>>   
>>   igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>> -- 
>> 2.34.1
>>
--------------K7lbbF70RvB6gmeh0YghN9R0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/13/2023 1:02 AM, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231213090227.zmgvbt22zzkczj6t@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">On Wed, Dec 13, 2023 at 11:55:09AM -0800, Akshata Jahagirdar wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In XE2 IGFX platform, sysmem also participates in compression.
So create all blt objects in sysmem itself, and update the pat-index to reflect
the compression status. Since we need to align the buffer object size with page
size and also have the src size and dst size of CCS copy to be equal,
change the default width and height to 1024.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
To be honest 512 x 512 x 32bpp looks much more interesting. From my
calculations:

num_pages = 512 * 512 * 4 / 4096 -&gt; 256

256 pages, 8B compression each gives 2048B so regardless page
granularity this also should work. If not we need to fix the blt
library.

--
Zbigniew
</pre>
    </blockquote>
    <p>Hi, thank you for your comment.</p>
    <p>In case of <span style="white-space: pre-wrap">512 x 512 x 32bpp that is the compressed blt object size. </span></p>
    <p><span style="white-space: pre-wrap">the ccs size for this blt object = 512 * 512 * 4 / 512 = 2048 </span></p>
    <p><span style="white-space: pre-wrap">While creating the ccs bo of size 2048, it doesn't align properly with our page size, thats where the test fails.</span></p>
    <p><span style="white-space: pre-wrap">Best,</span></p>
    <p><span style="white-space: pre-wrap">Akshata 
</span></p>
    <blockquote type="cite" cite="mid:20231213090227.zmgvbt22zzkczj6t@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>
---
 tests/intel/xe_ccs.c | 45 ++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index ac0805017..a780140fd 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -63,8 +63,8 @@ static struct param {
 	.write_png = false,
 	.print_bb = false,
 	.print_surface_info = false,
-	.width = 512,
-	.height = 512,
+	.width = 1024,
+	.height = 1024,
 };
 
 struct test_config {
@@ -99,17 +99,23 @@ static void surf_copy(int xe,
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	uint32_t sysmem = system_memory(xe);
+	uint8_t comp_pat_index = DEFAULT_PAT_INDEX;
+	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
 	int result;
 
 	igt_assert(mid-&gt;compression);
+	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &amp;&amp; mid-&gt;compression) {
+		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
+		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+	}
 	ccscopy = (uint32_t *) malloc(ccssize);
-	ccs = xe_bo_create(xe, 0, ccssize, sysmem, 0);
-	ccs2 = xe_bo_create(xe, 0, ccssize, sysmem, 0);
+	ccs = xe_bo_create_caching(xe, 0, ccssize, sysmem, 0, cpu_caching);
+	ccs2 = xe_bo_create_caching(xe, 0, ccssize, sysmem, 0, cpu_caching);
 
 	blt_ctrl_surf_copy_init(xe, &amp;surf);
 	surf.print_bb = param.print_bb;
 	blt_set_ctrl_surf_object(&amp;surf.src, mid-&gt;handle, mid-&gt;region, mid-&gt;size,
-				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
+				 uc_mocs, comp_pat_index, BLT_INDIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&amp;surf.dst, ccs, sysmem, ccssize, uc_mocs,
 				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_get_default_alignment(xe);
@@ -157,7 +163,7 @@ static void surf_copy(int xe,
 	blt_set_ctrl_surf_object(&amp;surf.src, ccs, sysmem, ccssize,
 				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	blt_set_ctrl_surf_object(&amp;surf.dst, mid-&gt;handle, mid-&gt;region, mid-&gt;size,
-				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
+				 uc_mocs, comp_pat_index, INDIRECT_ACCESS);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &amp;surf);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -234,10 +240,10 @@ static int blt_block_copy3(int xe,
 	igt_assert_f(blt3, &quot;block-copy3 requires data to do blit\n&quot;);
 
 	alignment = xe_get_default_alignment(xe);
-	get_offset(ahnd, blt3-&gt;src.handle, blt3-&gt;src.size, alignment);
-	get_offset(ahnd, blt3-&gt;mid.handle, blt3-&gt;mid.size, alignment);
-	get_offset(ahnd, blt3-&gt;dst.handle, blt3-&gt;dst.size, alignment);
-	get_offset(ahnd, blt3-&gt;final.handle, blt3-&gt;final.size, alignment);
+	get_offset_pat_index(ahnd, blt3-&gt;src.handle, blt3-&gt;src.size, alignment, blt3-&gt;src.pat_index);
+	get_offset_pat_index(ahnd, blt3-&gt;mid.handle, blt3-&gt;mid.size, alignment, blt3-&gt;mid.pat_index);
+	get_offset_pat_index(ahnd, blt3-&gt;dst.handle, blt3-&gt;dst.size, alignment, blt3-&gt;dst.pat_index);
+	get_offset_pat_index(ahnd, blt3-&gt;final.handle, blt3-&gt;final.size, alignment, blt3-&gt;final.pat_index);
 	bb_offset = get_offset(ahnd, blt3-&gt;bb.handle, blt3-&gt;bb.size, alignment);
 
 	/* First blit src -&gt; mid */
@@ -291,8 +297,9 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx-&gt;vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &amp;
+							!xe_has_vram(xe)) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config-&gt;compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -413,8 +420,9 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_get_default_alignment(xe);
 	uint64_t ahnd = intel_allocator_open(xe, ctx-&gt;vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = region2, bb;
-	uint32_t width = param.width, height = param.height;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &amp;
+							!xe_has_vram(xe)) ? region1 : region2;
+	uint32_t width = param.width, height = param.height, bb;
 	enum blt_compression mid_compression = config-&gt;compression;
 	int mid_compression_format = param.compression_format;
 	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
@@ -539,8 +547,9 @@ static void block_copy_test(int xe,
 			region1 = igt_collection_get_value(regions, 0);
 			region2 = igt_collection_get_value(regions, 1);
 
-			/* Compressed surface must be in device memory */
-			if (config-&gt;compression &amp;&amp; !XE_IS_VRAM_MEMORY_REGION(xe, region2))
+			/* if not XE2, then Compressed surface must be in device memory */
+			if (config-&gt;compression &amp;&amp; !(AT_LEAST_GEN((intel_get_drm_devid(xe)), 20)) &amp;&amp;
+									!XE_IS_VRAM_MEMORY_REGION(xe, region2))
 				continue;
 
 			regtxt = xe_memregion_dynamic_subtest_name(xe, regions);
@@ -621,8 +630,8 @@ const char *help_str =
 	&quot;  -p\tWrite PNG\n&quot;
 	&quot;  -s\tPrint surface info\n&quot;
 	&quot;  -t\tTiling format (0 - linear, 1 - XMAJOR, 2 - YMAJOR, 3 - TILE4, 4 - TILE64)\n&quot;
-	&quot;  -W\tWidth (default 512)\n&quot;
-	&quot;  -H\tHeight (default 512)&quot;
+	&quot;  -W\tWidth (default 1024)\n&quot;
+	&quot;  -H\tHeight (default 1024)&quot;
 	;
 
 igt_main_args(&quot;bf:pst:W:H:&quot;, NULL, help_str, opt_handler, NULL)
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------K7lbbF70RvB6gmeh0YghN9R0--
