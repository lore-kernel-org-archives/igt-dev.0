Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E7DC10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 10:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAB9112F52;
	Mon,  6 May 2024 10:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILVS1FGM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2A1112F51
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 10:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714990512; x=1746526512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N6fHgU8JOznQaF2rnTmiG4LMSOvUTU68xGF81o0lEZs=;
 b=ILVS1FGMSEfzeFLjb1nDMq1yXOCl04FYqVPvvlQPn3BHMCKzdMCd7vxQ
 dSvuqVaTvMz8wpwe+fvvr9/uqdV52mlrlvduDP9T6Xh6tb43hXMGK5mZ4
 Y0RmN61Cbh8ZdCDBUSxqWs2LzrHfa5d8MwtP4SH88RTld/nBUBw6+AxtL
 okFJoSPc/PN+QJklcLznEhc6vhs01EUZZJvRRxTpIddP7vEnWMkXqwgym
 NIi20JTzf1dgymf/AFKh5Vet+juFT1/+q+lJk2gAAsV3KZ4SyLIV6MOEp
 KK3SQ1Ur91BsC6GgLwVEk0xXbLZbxSow5Y82UvS7kNayWciH6ia3E5feG A==;
X-CSE-ConnectionGUID: lVS02ekiT8SnXn2PZEUxPg==
X-CSE-MsgGUID: PHqrps+RSe+IPzxmM0ZmXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="28254710"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28254710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 03:15:12 -0700
X-CSE-ConnectionGUID: LJXRF21sQ3eHaNlvdvZ9yQ==
X-CSE-MsgGUID: mEC6OoQsRgiO8GqPbtJ8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28083316"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 03:15:10 -0700
Date: Mon, 6 May 2024 13:15:01 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org, Thasleem@freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Skip the
 negative test on MST Hub
Message-ID: <ZjitpUBOPPn7QMrv@intel.com>
References: <20230707153720.1478-1-mohammed.thasleem@intel.com>
 <ZN8vfGObzmdK5EKb@intel.com>
 <c15749c4-03f2-dffe-3c0a-6a3458863ddd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c15749c4-03f2-dffe-3c0a-6a3458863ddd@intel.com>
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

On Wed, Aug 23, 2023 at 12:07:52PM +0530, Modem, Bhanuprakash wrote:
> 
> 
> On Fri-18-08-2023 02:14 pm, Lisovskiy, Stanislav wrote:
> > On Fri, Jul 07, 2023 at 09:07:20PM +0530, Thasleem, Mohammed wrote:
> > > Skip the test on which MST hub which support bandwidth for 2k-4k
> > > and 4k-4k multi displays.
> > > 
> > > Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> > 
> > Okay I missed the MST check in the begining of the main function, so
> > 
> > Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > 
> > > ---
> > >   tests/kms_display_modes.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> > > index 4bebb25e..8e117695 100644
> > > --- a/tests/kms_display_modes.c
> > > +++ b/tests/kms_display_modes.c
> > > @@ -310,6 +310,7 @@ static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
> > >   	igt_require(i915_pipe_output_combo_valid(display));
> > >   	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> > > +	igt_skip_on_f(ret == 0, "MST Hub supports bandwidth on multi display\n");
> 
> NACK
> 
> Failure reason can be anything, you need to check for the precise error
> code.

From my point of view, nack is for another reason: we can't skip the negative test case,
if it just happens to potentially pass.
Scenarios where it might pass and we dont consider that as a problem should
be filtered out by using some other checks to distinguish those scenarios more
explicitly.
Otherwise here we will get the situation that this negative test case always succeeds,
because we skip it always whenever it doesn't.

Stan

> 
> - Bhanu
> 
> > >   	igt_assert(ret != 0 && errno == ENOSPC);
> > >   }
> > > -- 
> > > 2.34.1
> > > 
