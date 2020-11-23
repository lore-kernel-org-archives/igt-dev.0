Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8A16E14F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 23:47:19 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201123142035.1426734-1-mika.kahola@intel.com>
References: <20201123142035.1426734-1-mika.kahola@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 23 Nov 2020 23:47:15 +0000
Message-ID: <160617523538.16791.6725216974285613313@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/rendercopy_gen9: Ensure to cover
 all destination area
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Mika Kahola (2020-11-23 14:20:35)
> To ensure to cover all destination area during fast clear,
> we need to round up the destination coordinates at the lower
> right corner.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  lib/rendercopy_gen9.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index dd8c8c7c..eecf73d3 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -293,7 +293,7 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
>                 emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
>                 emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
>         } else {
> -               emit_vertex_2s(ibb, (dst_x + width)/64, DIV_ROUND_UP(dst_y + height, 16));
> +               emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, 64), DIV_ROUND_UP(dst_y + height, 16));

Ok. Still worried about partial coverage, but it only appears to be used
for fastclears in kms_ccs over the whole fb. The API leaks.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
