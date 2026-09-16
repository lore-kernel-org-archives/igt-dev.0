Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101F7C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 07:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A275910E376;
	Wed, 16 Sep 2026 07:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTYhKy6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D94110E7FE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789544869; x=1821080869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xfeiTtxycsAQO/c4SivX8rwOpnZZvmk1UkvtjWz0n6I=;
 b=CTYhKy6YzXFoJ1lftLE0DaAbgs+fmoo+CayxhMaF8WWsbJ/HqeBVKe6a
 iDiLP0maFkgDqUPqnFJYOQGp1syW0M6YWxUT4NcLtil0PyRH2aIKo86bo
 EtKr5v7t/awRwyeiGzp8IhBB4VO8WxxVVDpW/f/kE3tm6I8UFkvJM0FWn
 GU8I7x5mQA6lo/KqsP0cTAZf/sqVH+2tZeNpBs8mywkTbzu/2QPjG79Vk
 PSGKrQ2xbTLltVx3Tndj3YFQw35X9/jXPtL2PUBcKTxUmGP57Eolklgw7
 IdLcKjEA+U1YYqNBcKzv1M2ahz2IBrp0aBwmz1gVO/psI9zZofm3zImnJ g==;
X-CSE-ConnectionGUID: k+kVtvUjSlGYl9J8Id7ZAQ==
X-CSE-MsgGUID: aIXrA4F0RI6W7ChCcGvtvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101433656"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101433656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:47:49 -0700
X-CSE-ConnectionGUID: n17Sp7HCQFK6I+LcS/AJ9w==
X-CSE-MsgGUID: Qu2uEazSRwucVMr5wPWq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278501245"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:47:47 -0700
Date: Wed, 16 Sep 2026 09:47:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] gitlab-ci: Fix computing sum for debian image
Message-ID: <20260916074732.opk3d73ytdjbd2mb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20260915125123.228545-1-kamil.konieczny@linux.intel.com>
 <991ee40d-ae69-44e5-a8b4-6d4a12453a2c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <991ee40d-ae69-44e5-a8b4-6d4a12453a2c@intel.com>
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

Hi Andrzej,
On 2026-09-16 at 09:14:59 +0200, Hajda, Andrzej wrote:
> W dniu 15.09.2026 o 14:51, Kamil Konieczny pisze:
> > Debian container has a dependency on minimal image, so it should
> > also contribute to sum calculations.  It could make building fail
> > when minimal image contain new building requirement, so fix it
> > and calculate sum from both dockerfiles, base and minimal.
> > 
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/201
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   .gitlab-ci/pull-or-rebuild.sh | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/.gitlab-ci/pull-or-rebuild.sh b/.gitlab-ci/pull-or-rebuild.sh
> > index aa1bddcde..fd68ef1a9 100755
> > --- a/.gitlab-ci/pull-or-rebuild.sh
> > +++ b/.gitlab-ci/pull-or-rebuild.sh
> > @@ -28,7 +28,12 @@ REF=${4:-${CI_COMMIT_REF_NAME:-latest}}
> >   REF=$(echo $REF | tr / - )
> >   IMAGENAME=$CI_REGISTRY/$CI_PROJECT_PATH/$NAME
> > -DOCKERFILE_CHECKSUM=$(sha1sum $DOCKERFILE | cut -d ' ' -f1)
> > +if [ -f ${DOCKERFILE}-minimal ]; then
> > +	DOCKERFILE_MINIMAL=${DOCKERFILE}-minimal
> > +else
> > +	DOCKERFILE_MINIMAL=
> > +fi
> > +DOCKERFILE_CHECKSUM=$(cat ${DOCKERFILE} ${DOCKERFILE_MINIMAL} | sha1sum - | cut -d ' ' -f1)
> 
> As I understand minimal image is optional? - lack of it does not mean there
> is error. If yes then it looks OK.
> 

Problem was with new lib needed for compilation, which was added
to debian-minimal. As sum of debian dockerfile didn't change, it
was not recreated and all compilations on debian failed.

Maybe I will add this to description to make it clear.
And yes, now most images do not have minimal, only debian
but this seems to be more generic. Maybe in future there
will be fedora-minimal?

> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 

Thank you, I will merge it soon.



Regards,
Kamil

> Regards
> Andrzej
> 
> >   REFNAME=$IMAGENAME:$REF
> >   DOCKERNAME=$IMAGENAME:dockerfile-$DOCKERFILE_CHECKSUM
> 
