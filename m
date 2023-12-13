Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3C910E6D0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 05:28:16 +0000 (UTC)
Message-ID: <083417fb-f533-4441-8319-0ee6afda70ed@intel.com>
Date: Wed, 13 Dec 2023 10:57:45 +0530
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: add i915 specific tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231213050829.291455-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231213050829.291455-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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


On 12/13/2023 10:38 AM, Swati Sharma wrote:
> Add i915 pm specific tests to blocklist.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 7d1ac38a7..db0846e43 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -69,6 +69,8 @@ igt@kms_pipe_b_c_ivb@.*
>   igt@kms_psr@.*-mmap-(cpu|gtt)
>   igt@kms_pwrite_crc
>   igt@kms_rotation_crc@exhaust-fences
> +igt@kms_pm_lpsp@screens-disabled
> +igt@kms_pm_rpm@(fences-dpms|pm-caching|pm-tiling)
>   ##################################################################
>   # KMS: Yet to add/missing XE support
>   ##################################################################
