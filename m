Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73C010E412
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Dec 2022 18:11:50 +0000 (UTC)
Message-ID: <67544f41-cc70-b00f-fc5a-7301df2e72da@amd.com>
Date: Wed, 7 Dec 2022 11:11:45 -0700
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 igt-dev@lists.freedesktop.org
References: <20221116195344.220596-1-mairacanal@riseup.net>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20221116195344.220596-1-mairacanal@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu/amd_bypass: skip if
 connector is not DisplayPort
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-11-16 12:53, Maíra Canal wrote:
> [why & how]
> It is not possible to access the DSC_CLOCK_EN for non-DP connectors.
> Moreover, the kernel fails when asked to set the CRC source to DPRX on
> non-DP connectors. Therefore, skip the test if the connector is not
> a DisplayPort or eDP connector.
> 
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> ---
>   tests/amdgpu/amd_bypass.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 5ec90884..d191779b 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -316,6 +316,13 @@ static void bypass_8bpc_test(data_t *data)
>   
>   	test_init(data);
>   
> +	/*
> +	 * CRC source cannot be select without an DP/eDP connector
> +	 */
> +	igt_skip_on_f(data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort &&
> +			data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP,
> +			"no DisplayPort connector found\n");
> +
>   	/**
>   	 * 8bpc bypass only makes sense without DSC.
>   	 * DSC is visually lossless but actually still loss exists and any bypass mode

Reviewed-by: Alex Hung <alex.hung@amd.com>
