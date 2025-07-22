Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA7FC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 11:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DB510E65E;
	Tue, 22 Jul 2025 11:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjN3lUoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382B210E65E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753184474; x=1784720474;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=shR4hQ8b8NAGgTT91szTIl9RriSdmxvI2KpX/Dui9p0=;
 b=CjN3lUoyvodfgtWv1ULKWK90ojC4xE5oTnmGwTWYB1xZPmMqisx57KgS
 x9sQxWtJ++Yg9wVZkohEPYse27u5h8e8mN20+mz3Zm4L75d4gez2xRkOt
 QUG5Amyss9ToT8IfB+ovIxiB6b+e/vS0sfWNG0JPPLjjTZc+hU5Y5vLqP
 Z/XkWDxnNuacmMTBhcso3d3XxC8j+ylOogkHcb1XHGx+obSttjA3Kf9Xw
 wB16sMT7OpWz2svGIr2TinbX7vdeIOdyUgMKMOhtj2ltBJQ15dvd05saX
 J3ZF8WEI6SlaSrNtdYGlyYlUvmUHLFUiUcXk9OIV5B1EGWH1NYAMeZP3F Q==;
X-CSE-ConnectionGUID: XeI25Z0xRGGgFlKdFvIgVA==
X-CSE-MsgGUID: NzHvtmXlQwK9Hc+Qrq5OpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59227814"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="59227814"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 04:41:14 -0700
X-CSE-ConnectionGUID: nf+iOoBkSaOeX0t8eZbeVQ==
X-CSE-MsgGUID: EspuHxPhT1mREzdtk99gfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163364075"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 04:41:12 -0700
Date: Tue, 22 Jul 2025 13:41:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm: Introduce i2c subtests
Message-ID: <20250722114109.lu2ra2mtwqxdpuj7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <aH4YMMLcvuiRS2l9@kuha.fi.intel.com>
 <aH8OHZquwBBvODfQ@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aH8OHZquwBBvODfQ@black.fi.intel.com>
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

Hi Raag,
On 2025-07-22 at 07:05:49 +0300, Raag Jadav wrote:
> On Mon, Jul 21, 2025 at 01:36:32PM +0300, Heikki Krogerus wrote:
> > On Sat, Jul 19, 2025 at 10:01:01PM +0530, Raag Jadav wrote:
> > > Introduce subtests for i2c adapter which is used to control on-board
> > > OEM sensors on selected devices. This will test D3hot/D3cold transition
> > > after i2c adapter access for the devices that support it.
> > > 
> > > v2: Define macros for AMC constants (Lucas)
> > >     s/index/adapter (Lucas)
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Looks good to me. FWIW:
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks Heikki.
> 
> The BAT failures seems unrelated to the patch. So anything I can do to
> move this forward?

Please reply to CI failure report with Cc given in report:
I915-ci-infra@lists.freedesktop.org

Also cut your replay just after 'Known issues' to keep it small,
unless you want to comment on other reported ones.

Regards,
Kamil

PS. Heikki please subscribe to IGT mailing list if you want
to contribute or review, so your mails will reach IGT ML.
If not subscried, your mails will have to wait for acceptance.

> 
> Raag
> 
> > > ---
> > >  tests/intel/xe_pm.c | 98 +++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 98 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > > index 16b5fc686..ca935d518 100644
[cut]

