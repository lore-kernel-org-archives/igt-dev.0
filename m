Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA1010E2AC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:18:48 +0000 (UTC)
Date: Mon, 18 Dec 2023 08:00:10 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t v7 5/6] lib/xe/xe_util: Align obj size before
 bind/unbind
Message-ID: <20231218065943.mx2zmrjtfniy6xza@zkempczy-mobl2>
References: <cover.1702674322.git.akshata.jahagirdar@intel.com>
 <bc8dbf562ddfacda2deb52dfd68be6ce675656aa.1702674322.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc8dbf562ddfacda2deb52dfd68be6ce675656aa.1702674322.git.akshata.jahagirdar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 ayaz.siddiqui@intel.com, akshata.jahagirdar@intel.co
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 01:09:46PM -0800, Akshata Jahagirdar wrote:
> Alter the range to default_alignment before vm bind/unbind operation to
> align the buffer object size with page size.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/xe/xe_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index ba8eece71..6321a5729 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -148,7 +148,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(int xe,
>  		ops->flags = flags;
>  		ops->obj_offset = 0;
>  		ops->addr = obj->offset;
> -		ops->range = obj->size;
> +		ops->range = ALIGN(obj->size, 4096);
>  		ops->prefetch_mem_region_instance = 0;
>  		if (obj->pat_index == DEFAULT_PAT_INDEX)
>  			ops->pat_index = intel_get_pat_idx_wb(xe);
> -- 
> 2.34.1
> 

LGTM, but please extend commit message why aligning to page
size is necessary. With this:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
