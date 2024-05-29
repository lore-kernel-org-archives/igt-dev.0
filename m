Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247FEC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 21:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5D10E1CC;
	Wed, 29 May 2024 21:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="iTjjmybM";
	dkim-atps=neutral
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5862610E1CC
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 21:06:17 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4VqMPP0QKLzDqn2;
 Wed, 29 May 2024 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1717016777; bh=KWYK9e9rYhJCP8Cm1yJ5/kjp2/MyWAeO0XqKIZXoPRA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iTjjmybMYHSUF/CHCv+tizRsXvXls10Bt5CEANTMDjQeo6URMbXRqBFIe7Dy4CrmX
 wC1JgrS9+wSvb/NYwNx2dKBdMQFbyzsmtrKLlNIUsO8S6Qzd8U/we03gxv24yZd9Ki
 5+2bGHa1YixFD3/XN3ygPu62RMxsxxFGpBcnoGUE=
X-Riseup-User-ID: E9DDFE0D2A6FDAE590E7A489EBF31B03B3F3A48A5E5D515BEE949E60195EA64E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VqMPK2sJ1zFw2S;
 Wed, 29 May 2024 21:06:13 +0000 (UTC)
Message-ID: <2f655ff3-be90-40c1-b30f-2b470c3d33c7@riseup.net>
Date: Wed, 29 May 2024 18:06:07 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add more guidelines
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Petri Latvala <adrinael@adrinael.net>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 29/05/24 09:48, Kamil Konieczny wrote:
> Add few more guidelines for submitting patches:
> - encourage use of checkpatch.pl script from Linux kernel
> - add guide for good subject for a patch
> - add links to guides about how to create a good patch
> - add guide for responding to CI failure letters

Good guidelines! I myself didn't know about the CI part :P.

Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> 
> v1: expand patch from Louis on checkpatch,
>   also take a hint from Jani about checkpatch options
>   add a guide for checking test results from CI
> 
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  CONTRIBUTING.md | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> index 2ab8a48f6..23cf0df11 100644
> --- a/CONTRIBUTING.md
> +++ b/CONTRIBUTING.md
> @@ -63,6 +63,17 @@ Sending Patches
>  
>    on its first invocation.
>  
> +- Place relevant prefix in subject, for example when your change is in one
> +  testfile, use its name without '.c' nor '.h' suffix, like:
> +  tests/simple_test: short description
> +  Consider sending cover letter with your patch, so if you decide to change
> +  subject it can still be linked into same patchseries on patchwork.
> +
> +- Look into some guides from Linux and Open Source community:
> +  https://kernelnewbies.org/PatchPhilosophy
> +  https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> +  https://www.kernel.org/doc/html/latest/process/submit-checklist.html
> +
>  - Patches need to be reviewed on the mailing list. Exceptions only apply for
>    testcases and tooling for drivers with just a single contributor (e.g. vc4).
>    In this case patches must still be submitted to the mailing list first.
> @@ -75,8 +86,17 @@ Sending Patches
>    contact one of the maintainers (listed in the MAINTAINERS file) and cc the
>    igt-dev mailing list.
>  
> +- Before sending use Linux kernel script 'checkpatch.pl' for checking your
> +  patchset. You could ignore some of them like 'line too long' or 'typdef'
> +  but most of the time its log is accurate. Useful options you could use:
> +  --emacs --strict --show-types --max-line-length=100 \
> +  --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER
> +
>  - Changes to the testcases are automatically tested. Take the results into
> -  account before merging.
> +  account before merging.  Please also reply to CI failures if you think they
> +  are unrelated, add also to Cc CI e-mail which is present in message.  This
> +  can help our bug-filing team. When replying, you can cut a message after
> +  'Known bugs' to keep it in reasonable size.
>  
>  
>  Commit Rights
