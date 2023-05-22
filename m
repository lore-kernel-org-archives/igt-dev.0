Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852B110E2E2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 11:39:46 +0000 (UTC)
Date: Mon, 22 May 2023 13:39:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Message-ID: <20230522113942.c3z3ody2gclob4re@zkempczy-mobl2>
References: <20230520121056.3926557-1-priyanka.dandamudi@intel.com>
 <20230520121056.3926557-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230520121056.3926557-2-priyanka.dandamudi@intel.com>
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

On Sat, May 20, 2023 at 05:40:54PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add negative test by adding invalid mmap flags and check
> for related errors.
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_mmap.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> index 6b313a18..011b8893 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -57,6 +57,22 @@ test_mmap(int fd, uint32_t flags)
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
	uint64_t size = xe_get_default_alignment(fd);

> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = xe_bo_create(fd, 0, 0, 4096),
                                                 ^ -> size
> +		.flags = -1u,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, EINVAL);
> +	gem_close(fd, mmo.handle);
> +}

Rest looks correct.

--
Zbigniew

> +
>  igt_main
>  {
>  	int fd;
> @@ -75,6 +91,9 @@ igt_main
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
