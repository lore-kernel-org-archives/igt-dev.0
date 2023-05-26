Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2109310E7E7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 10:43:03 +0000 (UTC)
Date: Fri, 26 May 2023 12:42:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Message-ID: <20230526104256.g4k3jixsxuhkwvj6@zkempczy-mobl2>
References: <20230526050855.4115107-1-priyanka.dandamudi@intel.com>
 <20230526050855.4115107-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526050855.4115107-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] xe/xe_mmap: Negative test for mmap
 flags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 26, 2023 at 10:38:53AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add negative test by adding invalid mmap flags and check
> for related errors.
> 
> v2: Add default alignment for the object size.(Zbigniew)
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Looks good,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/xe/xe_mmap.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> index 6b313a18..3e3f165b 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -57,6 +57,23 @@ test_mmap(int fd, uint32_t flags)
>  	gem_close(fd, bo);
>  }
>  
> +/**
> + * SUBTEST: bad-flags
> + * Description: Test mmap offset with bad flags.
> + *
> + */
> +static void test_bad_flags(int fd)
> +{
> +	uint64_t size = xe_get_default_alignment(fd);
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = xe_bo_create(fd, 0, 0, size),
> +		.flags = -1u,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, EINVAL);
> +	gem_close(fd, mmo.handle);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -75,6 +92,9 @@ igt_main
>  	igt_subtest("vram-system")
>  		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd));
>  
> +	igt_subtest("bad-flags")
> +		test_bad_flags(fd);
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
> -- 
> 2.25.1
> 
