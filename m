Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A80CFD355
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 20:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1A110E257;
	Mon, 24 Nov 2025 20:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fT0tckQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A410E257
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764016297; x=1795552297;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Vf6Dbb6d7mniDCBUPA3rvbg6GH1l2jWQKslaIj4h2vU=;
 b=fT0tckQd9lXSXAcOfg0sf53k6HQAznf7TaAUa8pTXAtJTNrwtypTkScQ
 pKuPjSIsiRhS69lGTMp8mpAqZ19b59cuu/Q8ySlnK0HDOivnTeG5NJ52Q
 M3SvCdxYty8RViioZQGWZJhYD+jTg0HbjgIX5VjezqhNhiVMCfpe9WP3a
 zKQ8m6VUF5sy2ioniz8t54QA1ukkOc0FWf3E+3MBZ7yNLjxep2rgNVf8E
 Q2zYVDwLJ5VhpmYMZWqrAyH5eL2TSTFnt5Y0/KmUHfISCesB6F0womhjz
 HxK0jo8E6GaA7+OyFlAhqKcuaW4NqeuJU3vRAbbRjitLQSBJQaM22sCQy Q==;
X-CSE-ConnectionGUID: R0FiuXHLSoWFobyIsAMWHg==
X-CSE-MsgGUID: GmLxj5EiQwSC0izcqm93EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66059738"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66059738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 12:31:36 -0800
X-CSE-ConnectionGUID: mSEVXlyTRGuZ/xfDOFc4aQ==
X-CSE-MsgGUID: 6RMM99TbTnS5H01liFTNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="197357241"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 12:31:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Kunal Joshi
 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/35] lib/igt_pipe_crc: separate CRTC index from
 pipe
In-Reply-To: <aSSu4eSzuKMa4R2q@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
 <20251123152412.599801-2-kunal1.joshi@intel.com>
 <aSSu4eSzuKMa4R2q@intel.com>
Date: Mon, 24 Nov 2025 22:31:31 +0200
Message-ID: <235aeb5e8949b83daf535586475fe047714458a9@intel.com>
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

On Mon, 24 Nov 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Sun, Nov 23, 2025 at 08:53:38PM +0530, Kunal Joshi wrote:
>> The pipe CRC helpers have historically treated the logical pipe enum as =
if it
>> were the CRTC index, and used that directly in the debugfs paths under
>> crtc-<index>/crc/. This only works as long as crtc_index =3D=3D pipe, wh=
ich is no
>> longer guaranteed once pipes are virtualized, fused off, or reordered.
>>=20
>> Introduce an explicit CRTC index in igt_pipe_crc and wire it through the
>> debugfs control/data paths. Add new constructors that take either a raw =
CRTC
>> index or an igt_display+pipe pair, and update kms_pipe_crc_basic to use =
the
>> display-aware helper so it always uses display->pipes[pipe].crtc_offset.
>>=20
>> Keep the existing igt_pipe_crc_new(fd, pipe, ...) API as a thin wrapper =
that
>> still assumes crtc_index =3D=3D pipe for now so existing callers continu=
e to work.
>> This is a first incremental step towards fully decoupling CRTC indices f=
rom
>> hardware pipes across the KMS tests.
>> ---
>>  lib/igt_pipe_crc.c         | 39 +++++++++++++++++++++++++++++++++++---
>>  lib/igt_pipe_crc.h         |  6 ++++++
>>  tests/kms_pipe_crc_basic.c | 12 ++++++------
>>  3 files changed, 48 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
>> index 866bf2881..24aa72bcc 100644
>> --- a/lib/igt_pipe_crc.c
>> +++ b/lib/igt_pipe_crc.c
>> @@ -190,6 +190,8 @@ struct _igt_pipe_crc {
>>  	int flags;
>>=20=20
>>  	enum pipe pipe;
>
> This whole pipe thing needs to go away.

I think there's basically two approaches:

1) Just assume pipe =3D=3D crtc_index everywhere, and single out the cases
   where the "physical" pipe is actually something else. Use a separate
   enum for the physical pipe. The downside is that this will continue
   to confuse and trick people, because the kernel has largely migrated
   away from this.

2) Roll up the sleeves, and call things by their real names. enum pipe
   needs to mean the physical pipe, and everything else needs to be
   converted to crtc_index. And where the physical pipe is not needed,
   which is most places, it needs to be removed. Like here.

I'm in favour of 2, if the churn it causes is acceptable. Personally I
think it's worth it to clarify a lot of things all over the place.

>
>> +	/* CRTC index in drmModeRes.crtcs used for debugfs paths. */
>> +	unsigned int crtc_index;
>>  	char *source;
>>  };
>>=20=20
>> @@ -215,7 +217,8 @@ void igt_require_pipe_crc(int fd)
>>  }
>>=20=20
>>  static igt_pipe_crc_t *
>> -pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>> +pipe_crc_new_internal(int fd, enum pipe pipe, unsigned int crtc_index,
>> +		     const char *source, int flags)
>>  {
>>  	igt_pipe_crc_t *pipe_crc;
>>  	char buf[128];
>> @@ -235,7 +238,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *sou=
rce, int flags)
>>  	pipe_crc =3D calloc(1, sizeof(struct _igt_pipe_crc));
>>  	igt_assert(pipe_crc);
>>=20=20
>> -	sprintf(buf, "crtc-%d/crc/control", pipe);
>> +	sprintf(buf, "crtc-%u/crc/control", crtc_index);
>>  	pipe_crc->ctl_fd =3D openat(debugfs, buf, O_WRONLY);
>>  	igt_assert(pipe_crc->ctl_fd !=3D -1);
>>=20=20
>> @@ -243,6 +246,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *sou=
rce, int flags)
>>  	pipe_crc->fd =3D fd;
>>  	pipe_crc->dir =3D debugfs;
>>  	pipe_crc->pipe =3D pipe;
>> +	pipe_crc->crtc_index =3D crtc_index;
>>  	pipe_crc->source =3D strdup(env_source);
>>  	igt_assert(pipe_crc->source);
>>  	pipe_crc->flags =3D flags;
>> @@ -250,6 +254,15 @@ pipe_crc_new(int fd, enum pipe pipe, const char *so=
urce, int flags)
>>  	return pipe_crc;
>>  }
>>=20=20
>> +static igt_pipe_crc_t *
>> +pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>> +{
>> +	/* Existing callers pass a logical pipe; assume crtc_index =3D=3D pipe
>> +	 * until they are converted to use the new helpers.
>> +	 */
>> +	return pipe_crc_new_internal(fd, pipe, pipe, source, flags);
>> +}
>> +
>>  /**
>>   * igt_pipe_crc_new:
>>   * @fd: fd of the device
>> @@ -288,6 +301,26 @@ igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, c=
onst char *source)
>>  	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
>>  }
>>=20=20
>> +igt_pipe_crc_t *
>> +igt_pipe_crc_new_for_crtc(int fd, unsigned int crtc_index,
>> +			 const char *source)
>> +{
>> +	return pipe_crc_new_internal(fd, PIPE_A, crtc_index, source, O_RDONLY);
>> +}
>> +
>> +igt_pipe_crc_t *
>> +igt_pipe_crc_new_for_display(struct igt_display *display, enum pipe pip=
e,
>> +			     const char *source)
>> +{
>
> I think it's better to just pass in the whole igt_pipe_t.
> In fact I already wrote the cocci for that, but I need to
> get a bunch of refactroing done in before it can be done.
> I already posted two small refactoring series, but more
> will be needed.

That with the s/igt_pipe_t/igt_crtc_t/ rename would be great.

There are a few special cases like tools/intel_display_crc.c which
currently don't have any igt_pipe_t available. But I think the parameter
for it should anyway be crtc_index not pipe.

Hmm, looking at the tool, how does it even work at all? Where does
ctx.fd come from? I digress.

BR,
Jani.


--=20
Jani Nikula, Intel
