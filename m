Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0C910E364
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 07:36:41 +0000 (UTC)
Message-ID: <2776c688-70db-d4ef-fc33-06088760bedc@intel.com>
Date: Wed, 28 Jun 2023 13:06:21 +0530
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230625183436.14150-1-mohammed.thasleem@intel.com>
 <20230627185528.2498910-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230627185528.2498910-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/2] tests/kms_display_modes: Fixed mode
 selection for extended mode tests
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

Hi Thasleem,

On Wed-28-06-2023 12:25 am, Mohammed Thasleem wrote:
> Added check on DP-MST and 4k panels when two moniters connected
> through MST.

We are not doing this anymore, please fix the commit message.

> This will find the connector mode combo that fits into the
> bandwidth when more than one monitor is connected.
> 
> Example:
>    When two monitors connected through MST, the second monitor
>    also tries to use the same mode. So two such modes may not
>    fit into the link bandwidth. So, iterate through connected
>    outputs & modes and find a combination of modes those fit
>    into the link BW.
> 
> v2: -Updated commit msg and description. (Bhanu)
>      -Renamed restart with retry. (Bhanu)
>      -Moved igt_pipe_crc_new before retry. (Bhanu)
>      -Removed unrelated changes and new line. (Bhanu)
>      -Minor changes.
> v3: Updated discription and added EINVAL check.
> v4: Removed EINVAL and ENOSPC checks.
>      Added check for DP-MST and 4k panels.
>      Updated discription.
> v5: Defined 4k display modes globally.
> v6: -Removed if loop checks.
>      -Added igt override to avoid dp mst bw failure.
> v7: Resolved conflict.
> v8: Removed igt_display_reset from called function.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_display_modes.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 93d91ef5..4bebb25e 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -144,8 +144,6 @@ static void run_extendedmode_basic(data_t *data,
>   	int width, height;
>   	cairo_t *cr;
>   
> -	igt_display_reset(display);
> -
>   	igt_output_set_pipe(output1, pipe1);
>   	igt_output_set_pipe(output2, pipe2);

These are redundant, as we already setting the pipe/output before 
calling the test.

- Bhanu

>   
> @@ -253,6 +251,9 @@ static void run_extendedmode_test(data_t *data) {
>   					igt_output_set_pipe(output1, pipe1);
>   					igt_output_set_pipe(output2, pipe2);
>   
> +					if (!igt_override_all_active_output_modes_to_fit_bw(display))
> +						continue;
> +
>   					if (!i915_pipe_output_combo_valid(display))
>   						continue;
>   
