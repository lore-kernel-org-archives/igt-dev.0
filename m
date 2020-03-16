Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB626E479
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:13:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E559710A35D9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:11:36 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Mon, 16 Mar 2020 12:11:31 -0400
Message-Id: <20200316161132.29833-4-lyude@redhat.com>
In-Reply-To: <20200316161132.29833-1-lyude@redhat.com>
References: <20200316161132.29833-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] assembler/gen4asm.h: Make struct
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Another spot where we fail compilation with -fcommon, due to src_operand
getting included in multiple translation units without being marked as
extern:

/usr/bin/ld:
assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_gram.c.o:assembler/gen4asm.h:119:
multiple definition of `src_operand';
assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_lex.c.o:assembler/gen4asm.h:119:
first defined here
/usr/bin/ld:
assembler/1ca89e8@@intel-gen4asm@exe/main.c.o:assembler/gen4asm.h:119:
multiple definition of `src_operand';
assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_lex.c.o:assembler/gen4asm.h:119:
first defined here

So, fix this by marking struct src_operand as extern.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 assembler/gen4asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/assembler/gen4asm.h b/assembler/gen4asm.h
index 6b957e28..7845060c 100644
--- a/assembler/gen4asm.h
+++ b/assembler/gen4asm.h
@@ -111,7 +111,7 @@ struct regtype {
  * This structure is the internal representation of source operands in the
  * parser.
  */
-struct src_operand {
+extern struct src_operand {
 	struct brw_reg reg;
 	int default_region;
 	uint32_t imm32; /* set if src_operand is expressing a branch offset */
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
