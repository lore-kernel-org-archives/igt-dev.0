Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCC410E1A4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 04:43:30 +0000 (UTC)
Message-ID: <2fc27ef4-c867-8d68-0952-f5bb4e398b77@intel.com>
Date: Fri, 11 Mar 2022 10:13:11 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20210908181006.6088-1-mohammed.thasleem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20210908181006.6088-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/i915/i915_pm_lpsp : Close
 fd after igt_display_fini execution.
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

On 9/8/2021 11:40 PM, Mohammed Thasleem wrote:
> Close fd after igt_display_fini to avoid bad fd failure.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/i915_pm_lpsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index b3b1561e..3ad8b260 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -210,7 +210,7 @@ igt_main
>   
>   	igt_fixture {
>   		free(data.pwr_dmn_info);
> -		close(data.drm_fd);
>   		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>   	}
>   }

