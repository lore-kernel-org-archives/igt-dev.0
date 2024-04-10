Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24705CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A220B10E23A;
	Wed, 10 Apr 2024 15:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEe745vd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A30210ECBF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712761996; x=1744297996;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ttlIauLWCWb2YoI1VkEXW+DUqrqwOCuLdFBZWRAwMWo=;
 b=WEe745vdUprISfw6vYmiuWNp9QyRraWdtO6U/G3/MnuhaN5ESNu6EQuU
 uTnDxoIoLgfoL8SxjeevPAmKTiS4gRgYVjGI32+Hb2G1dX5OKJb7hNwV6
 o98V8c+NuprYsI2frkKbpQxFu/97fh5YkvePBeQPDqT9a2DByiIldjNpT
 yeNIijrM2dvIbuSKXZ0tv4LzEKwHdeLWWEjvLLuqH8ZV0LBJkgS/E1vmJ
 K+2fASA7acAr6Z5YJLzPxypeb2Q9JfNtxnfXW0+qOpkSSGndtN8RAm2Nc
 h8Z3VVIrC5dfqTPj/6w31uUGMJuJjH/PXIG8/Jnbg9yJBjs6QOeMAtLDx A==;
X-CSE-ConnectionGUID: Peq11JBjT/WVsksl/X4XLg==
X-CSE-MsgGUID: 4HAz2ql1ROKRRtZVad+DdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8256431"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8256431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:13:15 -0700
X-CSE-ConnectionGUID: a49JZqrfRBOcPWWN5xaYRg==
X-CSE-MsgGUID: GdPBfnx3QaeH0fkK2MtQew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="58024470"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:13:14 -0700
Date: Wed, 10 Apr 2024 17:13:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v2 2/4] assembler: fix calloc calls with inverted
 arguments
Message-ID: <20240410151311.3v4c6hlfn4yxvzn4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
 <20240410144321.44766-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410144321.44766-3-mauro.chehab@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Mauro,
On 2024-04-10 at 16:42:36 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The new gcc version 14 now complains when calloc is called
> with inverted arguments. use the script from:
> a0ee73a8f359 ("benchmarks: fix calloc calls with inverted arguments")
> 
> To fix it.

imho better way would be to say:

This is fixed with the help of the script from:
a0ee73a8f359 ("benchmarks: fix calloc calls with inverted arguments")

With or without it:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  assembler/gram.y | 6 +++---
>  assembler/main.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/assembler/gram.y b/assembler/gram.y
> index 77975e072896..79873b222253 100644
> --- a/assembler/gram.y
> +++ b/assembler/gram.y
> @@ -216,7 +216,7 @@ brw_program_add_instruction(struct brw_program *p,
>  {
>      struct brw_program_instruction *list_entry;
>  
> -    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
> +    list_entry = calloc(1, sizeof(struct brw_program_instruction));
>      list_entry->type = GEN4ASM_INSTRUCTION_GEN;
>      list_entry->insn.gen = instruction->insn.gen;
>      brw_program_append_entry(p, list_entry);
> @@ -228,7 +228,7 @@ brw_program_add_relocatable(struct brw_program *p,
>  {
>      struct brw_program_instruction *list_entry;
>  
> -    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
> +    list_entry = calloc(1, sizeof(struct brw_program_instruction));
>      list_entry->type = GEN4ASM_INSTRUCTION_GEN_RELOCATABLE;
>      list_entry->insn.gen = instruction->insn.gen;
>      list_entry->reloc = instruction->reloc;
> @@ -239,7 +239,7 @@ static void brw_program_add_label(struct brw_program *p, const char *label)
>  {
>      struct brw_program_instruction *list_entry;
>  
> -    list_entry = calloc(sizeof(struct brw_program_instruction), 1);
> +    list_entry = calloc(1, sizeof(struct brw_program_instruction));
>      list_entry->type = GEN4ASM_INSTRUCTION_LABEL;
>      list_entry->insn.label.name = strdup(label);
>      brw_program_append_entry(p, list_entry);
> diff --git a/assembler/main.c b/assembler/main.c
> index 2d39d4536a7f..77cc98b80d21 100644
> --- a/assembler/main.c
> +++ b/assembler/main.c
> @@ -397,7 +397,7 @@ int main(int argc, char **argv)
>  	    if (entry1 && is_label(entry1) && is_entry_point(entry1)) {
>  		// insert NOP instructions until (inst_offset+1) % 4 == 0
>  		while (((inst_offset+1) % 4) != 0) {
> -		    tmp_entry = calloc(sizeof(*tmp_entry), 1);
> +		    tmp_entry = calloc(1, sizeof(*tmp_entry));
>  		    tmp_entry->insn.gen.header.opcode = BRW_OPCODE_NOP;
>  		    entry->next = tmp_entry;
>  		    tmp_entry->next = entry1;
> -- 
> 2.44.0
> 
