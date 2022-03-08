Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929510E26F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 15:48:52 +0000 (UTC)
Date: Tue, 8 Mar 2022 16:48:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yid64Qq2s9QqBciz@kamilkon-DESK1>
References: <20220223125837.340407-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220223125837.340407-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_flink_basic: Add subtests description for test case
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

Hi Apoorva,

Dnia 2022-02-23 at 18:28:37 +0530, apoorva1.singh@intel.com napisał(a):
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add description for all subtests
> 
> v2: Modified a description to be more clear
> 
> v3: Rebase
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_flink_basic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Please send your descripton patches as HAX series, e.g.
add second patch with file tests/intel-ci/fast-feedback.testlist
containing only one line:

igt@meta_test@fail-result

and in cover letter Subject put "HAX add description to [put name of test here]"

See e-mail from Zbigniew on 3 Mar 2022,
"Use HAX for series which add igt_describe"

> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index 48b0b8b1..ad370eb4 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -161,16 +161,24 @@ igt_main
>  	igt_fixture
>  		fd = drm_open_driver(DRIVER_INTEL);
>  
> +	igt_describe("Check if gem object can be exported to global namespace and then opened");
>  	igt_subtest("basic")
>  		test_flink(fd);
> +
> +	igt_describe("Tests that multiple flinks for the same gem object share the same name");
>  	igt_subtest("double-flink")
>  		test_double_flink(fd);
> +
> +	igt_describe("Verify that GEM_FLINK ioctl with invalid gem object retuns relevant error");

s/retuns relevant error/fails/

>  	igt_subtest("bad-flink")
>  		test_bad_flink(fd);
> +
> +	igt_describe("Verify that GEM_OPEN ioctl with invalid flink name retuns relevant error");

s/retuns relevant error/fails/

>  	igt_subtest("bad-open")
>  		test_bad_open(fd);
>  
>  	/* Flink lifetime is limited to that of the gem object it points to */
> +	igt_describe("Tests flink lifetime by referencing it from multiple fd's");

s/fd's/descriptors/
Despite that imho comment before test and its content do not
match but this is separate issue.

>  	igt_subtest("flink-lifetime")
>  		test_flink_lifetime(fd);
>  }
> -- 
> 2.25.1
> 

Regards,
Kamil
