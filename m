Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68972CD4F39
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 01:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206CC10E1B4;
	Fri, 15 May 2026 01:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1v0qbkgd";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F00510E1B4
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 01:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=se44dibTc/FWnmWPQdglWiwhlIrVKwzIlcPZ+Fp6AEYl7zSJ6ZsSdS6lGvgM1p2Q1byKsyClL3sLw9rttJT0Z0d4lz5dPLtSKPMyn7MRBsY5/k2DCnvuXVMLbuY3HZPkWrGtKb+NlKqvwPrOdD5IFMxdstHIcPnO0AKcXK3D/d6FkrYp5DJQhIterfIAS+yfE8lGGA7NQYoLI5lyMDYpPMGdJ4dscHgA6d+Ftw7BaLSwpS+62TO8/QThbtNa5PRl8CRZDS/zJ2lhNdslYZOYN5TL3u1Es3z6i+kh4AMeg/AQNYdPhR3WDjL0AYG8Xb+WeB//HwyqGMyaWVueEwbmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGryxrBFDGLmxweMr+d6sliT1ORh51Kdn2Le7wAASGY=;
 b=UwOaUB5NdTKUVoyeB0zMQ4VNV5deG/gGV9JkIT1dKif+VnTLAEoTYQWYhqDIqzrxER/hIZWbdridrB0paIfUcCXEvgfI+0sqD5YLsluhG2Ta3mgZX3+hhR3JzlcQDTcNtvhzuDX8LDmysNTky21uVNON1lq/Nmc4qBWwn2gC08IOFl+CRwXylXMCBoI5IBk4MhApgJIxw3BsL82QUss34UmVpcVTSUTJh8FlQHDCFH/S6GmUfL+3UsV0RDpMlyhn+bCKZs63ZACGmpvP8UfKy2p/rvJyo41OdZnQ4DUs98QvcGnSWnRXwAvs9Y9oiHc/PLv4YxNd7ksf/VypJ48IvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGryxrBFDGLmxweMr+d6sliT1ORh51Kdn2Le7wAASGY=;
 b=1v0qbkgdTy46Ag5hGQnucSQbcY2smCS6HcXykHzRKj5ClJUD2KillhyOs9LpDSn4zDLzIBoJmjJtfAzonXu8iZqQE2Iapdbcdb8ZgVsjo+tFlVneZ6WksnkmwRJlkEM8YbvwoTK1bIqhufgUxFGaZ7FEJnhMQAtZlJwU2M9v4SU=
Received: from DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16)
 by PH8PR12MB6842.namprd12.prod.outlook.com (2603:10b6:510:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 01:11:06 +0000
Received: from DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d]) by DM4PR12MB5152.namprd12.prod.outlook.com
 ([fe80::8874:ea43:ba4a:e73d%3]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 01:11:06 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] tests/amdgpu: Fix heap buffer overflow in OVERSIZE
 queue reset test
Thread-Topic: [PATCH 2/2] tests/amdgpu: Fix heap buffer overflow in OVERSIZE
 queue reset test
Thread-Index: AQHc4/xpJIMKLlkeO0ih8EuP4cOzM7YOQ/Cw
Date: Fri, 15 May 2026 01:11:05 +0000
Message-ID: <DM4PR12MB5152050922AC818EB8EA98E4E3042@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20260514235000.125069-1-vitaly.prosyak@amd.com>
 <20260514235000.125069-2-vitaly.prosyak@amd.com>
In-Reply-To: <20260514235000.125069-2-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-15T00:58:34.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5152:EE_|PH8PR12MB6842:EE_
x-ms-office365-filtering-correlation-id: 1174fd5a-7379-4fd4-afca-08deb21ed6fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|11063799003|22082099003|3023799003|18002099003|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info: hkBpr+K047BCWtJOF8XYcQ+jjpSffy5IM2xnGnHdYHa6QcCsDfEQW4NEop981boBZ8/kmifoSqbZi4zv4SNYphq4xzRXB814vpzoeJk341d/Y2tobp11fz9Y2KjATWWtnBgbaFok9fNNkNyxjdO1fn4WIz4x0LB07D938KU7t7a0Wp0kr/i7d8FWdCPASwsSi3MG8Bwof8SNgLjNJ+UHGf3MVsl9y51NI+rL3+MqTq4Xbox/nQc/bQruThJYhdgzsPZUjCbLVSfIGwxCDw6l/A6f2/ZxpvyRo0M/exKC8XJQ3SPMzCj7NtlduK5qivRaRbuMMFv8NYlQ66RYFQGXJeu58SQajcJPyxE5iPjckri5RUqNliWdOWYr6Gz7HixH1YxlXCo0t5jvLnpxv93ocZ574KCHXAwD5Yb0IZcNJkWHwOSjcOVQN1qlLAV1et5SXhAHKhrtpq3rT1e3PbIYK+lpnaPOc/4Zf7ZH3Od4bNMy2CEtqr/Bz5jihhA/UCBWuyjlptmghur4+w49aC+hyJBqCHVBrkbh8626jAzrYP7usho1DTSOHirsRsX8AjF518Jov9fBLt0ldoJtuYgUevd5cWHb15o5gGJAEqRLkMaIbkkiJuIzCsXNmHArDHomSEHLMJxESb9JK6L2xB3TWYE8CI4ki40yjV9goS8N1bOWJtiyDsBjwlReSPfGMsntCMMeG8UGknp1iFsuqT1pOI9qugg8q2N+OOlPr6/g6gtwY7ee30a2yUesStfY7XRS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(22082099003)(3023799003)(18002099003)(56012099003)(38070700021)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUFtNWdURkY1dFFIajM3a0h5UEhNV1FRTXFYalduekpDOSttWWNOWG1hUTdU?=
 =?utf-8?B?S2RZUkYrTUdCeCtxditTYjlRT0Nid1JjZ3hMcEhTS0I5Mmk2amFLSFFVblZv?=
 =?utf-8?B?elh5aVJpTjZSZW0rTWpWeGRJVjM3UllxZG1lL2Jja0NvY09KdXFzSktUVTJv?=
 =?utf-8?B?Q09YdWpNLy9TaWVabmhvRkdsdkJacnYvNjBrN3BNa0JiRklSS2ZXQ2hVS21k?=
 =?utf-8?B?eGJ1VmxMbDRUTG14djZGMnprRHp2aHozMi9PT1NYM1dLZ0graXdhZ1dxRFhz?=
 =?utf-8?B?dDZHN1VwL2luOTBGVFRNSXN5a0ZpWG5PSG1RbzdMVmluK005aWRXQ25SUEE5?=
 =?utf-8?B?N1IzWDVFTk9aRTBBWCtjbEdyK3dqK01QMGgxWnE0ZnJpWHJvanpyeXYydVRB?=
 =?utf-8?B?N24zWmpQOEtJaE05b090a09EdTFCSGE3UVBzbzJEMVI3WjZENCswK1RocDZm?=
 =?utf-8?B?S0RKY25VcHp6S1BUbk1XSGVPMGw1b3JNQjMzdEhpaWwwZFNaNi9NM2Y4TFZo?=
 =?utf-8?B?VS95MXY0emhGOGhtYkR0endleHhabmNPMmJqeHJDZGNvVU1JbnhEYkwzaFRH?=
 =?utf-8?B?SkMxYTVOb0trL1hOVG42UVhGcUtTVDJBVy9OUXdLR3hBZWpLQlA4a2dhVWdp?=
 =?utf-8?B?eUdmY3p5SUVMcWhHa29Qb0NOTThCM1FrRW5YWnRBUnpaWWNvdlVFWjZSMmJ1?=
 =?utf-8?B?MmlSLzVpa1dwOFhrK2hlQ2VlUzh6eGxIWVFqSkRkNW9ZMFJBME1KYkpSdHZJ?=
 =?utf-8?B?bjJUQUJjUGhkcHFXVW9ZdkJBZ1NXNHFpRkZaeWRrK3hXbVUwZEI2MHIxYUlX?=
 =?utf-8?B?TEVoV0dLZ2hxVHJDL1NxeHU5c0ZtRVpDdVZ0V0NsS1FWeWFkTlNKSm5IR2pM?=
 =?utf-8?B?YVZ1d3h6dzNZbFJzemtQOVdqZEVTc3VmTzZySDk2R1E1aUhCUFRFczBWenhy?=
 =?utf-8?B?MEhhTWdMWXpBc1ExZ2hLR3kxY1VUaUxVZnB0TXpLcXlzdXZtZWdPcElwVDhN?=
 =?utf-8?B?cldqd2p1c1VtSnIrOFhUNXQ4Y0R6NWJPVnB6Y3U0cXNGOC9oc1grQlhPMVJV?=
 =?utf-8?B?OGZTUDhyUUJya2hqNVpKb2JjTDBqOS8wRnZOcGpXUUowbnBLQXdhcElZS3dK?=
 =?utf-8?B?akROMFRGUHFYNTZOME13QnBoSGdkS3hJRVlJclU0YWhLVHFXMjB1RzdaY2Fo?=
 =?utf-8?B?T2ZWM1I2UDhaVzJQcXRhdFVUTS9YOFJKdVFnV2pvWG50VXZad1pkRUMyM29k?=
 =?utf-8?B?NC9YSktya09FdDlpWEl5R3krWWRFTmY2YVhnckdYeVJkMWwxSmVYdzN0dTY3?=
 =?utf-8?B?T1hHUThRWkxTMlFQWmlSeUdjRDl5ajA0S051SnIwenVyZWY3WUxxOVJUNmxs?=
 =?utf-8?B?WmU5UU1TSnVpcVN2UWlKanQ0b2ZuYUhDYVR6cVFkSTRPT1lRNkNESXBGUzBV?=
 =?utf-8?B?QTc3WmxqYUQvYk9mYnlnTUMxbytjQ09aSm1NSUtINlZtUGRoOXIrV0pGLytq?=
 =?utf-8?B?YXN1ak1OUDFQdTlpT0xXQWZORzhWeEpuU0pYSlFlM0JnVnZxSncrVjRUK2hW?=
 =?utf-8?B?ZlRXZkQxQ3RHR1Mya096ZXM4UThYN3hQck9GM2krMkdiVWx2ZVZMa2FGU3R6?=
 =?utf-8?B?cGd5dWQwSzNpeWRBUG9pMzl6OXB2U25kSk9JR0NFRFNGZ1hpMm9GNFlwbG14?=
 =?utf-8?B?WW1CbXhjTVBVU0E5bWUwR2pUM0ZrK2ZjazVickJtelByY3NpSTVESWZIV2h6?=
 =?utf-8?B?azM2Z05XSGdXU01meGk3cFFCSFIxYk9mdk90Q0Y2bENTN25ScnRPbXN4ZlJl?=
 =?utf-8?B?WmJQL1FJbWRWOHlndU9BOFJML1lOeWhWclBtTFpnVlRucXkvTEg3TVFJYmQ5?=
 =?utf-8?B?VzVZQ0NERkVxSTQ5bGUxVmFIZEY0STdzaGhZTmZVNzRmRmVBQXM5K2k1UTBU?=
 =?utf-8?B?WGZEWGw3TnowU0R6Q2tXQnErZklIeEs3YnFzRU9tSFJHenBraURqbDNNMjJa?=
 =?utf-8?B?MW1UWjVjbTZqNGdzMWh4Y1VtMHZNZzJTcnJITE5Cbnk3cjlQM3FxMGMrQ1R4?=
 =?utf-8?B?dzRWTzUvVUIrZ05jOEwyQVdkOEd5T0lOcmhGT3NqTWJ4UGttUXRPckFOZWp0?=
 =?utf-8?B?MXBha2lIcUprclVxUzJIT3FnWVVya01KR0pwd0dzL0ZoaGZEbTZEendtdHZU?=
 =?utf-8?B?SGVUSU5yMVk4T1NRYUF1Szd3MHYvTnkxSTlYWVorSzgxbWtSUFhpVEtyRmtM?=
 =?utf-8?B?TllCZkVOREQ0QXlBamg3dkgraEFmb1BrU3AvbVVHU3Y5M1pyTWJkRHRHc3lO?=
 =?utf-8?Q?b7ZWhnC3PJROJCFi7F?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1174fd5a-7379-4fd4-afca-08deb21ed6fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 01:11:05.8199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8AbGRRgewd/YtNGpoJKoCSw8De3BLACIfVlZNlPNNGN3qASOf6uY40U8qRWLAmnna6VICYviAOKh5u1TRpUbqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6842
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

QU1EIEdlbmVyYWwNCg0KVGhhbmtzIFZpdGFseS4NClRoZSBTZXJpZXMgaXMgUmV2aWV3ZWQtYnkg
OiBaaGFuZywgSmVzc2UoSmllKSA8SmVzc2UuWmhhbmdAYW1kLmNvbT4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiB2aXRhbHkucHJvc3lha0BhbWQuY29tIDx2aXRhbHku
cHJvc3lha0BhbWQuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAxNSwgMjAyNiA3OjQ5IEFNDQo+
IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogUHJvc3lhaywgVml0YWx5
IDxWaXRhbHkuUHJvc3lha0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlh
bi5Lb2VuaWdAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT47IFpoYW5nLCBKZXNzZShKaWUpIDxKZXNzZS5aaGFuZ0BhbWQuY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggMi8yXSB0ZXN0cy9hbWRncHU6IEZpeCBoZWFwIGJ1ZmZlciBvdmVyZmxv
dyBpbiBPVkVSU0laRSBxdWV1ZQ0KPiByZXNldCB0ZXN0DQo+DQo+IEZyb206IFZpdGFseSBQcm9z
eWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPg0KPiBnZnhfcmluZ19iYWRfd3JpdGVfbGlu
ZWFyKCkgZm9yIHRoZQ0KPiBDTURfU1RSRUFNX0VYRUNfSU5WQUxJRF9QQUNLRVRfTEVOR1RIX09W
RVJTSVpFDQo+IGNhc2UgY29tcHV0ZXMgc3RyZWFtX2xlbmd0aCA9IHdyaXRlX2xlbmd0aCAqIDIg
PSAyNTYsIHRoZW4gd3JpdGVzIHN0cmVhbV9sZW5ndGggKw0KPiA0IGhlYWRlciBEV09SRHMgPSAy
NjAgZW50cmllcyBpbnRvIHJpbmdfY29udGV4dC0+cG00Lg0KPiBIb3dldmVyLCBwbTQgd2FzIG9u
bHkgYWxsb2NhdGVkIGFzIGNhbGxvYygyNTYsIC4uLiksIGNhdXNpbmcgYSA0LURXT1JEIGhlYXAN
Cj4gYnVmZmVyIG92ZXJydW4uDQo+DQo+IFRoaXMgaGVhcCBjb3JydXB0aW9uIGdvZXMgdW5kZXRl
Y3RlZCB1bnRpbCBmcmVlKHJpbmdfY29udGV4dC0+cG00KSBpcyBjYWxsZWQgaW4gdGhlDQo+IGNs
ZWFudXAgcGF0aCwgd2hlcmUgZ2xpYmMgZGV0ZWN0cyB0aGUgY29ycnVwdGVkIGNodW5rIG1ldGFk
YXRhIGFuZCBhYm9ydHMgd2l0aDoNCj4gICBtdW5tYXBfY2h1bmsoKTogaW52YWxpZCBwb2ludGVy
DQo+ICAgUmVjZWl2ZWQgc2lnbmFsIFNJR0FCUlQuDQo+DQo+IEZpeCBieSBjb21wdXRpbmcgb3Zl
cnNpemVfZHcgPSB3cml0ZV9sZW5ndGggKiAyICsgMTYgKGdlbmVyb3VzIG1hcmdpbiBmb3IgdGhl
DQo+IHBhY2tldCBoZWFkZXIgYW5kIGFueSBmdXR1cmUgZ3Jvd3RoKSBhbmQgdXNpbmcgaXQgYXMg
dGhlIGFsbG9jYXRpb24gc2l6ZSB3aGVuIGl0DQo+IGV4Y2VlZHMgdGhlIGRlZmF1bHQgcG00X2R3
ICgyNTYpLg0KPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPg0KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBD
YzogSmVzc2UgWmhhbmcgPGplc3NlLnpoYW5nQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFZp
dGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2Ft
ZGdwdS9hbWRfcXVldWVfcmVzZXQuYyB8IDUgKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2FtZGdw
dS9hbWRfcXVldWVfcmVzZXQuYyBiL3Rlc3RzL2FtZGdwdS9hbWRfcXVldWVfcmVzZXQuYw0KPiBp
bmRleCBiZWQyZjExZGIuLjU0Njg0NWQyOSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvYW1kZ3B1L2Ft
ZF9xdWV1ZV9yZXNldC5jDQo+ICsrKyBiL3Rlc3RzL2FtZGdwdS9hbWRfcXVldWVfcmVzZXQuYw0K
PiBAQCAtNTUxLDYgKzU1MSw3IEBAIGFtZGdwdV93cml0ZV9saW5lYXIoYW1kZ3B1X2RldmljZV9o
YW5kbGUgZGV2aWNlLA0KPiBhbWRncHVfY29udGV4dF9oYW5kbGUgY29udGV4dF9oDQo+ICAgICAg
IGNvbnN0IGludCBwbTRfZHcgPSAyNTY7DQo+ICAgICAgIHN0cnVjdCBhbWRncHVfcmluZ19jb250
ZXh0ICpyaW5nX2NvbnRleHQ7DQo+ICAgICAgIGludCB3cml0ZV9sZW5ndGgsIGV4cGVjdF9mYWls
dXJlOw0KPiArICAgICBpbnQgb3ZlcnNpemVfZHc7DQo+ICAgICAgIGludCByOw0KPg0KPiAgICAg
ICByaW5nX2NvbnRleHQgPSBjYWxsb2MoMSwgc2l6ZW9mKCpyaW5nX2NvbnRleHQpKTsgQEAgLTU3
MCw3ICs1NzEsOSBAQA0KPiBhbWRncHVfd3JpdGVfbGluZWFyKGFtZGdwdV9kZXZpY2VfaGFuZGxl
IGRldmljZSwgYW1kZ3B1X2NvbnRleHRfaGFuZGxlDQo+IGNvbnRleHRfaA0KPiAgICAgICB9DQo+
ICAgICAgIC8qIHNldHVwIHBhcmFtZXRlcnMgKi8NCj4gICAgICAgcmluZ19jb250ZXh0LT53cml0
ZV9sZW5ndGggPSAgd3JpdGVfbGVuZ3RoOw0KPiAtICAgICByaW5nX2NvbnRleHQtPnBtNCA9IGNh
bGxvYyhwbTRfZHcsIHNpemVvZigqcmluZ19jb250ZXh0LT5wbTQpKTsNCj4gKyAgICAgLyogQWxs
b2NhdGUgZW5vdWdoIGZvciBPVkVSU0laRSBjYXNlOiB3cml0ZV9sZW5ndGgqMiBkYXRhICsgaGVh
ZGVyDQo+IERXT1JEcyAqLw0KPiArICAgICBvdmVyc2l6ZV9kdyA9IHJpbmdfY29udGV4dC0+d3Jp
dGVfbGVuZ3RoICogMiArIDE2Ow0KPiArICAgICByaW5nX2NvbnRleHQtPnBtNCA9IGNhbGxvYyhv
dmVyc2l6ZV9kdyA+IHBtNF9kdyA/IG92ZXJzaXplX2R3IDoNCj4gK3BtNF9kdywgc2l6ZW9mKCpy
aW5nX2NvbnRleHQtPnBtNCkpOw0KPiAgICAgICByaW5nX2NvbnRleHQtPnBtNF9zaXplID0gcG00
X2R3Ow0KPiAgICAgICByaW5nX2NvbnRleHQtPnJlc19jbnQgPSAxOw0KPiAgICAgICByaW5nX2Nv
bnRleHQtPnJpbmdfaWQgPSBqb2ItPnJpbmdfaWQ7DQo+IC0tDQo+IDIuNTQuMA0KDQo=
