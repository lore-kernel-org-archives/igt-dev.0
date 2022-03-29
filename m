Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C773C10E8CC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Mar 2022 15:47:01 +0000 (UTC)
Date: Tue, 29 Mar 2022 17:46:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkMp32PK/bWkWr7j@kamilkon-DESK1>
References: <20220317051133.27881-1-sai.gowtham.ch@intel.com>
 <20220317051133.27881-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220317051133.27881-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_basic: Add test
 description to the subtest.
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

Dnia 2022-03-17 at 10:41:32 +0530, sai.gowtham.ch@intel.com napisał(a):
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description to subtests that are available.
> 
> Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_exec_basic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 008a35d0..21062ba2 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -63,6 +63,8 @@ igt_main
>  					    I915_DEVICE_MEMORY);
>  	}
>  
> +	igt_describe("Check basic funtionality of GEM_EXECBUFFER2 ioctl on every"
-------------------------------------^
s/funtionality/functionality/

With that fixed you can add my r-b tag.

Regards,
Kamil

> +		     " ring and iterating over memory regions.");
>  	igt_subtest_with_dynamic("basic") {
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> -- 
> 2.35.1
> 
