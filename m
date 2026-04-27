Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A472EFF885D
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 02:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC9810E03D;
	Mon, 27 Apr 2026 02:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sdjvNGQQ";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EvjEx414";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA5210E03D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 02:44:16 +0000 (UTC)
X-UUID: fa1ecd1641e211f19781c1a04af40193-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jmsJprtCMgSF0GsbU6qQF1r3rU3RoJXzBXyi9l+/NFM=; 
 b=sdjvNGQQj6zorIl+76HRggTvGJbV/NmEf7ilgXdY0kzZG2LUj07OxEF97Y6qo/A6Ye8hd2l0llZZsdtskyv5O+BgP7Bv8dw63pGPb+yRpaXvej9+OhYguDe4AGAhHyJ9W3e38vrmxhczjQMVdQQZwfm6ROo1RTqDh+BeFxPz3oU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:9838a2d9-0a7c-4bf2-89eb-f98e70fefb95, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:e44af18f-6df4-4a3d-a7a4-fbdc42d669ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fa1ecd1641e211f19781c1a04af40193-20260427
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1590058954; Mon, 27 Apr 2026 10:44:13 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 10:44:12 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 10:44:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMsiDJkwblLlFMKywLDqgReJA32K5y/9FCFIoCM1jkn1dZwpB/1Teq6mh17fGTnOrz95svBQeaA463i9769cAE3O3BRDaOyQGx26eqhQ7t7sKFmFDm7CSFZLyC3yDf35Mm2zNUlwqqnlJO/wlvrNp2Kp62T3qkhscC0nLcw31XjTwMvHnxoITMW2iga1eYIkl6p3661Qny4Grdllb5UU+KT0p74yad+qRRfYVl/39Nmd9Zq/ViB5X8AFyAW3h+7+9oEdGL5B087XHorLvD8JKfIGOFt+/7FdrRt4gU4sSsC9bDfHATwG00/FoFYW+7LV/HRe9p5Fpb4FAg5/bqQKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmsJprtCMgSF0GsbU6qQF1r3rU3RoJXzBXyi9l+/NFM=;
 b=W4jJsRWeOFdTy9sKKLJNL+FdJMiZdyZvKSwY9ZSNEpvNVB9daoar+MMCyQCI5pw++y2gaiSFlqafjQYq7VD1LQhqev7eiisC2nuTrc2kTA4gmtPAfHxppiKQIaFoJcX82m6UVVHWbpnEaA/g2afPOEeTMN2rwyOfLq0zY/oCUSGcrikeBNiiemiKhG+nOVhrqK1AVT97ZczTRteIOP+007KlWct/dAhFuW5b2Lh2X4P4D1e5zm0Bsm+nvEM5yqywOal6/nY0MrsNvhp8aYwC/pW5jRWvPVnEcCaoAREMa8z7pocx0k5JXcP4UkIFh2jUEhCw9GG+X2KaB9XrfhXVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmsJprtCMgSF0GsbU6qQF1r3rU3RoJXzBXyi9l+/NFM=;
 b=EvjEx414/NDcdIg8l5+A6jGK5yVfSbVoDcoBjsrd56202XSjqKw0t753io/41GHMVNCFxyQUaJlKxhwBtnwU3XCopBT0sqabTJ5A/rvCRk/leqw+JN3A5UffGlJ5K6ZoJP2940KOEc8BXHjPtZ6LgwIkrxd2f76Wf5CRM1D6Ybw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6680.apcprd03.prod.outlook.com (2603:1096:400:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 02:44:10 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 02:44:10 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: relax checks on MTK
Thread-Topic: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: relax checks on MTK
Thread-Index: AQHctem6Cv4ylclas0ePIFIhmG4pN7Xyc50A
Date: Mon, 27 Apr 2026 02:44:09 +0000
Message-ID: <1e6ccd32af5254fd75eeb8c8eb3e0006ad970ee1.camel@mediatek.com>
References: <20260317084024.9036-1-xiandong.wang@mediatek.com>
 <20260317084024.9036-2-xiandong.wang@mediatek.com>
In-Reply-To: <20260317084024.9036-2-xiandong.wang@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6680:EE_
x-ms-office365-filtering-correlation-id: a0ccc2a2-1f66-4a62-009f-08dea406dbf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: dn0LB0vxtXJydXZAEER/gwhB/7b7qWCuv1eY0cSkn5l6O6I2oJpw9RDNPYfcAVJ9ljX2k8GoY9LWRElg0IIK9U6t5h1AY3YFQlwpXWlRABEU/ArWZt8Dpekjfrj7nadKlRGhqdKkbxKHUFhAGd4YmNrI3iLKyMzntqVNEjHmh6ItGDACCeh7MWt/p6NDn26JzNXCsMKPqhXWGRkyT3I/M/12WbBOgb4NpBXSsQhJkrM6kRJp2oLg1j8Dloab72R33FjQxoJSQeSMNS3MkhKutT6ew/qd2o3YJPGIbhFin6pqBiyTEjgP7/Ryk6j/3sGZIJ7iqWiBzQXi8C0YLNlqnDStZOOtaej7RP37mUiEGi3ZmyJ5nlQTgWp4n4b5LA+r5WggiOb5TTxcSO7ajxoed17hzRWP+fVe4YIV6vRFp9eDtM28oXM2IsqkOsS+GAXM0QgO43dvN2bgG3jDt6ZVYqDkz36TjWVhMa4XpzpazKFmrYQFEAogyuSU1M6e/RhTQ4+11puWtC5Hjql9qT15DbjFXjxsbnUJSApeLlEMv/MjtlWdrp/2xcl4F5vo0rKXBSXG63qOU8qJMAp2BMl+Iw7Kl0Z60JalH7TO92dtiBPj61dUXI45ZLRJTN4vwCWTfnrjvHGrG4LRMB7e0xfaw/eh985h1lrse7aEhi6VQU/IGw1eeQdxQzQDIeZcR/clttpi/FeF44E1qVwW0eiELSJpX09dmtnQCmp3iu4yo6iNivyp9DU+KiBTk3o1nEynjx9AJNbmv+pHIUvI6ZMxFFE76iVxl6rMfxhjjYBqepM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU5mWVhPTlUwMHlmWVZneEJ5VTFJbHFKLzVkQU40cGpxa3h0d24yWDBUNWJD?=
 =?utf-8?B?MCtYMHZFNVliZXVWNzNZcXpsRU9tb0J3REMvWHprUXlzeUpBZ2Z0dnJUdzh1?=
 =?utf-8?B?aC9pRDIxNXpNRDBXRUZzNXdXQUc3bFExdmIzZXZoM2JEQ0oyQkVvS2RDdnpH?=
 =?utf-8?B?bHMrL3FlTHg2cU12L0NDRFYrTDg5MDlVMlRIQjBGelliSnFTcDhxTkJhc0lR?=
 =?utf-8?B?RFViV0R4Z2Y4ZjJtQ0ZaWWZaTWo0bUN3QjhibHFRdUoyby8vbXU1WUlsczlY?=
 =?utf-8?B?QXFWUlFFOXdKSDVYU2ladzAvS1lialkzYlRUZURDUDREbFVIa0htSGxuYmdk?=
 =?utf-8?B?L0dPdzFhdlBLTEk2TDcxYzIzczZXZmExUWxtTmZkNkZIUXdHa0U0MWJBOHhQ?=
 =?utf-8?B?L0ljclNVVUlUN0EyQVpPcThhcGwyQUQ5NE9SK3hHWTd5YzliK1NCUG1KYmlw?=
 =?utf-8?B?Y0hnQU4rOERianRrUDJhUVRBS2dHSGFxK09hbnpOY2RyaDZHbHpZK0c2UDUr?=
 =?utf-8?B?dmNoVk41UzdJaXY1M3QyVnN2ck5kUERja1pvdGthWEticDhTN2ZuRkd3aTZT?=
 =?utf-8?B?YWkwQnlOSmVtM1d2SUIzWEczbUpxR2d4Njl1MTBtWHB3cWdpZmtBOUxQVFBl?=
 =?utf-8?B?WkRWcGVmaThrU0ZKMlBoUDlxTDBMVVpmejdMV2tXelZwakVVQ3dFbmxwT0NM?=
 =?utf-8?B?b2lRdVQ5cEdNN0o4QllNcllPcVV4Yk5tT2ZrZEFOSUw5WE80ekZWVXVhU1RU?=
 =?utf-8?B?eEsxS0ZyOHNvd3BpN3QrRGs5Skt0dk9qcm9RSUFTWjJhbVdJNEp2c0xRU2J0?=
 =?utf-8?B?Z2RUcVZoa2pPVzU3ZlRna1c1STZmY1JuSW1nOXlQTGlNd0JjSkc3SE1aZkw5?=
 =?utf-8?B?UlhpVFp0UDNCNDB3MjNvR2lsTHZERGJxa25RbnhEaXM1aGFVbEdNc1g1VEp2?=
 =?utf-8?B?YjJuMkRvT05mN2FJOEFHQ2piR3BHS1I3dEdadEVsUi9MelhWSTlNSExTaXNL?=
 =?utf-8?B?MHFWbHhQUnljZ2dta2VPNk44T3JEZWt4VDB0Vm5PazJDVzRDSitsTW1nUVNR?=
 =?utf-8?B?YUZ0OXBoM25jMWkrRVBFTXU0YzdXdmV6RG9HMG4wcEdFQ1k5d290d2VyY2kz?=
 =?utf-8?B?QW1DbHZpZVBMZGdHQVg5dnlWb1NZZGlDRzUwNEF3OGNDMGV1UHBWbzNIdXV3?=
 =?utf-8?B?bVM3Z1FWelZjUTlEb2VoWi91ZlVPU1huSXpacnRXZ2E0TmwzcjJtOWNrRjY2?=
 =?utf-8?B?SFdCSlA4N0VzWVFENVNuazNvYVNrcW5vZFk4UmpKdzM4WThoVVlnbHZ0VGlH?=
 =?utf-8?B?OU1lWW1nZmU5S2M4ZmZzWHBqQWMxcTk5THR4YW5FUVJJeVQ0UDlITUhGVXRo?=
 =?utf-8?B?Rmx0b1FuZzBTZSt5SXphcXMzQVdRbjRCbWViNHE0b0VzK015YXgxT0d1dG9u?=
 =?utf-8?B?cEdnTFhESXo1V3VITlVHRlNFNGt6WnQrK0Y4YUZ1QlVtS2NnazdjVGNnN2pG?=
 =?utf-8?B?d2FML2I0VnNlajlzdkkrb0N5aXNwOVloT2Z6cGZMVnl2Ujlaait2d1E4bFJl?=
 =?utf-8?B?OWZSUzdrWVgvNnB4VitNbnFyU2VGNmcwQ0VCOHpTNjRUUzNkb2ZBNzFVV285?=
 =?utf-8?B?ZndMdzNDRWZnNXVLanFXRTVSWkJQTUUyeXQwSXp3RTBXRnJXOEplTzd3c1hv?=
 =?utf-8?B?bGtsYmJ3M0wzNlNNRjJvWE9vb0h2aTlYMEZFNEk5NDh5N0dTbGRxU0RDTkRr?=
 =?utf-8?B?V3FnUktzTFZhZVB0QTZsWWFobHZ1bTVHSTJTdUN0RXEvemxRc1phNEYzTXph?=
 =?utf-8?B?NE5zUWo2VWVydkorSmg3RkkrdDJLOFdLSWp6MHErYkNFaVVoQWZEVXBmL0JL?=
 =?utf-8?B?Q2RUN29yY3AwdlloZlhXZkZXV1gzempydmd5eHN3N1c2L3ZFWjFSRlhTRVB2?=
 =?utf-8?B?OWQ0YnNLZWtZMFg3M1NxbHdYTFdJM3pNSVZCQ29rbUZ6Y0UxYUJIV3pIQ1Vj?=
 =?utf-8?B?V3N0WUc3NUVrNC9rZ3kzeFlrSGlwbmxqQVFmOEdxcnhxY21oazFtMnQzVDFP?=
 =?utf-8?B?eFVHcXVXMXJtNXpjQi9xT2VsT2VCNGpRcmF0cFB1dlJnU3FpRzVnbXJTbFRl?=
 =?utf-8?B?N1pGQ3VCeExScHhTMXlKS2I0d0Z1Y2tWelU4ZVNudEM4cytFK1R1ZDFNV3Ny?=
 =?utf-8?B?VTJWTStPeHBOZHIrNHlNeS94ZXhCcTdNQit2UXZ2NFUyUEpFdG9QcUZDUnQw?=
 =?utf-8?B?WmtSZDlTWG9pbjd6WXdlWVNNSG9RL1czcnRmUGdFRDhkeHRyYjNQREhWN09U?=
 =?utf-8?B?cmJ5M2hjdytmck9XT3EzWVVhbG0xa2c3ZUhBVzRYbG9FSWozVjBEUy8zbHdl?=
 =?utf-8?Q?mfuE8xaOfF2Ajxcw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69A552F838FA4E449EEB97881033496A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kMe4vFXDxFHdOYuMgJGVwH+0TCbX7WvRy0/nKkAPsPNuWtIVNfDIQhM04mSavzSV39O/S6SP2BNDpgVt6uMiKO0IfbWxUDPF3C/I4SsV6swoC6cj5pvVlsidPg8kLfOCE/wvyDpka75XZT2la3uQot3xviB/0mYvQa8qjI9kfZoA+OEHP6Z2eDDNMeYwNKfhCQ7wADyjgetPtd6tG1lD4de4Rr+HWkSkKMynmkbGX9bGpvI0rlW65mXQmAyQKEZrGEYsm1uo5q3ctl8GxhfeKUfMHDnzzISkQfqGHWqr/kKKzZ8s4QQLXUe7AsI1Cht6Rr8kHZlXNNTSy4egfeu0Wg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ccc2a2-1f66-4a62-009f-08dea406dbf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 02:44:10.0016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQ008uMP6TtMdJDLUyswVmgvDbZkqLM6bCMPMTud1/7ulZAhdhEFIG4Psz9piLVNeX97BjM19uGZtgMOgZm+HOgBKOQSvTl5wmzYxCMtyVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6680
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

SGkgWGlhbmRvbmcsDQoNCk9uIFR1ZSwgMjAyNi0wMy0xNyBhdCAxNjo0MCArMDgwMCwgWGlhbmRv
bmcgV2FuZyB3cm90ZToNCj4gRnJvbTogWGlhbmRvbmcgV2FuZyA8WGlhbmRvbmcuV2FuZ0BtZWRp
YXRlay5jb20+DQo+IA0KPiBrbXNfY3Vyc29yX2xlZ2FjeSB1c2VzIHRpZ2h0IHZibGFuayB0aW1p
bmcgYXNzZXJ0aW9ucyB0aGF0IGNhbiBiZQ0KPiB1bnN0YWJsZQ0KPiBvbiBNVEsgdW5kZXIgaGln
aGVyIHN5c3RlbSBsb2FkLCBsZWFkaW5nIHRvIGludGVybWl0dGVudCBmYWlsdXJlcy4NCj4gDQo+
IFVzZSByZWxheGVkIHVwcGVyLWJvdW5kIGNoZWNrcyBmb3IgdGhlIE1USy1zcGVjaWZpYyBwYXRo
IGluIHRoZQ0KPiBhZmZlY3RlZA0KPiBzdWJ0ZXN0cywgd2hpbGUgcHJlc2VydmluZyB0aGUgZXhp
c3RpbmcgYXNzZXJ0aW9ucyBmb3Igb3RoZXIgZHJpdmVycy4NCj4gDQo+IFRoaXMgaW1wcm92ZXMg
dGVzdCByb2J1c3RuZXNzIG9uIE1USyB3aXRob3V0IGNoYW5naW5nIGV4cGVjdGF0aW9ucyBvbg0K
PiBub24tTVRLIHBsYXRmb3Jtcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFhpYW5kb25nIFdhbmcg
PFhpYW5kb25nLldhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9rbXNfY3Vyc29y
X2xlZ2FjeS5jIHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVz
dHMva21zX2N1cnNvcl9sZWdhY3kuYyBiL3Rlc3RzL2ttc19jdXJzb3JfbGVnYWN5LmMNCj4gaW5k
ZXggNTM5OWVmNDgxLi5lNmFiMzNlY2EgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19jdXJzb3Jf
bGVnYWN5LmMNCj4gKysrIGIvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYw0KPiBAQCAtMTAzOCwx
MiArMTAzOCwxNyBAQCBzdGF0aWMgdm9pZCBmbGlwX3ZzX2N1cnNvcihpZ3RfZGlzcGxheV90DQo+
ICpkaXNwbGF5LCBlbnVtIGZsaXBfdGVzdCBtb2RlLCBpbnQgbmxvbw0KPiDCoAkJaWd0X3NldF90
aW1lb3V0KDEsICJTdHVjayBwYWdlIGZsaXAiKTsNCj4gwqAJCWlndF9pZ25vcmVfd2FybihyZWFk
KGRpc3BsYXktPmRybV9mZCwgJnZibCwNCj4gc2l6ZW9mKHZibCkpKTsNCj4gwqANCj4gLQkJaWYg
KCFtb2RlX3JlcXVpcmVzX2V4dHJhX3ZibGFuayhtb2RlKSkNCj4gLQkJCWlndF9hc3NlcnRfZXEo
aWd0X2NydGNfZ2V0X3ZibGFuayhjcnRjLCAwKSwNCj4gLQkJCQnCoMKgwqDCoMKgIHZibGFua19z
dGFydCArIDEpOw0KPiAtCQllbHNlDQo+ICsJCWlmICghbW9kZV9yZXF1aXJlc19leHRyYV92Ymxh
bmsobW9kZSkpIHsNCj4gKwkJCWlmIChpc19tdGtfZGV2aWNlKGRpc3BsYXktPmRybV9mZCkpDQo+
ICsJCQkJaWd0X2Fzc2VydF9sdGUoaWd0X2NydGNfZ2V0X3ZibGFuayhjDQo+IHJ0YywgMCksDQo+
ICsJCQkJCXZibGFua19zdGFydCArIDEpOw0KDQpJdCBzZWVtcyB5b3UgZ290IGEgaWd0X2NydGNf
Z2V0X3ZibGFuayhjcnRjLCAwKSA9PSB2Ymxhbmtfc3RhcnQgaGVyZS4NCg0KU2luY2UgY2hhbmdp
bmcgZnJvbSBpZ3RfYXNzZXJ0X2VxIHRvIGlndF9hc3NlcnRfbHRlIGlzIGEgcmVsYXhhdGlvbiBv
Zg0KdGhlIGFzc2VydGlvbiBjb25kaXRpb24gYW5kIGlndF9jcnRjX2dldF92YmxhbmsoY3J0Yywg
MCkgd29uJ3QgbGVzcw0KdGhhbiB2Ymxhbmtfc3RhcnQuIEl0IHdvdWxkIG5vdCBjYXVzZSBhbnkg
cmVncmVzc2lvbnMgb24gb3RoZXINCnBsYXRmb3JtLiBUaGVyZWZvcmUsIHRoZXJlIGlzIG5vIG5l
ZWQgdG8gZ3VhcmQgdGhpcyByZWxheGF0aW9uDQpzcGVjaWZpY2FsbHkgZm9yIE1USyBkZXZpY2Vz
Lg0KDQo+ICsJCQllbHNlDQo+ICsJCQkJaWd0X2Fzc2VydF9lcShpZ3RfY3J0Y19nZXRfdmJsYW5r
KGNyDQo+IHRjLCAwKSwNCj4gKwkJCQkJdmJsYW5rX3N0YXJ0ICsgMSk7DQo+ICsJCX0gZWxzZSB7
DQo+IMKgCQkJaWd0X2Fzc2VydF9sdGUoaWd0X2NydGNfZ2V0X3ZibGFuayhjcnRjLCAwKSwNCj4g
wqAJCQkJwqDCoMKgwqDCoMKgIHZibGFua19zdGFydCArIDIpOw0KPiArCQl9DQoNCkkgdGhpbmsg
aXQgY291bGQgYmUgc2ltcGx5IHJlcGxhY2VkIHRvOg0KDQppZiAoIW1vZGVfcmVxdWlyZXNfZXh0
cmFfdmJsYW5rKG1vZGUpKQ0KCWlndF9hc3NlcnRfbHRlKGlndF9jcnRjX2dldF92YmxhbmsoY3J0
YywgMCksDQoJCQkJCSAgIHZibGFua19zdGFydCArIDEpOw0KZWxzZQ0KCWlndF9hc3NlcnRfbHRl
KGlndF9jcnRjX2dldF92YmxhbmsoY3J0YywgMCksDQogCQkJCQkgICB2Ymxhbmtfc3RhcnQgKyAy
KTsNCg0KPiDCoA0KPiDCoAkJaWd0X3Jlc2V0X3RpbWVvdXQoKTsNCj4gwqAJfSB3aGlsZSAobmxv
b3BzLS0pOw0KPiBAQCAtMTQ0Miw4ICsxNDQ3LDEyIEBAIHN0YXRpYyB2b2lkIGN1cnNvcl92c19m
bGlwKGlndF9kaXNwbGF5X3QNCj4gKmRpc3BsYXksIGVudW0gZmxpcF90ZXN0IG1vZGUsIGludCBu
bG9vDQo+IMKgCQkJdmJsYW5rX2xhc3QgPSB2Ymwuc2VxdWVuY2U7DQo+IMKgCQl9DQo+IMKgDQo+
IC0JCWlmICghY3Vyc29yX3Nsb3dwYXRoKGRpc3BsYXksIG1vZGUpKQ0KPiAtCQkJaWd0X2Fzc2Vy
dF9sdGUodmJsLnNlcXVlbmNlLCB2Ymxhbmtfc3RhcnQgKw0KPiA1ICogdnJlZnJlc2ggLyA4KTsN
Cj4gKwkJaWYgKCFjdXJzb3Jfc2xvd3BhdGgoZGlzcGxheSwgbW9kZSkpIHsNCj4gKwkJCWlmIChp
c19tdGtfZGV2aWNlKGRpc3BsYXktPmRybV9mZCkpDQo+ICsJCQkJaWd0X2Fzc2VydF9sdGUodmJs
LnNlcXVlbmNlLA0KPiB2Ymxhbmtfc3RhcnQgKyAoKDUgKiB2cmVmcmVzaCAvIDgpICogNCkpOw0K
PiArCQkJZWxzZQ0KPiArCQkJCWlndF9hc3NlcnRfbHRlKHZibC5zZXF1ZW5jZSwNCj4gdmJsYW5r
X3N0YXJ0ICsgNSAqIHZyZWZyZXNoIC8gOCk7DQo+ICsJCX0NCg0KSXQncyBhYm91dCB0aGUgdGhy
ZXNob2xkLiBNYXliZSB5b3UgY2FuIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNCnRocmVzaG9s
ZCA9IDUgKiB2cmVmcmVzaCAvIDg7DQoNCi8qIEFkZCBzb21lIGNvbW1lbnQgZm9yIHdoeSB3ZSBu
ZWVkIHRoaXMuLi4gKi8NCmlmIChpc19tdGtfZGV2aWNlKGRpc3BsYXktPmRybV9mZCkpDQoJdGhy
ZXNob2xkID0gNCAqIHRocmVzaG9sZDsNCg0KaWYgKCFjdXJzb3Jfc2xvd3BhdGgoZGlzcGxheSwg
bW9kZSkpDQoJaWd0X2Fzc2VydF9sdGUodmJsLnNlcXVlbmNlLCB2Ymxhbmtfc3RhcnQgKyB0aHJl
c2hvbGQpOw0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQo=
