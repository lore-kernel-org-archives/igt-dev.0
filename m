Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A804CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 10:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAF410E371;
	Tue, 28 Oct 2025 10:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwUGgYaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4152510E371
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 10:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761645988; x=1793181988;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VjMEOYXHXoXg4ohFsSaSKNOZYqKUNNqiSyJ8hOQjroM=;
 b=iwUGgYaw7qGnct9/Y/UfegV8Ap/+onAB7NUbYYwhHMGYKcG3sMj/GLtU
 AQB7XVi/DivZmB924qi7dEiCnv60K1OVZI75ouSzvPlWjehuHUEZEvaH3
 2gAItQZtQL9nSU5xygqpTEIogerd9l6SWiEeaNXNpP7IvYR6xv7nl8PAD
 3zpQwa2A9unLMqgnpfPFLsZDpIsxKywHLSPscBCQk4jl1X43dF8EtR3bX
 WIUkwzV+wRb+NFEBgusZJ845k9xGr9YCOjOnDZ5BqHXTiMFYRcW9QtrDB
 QIkEmdxZSvQO1T6UqOw/wFVKIz0DcXbAU3oCTDBROXklD9iE9Z5jq8uex g==;
X-CSE-ConnectionGUID: Qxq8+oH8SRmmrXIwjNSeGA==
X-CSE-MsgGUID: ChLwJ/JASnGMhGB4FItrQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63836806"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63836806"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:06:28 -0700
X-CSE-ConnectionGUID: WAm6okWKQtGUBq7RuND5Iw==
X-CSE-MsgGUID: f/NsjuinSIWGqbIYCKQ1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184932973"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:06:25 -0700
Date: Tue, 28 Oct 2025 11:06:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Message-ID: <20251028100607.3jsh6oyimk7tkzal@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
 <20251022100800.lpa2fibl3u662egy@kamilkon-DESK.igk.intel.com>
 <31c5cc112765c060e4dd723c5873988526fba63c.camel@mediatek.com>
 <20251023134419.duon7byxg5r6dzxx@kamilkon-DESK.igk.intel.com>
 <93d9acd4954e7daf7e737e9610fc8c37d97825e2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93d9acd4954e7daf7e737e9610fc8c37d97825e2.camel@mediatek.com>
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
On 2025-10-27 at 18:10:52 +0000, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2025-10-23 at 15:44 +0200, Kamil Konieczny wrote:
> > 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > Hi Jason-JH,
> > On 2025-10-22 at 11:16:22 +0000, Jason-JH Lin (林睿祥) wrote:
> > > > 
> > > [snip]
> > > > >               ds = &np->data.string;
> > > > >               strncpy(name, ds->str, name_size - 1);
> > > > >               name[name_size - 1] = '\0';
> > 
> > Btw is it possible to have non-empty name later on in this loop?
> > So in case of empty name (all spaces) name could be searched in
> > next round in:
> >         for (i = 0; i < DETAILED_TIMINGS_LEN; i++) {
> > 
> 
> Usually, monitor name would be in the type of 0xFC at the one of edid-
> >edtailed_timings[i]. But not 100%, sometimes it won't have the monitor
> name and sometimes it will be in the type of 0xFE.
> 
> > > > > +
> > > > > +             /* remove the padding space from EDID */
> > > > > +             for (n = name_size - 2; n > 0 &&
> > > > > isspace(name[n]); n-
> > > > > -)
> > > > 
> > > > With ssize_t it could be:
> > > > 
> > > >                 for (n = name_size - 2; n >= 0 &&
> > > > isspace(name[n]);
> > > > n--)
> > > 
> > > OK, I think I got your point.
> > > 
> > > If we use size_t n = name_size - 2,
> > > when name_size = 0, then n = (size_t)-2.
> > 
> > There is assert at begin for name_size > 0
> 
> Oh yes, I didn't notice this, so name_size = 0 won't happen.
> 
> > but it should really be > 1 to accomodate '\0'
> 
> Should I also fix the assert from (name_size > 0) to (name_size > 1),
> to avoid the size of strncpy(name, ds->str, name_size - 1) being 0?
> 

Yes, please fix this assert and add a comment there.

Regards,
Kamil

> > 
> > > 
> > > n = 0xFFFFFFFF - 1 // 32-bit unsigned
> > >   = 4294967294
> > > 
> > > Then, n > 0 && isspace(name[n]) will be out of bound in name[n].
> > > 
> > > I'll fix this at the next version. Thanks!
> > 
> > Or make it work other way around:
> > 
> > for (n = name_size - 1; n > 0; ) {
> >         if (!isspace(name[--n])
> >                 break;
> > 
> >         name[n] = '\0';
> > }
> > 
> > so non-empty name could be tested with name[0]
> > 
> > > 
> > > > 
> > > > so following line:
> > > > 
> > > > > +                     name[n] = '\0';
> > > > 
> > > > will actually trim it into empty string.
> > > > 
> > > > > +
> > > > >               igt_debug("Monitor name: %s\n", name);
> > > > 
> > > > What about informing about empty name here? For example:
> > > > 
> > > >                 igt_debug("Monitor name: %s\n", n > 0 ? name :
> > > > "(empty)");
> 
> I found that the original condition (n > 0 ? name :"(empty)") would
> make this case: name[] = "A       \0" go wrong.
> 
> When the for loop breaks from n = 0, name[] = "A\0".
> Then, it will be printed as "(empty)", not "A\0".
> 
> > And then here check with 'name[0] ? name : "(empty)"'
> > 
> 
> I'll use your suggestion instead.
> 
> Thanks,
> Jason-JH Lin
> 
> > Regards,
> > Kamil
> > 
> > > 
> > > Sure, I'll also add this to the next version.
> > > 
> > > Regards,
> > > Jason-JH Lin
> > > 
> > > > 
> > > > Regards,
> > > > Kamil
> 
