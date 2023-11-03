Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3E10E081
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 10:01:03 +0000 (UTC)
Message-ID: <0a023b3b-604c-46e6-a513-cd8c748aea51@intel.com>
Date: Fri, 3 Nov 2023 11:00:33 +0100
MIME-Version: 1.0
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
References: <f816d1e8eb4439012a43dcec0fa00794174f815a.1698941978.git.jagmeet.randhawa@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
In-Reply-To: <f816d1e8eb4439012a43dcec0fa00794174f815a.1698941978.git.jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] XE2: lib/gpgpu_fill: Port gpgpu_fillfunc
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

Hi Jagmeet,

On 2.11.2023 18:10, Jagmeet Randhawa wrote:
> Add xe2lpg_gpgpu_fillfunc to have gpgpu_fill running on XE2
> On XE2 there are a few changes to gpu command instruction lengths.
> 
> There's also no 'Media Block Write' message, thus 'Typed 2D Block
> Store' message has to be used in the shader.
> 
> The shader was compiled using the following command:
> 
> iga64 -p=2 -Wall -Xprint-ldst -Xauto-deps --assemble xe2hp_gpgpu_kernel.asm
> | od -A n -v -t x4 |sed -e 's/ / 0x/g' | sed -e 's/^/\t{/' | sed -e
> 's/([0-9]|[a-f]|[A-F]) /\1, /g' | sed -e 's/$/ },/g' | sed -e 's/\t /\t/g'
> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>   lib/gpgpu_fill.c                              | 23 ++++++++
>   lib/gpgpu_fill.h                              |  6 +++
>   lib/gpu_cmds.c                                | 53 ++++++++++++++++---
>   .../shaders/gpgpu/xe2lpg_gpgpu_kernel.asm     | 13 +++++
>   lib/intel_batchbuffer.c                       |  4 +-
>   5 files changed, 90 insertions(+), 9 deletions(-)
>   create mode 100644 lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index eed821872..1270c2b22 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -124,6 +124,18 @@ static const uint32_t xehpc_gpgpu_kernel[][4] = {
>   	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
>   };
>   
> +static const uint32_t xe2lpg_gpgpu_kernel[][4] = {
> +	{ 0x00080061, 0x01050000, 0x00000104, 0x00000000 },
> +	{ 0x00000069, 0x02058220, 0x02000014, 0x00000004 },
> +	{ 0x00000061, 0x02150220, 0x00000064, 0x00000000 },
> +	{ 0x00100061, 0x04054220, 0x00000000, 0x00000000 },
> +	{ 0x00041a61, 0x04550220, 0x00220205, 0x00000000 },
> +	{ 0x00000061, 0x04754550, 0x00000000, 0x000f000f },
> +	{ 0x00101e61, 0x05050220, 0x00000104, 0x00000000 },
> +	{ 0x00132031, 0x00000000, 0xd00e0494, 0x04000000 },
> +	{ 0x000c0031, 0x00000004, 0x3000500c, 0x00000000 },
> +};
> +
>   /*
>    * This sets up the gpgpu pipeline,
>    *
> @@ -398,3 +410,14 @@ void xehpc_gpgpu_fillfunc(int i915,
>   			      xehpc_gpgpu_kernel,
>   			      sizeof(xehpc_gpgpu_kernel));
>   }
> +
> +void xe2lpg_gpgpu_fillfunc(int i915,
> +			   struct intel_buf *buf,
> +			   unsigned int x, unsigned int y,
> +			   unsigned int width, unsigned int height,
> +			   uint8_t color)
> +{
> +	__xehp_gpgpu_fillfunc(i915, buf, x, y, width, height, color,
> +			      xe2lpg_gpgpu_kernel,
> +			      sizeof(xe2lpg_gpgpu_kernel));
> +}
> diff --git a/lib/gpgpu_fill.h b/lib/gpgpu_fill.h
> index f81cd0b53..c3b47c10a 100644
> --- a/lib/gpgpu_fill.h
> +++ b/lib/gpgpu_fill.h
> @@ -75,4 +75,10 @@ xehpc_gpgpu_fillfunc(int i915,
>   		     unsigned int width, unsigned int height,
>   		     uint8_t color);
>   
> +void xe2lpg_gpgpu_fillfunc(int i915,
> +			   struct intel_buf *buf,
> +			   unsigned int x, unsigned int y,
> +			   unsigned int width, unsigned int height,
> +			   uint8_t color);
> +
>   #endif /* GPGPU_FILL_H */
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index f19f93b28..944d3d6a6 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -328,7 +328,30 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>   	binding_table = intel_bb_ptr(ibb);
>   	intel_bb_ptr_add(ibb, 64);
>   
> -	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0)){

Missing space here. Besides when you add braces for one branch of a 'if 
else' statement, please add them also for the remaining ones. These and 
other issues are reported by checkpatch, please run it before submitting 
patches and please fix the issues reported for this patch.


> +		/*
> +		* XXX: Up until now, SURFACEFORMAT_R8_UNROM was used regardless of the 'bpp' value.
> +		* For bpp 32 this results in a surface that is 4x narrower than expected. However
> +		* it worked, because the 'Media Block Read/Write' message assumes the surface width
> +		* is always in units of dwords.
> +		*
> +		* Since Xe2 the Media Block Write message got replaced with 'Typed 2D Block
> +		* Load/Store Message' which correctly interprets the surface format.
> +		*/
> +		if (buf->bpp == 32)
> +			binding_table[0] = xehp_fill_surface_state(ibb, buf,
> +								      SURFACEFORMAT_R8G8B8A8_UNORM,
> +								      1);
> +		else if (buf->bpp == 8)
> +			binding_table[0] = xehp_fill_surface_state(ibb, buf,
> +								      SURFACEFORMAT_R8_UNORM,
> +								      1);
> +		else
> +			igt_assert_f(false,
> +				     "Surface state for bpp = %u not implemented",
> +				     buf->bpp);
> +	}
> +	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
>   		binding_table[0] = xehp_fill_surface_state(ibb, buf,
>   							   SURFACEFORMAT_R8_UNORM, 1);
>   	else if (intel_graphics_ver(devid) >= IP_VER(9, 0))
> @@ -959,8 +982,12 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
>   void
>   xehp_emit_state_compute_mode(struct intel_bb *ibb)
>   {
> -	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE);
> +	uint32_t dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0);
> +	intel_bb_out(ibb, XEHP_STATE_COMPUTE_MODE | dword_length);
>   	intel_bb_out(ibb, 0);
> +
> +	if (dword_length)
> +		intel_bb_out(ibb, 0);
>   }
>   
>   void
> @@ -976,6 +1003,8 @@ xehp_emit_state_binding_table_pool_alloc(struct intel_bb *ibb)
>   void
>   xehp_emit_state_base_address(struct intel_bb *ibb)
>   {
> +	uint32_t tmp;
> +
>   	intel_bb_out(ibb, GEN8_STATE_BASE_ADDRESS | 0x14);            //dw0
>   
>   	/* general */
> @@ -983,7 +1012,8 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>   	intel_bb_out(ibb, 0);
>   
>   	/* stateless data port */
> -	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                   //dw3
> +	tmp = intel_graphics_ver(ibb->devid) == IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
> +	intel_bb_out(ibb, 0 | tmp);                  //dw3
>   
>   	/* surface */
>   	intel_bb_emit_reloc(ibb, ibb->handle, I915_GEM_DOMAIN_SAMPLER, //dw4-dw5
> @@ -1008,7 +1038,10 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>   	/* dynamic state buffer size */
>   	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
>   	/* indirect object buffer size */
> -	intel_bb_out(ibb, 0xfffff000 | 1);                          //dw14
> +	if (intel_graphics_ver(ibb->devid) == IP_VER(20, 0))	    //dw14
> +		intel_bb_out(ibb, 0);
> +	else
> +		intel_bb_out(ibb, 0xfffff000 | 1);
>   	/* intruction buffer size */
>   	intel_bb_out(ibb, 1 << 12 | 1);                             //dw15
>   
> @@ -1030,7 +1063,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       struct xehp_interface_descriptor_data *pidd,
>   		       uint8_t color)
>   {
> -	uint32_t x_dim, y_dim, mask;
> +	uint32_t x_dim, y_dim, mask, dword_length;
>   
>   	/*
>   	 * Simply do SIMD16 based dispatch, so every thread uses
> @@ -1051,8 +1084,9 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   		mask = (1 << 16) - 1;
>   	else
>   		mask = (1 << mask) - 1;
> -
> -	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | 0x25);
> +	
> +	dword_length = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0x26 : 0x25;
> +	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | dword_length);
>   
>   	intel_bb_out(ibb, 0); /* debug object */		//dw1
>   	intel_bb_out(ibb, 0); /* indirect data length */	//dw2
> @@ -1090,9 +1124,12 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   	intel_bb_out(ibb, 0);					//dw15
>   	intel_bb_out(ibb, 0);					//dw16
>   	intel_bb_out(ibb, 0);					//dw17
> +	
> +	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	//XE2:dw18

Nit^2 - if possible (in text and comments for example) use 'Xe' instead 
of 'XE'. I know I wrote it that way but you may go ahead and fix it 
while at it ;)

Thanks,
Christoph


> +		intel_bb_out(ibb, 0);
>   
>   	/* Interface descriptor data */
> -	for (int i = 0; i < 8; i++) {			       //dw18-25
> +	for (int i = 0; i < 8; i++) {			       //dw18-25 (XE2:dw19-26)
>   		intel_bb_out(ibb, ((uint32_t *) pidd)[i]);
>   	}
>   
> diff --git a/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm b/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
> new file mode 100644
> index 000000000..e2ecc71f5
> --- /dev/null
> +++ b/lib/i915/shaders/gpgpu/xe2lpg_gpgpu_kernel.asm
> @@ -0,0 +1,13 @@
> +L0:
> +         mov (4|M0)               r1.0<1>:ub    r1.0<0;1,0>:ub                        // Load r1.0-3 with color byte
> +         shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    0x4:ud              // Load r2.0-3 with tg id X << 4
> +         mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud                        // Load r2.4-7 with tg id Y
> +
> +         // payload setup
> +         mov (16|M0)              r4.0<1>:ud    0x0:ud                                // Zero out register R4
> +         mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud                        // Store X and Y block start (160:191 and 192:223)
> +         mov (1|M0)               r4.14<1>:w    0xF:w                                 // Store X and Y block size (224:231 and 232:239)
> +         mov (16|M0)              r5.0<1>:ud    r1.0<0;1,0>:ud                        // Load r5-r6 with color byte
> +
> +         send.tgm (16|M0)         null     r4    null:0    0x0    0x64000007          // Send TypedStore2DBlock to tgm port
> +         send.gtwy (8|M0)         null    r80    null:0    0x0    0x02000000 {EOT}
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index df82ef5f5..d23c04073 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -755,7 +755,9 @@ igt_fillfunc_t igt_get_gpgpu_fillfunc(int devid)
>   {
>   	igt_fillfunc_t fill = NULL;
>   
> -	if (IS_METEORLAKE(devid))
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> +                fill = xe2lpg_gpgpu_fillfunc;
> +	else if (IS_METEORLAKE(devid))
>   		fill = xehp_gpgpu_fillfunc;
>   	else if (intel_graphics_ver(devid) >= IP_VER(12, 60))
>   		fill = xehpc_gpgpu_fillfunc;
