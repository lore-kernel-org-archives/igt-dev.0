Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1D6E027
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 09:12:32 +0000 (UTC)
Date: Wed, 18 Nov 2020 11:12:28 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201118091228.GA7444@platvala-desk.ger.corp.intel.com>
References: <20201116221844.82283-1-jcline@redhat.com>
 <20201117200207.92128-1-jcline@redhat.com>
 <20201117200207.92128-3-jcline@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117200207.92128-3-jcline@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/kms_addfb_basic: add
 vendor-specific errno assertions
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
To: Jeremy Cline <jcline@redhat.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 03:02:07PM -0500, Jeremy Cline wrote:
> This adjusts the check on failed calls to DRM_IOCTL_MODE_ADDFB2 in
> various scenarios. According to the kernel's
> drm_mode_config_funcs.fb_create documentation, a negative return code is
> all that is required to signal failure, and different drivers return
> different errors in these scenarios.
> 
> Particularly, Nouveau returns -ERANGE rather than -EINVAL in scenarios
> where the buffer is too small for the proposed configuration.
> 
> In situations where Nouveau and Intel return codes diverge, split out
> the errno assertions into device-specific blocks.
> 
> Signed-off-by: Jeremy Cline <jcline@redhat.com>
> ---

Looks good. Just a minor nit below:

> Changes since v2:
>   - Remove vendor-specific subtests.
> 
>  tests/kms_addfb_basic.c | 45 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 0ec583fe..0e5e3aeb 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -281,8 +281,19 @@ static void pitch_tests(int fd)
>  	for (i = 0; i < ARRAY_SIZE(bad_pitches); i++) {
>  		igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
>  			f.pitches[0] = bad_pitches[i];
> -			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -				   errno == EINVAL);
> +			igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
> +			igt_assert(errno != 0);
> +			if (is_i915_device(fd)) {
> +				igt_assert_eq(errno, EINVAL);
> +			} else if (is_nouveau_device(fd)) {
> +				if (bad_pitches[i] > 4 * 1024)
> +					igt_assert_eq(errno, ERANGE);
> +				else
> +					igt_assert_eq(errno, EINVAL);
> +			} else {
> +				igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> +			}
> +			errno = 0;
>  		}
>  	}
>  
> @@ -367,6 +378,8 @@ static void size_tests(int fd)
>  	struct drm_mode_fb_cmd2 f = {};
>  	struct drm_mode_fb_cmd2 f_16 = {};
>  	struct drm_mode_fb_cmd2 f_8 = {};
> +	struct drm_mode_fb_cmd2 *framebuffers[] = {&f, &f_16, &f_8};
> +	int i;
>  
>  	f.width = 1024;
>  	f.height = 1024;
> @@ -426,18 +439,30 @@ static void size_tests(int fd)
>  	f_16.height++;
>  	f_8.height++;
>  	igt_subtest("too-high") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == -1 &&
> -			   errno == EINVAL);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == -1 &&
> -			   errno == EINVAL);
> +		for (i = 0; i < ARRAY_SIZE(framebuffers); i++) {

If any of the asserts trigger in this for-loop, the failure will just
say "assertion failed, errno xyz instead of EINVAL" etc, losing the
information which fb it was we failed on. Add a igt_debug line right
here:

igt_debug("Checking framebuffer %i\n", i);

With that added,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> +			igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, framebuffers[i]), -1);
> +			igt_assert(errno != 0);
> +			if (is_i915_device(fd))
> +				igt_assert_eq(errno, EINVAL);
> +			else if (is_nouveau_device(fd))
> +				igt_assert_eq(errno, ERANGE);
> +			else
> +				igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> +			errno = 0;
> +		}
>  	}
>  
>  	f.handles[0] = gem_bo_small;
>  	igt_subtest("bo-too-small") {
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -			   errno == EINVAL);
> +		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
> +		igt_assert(errno != 0);
> +		if (is_i915_device(fd))
> +			igt_assert_eq(errno, EINVAL);
> +		else if (is_nouveau_device(fd))
> +			igt_assert_eq(errno, ERANGE);
> +		else
> +			igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> +		errno = 0;
>  	}
>  
>  	/* Just to check that the parameters would work. */
> -- 
> 2.28.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
