Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B920897F3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 09:49:39 +0000 (UTC)
Date: Wed, 11 Nov 2020 11:49:30 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111094930.GB7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110075102.5033-3-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v3 2/8] tests/fbdev: Map framebuffer in
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

On Tue, Nov 10, 2020 at 08:50:56AM +0100, Thomas Zimmermann wrote:
> The mapping of the framebuffer memory will be useful for read/write
> tests. Move it into an igt_fixture block.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 46641fea..fc66210a 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -63,15 +63,10 @@ static void mode_tests(int fd)
>  static void framebuffer_tests(int fd)
>  {
>  	struct fb_fix_screeninfo fix_info;
> +	void *map;

After this patch, map is assigned to in an igt_fixture and read in a
subtest. As igt_fixture uses longjmp(), the value of map when read
depends on whether this is compiled with or without optimizations.

The options for such variables are:

1) move it to global scope
2) make it volatile
3) make a struct data_d with the map (and in a later patch, buf as
   well) variable and assign its members instead.

I think we prefer 3 generally.

-- 
Petri Latvala



>  
>  	igt_fixture {
>  		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
> -	}
> -
> -	igt_describe("Check mmap operations on framebuffer memory");
> -	igt_subtest("mmap") {
> -		void *map;
> -
>  		igt_require(fix_info.smem_len);
>  
>  		map = mmap(NULL, fix_info.smem_len,
> @@ -79,6 +74,9 @@ static void framebuffer_tests(int fd)
>  		igt_assert(map != MAP_FAILED);
>  
>  		memset(map, 0, fix_info.smem_len);
> +	}
> +
> +	igt_fixture {
>  		munmap(map, fix_info.smem_len);
>  	}
>  }
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
