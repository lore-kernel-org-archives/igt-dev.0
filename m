Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB7F10EAEF
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 13:29:41 +0000 (UTC)
Message-ID: <0cbe68c9-22fe-8f49-b87f-6cd563aa3e28@riseup.net>
Date: Thu, 8 Sep 2022 10:29:33 -0300
MIME-Version: 1.0
To: igt-dev@lists.freedesktop.org
References: <20220815203357.93287-1-mairacanal@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220815203357.93287-1-mairacanal@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/amdgpu/amd_bypass: skip if
 connector is not DisplayPort
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, Alexander Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

Gentle ping.

Best Regards,
- Maíra Canal

On 8/15/22 17:33, Maíra Canal wrote:
> [why & how]
> It is not possible to access the DSC_CLOCK_EN for non-DP connectors.
> Moreover, the kernel fails when asked to set the CRC source to DPRX on
> non-DP connectors. Therefore, skip the test if the connector is not
> a DisplayPort or eDP connector.
> 
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> ---
> v1 -> v2: https://patchwork.freedesktop.org/patch/497387/
> - Change || to && (Petri Latvala).
> ---
>  tests/amdgpu/amd_bypass.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 5ec90884..d191779b 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -316,6 +316,13 @@ static void bypass_8bpc_test(data_t *data)
>  
>  	test_init(data);
>  
> +	/*
> +	 * CRC source cannot be select without an DP/eDP connector
> +	 */
> +	igt_skip_on_f(data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort &&
> +			data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP,
> +			"no DisplayPort connector found\n");
> +
>  	/**
>  	 * 8bpc bypass only makes sense without DSC.
>  	 * DSC is visually lossless but actually still loss exists and any bypass mode
