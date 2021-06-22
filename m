Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EF16E461
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 09:40:15 +0000 (UTC)
Date: Tue, 22 Jun 2021 12:42:01 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNGwaY6ZzcRVKOw9@platvala-desk.ger.corp.intel.com>
References: <20210622090221.1741111-1-boris.brezillon@collabora.com>
 <20210622090221.1741111-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622090221.1741111-2-boris.brezillon@collabora.com>
Subject: Re: [igt-dev] [PATCH v2 1/8] tests/panfrost: Make sure we open a
 DUMB capable node for prime tests
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
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy <robin.murphy@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 11:02:14AM +0200, Boris Brezillon wrote:
> v2:
> * Use __drm_open_driver_another()
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  tests/panfrost_prime.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/panfrost_prime.c b/tests/panfrost_prime.c
> index 351d46f2f7e6..dbc741a9eacb 100644
> --- a/tests/panfrost_prime.c
> +++ b/tests/panfrost_prime.c
> @@ -35,13 +35,33 @@
>  #include <sys/ioctl.h>
>  #include "panfrost_drm.h"
>  
> +static bool igt_has_dumb(int fd)
> +{
> +	uint64_t value = 0;
> +	int ret;
> +
> +	ret = drmGetCap(fd, DRM_CAP_DUMB_BUFFER, &value);
> +	igt_assert(ret == 0 || errno == EINVAL || errno == EOPNOTSUPP);
> +	return value == 1;
> +}
> +
> +static bool igt_has_prime(int fd, uint64_t flags)
> +{
> +	uint64_t value = 0;
> +	int ret;
> +
> +	ret = drmGetCap(fd, DRM_CAP_PRIME, &value);
> +	igt_assert(ret == 0 || errno == EINVAL || errno == EOPNOTSUPP);
> +	return (value & flags) == flags;
> +}
> +
>  igt_main
>  {
>  	int fd, kms_fd;
>  
>  	igt_fixture {
> -		kms_fd = drm_open_driver_master(DRIVER_ANY);
>  		fd = drm_open_driver(DRIVER_PANFROST);
> +		kms_fd = __drm_open_driver_another(1, DRIVER_ANY);
>  	}
>  
>  	igt_subtest("gem-prime-import") {
> @@ -50,6 +70,9 @@ igt_main
>  	        struct drm_panfrost_get_bo_offset get_bo_offset = {0,};
>  		int dmabuf_fd;
>  
> +		igt_skip_on(!igt_has_dumb(kms_fd) ||
> +			    !igt_has_prime(kms_fd, DRM_PRIME_CAP_EXPORT));

For better logs in case any of these trigger, use separate clauses:

igt_require(igt_has_dumb(kms_fd));
igt_require(igt_has_prime(kms_fd, DRM_PRIME_CAP_EXPORT));


Either way, LGTM
Acked-by: Petri Latvala <petri.latvala@intel.com>

> +
>  		/* Just to be sure that when we import the dumb buffer it has
>  		 * a non-NULL address.
>  		 */
> -- 
> 2.31.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
