Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DE789D86
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 11:32:07 +0000 (UTC)
Date: Mon, 23 Nov 2020 13:32:02 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201123113202.GQ7444@platvala-desk.ger.corp.intel.com>
References: <20201120105217.5058-1-tzimmermann@suse.de>
 <20201120105217.5058-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120105217.5058-3-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v6 2/8] tests/fbdev: Map framebuffer in
 igt_fixture
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
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 11:52:11AM +0100, Thomas Zimmermann wrote:
> The mapping of the framebuffer memory will be useful for read/write
> tests. Move it into an igt_fixture block.
> 
> v4:
> 	* declare map as volatile (Petri)
> 	* test struct fb_fix_screeninfo.smem_len with igt_assert()
> 	* remove mmap test from CI
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This commit is not as standalone as one would hope, but it's
standalone enough to not break too much without the rest of the
series...

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/fbdev.c                         | 12 +++++-------
>  tests/intel-ci/fast-feedback.testlist |  1 -
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index a803f445..eebd2a83 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -63,22 +63,20 @@ static void mode_tests(int fd)
>  static void framebuffer_tests(int fd)
>  {
>  	struct fb_fix_screeninfo fix_info;
> +	void * volatile map;
>  
>  	igt_fixture {
>  		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
> -	}
> -
> -	igt_describe("Check mmap operations on framebuffer memory");
> -	igt_subtest("mmap") {
> -		void *map;
> -
> -		igt_require(fix_info.smem_len);
> +		igt_assert(fix_info.smem_len);
>  
>  		map = mmap(NULL, fix_info.smem_len,
>  			   PROT_WRITE, MAP_SHARED, fd, 0);
>  		igt_assert(map != MAP_FAILED);
>  
>  		memset(map, 0, fix_info.smem_len);
> +	}
> +
> +	igt_fixture {
>  		munmap(map, fix_info.smem_len);
>  	}
>  }
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index a40410a8..cf66b4da 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -3,7 +3,6 @@
>  igt@core_auth@basic-auth
>  igt@debugfs_test@read_all_entries
>  igt@fbdev@info
> -igt@fbdev@mmap
>  igt@gem_basic@bad-close
>  igt@gem_basic@create-close
>  igt@gem_basic@create-fd-close
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
