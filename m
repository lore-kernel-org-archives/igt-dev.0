Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD7E10E4C3
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 15:15:45 +0000 (UTC)
Date: Wed, 9 Mar 2022 16:15:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YijEm56I670FRT/E@kamilkon-DESK1>
References: <20220308045819.18471-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220308045819.18471-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_basic: Add test
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

Dnia 2022-03-08 at 10:28:19 +0530, sai.gowtham.ch@intel.com napisał(a):
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description to subtests that are available.

Please send your descripton patches as HAX series, e.g.
add second patch with file tests/intel-ci/fast-feedback.testlist
containing only one line:

igt@meta_test@fail-result

and in cover letter Subject put "HAX add description to [put name of test here]"

See e-mail from Zbigniew on 3 Mar 2022,
"Use HAX for series which add igt_describe"

or https://patchwork.freedesktop.org/series/101198/
as an example.

> 
> Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_exec_basic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 008a35d0..16466b05 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -63,6 +63,8 @@ igt_main
>  					    I915_DEVICE_MEMORY);
>  	}
>  
> +	igt_describe("Basic test to check DRM_IOCTL_I915_GEM_EXECBUFFER2 ioctl on"
> +			" every ring, iterating over memory regions.");
-------------------- ^
When you have multi-line string, please align below ones to that
of above, this should looks like

	igt_describe("Basic test to check DRM_IOCTL_I915_GEM_EXECBUFFER2 ioctl on"
		     " every ring, iterating over memory regions.");
^^
(tabulators, then few spaces for align)

Please also change description, e.g. no need to keep long DRM_ ,
something like: 

Check basic functionality of GEM_EXECBUFFER2 ioctl
on every ring and every memory region.

Split it and align accordingly.


>  	igt_subtest_with_dynamic("basic") {
>  		for_each_combination(regions, 1, set) {
>  			char *sub_name = memregion_dynamic_subtest_name(regions);
> -- 
> 2.35.1
> 
Regards,
Kamil
