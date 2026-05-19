Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171B9CD4F5B
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 13:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69410E45F;
	Tue, 19 May 2026 13:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diWJ3uDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110C310ECD9
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779195794; x=1810731794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fYwGOMGVeoB616Dc88g9DqsLYMCIQjQtwgSCAXihsqo=;
 b=diWJ3uDR13MdijCEL6wPjNNLvKVB7+HbMHdFstXwgMYFMwlWHtFBiKm+
 5BH37MXa6aGmCA7VafiyxY+uaH1yMCN7tZU18Eo3BTtLPiOzxX4qAls1f
 rIKBv7uavQnmrr7cocW7oythiGA4Xl6ES4S/l1kBQEfzsLv1+8etBYYXi
 ZA82eJ1xHUx/wXEE8euQkDlm2XjnpmT4/H6y4q8mvpm1QhPStsJoTlNcx
 rhsIX0FYk7mTnexo4EXqiz3LWwYFBgdv9oHa6yPz5zY5SsPXO/RrkOzzL
 WwuYl+QQHWtrvYjtfimhGErgf09HivV0Sf5J8+ByQNf+NyfRBJ4ubbcoM Q==;
X-CSE-ConnectionGUID: 93+Wh7waS+2Opp8GmjBH5w==
X-CSE-MsgGUID: LDChI8HOTiiOLzUG1L/WUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90373786"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="90373786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 06:03:13 -0700
X-CSE-ConnectionGUID: VMYAEsohQ9G7PTEBVKMQRA==
X-CSE-MsgGUID: tVclojkkRoalucRa2eRPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239822699"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:03:09 -0700
Date: Tue, 19 May 2026 15:03:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_crc: Use SUSPEND_TEST_DEVICES
 for MediaTek devices
Message-ID: <20260519130307.vusthdymwz5u2odk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <20260515072934.495031-3-jason-jh.lin@mediatek.com>
 <20260515104933.ym4jqrtdtb3ice4s@kamilkon-DESK.igk.intel.com>
 <6da78c43-3469-4272-be93-5cbb76c1fe02@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6da78c43-3469-4272-be93-5cbb76c1fe02@intel.com>
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

Hi Sharma,,
On 2026-05-18 at 16:23:38 +0530, Sharma, Swati2 wrote:
> Hi Jason,
> 
> Patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 

Thank you all, merged.

Regards,
Kamil

> On 15-05-2026 04:19 pm, Kamil Konieczny wrote:
> > Hi Jason-JH,
> > On 2026-05-15 at 15:28:40 +0800, Jason-JH Lin wrote:
> > > Use SUSPEND_TEST_DEVICES instead of SUSPEND_TEST_NONE for MediaTek
> > > devices since rtcwake is not supported.
> > > 
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > LGTM
> > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Regards,
> > Kamil
> > 

> > > ---
> > >   tests/kms_cursor_crc.c | 12 +++++++++---
> > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > > index 1249171dec56..5a6cc7717425 100644
> > > --- a/tests/kms_cursor_crc.c
> > > +++ b/tests/kms_cursor_crc.c
> > > @@ -322,9 +322,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
> > >   							DRM_MODE_DPMS_ON);
> > >   			}
> > > -			if (data->flags & TEST_SUSPEND)
> > > -				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > -							      SUSPEND_TEST_NONE);
> > > +			if (data->flags & TEST_SUSPEND) {
> > > +				enum igt_suspend_test test = SUSPEND_TEST_NONE;
> > > +
> > > +				/* rtcwake cmd is not supported on MTK devices */
> > > +				if (is_mtk_device(data->drm_fd))
> > > +					test = SUSPEND_TEST_DEVICES;
> > > +
> > > +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, test);
> > > +			}
> > >   			igt_pipe_crc_start(pipe_crc);
> > >   			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
> > > -- 
> > > 2.43.0
> > > 
