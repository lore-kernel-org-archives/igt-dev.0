Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE82CCF9EA
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 08:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9ED10E413;
	Mon, 27 Oct 2025 08:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyZVwhEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257FA10E40D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761555078; x=1793091078;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UWKSfozlqdo49cCHn5PIyHW+iFTDZylTTrMsxDAw0Ug=;
 b=TyZVwhEkV7AWUK1id06HQ4ez48Soz9Dh6Nljv1Azt8SAWkPuXtSfrZwi
 m9DvigpdX2egDi4f2RZU9nSPe3iB4xRi+zzRGF29G3K25XIVyYZVwmnj0
 oSqWDeCYbYESJ35vwO82c2t260Zwvx0Lr+BBpVaSSGO8T8+MzfHxEwSmp
 mIJEcfylM5CRZWsmsEUAvDlZIVMULJNhizyD0r+IydzgkrwJm3wsNzntd
 aQqYGkOp1AFh/Hysu0vY/G9nTAMjW/lAT+cqOTuORVvQEiRwg8+OwgNvF
 1SvHdwnmNy2vLzpvmlTolUo2K4orFZoHFn/pQ3Qt+pDo/SMpeScLz1o5B w==;
X-CSE-ConnectionGUID: GlRsukQCR7KZd4djCqtzAA==
X-CSE-MsgGUID: 4fiTEeS6QQeoe3GOUKhjOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67463845"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67463845"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:49:50 -0700
X-CSE-ConnectionGUID: 7f+ncBDURq6JLcPGgemVdA==
X-CSE-MsgGUID: 7GKWtqF5R225muUw2a1LDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="222198222"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:49:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 01:49:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 01:49:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 01:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yoyo6Vc3AvhqFSh6GDj4y/yKNHmh1PSrb/tLyeedg9pIWjNBFR61jWIAB0Zm71DXn479Cq0dk2D6OQFuN5185W9ylzfqljxpK66CiRpOc1ucaIoHexaEcuIyh+gNoSXtWRWA769/iYYdqYeL4AjrUtnRfC/bjsdd1WvBnH0Ldeja9iSigiO3XxrWasfU2Nwt2BZCLUjz/eYxSpvbmKdSLL4/EGdxwt7+t/+vycLnJYqr03xi8VVGTXIjV/KEj1L6bxAhZ1L9fwYxhpjKmTFwJ0s7bzNcdTUtOcqt/64iklRUlfBIFVxG5bK1PEI8kiCF7I5Uf/evEyHKPya/lXOOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELtwraaIPOGR6oBh9xgXgBV7VT25B3aTRGPLVgbnVLM=;
 b=WHKPs+IpP+Ttu2DdO7vzIuEfIwVu0BUv2pEV3qIdetYdtximJRdflvQnB64iumQ6sBMjADelJ8FGCysmTREBpnsCwK/jhgdIdm5ruq1zFdZBUOaEISRv35vSK8fr8aVikUnt+QwTRjfmo5do61fJ//KwMdvfPdG5eoKDpgRZzxl+wtJ1fkNGCUc1lri0LmTldzRzONmT5uJFsX/E8kqd4e099xb1lJZvWLpPqm2yTKXrU11Fk/d0GpijKlkqdiNb2F0w3U/RIOeECik8d9AFWMJyXIZF349af0uv9KxkdTGTX7pX5EfPtCdi1AzqWM042GMflZ9xo4EV0Q3Q//e46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:49:46 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:49:46 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_atomic_transition: Reduce iterations on
 simulation
Thread-Topic: [PATCH i-g-t] tests/kms_atomic_transition: Reduce iterations on
 simulation
Thread-Index: AQHcRwrhuauIlfeQtE2ijtBN98k+V7TVqh1g
Date: Mon, 27 Oct 2025 08:49:46 +0000
Message-ID: <PH7PR11MB6796D81D24594057853EC8F5E5FCA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251027063527.607053-1-pranay.samala@intel.com>
In-Reply-To: <20251027063527.607053-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SJ0PR11MB5104:EE_
x-ms-office365-filtering-correlation-id: 9880aeb9-1f9a-4f24-9bb2-08de1535c817
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8ZWXMfCqyfLtiYSYmm0wdUZq8/01wrF7Dv+r2eGQbxjV2t6WZolzAEsGZinS?=
 =?us-ascii?Q?Y6xwKU3pfE6wbQxfgJYqSdzwaxpmL+lX2n/lHIjPzhk5bbN+BIBZu9GCf8Db?=
 =?us-ascii?Q?YDLXloAa8zUpjq3Fl2/x/MAm34NpSZAakpze0U+d1yF7DIeZ4cDTg0mIJ33p?=
 =?us-ascii?Q?EgpyvMz2rbOPIkAwS5/vhiIAk+c2ozwsi2tBj+ACSv79UnBYTF8u8qLV/EI6?=
 =?us-ascii?Q?BTbp06zkR1oJjMcUE25Zt90qBOOrvHW6hwHZG8lmbs3X4HGpFLCJ/qxaKfmm?=
 =?us-ascii?Q?W/kMfNw16S9CZr/61tl/K0c5Pa2swXvOtlH4h8T46Un1nQqR8InEUgzNspcc?=
 =?us-ascii?Q?xmfkMcHMNRurk76GMor2CY6p/8JX5k8eGwWX6Dc1NfRKUbVEbmR43Gin4snx?=
 =?us-ascii?Q?vfeGSnPJycT4bcRYfiywySsxiV5awOYF9aIimTDBsjXXFr1ip40Rdn4VkVzc?=
 =?us-ascii?Q?jRT13V1sht6T+N33tNgjzRmmMv4gFZhb2QgEMl7SulgkeBvSXRpwqYXpVGRS?=
 =?us-ascii?Q?8eSOpUiOsm7cnzlkVO7sYJZBjLz+9jkUTYq3UyKi6eawiYTCTOqqYfFBCW4R?=
 =?us-ascii?Q?YYxN6WIXrRTzI2gWZOuDog215QMYImDiGbtzO4ArY6Voxf+Cxro9lfzhVX3Z?=
 =?us-ascii?Q?seakaDmxPMTJY3bF94r6FKWw+eBlzGO1qI3lq2f0Q5rPd1bGcVl5/eLjfoPi?=
 =?us-ascii?Q?XFCvwNo0bITlvmPL8pkubCS237qzFd07JOivxwMDTCb5QrTikrdderD1yxcW?=
 =?us-ascii?Q?352+OQvf3nz02Mrtxv8Rh+ewWbJfQ8kKYr50IAjOrdFxbxiluntzuOW41IXJ?=
 =?us-ascii?Q?DSlXwfxrWeKu0pwyWpL5z2iV7Rf++hfMH7j2LA9QzoNRxnZTlYPfJ8+M3nED?=
 =?us-ascii?Q?zJa1iDbNOEqE1ohLwInBfOrEHUhnCyqK9KWz13JAxeZK1fmMtND1vkB291cQ?=
 =?us-ascii?Q?HfLIWEsig306FbHXtRnOIZpJWhzMUkZ5y2Xh7DYLH9TBFdGRcFMlFCZMuVzL?=
 =?us-ascii?Q?RyRPoP3WlpnNoB1CAuQ1vshfC3HbmQ80ofyxumvLzg9fOP7oyEETdMQJKwr1?=
 =?us-ascii?Q?k2Lf0n9PCbIEjyx7iLPbuYfRrNym/FVdQQk7dxTEfVy/h6hJckAD+6SmnoqB?=
 =?us-ascii?Q?GMvBm7JCriv/pRAstSWTH8uqDR5rkfX/G4cG0dR7XWCpCxOK+tHvncAQRUWF?=
 =?us-ascii?Q?eLV/2ehP2orKsTu/bVlxBcJkMGDcbouGXyqMTpcMBRXwJpdq6OEOvjybWv6Z?=
 =?us-ascii?Q?2gxoDH5mKEaH0b7b6DB3jWex56oB8CC+L7Bj86VlyFejNByTV1GVSGHPVHcD?=
 =?us-ascii?Q?P5fon0ngxetcAHJ6igorBoKnhAes9YvbTbyA/rLZYbtJOBGpCcKWZXEduExB?=
 =?us-ascii?Q?hvxl00DhNaGF0G/C9yeYMn7WlzqKL0lcLixKEjWcWUG98Xo16hBDAFo/AA4z?=
 =?us-ascii?Q?fhSIVCa7VxDEHM6xZur9tITuLHA7QTVEzisUXz3cxrDeysq5i0bZTqtvyTos?=
 =?us-ascii?Q?6cKzU+h+QhKamewGaRNcIsk336HLbQdVBja6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/t87tPvz17UmBGae5yiCBxfms2TC37x7lvUJkqAoV1Duy/b5luD8EjpSf3qM?=
 =?us-ascii?Q?XCVm2ASg5Q8v0eKcFu3XjJXRQLCeI8OwGgIO+6QkFBEO2L9Pr5ua/6tdxdnb?=
 =?us-ascii?Q?hZbEQ/m4/5DRCd//apFqpT3D4v/qGfLJ5OxVgJNNiWjQk7qUkht7mJ873McO?=
 =?us-ascii?Q?ZkHfgROLudTG/NdvPiBi4+HqQ4pWd3bs8pSVWmiCB75elCqNX9lxEj3bTKqr?=
 =?us-ascii?Q?XqfRUj6Cvj82dqEhcv/mw6rwhQz2VxVGn3QiN5b4sswR7cU1VVRlkD6lrq7N?=
 =?us-ascii?Q?ocECu4SnCTLrLkFLLeCbxz3XOv0kSR9H0bK6v2sWHmipm1qB7a+LkdxTH0h+?=
 =?us-ascii?Q?ZpD/Hfl6rFYaJnrwD6PTFZ0bgCFbWCJ+aO0bBZz735K4jMMNwBo2/xHvFdwT?=
 =?us-ascii?Q?eoFNZsh42pbpQiMa4S6xwxYqRhFaATZXS4sXx+qyAHnuzoSyLOIzBim7koud?=
 =?us-ascii?Q?uXHEzwRMaUovPdCi1honYnI8ULW4uEf1CBoHJI3Uu3kz8st16ryV192dckVE?=
 =?us-ascii?Q?+H11+hkk9CYETmbgKOWhdWJksojqIGHYrdXAQtR3QWF3glZlXk0LnpORmu1z?=
 =?us-ascii?Q?aYur9ezLgT+Ty+nImHdfECutNjNVziGa/peT0beb2xmJ2IRGK15ucp07aG7K?=
 =?us-ascii?Q?hsNMdSyeVZHpo3qBsT6k0csZN5by0Mbec/4tusm4yoN2UKoK7gk0JL+usTE5?=
 =?us-ascii?Q?qaQn4YsAJCTJpJsuTabNzr7ZTBr6QGfio8JzQMDf8Z3hmlVNTWoM22e52hIn?=
 =?us-ascii?Q?a4/SdkuIOXxhk8Z9WTunfnB+k/clveXjLNjiRlf/5wdB3mewP5E3+QFaQqke?=
 =?us-ascii?Q?Ddx5jJhL3VzmwlodOCpEsFCXtF6yqW7t/w8JrzbMDIPOvd0Q4PTSu7+XdNEh?=
 =?us-ascii?Q?jbyB557ogl39HUmEXA2/kWfZncdUuTh/DWYO4crTNLTFMcQ4c2uQk9AN1voC?=
 =?us-ascii?Q?71+rH8+U9GDPV8Mu1YPIP/BdsetwgD/gECMUnLomnHFe/QEkwx32XfPfmxv3?=
 =?us-ascii?Q?L5Iz38bWpNhT+SayxZTS9j1nBKyA7K7C6asg/wQRDSkBrRSZJWAN74VhGMBp?=
 =?us-ascii?Q?UusHf5D/9ZIKSrDilKfrH1IIEdiqNHmxHrSs6b4n3W3XPLc2uEuYLbXPi0cc?=
 =?us-ascii?Q?O33U0MtV2R7QowsAzj+6Jvmc/fuh5U3b4jGMUDojjyOWmXq7OqDyyc5xhhr8?=
 =?us-ascii?Q?m/4rKwhFyDOF4Vnw8G87UjTSswVYVVGvsNH4KUWuIRrfEDlVCtborBQ/gc8t?=
 =?us-ascii?Q?1I8+R8uYG8pbQqZx+w6lEZxsIotLcXxmF/BlNLBNWzkHebWImyQHXkvXKCTI?=
 =?us-ascii?Q?3X28GkNKMwvDEBTlHLI92WI9eFOpFLKaDkv18ha1DoQq/vhqOj4k2i3rB4KE?=
 =?us-ascii?Q?hP4+ODmQcG64j3+6RvjLVK5HEMUZ6HcEdJZNU8/xEIEp6VNovnWExWYDzJ7Y?=
 =?us-ascii?Q?MmCHGgdP4BupWLZ5Yy/LL2CmfZOebMlC6eltYEK0OrjnZheS+rElk8ZjJLWx?=
 =?us-ascii?Q?krgNrTt+WpbUvN+DPSlm4iGhOYB/D2b1+XUCYsYLEb3cX9+1furottdiqDfZ?=
 =?us-ascii?Q?v4nDs3tttCsiGctMu8t/Y4JO0LowzEGgUdToIfxH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9880aeb9-1f9a-4f24-9bb2-08de1535c817
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 08:49:46.7420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDmZOuoK+siMbOXzcare+nAOLGT6qkbtRGys9+aeNJRr+Y1p4NvoA/KREG6jXx9ulLXyVh4YsNyGypk6D8JqxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: 27 October 2025 12:05
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/kms_atomic_transition: Reduce iterations on
> simulation
>=20
> Reduce pipe state combination iterations during modeset transitions test =
in
> simulation environment to reduce test execution time to avoid timeout in
> simulation.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_atomic_transition.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.=
c
> index a13830965..e1387bd89 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -961,7 +961,7 @@ retry:
>  	iter_max =3D (j > 0) ? (j << 1) : 1;
>=20
>  	if (igt_run_in_simulation() && iter_max > 1)
> -		iter_max =3D iter_max >> 1;
> +		iter_max =3D iter_max >> 2;
>=20
>  	if (igt_display_try_commit_atomic(&data->display,
>  				DRM_MODE_ATOMIC_TEST_ONLY |
> --
> 2.34.1

