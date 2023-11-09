Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B55310E1CD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 08:59:06 +0000 (UTC)
Message-ID: <93557ed0-29f6-4f13-a71f-81f763abe2da@intel.com>
Date: Thu, 9 Nov 2023 09:58:45 +0100
Content-Language: en-US
To: <janga.rahul.kumar@intel.com>
References: <20231109081616.912332-1-janga.rahul.kumar@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20231109081616.912332-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm: Correct stride to
 avoid address range collision
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 9.11.2023 09:16, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> For XE2, the minimum page size for both VRAM and system memory is only 4K.
> 
> Minimum page size was used as the address stride, which is 4K.
> When attempting to bind a 4K range, consecutive VM BIND IOCTL calls
> resulted in a range collision. Update stride based on bo size.
> 
> v2: Address review comments (Karolina)
> 
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   tests/intel/xe_vm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index eeb49122a..f1ccd6c21 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -417,6 +417,9 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> +	if (addr_stride <= bo_size)
> +		addr_stride = addr_stride + bo_size;
> +
>   	for (i = 0; i < n_bo; ++i) {
>   		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
>   					   visible_vram_if_possible(fd, eci->gt_id));
