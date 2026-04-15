Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30993FA0C29
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 05:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0210E674;
	Wed, 15 Apr 2026 05:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="UGTmBU8C";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="sx/stTbX";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F5B10E674
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 05:11:57 +0000 (UTC)
X-UUID: 9cdaad76388911f1ae70033691e9ac7d-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PpIHg/GhMckdTjMtuPHoE/LnYpF6X6ReelKC8MyXCaY=; 
 b=UGTmBU8CpSVTNJEoHBT6DexjdHf/XeLXmmu52PoqvrmR4mm8wdrHJJ2UeULukDMaNxLYSCN9184wxsmizeqqZgZxcpp9QhhLWcWkOMc4sghONSOZSvv0Fg/rRo777ioVb+vgS+DZIMGDQShDIhmWNrcEyQIsMyk8zyYRvvAxRgw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:c98ba8ec-7e58-4004-a8fa-232940b05f63, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:948f708f-6df4-4a3d-a7a4-fbdc42d669ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9cdaad76388911f1ae70033691e9ac7d-20260415
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1726638714; Wed, 15 Apr 2026 13:11:51 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 15 Apr 2026 13:11:50 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 15 Apr 2026 13:11:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmfXEFDCUvAZEe0fWtsJp3zkQFXV5UaA0tu+a4O7qu2ggXam2le4rzvHIm5yYSBaloUvX92Uo1RLmHsGm05T0mHHZhrAc++ARXPZkrQ+2i6QdNSXgqYMzBJSkB/MNeIMho4TblYtdN81BVZLDtW0ViXckx3CDROdcOwv9OVU3fgudJGZC9I6RXeaLgekLRq6SFZe02qGmDQBk1NA0Z/dJZHA7i1f1M5DZP5SAKlei5rqiiLUeRELPUHGYOK39laZewFa+0pR/J0w4FhXMiuBq/JvUf4ZoIXmMFSyKEIT5Ca6M9NkgbDEFhNPKGfRMWCLzbBtIk227HwKWFdP4wgCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpIHg/GhMckdTjMtuPHoE/LnYpF6X6ReelKC8MyXCaY=;
 b=tZlI9BrQuWN90PNcJZEgukZwGMe4212XHJJvvhPS5HJMXJE9KQ8ywol+RkpJW/rModT7py+YRwrTwAie+bI55OLB+qsFa6lU9DmqEwb/ClpkUGbfXOo+8iuS0lsRbNX0rr6YWXdj8MTY6VMii6iQE9x1a28azKSs/qYWGWnURnRm2kj8v/8nSBor4wjbTPAE6qJ9anh7rUOItf8np6hINxDWmffuSgvsNgTawQ1dnEy4BhPFWscPb7oW7Bs99i09o/3eEg+a0uiMqSUKgPYQCvZwPcjmm5iD69CQoI2vaMosNoHRbEUyJ+fi/ULWE3xTkhcu0A6qPykKBJflB+bCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpIHg/GhMckdTjMtuPHoE/LnYpF6X6ReelKC8MyXCaY=;
 b=sx/stTbXyZ5ASXvLtCeZB9RGGOCaRThVBINyW3QkEMbUCLGeSbJm6wEAQ/kA0HMTLAarAtKrb39xXOn5FUHxvLCfBsxcQsnStKfnnuYWDDeA1ZzAtKAH7kUx/42dRb1QWMvvT14eYp3Zt8ujCJkQpjIgLarEFIplq8/TfZYfWbY=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY1PPF4D3AB252B.apcprd03.prod.outlook.com (2603:1096:408::a55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 05:11:45 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 05:11:44 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Topic: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Index: AQHcyNH2YxjB3EtuVUiEvZIHanYs6bXYFx4AgAXP+QCAAK+oAIABBE+A
Date: Wed, 15 Apr 2026 05:11:44 +0000
Message-ID: <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
In-Reply-To: <ad5De-s-yxyyTt7s@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY1PPF4D3AB252B:EE_
x-ms-office365-filtering-correlation-id: 7cb677d6-b7b9-422e-62de-08de9aad7c91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: r4OhxLx89bMjed/wW1VcdQCImyU/e2SX5f0pbaBEZRsHnbd5AOeu5OpUDeVcb1taSA2IaJV+NOD33DGXGVBvwZoUA1a7YRGgO63eFznmHu1/CX1GUDVfGZyRZ2EYScUeHgK1XWxuSGiNwgnVEBgjEfOfWL1Rf37VJg5DjeT6/FcWH10aIgV2bNhzPV2L40Z4KmNldFQICvJHUarz2KpiWO+UX0WmAWlQ1jSDj/hsU/IgiWJfbFyV8Jbb/oMMxj6J0WATbpg711fsB+NwgmMGD440y3X8ObDYxWM8jPz4lG7K7yLU0GD4UuhGeK/P/slOnAnN/UpAMlBOiEwpxXKG9xx6TMcod6gl+gO70KBoSiuIly2vCoMLz8Yg1Uke7XKsOqaidRj3X4zX3y0qNW18WXuSdG5WXGRThvsc+b3nW0V6is3kaV5Q1RUrMIqsK1izCh39RWqpC4ox6qxXUpjlLxH5L/8UisRT53zEYo2K5jYKehKsaKus5JXI1wNtRFyKtfhJ7TSdaRi6R23jtZi6/x406qsU+KR9wNYGQ3+FeRjpQCvlZydgc3nENUakZhbiqnFnEEQ4ZbR19RUBFQbalPP4GlPvDHj+WztwXDP8srYLvBEdge+MED+dUkCq2lIne2F0jOMx+710CNjqNtlyIQX3FvxyRE0vrday3I634GYipkBGBGnshBOJOmYCOPDypMrY1uCVuJ2coj6aYcoRsjNGqXU305DzZgjQpP+GqejXuQjvjYDerfuhahPwmLXvZgldqn909kpleWzMol7Vp/ROtCHBG2mSyGBXe4iBmIk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHhoOXl3bG52NkhYSTVxZlA2eCtMaTFEZTJsUU1KY0JCcmdDdHBxZ0J0ZHdF?=
 =?utf-8?B?bmNaSDdlV01TLy9oNmY4NlMvd2lmck1vNzV2RHhjWWk0QVlkaE9SYWJDUEha?=
 =?utf-8?B?WEJyWnhPZ28ra2FwaUZORXM2WjY0a2NXaW50MVNSa3dTR3h3dks0RkdYSVlD?=
 =?utf-8?B?S0taOXJ4cjhBVGYvNUJIVmgvQ3QwNWpVM1h4VlZWTy9KQmNyaTdvZkZ2bTl0?=
 =?utf-8?B?WHNIMy90ZDYwVjVOeFZLUDYwVVFER01JbE03TWxFclMrN1VSRHVHZmVqSnBH?=
 =?utf-8?B?eGNreVc2S1pLL0ZnbHdkVkJsSWZQMnN2SXV4K3JrM1JDdUhtUmZMdmxiZEFo?=
 =?utf-8?B?c0pRS1NDYU1vTDFYMnhzcXlKNkxYNXZtMHduUktBZkU5bWpNUDlSMnB1ejRn?=
 =?utf-8?B?NUNSNUk3eVhrV0UzNENnOEhVcTIrQ3RHQUwranRVZTJWVFVLRmJFbjlwMlFt?=
 =?utf-8?B?bDlxdDV4RUo4NkdUcStIcE5PTUw2c2dqbnE0cDhJSll4d0FSUU9kMEtPWXFx?=
 =?utf-8?B?N3dRNWRIa1FmTi9GNnRwNm9kRkV6dWNNclU4TXU4ZmJrdkRTMkozWUdtWHUv?=
 =?utf-8?B?STY5RXFTY3BwWVJseFdCaDJFdzhGYWptZ2ZuRFllZ3h6SngvY1NsajR3MEM4?=
 =?utf-8?B?eE1ZT2pPbnhXcGYxOVFjV1dtdTYzYUc4cE9SRzlDL3lrZ3dLYU91RnRjYy9K?=
 =?utf-8?B?NHlYS1A5SjVPdHdVRGNYZFJVRk1Fb2ZQd0tRQ3lUeFFlNHd6USsveWplMXgz?=
 =?utf-8?B?U2RWYmZEaGgyNnRCb1dkTm9kKzlsOUlsTUtGVmhXdUcwSjRBNTdYYzZCcGVp?=
 =?utf-8?B?ZS9iVzZrdDdFbWRlQ3NUV2pmWm5zVDQrNGxyUWxNQWpVREZnOGRUcTZ5U3NN?=
 =?utf-8?B?dzdQZUJpSUJZd0IzRy9JOUx3YThValh5Sm9OUzBOUFNjNWp3N2pYWU05S2I0?=
 =?utf-8?B?dHR6NGh3OHZHeENkSDBPMWFuNXNLbGVWUlRyZW1LanNINDZ5Q25tRUd3YUcz?=
 =?utf-8?B?R1ppT0xPRXRNT1RZUGNBcnd0Z1Bob2ZIL0xOM3R4Uk1vRHp2MjVtOFFsMS96?=
 =?utf-8?B?MktibHMzTk1pNFczWmlSd0ljUWtlb2YzT1M5WnNhU1ZEY0JobjJtYm1Cc0Nv?=
 =?utf-8?B?bUh5dysvbGhJQjlIVzkrbnF6MGN4WHVPRGdRUnFOd3JSWWJoQkpXMUVjRGRy?=
 =?utf-8?B?eVdQWHdiZXRmYTZTbkt6NkdHQUVoV2kveG9ZQVhZOURueHprZmJJTFFyVVYw?=
 =?utf-8?B?NzgxQXpRQ1gybm5qWUpQV1FHN1lZMExNWitxRkhVV1J1R0paRnlLdHFZdUMr?=
 =?utf-8?B?MlpSSUo3anFXc214VlZkVHI3VHNObWk4RjNGem9XY2R4M2MzRzdqelpRalB2?=
 =?utf-8?B?ZFBLalhZcms5bE14WmM5Nm5TV3lMV1Z2NjR1NVNuTlBWUXMzdWhFTGVkTkFn?=
 =?utf-8?B?bGcwdzJrRlZteVJReXVZeTZaYzhDNkpXN0I1ajBVdmx4Y1g1ekJ2VkhBRTht?=
 =?utf-8?B?TmtWRXhTdkVGZVUrN2hEUUF0WmgzVC9vZERMZnJaZUNRdmhPS0RHQytpdVVG?=
 =?utf-8?B?cmU2Y1FBRFAxWitTb29OanhaQTgrVWRYdHJUbTVWMFlhOUlQWnN5WTVvZE9l?=
 =?utf-8?B?Q1dHellRT1hCUlpyWkM4NHJEVXNZTjZKM1RIaHE0Q1ZvRlNxYXdmT3hLRG9w?=
 =?utf-8?B?Z1RNMTZ1cSt2aTk1L1QwZFhPcDk5eFpPVVJtc2lLWS9maDNwQ08yWFdxb0dp?=
 =?utf-8?B?ZmRlQThGQ1hXZnA1NFhRbEFBRzg4MmRFQ044THpabEJLSGpCV3lrRXFpb1Bn?=
 =?utf-8?B?eGpiQ2Ewc1F5cnhrMC9zZVVDbVJrTmhZTVhOb003UStIOHZxS20vbEQvbTVB?=
 =?utf-8?B?REdQQXI0RjhWd3FlblJ2dkFZR3h3cFNjc3V4OGJYczllTVBNaExvWklyMEF3?=
 =?utf-8?B?ZlpIQTdCMTV6d2lMczVKOFoxOW95UDJ1cys3aXhtb0krbTlncGlVRUZJZFhy?=
 =?utf-8?B?c3BvQVZLT0VMUDRRMkdXZCtrRHEzZDA0TE9CZHpUVkpGWWRUWVdTY1krUnBN?=
 =?utf-8?B?UlNMamtSN1dUVHc1U1pXWDd1bEUzMmsxMEM4eG5MUWVicWYweEdQbFA4Zy9L?=
 =?utf-8?B?d2VOV0taZGpCMHo0eExBQjdmeGxMamE0cmU1UTV1c1FFK1ZjSVJGUnRmV25J?=
 =?utf-8?B?KzRHL0tIeDZnWE9XRTRiVk83UlBqOTJPSFN2bVc1UkZCV2dxK25NT1lhR3BS?=
 =?utf-8?B?cm5ZNUU4WTNwZW1JMUVpSTJEZTQ4TTlvSTFOQ3JlcEhmcGpFZE9FZUdJY1RC?=
 =?utf-8?B?SGxBOHQwbUhjYUZhNTJ6dnc3Z2M4d1RvcFVoeTZuYXRaS0R3VmY0ODBsTlBk?=
 =?utf-8?Q?o+ezjlKd28yrFn/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D829A6F8C455714ABD4936383BCB3EA1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: daaz3eJpX5ysLE9iOEqeBzcU3iX2sWMdpXMBYfS4EUdiFCVk0bDZPVms6UnEB4J2usCc3Poft8io2DZIunwf78j5w6RoNfs1EECo8RYovdGCN+sl3WB6c46lL0DEf97Euy6ynKBSS6RYdWUnJbm9ML2OvRO7C1gb/zOKM7jCmyoQCMV+B+RE3yXE8M6QxZww7O6F64a1M4sAfhEpHKJa+Y/+GRF3pvQhZIAl43MDwGyRRyFGo1eAjCj6I7Tm4pFPJ7n3XjWzp+3DzbTa9+KVTlq5rWj8nZzOd225NmjRQ3PoGKSJBc07iF+E1HWe+tnnvisz4evC8W1xEISne0tkAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb677d6-b7b9-422e-62de-08de9aad7c91
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 05:11:44.2446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZgUr8dSaZki3OZi1OOU1G/zDbw6YQSleJdN+8DBfFGIDhYYOtyRexXnoXjQpN7iw6EFYrq+PGf7xKaojj0uffLjeviSYR1TxYCii24wkTuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4D3AB252B
X-MTK: N
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

T24gVHVlLCAyMDI2LTA0LTE0IGF0IDE2OjQwICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
Cj4gT24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgMDM6MTE6MjFBTSArMDAwMCwgSmFzb24tSkggTGlu
ICjmnpfnnb/npaUpIHdyb3RlOgo+ID4gT24gRnJpLCAyMDI2LTA0LTEwIGF0IDEzOjI1ICswMzAw
LCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDA2
OjA3OjMxUE0gKzA4MDAsIEphc29uLUpIIExpbiB3cm90ZToKPiA+ID4gPiBBZGFwdCByb3RhdGlv
biBDUkMgdGVzdHMgZm9yIE1USyBkZXZpY2VzIGJ5IHVzaW5nIEludGVsLWxpa2UKPiA+ID4gPiBw
aXBlCj4gPiA+ID4gQ1JDCj4gPiA+ID4gYXBwcm9hY2ggd2l0aCBleHBsaWNpdCB2Ymxhbmsgc3lu
Y2hyb25pemF0aW9uLgo+ID4gPiA+IE1USyBkZXZpY2VzIHJlcXVpcmUgYSB2Ymxhbmsgd2FpdCB0
byBlbnN1cmUgcm90YXRpb24gY29tcGxldGVzCj4gPiA+ID4gYmVmb3JlCj4gPiA+ID4gQ1JDIGNh
cHR1cmUuCj4gPiA+IAo+ID4gPiBJbnN0ZWFkIG9mIGFkZGluZyB0aGVzZSBjaGVja3MgYWxsIG92
ZXIgaWd0IEkgdGhpbmsgeW91IHNob3VsZAo+ID4gPiB0cnkgdG8gZml4IHlvdSBrZXJuZWwgQ1JD
IGltcGxlbWVudGF0aW9uIHRvIG5vdCBoYW5kIG91dCBnYXJiYWdlCj4gPiA+IENSQ3MuCj4gPiA+
IAo+ID4gCj4gPiBUaGUgaXNzdWUgaXMgZnVuZGFtZW50YWwgdG8gTVRLJ3MgSFcgZGVzaWduIHdo
ZXJlIGFsbCBIVwo+ID4gY29uZmlndXJhdGlvbnMKPiA+IGFyZSBhcHBsaWVkIGJ5IEdDRSAoR2xv
YmFsIENvbW1hbmQgRW5naW5lKSB0cmlnZ2VyZWQgYnkgRU9GIHNpZ25hbC4KPiA+IAo+ID4gTVRL
IEhXIENvbmZpZ3VyYXRpb24gRmxvdzoKPiA+IAo+ID4gaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNw
bGF5LCBDT01NSVRfQVRPTUlDKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIIKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8Cj4gPiDCoMKgwqDCoMKgwqAgYXRvbWljX2NvbW1pdCgp
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUggo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCDilrwKPiA+IMKgwqDCoMKgwqDCoCBDTURRIHN1Ym1pdAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCDilIIKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8Cj4gPiDCoMKgwqAgV2FpdCBm
b3IgbmV4dCBFT0Ygc2lnbmFsIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUkAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKU
ggo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvAo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEdDRSBhcHBsaWVzIEhXIGNvbmZpZwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChSb3RhdGlvbiBwYXJhbWV0ZXJz
LCBldGMuKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR1cmluZyBWQmxhbmtpbmcgcGVyaW9kCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAm
IEdDRSByZWFkcyBIVyBDUkMgZnJvbSBIVyByZWdpc3Rlcgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludG8gRFJB
TSBidWZmZXIKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIIKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrwKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOZXh0IEFj
dGl2ZSBEaXNwbGF5IFBlcmlvZAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhXIHJlbmRlcnMgd2l0aCBuZXcgY29u
ZmlnCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRU9GIOKGkiBHQ0Ug
cmVhZHMgSFcgQ1JDIGZyb20KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSFcgcmVnaXN0ZXIgaW50byBEUkFN
IGJ1ZmZlcgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUggo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZCbGFuaysx
IOKGkiByZWFkIENSQyBmcm9tIERSQU0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDi
hpIKPiA+IGRybV9jcnRjX2FkZF9jcmNfZW50cnkoKSDinIUKPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoTVRLIGFs
d2F5cyByZXBvcnRzIENSQyBhdAo+ID4gVkJsYW5rKzEKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFmdGVyIHRo
ZSBFT0YgY2FwdHVyZSkKPiA+IAo+ID4gCj4gPiBUaGlzIGRlc2lnbiBpcyBpbnRlbnRpb25hbCB0
byBlbnN1cmUgYWxsIEhXIHNldHRpbmdzIGFyZSBmdWxseQo+ID4gYXBwbGllZAo+ID4gd2l0aGlu
IHRoZSBWQmxhbmtpbmcgcGVyaW9kLCBndWFyYW50ZWVpbmcgdGVhcmluZy1mcmVlIGRpc3BsYXkK
PiA+IHVwZGF0ZXMuCj4gPiBBdCB0aGUgRU9GIHNpZ25hbCwgR0NFIHJlYWRzIHRoZSBIVyBDUkMg
ZnJvbSB0aGUgSFcgcmVnaXN0ZXIgaW50byBhCj4gPiBEUkFNIGJ1ZmZlci4gTm90ZSB0aGF0IE1U
SyBhbHdheXMgcmVwb3J0cyB0aGUgQ1JDIGF0IFZCbGFuaysxIGFmdGVyCj4gPiB0aGUKPiA+IEVP
RiBjYXB0dXJlLCB3aGljaCBtZWFucyB0aGVyZSBpcyBhbHJlYWR5IGFuIGluaGVyZW50IG9uZS1m
cmFtZQo+ID4gZGVsYXkKPiA+IGJlZm9yZSB0aGUgQ1JDIGlzIHJlcG9ydGVkIHRvIElHVCB2aWEg
ZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpLgo+ID4gCj4gPiBJR1QgRXhwZWN0ZWQgQmVoYXZpb3Ig
KEludGVsL0FNRCk6Cj4gPiAKPiA+IMKgIGlndF9kaXNwbGF5X2NvbW1pdDIoZGlzcGxheSwgQ09N
TUlUX0FUT01JQykKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIOKWvAo+ID4gwqDCoMKgwqDCoMKgIGF0b21pY19jb21taXQoKQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDilIIKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8Cj4g
PiDCoMKgwqDCoMKgwqDCoCBWQmxhbmsgTiDilIDilIDilrogSFcgY29uZmlnIHRha2VzIGVmZmVj
dCBpbW1lZGlhdGVseSDinIUKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIOKWvAo+ID4gwqDCoMKgwqDCoMKgwqAgRU9GIE4g4pSA4pSA4pa6
IENSQyBjYXB0dXJlZCB3aXRoIG5ldyBjb25maWcg4pyFCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIOKUggo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilrwKPiA+IMKgwqDCoMKgwqDCoMKg
IFZCbGFuayBOKzEg4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pa6Cj4gPiBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQoKSDi
nIUKPiA+IAo+ID4gCj4gPiAKPiA+IE1USyBBY3R1YWwgQmVoYXZpb3I6Cj4gPiAKPiA+IMKgIGln
dF9kaXNwbGF5X2NvbW1pdDIoZGlzcGxheSwgQ09NTUlUX0FUT01JQykKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAg4pSCCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKWvAo+ID4gwqDCoMKg
wqDCoMKgIGF0b21pY19jb21taXQoKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDilIIKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pa8Cj4gPiDCoMKgwqDCoMKgwqAgQ01EUSBzdWJtaXQK
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IOKWvAo+ID4gwqDCoMKgwqDCoMKgwqAgRU9GIE4g4pSA4pSA4pa6IEdDRSBhcHBsaWVzIG5ldyBj
b25maWcKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSA4pSA4pa6IEdDRSByZWFk
cyBDUkMob2xkKSBmcm9tIEhXIHJlZ2lzdGVyIGludG8gRFJBTQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDilIIKPiA+IMKgwqDCoMKgwqAgVkJsYW5raW5nIE4g4pSA4pSA4pa6IEhXIHVwZGF0
ZWQgd2l0aCBuZXcgY29uZmlnICh0ZWFyaW5nLWZyZWUg4pyFKQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDilIIKPiA+IMKgwqDCoMKgwqDCoMKgIFZCbGFuayBOKzEg4pSA4pSA4pa6IENSQyhv
bGQpIHJlcG9ydGVkIHZpYQo+ID4gZHJtX2NydGNfYWRkX2NyY19lbnRyeSgpCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIOKUggo+ID4gwqDCoMKgwqDCoMKgwqAgRU9GIE4rMSDilIDilIDilrog
R0NFIHJlYWRzIENSQyhuZXcpIGZyb20gSFcgcmVnaXN0ZXIgaW50byBEUkFNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIOKUggo+ID4gwqDCoMKgwqDCoMKgwqAgVkJsYW5rIE4rMiDilIDilIDi
lrogQ1JDKG5ldykgcmVwb3J0ZWQgdmlhCj4gPiBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg4pSCCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIOKW
vAo+ID4gwqDCoMKgIGlndF93YWl0X2Zvcl92YmxhbmsoKSBpcyBuZWVkZWQgdG8gZW5zdXJlCj4g
PiDCoMKgwqAgaWd0X3BpcGVfY3JjX2dldF9jdXJyZW50KCkgY2FwdHVyZXMgdGhlIGNvcnJlY3Qg
Q1JDIOKchQo+ID4gCj4gPiBBcyBzaG93biBhYm92ZSwgZHVlIHRvIE1USydzIEdDRS1iYXNlZCBI
VyBhcmNoaXRlY3R1cmUsIHRoZXJlIGlzIGFuCj4gPiBpbmhlcmVudCBtdWx0aS1mcmFtZSBsYXRl
bmN5IGJldHdlZW4gaWd0X2Rpc3BsYXlfY29tbWl0MigpIGFuZCB0aGUKPiA+IGNvcnJlY3QgQ1JD
IGJlaW5nIGF2YWlsYWJsZS4gVW5saWtlIEludGVsL0FNRCB3aGVyZSB0aGUgbmV3Cj4gPiBjb25m
aWd1cmF0aW9uIHRha2VzIGVmZmVjdCBpbW1lZGlhdGVseSBhdCB0aGUgbmV4dCBWQmxhbmssIE1U
Swo+ID4gcmVxdWlyZXMKPiA+IGF0IGxlYXN0IDIgVkJsYW5rcyBhZnRlciBhdG9taWNfY29tbWl0
KCkgYmVmb3JlIHRoZSBjb3JyZWN0IENSQyBjYW4KPiA+IGJlCj4gPiBjYXB0dXJlZC4gVGhlcmVm
b3JlLCBpZ3Rfd2FpdF9mb3JfdmJsYW5rKCkgaXMgbmVjZXNzYXJ5IHRvIGVuc3VyZQo+ID4gaWd0
X3BpcGVfY3JjX2dldF9jdXJyZW50KCkgY2FwdHVyZXMgdGhlIGNvcnJlY3QgQ1JDIHJlZmxlY3Rp
bmcgdGhlCj4gPiBuZXcKPiA+IHJvdGF0aW9uIGNvbmZpZ3VyYXRpb24uCj4gPiAKPiA+IFNpbmNl
IHRoaXMgdGltaW5nIGJlaGF2aW9yIGlzIGluaGVyZW50IHRvIE1USydzIEdDRS1iYXNlZCBIVwo+
ID4gYXJjaGl0ZWN0dXJlIGFuZCBjYW5ub3QgYmUgZWxpbWluYXRlZCBhdCB0aGUga2VybmVsIGRy
aXZlciBsZXZlbCwKPiA+IGFkZGluZyBpZ3Rfd2FpdF9mb3JfdmJsYW5rKCkgaW4gSUdUIGlzIHRo
ZSBhcHByb3ByaWF0ZSBzb2x1dGlvbi4KPiAKPiBJdCBkb2Vzbid0IG1hdHRlciBob3cgbG9uZyB0
aGUgbGF0ZW5jeSBpcy4gVGhlIGtlcm5lbCBzaG91bGQKPiBhY2NvbXBhbnkKPiBlYWNoIENSQyB3
aXRoIHRoZSBjb3JyZWN0IGZyYW1lIG51bWJlciBmb3Igd2hpY2ggdGhlIENSQyB3YXMKPiBnZW5l
cmF0ZWQuCj4gaWd0IHNob3VsZCBoYXZlIHRvIGRvIG5vdGhpbmcgYnV0IHdhaXQgZm9yIHRoZSBD
UkMgd2l0aCB0aGUgY29ycmVjdAo+IGZyYW1lIG51bWJlciB0byBhcHBlYXIuCj4gCgpIaSBWaWxs
ZSwKClRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEkgd2FudCB0byBtYWtlIHN1cmUg
SSB1bmRlcnN0YW5kIHlvdXIKZXhwZWN0YXRpb24gY29ycmVjdGx5LgoKV2hlbiB5b3Ugc2F5ICJ0
aGUga2VybmVsIHNob3VsZCBhY2NvbXBhbnkgZWFjaCBDUkMgd2l0aCB0aGUgY29ycmVjdApmcmFt
ZSBudW1iZXIsIiBkbyB5b3UgbWVhbjoKCioqT3B0aW9uIEE6IEFjY3VyYXRlIGZyYW1lIG51bWJl
ciByZXBvcnRpbmcqKgotIEtlcm5lbCByZXBvcnRzIHRoZSBleGFjdCBmcmFtZSBudW1iZXIgd2hl
biBDUkMgd2FzIGNhcHR1cmVkCi0gSUdUIGNhbiBjb21wYXJlIGZyYW1lIG51bWJlcnMgdG8gZGV0
ZXJtaW5lIGlmIENSQyByZWZsZWN0cyBuZXcKY29uZmlndXJhdGlvbgotIFJlcXVpcmVzIGhhcmR3
YXJlIGZyYW1lIGNvdW50ZXIgc3VwcG9ydCAod2hpY2ggTVRLIGxhY2tzKQoKKipPcHRpb24gQjog
SW50ZXJuYWwgc3luY2hyb25pemF0aW9uKioKLSBLZXJuZWwgaW50ZXJuYWxseSB3YWl0cyBmb3Ig
Y29uZmlndXJhdGlvbiB0byB0YWtlIGVmZmVjdAotIE9ubHkgcmVwb3J0cyBDUkMgdG8gdXNlcnNw
YWNlIGFmdGVyIGl0J3MgZ3VhcmFudGVlZCB0byByZWZsZWN0CmN1cnJlbnQgY29uZmlnCi0gSUdU
IGRvZXNuJ3QgbmVlZCB0byBrbm93IGFib3V0IGludGVybmFsIGRlbGF5cwoKT3IgcGVyaGFwcyBh
IGRpZmZlcmVudCBhcHByb2FjaD8KClRoZSBjaGFsbGVuZ2Ugd2l0aCBPcHRpb24gQSBpcyBNVEsg
aGFyZHdhcmUgZG9lc24ndCBwcm92aWRlIGEgZnJhbWXCoApjb3VudGVyIHJlZ2lzdGVyLgpPcHRp
b24gQiBpcyBmZWFzaWJsZSwgYnV0IHRoZSBsYXRlbmN5IGlzIHZhcmlhYmxlICgxLTIgdmJsYW5r
cykgZHVlCnRvIGFzeW5jaHJvbm91cyBDTURRIGV4ZWN1dGlvbi4KCkNvdWxkIHlvdSBjbGFyaWZ5
IHdoaWNoIGRpcmVjdGlvbiB5b3UnZCBwcmVmZXIsIG9yIHN1Z2dlc3QgYW4KYWx0ZXJuYXRpdmU/
CgpUaGFua3MsCkphc29uLUpIIExpbgo=
