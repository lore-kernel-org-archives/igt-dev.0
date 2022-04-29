Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDA110E32F
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 22:25:19 +0000 (UTC)
Message-ID: <0e3842ad-7cb6-e3b0-e3f7-f956e910dbc4@amd.com>
Date: Fri, 29 Apr 2022 18:26:16 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220428165925.1406641-1-dingchen.zhang@amd.com>
 <20220428165925.1406641-3-dingchen.zhang@amd.com>
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20220428165925.1406641-3-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/amdgpu/amd_psr: trigger full
 modeset if visual confirm enabled
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



On 2022-04-28 12:59, David Zhang wrote:
> [why]
> In amdgpu kernel, to enable PSR visual confirm debug option, it
> needs a full modeset to call the DM PSR setup helper which in turn
> to set the visual confirm debug option. Currently before test run
> there is such full modeset, and after test run ends the visual
> confirm option is restored to be disabled. Although the IGT clean
> up after test run ends will do DPMS transition and trigger a full
> modeset, but at the moment the visual confirm is already disabled.
> This means that even from command line, visual confirm option is
> set, the DC visual confirm debug is never enabled actually during
> any PSR-SU test run.
> 
> [how]
> If visual confirm option is set from command line parameter, before
> any PSR-SU test run, we manually trigger a DPMS off->ON transition
> which in turn to trigger a full modeset in kernel from test_init(),
> to enable the visual confirm.
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>
Thanks!

> ---
>   tests/amdgpu/amd_psr.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 2ca41927..7838066c 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -182,6 +182,16 @@ static void test_init(data_t *data)
>   	data->pb_h = data->h / 2;
>   	data->ob_w = data->w;
>   	data->ob_h = data->h;
> +
> +	if (opt.visual_confirm) {
> +		/**
> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
> +		 * to make PSR visual confirm enable take effect. DPMS off -> ON transition is one of
> +		 * the approaches.
> +		 */
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector, DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector, DRM_MODE_DPMS_ON);
> +	}
>   }
>   /* Common test cleanup. */
>   static void test_fini(data_t *data)
