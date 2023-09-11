Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7A010E30A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 14:28:47 +0000 (UTC)
Message-ID: <eb60d437-0b6a-58ca-d26d-17227ace227f@intel.com>
Date: Mon, 11 Sep 2023 19:58:28 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230908070053.1283474-1-swati2.sharma@intel.com>
 <20230908070053.1283474-4-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230908070053.1283474-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/intel-ci: remove
 feature_discovery from blocklist
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


On Fri-08-09-2023 12:30 pm, Swati Sharma wrote:
> Remove feature_discovery from blocklist.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/intel-ci/xe.blocklist.txt | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index d496a3f6d..e73018ec6 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -38,7 +38,6 @@ igt@drm_fdinfo
>   igt@drm_read
>   igt@dumb.*
>   igt@fbdev
> -igt@feature_discovery
>   igt@prime_.*
>   igt@sw_sync
>   igt@syncobj_.*
