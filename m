Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6355ECD484E
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22BF10E277;
	Tue, 12 May 2026 06:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzHbjjDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9310E277
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778567755; x=1810103755;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gdijHy98+Qa5Ml2XvM6dDKLi8h3tGoGPJZ59Erpwtog=;
 b=HzHbjjDdZ3saEHeyNq4Sh8DYIJb+Xw9deSH8FZgPuPelqeRzcO7bIvn5
 wGEP0rKz+z1rHjH6zrzDDf53hwUsltmwoBbiwe5IEnN93qp/2ID5xAeJn
 /rUXmd0TGhx1Xhct5Ug9J5YJpsse+V6f+UdSYe30+5LoQGvttCW6Mlb/l
 Pu/tb82YphXv1rtxcd1+dcYS5zWS63yPCdDYDaIO/LPqlyC8JMxSDldF+
 JW3yWjSXjcT/7eXlmy1io4TQ3hOVVT0hDdRho5ULIvUZCYkL7Of4Y6WOv
 5j8/SAd8arvtSgpEFrnEyPUYvnpSvqAEJol3GCPVMeCQxHRiOq4Dq37Jl Q==;
X-CSE-ConnectionGUID: V4UzXZaKTUKXUIpNUtxW2Q==
X-CSE-MsgGUID: R2wDAn6wRFCxTTjE3xmmVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102133906"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="102133906"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:35:54 -0700
X-CSE-ConnectionGUID: UBUIA1++RpODEiLGe3OWTQ==
X-CSE-MsgGUID: gzASlCcORcKz4H/0Mx0bmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261171253"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:35:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:35:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 23:35:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:35:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4niQSQfW+Xw+ww0TB7JGKYzgnEyAnkzb+eJ2TwY46lMQC5Ond/6RePYuNN/Skoj4HTUKrYISOGMNQaPtUSuVYUFL2n/ld7rduyq+eJijrF5GBydsaBMS8pclRB4TOiDVeMGDs51jPAtkKyp38jEpHmxPLStZ9aJ4PVfAq60E+Ym6VkTaDzg+i8VTsMCRotceRUz3CKxAJDNj3HJRNtpU0w4MQLV1V5AkCDVXiZt5XhhrBF0i9nin8dy5gW+U/FvgTf0cC16tf33mypWd/CUeDi3NTHNholW45870uippkVgs+D/HoBT8EVX2hdMvznqWTKGoCG03uK8gLmbGt1FvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85DnDaeIB+W9+kbGpvzCrHsycXeXAZaeXy67Blyyn94=;
 b=nm6CFmrOQ+I0jIMYwgzCyM6hkV3oKSss0ecdoUtNymi3JO5dXWPRDHmUUgrPwJm7kLTCKOSjQkLODRjsJdfW1Td/wlP8qM5FJdxIndJbgQPTlSRIHRET4Sn8FGL9qGnuE0PM/LqYljk+q2T6aqOh73UmQo1nHrypZlHp1+5aEZ/z2hg02Z7utZGHN8vkO4ADrXgs3wwWr9VmgvJkn/sAo5UX0KUWeiUsG6XHYRarBsIoBdnaKoMb142Ul1GRSs2FKWp24W0Co2QinQK1RSm3GDFLgZqybd8g5BR2PaadAra+Wq3LN6dCoGa0B0/dcF3QAWUcsxrHYjgFa6972tEq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by CH3PR11MB8382.namprd11.prod.outlook.com (2603:10b6:610:173::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 06:35:50 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7114:e8c2:4d34:2901%5]) with mapi id 15.20.9870.023; Tue, 12 May 2026
 06:35:50 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Summers,
 Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH i-g-t] lib/intel_pat: skip UC compression when FlatCCS
 unavailable
Thread-Topic: [PATCH i-g-t] lib/intel_pat: skip UC compression when FlatCCS
 unavailable
Thread-Index: AQHc4cB35B12PrUg3US1ji+KxNvAuLYJ6rdw
Date: Tue, 12 May 2026 06:35:50 +0000
Message-ID: <SN7PR11MB7489384627DA071B785B625285392@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20260512033504.3665416-1-nishit.sharma@intel.com>
In-Reply-To: <20260512033504.3665416-1-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|CH3PR11MB8382:EE_
x-ms-office365-filtering-correlation-id: 3ab8a435-d5be-4001-af81-08deaff0b56c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: +6QgyeQOPyrWYOdnQ/EJgv4M4ZmDQGpg5avuy7ayIBmS9ytdO/z8jOiL8uQwk2nd4lDeonvH1lP+LpslkjX2jNnz/PuFeQcEDFnZWjW/qRnAVMSWP7JaTFD17SRoRcgmDhjhYtbvdiJQ9c3cP3jqbvagE009diE/1Z1GLoUAhvINLx2YeJkjUVLysv1NZYZ/qOX4lnDOKQJ7ngw+8n2ESXnhgNlGQdtO2GXK/+2WdsVsJ43g7vAdBEKNygyIG77AlZzTT9ofn8ww05BIy4nahnhaAFNxZfzYjc5edEhBKc7QevjjpTvX3p+aXb9LJVL84V5QEOWftOV0/OcgXsCIZhl0bxjI3vjZuwj9hU3/7LrGUlQi8D/SyR6BKz+ZAo8SsFyW50M7zsTdMTO3YIGU7AzObG3ou4Ayafo2BHUnLwH22r3CqMXfIdDv1TOp/guo7Es5nLv9WRkwMw26yfardsLglu4zEMJKAhAWbFk24JMRYVBsZkF1x7s/xHMOKPZhXM8gNaUeptCAMb/gH1gjlGVxQSjQG9Ot+9yWNSR2qH18knzoy3ae+gbWzBcxqN5QRPUjT08KJ2MXL3w2mqsQzWsilmfSXShtb08aR7jzNYyEG+gIkqH1gfqGliG7D35aTL50AqgqH5tuO2gZOLNbAzfhNCdb6TVdr8lgu2T11qTukhd7h/i277WmUuNvRXjbCW52xqz3FpD4x2QqebX0n1XShCwHYN/9ATCFYKhuMFP93bIM1RXovpU/Ba7qJ1r7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h8GQMW0x1IgasVSdNFxaKpdPre2cIQTglGOcDXx0n1V3P7gNX2W/2bAOYEuC?=
 =?us-ascii?Q?p86d95uwZsFJ5Lbs5pqMgLyhU6H6K9n6EFfp4+89riEODW7dT2U+bRu16CKg?=
 =?us-ascii?Q?NDD2KP32SKh9uvI5OOg001BNQfDhA0qPLlvMNqS43myJmyYAlj8J05pczc/K?=
 =?us-ascii?Q?RR/KP2q4H/f2JALTqSh/6grX7Z7kGUkcF/XDMXRMF9wQBCLfuVuvrhwTlY8i?=
 =?us-ascii?Q?e3Cmg6XFmN/PmE7+50DyoMpo8DxQAmjdGI8xn5eCzx8Iqao6jq3OFpPZRx1T?=
 =?us-ascii?Q?pg8m1Q7RYuESvCagYSDCqH7jF4aQN7mq0Pw5zk5zzOqurCOkdXN+KGXNDR/X?=
 =?us-ascii?Q?wZH6c5qfkXkzy8B8L6WIEk2BgbcoyBZtlECfynIcs2KxwI6tXTpH0M0bZ/2l?=
 =?us-ascii?Q?eSjvlYX8avdyc4Auo7P0r+vVfho52tq6AyRcQLgFu9AK/L/9XbUmNwmhIMRh?=
 =?us-ascii?Q?ggr3W2Ai1HrbQ/p4OJCB15QRuVEYj3bXlETHKsX/cZysHQa8xUpcKntCdHtU?=
 =?us-ascii?Q?nHWeEsdcGyNeAwmv4ks/1/0szt2xP+SZuZqOlH962jpxynSzsWGWcobJBWvN?=
 =?us-ascii?Q?/yx5Z8TJd3ypBxdHpR205DUXVh4RPpA+sMf73EA0jyAO3W2kHSmO6Fh+Takh?=
 =?us-ascii?Q?6roN6A4qoDPmhqm9pXr2iWYheJPn3y+kRW6ZbWh4df4me0CEAqvhqikBLwtG?=
 =?us-ascii?Q?FW3heUrwpgegb2TWaKF99v6h/U6Hf9YtmxIoEdVoV0sZmdtnhgKTTLcR0Irm?=
 =?us-ascii?Q?hUXfM0LlJs8Rq6wRxYRFbOQoWu6LdK0V+LYZuplDgAytzj6Zv5uJVxiqRzpJ?=
 =?us-ascii?Q?bFEKiHsGxqyblZGgHFHjSVTs6p69ZVZZaql9yfwW9pFnHFhLMzcDauGkka0N?=
 =?us-ascii?Q?BiXx6TNqaVVZdzRwPf1+24v5/ytk8Lot0ydXTKyY4VnL6DHxQ9JqG4iOwZM9?=
 =?us-ascii?Q?zjCR17LRIBSPIebdgpjp1EB1xZtfLNjo1Ovqy6XAxPxN4C7CiujKcgpmzAdx?=
 =?us-ascii?Q?8rCos5BpnS9AmFcz20YlUol2M/aZIgl11QEOdyJBGgde8cgXszDL9ySlwlXj?=
 =?us-ascii?Q?UH846hgmmtp7R5dLa8b4Rk+3hZEKwKhXMBWJ59i82x1Fx8OagSA0Pjla6e5l?=
 =?us-ascii?Q?I4amRwLiTtd8T/0gkWSN7m5ytEdY21MQcXAxtQn4nwPLKc7i5EGwx1NH9XRt?=
 =?us-ascii?Q?nVbkhtBcgD+NNAXAVvxQ9o1OMUcBVwkZQXDIjuuu73M1UmkfI1zxava30y1y?=
 =?us-ascii?Q?0gl8ctVdlZGO1YpgpAPwh4XtCNbdD2o1YSti83atrFfGR9I6wn8Stf+iCng3?=
 =?us-ascii?Q?co7ETl++MG3ka9g078pN7afSxmzdNYuidQK9vp1ztB2NJDRYy0R8IfncV/q1?=
 =?us-ascii?Q?OZX435ttvxdcZM/OYFg0yQnaBORjrACDcSSGEZVfO9C+ssnGo7B0zD/rmKBH?=
 =?us-ascii?Q?pp58NeMXqTNdeTeX4HjWe30YUPRSWnxgB/hn5yY2ef+jx9jZjDf3OGb9GTt2?=
 =?us-ascii?Q?Uik/dT8JDvyYKU8Na9WBucqcljHXpKI+IG0w3MVQii9w1Q30LZSSPylGrs4j?=
 =?us-ascii?Q?1xNBlVXoDxGvAVrSz19sVCEZRaLBF60aO4+Jxwl+oGCRdwwSKmJsMGxaR7FJ?=
 =?us-ascii?Q?JK8FBhYr3ms7DSp2XZqMsvqykFZA8r0LL9fgEM7ZsACfWKQXIqntsLv/mN29?=
 =?us-ascii?Q?miFsdFyPBI+JGDRh+AF6Tv4NTV/PjboUDwkuVSCSifKQ/LRPGRWGwN7EHL3d?=
 =?us-ascii?Q?n6taghqV7w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: geBVmuCJ6M5tnRPhz29+mRYgHe1Y8XtxYstxG0QT5qDysJgbK36FM9XupbOARayLwTyoJJZIDiNMCUHZVN65kSULIvhdOm0LtbYhlPnr6csJHKaWITmbQgIaIvV5cwYU3sZl+OC8Z8rnTPgkc4gPb/s6DvXYmFzLzKxDHJuloslHSsWrU3T1Jf0AFdK/zO4robu1LnGT6bTWyx+avhOsFborCDAyha8sRWm0hAVQxmEpO4KlBEo1Cp7MfCdYZ77HWkEG7OpbgejGYHlY61H2IzwDFkhSRkGHrXM0tUkC1fnIKWOkI3vLBz9cdmnMk0VqzQLWXBlWih3MXbMnvGIJmQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab8a435-d5be-4001-af81-08deaff0b56c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 06:35:50.3598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JZcRHdQQZhwvFSHSM6lRawQ0JvNGFMg34zqKliEQEjGTfZHIcu3XvTO6vsK9ok5munrFZlB4XbI4lPnbnFWrU+6QM54cRLG09Lt09LYGTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8382
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nishit.sharma@intel.com
> Sent: 12 May 2026 09:05
> To: igt-dev@lists.freedesktop.org; Summers, Stuart
> <stuart.summers@intel.com>
> Subject: [PATCH i-g-t] lib/intel_pat: skip UC compression when FlatCCS
> unavailable
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Use igt_require in place of igt_assert to avoid treating unsupported plat=
form
> conditions as test errors in CI. Since UC compression is supported only o=
n
> FlatCCS platforms, skip the test on platforms without FlatCCS.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_pat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c index 2f35bb772..bcf31b4b2=
 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -276,7 +276,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd)
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
>=20
>  	igt_assert(intel_gen(dev_id) >=3D 20);
> -	igt_assert(HAS_FLATCCS(dev_id));
> +	igt_require_f(HAS_FLATCCS(dev_id), "FlatCCS not available on
> platform,
> +skipping");

igt_require_f automatically skips test when FlatCCS is not available  , do =
we need to mention "skipping" specifically inside the condition ?

Rest , LGTM
Thanks=20
Nakshtra=20
>=20
>  	intel_get_pat_idx(fd, &pat);
>  	igt_assert_f(pat.uc_comp !=3D XE_PAT_IDX_INVALID,
> --
> 2.43.0

