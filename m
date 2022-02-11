Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4810EA5A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Feb 2022 09:38:54 +0000 (UTC)
Date: Fri, 11 Feb 2022 11:39:05 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20220211093904.GA15694@intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
 <20220207182152.31211-7-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207182152.31211-7-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 06/17] igt/tests: Add support for
 Tile4(TileF) format to kms_draw_crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 11:51:41PM +0530, Jeevan B wrote:
> From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> 
> kms_draw_crc would be the first sample test to support new
> format.
> 
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Currently IGT tests are failing, because kernel doesn't support Tile 4
yet.
I guess it is good time to modify that test also, so that it tries to
test Tile 4 only if it is supported.

Stan

> ---
>  tests/i915/kms_draw_crc.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index 82c368e1..6348e803 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -41,25 +41,24 @@ drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
>  struct buf_ops *bops;
>  igt_pipe_crc_t *pipe_crc;
>  
> -#define N_FORMATS 3
> -static const uint32_t formats[N_FORMATS] = {
> +static const uint32_t formats[] = {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_XRGB2101010,
>  };
>  
> -#define N_MODIFIER_METHODS 3
> -static const uint64_t modifiers[N_MODIFIER_METHODS] = {
> +static const uint64_t modifiers[] = {
>  	DRM_FORMAT_MOD_LINEAR,
>  	I915_FORMAT_MOD_X_TILED,
>  	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_4_TILED,
>  };
>  
>  struct base_crc {
>  	bool set;
>  	igt_crc_t crc;
>  };
> -struct base_crc base_crcs[N_FORMATS];
> +struct base_crc base_crcs[ARRAY_SIZE(formats)];
>  
>  struct modeset_params ms;
>  
> @@ -315,6 +314,8 @@ static const char *modifier_str(int modifier_index)
>  		return "xtiled";
>  	case I915_FORMAT_MOD_Y_TILED:
>  		return "ytiled";
> +	case I915_FORMAT_MOD_4_TILED:
> +		return "4tiled";
>  	default:
>  		igt_assert(false);
>  	}
> @@ -328,9 +329,9 @@ igt_main
>  	igt_fixture
>  		setup_environment();
>  
> -	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
> +	for (format_idx = 0; format_idx < ARRAY_SIZE(formats); format_idx++) {
>  	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
> -	for (modifier_idx = 0; modifier_idx < N_MODIFIER_METHODS; modifier_idx++) {
> +	for (modifier_idx = 0; modifier_idx < ARRAY_SIZE(modifiers); modifier_idx++) {
>  		igt_describe("This subtest verfies igt_draw library works "
>  			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
>  		igt_subtest_f("draw-method-%s-%s-%s",
> -- 
> 2.17.1
> 
