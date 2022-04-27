Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF18310F461
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Apr 2022 16:20:05 +0000 (UTC)
Date: Wed, 27 Apr 2022 18:15:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YmlsE676i48ECWLJ@kamilkon-DESK1>
References: <20220427061726.26383-1-sai.gowtham.ch@intel.com>
 <20220427061726.26383-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220427061726.26383-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_basic: Add test
 description to the subtest.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

On 2022-04-27 at 11:47:25 +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description to subtests that are available.
> 
> Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
---------------- ^
Please correct this to

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

or

Signed-off-by: Sai Gowtham Your_Last_Name_Here <sai.gowtham.ch@intel.com>

You can keep my r-b tag.

Regards,
Kamil

> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_basic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 008a35d0..ab4c1597 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -63,6 +63,8 @@ igt_main
>  					    I915_DEVICE_MEMORY);
>  	}
>  
> +	igt_describe("Check basic functionality of GEM_EXECBUFFER2 ioctl on every"
> +		     " ring and iterating over memory regions.");
>  	igt_subtest_with_dynamic("basic") {
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> -- 
> 2.35.1
> 
