Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B3DCD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 20:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AAE10E04F;
	Fri, 15 May 2026 20:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pLHSM8qS";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013071.outbound.protection.outlook.com
 [40.107.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6546010E04F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 20:57:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Myn6KwgICJ9/xpb4a24JBK7F4vk1KhRw8C0rcGDFBCc0GKldgY7vRZXV52mJY+dmmvqUuabHAXTDKuk+iJdq5xGPMrB1lJmsiOH+aeJDZ8OJfMxSWsj8VjoDQQxfKAggGfCEyx2e5tNHEYJNXtTrbEjOFiM0WyrQRTHKzQyvTzMbKjl7pnbrh6Q1JKupVh+dq2PJD6fIEYpOOkHv3os+irDvpOw27egt4PYzYtGCmYNKQXUbzMdFdafGudmrWfIIyNj38wuxBp1m9W2cQ1xCrB/0GYvo1fvQ+783fGMWQQc/JeI1GROaHA6nuTvy41WKqvEZKdJJ2ajM2S3EvbC08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZPXfkFksNsQjT7QTSnf0EFH+zM45ec7s7kLvDznCQI=;
 b=wdu4XVgAj2kLmWbQ46QiodKJ0g/brRwVBtZeFqIve1rM50TFsEZ55u10sXT6OEoJxvkYREjx5kLQgTDTwj296JjDpWEDhs/5GKE306DwtYdXpgFsvfyvj7xWe3fY0sOdD5841fAqQXTl6A2nbs/mICPu4m+yM1MJFwHz/EUeCM2SL9dY0xC2pk1n/TZQMqxv6DbeNZtoqMjCgktACa83EiULC1iJE1a47TT7o6xNMv+kMp12/24Qp4uCZkQNoCQkaF3NGI3OaPteGvXPcVWLLCUWpcbl00wM4L85oPG6aggYGvDj+xO1blr5Pbqp0h2Ewx/hRmKurECDqk7tGWjl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZPXfkFksNsQjT7QTSnf0EFH+zM45ec7s7kLvDznCQI=;
 b=pLHSM8qSfKhLPF/pruy3YnX/HbxyBEaLT01Y0KW1v+fCsKXWPi2KtBjIy3KN/0wZHeCNCiMii59rqRtQEdMSTcKJoe/qv46Oisi6hca5i1msfvTbDzjFDfD3uulFRugE9UVUIRM1s6JFG3XkyIJY5etjpBysfFRrjbd0GT26wDE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 20:57:42 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::699b:1fb2:73:6a33]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::699b:1fb2:73:6a33%6]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 20:57:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Subject: RE: [PATCH 1/2] tests/amdgpu: Fix queue reset monitor logic and allow
 -ETIME in CS helper
Thread-Topic: [PATCH 1/2] tests/amdgpu: Fix queue reset monitor logic and
 allow -ETIME in CS helper
Thread-Index: AQHc4/xmO1hLF2EAykW+/2xoglnznLYPktEw
Date: Fri, 15 May 2026 20:57:42 +0000
Message-ID: <BL1PR12MB5144C8D46750ACDB0FCF40A5F7042@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20260514235000.125069-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260514235000.125069-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-05-15T20:57:15.0000000Z;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD Public
 v26; MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|MW6PR12MB8735:EE_
x-ms-office365-filtering-correlation-id: db571848-e53c-4e42-a17a-08deb2c49ba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|38070700021|56012099003|11063799003;
x-microsoft-antispam-message-info: Sm0pYTNFkmxzR/RbC2kPBytodzTtj1eL1+PB614bnlveqWV35hwJgWO7111AwZvzO6YyghmyQKWkfh7V+bRGbgn+VhxfnqKJEkZO6sU4jDlxvCI5o6M0c8AxjTJub9t4xyFAquOeUrB4/2q62rQYwKKSIWjL4lSEcGdXuGekrc7L9yK+WFd822KHnFu9VeN323X5ohGW0biovIh304DXuQI2veQ53SYp+sK+2R6hmtEtENlTrp5fPwzufX9nQNEKg7KaCSU4Xaz54jown2siJc3628UQK3ard8PsSAxARkO8EqzzJ+TZwdIO/TdCHuItbi/8aoEfJBAyF4cqA1wzU/3WY4Y4OCuBKtxQcETq3WQlXmdGB0zdstXK6vVA+1uijvQR1WOMaR2dfqIrtHovT78bm9r8gxPWQ8K7cxGtOInCpIYMQ0zkn5NDBXf5qbhjJ0Jsd4HEWTccmiYQMhB+x/yKURWKUkRfEj3SQFitz7jEImlX92nGcg8KzU8jx6LcohL/QtJ3CzDZLvgs50WaA315nxwOJttRMXvNoDpdzG2jUayfKk8gu5tyOdHJWeI18eCsSCKGn6++mZnfo6O91Y+FpeJ+RT000Eh8nQlFWJZwq1mICU9s4HDOIu3wZjzZEtnhWcsZHjg3gvFUNqHjOqlhcBnO9viH3iEKzeD9nUG36ox8OOQULG5+jQ4rw4bVPSkEHNqMDUyyb1+s1X7yvo1HGDRGGoKo+A08TvaV8/wW/JWUYDZ2mqOqyer36Ph5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzJPWENvcXlGdDExN2NRNTlpS0VobUhyNzFXZmhQM2lkbXRpVGdoaFdkUmtx?=
 =?utf-8?B?bVIzY3Rkc0JoeGMvb0RSdktyaVNERG5vclBoeXNBYVRjMEpMb25iVWV3Y25F?=
 =?utf-8?B?N01jWVlmRzlMSUxLTVhIeTVpdzNLb3k1L2ZBdjh0R3p3aEMrT0NxVlV2S0Vj?=
 =?utf-8?B?RnF2OWRjbTFwMnVYSnliRjhDbnpsQmdYQUtzcDZpUzY1Vng2YWkwd3Fuc3lI?=
 =?utf-8?B?VlpoTmI2WExGUVpYaVZUWjlVOHZMS0FkQ0ZnYm1WT0ttaHdoalhPOU1VZDJk?=
 =?utf-8?B?eUgzamF2MnBTR3BHTk01TEZTNVJWV3NSazdlL3BmNUFuR1JaR2tBd3AreHVR?=
 =?utf-8?B?RS9CQndiOFExM1MxQU1nWVNjUFhUUVFOeTJXeDhneHM0SmZ0bW1oZDFXMW5T?=
 =?utf-8?B?YnR0eVFMNXFDeWRyNXJVRVRyWGp2MUtBZVpHOStHUVBnck1WcXZLcElVTWN2?=
 =?utf-8?B?T1NMUnRmb2c0T2VPQk1uSE02Tkt1NkJBTEVoY3dJdkVyVGpuR1U4dXl5RHB2?=
 =?utf-8?B?SGVtelpVSGpXSjRUUk5MRjhCbXltRHNYUFRLcUhoV2JLUHV4SStwVjZwUlVN?=
 =?utf-8?B?MXZoWFpDQmlVZEcvaCtxeUFWV1Myd2hPRi9OTXV4N3BtQ2VSNDJlMXQrZysr?=
 =?utf-8?B?MUhRSVFod3ZlQWZXSThhYjA2dDZncmFVOHN5VkI1YUM4cTlPSnFjYXFpKzRr?=
 =?utf-8?B?ZGlSOXkxQ0tKVVBnbDhrOXdVUWZaaWRiYUpMWm94M293L2N1SzRqZ29nRC8r?=
 =?utf-8?B?cEhXSm5YejBvMXA2OUNWS1Yxc1BVYlcyOTlJdzNtMXBSQjRzc1AwNytRSENZ?=
 =?utf-8?B?aTkwNUw2YnVkbXFHSEoxdThnZWF4ZGV1dXQ2bUJFb0JYa2pnc1B0c0VkVFkx?=
 =?utf-8?B?RHJPS1FOK1BobFhmSzZ3NnYzNmdtVVZhM3FXSHVoSXpOekpwRm1oUWxVbkZw?=
 =?utf-8?B?VUVXQ2RGQ3lncWFzcGR2SmJ5dUdMd0lCK2U2eGdZOUFHN3B1bkQvM2s5ZlBV?=
 =?utf-8?B?QWdFU2VvWVdmUkUzWjhzSTVpWDU0U0NlVWlLSmhsZElFQ2ZaU0xTVTd3ZFFG?=
 =?utf-8?B?VW5YMm1RYWVtOXVhaGovQU9JNXIrVHRzb1VJSFZ3bnlwbnJDWWZ3UExtazZz?=
 =?utf-8?B?Z1hYSWplb0hOR3dGL0JLOGhHQ3dZZVIzZElQbllsRSsvVVFLb1M0VUQzTE1h?=
 =?utf-8?B?aG9BWldKVng4T1UrellLbTdLbmppNkN4Q0w4eFhmNzFpT2oyWFBWelBUekhq?=
 =?utf-8?B?YzBEWVQyY1lpd0ZGdlFXdUtrakY4bjRFYUczV2NzT2tGRTMwVllZalpGT0py?=
 =?utf-8?B?K1B1SEF1cDFYUnRmOVVwQnY4VTBCYk5hMGYxK1owTU1IR29wT2VQanF4M1FX?=
 =?utf-8?B?NnpFejZUdEN2cnZpNFEyeWJOM1lmL3lHemgySDVOUmcwbkYyaUNMMW9TV2or?=
 =?utf-8?B?QXloSmMwY1F4TFR2NzUya2lWS050REtLQ1hTRWFBaHYyaGdZbWM1aGVoemZh?=
 =?utf-8?B?Skx2NXRCcENqOFI5TDNYOVlraHA2bTVzUjBENjdUdVRZT1owQm5ib0Q1N2hu?=
 =?utf-8?B?V1Y1Mi9TWGMzMzMwU2lvbjJ1V3N5YnZ3bGdvbkxIMlpoK1J2MFc4M2VMYXZF?=
 =?utf-8?B?dXhnb3dQSHpFeDVTa3RNdmtET3JTQmxKVzBEVXoyMEdSZHNVSCtGSm5Cd1dm?=
 =?utf-8?B?NkpPMHp5aDFEWFh0TGRhMSsxL01NVU92VXArN0Y2Q3VsM1poai9uNnhqTHJN?=
 =?utf-8?B?ZGd1RWdheDR0UTVmRm5ueE0vQVY4K2NCU1hZSDEvNXo4M3ZEcDI4dkpSNWQr?=
 =?utf-8?B?RlQyQXk1cy81QllBdXpZSnZ1QlNxM210MHZTamVZQVprZkZQQ2RVanA3emdy?=
 =?utf-8?B?S2w5QWlRR296a1RUZ2JUVVNBZGE2ZWcrSHd0NGRXd2FRbkk2ZmVzMnViYitn?=
 =?utf-8?B?QjRQNnZhOWgwNEtCNzJnZDNVMlRyTUZaV3Axb2lMWGVEY3J0UCswaTBHc2F3?=
 =?utf-8?B?ZW44djhGUlN0SmoxQm80ajl3NG04VjV2WTJTK0ZQa0xRdXRiQmEySlFnSEc2?=
 =?utf-8?B?ekhrSm9DUUpLQnNUYnM1YXhWZUVoNitWaERScjM5Kzl2WCsvVmdTUi90dkNR?=
 =?utf-8?B?aWcxendBb3ZoVWdTSk5hRWlMMml0Z3V5Z0lDVEFWSU9jbHdEVXZNUVErTVpj?=
 =?utf-8?B?K053QmZ3cEZVQmRKUEdTUUhadFpkSEduOURtL2MvYXFEWGNxdUxoeFo5OFhS?=
 =?utf-8?B?NEU3Tk5jV1Y0b3ZNdStMM3NTOGw4ZGRLQVluUW82a0RHdHlaYklhYkhxUGxH?=
 =?utf-8?Q?IO5tuiSG2XTxsTXAt4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db571848-e53c-4e42-a17a-08deb2c49ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 20:57:42.7544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b4AAr5R5P0JBkG+IQpswEPPYzecyw4c8AxUZNDPV5hmyullDKNw0AtHAhZBsR076CqSIzju89omExhk25S05Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735
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

UHVibGljDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogdml0YWx5LnBy
b3N5YWtAYW1kLmNvbSA8dml0YWx5LnByb3N5YWtAYW1kLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IE1heSAxNCwgMjAyNiA3OjQ5IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBDYzogUHJvc3lhaywgVml0YWx5IDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPjsgS29lbmln
LCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IERldWNoZXIsIEFsZXhh
bmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFpoYW5nLCBKZXNzZShKaWUpIDxK
ZXNzZS5aaGFuZ0BhbWQuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSB0ZXN0cy9hbWRncHU6
IEZpeCBxdWV1ZSByZXNldCBtb25pdG9yIGxvZ2ljIGFuZCBhbGxvdyAtDQo+IEVUSU1FIGluIENT
IGhlbHBlcg0KPg0KPiBGcm9tOiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtAYW1kLmNv
bT4NCj4NCj4gRml4IHR3byBpc3N1ZXMgaW4gcXVldWUgcmVzZXQgdGVzdGluZzoNCj4NCj4gMS4g
YW1kX2NvbW1hbmRfc3VibWlzc2lvbi5jOiBBbGxvdyAtRVRJTUUgYXMgYSB2YWxpZCByZXR1cm4g
Y29kZQ0KPiBhbG9uZ3NpZGUNCj4gICAgLUVDQU5DRUxFRCBhbmQgLUVOT0RBVEEgZm9yIGdvb2Qg
am9icyBkdXJpbmcgcXVldWUgcmVzZXQuIEFmdGVyIGEgR1BVDQo+ICAgIHJlc2V0LCBpbi1mbGln
aHQgam9icyBvbiB1bmFmZmVjdGVkIHJpbmdzIG1heSB0aW1lIG91dCB3YWl0aW5nIGZvciB0aGUN
Cj4gICAgR1BVIHRvIGNvbWUgYmFjaywgd2hpY2ggaXMgZXhwZWN0ZWQgYmVoYXZpb3IuDQo+DQo+
IDIuIGFtZF9xdWV1ZV9yZXNldC5jOiBGaXggdHlwbyBpbiBydW5fbW9uaXRvcl90aHJlYWQoKSB3
aGVyZSB0aGUgY29uZGl0aW9uDQo+ICAgIHVzZWQgPT0gaW5zdGVhZCBvZiAhPSBmb3IgLUVUSU1F
IGNvbXBhcmlzb24uIFRoZSBvcmlnaW5hbCBjb2RlDQo+ICAgIChlcnJvcl9jb2RlICE9IC1FQ0FO
Q0VMRUQgJiYgZXJyb3JfY29kZSA9PSAtRVRJTUUpIHdvdWxkIGluY29ycmVjdGx5DQo+ICAgIHRy
ZWF0IC1FVElNRSBhcyBhIEdQVSByZXNldCBlbmQgZmFpbHVyZSwgd2hlbiBpdCBzaG91bGQgYmUg
dHJlYXRlZA0KPiAgICB0aGUgc2FtZSBhcyAtRUNBTkNFTEVEIChpLmUuLCBwcm9jZWVkIHRvIEdQ
VSByZXNldCBzdGFnZSkuDQo+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+DQo+IENjOiBKZXNzZSBaaGFuZyA8amVzc2UuemhhbmdAYW1kLmNvbT4NCj4gU3VnZ2VzdGVk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KDQpTZXJpZXMg
aXM6DQpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
Pg0KDQo+IC0tLQ0KPiAgbGliL2FtZGdwdS9hbWRfY29tbWFuZF9zdWJtaXNzaW9uLmMgfCAyICst
DQo+ICB0ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0LmMgICAgICB8IDIgKy0NCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvbGliL2FtZGdwdS9hbWRfY29tbWFuZF9zdWJtaXNzaW9uLmMNCj4gYi9saWIvYW1kZ3B1
L2FtZF9jb21tYW5kX3N1Ym1pc3Npb24uYw0KPiBpbmRleCAxYTVmZDk0NDYuLmEwNzc3ZTVhZSAx
MDA2NDQNCj4gLS0tIGEvbGliL2FtZGdwdS9hbWRfY29tbWFuZF9zdWJtaXNzaW9uLmMNCj4gKysr
IGIvbGliL2FtZGdwdS9hbWRfY29tbWFuZF9zdWJtaXNzaW9uLmMNCj4gQEAgLTE0Myw3ICsxNDMs
NyBAQCBpbnQNCj4gYW1kZ3B1X3Rlc3RfZXhlY19jc19oZWxwZXIoYW1kZ3B1X2RldmljZV9oYW5k
bGUgZGV2aWNlLCB1bnNpZ25lZCBpbnQNCj4gaXBfdHlwZQ0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImV4cGlyZWQgJWQgUElEICVkXG4iLCByLCBleHBpcmVkLCBnZXRwaWQoKSk7
DQo+ICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAgICAgICAgICAgICAgIC8qIHdl
IGFsbG93IEVDQU5DRUxFRCBvciBFTk9EQVRBIGZvciBnb29kIGpvYnMNCj4gdGVtcG9yYWxseSAq
Lw0KPiAtICAgICAgICAgICAgICAgICAgICAgaWYgKHIgIT0gLUVDQU5DRUxFRCAmJiByICE9IC1F
Tk9EQVRBKQ0KPiArICAgICAgICAgICAgICAgICAgICAgaWYgKHIgIT0gLUVDQU5DRUxFRCAmJiBy
ICE9IC1FTk9EQVRBICYmIHIgIT0gLUVUSU1FKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpZ3RfYXNzZXJ0X2VxKHIsIDApOw0KPiAgICAgICAgICAgICAgIH0NCj4gICAgICAgfQ0K
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvYW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jDQo+IGIvdGVzdHMv
YW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jIGluZGV4IGM3NzBjNWVlMi4uYmVkMmYxMWRiIDEwMDY0
NA0KPiAtLS0gYS90ZXN0cy9hbWRncHUvYW1kX3F1ZXVlX3Jlc2V0LmMNCj4gKysrIGIvdGVzdHMv
YW1kZ3B1L2FtZF9xdWV1ZV9yZXNldC5jDQo+IEBAIC02NjgsNyArNjY4LDcgQEAgcnVuX21vbml0
b3JfdGhyZWFkKGFtZGdwdV9kZXZpY2VfaGFuZGxlIGRldmljZSwNCj4gc3RydWN0IHNobWJ1ZiAq
c2hfbWVtLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2V0X3Jlc2V0X3N0YXRlKHNoX21lbSwNCj4gdHJ1ZSwgUVVFVUVfUkVTRVRfU0VUX0JJVCk7DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycm9yX2NvZGUgIT0g
LUVDQU5DRUxFRA0KPiAmJiBlcnJvcl9jb2RlID09IC1FVElNRSkgew0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycm9yX2NvZGUgIT0gLUVDQU5D
RUxFRA0KPiAmJiBlcnJvcl9jb2RlICE9IC1FVElNRSkgew0KPg0KPiAgICAgICBzZXRfcmVzZXRf
c3RhdGUoc2hfbWVtLCB0cnVlLCBHUFVfUkVTRVRfRU5EX0ZBSUxVUkVfU0VUX0JJVCk7DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNl
IHsNCj4gLS0NCj4gMi41NC4wDQoNCg==
