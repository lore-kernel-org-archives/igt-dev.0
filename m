Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73CC10E054
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 10:28:38 +0000 (UTC)
Message-ID: <4fe1d761-1c52-01af-d28a-7100ba58c3fe@intel.com>
Date: Thu, 23 Feb 2023 15:55:28 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, <juhapekka.heikkila@gmail.com>
References: <20230212062758.1956925-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230212062758.1956925-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/2] tests/kms_cursor_legacy: Fix CI tiemout
 issues
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


On 2/12/2023 11:57 AM, Bhanuprakash Modem wrote:
> After introducing the dynamic subtests, tests are getting timedout
> on CI. This patch will partially reverts dynamic subtests to avoid
> such timeouts.
>
> Fixes: c02f0d48c (tests/kms_cursor_legacy: Convert tests to dynamic)
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 124 ++++++++++++++++++--------------------
>   1 file changed, 58 insertions(+), 66 deletions(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index f1e55906a..feea1ac83 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1524,7 +1524,6 @@ igt_main
>   		"atomic-transitions",
>   		"atomic-transitions-varying-size"
>   	};
> -	const char *prefix[2] = {"basic", "short"};
>   
>   	igt_fixture {
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -1667,39 +1666,46 @@ igt_main
>   			flip_vs_cursor_busy_crc(&display, true);
>   	}
>   
> -	for (i = 0; i < ARRAY_SIZE(prefix); i++) {
> -		int j;
> -
> -		igt_describe("Adds variety of tests:\n"
> -			"* varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n"
> -			"* atomic-transition: alternates between a full screen sprite plane "
> -				"and full screen primary plane.\n"
> -			"* toggle: which toggles cursor visibility and make sure cursor moves between updates.");
> -		igt_subtest_group {
> -			igt_fixture
> -				igt_display_require_output(&display);
> -
> -			igt_subtest_with_dynamic_f("%s-flip-before-cursor", prefix[i]) {
> -				for (j = 0; j <= flip_test_last; j++) {
> -					igt_dynamic_f("%s", modes[j])
> -						basic_flip_cursor(&display, j, FLIP_BEFORE_CURSOR, 0);
> -				}
> -			}
> +	igt_describe("Adds variety of tests:\n"
> +		"* varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n"
> +		"* atomic-transition: alternates between a full screen sprite plane "
> +			"and full screen primary plane.\n"
> +		"* toggle: which toggles cursor visibility and make sure cursor moves between updates.");
> +	igt_subtest_group {
> +		struct {
> +			const char *name;
> +			enum basic_flip_cursor order;
> +			unsigned flags;
> +		} tests[] = {
> +			{ "flip-before-cursor", FLIP_BEFORE_CURSOR, 0 },
> +			{ "busy-flip-before-cursor", FLIP_BEFORE_CURSOR, BASIC_BUSY },
> +			{ "flip-after-cursor", FLIP_AFTER_CURSOR, 0 },
> +		};
> +		int t;
>   
> -			igt_subtest_with_dynamic_f("%s-busy-flip-before-cursor", prefix[i]) {
> -				igt_require(!cursor_slowpath(&display, i));
> -				igt_require_gem(display.drm_fd);
> +		igt_fixture
> +			igt_display_require_output(&display);
>   
> -				for (j = 0; j <= flip_test_last; j++) {
> -					igt_dynamic_f("%s", modes[j])
> -						basic_flip_cursor(&display, j, FLIP_BEFORE_CURSOR, BASIC_BUSY);
> -				}
> +		for (i = 0; i <= flip_test_last; i++) {
> +			const char *prefix = "short-";
> +
> +			switch (i) {
> +			case flip_test_legacy:
> +			case flip_test_varying_size:
> +			case flip_test_atomic:
> +				prefix = "basic-";
> +				break;
> +			default: break;
>   			}
>   
> -			igt_subtest_with_dynamic_f("%s-flip-after-cursor", prefix[i]) {
> -				for (j = 0; j <= flip_test_last; j++) {
> -					igt_dynamic_f("%s", modes[j])
> -						basic_flip_cursor(&display, j, FLIP_AFTER_CURSOR, 0);
> +			for (t = 0; t < ARRAY_SIZE(tests); t++) {
> +				igt_subtest_f("%s%s-%s", prefix, tests[t].name, modes[i]) {
> +					if (tests[t].flags == BASIC_BUSY) {
> +						igt_require(!cursor_slowpath(&display, i));
> +						igt_require_gem(display.drm_fd);
> +					}
> +
> +					basic_flip_cursor(&display, i, tests[t].order, tests[t].flags);
>   				}
>   			}
>   		}
> @@ -1708,48 +1714,34 @@ igt_main
>   	igt_describe("The essence of the basic test is that neither the cursor nor the "
>   		     "nonblocking flip stall the application of the next");
>   	igt_subtest_group {
> +		struct {
> +			const char *name;
> +			int cursor_pipe;
> +			int flip_pipe;
> +			int timeout;
> +		} tests[] = {
> +			{ "cursorA-vs-flipA", 0, 0, 10 },
> +			{ "cursorA-vs-flipB", 0, 1, 10 },
> +			{ "cursorB-vs-flipA", 1, 0, 10 },
> +			{ "cursorB-vs-flipB", 1, 1, 10 },
> +		};
> +
>   		igt_fixture
>   			igt_display_require_output(&display);
>   
> -		igt_subtest_with_dynamic("flip-vs-cursor") {
> -			for (i = 0; i <= flip_test_last; i++) {
> -				igt_dynamic_f("%s", modes[i])
> -					flip_vs_cursor(&display, i, 150);
> -			}
> -		}
> +		for (i = 0; i <= flip_test_last; i++) {
> +			int j;
>   
> -		igt_subtest_with_dynamic("cursor-vs-flip") {
> -			for (i = 0; i <= flip_test_last; i++) {
> -				igt_dynamic_f("%s", modes[i])
> -					cursor_vs_flip(&display, i, 50);
> -			}
> -		}
> +			igt_subtest_f("cursor-vs-flip-%s", modes[i])
> +				cursor_vs_flip(&display, i, 50);
>   
> -		igt_subtest_with_dynamic("cursorA-vs-flipA") {
> -			for (i = 0; i <= flip_test_last; i++) {
> -				igt_dynamic_f("%s", modes[i])
> -					flip(&display, 0, 0, 10, i);
> -			}
> -		}
> -
> -		igt_subtest_with_dynamic("cursorA-vs-flipB") {
> -			for (i = 0; i <= flip_test_last; i++) {
> -				igt_dynamic_f("%s", modes[i])
> -					flip(&display, 0, 1, 10, i);
> -			}
> -		}
> -
> -		igt_subtest_with_dynamic("cursorB-vs-flipA") {
> -			for (i = 0; i <= flip_test_last; i++) {
> -				igt_dynamic_f("%s", modes[i])
> -					flip(&display, 1, 0, 10, i);
> -			}
> -		}
> +			igt_subtest_f("flip-vs-cursor-%s", modes[i])
> +				flip_vs_cursor(&display, i, 150);
>   
> -		igt_subtest_with_dynamic("cursorB-vs-flipB") {
> -			for (i = 0; i <= flip_test_last; i++) {
> -				igt_dynamic_f("%s", modes[i])
> -					flip(&display, 1, 1, 10, i);
> +			for (j = 0; j < ARRAY_SIZE(tests); j++) {
> +				igt_subtest_f("%s-%s", tests[j].name, modes[i])
> +					flip(&display, tests[j].cursor_pipe,
> +					     tests[j].flip_pipe, tests[j].timeout, i);
>   			}
>   		}
>   	}
