Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDB7C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 16:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C6810FE12;
	Wed, 20 Mar 2024 16:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QsukeX3+";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F2910FE11
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 16:41:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFA5040007;
 Wed, 20 Mar 2024 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710952866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPVDStUEuZqIY/cIlZU5iaD0bAvCTMO5HqimWPrcbFc=;
 b=QsukeX3+XYATv9LtRBWTPFD7UgI0s70XF3c1Rr6F5Lao5JDF8+2tBaFWOtb0ag2eqtsMg6
 RoJO965+fmVJGyXeopJp9xJB9GuSG7XeY7KeITtqlUVSOZj3Od2Ws1adeifcRsHnQv9HDd
 ZGJ5o3whUffyryMQ4RVNeVcezoe5D6DGbx8nZk7vgv7M7RyUUJ+2r4sOs/N1Y8AgJDfqHq
 hws7aReNjQ1GYwzrOL3m0IOHfrLeCPQ8XmlhvvuKnGFWPB9YsJ8ocnXFWHpm9j3xu/8wm8
 K0mlGp82crcGjb1YXVtPA/loVqh6MDckQGz/gUHUh7mw7m2uAdxnhNnKP6srAg==
Date: Wed, 20 Mar 2024 17:41:04 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 arthurgrillo@riseup.net, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
Message-ID: <ZfsRoFUsUbRZrfIH@localhost.localdomain>
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
 <20240320152233.gydl3lwmexdoto5o@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240320152233.gydl3lwmexdoto5o@kamilkon-desk.igk.intel.com>
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

Le 20/03/24 - 16:22, Kamil Konieczny a écrit :
> Hi Louis,
> On 2024-03-15 at 17:08:37 +0100, Louis Chauvet wrote:
> > As explained in [1], the submitted patches should follow the same style as
> > the Linux kernel and must be checked against checkpatch.pl, so add this
> > recommendation in the CONTRIBUTING.md file.
> > 
> > [1]: https://lore.kernel.org/all/20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com/
> > 
> 
> There is code style mensioned at line 13, grep -n -A1 kernel CONTRIBUTING.md
> gives (in second match):

I missed it, I think it's because I read this section too fast and jumped 
to "Sending Patches".
 
> 13:- The code should follow kernel coding style:
> 14:  https://www.kernel.org/doc/html/latest/process/coding-style.html
> 
> So maybe place it after that line?

Yes, I can move the checkpatch sentence+command here.

But as the "The Code" section deals in more detail with the internal 
workings of the igt, I think it's better to keep something in "Sending 
Patches", like:

 - Your patch must adhere the code style defined in "The Code".

This way, the section "Sending Patches" can serve as a "checklist" (accept 
the licence, use igt prefix, check the style).

Additionally, as the documentation is automaticaly build, maybe it 
might be useful to include the following point:

 - If you're add new tests, please ensure that you've written the 
   documentation before submitting by running:

      ninja -C build igt-gpu-tools-doc

   Otherwise, auto-builders will complain if the documentation is missing.


I have a question regarding the documentation. [1] explains that 
igt_describe is deprecated, but CONTRIBUTION.md and igt_describe() doc 
don't explain the "new" testplan documentation. Perhaps I could revise 
"The Code" section to include:

 - All new test must be documented in two ways:
     - A call to igt_describe(), just before the test. This should provide 
       a concise description of the test's purpose, and it will be 
       displayed during execution.
     - A testplan comment at the top of the file. This should 
       provide further explanation of the test's functionality and is 
       utilized in reporting tools.
   Please refer to [1] for more details

[1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/docs/test_documentation.md?ref_type=heads

Thanks,
Louis Chauvet

> Regards,
> Kamil
> 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > 
> > To: igt-dev@lists.freedesktop.org
> > Cc: miquel.raynal@bootlin.com
> > Cc: thomas.petazzoni@bootlin.com
> > Cc: jeremie.dautheribes@bootlin.com
> > Cc: arthurgrillo@riseup.net
> > Cc: seanpaul@google.com
> > Cc: marcheu@google.com
> > Cc: nicolejadeyee@google.com
> > Cc: kamil.konieczny@linux.intel.com
> > ---
> > To: igt-dev@lists.freedesktop.org
> > Cc: miquel.raynal@bootlin.com
> > Cc: thomas.petazzoni@bootlin.com
> > Cc: jeremie.dautheribes@bootlin.com
> > Cc: arthurgrillo@riseup.net
> > Cc: seanpaul@google.com
> > Cc: marcheu@google.com
> > Cc: nicolejadeyee@google.com
> > Cc: kamil.konieczny@linux.intel.com
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  CONTRIBUTING.md | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index 2ab8a48f6ae9..ec8debb4091e 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -78,6 +78,8 @@ Sending Patches
> >  - Changes to the testcases are automatically tested. Take the results into
> >    account before merging.
> >  
> > +- The coding rules are the same as for the Linux kernel. To check for common
> > +  style problems, you need to use the kernel's checkpatch.pl script.
> >  
> >  Commit Rights
> >  -------------
> > 
> > ---
> > base-commit: ed47dd9fb6b5be6c88513c2816f0f7cfdd0e02f6
> > change-id: 20240315-add_coding_style-b755454de958
> > 
> > Best regards,
> > -- 
> > Louis Chauvet <louis.chauvet@bootlin.com>
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
