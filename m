Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA2510E23C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 19:26:22 +0000 (UTC)
Date: Mon, 15 May 2023 21:26:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230515192618.hxwbp2vluguma6hb@kamilkon-desk1>
References: <20230511193617.86458-1-zbigniew.kempczynski@intel.com>
 <20230511193617.86458-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230511193617.86458-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_batchbuffer: Add
 bind/unbind debug for single bo for Xe
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

Hi Zbigniew,

On 2023-05-11 at 21:36:16 +0200, Zbigniew Kempczyński wrote:
> We're still in early phase of integrating intel-bb infra with Xe so
> debugging information about bind/unbind might be handy. Binding path
> for single/multiple differs so lets add it for single case as it was
> missing now.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_batchbuffer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 545d170548..14ed8057e8 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1313,8 +1313,11 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
>  				 ibb->num_objects, syncs, 2);
>  		free(bind_ops);
>  	} else {
> +		igt_debug("bind: UNMAP\n");
>  		xe_vm_unbind_async(ibb->fd, ibb->vm_id, 0, 0,
>  				   ibb->batch_offset, ibb->size, syncs, 2);
> +		igt_debug("  offset: %llx, size: %llx\n",
> +			  (long long)ibb->batch_offset, (long long)ibb->size);

imho for unmap we should print it before ?

>  	}
>  	ret = syncobj_wait_err(ibb->fd, &syncs[1].handle, 1, INT64_MAX, 0);
>  	igt_assert_eq(ret, 0);
> @@ -2326,8 +2329,12 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>  				 ibb->num_objects, syncs, 1);
>  		free(bind_ops);
>  	} else {
> +		igt_debug("bind: MAP\n");

imho here we should print inputs as bind may fail.
Another idea would be to add debug flag (or debug env var ?) to
not put noise in debug output but it is up to you.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

>  		xe_vm_bind_async(ibb->fd, ibb->vm_id, 0, ibb->handle, 0,
>  				 ibb->batch_offset, ibb->size, syncs, 1);
> +		igt_debug("  handle: %u, offset: %llx, size: %llx\n",
> +			  ibb->handle, (long long)ibb->batch_offset,
> +			  (long long)ibb->size);
>  	}
>  	ibb->xe_bound = true;
>  
> -- 
> 2.34.1
> 
