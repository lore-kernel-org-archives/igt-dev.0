Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94460C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 16:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8C8112335;
	Fri, 15 Mar 2024 16:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gSKMlkQh";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C3112335
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 16:11:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF43440008;
 Fri, 15 Mar 2024 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710519091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdWXM2E+3vNqg+JdlxFRRoqYzIp9YZ+Zgpwo32H6mgU=;
 b=gSKMlkQhtPfvvfxNP8IClf/jBQMn3EO7Li6dRthDUkcEtrWWmIUQQ29S5dqt67Xo8uwf2Q
 I9zQh7J20hepVzycu6visEJebIK5A3TAG48pBDq/TKn+2YpLzqJT5fvgU84iLkoiyXdSNZ
 BJlbBxemCBIzDqoU8J9Z3rjABr38H7IFNXt+QteBGyjEg5hILtfC8DQYyhf5mqjV6vHP0H
 W8Mm7vlE4g57VaIocmFu1sQp3kd886qF9Gyl48D44zXHJTx/MBgTYBOl+I0HyprpXd2Mvj
 fVca8LKODkBjISqYiwqMLMm7F9pjYoPD4Uq8wI754lOpGw5L3npZLLYqOY3WAQ==
Date: Fri, 15 Mar 2024 17:11:29 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, miquel.raynal@bootlin.com,
 jeremie.dautheribes@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH i-g-t v2 1/4] lib/igt_kms: Add reflection name and mask
Message-ID: <ZfRzMf8Nr90BreIa@localhost.localdomain>
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
 <20240313-new_rotation-v2-1-6230fd5cae59@bootlin.com>
 <f4805e54-8a34-42ce-9721-aa3502d57a05@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4805e54-8a34-42ce-9721-aa3502d57a05@riseup.net>
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

Le 13/03/24 - 17:00, Arthur Grillo a écrit :
> 
> 
> On 13/03/24 14:09, Louis Chauvet wrote:
> > As for IGT_ROTATION_MASK and igt_plane_rotation_name, create the mask
> > IGT_REFLECT_MASK and the function igt_plane_reflect_name.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  lib/igt_kms.c | 23 +++++++++++++++++++++++
> >  lib/igt_kms.h |  3 +++
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index e18f6fe59882..85d278f3cae3 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -5142,6 +5142,29 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation)
> >  	}
> >  }
> >  
> > +
> > +/**
> > + * igt_plane_reflect_name:
> > + * @reflect: Plane reflection value (x, y)
> > + *
> > + * Returns: Plane reflection value as a string
> > + */
> > +const char *igt_plane_reflect_name(igt_rotation_t reflect)
> > +{
> > +	switch (reflect & IGT_REFLECT_MASK) {
> > +	case 0:
> > +		return "none";
> > +	case IGT_REFLECT_X:
> > +		return "X";
> > +	case IGT_REFLECT_Y:
> > +		return "Y";
> > +	case IGT_REFLECT_X | IGT_REFLECT_Y:
> > +		return "XY";
> > +	default:
> > +		igt_assert(0);
> > +	}
> > +}
> 
> I think it would be good to call this on igt_plane_set_rotation(), like
> igt_plane_rotation_name() is, for debug purposes.

Hi Arthur,

I will add a separate patch for this. Thanks for the suggestion.

Kind regards,
Louis Chauvet

> Best Regards,
> ~Arthur Grillo
> 
> > +
> >  /**
> >   * igt_plane_set_rotation:
> >   * @plane: Plane pointer for which rotation is to be set
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index b3882808b42f..4760394428f3 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -371,6 +371,8 @@ typedef enum {
> >  
> >  #define IGT_ROTATION_MASK \
> >  	(IGT_ROTATION_0 | IGT_ROTATION_90 | IGT_ROTATION_180 | IGT_ROTATION_270)
> > +#define IGT_REFLECT_MASK \
> > +	(IGT_REFLECT_X | IGT_REFLECT_Y)
> >  
> >  /**
> >   * igt_rotation_90_or_270:
> > @@ -562,6 +564,7 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
> >  	return (plane->rotations & rotation) == rotation;
> >  }
> >  const char *igt_plane_rotation_name(igt_rotation_t rotation);
> > +const char *igt_plane_reflect_name(igt_rotation_t reflect);
> >  
> >  void igt_wait_for_vblank(int drm_fd, int crtc_offset);
> >  void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
> > 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
