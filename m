Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E37892A6
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 05:28:27 +0000 (UTC)
Date: Mon, 12 Jun 2023 07:28:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Message-ID: <20230612052822.zi6blish62hh2dm4@zkempczy-mobl2>
References: <20230609130128.2197571-1-christoph.manszewski@intel.com>
 <20230609130128.2197571-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609130128.2197571-2-christoph.manszewski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/[gpu_cmds|intel_bufops]: Enable
 surface state mocs setting.
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

On Fri, Jun 09, 2023 at 03:01:28PM +0200, Christoph Manszewski wrote:
> Allow the user to control the setting of surface caching.
> Add 'mocs' field to intel_buf structure and update the surface state
> fill commands to use introduced filed.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/gpu_cmds.c     | 19 +++++++++++++++++++
>  lib/intel_bufops.c |  1 +
>  lib/intel_bufops.h | 20 ++++++++++++++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 1f321ae4..aa4aa34d 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -23,6 +23,7 @@
>   */
>  
>  #include "gpu_cmds.h"
> +#include "intel_mocs.h"
>  
>  uint32_t
>  gen7_fill_curbe_buffer_data(struct intel_bb *ibb, uint8_t color)
> @@ -135,6 +136,7 @@ gen8_fill_surface_state(struct intel_bb *ibb,
>  	struct gen8_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> +	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
>  		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> @@ -154,6 +156,11 @@ gen8_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
> +	if (mocs == INTEL_BUF_MOCS_UC)
> +		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +	else if (mocs == INTEL_BUF_MOCS_WB)
> +		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +

At the moment this if/else if is a dead code (similar in the functions below)
because you're setting

+	buf->mocs = INTEL_BUF_MOCS_DEFAULT;

and there're no usage of intel_buf_set_mocs() helper.

Is this intentional and preparation for next patches? If yes:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
>  	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
> @@ -190,6 +197,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	struct gen8_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> +	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
>  		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> @@ -209,6 +217,11 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = vertical_alignment; /* align 4 */
>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>  
> +	if (mocs == INTEL_BUF_MOCS_UC)
> +		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +	else if (mocs == INTEL_BUF_MOCS_WB)
> +		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
>  	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
> @@ -817,6 +830,7 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	struct xehp_surface_state *ss;
>  	uint32_t write_domain, read_domain, offset;
>  	uint64_t address;
> +	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
>  
>  	if (is_dst) {
>  		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
> @@ -836,6 +850,11 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
> +	if (mocs == INTEL_BUF_MOCS_UC)
> +		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +	else if (mocs == INTEL_BUF_MOCS_WB)
> +		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
>  	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 46fd981f..52475793 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -837,6 +837,7 @@ static void __intel_buf_init(struct buf_ops *bops,
>  	buf->bops = bops;
>  	buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
>  	IGT_INIT_LIST_HEAD(&buf->link);
> +	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
>  
>  	if (compression) {
>  		igt_require(bops->intel_gen >= 9);
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index 0037548a..4dfe4681 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -12,6 +12,12 @@ struct buf_ops;
>  #define INTEL_BUF_NAME_MAXSIZE 32
>  #define INVALID_ADDR(x) ((x) == INTEL_BUF_INVALID_ADDRESS)
>  
> +enum intel_buf_mocs {
> +	INTEL_BUF_MOCS_DEFAULT,
> +	INTEL_BUF_MOCS_UC,
> +	INTEL_BUF_MOCS_WB,
> +};
> +
>  struct intel_buf {
>  	struct buf_ops *bops;
>  
> @@ -23,6 +29,7 @@ struct intel_buf {
>  	uint32_t compression;
>  	uint32_t swizzle_mode;
>  	uint32_t yuv_semiplanar_bpp;
> +	enum intel_buf_mocs mocs;
>  	bool format_is_yuv;
>  	bool format_is_yuv_semiplanar;
>  	struct {
> @@ -212,4 +219,17 @@ const char *intel_buf_set_name(struct intel_buf *buf, const char *name);
>  void intel_buf_write_to_png(struct intel_buf *buf, const char *filename);
>  void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename);
>  
> +static inline enum intel_buf_mocs intel_buf_get_mocs(const struct intel_buf *buf)
> +{
> +	igt_assert(buf);
> +	return buf->mocs;
> +}
> +
> +static inline void intel_buf_set_mocs(struct intel_buf *buf,
> +				      enum intel_buf_mocs mocs)
> +{
> +	igt_assert(buf);
> +	buf->mocs = mocs;
> +}
> +
>  #endif
> -- 
> 2.40.1
> 
