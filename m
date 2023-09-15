Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436A310E021
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 18:27:51 +0000 (UTC)
Date: Fri, 15 Sep 2023 20:27:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230915182744.fwoxb7dbtg2adijd@kamilkon-desk.igk.intel.com>
References: <20230915155846.481999-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915155846.481999-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm : Update tile mask
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

small nit regarding subject:

[PATCH i-g-t] tests/intel/xe_vm : Update tile mask
-------------------------------^
Remove space before ':', this should be:

[PATCH i-g-t] tests/intel/xe_vm: Update tile mask

Regards,
Kamil

On 2023-09-15 at 21:28:46 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Tile mask shouldn't be derived based on GT id. Setting tile mask to 0
> to create bind to all tiles.
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 4952ea786..a92a5cc66 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -927,7 +927,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].obj_offset = 0;
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
> -		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
> +		bind_ops[i].tile_mask = 0;
>  		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
>  		bind_ops[i].region = 0;
>  		bind_ops[i].reserved[0] = 0;
> -- 
> 2.25.1
> 
