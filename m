Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BD610E752
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 13:43:38 +0000 (UTC)
Message-ID: <bcd3cc77-214e-9093-fc34-ee6aa401668e@linux.intel.com>
Date: Wed, 18 Jan 2023 14:43:34 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20230118134205.4156-1-nirmoy.das@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230118134205.4156-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_blits: Don't test Y Tile for
 newer GPUs
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

Once we have https://patchwork.freedesktop.org/series/113003/, I think 
this can be improved.


Nirmoy

On 1/18/2023 2:42 PM, Nirmoy Das wrote:
> From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>
> Legacy Y Tile is no longer supported on newer GPUs.
>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Co-developed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> ---
>   tests/i915/gem_blits.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index d9296cf2d..577eb6bfc 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -793,6 +793,7 @@ igt_main
>   	igt_subtest("basic") {
>   		struct buffer *src, *dst;
>   		unsigned int x, y;
> +		int devid = intel_get_drm_devid(device.fd);
>   
>   		for (unsigned int height = 1; height <= 16; height <<= 2) {
>   			for (unsigned int y0 = ZERO; y0 <= (height > 2 ? BELOW : ZERO); y0++) {
> @@ -808,12 +809,28 @@ igt_main
>   						for (unsigned int src_tiling = I915_TILING_NONE;
>   						     src_tiling <= (device.gen >= 6 ? I915_TILING_Y : I915_TILING_X);
>   						     src_tiling++) {
> +
> +							/*
> +							 * Legacy Y Tile is not supported on newer GPUs so skip that.
> +							 * Probably need more generic solution to detect and skip unsupported formats.
> +							 */
> +							if (intel_graphics_ver(devid) >= IP_VER(12, 60) && (src_tiling == I915_TILING_Y))
> +								continue;
> +
>   							buffer_set_tiling(&device, src, src_tiling);
>   
>   							x = start_at(width, x0);
>   							for (unsigned int dst_tiling = I915_TILING_NONE;
>   							     dst_tiling <= (device.gen >= 6 ? I915_TILING_Y : I915_TILING_X);
>   							     dst_tiling++) {
> +
> +								/*
> +								 * Legacy Y Tile is not supported on newer GPUs so skip that.
> +								 * Probably need more generic solution to detect and skip unsupported formats.
> +								 */
> +								if (intel_graphics_ver(devid) >= IP_VER(12, 60) && (dst_tiling == I915_TILING_Y))
> +									continue;
> +
>   								buffer_set_tiling(&device, dst, dst_tiling);
>   
>   								for (enum mode down = CPU; down <= WC; down++) {
