Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CDEC5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 11:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE0310E1F6;
	Fri, 21 Aug 2026 11:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoimvwnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C9910E1F6
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787310543; x=1818846543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Am+KQEBvic8yiFUGi9D7zzt0LGvL2+IhVy1dhY9YH84=;
 b=XoimvwnMPQa/Vy/oN/Uuys/dOR4BF+K1NfyQ1LZrbKPRVWcOruu5crrb
 BckpbpD9UxH8IxJXKSy/L/2seNYkgQ6Ri+Wp9Jqhi6jq+R0IFNJ2ii+BS
 eKLcS1t/Ny4EjJZesC2fvpC8Y8DIpCiwStxym4BltitxQMXxVeGo/KPdZ
 GxU6pv++qBNCOsPMt4F5EsIzLRinUUDttPSVCC+ezyUOuECLY/19M34uG
 gTrrPDMAx0TRjCKJgix8oy7Y7emPVs1d9ii0xIR9qvPc7Bq2+2jC6Xxgk
 SuclbYF8+Q1rvb97suaO85HBhy8F1Sdm/LSNk/RvrTP2JoAs8WM+wbaoe A==;
X-CSE-ConnectionGUID: 8UbSBfb3T1KTOZvBy7X3WA==
X-CSE-MsgGUID: bcntCbi6TWeDFETNKdm9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="105393979"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="105393979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:09:02 -0700
X-CSE-ConnectionGUID: 89kuUqTwSLKfRRXh/ad/RQ==
X-CSE-MsgGUID: WZSXekPNR1OxPwzzv/4uvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="260144247"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 04:09:01 -0700
Date: Fri, 21 Aug 2026 13:08:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] lib/igt_kms: Do not treat writeback and virtual
 connectors as connected
Message-ID: <20260821110859.miju26cidiuuedad@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "S, Sowmiya" <sowmiya.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260819190740.1392859-1-markyacoub@google.com>
 <PH7PR11MB679695C574AE7A367078CF48E5A32@PH7PR11MB6796.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <PH7PR11MB679695C574AE7A367078CF48E5A32@PH7PR11MB6796.namprd11.prod.outlook.com>
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

Hi S,,
On 2026-08-21 at 03:53:30 +0000, S, Sowmiya wrote:
> Hi @Mark Yacoub
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mark
> > Yacoub
> > Sent: 20 August 2026 00:38
> > To: igt-dev@lists.freedesktop.org
> > Cc: Mark Yacoub <markyacoub@google.com>
> > Subject: [PATCH] lib/igt_kms: Do not treat writeback and virtual connectors as
> > connected
> > 
> > Writeback and virtual connectors (e.g. DRM_MODE_CONNECTOR_WRITEBACK
> > and
> > DRM_MODE_CONNECTOR_VIRTUAL) do not represent physical display sinks
> > and cannot be modeset using standard CRTC / atomic commit operations
> > without configuring a writeback output framebuffer (WRITEBACK_FB_ID).
> > 
> > On drivers such as MSM, writeback connectors (e.g. Virtual-1, Virtual-2) report
> > connected status with virtual modes. When generic KMS tests iterate over
> > connected outputs via for_each_connected_output() or during initial display
> > setup in igt_display_init(), attempting standard modesets on these connectors
> > causes failures (-EINVAL) before test execution can begin.
> > 
> > Exclude DRM_MODE_CONNECTOR_WRITEBACK and
> > DRM_MODE_CONNECTOR_VIRTUAL in
> > igt_output_is_connected() so generic KMS tests only target standard physical
> > display outputs, while dedicated writeback tests can continue to iterate all
> > outputs explicitly via for_each_output().
> > 
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  lib/igt_kms.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 521a03c01..8d4d14847 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -668,6 +668,10 @@ static inline bool
> > igt_output_is_connected(igt_output_t *output)
> >  	    !output->config.connector->count_modes)
> >  		return false;
> > 
> > +	if (output->config.connector->connector_type ==
> > DRM_MODE_CONNECTOR_WRITEBACK ||
> > +	    output->config.connector->connector_type ==
> > DRM_MODE_CONNECTOR_VIRTUAL)
> > +		return false;
> > +
> writeback tests already bypass igt_output_is_connected() by
> design and continue to work via for_each_output(), while
> generic tests correctly stop trying to modeset
> writeback/virtual connectors.
> LGTM,
> Reviewed-by: Sowmiya S <sowmiya.s@intel.com>

Applied, thank you all.

Regards,
Kamil

> 
> >  	if (output->config.connector->connection ==
> > DRM_MODE_CONNECTED)
> >  		return true;
> > 
> > --
> > 2.55.0.737.g08866a6d13-goog
> 
