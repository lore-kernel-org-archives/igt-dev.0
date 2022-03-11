Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E248510E1A4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 04:43:53 +0000 (UTC)
Message-ID: <775839c0-b81e-70f3-594b-89f0e80f8f2c@intel.com>
Date: Fri, 11 Mar 2022 10:13:37 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20210908181006.6088-1-mohammed.thasleem@intel.com>
 <20210908181006.6088-2-mohammed.thasleem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20210908181006.6088-2-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/kms_dsc : Close fd
 after igt_display_fini execution.
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
>   tests/i915/kms_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index ee52ffcc..22d2216e 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -354,7 +354,7 @@ igt_main
>   			drmModeFreeConnector(connector);
>   		test_cleanup(&data);
>   		drmModeFreeResources(res);
> -		close(data.drm_fd);
>   		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>   	}
>   }

