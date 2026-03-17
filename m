Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130D3F33809
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 07:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5CA10E51F;
	Tue, 17 Mar 2026 07:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsuNReFu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E414710E51F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773733844; x=1805269844;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=IefSaKZTZ6O8iYo3Me2Fs0h40VLc5n+d+StpDzF8To0=;
 b=MsuNReFua2RHYzrxR8wz7ydOwCyRqi+vfjT8VjRajJAtbOfpTCYkdR24
 KcRqTl4hBog9vAKShIbajxQYBGulvGIpLgHuUozPL+4fRwp7ymjKtAJox
 K9ClB0u87Pf5U4BwfqlVhr8KJKDhCp24uTdG14CoQBlX+Q8e5+MS5iuYW
 vnjY+hwxqSRs5J5V3TNNAnJ7iUvevf1wkEJ/QjS4O3tCi3/iMDfO5TfJ6
 3LFF38fBHl8WGEp7Pj0jBQeqA1llb3psWuOY4bjSFdWxzLIby6Gm2yMrK
 FFjWE35sr5GcrRQWMHzeS1S5sEnaslQ/aW2kM+DZotfzDdOkzJKubFh6/ Q==;
X-CSE-ConnectionGUID: fZvEMYN5TJKAMerLCUuCOQ==
X-CSE-MsgGUID: Y+jyZdtAQJCHmlvAFRCqSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62325489"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="62325489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:50:44 -0700
X-CSE-ConnectionGUID: vUMvZmsxRYWlvnzx/TGpHw==
X-CSE-MsgGUID: RSz4MZZ0ROe99L9rjXMwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="260082982"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 00:50:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/12] Prepare for returning NULL from
 igt_crtc_for_pipe()
In-Reply-To: <abgZwkJhe3g3q2N5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1773659680.git.jani.nikula@intel.com>
 <abgZwkJhe3g3q2N5@intel.com>
Date: Tue, 17 Mar 2026 09:50:38 +0200
Message-ID: <a81b695d7c028a82b826bb8c12dd677a18d6cd5f@intel.com>
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

On Mon, 16 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Mar 16, 2026 at 01:19:02PM +0200, Jani Nikula wrote:
>> We want to return NULL for invalid pipes from igt_crtc_for_pipe(), so
>> that we don't need to have igt_crtc_t objects with crtc->valid =3D=3D fa=
lse
>> around.
>>=20
>> The primary way to prepare for this is to avoid using
>> igt_crtc_for_pipe() altogether. We've done a *lot* of that already, and
>> continue to do so here.
>>=20
>> For the remaining ones, start off by ensuring crtc->valid =3D=3D true, o=
ne
>> way or other. This ensures the test logic is sane and actually operates
>> on valid CRTCs. Once this prep is done, we can actually return NULL from
>> igt_crtc_for_pipe(), and check for crtc !=3D NULL instead of crtc->valid
>> =3D=3D true.
>
> I was hoping to make igt_crtc_for_pipe() just skip if the CRTC
> doesn't exist. But maybe there are still too many places that
> assume they can ask for any pipe and not skip?

At the very least the joiner logic has to gracefully check if a pipe
exists or not, without impacting test execution status.

The alternative would be to have igt_crtc_for_pipe() skip, but introduce
igt_pipe_exists() or somesuch for the check. That might lead to some
places requiring both, though.

Partially I'm also interested in the test results here; are there tests
that have been using invalid CRTCs...


BR,
Jani.


>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> Jani Nikula (12):
>>   tests/amdgpu/amd_mode_switch: Prepare for returning NULL from
>>     igt_crtc_for_pipe()
>>   tests/amdgpu/amd_multidisplay_modeset: Prepare for returning NULL from
>>     igt_crtc_for_pipe()
>>   tests/intel/kms_cdclk: use igt_next_crtc()
>>   tests/intel/kms_joiner: Prepare for returning NULL from
>>     igt_crtc_for_pipe()
>>   tests/intel/kms_joiner_helper: Prepare for returning NULL from
>>     igt_crtc_for_pipe()
>>   tests/intel/kms_pipe_b_c_ivb: Prepare for returning NULL from
>>     igt_crtc_for_pipe()
>>   tests/intel/kms_pipe_stress: Prepare for returning NULL from
>>     igt_crtc_for_pipe()
>>   tests/kms_bw: fix misleading indent
>>   tests/kms_bw: clarify what's going on with proper variable naming
>>   tests/kms_bw: avoid igt_crtc_for_pipe() and crtc->pipe usage
>>   tests/kms_explicit_fence: store igt_crtc_t* instead of pipe in data
>>   lib/kms: convert igt_crtc_for_pipe() into a proper function
>>=20
>>  lib/igt_kms.c                           |  8 +++
>>  lib/igt_kms.h                           |  8 +--
>>  tests/amdgpu/amd_mode_switch.c          |  2 +
>>  tests/amdgpu/amd_multidisplay_modeset.c |  2 +
>>  tests/intel/kms_cdclk.c                 | 10 ++--
>>  tests/intel/kms_joiner.c                | 66 ++++++++++++++++++-------
>>  tests/intel/kms_joiner_helper.c         | 16 +++---
>>  tests/intel/kms_pipe_b_c_ivb.c          | 28 +++++++----
>>  tests/intel/kms_pipe_stress.c           |  4 ++
>>  tests/kms_bw.c                          | 48 +++++++++---------
>>  tests/kms_explicit_fence.c              | 14 +++---
>>  11 files changed, 131 insertions(+), 75 deletions(-)
>>=20
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
