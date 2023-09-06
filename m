Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA08910E591
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 08:08:58 +0000 (UTC)
Message-ID: <f2e80958-eb41-ac24-af75-0c9c03abe1bd@intel.com>
Date: Wed, 6 Sep 2023 13:38:53 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
 <20230905125356.1659246-6-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230905125356.1659246-6-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t V2 5/7] tests/intel/pm: Rename i915_pm_lpsp to
 kms_pm_lpsp
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
> As i915_pm_lpsp is a display specific test, rename it with
> the "kms_" prefix, i.e kms_pm_lpsp.
> 
> V2: - Rebase
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/{i915_pm_lpsp.c => kms_pm_lpsp.c} | 24 ++-----------------
>   tests/meson.build                             |  2 +-
>   2 files changed, 3 insertions(+), 23 deletions(-)
>   rename tests/intel/{i915_pm_lpsp.c => kms_pm_lpsp.c} (82%)
> 
> diff --git a/tests/intel/i915_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> similarity index 82%
> rename from tests/intel/i915_pm_lpsp.c
> rename to tests/intel/kms_pm_lpsp.c
> index 291e56674..0adcb8cc0 100644
> --- a/tests/intel/i915_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -1,26 +1,6 @@
> +// SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2013 Intel Corporation
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
> - *
> - * Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
> + * Copyright © 2023 Intel Corporation
>    *
>    */

Same comment holds here too, don't remove copyright.

>   
> diff --git a/tests/meson.build b/tests/meson.build
> index ea8b60282..92729e0c3 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -222,7 +222,6 @@ intel_i915_progs = [
>   	'i915_pciid',
>   	'i915_pipe_stress',
>   	'i915_pm_freq_mult',
> -	'i915_pm_lpsp',
>   	'i915_pm_rpm',
>   	'i915_pm_rc6_residency',
>   	'i915_pm_rps',
> @@ -262,6 +261,7 @@ intel_kms_progs = [
>   	'kms_pipe_b_c_ivb',
>   	'kms_pm_backlight',
>   	'kms_pm_dc',
> +	'kms_pm_lpsp',
>   	'kms_psr',
>   	'kms_psr2_sf',
>   	'kms_psr2_su',
