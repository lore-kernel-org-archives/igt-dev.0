Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BEF36E3F2
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jan 2021 05:33:40 +0000 (UTC)
Date: Fri, 29 Jan 2021 11:05:06 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20210129053506.GA581167@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: Re: [igt-dev] tests/kms_universal_plane:Added subtest description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: 20210120095237.1104339-1-arundhati.hagaragi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arundhati.hagaragi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>


>diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
>index 46d6d180..f277c13c 100644
>--- a/tests/kms_universal_plane.c
>+++ b/tests/kms_universal_plane.c
>@@ -758,26 +758,32 @@  run_tests_for_pipe(data_t *data, enum pipe pipe)
> 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
> 	}
>
>+	igt_describe("Check the switching between different primary plane fbs with CRTC off");
> 	igt_subtest_f("universal-plane-pipe-%s-functional",
> 		      kmstest_pipe_name(pipe))
> 		for_each_valid_output_on_pipe(&data->display, pipe, output)
> 			functional_test_pipe(data, pipe, output);
>
>+	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
> 	igt_subtest_f("universal-plane-pipe-%s-sanity",
> 		      kmstest_pipe_name(pipe))
> 		for_each_valid_output_on_pipe(&data->display, pipe, output)
> 			sanity_test_pipe(data, pipe, output);
>
>+	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL");
>+			" and pageflip execution");
> 	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
> 		      kmstest_pipe_name(pipe))
> 		for_each_valid_output_on_pipe(&data->display, pipe, output)
> 			pageflip_test_pipe(data, pipe, output);
>
>+	igt_describe("Check for cursor leaks after performing cursor operations");
> 	igt_subtest_f("cursor-fb-leak-pipe-%s",
> 		      kmstest_pipe_name(pipe))
> 		for_each_valid_output_on_pipe(&data->display, pipe, output)
> 			cursor_leak_test_pipe(data, pipe, output);
>
>+	igt_describe("Check if pageflip succeeds in windowed setting");
> 	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
> 		      kmstest_pipe_name(pipe))
> 		for_each_valid_output_on_pipe(&data->display, pipe, output)

There are some build errors,
Please do check on that and float V2



_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
