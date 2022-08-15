Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AFBB6E55
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 09:43:28 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:42:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Message-ID: <YvoU+g7G8M1dK4pK@platvala-desk.ger.corp.intel.com>
References: <20220813150750.216610-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813150750.216610-1-mairacanal@riseup.net>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu/amd_bypass: skip if
 connector is not DisplayPort
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 igt-dev@lists.freedesktop.org, Alexander Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Aug 13, 2022 at 12:07:50PM -0300, Maíra Canal wrote:
> [why & how]
> It is not possible to access the DSC_CLOCK_EN for non-DP connectors.
> Moreover, the kernel fails when asked to set the CRC source to DPRX on
> non-DP connectors. Therefore, skip the test if the connector is not
> a DisplayPort or eDP connector.
> 
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> ---
>  tests/amdgpu/amd_bypass.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 5ec90884..e5bfcaa2 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -316,6 +316,13 @@ static void bypass_8bpc_test(data_t *data)
>  
>  	test_init(data);
>  
> +	/*
> +	 * CRC source cannot be selected without an DP/eDP connector
> +	 */
> +	igt_skip_on_f(data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort ||
> +			data->output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP,
> +			"no DisplayPort connector found\n");

This condition is always true, you need && instead of ||.


-- 
Petri Latvala



> +
>  	/**
>  	 * 8bpc bypass only makes sense without DSC.
>  	 * DSC is visually lossless but actually still loss exists and any bypass mode
> -- 
> 2.37.1
> 
