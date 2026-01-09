Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA02D26D75
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 16:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368AD10E90C;
	Fri,  9 Jan 2026 16:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y8OF91t1";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B9410E90C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 16:38:04 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29f102b013fso43804285ad.2
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Jan 2026 08:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767976684; x=1768581484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jzDlt4JBhIzDxptpo+h0aItHrMdg45kpYTbjyNWr+Ss=;
 b=Y8OF91t1Gm+VNQg2DbRY+FkfU1fTPY34kvhgpRgfV9eHassSixvj2nGwV6DH9CftYP
 HAly8WB0A9M5hNJtfInSPk4YoT82RRNL7LMFPP5vz1f0k/vxMscDDgPOpnxhrq8Ruly0
 b9TJ2ehhXuwApBkOH+GUVxieMlZJMiPqEwGQvLH/uFtOa645BnVLUX1ay1k9zmxFQNsK
 BN9g1Qh37IVpGT4EYFmOvH+qMnwEaKBKY7DNTCXcNpKt58YD+Gqx62SiSnr6Da1bwNjL
 oeD8M0M37H2u9Vyq/QRy/jIt7TOE6vFEN3bOGjryhm/0nb0ob4CZ7tLZf/uSuIqOPix1
 gdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767976684; x=1768581484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jzDlt4JBhIzDxptpo+h0aItHrMdg45kpYTbjyNWr+Ss=;
 b=WOJGmVmfDcbWtrLQ7axEC+NZYWiQxCG7um7hJ19o0bjW1CcPuhtUGssczrG+opu1cY
 xWCV8vcCGs0Qo7IJOio92BfMGb0aDzH5XQWuBZLE2W6cTefTKHNyuCdhGHdr9EWEboXa
 kIRpKKXzW0giR5LjWZ0iBqcBzO9j2/rDf3YLLYPmCIUvDbEJaaQpqLofLah/AYQbolX2
 0LYNu3Q1n8gSRV9MCBAoH6QoshRTD5Auej+TmP2pzUAPPq2hVNQFhJeFA6cDRocbD7wJ
 wTq18t1ISbv1N/Na1H6o2mwgnmIIj5tbwyCYq2ZZ6RMtqK/TNWX+plftc6xBU9w3KFV3
 aWxQ==
X-Gm-Message-State: AOJu0Yz/R0mgS/4kEArlHfHiO8Vr6sm03mTjKvscdri6h2hVPL63GYEv
 MLIxbjXxuoKvsDo05TPHUsb8QoZ1nijfRkU6wwGVu3nL8gdWAicWQw18W+eNrlcHtEXoo18IcPA
 Bic050FejDBQ9QE+Z1ymUngd3t14Ss0k=
X-Gm-Gg: AY/fxX5YJa106UczlDldTZ3n4sr2qZlmGYQ4ysyp2eyjKX2aG7wG+aBNDCW4yWA5Z/j
 AKZR81HzxC59pzOI/XS4OwxmOY8fB/ErfUyAlDqMsE/Ofrin0gbglLbdPM+DOCsVm7sw12qkFX4
 twTn6Fz2T7Nd5FdywJ0cw/U7DbnknGqAvNJ+8ImT5K/PkREFU8rMPwfS1ppQvQm5s9bAD9AQBPn
 GZeFTRsKSJR3QkOqX0bxCdZz0ZuvUMZGG+0nW1lHSBfDVBMx0nATtygp6QNM+conDEUyQ12b0Lv
 O9vm8W9FvwD4RNbIaOB3iUXSRkoA4Q==
X-Google-Smtp-Source: AGHT+IGPtPBPticd9v3cvs4gwYuhgXL8eyDecXn9NtPdUiFTG0d7XM9RzwnU72zy7RsGYRTU1ufOBuopXmIHm7sXEPM=
X-Received: by 2002:a17:902:e5ca:b0:295:425a:350e with SMTP id
 d9443c01a7336-2a3ee424c22mr87928955ad.8.1767976683556; Fri, 09 Jan 2026
 08:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20260107151004.327093-1-juhapekka.heikkila@gmail.com>
 <20260107151004.327093-2-juhapekka.heikkila@gmail.com>
 <176780133253.14086.11727954615085076706@intel.com>
 <CAJ=qYWQ+Kq1egCr3U1rVCyo-jo57rzGUDyqF3Z30WRJ4-LmKYw@mail.gmail.com>
 <20260108120845.o34q2kszyy73pbky@kamilkon-DESK.igk.intel.com>
 <b2954021c862f98c125f9f2d46726c453a13ee7b.camel@intel.com>
 <CAJ=qYWRKyHKemgWceWHJQWKhjOwTtmf3bpTi_4H6dUYqrwQ4KA@mail.gmail.com>
 <20260109122749.only7q7zrom3uuqq@kamilkon-DESK.igk.intel.com>
 <463610789c550d17cdf06f11504cca730da2f581.camel@intel.com>
In-Reply-To: <463610789c550d17cdf06f11504cca730da2f581.camel@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 9 Jan 2026 18:37:51 +0200
X-Gm-Features: AQt7F2oQMwDWwZUDG0b8tmBpKGKaCW2mUbmeu1MscvFx1Pp5AlJzfybRBJVq4BM
Message-ID: <CAJ=qYWSoRjQW_zRNT1hwFpBmkiO_nwTsWTMbWnpUJawF6OH=Bw@mail.gmail.com>
Subject: Re: [RFC PATCH i-g-t 1/1] runner: add possibility to compress dmesgs
 inside json
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Sousa, Gustavo" <gustavo.sousa@intel.com>, 
 "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, 
 "Musial, Ewelina" <ewelina.musial@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jan 9, 2026 at 2:35=E2=80=AFPM Knop, Ryszard <ryszard.knop@intel.co=
m> wrote:
>
> On Fri, 2026-01-09 at 13:27 +0100, Kamil Konieczny wrote:
> > Hi Juha-Pekka,
> > On 2026-01-08 at 18:36:13 +0200, Juha-Pekka Heikkil=C3=A4 wrote:
> > > On Thu, Jan 8, 2026 at 2:49=E2=80=AFPM Knop, Ryszard <ryszard.knop@in=
tel.com> wrote:
> > > >
> > > > On Thu, 2026-01-08 at 13:08 +0100, Kamil Konieczny wrote:
> > > > > Hi Juha-Pekka,
> > > > > On 2026-01-07 at 18:49:52 +0200, Juha-Pekka Heikkil=C3=A4 wrote:
> > > > > > On Wed, Jan 7, 2026 at 5:55=E2=80=AFPM Gustavo Sousa <gustavo.s=
ousa@intel.com> wrote:
> > > > > > >
> > > > > > > Quoting Juha-Pekka Heikkila (2026-01-07 12:10:04-03:00)
> > > > > > > > Here added compress-js parameter for runner. What it does i=
s at per test level
> > > > > > >
> > > > > > > Maybe rename it to --compress-json-dmesg to be more precise?
> >
> > Or --compress-dmesg as this is what is written in metadata.txt
> >
> > While this compression looks usefull, please try it first
> > with igt trybot with only tests which should fail (take them
> > from full i915 run) as there are problems with error reporting.
>
> Visualization, CBL reporting and a few other CI pipeline components
> will stop working properly with this change.

There's two separate things here;

1. Breakage Kamil see: intention is for this feature to be opt-in via
command line argument. Thing with CI pipeline breaking without that
argument being explicitly passed, is a bug in my patch regarding how
the flag was to be honored, and will need to be fixed so the default
behavior remains backward compatible (uncompressed) and existing
pipelines won't notice a thing.

2. When feature is enabled, yes, tools reading these jsons would
absolutely need to have been updated to decompress the field. I noted
this in cover letter. I don't see patching json readers to handle a
compressed key as excessive work.

The dmesg data is present in those jsons, it just became compressed
due to bug. You can review those jsons on my tool I did show offline
-- which support this decompression.

> > It looks like there is no dmesg section now for all failed tests.
> > Maybe it will work with a section renamed into compressed-dmsg?
> >
> > This will also hinder current error reporting as there are
> > not even single error line in dmesg :(
> > For example:
> >
> > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14308/shard-tglu-7/igt@i=
915_module_load@fault-injection@intel_connector_register.html
> >
> > there is dmesg-warn but none is shown in report.
> >
> > Regards,
> > Kamil
> >
> > > > >
> > > > > Can we have it an option for using outside compressor? Like:
> > > > > --compress-with=3Dxz
> > > > >
> > > > > I tested both gzip and xz and the latter was even better.
> > > > > zlib could be hold as a fall-through, when no on-system is
> > > > > availabe or one given in option do not work.
> > > >
> > > > There's also zstd which compresses better and faster than all of th=
e
> > > > above (tested on archived, complete results.json).
> > > >
> > >
> > > Compression scheme is not difficult to change on this; as I see it th=
e
> > > only thing to consider is all those places where compression would
> > > need to be opened, they would be able to do it.
> > >
> > > > > >
> > > > > > Yea, that can be changed. I'm waiting to hear also from CI peop=
le, I
> > > > > > could've gone and compressed those other fields too but I under=
stood
> > > > > > from CI people they want to keep things searchable, hence for n=
ow I
> > > > > > did stick just with dmesg as those are always the biggest blobs=
.
> > > > > >
> > > > >
> > > > > +cc Ryszard and Ewelina
> > > > > Cc: Ewelina Musial <ewelina.musial@intel.com>
> > > > > Cc: Ryszard Knop <ryszard.knop@intel.com>
> > > >
> > > > I don't like this tbh:
> > > >
> > > > - Compressing individual keys within the document causes the overal=
l
> > > > document to compress significantly worse. We already archive compre=
ssed
> > > > logs for some pipelines, and those would need far more space with t=
his.
> > > > (This does not happen everywhere because some legacy scripts have
> > > > issues with compressed logs, but doing it here would not really sol=
ve
> > > > the problem, rather delay it a bit.)
> > >
> > > I understand concern regarding double compression efficiency (and the
> > > base64 overhead), but 'would need far more space' seems like a strong
> > > claim. While I agree the outer archival compression won't be able to
> > > re-compress these keys, the input file itself is essentially smaller.
> > > Even with the base64 overhead and the loss of "second pass"
> > > compression, I wouldn't expect the final archive to be significantly
> > > larger than current raw logs.
> > >
> > > >
> > > > - This also does not solve the 2GB file limit for json-c. You can s=
till
> > > > hit it with difficult to compress logs, and since you're doing it p=
er
> > > > key, the compression ratio is not that great. The solution here is =
to
> > > > switch this library to something else, like Jansson or yyjson, whic=
h
> > > > handle >2GB cases just fine.
> > >
> > > Let's not forget we're talking about logs here which don't have binar=
y
> > > data, any deflate algorithm should work quite well on those. As I
> > > understood from Kamil's offline comment >2GB became less than 300MB.
> > > While it is just one test it still did even better than my limited
> > > tests. ~6x reduction would be quite massive safety margin.
> > >
> > > >
> > > > - Compressed bytes -> base64 to save them in the JSON again makes t=
he
> > > > compression ratio worse. :(
> > > >
> > > > Instead of this change, CI side should get the visualizer and i915-
> > > > infra scripts modified to handle compressed files everywhere.
> > >
> > > I've already had mr going this direction but nobody ever did touch it
> > > https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/112
>
> Well there's also this:
> https://patchwork.freedesktop.org/series/107123/

That series is definitely relevant, though strictly speaking it
doesn't relate to compression you did comment about.

Though - what's the status of that series? If it's been known CI is
losing logs due to this issue, is there something preventing it from
being merged?

My priority is simply to make sure no logs are lost; well behaved logs
are not those that are most interesting for bugs.

>
> > >
> > > >
> > > > Thanks, Ryszard
> > > >
> > > > > > >
> > > > > > > > for results.json in dmesg key is written text "compressed" =
to maintain
> > > > > > > > compatibility and on the side of it is written new key dmes=
g-compressed which
> > > > > > > > contain dmesg ran through zlib and base64 encoded.
> > > > > > >
> > > > > > > Should this be only about compressing dmesg for results.json?=
 Or should
> > > > > > > we take a step back and make it compress the dmesg files in t=
he results
> > > > > > > directory and then that would also be reflected in results.js=
on?
> > > > > >
> > > > > > That's a possibility; TBH I just didn't think about doing that =
at
> > > > > > earlier stage. Idea on this anyway is to save space on CI stora=
ge.
> > > > > >
> > > > >
> > > > > Compression is one possibility but it do not solve problem with
> > > > > very big logs, like over 2GB. I was thinkning about cutting succe=
ssfull
> > > > > log into only begin+end lines of dmesg, so developers could find =
them
> > > > > later in dmesg saved outside of json. Also it should be done for =
big ones,
> > > > > not all of them.
> > > > >
> > > > > Btw your idea is good for IGT gitlab issue:
> > > > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/21
> > > > > [IGT runner] allow attachments to results.json
> > > > >
> > > > > and few others around it:
> > > > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/22
> > > > > [IGT runner] allow tests to attach test-specific results
> > > > >
> > > > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/14
> > > > > [igt_runner] Collect pstore data and attach it to dmesg output wh=
en resuming or reporting
> > > > >
> > > > > All of them rely on possibility to attach new files into results.
> > > > >
> > > > > > >
> > > > > > > By the way, do you know if we have good compression rate on e=
xisting
> > > > > > > data?
> > > > > >
> > > > > > On my super limited test with this change, with kms tests the o=
verall
> > > > > > size of json came down to around 1/6 of original size. I'll sti=
ll need
> > > > > > to experiment more with that.
> > > > > >
> > > > >
> > > > > Hmm, let me test it on one sample where json itself was >=3D 2GB
> > > > > and see if it could help.
> > > > >
> > > > > Regards,
> > > > > Kamil
> > > > >
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmai=
l.com>
> > > > > > > > ---
> > > > > > > > runner/resultgen.c    | 117 +++++++++++++++++++++++++++++++=
+++++------
> > > > > > > > runner/runner_tests.c |   2 +
> > > > > > > > runner/settings.c     |   7 +++
> > > > > > > > runner/settings.h     |   1 +
> > > > > > > > 4 files changed, 112 insertions(+), 15 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/runner/resultgen.c b/runner/resultgen.c
> > > > > > > > index 1f7e79f24..ef6385598 100644
> > > > > > > > --- a/runner/resultgen.c
> > > > > > > > +++ b/runner/resultgen.c
> > > > > > > > @@ -8,6 +8,7 @@
> > > > > > > > #include <sys/stat.h>
> > > > > > > > #include <sys/types.h>
> > > > > > > > #include <unistd.h>
> > > > > > > > +#include <zlib.h>
> > > > > > > >
> > > > > > > > #include <json.h>
> > > > > > > >
> > [cut]
