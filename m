Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08F06E52E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 14:11:53 +0000 (UTC)
Date: Thu, 19 Nov 2020 16:11:49 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201119141149.GK7444@platvala-desk.ger.corp.intel.com>
References: <20201119134746.28020-1-tzimmermann@suse.de>
 <20201119134746.28020-9-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119134746.28020-9-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v5 8/8] tests/fbdev: Add tests for
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

On Thu, Nov 19, 2020 at 02:47:46PM +0100, Thomas Zimmermann wrote:
> Trying to read and write with a NULL-pointer buffer should fail and
> report EFAULT.
> 
> v4:
> 	* replace igt_require() by igt_assert() in "nullptr" (Petri)

But they're still igt_requires in there?


-- 
Petri Latvala


> 	* add nullptr test to CI
> v3:
> 	* put igt_describe() before igt_subtest() (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c                         | 11 +++++++++++
>  tests/intel-ci/fast-feedback.testlist |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 62aa99b4..c6139124 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -229,6 +229,17 @@ static void framebuffer_tests(int fd)
>  		igt_assert_f(ret == 0, "read at EOF, ret=%zd\n", ret);
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
> +	}
> +
>  	igt_fixture {
>  		free(buf);
>  		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 0423de80..71bbd173 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -4,6 +4,7 @@ igt@core_auth@basic-auth
>  igt@debugfs_test@read_all_entries
>  igt@fbdev@eof
>  igt@fbdev@info
> +igt@fbdev@nullptr
>  igt@fbdev@read
>  igt@fbdev@unaligned-read
>  igt@fbdev@unaligned-write
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
