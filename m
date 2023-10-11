Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0753410E432
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 04:14:25 +0000 (UTC)
Message-ID: <3816b489-3e9c-4882-b667-3b0e82fbf409@intel.com>
Date: Wed, 11 Oct 2023 09:44:21 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231005115415.2951265-1-bhanuprakash.modem@intel.com>
 <20231005115415.2951265-4-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231005115415.2951265-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 3/3] tests/intel/pm_rpm: Fix CI with
 renamed tests
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

We need to split this patch based on 1/3 patch and 2/3 patch
then only we can get 1/3 and 3/3 merged together and only module-reload 
changes will be left.

Please split patch accordingly.
With that fixed,

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 05-Oct-23 5:24 PM, Bhanuprakash Modem wrote:
> As Display PM rpm tests are seperated from core, update
> the CI testlist with the new ones.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/blacklist-pre-merge.txt | 8 ++++----
>   tests/intel-ci/blacklist.txt           | 1 +
>   tests/intel-ci/fast-feedback.testlist  | 5 +++--
>   3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
> index d4e5ef66e..0a1315aae 100644
> --- a/tests/intel-ci/blacklist-pre-merge.txt
> +++ b/tests/intel-ci/blacklist-pre-merge.txt
> @@ -13,8 +13,8 @@
>   #
>   # Data acquired on 2020-02-19 by Martin Peres
>   ###############################################################################
> -igt@i915_pm_rpm@legacy-planes(-dpms)?
> -igt@i915_pm_rpm@universal-planes(-dpms)?
> +igt@kms_pm_rpm@legacy-planes(-dpms)?
> +igt@kms_pm_rpm@universal-planes(-dpms)?
>   
>   
>   ###############################################################################
> @@ -67,7 +67,7 @@ igt@gem_exec_alignment@.*
>   #
>   # Data acquired on 2020-02-20 by Martin Peres
>   ###############################################################################
> -igt@i915_pm_rpm@debugfs-read
> +igt@kms_pm_rpm@debugfs-read
>   
>   
>   ###############################################################################
> @@ -109,4 +109,4 @@ igt@gem_tiled_wc
>   #
>   # Data acquired on 2020-02-20 by Martin Peres
>   ###############################################################################
> -igt@i915_pm_rpm@modeset-stress-extra-wait
> +igt@kms_pm_rpm@modeset-stress-extra-wait
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index e13759d3e..13504dac3 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -15,6 +15,7 @@ igt@meta_test(@.*)?
>   #igt@i915_module_load(@.*)? # danger, danger; hope for taints!
>   igt@i915_pm_rpm@module-reload
>   igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
> +igt@kms_pm_rpm@module-reload
>   ###############################################
>   # GEM
>   ###############################################
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 3d8b23073..8b70f139a 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -121,13 +121,13 @@ igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
>   igt@kms_pipe_crc_basic@read-crc
>   igt@kms_pipe_crc_basic@read-crc-frame-sequence
>   igt@kms_pm_backlight@basic-brightness
> +igt@kms_pm_rpm@basic-pci-d3-state
> +igt@kms_pm_rpm@basic-rte
>   igt@kms_psr@primary_page_flip
>   igt@kms_psr@cursor_plane_move
>   igt@kms_psr@sprite_plane_onoff
>   igt@kms_psr@primary_mmap_gtt
>   igt@kms_setmode@basic-clone-single-crtc
> -igt@i915_pm_rpm@basic-pci-d3-state
> -igt@i915_pm_rpm@basic-rte
>   igt@i915_pm_rps@basic-api
>   igt@prime_self_import@basic-llseek-bad
>   igt@prime_self_import@basic-llseek-size
> @@ -164,6 +164,7 @@ igt@gem_lmem_swapping@parallel-random-engines
>   igt@gem_lmem_swapping@random-engines
>   igt@gem_lmem_swapping@verify-random
>   igt@i915_pm_rpm@module-reload
> +igt@kms_pm_rpm@module-reload
>   
>   # Kernel selftests
>   igt@i915_selftest@live
