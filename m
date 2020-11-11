Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714A889DB9
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 10:20:38 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:20:30 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111102030.GH7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110075102.5033-9-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v3 8/8] tests/fbdev: Add tests for
 read/writing with NULL-pointer buffers
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

On Tue, Nov 10, 2020 at 08:51:02AM +0100, Thomas Zimmermann wrote:
> Trying to read and write with a NULL-pointer buffer should fail and
> report EFAULT.
> 
> v3:
> 	* put igt_describe() before igt_subtest() (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 8fd920be..814188b5 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -229,6 +229,17 @@ static void framebuffer_tests(int fd)
>  		igt_require_f(ret == 0, "read at EOF, ret=%zd\n", ret);
>  	}
>  
> +	igt_describe("Check framebuffer access with NULL");
> +	igt_subtest("nullptr") {
> +		ssize_t ret;
> +
> +		ret = pread(fd, NULL, fix_info.smem_len, 0);
> +		igt_require_f((ret == -1) && (errno == EFAULT), "reading into NULL did not return EFAULT, ret=%zd\n", ret);
> +
> +		ret = pwrite(fd, NULL, fix_info.smem_len, 0);
> +		igt_require_f((ret == -1) && (errno == EFAULT), "writing from NULL did not return EFAULT, ret=%zd\n", ret);

igt_asserts instead of igt_requires.

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
