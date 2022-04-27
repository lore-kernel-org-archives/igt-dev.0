Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1D810F3DC
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 16:00:02 +0000 (UTC)
Date: Wed, 27 Apr 2022 17:48:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmllsSnrkYpLFGDU@kamilkon-DESK1>
References: <20220427080243.4253-1-sai.gowtham.ch@intel.com>
 <20220427080243.4253-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220427080243.4253-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_partial_pwrite_pread: Add
 subtests description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2022-04-27 at 13:32:42 +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Add description to all the available subtests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---------------- ^

Please change this to

Signed-off-by: Sai Gowtham your_full_last_name <sai.gowtham.ch@intel.com>

You can do this with global git configuration, just run:

git config --global user.name "Sai Gowtham your_full_lastname_here"

or see https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup
If you do not want your full last name there, at least put "Ch",
but full name is preferable.

Rest looks good so after that fixed you can add my r-b tag.

Regards,
Kamil

> ---
>  tests/i915/gem_partial_pwrite_pread.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
> index 4f81d34b..474149d4 100644
> --- a/tests/i915/gem_partial_pwrite_pread.c
> +++ b/tests/i915/gem_partial_pwrite_pread.c
> @@ -280,12 +280,18 @@ static void do_tests(data_t *data, int cache_level, const char *suffix)
>  			gem_set_caching(data->drm_fd, scratch_buf->handle, cache_level);
>  	}
>  
> +	igt_describe_f("Verify if pread is consistent while accessing partial cachelines "
> +		       "with %s caching level", cache_level == -1 ? "default" : suffix+1);
>  	igt_subtest_f("reads%s", suffix)
>  		test_partial_reads(data);
>  
> +	igt_describe_f("Verify if pwrite is consistent while accessing partial cachelines "
> +		       "with %s caching level", cache_level == -1 ? "default" : suffix+1);
>  	igt_subtest_f("write%s", suffix)
>  		test_partial_writes(data);
>  
> +	igt_describe_f("Verify if both pread, pwrite are consistent while accessing partial "
> +		       "cachelines with %s caching level", cache_level == -1 ? "default" : suffix+1);
>  	igt_subtest_f("writes-after-reads%s", suffix)
>  		test_partial_read_writes(data);
>  }
> -- 
> 2.35.1
> 
