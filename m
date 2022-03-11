Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3410E262
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 14:29:20 +0000 (UTC)
Date: Fri, 11 Mar 2022 15:29:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YitcvFXui8/twpK0@kamilkon-DESK1>
References: <20220311042210.179018-1-priyanka.dandamudi@intel.com>
 <20220311042210.179018-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311042210.179018-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/gem_flink_basic: Add subtests
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-03-11 at 09:52:09 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add description for all subtests
> 
> v2: Modified a description to be more clear
> 
> v3: Rebase
> 
> v4: Modified descriptions
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_flink_basic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index 48b0b8b1..3d83e9aa 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -161,16 +161,26 @@ igt_main
>  	igt_fixture
>  		fd = drm_open_driver(DRIVER_INTEL);
>  
> +	igt_describe("Check if gem object can be exported to global namespace"
> +		     " and then opened");

Add dot at end of sentence.

>  	igt_subtest("basic")
>  		test_flink(fd);
> +
> +	igt_describe("Tests that multiple flinks for the same gem object share"
> +		     " the same name");

Same here, add dot.

>  	igt_subtest("double-flink")
>  		test_double_flink(fd);
> +
> +	igt_describe("Verify that GEM_FLINK ioctl with invalid gem object fails.");
>  	igt_subtest("bad-flink")
>  		test_bad_flink(fd);
> +
> +	igt_describe("Verify that GEM_OPEN ioctl with invalid flink name fails.");
>  	igt_subtest("bad-open")
>  		test_bad_open(fd);
>  
>  	/* Flink lifetime is limited to that of the gem object it points to */
> +	igt_describe("Tests flink lifetime by referencing from multiple descriptors.");
>  	igt_subtest("flink-lifetime")
>  		test_flink_lifetime(fd);
>  }
> -- 
> 2.25.1
> 

With that fixed you can add my r-b,

regards,
Kamil
