Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED9DCDB466
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 09:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4627910E1B1;
	Thu, 25 Jun 2026 09:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5/H4DLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2237410E1B1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782380059; x=1813916059;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3U8btHvoJYg9WsdXr1G6WglOk3rJtDghGXABPEjd/jE=;
 b=d5/H4DLmHlgHTq3F8HhFisQTcLJAFOTpA1kgQJJ2gzxoyKLYc8j+OISW
 +MJjidINgZ7Lxo2GzaOety0pc+F0XtgURXcUsJlLJxXGEY0H2S+NrJhdS
 HFpYj0Rr5CR1lbSFXhxM9eUp+Jne3VUViciFrF8+U46DImALSWYKTVXbL
 kdebT3YjgFelksLNc/J/m4TgbCEA7+owKEsqM9TJ1uNxQPUCLy+yqt6G0
 1qqHZuZrva1uMDfcxc15eq4Va4g3NDQwetVJODQHw6JmYTH7jhD0zOa18
 vRpuc1WQCObPVA4zV/xs+fGHuz0jDNLD4ad7JzIRz3klNCj9xH5gjxyfd g==;
X-CSE-ConnectionGUID: g5SrZKQdQQalqcBC6fR3pQ==
X-CSE-MsgGUID: fXICxIldTSGn/kHdMRr6Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83156385"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="83156385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:34:19 -0700
X-CSE-ConnectionGUID: 9Vn6xglLQ0icooNwH7C6zw==
X-CSE-MsgGUID: 9qsg+rZURhe0ZtlbmbD66w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="244141434"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:34:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] benchmarks/gem_exec_trace: use
 hars_petruska_f54_1_random() from lib/rand
In-Reply-To: <3apgkow66ofonucapgl5ex55vjcjdbeofqktlrnzxavfexkldf@uorihbgw66oi>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1781791747.git.jani.nikula@intel.com>
 <c78b332ceeaa0c00b80e99f4e49765bc22abd0ab.1781791747.git.jani.nikula@intel.com>
 <f4zbjx4zch4c5c3m6ihqwkkw4ysm6rjkyjb24qkeoc6644lnhj@vk5kpqt4kljl>
 <af243a66da77bb294c3c985233f3decbf1b86b89@intel.com>
 <4ee63ffce8504cd794430e1cad3da6205b134cd0@intel.com>
 <3apgkow66ofonucapgl5ex55vjcjdbeofqktlrnzxavfexkldf@uorihbgw66oi>
Date: Thu, 25 Jun 2026 12:34:14 +0300
Message-ID: <79e99fc4f138d3287683749b83225822f2406f21@intel.com>
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

On Thu, 25 Jun 2026, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.=
com> wrote:
> On Wed, Jun 24, 2026 at 11:03:51AM +0300, Jani Nikula wrote:
>> On Mon, 22 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>> > On Fri, 19 Jun 2026, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@i=
ntel.com> wrote:
>> >> On Thu, Jun 18, 2026 at 05:09:52PM +0300, Jani Nikula wrote:
>> >>> Remove the local duplicate of hars_petruska_f54_1_random() by switch=
ing
>> >>> to use lib/rand.
>> >>>=20
>> >>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >>> ---
>> >>>  benchmarks/gem_exec_trace.c | 12 +++---------
>> >>>  1 file changed, 3 insertions(+), 9 deletions(-)
>> >>>=20
>> >>> diff --git a/benchmarks/gem_exec_trace.c b/benchmarks/gem_exec_trace=
.c
>> >>> index 4263ccb03dbd..c27639105903 100644
>> >>> --- a/benchmarks/gem_exec_trace.c
>> >>> +++ b/benchmarks/gem_exec_trace.c
>> >>> @@ -42,6 +42,7 @@
>> >>>  #include "drm.h"
>> >>>  #include "drmtest.h"
>> >>>  #include "i915/gem_create.h"
>> >>> +#include "igt_rand.h"
>> >>>  #include "igt_stats.h"
>> >>>  #include "intel_io.h"
>> >>>  #include "ioctl_wrappers.h"
>> >>> @@ -92,14 +93,7 @@ struct trace_wait {
>> >>>  	uint32_t handle;
>> >>>  } __attribute__((packed));
>> >>>=20=20
>> >>> -static uint32_t hars_petruska_f54_1_random(void)
>> >>> -{
>> >>> -	static uint32_t state =3D 0x12345678;
>> >>> -
>> >>> -#define rol(x,k) ((x << k) | (x >> (32-k)))
>> >>> -	return state =3D (state ^ rol (state, 5) ^ rol (state, 24)) + 0x37=
798849;
>> >>> -#undef rol
>> >>> -}
>> >>> +static uint32_t random_state =3D 0x12345678;
>> >>>=20=20
>> >>>  static double elapsed(const struct timespec *start, const struct ti=
mespec *end)
>> >>>  {
>> >>> @@ -277,7 +271,7 @@ static double replay(const char *filename, long =
nop, long range)
>> >>>  				sizeof(*exec_objects)))->handle =3D bo[0];
>> >>>=20=20
>> >>>  			if (nop > 0) {
>> >>> -				eb.batch_start_offset =3D hars_petruska_f54_1_random();
>> >>> +				eb.batch_start_offset =3D hars_petruska_f54_1_random(&random_st=
ate);
>> >>
>> >> With random_state as above this offset is not random. I think adding =
nop
>> >> to random_state would do this.
>> >
>> > I'm only aiming to do a non-functional conversion to existing library
>> > functions. Please explain how this patch changes behaviour; I don't see
>> > it.
>>=20
>> Zbigniew, ping?
>
> I'm sorry for the delay.
>
> I wondered to change offsets for each run, with same random_state on the
> beginning we use same offsets sequence.
>
> But it's fine to me, I mean your change doesn't change functionality
> but code placement.
>
> Pick my r-b for this:
>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Thanks for the reviews, pushed to igt.

BR,
Jani.


>
> --
> Zbigniew
>
>>=20
>> >
>> >
>> > BR,
>> > Jani.
>> >
>> >>
>> >> --
>> >> Zbigniew
>> >>
>> >>>  				eb.batch_start_offset =3D
>> >>>  					((uint64_t)eb.batch_start_offset * range) >> 32;
>> >>>  				eb.batch_start_offset =3D ALIGN(eb.batch_start_offset, 64);
>> >>> --=20
>> >>> 2.47.3
>> >>>=20
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
