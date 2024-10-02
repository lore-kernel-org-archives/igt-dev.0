Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D99CF31AE
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 10:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056910E6EB;
	Wed,  2 Oct 2024 10:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+aBaC7d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB71A10E6EB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727863387; x=1759399387;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=/osrzu9vvoqOB+QuVtxupzD/ws+HKMShkpOpvZUIJv0=;
 b=L+aBaC7d2w0zmUXFiy9U3CCHfItB7pOWASbtVfLQRTWhEzv49kmYkx+B
 oVQpxZuRuCARfJJLTiNzTbWudOfN/fLMW/50C9jePb6yB8TTJP8d+ag59
 Z4otsul+wyy/pEWWfYeswAoamcw0LFBm/hAGQR2DazmF5uGt3uz1p3oBH
 GWU9xB2UVlg4SpZXLR2IL4EpuE33kcqbvFmk+9BDj7hZ7o4EX7Mk/BpW0
 Ft2JO5+q7Xjd65KABEtxYRlN0CcHQjlK4z9Tf7TyVthbZlbjRRgJ3w5+j
 p6AEAKKSNEiD7Z0+J3ouyM9I1PHaS1orsRqXmxE5Kuu2racG+RPJ34IYk w==;
X-CSE-ConnectionGUID: FHz9E+BuQSOUjF2ozn6yXQ==
X-CSE-MsgGUID: Geore94pTgOesf9BnVNeRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30906550"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30906550"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:03:06 -0700
X-CSE-ConnectionGUID: hylst90GSmuP3pSaselruw==
X-CSE-MsgGUID: I6qcOUqLTX6Q1Dqc+Ym1EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74068175"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 03:03:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 13:03:03 +0300
Date: Wed, 2 Oct 2024 13:03:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] include/drm-uapi: Update uapi headers
Message-ID: <Zv0aV6gKOmrJFaRj@intel.com>
References: <20240925192354.22814-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240925192354.22814-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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

On Wed, Sep 25, 2024 at 10:23:54PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Sync uapi headers with drm-next commit d7126c0cfc13
> ("Merge tag 'drm-xe-next-fixes-2024-09-19' of
> https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
> 
> Note that headers for old dri1 drivers are now gone,
> and we gain a bunch of new headers for various
> new drivers (gpu and accel).
> 
> I manually intervened on the deletion of
> include/drm-uapi/xe_drm_eudebug.h because it's some
> non-upstream thing. IMO that sort of stuff really
> should live in a completely different place...
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Ping. Can someone toss me an ack/rb?

I'd like to finally merge the plane SIZE_HINT uapi tests but
I need the new headers for that...

-- 
Ville Syrjälä
Intel
