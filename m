Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DB3C55175
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 10:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FE910E15A;
	Mon,  3 Aug 2026 10:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftWZofQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59F10E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785751744; x=1817287744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hhmA9wKK7CGkLIqyJj+lEYFdP6kN/Y7vysfGyxEMc/M=;
 b=ftWZofQJ2MEPlqOsiLovNsrsZ+7WvNSOBjNSg523jIzxOTKUm7nBCDQR
 ZIBH1l1+7DkoLS9+90b1prh68RArnTXT55pBgkWER43HXvRH92xquygfw
 jAyYyVQ10eU32KcX+8SY2mEyjFvP8NgINepyfWF7d2Y1jB5aelzHI84kg
 CS2+8CAUYyIzQkbVLkdd7Mnmz6ajvObJSUVQvoQhYR8kJLoaKNZLGcdQk
 c4Zc7ekUNhUxyLwUnhq+9EWIrajvc6rGr+tWv9aJIOSU1TdHdFWdGYbsk
 WB196DUKtOHAc65O3KnUk7J7XRthJkl96W+YC+7XdRm1Hu5GNm8VEGBU/ Q==;
X-CSE-ConnectionGUID: HCRgXQUrRYG8EmSXO6bRhg==
X-CSE-MsgGUID: 2wS3BLkkT5KHm2/KZBFkuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="96643899"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="96643899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:09:03 -0700
X-CSE-ConnectionGUID: VSThWtZzSJG6BsbZJNoICg==
X-CSE-MsgGUID: jSzyDH1UTMidabvOGMW3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="258515344"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:07:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 03:07:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 03:07:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 03:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsj8WLZdkA8vZNr+OnC1ecNVFNIPvSJ4PXtRVP09r7mzc+c8AMozjyUSYmUe3/R2HyQuNJi/GyBcgCJbFueANoFjy1QV4dfIa2YRLpmDD1ozhoGJ2tqu+Zi+XR/PG1CnqCfKyFXfaTzderxzCB9ojxCyCQRMKicaYzpXqhOnF7q/6O25+fDO1tZWpR507Bkv3dYg5KSNg4bt2pKc+LyvnI+g4x3IiQPwkAsLIrgyeTlZdIB9SxrYGyhqmfuzLAgi8TxvKmdiwlXy3lWxq8aurXNojBHhg6W0+2rsQvTuSBr+MthBqPbMYNZuSuE4mOk3mfS4mdrQvGHAvbyzD0ZauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhmA9wKK7CGkLIqyJj+lEYFdP6kN/Y7vysfGyxEMc/M=;
 b=hc55vPMfIrIm8VAPns34N1gkhzW6UvgNLoSUus12BusxD/Mpkbuk0nleYdYbh31/HjBo364BiKyuygtySfC5z1eWndDDRMFyRPoY2XxOw9HZ45BHIoevAYOSou7H03k5+40DTISiZJ0IeH0VZU/yQGrnJd7cwuUefF0loqg0CxB/O2RJLWGe8un91/yX9OIWK83NDcuZICtixLKWYxkGZe9DIrYoymPVHTnfHhAC2/IqOTObH8c4x7BgixousjD6W84My6q3/62Psrq3MfWvFSA8izkrrnxTieSSbJ+BDOMBQlXV5oQWa2Q9ccrcFqqMAxH7mSoRJuvSDpMDjSoeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) by
 IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.17; Mon, 3 Aug 2026 10:07:20 +0000
Received: from DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809]) by DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 10:07:20 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] lib/gpgpu_fill: Implement gpgpu_fill for XE3
 which uses ugm instead of tgm
Thread-Topic: [PATCH i-g-t v2 2/2] lib/gpgpu_fill: Implement gpgpu_fill for
 XE3 which uses ugm instead of tgm
Thread-Index: AQHdIwdAMtO6w7pCLUeNF7mdaLosjLaMGajg
Date: Mon, 3 Aug 2026 10:07:20 +0000
Message-ID: <DS7PR11MB790702983B79C53AE244220BD9D52@DS7PR11MB7907.namprd11.prod.outlook.com>
References: <20260803051608.61167-4-zbigniew.kempczynski@intel.com>
 <20260803051608.61167-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260803051608.61167-6-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB7907:EE_|IA0PR11MB7749:EE_
x-ms-office365-filtering-correlation-id: 3c6ff71a-1353-4add-02e2-08def1470190
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|4143699003|38070700021|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: JSEF8AJ4tWNjYNLrdskNjjqcG8D3BWCfrGQJucLw5F2TajRn4Cala9e3bRkrsybUkWYQvXVW8NeVRSd37QLKSoEOEbC5ilSN3CI6g4UgTPYNqmNVhoVQOigHHmanqQjHkX1reDsrLGiEpjGuVjg9GlWBni7gSGuYAbRjnUwSpYfxNV6K2LS9GCYOimtiQre9owfxTls+F+w4LXe2pmh+liZYdsKKWnPO1msG/Bvhnm6kzK8SAcdauxEUWsd8xYDYAvp2yJF+MifBheKmpqMxb3F+pttWPR+CUH8FFaz9wX8B+8L00rrTyGAag5KCLHAd4Y5eujvhon36YqFQSMaOiNjwXrsTEVEvuHL3mT3q1+KM5LQ4WGV+2WdBPUm8h62OPuPQ5P/3l58khT5NnIBQa6ES0UMO7/gI99nkYq/vB1MA4QCEhC+AEQXxAn/jp4jOG6iX58wZAhTuAYFgthLzK/E32jFnzehE/JCNV8C7uf6Ic7yfYhKbI0SHb+oHZrPGVaFrVS01Gdy8zvwIo02Zgnzl1DsK3hgr1NXzjFX5En/tYpfJZA6ckmT2zHwACRybMykmT/kdhUu+SFIOmuKvINIylq6u4F+IJVgaOA3AGUWGUcL03OtA4yaZ34/s090Ek4+6MomjKu79YxPG3FhFmcKM8JzieeM2jcgRnHxkAvX3+mEktVjt1WwdDBsU2bEoe2y5uTTtQAPfx5xEH0rvhS86dEoLB8/vRrNSJN70TzQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(38070700021)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUhQQlVyZ3RoOGpWRTcvb28xclhBRnJzVEFBc0ovd2E0aEJvU0NiQlNGczhq?=
 =?utf-8?B?NW1YV01hWGF2dWlxYTU5d2cyQXdNQ2pzd1JhMEVYMnhLQzN0YlJpZXE0aENY?=
 =?utf-8?B?YTFsaTFqUjZTZk94SkNpQnAwSXFrNVBVcWUrTzJuUmtaNHcwWjdLK0l6ck9t?=
 =?utf-8?B?K0I0UGNOajZ1N2VKMG8zazkwUFpXRzBSVk44NXlGSkx3NDk2azFOeTVXTFBG?=
 =?utf-8?B?ZmN3M0lLbXZlWW96cDhhSUFzRmpKWi9tZEhucTdJLy9BcERodm9IMlBqY2NC?=
 =?utf-8?B?Vm8wRVZGcktkQkpPRlRBYWRTV2lxZ216K2lobDVTRXk1WXRwTXBTQWhZSGNH?=
 =?utf-8?B?eTlyVWpRNE95NENHWUFLdEpONktJY1BNdHREMDNDM2RWejZFSUdmeDBVYm5N?=
 =?utf-8?B?M045Mkc0dVUyVWl6QmFOV3UyTkxwUDhyN0hFeFo2TmZlY09GV2JrdVdPMW1I?=
 =?utf-8?B?ZXVaZ1N6WXhIT0xUdHl4NjVZTzZwVHROVFI1TWxqWHRzS2hSM3JRZ0pjMHM1?=
 =?utf-8?B?anJkT0pxdml3Nk9SbldiS2VHNHJqSHlWNlYxOThYMjB6SllkbTdOMWRobytX?=
 =?utf-8?B?d01NWXRlYzNFNjV0Yy9ZRlE0Yjl3RWo4RmIwSVJ4b3l0bDVISjJZeCtvY3dB?=
 =?utf-8?B?RGZZc3c2RGpkcUtPRndDSnhYcE8yemhCa3VJRXQ3Tit2c3ZTeG51dHZvWmRw?=
 =?utf-8?B?dWQrZy9vb3hseWFnaDREbHpEUkhrVWd5Q2s3RTZSb2lwdzRHd0F2Q1ZxbEpq?=
 =?utf-8?B?MVZXN1UwMHRGNE51WE5rYU0wUHMvT0VWNVUyREZBWC9UUWRjM2FUcXFudnRX?=
 =?utf-8?B?bThUdzYvbm4vNUdGa3F4TThCZ2RVbHpHeXVxWUNINW5RTFlId1NtNDdDSlB5?=
 =?utf-8?B?VkNxS2ljRnlTQU15QStPL2RTaU5lQXI4TlBnRXJ5dndIYUZTc0kvc2c5NU5Y?=
 =?utf-8?B?UkNXRjZialVXLzY2aTJxY1ZqNlpBVGx0UUxIc2tjSGtOZGFsdTRnblYyaThI?=
 =?utf-8?B?SVJ5Wko5a1pNcGorMk9qVm55SGRRQWxGSEt1eUNETEJFeWJCazNCZ1dnM3Z1?=
 =?utf-8?B?QzdWVU5wRU1ieWhMNXRSa2xHcDQxa3pFaTlYblRVdnBqUXlIcFZPelp1eVhB?=
 =?utf-8?B?M0ViaUpuNC9nMkg0UVBYaVpYOEFrMUJoclFQalNOZGQ5aysxdzh6c0dUU0FY?=
 =?utf-8?B?MVlZaS9rZ1V5WUhaOElnNG5jNG12eWlud0haQ2g2dXFCdzFsQUErZHlqM3Ey?=
 =?utf-8?B?a2x4Z0tkcEVYOXdQdGNoS2F5amZXeG1wWXpQZzdOTXpvNWNET1hMdGlqaXZ0?=
 =?utf-8?B?WFV6Nm5nNGpyRWJTbDJKUjQ0Mm9DTzlnb3BReHpoSjJCQTdzTE5jdm9rTHVD?=
 =?utf-8?B?dXd1STFVVVdKRnVOMjYvUHBMMjhEREttOHZTVW5JcE56V3AyQ0YrRUllSU9x?=
 =?utf-8?B?Nis4SmM2RnkvMHpoK1hLd2RKYjJaODd2eElpOWcwczJhcmhUbmtLR2w5RHJ3?=
 =?utf-8?B?OHJDeGZDNThFUGRZeXBRVEJmQ0llanFlcTdlUjROSVdrcUdpR0VwRmpoc2NZ?=
 =?utf-8?B?TWY3b1R2OGRHcnFMYWF1MVAwOEJvZncwRWNydVpGZkoreHlxaTlTWGJYb29G?=
 =?utf-8?B?N1IzUkZSSXQzWW1TTVFhZ2FvdW1BQmt0dlhRQVU3a250aG5QRnBzc1JnajNv?=
 =?utf-8?B?YW9aRDJpZkUxTVhuQm1qV28zbHlTSm1XL0tZcW1yYmFFek9GQWdWWG52THdk?=
 =?utf-8?B?bUxVcDE2UldRWTMyVkpFeWRkSnAvVVoxR29lQjh3SFBVNTE5a2swTjZUY1R2?=
 =?utf-8?B?M0o1MkVPREFwVzF5UktBcy9QYWVqVGhYd2d4YUVyTzhrajNGUDZzbzRUb2Zh?=
 =?utf-8?B?cTcxKy96UTFSMVhwWUdQRkJwbFlRVlJDTnAwTm1rMmF2RDNoaVhNTU8ydWQx?=
 =?utf-8?B?U2hqRVRDTThzRVRxZDQ3K2VYUjFpT2VpTVQ0ZER0NSttdTV5NXR4dk5VcE0w?=
 =?utf-8?B?K0VSS21Sbzc5dGVLVHdUMEV2SDJZT1d4a0xmeWs4K0MyaURxeVltT3orTTVN?=
 =?utf-8?B?YnRoTUhZVlkyam1Cd09hVmVZRmI1Y0g3NmwvaUZpTy8rTU5mU3JPVGJVOEUz?=
 =?utf-8?B?NlZmbUFFR3RDWFNpdGxRbm1wYVhXYllLVEp3R2V0NWxMNHRKb1VvcERwUndX?=
 =?utf-8?B?NHFwbWdlbXZPeVIyYjZscHp0a296UXZkaGdaaDRON3RHcy9hMUtRdnhTZENF?=
 =?utf-8?B?dEpVbkUzTWV4VGhMdDN0ZXFPMU1ncXRXNFA4aEtIUVI5WFBxdXo5bkswTE5B?=
 =?utf-8?B?QXVvZDBNUU5uZFNDVTRqNWl5cjJlamMyUnZqQTN2NFBoTWszQXg1WTRFWHNP?=
 =?utf-8?Q?Y17IfwdtdhHYe0Ao=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OWPYzPTxT3PcCczrkCbm/s9XbI9RB14rflo4WzHE60LBqREteLANd8gOFN2TyRROTYuGHY8W36KaaPE1uO43PL/I1X3W+IVLxzNFAKrBgHewW2nHjs5TQqPgvjQSdNbCuQEY+f0046UA//V97YXfi8x1LEoCM9hUnceYNCv045FA/ZI3uJYRcrXZHttWK6wjiBUGwDFx/nGgjOo9WYqnJNAcbrmNXB/q3DDJ0Da2CE0a46rg3femNy5nDBLfS9gM3C7Qn86hF17Yz/gdKTuxKZ3moT7lJAsI9i1gngu/j6jHdUy+RAcZ6WEdz3xbgHxZopKZ0H1Q+RsK3sMgFbkaqw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6ff71a-1353-4add-02e2-08def1470190
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 10:07:20.4066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0us3RvZtjugtqS8SJ+pYRnOsi24me9Opj3MjAA/PwszEaLKBCBJKctd5KCX+LsnLWKJTGGRNYP97eV9I4ye+mhV4OmsUZDPztpDx48OBRx6PaLJxIy9LaQuJd4cbcSGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDMsIDIwMjYgNzoxNiBBTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5n
cnplZ29yemVrQGludGVsLmNvbT47IEtlbXBjenluc2tpLA0KPiBaYmlnbmlldyA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPjsgUGlhdGtvd3NraSwgRG9taW5payBLYXJvbA0KPiA8ZG9t
aW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10
IHYyIDIvMl0gbGliL2dwZ3B1X2ZpbGw6IEltcGxlbWVudCBncGdwdV9maWxsIGZvciBYRTMNCj4g
d2hpY2ggdXNlcyB1Z20gaW5zdGVhZCBvZiB0Z20NCj4gDQo+IEZyb206IERvbWluaWsgR3J6ZWdv
cnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCj4gDQo+IFVzZSB1Z20gc2hhcmVk
IGZ1bmN0aW9uICh1bnR5cGVkIDJkIGJsb2NrIHN0b3JlKSBpbnN0ZWFkIG9mIHRnbQ0KPiAodHlw
ZWQgMmQgYmxvY2sgc3RvcmUpIG9uIFhFMyBwbGF0Zm9ybXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lA
aW50ZWwuY29tPg0KPiBDYzogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJv
bC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvZ3BncHVfZmlsbC5jICAgICAg
ICAgICAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICBsaWIv
Z3BncHVfZmlsbC5jLmdlbi5pZ2E2NF9jb2Rlcy5jIHwgMjAgKysrKysrKysrKysrKy0NCj4gIGxp
Yi9ncHVfY21kcy5jICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgMyBmaWxlcyBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2xpYi9ncGdwdV9maWxsLmMgYi9saWIvZ3BncHVfZmlsbC5jDQo+IGluZGV4IGU3YzljM2NkMjEu
LmIzNTFhMTRjZDYgMTAwNjQ0DQo+IC0tLSBhL2xpYi9ncGdwdV9maWxsLmMNCj4gKysrIGIvbGli
L2dwZ3B1X2ZpbGwuYw0KPiBAQCAtMjgyLDkgKzI4MiwxNSBAQCBfX2dlbjlfZ3BncHVfZmlsbGZ1
bmMoaW50IGk5MTUsDQo+ICAJaW50ZWxfYmJfZGVzdHJveShpYmIpOw0KPiAgfQ0KPiANCj4gLXN0
YXRpYyBzdHJ1Y3QgZ3BncHVfc2hhZGVyICpfX3hlaHBfZ3BncHVfa2VybmVsKGludCBmZCkNCj4g
K3N0YXRpYyBzdHJ1Y3QgZ3BncHVfc2hhZGVyICpfX3hlaHBfZ3BncHVfa2VybmVsKGludCBmZCwg
c3RydWN0IGludGVsX2J1Zg0KPiAqYnVmKQ0KPiAgew0KPiAgCXN0cnVjdCBncGdwdV9zaGFkZXIg
Kmtlcm5lbCA9IGdwZ3B1X3NoYWRlcl9jcmVhdGUoZmQpOw0KPiArCXVpbnQ2NF90IG9mZnNldDsN
Cj4gKw0KPiArCWlmIChpc194ZV9kZXZpY2UoZmQpKQ0KPiArCQlvZmZzZXQgPSB4ZV9jYW5vbmlj
YWxfdmEoZmQsIGJ1Zi0+YWRkci5vZmZzZXQpOw0KPiArCWVsc2UNCj4gKwkJb2Zmc2V0ID0gQ0FO
T05JQ0FMKGJ1Zi0+YWRkci5vZmZzZXQpOw0KPiANCj4gIAllbWl0X2lnYTY0X2NvZGUoa2VybmVs
LCBncGdwdV9maWxsLCBSIigNCj4gIC8vIGZpbGwgdXAgcjEgd2l0aCB0YXJnZXQgY29sb3VyDQo+
IEBAIC0zMTMsNyArMzE5LDcgQEAgbW92ICgxfE0wKQkJcjQuNDwxPjp1ZA0KPiAJcjAuNTwwOzEs
MD46dWQNCj4gIC8vCVsxODoxNF0JCU1lc3NhZ2VUeXBlOiAweEEgKG1lZGlhIGJsb2NrIHdyaXRl
KQ0KPiAgLy8JWzc6MF0JCUJUSTogMA0KPiAgc2VuZC5kYzEgKDE2fE0wKQludWxsCXI0CXNyYzFf
bnVsbAkweDAJMHg0MEE4MDAwDQo+IC0jZWxzZQ0KPiArI2VsaWYgR0ZYX1ZFUiA8IDMwMDANCj4g
IC8vIGxvYWQgYmxvY2sgb2Zmc2V0cyBpbnRvIG1lc3NhZ2UgaGVhZGVyIHBheWxvYWQNCj4gIG1v
diAoMnxNMCkJCXI0LjU8MT46dWQJcjIuMDwyOzIsMT46dWQNCj4gIC8vIGxvYWQgYmxvY2sgd2lk
dGgNCj4gQEAgLTMyNyw4ICszMzMsMzcgQEAgbW92ICgxfE0wKQkJIHI0LjE0PDE+OncJMHhGOncN
Cj4gIC8vCVsxOToxN10JCUNhY2hpbmc6IDAgICh1c2Ugc3RhdGUgc2V0dGluZ3MgZm9yIGJvdGgg
TDEgYW5kIEwzKQ0KPiAgLy8JWzU6MF0JCU9wY29kZTogMHgwNyAgKHN0b3JlX2Jsb2NrMmQpDQo+
ICBzZW5kLnRnbSAoMTZ8TTApCW51bGwJcjQJbnVsbAkweDAJMHg2NDAwMDAwNw0KPiArI2Vsc2UN
Cj4gKy8vIGxvYWQgQTY0IGJhc2Ugc3VyZmFjZSBzdGF0ZSBvZmZzZXQgaW50byBhZGRyZXNzIHBh
eWxvYWQNCj4gK21vdiAoMXxNMCkJCXI0LjA8MT46dWQJQVJHKDApOnVkDQo+ICttb3YgKDF8TTAp
CQlyNC4xPDE+OnVkCUFSRygxKTp1ZA0KPiArLy8gbG9hZCBzdXJmYWNlIHdpZHRoDQo+ICttb3Yg
KDF8TTApCQlyNC4yPDE+OnVkCUFSRygyKTp1ZA0KPiArLy8gbG9hZCBzdXJmYWNlIGhlaWdodA0K
PiArbW92ICgxfE0wKQkJcjQuMzwxPjp1ZAlBUkcoMyk6dWQNCj4gKy8vIGxvYWQgc3VyZmFjZSBw
aXRjaA0KPiArbW92ICgxfE0wKQkJcjQuNDwxPjp1ZAlBUkcoNCk6dWQNCj4gKy8vIGxvYWQgYmxv
Y2sgb2Zmc2V0cw0KPiArbW92ICgyfE0wKQkJcjQuNTwxPjp1ZAlyMi4wPDI7MiwxPjp1ZA0KPiAr
Ly8gbG9hZCBibG9jayB3aWR0aA0KPiArbW92ICgxfE0wKQkJcjQuMTQ8MT46dwkweEY6dw0KPiAr
Ly8gVW50eXBlZCAyRCBibG9jayBzdG9yZQ0KPiArLy8gTWVzc2FnZSBEZXNjcmlwdG9yDQo+ICsv
Lwlic3BlYzo2Mzk4MQ0KPiArLy8JMHgyMDIwMDA3Og0KPiArLy8JWzMwOjI5XQkJQWRkclR5cGU6
IDAgKEZsYXQpDQo+ICsvLwlbMjg6MjVdCQlNbGVuOiAxIGFkZHJlc3MgcmVnaXN0ZXIgd3JpdHRl
bg0KPiArLy8JWzI0OjIwXQkJUmxlbjogMCByZWdpc3RlcnMgcmVhZCBiYWNrDQo+ICsvLwlbMTk6
MTddCQlDYWNoaW5nOiAxICAoTDEgdW5jYWNoZWQsIEwzIHVuY2FjaGVkKQ0KPiArLy8JWzE1XQkJ
RGF0YU9yZGVyOiAwICBub24tdHJhbnNwb3NlZA0KPiArLy8JWzExOjldCQlEYXRhU2l6ZTogMCAg
KDhiIHBlciBkYXRhIGVsZW1lbnQpDQo+ICsvLwlbNTowXQkJT3Bjb2RlOiAweDA3ICAoc3RvcmVf
YmxvY2syZCkNCj4gK3NlbmQudWdtICgxfE0wKQkJbnVsbAlyNAlyNToxCTB4MAkweDIwMjAwMDcN
Cj4gICNlbmRpZg0KPiAtCSkiKTsNCj4gKwkpIiwgb2Zmc2V0ICYgMHhmZmZmZmZmZiwgb2Zmc2V0
ID4+IDMyLA0KPiArCWludGVsX2J1Zl93aWR0aChidWYpICogYnVmLT5icHAvOCAtIDEsIGludGVs
X2J1Zl9oZWlnaHQoYnVmKSAtIDEsDQo+ICsJYnVmLT5zdXJmYWNlWzBdLnN0cmlkZSAtIDEpOw0K
PiArDQo+ICAJZ3BncHVfc2hhZGVyX19lb3Qoa2VybmVsKTsNCj4gIAlyZXR1cm4ga2VybmVsOw0K
PiAgfQ0KPiBAQCAtNDIyLDcgKzQ1Nyw3IEBAIHZvaWQgeGVocF9ncGdwdV9maWxsZnVuYyhpbnQg
ZmQsDQo+IA0KPiAgCWludGVsX2JiX3B0cl9zZXQoaWJiLCBCQVRDSF9TVEFURV9TUExJVCk7DQo+
IA0KPiAtCWtlcm5lbCA9IF9feGVocF9ncGdwdV9rZXJuZWwoZmQpOw0KPiArCWtlcm5lbCA9IF9f
eGVocF9ncGdwdV9rZXJuZWwoZmQsIGJ1Zik7DQo+ICAJeGVocF9maWxsX2ludGVyZmFjZV9kZXNj
cmlwdG9yKGliYiwgYnVmLCBrZXJuZWwtPmluc3RyLA0KPiAgCQkJCSAgICAgICBrZXJuZWwtPnNp
emUgKiA0LCAmaWRkKTsNCj4gIAlncGdwdV9zaGFkZXJfZGVzdHJveShrZXJuZWwpOw0KPiBkaWZm
IC0tZ2l0IGEvbGliL2dwZ3B1X2ZpbGwuYy5nZW4uaWdhNjRfY29kZXMuYw0KPiBiL2xpYi9ncGdw
dV9maWxsLmMuZ2VuLmlnYTY0X2NvZGVzLmMNCj4gaW5kZXggZjE1YTlhMjNhYi4uMTk5MDU2NTll
OSAxMDA2NDQNCj4gLS0tIGEvbGliL2dwZ3B1X2ZpbGwuYy5nZW4uaWdhNjRfY29kZXMuYw0KPiAr
KysgYi9saWIvZ3BncHVfZmlsbC5jLmdlbi5pZ2E2NF9jb2Rlcy5jDQo+IEBAIC0zLDcgKzMsNyBA
QA0KPiANCj4gICNpbmNsdWRlICJncGdwdV9zaGFkZXIuaCINCj4gDQo+IC0jZGVmaW5lIE1ENV9T
VU1fSUdBNjRfQVNNUyAyMzk3NGE5ZmE3MjdhODFiMzIwNThiYmFhOGQzZWJiYw0KPiArI2RlZmlu
ZSBNRDVfU1VNX0lHQTY0X0FTTVMgNTBhNmVhN2Q0MzVkYjNiYWI3NGM3NDJjZTI1MjY1YzANCj4g
DQo+ICBzdHJ1Y3QgaWdhNjRfdGVtcGxhdGUgY29uc3QgaWdhNjRfY29kZV94ZTNwX2dwZ3B1X2Zp
bGxbXSA9IHsNCj4gIAl7IC5nZnhfdmVyID0gMzUwMCwgLnNpemUgPSAxNDQsIC5jb2RlID0gKGNv
bnN0IHVpbnQzMl90IFtdKSB7DQo+IEBAIC01MCw2ICs1MCwyNCBAQCBzdHJ1Y3QgaWdhNjRfdGVt
cGxhdGUgY29uc3QNCj4gaWdhNjRfY29kZV94ZTNwX2dwZ3B1X2ZpbGxbXSA9IHsNCj4gIH07DQo+
IA0KPiAgc3RydWN0IGlnYTY0X3RlbXBsYXRlIGNvbnN0IGlnYTY0X2NvZGVfZ3BncHVfZmlsbFtd
ID0gew0KPiArCXsgLmdmeF92ZXIgPSAzMDAwLCAuc2l6ZSA9IDY0LCAuY29kZSA9IChjb25zdCB1
aW50MzJfdCBbXSkgew0KPiArCQkweDAwMDgwMDYxLCAweDAxMDUwMDAwLCAweDAwMDAwMTA0LCAw
eDAwMDAwMDAwLA0KPiArCQkweDAwMDAwMDY5LCAweDAyMDU4MjIwLCAweDAyMDAwMDE0LCAweDAw
MDAwMDA0LA0KPiArCQkweDAwMDAwMDYxLCAweDAyMTUwMjIwLCAweDAwMDAwMDY0LCAweDAwMDAw
MDAwLA0KPiArCQkweDAwMGMwMDYxLCAweDA0MDU0MjIwLCAweDAwMDAwMDAwLCAweDAwMDAwMDAw
LA0KPiArCQkweDAwMTAxYzYxLCAweDA1MDUwMjIwLCAweDAwMDAwMTA0LCAweDAwMDAwMDAwLA0K
PiArCQkweDAwMDAwMDYxLCAweDA0MDU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDAwLA0KPiAr
CQkweDAwMDAwMDYxLCAweDA0MTU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDAxLA0KPiArCQkw
eDAwMDAwMDYxLCAweDA0MjU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDAyLA0KPiArCQkweDAw
MDAwMDYxLCAweDA0MzU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDAzLA0KPiArCQkweDAwMDAw
MDYxLCAweDA0NDU0MjIwLCAweDAwMDAwMDAwLCAweGMwZGVkMDA0LA0KPiArCQkweDAwMDQxZjYx
LCAweDA0NTUwMjIwLCAweDAwMjIwMjA1LCAweDAwMDAwMDAwLA0KPiArCQkweDAwMDAwMDYxLCAw
eDA0NzU0NTUwLCAweDAwMDAwMDAwLCAweDAwMGYwMDBmLA0KPiArCQkweDAwMDMyMDMxLCAweDAw
MDAwMDAwLCAweGYwMGUwNDBjLCAweDAwODAwNTBjLA0KPiArCQkweDgwMDAwMDAxLCAweDAwMDEw
MDAwLCAweDIwMDAwMDAwLCAweDAwMDAwMDAwLA0KPiArCQkweDgwMDAwMDAxLCAweDAwMDEwMDAw
LCAweDMwMDAwMDAwLCAweDAwMDAwMDAwLA0KPiArCQkweDgwMDAwOTAxLCAweDAwMDEwMDAwLCAw
eDAwMDAwMDAwLCAweDAwMDAwMDAwLA0KPiArCX19LA0KPiAgCXsgLmdmeF92ZXIgPSAyMDAwLCAu
c2l6ZSA9IDQ0LCAuY29kZSA9IChjb25zdCB1aW50MzJfdCBbXSkgew0KPiAgCQkweDAwMDgwMDYx
LCAweDAxMDUwMDAwLCAweDAwMDAwMTA0LCAweDAwMDAwMDAwLA0KPiAgCQkweDAwMDAwMDY5LCAw
eDAyMDU4MjIwLCAweDAyMDAwMDE0LCAweDAwMDAwMDA0LA0KPiBkaWZmIC0tZ2l0IGEvbGliL2dw
dV9jbWRzLmMgYi9saWIvZ3B1X2NtZHMuYw0KPiBpbmRleCA5ZGFkNzNiNmRmLi43YTcyMTY2YTBl
IDEwMDY0NA0KPiAtLS0gYS9saWIvZ3B1X2NtZHMuYw0KPiArKysgYi9saWIvZ3B1X2NtZHMuYw0K
PiBAQCAtMTAyMSw3ICsxMDIxLDcgQEAgeGVocF9lbWl0X2NmZV9zdGF0ZShzdHJ1Y3QgaW50ZWxf
YmIgKmliYiwgdWludDMyX3QNCj4gdGhyZWFkcykNCj4gDQo+ICAjZGVmaW5lIF9MRUdBQ1lfTU9E
RSAoMSA8PCA2KQ0KPiAgCS8qIG51bWJlciBvZiB0aHJlYWRzICYgdXJiIGVudHJpZXMgKi8NCj4g
LQlpbnRlbF9iYl9vdXQoaWJiLCAobWF4X3QodGhyZWFkcywgdGhyZWFkcywgNjQpIC0gMSkgPDwg
MTYgfCAoZGZldWQgPw0KPiBfTEVHQUNZX01PREUgOiAwKSk7DQo+ICsJaW50ZWxfYmJfb3V0KGli
YiwgKG1heF90KHRocmVhZHMsIHRocmVhZHMsIDEyOCkgLSAxKSA8PCAxNiB8IChkZmV1ZCA/DQo+
IF9MRUdBQ1lfTU9ERSA6IDApKTsNCj4gDQo+ICAJaW50ZWxfYmJfb3V0KGliYiwgMCk7DQo+ICAJ
aW50ZWxfYmJfb3V0KGliYiwgMCk7DQo+IC0tDQo+IDIuNTQuMA0KDQo=
