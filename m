Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9246E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 15:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FE010EBE9;
	Wed, 18 Dec 2024 15:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfpmkLz+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA11B10EBE9
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734535688; x=1766071688;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=tlH0z2iMLtvbTSWVJbOYEkz87cDg5/0HxP5gZ117iVo=;
 b=kfpmkLz+pOuEE74xlOouidi/kQQs/CSEHKyR5LSyyxUuuK0gsyiniDQI
 3b55mkw3/j/m17shQrXxrQMsZniFD2TWzFVacvOPj/wv1Bk/85oRJXGHU
 5aYYy14zx1bpN2fEt3thAh14XCZ8tCnmXPDwMlOnojDLlUd6M6pCY/uIJ
 /SneEFFB/51aTA15wY/TJjTrLLX7eP80fGQMYrL6T5Vbup8Vv9sIYCmUa
 QifmsGP69pCaXmftITcJE2ZxzuTIWUu6oNSUlrP6cT0rU14fUGith77u9
 VRhcXWXVevv+USAuyrsElBcth/TTFhI5FtROL79zTpyeW7yHXYg5v79+t g==;
X-CSE-ConnectionGUID: /qW6pCRqTVSI00hkqQ/pKA==
X-CSE-MsgGUID: WiZWjrS+TOSBmSLRHpA7JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60402480"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="60402480"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:28:08 -0800
X-CSE-ConnectionGUID: GdtCpZ1WTf2mNW7cwsQhvA==
X-CSE-MsgGUID: CGh1cJvjTbewP4+9P1A1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135229074"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:28:06 -0800
Message-ID: <9eb3a748b698533d4a58f546eaf123a3f933625e.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t] xe-ci: Disable xe_evict subtests that are
 expected to possibly fail
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 akshata.jahagirdar@intel.com
Date: Wed, 18 Dec 2024 16:28:03 +0100
In-Reply-To: <20241218141839.cosbnxdmkg6eeh2j@kamilkon-desk.igk.intel.com>
References: <20241218124519.4697-1-thomas.hellstrom@linux.intel.com>
 <20241218141839.cosbnxdmkg6eeh2j@kamilkon-desk.igk.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2024-12-18 at 15:18 +0100, Kamil Konieczny wrote:
> Hi Thomas,
> On 2024-12-18 at 13:45:19 +0100, Thomas Hellstr=C3=B6m wrote:
> > Threads may compete over VRAM resources, and since there is no
> > serialization in TTM, threaded evict tests may have a high
> > possibility of failing.
> >=20
> > Disable such tests until we have a working exhaustive eviction
> > implementation in place.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <akshata.jahagirdar@intel.com>
>=20
> Looks reasonable, please only change prefix into
> tests/intel-ci/xe*:
>=20
> also consider writing it a little shorter, like:
> [PATCH i-g-t] tests/intel-ci/xe*: Disable few xe_evict subtests
>=20
> With this
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>=20
> Please also see one nit below.
>=20
> > ---
> > =C2=A0tests/intel-ci/xe-fast-feedback.testlist | 5 -----
> > =C2=A0tests/intel-ci/xe.blocklist.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 7 +++++++
> > =C2=A02 files changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/intel-ci/xe-fast-feedback.testlist
> > b/tests/intel-ci/xe-fast-feedback.testlist
> > index 727be9230..f16ca9188 100644
> > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > @@ -263,19 +263,14 @@
> > igt@xe_exec_threads@threads-mixed-shared-vm-basic
> > =C2=A0igt@xe_exec_threads@threads-mixed-fd-basic
> > =C2=A0igt@xe_exec_threads@threads-mixed-userptr-invalidate
> > =C2=A0
> > igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> > -igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
> > =C2=A0igt@xe_evict@evict-beng-small
> > =C2=A0igt@xe_evict@evict-beng-small-cm
> > =C2=A0igt@xe_evict@evict-beng-small-external
> > =C2=A0igt@xe_evict@evict-beng-small-external-cm
> > =C2=A0igt@xe_evict@evict-beng-small-multi-vm
> > =C2=A0igt@xe_evict@evict-cm-threads-small
> > -igt@xe_evict@evict-mixed-threads-small
> > -igt@xe_evict@evict-mixed-threads-small-multi-vm
> > =C2=A0igt@xe_evict@evict-small
> > =C2=A0igt@xe_evict@evict-small-cm
> > =C2=A0igt@xe_evict@evict-small-external
> > =C2=A0igt@xe_evict@evict-small-external-cm
> > =C2=A0igt@xe_evict@evict-small-multi-vm
> > -igt@xe_evict@evict-small-multi-vm-cm
> > -igt@xe_evict@evict-threads-small
> > diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-
> > ci/xe.blocklist.txt
> > index e29e745a0..ed9e572a5 100644
> > --- a/tests/intel-ci/xe.blocklist.txt
> > +++ b/tests/intel-ci/xe.blocklist.txt
> > @@ -90,3 +90,10 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
> > =C2=A0igt@sriov_basic@enable-vfs-bind-unbind-each$
> > =C2=A0igt@sriov_basic@bind-unbind-vf$
> > =C2=A0#################################################################=
#
> > +# Exclude xe_evict tests that are not expected to succeed
> > +# due to missing TTM exhaustive eviction
> > +##################################################################
> > +igt@xe_evict@*-multi-vm-cm*
> > +igt@xe_evict@*-threads-*
> > +# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
>=20
> Did you mean that
> igt@xe_evict@evict-cm-threads-small
>=20
> should stay in BAT?

No it shouldn't. Good catch. I'll update.

>=20
> Regards,
> Kamil
>=20
> > +##################################################################
> > --=20
> > 2.47.1
> >=20

