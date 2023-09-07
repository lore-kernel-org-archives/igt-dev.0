Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEEC10E76C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 06:45:21 +0000 (UTC)
Message-ID: <fa4d5321-71d4-090d-1fb3-c3f064c1f007@intel.com>
Date: Thu, 7 Sep 2023 12:15:07 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230907055203.1274040-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230907055203.1274040-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: add 4-tile test
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


On 9/7/2023 11:22 AM, Swati Sharma wrote:
> Add 4-tile basic tiling tests to ffb.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist    | 1 +
>   tests/intel-ci/xe-fast-feedback.testlist | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 841051058..b3a97561d 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -54,6 +54,7 @@ igt@i915_getparams_basic@basic-eu-total
>   igt@i915_getparams_basic@basic-subslice-total
>   igt@i915_hangman@error-state-basic
>   igt@i915_pciid
> +igt@kms_addfb_basic@addfb25-4-tiled
>   igt@kms_addfb_basic@addfb25-bad-modifier
>   igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
>   igt@kms_addfb_basic@addfb25-modifier-no-flag
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index a2b231c17..e11594123 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -182,6 +182,7 @@ igt@xe_vm@munmap-style-unbind-userptr-inval-end
>   igt@xe_vm@munmap-style-unbind-userptr-inval-front
>   igt@xe_waitfence@abstime
>   igt@xe_waitfence@reltime
> +igt@kms_addfb_basic@addfb25-4-tiled
>   igt@kms_addfb_basic@addfb25-bad-modifier
>   igt@kms_addfb_basic@addfb25-modifier-no-flag
>   igt@kms_addfb_basic@addfb25-x-tiled-legacy
