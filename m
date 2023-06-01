Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9578210E240
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 13:15:48 +0000 (UTC)
Date: Thu, 1 Jun 2023 15:15:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230601131546.t7zvz4glvhuwqvk2@kamilkon-desk1>
References: <20230531174248.29479-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230531174248.29479-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [RFC,
 i-g-t] tests/kms_vrr: New VRR test to toggle the VRR during fastsets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, mitulkumar.ajitkumar.golani@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

imho you can improve subject:
tests/kms_vrr: New VRR test to toggle the VRR during fastsets

to something like:
tests/kms_vrr: New subtest for toggle VRR during fastsets

On 2023-05-31 at 23:12:48 +0530, Nidhi Gupta wrote:
> Allow VRR to be toggled during fastsets, without
> the need of full modeset.
> 
> v2: move igt_require from fixture
>     (Kamil)
> 

Did you address Mitulkumar notes ?

> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_vrr.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d2d79c4e..4c6a7785 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -45,7 +45,8 @@ enum {
>  	TEST_DPMS = 1 << 1,
>  	TEST_SUSPEND = 1 << 2,
>  	TEST_FLIPLINE = 1 << 3,
> -	TEST_NEGATIVE = 1 << 4,
> +	TEST_FASTSET = 1 << 4,
> +	TEST_NEGATIVE = 1 << 5,
>  };
>  
>  typedef struct range {
> @@ -193,11 +194,14 @@ static bool vrr_capable(igt_output_t *output)
>  }
>  
>  /* Toggles variable refresh rate on the pipe. */
> -static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
> +static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
> +			    bool need_modeset, bool enabled)
>  {
>  	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED,
>  				enabled);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (need_modeset)
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  }
>  
>  /* Prepare the display for testing on the given pipe. */
> @@ -370,7 +374,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
>  
> -	set_vrr_on_pipe(data, pipe, true);
> +	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), true);
>  
>  	/*
>  	 * Do a short run with VRR, but don't check the result.
> @@ -436,7 +440,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	 * modeset. And the expected behavior is the same as disabling VRR on
>  	 * a VRR capable panel.
>  	 */
> -	set_vrr_on_pipe(data, pipe, (flags & TEST_NEGATIVE)? true : false);
> +	set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), (flags & TEST_NEGATIVE)? true : false);
----------------------------------------------------------------------------------- ^
Run checkpatch.pl from Linux kernel tools, it reports:

ERROR: spaces required around that '?' (ctx:VxW)
#63: FILE: tests/kms_vrr.c:443:
+       set_vrr_on_pipe(data, pipe, (flags & ~TEST_FASTSET), (flags & TEST_NEGATIVE)? true : false);
                                                                                    ^
>  	rate = vtest_ns.mid;
>  	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
>  	igt_assert_f(result < 10,
> @@ -526,6 +530,11 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>  
> +	igt_describe("Tests that VRR basic without modeset");
> +	igt_subtest_with_dynamic("flip-basic-fastset")
----------------------------------------------------- ^
Add mising '{':
		
	igt_subtest_with_dynamic("flip-basic-fastset") {

> +		igt_require_intel(data.drm_fd);
> +		run_vrr_test(&data, test_basic, TEST_FASTSET);

end close it:
	}

Btw you should run this with --describe:
./kms_vrr --describe

and see error:
kms_vrr: ../tests/kms_vrr.c:466: run_vrr_test: Assertion `igt_can_fail()' failed.
Received signal SIGABRT.

See also compiler warning:

../lib/igt_core.h:273:40: warning: this ‘for’ clause does not guard... [-Wmisleading-indentation]
  273 | #define igt_subtest_with_dynamic(name) for (; __igt_run_subtest((name), __FILE__, __LINE__) && \
      |                                        ^~~
../tests/kms_vrr.c:534:9: note: in expansion of macro ‘igt_subtest_with_dynamic’
  534 |         igt_subtest_with_dynamic("flip-basic-fastset")
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_vrr.c:536:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘for’
  536 |                 run_vrr_test(&data, test_basic, TEST_FASTSET);
      |                 ^~~~~~~~~~~~

Regards,
Kamil

> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  	}
> -- 
> 2.39.0
> 
