Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC763CA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 14:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711AC10E607;
	Fri,  2 Oct 2026 14:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQPcFiRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A310E607
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 14:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790950666; x=1822486666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jmjT5DnwFsAct7nLEYrRne3QsqRrmUzEVKxr+Fw3ZoY=;
 b=cQPcFiRWwPM96OtfR6DZCspCtSCwgJEEq3d+hkIMR/3WPNFsEwCQ5NwM
 HvHlYqwBHY0yu6JFv+Xayt3Z40Ll65TZnNwVHh+RUWeM7uxyGp6zeeOL0
 x7O2kHbw0EuzaUOiTJ4jyzTmjNhJ9xaeEEy4G907O70Re3TbJciArxsvJ
 Ah8DfhvdNBbLqANpvuJNlu4e+/OI+IZhhDUnMtHPpqjg4G9OiqdNDJtrO
 BqGynEHQXmvUFbYuziIvfiEi00zl3PwlIy3MzIycCxFwWTMc27VikSLhX
 qsnFxrfH69q1VwssVNu/RE1s17yF3PjO2efkMtHLDEVoM/o6PR4QoesBV A==;
X-CSE-ConnectionGUID: xFC6LAPHTyGU+29MpL2OPA==
X-CSE-MsgGUID: GijJNUZATOeHZ6SB5OFwwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90746177"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90746177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 07:17:45 -0700
X-CSE-ConnectionGUID: BbQIQH9KQIaYTOsy+Y/Dfw==
X-CSE-MsgGUID: 1oUfzsd5QcqyP3OWpxtHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="304219370"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 07:17:44 -0700
Date: Fri, 2 Oct 2026 16:17:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 5/5] tests/msm_mapping: Keep parser buffers
 writable
Message-ID: <20261002141741.uodla26gc7t3ze4l@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-6-alex.hung@amd.com>
 <20260930135508.oughyhblhcvww7yj@kamilkon-DESK.igk.intel.com>
 <CACSVV02-m8CfeU3j8zwK_3zoQJaQJugyMMxHtgb4XqK-T5yCWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02-m8CfeU3j8zwK_3zoQJaQJugyMMxHtgb4XqK-T5yCWA@mail.gmail.com>
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

Hi Rob,
On 2026-09-30 at 07:32:46 -0700, Rob Clark wrote:
> On Wed, Sep 30, 2026 at 6:55 AM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Alex,
> > On 2026-09-29 at 11:49:50 -0400, Alex Hung wrote:
> > > With glibc 2.43, strstr() on const input returns a const pointer.
> > > Assigning that result to char * in endswith() discards const and
> > > causes a compiler warning.
> > >
> > > The following warning is observed on Ubuntu 26.04 (wrapped):
> > >
> > >   ../tests/msm/msm_mapping.c: In function 'endswith':
> > >   ../tests/msm/msm_mapping.c:128:19: warning:
> > >     initialization discards 'const' qualifier from pointer target type
> > >     [-Wdiscarded-qualifiers]
> > >
> > > Keep the get_line() return value, line pointer and endswith() input
> > > writable because endswith() modifies the buffer. This preserves
> > > mutable access through the parser without casting away const.
> > >
> > > Assisted-by: Copilot:GPT-6-Astra
> > > Signed-off-by: Alex Hung <alex.hung@amd.com>
> >
> > LGTM
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >
> > Also +cc Rob Clark <rob.clark@oss.qualcomm.com>
> 
> a-b
> 

Applied, thank you all.



Regards,
Kamil

> > Regards,
> > Kamil
> >
> > > ---
> > >  tests/msm/msm_mapping.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > > index 05960627c..52b494abf 100644
> > > --- a/tests/msm/msm_mapping.c
> > > +++ b/tests/msm/msm_mapping.c
> > > @@ -102,7 +102,7 @@ wait_for_stall_on_fault(int drm_fd)
> > >   * Helper to find named buffer address
> > >   */
> > >
> > > -static const char *
> > > +static char *
> > >  get_line(char **buf)
> > >  {
> > >       char *ret, *eol;
> > > @@ -123,7 +123,7 @@ get_line(char **buf)
> > >  }
> > >
> > >  static bool
> > > -endswith(const char *str, const char *end)
> > > +endswith(char *str, const char *end)
> > >  {
> > >       char *p = strstr(str, end);
> > >
> > > @@ -166,7 +166,7 @@ get_bo_addr(int drm_fd, const char *name)
> > >        */
> > >
> > >       while (*p) {
> > > -             const char *line = get_line(&p);
> > > +             char *line = get_line(&p);
> > >
> > >               if (endswith(line, name)) {
> > >                       uint64_t addr, dummy;
> > > --
> > > 2.53.0
> > >
