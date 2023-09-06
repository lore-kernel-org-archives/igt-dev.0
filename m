Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2A210E405
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 07:59:48 +0000 (UTC)
Message-ID: <12e5bc07-9963-27f6-1843-6455095490cf@intel.com>
Date: Wed, 6 Sep 2023 13:29:42 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
 <20230905125356.1659246-4-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230905125356.1659246-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t V2 3/7] tests/intel/pm: Rename i915_pm_dc to
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

Hi Bhanu,

On 05-Sep-23 6:23 PM, Bhanuprakash Modem wrote:
> As i915_pm_dc is a display specific test, rename it with
> the "kms_" prefix, i.e kms_pm_dc.
> 
> V2: - Rebase
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/{i915_pm_dc.c => kms_pm_dc.c} | 22 ++--------------------
>   tests/meson.build                         |  2 +-
>   2 files changed, 3 insertions(+), 21 deletions(-)
>   rename tests/intel/{i915_pm_dc.c => kms_pm_dc.c} (94%)
> 
> diff --git a/tests/intel/i915_pm_dc.c b/tests/intel/kms_pm_dc.c
> similarity index 94%
> rename from tests/intel/i915_pm_dc.c
> rename to tests/intel/kms_pm_dc.c
> index 13ae31583..b5b38c976 100644
> --- a/tests/intel/i915_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -1,24 +1,6 @@
> +// SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2018 Intel Corporation
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> - * IN THE SOFTWARE.
> + * Copyright © 2023 Intel Corporation
>    *
>    */

Same comment applies here, don't change copyright.

>   
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
