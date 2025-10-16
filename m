Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D105ECCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 14:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806D310E304;
	Thu, 16 Oct 2025 14:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k51Tymqi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A1B10E304
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760625927; x=1792161927;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+p/3lCEn+VySGLgyhibnfr+isAANQSHwhscoZ1pLSnQ=;
 b=k51Tymqi2fJlKwWWicYaE0/D90htCDX2/gI1ZzXxZIYs6+1mUYWL/BIJ
 xtoQ6vDQT/vnCCAf7/T9uflN/2bwYTCp2h9zP+76RPkn5771pHKAqRkbw
 rulqtZBFalzQIEYtTshH9t5Vuoz2Z5uxpmuHVBLAq98lQs+dihTsIzq41
 QkLt7fHzWLOkFyTbTqn0mp37m3l8sO/Uj/EAB/YqOCd/x8JtQjKt9uxPl
 KwskQb7pidGFvvqbX98CXjn+1wJVznMvVFGxdI58TWbzsq6IY6jvHbguC
 3QAJLPZZpcHGkSlhFCgXAqAO3Xu3xB+Knk2DmDxE+saubY/SpeMISUTjy A==;
X-CSE-ConnectionGUID: srhxyg98T2GFRHsCxfOqpQ==
X-CSE-MsgGUID: qWF7Mo9uTcKT+uPr3pGqAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="85437974"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="85437974"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:45:27 -0700
X-CSE-ConnectionGUID: /kO85juLRliQNUxjswqryw==
X-CSE-MsgGUID: a69f0fKPQBGb8o795xJFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182444827"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 07:45:23 -0700
Date: Thu, 16 Oct 2025 16:45:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 0/6] Add MediaTek devices support
Message-ID: <20251016144521.vqihx7ewu3z4clki@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <1fe5cad9c4fe83c20cbc86135fab174d4055e0b4.camel@mediatek.com>
 <CAC0gqY46coQAzqDaRuBxhzAbLPH3Fn_yapb+RJ6pZf9ByAhrGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC0gqY46coQAzqDaRuBxhzAbLPH3Fn_yapb+RJ6pZf9ByAhrGQ@mail.gmail.com>
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

Hi Mark,
On 2025-10-16 at 09:50:14 -0400, Mark Yacoub wrote:
> Hello maintainers,
> These patches are needed by the MTK team to make IGT run on their platform.
> I will ask a team to google to do the reviews. But feel free to interject
> at any point if things don't look right to you.
> Thanks!

Thank you, I already looked into them and asked Karthik and Swati
for help. Also I did see Jani checked last patch so it should
proceed with a help from google team as I only acked few patches,
it would be nicer to have r-b.

Regards,
Kamil

+cc Karthik and Swati
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> 
> On Thu, Oct 16, 2025 at 12:11 AM Jason-JH Lin (林睿祥) <
> Jason-JH.Lin@mediatek.com> wrote:
> 
> > Hi Kamil, Juha-Pekka, Bhanuprakash,
> >
> > Could you please take a moment to review this series?
> > Your guidance will be very valuable. Thanks!
> >
> > Regards,
> > Jason-JH Lin
> >
> > On Mon, 2025-10-13 at 01:13 +0800, Jason-JH Lin wrote:
> > > This patch series is aimed at extending IGT GPU Tools support for
> > > MediaTek devices. The following changes are included:
> > >
> > > - Various test case improvements to allow execution on MediaTek SoCs
> > > - MediaTek-specific handling for debugfs, suspend tests, and pixel
> > > format
> > >   requirements
> > > - Improvements to EDID parsing and content protection logic for
> > > better
> > >   cross-platform compatibility
> > >
> > > Jason-JH Lin (6):
> > >   tests/kms_hdr: Use original 512x512 fb size on devices without
> > > scaler
> > >   tests/kms_plane: Add support for planar-settings on non-Intel
> > > devices
> > >   tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES for MediaTek
> > >     devices
> > >   lib/igt_kms: Add support for mtk_current_bpc debugfs in bpc-switch
> > >     test
> > >   tests/kms_content_protection: Add MediaTek device support
> > >   lib/igt_edid: Fix monitor name parsing and trim EDID string padding
> > >
> > >  lib/igt_edid.c                 | 13 ++++++++++---
> > >  lib/igt_kms.c                  |  2 ++
> > >  tests/kms_content_protection.c | 11 +++++++++++
> > >  tests/kms_hdr.c                |  6 +++++-
> > >  tests/kms_pipe_crc_basic.c     |  8 +++++++-
> > >  tests/kms_plane.c              |  8 +++++---
> > >  6 files changed, 40 insertions(+), 8 deletions(-)
> > >
> >
> >
> >
> > ************* MEDIATEK Confidentiality Notice
> >  ********************
> > The information contained in this e-mail message (including any
> > attachments) may be confidential, proprietary, privileged, or otherwise
> > exempt from disclosure under applicable laws. It is intended to be
> > conveyed only to the designated recipient(s). Any use, dissemination,
> > distribution, printing, retaining or copying of this e-mail (including its
> > attachments) by unintended recipient(s) is strictly prohibited and may
> > be unlawful. If you are not an intended recipient of this e-mail, or believe
> >
> > that you have received this e-mail in error, please notify the sender
> > immediately (by replying to this e-mail), delete any and all copies of
> > this e-mail (including any attachments) from your system, and do not
> > disclose the content of this e-mail to any other person. Thank you!
> >
> >
