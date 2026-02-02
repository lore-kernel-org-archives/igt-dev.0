Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED684E73159
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 11:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E56610E439;
	Mon,  2 Feb 2026 11:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3EIaQc/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A734910E439
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770030286; x=1801566286;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MvVReEL1mVYs9hBnRHmst87EV36FQtRkgCA3mJFH6Uo=;
 b=P3EIaQc/SpZJOS22RcU5tLbJ+LekePJkJj6JcqUnTqEsh57YZnMsU5Gt
 TycPoB4PnXqTk5ASBgHZipZFgohtwhEMpdnlUotl26Wg6wTy0ezv56QQ5
 gvBDmDe8ZhqUSWA6XnShZfkGxukDPxNNBZZCxeb17nALpKCMnoPr1gue9
 9i9zpG+z8gf8OxrviR4ru7eHP4fVSYbw7gFqxsHo91qzk70rgwbZGm95H
 fOLfes4qNNvDyxoqgdDFYhV/v+/xUHYLd7zn+cTDBR7KkYHROQykzcUan
 GhSTIiLhNBm7R+Bo/Os+5hjrDMwyMwNntRwkDY8S+VreCBfSzV/PvTPpU g==;
X-CSE-ConnectionGUID: B+gXlQcPRhavyfG92xKgEA==
X-CSE-MsgGUID: tDCP2FRpSDCbL8MjINieFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71082791"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71082791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:04:45 -0800
X-CSE-ConnectionGUID: fMyCe3xYRdyZhIdR1LOgMQ==
X-CSE-MsgGUID: TOFLZY1KRIKYL0JD35+G4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209769152"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:04:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/15] tests/kms_plane_scaling: Use for_each_crtc*()
In-Reply-To: <aXzRH9_0UsrK16Sb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-4-ville.syrjala@linux.intel.com>
 <314873efb38adab1e960e4444c2dc258764e1172@intel.com>
 <aXzRH9_0UsrK16Sb@intel.com>
Date: Mon, 02 Feb 2026 13:04:40 +0200
Message-ID: <59dd567c101423051a53210a391776b0a00fb094@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 30 Jan 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Jan 30, 2026 at 02:03:44PM +0200, Jani Nikula wrote:
>> On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> > -				for_each_pipe(&data.display, pipe) {
>> > -					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>> > -						for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> > +				for_each_crtc(&data.display, crtc) {
>> > +					igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
>>=20
>> First, a higher level meta comment here. I'm having mild second thoughts
>> about igt_crtc_name() returning kmstest_pipe_name().
>>=20
>> What if, in the future, we want to use CRTC name? And make that
>> different from the pipe name? If we percolate igt_crtc_name() all over
>> the place, the switch is going to be difficult. (Mostly because it's
>> being used in test names.)
>>=20
>> Should we have igt_crtc_name() return something based on the CRTC index
>> instead? And have, say, igt_crtc_pipe_name() return kmstest_pipe_name(),
>> and use that in these conversions?
>>=20
>> Or, more generally, maybe igt_crtc_name() should be the vendor neutral
>> DRM KMS name, and, say, igt_crtc_vendor_name() should return something
>> that's specific to the vendor. For Intel, it would be pipe, since that's
>> mostly Intel specific thing. For others, it might be something else.
>>=20
>> Or am I overcomplicating, and we should just cross that bridge when we
>> come to it?
>
> Shrug. I suppose for now igt_crtc_name() is always the pipe name,
> so if at some point want to start using some other naming scheme
> we could start that off with a global
> s/igt_crtc_name()/igt_crtc_pipe_name()/ or whatever. So doesn't
> really seem to matter what we call it for now. But I can rename
> it now as well, if you think it's a good idea.

Well, *shrug*. I don't know, it's a quick cocci patch to rename
afterwards as well if/when we go down that path.

BR,
Jani.


--=20
Jani Nikula, Intel
