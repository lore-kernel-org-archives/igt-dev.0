Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9586D10EA34
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 10:56:55 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
Date: Wed, 16 Feb 2022 10:56:50 +0000
Message-ID: <30d43a85b1f6427cb9fc5a88cf157fef@intel.com>
References: <20220216102633.26949-1-jeevan.b@intel.com>
 <20220216102633.26949-3-jeevan.b@intel.com>
 <YgzWEjjx92etirqF@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YgzWEjjx92etirqF@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 02/15] igt/lib: Add tile 4(F-tile)
 format support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Latvala, Petri <petri.latvala@intel.com>
>Sent: Wednesday, February 16, 2022 4:17 PM
>To: B, Jeevan <jeevan.b@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Heikkila, Juha-pekka <juha-
>pekka.heikkila@intel.com>
>Subject: Re: [igt-dev] [PATCH i-g-t v3 02/15] igt/lib: Add tile 4(F-tile) =
format
>support
>
>On Wed, Feb 16, 2022 at 03:56:20PM +0530, Jeevan B wrote:
>> From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>>
>> Introduce support for the new Tile4 format, which is 4K column-major
>> tiles consisting of 64B row-major subtiles, with same base structure
>> as Y Tile(16B OWords * 4)
>>
>> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> ---
>>  include/drm-uapi/drm_fourcc.h | 39 ++++++++++++++++++++++++++++++++++
>>  include/drm-uapi/i915_drm.h   |  3 ++-
>
>Please separate the change to these two files into a separate commit that =
copies
>the files from the kernel, with the commit message stating which kernel co=
mmit
>they're from.

Sure, Will do this.=20
Thanks=20
>
>
>--
>Petri Latvala
>
>
>
>
>>  lib/gpu_cmds.c                |  4 ++--
>>  lib/igt_draw.c                |  7 +++++-
>>  lib/igt_fb.c                  | 40 ++++++++++++++++++++++++++++++-----
>>  lib/intel_batchbuffer.c       |  8 +++++--
>>  lib/intel_batchbuffer.h       |  4 ++--
>>  7 files changed, 92 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc=
.h
>> index 91b6a0fd..4dc4e5a4 100644
>> --- a/include/drm-uapi/drm_fourcc.h
>> +++ b/include/drm-uapi/drm_fourcc.h
>> @@ -559,6 +559,45 @@ extern "C" {
>>   */
>>  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
>fourcc_mod_code(INTEL, 8)
>>
>> +/*
>> + * Intel F-tiling(aka Tile4) layout
>> + *
>> + * This is a tiled layout using 4Kb tiles in row-major layout.
>> + * Within the tile pixels are laid out in 64 byte units / sub-tiles in =
OWORD
>> + * (16 bytes) chunks column-major..
>> + */
>> +#define I915_FORMAT_MOD_4_TILED                 fourcc_mod_code(INTEL, =
12)
>> +
>> +/*
>> + * Intel color control surfaces (CCS) for DG2 render compression.
>> + *
>> + * DG2 uses a new compression format for render compression. The genera=
l
>> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
>> + * but a new hashing/compression algorithm is used, so a fresh modifier=
 must
>> + * be associated with buffers of this type. Render compression uses 128=
 byte
>> + * compression blocks.
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS
>fourcc_mod_code(INTEL, 9)
>> +
>> +/*
>> + * Intel color control surfaces (CCS) for DG2 media compression.
>> + *
>> + * DG2 uses a new compression format for media compression. The general
>> + * layout is the same as I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
>> + * but a new hashing/compression algorithm is used, so a fresh modifier=
 must
>> + * be associated with buffers of this type. Media compression uses 256 =
byte
>> + * compression blocks.
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS
>fourcc_mod_code(INTEL, 10)
>> +
>> +/*
>> + * Intel color control surfaces (CCS) for DG2 clear color render compre=
ssion.
>> + *
>> + * DG2 uses a unified compression format for clear color render compres=
sion.
>> + * The general layout is a tiled layout using 4Kb tiles i.e. Tile4 layo=
ut.
>> + */
>> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC
>fourcc_mod_code(INTEL, 11)
>> +
>>  /*
>>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblock=
s
>>   *
>> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
>> index 9c9e1afa..75206fc3 100644
>> --- a/include/drm-uapi/i915_drm.h
>> +++ b/include/drm-uapi/i915_drm.h
>> @@ -1522,13 +1522,14 @@ struct drm_i915_gem_caching {
>>  #define I915_TILING_NONE	0
>>  #define I915_TILING_X		1
>>  #define I915_TILING_Y		2
>> +#define I915_TILING_4		3
>>  /*
>>   * Do not add new tiling types here.  The I915_TILING_* values are for
>>   * de-tiling fence registers that no longer exist on modern platforms. =
 Although
>>   * the hardware may support new types of tiling in general (e.g., Tile4=
), we
>>   * do not need to add them to the uapi that is specific to now-defunct =
ioctls.
>>   */
>> -#define I915_TILING_LAST	I915_TILING_Y
>> +#define I915_TILING_LAST	I915_TILING_4
>>
>>  #define I915_BIT_6_SWIZZLE_NONE		0
>>  #define I915_BIT_6_SWIZZLE_9		1
>> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
>> index a45a9048..c31b51f7 100644
>> --- a/lib/gpu_cmds.c
>> +++ b/lib/gpu_cmds.c
>> @@ -156,7 +156,7 @@ gen8_fill_surface_state(struct intel_bb *ibb,
>>
>>  	if (buf->tiling =3D=3D I915_TILING_X)
>>  		ss->ss0.tiled_mode =3D 2;
>> -	else if (buf->tiling =3D=3D I915_TILING_Y)
>> +	else if (buf->tiling =3D=3D I915_TILING_Y || buf->tiling =3D=3D I915_T=
ILING_4)
>>  		ss->ss0.tiled_mode =3D 3;
>>
>>  	address =3D intel_bb_offset_reloc(ibb, buf->handle,
>> @@ -211,7 +211,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>>
>>  	if (buf->tiling =3D=3D I915_TILING_X)
>>  		ss->ss0.tiled_mode =3D 2;
>> -	else if (buf->tiling =3D=3D I915_TILING_Y)
>> +	else if (buf->tiling =3D=3D I915_TILING_Y || buf->tiling =3D=3D I915_T=
ILING_4)
>>  		ss->ss0.tiled_mode =3D 3;
>>  	else
>>  		ss->ss0.tiled_mode =3D 0;
>> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>> index 2af27b11..0ca43deb 100644
>> --- a/lib/igt_draw.c
>> +++ b/lib/igt_draw.c
>> @@ -271,7 +271,7 @@ static void switch_blt_tiling(struct intel_bb *ibb,
>uint32_t tiling, bool on)
>>  	uint32_t bcs_swctrl;
>>
>>  	/* Default is X-tile */
>> -	if (tiling !=3D I915_TILING_Y)
>> +	if (tiling !=3D I915_TILING_Y && tiling !=3D I915_TILING_4)
>>  		return;
>>
>>  	igt_require(ibb->gen >=3D 6);
>> @@ -318,6 +318,7 @@ static void draw_rect_ptr_tiled(void *ptr, uint32_t
>stride, uint32_t tiling,
>>  							       swizzle, bpp);
>>  				break;
>>  			case I915_TILING_Y:
>> +			case I915_TILING_4:
>>  				pos =3D linear_x_y_to_ytiled_pos(x, y, stride,
>>  							       swizzle, bpp);
>>  				break;
>> @@ -350,6 +351,7 @@ static void draw_rect_mmap_cpu(int fd, struct
>buf_data *buf, struct rect *rect,
>>  		break;
>>  	case I915_TILING_X:
>>  	case I915_TILING_Y:
>> +	case I915_TILING_4:
>>  		draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, rect,
>>  				    color, buf->bpp);
>>  		break;
>> @@ -409,6 +411,7 @@ static void draw_rect_mmap_wc(int fd, struct buf_dat=
a
>*buf, struct rect *rect,
>>  		break;
>>  	case I915_TILING_X:
>>  	case I915_TILING_Y:
>> +	case I915_TILING_4:
>>  		draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, rect,
>>  				    color, buf->bpp);
>>  		break;
>> @@ -467,6 +470,7 @@ static void draw_rect_pwrite_tiled(int fd, struct
>buf_data *buf,
>>  						 swizzle, buf->bpp, &x, &y);
>>  			break;
>>  		case I915_TILING_Y:
>> +		case I915_TILING_4:
>>  			ytiled_pos_to_x_y_linear(tiled_pos, buf->stride,
>>  						 swizzle, buf->bpp, &x, &y);
>>  			break;
>> @@ -507,6 +511,7 @@ static void draw_rect_pwrite(int fd, struct buf_data
>*buf,
>>  		break;
>>  	case I915_TILING_X:
>>  	case I915_TILING_Y:
>> +	case I915_TILING_4:
>>  		draw_rect_pwrite_tiled(fd, buf, tiling, rect, color, swizzle);
>>  		break;
>>  	default:
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 1530b960..4fa357f8 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -456,6 +456,10 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier=
, int
>fb_bpp,
>>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
>>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>> +	case I915_FORMAT_MOD_4_TILED:
>> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>> +	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>>  		igt_require_intel(fd);
>>  		if (intel_display_ver(intel_get_drm_devid(fd)) =3D=3D 2) {
>>  			*width_ret =3D 128;
>> @@ -564,14 +568,17 @@ void igt_get_fb_tile_size(int fd, uint64_t modifie=
r, int
>fb_bpp,
>>
>>  static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
>>  {
>> -	return modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
>> +	return modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
>> +		modifier =3D=3D I915_FORMAT_MOD_4_TILED_DG2_MC_CCS;
>>  }
>>
>>  static bool is_gen12_ccs_modifier(uint64_t modifier)
>>  {
>>  	return is_gen12_mc_ccs_modifier(modifier) ||
>>  		modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
>> -		modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
>> +		modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
>||
>> +		modifier =3D=3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
>> +		modifier =3D=3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
>>  }
>>
>>  static bool is_ccs_modifier(uint64_t modifier)
>> @@ -601,8 +608,15 @@ static bool is_gen12_ccs_plane(const struct igt_fb
>*fb, int plane)
>>
>>  static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
>>  {
>> -	return fb->modifier =3D=3D
>I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
>> -	       plane =3D=3D 2;
>> +	if (fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC
>&&
>> +	       plane =3D=3D 2)
>> +		return true;
>> +
>> +	if (fb->modifier =3D=3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC &&
>> +		plane =3D=3D 1)
>> +		return true;
>> +
>> +	return false;
>>  }
>>
>>  bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
>> @@ -688,7 +702,8 @@ static int fb_num_planes(const struct igt_fb *fb)
>>  	if (is_ccs_modifier(fb->modifier))
>>  		num_planes *=3D 2;
>>
>> -	if (fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
>> +	if (fb->modifier =3D=3D I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
>> +	    fb->modifier =3D=3D I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
>>  		num_planes++;
>>
>>  	return num_planes;
>> @@ -964,6 +979,11 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
>>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>>  		return I915_TILING_Y;
>> +	case I915_FORMAT_MOD_4_TILED:
>> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>> +	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>> +		return I915_TILING_4;
>>  	case I915_FORMAT_MOD_Yf_TILED:
>>  	case I915_FORMAT_MOD_Yf_TILED_CCS:
>>  		return I915_TILING_Yf;
>> @@ -991,6 +1011,8 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling)
>>  		return I915_FORMAT_MOD_X_TILED;
>>  	case I915_TILING_Y:
>>  		return I915_FORMAT_MOD_Y_TILED;
>> +	case I915_TILING_4:
>> +		return I915_FORMAT_MOD_4_TILED;
>>  	case I915_TILING_Yf:
>>  		return I915_FORMAT_MOD_Yf_TILED;
>>  	default:
>> @@ -4398,6 +4420,14 @@ const char *igt_fb_modifier_name(uint64_t
>modifier)
>>  		return "Y-RC_CCS-CC";
>>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>>  		return "Y-MC_CCS";
>> +	case I915_FORMAT_MOD_4_TILED:
>> +		return "4";
>> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
>> +		return "4-RC_CCS";
>> +	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
>> +		return "4-MC_CCS";
>> +	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
>> +		return "4-RC_CCS-CC";
>>  	default:
>>  		return "?";
>>  	}
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index e5666cd4..f02d0f3c 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -617,6 +617,7 @@ static uint32_t fast_copy_dword0(unsigned int
>src_tiling,
>>  		dword0 |=3D XY_FAST_COPY_SRC_TILING_X;
>>  		break;
>>  	case I915_TILING_Y:
>> +	case I915_TILING_4:
>>  	case I915_TILING_Yf:
>>  		dword0 |=3D XY_FAST_COPY_SRC_TILING_Yb_Yf;
>>  		break;
>> @@ -633,6 +634,7 @@ static uint32_t fast_copy_dword0(unsigned int
>src_tiling,
>>  		dword0 |=3D XY_FAST_COPY_DST_TILING_X;
>>  		break;
>>  	case I915_TILING_Y:
>> +	case I915_TILING_4:
>>  	case I915_TILING_Yf:
>>  		dword0 |=3D XY_FAST_COPY_DST_TILING_Yb_Yf;
>>  		break;
>> @@ -653,9 +655,11 @@ static uint32_t fast_copy_dword1(unsigned int
>src_tiling,
>>  {
>>  	uint32_t dword1 =3D 0;
>>
>> -	if (src_tiling =3D=3D I915_TILING_Yf)
>> +	if (src_tiling =3D=3D I915_TILING_Yf || src_tiling =3D=3D I915_TILING_=
4)
>> +		/* Repurposed as Tile-4 on DG2 */
>>  		dword1 |=3D XY_FAST_COPY_SRC_TILING_Yf;
>> -	if (dst_tiling =3D=3D I915_TILING_Yf)
>> +	if (dst_tiling =3D=3D I915_TILING_Yf || dst_tiling =3D=3D I915_TILING_=
4)
>> +		/* Repurposed as Tile-4 on DG2 */
>>  		dword1 |=3D XY_FAST_COPY_DST_TILING_Yf;
>>
>>  	switch (bpp) {
>> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
>> index a488f9cf..4cf67296 100644
>> --- a/lib/intel_batchbuffer.h
>> +++ b/lib/intel_batchbuffer.h
>> @@ -210,8 +210,8 @@ void intel_copy_bo(struct intel_batchbuffer *batch,
>>   *
>>   * They are to be used the the blitting routines below.
>>   */
>> -#define I915_TILING_Yf	3
>> -#define I915_TILING_Ys	4
>> +#define I915_TILING_Yf	(I915_TILING_LAST + 1)
>> +#define I915_TILING_Ys	(I915_TILING_LAST + 2)
>>
>>  enum i915_compression {
>>  	I915_COMPRESSION_NONE,
>> --
>> 2.17.1
>>
