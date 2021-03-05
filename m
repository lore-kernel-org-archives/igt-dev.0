Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF456EB04
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 07:28:26 +0000 (UTC)
References: <20210305064421.23388-1-nidhi1.gupta@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <0cdc8f51-75c4-24ff-ba64-9bd4a47db478@intel.com>
Date: Fri, 5 Mar 2021 12:58:19 +0530
MIME-Version: 1.0
In-Reply-To: <20210305064421.23388-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2]
 tests/kms_rotation_crc@exhaust-fences: added check for HW detiler
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 05-Mar-21 12:14 PM, Nidhi Gupta wrote:
> HW detiler not supported on platforms w/o aperture.
> Added feature test macro to query the kernel for the
> global gpu aperture size. Aperture size should be
> greater than zero to support HW detiler, if not skip
> the test.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_rotation_crc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index adddb690..bcbb9bdc 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -884,6 +884,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
>   	int i;
>   
>   	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
> +	igt_require(gem_available_fences(display->drm_fd) > 0);
>   
>   	prepare_crtc(data, output, pipe, plane, false);
>   
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
