Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCE210E499
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 12:00:01 +0000 (UTC)
Message-ID: <f846c6b1-6845-41fc-a5e6-cc530200f143@intel.com>
Date: Tue, 16 Jan 2024 17:29:54 +0530
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] tests/kms_rmfb: Fix subtest description
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20240111205316.1640003-1-lucas.demarchi@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240111205316.1640003-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Lucas,

On 12-Jan-24 2:23 AM, Lucas De Marchi wrote:
> Kernel driver is responsible to do those actions. kms_rmfb is then
> checking if that was true in 2 cases: a) DRM_IOCTL_MODE_RMFB was called
> or b) the file descriptor was closed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   tests/kms_rmfb.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index 39e8bbd55..8a27f4fac 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -24,7 +24,7 @@
>   /**
>    * TEST: kms rmfb
>    * Category: Display
> - * Description: This tests rmfb and close-fd behavior. In these casesthe
> + * Description: This tests rmfb and close-fd behavior. In these cases the
>    *              framebuffers should be removed from the crtc.
>    * Driver requirement: i915, xe
>    * Functionality: kms_gem_interop
> @@ -42,12 +42,13 @@
>   
>   /**
>    * SUBTEST: close-fd
> - * Description: RMFB is supposed to free the framebuffers from any and all planes
> - *              so test this and make sure it works with fd close and reopen.
> + * Description: Kernel driver is supposed to free the framebuffers from any and all planes
> + *		when the fd is closed. Ensure that is the case by closing and re-opening
> + *		it.
>    *
>    * SUBTEST: rmfb-ioctl
> - * Description: RMFB is supposed to free the framebuffers from any and all planes
> - *              so test this and make sure it works.
> + * Description: Kernel driver is supposed to free the framebuffers from any and all planes
> + *              when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case.
>    */
>   
>   #ifndef DRM_CAP_CURSOR_WIDTH
> @@ -57,7 +58,7 @@
>   #define DRM_CAP_CURSOR_HEIGHT 0x9
>   #endif
>   
> -IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases"
> +IGT_TEST_DESCRIPTION("This tests rmfb and close-fd behavior. In these cases "
>   		     "the framebuffers should be removed from the crtc.");
>   
>   struct rmfb_data {
> @@ -198,11 +199,11 @@ igt_main
>   		const char *name;
>   		const char *description;
>   	} tests[] = {
> -		{ false, "rmfb-ioctl", "RMFB is supposed to free the framebuffers from any and all "
> -				       "planes so test this and make sure it works."},
> -		{ true, "close-fd", "RMFB is supposed to free the framebuffers from any and all "
> -				    "planes so test this and make sure it works with fd close "
> -				    "and reopen."},
> +		{ false, "rmfb-ioctl", "Kernel driver is supposed to free the framebuffers from any and all planes "
> +				       "when the fd is closed. Ensure that is the case by closing and re-opening "
> +				       "it" },
> +		{ true, "close-fd", "Kernel driver is supposed to free the framebuffers from any and all planes "
> +				    "when DRM_IOCTL_MODE_RMFB ioctl is called. Ensure that is the case." },

Shouldn't description be reversed?

>   	};
>   	struct rmfb_data data = {};
>   	int i;
