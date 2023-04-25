Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEF410E6E6
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 09:17:13 +0000 (UTC)
Message-ID: <edaa5e19-da02-be46-57d5-3cb206fc558a@intel.com>
Date: Tue, 25 Apr 2023 14:46:58 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230425064953.2121947-16-bhanuprakash.modem@intel.com>
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
In-Reply-To: <20230425064953.2121947-16-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t, V2,
 15/40] tests/i915/kms_big_joiner: Add XE support
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

Looks good to me.

Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>

On 4/25/2023 12:19 PM, Bhanuprakash Modem wrote:
> Add XE driver support for kms tests.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_big_joiner.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
> index 8be60ea11..b9dda58f6 100644
> --- a/tests/i915/kms_big_joiner.c
> +++ b/tests/i915/kms_big_joiner.c
> @@ -188,7 +188,7 @@ igt_main
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   
>   	igt_fixture {
> -		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);

-- 
~Nidhi Gupta
