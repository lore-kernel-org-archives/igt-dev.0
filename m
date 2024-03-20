Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F4EC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 09:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F8810F457;
	Wed, 20 Mar 2024 09:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mfuUL9rI";
	dkim-atps=neutral
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6410F47B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 09:42:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CADBFFF80F;
 Wed, 20 Mar 2024 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710927726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndlZR8ajQtOaUTTtZuJeSd7Hw63e3uGxg1y4PU6w2vo=;
 b=mfuUL9rIFe0EpZr+9lU9aq5NPcvSFUynF1i5hN24yl8xFV05fJRE5YBaQZx58ujLXWTejJ
 uhbBgajB0K9+mDaNT5+WziqGiKeDNVAEkgtkU7CvjfKPe5XMpmKVI3lDkIBw/GeHwmatZh
 plqeAjZtwKn/bDcZhKXprjCW6x8uQe1wVVU3CJeGY69yB3BFQlsk4jTEH2npeOMllFJlQI
 XZcdj+lrz0i4RvLUVdw+iC5VeEX7nk7utJz9UtXJQv0mhWkbP1NkKSj2GIhutAvw+yWaSG
 Qal6IfUq8MdS+P1OaUbKP/TAP1OYsk3iKA73v4/oDiEgw/uHfXcCozjWzHVuIg==
Date: Wed, 20 Mar 2024 10:42:03 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 arthurgrillo@riseup.net, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
Message-ID: <ZfqvawDU-5Eh5duy@localhost.localdomain>
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
 <20240318114329.drrzkqmirdaahigm@kamilkon-desk.igk.intel.com>
 <87cyrrpres.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyrrpres.fsf@intel.com>
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

Le 18/03/24 - 16:04, Jani Nikula a écrit :
> On Mon, 18 Mar 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi Louis,
> > On 2024-03-15 at 17:08:37 +0100, Louis Chauvet wrote:
> >> As explained in [1], the submitted patches should follow the same style as
> >> the Linux kernel and must be checked against checkpatch.pl, so add this
> >> recommendation in the CONTRIBUTING.md file.
> >> 
> >> [1]: https://lore.kernel.org/all/20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com/
> >> 
> >> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >> 
> >> To: igt-dev@lists.freedesktop.org
> > -^^^^^^^^^^^^^^
> > Drop this.
> >
> >> Cc: miquel.raynal@bootlin.com
> >> Cc: thomas.petazzoni@bootlin.com
> >> Cc: jeremie.dautheribes@bootlin.com
> >> Cc: arthurgrillo@riseup.net
> >> Cc: seanpaul@google.com
> >> Cc: marcheu@google.com
> >> Cc: nicolejadeyee@google.com
> >> Cc: kamil.konieczny@linux.intel.com
> >
> > These should be before your s-o-b above.
> > I will add here few more maintainers:
> >
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Cc: Petri Latvala <adrinael@adrinael.net>
> >
> >> ---
> >
> > Here you could add your notes which will be ignored by git
> > at merging but I do not see any?
> >
> >> To: igt-dev@lists.freedesktop.org
> >> Cc: miquel.raynal@bootlin.com
> >> Cc: thomas.petazzoni@bootlin.com
> >> Cc: jeremie.dautheribes@bootlin.com
> >> Cc: arthurgrillo@riseup.net
> >> Cc: seanpaul@google.com
> >> Cc: marcheu@google.com
> >> Cc: nicolejadeyee@google.com
> >> Cc: kamil.konieczny@linux.intel.com
> >> 
> >> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> Looks like you didn't run checkpatch on this contribution! ;D

Probably, I will run it for the v2.
 
> >> ---
> >>  CONTRIBUTING.md | 2 ++
> >>  1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> >> index 2ab8a48f6ae9..ec8debb4091e 100644
> >> --- a/CONTRIBUTING.md
> >> +++ b/CONTRIBUTING.md
> >> @@ -78,6 +78,8 @@ Sending Patches
> >>  - Changes to the testcases are automatically tested. Take the results into
> >>    account before merging.
> >>  
> >> +- The coding rules are the same as for the Linux kernel. To check for common
> > -------------------------^
> > insert 'almost' here: s/are the same/are almost the same/
> >
> >> +  style problems, you need to use the kernel's checkpatch.pl script.
> >
> > There are known variations like we do not have MAINTAINERS, or
> > we allow to use typdefs, allow to have (reasonable) longer lines
> > and few others differences.
> 
> You could define the checkpatch.pl options to use. Maybe even add a
> script wrapper to run, with the options set.
> 
> For example, we use these command-line options for i915:
> 
> scripts/checkpatch.pl -q --emacs --strict --show-types --max-line-length=100 --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER

Is this line applicable for the whole repository?

> Alternatively, define a clang-format configuration file and use that
> instead of checkpatch. Linux repo root has .clang-format.

I tried to use the Linux' .clang-format, but there are some limitation, 
espicialy for alignment:
	#define REG_LONG_NAME	0x2
	#define REG_SHORT	0x3
is changed to
	#define REG_LONG_NAME 0x2
	#define REG_SHORT 0x3
(same for all structure members, multiple assignements...)

Kind regards,
Louis Chauvet

> 
> BR,
> Jani.
> 
> 
> >
> > Regards,
> > Kamil
> >
> >>  
> >>  Commit Rights
> >>  -------------
> >> 
> >> ---
> >> base-commit: ed47dd9fb6b5be6c88513c2816f0f7cfdd0e02f6
> >> change-id: 20240315-add_coding_style-b755454de958
> >> 
> >> Best regards,
> >> -- 
> >> Louis Chauvet <louis.chauvet@bootlin.com>
> >> 
> 
> -- 
> Jani Nikula, Intel

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
