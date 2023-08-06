Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9153010E0FC
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Aug 2023 17:58:08 +0000 (UTC)
Message-ID: <4b6c7a4c-146f-c134-0f72-efa9fac4891a@intel.com>
Date: Sun, 6 Aug 2023 23:28:02 +0530
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230803122305.3887694-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230803122305.3887694-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] intel-ci/xe: Update kms blocklist
 documentation
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

Hi Bhanu,

Please find my comments inline.

On 03-Aug-23 5:53 PM, Bhanuprakash Modem wrote:
> Add justification to kms blocklist.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 41 ++++++++++++++++++---------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index b40dd4f70..df7bb4149 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -44,41 +44,44 @@ igt@syncobj_.*
>   igt@template
>   igt@tools_test
>   ##################################################################
> -# Pipe E, F, G and H
> +# KMS: Pipe E, F, G and H are not available on Intel hardware
>   ##################################################################
>   igt@.*@.*pipe-(e|f|g|h).*
> -##################################################################
> -# Multidisplay
> -##################################################################
>   igt@kms_bw@.*-(5|6|7|8)-displays-.*
>   ##################################################################
> +# KMS: Tests those are specific to i915 driver

 >>Nitpick: Tests specific to i915 driver

Also, can we precisely mention which all features are not supported
in xe in contrast to i915 and why we had to blacklist all these testcases.

> +##################################################################
> +igt@kms_busy@.*
>   igt@kms_draw_crc@draw-method-(mmap-cpu|mmap-gtt|pwrite)
> -igt@kms_draw_crc@fill-fb
> -igt@kms_pipe_b_c_ivb@.*
> -igt@kms_pwrite_crc
> -igt@kms_ccs@.*
> -igt@kms_frontbuffer_tracking@.*
> -igt@kms_fbcon_fbt@(fbc|psr)(-suspend)
>   igt@kms_fence_pin_leak
> -igt@kms_busy@.*
> -igt@kms_psr@.*_mmap_(cpu|gtt)
> -igt@kms_legacy_colorkey@basic
> -igt@kms_legacy_colorkey@invalid-plane
> -igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
> -igt@kms_big_fb@(4|x|y|yf)-tiled-.*
>   igt@kms_flip@2x-flip-vs-fences
>   igt@kms_flip@flip-vs-fences(-interruptible)
> +igt@kms_legacy_colorkey@basic
> +igt@kms_legacy_colorkey@invalid-plane

 >> These 2 can be combined together.

> +igt@kms_pipe_b_c_ivb@.*
> +igt@kms_psr@.*_mmap_(cpu|gtt)
> +igt@kms_pwrite_crc
> +igt@kms_rotation_crc@exhaust-fences
> +##################################################################
> +# KMS: IGT HANG & Tiling support is not ready.
> +# To be removed once IGT started supporting these features.
> +##################################################################

 >> Make as 2 categories (i) Hang (ii) Tiling

>   igt@kms_addfb_basic@clobberred-modifier
>   igt@kms_addfb_basic@.*-tiling
>   igt@kms_addfb_basic@.*-(4|x|y|yf)-.*
>   igt@kms_async_flips@.*
> -igt@kms_plane_multiple@tiling-(4|x|y|yf)
> +igt@kms_big_fb@(4|x|y|yf)-tiled-.*
> +igt@kms_ccs@.*
>   igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-(atomic|legacy)
> -igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
> -igt@kms_rotation_crc@exhaust-fences
> +igt@kms_draw_crc@fill-fb
> +igt@kms_fbcon_fbt@(fbc|psr)(-suspend)

 >> Specific suspend tests are dependent on tiling?

> +igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
>   igt@kms_force_connector_basic@force-load-detect
> +igt@kms_frontbuffer_tracking@.*
>   igt@kms_getfb@.*-ccs
>   igt@kms_plane_lowres@tiling-(4|x|y|yf)
> +igt@kms_plane_multiple@tiling-(4|x|y|yf)
> +igt@kms_rotation_crc@primary-(4|x|y|yf)-tiled-.*
>   igt@kms_.*@.*hang.*
>   ##################################################################
>   igt@xe_sysfs*
