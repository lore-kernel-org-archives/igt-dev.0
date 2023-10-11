Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDD610E4F9
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 14:14:03 +0000 (UTC)
Message-ID: <cbfca18d-06c9-4443-8f8b-ebbf45eb2978@intel.com>
Date: Wed, 11 Oct 2023 19:43:58 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
 <20231011101722.3188258-5-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231011101722.3188258-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V7 4/4] tests/intel-ci: Add module-reload test
 to CI
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

On 11-Oct-23 3:47 PM, Bhanuprakash Modem wrote:
> Add igt@kms_pm_rpm@module-reload test to CI
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/blacklist.txt          | 1 +
>   tests/intel-ci/fast-feedback.testlist | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index e13759d3e..13504dac3 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -15,6 +15,7 @@ igt@meta_test(@.*)?
>   #igt@i915_module_load(@.*)? # danger, danger; hope for taints!
>   igt@i915_pm_rpm@module-reload
>   igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
> +igt@kms_pm_rpm@module-reload

Why have we added this test to blacklist?

>   ###############################################
>   # GEM
>   ###############################################
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index c252e2cf0..8b70f139a 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -164,6 +164,7 @@ igt@gem_lmem_swapping@parallel-random-engines
>   igt@gem_lmem_swapping@random-engines
>   igt@gem_lmem_swapping@verify-random
>   igt@i915_pm_rpm@module-reload
> +igt@kms_pm_rpm@module-reload
>   
>   # Kernel selftests
>   igt@i915_selftest@live
