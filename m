Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E48710E752
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 04:10:19 +0000 (UTC)
Message-ID: <ccf4f983-19f1-0a7d-e855-d28e976f4c25@intel.com>
Date: Fri, 28 Oct 2022 09:39:50 +0530
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
References: <20221028025915.2896834-1-alex.hung@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20221028025915.2896834-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Skip failure on EIO for
 amdgpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri-28-10-2022 08:29 am, Alex Hung wrote:
> amdgpu returns -EIO (-5) when DP is not connected instead of -ETIMEOUT.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/kms_dp_aux_dev.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index ed9dd510..850ec8e2 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -86,7 +86,8 @@ static bool test(int drm_fd, uint32_t connector_id)
>   
>   		igt_assert(ret == sizeof(buf) ||
>   			   errno == ETIMEDOUT ||
> -			   (errno == EIO && is_mst_connector(drm_fd, connector_id)));
> +			   (errno == EIO && (is_mst_connector(drm_fd, connector_id) ||
> +			    is_amdgpu_device(drm_fd))));

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>   
>   		close(fd);
>   
