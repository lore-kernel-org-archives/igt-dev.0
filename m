Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC1D88401
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 13:41:20 +0000 (UTC)
Date: Tue, 6 Jul 2021 09:41:10 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210706134110.iopwgjfwpnibtyjb@outlook.office365.com>
References: <20210701174424.2261499-1-markyacoub@chromium.org>
 <20210701174424.2261499-2-markyacoub@chromium.org>
Content-Disposition: inline
In-Reply-To: <20210701174424.2261499-2-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] kms_addfb_basic: Check for AMDGPU and MSM
 bad pitch.
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 07/01, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> AMDGPU and MSM devices have a known errno when it fails coorectly for
> bad pitches.
> 
> [How]
> Assert `errno` to `EINVAL` for both AMDGPU and MSM as well.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_addfb_basic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 85c14be5..91fb6ac9 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -310,7 +310,7 @@ static void pitch_tests(int fd)
>  			f.pitches[0] = bad_pitches[i];
>  			igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
>  			igt_assert(errno != 0);
> -			if (is_i915_device(fd)) {
> +			if (is_i915_device(fd) || is_amdgpu_device(fd) || is_msm_device(fd)) {
>  				igt_assert_eq(errno, EINVAL);
>  			} else if (is_nouveau_device(fd)) {
>  				if (bad_pitches[i] > 4 * 1024)
> -- 
> 2.32.0.93.g670b81a890-goog
> 

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Btw, from the CI log, we have:

igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
  shard-apl: NOTRUN -> FAIL
  shard-tglb: NOTRUN -> FAIL
  shard-glk: NOTRUN -> FAIL
  shard-kbl: NOTRUN -> FAIL
  shard-snb: NOTRUN -> FAIL
  shard-iclb: NOTRUN -> FAIL

igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
  shard-iclb: NOTRUN -> SKIP +1 similar issue

I don't know why your patch makes something that was not running start
to run. Any theory?

Thanks

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
