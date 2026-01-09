Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72E8D1A610
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 12:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB0C10E053;
	Fri,  9 Jan 2026 12:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxsVRw/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769110E053
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767961685; x=1799497685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gXYlVoO7RMknUdR4+4YBPZVcP7Cj5AKE4LpRqAuifCE=;
 b=SxsVRw/2do5fHsCAMW59HvCcKNSpte3XN7fUEkniZxI45ObafTmnt6C8
 UfxqCVaPwJxJ0RQGzbt5zMWMHscqOyhov+JHdJ55jYRKjRwXQ9WdEuHb8
 XKpR9KlsCfVRPnb6vPMbVe57v75Lnuh6Zf+lxaNOX0TKu00Xomx9HPobX
 1xNnmGYmj++Mq655oKl2GiI0xxg4XE0KWmItQXv4B3Fw1L8jJZbVs46MO
 kr2AkJJiOr3KH4pZg5SxDVONmjSZUIkMxXTv1bm4xN7/UNys5r5u4UT2U
 jdkkQFZFKzuaYso7Yub/DyFJUkidcnDw2z5/iF6kByA80BiDNCTfxiZhy Q==;
X-CSE-ConnectionGUID: kEhzB6XLS1entie3ihDY4g==
X-CSE-MsgGUID: vj2sxc2UR/iP/OKcrYWMRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68541065"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="68541065"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 04:28:05 -0800
X-CSE-ConnectionGUID: UFoeNXinT+WYYJ5kSWpZTg==
X-CSE-MsgGUID: YheoCx7cT1yXtNAdjFdDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="202671203"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:28:03 -0800
Date: Fri, 9 Jan 2026 13:27:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
Message-ID: <20260109122749.only7q7zrom3uuqq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
 <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
 <20260108120845.o34q2kszyy73pbky@kamilkon-DESK.igk.intel.com>
 <b2954021c862f98c125f9f2d46726c453a13ee7b.camel@intel.com>
 <CAJ=qYWRKyHKemgWceWHJQWKhjOwTtmf3bpTi_4H6dUYqrwQ4KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWRKyHKemgWceWHJQWKhjOwTtmf3bpTi_4H6dUYqrwQ4KA@mail.gmail.com>
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

Hi Juha-Pekka,
On 2026-01-08 at 18:36:13 +0200, Juha-Pekka Heikkilä wrote:
> On Thu, Jan 8, 2026 at 2:49 PM Knop, Ryszard <ryszard.knop@intel.com> wrote:
> >
> > On Thu, 2026-01-08 at 13:08 +0100, Kamil Konieczny wrote:
> > > Hi Juha-Pekka,
> > > On 2026-01-07 at 18:49:52 +0200, Juha-Pekka Heikkilä wrote:
> > > > On Wed, Jan 7, 2026 at 5:55 PM Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> > > > >
> > > > > Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
> > > > > > Here added compress-js parameter for runner. What it does is at per test level
> > > > >
> > > > > Maybe rename it to --compress-json-dmesg to be more precise?

Or --compress-dmesg as this is what is written in metadata.txt

While this compression looks usefull, please try it first
with igt trybot with only tests which should fail (take them
from full i915 run) as there are problems with error reporting.

It looks like there is no dmesg section now for all failed tests.
Maybe it will work with a section renamed into compressed-dmsg?

This will also hinder current error reporting as there are
not even single error line in dmesg :(
For example:

https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14308/shard-tglu-7/igt@i915_module_load@fault-injection@intel_connector_register.html

there is dmesg-warn but none is shown in report.

Regards,
Kamil

> > >
> > > Can we have it an option for using outside compressor? Like:
> > > --compress-with=xz
> > >
> > > I tested both gzip and xz and the latter was even better.
> > > zlib could be hold as a fall-through, when no on-system is
> > > availabe or one given in option do not work.
> >
> > There's also zstd which compresses better and faster than all of the
> > above (tested on archived, complete results.json).
> >
> 
> Compression scheme is not difficult to change on this; as I see it the
> only thing to consider is all those places where compression would
> need to be opened, they would be able to do it.
> 
> > > >
> > > > Yea, that can be changed. I'm waiting to hear also from CI people, I
> > > > could've gone and compressed those other fields too but I understood
> > > > from CI people they want to keep things searchable, hence for now I
> > > > did stick just with dmesg as those are always the biggest blobs.
> > > >
> > >
> > > +cc Ryszard and Ewelina
> > > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > > Cc: Ryszard Knop <ryszard.knop@intel.com>
> >
> > I don't like this tbh:
> >
> > - Compressing individual keys within the document causes the overall
> > document to compress significantly worse. We already archive compressed
> > logs for some pipelines, and those would need far more space with this.
> > (This does not happen everywhere because some legacy scripts have
> > issues with compressed logs, but doing it here would not really solve
> > the problem, rather delay it a bit.)
> 
> I understand concern regarding double compression efficiency (and the
> base64 overhead), but 'would need far more space' seems like a strong
> claim. While I agree the outer archival compression won't be able to
> re-compress these keys, the input file itself is essentially smaller.
> Even with the base64 overhead and the loss of "second pass"
> compression, I wouldn't expect the final archive to be significantly
> larger than current raw logs.
> 
> >
> > - This also does not solve the 2GB file limit for json-c. You can still
> > hit it with difficult to compress logs, and since you're doing it per
> > key, the compression ratio is not that great. The solution here is to
> > switch this library to something else, like Jansson or yyjson, which
> > handle >2GB cases just fine.
> 
> Let's not forget we're talking about logs here which don't have binary
> data, any deflate algorithm should work quite well on those. As I
> understood from Kamil's offline comment >2GB became less than 300MB.
> While it is just one test it still did even better than my limited
> tests. ~6x reduction would be quite massive safety margin.
> 
> >
> > - Compressed bytes -> base64 to save them in the JSON again makes the
> > compression ratio worse. :(
> >
> > Instead of this change, CI side should get the visualizer and i915-
> > infra scripts modified to handle compressed files everywhere.
> 
> I've already had mr going this direction but nobody ever did touch it
> https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/112
> 
> >
> > Thanks, Ryszard
> >
> > > > >
> > > > > > for results.json in dmesg key is written text "compressed" to maintain
> > > > > > compatibility and on the side of it is written new key dmesg-compressed which
> > > > > > contain dmesg ran through zlib and base64 encoded.
> > > > >
> > > > > Should this be only about compressing dmesg for results.json? Or should
> > > > > we take a step back and make it compress the dmesg files in the results
> > > > > directory and then that would also be reflected in results.json?
> > > >
> > > > That's a possibility; TBH I just didn't think about doing that at
> > > > earlier stage. Idea on this anyway is to save space on CI storage.
> > > >
> > >
> > > Compression is one possibility but it do not solve problem with
> > > very big logs, like over 2GB. I was thinkning about cutting successfull
> > > log into only begin+end lines of dmesg, so developers could find them
> > > later in dmesg saved outside of json. Also it should be done for big ones,
> > > not all of them.
> > >
> > > Btw your idea is good for IGT gitlab issue:
> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/21
> > > [IGT runner] allow attachments to results.json
> > >
> > > and few others around it:
> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/22
> > > [IGT runner] allow tests to attach test-specific results
> > >
> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/14
> > > [igt_runner] Collect pstore data and attach it to dmesg output when resuming or reporting
> > >
> > > All of them rely on possibility to attach new files into results.
> > >
> > > > >
> > > > > By the way, do you know if we have good compression rate on existing
> > > > > data?
> > > >
> > > > On my super limited test with this change, with kms tests the overall
> > > > size of json came down to around 1/6 of original size. I'll still need
> > > > to experiment more with that.
> > > >
> > >
> > > Hmm, let me test it on one sample where json itself was >= 2GB
> > > and see if it could help.
> > >
> > > Regards,
> > > Kamil
> > >
> > >
> > > > >
> > > > > >
> > > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > > > ---
> > > > > > runner/resultgen.c    | 117 ++++++++++++++++++++++++++++++++++++------
> > > > > > runner/runner_tests.c |   2 +
> > > > > > runner/settings.c     |   7 +++
> > > > > > runner/settings.h     |   1 +
> > > > > > 4 files changed, 112 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > > > > > index 1f7e79f24..ef6385598 100644
> > > > > > --- a/runner/resultgen.c
> > > > > > +++ b/runner/resultgen.c
> > > > > > @@ -8,6 +8,7 @@
> > > > > > #include <sys/stat.h>
> > > > > > #include <sys/types.h>
> > > > > > #include <unistd.h>
> > > > > > +#include <zlib.h>
> > > > > >
> > > > > > #include <json.h>
> > > > > >
[cut]
