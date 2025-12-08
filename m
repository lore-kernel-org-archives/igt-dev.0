Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751A0D3ABEF
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 05:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDFD10E091;
	Mon,  8 Dec 2025 05:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgfqdF8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91B910E091
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 05:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765171872; x=1796707872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YvSuHkBN2+tDm9jq7D2cxXhDHxrrF/Tw+/B0Hn0yXKc=;
 b=YgfqdF8QYD/VcnQN9SYuVxEaxMbtHm4CA0NdFf8sHDpRtLbznOo7YzUo
 sl8E0zNN5VqPgXF6l8/OnNiHB+IUkNnh4k+4R+AMhm6PgT3Rq+UbmsP6A
 cCDOtp3ibJ2HMT+F9ZyFXFN1u4mOh4XnnuCK9wZZoMA1Vu+cehOxtqp1J
 HmJc6tZ/WqiAgvrtGEGl3oW5SHFHeY4d2fgFli6SSItUsLGENnW6Z6DAv
 ZumG7z1o0eT3modZkOaZFbbcqhKioIovv9zpVzcQOalxXcwzdfRZe7Wmn
 tNSD7c0OIRBhgvftwE3VzBISr7YtCrdcQz/NKwPw/ysHc9E5WJbuWl9GR w==;
X-CSE-ConnectionGUID: qGYo3q9nRxqwlnaKGfBkcA==
X-CSE-MsgGUID: tFXGkuVyROS96g+MZQDx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67004710"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67004710"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 21:31:12 -0800
X-CSE-ConnectionGUID: TrUaDRXgReWKmS0LOzzN/w==
X-CSE-MsgGUID: iEPD9jZ7Sb6P2ks1qEReXQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 21:31:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 21:31:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 21:31:11 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 21:31:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjaOLbfi9+bIa1kl2k8VhKObDJZgzMejo+x0cjSN3ApMvSnNLPxBZ4cgEy8RhqLObW+fAGYAwQKnK2D3DDIS0FnvZy5fLExAm8zZVBL/WwsLQBhAZU9rchHUSnqRmXqrGglV/ixV18nDa9ZrVehWaPxWfnNVev67Xy77KJzzJQYZpAWfAqrvsKX31tpT7CoVJ0aDR0yRhP9NmlKxTy3MQEspPA6OR3MxRdIP5X/IgbZ3tSbhhgsr0WJDpeumb99O3AABCmwEFy4Mcnl8W6d+eygpUlnNKe/XXL103TYXHEQVn+bB8BFGQk8Zy5rctnrlfRLaDITHMG/k7cBnoKfiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=603mCn2FwB+TIiMWL/Va+96LROt1Lwpd1YSxtHSlApk=;
 b=xfJcuwao+Ibq2dNtMkkzsDQHtWgWMWhP3ayArXlS07tcOr7hqfPtFnXlWnfuofS0OjyYaxqRgVgFOgP65m/7Kx7p6FkK9B7PH6EGc8BdckAdRDDoqBZvQn9r2O48/XM1uMpeXXbMgicxU2iVy1DAg/Q0rtg3WtfA5arXbKNWNUwOv807TsLvZVCaPt22WAuPs/OyCSDKMt9hwmB0WS2wQ6voU4Fx+3iwUMHwGxlEqd6dpqpEc1YX5Lu7Fc3uc/yLzX0DINxiINiGgzmSwZTLzmvFRDesGs+2QEpnEP3o7VD6JijO39fNcnCvp27Wdp2DLDcyZnel2ZC1w4eTOFy1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS4PPF8B2A2E830.namprd11.prod.outlook.com (2603:10b6:f:fc02::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 05:31:08 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 05:31:08 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 2/2] RFC: chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
Thread-Topic: [PATCH i-g-t 2/2] RFC: chamelium/kms_chamelium_hpd: use helper
 function for connector lookup in DP/HDMI/VGA tests
Thread-Index: AQHcZbtmEh8tbx4UpUGRWSjqNCof7LUXO4dw
Date: Mon, 8 Dec 2025 05:31:08 +0000
Message-ID: <DM4PR11MB6312FBD61ADE0D6B26DDEF1C90A2A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251205074602.658783-1-mohammed.bilal@intel.com>
 <20251205074602.658783-3-mohammed.bilal@intel.com>
In-Reply-To: <20251205074602.658783-3-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS4PPF8B2A2E830:EE_
x-ms-office365-filtering-correlation-id: e0bec8e6-09e6-42e2-d6ae-08de361afdab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qWKU0FrynUGJKHKXcfV9mLgDYBrvBOBxObYLkMSgcIZgL4VDIUphZboOigb3?=
 =?us-ascii?Q?wed/+gQjBDU+G+XXIUWX13y/98dk9j+cikzmDoNnIbhY3/pGQslaW+912twg?=
 =?us-ascii?Q?B7L4wyMrnY4MIofugFXH2SJ7AbVf8TlFoo/bWGjyaNIuM/9u0T7fIjDWRS7f?=
 =?us-ascii?Q?cnvh1mfu9ytBkVbwzJtkEOKqpxDNdPPP2aMMgbOAr6ATVftpLrTH/Xhl1xVZ?=
 =?us-ascii?Q?oo9FumPzh+EV0bkxsq4/+TnI8YE03IotukvIAAC2FNmCs5gffF7RG/soZLN6?=
 =?us-ascii?Q?sSJsu4kf450m5xWasn+p8nxwNhZHnVb9ynBMZMeE8lO9QEFS4IoXazjV7gup?=
 =?us-ascii?Q?10IsvxZ07Ml84B5yCZ9dEsIS9BoBAZgOrX0ecz7ulOAqnJZorWpdzTxHTK24?=
 =?us-ascii?Q?ihwIabYq6xKUUi5rhekyYVnqN/EjJtKAZlwJLXRQIRF7LBB/zwX8SLQTW6Uv?=
 =?us-ascii?Q?TiRVenPz7nKrvwrYR8TT43qMzMNgRkPW/sLilayoaxaze/4IJWVwO/gZHEUT?=
 =?us-ascii?Q?sqA+Dh1YB5p8j+wQRzm5WUcFV8xettWDMaKNXyA852/2P8wAcmtIC8ZP9jTp?=
 =?us-ascii?Q?+D3VJwhM8GYXmnkCXbF4tnSJZURFv+5Ex+akR6ikmdcijto3AxCP+lefKDHW?=
 =?us-ascii?Q?c2S2bnqUv8s2mtv0xyGauv3dHACrGwxF8aZJWdJCwgJpov1Sj9MKyYdjGpWP?=
 =?us-ascii?Q?bybh543L+DQXVkXRE6ZaMELaQrZ9yjmZoQRBQwXRJL2m5ZbgxtD+POv0b2OC?=
 =?us-ascii?Q?SyG0zZHwv3YU0vXESLI1KCC0H7V8O+BpriZdDfoPUDAUE+52pJw8NBhEuibN?=
 =?us-ascii?Q?2uFsQnsqKIOzglByAqOAvp6aYWrEZkdoVGFkdem/HGThZP8X3QzMozKSG8pC?=
 =?us-ascii?Q?1EUPezXtR4ItLg9un6sTc0SBEfEvLLrJmWwafR3esuwHKQogmPs/H3jg5kKF?=
 =?us-ascii?Q?nfp0f15/OnMGCbTXnKUrdWDYzmNbmvxDoO02pM5QoQTVDCEzrCGqEIfKNXRN?=
 =?us-ascii?Q?2JLYhUvvR8kaoMpXRRQ1Q0/f/QDTTwMrpCPGQLHq/jiY0L9GpARYM7LJRflg?=
 =?us-ascii?Q?9B1C7PjxbioFxNEb8JZf0yqHQmmNwx9TO7Y38T2WKcAcqFfft8F8N/Dq+FNW?=
 =?us-ascii?Q?AagLviehdLHjVWrnOcow5XcjaYZ0UsF2EewVQTOk03d8DdxR06rmDj8ofi74?=
 =?us-ascii?Q?NEdoCRcnjBvf13y2nggj7zAropf/E0To1neIirMaIQ5WrPEcil0TQrQGOJdC?=
 =?us-ascii?Q?GRacC96PN2LHscevy/pr/aq0UXF7JpjDCWfInrO1tYbh25E+cBxTJg078+bm?=
 =?us-ascii?Q?77vM0EhpuPldcTJ0+3t6r0HJZ7oDI3IN+AeF4Imo2BCwNkdlVouceiRGGg7a?=
 =?us-ascii?Q?lAZLms4ggNgoXp7YEbNWBzrg5Nzk1+SJ6xW5i8vvs5IarZDSRghkLAgTqzjE?=
 =?us-ascii?Q?8nU4l7WueBTsTSuVzDEqToT/ZFc6To765giSHNUNTtfAdZSPJFweINbMyeqz?=
 =?us-ascii?Q?hk7epOWUaWgMtNoljR+Z3x6Iic3ahmDhnDqq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MRMEYGxQmfjbXVMd911z2bOtc9kMgc812IprN8SHLpxjZ7Ihum1VYEGDH7qT?=
 =?us-ascii?Q?PdcJV7wqvxNUWE/vq5gIYOHPXlAsLlusFQsqLKufGy6tkeKsLilfbnR5Dmiy?=
 =?us-ascii?Q?uYVgafM7JSsnuA62qyaPiIvKLUbHGSDD8gGz4DHbfhJoiEzizTdIGGSFCvIe?=
 =?us-ascii?Q?wR18PY4tksTGMWltuVNyf/EsUQe1v6cd4NFsRYF8BcIR7m0udcdetqRxin+0?=
 =?us-ascii?Q?aL707T8LIl5T7Qbm9CT4jV7GkG1rZb6TErbIduJQSRHV0/PUyGxJsUuxu7mS?=
 =?us-ascii?Q?O7pJ2Jf3snD+9Vj22ZUEd5NewZ5JSbsxtBCrZZrioWrS94NflNGMaG7FN/Ii?=
 =?us-ascii?Q?+40z3y50FeR/PzlOOK6wl7RXbpfHXE6TzwFzMYd7y6sFabKaHb+/bBScWScI?=
 =?us-ascii?Q?uo4jxAqWD/SoTy3NNf3VvmMRIO+Tl+X1s+eedbslgFLmvOSzniXJXj0OXqfW?=
 =?us-ascii?Q?nAd0z6mGYtxR+dzfo+PAkTgoXos2y1NNOS5EvRF87KSwIzjDGvVJOVAyleFC?=
 =?us-ascii?Q?tobHjEbyYz7gW+9IA1NfZUX/NU5q4R1XkJnMEZHG7+uaONcxqCWF1rBgtrJn?=
 =?us-ascii?Q?PlDGlsiSe+8pawi8bhlYLh1ego3i7DAtdi6ihZNUByg/jeMwZdRAzlGTAP4e?=
 =?us-ascii?Q?WsbPmvC2I39pBdsaWTU6Avzu8aCpmXV3cF1ycTXoFVKDpvjJ7b6wYEEL3TD1?=
 =?us-ascii?Q?NcFdLzJu/dR6xRrc9cdP4evTAktiMDa1Jm2U9k5sSXm95e5AnLfuFq9U5iHe?=
 =?us-ascii?Q?1I974Q1DEoJffgH8vaQjVOjjj65mdKXnqgAngPFMH7Us+WgRvwkHzpK7WpxD?=
 =?us-ascii?Q?Cv8ya/xU4KAwHRt0ArPSV+qwEXiZSqA4Rg0lrFUGF4iiDdyq4TqsjZyDb8Bb?=
 =?us-ascii?Q?Mksb4fTsu3uzqdG4lphfQp5AzI8SCAbJ2972MmqoOapV5h9JVynNu9QJpdIZ?=
 =?us-ascii?Q?0vVuFEJReqyrNT1PP32/IV6ikDHDIcD99ksF0tznTrnW/zX5hVDodLIm1/md?=
 =?us-ascii?Q?h8M8qe6ZtckVAG5dPfTSBsVfV3v7XfdilZr5XuMGiZVb5r0xBSAG/pK63FkQ?=
 =?us-ascii?Q?stUEFoANVpt3gbUrmtSytlZvHMimor227cNt4U0RAs4mSUj4FTfgc5Jj01HN?=
 =?us-ascii?Q?nJq6O01jXFWkuxT7OtPyoY30UjKh+NllftwX6qcGBLjtFWqgQuik9kP0XZiq?=
 =?us-ascii?Q?ISJDl4logni9EnRhBzcSIhfoWtyPVjc8hOsgospvnsSicCtiZoQu+jgg5GSZ?=
 =?us-ascii?Q?WBZX+lSre4EMEkMTxK++A1+6QDvYjtVU3Ca+NAiyhfrhxUxAUPi1D1Y7zlJ2?=
 =?us-ascii?Q?zQbpOWpZInQ9XyMNc3D9RmhsArRHgkKkVkSfk7ZmFCyZDKOZeVkcnXvxj0xX?=
 =?us-ascii?Q?0UlLh5LM3ZEcudW2psFDfiRigLe0tBWJancU5/VLLNe0hbwTZvlWBAfmjV7N?=
 =?us-ascii?Q?AqPzsJhI4I5Jro3SpCmBErcdoioyozFvKnD/a/mkvmsrsPjVVqoTTyDZZhgM?=
 =?us-ascii?Q?oxts+SqoO+m2Pp7Lc5pv8zqqP8BLhcOfQk6Gkz73K0pNfkON+8evqeRokCG2?=
 =?us-ascii?Q?fg/7ac7NAxHKsmrIRn0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bec8e6-09e6-42e2-d6ae-08de361afdab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 05:31:08.5530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w7Hl7qrMONMrhHXLXDcNpl+iT0ctcaWT/H2EnBazLL/zebmWBjN8KSUIsGOPm9cHLCf9vaFhD4S8/Z1IcxxNoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8B2A2E830
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

I agree with Sebastian, Please fix the following:=20
	* Reduce Duplication with Helper Macro
	* Cache Port Lookups
	* Fix Formatting Issues
=20
- BR
Jeevan B
> -----Original Message-----
> From: Bilal, Mohammed <mohammed.bilal@intel.com>
> Sent: Friday, December 5, 2025 1:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Joshi, Kunal1 <kunal1.joshi@intel.com=
>;
> Bilal, Mohammed <mohammed.bilal@intel.com>
> Subject: [PATCH i-g-t 2/2] RFC: chamelium/kms_chamelium_hpd: use helper
> function for connector lookup in DP/HDMI/VGA tests
>=20
> From: Mohammed Bilal <mohammed.bilal@intel.com>
>=20
> Use the new get_port() helper to retrieve the appropriate connector for e=
ach
> hotplug subtest, ensuring consistent connector handling across
> DP/HDMI/VGA tests. Also remove the per-connector igt_fixture blocks, as
> they were being executed regardless of which subtest was run. The helper-
> based approach avoids unwanted fixture execution and keeps connector
> selection simple and reliable.
>=20
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 411 +++++++++++++++++++------
> ---
>  1 file changed, 288 insertions(+), 123 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_hpd.c
> b/tests/chamelium/kms_chamelium_hpd.c
> index 3c8af63bd..840363311 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -440,7 +440,6 @@ static void
> test_hpd_storm_detect(chamelium_data_t *data,
>  	igt_hpd_storm_set_threshold(data->drm_fd, 1);
>  	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
>  	igt_assert(igt_hpd_storm_detected(data->drm_fd));
> -
>  	mon =3D igt_watch_uevents();
>  	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
>=20
> @@ -478,156 +477,327 @@ IGT_TEST_DESCRIPTION("Testing HPD with a
> Chamelium board");  igt_main  {
>  	chamelium_data_t data;
> -	struct chamelium_port *port;
> -	int p;
>=20
>  	igt_fixture {
>  		chamelium_init_test(&data);
>  	}
>=20
> -	igt_describe("DisplayPort tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports,
> DRM_MODE_CONNECTOR_DisplayPort,
> -				data.port_count, 1);
> -		}
> +igt_describe("DP tests");
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd", DisplayPort)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_OFF);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-enable-disable-mode",
> DisplayPort)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_DP_HDMI,
> TEST_MODESET_OFF);
> +	}
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("dp-hpd-with-enabled-mode",
> DisplayPort)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd-fast")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
> -			test_hotplug_for_each_pipe(&data, port);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-suspend", DisplayPort)
> -			test_suspend_resume_hpd(&data, port,
> SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_OFF);
> +	}
>=20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
> -			test_suspend_resume_hpd(&data, port,
> SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd-enable-disable-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("dp-hpd-storm", DisplayPort)
> -			test_hpd_storm_detect(&data, port,
> -
> HPD_STORM_PULSE_INTERVAL_DP);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("dp-hpd-storm-disable", DisplayPort)
> -			test_hpd_storm_disable(&data, port,
> -
> HPD_STORM_PULSE_INTERVAL_DP);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> +TEST_MODESET_ON_OFF);
>  	}
>=20
> -	igt_describe("HDMI tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports,
> DRM_MODE_CONNECTOR_HDMIA,
> -				data.port_count, 1);
> -		}
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("dp-hpd-with-enabled-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
> +
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd", HDMIA)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_DP_HDMI,
> -				     TEST_MODESET_OFF);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_ON);
> +	}
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	igt_subtest("dp-hpd-for-each-pipe")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_OFF);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-enable-disable-mode",
> HDMIA)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> +		test_hotplug_for_each_pipe(&data, hport);
> +	}
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("dp-hpd-after-suspend")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_hotplug_for_each_pipe_desc);
> -		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
> -			test_hotplug_for_each_pipe(&data, port);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
> -			test_suspend_resume_hpd(&data, port,
> SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> +		test_suspend_resume_hpd(&data, hport,
> SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	}
>=20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
> -			test_suspend_resume_hpd(&data, port,
> SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("dp-hpd-after-hibernate")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_hpd_storm_detect_desc);
> -		connector_subtest("hdmi-hpd-storm", HDMIA)
> -			test_hpd_storm_detect(&data, port,
> -
> HPD_STORM_PULSE_INTERVAL_HDMI);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_hpd_storm_disable_desc);
> -		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
> -			test_hpd_storm_disable(&data, port,
> -
> HPD_STORM_PULSE_INTERVAL_HDMI);
> +		test_suspend_resume_hpd(&data, hport,
> SUSPEND_STATE_DISK,
> +SUSPEND_TEST_DEVICES);
>  	}
>=20
> -	igt_describe("VGA tests");
> -	igt_subtest_group {
> -		igt_fixture {
> -			chamelium_require_connector_present(
> -				data.ports, DRM_MODE_CONNECTOR_VGA,
> -				data.port_count, 1);
> -		}
> +	igt_describe(test_hpd_storm_detect_desc);
> +	igt_subtest("dp-hpd-storm")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
> +
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_VGA,
> TEST_MODESET_OFF);
> +		test_hpd_storm_detect(&data, hport,
> HPD_STORM_PULSE_INTERVAL_DP);
> +	}
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	igt_subtest("dp-hpd-storm-disable")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> +DRM_MODE_CONNECTOR_DisplayPort);
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
> -			&data, port, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_OFF);
> +		if (!hport)
> +			igt_skip("DP connector not available\n");
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-enable-disable-mode", VGA)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON_OFF);
> +		test_hpd_storm_disable(&data, hport,
> HPD_STORM_PULSE_INTERVAL_DP);
> +	}
>=20
> -		igt_describe(test_basic_hotplug_desc);
> -		connector_subtest("vga-hpd-with-enabled-mode", VGA)
> -			test_hotplug(&data, port,
> HPD_TOGGLE_COUNT_FAST,
> -				     TEST_MODESET_ON);
> +igt_describe("HDMI tests");
>=20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-suspend", VGA)
> -			test_suspend_resume_hpd(&data, port,
> SUSPEND_STATE_MEM,
> -						SUSPEND_TEST_NONE);
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
>=20
> -		igt_describe(test_suspend_resume_hpd_desc);
> -		connector_subtest("vga-hpd-after-hibernate", VGA)
> -			test_suspend_resume_hpd(&data, port,
> SUSPEND_STATE_DISK,
> -						SUSPEND_TEST_DEVICES);
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
>=20
> -		igt_describe(test_hpd_without_ddc_desc);
> -		connector_subtest("vga-hpd-without-ddc", VGA)
> -			test_hpd_without_ddc(&data, port);
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_DP_HDMI,
> TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd-fast")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd-enable-disable-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_ON_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("hdmi-hpd-with-enabled-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_ON);
> +	}
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	igt_subtest("hdmi-hpd-for-each-pipe")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hotplug_for_each_pipe(&data, hport);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("hdmi-hpd-after-suspend")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport,
> SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("hdmi-hpd-after-hibernate")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport,
> SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +	}
> +
> +	igt_describe(test_hpd_storm_detect_desc);
> +	igt_subtest("hdmi-hpd-storm")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hpd_storm_detect(&data, hport,
> HPD_STORM_PULSE_INTERVAL_HDMI);
> +	}
> +
> +	igt_describe(test_hpd_storm_disable_desc);
> +	igt_subtest("hdmi-hpd-storm-disable")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_HDMIA);
> +
> +		if (!hport)
> +			igt_skip("HDMI connector not available\n");
> +
> +		test_hpd_storm_disable(&data, hport,
> HPD_STORM_PULSE_INTERVAL_HDMI);
> +	}
> +
> +igt_describe("VGA tests");
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_VGA,
> TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd-fast")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd-enable-disable-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_ON_OFF);
> +	}
> +
> +	igt_describe(test_basic_hotplug_desc);
> +	igt_subtest("vga-hpd-with-enabled-mode")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug(&data, hport, HPD_TOGGLE_COUNT_FAST,
> TEST_MODESET_ON);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("vga-hpd-after-suspend")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport,
> SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
> +	}
> +
> +	igt_describe(test_suspend_resume_hpd_desc);
> +	igt_subtest("vga-hpd-after-hibernate")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_suspend_resume_hpd(&data, hport,
> SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
> +	}
> +
> +	igt_describe(test_hpd_without_ddc_desc);
> +	igt_subtest("vga-hpd-without-ddc")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hpd_without_ddc(&data, hport);
> +	}
> +
> +	igt_describe(test_hotplug_for_each_pipe_desc);
> +	igt_subtest("vga-hpd-for-each-pipe")
> +	{
> +		struct chamelium_port *hport =3D
> +			get_port(data.ports, data.port_count,
> DRM_MODE_CONNECTOR_VGA);
> +
> +		if (!hport)
> +			igt_skip("VGA connector not available\n");
> +
> +		test_hotplug_for_each_pipe(&data, hport);
>  	}
>=20
>  	igt_describe("Tests that operate on all connectors"); @@ -643,15
> +813,10 @@ igt_main
>=20
>  		igt_describe(test_suspend_resume_hpd_common_desc);
>  		igt_subtest("common-hpd-after-hibernate")
> -			test_suspend_resume_hpd_common(&data,
> -						       SUSPEND_STATE_DISK,
> +			test_suspend_resume_hpd_common(&data,
> SUSPEND_STATE_DISK,
>  						       SUSPEND_TEST_DEVICES);
>  	}
>=20
> -	igt_describe(test_hotplug_for_each_pipe_desc);
> -	connector_subtest("vga-hpd-for-each-pipe", VGA)
> -		test_hotplug_for_each_pipe(&data, port);
> -
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.48.1

