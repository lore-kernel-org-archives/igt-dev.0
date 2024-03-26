Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02F8C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5534610E3D9;
	Tue, 26 Mar 2024 09:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGYOzBeE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C010E3D9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711444995; x=1742980995;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=88l25aBT6HZ4QnxCPSea65LBE4njvMuoC4Dm8LA95JQ=;
 b=ZGYOzBeEBEQD7/3X08pcbxlqk0peebl/v0Mvl7qoLXCsGKwav1qFcW0W
 LZGnAMgLD6taf7Hfj3JQl2/XbKp8U64HG3esV++Y93PZDdSw7VHTL8c02
 xdecnSpQCZEyg5FQ/oHcbsZVzPgTm8YvWAouYgjGQSTE+g+z8FatJQOS/
 00uSbDPjJ32sybCWZXUvSVAIUidVNieR3IyWSSaAaE4i9mxr7jiOqlpjY
 Q4B36q3PXY9cH/9eCf9/d4OtXZDRIEuTr3h05Aa3UOLZK4ILLwSrFxmcx
 nykeNE+UDqgBFcBSYzcpPdGL4Yb/DBNp1eO4tveI8nxnDBMCzJZQqBzYN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6377383"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6377383"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="20379511"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 02:23:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 02:23:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 02:23:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 02:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW9zW3saKBf/fK+LaA70S2dHzRhstLLi4GF7n30NeJy4K3WEgBCXh0bjm9zwL/8hepmu8SIFG8Zykm+oGufdRtY/fUt02GFbFra3h+KZIRtUX55S5vfc0tpu0AvjYxcRIZmggA10QOK37FiDV7TMKjmnCR5WrweIbNBqgJeb4mpAM0NppV9biixkWmvr5PKYC8jeMvJaAKqaaPnTEa7Fe13KKV/9IImMu++Pq4u43YzGONAU6yEezZLfurN216mebqTnPZo6k+HIDI0ljB8wLRHTyfidOUQ143Al6HIRvPQKBf4cOquuqnbZc21A/QtKbK06wXXhlMD7F7t4YJDT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88l25aBT6HZ4QnxCPSea65LBE4njvMuoC4Dm8LA95JQ=;
 b=aIvM8su0f8EoH1cZ/dwdL5LDd0CWyd0gB4H/9uQqd312iJpl5CGSckuGe0iAPzvJoOlYnRkYOqzmODyVhQFx9BbfG616aCJninGYNfCNfcr+upT0ucsHxKp/MoZ/KGR3MOQwDb8RxZCwhPR5WVuaTfodpTmlfvKmEl/oG7m+1w9p2Y0P0cK6jpxURLHP6A6aa8j7/VnhNv1OJL8Bke3vPujXN/yMMIB1Tzzv9R9xryA0mYh7Bu9H/cxUszNIafVoLVxJSKNYpTne/nPrKY+A74lzbhLcXYndetyouTZAonIYo2quqvN0kqZIrxNDoNMEG5HCGhsYCJ+ktddzB/OZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 09:23:11 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 09:23:11 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>, "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t 12/12] tests/intel: Move xe_exec_reset.c to Reset
 Sub-category
Thread-Topic: [PATCH i-g-t 12/12] tests/intel: Move xe_exec_reset.c to Reset
 Sub-category
Thread-Index: AQHafFaL93IFFY499EOtrJMd52pihbFImBQAgAEsn1A=
Date: Tue, 26 Mar 2024 09:23:11 +0000
Message-ID: <IA1PR11MB6097BB6B198B7079B6FCFD4286352@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240322124108.1825345-1-katarzyna.piecielska@intel.com>
 <20240322124108.1825345-14-katarzyna.piecielska@intel.com>
 <20240325152324.4igpiw3es535vtbh@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240325152324.4igpiw3es535vtbh@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|PH0PR11MB4840:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MdxIduX+RgGBjtbQZ5NWABsmOQR/9e6K4MeM1L+Fhzd/IChU40oXVZeDvGJrjjirfz/7e/pvl7bBG+jTqIukfnmho13i9ZvQ01/CUDHXd15v5nCQQk7Hd3UrPPngQnH5QBaPlD4JgkSN8wdkFqFm5KzAJSDtpWLnLid+9DVAC9K5eqqutXo5QYesu4g1H52U3uaJRo/mHJYUn1Q8Gre7KYev2VVMTUswzCTo8lX/On4xeSJ1xwGv86z7vJIecwt/p7yb7Jw9GRu6ZdenSgnK0+qFvcJpgeYno7zcQtNv30jpiRg9ugEPgfEBJL2UEpmyJeZWxsWq/NEh8KXmoiO5POAuvqrOw77L4bmRnNltrKSGB6igIxDnX5o13eVzjJ1P3M8xe0xy+8efnU0TyIFYQUE2M/5EOGv8GbqS4RtJoLfMoTX9IA6XivV7YiyHt/156JJs1tVxUB3PjgiNITWubxWBTb8dSAsRe2R7Bl2B8W6rxKwxN3MxNwxWwi+aTwpwIOP4w5BFgGuYIUel/9ibEa6K0GU4Ue6gvtoTS9fR3z0mfLU+m6vlz/+ZK5WAi0GQ92dGk542IAsdTErjkzt5+VPlTadE52Y4f4HWdGQ9Lel/EiD4ZdwIjCsZOouW+6I1qzoCvdO5U1goAMsQkcBCYyd2hMd4pbICrVy4NNR/Zs8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnZKc2pUenNURE1VcmxSTjdzN2hOd2I0U1NPSkhySVhTSFhaMG0raDhsWEFs?=
 =?utf-8?B?V3JVVVc2dEgrdUw1eEFtRDhHUm9LMTl3TkJSL3BxOVRIc2dBSW9wNDhmKytz?=
 =?utf-8?B?cGpBYXJXV1lvMytjVHI1bzRsdk9xSTVZRmEwOGlQRGUyUmdOcFlMK3IxbW9P?=
 =?utf-8?B?Q2w2bHY2TVZCbWNqL1BMUE9BT1labFp5NXMwckxLZU1jemJxZmhuNlZCYTEr?=
 =?utf-8?B?aTRCVmZuQUR5Y3RtdDZqKy9jeFgxdkRGekZXZ21lU2l6WWplSG5CRlI0MXYz?=
 =?utf-8?B?L0tMSFRBQlhtT3FzTXhnclFSZXBvYU1QWGdId1lzcGNSYkdiQzRSUlFPbzVt?=
 =?utf-8?B?dXo1YmJZeG9udTNwRDNjN1FubjdKTy9zcS9LWjZFSVprbysyOGJMdXhOYjdQ?=
 =?utf-8?B?VTVtSHVYQWJobk1DdS80MC9CQ3QxR3kzUCt4VUxYaVQxaHc0TVhhMDZvQlRs?=
 =?utf-8?B?ekZvcEorU2YvM3kwbXBGSU94MkpyQmxpZlFuUWFnbTRSZHJZNS9XSHE0VWpy?=
 =?utf-8?B?RWZCMG9ITDN1Nkx4Wmphdi9WMHUwVWRLL3NHWGVMQktVNEdDSzRYZEZuYlpp?=
 =?utf-8?B?dTQ0d3I0YVFGdEpNeER5WXFMZE9aZzZINWJzMnhqellZY3JZWTh5dkNUZnpr?=
 =?utf-8?B?SVJUK085eFhwalB3b1Q3aXl3Uml6NythWnU0QkIxeTF3K25zUkFpMnBOL1FV?=
 =?utf-8?B?My9qcSt4TnllNUMzUUJVREY2VzlQV1IyMTErWmQxNGh5cE8yMnJHb1ZGS3JV?=
 =?utf-8?B?dWN4ck4yek5WV2JwVWh1NkZFZERGVDd0OGxFclNCQ09tNFNPNGw0NXJQdkdY?=
 =?utf-8?B?RGZYN0UzdElOWkZVR2dCT083TXJzQXpQVXduR1FwdXYwRXR1eHZIYXBQUWsr?=
 =?utf-8?B?V1FBSkRaR1lNVERiRktHT3lFcDUvQm1KRnBJNlBQREh0a0NKZzB5SEVXV0lQ?=
 =?utf-8?B?L2F2UWFZdmNOUGR5T1MzWm9TL1dqNFBUMWtJZys2Y29CcUI1d2pBVm9ON1ox?=
 =?utf-8?B?Umk2TzVpM3JPYkRGZ0h1UmRIempmWXZGWnMzQUZ5V2RGc2FaNTI4WlZWZWow?=
 =?utf-8?B?M084Q2M0NE9HbXh6c2VIRlZLVE1EdlVrUS9KSEx3RXd5Mm53ekZrZ2Q0VTNQ?=
 =?utf-8?B?QXV3cE5IaFZxaVgrUGs4MFQ2KzNUWWNzaUUvaFVmNTJyOHlhK2t1MUhhRU9K?=
 =?utf-8?B?c0NZeE43TVluS1BWaklxK0dxOWRZNDAvYkp0ZjF3OVlTano4bnJrN1ArTjJG?=
 =?utf-8?B?L2hXQjk0c2hXbllHaU1sQ1drZW0vTzM0cXdjSWZXVjZjQTNTZE9JS0x5UGE2?=
 =?utf-8?B?eDFXVXo4ejN2dGtkaGpYUUVWdXRhbVIyQnhZVGtNZ2QvOUFOdGdKR2wzbWRH?=
 =?utf-8?B?a1I5Vm14dTZ4Z1RSQUdUbUpGNFI1Y0lYdkxJZUlXM3I0QWttSGtRRmVwSkNs?=
 =?utf-8?B?V3AyQXI5TGRjWEc3am14Q0sxVzRVb1lYejBkSklEWm05bUZabkordGZqMU9l?=
 =?utf-8?B?VjlUUVZ5L01VS2paaDY0dEdDSjU4YStUYzhKQkZLU0YwOThQS0g1QlhXRTVY?=
 =?utf-8?B?S01OdnFoMlJJOUNTSlNodlZlclFaOFpJQ2xzMDVKakU1V29wOVlYYi9hS0JQ?=
 =?utf-8?B?ZitOUEQyWkpzUmxSYlpYTzFPQlJacVpYRzN5Mk5xNXVHUnlMeTNaSFpzZFQ5?=
 =?utf-8?B?dkp1VExVbmtmNmo3TU91QWdORmhGNHMybVN4a0R4WU53TmhFejNBRk9pLzJO?=
 =?utf-8?B?cFVDRWVlMXNaYmNvSWVRTGNublpGdUNQYzlLVHkzSlRmSExIWEtkNVlCVWF3?=
 =?utf-8?B?T283R05IV0dlanMzaHNwOWlhZDI4MVNkMEtPaGdYbGtIdGtWMDJzeE51ZXVk?=
 =?utf-8?B?ZVpzUnlRMFNTanlnbGVSZklqUUc0YjgySFNQdFRTYVJNUkdMUVNqWG1sWGdm?=
 =?utf-8?B?V0JXeU9GVE10SWRubytjemdTcStRdW5iNmxMcnMwNTZzQWxHM2YvcFl6aGth?=
 =?utf-8?B?MDRvMjl6OEtSQ1QvekhENCtDdnpMMWcwb3d6VHl3TURCckRaNWFXOVhKM3Bp?=
 =?utf-8?B?QlBRYWZwMUg5SklyV0ZoMUs1dG0xL3hLV1N5bTV0TDJlN0dhZ0xxMmtjSHRi?=
 =?utf-8?B?M3pMNXNDNlp6ZFF2RzM5cS9TTmQ1aG9JZkhtbUFwMWhkaElmdGRiajc4dGo2?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc6c565-ff9d-45ea-08bf-08dc4d765b5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 09:23:11.4003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FBYznndJszMZI8AxMfprEalNHi9QZhVGE0aNjExV0/7zbs67007FKv44MCwYHT3QSSp/pLWJKpJemNR/9FWRYbyi5lsmKYWi2Lhk4BslOS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

SGkgS2F0YXJ6eW5hLA0KT24gMjAyNC0wMy0yMiBhdCAxMjo0MTowOCArMDAwMCwgS2F0YXJ6eW5h
IFBpZWNpZWxza2Egd3JvdGU6DQo+IEl0IGxvb2tzIGxpa2UgU3ViLWNhdGVnb3J5PVJlc2V0IGFu
ZCBGdW5jdGlvbmFsaXR5PWd0IHJlc2V0IGlzIGJldHRlciANCj4gZm9yIHhlX2V4ZWNfcmVzZXQu
YyB0ZXN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFy
enluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8
bWF1cm8uY2hlaGFiQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IEFkaXR5YSBDaGF1aGFuIDxhZGl0
eWEuY2hhdWhhbkBpbnRlbC5jb20+DQo+IENjOiBHaXJvdHJhIEhpbWFuc2h1IDxoaW1hbnNodS5n
aXJvdHJhQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMg
fCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jIGIvdGVz
dHMvaW50ZWwveGVfZXhlY19yZXNldC5jIA0KPiBpbmRleCAyMjczNTY4OGEuLmNjMTA5MDBkOSAx
MDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX2V4ZWNfcmVzZXQuYw0KPiBAQCAtNiw4ICs2LDggQEANCj4gIC8qKg0KPiAgICog
VEVTVDogQmFzaWMgdGVzdHMgZm9yIGV4ZWNidWYgZnVuY3Rpb25hbGl0eSBmb3IgdmlydHVhbCBh
bmQgcGFyYWxsZWwgZXhlY19xdWV1ZXMNCj4gICAqIENhdGVnb3J5OiBIYXJkd2FyZSBidWlsZGlu
ZyBibG9jaw0KPiAtICogU3ViLWNhdGVnb3J5OiBDTUQgc3VibWlzc2lvbg0KPiAtICogRnVuY3Rp
b25hbGl0eTogcmVzZXQNCj4gKyAqIFN1Yi1jYXRlZ29yeTogUmVzZXQNCj4gKyAqIEZ1bmN0aW9u
YWxpdHk6IGd0IHJlc2V0DQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QN
Cj4gICAqLw0KPiAgDQoNClRoZXJlIGFyZSBzdGlsbCBzb21lIHByb2JsZW1zIGxlZnQ6DQoNCm4u
RnVuY3Rpb25hbGl0eTouLi90ZXN0cy9kZXZpY2VfcmVzZXQuYzogKiBGdW5jdGlvbmFsaXR5OiBy
ZXNldA0Kbi5GdW5jdGlvbmFsaXR5Oi4uL3Rlc3RzL2RldmljZV9yZXNldC5jOiAqIEZ1bmN0aW9u
YWxpdHk6IHN5c2ZzIHJlc2V0DQoNCkxvb2tzIGluY29uc2l0ZW50Lg0KW0thdGFyenluYV0gRml4
ZWQgdGhhdCBeXg0KIA0Kbi5GdW5jdGlvbmFsaXR5Oi4uL3Rlc3RzL2ludGVsL2dlbV9laW8uYzog
KiBGdW5jdGlvbmFsaXR5OiByZXNldA0Kbi5GdW5jdGlvbmFsaXR5Oi4uL3Rlc3RzL2ludGVsL2dl
bV9yZXNldF9zdGF0cy5jOiAqIEZ1bmN0aW9uYWxpdHk6IHJlc2V0DQpbS2F0YXJ6eW5hXSBTdWIt
Y2F0ZWdvcnk9dWFwaSwgRnVuY3Rpb25hbGl0eT1yZXNldCBpcyBub3QgYSBjb25mbGljdCwgYnV0
ICdzeXNmcyByZXNldCcgc2VlbXMgYmV0dGVyLg0KDQpuLkZ1bmN0aW9uYWxpdHk6Li4vdGVzdHMv
aW50ZWwvaTkxNV9zZWxmdGVzdC5jOiAqIEZ1bmN0aW9uYWxpdHk6IGVuZ2luZS9HVCByZXNldA0K
W0thdGFyenluYV0gc2VlbXMgY29ycmVjdA0Kbi5GdW5jdGlvbmFsaXR5Oi4uL3Rlc3RzL2ludGVs
L3hlX2V4ZWNfcmVzZXQuYzogKiBGdW5jdGlvbmFsaXR5OiBndCByZXNldA0KW0thdGFyenluYV0g
c2VlbXMgY29ycmVjdA0KVGhhbmsgWW91IGZvciB5b3VyIGZlZWRiYWNrLg0KS2FzaWENCg0KDQpJ
dCBjYW4gYmUgbGVmdCB0byBmdXR1cmUgcGF0Y2gsDQoNCkFja2VkLWJ5OiBLYW1pbCBLb25pZWN6
bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQoNCj4gLS0NCj4gMi4zNC4xDQo+
IA0K
