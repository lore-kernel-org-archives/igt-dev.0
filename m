Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45276C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 21:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABD510E07E;
	Wed, 15 May 2024 21:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYfGspJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577EB10E07E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715806955; x=1747342955;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n1a02W9Bc7o7Z/OQ3KTbBB8/cRn+WHqUTn6BLI3gCS4=;
 b=IYfGspJDXPBkd+2DXIPM0PPTDbpPusLcKpnWdUe6h9FHj8lAsiXS/Awn
 tQitMsu1QmYMclwK/oNEDxXCiRAlygumRytEMgjzmQBDTe++asHfR8rG4
 x4lWR2QinaB/C5mw4TsgqopbkGU+c6HaakLaMpQ6SnHjNPPSLJ6UQDgZo
 m0kxUTwztMxanedjVdByiltKsxHN24VJh9xZwDTqGPIMpBFOc4e/iwCI1
 FEXXun3KfRWyfMLOR0+zzFF6Q0/4X//F+hhpYEssJzzej1tj732aJTeQp
 UnEYhzRFOh2ZiLHJ1FvO1PN0dtutMGSL60a9Fxga0FQib9osp+mFcrjcB g==;
X-CSE-ConnectionGUID: zNnbNO7TTfWRfAKVQSjNNQ==
X-CSE-MsgGUID: wIsghjlAR3CC0XfQt3xFLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23286932"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="23286932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:02:35 -0700
X-CSE-ConnectionGUID: 9lKTTpr4TmyBdrgI9fTSyw==
X-CSE-MsgGUID: kUSOeKZTQFqE54/w+FpX9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31191434"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 14:02:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:02:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 14:02:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 14:02:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 14:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkW9Gq2lAcYkFWDfEz14jueqU1yoP7Qut1FuXKo95fqdkRigezdFIk5U+C8s+bExtMkSljhJaqmbPTaPXB6WoxprHcyCDTUE12QjKxVGIbImakpD+jYgTWItKFprxwSgWecNAOIgnvB6O5PvevuDPa4lfknvNit8a5f8ErB5J8598ck3ZS/5kEveWcQ2LzqK3csVFz2k4aqf4BV2VyOIEHntPIJ34+524Q7shPMX6j7uo+gKcLkVLZ6MNmYhmy1nBqu9d/znTerhhP5O9YjII/vzC7I7ozEDqnuw4aX/o4HCW5atXXCtS350Kwt6898mPloctJdIKQmD8SDmfoeFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS6YfO6LgtlkrNTz+Et+ERW7m2+aTnFwPaI/daV4NvM=;
 b=NaRVs5EOXNNNuXV5uIOcaG4xI6Aux9Cr0u6QOT7ZHBGrNAeSv9yyo+Rvaf2Geei1hIYMlgN71xIjEa3Hyw0IygFt7xBVQKaOpFY87F9fy5A6tlF9/qTlPfW/gMqUSdoLawX9cD+YPAN7udCpjGZHv/12Yy14xCH5kmGInbXbtjRDipPodmRSARPJ+dBiw0HAFPd/0R9jObQ64uVuUcuwXK8ZuMEGRtlOSPWsmJILlWLtHBjP920hGjXz0E7ysGwBNNnGb2kkQPrgtLF65oUQB+C8+OO3ohoSTzsTWxCFiffKduMN66j/EYAlWSdBTQq0exK6BgZGCr9OQrYC3Cp1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 21:02:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 21:02:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
Thread-Topic: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
Thread-Index: AQHaptruwMN4lJbnq0K5E0rbjvl9QLGYpJPwgAAj6IA=
Date: Wed, 15 May 2024 21:02:31 +0000
Message-ID: <CH0PR11MB54441EEE98A083D0FD5551B0E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515151555.70885-1-rodrigo.vivi@intel.com>
 <CH0PR11MB544480EDA81225D9EE94C822E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB544480EDA81225D9EE94C822E5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8441:EE_
x-ms-office365-filtering-correlation-id: 2e82c751-90a8-489a-3ad2-08dc7522564e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?u3UfMad1MNTX8ZVVLO+1TQjV+UPv7qFwJgW3lIAIMMl6eK75I+1jQ4Mg5oWp?=
 =?us-ascii?Q?EJWpvtchDLUzxaBjBIv4mv744FliQO82XLxgEtUQmVJbto+Ao7PwEOx8xTPj?=
 =?us-ascii?Q?lFEOP6dy4POAe5kxcQHVNkuOAloY77JCxBpxOTWrTKuY9N6zxrCu05uKcgQy?=
 =?us-ascii?Q?z5pC7+pHHNcZPsW+WqXTCDe+wfOcLL8kevVin4vdA45u9AyxCbykhR1a4Dbd?=
 =?us-ascii?Q?RNO/uFSM86a4THb1W9/v1qSQBDQcfzaDtwNaI7Um/o0TuE3RN4ELjiZOTBNs?=
 =?us-ascii?Q?B2kFCx7/1datEMzKJuEKKptg0GMoVMOvHsdWT2kbP+cLfY9AaAZoss1kxWbF?=
 =?us-ascii?Q?VMTQaVhkGr+8l1TpWDYx1YVu+B04r3RDrFmZmGHG0m9bACB/LmOTcGDkoaPT?=
 =?us-ascii?Q?tfLwGwkbd1zGHEgSY2vu8u27zCOqAJ2ZUsnWyaD6zmMkOX+01BNnhOFArRpF?=
 =?us-ascii?Q?+Kigi7464ZQ1qP3HEFqhxP5KJi48PyaHcR50oIJuJS2E1+hcJP/T8HjgrjfY?=
 =?us-ascii?Q?J86/f9YlEad5IcjYgth5U2a9EUjsHvaak89w6qZM53WnDwzMcKaJlJSFRE47?=
 =?us-ascii?Q?pnSo6cgPGLPO2XMqeduBwRisDNGEqtYEs6GOPK2hTLoTgv3a/A64ezlvXCc7?=
 =?us-ascii?Q?qFLwL9Mnp9iBAeB4xYrd7qlOMyZzEEB0dyauinw/EYBpeOuZ5IeE3qSdtsa1?=
 =?us-ascii?Q?3WsJtcxc3vCEmcl2cjmfPajrcPtJd7d4OAyrEb88C0SzH4taPqYqP/oOutGn?=
 =?us-ascii?Q?rlK44iMVgj5lScqNT2xV9EaJgagcl6uxxMD7Owtgt4ChDHYHrv7ouagGOfNH?=
 =?us-ascii?Q?zZCiM1LRsDEUUeOo8xV8JoaI3vNADQKhNjkGIU8dG6yVAaUzcmWpEplkVNXV?=
 =?us-ascii?Q?ApDc/IUTxxEVmn66B0sElSAQh+SAyjPZMf+NXlKXbb4Pb0caKrLSw6/nG6ao?=
 =?us-ascii?Q?s+RpnTWiu92Q8xEnpOvv0ZcL3dQ8H8HU5AS3gBMTiiZyVijIGtdRC5uXMJCI?=
 =?us-ascii?Q?FLMrh7zrBWpGvoEfOLm13heTUsxQfhl+80kYR3flwpd9bEG/fS3t5CoJ4w3p?=
 =?us-ascii?Q?UjeFTaUonBgLhOBgP+ytdoo6ub+SjJZ0YEDKw4HWSwYs+mZVmxdHTN1VbEyA?=
 =?us-ascii?Q?2SypeeSY8s+rFWG9zgQqG5CLHjmMCHjp7spLf+uqwDCEfdkbjWLxDI3YzT38?=
 =?us-ascii?Q?lHxd2MYvMSw2ZAPIjMB2+2XBTp0zANfUV84ue5UcuakbPNzsyY6HqmOB0Ypm?=
 =?us-ascii?Q?OBp3HEkbIIga82fDsm3H1hnVKlMnwKCMKjjaH81btaePdsMZ/Cjcq+P2qWRh?=
 =?us-ascii?Q?Gjb8vmAAgIazlH/B3Vuif2XC3fsWsX8erlhp66UL9C+a5A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1BpagJEG9szfbJEpKYcQBciQkBX6ZzzNZP7RUyIa1Tkaqs+IGfFiT/itw5Sw?=
 =?us-ascii?Q?woZdeACPK/wZBm5ggZCeHN5cwTpV5QHfoTsvvm+dWVeifpKS/dLm0aS+4rDp?=
 =?us-ascii?Q?7w+NSzRMEJAbYWGvXf9PygqHa3xpmsFb2x5tetNsxq6tm+xlgbKeQrbDefBM?=
 =?us-ascii?Q?6Dzca25mv1Qud3AGDowCZ48xNYzgV40aRspCih/Nbhd45P8ocIEcPWCDGqom?=
 =?us-ascii?Q?wKqWcX2jaeazmqleoHpYVa3ojrMz9iGL3C4EeUj/IZ1o7PPh/pkcskGJFN+I?=
 =?us-ascii?Q?0+nxZP1CufkGkYdMVnKpCcVBLCCv9FgkgGHTOLcHzSRXz7ERMbvulU4CRFMM?=
 =?us-ascii?Q?k839CVqiOJdfbD8i+RfnKbfE5juZyqPfbG6fbvwW1uFdPZSVJHfyvTAofMHF?=
 =?us-ascii?Q?+tO9v1bzz7fy464nzWbwMX5cNpnwcaoCO0SNwo/7MMAGWjAhQPKeEDgeU4sZ?=
 =?us-ascii?Q?pcD5RQLy0jObRHUKU6btNB9YsfYLfVwOYg26LRrSV4i56TpRNElxcFxNHH+L?=
 =?us-ascii?Q?Q0vne2tobfZ8Wrp9xFxtVneV5H6KFbzgpTH3KiGsmRH+FQpOElidekX/5XSl?=
 =?us-ascii?Q?Fu5fjgm9ZizW9prk9dKw21K7o7itnuoXgvLQsiDi5rIZ7VDUgB3lbbt1P233?=
 =?us-ascii?Q?uw0BbR7Wmo4xvKPyOcqZMxKJMOLoQ3ziCdPBIPAxqLDBKUW0NjKbuKL+GGks?=
 =?us-ascii?Q?yOpMdFvygY66pkw5IavdnWktaQqo1aY2jq+uLMFSU+dal8JyaC4I0WI4ltcE?=
 =?us-ascii?Q?rGw3MK/YyyZTS0mWneC27vL4dQO3XKhERC9WSqg+AgWgf4ubcmk+neGsQGnN?=
 =?us-ascii?Q?4/h5tH0NEGZ8tjOvOSXYF7bXughkMZAK8oTLnxqC8u0HMHzIjOHuM/9t0BSs?=
 =?us-ascii?Q?4gzFycQdjQ0F+FR4+5deSb8eT+qtn69Oda8Rki+qbOGhOw7tHKsb3gFse1or?=
 =?us-ascii?Q?gLbomoe58EbWbenIekhDUxVrCoUfzPCFL55oDFRhiuR8DT2gWu/2IR0jebli?=
 =?us-ascii?Q?nAj8ytnAm+dBo1N5GjcohAFZwiQ7ViOYiu61CuXQTy7zW37OOtwEb5zjVkCG?=
 =?us-ascii?Q?8Kk+qc9Vwh2d3dsCfGdry9+6tLfrKzxm0ipXrNxVie728jGBhsuKAGRqKUC6?=
 =?us-ascii?Q?NZhtXbOZiEry8XLqcZ9xl65GVAfVGrCDpXGkgxExFwnIqpNuvCQ2w7PI/E5D?=
 =?us-ascii?Q?HPWb24oVH77f7NiVys7vBjjzs2xglpXft8zhca1hRYtS8amspb6HMCzm6wNP?=
 =?us-ascii?Q?Q4WrwtUOJK6dSJ3hBF+60KoZETx+0R6YnlV94ohihE0EtVmUcBa6QVbBYfq0?=
 =?us-ascii?Q?aVEQacB2C19FXd6FtjFKmjLomOlaUHL/+kv/d6O35QsMFMJ1yMWmD879uNeq?=
 =?us-ascii?Q?kgqkrQBqzJKHH3IxEQoT8NhEltE5pybLYqfediU+sKSIzBE6DLTMY+L0uIN+?=
 =?us-ascii?Q?DZHySSxa/Xy5JMNMrtzZAonVilF9DydymXn/MBwzxraBd0FP1v1zEJfKwQ6n?=
 =?us-ascii?Q?svlOMk1G9RHmySMBZ6WXZRwhl8QZxC6+hkOJ1gYDL9Y7X/2A1FMnBKUlaGQb?=
 =?us-ascii?Q?TXHiPf0guRb1Yo+7D7+2LvrqKLErzLQH5DIeXRbj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e82c751-90a8-489a-3ad2-08dc7522564e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 21:02:31.6982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1IZSI3sIGtqEjcRQ8hM6AT8VFDye/zgM+t0ZsLINAcSeNmfMgyfKJVWbAaiSUi7wTjdjp/pKGqq2Z7C0ypmxf03AmLZkV3iTSftiPRa2bI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
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

-----Original Message-----
From: Cavitt, Jonathan=20
Sent: Wednesday, May 15, 2024 12:08 PM
To: Rodrigo Vivi <rodrigo.vivi@intel.com>; igt-dev@lists.freedesktop.org; C=
avitt, Jonathan <jonathan.cavitt@intel.com>
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas <lucas.demarch=
i@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exi=
t
>=20
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
> Sent: Wednesday, May 15, 2024 8:16 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas <lucas.demar=
chi@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
> >=20
> > If the tests failed before the rebind, the device will be
> > left in the wedged mode state, blocking subsequent tests.
> >=20
> > Do an extra rebind before exiting to ensure everything is clean.
> >=20
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  tests/intel/xe_wedged.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index b9bd49fad..cff91077c 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -276,6 +276,10 @@ igt_main
> >  			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
> >  			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
> >  		}
> > +
> > +		/* Tests might have failed, force a rebind before exiting */
> > +		fd =3D rebind_xe(fd);
>=20
> It might be better to only perform the rebind if the test fails,
> but on a cursory inspection, it seems doing so would require
> a rather serious change to how we monitor the assertions for
> the tests.
>=20
> There's no harm in forcing a rebind on test end either way,
> so this change is fine as-is IMO:
> Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

On further consideration
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> -Jonathan Cavitt
>=20
> > +
> >  		drm_close_driver(fd);
> >  	}
> >  }
> > --=20
> > 2.44.0
> >=20
> >=20
>=20
