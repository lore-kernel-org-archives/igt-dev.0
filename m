Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1A689E0E
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 16:58:36 +0000 (UTC)
Date: Mon, 21 Jun 2021 20:00:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNDFsW3JsJCmYuXA@platvala-desk.ger.corp.intel.com>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621125724.1592104-2-boris.brezillon@collabora.com>
Subject: Re: [igt-dev] [PATCH 1/7] tests/panfrost: Make sure we open a DUMB
 capable node for prime tests
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

On Mon, Jun 21, 2021 at 02:57:18PM +0200, Boris Brezillon wrote:
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  tests/panfrost_prime.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/panfrost_prime.c b/tests/panfrost_prime.c
> index 351d46f2f7e6..f9818108a662 100644
> --- a/tests/panfrost_prime.c
> +++ b/tests/panfrost_prime.c
> @@ -35,12 +35,36 @@
>  #include <sys/ioctl.h>
>  #include "panfrost_drm.h"
>  
> +static int igt_panfrost_open_kms_driver(void)
> +{
> +	for (unsigned i = 0; i < 2; i++) {
> +		uint64_t cap_dumb_buf = 0, cap_prime = 0;
> +		char path[32];
> +		int fd;
> +
> +		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
> +
> +		fd = open(path, O_RDWR);
> +		if (fd < 0)
> +			continue;
> +
> +		drmGetCap(fd, DRM_CAP_DUMB_BUFFER, &cap_dumb_buf);
> +		drmGetCap(fd, DRM_CAP_PRIME, &cap_prime);
> +		if (cap_dumb_buf && (cap_prime & DRM_PRIME_CAP_EXPORT))
> +			return fd;
> +
> +		close(fd);
> +	}
> +
> +	return -1;
> +}
> +
>  igt_main
>  {
>  	int fd, kms_fd;
>  
>  	igt_fixture {
> -		kms_fd = drm_open_driver_master(DRIVER_ANY);
> +		kms_fd = igt_panfrost_open_kms_driver();


How we've done this kind of thing elsewhere is

1) use drm_open_driver_another(0, DRIVER_foobar) +
drm_open_driver_another(1, DRIVER_something) to open the two driver
fds. The _another variants make sure the fds are from different
devices. Then, check that the fds meet the requirements for testing
with igt_require et al, don't go looking for additional devices. Let
the test produce a 'skip' result if requirements are not met.

2) use device filters when executing the tests to control what devices
get chosen. Docs at
https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Device-selection.html


That way someone who has, say, vkms + vgem + panfrost drivers present
is able to run tests and specify that they don't want you to touch
vkms.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
