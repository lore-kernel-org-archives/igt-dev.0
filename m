Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8696EA44
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2020 17:41:00 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Thu, 19 Mar 2020 13:40:39 -0400
Message-Id: <20200319174039.205689-1-lyude@redhat.com>
In-Reply-To: <20200316161132.29833-4-lyude@redhat.com>
References: <20200316161132.29833-4-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] assembler/gen4asm.h: Remove struct
 src_operand src_operand variable
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
To: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
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

However, we never actually refer to this variable - only its type
definition. So, just remove the declaration entirely.

Changes since v1:
* Don't make src_operand extern - just remove the variable declaration
  entirely, we only ever use the typedef - Chris Wilson

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 assembler/gen4asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/assembler/gen4asm.h b/assembler/gen4asm.h
index 6b957e28..9537d457 100644
--- a/assembler/gen4asm.h
+++ b/assembler/gen4asm.h
@@ -116,7 +116,7 @@ struct src_operand {
 	int default_region;
 	uint32_t imm32; /* set if src_operand is expressing a branch offset */
 	char *reloc_target; /* bspec: branching instructions JIP and UIP are source operands */
-} src_operand;
+};
 
 typedef struct {
     enum {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
