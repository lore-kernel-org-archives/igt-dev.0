Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE2D89EB7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 10:18:21 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:18:12 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111101812.GF7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110075102.5033-7-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v3 6/8] tests/fbdev: Add tests for unaligned
 writes on framebuffer memory
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

On Tue, Nov 10, 2020 at 08:51:00AM +0100, Thomas Zimmermann wrote:
> The tests for unaligned writes start and stop writing within pages.
> 
> v3:
> 	* put igt_describe() before igt_subtest() (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 02abdede..522da8e2 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -155,6 +155,35 @@ static void framebuffer_tests(int fd)
>  		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
>  	}
>  
> +	igt_describe("Check write operations on unaligned locations in framebuffer memory");
> +	igt_subtest("unaligned-write") {
> +		off_t off;
> +		size_t len;
> +		ssize_t ret;
> +		const unsigned char *pos;
> +
> +		off = pagesize + (pagesize >> 2); // 1.25 * pagesize
> +		len = (pagesize << 2) + (pagesize >> 1); // 4.5 * pagesize
> +		igt_require_f((off + len) < fix_info.smem_len, "framebuffer too small\n");

Same question here about framebuffer size as in that one earlier patch.

> +
> +		/* read at unaligned location and compare */
> +		memset(map, 0xff, fix_info.smem_len);
> +		memset(buf, 0, fix_info.smem_len);
> +		memset(&buf[off], 0x55, len);
> +		ret = pwrite(fd, &buf[off], len, off);
> +		igt_require_f(ret == (ssize_t)len, "pwrite failed, ret=%zd\n", ret);
> +		pos = memchr(map, 0x55, fix_info.smem_len);
> +		igt_require_f(pos, "0x55 not found within framebuffer\n");
> +		igt_require_f(pos == &map[off], "0x55 found at pos %zu, expected %lld\n",
> +			     pos - map, (long long)off);
> +		pos = memchr(&map[off], 0xff, fix_info.smem_len - off);
> +		igt_require_f(pos, "0xff not found within framebuffer\n");
> +		igt_require_f(pos == &map[off + len], "0xff found at pos %zu, expected %lld\n",
> +			     pos - map, (long long)(off + len));
> +		pos = memchr(&map[off + len], 0x55, fix_info.smem_len - off + len);
> +		igt_require_f(pos, "found 0x55 at pos %zu, none expected\n", pos - map);

igt_asserts instead of igt_require.


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
