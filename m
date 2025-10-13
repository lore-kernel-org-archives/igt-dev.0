Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F012BCCA476
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 12:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BAC10E268;
	Mon, 13 Oct 2025 12:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fp9xkl/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6924D10E268
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760356973; x=1791892973;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0omtFRa/EANX9R/l5PIGLQSGLSLD5IBr1RSj4+Ztsaw=;
 b=Fp9xkl/phPYdB/+mfvDFN7WPulTn95/4M+M1NGPrKXSZEnQNVkM+Gq8k
 ukonPwoMc/CMJu4aaKzMLOoVy6JdJYwHUVIv3VtBbbY9rrPPWsNsqCUew
 DS5nENzuORHDfy7MMIil/08nh9k7IqGhJk3u1kbr64O/zl9NPB0kFv78b
 VnlrsFz/8ictTg/NSKck0OIVorqzWlEaOPc9NQSLoYwMHChGmqX2a1Q/g
 V7WKdi8vczkPAPyKG4hGo2GMq8y3EtOAB7osw4/Ic/C2aBNk9TJMNp5Kj
 dk6nmNhX9mY7SAvDylPBapvnvFo129PHiDiVv8VaJ5wcNBpxLjWjZ02FA g==;
X-CSE-ConnectionGUID: P85Owx8wScWZ9urFAkJumw==
X-CSE-MsgGUID: DqSzCNHVR8u/hUeluaLeNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62408330"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62408330"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:02:53 -0700
X-CSE-ConnectionGUID: rLQTq6BKRGOoo4XNE/+apQ==
X-CSE-MsgGUID: YY33aMJWQFS89XhLm81Ndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182008477"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 05:02:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, =?utf-8?B?UGF1bC1w?=
 =?utf-8?B?bCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t 6/6] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
In-Reply-To: <591ef478c27f82b9c62aa9d192fdfc7505be9b72.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <20251012171459.3773990-7-jason-jh.lin@mediatek.com>
 <1543d4867d6055090309f653da5e74c9097322ae@intel.com>
 <591ef478c27f82b9c62aa9d192fdfc7505be9b72.camel@mediatek.com>
Date: Mon, 13 Oct 2025 15:02:46 +0300
Message-ID: <fe5ec9d09f827cf00b1ce2d81fcc273805818d7e@intel.com>
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

On Mon, 13 Oct 2025, Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) <Jason-JH.L=
in@mediatek.com> wrote:
> On Mon, 2025-10-13 at 11:03 +0300, Jani Nikula wrote:
>>=20
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>=20
>>=20
>> On Mon, 13 Oct 2025, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
>> > Fix the EDID parsing logic by supporting EDID_DETAIL_MONITOR_STRING
>> > in
>> > addition to EDID_DETAIL_MONITOR_NAME. Also, trim the trailing
>> > padding
>> > spaces from the monitor vendor name when parsing the EDID string to
>> > ensure the monitor name is correctly returned.
>> >=20
>> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> > ---
>> > =C2=A0lib/igt_edid.c | 13 ++++++++++---
>> > =C2=A01 file changed, 10 insertions(+), 3 deletions(-)
>> >=20
>> > diff --git a/lib/igt_edid.c b/lib/igt_edid.c
>> > index 627201c342df..56ddfd07279a 100644
>> > --- a/lib/igt_edid.c
>> > +++ b/lib/igt_edid.c
>> > @@ -26,6 +26,7 @@
>> > =C2=A0#include "config.h"
>> >=20
>> > =C2=A0#include <assert.h>
>> > +#include <ctype.h>
>> > =C2=A0#include <string.h>
>> > =C2=A0#include <stdint.h>
>> > =C2=A0#include <time.h>
>> > @@ -215,7 +216,7 @@ void edid_get_monitor_name(const struct edid
>> > *edid, char *name, size_t name_size
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct detailed_timing *dt;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct detailed_non_pixel *np;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct detailed_data_string *ds;
>> > -=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 size_t i, n;
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(name_size > 0);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name[0] =3D '\0';
>> > @@ -224,12 +225,18 @@ void edid_get_monitor_name(const struct edid
>> > *edid, char *name, size_t name_size
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dt =3D &edid->detailed_timings[i];
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 np =3D &dt->data.other_data;
>> >=20
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (np->type !=3D EDID_DETAIL_MONITOR_NAME)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (np->type !=3D EDID_DETAIL_MONITOR_NAME &&
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 np->type !=3D EDID_DETAIL_MONITOR_STRING)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> >=20
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ds =3D &np->data.string;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 strncpy(name, ds->str, name_size - 1);
>> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 name[name_size - 1] =3D '\0';
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* remove the padding space from EDID */
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 n =3D strlen(ds->str);
>>=20
>> It's not NUL terminated.
>
> Hi Jani,
>
> Thanks, I'll rollback this part and set n to name_size - 1 directly.
>
> Full code:
>
> ds =3D &np->data.string;
> strncpy(name, ds->str, name_size - 1);
> name[name_size - 1] =3D '\0';
>
> /* remove the padding space from EDID */
> n =3D name_size;
>
> while (n > 0 && isspace((unsigned char)name[n - 1]))
>         name[--n] =3D '\0';

IMO something like this is overall shorter and easier to understand, as
you have both the check and the operation on name[n] instead of name[n -
1] vs name[--n].

	for (size_t n =3D name_size - 1; n > 0 && isspace(name[n]); n--)
		name[n] =3D '\0';

BR,
Jani.

>
> Regards,
> Jason-JH Lin
>
>>=20
>> BR,
>> Jani.
>>=20
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 while (n > 0 && isspace((unsigned char)name[n - 1]))
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name[--n] =3D '\0';
>> > +
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 igt_debug("Monitor name: %s\n", name);
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return;
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>=20
>> --
>> Jani Nikula, Intel
>

--=20
Jani Nikula, Intel
