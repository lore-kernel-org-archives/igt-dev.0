Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A69C44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 10:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC62B10E18A;
	Thu, 22 Jan 2026 10:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SB7wu4t6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5A810E0CD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769076173; x=1800612173;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Y4Tc4bRInBfTg57MRTY6xedkNJqXAZqOiYtbxr35akU=;
 b=SB7wu4t6FSSEwa7KbnhnMftswAVWEpriEBVDjqlzK5/gWa/3YYrTX9/G
 iseGkVStzC5dksU7mRX+g7sRmbPZkyv0LJDAgkypub+bXX4sAQvQ1/OMt
 XQL9BEr7xAa3smtp024K92IM7mHbfdCKO0NbA098DI5UjKZDPdbOK2saa
 Oo4jXOqxDrkPkdR8aLztI1ArA7XAJmTzVEy7o1s7BO+6hERMZ/NVJsUUG
 yCrudCq3p1lUPhypUjZNNleM/8c3MpQaJYq6T2aJa7NyFAxDphXrIvMXh
 S1QiSfhc7qB1wrwC0mEfLmQsMAeyb578L3JQ79poR0vWbXPQ2d3dX0Ney g==;
X-CSE-ConnectionGUID: gl4h7kJ7RfeG3xoOPDJuKw==
X-CSE-MsgGUID: FaxoXz+RRo+v5GBsjo8UTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="95788354"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="95788354"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:02:52 -0800
X-CSE-ConnectionGUID: cjL+RVlJTEGjTgSBV60UEw==
X-CSE-MsgGUID: JEjrPbHCRdKFHCufZuryHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206954272"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:02:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/12] lib/kms: Add igt_crtc_t based CRC wrappers
In-Reply-To: <aXDsOuJe7iOV9Cab@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
 <20260120171656.15840-9-ville.syrjala@linux.intel.com>
 <533fc18053baa268f1188aa2dc589c51a522a703@intel.com>
 <aXDsOuJe7iOV9Cab@intel.com>
Date: Thu, 22 Jan 2026 12:02:48 +0200
Message-ID: <860aab5780e5f226ce824b8a0c7048d0e9916bee@intel.com>
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

On Wed, 21 Jan 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Jan 21, 2026 at 11:33:26AM +0200, Jani Nikula wrote:
>> On Tue, 20 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> > index 71a2f2c4d89c..b291673c2f7f 100644
>> > --- a/lib/igt_kms.h
>> > +++ b/lib/igt_kms.h
>> > @@ -584,6 +584,10 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_d=
isplay_t *display, enum pipe pi
>> >  	return &display->pipes[pipe];
>> >  }
>> >=20=20
>> > +typedef struct _igt_pipe_crc igt_pipe_crc_t;
>>=20
>> So this is a dupe typedef, also defined in igt_pipe_crc.h. It works,
>> it's probably better than including the other header here, but also a
>> bit meh.
>
> Yeah, forward declarations seem be to be painful with typedefs.
>
>>=20
>> Another idea is naming this based on crtc instead of pipe, even if "crtc
>> crc" is a mouthful:
>>=20
>> typedef struct _igt_pipe_crc igt_crtc_crc_t;
>>=20
>> I think it'll work, the types are compatible with the underlying struct
>> being the same. So we could (gradually) convert from pipe_crc to
>> crtc_crc.
>
> Shrug.
>
>>=20
>> With the wrappers being in igt_kms.[ch], is the idea that most tests
>> could cease to include igt_pipe_crc.h after the conversions?
>
> I expect the tests will need a bunch of other stuff from there
> still.
>
> Originally I put the crtc wrappers into igt_pipe_crc.[ch], but
> then I needed to add forward declarations and includes for
> igt_crtc_t which felt even worse.

Ack. Like I said, I'm fine with this as-is too.

BR,
Jani.


--=20
Jani Nikula, Intel
