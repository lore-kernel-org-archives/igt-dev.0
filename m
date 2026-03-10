Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54430EB1043
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E3B10E249;
	Tue, 10 Mar 2026 10:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gsyTKmiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7204110E249
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773139942; x=1804675942;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=022op5jlKFby7TUeeqBog98nHbM43C6HO9JyOP51Wpw=;
 b=gsyTKmivhG2aguojTv+90+/auaUdnaLQwrTE0EfzLJBHVyvyRVBCCo2r
 qTYEy99EFXtI1qjDQcnGsAjjv/JqECM0VTUdKE9hQeonshx6nRN1GojVj
 bkqdn263yDQZ/nM4VSy3wQ8mB0npZ3t+o3KV1qN8s6OgK+/SaWpdS3LT4
 BcUuyMiPmB9Ie1dp9RSi/ptbli6BHHTZ+Hdm7MDN7EJBhbwkB1SwaS9+9
 rsvOkaV3PlekVUGBiPRmHGDsaP4D50nxPfvb5Gk4D9UixM5uRdkubMMrJ
 5Tl5+NUBzxDGadHvnmPlGAYAKsW79s4iapdw6xJ4prxkyimI7FG1IPGb4 Q==;
X-CSE-ConnectionGUID: Af/HfMhiSZqRDJB1ZlLJhA==
X-CSE-MsgGUID: 9O38iVsaQ4i/m8DaknmueQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74224245"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74224245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:52:22 -0700
X-CSE-ConnectionGUID: YbxjbSLCTnqfPqH49Z5Zuw==
X-CSE-MsgGUID: T/GKIQ1NQ6+PG2PIJUZrfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224760138"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:52:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/10] tests/kms_cursor_crc: use CRTC indexes
 instead of pipes for CRTC tracking
In-Reply-To: <aa_s-h2k_J0GpCuh@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773066012.git.jani.nikula@intel.com>
 <788880adc41b3640311190a8dbf794c6226d25e2.1773066012.git.jani.nikula@intel.com>
 <aa_s-h2k_J0GpCuh@intel.com>
Date: Tue, 10 Mar 2026 12:52:17 +0200
Message-ID: <17908e9bb5293de962f7a82d2fc865bf9d5b7467@intel.com>
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

On Tue, 10 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Mar 09, 2026 at 04:21:38PM +0200, Jani Nikula wrote:
>> @@ -1286,8 +1286,8 @@ int igt_main_args("e", NULL, help_str, opt_handler=
, NULL)
>>  		igt_display_require_output(&data.display);
>>  		/* Get active pipes. */
>>  		for_each_crtc(&data.display, crtc)
>> -			active_pipes[last_pipe++] =3D crtc->pipe;
>> -		last_pipe--;
>> +			active_crtcs[last_crtc_index++] =3D crtc->crtc_index;
>> +		last_crtc_index--;
>
> It looks like when we get rid of the n_crtcs=3D=3DMAX_PIPES mess
> all of these array things could just be nuked. But I suppose
> we're not quite there yet.

Yeah, we're close. At least one prerequisite is returning NULL from
igt_crtc_for_pipe() for non-existing pipes. After that, display->crtcs
could be just the valid CRTCs in pipe order. And then n_crtcs could be
shrunk to match valid CRTCs. And there are other possible cleanups after
that.

Of course, display->crtcs couldn't be indexed with pipe anymore, but
there are so few igt_crtc_for_pipe() users left that it shouldn't really
matter.

Also, I believe changing the order from pipe to CRTC index order might
be really hard to review. Probably not worth it, at least for now.

Once we've gotten rid of most of the crtc->pipe and enum pipe uses, I've
wondered if we shouldn't rename them crtc->vendor_pipe and enum
vendor_pipe or something along those lines, to emphasize folks should
probably steer clear for regular use.

BR,
Jani.


--=20
Jani Nikula, Intel
