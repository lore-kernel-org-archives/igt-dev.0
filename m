Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1710E047
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 11:02:08 +0000 (UTC)
Message-ID: <3fedb2e1-e5f8-821a-8d14-28cc05c5b044@intel.com>
Date: Mon, 26 Jun 2023 16:31:48 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230607115333.55940-2-mohammed.thasleem@intel.com>
 <20230625183436.14150-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230625183436.14150-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 1/2] tests/kms_display_modes: Fixed mode
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

On Mon-26-06-2023 12:04 am, Mohammed Thasleem wrote:
> Added check on DP-MST and 4k panels when two moniters connected
> through MST.
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
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/kms_display_modes.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 93d91ef5..17cb66df 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -253,6 +253,9 @@ static void run_extendedmode_test(data_t *data) {
>   					igt_output_set_pipe(output1, pipe1);
>   					igt_output_set_pipe(output2, pipe2);
>   
> +					if (!igt_override_all_active_output_modes_to_fit_bw(display))
> +						continue;

Still, it is a problematic.

Here we are overiding with the valid modes, and in side the 
run_extendedmode_basic() [1] we are using igt_display_reset() which will 
reset the connector modes to default.

So, with this patch we'll have a sanity check for one mode & using 
another (default) mode for actual testing.

[1]: 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_display_modes.c#L147 


- Bhanu

> +
>   					if (!i915_pipe_output_combo_valid(display))
>   						continue;
>   
