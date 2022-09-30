Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842DC10EBB9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 08:31:01 +0000 (UTC)
Message-ID: <cffcca93-1ad1-7408-199f-65b8735edbe5@intel.com>
Date: Fri, 30 Sep 2022 14:00:56 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
 <20220922160004.2041598-3-bhanuprakash.modem@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220922160004.2041598-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 02/52] lib/igt_kms: Bigjoiner check in
 max_bpc constraint
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

LGTM
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 22-Sep-22 9:29 PM, Bhanuprakash Modem wrote:
> There is a possibility of commit failure if the selected pipe/output
> won't support Bigjoiner or 8K. So we need to handle this case.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5fdb67fc..a3ed5ec9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5713,6 +5713,11 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   
>   	for_each_connector_mode(output) {
>   		igt_output_override_mode(output, &connector->modes[j__]);
> +
> +		if (is_i915_device(display->drm_fd) &&
> +		    !igt_check_bigjoiner_support(display))
> +			continue;
> +
>   		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,

-- 
~Swati Sharma
