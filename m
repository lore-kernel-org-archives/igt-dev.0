Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A5BC5478A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 19:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3EF10E041;
	Wed, 21 Feb 2024 19:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FYA+gufx";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5107210E041
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 19:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVCqq8jGxWrBGkvKvaAS502zcsCjEpVb0yo1daPWuvlvoOlUmXwRlOuV5OrT1hLggMvwGBLyD7WIE5QeZCTWucKX/Rm0pVxK2uTc5n+FlAdQWbogCyM8wzwNxtnfOP30cTaeHMRv3+4fk0SosH4kVOj3hxWmU57RKfSeUbdtOOSPBHufnxc2eCiqwCLmy4eKw9uc5aC4msEj9y1avWBCrBADHmIRLVzq86v0vMCviBG7BnKIsLPBqiAf7L/gDVUXcMyka2W/wvC0kXu3Dpp/hKsEa2LyNFMrswheJ6bA/88a1g0QxtlLIAFDiWjBFdRNDJp5FVNbyDFxWIY4Pd2yKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHqgOgJrHI7AkPf869CdoVY/Hj7px8qvnl1qVp1Vr6Y=;
 b=gxhCHjXxTlU0Mve7c6wo22KDG7PB2V5ySWqIuc2vaHRNfSa0zRZAmhD4xiHKEjaN9AFhNkHh+g07VK0YjWeMmrC+/kC3dtUKqwlmPI1d+H7L/439VP/oLyg2CKL9tCngFRR/Vo/Y7NhwmSeyGhM1tOR67nTWi2fq1WhekzMSMqApenJ2X8MLy2dZxJVT70YHj7hMCFWmBvYsCXpOuncQepERMd7LSoTr1RkbTMJWR7Ea1FneXM4uaB8BYgQ9Cp6uI+s4f7dRrXc5e+zXTuPXM+GK64UDW7j+E+Gt9zDlgRqwXR7V6mUXlPk6diWNveOfCd8AC7uucINxxkbF/Spt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHqgOgJrHI7AkPf869CdoVY/Hj7px8qvnl1qVp1Vr6Y=;
 b=FYA+gufxm2/2Zx51QzHMKpIY5ROay1XFL73uCq7YoZnv9Hy6a6F1QRZD3AG+k3DMTcUCUcmSSVCTvVaikirXaMk85JUiB+gOqMS5QZUSImtiMOyPwL1XTVkPmp7SKaIpQws2RMzTb2v7bPgHICHr8lEZk1LDtviMNMvNcUgADH4=
Received: from PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 by DM6PR12MB4058.namprd12.prod.outlook.com (2603:10b6:5:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Wed, 21 Feb
 2024 19:05:20 +0000
Received: from PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::a587:bdb5:e5df:84d4]) by PH8PR12MB6962.namprd12.prod.outlook.com
 ([fe80::a587:bdb5:e5df:84d4%3]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 19:05:19 +0000
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hung,
 Alex" <Alex.Hung@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Mahfooz, Hamza"
 <Hamza.Mahfooz@amd.com>
Subject: RE: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout IGT CI test
 failure need hep
Thread-Topic: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout IGT CI test
 failure need hep
Thread-Index: AQHaZCvSkpLmpuJ2nkKf0wcIfYSIPrEUeyqAgAB1gLA=
Date: Wed, 21 Feb 2024 19:05:19 +0000
Message-ID: <PH8PR12MB6962858530036DB0011421B3FD572@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <PH8PR12MB696282278F678780346276A0FD502@PH8PR12MB6962.namprd12.prod.outlook.com>
 <PH8PR12MB69628159E1CE801CA868386DFD502@PH8PR12MB6962.namprd12.prod.outlook.com>
 <20240221084125.72yrvhjy6njnte4x@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240221084125.72yrvhjy6njnte4x@kamilkon-desk.igk.intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=7054d186-cbd6-4771-ab24-e686674a99cc;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-21T15:41:57Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB6962:EE_|DM6PR12MB4058:EE_
x-ms-office365-filtering-correlation-id: c1869708-4c77-4936-e2e0-08dc33100c46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HmMbTji+d0b5yqwzLvoDfTyK/Gh2O8N/Y4sgOH2BQM+wHT+15AGeqAmYlX3o2ezZEWisWV2Qhmwc6wDEZmeLg6KiJ3vQO31ctz1Tn4+BOaY7CXG/rhDR3/R7HylEYMJfg6lv4dzhAjcuQwSgRzu5rbKL3lwVDV/xrErbqyYKvBo7eNyOgm0KNUQME4fh28YLUBBm4ZoB6Tuhz7JR8egPGYDHiLAboI5LGHLFsOwEV9yJxp9F7n8Igd7FX2zTMvstysBF/yKvwCGpqSInIkeObinN9GDXlOFLAYm/6gC+r6MYFnTjsMOTwIPuMV5kVtV7sMbQP/SGMUJXAOQKQnumNiOVFKhy4DJyxxSwyH2yIjmoQC+xeWlB9TJtKZnO8kRXdt0fH/KwyBJj0bmA+Z5IhU5jiandg6ap0VROkN+RXM2yvmcfkRk1CbuK8HFKUaocKFKiAQIcS8VETJVbSPNRBEYwotov0dHD4tEP1qOaXJx8rG9NIZEEjD/NkV6SR3GJNyaySraanq2r4wIuxuun9jF9SH0FGzRmS7AvoHsA7O89xOGjwQT1JAjBcls0Lal6nW9+LZT8iF4tbzMwUPIX2zIAaKSDvMRKN5evB54HS3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB6962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnRrM2tyNS9PK3lSN3ZOa0xGMXBxMSszM1ZjREViaFZnaEZoKzk2Kzk4WGFp?=
 =?utf-8?B?UXQ0Y0orTGpWRTA3d1VsR1FxSHVkV09xVnpQYTArRE4xUnc5bmtxc0lQT1c3?=
 =?utf-8?B?WTROOVdEK1ZoaERXNW9YQ2ZSY1ZWMmRPZ1NqTkkza3BPSm1jd0FVR3g3RDN2?=
 =?utf-8?B?RkhSd0V1MThJUGozWFJoVk1RTHlGdXluR2FKSVU2RGtoeGlHRGxBOGxITGhS?=
 =?utf-8?B?bW5Hc0dnU1gyVjJyWFlyOXJhVFpuQVlYMXVqTFBWdnZ1Zjlwek5hVEhDL3JY?=
 =?utf-8?B?MmhnMHlzTzNXMHY4T2E0NVdpMlFLY2hLUGF0QmFxUWNmcUxIaWtSclZxMlZj?=
 =?utf-8?B?czN3djd6RlNKYkpIb3J3YjloZ29CZ3ZjNTRPTEhBb0JVUmFQa1dtODczNWpE?=
 =?utf-8?B?OHZINzkyaWtid2ZXMGVheWR4K1BSNFh1cmUwRnZsd0J6UVJ1L05SOHp6N1Uz?=
 =?utf-8?B?TXN1U2czb284WlJlS3p0Lyt1MGdwb2hWU2V4Y3Z4S0tldGlCTlJHNGJxUVNn?=
 =?utf-8?B?RHc5QkdINDB2R2oyeVI4Zmt2QzdLdGhhdXcvTDFnS1c0VXdQcEEvMUJjbEZY?=
 =?utf-8?B?elNDaXBYTURLWHR6L1Zsa1g1NktNZ2J2ZU5yQWcxZHlDeC9wNTNNM2RicFl5?=
 =?utf-8?B?QjRvZ1NGT0MzMUZHdWZna3BUZ2k3V3AzVVRYVzhEZy9FTjNFYlArNVlSeWdQ?=
 =?utf-8?B?UGZPd3RjTWpjb2tXa1ArZXp5Y3dQSW1tYTVTVG5QMStRZkFFVUpmVWM0VVR0?=
 =?utf-8?B?SDUzVndBVUxObGpOYTVLT3FTdjhkTm9BcHlJWTBXbWw0dG1oN3BLL1VsQ1p4?=
 =?utf-8?B?b0lmSXdERHB2ZXlUbEpHOS9mbDk5NmdEdGkwdEFHdEh2SlVJMlVTSjBqMTN4?=
 =?utf-8?B?bERiT0YzRHJZemE4cUNiKzRmcHcrdjdGZlNiR2FMWGYzK1VRaTdKL2dpbTR6?=
 =?utf-8?B?ejNaSE9aTGszV0xOa1JSSWJwaTZ3Y002M1VZV1pQOStjUkFHK0ZkdlYzMW9v?=
 =?utf-8?B?TTVOMC9obUd6Q2tZdzVtKzY2RTFHZzFXWnRmSnJia1hpNG55bEF3V0FXeGFE?=
 =?utf-8?B?RGZZTjd4bm92bGdBVlpnUjl4czlLZnNiYkZSTEliMlUwUlp6S2JLWmZMZmJu?=
 =?utf-8?B?ZVJsSGdPR0ZraUR6ZkgrbUYvZHlJYk5uRnM1MTBqT1NhSjIwaGNpTkladWdx?=
 =?utf-8?B?cE5FM0JkdEI5a3VVVWJsN2ZmcExTRGJBTlZCQTR4S2ZsdHpCKzl5Q1d0R2R6?=
 =?utf-8?B?SEF3elYyS0tQdEhCUEVVKzlqK20rcVA1d1g4ZXVjL3JQNFI3QWlWM0lzT3pY?=
 =?utf-8?B?dHBHeElmSVZDK1lWTUliTEU2UXlNRXlQMWpKU0Nva1hNT1BqbGkzQm5JbUht?=
 =?utf-8?B?dFU0bFM5V1NReDR6TE5mT3dvRHp4UVY5NG5vQ2lzcVQvMHo2cEJYL0hWYUFP?=
 =?utf-8?B?Z2dVaVdGek84enZWdXRFa3l3ZUhkaU5zV1lZdG9lbUNTaEJvUUF4U0VJWW1D?=
 =?utf-8?B?MmMvNU1zL1ZBdGp2TGVEaTR6TzdwZ2xsTmVYc1lodC9rVXJsWmRnSGxZc0U5?=
 =?utf-8?B?N0tsdVRBVitYTXN0M0MwbDcrTkhlNGFxcmFJTHRxeDdmc2dZUnZhREtOV0pk?=
 =?utf-8?B?UUdERG8vMjd0MndwZnJxc3lFays5TTB1VmZNWXliMXpVdDBvcjdtVk5aVmQr?=
 =?utf-8?B?cTBSWTV4RlNHZ01hSTlsTjBCSWZZWTBIK083a1M2NHMrREdCQkc5T01QUDVl?=
 =?utf-8?B?QXJCZnhWWVV1dTVyNXRtcnNqamViZ1hFMWNzVTNiaUdjenl5cjBBVjdQSS9h?=
 =?utf-8?B?Ukh0bm9mQWV5bGlvOC85UE5qMTVvMkpnbWl6ejRQUnY4VTBUdHhyT1YzUDJi?=
 =?utf-8?B?SmZ5N29zWGdyRWl1bEdTY1h4RDZ1d3gyWTlTcnJLOFIrZmlXZHoybkIzM1h3?=
 =?utf-8?B?VHV5bmhrMlkwREVGbm1WRTNnQkFlcE1rcnBDMkEyVnY2VWIxMHlWSi9lMmp0?=
 =?utf-8?B?bFkydDJlaytaaG9RS3RKNDY4RVplSmxIdFgyamVkQm9HMThxUWxjM0NvNTc3?=
 =?utf-8?B?czFsLzZDRFFjSjA0N2V2SlhPL2poakJ2cE1keThrZ2ZHZHJucDNEOERGMk5v?=
 =?utf-8?Q?Ujrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1869708-4c77-4936-e2e0-08dc33100c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 19:05:19.8159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WeKe+nL6lW8ixpGgCdAwqUQUJ1qaZ2W40Qt4Iy/F6sjQnz0Iy6L5d0VKz8YHb4MrWzA5p0EIIx2AsdtAuwxsyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4058
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIEthbWlsLA0KDQpCeSAiIHJl
cGxheSB0byBDSSBsZXR0ZXIgdGhhdCBpdCBpcyB1bnJlbGF0ZWQiLCBJJ2QgbGlrZSB0byBrbm93
IHdoZXJlIGlzICJDSSBsZXR0ZXIiLg0KRG8gSSBleHBlY3QgcmVjZWl2ZSBlbWFpbCBmb3IgQ0kg
c2VydmVyPyBPciB0aGVyZSBpcyBsaW5rIEkgY291bGQgYWRkIHJlcGx5Pw0KDQpUaGFua3MhDQpI
ZXJzZW4NCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLYW1pbCBLb25p
ZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQpTZW50OiBXZWRuZXNkYXks
IEZlYnJ1YXJ5IDIxLCAyMDI0IDM6NDEgQU0NClRvOiBXdSwgSGVyc2VuIDxoZXJzZW54cy53dUBh
bWQuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBIdW5nLCBBbGV4IDxB
bGV4Lkh1bmdAYW1kLmNvbT47IFBpbGxhaSwgQXVyYWJpbmRvIDxBdXJhYmluZG8uUGlsbGFpQGFt
ZC5jb20+OyBTaXF1ZWlyYSwgUm9kcmlnbyA8Um9kcmlnby5TaXF1ZWlyYUBhbWQuY29tPjsgTWFo
Zm9veiwgSGFtemEgPEhhbXphLk1haGZvb3pAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiB0ZXN0cy9h
bWRncHUvYW1kX2lscjogRml4IHBzciBlRFAgY3JjIHJlYWQgdGltZW91dCBJR1QgQ0kgdGVzdCBm
YWlsdXJlIG5lZWQgaGVwDQoNCkhpIFd1LCwNCk9uIDIwMjQtMDItMjAgYXQgMTg6Mzc6MTMgKzAw
MDAsIFd1LCBIZXJzZW4gd3JvdGU6DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBHZW5lcmFs
XQ0KPg0KPiBIaSBLYW1pbCwNCj4NCj4gQW1kX2lsciB0ZXN0IChodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyOTM4Mi8pIGlzIGZvciBBTUQgR1BVIG9ubHkuDQo+IFRo
ZXJlIGFyZSB0ZXN0IGZhaWx1cmVzIG9yIHdhcm5pbmdzIG9uIEludGVsIEdQVS4gU3VjaCBhcywg
4pa8IEZpLkNJLklHVA0KPiBmYWlsdXJlIChTZWUgZnVsbA0KPiBsb2dzKTxodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNjg3L2luZGV4Lmh0bWw+DQo+DQo+
IEkgY2hlY2sgbG9nIG9mIHRlc3QgYW5kIGNvbmZpcm0gZmFpbHVyZXMgYXJlIG5vdCByZWxhdGVk
IHRvIGFtZF9pbHIuDQo+IEnigJlkIGxpa2UgdG8ga25vdyBpZiBJIHNob3VsZCBkbyBmb3IgdGhp
cyBJR1QgQ0kgdGVzdCBmYWlsdXJlLg0KPg0KPiBUaGFua3MhDQo+IEhlc2VuDQo+DQoNCk5vIHNw
ZWNpYWwgYWN0aW9uLCB5b3UgY291bGQgcmVwbGF5IHRvIENJIGxldHRlciB0aGF0IGl0IGlzIHVu
cmVsYXRlZCwgaWYgaXQgd2lsbCBoYXZlIG1vcmUgdGhhbiBzZXZlbiBkYXkgeW91IGNvdWxkIGln
bm9yZSBpdC4NCg0KSW4gdGhlIGJvZHkgb2YgQ0kgbGV0dGVyIHRoZXJlIGlzIGUtbWFpbCB3aGlj
aCB5b3UgY2FuIHVzZSBpZiB5b3Ugd2FudCB5b3VyIHBhdGNoc2V0IGJlIGdyZWVuLCBJIGNvbGxl
Y3RlZCB0d28gYWRkcmVzc2VzOg0KDQpDYzogSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBsZ2NpLmJ1Zy5maWxpbmdAaW50ZWwuY29tDQoNCkJ0dyBwYXkgYXR0ZW50aW9u
IHdoZW4geW91IHdpbGwgY2hhbmdlIGNvbW1vbiBpZ3QgbGliIGNvZGUsIGl0IGNhbiBoYXZlIHNv
bWUgaW1wYWN0IG9uIGFsbCBvdGhlciB0ZXN0cy4NCg0KUmVnYXJkcywNCkthbWlsDQoNCj4NCj4N
Cj4NCj4NCj4NCg==
