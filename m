Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EFC10E0CA
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 14:14:59 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:13:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y5c3G5t7DhBvFwc6@kamilkon-desk1>
References: <20221211195302.120794-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221211195302.120794-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH igt] tests/msm: Read the devcore back in
 recovery tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,

before sending again please rebase on current igt (see logs from
gitlab).
I have also one small nit below.

On 2022-12-11 at 11:53:02 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This also adds coverage for codepaths related to reading back the
> devcore file from sysfs, to help catch issues like
> https://gitlab.freedesktop.org/drm/msm/-/issues/20
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/msm/msm_recovery.c | 42 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
> index e01087b4..4c2f2846 100644
> --- a/tests/msm/msm_recovery.c
> +++ b/tests/msm/msm_recovery.c
> @@ -22,14 +22,54 @@
>   */
>  
>  #include <fcntl.h>
> +#include <glob.h>
>  
>  #include "igt.h"
>  #include "igt_msm.h"
> +#include "igt_io.h"
>  
>  static struct msm_device *dev;
>  static struct msm_bo *scratch_bo;
>  static uint32_t *scratch;
>  
> +/*
> + * Helper to read and clear devcore.  We want to read it completely to ensure
> + * we catch any kernel side regressions like:
> + * https://gitlab.freedesktop.org/drm/msm/-/issues/20
> + */
> +
> +static void
> +read_and_clear_devcore(void)
> +{
> +	glob_t glob_buf = {0};
> +	int ret, fd;
> +
> +	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
> +	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
> +		return;
> +
> +	fd = open(glob_buf.gl_pathv[0], O_RDWR);
> +
> +	if (fd >= 0) {
> +		char buf[0x1000];
> +
> +		/*
> +		 * We want to read the entire file but we can throw away the
> +		 * contents.. we just want to make sure that we exercise the
> +		 * kernel side codepaths hit when reading the devcore from
> +		 * sysfs
> +		 */
> +		do {
> +			ret = igt_readn(fd, buf, sizeof(buf));
> +		} while (ret > 0);
> +
> +		/* Clear the devcore: */
> +		igt_writen(fd, "1", 1);

Put here:
		fclose(fd);

Regards,
Kamil

> +	}
> +
> +	globfree(&glob_buf);
> +}
> +
>  /*
>   * Helpers for cmdstream packet building:
>   */
> @@ -102,6 +142,8 @@ do_hang_test(struct msm_pipe *pipe)
>  			continue;
>  		igt_assert_eq(scratch[1+i], 2+i);
>  	}
> +
> +	read_and_clear_devcore();
>  }
>  
>  /*
> -- 
> 2.38.1
> 
