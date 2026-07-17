Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490AEC44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFB510F547;
	Fri, 17 Jul 2026 12:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrtbfKyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519C710F547
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784291641; x=1815827641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8KUBB/c5GnINs4RG/9R/ztJIIDEB0ouAWtJImV2Lkrc=;
 b=HrtbfKyjx0Uy3sxOPEaTZHmj4JSCZsv0W01msbsKlTs0D/HfFNoY+zXr
 zVRWIZ+pEB2vKMp7ca2Ld9v+PUiGwXO9mhACfnMMc+aF38Oa4QB7nCLPN
 me/orgxHMQe+GxXpIgD9zTaQwnl2kIY5m8+ZyPq6PjHPkOcUw/W1fWd5d
 TrZjPMRO9WZgKU+vBOB0P5a8c7iApK63twobLA4iyPkJvt91ZBK4vNX3m
 HRqROAJPa4Ig6C6AnuOSFGYGRkg/gSIDBVCg9kAZeGYRkBQQsPaShb/Ml
 T9YVuGJDPmu16ktktLupuX5o4d+6Og5oQz4g23Re0r6y0tr8q+dYxOVMs A==;
X-CSE-ConnectionGUID: sCgkDujMQeKAHMlgLCY/oA==
X-CSE-MsgGUID: z2cK4tmoRXaum+QsmGmI7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84817887"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="84817887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:34:01 -0700
X-CSE-ConnectionGUID: E67+HE+XQPm/ASTFk44LRQ==
X-CSE-MsgGUID: YhJtfYwsTji8gZS6/68INw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="286856526"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:33:58 -0700
Date: Fri, 17 Jul 2026 14:33:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Manasi Navare <navaremanasi@google.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 Lancelot Wu =?utf-8?B?KOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH i-g-t v2] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Message-ID: <20260717123355.5g4v2wjbmkgepemj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Manasi Navare <navaremanasi@google.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 Lancelot Wu =?utf-8?B?KOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "fshao@chromium.org" <fshao@chromium.org>
References: <20260621081043.598388-1-jason-jh.lin@mediatek.com>
 <520d7fe2b1ef01d81cbb9cba7ca79e5cbd15922c.camel@mediatek.com>
 <CAMNLLoTHYoE3AiFeTaCj14ktcvuMjR0LoewUnmR+AXpoEoxpZw@mail.gmail.com>
 <bd0165e7-d245-4780-ae78-691589bc808a@intel.com>
 <e6b4e5b8b39eae29a2749d15e1d13a34b7d24b04.camel@mediatek.com>
 <667d2cc5-a7ab-4c2c-9218-e50e01001b9c@intel.com>
 <dd0fa20c95b8e0b66eb5a4f0cdde4fa44516e5d6.camel@mediatek.com>
 <CAMNLLoTOnZdL78BcJ15tqP+MaN6WU=-=jSHx0+E81tJGdNPuhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMNLLoTOnZdL78BcJ15tqP+MaN6WU=-=jSHx0+E81tJGdNPuhQ@mail.gmail.com>
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

Hi all,
On 2026-07-15 at 11:55:45 -0700, Manasi Navare wrote:
> Great, thanks a lot Swati for reviews.
> Could we get this landed if CI results look good?

Applied, thanks!


Regards,
Kamil

> 
> Regards
> Manasi
> 
> On Fri, Jul 10, 2026 at 12:21 AM Jason-JH Lin (林睿祥) <
> Jason-JH.Lin@mediatek.com> wrote:
> 
> > On Fri, 2026-07-10 at 02:07 +0530, Sharma, Swati2 wrote:
> > >
> > > On 09-07-2026 01:12 pm, Jason-JH Lin (林睿祥) wrote:
> > > > On Thu, 2026-07-09 at 12:00 +0530, Sharma, Swati2 wrote:
> > > > >
> > > > > Hi Jason,
> > > > >
> > > > > Rev2
> > > > >
> > https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/166923/*rev2__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXl_HZk1P$
> > > > >   i see IGT
> > > > > build failure,
> > > > >
> > > > > can you please check?
> > > > >
> > > > Hi Swati,
> > > >
> > > > Because the series
> > > >
> > https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/168759__;!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXux1w-1m$
> > > >
> > > > haven't landed at that time.
> > > > I have confirmed this patch has no conflicts in the latest
> > > > codebase.
> > > >
> > > > I resend it again, but it seems [i-g-t v2 RESEND] will not trigger
> > > > a
> > > > new build. So I sent a [i-g-t v3], please help check it.
> > > >
> > https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/166923/*rev3__;Iw!!CTRNKA9wMg0ARbw!jJDLK7pG0ZuxmGD136DdZjWzRPf1LZUuc6ZYogtPdi8lydj57e7rG3K-B5-1SJam7TDwVn6K7BDFbovc478SXlqtxaxb$
> > > >
> > > >
> > > > Thanks!
> > > >
> > > > Regards,
> > > > Jasdon-JH Lin
> > >
> > > Hi Jason,
> > >
> > > Patch LGTM
> > >
> > > Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> > >
> > > Please wait for CI results before merge.
> >
> > That's great, thank you for your review!
> >
> >
> > Regards,
> > Jason-JH Lin
> >
