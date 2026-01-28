Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350E4D3F098
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210310E1D6;
	Wed, 28 Jan 2026 16:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRYWSMmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913210E1D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769619170; x=1801155170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o9IN32c38Q5U+YqUK1R5ewYElmvoBSWxuLz4TZtaqno=;
 b=KRYWSMmf223BRJ0w0YgJzF2P8kYdpHXowM2FdDnXjH1KiWN10/jK5iKl
 VEouLp2/GYwTU1ql77jAiZsnli2+WVSYOnTS9DCW+Q7LG3AquNdS/fXy1
 /6pq5xoBSClxDHnPA3Hx96ofnpq5PHf/DnxNVCOGKZMfvZvdOerdMUC+E
 +oiZdbLUqd8a6/mCFRs3T/dbxVI2QyGPk6O/7ENu2mIUW9Js4Rjd4ECWn
 d+GGkgFALe8rZv7UWhEJWRGuM5sXwuZi7cMJ8v1phpzs5sOX0kxXr6pOC
 45MVeC1z8LF3Iv2hdERP+s8zrTaOKTfz5miQvflHlkwfnpDcggIi7rI2n Q==;
X-CSE-ConnectionGUID: bFqI70n+TzqfzHwmH5w/ew==
X-CSE-MsgGUID: RBWVBTaUQfa7n6eD2EG/DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74688857"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="74688857"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:52:50 -0800
X-CSE-ConnectionGUID: 1zcUpi9TThe6nJnvKg113Q==
X-CSE-MsgGUID: 1yPL99zaTBC0GnfE6qK1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231267001"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:52:48 -0800
Date: Wed, 28 Jan 2026 18:52:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] lib/igt_kms: pipe vs CRTC index cleanups
Message-ID: <aXo-3HMDhUlUoCcR@intel.com>
References: <cover.1769514879.git.jani.nikula@intel.com>
 <aXon4Dk6azuIFd4w@intel.com>
 <d6530c2859f5e77f84be1e69aa48625a036a0c76@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6530c2859f5e77f84be1e69aa48625a036a0c76@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jan 28, 2026 at 06:47:13PM +0200, Jani Nikula wrote:
> On Wed, 28 Jan 2026, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Jan 27, 2026 at 01:55:57PM +0200, Jani Nikula wrote:
> >> Jani Nikula (8):
> >>   lib/igt_kms: Drop the ioctl fallback for CRTC id to pipe mapping
> >>   lib/igt_kms: Remove kmstest_pipe_to_index()
> >>   tests/kms_setmode: drop redundant drmModeGetCrtc() call
> >>   tests/kms_setmode: use CRTC index instead of pipe for
> >>     intel_drrs_disable()
> >>   tests/kms_setmode: use __intel_get_pipe_from_crtc_index() directly
> >>   lib/igt_kms: Always return CRTC index from
> >>     kmstest_get_pipe_from_crtc_id()
> >>   lib/igt_debugfs: rename igt_debugfs_pipe_dir() to
> >>     igt_debugfs_crtc_dir()
> >>   lib/i915/drrs: switch the interface from pipe to CRTC index
> >
> > Series is
> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Thanks, all pushed to master, the CI issues seem unrelated.
> 
> Do you have more cocci changes in the, uh, pipeline?

Yeah, The next set tries to convert the for_each_pipe*()
stuff to crtcs. Just doing some (hopefully) final tweaks
to catch a few more stragglers...

-- 
Ville Syrjälä
Intel
