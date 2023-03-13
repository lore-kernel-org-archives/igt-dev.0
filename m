Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32210E573
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 15:57:56 +0000 (UTC)
Date: Mon, 13 Mar 2023 16:57:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313155752.6xrd7pobgyqjkccg@kamilkon-desk1>
References: <20230215004648.2100655-1-umesh.nerlige.ramappa@intel.com>
 <20230215004648.2100655-20-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215004648.2100655-20-umesh.nerlige.ramappa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 19/31] lib/perf: Add MTL to supprted HW
 in oa guid registry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Umesh, few more nits in subject:

lib/perf: Add MTL to supprted HW in oa guid registry
--- ^ ------------------ ^ -------- ^
lib/i915/perf:

s/supprted/supported/
s/oa/OA/

Regards,
Kamil

On 2023-02-14 at 16:46:36 -0800, Umesh Nerlige Ramappa wrote:
> Add MTL to supprted HW in oa guid registry
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  lib/i915/perf-configs/oa_guid_registry.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915/perf-configs/oa_guid_registry.py b/lib/i915/perf-configs/oa_guid_registry.py
> index 50076e95..f520f817 100644
> --- a/lib/i915/perf-configs/oa_guid_registry.py
> +++ b/lib/i915/perf-configs/oa_guid_registry.py
> @@ -100,7 +100,8 @@ class Registry:
>                             'RKL',
>                             'DG1',
>                             'ACM',
> -                           'PVC' )
> +                           'PVC',
> +                           'MTL', )
>          if name in known_chipsets:
>              return name
>  
> -- 
> 2.36.1
> 
