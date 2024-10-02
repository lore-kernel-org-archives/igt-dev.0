Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1327CF31AE
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 10:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B4010E6EF;
	Wed,  2 Oct 2024 10:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L69Vfb1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F226010E083
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727864446; x=1759400446;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=7Y6n0NPiZEUhH9DFzHAmmRYnjjgK2FI5Ekb9yv7hHzs=;
 b=L69Vfb1UTudNJCMbwdBeTq446df0lsq/ev87K7vzkRuP/DPPqWuLqcGT
 iGbxX4S+bsrxv2iNuo8jYZ1AlWFhTsFjXhYZL0OLgi39/x0qg5M4SEQGh
 Z4JQFqSAfD4cDEuhv6gZW8Wpk+VM0LeaXkGhLw/BwMFwd5GJKLFvj/kSA
 gDwkcpMdbLqFwDe7CI3ob9JRaRIVZxK06B15mFitOOuKMqOzyRCJx5d76
 5AHstLclSgFi200XEX2oH8BhF/QcD3LYdZDt6HWZ95QGbWz3NsUa0W5Wk
 wVZqPOGbmd86vLZMFp/CIjlNn3wo4LuW1QMVnn8OhRRqBWH+MhfwuqGt7 A==;
X-CSE-ConnectionGUID: 7Yur4npyTtywFeMYAdNMjw==
X-CSE-MsgGUID: Lp+PX3o9RlmFA6T7NzH8SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49544684"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="49544684"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:20:45 -0700
X-CSE-ConnectionGUID: aJa9lPGbTW6uoXRxwUC4Mw==
X-CSE-MsgGUID: qVzRNksfRhGyp0t9vZOq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74071423"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 03:20:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 13:20:41 +0300
Date: Wed, 2 Oct 2024 13:20:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] include/drm-uapi: Update uapi headers
Message-ID: <Zv0eebOxYgj2iYca@intel.com>
References: <20240925192354.22814-1-ville.syrjala@linux.intel.com>
 <20241002101535.g7diqamdyfzfe44b@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002101535.g7diqamdyfzfe44b@kamilkon-DESK.igk.intel.com>
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

On Wed, Oct 02, 2024 at 12:15:35PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-09-25 at 22:23:54 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Sync uapi headers with drm-next commit d7126c0cfc13
> > ("Merge tag 'drm-xe-next-fixes-2024-09-19' of
> > https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
> > 
> > Note that headers for old dri1 drivers are now gone,
> > and we gain a bunch of new headers for various
> > new drivers (gpu and accel).
> > 
> > I manually intervened on the deletion of
> > include/drm-uapi/xe_drm_eudebug.h because it's some
> > non-upstream thing. IMO that sort of stuff really
> > should live in a completely different place...
> 
> With this paragraph removed this is
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks.

> 
> PS. could you add such notes in cover letter? It will ease
> merging later. Or if you think we should remind devs about this
> it could find a way in README.

There was no cover letter since this was just a single patch.
So not sure what you're asking me here?

-- 
Ville Syrjälä
Intel
