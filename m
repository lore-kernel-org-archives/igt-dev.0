Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6310E496
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 07:59:46 +0000 (UTC)
Date: Wed, 26 Oct 2022 10:59:37 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Alex Hung <alex.hung@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Message-ID: <Y1jo6avSqRrAU7rY@platvala-desk.ger.corp.intel.com>
References: <20221026021615.2445018-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026021615.2445018-1-alex.hung@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Check DP connection
 only before tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 08:16:15PM -0600, Alex Hung wrote:
> Without DP port connected, kernel reports "Too many retries"
> that indicates no sink to respond. This is the same across GPUs.
> 
> amdgpu ... DM aux hw bus 2: Too many retries, giving up. First error: -5
> i915 ... AUX C/DDI C/PHY C: Too many retries, giving up. First error: -110
> 
> In addition, the test can result time out such as below:
> 
> /dev/drm_dp_aux0: Connection timed out
> /dev/drm_dp_aux1: Connection timed out
> 
> As a result, checking DP connection alone should be sufficient.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_dp_aux_dev.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index ed9dd510..7fce74a4 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -53,8 +53,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>  	drmModeFreeConnector(connector);
>  	igt_assert(dir_fd >= 0);
>  
> -	if (connector->connection != DRM_MODE_CONNECTED &&
> -	    is_mst_connector(drm_fd, connector_id)) {
> +	if (connector->connection != DRM_MODE_CONNECTED) {
>  		close(dir_fd);
>  		return false;
>  	}


Bhanuprakash, Swati, you wrote/reviewed this piece of code, please review
this patch.


-- 
Petri Latvala
