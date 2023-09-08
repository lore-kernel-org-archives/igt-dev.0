Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C3710E05D
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:26:03 +0000 (UTC)
Message-ID: <812ffa21-ea12-3dcd-a1dc-c42ab7cd3da3@intel.com>
Date: Fri, 8 Sep 2023 13:55:58 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
 <20230907161155.1828658-2-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230907161155.1828658-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 1/7] tests/intel/pm: Rename
 i915_pm_backlight to kms_pm_backlight
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 07-Sep-23 9:41 PM, Bhanuprakash Modem wrote:
> As i915_pm_backlight is a display specific test, rename it with
> the "kms_" prefix, i.e kms_pm_backlight.
> 
> V2: - Rebase
> V3: - Restore old Copyright
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist                   | 2 +-
>   tests/intel/{i915_pm_backlight.c => kms_pm_backlight.c} | 0
>   tests/meson.build                                       | 2 +-
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename tests/intel/{i915_pm_backlight.c => kms_pm_backlight.c} (100%)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 841051058..51010a2f7 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -118,12 +118,12 @@ igt@kms_pipe_crc_basic@nonblocking-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
>   igt@kms_pipe_crc_basic@read-crc
>   igt@kms_pipe_crc_basic@read-crc-frame-sequence
> +igt@kms_pm_backlight@basic-brightness
>   igt@kms_psr@primary_page_flip
>   igt@kms_psr@cursor_plane_move
>   igt@kms_psr@sprite_plane_onoff
>   igt@kms_psr@primary_mmap_gtt
>   igt@kms_setmode@basic-clone-single-crtc
> -igt@i915_pm_backlight@basic-brightness
>   igt@i915_pm_rpm@basic-pci-d3-state
>   igt@i915_pm_rpm@basic-rte
>   igt@i915_pm_rps@basic-api
> diff --git a/tests/intel/i915_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> similarity index 100%
> rename from tests/intel/i915_pm_backlight.c
> rename to tests/intel/kms_pm_backlight.c
> diff --git a/tests/meson.build b/tests/meson.build
> index aa8e3434c..442df7d84 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -221,7 +221,6 @@ intel_i915_progs = [
>   	'i915_module_load',
>   	'i915_pciid',
>   	'i915_pipe_stress',
> -	'i915_pm_backlight',
>   	'i915_pm_freq_mult',
>   	'i915_pm_lpsp',
>   	'i915_pm_rpm',
> @@ -262,6 +261,7 @@ intel_kms_progs = [
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',
>   	'kms_pipe_b_c_ivb',
> +	'kms_pm_backlight',
>   	'kms_psr',
>   	'kms_psr2_sf',
>   	'kms_psr2_su',
