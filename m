Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC8C89F0B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 17:16:37 +0000 (UTC)
Date: Mon, 13 Sep 2021 20:16:31 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210913171631.GB4189981@ideak-desk.fi.intel.com>
References: <20210913165550.16528-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913165550.16528-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: Skip
 basic-y-tiled-legacy on discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 13, 2021 at 09:55:50AM -0700, Ashutosh Dixit wrote:
> The test will fail on discrete and needs to be skipped.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/kms_addfb_basic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 0f641e7dd78..eed7038c39d 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -393,6 +393,7 @@ static void tiling_tests(int fd)
>  		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
>  		f.pitches[0] = 1024*4;
>  		igt_subtest("basic-y-tiled-legacy") {
> +			igt_require(!gem_has_lmem(fd));

Ah yes, it's possible to add a y-tiled FB using an object which doesn't
have a tiling set on it (and the object tiling can't be set on !lmem).
Sorry for missing that:

Reviewed-by: Imre Deak <imre.deak@intel.com>

>  			f.handles[0] = tiled_y_bo;
>  
>  			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
> -- 
> 2.31.1
> 
