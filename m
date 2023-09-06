Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBD010E591
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 07:53:30 +0000 (UTC)
Message-ID: <f4a9b8a5-ec49-b685-71e6-954e93894398@intel.com>
Date: Wed, 6 Sep 2023 13:23:24 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
 <20230905125356.1659246-2-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230905125356.1659246-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t V2 1/7] tests/intel/pm: Rename
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

Hi Bhanu,

On 05-Sep-23 6:23 PM, Bhanuprakash Modem wrote:
> As i915_pm_backlight is a display specific test, rename it with
> the "kms_" prefix, i.e kms_pm_backlight.
> 
> V2: - Rebase
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist         |  2 +-
>   ...i915_pm_backlight.c => kms_pm_backlight.c} | 25 ++-----------------
>   tests/meson.build                             |  2 +-
>   3 files changed, 4 insertions(+), 25 deletions(-)
>   rename tests/intel/{i915_pm_backlight.c => kms_pm_backlight.c} (87%)
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
> similarity index 87%
> rename from tests/intel/i915_pm_backlight.c
> rename to tests/intel/kms_pm_backlight.c
> index 3c73b054b..eca385518 100644
> --- a/tests/intel/i915_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -1,27 +1,6 @@
> +// SPDX-License-Identifier: MIT
>   /*
> - * Copyright © 2015 Intel Corporation
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
> - * Author:
> - *    Antti Koskipaa <antti.koskipaa@linux.intel.com>
> + * Copyright © 2023 Intel Corporation
>    *
>    */

We can't remove old copyright. This has to remain same. With new IGT we 
are using SPDX, older IGT will continue using already existing copyright.

>   
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
