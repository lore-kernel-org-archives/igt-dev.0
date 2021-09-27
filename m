Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B0C89DCF
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Sep 2021 12:57:19 +0000 (UTC)
Date: Mon, 27 Sep 2021 16:00:39 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVHAd4LdBx25Ox67@platvala-desk.ger.corp.intel.com>
References: <20210924185510.551979-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924185510.551979-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_addfb_basic: Remove handling for
 Unknown Vendor.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, arek@hiler.eu, Rodrigo.Siqueira@amd.com, anson.jacob@amd.com, abhinavk@codeaurora.org, robdclark@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 02:55:10PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Looking at multiple drivers such as i915, amdgpu, and msm, EINVAL is the
> standard errno when failing some fb errors.
> Unless it's an exception like nouveau, every driver should act in a
> standard manner and return EINVAL just like every other driver. Hence,
> no special handling for unknown vendor is needed.
> 
> [How]
> Remove asserts for specific drivers except for a known exception.
> 
> Tested on ChromeOS Trogdor(msm).
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_addfb_basic.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 082f10ee..35c2ae2c 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -307,17 +307,10 @@ static void pitch_tests(int fd)
>  		igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
>  			f.pitches[0] = bad_pitches[i];
>  			igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
> -			igt_assert(errno != 0);
> -			if (is_i915_device(fd) || is_amdgpu_device(fd) || is_msm_device(fd)) {
> +			if (is_nouveau_device(fd) && bad_pitches[i] > 4 * 1024)
> +				igt_assert_eq(errno, ERANGE);
> +			else
>  				igt_assert_eq(errno, EINVAL);
> -			} else if (is_nouveau_device(fd)) {
> -				if (bad_pitches[i] > 4 * 1024)
> -					igt_assert_eq(errno, ERANGE);
> -				else
> -					igt_assert_eq(errno, EINVAL);
> -			} else {
> -				igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> -			}
>  			errno = 0;
>  		}
>  	}
> @@ -479,13 +472,10 @@ static void size_tests(int fd)
>  		for (i = 0; i < ARRAY_SIZE(framebuffers); i++) {
>  			igt_debug("Checking framebuffer %i\n", i);
>  			igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, framebuffers[i]), -1);
> -			igt_assert(errno != 0);
> -			if (is_i915_device(fd))
> -				igt_assert_eq(errno, EINVAL);
> -			else if (is_nouveau_device(fd))
> +			if (is_nouveau_device(fd))
>  				igt_assert_eq(errno, ERANGE);
>  			else
> -				igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> +				igt_assert_eq(errno, EINVAL);
>  			errno = 0;
>  		}
>  	}
> @@ -495,12 +485,10 @@ static void size_tests(int fd)
>  	igt_subtest("bo-too-small") {
>  		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
>  		igt_assert(errno != 0);
> -		if (is_i915_device(fd))
> -			igt_assert_eq(errno, EINVAL);
> -		else if (is_nouveau_device(fd))
> +		if (is_nouveau_device(fd))
>  			igt_assert_eq(errno, ERANGE);
>  		else
> -			igt_info("Unknown vendor; errno unchecked (returned %i)", errno);
> +			igt_assert_eq(errno, EINVAL);
>  		errno = 0;
>  	}

Tentatively,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>

How does this map to the holy trinity of

1) documentation for the ioctl
2) actual behaviour of the ioctl across drivers (this one is already answered in the commit message though)
3) how non-IGT userspace handles the ioctl


-- 
Petri Latvala
