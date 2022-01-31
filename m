Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00CA10E22C
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jan 2022 18:19:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u6so28597180lfm.10
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jan 2022 10:19:32 -0800 (PST)
MIME-Version: 1.0
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
 <CAOw6vbLy+-SXF+PT25JMQHqE1op++G76dv6HkfvfoEXxw=vRhg@mail.gmail.com>
In-Reply-To: <CAOw6vbLy+-SXF+PT25JMQHqE1op++G76dv6HkfvfoEXxw=vRhg@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 31 Jan 2022 13:19:20 -0500
Message-ID: <CAJUqKUpjkfDOdV882s5f_QtEeD8PxF-w6MNuXppxTX9u9ZNcdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [RFC i-g-t 0/1] Introduce MAINTAINERS file to IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org, Solomon Chiu <solomon.chiu@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:18 AM Sean Paul <seanpaul@chromium.org> wrote:
>
> On Mon, Jan 31, 2022 at 9:29 AM Rodrigo Siqueira
> <Rodrigo.Siqueira@amd.com> wrote:
> >
> > Hi,
> >
> > IGT is becoming more generic, and multiple vendors are adopting it. For
> > example, AMD fully upstream all of its internal changes last year, and
> > now we are relying on IGT from the upstream. Additionally, thanks to the
> > ChromeOS project, we have other vendors working on the KMS tests as
> > well. At this point, I believe that we need some mechanism to better
> > contact developers that care about some specific tests or even provide an
> > easy way for other people to find the right stakeholder for dealing with
> > some particular issue.
> >
>
> Hi Siqueira,
> Do you have a sense for how much of this is necessary once igt
> transitions to gitlab merge requests (or what it looks like in that
> new reality)? IIRC the reason igt is not using MR's is because of some
> CI infrastructure only talking mailing list, I was under the
> impression that was changing and MR's were the way forward.
>
> Sean
>
I still see value for a maitainer list, not just for code reviews.
I find it as a useful tool for Point of Contact when a test fails.
If we suddenly see a test failing on a certain device, we can look up
who would knows best about it. Or even if there are questions about a
specific thing in a test on a certain SoC.

@Petri, do we know if MRs are coming soon?
> > Imho Linux Kernel already has a good solution codified in the
> > MAINTAINERS and get_maintainers files. One of the best things about this
> > approach was adding reviewers and maintainers (and other options) to the
> > specific part of the code and using the get_maintainers tool to extract
> > the right people to be part of the series. With this idea in mind, I
> > created this RFC that introduces the MAINTAINERS file in IGT, and I have
> > already added some entries to this file. My approach was:
> >
> > * Petri and Hiler are the maintainers, and for this reason, their
> >   contact will be displayed for every patch.
> > * I add Mark Yacoub as a reviewer for every KMS test.
> > * I added some AMD folks as reviewers in some specific KMS tests that we
> >   run in our CI.
> > * I added some AMD maintainers to amdgpu tests.
> >
> > If you want to try it in your local repository, you will need the
> > get_maintainers script from the Linux kernel, and you can use this
> > command:
> >
> >  perl /PATH/TO/get_maintainer.pl --no-tree --separator , --nokeywords --nogit --nogit-fallback --norolestats -f <TARGET_TEST>
> >
> > Anyway, this is just an idea that I want to discuss with the community.
> > What do you think about having a MAINTAINERs file? Do you want to add
> > your name as a reviewer to some specific test if you like the idea? Any
> > other comments or ideas?
> >
> > Cc: Arkadiusz Hiler <arek@hiler.eu>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Mark Yacoub <markyacoub@google.com>
> > Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
> > Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
> > Cc: Wayne Lin <wayne.lin@amd.com>
> > Cc: Nicholas Choi <nicholas.choi@amd.com>
> > Cc: Martin Peres <martin.peres@mupuf.org>
> > Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> > Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
> > Cc: Solomon Chiu <solomon.chiu@amd.com>
> >
> > Best Regards,
> > Siqueira
> >
> > Rodrigo Siqueira (1):
> >   MAINTAINERS: Introduce MAINTAINERS file
> >
> >  MAINTAINERS | 203 +++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 201 insertions(+), 2 deletions(-)
> >
> > --
> > 2.25.1
> >
