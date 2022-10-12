Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE86610E3C7
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 10:40:56 +0000 (UTC)
Message-ID: <38f704a2-6e5a-246c-f5a7-c35ee6bae368@intel.com>
Date: Wed, 12 Oct 2022 16:10:32 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20221012070331.3057013-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20221012070331.3057013-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] tests/kms_atomic_transition: Fix the test
 execution on internal panels
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

On 10/12/2022 12:33 PM, Bhanuprakash Modem wrote:
> As we are intended to test few cases on internal panels separately,
> fix the logic to execute such tests on internal panels only.
>
> 'TRANSITION_MODESET_FAST' -> should be only for internal panels
> 'TRANSITION_MODESET' -> should be only for external panels
>
> Fixes: 2527ce52 (tests/kms_atomic_transition: Convert tests to dynamic)
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_atomic_transition.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 247b0be4..25757131 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1096,11 +1096,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				 * number of combinations, to avoid long runtimes due to modesets on
>   				 * panels with long power cycle delays.
>   				 */
> -				if (((transition_tests[i].type == TRANSITION_MODESET) ||
> -				     (transition_tests[i].type == TRANSITION_MODESET_FAST)) &&
> +				if ((transition_tests[i].type == TRANSITION_MODESET) &&
>   				    output_is_internal_panel(output))
>   					continue;
>   
> +				if ((transition_tests[i].type == TRANSITION_MODESET_FAST) &&
> +				    !output_is_internal_panel(output))
> +					continue;
> +
>   				if (pipe_count == 2 * count && !data.extended)
>   					break;
>   
