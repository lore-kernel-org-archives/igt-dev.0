Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F122C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 07:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40A89711;
	Tue, 14 Jul 2026 07:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Vqp4V2m8";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="h0uFJtdd";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D3E10EC2D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 07:53:56 +0000 (UTC)
X-UUID: 244786607f5911f18dc8c9802ae25ab1-20260714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=txVS+LwxN/NV64s0Ml4QjwnPv33u3gtFrxbwM5v/N4Y=; 
 b=Vqp4V2m8zvDkQd7IbKoZ0JoqDu3aU/T/LFDYZ65bllDz2ksBTeykpf9BA7whcNTqK7Rxu18px5bswfbx1t+kwNSNDOKKOmqVxdAAYD3uECswg6hSW82mZsMVYJsQ6KVtNse7YbgZ6hcKayi8/ZZi84MwFQzOdeG+i+It6YSr77I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:e9fa8a74-e2fc-453d-a51c-9538ee63fa66, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:5ee5681c-deb6-475d-be86-ffa48e1203a4,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 244786607f5911f18dc8c9802ae25ab1-20260714
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 471451810; Tue, 14 Jul 2026 15:53:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Jul 2026 15:53:45 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Jul 2026 15:53:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq5HUE8RzQUiWMTiSaC9Bj3yYZvAfYCAtiSb5GLShz/hz/6jKnALqUEM+cKvSwTkXq5dsDuGkxzjzmvzikUdomv/zBMW2JrJ6AazRWYcYHyYKVWBK3hONDbDAKByDD0BjhyQySZY7JxYFgX2109UFp6xBqLYGPv3COzfSUFt4lAY2dV+TSk0xr7U8c0pLmhBqJWAhu/01gH6JXqDCaKVkxV544eGR45Tk7RaAECgCd1IHzUczSnIcAMEBkdDJrNubf7SX9sgNgXwOeywOgmbNnlVCBqnCzODHVH3N//P+CE49JmMXc7DXm+W8IwyOw/I58ryudWWWAYLb7TxeWK5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txVS+LwxN/NV64s0Ml4QjwnPv33u3gtFrxbwM5v/N4Y=;
 b=jw9cBBt6jbMrKD3hm2QcTdrtapHHvjEp4c281S0u+aSpD+X8BHIRGWYCQ7Lq0JPkVKGH2mD+KIsSVGdJXW5q8c9F2nhYuhRDhcoE3dN6hghChXSa39qGtk5cEZD9eopNXqLInNwLEvrp5f3MKQEdK4BgkcYtPkoh9LoZZbitEExLA3jhIUWdehq/anWNKKfRD3jxu20dNYOyiGVoZV6rMJl21f6yLRnfA/XhGN0AQbzyeEQnpi4J66gBoYT0W1hX4yXHg0c+wOK9trVzqPeaeoyg6adhKv4rwIGKlvoPrTXKho25fZoxSmIm1/zKA1ueQbSQL1XOWCukMPSrvQUe/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txVS+LwxN/NV64s0Ml4QjwnPv33u3gtFrxbwM5v/N4Y=;
 b=h0uFJtddS1nW50MucXJXF5BsHpyI/8Lzwcpm66NMN2Rq4JBGyhZ3RlzoLZlEItTYEXHjGhCrPlqM4YP18d/WlAeZMuKpyGaZVQrzacFoZTlo2uxgb8kMoNb9v9Ub8NcHPJHbgBlFmZjBiPBzHNUV/bi3CLK3d5QI++jDQZZ4zi8=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB6490.apcprd03.prod.outlook.com (2603:1096:101:46::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 07:53:39 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 07:53:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, "navaremanasi@google.com" <navaremanasi@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Thread-Topic: [PATCH i-g-t v3 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Thread-Index: AQHdEFIv0fFUgV50F0OowNOZVeQjwLZrX/wAgAFLIQA=
Date: Tue, 14 Jul 2026 07:53:39 +0000
Message-ID: <f2ccf5de8b8f1ae3ec0d7198ef4ce29534f85afc.camel@mediatek.com>
References: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
 <20260710095358.2518446-2-jason-jh.lin@mediatek.com>
 <20260713120828.afnxibf3ct4hteea@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260713120828.afnxibf3ct4hteea@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB6490:EE_
x-ms-office365-filtering-correlation-id: a3a4a075-9485-44d5-99e1-08dee17d044e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|7416014|376014|1800799024|6133799003|11063799006|4143699003|56012099006|921020|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: QQSrrIVntBlr9n7RtAA2pbVPzgvOFisjI87yeKNuiPmXvLJcr9MluMqG4B11xCFrI9Rv2BpR19T1P1pQDjEEoetkIvxOuZ91wgpgcOol9Ydoo8miOl/3+miCLSuvV/AP9zbaTfE1VKpPrsB68XaFSEDe+MpTlvaORxBm8NtWFFmhnpYcnQyropjlECjEWo6qwuuPQvQ3PB96+X803fJJsc1LPO4uSNP0u8HjFiDd/HX7+suDfeSGxMhQPkRAeMCKlJIF6XXHSnIBHg/4fU8MMuO+lv9NoOTDzisIifSuHYmNtuXt/ayAvO/+JUMbr1rhQ/rKPJKJSTmfeWjBsYsALaDIH9+MczR9jTGYljk3+7eded3LTWQYK/ax55W7o18dwjMl6NEWD67rjLsAk0uqB2E3IqBIizmBCXIMegxnsHmIHsD9MpmXup8K8GVrF8WMvC445HlaSG3/Hq+Q7b1GlxmDkg3kMfiR6J9NnMbfur/wKMQjtw7dljjSnROAhzLzXtgwMN+gAkvqu4ZzM407tCncT1OHGOz0k907S0SF96u0fbP+ar9jLL74/j3HrW4PL0Zmpa9MMXllA6hVfpOrvvpZlqL9HXT+ETVeuaCrtEFUOux+9zKQbxB9eqi0BIi8hqI27/qBVN6O44rmbQtOKRBDkyNrbnFRgdT0anJm9cRKN0Yop36yfZrXOk/k8JJK+GcqIayy33BrSw3pEkYMV7JK5YVg2MoXk9NM7AK5ACgsftEQiMjlUV6w0+VB27aa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(11063799006)(4143699003)(56012099006)(921020)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJQbHFTNS9wbGcvcGxsMU5GREpFalhpeVdqOURHL2FTTG4yYk5GYlhELzdV?=
 =?utf-8?B?SGg5L2Ywb3JaaWFDVEFBODZaOGY5WTJINXVpOElIZmVTZGJYcDhvbWp1YmQ0?=
 =?utf-8?B?ZnVYNFB1R0lGZGgyZ2Y5U2UzcEZBV2NxV0RoYmxlYkNvSWtZK0JoZXlKOXN6?=
 =?utf-8?B?VmlTeWpXd0s5UGQ0RGpBTXQrVzN4RnVRcWw0S0w2SkNwNUo0T0oxRG9MN1k3?=
 =?utf-8?B?bE5oVnRhWVZIUitDSFdZaTdnVFdGMUY4MEluZTJVNVdpTTNvVXBlM0wxUGp5?=
 =?utf-8?B?Um5TUlNndVg4b0liNXVEM1p6QmNYdjhybmZmMnM1MHhPZ2JCMHFxTVA4RVlj?=
 =?utf-8?B?c1NxYUVicHBrN3dBQ0hlU2Jta2ZGczd2YWUzc0NldzVqaWgyZ2wwVllvUlpi?=
 =?utf-8?B?VGswWFdER01uYU1kOFJtYzlQRTRWVTVEdVByR1B4NTMyay8wUkUzdEpneUoy?=
 =?utf-8?B?VGtZTnRNUi81bEtxWjlmQ2oxUVJ5cUd1djY0WG1jMHR1citqVHI1N2VDS0hk?=
 =?utf-8?B?cGhGM0lrcUhiWTVyT2IyeW1peWNrVEdieGgreUd0ZUZrK3E0VjU3Yk9pRDA4?=
 =?utf-8?B?cWVxUnFNSWV2akI2TXpRM1RhTXlmcGdkV2UwRVZqZXVXc25MbTdLRTNwaDdq?=
 =?utf-8?B?KzFIc2d2UzAwSkcrckI3U1BCV3ZENmJmQW5CWGJ4Z1dsYmdWTjZRU0ZEUnJ5?=
 =?utf-8?B?eVI5NUdwTVZjOGFkWFlSd3NBN1FhVFM3WEhkSlRpQkw3TWVzMTBYM2JodnJy?=
 =?utf-8?B?bzBXMFBJcVN0SXpkam1VZVFKK05CTmpPQjhCQ1p4TTZ5RGxlM21zYUJrUkl3?=
 =?utf-8?B?UlpYVGJsMEErb1FiNFEvOWY5SGVEeWw1ZG9lTDR0T3BwKzJXbHF1SjZaZ2N6?=
 =?utf-8?B?Qk5XNEQ3SXRvQkpuRFVYMTFVRWZ4bmVXWEVrWW9FV2xhZGF0MktlMmM0cVhD?=
 =?utf-8?B?ZTVmTm9QSDBJQUl3YS9YSjBqRzlTNllrb3pRR2VKMlA1QlpnUmpWWjlPSlFB?=
 =?utf-8?B?d3p5bEc5cjZjUkZyQjRxdTRrVDdOcjVoUitFcWFGb3V0cFpoNCtOTVZkVXF5?=
 =?utf-8?B?K1QvMWErT1BKQVFTRmswK3BnenFNYmNRaWpLekg2WlpWMVFQWmM2RXpMS0Z1?=
 =?utf-8?B?cnFzSmk0WGYrS3RTVzdwWnNVcnpuVXlqK29xZ2N4dGpjMElxVTROZ3NqQWJ2?=
 =?utf-8?B?Ymx0NDRrMHdhbURWeDVsM3Y0eW1YRHVycU9nUmU5ckkyWmlLL2JVcEdNZ2ZI?=
 =?utf-8?B?U3lJS0FWYXN2czVCNktJSFVjT1Rvb2l3U0RmL0hrb2FidURFdkdwcGlPMGli?=
 =?utf-8?B?YzFYYU9DTG9QdHVvSzBpTFM3YVBKbktTZHJDUWFScm5oeGMrbHJFZHdobVdU?=
 =?utf-8?B?cXNhandKUmxPMUZuczAzcHpkOW0wQ2hnRU1hdmJDV2JDaEtweFVxcGJ0M3ky?=
 =?utf-8?B?WEFRcmJIMnEzYjBPUVhXQVZHNWV2ZXF0MjRmblFjS2d1elZtaFpoUHBUVWZx?=
 =?utf-8?B?YUNnSjdRM256S0xjVUFwZ1JzUGg4bk9DeStIRE5yUG96QU9hYXdIcG00QnZM?=
 =?utf-8?B?M0R5M1FIdUU5MjcyWEFsbGZxZWxxS3c1Rms2ZHlHM3FsK3IxekQrL3RHM3Mv?=
 =?utf-8?B?ZXNGY25zZHF3b3A3aU9vbjlmY1NxTlR0RzhYR2FJeTkwVURZV1hNUFJRR3Nj?=
 =?utf-8?B?MXBnQThhc01tUGdrSkdla0RhcUF0bzB4U2dwTk5rWklmL0JmdXJ5RWVwN1dv?=
 =?utf-8?B?VEx0L3g2b21NNXlnQzltajFBY0tpQU1tQmhVRFpyUE4wT2tmdW9DRFpWNnpT?=
 =?utf-8?B?cjBIeDFiNnpmUVBkQVdUa2FhTnc0WVZyR2VraUVHb1pDUjVBV1dlR3c3RDhp?=
 =?utf-8?B?cnM2QzNIVGdhNzZKYkZIQXhxNkZocTgzRlFVTUtmTk1ZOHBzV2NtVkpXcEJZ?=
 =?utf-8?B?MEFWV0FscUVLSW1wUG1ML21mdXk3VlNKaTg3amlOblZrS21ZcVc2Rll4Mkxv?=
 =?utf-8?B?dkxPTy9zNTJkeHNxL0lXZTEybllOWjZMalJtdFF5Zys1VVhmTmxsWTJERUtQ?=
 =?utf-8?B?YVk1K0tLb1NkZXdxbnU3S2NkZDZSRDlaMmNTdDZSZk5vbkdtSWo2ekRuaTZC?=
 =?utf-8?B?dTMvNzBnRnVtN0Vpd1dleExDY2RIWFdWSTJOMG5sNDVydTdaZGpOVU5JU0l5?=
 =?utf-8?B?MlZMa1IzNW1zZU5KUDFFNENuaW1CTFkvWVlmbnVCWnFiR0dVclVkTzNseUpX?=
 =?utf-8?B?TkRaRHloOWJGcVRmTFBkY1h6Z3hMQlV1d1FxYXAyc0Z0NENkZ3BJZWlvMFJ5?=
 =?utf-8?B?WldlbjBUK0k5YzhYTkY4cURxdDFUdU1odXNnUnBudC9kbjh5RUhCZHA2TEN3?=
 =?utf-8?Q?9pwY1Ml87mgQHi/o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46E3AAF8F1EE52429181886BCD7613EF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VMsQD52K4b+PH6AD2zhziubHBUEi2AA1cyXCRrKr4gSVinrRuMw1FGpXiYo18L6XFfYtg1gXeDM93V5mOl7lVMOqPqV5j47EVw6OXK1pVT82aEtyA843RC7vqFB3Q8qmXwGVc1ZgCbNhtSn2znmu68ylOU1Xwrd5prcH0ELUSeqQaKmlmdTZu5GBFWbvCS2paHn8eIIu1VjjPcekAOtODop4VyvwOlT16pOY5EUi2aWhf+OfrurCwW7HwLS9kNTNpqXXEgvBqLJCVjpvDlFvW9x3JoQvRaerLIvacuXQ9gYt0cfWw6G3zKVZBbTx2/Wlx0Utr+cY3kCcMmEsJQ5xQQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a4a075-9485-44d5-99e1-08dee17d044e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 07:53:39.2320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awu4Nt3naeR38UQNkRFcjdGKtYrhVYSwZuSxoBwMIq3ufGeU0hPVYtSPjEfMx7jHLLo4/r/YvK60xlNyG+TIBG4yLnkVrQo7WyZJ7N8Z2ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6490
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

T24gTW9uLCAyMDI2LTA3LTEzIGF0IDE0OjA4ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEphc29uLUpILA0KPiBPbiAyMDI2LTA3LTEwIGF0IDE3OjUyOjQ3ICswODAwLCBKYXNv
bi1KSCBMaW4gd3JvdGU6DQo+ID4gQWRkIGlndF9wbV9kaXNhYmxlX2NwdV9kZWVwX3NsZWVwKCkg
YW5kDQo+ID4gaWd0X3BtX2VuYWJsZV9jcHVfZGVlcF9zbGVlcCgpDQo+ID4gQVBJcyB0byBjb250
cm9sIGRlZXAgQ1BVIGlkbGUgc3RhdGVzIChDLXN0YXRlcykgdmlhIHN5c2ZzLiBUaGlzDQo+ID4g
cHJldmVudHMNCj4gPiBJUlEgbGF0ZW5jeSBzcGlrZXMgdGhhdCBhZmZlY3QgdmJsYW5rIHRpbWVz
dGFtcCBhY3F1aXNpdGlvbi4NCj4gPiANCj4gPiBUaGUgZnVuY3Rpb25zIGNvbnRyb2wgc3RhdGUx
IGFuZCBkZWVwZXIgc3RhdGVzIG9uIGFsbCBDUFVzIHdoaWxlDQo+ID4ga2VlcGluZw0KPiA+IHN0
YXRlMCAoV0ZJKSB1bmNoYW5nZWQsIHByb3ZpZGluZyBhIGJhbGFuY2UgYmV0d2VlbiB0aW1pbmcg
YWNjdXJhY3kNCj4gPiBhbmQNCj4gPiBwb3dlciBlZmZpY2llbmN5Lg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiDCoGxpYi9pZ3RfcG0uYyB8IDc1DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+IMKgbGliL2lndF9wbS5oIHzCoCAyICsr
DQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9wbS5jIGIvbGliL2lndF9wbS5jDQo+ID4gaW5kZXggNjRiMTVkZDA4
MzAyLi43YThhZDhhZTNkZWEgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lndF9wbS5jDQo+ID4gKysr
IGIvbGliL2lndF9wbS5jDQo+ID4gQEAgLTE3MTMsMyArMTcxMyw3OCBAQCB1bnNpZ25lZCBpbnQg
aWd0X3JlYWRfcGtnY19jb3VudGVyKGludA0KPiA+IGRlYnVnZnNfcm9vdF9mZCkNCj4gPiDCoA0K
PiA+IMKgCXJldHVybiBpZ3RfZ2V0X2RjX2NvdW50ZXIoc3RyKTsNCj4gPiDCoH0NCj4gPiArDQo+
ID4gK3N0YXRpYyBib29sIGlndF9wbV9jcHVfZGVlcF9zbGVlcF9jb250cm9sKGJvb2wgZGlzYWJs
ZSkNCj4gDQo+IFBsZWFzZSBkbyBub3QgdXNlIGJvb2wgcGFyYW1zLiBTZWUgYmVsb3cuDQo+IA0K
PiA+ICt7DQo+ID4gKwljaGFyIGNwdV9wYXRoWzI1Nl07DQo+ID4gKwljaGFyIHN0YXRlX3BhdGhb
NTEyXTsNCj4gPiArCWludCBjcHUsIHN0YXRlOw0KPiA+ICsJaW50IGNvdW50ID0gMDsNCj4gPiAr
CUZJTEUgKmZwOw0KPiA+ICsJY29uc3QgY2hhciAqdmFsdWUgPSBkaXNhYmxlID8gIjEiIDogIjAi
Ow0KPiANCj4gUGFzcyBpdCBhcyBwYXJhbS4NCj4gDQo+ID4gKwljb25zdCBjaGFyICphY3Rpb24g
PSBkaXNhYmxlID8gIkRpc2FibGVkIiA6ICJSZXN0b3JlZCI7DQo+IA0KPiBTYW1lIGhlcmU6DQo+
IA0KPiBzdGF0aWMgYm9vbCBpZ3RfcG1fY3B1X2RlZXBfc2xlZXBfY29udHJvbChjaGFyICp2YWws
IGNoYXIgKm1zZykNCj4gDQoNCk9LLCBJJ2xsIG1vZGlmeSBpdC4NCg0KPiA+ICsNCj4gPiArCS8q
IENvbnRyb2wgc3RhdGUxIGFuZCBkZWVwZXIgZm9yIGFsbCBDUFVzICovDQo+ID4gKwlmb3IgKGNw
dSA9IDA7IGNwdSA8IDI1NjsgY3B1KyspIHsNCj4gDQo+IFNob3VsZCB5b3UgcmVhZCB0aGlzICcy
NTYnIGR5bmFtaWNhbGx5PyBPciBtYWtlIGl0IGEgZGVmaW5lIG9yDQo+IGNvbnN0IGludC4gQW5v
dGhlciBpZGVhIGJlbG93Lg0KPiANCj4gPiArCQlzbnByaW50ZihjcHVfcGF0aCwgc2l6ZW9mKGNw
dV9wYXRoKSwNCj4gPiArCQkJICIvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUlZCIsIGNwdSk7
DQo+ID4gKw0KPiA+ICsJCS8qIENoZWNrIGlmIENQVSBleGlzdHMgKi8NCj4gPiArCQlpZiAoYWNj
ZXNzKGNwdV9wYXRoLCBGX09LKSAhPSAwKQ0KPiA+ICsJCQlicmVhazsNCj4gDQo+IFdoeSBub3Qg
anVzdCByZWFkZGlyIGFuZCBtYXRjaCBmaWxlcyBzdGFydGluZyB3aXRoICJjcHUlZCI/DQoNCk9L
LCBJJ2xsIGNoYW5nZSB0byByZWFkZGlyIGluc3RlYWQgb2YgdXNpbmcgYSBjb25zdCBpbnQgZm9y
IGNwdSVkLg0KDQo+IA0KPiA+ICsNCj4gPiArCQkvKiBDb250cm9sIHN0YXRlMSBhbmQgZGVlcGVy
IChrZWVwIHN0YXRlMCBXRkkNCj4gPiB1bmNoYW5nZWQpICovDQo+ID4gKwkJZm9yIChzdGF0ZSA9
IDE7IHN0YXRlIDwgMTA7IHN0YXRlKyspIHsNCj4gPiArCQkJc25wcmludGYoc3RhdGVfcGF0aCwg
c2l6ZW9mKHN0YXRlX3BhdGgpLA0KPiA+ICsJCQkJICIlcy9jcHVpZGxlL3N0YXRlJWQvZGlzYWJs
ZSIsDQo+ID4gY3B1X3BhdGgsIHN0YXRlKTsNCj4gPiArDQo+ID4gKwkJCWlmIChhY2Nlc3Moc3Rh
dGVfcGF0aCwgV19PSykgIT0gMCkNCj4gPiArCQkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQkJLyog
V3JpdGUgJzEnIHRvIGRpc2FibGUsICcwJyB0byBlbmFibGUgKi8NCj4gPiArCQkJZnAgPSBmb3Bl
bihzdGF0ZV9wYXRoLCAidyIpOw0KPiA+ICsJCQlpZiAoZnApIHsNCj4gPiArCQkJCWZwcmludGYo
ZnAsICIlcyIsIHZhbHVlKTsNCj4gPiArCQkJCWZjbG9zZShmcCk7DQo+ID4gKwkJCQljb3VudCsr
Ow0KPiA+ICsJCQl9DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChjb3VudCA+
IDApDQo+ID4gKwkJaWd0X2luZm8oIiVzIGRlZXAgQ1BVIGlkbGUgc3RhdGVzIGZvciAlZCBDUFUv
c3RhdGUNCj4gPiBjb21iaW5hdGlvbnNcbiIsDQo+ID4gKwkJCSBhY3Rpb24sIGNvdW50KTsNCj4g
PiArCWVsc2UNCj4gPiArCQlpZ3Rfd2FybigiTm8gQ1BVIGlkbGUgc3RhdGVzIGZvdW5kIHRvIGNv
bnRyb2xcbiIpOw0KPiANCj4gV2h5IHdhcm5pbmcgaGVyZT8gV2hhdCBpZiBieSBkZWZhdWx0IGlk
bGUgc3RhdGVzIGFyZSB0dXJuZWQgb2ZmPw0KPiBCdHcgd2hlbiB5b3UgcnVuIHRoaXMgaW4gZXhp
dCBwcm9jLCBhbnkgd2FybiBpcyB1bmV4cGVjdGVkIGFuZA0KPiB1c2VsZXNzLg0KDQpPSywgSSds
bCByZW1vdmUgdGhlIHdhcm5pbmcgaGVyZS4NCg0KPiANCj4gPiArDQo+ID4gKwlyZXR1cm4gY291
bnQgPiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogaWd0X3BtX2Rpc2FibGVf
Y3B1X2RlZXBfc2xlZXA6DQo+ID4gKyAqDQo+ID4gKyAqIERpc2FibGVzIGRlZXAgQ1BVIGlkbGUg
c3RhdGVzIChDLXN0YXRlcykgdG8gcHJldmVudCBJUlEgbGF0ZW5jeQ0KPiA+IHNwaWtlcw0KPiA+
ICsgKiBkdXJpbmcgdmJsYW5rIGV2ZW50cy4gVGhpcyBpcyBhIHN5c3RlbS13aWRlIG9wZXJhdGlv
biB0aGF0DQo+ID4gYWZmZWN0cyBhbGwgQ1BVcy4NCj4gPiArICoNCj4gPiArICogRGlzYWJsZXMg
c3RhdGUxIGFuZCBkZWVwZXIgc3RhdGVzIHdoaWxlIGtlZXBpbmcgc3RhdGUwIChXRkkpDQo+ID4g
dW5jaGFuZ2VkDQo+ID4gKyAqIHRvIGVuc3VyZSBzdGFibGUgdmJsYW5rIHRpbWluZy4NCj4gPiAr
ICoNCj4gPiArICogUmV0dXJuczogdHJ1ZSBvbiBzdWNjZXNzLCBmYWxzZSBvbiBmYWlsdXJlDQo+
ID4gKyAqLw0KPiA+ICtib29sIGlndF9wbV9kaXNhYmxlX2NwdV9kZWVwX3NsZWVwKHZvaWQpDQo+
ID4gK3sNCj4gPiArCXJldHVybiBpZ3RfcG1fY3B1X2RlZXBfc2xlZXBfY29udHJvbCh0cnVlKTsN
Cj4gDQo+IGlndF9wbV9jcHVfZGVlcF9zbGVlcF9jb250cm9sKCIxIiwgIkRpc2FibGVkIikNCj4g
DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBpZ3RfcG1fZW5hYmxlX2NwdV9kZWVw
X3NsZWVwOg0KPiA+ICsgKg0KPiA+ICsgKiBSZS1lbmFibGVzIGRlZXAgQ1BVIGlkbGUgc3RhdGVz
IChDLXN0YXRlcykgdGhhdCB3ZXJlIHByZXZpb3VzbHkNCj4gPiBkaXNhYmxlZA0KPiA+ICsgKiBi
eSBpZ3RfcG1fZGlzYWJsZV9jcHVfZGVlcF9zbGVlcCgpLiBUaGlzIHJlc3RvcmVzIHBvd2VyLXNh
dmluZw0KPiA+IGlkbGUgc3RhdGVzLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1cm5zOiB0cnVlIG9u
IHN1Y2Nlc3MsIGZhbHNlIG9uIGZhaWx1cmUNCj4gPiArICovDQo+ID4gK2Jvb2wgaWd0X3BtX2Vu
YWJsZV9jcHVfZGVlcF9zbGVlcCh2b2lkKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gaWd0X3BtX2Nw
dV9kZWVwX3NsZWVwX2NvbnRyb2woZmFsc2UpOw0KPiANCj4gaWd0X3BtX2NwdV9kZWVwX3NsZWVw
X2NvbnRyb2woIjAiLCAiRW5hYmxlZCIpDQo+IA0KDQpJIHRoaW5rIHdlIGNhbiB1c2Ugb25lIHBh
cmFtZXRlciB0byBtYWtlIGl0IHNpbXBsZXIgYW5kIHJlZHVjZQ0KY29uZnVzaW9uLg0KDQpFLGcu
DQppZ3RfcG1fY3B1X2RlZXBfc2xlZXBfY29udHJvbCgiRW5hYmxlZCIpOw0KDQpXaGF0IGRvIHlv
dSB0aGluaz8NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IFJlZ2FyZHMsDQo+IEthbWls
DQo=
