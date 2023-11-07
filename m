Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473210E023
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 10:30:55 +0000 (UTC)
Message-ID: <4ab2f4da-7c0c-4e08-b44e-f25845052e37@intel.com>
Date: Tue, 7 Nov 2023 11:30:42 +0100
Content-Language: en-US
To: <janga.rahul.kumar@intel.com>
References: <20231107083023.751059-1-janga.rahul.kumar@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20231107083023.751059-1-janga.rahul.kumar@intel.com>
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

On 7.11.2023 09:30, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> For XE2, the minimum page size for both VRAM and system memory is only 4K.
> 
> Minimum page size was used as the address stride, which is 4K.
> When attempting to bind a 4K range, consecutive VM BIND IOCTL calls
> resulted in a range collision. Update stride based on bo size.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   tests/intel/xe_vm.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index dd3302337..2aead9427 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -377,6 +377,10 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> +	if (addr_stride <= bo_size) {
> +		addr_stride = addr_stride + bo_size;
> +	}
> +

It's just one line here, you can drop the braces (it will also make 
checkpatch happy). Do we need to align the address stride, or is already 
aligned?

All the best,
Karolina

>   	for (i = 0; i < n_bo; ++i) {
>   		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
>   					   visible_vram_if_possible(fd, eci->gt_id));
