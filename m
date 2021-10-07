Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D4E6F4B1
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Oct 2021 14:56:43 +0000 (UTC)
Message-ID: <73ec4c04-b2d1-4392-4096-7cc7076420ed@amd.com>
Date: Thu, 7 Oct 2021 10:56:37 -0400
Content-Language: en-US
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
 <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <20211007144038.ojiw5nzbydkfvgk2@outlook.office365.com>
 <oakr8kYGfhw6ExOrkEWsbp3jU89Fsenuurp94OdfCpOmqcab7tSAUAGLLQy4Tcro8tP5yZeSQAVzsTgGUrszteqMo5nyjdrCwYmwxypWQkE=@emersion.fr>
 <DM4PR12MB5182EFB81A2845B2F953BB57ECB19@DM4PR12MB5182.namprd12.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <DM4PR12MB5182EFB81A2845B2F953BB57ECB19@DM4PR12MB5182.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read
 output_bpc on AMD hardware
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, Simon Ser <contact@emersion.fr>
Cc: "Saarinen, Jani" <jani.saarinen@intel.com>, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, "Latvala, Petri" <petri.latvala@intel.com>, "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Choi, Nicholas" <Nicholas.Choi@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-10-07 10:54, Kazlauskas, Nicholas wrote:
> [AMD Official Use Only]
>=20
>=20
> I don't have the commits in front of me, but there was an issue with the =
port from amd_hdr to kms_hdr where the test would do a TEST_ONLY commit tha=
t change the output bpc to 10 but then the debugfs check /after /would try =
and verify that the output bpc was 10 - which doesn't work if the output bp=
c was previously 8 because the commit wasn't actually applied.
>=20

https://patchwork.freedesktop.org/patch/456663/?series=3D95313&rev=3D1

Stylon, is that what is happening?

If so, please make sure the commit description reflects that. The existing
description doesn't explain why switching from TEST_ONLY to ALLOW_MODESET
fixes things.

Harry


> Regards,
> Nicholas Kazlauskas
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------
> *From:* Simon Ser <contact@emersion.fr>
> *Sent:* Thursday, October 7, 2021 10:49 AM
> *To:* Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> *Cc:* Saarinen, Jani <jani.saarinen@intel.com>; Vudum, Lakshminarayana <l=
akshminarayana.vudum@intel.com>; Latvala, Petri <petri.latvala@intel.com>; =
Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; igt-dev@lists.freedesktop.or=
g <igt-dev@lists.freedesktop.org>; Choi, Nicholas <Nicholas.Choi@amd.com>; =
Mark Yacoub <markyacoub@google.com>; Wentland, Harry <Harry.Wentland@amd.co=
m>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
> *Subject:* Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bp=
c on AMD hardware
> =C2=A0
> I don't think removing TEST_ONLY is correct? bafd90661c26 ("tests/kms_hdr=
: Add
> bpc switch subtests") reads:
>=20
> =C2=A0=C2=A0=C2=A0 v4: -Plane size back to CRTC size, regression observed=
 in hsw again
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Plane must cover entire=
 CRTC" because of plane size restriction
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to 512x512. Petri/Ville =
suggested to use TEST_ONLY in try_commit()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to probe whether we can =
use a smaller than fullscreen plane.
>=20
> cc Nicholas
