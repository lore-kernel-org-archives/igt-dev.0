Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 12:59:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915195945.GH2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 04/14] lib/gpu_cmds: Fork a
 gen9_fill_surface_state()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:36AM -0700, Lucas De Marchi wrote:
> Commit 02c2cf17628b ("lib/[gpu_cmds|intel_bufops]: Enable surface state
> mocs setting.") added support for setting the mocs field in the surface
> state. However it's not until gen9 that MOCS uses a table, programmed by
> the kernel, and only has an index set in the surface state. Previously
> it was the specific caching behavior.
> 
> As such, it makes no sense to set this field to `I915_MOCS_PTE << 1`: it
> will only add garbage to the batch buffer. Solve this by forking a
> separate function for gen9 and above, keeping the old behavior for
> previous platforms.
> 
> Bspec: 12483, 12239, 12236
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/gpu_cmds.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 0fd8f8213..83d2302f9 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -136,6 +136,58 @@ gen8_fill_surface_state(struct intel_bb *ibb,
>  	struct gen8_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> +
> +	if (is_dst) {
> +		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> +	} else {
> +		write_domain = 0;
> +		read_domain = I915_GEM_DOMAIN_SAMPLER;
> +	}
> +
> +	intel_bb_ptr_align(ibb, 64);
> +	offset = intel_bb_offset(ibb);
> +	ss = intel_bb_ptr(ibb);
> +	intel_bb_ptr_add(ibb, 64);
> +
> +	ss->ss0.surface_type = SURFACE_2D;
> +	ss->ss0.surface_format = format;
> +	ss->ss0.render_cache_read_write = 1;
> +	ss->ss0.vertical_alignment = 1; /* align 4 */
> +	ss->ss0.horizontal_alignment = 1; /* align 4 */
> +
> +	if (buf->tiling == I915_TILING_X)
> +		ss->ss0.tiled_mode = 2;
> +	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
> +		ss->ss0.tiled_mode = 3;
> +
> +	address = intel_bb_offset_reloc(ibb, buf->handle,
> +					read_domain, write_domain,
> +					offset + 4 * 8, buf->addr.offset);
> +
> +	ss->ss8.base_addr = (uint32_t) address;
> +	ss->ss9.base_addr_hi = address >> 32;
> +
> +	ss->ss2.height = intel_buf_height(buf) - 1;
> +	ss->ss2.width  = intel_buf_width(buf) - 1;
> +	ss->ss3.pitch  = buf->surface[0].stride - 1;
> +
> +	ss->ss7.shader_chanel_select_r = 4;
> +	ss->ss7.shader_chanel_select_g = 5;
> +	ss->ss7.shader_chanel_select_b = 6;
> +	ss->ss7.shader_chanel_select_a = 7;
> +
> +	return offset;
> +}
> +
> +static uint32_t
> +gen9_fill_surface_state(struct intel_bb *ibb,
> +			struct intel_buf *buf,
> +			uint32_t format,
> +			int is_dst)
> +{
> +	struct gen8_surface_state *ss;
> +	uint32_t write_domain, read_domain, offset;
> +	uint64_t address;
>  	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
> @@ -273,6 +325,9 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>  	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
>  		binding_table[0] = xehp_fill_surface_state(ibb, buf,
>  							   SURFACEFORMAT_R8_UNORM, 1);
> +	else if (intel_graphics_ver(devid) >= IP_VER(9, 0))
> +		binding_table[0] = gen9_fill_surface_state(ibb, buf,
> +							   SURFACEFORMAT_R8_UNORM, 1);
>  	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
>  		binding_table[0] = gen8_fill_surface_state(ibb, buf,
>  							   SURFACEFORMAT_R8_UNORM, 1);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
