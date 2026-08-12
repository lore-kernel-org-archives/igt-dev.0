Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6659EC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 01:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF6810EDEE;
	Wed, 12 Aug 2026 01:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HnxEIW/U";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XmFl10tK";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987CC10EDEE
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 01:36:53 +0000 (UTC)
X-UUID: 495df6ea95ee11f1b1788b6acf885367-20260812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=gEfcDboLuneEkKxLWATujCZ4Rr0DBjmkbMx4m+U3ksc=; 
 b=HnxEIW/Ue0QBk6Lv4QRsxdweQIfGG6N8TULx4sY9F56ZUZkMm5E1JTJUnOajSFMjiyfLSsFTHuY6GSEfmLmVint8ayPD9hXaSHmRtSp3vSap6sL5fcbTtBWbnpgKx9VsqGTbTXhqVyMFI3pznP4MSa+JO5c/Oq8DobbeNGw6KGk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:e150cab8-7af9-4ecd-9ac6-431d51e7c1e2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:c6e0c6f1-0685-46a3-9cac-19d8f3a05ae7,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 495df6ea95ee11f1b1788b6acf885367-20260812
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1340268611; Wed, 12 Aug 2026 09:36:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 12 Aug 2026 09:36:47 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 12 Aug 2026 09:36:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKzLsDn/AsbMnWvvn9nJFvg5N8z1Svalbbb71tsZWmeDlSaSQlzZnN/4WL5ZIExfJeQw2eJPGjukxfLlNagpfFEm5knZafoaa464otA+1elQnCff/M7ZqoGcn0CpiDofv7i8+F3kv1Ox/rwUL0pAGGfYr5JRJo7XuzhXszqHGmYvoQM/FYuLN0YvGp1/7fbySxAPZDB6+rdeFMwwYmP3ihJeQuxv90kALTGGRsxS7aEJ94eGmmXamsEKP651K/mjkISgsrJyzBZS6A487IbtiHrG3zN5bqAmBBb3PihUKIMO6dvsTXGYJ0hUFrlBYIMIVgBtImcLaHqgQMeKHA5Ozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEfcDboLuneEkKxLWATujCZ4Rr0DBjmkbMx4m+U3ksc=;
 b=WcMC5FJ4rRb2WWUNwUdDXFE7n5Xwk6w/gtqGcYEeJFk0JxG3hGWYpy4sUGoFBWzmTVGWID60tEufGFbngl/fDCr3LBci+Brql3gm9uQbulXfk9YD7+DSDWALoN954ApZZCns+W3n1loi+uq68nL5RRMjmd+z3Rx+e8SKnjpK+4xPyWJ3xw9/mJJx8HcebsdBVD87Us7dhgRuaUHI86t1bazccvHNeKoz6SOU+NpMZcKfhoATEtyViENMMoauhPghDFvCYTqgpGv4hxAciYS8bR69bb3BUsllVPTK3JzyuqyjIp2NfIJqiqnrLiOHqxZN89+7osvGkm5wm8z/p/h3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEfcDboLuneEkKxLWATujCZ4Rr0DBjmkbMx4m+U3ksc=;
 b=XmFl10tKH6Z212ihCH67YJbv9VUjOyZjRKQA7dk0D6v8pDWO5zjsi7lvIjU5Amq3VL6jRfsSPcBpiJA2sC6TnVkoYdOyeQ7Np35nzZTnWu81DvcHamu+gSQQTxcQlkvnRcPGyBjBGmkeN4PDdC+iqJ6PMqqD0ZtFEZLtRwNihZU=
Received: from SETPR03MB10564.apcprd03.prod.outlook.com (2603:1096:101:316::7)
 by TY2PPFE6DAE24FB.apcprd03.prod.outlook.com (2603:1096:408::9ee)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 01:36:44 +0000
Received: from SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791]) by SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791%6]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 01:36:44 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "navaremanasi@google.com" <navaremanasi@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "gildekel@google.com" <gildekel@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
Thread-Topic: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence
 validation
Thread-Index: AQHc9u5/Sglem/ehfEGYeXzI5POuu7aXGcWAgABGuoCAAmsDgIAAPK+A
Date: Wed, 12 Aug 2026 01:36:43 +0000
Message-ID: <6cbbf79e5d5370df811e6ffaff8387631d4b5f89.camel@mediatek.com>
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
 <ee03b60f-4f8a-46aa-a6ae-04cc72bcf2a0@intel.com>
 <6d22bbf472104a0af3ba0d2cf4471e8ccf2e6c6b.camel@mediatek.com>
 <CAMNLLoSwTMLUahuSsu9JsNUeKW_1pd+T45c458wgKAnf0=cUfw@mail.gmail.com>
In-Reply-To: <CAMNLLoSwTMLUahuSsu9JsNUeKW_1pd+T45c458wgKAnf0=cUfw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SETPR03MB10564:EE_|TY2PPFE6DAE24FB:EE_
x-ms-office365-filtering-correlation-id: 43d9fff1-8511-42b0-ad0d-08def8122a77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|23010399003|1800799024|4143699003|11063799006|38070700021|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 5GHCI0l/D8sVlRRaj52o7E//7K9hZPlR4q+NhUE9j5If6JlLJXGdk7MxO2Ym9XqHYMx8uhG8/68E+gQoOKiQ2fpRCx4xfDvuCexBQuVrtyzZ14u4YaRVjrutw35GH2wrvlw+BGneKaYttxr9cJDullH1bCH6iTcrSJ/kv2j+OLUT1Q3wkzKtl6aEz6ZgeboxaJ7Oz0yr43YZx9w9hY28gU3M/k/Fzmpq4C9/U4KsAdC2zhkAVwncVL6DMowFcKBrrSFrx1xkVyComOhXfhr1h6u1jwkyKK+tdch8y+uIrOqyurPM/YEkZeazWQpuj1+84hKgDzU8YXCNCK8mEgoAYbtweRvUgEolB3wM8fKx4YDHLrS0dDK96NwKBXz9W4JRukGVhlXxB67knIZubdKh/A+V7FY0+hzQRnyWNQ9nC5YUN66Kl7T76hAIk/jy7UK6jhQrq7rnISmwmUdIOtLFVAjcCOg1plV/sLuHEuJDCcVvt7paBw9REv+IyCVJ+7mjP+Q+aGPuxl2+00fVe6i3rb9fwxisVHZwWHeD0SQem2RijAtsrxGJY9vfFFom33EX9s8ahhj7TF96SN47GGCXiGcmGYJtvNLWU9+FHgeveGzQTSXDSg5oQvgxChMGxNWjpWsk7q36jalCcZfYUx+6TekW8LtrgpmwqlBzD377hL0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SETPR03MB10564.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y01zSVloclZocHVvNWFmZ0w4WFZlc2JOTDRLalhFRHJTR0o5bG9KU3dtTmZO?=
 =?utf-8?B?U3Z4N1F0eXp6aWgyajZrT1dEcm1nL1I2LzlVUVRoQ09zempRVFNGLzJROE1n?=
 =?utf-8?B?bVBxYXZGd25zK1AxcGRhMlZ1M0ZEbjMwYXFibDJWdVcvQUNSb1RkT3ByRWxV?=
 =?utf-8?B?TGxWQVdlYzRyQ2lmYzc2UXhVUFQwQTJwWWZzZ3VrelBtMjBJckhxdEpuaC9F?=
 =?utf-8?B?UTY0Q2FiTmlJQmtpWEZWekhsR0NIbGtBbW1sa0t5clVwYjZ4L2x1YmdUSDMr?=
 =?utf-8?B?LzRwWDl2Z3N5UWswWnp4OU5BWERRL1VhUFo0MUppTW9ndmtpZklqNEx0Z3VY?=
 =?utf-8?B?NGQwQ3JRTG0yaUNxOHhPL21uTFhOTVUwaURoU0hPdkR6WXpManlaWUJsR1hx?=
 =?utf-8?B?Z3N2Wk9hVFJnaVo4dGx6Q0VTQWJzMyszdUpGNWQwaHpUS3FtVndaQytNV2Zr?=
 =?utf-8?B?TkRaMjlLakwyNWNzTkQ5bGVrRlV0aDV0T2x6OS9QM2szSThNZzJZRXBWWi9i?=
 =?utf-8?B?RjNXUjFJa0dWWDRvR0E2aEROSlRQWllZSDZxanprekdYRi9rTVV3VVN5V29K?=
 =?utf-8?B?aDA4OTZzNHVYMFZaSjdCckJlemtBRVhURTFXQmdzSklwcjI0SklwZHREays1?=
 =?utf-8?B?ZDkwNStKOVlsM245WGFrTjNjc25pelE5ek5vZ2lxL1h4K3R0dmFFUnB6ZHVL?=
 =?utf-8?B?dnA0amJaZkFKSndYdktMaEpGWWN6MXliNzVaWXJGWENRVzZ5eW81WVdPZkRO?=
 =?utf-8?B?TUE5cFphT0xWV1UxYXZlTExDaEtuZGU1ZkJUMFpMQ3QwSVVaWDZPeWtxdWtY?=
 =?utf-8?B?TkVzSUIrV0JpSVJ1enZHRVVBL2Q3OCs2NGh3UWhSSHllbEdLekNxN2FvaVFr?=
 =?utf-8?B?bTNjQ1dtQ0RPOCtiVHBNdDcyM1Fmbzc1NlliRWpNdmNKR2N3TjBKek9KL0xj?=
 =?utf-8?B?ZkVHSVZ4dXpuQjVoTHV2dHBSYzZ1Z2E5YmNVWHRWODUySE9DSXNaRnJWNlhI?=
 =?utf-8?B?T2dSMXplSkhRTENUWnBtYW9VLzNVU2xGWXVQdUFiNHA1Wm1Gd01BYWFybXN0?=
 =?utf-8?B?YWplSHdUdlJLRnZWb2QzME9YdzlVcW1GMzR6eTJaaExwWDZabU1NaHhTSWFZ?=
 =?utf-8?B?cTY4L1ZmTys3QnBQdlpqRy9nNDVuWTBXQ0RrMHc1OGx3ZWhTaVdSYXhQczFW?=
 =?utf-8?B?ZGFqZENuZjBJcWswOC94Ui9vSU5JTUVwL2tWZUkvZGdhVkVDTkZMbU91b0RB?=
 =?utf-8?B?QU42dDFQMWNxRWlDMHBtQUk3a0w3cnUwUXZmRW1HWDUyZlQ2R2NjNVpkOHFr?=
 =?utf-8?B?Q2x2SXZoczErcFdINks2c2I2dmZtZldqUUNQb0Q2SWt6bWRkQjJQdmw3SUg5?=
 =?utf-8?B?Rks2eXFOUHVvZ21LdTd4cW1pZG1hLzVlemFqMU1GYnoyRnNJRmtMUlVwQ1kz?=
 =?utf-8?B?VGZlY0pxZU1lZXZCb2NpWGNGRVdEL1ZHdlM4MDdsTFFDRm1vdHNJWUMvMm40?=
 =?utf-8?B?UXFPdE5tY2VBNWoxaWlGdlFyNTNFWXNraFA0eFRSUWhHdEpXcGpnWWgxa3ZX?=
 =?utf-8?B?aFpDV2ZDeGZXNWlPL2NaRTNlT29lUE5naVJpdXVER201YllWclhWb2pSUEF1?=
 =?utf-8?B?ZXJCWllnRU44SVBQWUZOWGhnWmFIMzdzWS9vOUVyVE1ZK3dIeVI3U04xYlZ2?=
 =?utf-8?B?NnB3TkF1WTB5Ti9sYTl2Qmw5ZGFncWlqSC9aSWZHVng1RkJzd1hPT3U1L2tx?=
 =?utf-8?B?QXJIR0IxU3BIeUJxcFF5KzR5Q1hmNW9meTVjbjE4V0UxdXIyRjh6WHBrN0I1?=
 =?utf-8?B?UEpsR3pnamdXUDdKTEtyNHpNenBKT2ttVlIrY3Nvdmo5VDdweDI0Zld3M1Ar?=
 =?utf-8?B?eGUzK2hPL1BEazFEd3Z6ZlRIVTBFakQ3TEFtTGxkZFVXTVZrZVBtQXZoeC9D?=
 =?utf-8?B?NVlJRkVHdUd6ZkRrb005V0hQZ1ZaTHFhNjUxYmZRRm1QbjU1QkF1dmNWVkJv?=
 =?utf-8?B?czNjU2FxNURESlk2K1Uray9LT3JNM1hYOEdZUThTbEFCdzJ1VzRORUhwTnNj?=
 =?utf-8?B?RG9SNjI5VmVvdk91TTBGeDNzSDdzRm5VbmZqT0Nod0xBMmRKNDdCdTc1aVFK?=
 =?utf-8?B?VTZMWTVlMjNDWENJaWVRejhCcUJyOEk2clZoekJjVy9OMUtPSTFhUjRJOVZ5?=
 =?utf-8?B?ZHdFcFYxQVRqaDd3UHZyNnE4REtTSzNXYlZMd3p0ajRSdDZ4SVRsNWRaRFVN?=
 =?utf-8?B?WFZaNEZZbFJEeWtjc2xzNkhHSE56eEpOUTJqODMycms1NnREbFZveWNaNFBl?=
 =?utf-8?B?ZVRzMzBGb0s2NXArRENreDBJQ0NtS2pKaWF1ZlVtYlVPQTdneFRmU1c1RUs3?=
 =?utf-8?Q?LDC3o7qpfCF0GKA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA512F7D1BE3B64DB7D8520594C6BBAB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B6ZgiEmlJEIdwqefZ+sd5ZAag1a6rSoDdPZ/yQKc5YlHVdP5hRbB5uE0xDbwJQ08DbGb4T635kQ5pNyWTLazbI7gRad/WacX/GwoNpThiYEhcx2Jc4ArI/wIK4DMAgwHBt9E3zXz/1GPgo0T10uMvvK6TYAPvISf04bswHEIYCXTFsVpBXB+ms6oJ6X8D67qyXgtvNxzgWWaS3ytpOEZIZsInphJfXBVia8AjZWoqP541TwoURnHlVxe+OW7cUY6o7dYjgyVZkuK3v+dH5Ib9OlAxFzL89nhBWYEyo7ut2QCIbmqx6RSuCQaC8KaF1Hzy70YbFeSKdk0lPQx3BFWig==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SETPR03MB10564.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d9fff1-8511-42b0-ad0d-08def8122a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 01:36:43.8696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVWrXMn5Xhekc0hfaY6Mpan1p6hgvfoZIZK6b/lB4QTA8u2ASzA3rv32S4mUscFeIPgbVZWkjbGsvMRcwe3uY4r0nq+6q1hGXNK1AaQFM0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFE6DAE24FB
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

T24gVHVlLCAyMDI2LTA4LTExIGF0IDE0OjU5IC0wNzAwLCBNYW5hc2kgTmF2YXJlIHdyb3RlOg0K
PiBUaGFua3PCoEBLYXJ0aGlrIEIgU8KgIGZvciB5b3VyIHJldmlldyAswqBASmFzb24tSkggTGlu
wqAgcGxlYXNlIHVwZGF0ZQ0KPiB0aGUgcGF0Y2ggdG8gYWRkcmVzcyB0aGUgcmV2aWV3IHNvIHdl
IGNhbiBnZXQgdGhpcyBsYW5kZWQgd2hpbGUgd2UNCj4gaGF2ZSB0cmFjdGlvbiBvbiB0aGlzIGZy
b20gSW50ZWwNCj4gDQoNCk9LLCBJJ3ZlIGFscmVhZHkgc2VudCBpdC4NCmh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC83NDU2OTgvP3Nlcmllcz0xNzIwMTUmcmV2PTENCg0K
UmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IFJlZ2FyZHMNCj4gTWFuYXNpDQoNCg==
