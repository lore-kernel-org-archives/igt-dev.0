Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A406610E770
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 12:09:52 +0000 (UTC)
Date: Wed, 2 Mar 2022 14:09:06 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <Yh9eYotWmjBpgTgO@platvala-desk.ger.corp.intel.com>
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
 <20220131142818.2686782-2-Rodrigo.Siqueira@amd.com>
 <Yfu2nPEIQQT+6l/t@platvala-desk.ger.corp.intel.com>
 <3af10091-6a1f-0d13-944f-7f7833837e1e@amd.com>
 <87sfsurh88.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfsurh88.fsf@intel.com>
Subject: Re: [igt-dev] [RFC i-g-t 1/1] MAINTAINERS: Introduce MAINTAINERS
 file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Siqueira Jordao <rjordrigo@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 02:31:03PM +0200, Jani Nikula wrote:
> On Thu, 03 Feb 2022, Rodrigo Siqueira Jordao <rjordrigo@amd.com> wrote:
> > On 2022-02-03 6:03 a.m., Petri Latvala wrote:
> >> On Mon, Jan 31, 2022 at 09:28:18AM -0500, Rodrigo Siqueira wrote:
> >>> IGT is growing in terms of new vendors actively using it. Right now, we
> >>> only have Intel CI to validate new patches, which can create a situation
> >>> where bugs get accidentally introduced to other vendors. To alleviate
> >>> this problem and also making easy for other developers to be aware of
> >>> some specific changes, I'm proposing the introduction of the MAINTAINERS
> >>> file as the one used in the Linux kernel. With this approach, we can
> >>> have multiple enginers from different companies as reviewers for
> >>> specific tests, and contributors should use get_maintainers script to
> >>> find the right people to address their changes.
> >>>
> >>> Cc: Arkadiusz Hiler <arek@hiler.eu>
> >>> Cc: Petri Latvala <petri.latvala@intel.com>
> >>> Cc: Mark Yacoub <markyacoub@google.com>
> >>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> Cc: Melissa Wen <mwen@igalia.com>
> >>> Cc: Sean Paul <seanpaul@chromium.org>
> >>> Cc: Harry Wentland <harry.wentland@amd.com>
> >>> Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
> >>> Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
> >>> Cc: Wayne Lin <wayne.lin@amd.com>
> >>> Cc: Nicholas Choi <nicholas.choi@amd.com>
> >>> Cc: Martin Peres <martin.peres@mupuf.org>
> >>> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> >>> Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> >>> Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
> >>> Cc: Solomon Chiu <solomon.chiu@amd.com>
> >>> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> >> 
> >> 
> >> A tentative ack on this effort from me, for getting more contact
> >> points formally documented.
> >> 
> >> As for the implementation of it, I know this is copied from the kernel
> >> so I know the reason why they're there, but reduce the useless
> >> complexity in the documentation comment like the type of version
> >> control in a subtree, and things that just aren't true for IGT, like
> >> asking for testing from 4 or 5 people.
> >
> > Hi Petri,
> >
> > Thanks for your feedback. I just copy-paste most parts of this kernel 
> > MAINTAINERs file since this is just a prototype. I will prepare the 
> > first version of this patch and submit it again; in this new version, I 
> > will drop some part of the documentation which does not make sense for IGT.
> 
> FWIW, if I were to do this, I'd do it in yaml and implement it in
> python+strictyaml with a schema. No need to import a monster perl parser
> from kernel or implement our own.

I really like this suggestion. The perl script from kernel is
completely overkill for IGT purposes where it would be mostly (or
100%) used to collect Cc fields to patches for people volunteering for
doing review.


-- 
Petri Latvala
