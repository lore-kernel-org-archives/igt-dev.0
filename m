Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC710E05D
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:30:52 +0000 (UTC)
Message-ID: <8ebeb08c-0d51-cd6b-2189-c190bff2823a@intel.com>
Date: Fri, 8 Sep 2023 14:00:47 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
 <20230907161155.1828658-4-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230907161155.1828658-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 3/7] tests/intel/pm: Rename i915_pm_dc to
 kms_pm_dc
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
> As i915_pm_dc is a display specific test, rename it with
> the "kms_" prefix, i.e kms_pm_dc.
> 
> V2: - Rebase
> V3: - Restore old Copyright
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/{i915_pm_dc.c => kms_pm_dc.c} | 0
>   tests/meson.build                         | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename tests/intel/{i915_pm_dc.c => kms_pm_dc.c} (100%)
> 
> diff --git a/tests/intel/i915_pm_dc.c b/tests/intel/kms_pm_dc.c
> similarity index 100%
> rename from tests/intel/i915_pm_dc.c
> rename to tests/intel/kms_pm_dc.c
> diff --git a/tests/meson.build b/tests/meson.build
> index 442df7d84..ea8b60282 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -224,7 +224,6 @@ intel_i915_progs = [
>   	'i915_pm_freq_mult',
>   	'i915_pm_lpsp',
>   	'i915_pm_rpm',
> -	'i915_pm_dc',
>   	'i915_pm_rc6_residency',
>   	'i915_pm_rps',
>   	'i915_pm_sseu',
> @@ -262,6 +261,7 @@ intel_kms_progs = [
>   	'kms_mmap_write_crc',
>   	'kms_pipe_b_c_ivb',
>   	'kms_pm_backlight',
> +	'kms_pm_dc',
>   	'kms_psr',
>   	'kms_psr2_sf',
>   	'kms_psr2_su',
