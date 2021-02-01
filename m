Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11896E3F0
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 05:11:32 +0000 (UTC)
Date: Mon, 1 Feb 2021 10:43:16 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20210201051316.GA593586@intel.com>
References: <20210129074917.2480118-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210129074917.2480118-1-arundhati.hagaragi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_universal_plane:Added
 subtest description
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
To: Arundhati Hagaragi <arundhati.hagaragi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-01-29 at 13:19:17 +0530, Arundhati Hagaragi wrote:
> Added description for all subtests
> 
> Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> 
> v2: removed extra bracket and semicolon.
> ---
>  tests/kms_universal_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 46d6d180..aae3fc52 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -758,26 +758,32 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>  		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
>  	}
>  
> +	igt_describe("Check the switching between different primary plane fbs with CRTC off");
>  	igt_subtest_f("universal-plane-pipe-%s-functional",
>  		      kmstest_pipe_name(pipe))
>  		for_each_valid_output_on_pipe(&data->display, pipe, output)
>  			functional_test_pipe(data, pipe, output);
>  
> +	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
>  	igt_subtest_f("universal-plane-pipe-%s-sanity",
>  		      kmstest_pipe_name(pipe))
>  		for_each_valid_output_on_pipe(&data->display, pipe, output)
>  			sanity_test_pipe(data, pipe, output);
>  
> +	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
> +			" and pageflip execution");
>  	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
>  		      kmstest_pipe_name(pipe))
>  		for_each_valid_output_on_pipe(&data->display, pipe, output)
>  			pageflip_test_pipe(data, pipe, output);
>  
> +	igt_describe("Check for cursor leaks after performing cursor operations");
>  	igt_subtest_f("cursor-fb-leak-pipe-%s",
>  		      kmstest_pipe_name(pipe))
>  		for_each_valid_output_on_pipe(&data->display, pipe, output)
>  			cursor_leak_test_pipe(data, pipe, output);
>  
> +	igt_describe("Check if pageflip succeeds in windowed setting");
>  	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
>  		      kmstest_pipe_name(pipe))
>  		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -- 
> 2.25.1
> 

LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
