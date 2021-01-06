Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647389EF7
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jan 2021 10:43:09 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
Date: Wed, 6 Jan 2021 10:43:01 +0000
Message-ID: <72424e6bffd949ac8933c0dcc73045d4@intel.com>
References: <20201208231617.1346190-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20201208231617.1346190-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_interruptible:add test
 description
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
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hagaragi,
 Arundhati" <arundhati.hagaragi@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Cc: "Sharma@freedesktop.org" <Sharma@freedesktop.org>, "Gupta@freedesktop.org" <Gupta@freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>arundhati.hagaragi@intel.com
>Sent: Wednesday, December 9, 2020 4:46 AM
>To: igt-dev@lists.freedesktop.org; Hagaragi, Arundhati
><arundhati.hagaragi@intel.com>; Sharma, Swati2
><swati2.sharma@intel.com>; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
>Cc: Gupta@freedesktop.org; Sharma@freedesktop.org
>Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_interruptible:add test
>description
>
>From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
>
>Added Test description for test case
>
>Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
>Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
>Cc: Sharma, Swati2 <swati2.sharma@intel.com>
>---
> tests/kms_atomic_interruptible.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/tests/kms_atomic_interruptible.c
>b/tests/kms_atomic_interruptible.c
>index 3ba75089..8410a6d0 100644
>--- a/tests/kms_atomic_interruptible.c
>+++ b/tests/kms_atomic_interruptible.c
>@@ -284,6 +284,7 @@ igt_main
> 		igt_require_sw_sync();
> 	}
>
Change the statement like "Tests the interrupt properties" as the below statement is more generic
>+	igt_describe("Tests the properties of default modeset");
Also change default as legacy
> 	igt_subtest_with_dynamic("legacy-setmode") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe)) @@ -292,6 +293,7
>@@ igt_main
> 		}
> 	}
>
>+	igt_describe("Tests the properties of specified modeset");
Same goes here
> 	igt_subtest_with_dynamic("atomic-setmode") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe)) @@ -300,6 +302,7
>@@ igt_main
> 		}
> 	}
>
>+	igt_describe("Tests the DPMS properties for CRTC");
> 	igt_subtest_with_dynamic("legacy-dpms") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe)) @@ -308,6 +311,7
>@@ igt_main
> 		}
> 	}
>
>+	igt_describe("Tests the flipping from user framebuffer to display
>+port");
> 	igt_subtest_with_dynamic("legacy-pageflip") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe)) @@ -316,6 +320,7
>@@ igt_main
> 		}
> 	}
>
>+	igt_describe("Tests the cursor properties");
> 	igt_subtest_with_dynamic("legacy-cursor") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe)) @@ -324,6 +329,7
>@@ igt_main
> 		}
> 	}
>
>+	igt_describe("Tests plane properties with DRM mode
>+hdisplay,vdisplay");
> 	igt_subtest_with_dynamic("universal-setplane-primary") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe)) @@ -332,6 +338,7
>@@ igt_main
> 		}
> 	}
>
>+	igt_describe("Tests plane properties with DRM mode 64, 64");
> 	igt_subtest_with_dynamic("universal-setplane-cursor") {
> 		for_each_pipe_with_valid_output(&display, pipe, output) {
> 			igt_dynamic_f("%s-pipe-%s",
>igt_output_name(output), kmstest_pipe_name(pipe))
>--
>2.25.1
>
>_______________________________________________
>igt-dev mailing list
>igt-dev@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
