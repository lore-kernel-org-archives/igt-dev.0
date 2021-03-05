Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5246EB95
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 16:48:23 +0000 (UTC)
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210305164253.11788-1-jcline@redhat.com>
 <20210305164253.11788-3-jcline@redhat.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <817ec0ea-e15b-3194-3087-c9bd2f5eed59@amd.com>
Date: Fri, 5 Mar 2021 11:48:04 -0500
In-Reply-To: <20210305164253.11788-3-jcline@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] kms_hdr: Fix bpc-switch tests on
 AMD hardware
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
To: Jeremy Cline <jcline@redhat.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-03-05 11:42 a.m., Jeremy Cline wrote:
> Kernel commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be
> enabled whenever the CRTC is") causes the bpc-switch tests to fail,
> since the primary plane fb is being removed, which leads to the next
> atomic commit failing with -EINVAL.
> 
> This stops the removal of the primary plane fb before switching to 10
> bits per component and the test now runs successfully.
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

You'll want to ping someone from Intel or the IGT maintainers for patch 
1 in the series, however.

Regards,
Nicholas Kazlauskas

> ---
>   tests/kms_hdr.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 7617e8a5..8aa3ea78 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -223,8 +223,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
>   			data->h = afb.height;
>   		}
>   
> -		igt_plane_set_fb(data->primary, NULL);
> -
>   		/*
>   		 * i915 driver doesn't expose max bpc as debugfs entry,
>   		 * so limiting assert only for amd driver.
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
