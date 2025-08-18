Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDE9CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 15:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839010E474;
	Mon, 18 Aug 2025 15:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmZR61C8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F6610E474
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 15:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755530281; x=1787066281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NFIGgvBCFJmRM50zUT80Xs0WIIqL4xIjqMvWiYNWLBw=;
 b=YmZR61C8QMOtWXg2WFf5Vfu40uu9vfFuQcTZRTheJ1I6ycYJ9hSo7m8Q
 boj7PW+s0fdLEFBT99kLTe9ap5ohpzs6SSfkqb6GgdZAH4aK71ViyO5L7
 e8ZZURRPMnIA0uZ3Q+Te5fYP46uEWoxhFJxoTMq1wrZt+D2kxkdyvgmIW
 ArCtQQPOHnff6t22okIYx59OIJIkmKjVGlsAFWADywoNtrHmYIW1GYYUa
 fVjE5F6FBlWzn40q0qjQReZnVMOHtaH0iAV427MecolMOl6Jy5NV0lRtQ
 ryOJtbtBgKnwjAi5ovhwe5i37PSe+4wqGW4SI+V5VX3spXohW0FleO9Ny w==;
X-CSE-ConnectionGUID: DI26wHLbQZGaRDpeNXQgoQ==
X-CSE-MsgGUID: 2B+hHNqfS9Sy1DPcPUFftQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61568190"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61568190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:18:00 -0700
X-CSE-ConnectionGUID: GagC5Gf3SbmTzlvmQMf4gw==
X-CSE-MsgGUID: K45iHifwQoyaCPusjgbwrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171836321"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 08:17:59 -0700
Date: Mon, 18 Aug 2025 17:17:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_vbt_decode: convert copyright signs
 from latin1 to utf8
Message-ID: <20250818151744.kbny4d7xfhl3hvpy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
References: <20250818105133.2676928-1-jani.nikula@intel.com>
 <20250818130936.qhgblto66rbobjnj@kamilkon-DESK.igk.intel.com>
 <ed8c988c5bedb37b04e8e7df575c46d9ce5824ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed8c988c5bedb37b04e8e7df575c46d9ce5824ad@intel.com>
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

Hi Jani,
On 2025-08-18 at 16:41:59 +0300, Jani Nikula wrote:
> On Mon, 18 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi Jani,
> > On 2025-08-18 at 13:51:33 +0300, Jani Nikula wrote:
> >> Various tools trip over with latin1 characters in the source, as
> >> nowadays everything pretty much expects utf8.
> >> 
> >> For example, [1] fails to apply in both Patchwork and b4, because
> >> somewhere along the way, the latin1 copyright sign has in fact been
> >> automagically converted to utf8, and the source still has latin1.
> >> 
> >> Instead of debugging legacy encodings and conversions, just convert the
> >> remaining latin1 files to utf8 using iconv.
> >> 
> >> [1] https://lore.kernel.org/all/7090e70d712c94aed53f52c49a8155eb4c6b966c.1755175663.git.jani.nikula@intel.com/
> >> 
> >> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >
> > This still do not apply, now it looks strange even in patchwork,
> > two chars 'A^' '(c)' instead of one '(c)'.
> >
> > With old file:
> >
> > $ echo $LANG
> > C
> > $ grep -n Copyright tools/intel_bios.h
> > 2: * Copyright � 2006 Intel Corporation
> >
> > $ export LANG=C.UTF-8
> > $ grep -n Copyright tools/intel_bios.h
> > grep: tools/intel_bios.h: binary file matches
> >
> > $ export LANG=C
> > $ head -n2 tools/intel_bios.h|tail -n1|od -tx1a
> > 0000000  20  2a  20  43  6f  70  79  72  69  67  68  74  20  a9  20  32
> > 	 sp   *  sp   C   o   p   y   r   i   g   h   t  sp   )  sp   2
> > 0000020  30  30  36  20  49  6e  74  65  6c  20  43  6f  72  70  6f  72
> > 	  0   0   6  sp   I   n   t   e   l  sp   C   o   r   p   o   r
> > 0000040  61  74  69  6f  6e  0a
> > 	  a   t   i   o   n  nl
> > 0000046
> >
> > Your patch now downloaded from patchwork:
> >
> > $ grep Copyright  /tmp/tools-convert-to-utf8.mbox
> > - * Copyright © 2006 Intel Corporation
> > + * Copyright Â© 2006 Intel Corporation
> > - * Copyright © 2006 Intel Corporation
> > + * Copyright Â© 2006 Intel Corporation
> >
> > $ grep Copyright  /tmp/tools-convert-to-utf8.mbox |head -n1|od -tx1a
> > 0000000  2d  20  2a  20  43  6f  70  79  72  69  67  68  74  20  c2  a9
> >           -  sp   *  sp   C   o   p   y   r   i   g   h   t  sp   B   )
> > 0000020  20  32  30  30  36  20  49  6e  74  65  6c  20  43  6f  72  70
> > 	 sp   2   0   0   6  sp   I   n   t   e   l  sp   C   o   r   p
> > 0000040  6f  72  61  74  69  6f  6e  0a
> > 	  o   r   a   t   i   o   n  nl
> >
> > so in your patch file already has 'c2' 'a9' and that is changed to yet
> > another chars?
> >
> > You could look into your patch here in patchwork:
> > https://patchwork.freedesktop.org/patch/669076/?series=153057&rev=1
> >
> > and compare with another which adds new file also with (c):
> > https://patchwork.freedesktop.org/patch/668316/?series=152889&rev=1
> 
> Locally the git format-patch patches are fine, and apply fine. Somewhere
> between git send-email, various servers, mailing lists, patchwork and
> public-inbox it goes south.
> 
> I'm sorry, but I can't be bothered to figure out what hoops I have to
> jump through to send this patch in a way that all the tools in the
> pipeline will understand. Life is too short.
> 
> Bottom line, intel_bios.h and intel_vbt_decode.c have latin1 copyright
> characters in the repo, and we should get rid of them.

Uh, sorry, now I checked your patch taken from mailing list and it do
apply and looks correct, so 

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

If you want to have merge it first before your other tools changes you can,
then that series will need a resend.

Regards,
Kamil

> 
> I can push the changes directly from my repo, or you can run 'iconv
> --from-code=latin1 --to-code=utf8' on the files yourself, and make it
> happen.
> 
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
> >> ---
> >> 
> >> I'll be trying 'git send-email --8bit-encoding=iso-8859-1' on this
> >> one. Fingers crossed.
> >> ---
> >>  tools/intel_bios.h       | 2 +-
> >>  tools/intel_vbt_decode.c | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/tools/intel_bios.h b/tools/intel_bios.h
> >> index 01de2246e147..d874a268fe70 100644
> >> --- a/tools/intel_bios.h
> >> +++ b/tools/intel_bios.h
> >> @@ -1,5 +1,5 @@
> >>  /*
> >> - * Copyright © 2006 Intel Corporation
> >> + * Copyright Â© 2006 Intel Corporation
> >>   *
> >>   * Permission is hereby granted, free of charge, to any person obtaining a
> >>   * copy of this software and associated documentation files (the "Software"),
> >> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> >> index 7bb3c19c3340..85bda78a2a54 100644
> >> --- a/tools/intel_vbt_decode.c
> >> +++ b/tools/intel_vbt_decode.c
> >> @@ -1,5 +1,5 @@
> >>  /*
> >> - * Copyright © 2006 Intel Corporation
> >> + * Copyright Â© 2006 Intel Corporation
> >>   *
> >>   * Permission is hereby granted, free of charge, to any person obtaining a
> >>   * copy of this software and associated documentation files (the "Software"),
> >> -- 
> >> 2.47.2
> >> 
> 
> -- 
> Jani Nikula, Intel
