Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82FB11ADE6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 07:37:41 +0000 (UTC)
Message-ID: <da8b6563-d050-afff-24b2-8ff48575fc45@intel.com>
Date: Thu, 19 May 2022 13:07:36 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220310155519.341863-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220310155519.341863-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_aux_dev: Handle MST NAK
 reply on disconnected MST connectors
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

Overall patch LGTM.

Please add fixes tag, with that fixed.

Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 10-Mar-22 9:25 PM, Bhanuprakash Modem wrote:
> If the given MST connector is disconnected the DPCD read out request
> will throw an MST NAK reply error. This patch will handle this in the
> test that skips to read the DPCD of disconnected MST connectors.
> 
> <3> [793.017171] i915 0000:03:00.0: [drm] *ERROR* mstb 00000000e5e57ca0 port 1: DPCD read on addr 0x0 for 16 bytes NAKed
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_dp_aux_dev.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 39fc2b9233..d3249fa3d6 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -53,6 +53,12 @@ static bool test(int drm_fd, uint32_t connector_id)
>   	drmModeFreeConnector(connector);
>   	igt_assert(dir_fd >= 0);
>   
> +	if (connector->connection != DRM_MODE_CONNECTED &&
> +	    is_mst_connector(drm_fd, connector_id)) {
> +		close(dir_fd);
> +		return false;
> +	}
> +
>   	dir = fdopendir(dir_fd);
>   	igt_assert(dir);
>   

-- 
~Swati Sharma
