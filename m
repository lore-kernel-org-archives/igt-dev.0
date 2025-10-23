Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A4CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8A810E04F;
	Thu, 23 Oct 2025 13:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9iTJNU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D48010E04F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761227065; x=1792763065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TFOfdBM/e5mJQsj20RiWuRNdPETDldIcfi95L3mxTYY=;
 b=P9iTJNU0SYkKqcm+mgfkmM+pFvU9A3jH63BQbQCNHjFIFIPrlz3TgF46
 mSASmrAD6FgQZVfR4K7b/3p//6FsopOukI3Towo+TORp5Jf212vvNoObx
 x2cfnttbmIyLBssmCeDTNP3vd1eDD4O5Nwqv4epGwXHLZ7LO1lGwoT+Oi
 +xmKRy93CxZNm13D031XGxjQBtI9JwtBCEwLrUK4ILR8sE38SLvdDg6lr
 ChHxgNLPT8oJ14FA5Uxr8vfBAcURZMaSU3Gv0gRpOCmkesKfqQBqKBCU6
 PQtarGNc/rs2v/DEFRTX0qDxPRPGy9aRt0bdIUI6j/tBwHwQNTn/z8DtU Q==;
X-CSE-ConnectionGUID: UisaR2pLTOO7KnygnNkOMQ==
X-CSE-MsgGUID: 8/mrLWKUTG2WOwGiS6kbjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62425217"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="62425217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:44:25 -0700
X-CSE-ConnectionGUID: 56soZeMQRqmx62a+XvyCDA==
X-CSE-MsgGUID: w8rZtYmmSG6eTQDLTtnxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183382273"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 06:44:22 -0700
Date: Thu, 23 Oct 2025 15:44:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Message-ID: <20251023134419.duon7byxg5r6dzxx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
 <20251022100800.lpa2fibl3u662egy@kamilkon-DESK.igk.intel.com>
 <31c5cc112765c060e4dd723c5873988526fba63c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31c5cc112765c060e4dd723c5873988526fba63c.camel@mediatek.com>
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

Hi Jason-JH,
On 2025-10-22 at 11:16:22 +0000, Jason-JH Lin (林睿祥) wrote:
> > 
> [snip]
> > >               ds = &np->data.string;
> > >               strncpy(name, ds->str, name_size - 1);
> > >               name[name_size - 1] = '\0';

Btw is it possible to have non-empty name later on in this loop?
So in case of empty name (all spaces) name could be searched in
next round in:
	for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {

> > > +
> > > +             /* remove the padding space from EDID */
> > > +             for (n = name_size - 2; n > 0 && isspace(name[n]); n-
> > > -)
> > 
> > With ssize_t it could be:
> > 
> >                 for (n = name_size - 2; n >= 0 && isspace(name[n]);
> > n--)
> 
> OK, I think I got your point.
> 
> If we use size_t n = name_size - 2,
> when name_size = 0, then n = (size_t)-2.

There is assert at begin for name_size > 0
but it should really be > 1 to accomodate '\0'

> 
> n = 0xFFFFFFFF - 2 // 32-bit unsigned
>   = 4294967294
> 
> Then, n > 0 && isspace(name[n]) will be out of bound in name[n].
> 
> I'll fix this at the next version. Thanks!

Or make it work other way around:

for (n = name_size - 1; n > 0; ) {
	if (!isspace(name[--n])
		break;
	
	name[n] = '\0';
}

so non-empty name could be tested with name[0]

> 
> > 
> > so following line:
> > 
> > > +                     name[n] = '\0';
> > 
> > will actually trim it into empty string.
> > 
> > > +
> > >               igt_debug("Monitor name: %s\n", name);
> > 
> > What about informing about empty name here? For example:
> > 
> >                 igt_debug("Monitor name: %s\n", n > 0 ? name :
> > "(empty)");

And then here check with 'name[0] ? name : "(empty)"'

Regards,
Kamil

> 
> Sure, I'll also add this to the next version.
> 
> Regards,
> Jason-JH Lin
> 
> > 
> > Regards,
> > Kamil
