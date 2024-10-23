Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912A6CDDE6B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 11:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE4C10E353;
	Wed, 23 Oct 2024 11:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNjS56Xx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077EA10E353
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729681370; x=1761217370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kl9cA8VEqH5fos8Fbu8RvAGyVxYjUSo7upYDnZlmVW4=;
 b=hNjS56XxZQrn8f6NZjJp/TkQsWxmS+iF5P7havYWR0cUwLz2bjSU9vsp
 s43yoSPorpNW1DEInpiQAS3SJjlm0B8YvUIGvFpXB6dQfd8Ch1+ZkODsp
 sh51301EJQ5kYKfZQ/MLh+KQiZQKBlTQvdSxmgRl9xYJ5Ro9KDu2BjB8p
 g7HBTZ7A7mwo6XMGgh28LUuQBF/SACFqE4qEgpvzQPttSz1iuYWQeyEPv
 sPs6kESIcnlbKQhOR5CZacFBXhS/tw/ZCLD0rDUqN+mBUsGgou5EFsymN
 aBocpVRhlYYEzX12hkcaG5lN4sfveQhrO+eMafx1gdoAV8WZjwpF8/8SE w==;
X-CSE-ConnectionGUID: mSChvqWRSMK7ih6cMIDGzQ==
X-CSE-MsgGUID: 25Xw5j3JTsqfE6FsLNiJvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29042949"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29042949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 04:02:47 -0700
X-CSE-ConnectionGUID: ghh7UuvSSNOeXnPSISIC9w==
X-CSE-MsgGUID: A+zPGPeWQsKKok5PvJSz6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80086532"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 04:02:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 04:02:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 04:02:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 04:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhDptHv5DiSoI/0K+UDTg2JwEHonHS7VTzFGxAkOlmwqsCyTgKo/zPHGt1VLDenFMEQKYPMnFsXnUd2DnuDCT6GJwLykNJ6GgJMmUJ7eBQjTPyU3C1p8Q4GZYl+jt50Ve+rxn1lz5Hf4ynfjXe2aZ+HHyhsYqBV+btJUgmt3/fWHusaSKFFxNpbZSTocmaWA6NF9UugA+o8/ntBv/opLmOZybGUVo3Ix5mTIv8B+VwlCfe7Oy1mgAcDfbTesAcy/kcPxjcmqVd4AH6Qsd9H99i+W4fUhVrNoUFdf0O2MkOkB1PcTVlFVt6riT9LPP0JfScHXtDrb6/VamQKRzYTcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhQieznUJOr3Xjss5aWkSJBtu4EyW2dd2tbluaxhQY8=;
 b=VLqqxlgEgNOohzD5u6/29VPcxxx9VqU3Kv7h6BWvxCax1eXKRCeLmmSa+1yAEJh7iLP8hDqiFXaIbSFM3rrSZz+djLkIZ4fQc9kIQjtGiE+3rzUnzbGqb20kb7alwXGsdq/w4A+vRwRRy6iowitLFNgknRtMLKLtYbb7Ta8OIsdWXuAAdFYvE+94tQNAZH+Y0Pi0amXiz5i1KS4kJ7z19fW9LvIDN/VWKZmi+01VNaIuwNChx20XeXOL9kXzvNYXFJaasYu7XH6j7SnWdTNimawckf9hVOINmfEgzUK/Lr+5QVrjKDXY2H+2etfm0i9zguQnuWZeVtpKlsIw9G6AVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 11:02:37 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 11:02:37 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: GSSE Core KMD Power Telemetry India
 <gsse.core.kmd.power.telemetry.india@intel.com>
Subject: RE: [i-g-t,v5,1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
Thread-Topic: [i-g-t, v5, 1/2] tests/intel/xe_pm_residency: Add GT coarse power
 gating validation
Thread-Index: AQHbJTmuHJAmP7R/zEaK1tXGfNfnJbKUK2Yg
Date: Wed, 23 Oct 2024 11:02:37 +0000
Message-ID: <CY5PR11MB621197BB000EA31E1ECEA8D4954D2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20241023104604.2145733-1-sk.anirban@intel.com>
 <20241023104604.2145733-2-sk.anirban@intel.com>
In-Reply-To: <20241023104604.2145733-2-sk.anirban@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB7529:EE_
x-ms-office365-filtering-correlation-id: eca9962b-bfae-4237-480e-08dcf352345e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kbDi7xs238qkRVq/nwaQHC/NxSBtbHNgzNN2e/nN8DgZQewM9SxUxFzaKtvt?=
 =?us-ascii?Q?MPsb47gpykXf+iAvoGnxrO35tCqwbkbex/ExNpPG63o/8JW4ghMEtr1UFtbT?=
 =?us-ascii?Q?YKd+ekNaPrKxLd2U73AKK27a674OFXC9UEwaWMN57XTXv3JKT4ji2Yb1u2Ld?=
 =?us-ascii?Q?kK8d2OdIZejncu3850XtumxnTnITh17LS8EaR5kahmim8qFPqMix+SPuI6Nc?=
 =?us-ascii?Q?70jl8b6Zc4S4lyV4wdCSTljz3kjdeJ7f9HqAFuWrwfAhA5Y+IHNxvs5yRPCD?=
 =?us-ascii?Q?Qm8Kl+HAbQOLBQ2PywG3677ppcd99oGfrgR+5PWVfYJ+UIwsqVTYPlezqSOn?=
 =?us-ascii?Q?2jTJJE2nmHTn7rRf1/42AjEu4NXedaBi8SraaXfhj6evRHqbjKJCCtc3aYxn?=
 =?us-ascii?Q?2bxWOOg/zTlEd5LlA6rlyf0fzYHS+0+4dZyrvLZ1AAQR5kadqOxaOmy+/ION?=
 =?us-ascii?Q?PSsEtq/HOLMH3g5PraEILXC5n4LJ5f7wvSvNTyjsvR+kyceoPPZt4xFYo/TY?=
 =?us-ascii?Q?SBp+BxjrX6Iki3rv0lCuzeBfo3uvAKdTZGcYZDasg8Hnt9nzwsX8IGh87sJM?=
 =?us-ascii?Q?xHPsFgHf3wVBtWJOMZRtneYvtwZCbW+bhZF/yKutAEtLTE2NVUDKob0qeWug?=
 =?us-ascii?Q?TZBmi4H97XueNHeoKTisZfym+ij8WOUWB2yezx0bUmJwEDkYHCxI4E+1neSe?=
 =?us-ascii?Q?6jfhdYXyDFkEDty8dUbdrDLcnbhzHgl+8V71aU3BX/m/HVr/MHRMq9pjzH2y?=
 =?us-ascii?Q?ChhwgWq9SpljZHyq+LabcOnBcnr+DYiU3cTCIgGi6Y/RABewCLJJcXpLN7z1?=
 =?us-ascii?Q?+yNJeLt7cJ0Q5eOpO8viIbBlIIaNyjAlSQ3Dbi71wmKOfkTltGtN29WuXYEC?=
 =?us-ascii?Q?rMvVj42Q4TYdn2m1RJofVOn0PzYnK5UkD1F+ftCm6+zxR5cGzoKKlxIfhn3n?=
 =?us-ascii?Q?MEOkNdIVwkTPHYynqUOE51s4wTvtHxWWT/N/wio/iy3LytaGBekMnOHUInu5?=
 =?us-ascii?Q?NJU41CZ9sIJidHmzjaSK1Gh30sPeY3dUT5wImmz1P9bSAc41eyg/HgutMNeG?=
 =?us-ascii?Q?VAjOFroCcySbfLCXWrhjkU5kQ3xZyVuf0xF88udW0byW/vrjkYj6JloKz3rs?=
 =?us-ascii?Q?euZcME8p2qQIA3svaxlxENpkU5mvjfC6b2IccjzYrpt6gaK2efwH3uT3NazE?=
 =?us-ascii?Q?y668WKJ4rt1fRxoQRmHhgQl6s92hv0qY9hTp2nNsATjLVg0NCQyP0tzMOT5y?=
 =?us-ascii?Q?sHLVt7pUACNcb/Q080B08xAu0JPeeuGMPAGZxUBVb9VkmmcqAzlWuI0wPGtS?=
 =?us-ascii?Q?Fr9wCV0FbQu14uUY4L1LNmD2jaEgiWqYPB5f0xH1qwiMV3NzUcQgnNgwVrUH?=
 =?us-ascii?Q?PM3dZro=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PP11QkrC9d6uqBuHpPzYdaVuSi+k5wJG2mU2Oi9VflKyuhdAHgwNyl5N+a8i?=
 =?us-ascii?Q?ZSJJ6Oh2q3ip160tVsnolx2FRlapJp6819kO5bHIEdaORzVu03G9g2eYecdx?=
 =?us-ascii?Q?jN7JKExoAh8JHKpv6iKJkwrY+qIocTHIfl/Zw7YuYWck8dklIUEjaWoy/0e2?=
 =?us-ascii?Q?M9lBsoQK9/JjAMU7vAfip/scuEr/xOi3hwEIUQ1ciPt0TMGWMKdvBIEygKwk?=
 =?us-ascii?Q?ZNs4jXdrfO9R2mmE4nFabDZC9tU31sIReV2shGRReyqNiKe2MFE2jKQ+qga2?=
 =?us-ascii?Q?6/EV+8DlpJiP5oLCgtyA5ATm0oIhYQ/s2tvLbHhZ/adMyawGb3as1FahkDSI?=
 =?us-ascii?Q?NQfCpACFhRkRwt3qk7CMtvrczzy9Bfq28pxKdDaRe4sFkYs13ZNL+ZyBVrq8?=
 =?us-ascii?Q?GA0qNKIA1do8hM22htUgBbE7UJmqVssRV72En7/Cngno6hF1Nr0/ThGPbned?=
 =?us-ascii?Q?5Y21obtP0sbRqFLVkqm2NpypB3LUzO+KacOk+twRUKUxQ8ugtjsyOzbU+DUO?=
 =?us-ascii?Q?m9F3SPK7vtnhkbHAAEjZZwCbiFZeTuHKTB+3cZbxre7VJ+7zH0aD7etbjSur?=
 =?us-ascii?Q?PogbnVKJDAqHf/z4fOT6UBAzu1gwOa954cfn6hnX/3jNlkPrXuePxVWQ6CLx?=
 =?us-ascii?Q?MwVe/KWQN97/i9dFreP5KsooHrEG4t3kPSkvb7uSnpcDHYHS8yyQ1lmoWnb+?=
 =?us-ascii?Q?t5p/EmnKVErQAW4EZjGccdNzloFChGgXZXTT8Hmw3bxgRVs4AMC3YNENotZP?=
 =?us-ascii?Q?xbEAlF/Ag2hc6BcAJojelVpj8D2uQ7DAyopGSJ4/v+4VKY97PDY27IC+xsZ3?=
 =?us-ascii?Q?CuU12XwFK3NQcF66v5Vov7lr/djwD9MdDU07l4To+p3EU6Om36t6qmIoZOgh?=
 =?us-ascii?Q?Xj2n3Jst/q5mx8i3C6qQ63nLCj6RjOY0jLTe2YFsMPjTGUZNkpf/v8272XSg?=
 =?us-ascii?Q?SyrEzMlt38HnbIZw6IoLgipOoBM6HccsDahVYYgjyTteD9E0u3PftXuQWw8T?=
 =?us-ascii?Q?dpSmAL0dZYxRMYpjO1wUHIfvlAN4i0uu8aV7InGFiZoQNqUdXbCQol9ONdRm?=
 =?us-ascii?Q?vBDlb1rWVkGdRIEj/AuwV1Dxi316GHepEwYLzphUzN3/995ZPr6bgEnr7xAF?=
 =?us-ascii?Q?TZOpTt5QNw1qli7qMV+Uq8fN7PUS+TFwZB2WAflJd4jHrNvsjEuNuQYY3gCa?=
 =?us-ascii?Q?XfznpEubybceBOsSCgmYyhMfosbdPF13xFf/pu4RkjgayPWFXGng5LY5uS8F?=
 =?us-ascii?Q?TYzo9eKVeZqVle8UGq/yZ4yKc3xCz5TZa+NKOvlXnGXyCB1Vayh3b/wnYntI?=
 =?us-ascii?Q?Md4Jxngf4t1grucrLn88ypnHZI3cwpmoZZqTqUHh2o/O8KhCk5vCRIKSAMgA?=
 =?us-ascii?Q?ueFLHMdoG/6HfoUlrk6CuxOHiJmW/VQpQenZBU9H97afBFfxHy9+mNntHzoT?=
 =?us-ascii?Q?6WETwyEzJe8DmS+70XId9TAl31JQU1bXyY2UC/Jwu3SWMe1cJgAC9OoDhGqv?=
 =?us-ascii?Q?0vBO75SWOr9wXqBFZnLVCZ7pzT6pnu82DlUI19WQRGt4yXgqsH+ZkDXeLF5v?=
 =?us-ascii?Q?b14qF5hhWU94vCX6zZ6ZzYQ7RWrIJ65AsUnkJ6co?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca9962b-bfae-4237-480e-08dcf352345e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 11:02:37.1050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CIh2DVZqDPDr8OunF4IlsQMlCYIifafAD2I4WuByqlkAeJHiQpBGFSY7amM4H1tDrkSBtVmMIgOZIL1RVFT/WIf6AVoFqtD92viuzheIHB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Anirban, Sk <sk.anirban@intel.com>
> Sent: Wednesday, October 23, 2024 4:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: GSSE Core KMD Power Telemetry India
> <gsse.core.kmd.power.telemetry.india@intel.com>; Anirban, Sk
> <sk.anirban@intel.com>
> Subject: [i-g-t,v5,1/2] tests/intel/xe_pm_residency: Add GT coarse power =
gating
> validation
>=20
> From: Sk Anirban <sk.anirban@intel.com>
>=20
> Implement test cpg-basic to validate coarse power gating status after S3 =
cycle.
 why only S3 cycle , why don't we have s2idle cycle test ?
Thanks,
Anshuman
> Add test cpg-gt-toggle to check if GT coarse power gating is up when forc=
ewake is
> acquired and down when released.
>=20
> v2: Address cosmetic review comments (Riana)
>     Fix suspend state (Riana)
>     Add exit handler for test cpg-gt-toggle (Riana)
>=20
> v3: Address cosmetic review comments (Riana)
>     Fix commit message & test name (Konieczny)
>=20
> v4: Address cosmetic review comments (Riana)
>=20
> v5: Remove unnecessary openings and assertions of gt directories (Riana)
>=20
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 80 +++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c index
> 772fe9b57..d4b26b231 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -63,6 +63,12 @@ enum test_type {
>   * SUBTEST: toggle-gt-c6
>   * Description: toggles GT C states by acquiring/releasing forcewake,
>   *		also validates power consumed by GPU in GT C6 is lesser than
> that of GT C0.
> + *
> + * SUBTEST: cpg-basic
> + * Description: Validate GT coarse power gating status with S3 cycle.
> + *
> + * SUBTEST: cpg-gt-toggle
> + * Description: Toggle GT coarse power gating states by acquiring/releas=
ing
> forcewake.
>   */
>  IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>=20
> @@ -317,6 +323,69 @@ static void toggle_gt_c6(int fd, int n)
>  			     "Power consumed in GT C6 should be lower than GT
> C0\n");  }
>=20
> +static void cpg_enabled(int fd, int gt) {
> +	const char *render_power_gating =3D "Render Power Gating Enabled: ";
> +	const char *media_power_gating =3D "Media Power Gating Enabled: ";
> +	char str[512], path[PATH_MAX], *render_substr, *media_substr;
> +
> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
> +	igt_debugfs_read(fd, path, str);
> +
> +	render_substr =3D strstr(str, render_power_gating);
> +	if (render_substr)
> +		igt_assert_f(strncmp(render_substr +
> strlen(render_power_gating), "yes", 3) =3D=3D 0,
> +			     "Render Power Gating should be enabled");
> +
> +	media_substr =3D strstr(str, media_power_gating);
> +	if (media_substr)
> +		igt_assert_f(strncmp(media_substr +
> strlen(media_power_gating), "yes", 3) =3D=3D 0,
> +			     "Media Power Gating should be enabled"); }
> +
> +static void powergate_status(int fd, int gt, const char
> +*expected_status) {
> +	const char *power_gate_status =3D "Power Gate Status: ";
> +	char str[512], path[PATH_MAX], *status_substr;
> +
> +	snprintf(path, sizeof(path), "gt%d/powergate_info", gt);
> +	igt_debugfs_read(fd, path, str);
> +
> +	status_substr =3D strstr(str, power_gate_status);
> +	while (status_substr) {
> +		igt_assert_f((strncmp(status_substr + strlen(power_gate_status),
> expected_status,
> +				      strlen(expected_status)) =3D=3D 0),
> +			      "Power Gate Status Should be %s\n %s\n",
> expected_status, str);
> +		status_substr =3D strstr(status_substr + strlen(power_gate_status),
> +				       power_gate_status);
> +	}
> +}
> +
> +static void cpg_basic(int fd, int gt)
> +{
> +	cpg_enabled(fd, gt);
> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
> SUSPEND_TEST_NONE);
> +	cpg_enabled(fd, gt);
> +}
> +
> +static void cpg_gt_toggle(int fd)
> +{
> +	int gt;
> +
> +	fw_handle =3D igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +
> +	xe_for_each_gt(fd, gt) {
> +		cpg_enabled(fd, gt);
> +		powergate_status(fd, gt, "up");
> +	}
> +
> +	close(fw_handle);
> +	sleep(1);
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "down");
> +}
> +
>  igt_main
>  {
>  	uint32_t d3cold_allowed;
> @@ -380,6 +449,17 @@ igt_main
>  		toggle_gt_c6(fd, NUM_REPS);
>  	}
>=20
> +	igt_describe("Validate Coarse power gating status with S3 cycle");
> +	igt_subtest("cpg-basic")
> +		xe_for_each_gt(fd, gt)
> +			cpg_basic(fd, gt);
> +
> +	igt_describe("Toggle GT coarse power gating states by managing
> forcewake");
> +	igt_subtest("cpg-gt-toggle") {
> +		igt_install_exit_handler(close_fw_handle);
> +		cpg_gt_toggle(fd);
> +	}
> +
>  	igt_fixture {
>  		close(fd);
>  	}
> --
> 2.34.1

