Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78516E6BF04
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 12:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053C810E29E;
	Fri, 30 Jan 2026 12:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZI8wsKZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942F10E29E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769774629; x=1801310629;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=P/Ll0lJsuIjd/KznpGOF2UH+LedGifHtFiz8CxosisM=;
 b=CZI8wsKZr0xkVXbG5B2Jlqe0EyFnp3h5Td76S2GdZA9Jk6Y1CclpZdLR
 UJlpsffXvWxbviwdHf8pImTETLaGMx6EeIafRa3F02RAPmgyfPfJxR4AF
 7fDCCQU/8fc0xilQSBR1FiqZdRklHJGuOcXAItCmFARIukDxdTN36Paem
 ePjBXO+PLE+rkEaSUZlG3mKotNeAmP+Pgce1M0KN815tWlPxjajfEhCE5
 Pz/NM2+3xylCFzEYlkx/Vz8LOk3HhAoucI9oC1lrr7XkfyBYQDgmVOkTO
 M/eC3no2lz1ibzbIU4V53zowT3lM+BGxQkdkt+cIXobvUDUJ3ZAVE6FTD g==;
X-CSE-ConnectionGUID: r4DaIjofQiGRqhW7h2EOdA==
X-CSE-MsgGUID: Pg1CkC6xR5iTTCsNemAl+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70042416"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70042416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 04:03:48 -0800
X-CSE-ConnectionGUID: vzQGBpa7Tuaq3YPp3YnAag==
X-CSE-MsgGUID: 051rb9TkQBiz6X85Oeh7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="213331250"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 04:03:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/15] tests/kms_plane_scaling: Use for_each_crtc*()
In-Reply-To: <20260130105237.14481-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-4-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 14:03:44 +0200
Message-ID: <314873efb38adab1e960e4444c2dc258764e1172@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> -				for_each_pipe(&data.display, pipe) {
> -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +				for_each_crtc(&data.display, crtc) {
> +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {

First, a higher level meta comment here. I'm having mild second thoughts
about igt_crtc_name() returning kmstest_pipe_name().

What if, in the future, we want to use CRTC name? And make that
different from the pipe name? If we percolate igt_crtc_name() all over
the place, the switch is going to be difficult. (Mostly because it's
being used in test names.)

Should we have igt_crtc_name() return something based on the CRTC index
instead? And have, say, igt_crtc_pipe_name() return kmstest_pipe_name(),
and use that in these conversions?

Or, more generally, maybe igt_crtc_name() should be the vendor neutral
DRM KMS name, and, say, igt_crtc_vendor_name() should return something
that's specific to the vendor. For Intel, it would be pipe, since that's
mostly Intel specific thing. For others, it might be something else.

Or am I overcomplicating, and we should just cross that bridge when we
come to it?


BR,
Jani.


-- 
Jani Nikula, Intel
