Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F4711348D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 08:07:06 +0000 (UTC)
Date: Wed, 22 Jun 2022 10:06:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YrLNnn/0clZPrhoi@kamilkon-desk1>
References: <20220620110046.3057440-1-janga.rahul.kumar@intel.com>
 <20220620110046.3057440-2-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220620110046.3057440-2-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/prime_vgem : Added subtests
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2022-06-20 at 16:30:45 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Added test description to basic subtests.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/prime_vgem.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 5fa6e537..4eae723f 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -1128,15 +1128,19 @@ igt_main
>  		gem_require_mmap_device_coherent(i915);
>  	}
>  
> +	igt_describe("Examine read acess path.");
----------------------------------- ^
s/acess/access/

>  	igt_subtest("basic-read")
>  		test_read(vgem, i915);
>  
> +	igt_describe("Examine write acess path.");

Same here.

>  	igt_subtest("basic-write")
>  		test_write(vgem, i915);
>  
> +	igt_describe("Check that we wrap the vgem mmap with userptr.");
>  	igt_subtest("basic-userptr")
>  		test_userptr(vgem, i915);
>  
> +	igt_describe("Examine acess path through gtt.");

Same here.

>  	igt_subtest("basic-gtt") {
>  		gem_require_mappable_ggtt(i915);
>  		test_gtt(vgem, i915);
> @@ -1180,8 +1184,11 @@ igt_main
>  			igt_require(vgem_has_fences(vgem));
>  		}
>  
> +		igt_describe("Examine read acess path fencing.");

Same here.

Regards,
Kamil

>  		igt_subtest("basic-fence-read")
>  			test_fence_read(i915, vgem);
> +
> +		igt_describe("Examine gtt access path fencing.");
>  		igt_subtest("basic-fence-mmap") {
>  			gem_require_mappable_ggtt(i915);
>  			test_fence_mmap(i915, vgem);
> -- 
> 2.25.1
> 
