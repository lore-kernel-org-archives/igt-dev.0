Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 27 Sep 2023 17:01:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <fmph62flkf7oi234w4456sagjcxh2qq22nm76bhvmdngozbs2c@f6fggusj73fh>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-8-lucas.demarchi@intel.com>
 <20230926224159.GN2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230926224159.GN2706891@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 07/14] lib/intel_mocs: Stop
 encoding mocs
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

On Tue, Sep 26, 2023 at 03:41:59PM -0700, Matt Roper wrote:
>On Fri, Sep 15, 2023 at 06:23:39AM -0700, Lucas De Marchi wrote:
>> From gen9 until xe2, the various gpu commands use a mocs object that is
>> defined as
>>
>> 	[0]   pad
>
>Might be more accurate to say "pxp" here since that's how it's actually
>being used in the code.

ok

...

>> @@ -276,9 +276,9 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>>
>>  	if (mocs == INTEL_BUF_MOCS_UC)
>> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
>> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>>  	else if (mocs == INTEL_BUF_MOCS_WB)
>> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
>> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>>
>>  	if (buf->tiling == I915_TILING_X)
>>  		ss->ss0.tiled_mode = 2;
>> @@ -295,7 +295,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>>  	ss->ss9.base_addr_hi = address >> 32;
>>
>>  	if (is_dst) {
>> -		ss->ss1.memory_object_control = 2;
>> +		ss->ss1.mocs_index = 1;
>
>This is an accurate conversion of the existing code, but it doesn't seem
>like there should be a magic number here.  Looks like this originates
>from
>
>        commit c4b2b2f07fe8231afb8514fab19218dec95d562d
>        Author:     Tony Ye <tony.ye@intel.com>
>        AuthorDate: Tue Nov 13 14:36:28 2018 +0000
>        Commit:     Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>        CommitDate: Tue Feb 5 12:23:09 2019 +0000
>
>            tests/gem_media_vme: Simple test to exercise the VME block
>
>with no real explanation.
>
>Since this is a gen11 function, I guess we could probably switch this
>to I915_MOCS_PTE to try to match the presumed intent here.

ok

>> @@ -2763,9 +2763,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>>
>>  	blt_tile = fb_tile_to_blt_tile(fb->modifier);
>>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
>> +	mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>>
>>  	blt_set_object(blt, handle, fb->size, memregion,
>> -		       intel_get_uc_mocs(fb->fd),
>> +		       mocs,
>
>Doesn't this function expect just the (non-shifted) index?  If so, we
>shouldn't shift by XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT above.

It seems it doesn´t expect the non-shifted, but it should and I missed
that in this patch.

>
>>  		       blt_tile,
>>  		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>>  		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index 429511920..9f8e3dea3 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -58,7 +58,8 @@ struct gen12_block_copy_data {
>>  	struct {
>>  		uint32_t dst_pitch:			BITRANGE(0, 17);
>>  		uint32_t dst_aux_mode:			BITRANGE(18, 20);
>> -		uint32_t dst_mocs:			BITRANGE(21, 27);
>> +		uint32_t pad:				BITRANGE(21, 21);
>> +		uint32_t dst_mocs:			BITRANGE(22, 27);
>
>Should we also rename all these dst_mocs and src_mocs with "_index" too
>as you've done elsewhere?  Or will that cause too much churn?

ok


>
>>  		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
>>  		uint32_t dst_compression:		BITRANGE(29, 29);
>>  		uint32_t dst_tiling:			BITRANGE(30, 31);
>> @@ -98,7 +99,8 @@ struct gen12_block_copy_data {
>>  	struct {
>>  		uint32_t src_pitch:			BITRANGE(0, 17);
>>  		uint32_t src_aux_mode:			BITRANGE(18, 20);
>> -		uint32_t src_mocs:			BITRANGE(21, 27);
>> +		uint32_t pad:				BITRANGE(21, 21);
>> +		uint32_t src_mocs:			BITRANGE(22, 27);
>>  		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
>>  		uint32_t src_compression:		BITRANGE(29, 29);
>>  		uint32_t src_tiling:			BITRANGE(30, 31);
>> @@ -628,7 +630,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>>  		 cmd[0],
>>  		 data->dw00.client, data->dw00.opcode, data->dw00.color_depth,
>>  		 data->dw00.special_mode, data->dw00.length);
>> -	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs: %d, compr: %d, "
>> +	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>>  		 "tiling: %d, ctrl surf type: %d>\n",
>>  		 cmd[1], data->dw01.dst_pitch, data->dw01.dst_aux_mode,
>>  		 data->dw01.dst_mocs, data->dw01.dst_compression,
>> @@ -646,7 +648,7 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>>  		 data->dw06.dst_target_memory);
>>  	igt_info(" dw07: [%08x] src geom <x1: %d, y1: %d>\n",
>>  		 cmd[7], data->dw07.src_x1, data->dw07.src_y1);
>> -	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs: %d, compr: %d, "
>> +	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>>  		 "tiling: %d, ctrl surf type: %d>\n",
>>  		 cmd[8], data->dw08.src_pitch, data->dw08.src_aux_mode,
>>  		 data->dw08.src_mocs, data->dw08.src_compression,
>> @@ -914,7 +916,8 @@ struct gen12_ctrl_surf_copy_data {
>>
>>  	struct {
>>  		uint32_t src_address_hi:		BITRANGE(0, 24);
>> -		uint32_t src_mocs:			BITRANGE(25, 31);
>> +		uint32_t pad:				BITRANGE(25, 25);
>> +		uint32_t src_mocs:			BITRANGE(26, 31);
>>  	} dw02;
>>
>>  	struct {
>> @@ -923,7 +926,8 @@ struct gen12_ctrl_surf_copy_data {
>>
>>  	struct {
>>  		uint32_t dst_address_hi:		BITRANGE(0, 24);
>> -		uint32_t dst_mocs:			BITRANGE(25, 31);
>> +		uint32_t pad:				BITRANGE(25, 25);
>> +		uint32_t dst_mocs:			BITRANGE(26, 31);
>>  	} dw04;
>>  };
>>
>> @@ -940,11 +944,11 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
>>  		 data->dw00.size_of_ctrl_copy, data->dw00.length);
>>  	igt_info(" dw01: [%08x] src offset lo (0x%x)\n",
>>  		 cmd[1], data->dw01.src_address_lo);
>> -	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs: %u\n",
>> +	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs idx: %u\n",
>>  		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs);
>>  	igt_info(" dw03: [%08x] dst offset lo (0x%x)\n",
>>  		 cmd[3], data->dw03.dst_address_lo);
>> -	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs: %u\n",
>> +	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs idx: %u\n",
>>  		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs);
>>  }
>>
>> @@ -1557,7 +1561,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>>  void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>>  {
>>  	igt_info("[%s]\n", info);
>> -	igt_info("surface <handle: %u, size: %llx, region: %x, mocs: %x>\n",
>> +	igt_info("surface <handle: %u, size: %llx, region: %x, mocs_idx: %x>\n",
>>  		 obj->handle, (long long) obj->size, obj->region, obj->mocs);
>>  	igt_info("        <tiling: %s, compression: %u, compression type: %d>\n",
>>  		 blt_tiling_name(obj->tiling), obj->compression, obj->compression_type);
>> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
>> index cf3b8e4fe..6a4ec25e4 100644
>> --- a/lib/intel_mocs.c
>> +++ b/lib/intel_mocs.c
>> @@ -51,22 +51,20 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>>  	}
>>  }
>>
>> -/* BitField [6:1] represents index to MOCS Tables
>> - * BitField [0] represents Encryption/Decryption
>> - */
>> -
>> -uint8_t intel_get_wb_mocs(int fd)
>> +uint8_t intel_get_wb_mocs_index(int fd)
>>  {
>>  	struct drm_intel_mocs_index mocs;
>>
>>  	get_mocs_index(fd, &mocs);
>> -	return mocs.wb_index << 1;
>> +
>> +	return mocs.wb_index;
>>  }
>>
>> -uint8_t intel_get_uc_mocs(int fd)
>> +uint8_t intel_get_uc_mocs_index(int fd)
>>  {
>>  	struct drm_intel_mocs_index mocs;
>>
>>  	get_mocs_index(fd, &mocs);
>> -	return mocs.uc_index << 1;
>> +
>> +	return mocs.uc_index;
>>  }
>> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
>> index 255eac0ff..278f143ec 100644
>> --- a/lib/intel_mocs.h
>> +++ b/lib/intel_mocs.h
>> @@ -6,7 +6,7 @@
>>  #ifndef _INTEL_MOCS_H
>>  #define _INTEL_MOCS_H
>>
>> -uint8_t intel_get_wb_mocs(int fd);
>> -uint8_t intel_get_uc_mocs(int fd);
>> +uint8_t intel_get_wb_mocs_index(int fd);
>> +uint8_t intel_get_uc_mocs_index(int fd);
>>
>>  #endif /* _INTEL_MOCS_H */
>> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
>> index 3bf3676dc..f97154d2b 100644
>> --- a/lib/intel_reg.h
>> +++ b/lib/intel_reg.h
>> @@ -2562,7 +2562,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>>  #define XY_MONO_SRC_BLT_WRITE_ALPHA	(1<<21)
>>  #define XY_MONO_SRC_BLT_WRITE_RGB	(1<<20)
>>
>> -#define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
>> +#define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
>> +#define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22
>
>Not a problem with your patch, but I'm surprised to see GPU instructions
>defined in intel_reg.h...   Seems like the code has been organized that
>way since 2009 and nobody has ever reorganized it.  :-(

it's worse

$ git grep "define XY_FAST_COLOR_BLT"
include/intel_gpu_commands.h:#define XY_FAST_COLOR_BLT_CMD              (2 << 29 | 0x44 << 22)
lib/intel_reg.h:#define XY_FAST_COLOR_BLT                               ((0x2<<29)|(0x44<<22)|0xe)

but the _CMD variant is not really being used or updated. Someone will
have to cleanup this mess, but it's beyond what I'm trying with this
series. One mess at a time :)

Judging by commit e5fe17165cbf ("intel_gpu_commands: Use kernel gpu
command definitions") I believe there's an ongoing conversion.

>
>>
>>  #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>>  /* dword 0 */
>> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
>> index b8959d073..6c410e8a8 100644
>> --- a/lib/rendercopy_gen9.c
>> +++ b/lib/rendercopy_gen9.c
>> @@ -138,7 +138,7 @@ static const uint32_t gen12p71_render_copy[][4] = {
>>
>>  /* Mostly copy+paste from gen6, except height, width, pitch moved */
>>  static uint32_t
>> -gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>> +gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>  	      bool fast_clear) {
>>  	struct gen9_surface_state *ss;
>>  	uint32_t write_domain, read_domain;
>> @@ -173,11 +173,11 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>  		/*
>>  		 * mocs table version 1 index 3 groub wb use l3
>>  		 */
>> -		ss->ss1.memory_object_control = 3 << 1;
>> +		ss->ss1.mocs_index= 3;
>
>Minor spacing glitch.

ok

>
>>  		ss->ss5.mip_tail_start_lod = 0;
>>  	} else {
>>  		ss->ss0.render_cache_read_write = 1;
>> -		ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
>> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>>  		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
>>  	}
>>
>> @@ -187,7 +187,7 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>>  		ss->ss0.tiled_mode = 3;
>>
>>  	if (intel_buf_pxp(buf))
>> -		ss->ss1.memory_object_control |= 1;
>> +		ss->ss1.pxp = 1;
>>
>>  	if (buf->tiling == I915_TILING_Yf)
>>  		ss->ss5.trmode = 1;
>> @@ -282,10 +282,10 @@ gen8_bind_surfaces(struct intel_bb *ibb,
>>  	binding_table = intel_bb_ptr_align(ibb, 32);
>>  	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
>>
>> -	binding_table[0] = gen8_bind_buf(ibb, dst, 1, fast_clear);
>> +	binding_table[0] = gen9_bind_buf(ibb, dst, 1, fast_clear);
>>
>>  	if (src != NULL)
>> -		binding_table[1] = gen8_bind_buf(ibb, src, 0, false);
>> +		binding_table[1] = gen9_bind_buf(ibb, src, 0, false);
>>
>>  	return binding_table_offset;
>>  }
>> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
>> index 65a72d950..087eb2ec0 100644
>> --- a/lib/xehp_media.h
>> +++ b/lib/xehp_media.h
>> @@ -109,7 +109,8 @@ struct xehp_surface_state {
>>  		uint32_t double_fetch_disable: BITRANGE(17, 17);
>>  		uint32_t corner_texel_mode: BITRANGE(18, 18);
>>  		uint32_t base_mip_level: BITRANGE(19, 23);
>> -		uint32_t memory_object_control: BITRANGE(24, 30);
>> +		uint32_t pad1: BITRANGE(24, 24);
>
>Should we name this 'pxp' to match the name used in gen9_surface_state?

ok

thanks

Lucas De Marchi
