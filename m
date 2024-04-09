Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D740C67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 22:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352C0112D4E;
	Tue,  9 Apr 2024 22:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzUVtrJQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF6D112D4E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 22:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712702732; x=1744238732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3UnbdIcmUiqk47LHbD6S3DulGQMmJqUuurFkWUt9QHY=;
 b=bzUVtrJQsmd45r1nkE8HQn5/suwkqdxlDZM/TfvYFpO81bqX9qlv/op1
 JObFa8riXogm8NZgeYtUKJBCCfixlCpx6P9kfAqAnWQ/yIvSeqjj6So4p
 c7K2Pn2+MtW0NeZiN1zBwjaPWdiwkAGrz/mtFcZfs5kcorPuB9WrGX/i9
 o11x0X6a8pVxR0sUfttX93cYW+QQm5kT02ok3J/A/I95YmFePP0qC0izP
 lDJG3hDbce8KH8MDhA2Fa/hfusN+vd4pOXfdxsPO9Bjw3zu3GgoenlGwq
 EACIFjLWZ0N1hrCAZoCTmfpt/mosq7lBOdm2Gc4SH+rPlQ0tpvjnnP4+a A==;
X-CSE-ConnectionGUID: o1glBhAwQ5KaN8T4aV/7Aw==
X-CSE-MsgGUID: Yme6MhMMTgeWpNy5RYpdNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8269655"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8269655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:45:31 -0700
X-CSE-ConnectionGUID: nyibNlRTRKqOSyIL0m5hvQ==
X-CSE-MsgGUID: mICou6/qRpmwEl3JW1Nnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="24867092"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:45:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:45:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:45:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:45:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1ivLE9zWcwaDuUMArWwXHIpTHniNCnCcsM/HuQZzwHw3ABKAQX68vSU8sa7dFmCQ+lVQkhsFqzOqur3uAmvqpUAD+I+DddAsNqHkr0cS+NLXrFoKxiMd7vzcAm7Oo/Z667LPwnK3bP2JAbreKeiEZgdveJG0IsFjKYK1r87e3uPQePnXjSfbkgOijZ3kOVQEuSuLcdQe+EISWjwI/whoAFt6HOnDTKuc2R0nmMm85IB+nEkeymI7/YtO52uW4CsNL4sV9UxBftz2rwJC+Tj4geIu3WcvYoY4xDfzG+qDEa8kPuiYGTZ22JaKRtHGl8ykdyZ0eODQuB1yHGCaO7edQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UnbdIcmUiqk47LHbD6S3DulGQMmJqUuurFkWUt9QHY=;
 b=aGYejo5uDU+c0fhSm2J6+CsEl/ig02qMeRhgyoWqmFvDRq3FKIa89UNDAGV7/cqeB0Tb+rqZ8o8+kcnXX3qhHmMKG6SiAC2cU5hwrrsqSYZD8ppyAFV0SPTfrUeu8zdnXrNxDlfZNkHQkCfSjXQZrFIE+DzUtwsAUFTu4wt+lSmA+RyWYXG45C0Sja1nWJpI2p+GrE3loWMh1EbY3XVixr2KejCWwi0Xlmrqu5e5fjt419pa/f46dYwvJLY8g8WU3xKNtlqP38ehzrW/iN2BzexKZwmPgRNbWuUubKkntLupK7ToTuW4I+4cWiHMqlCm4Mwi2anZ1hF+vesE7YzVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 9 Apr
 2024 22:45:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7472.007; Tue, 9 Apr 2024
 22:45:28 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t v3 0/2] Update compression check based on platform
Thread-Topic: [PATCH i-g-t v3 0/2] Update compression check based on platform
Thread-Index: AQHais8ND7BJOnZnlUej8YdV6sIWV7FgiMCA
Date: Tue, 9 Apr 2024 22:45:28 +0000
Message-ID: <CH0PR11MB54448DC6CFA0B66CB1921AA2E5072@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <cover.1712745305.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1712745305.git.akshata.jahagirdar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4582:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fHotrilLTwNQFCseqfrFg4tZqYRdmA90rtPkvJUMKAp/QWRYCZXdwy2ZWY8oWPKTIv+NZFW/hUf5o9OF/CB6zLKYBQ7Qu/8PSWbbowhrJVjc3ZTRC/j6hj2md6NHqD5JtP3zW80iTKevFj2t6KPFaV4NSESn0Bk8+3UlL0el38RV11crVhIv4pKXNNY4ZzwNc5ur3S7g6sfgXMsUPGr0ej5vT7YvM7tPn0C1EuDPQ9EygqJkQQTI8H2uKFdEW9ZMrE6LepKVg3HOJA6ol0vfHO7RdD7yqsJFaqon2Ikf9yUAYkXbOi+wkX5Pvy6+P3AO+thEj9StCzifEnPeimncICFbmYZx+Q6xGDC43TAdgnx1TvUAjKp4PC1haJnXlIfQXhVV/trceMIozP8gB+npxgknRoOieOxzFwQfZWdG0go7/5NCCPhgwLaI7WpCSFoDR6xP2p2GUxCDVID1VM5dawTjol9CLDt5J08CFMxF1b0pt25eiCE0fX9Y73mTUSMaetNBn+JsVz3evuDigNDWazeI7I+Hob7g57UyFqIpQq9qDdxynKtHnINUq81oAB1RMa0ve5eEwuQ8ujZ2M1QVzidoLI0v3M1YuPlezexXjZR0hYPY5hTBAvYEPYu0y7aa6Yiwa1JuIn59ZQPqY9SVVHLuCWz0tpVa6bBn6X8SN24=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2Qyam5RaXdPTlJXY2s5WW1jcDZkNG1zOU9jK2JTUGF5NmxDWDc2eTI3Skl4?=
 =?utf-8?B?Q1lyQnhaaVJIT1RjQTZ2YlRPMUpKS3ROS3JkUzlkdVZOYTdpOGI4M1IvbXlQ?=
 =?utf-8?B?d2NVVUhiUnpjVW1uU0dLc0hIU1VjeWg4UGNhRnJnZ2hWaXhzdGgwbTFXVmRX?=
 =?utf-8?B?Q3Z6SEMvVHJJQ3dOR0hzUXNaOUhhS1JSSVhRUXV6b2lrTEtyME1iUkhJRkV1?=
 =?utf-8?B?Q3BnL0hzUXFManZoS2NtYytnRU83VW1jWDBpMFZzVDlrbjMyUmRKR3F3Y2RH?=
 =?utf-8?B?UUdlaThMSzRSWFFVcCtEVEwvRHczWS9NWGpWa2srcUcyUCtwVlVpOWRGQlBp?=
 =?utf-8?B?NkE2bmJ1Z3FXaE8zS0dlaTJRUC9QZ2VSV2JnUzdobGdIV3VFQkMyTWtsZVVU?=
 =?utf-8?B?ZFZqcDIxRXdaZjFsQmM4Mis2UVZQT3NYeWJGYWhGaU95VmZlSDM2OVB1ZjJo?=
 =?utf-8?B?VzVpR0ZUUjBNVmNpRllrNmVrM2JYaWhrM1JNcnRHRUMwdDZMWFpPaE1rNUhy?=
 =?utf-8?B?UHNjN3hOUTNhMWRxa1cyZ0J5ODRqQk80M1BMblg5cVRoZGN2MG1zZWlIVnNr?=
 =?utf-8?B?VEJFaExrb0lDK21NRk1zUlFrVU9FOHVpZXk2WWd2UEFtNzYvcmM5c1czUEF2?=
 =?utf-8?B?MEgyMDgyUlRIUnc2bEhiVnRuM0Q4dldkVVh3MFBjUm9SSTJlLytYbGQwU253?=
 =?utf-8?B?VHZKQzdMaHM5TnhlQlYvbFdIY2hGK1U3MS95U2JHY3daTkpHNnFQejNzSDAz?=
 =?utf-8?B?ekFsUEpWZTBLRmwrUFIyZDdwK25LblZ5VGw0a3YreUhJZDRCSDF1eG93dWlT?=
 =?utf-8?B?eGRoUTNnTDNLU3ZHZkJ1VHdvTTZROWdTK3E3UUoxMTA1aXM0YVA2QTJrVUl1?=
 =?utf-8?B?Ni81a1dvQ1ErUXc2ZWNSeTk5WURxenVwVjdQalJZSEtaRTFMVXpSZm4yWFh2?=
 =?utf-8?B?OEFmNkplZVZkclVIOUU2MStvOGU1UUs4M0NGa051R3NJdHlMRjhtZ1hyNi9h?=
 =?utf-8?B?OUZuWFlWUkxhTnAxeHBaL0k1SC9XNlJ2RERoRG9nZGF1cTVEYzJSVXFFNDln?=
 =?utf-8?B?aHltb0Ivd1ZURWtGclJ0SXk2d1V1TmM0ZENBZTJMeGNnZ2NsbllSOVBicVdN?=
 =?utf-8?B?dDJEdkVScUFVYmJKWFNoVjlFeVROWXo1QnZVVU50WGZpMlo4SEU5d2pEdURW?=
 =?utf-8?B?YmdtVFR3UFhpdG90UlZocTlwdU5XMFQ5eEtCQkFQUUZuQTN5SUZ2ano3VXNR?=
 =?utf-8?B?RXRySHNjY1pER3JtMHF2K3Q5ZHo5M2JEa0VxMHdzenRVV0N0dnh6dzVydVV2?=
 =?utf-8?B?cjJJR3drck9ONk1uUXYwZ3QzSDlSem1YbnZDVm1ENldJSWNHcnRUNGYyNDkr?=
 =?utf-8?B?TU9QbjBPM0xNT1ZmdENFZmcybnA1a1FtK25QOXFlc1NiV0tPSUNVY2NhZXhj?=
 =?utf-8?B?ZndQaGVkQ3NzaUM4eWcxZGI5ZFAyU3NhMlpQa0FmcmhUVVJWVFBJZUpLUTdJ?=
 =?utf-8?B?MGJUOWxEOWhzZmlzTjdzNUdIQ2QwRGUxeEJkc2dUeFNZaDIwY1pBNm5hNURT?=
 =?utf-8?B?QUFvRVdPeW5ETFRTZnNFU0NjZGVSNklxdWV4VE9oM1FGU1lJN1E3ZXFWZ1Vv?=
 =?utf-8?B?SS95SE5YckhIUmR5dEhLL3NEbmU3NjkwZTh3YzhXZm1PZ2dXS2M5NlB5Y082?=
 =?utf-8?B?aTZpNUNuamw4UDlKNklDUC9JVm9aTmdEVHFxOXI3cmNIU051bVFIMFJWZlNI?=
 =?utf-8?B?THN5NFd5cThUaG15MGZOa2xXVUNaSVdVVGR0ZnVUVXNNeDJQUjcyNC9WaFVH?=
 =?utf-8?B?cHBSVFQ5b3JOM1RZY01QeXNIN2FSYkdBZ0lpYVhJTWNCVGdOWVVUOHZCUDd6?=
 =?utf-8?B?bEwvdGkwWDJ5eDBEU2dZTTRjZGN2N0tTVzVjM2d3dm4yK2xRZXZaZGliMTZC?=
 =?utf-8?B?dzRtUlpFOFJHMzhlT241QWE4SFZlVnlEbWlFR21mVWxhZC9IM25WWFNZSnNX?=
 =?utf-8?B?dG94ZTd3eS95ZlFFMlI5dTI5ZjZkMnBLL0VpZ0U0ZmNHMkJIelhzQmxzUE83?=
 =?utf-8?B?NHlrYVpIRzdERnhTZE9DSDJMSkhrTWhwQlhlYjV2NTJaNVZRbGF1a0QrRStP?=
 =?utf-8?Q?dxnmmMIw5GQTRgDoKBmD29mts?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587080ac-5ec0-49c2-575e-08dc58e6c0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 22:45:28.2084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYiPIyPnRJ53gLChJdJdgSyuSOv8Gb9adbNtEwgtVTiJJb06Y6QkroDLWlEEG8VfZLyGdqPI1sskcz16xgjJ4eQwWB58SMdUHFBJ59oPuy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
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

QWNrZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCkFj
ayBhcHBsaWVzIHRvIGFsbCBwYXRjaGVzIGluIHNlcmllcy4NCi0tSm9uYXRoYW4gQ2F2aXR0DQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKYWhhZ2lyZGFyLCBBa3NoYXRhIDxh
a3NoYXRhLmphaGFnaXJkYXJAaW50ZWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTAs
IDIwMjQgMzozOSBBTQ0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBLZW1wY3p5
bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IENhdml0dCwg
Sm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBKYWhhZ2lyZGFyLCBBa3NoYXRh
IDxha3NoYXRhLmphaGFnaXJkYXJAaW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHYz
IDAvMl0gVXBkYXRlIGNvbXByZXNzaW9uIGNoZWNrIGJhc2VkIG9uIHBsYXRmb3JtDQo+IA0KPiBJ
biBYZTIrIHBsYXRmb3Jtcywgd2UgbmVlZCB0byBydW4gdGhlIHhlX2NjcyB0ZXN0IHJlZ2FyZGxl
c3Mgb2YgdGhlIHN0YXR1cyBvZg0KPiBmbGF0LWNjcy4NCj4gQ2hlY2sgaWYgdGhlIHBsYXRmb3Jt
IHN1cHBvcnRzIGNvbXByZXNzaW9uIGFuZCBoYXMgZmxhdCBjY3MgZW5hYmxlZCwNCj4gYW5kIGlm
IGl0IGRvZXNuJ3QsIHRoZW4gdXBkYXRlIHRoZSBjaGVjayBvbiBjb21wcmVzc2lvbg0KPiBhbmQg
cHJvY2VlZCB3aXRoIHRoZSB0ZXN0Lg0KPiANCj4gQWtzaGF0YSBKYWhhZ2lyZGFyICgyKToNCj4g
ICBsaWIvaW50ZWxfYmx0OiBBZGQgaGVscGVyIGZ1bmN0aW9uIHRvIGVuc3VyZSBwbGF0Zm9ybSBo
YXMgZmxhdC1jY3MNCj4gICAgIGVuYWJsZWQNCj4gICB0ZXN0cy94ZV9jY3M6IFVwZGF0ZSBjb21w
cmVzc2lvbiBjaGVjayBiYXNlZCBvbiBmbGF0LWNjcyBlbmFibGVtZW50DQo+IA0KPiAgbGliL2lu
dGVsX2JsdC5jICAgICAgfCAxNCArKysrKysrKysrKysrKw0KPiAgbGliL2ludGVsX2JsdC5oICAg
ICAgfCAgMSArDQo+ICB0ZXN0cy9pbnRlbC94ZV9jY3MuYyB8IDE1ICsrKysrKysrKystLS0tLQ0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQo=
