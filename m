Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4490C6EA42
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 16:38:53 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Wed, 10 Mar 2021 16:38:30 +0000
Message-ID: <07b4a3f11f7d4061aa17298424694223@intel.com>
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210310163434.71450-1-jcline@redhat.com>
In-Reply-To: <20210310163434.71450-1-jcline@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_hdr: Fix bpc-switch tests
 on AMD hardware
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeremy Cline <jcline@redhat.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Jeremy Cline <jcline@redhat.com>
> Sent: Wednesday, March 10, 2021 10:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Latvala, Petri <petri.latvala@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>;
> maarten.lankhorst@linux.intel.com; nicholas.kazlauskas@amd.com; Jeremy Cline
> <jcline@redhat.com>
> Subject: [PATCH i-g-t v3] tests/kms_hdr: Fix bpc-switch tests on AMD hardware
> 
> Kernel commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be
> enabled whenever the CRTC is") causes the bpc-switch tests to fail since the primary
> plane fb is being removed, which leads to the next atomic commit failing with -
> EINVAL.
> 
> Fix this by leaving the primary plane in place for amdgpu devices.
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---
> Changes from v2:
>   - Instead of skipping on pre-Kaby Lake, only remove the primary
>     plane for AMD devices (thanks for the feedback Petri, Swati,
>     and Uma!)

Looks good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

>  tests/kms_hdr.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index e9dd7f27..5b8529c8 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -223,7 +223,14 @@ static void test_bpc_switch_on_output(data_t *data,
> igt_output_t *output,
>  			data->h = afb.height;
>  		}
> 
> -		igt_plane_set_fb(data->primary, NULL);
> +		/*
> +		 * amdgpu requires a primary plane when the CRTC is enabled.
> +		 * However, some older Intel hardware (hsw) have scaling
> +		 * requirements that are not met by the plane, so remove it
> +		 * for non-AMD devices.
> +		 */
> +		if (!is_amdgpu_device(data->fd))
> +			igt_plane_set_fb(data->primary, NULL);
> 
>  		/*
>  		 * i915 driver doesn't expose max bpc as debugfs entry,
> --
> 2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
