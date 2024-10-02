Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA960CF6D2C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 14:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960CD10E767;
	Wed,  2 Oct 2024 14:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ1N6jAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B4A10E766
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727878470; x=1759414470;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l2A/dJ4zEbacDYdookMrUesD6n/PdLj3lq92QIpNlc8=;
 b=IQ1N6jArTu0FDmhN2lNMwUrluBcu+Ny5S4dXnBzGluV8B8F4vo2lO7Zc
 r/QykVN14/zvAncVW6OfixKiKfadKHeyhUH3siSTyYG3JKfChhXgno0Gs
 sR7ZS4ohUuc9W1gYEAGu6q+VknFb7j/vBxBMt+/WDYWgpWPmUitSCHzzy
 d3vu1ARWBRTkJBrJw4YEQyaqcrm2DJpIO0TuCtYJgR51/dQ0ofXtGSWf1
 6nGrS6wKbYlJxX9Uk+tkJZW/rCSrEllii98iw8l1yTJGdoG7d9X7LsEoE
 881VOO9Omte/dub8rFkGhObUEceT8zALwVCTHCvqUT6UWP4+DwHKrCSvw g==;
X-CSE-ConnectionGUID: iYROeoOdRMSxUQPcDp40rA==
X-CSE-MsgGUID: Y0S3k5bxSLGDF8OJZaMwaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26548098"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="26548098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:14:29 -0700
X-CSE-ConnectionGUID: uRZRW+zVSraY0d0rbuqsrA==
X-CSE-MsgGUID: Lal+ECvyQZW/kDMApbz2BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74035916"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:14:28 -0700
Date: Wed, 2 Oct 2024 16:14:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] include/drm-uapi: Update uapi headers
Message-ID: <20241002141403.5udwzdenyyij3xqa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240925192354.22814-1-ville.syrjala@linux.intel.com>
 <20241002101535.g7diqamdyfzfe44b@kamilkon-DESK.igk.intel.com>
 <Zv0eebOxYgj2iYca@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv0eebOxYgj2iYca@intel.com>
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

Hi Ville,
On 2024-10-02 at 13:20:41 +0300, Ville Syrjälä wrote:
> On Wed, Oct 02, 2024 at 12:15:35PM +0200, Kamil Konieczny wrote:
> > Hi Ville,
> > On 2024-09-25 at 22:23:54 +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > Sync uapi headers with drm-next commit d7126c0cfc13
> > > ("Merge tag 'drm-xe-next-fixes-2024-09-19' of
> > > https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
> > > 
> > > Note that headers for old dri1 drivers are now gone,
> > > and we gain a bunch of new headers for various
> > > new drivers (gpu and accel).
> > > 
> > > I manually intervened on the deletion of
> > > include/drm-uapi/xe_drm_eudebug.h because it's some
> > > non-upstream thing. IMO that sort of stuff really
> > > should live in a completely different place...
> > 
> > With this paragraph removed this is
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks.
> 

Ok, merged.

> > 
> > PS. could you add such notes in cover letter? It will ease
> > merging later. Or if you think we should remind devs about this
> > it could find a way in README.
> 
> There was no cover letter since this was just a single patch.
> So not sure what you're asking me here?

I was thinking about documenting this for future but maybe
I am overthinking this. No need for any action.

Regards,
Kamil

> 
> -- 
> Ville Syrjälä
> Intel
