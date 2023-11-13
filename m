Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1509B10E337
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 09:57:55 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40a4d04af5cso12437695e9.0
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 01:57:55 -0800 (PST)
Message-ID: <db3b1986-771f-456b-aab4-5ef4cf86c84d@gmail.com>
Date: Mon, 13 Nov 2023 11:57:45 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t] Revert "syncobj_timeline: don't expect EINVAL
 for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 13.11.2023 11.43, Bhanuprakash Modem wrote:
> This reverts commit f6f5903348eff6510f8877043f9397a2a5cb94b3.
> 
> This patch is causing the regression in CI.
> 
> [1767/1775] Generating i915_tests.rst with a custom command
> FAILED: docs/testplan/i915_tests.rst
> ./igt_doc.py --config ../tests/intel/i915_test_config.json --rest docs/testplan/i915_tests.rst --check-testlist --igt-build-path ./build
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-signaled doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-all-available-unsubmitted-submitted-signaled doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-signaled doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-multi-wait-available-unsubmitted-submitted-signaled doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-single-wait-all-available-unsubmitted doesn't exist on source files
> Warning: Documented igt@syncobj_timeline@invalid-single-wait-available-unsubmitted doesn't exist on source files
> Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted
> Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-signaled
> Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted
> Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-all-available-unsubmitted-submitted-signaled
> Warning: Missing documentation for igt@syncobj_timeline@etime-multi-wait-available-unsubmitted
> Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-all-available-unsubmitted
> Warning: Missing documentation for igt@syncobj_timeline@etime-single-wait-available-unsubmitted
> Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-signaled
> Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted
> Warning: Missing documentation for igt@syncobj_timeline@multi-wait-available-unsubmitted-submitted-signaled
> Please refer: docs/test_documentation.md for more details
> [1771/1775] Compiling C object runner/runner_test.p/runner_tests.c.o
> ninja: build stopped: subcommand failed.
> 
> Cc: Erik Kurzinger <ekurzinger@nvidia.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/syncobj_timeline.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 0422bca51..b4e1d093a 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -1782,7 +1782,7 @@ igt_main
>   						WAIT_SIGNALED)) != 1)
>   			continue;
>   
> -		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE)))
> +		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT))
>   			err = -EINVAL;
>   		else if (!(flags & WAIT_SIGNALED) && !((flags & WAIT_SUBMITTED) && (flags & WAIT_AVAILABLE)))
>   			err = -ETIME;
> @@ -1851,7 +1851,7 @@ igt_main
>   			continue;
>   
>   		err = 0;
> -		if ((flags & WAIT_UNSUBMITTED) && !((flags & WAIT_FOR_SUBMIT) || (flags & WAIT_AVAILABLE))) {
> +		if ((flags & WAIT_UNSUBMITTED) && !(flags & WAIT_FOR_SUBMIT)) {
>   			err = -EINVAL;
>   		} else if (flags & WAIT_ALL) {
>   			if (flags & (WAIT_UNSUBMITTED | WAIT_SUBMITTED))
