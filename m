Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167FACD5BC9
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 01:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E5010EB44;
	Thu, 28 May 2026 01:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3WxAFZ3v";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA0D10EB44
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 01:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICvytqPjngQT9DZhfuS1QzqIsodt/sGP8XnjMxzuNpluo8cIr10x21Fv5KhLQB+rvLZeGVSPrcvGz3Vf27mBJdiiYyZmKJOk1v81OyNiJy8l2TwylgqB9dSKMHQpoNBryeFKoNaNskNVyJ+Zh1WuSB+KrlUVFLmKSdbAuiN62w4hVTrVz2peOfKKOAXVjr+HTQOnUY/K1bD/AYnN/ZYUg5qUQv0jPoEFGoMNtxGTp1pJ76MAVqySiCEK5Dbba4A3l+ej7PyyAwb7wDwC8zSnAkU5aKpd2X3lbfkUvYaETS0xK2gp8sIZoC/M0pDWGK6z6Au3N7NzUWBUo6fXSa7jwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkQFzmDcL/oRS/aX6Fg9jVLDcqoTzhTnQVTl3s2IpP8=;
 b=pyi82axmD36ofnLNBd48R2B4QGbn0l7y97xDvOHjTJk78KObtE7a3V8dWU8SpSs/DEl4IqQce1x5nJnCBHN2d2T0rr5TpVQnx5jjlPMfRWD4EJz5DDPxN7UdNK4+qfo+ot77Mz0L01ji2rMvcLBZl60E6n9xuATrefp9Djp+JfMMgVVtHPcaGvTak68Vzoi7avTEZjaPxfLb1x9QHMn7PsYFVu2y9OdeA/NWQoNBjAAc5v8wfQ7p5di3uzn8g6ZIFop6QrQmXOTUVVGAIgIAJXeEjNFC5ulmuEq1zVdAIYlBJuqU+WeJCJGMlsXUTzLsBKu+Fg4bWXBxnZ9IDD6WlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkQFzmDcL/oRS/aX6Fg9jVLDcqoTzhTnQVTl3s2IpP8=;
 b=3WxAFZ3vwgFqplv88qUkOQo4XZ/cL0ejA++xy3DFN1ryxNsOBs/uHN7VswQ/4VLV5TFYNYberw7Mz+IMqo76K5pINWl+psRdeZm2nTUNS9w5R5ELzz3jFrVeEPFYk3n75hjrcQC/pOhkHQKHgW1hPNsrfQrnWRqSsa0vP/qwYv8=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH2PR12MB9495.namprd12.prod.outlook.com (2603:10b6:610:27d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 01:45:37 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::699b:1fb2:73:6a33]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::699b:1fb2:73:6a33%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 01:45:37 +0000
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] tests/amdgpu/amd_close_race: set VM_PAGE_EXECUTABLE
 unconditionally
Thread-Topic: [PATCH] tests/amdgpu/amd_close_race: set VM_PAGE_EXECUTABLE
 unconditionally
Thread-Index: AQHc7kMi0ThpVv8vBUqA/tbbEs92hrYiqrwA
Date: Thu, 28 May 2026 01:45:36 +0000
Message-ID: <BL1PR12MB51446D9828DD38E8B467CDF4E3092@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20260528014129.114452-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260528014129.114452-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-28T01:45:14.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH2PR12MB9495:EE_
x-ms-office365-filtering-correlation-id: 74d20e34-823f-4828-0a45-08debc5ad0df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|6133799003|11063799006|56012099006;
x-microsoft-antispam-message-info: UcBrW2KhPiwPhx3EsxEnxABO5uapTmejF+M28mScRDuWI4vZizTVlBJSVm1XGhQDChVki+tF4qkqSEKal3To2lU6S7t5KSSS5PmuqSP3GuGP27DxCimM2S/uwmrW8+aAF7H1XtnHwei0VDIQEAZxPNAxyA9uk+/I/d5y2LDE99vIho3KY3lXycMlIOcyMPHtkBOR1qK9wpsft4NfWMkjMDzDv+meIR0fm7u6nrZnEpZNisc/ZTW1JZHJ9WkoGyVT+64crvFFpEr8CHYgVcZEMW/XtbZ8WmOKI8fZxl//Yk4TYKweH6P393kNsyMmyzHe+GkWYnUb3j5nK+OgaeUXXEHmNs8wSQ+nzsMdit4DFiY+UOzsB1rYa6OJ3p+4TcYgOplK4Yl5PHzyGjhQrgk+TtsQ5ETkcKcwjESQT96alGrNzJJGi125LwXC34Vj2/MS6RwW42Gu9q3eyUnxhzjsmlA+9+xdTnxKxfEbF6AGUAi6fP/2PUeQodv33EtbAk88SxXyBCSsOupB+88Vt4QnK6jKKK58CZnzAZIWkIURjxSd3LVpM+dUj50tWuXdOha4Lg2txemk+zuYqxOh/TXMvrxE0iXh7MtqqDcIt/lYcDJvHf/AQGI2FkmXvndXyFxViVeGUmEzP7X4XKXed5a/FEDlzfrNFetbDKm2ExrqCdAstpGrKWRm0blYr1QKBxtt+Tag8qJFIkcYg1Az/54zNqyo+QNFjxfLUHKxUdB3l4WpcxD+5EL2vbyz6PVS6oi6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cExYYzl0dXFNbzlvMEovL3VZa2x1blBpdkI5NkgvTGRKaHM3blB1dnlXdUw2?=
 =?utf-8?B?UUxGbWVqQXZyY1VMd1dja3hRUUZDMW5YU29Zd3orNE1IdHQxUlpwWmFWMDdu?=
 =?utf-8?B?dkV0RDltQXVRVVluaWVaRWREK0VVZWpRSlZFWGNqUU1JRGxqV0ZGYUV3VFlC?=
 =?utf-8?B?RmFJYTNodE9uODVucXlWaGpaMW43c3QyeHpGall0NTN2bGJ3RmkvK1hxMi9x?=
 =?utf-8?B?MjU3cEFxYU1VVUc0NkM5Q1I1anU1bDF6eWxIeTY2MGJFVzZidVFIbXZKcFZI?=
 =?utf-8?B?RGF5K1VFN0o3L2RBZmtqRHZLRWx3Sy85SmNBcUNmNmgraDZtMmdtUmtPTE52?=
 =?utf-8?B?UkZzL2RQS2ZWQVE1SURQYmtYbUN0WkE4MWRqSjdGYjFzK3VqaytWQWl1OGMr?=
 =?utf-8?B?c1N1TGpOOFRYRVRFeEgrZVcxSVlsU1NUNUpyNDd3cnVFNkFtOHBZanJ3bTMw?=
 =?utf-8?B?aWxMUzh0bzZvemFTOUlOVHkzYWZDNUpGTVdUdkI3QlV1RTM4bTQvNDkyUFQ3?=
 =?utf-8?B?N2pYNVBpRFYrOGJnNVQwV1EzZHI2VXh4QWEzMVNJd1JhVGVKQW1YWWs2VlYw?=
 =?utf-8?B?cEE3Z1ZZWFVBbTczeWlOQkE5UlZGM2RPdHEwSURaQ0wwRUlIRWZFRVpmTlgw?=
 =?utf-8?B?M2VRZjhPQVNJay9KWnpnNUJhamtWZ1NrOVQ2M3lIYkE3N09qWXpiYm9XOEpw?=
 =?utf-8?B?WFJhWlcwQlpOWkFId2JSODRxZzg0RmZFWHdzYlRLN0ErMlVDeUJ0UWgreVZj?=
 =?utf-8?B?Mm12dVpDcjFuWDlwbEM2TkJhQmQrekMxYTU1VmxKR2dEYllXN3pVU0p6eDZy?=
 =?utf-8?B?cXZQbGN1U2V1bGxMV2ZFRUR3ZUwzUENRRm9GV2tpbysvZHB1TDlLc1BEOXQ4?=
 =?utf-8?B?czJSMTNMaHRUMFN1M0w2dmNrTE04MndrMklrUURRNjU2czVBelNSWGE1RU5H?=
 =?utf-8?B?MjBCNUlsNkpVVzZPQVdSWU14OElrZkZOSlMzVStJUkxSSmVyN0lPS3dWZHRV?=
 =?utf-8?B?NUg5U05vNnJpVjNGMFpmcmxrWFNVVUxQREg2MVZKTlpoZzhDODRHaFpqZUlO?=
 =?utf-8?B?VExobmw5MEpqTURlSzdTTGNBbmpCeGtaS0EwZjRxSFV4K1piTmU0SzhnQk9l?=
 =?utf-8?B?NklVQ1Vpc2w5Y1VGZ1RKTThGRWE2WTRadDJwdnR3R0lZaDRGZGt6bGNRSGhV?=
 =?utf-8?B?dFBLRFVaOFZ3WnlNWFEwc0xvajNvcm04TlcwaUN0TitUWElQT1liOXVEZGEw?=
 =?utf-8?B?SVNlaG9rSnB6S042MnZXampMQ3FOZVozS2I0ZDJ0U0dvSS8zNWsyem5lTGdU?=
 =?utf-8?B?YTQ2VGg5SytpallucUxzR3dKY2lISTczQWszS3hQSlNDZ2o1Q0NiWlIrVXZQ?=
 =?utf-8?B?aXVBdWZXclltOHB0RFNBQTVFZEg3WXFsYWxKa1A2ajJjQnZMVGR6ckZCcFdt?=
 =?utf-8?B?QVdPc1VHUVY2d3kvaHRlMnBMendNeW5UU3JCWTNHMnhCU3ljbnRMUmIvUVhU?=
 =?utf-8?B?WGdjaTN4MlFKR3JzMElYUmdlUGxvUlE4ZW5aaEprOUNmWlQ0TlBocjN1RmJq?=
 =?utf-8?B?WW5NS1UzeW1JclhibktQMVFBNGovRlVPVVRORVh0SFBva3NYdFJHa3VoRVRP?=
 =?utf-8?B?TW05SHRpaTRzS3F3aGNoZFQyZVV0RVROYlowbXg4TzY1cWp5ZUVrTDlxRHN5?=
 =?utf-8?B?ay9FVmVpMmdEQVd6NnNIWndHL0ZyNnNuMDFJRm5JU1Y5VEIwK3Q4MzBHK013?=
 =?utf-8?B?QnRTNUd3ZTZHV2FpYzQ0RWo4a2I4RVcwZUQvUnE0K0t2UnlMOUw0U2U4TWkx?=
 =?utf-8?B?N0IzWnNybHBya2NmZFBJVTQxbEZKQUl5dVNBT28vMm5VeTVRK1l3bHcyTnBK?=
 =?utf-8?B?anFzcmwrUEg1dktXUFM3bFpZUG5LbFJpZkdkbDJDbzFUYktPWnhkbHgrcERJ?=
 =?utf-8?B?U3R3SWZZSWZwTVRSUDNmYXNIWXUrcUc2cnZ3L1lxMzRYV2tYdmc3cXB1K1px?=
 =?utf-8?B?bnQwUWpTU1JZSG5wZERuWWpDeE1PMEp6a3p3WmtCTERGN1cwTHhCa09VbnBS?=
 =?utf-8?B?Sjl2QUp1SmlLOWpEVmtyeTRkMkJQaGpzV2VpL211c3lNRGZoZ1F2QjR1RWV6?=
 =?utf-8?B?Z3RLaEw1Mk5iNUcrS1BMcEZTMnAyVXJXdzk2U0toblBaR3VPdTNoT20vN0VX?=
 =?utf-8?B?SmhDV3VPQVNLNUxnZVhPRFN5bkgyMTlRRGhkdUx1Y2F4OUhMMlYzMUtOWm9F?=
 =?utf-8?B?NHU2WjQzZTVHTlR4TlZ6cVBlUkZCdlNtS3R0K3NwS2ZoZzJ1UG4wZkVmbnlL?=
 =?utf-8?Q?axkosTq5e5ACUroC4J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d20e34-823f-4828-0a45-08debc5ad0df
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 01:45:37.0342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wk86+IQ5dV4vXsRci4iI5Qj8ErYl52AI2Tdx7vpTNxwlX5vfTekZfk9HxD56Answd+mdavY/bFMm1tfkN0odOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9495
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

QU1EIEdlbmVyYWwNCg0KUmV2ZWl3ZWQtYnk6IEplc3NlIFpoYW5nIDxqZXNzZS56aGFuZ0BhbWQu
Y29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHZpdGFseS5wcm9z
eWFrQGFtZC5jb20gPHZpdGFseS5wcm9zeWFrQGFtZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBN
YXkgMjgsIDIwMjYgOTo0MSBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IFByb3N5YWssIFZpdGFseSA8Vml0YWx5LlByb3N5YWtAYW1kLmNvbT47IEtvZW5pZywg
Q2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5k
ZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBaaGFuZywgSmVzc2UoSmllKSA8SmVz
c2UuWmhhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSB0ZXN0cy9hbWRncHUvYW1kX2Ns
b3NlX3JhY2U6IHNldCBWTV9QQUdFX0VYRUNVVEFCTEUNCj4gdW5jb25kaXRpb25hbGx5DQo+DQo+
IEZyb206IFZpdGFseSBQcm9zeWFrIDx2aXRhbHkucHJvc3lha0BhbWQuY29tPg0KPg0KPiBJQiBi
dWZmZXJzIG11c3QgYmUgbWFwcGVkIHdpdGggUkVBREFCTEUgfCBXUklURUFCTEUgfCBFWEVDVVRB
QkxFLA0KPiBtYXRjaGluZyBsaWJkcm0gYW1kZ3B1X2JvX3ZhX29wKCkgd2hpY2ggYWx3YXlzIHNl
dHMgYWxsIHRocmVlIGZsYWdzLg0KPg0KPiBXaXRob3V0IEVYRUNVVEFCTEUgdGhlIGJlaGF2aW9y
IGRpZmZlcnMgYnkgR1BVIGdlbmVyYXRpb246DQo+ICAgR0ZYMTA6IGFmdGVyIFRMQiBldmljdGlv
biAofjMyIHN1Ym1pc3Npb25zKSwgcmUtd2FsayBmaW5kcyB2YWxpZCBQVEUNCj4gICAgICAgICAg
d2l0aG91dCBleGVjdXRlIHBlcm1pc3Npb24gY2F1c2luZyBhIHNpbGVudCBDUCBzdGFsbC4gIFBy
b3RlY3Rpb24NCj4gICAgICAgICAgdmlvbGF0aW9uIGRvZXMgbm90IGdlbmVyYXRlIGEgZmF1bHQg
aW50ZXJydXB0LiAgRFJNIHNjaGVkdWxlcg0KPiAgICAgICAgICB0aW1lcyBvdXQgYWZ0ZXIgMnMs
IHJpbmcgcmVzZXQgZmx1c2hlcyBUTEIsIEdQVSByZXN1bWVzLg0KPiAgICAgICAgICBDeWNsZSBy
ZXBlYXRzIGV2ZXJ5IH4zMiBzdWJtaXNzaW9ucy4NCj4gICBHRlgxMjogY2xvc2UgcmFjZSB0ZWFy
cyBkb3duIHBhZ2UgdGFibGVzIHdoaWxlIEdQVSBleGVjdXRlcy4gIFBURXMNCj4gICAgICAgICAg
YmVjb21lIGludmFsaWQsIFZNIHBhZ2UgZmF1bHQgaW50ZXJydXB0IGZpcmVzLiAgR1BVIHJlc2V0
DQo+ICAgICAgICAgIHJlY292ZXJzLCBubyBoYXJkIGhhbmcuDQo+DQo+IFJlcGxhY2UgaGFyZGNv
ZGVkIGZsYWdzIHdpdGggSUJfTUFQX0ZMQUdTIG1hY3JvIHRoYXQgc2V0cyBSfFd8WCBmb3IgYWxs
IFZBDQo+IG1hcHBpbmdzIG9uIGFsbCBnZW5lcmF0aW9ucy4NCj4NCj4gQ2M6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IEplc3NlIFpoYW5nIDxqZXNzZS56aGFuZ0Bh
bWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaXRhbHkgUHJvc3lhayA8dml0YWx5LnByb3N5YWtA
YW1kLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9hbWRncHUvYW1kX2Nsb3NlX3JhY2UuYyB8IDMzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9hbWRn
cHUvYW1kX2Nsb3NlX3JhY2UuYyBiL3Rlc3RzL2FtZGdwdS9hbWRfY2xvc2VfcmFjZS5jIGluZGV4
DQo+IDg0YzJlZGVhMy4uYjc2YjYyYjU1IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9hbWRncHUvYW1k
X2Nsb3NlX3JhY2UuYw0KPiArKysgYi90ZXN0cy9hbWRncHUvYW1kX2Nsb3NlX3JhY2UuYw0KPiBA
QCAtOTAsNiArOTAsMzEgQEAgdW5pb24gYm9fbGlzdCB7DQo+ICAjZGVmaW5lIEdUVF9ET01BSU4g
ICAgMHg0DQo+ICAjZGVmaW5lIFZSQU1fRE9NQUlOICAgMHgyDQo+DQo+ICsvKg0KPiArICogVk0g
cGFnZSBtYXBwaW5nIGZsYWdzIChBTURHUFVfVk1fUEFHRV8qKS4NCj4gKyAqDQo+ICsgKiBJQiBi
dWZmZXJzIG11c3QgYmUgbWFwcGVkIHdpdGggUkVBREFCTEUgfCBXUklURUFCTEUgfCBFWEVDVVRB
QkxFLA0KPiArICogbWF0Y2hpbmcgbGliZHJtJ3MgYW1kZ3B1X2JvX3ZhX29wKCkgYmVoYXZpb3Iu
DQo+ICsgKg0KPiArICogRVhFQ1VUQUJMRSBpcyByZXF1aXJlZCBvbiBhbGwgZ2VuZXJhdGlvbnMu
ICBXaXRob3V0IGl0Og0KPiArICogICBHRlgxMDogYWZ0ZXIgVExCIGV2aWN0aW9uICh+MzIgc3Vi
bWlzc2lvbnMpLCByZS13YWxrIGZpbmRzIHZhbGlkIFBURQ0KPiArICogICAgICAgICAgd2l0aG91
dCBleGVjdXRlIHBlcm1pc3Npb24gLT4gc2lsZW50IENQIHN0YWxsLiAgUHJvdGVjdGlvbg0KPiAr
ICogICAgICAgICAgdmlvbGF0aW9uIGRvZXMgbm90IGdlbmVyYXRlIGEgZmF1bHQgaW50ZXJydXB0
ICh1bmxpa2UgaW52YWxpZA0KPiArICogICAgICAgICAgUFRFKS4gIERSTSBzY2hlZHVsZXIgdGlt
ZXMgb3V0IGFmdGVyIDJzIC0+IHJpbmcgcmVzZXQgZmx1c2hlcw0KPiArICogICAgICAgICAgVExC
IC0+IEdQVSByZXN1bWVzLiAgQ3ljbGUgcmVwZWF0cyBldmVyeSB+MzIgc3VibWlzc2lvbnMuDQo+
ICsgKiAgIEdGWDEyOiBjbG9zZSByYWNlIHRlYXJzIGRvd24gcGFnZSB0YWJsZXMgd2hpbGUgR1BV
IGV4ZWN1dGVzLiAgUFRFcw0KPiArICogICAgICAgICAgYmVjb21lIGludmFsaWQgLT4gVk0gcGFn
ZSBmYXVsdCBpbnRlcnJ1cHQgLT4gZG1lc2cgIFZNIGZhdWx0Lg0KPiArICogICAgICAgICAgR1BV
IHJlc2V0IHJlY292ZXJzLCBubyBoYXJkIGhhbmcuDQo+ICsgKg0KPiArICogS2V5IGRpZmZlcmVu
Y2U6IHZhbGlkIFBURSArIG1pc3NpbmcgZXhlY3V0ZSA9IHNpbGVudCBzdGFsbCAobm8gaW50ZXJy
dXB0KS4NCj4gKyAqIEludmFsaWQgUFRFID0gZmF1bHQgaW50ZXJydXB0LiAgUmVzZXQgaGVscHMg
YmVjYXVzZSBUTEIgZmx1c2ggZm9yY2VzDQo+ICthDQo+ICsgKiBmcmVzaCB0cmFuc2xhdGlvbiBm
ZXRjaDsgc2luY2UgcGFnZXMgYXJlIHN0aWxsIG1hcHBlZCwgR1BVIHJlc3VtZXMuDQo+ICsgKi8N
Cj4gKyNkZWZpbmUgVk1fUEFHRV9SRUFEQUJMRSAgICgxIDw8IDEpDQo+ICsjZGVmaW5lIFZNX1BB
R0VfV1JJVEVBQkxFICAoMSA8PCAyKQ0KPiArI2RlZmluZSBWTV9QQUdFX0VYRUNVVEFCTEUgKDEg
PDwgMykNCj4gKyNkZWZpbmUgSUJfTUFQX0ZMQUdTICAgICAgIChWTV9QQUdFX1JFQURBQkxFIHwg
Vk1fUEFHRV9XUklURUFCTEUNCj4gfCBWTV9QQUdFX0VYRUNVVEFCTEUpDQo+ICsNCj4gIHN0cnVj
dCByYWNlciB7DQo+ICAgICAgICAgIGludCBmZDsNCj4gICAgICAgICAgaW50IGlkOw0KPiBAQCAt
MjUyLDcgKzI3Nyw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfcmFjZXIoc3RydWN0IHJhY2VyICpyLCBp
bnQgaWQsIGludCBuX2N0eCwNCj4gICAgICAgICAgbWVtc2V0KCZndiwgMCwgc2l6ZW9mKGd2KSk7
DQo+ICAgICAgICAgIGd2LmhhbmRsZSA9IGdjLm91dC5oYW5kbGU7DQo+ICAgICAgICAgIGd2Lm9w
ZXJhdGlvbiA9IDE7IC8qIE1BUCAqLw0KPiAtICAgICAgICBndi5mbGFncyA9IDY7ICAgICAvKiBy
ZWFkYWJsZSB8IHdyaXRlYWJsZSAqLw0KPiArICAgICAgICBndi5mbGFncyA9IElCX01BUF9GTEFH
UzsNCj4gICAgICAgICAgZ3YudmFfYWRkcmVzcyA9IHZhOw0KPiAgICAgICAgICBndi5tYXBfc2l6
ZSA9IElCX1NJWkU7DQo+ICAgICAgICAgIGlvY3RsKHItPmZkLCBJT0NUTF9HRU1fVkEsICZndik7
IEBAIC0yODgsNyArMzEzLDcgQEAgc3RhdGljIGludA0KPiBzZXR1cF9yYWNlcihzdHJ1Y3QgcmFj
ZXIgKnIsIGludCBpZCwgaW50IG5fY3R4LA0KPiAgICAgICAgICAgICAgICAgIG1lbXNldCgmdiwg
MCwgc2l6ZW9mKHYpKTsNCj4gICAgICAgICAgICAgICAgICB2LmhhbmRsZSA9IGJvLm91dC5oYW5k
bGU7DQo+ICAgICAgICAgICAgICAgICAgdi5vcGVyYXRpb24gPSAxOw0KPiAtICAgICAgICAgICAg
ICAgIHYuZmxhZ3MgPSA2Ow0KPiArICAgICAgICAgICAgICAgIHYuZmxhZ3MgPSBJQl9NQVBfRkxB
R1M7DQo+ICAgICAgICAgICAgICAgICAgdi52YV9hZGRyZXNzID0gdmE7DQo+ICAgICAgICAgICAg
ICAgICAgdi5tYXBfc2l6ZSA9IFZSQU1fQk9fU0laRTsNCj4gICAgICAgICAgICAgICAgICBpb2N0
bChyLT5mZCwgSU9DVExfR0VNX1ZBLCAmdik7IEBAIC00NDUsNyArNDcwLDcgQEANCj4gc2lna2ls
bF9jaGlsZChpbnQgY2hpbGRfaWQsIGludCBuX2N0eCwgaW50IHBpcGVfd3IpDQo+ICAgICAgICAg
IG1lbXNldCgmZ3YsIDAsIHNpemVvZihndikpOw0KPiAgICAgICAgICBndi5oYW5kbGUgPSBpYl9o
Ow0KPiAgICAgICAgICBndi5vcGVyYXRpb24gPSAxOw0KPiAtICAgICAgICBndi5mbGFncyA9IDY7
DQo+ICsgICAgICAgIGd2LmZsYWdzID0gSUJfTUFQX0ZMQUdTOw0KPiAgICAgICAgICBndi52YV9h
ZGRyZXNzID0gdmE7DQo+ICAgICAgICAgIGd2Lm1hcF9zaXplID0gSUJfU0laRTsNCj4gICAgICAg
ICAgaW9jdGwoZmQsIElPQ1RMX0dFTV9WQSwgJmd2KTsNCj4gQEAgLTQ4OSw3ICs1MTQsNyBAQCBz
aWdraWxsX2NoaWxkKGludCBjaGlsZF9pZCwgaW50IG5fY3R4LCBpbnQgcGlwZV93cikNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIG1lbXNldCgmdiwgMCwgc2l6ZW9mKHYpKTsNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHYuaGFuZGxlID0gYm8ub3V0LmhhbmRsZTsNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIHYub3BlcmF0aW9uID0gMTsNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgIHYuZmxhZ3MgPSA2Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICAgdi5mbGFncyA9IElC
X01BUF9GTEFHUzsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHYudmFfYWRkcmVzcyA9IHZy
YW1fdmE7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICB2Lm1hcF9zaXplID0gVlJBTV9CT19T
SVpFOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgaW9jdGwoZmQsIElPQ1RMX0dFTV9WQSwg
JnYpOw0KPiAtLQ0KPiAyLjU0LjANCg0K
