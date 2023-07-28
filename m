Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D7210E031
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 04:09:28 +0000 (UTC)
Message-ID: <6305eef1-c60e-a980-2ed6-b874d965560b@intel.com>
Date: Fri, 28 Jul 2023 09:39:16 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230726161400.900442-1-swati2.sharma@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230726161400.900442-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t,
 1/2] Revert "tests/intel-ci/xe.blocklist: Add not present tests"
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

On 7/26/2023 9:43 PM, Swati Sharma wrote:
> This reverts commit 8808ceee461b174faadf0fa812c00c0fb680da16.
>
> Even if CI BAT doesn't contain chamelium and psr config,
> we can't blocklist these tests. These configs are enabled
> in resume runs and applying this blocklist, snub these tests
> from execution.
> ---
>   tests/intel-ci/xe.blocklist.txt | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index ab3945f76..02edeb6b6 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -82,11 +82,3 @@ igt@kms_plane_lowres@tiling-(4|x|y|yf)
>   ##################################################################
>   igt@xe_sysfs*
>   ##################################################################
> -# No chamelium/psr setup on XE bat
> -##################################################################
> -igt@.*chamelium.*
> -igt@.*psr.*
> -##################################################################
> -# Hang tests not yet enabled
> -##################################################################
> -igt@kms_.*@.*hang.*
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
