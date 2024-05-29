Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A3BC27C43
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 12:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E4C11341F;
	Wed, 29 May 2024 12:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nGMNqHKf";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8912811341F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 12:55:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B29B1E0005;
 Wed, 29 May 2024 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716987318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyNa9LyEbhu6+uNB4SBBM1X3MXz1kRP33uzUBQrgvqc=;
 b=nGMNqHKfB2bcg9kHKb+OupirR63Cey6icEwzQHUVzaj5/wT5LktlyRNsFVUAXASt1/plg7
 m4vH2a5uhD6uCtQqVdVCYCm2bqZfSGu8VMVmS2cgXJVXdaCuBs2p/xR+TRJxXzQxKzQI/6
 2VgYXL+55p0zDuaa+n4GK4QZCXxLg8Q0irsII2oymlp5Z0AfY8/VwRtjqt6ij2FIlVsAJb
 b4gu4Q974Jjetk2peqs4vhqUq8qPbywhSPVOXt8vzcmsSZAkIlM0hAU85qIDkmOWyjyMR7
 APVdZZY5dvpRLPI/qxuEzLUWLHWwGdH+pu3H0foF/DEOTocomWB9KQeO9s/rKw==
Date: Wed, 29 May 2024 14:55:15 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Petri Latvala <adrinael@adrinael.net>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add more guidelines
Message-ID: <Zlcls5NcefHxGHdJ@localhost.localdomain>
References: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529124849.10728-1-kamil.konieczny@linux.intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Thanks for this update, it is better than my initial wording.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,
Louis Chauvet

Le 29/05/24 - 14:48, Kamil Konieczny a écrit :
> Add few more guidelines for submitting patches:
> - encourage use of checkpatch.pl script from Linux kernel
> - add guide for good subject for a patch
> - add links to guides about how to create a good patch
> - add guide for responding to CI failure letters
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
> -- 
> 2.43.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
