Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1AB10E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 05:37:33 +0000 (UTC)
Message-ID: <585406d3-d595-920a-edde-4be834ff785a@intel.com>
Date: Mon, 12 Jun 2023 11:07:13 +0530
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
 <20230609101205.2803975-4-kunal1.joshi@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230609101205.2803975-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/5]
 tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported for
 xe as of now
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

Hi Kunal,

On Fri-09-06-2023 03:42 pm, Kunal Joshi wrote:
> XE doesn't support all gem ioctls
> Open :- Find replacement for igt_require_gem() for xe
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/i915/kms_frontbuffer_tracking.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 45a601fe..09bfd3c3 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -3701,7 +3701,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	t.flip = FLIP_PAGEFLIP;
>   	t.tiling = opt.tiling;
>   	igt_subtest("basic") {
> -		igt_require_gem(drm.fd);
> +		if (!is_xe_device(drm.fd))
> +			igt_require_gem(drm.fd);
>   		basic_subtest(&t);

Patch LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Please address below comments:
Due to the igt_fixture in Patch 5/5 of this series, "basic" test is 
getting skip [1]

Maybe you can re-arrange the tests to handle this.
Hint: subtest "basic" should be the first one in kms_frontbuffer_tracking.c

[1]: 
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9141/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html

- Bhanu

>   	}
>   
