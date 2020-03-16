Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860036E4D4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 23:08:36 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200316161132.29833-4-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
 <20200316161132.29833-4-lyude@redhat.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158440011145.28425.13841812360548720712@build.alporthouse.com>
Date: Mon, 16 Mar 2020 23:08:31 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] assembler/gen4asm.h: Make struct
 src_operand extern
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
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lyude (2020-03-16 16:11:31)
> From: Lyude Paul <lyude@redhat.com>
> 
> Another spot where we fail compilation with -fcommon, due to src_operand
> getting included in multiple translation units without being marked as
> extern:
> 
> /usr/bin/ld:
> assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_gram.c.o:assembler/gen4asm.h:119:
> multiple definition of `src_operand';
> assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_lex.c.o:assembler/gen4asm.h:119:
> first defined here
> /usr/bin/ld:
> assembler/1ca89e8@@intel-gen4asm@exe/main.c.o:assembler/gen4asm.h:119:
> multiple definition of `src_operand';
> assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_lex.c.o:assembler/gen4asm.h:119:
> first defined here
> 
> So, fix this by marking struct src_operand as extern.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  assembler/gen4asm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/assembler/gen4asm.h b/assembler/gen4asm.h
> index 6b957e28..7845060c 100644
> --- a/assembler/gen4asm.h
> +++ b/assembler/gen4asm.h
> @@ -111,7 +111,7 @@ struct regtype {
>   * This structure is the internal representation of source operands in the
>   * parser.
>   */
> -struct src_operand {
> +extern struct src_operand {
>         struct brw_reg reg;
>         int default_region;
>         uint32_t imm32; /* set if src_operand is expressing a branch offset */

I suspect this was a typedef. I can't see any definition for the struct
src_operand src_operand, and I think it can be deleted.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
