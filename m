Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9D6E062
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 09:56:44 +0000 (UTC)
Date: Wed, 11 Nov 2020 11:56:35 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111095635.GD7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110075102.5033-5-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v3 4/8] tests/fbdev: Add tests for unaligned
 reads on framebuffer memory
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

On Tue, Nov 10, 2020 at 08:50:58AM +0100, Thomas Zimmermann wrote:
> The tests for unaligned reads start and stop reading within pages.
> 
> v3:
> 	* put igt_describe() before igt_subtest() (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 97d66217..a6376c3b 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -64,10 +64,13 @@ static void mode_tests(int fd)
>  static void framebuffer_tests(int fd)
>  {
>  	struct fb_fix_screeninfo fix_info;
> -	void *map;
> -	void *buf;
> +	unsigned char *map;
> +	unsigned char *buf;
> +	size_t pagesize;
>  
>  	igt_fixture {
> +		long ret;
> +
>  		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
>  		igt_require(fix_info.smem_len);
>  
> @@ -77,6 +80,10 @@ static void framebuffer_tests(int fd)
>  
>  		buf = malloc(fix_info.smem_len);
>  		igt_assert(buf);
> +
> +		ret = sysconf(_SC_PAGESIZE);
> +		igt_assert(ret != -1);
> +		pagesize = ret;

igt_require for this.


>  	}
>  
>  	igt_describe("Check read operations on framebuffer memory");
> @@ -99,6 +106,35 @@ static void framebuffer_tests(int fd)
>  		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0x55\n");
>  	}
>  
> +	igt_describe("Check read operations on unaligned locations in framebuffer memory");
> +	igt_subtest("unaligned-read") {
> +		off_t off;
> +		size_t len;
> +		ssize_t ret;
> +		const unsigned char *pos;
> +
> +		off = pagesize + (pagesize >> 2); // 1.25 * pagesize
> +		len = (pagesize << 2) + (pagesize >> 1); // 4.5 * pagesize
> +		igt_require_f((off + len) < fix_info.smem_len, "framebuffer too small\n");

Too small to test, or should it always be larger?

> +
> +		/* read at unaligned location and compare */
> +		memset(map, 0, fix_info.smem_len);
> +		memset(&map[off], 0x55, len);
> +		memset(buf, 0xff, fix_info.smem_len);
> +		ret = pread(fd, &buf[off], len, off);
> +		igt_require_f(ret == (ssize_t)len, "pread failed, ret=%zd\n", ret);
> +		pos = memchr(buf, 0x55, fix_info.smem_len);
> +		igt_require_f(pos, "0x55 not found within read buffer\n");
> +		igt_require_f(pos == &buf[off], "0x55 found at pos %zu, expected %lld\n",
> +			     pos - buf, (long long)off);
> +		pos = memchr(&buf[off], 0xff, fix_info.smem_len - off);
> +		igt_require_f(pos, "0xff not found within read buffer\n");
> +		igt_require_f(pos == &buf[off + len], "0xff found at pos %zu, expected %lld\n",
> +			     pos - buf, (long long)(off + len));
> +		pos = memchr(&buf[off + len], 0x55, fix_info.smem_len - off + len);
> +		igt_require_f(pos, "found 0x55 at pos %zu, none expected\n", pos - buf);

These igt_requires should be igt_asserts.


-- 
Petri Latvala


> +	}
> +
>  	igt_fixture {
>  		free(buf);
>  		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
