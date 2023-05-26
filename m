Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF3710E7E7
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 10:44:30 +0000 (UTC)
Date: Fri, 26 May 2023 12:44:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: priyanka.dandamudi@intel.com
Message-ID: <20230526104418.4t6eudzhyn5es6x4@zkempczy-mobl2>
References: <20230526050855.4115107-1-priyanka.dandamudi@intel.com>
 <20230526050855.4115107-3-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526050855.4115107-3-priyanka.dandamudi@intel.com>
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

On Fri, May 26, 2023 at 10:38:54AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add negative test to check bad extensions.
> 
> v2: Add default alignment for the object size.(Zbigniew)
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 

> ---
>  tests/xe/xe_mmap.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> index 3e3f165b..a5da6fa9 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -74,6 +74,26 @@ static void test_bad_flags(int fd)
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
> +	uint64_t size = xe_get_default_alignment(fd);
> +	struct xe_user_extension ext;
> +	struct drm_xe_gem_mmap_offset mmo = {
> +		.handle = xe_bo_create(fd, 0, 0, size),
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
> @@ -95,6 +115,9 @@ igt_main
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
