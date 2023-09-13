Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95CA10E48D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 09:16:50 +0000 (UTC)
Message-ID: <d63574e1-5e69-067c-c8a5-10d55d110a59@intel.com>
Date: Wed, 13 Sep 2023 14:46:37 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230912163645.1316734-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230912163645.1316734-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: add dsc-basic as part
 ffb
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


On 9/12/2023 10:06 PM, Swati Sharma wrote:
> Add dsc-basic as part of ffb.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist    | 1 +
>   tests/intel-ci/xe-fast-feedback.testlist | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index ba66bde2f..3d8b23073 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -102,6 +102,7 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
>   igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
>   igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
>   igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> +igt@kms_dsc@dsc-basic
>   igt@kms_flip@basic-flip-vs-dpms
>   igt@kms_flip@basic-flip-vs-modeset
>   igt@kms_flip@basic-flip-vs-wf_vblank
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index e11594123..610cc958c 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -222,6 +222,7 @@ igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
>   igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
>   igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
>   igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> +igt@kms_dsc@dsc-basic
>   igt@kms_flip@basic-flip-vs-dpms
>   igt@kms_flip@basic-flip-vs-modeset
>   igt@kms_flip@basic-flip-vs-wf_vblank
