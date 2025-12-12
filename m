Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A7FD4415D
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEB510E59C;
	Fri, 12 Dec 2025 09:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyG558JT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAC310E59C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531939; x=1797067939;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T/fupz6YzvzlZ/RwPDvTILo8RniPzOgV8f/yGDBWXDQ=;
 b=lyG558JTV56lVqKe6ZsJsfprng1wTHSKrl+gPsKn0yxIYXEsW/SimeT2
 NuqR+tRQDC1DCQfq5pge7vJugJ3WmjizsU1SPQ25A8jrkHBmfLA9ZNQGs
 FB6TeYWRZjKo89JHVhQXU/G9IVopY9QOKqfSVl7xrfK7D3jM7UuSrT6w0
 v0avzGeq+bVsdNy2yHpjjaV6GBoUnbARNrCwZY31gIje8GKQ8qrbsX5v/
 XT2YzFstVxX0i/YV4oObsgLq6T4D20MtfaF4mnSAjQOPXB639/P8OHuK1
 tQgLR2Z1eseFu+qXdsovcQZGiEJjyGCac1c0XTJueMvKfVUeDSDqWStN/ w==;
X-CSE-ConnectionGUID: ibJUp9ByRr+ET4LXu3J80Q==
X-CSE-MsgGUID: /lDF0KJnSk6Y8/YZ5bQLpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67260883"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67260883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:32:19 -0800
X-CSE-ConnectionGUID: Mgx66HL/SDaKP2rkJpR0/w==
X-CSE-MsgGUID: 4a7pKRBkQVWBPLBTsw+KMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197027253"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:32:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:32:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:32:18 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:32:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUdgADmwN+K5sLixZ3mFTBQhUdvhQnoX/Xnt7sVyvCiRvn6TjvUt+XdjSjpZVHSB9tV9bLqUjmobMX+ghNg2rkrXjwe2frQJMP5LDHr2kEMZZXkOZE80+ZuFdRChQKCPfsUVjIAXgDRVQrQ6fVowYZ8DT4N8xGkTSH7/7XPUlv5BHrvqo1k/22J/4l86GSFQoZzpTpXO+8u7LjBV8QKSvUo3B/fk3goyJJWd51tIC6hLgn6k+rdTsy0iNny37g/2eZbrbDgLsbcrYzhiBtUR4vecZ4kpsP+dK+guWLv9B2MSDoVsZAdE/LIGukLCW5PBn2XVoEoV617PtqI9NXoxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv4Wor+OB2cwhW2zlctYO8sU459yvtoW7+PECQbcFy0=;
 b=ICCwmuJKDaX4A33g3LvwJ34MgsCTj98qmNb/+JRXrJyz3daYo+jByhNG2LKtI3kP/m6uCeZBZ9RPpA5+lKyMd1IvZoxcp3K1NmO4bs5OHCDKblHqxoawQTNQHDBKm21DZfcqvB2YaLUorbVsevT/kudGuigX7++xhr6BZs8vg9qis7zi7Ewlt13O1yIW+xQEFdYy9f7KrHDAQku1VHAJsI64bFnLVg42JCSWIBV/6X0icMHzXHqnrv7njbe56yVeWFJvUb3z6JQaw9YmNyEjfh4eW2El9kjGMxuXRYO+NrNo/IWdz7YtQminApsiBa3ZKwJ1x0yDGPo98LRG6JDrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM4PR11MB6261.namprd11.prod.outlook.com (2603:10b6:8:a8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 09:32:10 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 09:32:10 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/i915_module_load: take out
 reload-with-fault-injection test
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/i915_module_load: take out
 reload-with-fault-injection test
Thread-Index: AQHcWJhXkYjfDTd1O0GOCGDhuV1cE7Ud4x4w
Date: Fri, 12 Dec 2025 09:32:10 +0000
Message-ID: <DM4PR11MB63127DF8B720F205A22CF7A790AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251118143301.510707-1-juhapekka.heikkila@gmail.com>
 <20251118143301.510707-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20251118143301.510707-3-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM4PR11MB6261:EE_
x-ms-office365-filtering-correlation-id: fe606b57-98de-4296-fd7e-08de39615376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?2wkzfRDouvMCtZDwCMVhVysH2OBSI0WnZVuvU+fC3jLTavE9rV3wv6Zx79Ke?=
 =?us-ascii?Q?bmv8eeuWwmZ3f3x8A3nHxD6c3IgQk+xvgZw00UTEsD+r/QDxD9PeGv5NGl4o?=
 =?us-ascii?Q?LquELO82reZSVHLW1iS7mlMQeK0rHItMYSO1+JIWhAxzquCsyv7WjBh3flbf?=
 =?us-ascii?Q?Ew6qBKdNgBUqFceT+0FuMEr5UmFEoIt/XNP3npP5fqLLdoztIiDTAC9g+wzJ?=
 =?us-ascii?Q?mG2ki5OfOATKm7jrO/fb5+E2irIGkylM8Gs9qZX+jn90hvE4nEpe+gYmV0xn?=
 =?us-ascii?Q?NcCH4CKFrYPRX7hUBWka/aSazX1D1ScFH8pQYtkVQ+QQAy//fcxzZthKG/dH?=
 =?us-ascii?Q?ntnj/1e1DiD9ytiLSJ6dI3V80sDfxidJRVkBSoo9JtwSn+2enDzqC/2/FfOC?=
 =?us-ascii?Q?acRKbBnzaq8/9QL8Lbj5ykhTcdU/7846OX9+dmoJtpxE9cmQVdA/VAfYwbrI?=
 =?us-ascii?Q?kvcwlhTwBnmQ6XrUFlkYiej017fQLAJ8KJW/ssNBkF69eH0j88DX2LtEivnr?=
 =?us-ascii?Q?ni2OpN/h4i1T/ZlPbm35iVOFOhJAAtmum+IEeMkMlJgurr5mz9N7hlpiUMoF?=
 =?us-ascii?Q?5bs3vhW4YsK/wMmd9hoVsHYUpcIPxutNL6SdYMPByktqTmOaJs3oK3zZaWh1?=
 =?us-ascii?Q?4Jwnd0mTpNH0ABYK3SHruntKmwTUD0KwYpl7xXkT3By+ghE1BR8ngDSLVhn5?=
 =?us-ascii?Q?puFOsqw6mFXYXwG2y5e9XDPdElIgAY95p4vVRJRJMKU1oEVg4XBXF/p0D8pT?=
 =?us-ascii?Q?BdUCGEEiawytTdPE+HT8sYPa3XJi7mQW6tyYWyvDEZFF38nz80ni3vuHGsia?=
 =?us-ascii?Q?gyw2sHKrK//sYzPgVHDoPmFRJLP1PnGDlldDbvf/l/AXj4vJEKMFXmm8Bxb2?=
 =?us-ascii?Q?wkRrb/ASTtUYAJ0r9D6hlmCG0wYXBOmdIxC/TmIiDd1ZjGoxZ7OTVhB+1lSc?=
 =?us-ascii?Q?8PdzQhT8jDVZThWJetJ0FYKgVz7mSnwaNIfnatRAowU1vR1juJmT5zFWSMRk?=
 =?us-ascii?Q?3wVLYv2dq63YSkcQWhmr3Gu0lYQuVCo4G1HipacoUs0AiKqqSHt4vKM0W4A5?=
 =?us-ascii?Q?7+f6AoCxyJF4oIvuFfMXh5Czd0yDyltXs7LQKKnRLFUSGETCLxy4/TLwcOgB?=
 =?us-ascii?Q?V6u8/9fXCbV/prnJLFOAgceXCA+Zde6dp+LPVMScvh6Z4zgELcDP0FrqlnJH?=
 =?us-ascii?Q?kjjSqS0hZv4c45h+HNrAdFpaJeAwZrodo+pyU4ou6SUFctkiHjnfXZtJyiGF?=
 =?us-ascii?Q?X9sI48LHQskZk9MOgwevEBglLGar6E7rtAGOIk8RIPkmg30rjWPrTlKTQyat?=
 =?us-ascii?Q?dk3786OlOSyW2WTOiZPFydTkhMy2O731MyTh04YzZaPZ3UofcZR+XMh8JH6c?=
 =?us-ascii?Q?5PXlMqelga8h0mdBTu6Zm8ovkSgjh+9cZzwBHqk9yBVN9YHQMmhx7xgUbIr6?=
 =?us-ascii?Q?SFlzU2L0iUrXz8IioiKTAW9SVy443ReYSg1oXE483NNZSd1Q9mVJ8vDoOAfa?=
 =?us-ascii?Q?AXWauxh1LFoFchdn/gdCvEGQkm6AnslJ7ZFJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q9jSbstkCCop5+PlgW1Tkby/b/tsCHDSrzTNTxAoz2xMUpQ56cEam0YBTzT+?=
 =?us-ascii?Q?9cZeKdLbMRfZlZaaK90nICSyrSrRJrTL/kFFcEC1y83ljK4ToO2to0YciPG7?=
 =?us-ascii?Q?sc3s4T8H+vHFZy28Fermnc+GKC5yAXx2IpjN+pO8IYtaLARnLV01rnINE7bo?=
 =?us-ascii?Q?Yre3pVH3Vbc6RftWIvWBxWCygWYJ8JZPxMBL49aka72BRtbtFI6WFDRMfaaz?=
 =?us-ascii?Q?w5MGL05ue2SCC+frK8H6tMarbYJc9U96iRYmNAUTgSM41gBUY65ZgInhQdcY?=
 =?us-ascii?Q?QCKzz8rxtYSwhvK87BvMuuxBWMdEAOQgqvfdxezGQY3w/UfOWzssCjTGJo/L?=
 =?us-ascii?Q?7b2RFNwRhyVX2HJiypnr3avaZ/MbyMOQkJ5VMNZwsykzuMBLWTp5XovbbmU1?=
 =?us-ascii?Q?2EuL+bhcLo9kfcSzor/3nsGe7Vd3lS5VFCChyvNogWOd3a7Wwbd6xEv5vlBq?=
 =?us-ascii?Q?3OMVUC55idxdjUjewmHkW5phYuU8GIWQIrXDCsz3GsxFhCO8xwOr0PmGe0Au?=
 =?us-ascii?Q?NU6Dng4z+4StqGskHenZKCxx8D+K/OKg8aoA89xWzp9vldKg6XCqmdGO8M/9?=
 =?us-ascii?Q?A1BGwbyH/h/ib5lBV1IXebSzPg4YaKaI2TIIzdeMpiAztuHfDMWRgsrJTZK4?=
 =?us-ascii?Q?pDW4gCtjwyg3qxiqKpInVSs+hOVFShTxuA6c2NOTXgP166nfWmFcf0lEchuW?=
 =?us-ascii?Q?mSE3+vDXjcNggV6b9suCbeSxQRO1O4T3dHFMvaw7VCp/JwpX6pgooLwfo7Wa?=
 =?us-ascii?Q?vyw8krPtf7BMZeYMBC96gw1gLknAkaEpn04QYOD05mdzdrJWfcUpsedmtJEH?=
 =?us-ascii?Q?Fwod2a3Ekma0X7IuGUIw+BjdI5NOH++ahU22beXUuQ/Lk/CS7zxaSG+OAt9o?=
 =?us-ascii?Q?Er4SYFsMjuBO/Vho6F3R/+vitUtjaIVdC7WMCfMAnzCoDV+LojOuMfHk0Qzt?=
 =?us-ascii?Q?7OoNfqIepLBqYSULvf5pCfOtxYBfQre2gSTuRGwee57vWCkiEwWgiYKNZwxc?=
 =?us-ascii?Q?hGXnqJoWwL2/YCURIj7hmg8hamUnszzTPj3DqxVaP4GUXTWROqt1dOjaxLb/?=
 =?us-ascii?Q?XiILbKdFCBaRZiutwy7PiOHW83VJs4ATdnxgg0rS91KX7k28p6TgIHoN6pI+?=
 =?us-ascii?Q?Kib+hDX8GMOhaVAoNOzam5iLLkUhtQYMy/lRrAcE6gSw8GOKDhUKCMjfAsKc?=
 =?us-ascii?Q?em8BxBwx7ODYo2xIujBI0xV0OXvxfWEWjzpTWUkpTLcQN+Hc3HpVbmtHLv6T?=
 =?us-ascii?Q?Cz5dQF6rmcWPaqnH1uS/4cSmJLTT/yAbNKIkrSf6R2zhEhnMYwwN/2Pl4SwL?=
 =?us-ascii?Q?X1rqw2BZDeOTv8IFu4vYqTie2zTVBH3xryH0gIyicYaNovzs60GOQXXM0uw3?=
 =?us-ascii?Q?0Q+bFB+fbXxOvBZ24APUTvCvnUIuijrLendy7nSrv3LsqJC98B942HqBSCdx?=
 =?us-ascii?Q?H/1MEPVUSoT9uo2W+fBbbA/kb/+gu+NP1aR5POmZe6Y+pL7me6maY2f+x762?=
 =?us-ascii?Q?VpkWaj7EY1DFqaoGcsi88AxBda4HqHrf/fkB7oZ2R2Fg2eYSEG6canNfbO+z?=
 =?us-ascii?Q?rAti2QTm2g7gCTsQk7E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe606b57-98de-4296-fd7e-08de39615376
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:32:10.8014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFEDOHYDkqpYvvFYKqHH7AE2CLUSSFgTpfZv18hO1ckDtpQ33rrwo7UTkgqHNutK2jnD8k6Ju2z/JvJ1cP4tgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6261
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-P=
ekka
> Heikkila
> Sent: Tuesday, November 18, 2025 8:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/i915_module_load: take out reload-=
with-
> fault-injection test
>=20
> i915 fault injection mechanism is replaced with kernel generic fault inje=
ct
> mechanishm hence take reload-with-fault-injection test out as it would ju=
st skip.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/i915_module_load.c | 83 ----------------------------------
>  1 file changed, 83 deletions(-)
>=20
> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_loa=
d.c
> index c23b6cd30..6bdd1d8ba 100644
> --- a/tests/intel/i915_module_load.c
> +++ b/tests/intel/i915_module_load.c
> @@ -48,10 +48,6 @@
>   * Description: Verify that i915 driver can be successfully loaded with =
disabled
> display.
>   * Feature: core, sriov-core
>   *
> - * SUBTEST: reload-with-fault-injection
> - * Description: Verify that i915 driver can be successfully reloaded at =
least once
> with fault injection.
> - * Feature: core, sriov-core
> - *
>   * SUBTEST: resize-bar
>   * Description: Check whether lmem bar size can be resized to only suppo=
rted
> sizes.
>   */
> @@ -194,14 +190,6 @@ static void store_all(int i915)
>  		igt_assert_eq_u32(engines[i], i);
>  }
>=20
> -static int open_parameters(const char *module_name) -{
> -	char path[256];
> -
> -	snprintf(path, sizeof(path), "/sys/module/%s/parameters",
> module_name);
> -	return open(path, O_RDONLY);
> -}
> -
>  static void unload_or_die(const char *module_name)  {
>  	int err, loop;
> @@ -224,40 +212,6 @@ static void unload_or_die(const char *module_name)
>  		       module_name, err, loop);
>  }
>=20
> -static void must_unload(int sig)
> -{
> -	unload_or_die("i915");
> -}
> -
> -static int
> -inject_fault(const char *module_name, const char *opt, int fault) -{
> -	char buf[1024];
> -	int dir;
> -
> -	igt_assert_lt(0, fault);
> -	snprintf(buf, sizeof(buf), "%s=3D%d", opt, fault);
> -
> -	if (igt_kmod_load(module_name, buf)) {
> -		igt_warn("Failed to load module '%s' with options '%s'\n",
> -			 module_name, buf);
> -		return 1;
> -	}
> -
> -	dir =3D open_parameters(module_name);
> -	igt_sysfs_scanf(dir, opt, "%d", &fault);
> -	close(dir);
> -
> -	igt_debug("Loaded '%s %s', result=3D%d\n", module_name, buf, fault);
> -
> -	if (strcmp(module_name, "i915")) /* XXX better ideas! */
> -		igt_kmod_unload(module_name);
> -	else
> -		igt_i915_driver_unload();
> -
> -	return fault;
> -}
> -
>  static void gem_sanitycheck(void)
>  {
>  	struct drm_i915_gem_busy args =3D {};
> @@ -680,43 +634,6 @@ igt_main
>  		igt_i915_driver_unload();
>  	}
>=20
> -	igt_describe("Verify that i915 driver can be successfully reloaded at l=
east
> once"
> -		     " with fault injection.");
> -	igt_subtest("reload-with-fault-injection") {
> -		const char *param;
> -		int i;
> -
> -		igt_i915_driver_unload();
> -
> -		/*
> -		 * inject_fault() leaves the module unloaded, but if that fails
> -		 * we must abort the run. Otherwise, we leave a dangerous
> -		 * modparam affecting all subsequent tests causing bizarre
> -		 * failures.
> -		 */
> -		igt_install_exit_handler(must_unload);
> -
> -		i =3D 0;
> -		param =3D getenv("IGT_SRANDOM");
> -		if (param)
> -			i =3D atoi(param);
> -		if (!i)
> -			i =3D time(NULL);
> -		igt_info("Using IGT_SRANDOM=3D%d for randomised faults\n", i);
> -		srandom(i);
> -
> -		param =3D "inject_probe_failure";
> -		if (!igt_kmod_has_param("i915", param))
> -			param =3D "inject_load_failure";
> -		igt_require(igt_kmod_has_param("i915", param));
> -
> -		i =3D 1;
> -		while (inject_fault("i915", param, i) =3D=3D 0)
> -			i +=3D 1 + random() % 17;
> -
> -		unload_or_die("i915");
> -	}
> -
>  	igt_describe("Test i915 fault injection");
>  	igt_subtest_with_dynamic_f("fault-injection")
>  		test_fault_injection();
> --
> 2.43.0

