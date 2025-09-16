Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FD0CAC599
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 08:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A42610E6DF;
	Tue, 16 Sep 2025 08:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nS/IuLRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F03E10E6DF
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758013046; x=1789549046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W4bwTqoC02ZGqapFrRteoK82O02Wrn8BT1eX2TLvdaE=;
 b=nS/IuLRaanGKYTD1XpzVLctnzdnn/TfeFQiWDu9tKOSEKLnr60tTGVVx
 QCz4gIWdrD3/8RDuTA1QD5Xd82RtdI6yPI30J8lddRYLpK8axa89T6kWj
 EYlQbb0YzS4O+EZcTXXsHM987zDU7xnY0QsJSmgTgscXet/R4PnaRbd9F
 2h11vN7JbvkV/6xBIF5HsOz1DwKvKZ/umFVCwKIGrHrlcgvVPJKcgXeJt
 ONmM/zEslLKJoUOa3J7JK02nXbwb5Jw2421GuqoCY36rKJ/ifhvE7lKjx
 G4AZjBqZSb+CaqXlxx1Nx3N0OPom87dgyBMoaNwZbF7BC7UgeiZoE+4cy Q==;
X-CSE-ConnectionGUID: FWKld9EOTxynmf/rUGqnrw==
X-CSE-MsgGUID: DO423wR2T8S7ZMf/DiyDLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64092544"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64092544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:57:26 -0700
X-CSE-ConnectionGUID: KNY0Paw7T5Cm3a5iedvU4w==
X-CSE-MsgGUID: p/lK+1/PQTK+wbUuNzLO3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="198563436"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:57:24 -0700
Date: Tue, 16 Sep 2025 10:57:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/igt_psr: Skip the test when PSR is
 disabled
Message-ID: <20250916085707.fwnwgaq6u4i6ldvq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Grzelak, Michal" <michal.grzelak@intel.com>
References: <20250828104311.1279788-1-michal.grzelak@intel.com>
 <20250828104311.1279788-2-michal.grzelak@intel.com>
 <98f87611cc7586b5a6f5295e78c818f20df3205c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98f87611cc7586b5a6f5295e78c818f20df3205c.camel@intel.com>
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

Hi Hogander,,
On 2025-09-15 at 12:08:53 +0000, Hogander, Jouni wrote:
> On Thu, 2025-08-28 at 12:43 +0200, Michał Grzelak wrote:
> > If PSR setup timing is not met, then PSR will stay disabled and test
> > will fail anyway. Skip the test upon finding that setup timing was
> > not
> > met.
> > 
> > Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> 
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
> 

Thank you all, I merged it.

Regards,
Kamil

> > ---
> >  lib/igt_psr.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> > index 3d8f1949b..d5b4198c3 100644
> > --- a/lib/igt_psr.c
> > +++ b/lib/igt_psr.c
> > @@ -122,6 +122,8 @@ static bool psr_active_check(int debugfs_fd, enum
> > psr_mode mode, igt_output_t *o
> >  
> >  	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
> >  
> > +	igt_skip_on(strstr(buf, "PSR setup timing not met"));
> > +
> >  	active = strstr(buf, state) ||
> >  		 (c && (c->connector_type ==
> > DRM_MODE_CONNECTOR_DisplayPort) &&
> >  		  strstr(buf, "SU_STANDBY"));
> 
