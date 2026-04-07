Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D66105D986
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 22:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB20010E0C3;
	Tue,  7 Apr 2026 22:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F82Ug97e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9CE10E0C3
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775599440; x=1807135440;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AyrtJd7Cl+BHkuSidsTeO9lUgiZFATIWKSuxeXm1LFM=;
 b=F82Ug97eL/LNwu3N1hq+p26rWLIhrBdTrLSY+BYrVska+KkJ1w/9erDv
 K9LzbOACUAdkJ9A34YGqKFZ5YaG1QIuKYFPrknd1E/iMfAApPTDmuI6J7
 Jx4mEqMxP3fGGSYvsWqRm8hzA03BotkXl0AIhM9KPdubF9NNxfH1pXucT
 WW+wvXAEspygku84wmaIRm+pcztjn229ZPGYfeJSF84O8i0PTd5zjlHOm
 Ss8wm8C9wuv43+ldZ+MJdEmT149V2K1Ujn3tWxC1IXOw82wPH8Z56rtij
 VipQnj6ptltiudBWAJuFQDdbjf5gOMPujT/c+17GgDsF/RHu32v0pA5Xg A==;
X-CSE-ConnectionGUID: BxKHpVUbQeKO4sazMlwbWw==
X-CSE-MsgGUID: srSYhYw7T2Ou9UYYZ88R4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="93963435"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="93963435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:03:59 -0700
X-CSE-ConnectionGUID: UdnvczbtS1O/g21nfuB4ow==
X-CSE-MsgGUID: 2JUM0qflQKyU9istzDeZ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="232331598"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 15:03:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:03:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 15:03:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 15:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmVyRQzw+FZ/Ar8I69Z8MVRfniaGczZrCAmBNjOCgzYYaR4ciuDgpSo4WmCtHEyNhxgF4XZib4S9qZ3tPExXiUmqSlbVtn5Ro8SXUtrAfLdHa3pv8KSKeOGK9EZVsSFDU9uUlPE4RbzIqaP1hCqsj//4Fuc/BDz/WqT/sJV1t6aFomU3JJ15fQHI5vyqCLnb/j58orMfmGTgtvaOgs7pWEQxZArlyr9Ymb6CV30Y6u7DSdNVaYEpTpFOR1wjyuTCTN42yT4HMA+A+dHycjjLqmqSWmMo3k2qd1eCCgs+GNGGj1ukJxecrNgzjTg3qSp8HhuTFrBqyHTH3LRctpK20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyrtJd7Cl+BHkuSidsTeO9lUgiZFATIWKSuxeXm1LFM=;
 b=bf+Zcu9a8jit/HMgR1kTQcVuvi11Fijh44tyrMWQ5f0v+sQF8nGWl9PMz5xpIS0imHvSEnET+eHkDihna7Stg6jtiz70PdK0w+9woCZdyq5VO6NvjVjn/dWH6gzIw2rE4DuDiJu6Y5hB3lXrCyaQnGC6pVn6uLlOEK8l2dLwCRYon/XmMkgB4IJyorCkBpF5ni2BCFIF+KQKZtNhFJXYi1q1GO2gK0eVFIxUlqe2aeYhgHbd/gqUDFWNUCONpFVZ5VgPfP+ROkJElB+WLOIhiZm7XZ7J5lj8761W9lVB4gVP5aC9tggVFkwOME78RXDpR+zRmQyYLMemew/o4SD5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DSWPR11MB9557.namprd11.prod.outlook.com (2603:10b6:8:36c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 22:02:55 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9769.015; Tue, 7 Apr 2026
 22:02:54 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
Thread-Topic: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
Thread-Index: AQHcxfUj5Ba2BHj0SUCau01QKxA1XbXT+fAAgAAETxA=
Date: Tue, 7 Apr 2026 22:02:54 +0000
Message-ID: <SA1PR11MB8839B5170E34C1E885F31FB4AA5AA@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
 <9e8c7eefbc307dbeb5553b26759ddd69120897fa.camel@intel.com>
In-Reply-To: <9e8c7eefbc307dbeb5553b26759ddd69120897fa.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DSWPR11MB9557:EE_
x-ms-office365-filtering-correlation-id: cbedbeee-30d4-466c-bbde-08de94f16bc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 1HjZjlMgwGZpWgZ9hY2YW53b2k/b1izYw3Sb3z9QM1S3mmuPrtyiP+q0C4yLnW8wmglhRKRT1UNYQIdJVEEQDD2moXTQ4xgm8VrE6piUYWpAPwatSg+J93xnjRfENLV6D/VXyUuWxKGoqijTlBoac2071x5ljUl0eqw8BgScBa4CH8o/wN9/Jt0jp570SD1uufeat7trbdrCK6dtKjoOV04DUgzdsMbNoJaY+CIK4zqY4BtQuW81hDAVx5RuXG207geIN9gn1w18K4CQkaxrqFC/jQOmVhR96dODflnvVKWibGgu5clESs9gDCP8oM3UjowgCk9hka69QBPTgqyhrIWZgc1a6D250/xgsZFjvKd4KEpBfhreP3toUMricj4neyATGUr7AbWDGsuJ6mVVhwZ5vFal8nOO8nQq7Bop544ELx9N+mNcDcqkr8eRo3y4NJHOgziZYa2Nz0ilXsShY2KZmlFz+Hk2XWRmSfHSjjy8A3DBqN1JxmQoiabCejpHlBt1JNdt9wCytaqTpzq/pjJUjIj5BghAC+wyno/3nzncSqQeql/wMZrUFunvtsCwLmbueWCA6MMkTfvnVHqbBaBEzIyhHf9Tz8xxRwSAlpm4dyIUikVWvd31lk5a0FvjPUAeXBRRbIwE7fc3Ydctpy+HxIpa6LpLcPeHhoFl1eaJ2QpHHhsOzDf7w9rIGsJxcYsUFyv16M9jj+jIn1dUybqfjGTyoHMGPL+OciH20IcvZoHQ+Ra30Jn0oU2MAdkmqQLHA8jXo4rw3NAMvdpxxUKtY/lsKqh9qjwu26mUYlU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RStTbitMcFdtWWptVHZtZHFGZVVnREFCc0NSUW1sOEtaV0o1NlM1NXJYWi9P?=
 =?utf-8?B?T0RNV25TTSt5Z2xVelBJZStwaUR5Y1F4SSt2YmtXK3hoTytVeEY5OG50Rk5P?=
 =?utf-8?B?dG1JbGhxL3VCTlhFVGJYaXcrL1diQXNva3JLMzBMOTU4Vnc0NlkxVmhKSy9R?=
 =?utf-8?B?K1YrcGd3YitjKzJYY0RzbCtTV2dzeU9qUlVoVlNsMG5JTUJjWVpCUHJ0SllM?=
 =?utf-8?B?QmhXT0hYbzE1VjkwQkFYdDdoYmZxcE5KbExJZTgvakFWVUlWYytkdGxVK0Qx?=
 =?utf-8?B?dFVrZVNhQzFCZE1jSnQ3UVRmZndRd3JTZ1AvaXJUQ2pGOWkrTWRVY0JJUFlT?=
 =?utf-8?B?WEFaQlFIeE5rMTJIY083NDUrS3NMZi8zMzUwaHdLbjQ3dXd3MTBlSDMrL2tO?=
 =?utf-8?B?NW9RUk5XenJOSEc3VmFPOHJBSE5ieXNqZ1czMEZMaGVxZUV4SGF1Lzgyd2do?=
 =?utf-8?B?bmJlV2RoSXBLemxVRzBqa3FoWWwrcnMwai81bGdUU2cveVVWYnhCYnlkSTQ1?=
 =?utf-8?B?cWQ1S21Rb2VSdGlGV1V2aERKbEdmSUNxUG5mY0tBYzUvR1BnaW5FZUphdzN0?=
 =?utf-8?B?UUJlM3UwdWVRZ2NldHV3YzZrZ3BKNmI2Y3RqRm1WSnpnYktYT0VydCtlTXFB?=
 =?utf-8?B?WWhydFYyamtOUjYybGtLUkRKaCt2TWVnM2tHR1M2TnIzYnFRZ2Z4MFBuU3cv?=
 =?utf-8?B?UGVjOFlESTJxSlBRQVdvOUdaOE44Q0x0L2J1WWFCSjU0Z1V1SWtjVVFtNFdG?=
 =?utf-8?B?NGVOcVJGcXgrVzVHTVBZYnNkeklsNk5Ed2tHTTh5eGROWUdYalZESzBjSG5G?=
 =?utf-8?B?YytiMUIxd1QzUXc3K05RZ3ZZY3gvY1U0bUVTUVJuWFhCWXFmUFVJdXN1VGJw?=
 =?utf-8?B?amVUeDEyS25XM2dCUmtLVzRkTW5TQWU0OVVhYUlmbGx2L2M3cFp0eU9XTWdF?=
 =?utf-8?B?aFdLVysvL2l3emc1REV2N0ZrbVJnM0FNRlJielUxU2ZGZGFoS2lZK1dSZGhW?=
 =?utf-8?B?R3dMWXFvVUdTbkxRVWtIZ3NxMEpjeWJadlNHVDllVXZnUkcrb3FSRDQrKzNq?=
 =?utf-8?B?a0RNdSt3Wkt5eFRhcFRCYkZRZEtoK1pGb2dFUVhVQnlkRW0rSmorUzlCYU9V?=
 =?utf-8?B?YSs1eWdNSkVLTWhGTkdZVTBhWTVtZ3lPSmJrMXdmZW13VHRLQ0JQQnpGeFUz?=
 =?utf-8?B?YkVSN2kvVHNTbGFyZ2NjZ3JRQ0ZGTmJlbE81SVBXbEVGcTBycUFqVmpIZ0tW?=
 =?utf-8?B?czdtNDNGR0puenJyd2dFTHB4REpIU1NxWkVrWlNiem84dmFBZlFiZDlUcmhs?=
 =?utf-8?B?MGRsbkhrTjFVMnVveHZ5K0pnTVMzdm9acTAybTVqSUhGeC84Ty94b3JIeGw1?=
 =?utf-8?B?aUtxVThYWU5YdEtoc3JtQy92QVV0aGltcTJnZWpWUXBRU1VlVGtxY05MWTEw?=
 =?utf-8?B?bHltUFk3anVFSlpOeG1aNTMzdWsvWXoyK2V0cndkQzY1MU5janc4ZTI4WVlG?=
 =?utf-8?B?NDZucE9FTU15SXNSdHkrc0UwdllwRW9MbmZMcmhLdDR5amI0Yk13SDBtQzlR?=
 =?utf-8?B?TlRzWWRxam9XN0ZQZmtSZ0pzdTVXM2ptNGJBMEJveFRSaXZzeE9pTUFPZ1Zi?=
 =?utf-8?B?YlRNQXdKVVM3L2pvMGhTK0tJQ0pjR0t5NkFOc2VvRGVTWWZQanNBRzkrVGxp?=
 =?utf-8?B?UXpYT3AwbXdvMlplZFdPbUhlOFltMExrTlhZOU5Db095dkRpTUtGY1RNeVpn?=
 =?utf-8?B?NFMvS1hIYVZQamlBS2JpNUkvUWgzRnM1SXJLeWxNcnNDSkJJU3NFVVhaYlh5?=
 =?utf-8?B?YnlIczQwM3h3QktSaFVjMm5tK25GWFlkWVhlUzVERkdtTDRtSE5BcXlmdzFX?=
 =?utf-8?B?cC93NGNpUUM5MkdpN2MrVmNYNmh5QWx5WXBsSVluakxFK25LL3dJUmFsc3l2?=
 =?utf-8?B?d1BoWkIzT0dXMmZIZ1JWMjEycW9KeU5oZ1h0a24vd0EzSUxwNWFqdXpiODZ5?=
 =?utf-8?B?TWk3MGI2RkUyRmxqL240Y2JRMTBhb3JmS2NucDFWZ1NpdyttQWxBU0hnK1dy?=
 =?utf-8?B?UXE0M1B0MGtSTFluQnIxRFd1UXYybFJSL2sxQ1pOUjhMNG1DTS91Y2pFVkY1?=
 =?utf-8?B?bkRXcHFmSDhCL3VXYVBIaFB2aDNKTVBoaWJUamptQ3JzMGNDc2l3L0puWXht?=
 =?utf-8?B?WG5QeUszN0M4RCtDTm9sT2Jnd1dLaWxoZ05EVmt0MndpaSs1SXBrUlA0ZDRk?=
 =?utf-8?B?a1ZuRFlsQ1hvSlJUOVVjVCtNaG9YUFp6ckhhVU1qM3JVM1hBMWRaYzYrYjNX?=
 =?utf-8?B?QjQvUkZiV3pydWpvZC9BY2VSdUpadm1ia29GZEJvc2FHbFdMVkxtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qAvb/2kOZrys4SN+Cuwlt7+xz5kk5WPHwvFhUsfWo5QX78EN603kRAzeKZ1DPT49JiSBMhh9tWGW0kk5+IsMf0areK6OxTvmPBY6jZTLJOgJT94XS8FGO/XDpZk59KxN8yLmnceaZHhQ4rY3DRva3pQERpPtzbSt61HEgk45xYE1dCNNJ6J7GEA0hVH0KSfDpFTWT+TUjMlsTnzwKUqZh1uYA8J4zrmZ7CAhEjcjhWIOH5En4P+rePatfvyEsyFin4NWj3Oh4Vlmu0d7/vTLd4a5U5Ry4N5yVim62A2qmbaDgIZs9XHMy7iZ2HrN5U82Cr0GfIyG6C9Aw0Y1KNeqmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbedbeee-30d4-466c-bbde-08de94f16bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 22:02:54.7907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J++8AgCZySpBrKwX2flK/EeV7bTnJckewF5mKnfGsNiLb9x/pkBFhCdOsbVYCQSSwyyJvCgX4jb7TZVjv8WK4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9557
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

T24gVHVlc2RheSwgQXByaWwgNywgMjAyNiAxMjoxNiBQTSwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6
DQo+IE9uIE1vbiwgMjAyNi0wNC0wNiBhdCAxODo0MiArMDAwMCwgQnJpYW4gTmd1eWVuIHdyb3Rl
Og0KPiA+IFBhZ2UgUmVjbGFtYXRpb24gaXMgYSBYZTNwIGZlYXR1cmUgdGhhdCBvcHRpbWl6ZXMg
VExCIGludmFsaWRhdGlvbnMNCj4gPiBieSB0YXJnZXRpbmcgb25seSB0aGUgc3BlY2lmaWMgcGh5
c2ljYWwgcGFnZXMgYmVpbmcgdW5tYXBwZWQsIHJhdGhlcg0KPiA+IHRoYW4NCj4gPiBpc3N1aW5n
IGEgZnVsbCBQUEMgZmx1c2guIFdpdGggUGFnZSBSZWNsYW1hdGlvbiwgdGhlIGRyaXZlciBtYWlu
dGFpbnMNCj4gPiBhDQo+ID4gUGFnZSBSZWNsYWltIExpc3QgKFBSTCksIG9uIHRoZSBiYWNraW5n
IHBhZ2VzIG9mIGEgVk1BIHJhbmdlLCB3aGljaA0KPiA+IGlzDQo+ID4gcGFzc2VkIGludG8gdGhl
IGhhcmR3YXJlLCBsaW1pdGluZyB0aGUgZmx1c2ggdG8gb25seSB0aGUgYWZmZWN0ZWQNCj4gPiBw
YWdlcy4NCj4gPg0KPiA+IFBSTCBzdXBwb3J0cyB1cCB0byA1MTIgZW50cmllcyBhbmQgYmV5b25k
IHRoYXQgcmVzdWx0cyBpbiBhIGZhbGxiYWNrDQo+ID4gdG8NCj4gPiBmdWxsIFRMQiBpbnZhbGlk
YXRpb24sIGFuZCBpbnZhbGlkYXRpbmcgdGhlIFBSTC4gVGhlIHBhZ2UgcmVjbGFtYXRpb24NCj4g
PiB0ZXN0DQo+ID4gY2FzZXMgdmFsaWRhdGUgZGlmZmVyZW50IGNvbWJpbmF0aW9ucyBvZiB0aGUg
cG9zc2libGUgVk1BIHJhbmdlcy4NCj4gPg0KPiA+IFRoZSBwcmltYXJ5IHNvdXJjZSBvZiB2YWxp
ZGF0aW9uIG9mIHRoZXNlIGNhc2VzIGlzIGRlcml2ZWQgZnJvbSB0aGUNCj4gPiBndF9zdGF0cyBp
biBkZWJ1Z2ZzIHRvIGNvbmZpcm0gdGhlIHByb3BlciBQUkwgZ2VuZXJhdGlvbi4NCj4gDQo+IEp1
c3QgYSBoaWdoIGxldmVsIHF1ZXN0aW9uIGhlcmUsIGFzc3VtaW5nIHRoZSBwYWdlIHJlY2xhbWF0
aW9uIGlzDQo+IGhhcHBlbmluZyBhdCBldmVyeSBpbnZhbGlkYXRpb24gYW5kIHdlIHNob3VsZCBi
ZSBnZXR0aW5nIGNvdmVyYWdlDQo+IGdlbmVyYWxseSBhY3Jvc3MgbWFueSBvZiBvdXIgdGVzdHMg
KGUuZy4geGVfKiAtLXIgKmludmFsaWRhdGlvbiopLA0KPiB3b3VsZCBpdCBtYWtlIHNlbnNlIHRv
IHJlZHVjZSB0aGUgdGVzdCBzY29wZSBoZXJlIGJ5IGp1c3QgYWRkaW5nIGhvb2tzDQo+IHRvIHRo
ZSBleGlzdGluZyB0ZXN0cyB0byBjaGVjayBjb3VudGVycyAtIGFuZCB0aGlzIGtpbmQgb2YNCj4g
aW5mcmFzdHJ1Y3R1cmUgY291bGQgcG90ZW50aWFsbHkgZXZlbiBnbyBiZXlvbmQganVzdCBwYWdl
DQo+IHJlY2xhbWF0aW9uLi4uDQo+IA0KDQpUaGUgaG9vayBkb2VzIHNvdW5kIHZlcnkgaW50ZXJl
c3RpbmcgdG8gbG9vayBpbnRvLiBHaXZlIG1lIHNvbWUgdGltZSB0byB0aGluaw0KdGhhdCBvdmVy
LiBUaGUgd29ycnkgaXMgbWFpbmx5IGFib3V0IGNvcnJlY3RuZXNzIG9mIGJhY2tpbmcgcGFnZXMu
IFRlc3QgY29udHJvbA0Kd2hhdCBwYWdlcyBhcmUgYWxsb2NhdGVkIHRvIGp1ZGdlIHRoZSBQUkwg
Z2VuZXJhdGlvbiBjb3JyZWN0bmVzcyB3aGVyZWFzDQp3aXRoIG90aGVyIHRlc3QgY2FzZXMsIGl0
IG1heSBub3QgYmUgYXMgY2xlYXIuIE1vc3Qgb2YgdGhlIGVkZ2UgY2FzZSB2YWxpZGF0aW9uDQpp
cyB0byBlbnN1cmUgZXhwZWN0ZWQgcGFnZXMgY3JlYXRlZCBhcmUgYWRkZWQgdG8gdGhlIFBSTCwg
bm90IG5lY2Vzc2FyaWx5DQpjb3ZlcmFnZSBmb3IgaWYgYSBQUkwgZmlyZXMgb2ZmIG9yIGdldHMg
aW52YWxpZGF0ZWQuDQoNCklmIHRoZSBob29rIGlzIGp1c3QgY2hlY2tpbmcgd2hldGhlciBhIFBS
TCBmaXJlcyBvZmYgb3IgZ2V0cyBpbnZhbGlkYXRlZCwgdGhhdA0KY291bGQgYmUgcHV0IGluIG90
aGVyIGNhc2VzLCBsaWtlIGV4cGVjdGVkIFRMQiBpbnZhbGlkYXRpb24gY2FzZXMsDQpidXQgSSBk
b24ndCBzZWUgaG93IHdlIGNvdWxkIGVuc3VyZSB0aGUgYmFja2luZyBwYWdlcyB3b3VsZCByZW1h
aW4NCmNvbnNpc3RlbnQgdG8gY2hlY2suIE5vdCB0byBtZW50aW9uIGl0IHNlZW1zIGEgYml0IG5p
Z2h0bWFyaXNoIHRvIG1hbmFnZQ0KdGhvc2UgZXhwZWN0ZWQgdmFsdWVzIGZvciB0aGUgUFJMIHBh
Z2VzIGFjcm9zcyBtdWx0aXBsZSB0ZXN0cy9zdWJ0ZXN0cy4NCg0KPiBPciBtYXliZSBhbm90aGVy
IGtpbmQgb2YgcmVsYXRlZCBxdWVzdGlvbiwgaWYgd2UgYXJlIGFkZGluZyBzb21lDQo+IGV4cGxp
Y2l0IGludmFsaWRhdGlvbiBzaXplcy9hbGlnbm1lbnRzIGhlcmUsIGFyZSB3ZSBub3QgY292ZXJp
bmcgdGhhdA0KPiBpbiBzb21lIG9mIHRoZSBvdGhlciB0ZXN0cyBsaWtlIHhlX3ZtPw0KPiANCg0K
eGVfdm0gbWF5IGhhdmUgc2ltaWxhciBhbGlnbm1lbnRzIGJ1dCBzYW1lIGlzc3VlIGFzIGFib3Zl
LCBpdCBpcyBoZWF2aWx5DQpyZWxpYW50IG9uIG5vbmUgb2YgdGhlIHBhZ2UgYWxpZ25tZW50L3Np
emVzIGJlaW5nIG1vZGlmaWVkLiBBbmQgaWYgaXQgaXMNCm1vZGlmaWVkLCBzb21lb25lIG11c3Qg
YmUgYXdhcmUgdG8gYWRqdXN0IHRoZSBQUkwgaG9vayBmb3IgZXhwZWN0ZWQNCnBhZ2Ugc2l6ZXMg
YW5kIHN1Y2guIFNvLCBpdCBmZWVscyBsaWtlIGNvcnJlY3RuZXNzIG9mIFBSTCBwYWdlcyBhcmUg
b3V0c2lkZQ0KdGhlIHNjb3BlIG9mIG1vc3Qgb3RoZXIgY2FzZXMuDQoNCkJyaWFuDQoNCj4gVGhh
bmtzLA0KPiBTdHVhcnQNCj4gDQo+ID4NCj4gPiBCcmlhbiBOZ3V5ZW4gKDQpOg0KPiA+IMKgIHRl
c3RzL3hlOiBBZGQgcGFnZSByZWNsYWltIHRlc3QNCj4gPiDCoCB0ZXN0cy94ZTogQWRkIHJhbmRv
bSBwYWdlIHJlY2xhaW0gc3VidGVzdA0KPiA+IMKgIHRlc3RzL3hlOiBBZGQgdHJhbnNpZW50IGRp
c3BsYXkgUFJMIHNraXANCj4gPiDCoCB0ZXN0cy94ZTogQWRkIGxhcmdlIFZNQSByYW5nZSB0ZXN0
cyBmb3IgYmV0dGVyIGNvdmVyYWdlDQo+ID4NCj4gPiDCoHRlc3RzL2ludGVsL3hlX3BhZ2VfcmVj
bGFpbS5jIHwgODI2DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
IMKgdGVzdHMvbWVzb24uYnVpbGTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+
ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDgyNyBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgdGVzdHMvaW50ZWwveGVfcGFnZV9yZWNsYWltLmMNCj4gPg0KDQo=
