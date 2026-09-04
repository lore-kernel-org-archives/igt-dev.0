Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643FDC61DD3
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 01:56:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AE010E1CD;
	Fri,  4 Sep 2026 01:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="W0yRlNbk";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="m7JqBsaX";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2707D10F81B
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 01:55:21 +0000 (UTC)
X-UUID: abe8223ca80311f18dc8c9802ae25ab1-20260904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=F0WKA+XK+GzQ2hy40/mT3MrljnKxbCMR5i3bn4eCP/I=; 
 b=W0yRlNbk3gMC9+PU35T3iWO90CU+LQsERE8kIGV/N8LPQdo1vFjXuzKqk41noHXeY+Bmiy+1y3lBqdUGEsnzhYH6q2Xs+u4wps9vgx/u4k7JYk/0VDjjH4fKyymUOFIjqFLoB14DDtlmOBSV9Th5RAWprDOwD1l8Uaoq8XCcHuY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:806e254b-72be-4b35-97cf-966d55028f2e, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:7db8b62, CLOUDID:dba86b96-8382-4d0c-b42c-b0965a0d23b4,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
 nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
 :0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: abe8223ca80311f18dc8c9802ae25ab1-20260904
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2007214202; Fri, 04 Sep 2026 09:55:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 4 Sep 2026 09:55:13 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 4 Sep 2026 09:55:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfaWPg3nSbay8KbdcZf1DwB85s0n1X8QW23LhUfDxi0YgrY/jy8gdzAPi4Z878nzz55xwDlQzhHoiZk4n1Ygziu9FC7q0FNXiQC/IV0EF6fOwzwSbi07gwOdA7FY2OXjBm4KWJipNTBp+GL6/5EiZwxyZ84/Whw3g3d6tfD3TxthJykmCwUrM0Nw1f4dTdFIh0ssdzy+WoovgjDJX6b7ruYsPVzSf+vcKvzMfSmGMyKZgTcXD2a4xDBXN5e3I1mwXtxt8fEdqaSd92uH/TsGkM+IDnr9C9uzTStIrZ3OQH6qLpOXT33bc5Wit+/KeOzbiPd42+Z77lJ+hiLmvJXIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNG4mYotTZHlddW7IjF9QqfYmwlmThcSMNIu+5mJLHM=;
 b=DRlj6+ORX207TqpxzeIfRitcT85heUORvhHiiRzHFwg9QKoSS2MV5eLZrgfnzl5eCEZSyrfNI1owndaKedPNEV2vEGzUnxuzj72pUKszuiGKjhzmiflVacJ4ktkrp809wO1iTnGiQcoY2cPT0itxgPR/lKgoapZGcwaT6RqEN9Y5rOR+XPijRc0jPAySHDWlIH1Svxm/KhyIpKPiQYMKrTMrgmC/akjCypm3llioqQ1/hG1uIj82qACafK6OObhQadGYCIkbKGFkAPpIkCwP7A+FK6v/uSO5pydOnCTwsXEQs4jASIwVvaxv0voh7KVk/Gtdhi+ZaPNvP42miKQzBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNG4mYotTZHlddW7IjF9QqfYmwlmThcSMNIu+5mJLHM=;
 b=m7JqBsaXZPYAEf3gQHgGjU6o9ivcpBOaEZIwYwl1j1w5HgfFfFxkFnU9Jr/Epd/yXoIzItfkOzy/kGQfVKrZcC0USaSfU98H+REk0TfRfpYk0/hFcLeOBbspz63cFhiw/KdYZJ9UK5OT7YXDJ8q/ScRZpZiieZteo5SY+Qe53hQ=
Received: from PSAPR03MB5735.apcprd03.prod.outlook.com (2603:1096:301:83::6)
 by KUYPR03MB10388.apcprd03.prod.outlook.com (2603:1096:d10:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 01:55:11 +0000
Received: from PSAPR03MB5735.apcprd03.prod.outlook.com
 ([fe80::fbb0:b153:ae19:807f]) by PSAPR03MB5735.apcprd03.prod.outlook.com
 ([fe80::fbb0:b153:ae19:807f%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:55:10 +0000
From: =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH i-g-t v1 0/1] kms_atomic_transition: Skip unsupported
 blocking transitions on MTK
Thread-Topic: [PATCH i-g-t v1 0/1] kms_atomic_transition: Skip unsupported
 blocking transitions on MTK
Thread-Index: AQHdO3dZ9ZPbnPKc1USRRUL6MigAvLa9qa0A
Date: Fri, 4 Sep 2026 01:55:10 +0000
Message-ID: <47868a6f65a4e0d86a347ae409edf92563d4428b.camel@mediatek.com>
References: <20260903073900.7877-1-xiandong.wang@mediatek.com>
In-Reply-To: <20260903073900.7877-1-xiandong.wang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5735:EE_|KUYPR03MB10388:EE_
x-ms-office365-filtering-correlation-id: 8f6cd104-4bb2-440c-65bb-08df0a278dab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|38070700021|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: Y66uP06iDNTSL65NtJGNmT1eFe4wgk95MAs2rU9SijmmwT3oDJpdrf65jDx2qHMry8ZbaDqGkPBsd1xx7xFP3R7RLTa0JJtdQRa+x76UGlN8E6Ib/pTqEO1Mpb/mj28Md4stGx1FxVdy4o3QejLhcv0THtI9Nt7jtKEYaW5lv++0kKTxTzx4y+rFdWYXYBMd5NLuJkO0QEOEnltfXcPmPIdAsYoezJ9fB2n/V//ny+sxoNoVklrf1tjeOm2plIjVFLrCfuqmUtmjEP/Fu6nLt09HLBWJqPXHP+GshZBIp1vBAeHy0k0ZQfy7d0wpIZSlW2W+kf3tQRa35xUE3qNsNFPbRHhnNCVAgLmhVUBJOZX8zDUaK5yKO7gMqAm7ocTheyeCEvRzFBPbrnjyFCQEk0TGc0cLYqnmhZmTmMX9oT50LcBFjFqCLOs//fNLT4cK/09mOoV3qCqJQg/jmzW/i1EDBXi8BaLG6cZnQsNwwUE7VVWioMGbTmVLwR8JhHrfjYUIJVI0mWEfJRuzUU2DCf9/uTNw43tozEoZayIe9EXK0aTWm72rNJXk5FvxtSDmuj0WCHKnzW6uGvgPfeHkD9NAzmuoIKSPOl2uYWaYcDwXNMKaTWktM6gNXBBD1u8BGv32oCHesA8czyvT7ysbIl4C+V7cGI8hqbH4kqsgkxZRPNR32Gg72r36FYsRwxHLBthSeJm11yh+8ocGVJQZGf1w5d1igVG2TU8LqHXkFhc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR03MB5735.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajBNRUlYK05qWWNYT0ZPTEg1YVYxVmdJY3paVUtqVHplTjhsRzVmREpDaVdy?=
 =?utf-8?B?RitpM0pYNU9EcGpjTHhpMjFmbmZRVm13NFJzTUpGanhGWWtENmJ0L04zVGlY?=
 =?utf-8?B?Rlp6clRHZFhlMmJRb0xFenVDTnUrekRvYzR6aHdzUk05TnNQUW4wUUxtcUV2?=
 =?utf-8?B?WG8zMEVlNGdybk91TFhQb3pRSHRDUGdUSVp1SWk1dEpGU0ludnM4a2MrMEkx?=
 =?utf-8?B?Sit4Y1dyU0F6YVZ0TlUzLzFyQS9IZVY2d2ZNQ0lWZVRVQ3R4bWFvUVpqTUxL?=
 =?utf-8?B?VEdwM05iUzQrd1Q0VW95Uk9ERlBqR0o2cG9yRmovZ05JU1dJcE00ckEvNkIy?=
 =?utf-8?B?VlFyZzBOM0NoNHg3N2tXUlVRc0ZCampuTjVmYVRxaDV2SEJqTzJHTXFCVDhW?=
 =?utf-8?B?akFZQktkSlZxSjFLdXM5ZnU4djNxcjFBMW1yQks1SjZTVHZFK1RhMHp6UHIw?=
 =?utf-8?B?Y3g2K0Foa09meDArKzlZYmRjUVgzUGphMy9QbUxlMXhGS01FSGZhSENLQnZt?=
 =?utf-8?B?MnA5Slh1ZGlOUVJHMWQzVHc2Tm9GZ05xL0hYWVE5ajJUWktZbXFobnRFOG5G?=
 =?utf-8?B?MGdZaGZOMGJFT0NUd3BlZDNyMHlvckpIcVBUUzdEc0xzTWZHRXBteEFoWWRI?=
 =?utf-8?B?WXlITXpwNkVyMEcvUHlFNk9FUDE5ZXNrNlFPdm1lcEFkeTRlR0l1ajRQdk1O?=
 =?utf-8?B?c3ovYUVEbDRscENtU0Fnc1VraDBaY2RlTGZoT2I1ZDJDVUY0OGlxdEtHc3g1?=
 =?utf-8?B?dWJ3UlNmaGNqWDYxYmV3QUtqOTlka01VUFBwTXdSKzhId3BWcmpuU3RleTJv?=
 =?utf-8?B?SnA5TnBpc0J5SnBDeUE2WnVmM0tiY2hEQjBWQWc4bk1UZWcyMGpPRGFJZWpG?=
 =?utf-8?B?dzF3dnJPQjZub0xlNEZKQmJURkgxclhzcGg2UGE3eE9teTg0NFJzbWU3a0NU?=
 =?utf-8?B?WHNub3g5cXRPOGkxN29IejlaOFYrYUdRdE00YnZ5K09zYmpTaXg1Zlh5WDMw?=
 =?utf-8?B?b096VW1oclFNbWpXSmwwL3kwdGgrRkkreFdYYmJncGFsbE42M2tvS0JxYmV3?=
 =?utf-8?B?QkhTRVhaNU1CQnpJWThDSGdWTWMrRGNERHFPQVVCaTNjOWcvd2lsVXdEQlNp?=
 =?utf-8?B?bjA4ZVVYTkNpd1hFTXhCaFJrMUZONTZndG81eHUvQnZLNy9jcURkbDVqc0dQ?=
 =?utf-8?B?M2NDYk5WT21WNXpoOVU5emhiYWdra0Q5Y0NlR2hLTnFSUkNoZmd4Zkh5STJh?=
 =?utf-8?B?MGJPdGFGb3IzYm81cXBOS1VOVmhHTisyNW1ldjZ5NXpRUEorb1I1Vllhd0Jx?=
 =?utf-8?B?Zys3Um9aWkVWYTJ0eGpBU2hrZlF6Wm1kRmZWMEVRQjZ6c29VNWs2amFXZlVu?=
 =?utf-8?B?b2lTaGhGK0gwRFZtbFBJZ2FVdC94dmM4MHhSc2Q2MlUxNnNWT1prdWRaT2xm?=
 =?utf-8?B?bEhhajc4SWRRWGtmTEZZZkEzM1NUcGVzSmJOVWNocmRJblYvWjlweE5DQ01t?=
 =?utf-8?B?TVZUKytHY1ZkUVZZUStmTm9FbE1TejlWSlR3RjVqSTIxaWxXUkJYSnBSek5w?=
 =?utf-8?B?azRUTkhZbHQ4MHNhNU1Od2xiZC85dElQU2ozVy9QTVp2b1EyN3JrZGp2MVNW?=
 =?utf-8?B?QzVEU24vRC83T0RSaldMdHliaG1FZ24vMmJocXdsNjB5dUdxU1FEd1g3Rm5C?=
 =?utf-8?B?Q3d5Yk9LRDBCZHVSeEltM3JIWmxtR1dsTHdGZ0RrZWFjcEI5dWNxeHRMa3Fi?=
 =?utf-8?B?RVd5TWl1NTVNUjF0RVlNZjBqUTRuTENnR1AxUE5GQUJ0dzRISXZQOGljWG00?=
 =?utf-8?B?bGVQdlNFMjNJTnlEVWZMOXgvbHRiWEp4YWlWVkNuZmhMVmZBTXl4NnhNT0Zy?=
 =?utf-8?B?aFc3NzN6R1E5TWtxRTFxTGtNNWxGNXgzRmttYXV2ZTM4eWNKbDVRMDFWSDk3?=
 =?utf-8?B?K1F0SUc3Q21hSDRxdGZqWE4vSm5FcEFQWVU0b2lPaktEa2NSU2dCTmU4RDdj?=
 =?utf-8?B?U0lyVUhoY041aWhITGFPNUJEM1c2SnY1RkdCcFVnWENjc1E4b0hlR05lT2xx?=
 =?utf-8?B?cGt5TDNnUnZVVU95VXAxTVA1L2prZHgwZXdZOTZkS3FvMVB2bHJvQUM1SXc1?=
 =?utf-8?B?UjJ1dVBRU25rNUxQVU5KUXRKMjF4c1pXN1lxM3FNOG90YmJDY3RmSXZzcjhw?=
 =?utf-8?B?eXZZbXE2WCtFMldXb05sSGZCT1dTTHl3V3cxb3J6ZkwzeW5qVjBnZEcxL1ZS?=
 =?utf-8?B?aXNLejBUVFBPc2lteW1UeGlwOUtkb0RHU3h3MUUzNUkxcTkwenl1TGxheG9Y?=
 =?utf-8?B?Qy9jdGYyZVYzM0VyMzNNRk9BbmdHWHg0R1lNenk1ODFSRHN1MHdjVkQzTEFo?=
 =?utf-8?Q?ZD0NYqj5p8nQa3kA=3D?=
Content-ID: <1F365E8900E7FC4A8F9AF834EEEFB406@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0nKNQfqrQqrCJtxLt3NfVY4kGgqXM0SZOMeDsQ7VoIgBeTJ0m0YHyGdch7yK62HM7DmwyIBPEXk25/k7yuGHVHf5/0PrL16X6KZN0fhKwKYSOKVfIUt3LhXt+NEQn8wrgeX8SwthXdNYmm5AdUps9KOxBnAZVsJwIN73SY8AobeYmQ0JxnOexUYS+lMSOmjl2j9HFJ/dtT6wprnoOVFro2hwH01GnybFJp9NjzhDnykl2OdEzsAz4bNqSEZ7pW6QMjlHXiXoeh5oo9LtvNE05bRePvT5eP3EmhAcWxp0FPY6AwarktgNiRCKHodKmJ9paLkuBQKIsyGSQGIqdgPiPg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5735.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6cd104-4bb2-440c-65bb-08df0a278dab
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2026 01:55:10.6536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUSotpPj/gJPGYDrgl3/3cxvESPr8GNc3HEDHQ1EJl3JsuYWS055zYf7T+V/VPn8mePlSj/rpAGf2Przha12pe2/F8Mf5+3trnD87MPFb8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10388
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_988133374.191676382"
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

--__=_Part_Boundary_005_988133374.191676382
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2FtaWwsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KSSBoYXZlIGFkZHJlc3NlZCBh
bGwgY29tbWVudHMgaW4gdjI6DQogIC0gVXBkYXRlZCB0aGUgYXV0aG9yIGUtbWFpbCB0byB4aWFu
ZG9uZy53YW5nQG1lZGlhdGVrLmNvbS4NCiAgLSBXcmFwcGVkIHRoZSBjb21taXQgbWVzc2FnZSBi
b2R5IHRvIDY1IGNvbHVtbnMuDQoNCkkgd2lsbCBzZW5kIHYyIHNob3J0bHkuDQoNClRoYW5rcyEN
Cg0KT24gVGh1LCAyMDI2LTA5LTAzIGF0IDE1OjM4ICswODAwLCBYaWFuZG9uZyBXYW5nIHdyb3Rl
Og0KPiBNVEsgRFJNIGRvZXMgbm90IGN1cnJlbnRseSBwcm92aWRlIHRoZSBpbW1lZGlhdGUgcGFn
ZS1mbGlwIGV2ZW50IG9yDQo+IG91dC1mZW5jZSBjb21wbGV0aW9uIHJlcXVpcmVkIGJ5IHRoZSBi
bG9ja2luZyBhdG9taWMtdHJhbnNpdGlvbg0KPiB0ZXN0cy4NCj4gDQo+IFNraXAgb25seSB0aG9z
ZSBibG9ja2luZyB2YXJpYW50cyBvbiBNVEsuIFRoZSBub25ibG9ja2luZyB2YXJpYW50cw0KPiBh
bmQNCj4gdGhlIHNlcGFyYXRlIG1vZGVzZXQtdHJhbnNpdGlvbiB0ZXN0cyByZW1haW4gZW5hYmxl
ZCwgc28gY292ZXJhZ2UgZm9yDQo+IHRoZSBzdXBwb3J0ZWQgcGF0aHMgaXMgcmV0YWluZWQuDQo+
IA0KPiBYaWFuZG9uZyBXYW5nICgxKToNCj4gICB0ZXN0cy9rbXNfYXRvbWljX3RyYW5zaXRpb246
IFNraXAgYmxvY2tpbmcgdHJhbnNpdGlvbnMgb24gTVRLDQo+IA0KPiAgdGVzdHMva21zX2F0b21p
Y190cmFuc2l0aW9uLmMgfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4gDQo=

--__=_Part_Boundary_005_988133374.191676382
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0thbWlsLA0KDQpUaGFua3MmIzMyO2ZvciYj
MzI7dGhlJiMzMjtyZXZpZXcuDQoNCkkmIzMyO2hhdmUmIzMyO2FkZHJlc3NlZCYjMzI7YWxsJiMz
Mjtjb21tZW50cyYjMzI7aW4mIzMyO3YyOg0KJiMzMjsmIzMyOy0mIzMyO1VwZGF0ZWQmIzMyO3Ro
ZSYjMzI7YXV0aG9yJiMzMjtlLW1haWwmIzMyO3RvJiMzMjt4aWFuZG9uZy53YW5nQG1lZGlhdGVr
LmNvbS4NCiYjMzI7JiMzMjstJiMzMjtXcmFwcGVkJiMzMjt0aGUmIzMyO2NvbW1pdCYjMzI7bWVz
c2FnZSYjMzI7Ym9keSYjMzI7dG8mIzMyOzY1JiMzMjtjb2x1bW5zLg0KDQpJJiMzMjt3aWxsJiMz
MjtzZW5kJiMzMjt2MiYjMzI7c2hvcnRseS4NCg0KVGhhbmtzIQ0KDQpPbiYjMzI7VGh1LCYjMzI7
MjAyNi0wOS0wMyYjMzI7YXQmIzMyOzE1OjM4JiMzMjsrMDgwMCwmIzMyO1hpYW5kb25nJiMzMjtX
YW5nJiMzMjt3cm90ZToNCiZndDsmIzMyO01USyYjMzI7RFJNJiMzMjtkb2VzJiMzMjtub3QmIzMy
O2N1cnJlbnRseSYjMzI7cHJvdmlkZSYjMzI7dGhlJiMzMjtpbW1lZGlhdGUmIzMyO3BhZ2UtZmxp
cCYjMzI7ZXZlbnQmIzMyO29yDQomZ3Q7JiMzMjtvdXQtZmVuY2UmIzMyO2NvbXBsZXRpb24mIzMy
O3JlcXVpcmVkJiMzMjtieSYjMzI7dGhlJiMzMjtibG9ja2luZyYjMzI7YXRvbWljLXRyYW5zaXRp
b24NCiZndDsmIzMyO3Rlc3RzLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtTa2lwJiMzMjtvbmx5JiMz
Mjt0aG9zZSYjMzI7YmxvY2tpbmcmIzMyO3ZhcmlhbnRzJiMzMjtvbiYjMzI7TVRLLiYjMzI7VGhl
JiMzMjtub25ibG9ja2luZyYjMzI7dmFyaWFudHMNCiZndDsmIzMyO2FuZA0KJmd0OyYjMzI7dGhl
JiMzMjtzZXBhcmF0ZSYjMzI7bW9kZXNldC10cmFuc2l0aW9uJiMzMjt0ZXN0cyYjMzI7cmVtYWlu
JiMzMjtlbmFibGVkLCYjMzI7c28mIzMyO2NvdmVyYWdlJiMzMjtmb3INCiZndDsmIzMyO3RoZSYj
MzI7c3VwcG9ydGVkJiMzMjtwYXRocyYjMzI7aXMmIzMyO3JldGFpbmVkLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtYaWFuZG9uZyYjMzI7V2FuZyYjMzI7KDEpOg0KJmd0OyYjMzI7JiMzMjsmIzMyO3Rl
c3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbjomIzMyO1NraXAmIzMyO2Jsb2NraW5nJiMzMjt0cmFu
c2l0aW9ucyYjMzI7b24mIzMyO01USw0KJmd0OyYjMzI7DQomZ3Q7JiMzMjsmIzMyO3Rlc3RzL2tt
c19hdG9taWNfdHJhbnNpdGlvbi5jJiMzMjt8JiMzMjs0JiMzMjsrKysrDQomZ3Q7JiMzMjsmIzMy
OzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjs0JiMzMjtpbnNlcnRpb25zKCspDQomZ3Q7JiMz
MjsNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRtbD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48
cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5IE5vdGljZQ0KICoqKioq
KioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWls
IG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlh
bCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlz
Y2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29u
dmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3Nl
bWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcg
b2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdm
dWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwg
b3IgYmVsaWV2ZQ0KIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJv
ciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRv
IHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWls
IChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90
DQpkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29u
LiBUaGFuayB5b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_005_988133374.191676382--

