Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDC0E6BF20
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 15:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8113B10EA16;
	Fri, 30 Jan 2026 15:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwyL5Ty3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C29B10EA10
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 15:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769787684; x=1801323684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I7MZWmKnXvZMWBci02jHZFHaUq6SHdGsNNRYItaM2N0=;
 b=dwyL5Ty37KWgpVR/qt3rrXQUK7LBrwYnRahMml17S859M/v5ZLVqjl2V
 ONthlCDhv0AutZwQtqncK22baDo+CbrKMohxN1HUUsGpY+E9VkI3TQlE3
 FpjZK+YQirBkEFRujwTfs+qVU6aZPdCi/ecfAkpRlnDjykESrLshStCxo
 +fErB7idID86Je7AbzvSUwrrPMUOjDKOxtcJ/t+4HUknFUezteLZwYLgC
 uqRA7nECOTMPujqLEQn1vwLjH3Z54gttE7NcXidUZQYH2T1mOGXhWS2sI
 Excs4RhITL4r5CYnOFEkCExUKLqe/XTQUHE+gSexkqsGHizR+na0pY/Wf Q==;
X-CSE-ConnectionGUID: Dod2dzc3QSqeexOOXMDONQ==
X-CSE-MsgGUID: oyq0c+VeRBy5bfgsxcQpTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81354358"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81354358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:41:24 -0800
X-CSE-ConnectionGUID: XHa+thDFRymOOX0BMtgaeg==
X-CSE-MsgGUID: wDI5gwmHQmexZcX4rdiJnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209130299"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:41:22 -0800
Date: Fri, 30 Jan 2026 17:41:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/15] tests/kms_plane_scaling: Use for_each_crtc*()
Message-ID: <aXzRH9_0UsrK16Sb@intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-4-ville.syrjala@linux.intel.com>
 <314873efb38adab1e960e4444c2dc258764e1172@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <314873efb38adab1e960e4444c2dc258764e1172@intel.com>
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

On Fri, Jan 30, 2026 at 02:03:44PM +0200, Jani Nikula wrote:
> On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > -				for_each_pipe(&data.display, pipe) {
> > -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
> > -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
> > +				for_each_crtc(&data.display, crtc) {
> > +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> 
> First, a higher level meta comment here. I'm having mild second thoughts
> about igt_crtc_name() returning kmstest_pipe_name().
> 
> What if, in the future, we want to use CRTC name? And make that
> different from the pipe name? If we percolate igt_crtc_name() all over
> the place, the switch is going to be difficult. (Mostly because it's
> being used in test names.)
> 
> Should we have igt_crtc_name() return something based on the CRTC index
> instead? And have, say, igt_crtc_pipe_name() return kmstest_pipe_name(),
> and use that in these conversions?
> 
> Or, more generally, maybe igt_crtc_name() should be the vendor neutral
> DRM KMS name, and, say, igt_crtc_vendor_name() should return something
> that's specific to the vendor. For Intel, it would be pipe, since that's
> mostly Intel specific thing. For others, it might be something else.
> 
> Or am I overcomplicating, and we should just cross that bridge when we
> come to it?

Shrug. I suppose for now igt_crtc_name() is always the pipe name,
so if at some point want to start using some other naming scheme
we could start that off with a global
s/igt_crtc_name()/igt_crtc_pipe_name()/ or whatever. So doesn't
really seem to matter what we call it for now. But I can rename
it now as well, if you think it's a good idea.

-- 
Ville Syrjälä
Intel
