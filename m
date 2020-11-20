Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BBB89B11
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 11:44:38 +0000 (UTC)
Date: Fri, 20 Nov 2020 13:44:33 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201120114433.GB1589431@ideak-desk.fi.intel.com>
References: <20201120093646.1340401-1-mika.kahola@intel.com>
 <20201120093646.1340401-4-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120093646.1340401-4-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v10 3/4] lib/intel_aux_pgtable:
 Initialize aux pagetable for fast clear
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 11:36:45AM +0200, Mika Kahola wrote:
> For fast clear we haven't defined source buffer. Therefore, we only
> need to initialize only destination aux pagetable.
> 
> v2: Cleaner solution proposed by Imre (Imre)
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  lib/intel_aux_pgtable.c | 39 +++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index ef6a9fef..c05d4511 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -514,18 +514,35 @@ gen12_aux_pgtable_init(struct aux_pgtable_info *info,
>  		       struct intel_buf *dst_buf)
>  {
>  	struct intel_buf *bufs[2];
> +	int buf_count = 0;
>  	struct intel_buf *reserved_bufs[2];
>  	int reserved_buf_count;
> +	bool has_compressed_buf = false;
> +	bool write_buf[2];
>  	int i;
>  
>  	igt_assert_f(ibb->enforce_relocs == false,
>  		     "We support aux pgtables for non-forced relocs yet!");
>  
> -	if (!intel_buf_compressed(src_buf) && !intel_buf_compressed(dst_buf))
> -		return;
> +	if (src_buf) {
> +		bufs[buf_count] = src_buf;
> +		write_buf[buf_count] = false;
> +		buf_count++;
> +
> +		if (intel_buf_compressed(src_buf))
> +			has_compressed_buf = true;
> +	}
> +	if (dst_buf) {
> +		bufs[buf_count] = dst_buf;
> +		write_buf[buf_count] = true;
> +		buf_count++;
> +
> +		if (intel_buf_compressed(dst_buf))
> +			has_compressed_buf = true;
> +	}
>  
> -	bufs[0] = src_buf;
> -	bufs[1] = dst_buf;
> +	if (!has_compressed_buf)
> +		return;
>  
>  	/*
>  	 * Surface index in pgt table depend on its address so:
> @@ -541,17 +558,15 @@ gen12_aux_pgtable_init(struct aux_pgtable_info *info,
>  	 * surfaces.
>  	 */
>  
> -	intel_bb_add_intel_buf(ibb, src_buf, false);
> -	if (intel_buf_compressed(src_buf))
> -		intel_bb_object_set_flag(ibb, src_buf->handle, EXEC_OBJECT_PINNED);
> -
> -	intel_bb_add_intel_buf(ibb, dst_buf, true);
> -	if (intel_buf_compressed(dst_buf))
> -		intel_bb_object_set_flag(ibb, dst_buf->handle, EXEC_OBJECT_PINNED);
> +	for (i = 0; i < buf_count; i++) {
> +		intel_bb_add_intel_buf(ibb, bufs[i], write_buf[i]);
> +		if (intel_buf_compressed(bufs[i]))
> +			intel_bb_object_set_flag(ibb, bufs[i]->handle, EXEC_OBJECT_PINNED);
> +	}
>  
>  	reserved_buf_count = 0;
>  	/* First reserve space for any bufs that are bound already. */
> -	for (i = 0; i < ARRAY_SIZE(bufs); i++) {
> +	for (i = 0; i < buf_count; i++) {
>  		igt_assert(bufs[i]->addr.offset != INTEL_BUF_INVALID_ADDRESS);
>  		aux_pgtable_reserve_buf_slot(reserved_bufs,
>  					     reserved_buf_count++,
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
