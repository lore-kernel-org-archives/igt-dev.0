Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A1110E043
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 08:54:48 +0000 (UTC)
Message-ID: <e795e8a4-6b81-824b-6d30-3127d346555f@intel.com>
Date: Fri, 21 Apr 2023 14:24:35 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230420120631.1866947-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230420120631.1866947-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_addfb_basic: Use proper macro for
 invalid tests
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


On 4/20/2023 5:36 PM, Bhanuprakash Modem wrote:
> For invalid tests, instead of using magic numbers use proper
> macros those are already defined in IGT lib.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_addfb_basic.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index a66ccfa6b..e4783624f 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -549,7 +549,7 @@ static void addfb25_tests(int fd)
>   	igt_subtest("addfb25-bad-modifier") {
>   		igt_require_fb_modifiers(fd);
>   
> -		f.modifier[0] = ~0;
> +		f.modifier[0] = DRM_FORMAT_MOD_INVALID;
>   		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
>   	}
>   
> @@ -729,7 +729,7 @@ static void prop_tests(int fd)
>   
>   	igt_describe("Test that get-properties ioctl call fails correctly for invalid object type");
>   	igt_subtest("invalid-get-prop-any") {
> -		get_props.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
> +		get_props.obj_type = DRM_MODE_OBJECT_ANY;
>   
>   		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_GETPROPERTIES, &get_props, EINVAL);
>   	}
> @@ -747,7 +747,7 @@ static void prop_tests(int fd)
>   
>   	igt_describe("Test that set-properties ioctl call fails correctly for invalid object type");
>   	igt_subtest("invalid-set-prop-any") {
> -		set_prop.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
> +		set_prop.obj_type = DRM_MODE_OBJECT_ANY;
>   
>   		do_ioctl_err(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, &set_prop, EINVAL);
>   	}
