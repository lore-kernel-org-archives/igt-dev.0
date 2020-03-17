Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3A76E58B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2020 16:56:47 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id h8so8659670qtq.15
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2020 09:56:43 -0700 (PDT)
Message-ID: <0ed92adafea1311bcf2f04f3a020c920e47376b8.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Tue, 17 Mar 2020 12:56:39 -0400
In-Reply-To: <158440011145.28425.13841812360548720712@build.alporthouse.com>
References: <20200316161132.29833-1-lyude@redhat.com>
 <20200316161132.29833-4-lyude@redhat.com>
 <158440011145.28425.13841812360548720712@build.alporthouse.com>
MIME-Version: 1.0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 2020-03-16 at 23:08 +0000, Chris Wilson wrote:
> Quoting Lyude (2020-03-16 16:11:31)
> > From: Lyude Paul <lyude@redhat.com>
> > 
> > Another spot where we fail compilation with -fcommon, due to src_operand
> > getting included in multiple translation units without being marked as
> > extern:
> > 
> > /usr/bin/ld:
> > assembler/1ca89e8@@intel-gen4asm@exe/meson-
> > generated_gram.c.o:assembler/gen4asm.h:119:
> > multiple definition of `src_operand';
> > assembler/1ca89e8@@intel-gen4asm@exe/meson-
> > generated_lex.c.o:assembler/gen4asm.h:119:
> > first defined here
> > /usr/bin/ld:
> > assembler/1ca89e8@@intel-gen4asm@exe/main.c.o:assembler/gen4asm.h:119:
> > multiple definition of `src_operand';
> > assembler/1ca89e8@@intel-gen4asm@exe/meson-
> > generated_lex.c.o:assembler/gen4asm.h:119:
> > first defined here
> > 
> > So, fix this by marking struct src_operand as extern.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  assembler/gen4asm.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/assembler/gen4asm.h b/assembler/gen4asm.h
> > index 6b957e28..7845060c 100644
> > --- a/assembler/gen4asm.h
> > +++ b/assembler/gen4asm.h
> > @@ -111,7 +111,7 @@ struct regtype {
> >   * This structure is the internal representation of source operands in
> > the
> >   * parser.
> >   */
> > -struct src_operand {
> > +extern struct src_operand {
> >         struct brw_reg reg;
> >         int default_region;
> >         uint32_t imm32; /* set if src_operand is expressing a branch
> > offset */
> 
> I suspect this was a typedef. I can't see any definition for the struct
> src_operand src_operand, and I think it can be deleted.

You sure about this? It appears to be referenced in assembler/gram.y:

assembler/gram.y:57:static struct src_operand src_null_reg =
assembler/gram.y:77:static struct src_operand ip_src =
assembler/gram.y:92:				struct src_operand *src,
assembler/gram.y:95:				struct src_operand *src,
(etc.)

Or are you suggesting we just move it into gram.y?
> -Chris
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
