Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494DF10E2E0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 11:41:37 +0000 (UTC)
Date: Mon, 22 May 2023 13:41:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Message-ID: <20230522114132.bcqytkwpqpkblldm@zkempczy-mobl2>
References: <20230520121056.3926557-1-priyanka.dandamudi@intel.com>
 <20230520121056.3926557-3-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230520121056.3926557-3-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] xe/xe_mmap: Negative test to
 extensions
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

On Sat, May 20, 2023 at 05:40:55PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add negative test to check bad extensions.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_mmap.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> index 011b8893..f6f6b2af 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -73,6 +73,25 @@ static void test_bad_flags(int fd)
>  	gem_close(fd, mmo.handle);
>  }
>  
> +/**
> + * SUBTEST: bad-extensions
> + * Description: Test mmap offset with bad extensions.
> + *
> + */
> +static void test_bad_extensions(int fd)
> +{
> +	struct xe_user_extension ext;
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = xe_bo_create(fd, 0, 0, 4096),

Same issue like in 1/3. Rest looks correct.

--
Zbigniew

> +	};
> +
> +	mmo.extensions = to_user_pointer(&ext);
> +	ext.name = -1;
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo, EINVAL);
> +	gem_close(fd, mmo.handle);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -94,6 +113,9 @@ igt_main
>  	igt_subtest("bad-flags")
>  		test_bad_flags(fd);
>  
> +	igt_subtest("bad-extensions")
> +		test_bad_extensions(fd);
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
> -- 
> 2.25.1
> 
