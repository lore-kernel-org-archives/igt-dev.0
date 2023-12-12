Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E45310E181
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 09:31:36 +0000 (UTC)
Message-ID: <77191af7-2f04-49fc-b317-ccb6a15f5e5c@intel.com>
Date: Tue, 12 Dec 2023 09:31:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v5 5/6] tests/intel/gem_ccs: Add compression support
 for Lunarlake
Content-Language: en-GB
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <cover.1702402592.git.akshata.jahagirdar@intel.com>
 <d57e380afd85e47a685684847ef2adfa709734e8.1702402592.git.akshata.jahagirdar@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d57e380afd85e47a685684847ef2adfa709734e8.1702402592.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/12/2023 17:39, Akshata Jahagirdar wrote:
> Update the ccs_ratio call to get value according to platform.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>   tests/intel/gem_ccs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index 0a691778d..5a17be4cb 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -99,7 +99,7 @@ static void surf_copy(int i915,
>   	struct blt_block_copy_data_ext ext = {};
>   	struct blt_ctrl_surf_copy_data surf = {};
>   	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
> -	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
> +	uint64_t bb_size, ccssize = mid->size / (CCS_RATIO(i915));

This seems misplaced, should this rather be squashed into one of the 
previous patches? CCS_RATIO now takes an argument, but that was done 
earlier in the series.

>   	uint32_t *ccscopy;
>   	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>   	int result;
