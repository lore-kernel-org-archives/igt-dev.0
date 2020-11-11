Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1E289E5A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 10:17:21 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:17:12 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111101712.GE7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110075102.5033-6-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v3 5/8] tests/fbdev: Add tests for write
 operations on framebuffer
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

On Tue, Nov 10, 2020 at 08:50:59AM +0100, Thomas Zimmermann wrote:
> The write tests check the written buffer against the content of the mapped
> framebuffer.
> 
> v3:
> 	* put igt_describe() before igt_subtest() (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index a6376c3b..02abdede 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -135,6 +135,26 @@ static void framebuffer_tests(int fd)
>  		igt_require_f(pos, "found 0x55 at pos %zu, none expected\n", pos - buf);
>  	}
>  
> +	igt_describe("Check write operations on framebuffer memory");
> +	igt_subtest("write") {
> +		ssize_t ret;
> +		int cmp;
> +
> +		/* write 0 to framebuffer and compare */
> +		memset(buf, 0, fix_info.smem_len);
> +		ret = pwrite(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed, ret=%zd\n", ret);
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
> +
> +		/* write 0x55 to framebuffer and compare */
> +		memset(buf, 0x55, fix_info.smem_len);
> +		ret = pwrite(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed, ret=%zd\n", ret);
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");


igt_asserts here instead of igt_require.


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
