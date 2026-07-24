Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63265C531FC
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 11:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE1010E046;
	Fri, 24 Jul 2026 11:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="L9Mtljpf";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="e5OmGfss";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3FF10E046
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 11:48:13 +0000 (UTC)
X-UUID: 88e08d2a875511f18dc8c9802ae25ab1-20260724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ebgZ9+iIgq3NWWU8059TPcV5E1WsXGseTwocO31Gntg=; 
 b=L9Mtljpft4McJ5vkaoTWeV3vyw3w2Ibe2NgNahEeOdI0Ru3vo8UQwxTODbhMrhdjcAR9KNettBGbfGrVAAltimhl2Eb1pdOk4t2i1vKXvd3153Jvu35YdwNe7X12hy6kYMnrX99cT/cp/TGIEwsRT0KzM3bSjpmGL838zn5kwUw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18, REQID:9bf25b01-c91b-4dbc-b3a5-aaf966eeb34d, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-4
X-CID-META: VersionHash:8a735a6, CLOUDID:377d8319-ab14-4403-9336-76696324c5a8,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 88e08d2a875511f18dc8c9802ae25ab1-20260724
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 11126177; Fri, 24 Jul 2026 19:48:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Jul 2026 19:48:05 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Jul 2026 19:48:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8HrZFg4NXxi99OlcbQqriFQM4rTaGhDOZOxsOWdSXE21gEBgIObydLmIfEyBip0TB7kr4qKcE9Vjf2H1bFuFCwXDCosn7OT+XE/xdwPF1ppFjAY3mHGx08blALcjG0ka43qfCVTIGG2pQcved76m1yDnubLedSsF/0Ymm8Ul8iYiFRUTo+RYHRAottBKolVz0XSfkflfWMYqP5OCA5Ef0JXgJCGj2yDscNeLjeXN0GXAjLCnJa1/TVuJkd5eHUAW8s9X7Awc/dbDo2tyXaRAwNdzczJctrav1cnk0pSNZl+n5pKzG2u9Qo4rEJgmq9SJdWuAoz4UbVvVIhUnr/2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ebgZ9+iIgq3NWWU8059TPcV5E1WsXGseTwocO31Gntg=;
 b=YPXDCizpY2RqTQMXQcaCX0zL6X1Blp3XURmpznj5XsKPjYAorPW7Uwqhjly1af3adHVKiKv96Zbuo94SVqirRJMhemXACRfHHqNprFnOYjZ6QKU/Lin2wQ3uY3x2IMZCrbACA+mMuTz4ZgdTYX5y3vE1keLHPamODjS4eNMxbMbIYeZrLEYbW5UymdHETpR5ZVlaMhriVbAHQ8RPUdos2dyfyocGWPOOTSSE4l7ldB2ANCSYARyzisi2epRw+aXxG1/3XwVfS4quCB8IKeIplOJQpKlrhOKH2d3wth1Txb0DYd8RXtZ/7+BBkxg2wMLcY9ogtPzYnnH55cXHoIF5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebgZ9+iIgq3NWWU8059TPcV5E1WsXGseTwocO31Gntg=;
 b=e5OmGfssssCGMkp35JKRl7hjoCQ1L1m5EAdINhlJ4eGxMKQ4lkSt6eDnpRueW4rJmOEIcDsQkM6vUWAIzxeXyMO4siRKYchMyWDSVgQOAXq76AtCLPJpwHxDdt7J2+F7Amp3PX2nNuc042P5Y/jCbWtcOyXstHlcajnroBJ7e3M=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB7920.apcprd03.prod.outlook.com (2603:1096:820:f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 11:48:01 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:48:00 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
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
Subject: Re: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
Thread-Topic: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence
 validation
Thread-Index: AQHc9u5/Sglem/ehfEGYeXzI5POuu7Y6dcAAgEJg74A=
Date: Fri, 24 Jul 2026 11:48:00 +0000
Message-ID: <e6e3667348956c056c7ebb55153d521b8eb5b8b0.camel@mediatek.com>
References: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
 <CAMNLLoQZUfMsijfxD4o-zpOQDgz3COWvyuKJyAeVtcAmnHoDXA@mail.gmail.com>
In-Reply-To: <CAMNLLoQZUfMsijfxD4o-zpOQDgz3COWvyuKJyAeVtcAmnHoDXA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB7920:EE_
x-ms-office365-filtering-correlation-id: 65fbccfd-a5d7-47aa-ceef-08dee9796978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|11063799006|4143699003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: nY72WUXeb1i7YqtqRp6Vc3p8hX9tXLxUXecmQ3q9TpJ5POyEXfm8tycRf9XVew9bSygWt4L407ZoxCOj8WfYR0Wq5w1UCL+NV72VAkE+BQwwKa3DrZHVCvc8kc/NTd95M2yl/cmj27AV8P+ttVUOWrHxD/Nx2Uk8sckD/bgwudOGT2mmS6o98++AnbD7X2p91rzF+5bcxrwCgpGR05SKbJtsPRLKAQ+rYTkK+I21J0uMWr9LmRL4YbVKG7ZEqFUbAKwsAYKii8QyKrcaH6IUABsmi5t31VeFX9G8x1Kgng9+dzCBUyj3cnWsn7GNU8zsrtsimc7H53dn3mtNI4GAAu+GFuC93fje5PiVwnwunR5vYwzTvF17pH4D//m0rv1n3IewN9/PPfKN42/Zx/GEjGTttnSbbmC24C45BydrBBG3c79ftHy11XdQkhyGkjh2C4ohfCR5VesfB5h9hhtTFtWeKPUExtIpWOGqVg80btkIOT++i4W+IRbKXOQuhAIlMYLvjHJfoobRK/XkChNtXSy1PuEA9abgcnkSK/9KWLpLdp7fO+KfDikyjJkgZc8c1Z+A8or5jISD/APnwdEcLTMPQTgTFDZynxKwsAr2AEyPTZrJ5Zg83dLyRA0D5iAw9jFhwJlNYU7D2ulGLN9sJ7GPy3Yk0OvJEn15bx1dCuhFRKSiva01KLzqyW63QnGjPoLjVBALMD8yJN7mS3JaeIgk3Waf+eDSv0JKGCnVwkY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHdEbkRGV2FMOG9VL3NSRklGTVlrbHlYZ09JcWt3M0p5NDR6YWkwZ0Jwd0JE?=
 =?utf-8?B?enVxVkt2TDBrcy9uTU5vT2RldmtxekRWVkxHcHd5WVY3ZWo5SmVqWTFKeFQ4?=
 =?utf-8?B?NUdrVGN6UDJQOWFjR2NDd3BVQXh4QlR5a01GZitiTEU4V2RndUxpZk9UM2NN?=
 =?utf-8?B?YlZuQUFTYXBsaEpYaGhHalVtZy9ScHBwaXZZbjh5VG80bnlqdEo1SnBRaVJm?=
 =?utf-8?B?Tll5dmZMUUhEYzI3M2dlMmxZSmpJVU5EU2VhdHE0YlhzL1RseXVZSkNwR2NP?=
 =?utf-8?B?bVRDQkhNZnc1N0FkcUVBOC9DZ0g1NzFaRHdpM2x2WFl1YkVldW5UVXcrdGNI?=
 =?utf-8?B?L1Z5cTVQeHd6bmZHenZZUkQvSVh1NWJFaU5uVkVXMkYzWWtWUkdMTDhIcFVn?=
 =?utf-8?B?elhEcGNlcHl3aWRpNDB1bFl5aGRiSHJXaFk0UzB5WXc0SnViUWFyd2RyYW45?=
 =?utf-8?B?MXl4SHZkaU9oTXVFQlpwU0FxRXM0bkFza0hoR1VYRHJvc09YSldZNUZ2blZN?=
 =?utf-8?B?RDhsY25KSFFkU3lGMStCQlZRRFpSbDRWNHpLWllJRVJyK0l2SmVlazVSRlFB?=
 =?utf-8?B?YWJ4QW1yakY2L05mZFFsc2lZNXpEdlpoOWFMNmJ2MUVSVWVvRTNQRkZ0ajhV?=
 =?utf-8?B?ejBlMU9udW8wcnRGekpKcHljWDFZV0djUERpcVNmNEJ0QjllRUhTcHlnaWQ5?=
 =?utf-8?B?NzAwTnRhbjdUY3pXb0lmS2F1cHZQdml1aDJFR05oMFlkd0FiRUJGTHRiVjJ4?=
 =?utf-8?B?K3g5NGkyaFZmaGJ6M2R3YVdJSzVBcHN3eU9kQmYzQ2ZodE9GUUFIRjF0MnJR?=
 =?utf-8?B?UUg2dEJ0TEJ3YzBqQ0hwd2EyN0lrQU4wdkZhSlBJWWMwODdYbVZhYU92OXBx?=
 =?utf-8?B?cit0S3hsNmo3SGsxUlVyRk4zL3VkWWxTa3NWN2JuVUVCMFFzUTVxSDlkTERh?=
 =?utf-8?B?UDlPWVN2RG14MGZkbm8wSmJKTDBtZ2tlWFA1VS95T1FrZEttTVVzZnNNUWFx?=
 =?utf-8?B?akFBOEJMY2gwTmYzVEkxdXBaaWovaWpsYWJIOGlrcWhHRkF4bjUwUlY0Yi92?=
 =?utf-8?B?dkJ0VTVNbG45c3NqQkRMSHFMSEMwL0JxdTFJNWE2RHBId04yRXhWS1lWT3FL?=
 =?utf-8?B?SXE1TldtajFESFJHS3V2YjJZczF1M2hJSkdzZ3BlOW5KakRhc1F2R2lMaU1l?=
 =?utf-8?B?NXFEdmtvODBxaUUvZkxlN2g0SlorbXNGUS9PTVkxZHNqT0lydWdwNno2em5o?=
 =?utf-8?B?V3paRXNOZ1E2c1MxL3R5V0ZFUUZDdm9IYm9MTnArYkNlQUVwT2E2eEpreElu?=
 =?utf-8?B?MWQ0b2ZSZDM3TWd3dmRnVlVqYWRPRDF5dTVIYnd6QUQ1SVhVT3hEbTNZRVRo?=
 =?utf-8?B?M2hodGdWSER4ODVFd1BKazErRmlMb0pVam1OdEF5bDk1bklLNE9mM3lTcmNh?=
 =?utf-8?B?emJFVDY5UHloeWxETU95WU1ad0tNL3ZpdWUvZkl2NkUyOFFMaHUrZlgzRC9y?=
 =?utf-8?B?NW0zNUZDTmp5UExrWFRhOEVXeG9NaWRjbFYycWJ0ekxCWStLam4yelBxTlJD?=
 =?utf-8?B?M1RndmJIQVU3cXlyYTBKNnFlSEU4MERsNEtEUVJNWk1Yb21BbVdKUjhhMVQ4?=
 =?utf-8?B?cU9TRlBpRlRWSUpDMXBYcDJGWGxyN1hlTk52c3BOWnF1SlFGT3ZPYVhzTjRo?=
 =?utf-8?B?TzQwSTdXNW5WdXpubTZ0elNITTA4NGFObGdCWmlxMFJmZDlvR2xqbWVhR0NK?=
 =?utf-8?B?Q1EzOTY4YVJPZXp1cDk2YXFzalZ5N0hLZzVKdG16eWdGdUJpU3FIQkpFaENj?=
 =?utf-8?B?eTMvcE5nSnovb0dobmp3Uk5EdmtiMmNDUXJraTVKbjFvaGk2NXpLUE0xNFFv?=
 =?utf-8?B?V2VwTGxZMnp3SnFwU0FwTko2aDRDc2tyRVZ4T1RmMjI5UGxkZGZXWXVRMGl0?=
 =?utf-8?B?T0prOUZ2R0l1cHJkdkZzRkJHSElwemJsWU93M3Nna0ZZeDJ5ZjFIeFNoZks3?=
 =?utf-8?B?WjBETnFWZXl4eFpzSDJDelhBWEdGWkYxdVArbEdjaGF0MkRtZUl3T3pSa1ZZ?=
 =?utf-8?B?THJ5eDI4eUdXc3lJLzFBZkZHcXcybVJYb2xDZ3Z2d2NSVFJEamE3ZFRGUnls?=
 =?utf-8?B?ckpZeGtlM0Y5NElRanNjYkNmTTBWOWp1b2dkYjlpSXZzaHd3aU5pbTFMQXBX?=
 =?utf-8?B?MDhZQVBwWk1tM1dCTUxjaHJnVlltaURBTjdBNU0wQlJxUmo0WnFjS1lEMWUz?=
 =?utf-8?B?SWN1MXdBSmQ2YjlWQlFoeEFZVGl0YkxIUlZHRXBWQ1lHNEhpbEI2QjViczdK?=
 =?utf-8?B?K1RnQmRxZUpsYjhxWUNYRS9VT0xjUml3cTRNNUN5clNYWU55c3N1K0pjZEhX?=
 =?utf-8?Q?bOWJl3bs/1bWzeFw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17F73075C03AB247862ED21754482BBB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JhL4VfC/OEtcc3VjAw4IyOgnkdhRUsYDo0qLCN/zzR1CzCvYoP0/uR0onSoAVERSfpjYvTfTgpPLgll0UB5qyfEdY2D7JdAOotDV2ZdF7W9shwedS/6ZH0GoSVPq87psDDsIL+PEQFL00XGeCDaY7x6rxgX9RmRe0ck2ChaSubfQkRUYMISVqSTyNpvIYaiu/Jwbw2ErSOdkn92uugg3x3HZbKlFlIeFEPktvEXCY8OSbBCy9WAaR4bZu13Qj0jjVS/hjYe5LmZJX2VWC3byV7FQw/i2Ut9UaYEQbXzM4S1oqn8ZfwfVZMj9LOyCfFZ30LxRJHsSZkq6WMx4/wD6Hw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fbccfd-a5d7-47aa-ceef-08dee9796978
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 11:48:00.2901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3ZpH/qCR1hwL+gDithWFrrSzysXCWwAQB4pGcSLu1qOCLIKDpdnWOCC0D2jtb7vah7yDoEenpsxITUVSs0bvuyvMgqkg4HxuNOmZe9inJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7920
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

SGkgS2FtaWwsDQoNClNvcnJ5IHRvIGJvdGhlciB5b3UuDQoNClNpbmNlIHRoaXMgcGF0Y2ggaGFz
IGJlZW4gcGVuZGluZyBzaW5jZSBKdW5lIDh0aC4NCkkgdGhpbmsgaXQgd2FzIGFjY2lkZW50YWxs
eSBsb3N0LiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgcmV2aWV3IGl0IG9yDQpmaW5kIHNvbWVvbmUg
ZWxzZSB0byBoZWxwPw0KDQpJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIGFueSBzdWdnZXN0aW9u
IG9yIGZlZWRiYWNrIHlvdSBtYXkgaGF2ZS4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQpP
biBUaHUsIDIwMjYtMDYtMTEgYXQgMjM6MDcgLTA3MDAsIE1hbmFzaSBOYXZhcmUgd3JvdGU6DQo+
IFRoYW5rcyBKYXNvbiBmb3IgdGhlIHBhdGNoLCB0aGlzIG1ha2VzIHNlbnNlIHRvIG1lLg0KPiBA
S2FydGhpayBCIFPCoCBAU3dhdGkgU2hhcm1hwqAgY291bGQgd2UgZ2V0IHNvbWUgcmV2aWV3cyBv
biB0aGlzIHNpbmNlDQo+IHRoaXMgaXMgZXh0cmVtZWx5IGNyaXRpY2FsIGZvciB1cy4NCj4gDQo+
IFJlZ2FyZHMNCj4gTWFuYXNpDQo+IA0KPiBPbiBTdW4sIEp1biA3LCAyMDI2IGF0IDc6MjjigK9Q
TSBKYXNvbi1KSCBMaW4NCj4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+
IA0KPiA+IFRoZSBjYXB0dXJlX2NyYygpIGZ1bmN0aW9uIHZhbGlkYXRlcyB0aGF0IHRoZSBDUkMg
ZnJhbWUgc2VxdWVuY2UNCj4gPiByZXR1cm5lZCBieSBpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9mcmFt
ZSgpIG1hdGNoZXMgdGhlIGV4cGVjdGVkDQo+ID4gdmFsdWUuDQo+ID4gVGhlIGN1cnJlbnQgY2hl
Y2sgdXNlcyBleGFjdCBlcXVhbGl0eSAoIT0pLCBob3dldmVyIHRoZSBsaWJyYXJ5DQo+ID4gZnVu
Y3Rpb24gaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoKSB1c2VzID49IGNvbXBhcmlzb24NCj4g
PiBpbnRlcm5hbGx5Og0KPiA+IA0KPiA+IMKgwqDCoCBkbyB7DQo+ID4gwqDCoMKgwqDCoMKgwqAg
cmVhZF9vbmVfY3JjKHBpcGVfY3JjLCBjcmMpOw0KPiA+IMKgwqDCoMKgwqDCoMKgIC4uLg0KPiA+
IMKgwqDCoCB9IHdoaWxlIChpZ3RfdmJsYW5rX2JlZm9yZShjcmMtPmZyYW1lLCB2YmxhbmspKTsN
Cj4gPiANCj4gPiBUaGUgZnVuY3Rpb24gbG9vcHMgd2hpbGUgY3JjLT5mcmFtZSA8IHZibGFuaywg
cmV0dXJuaW5nIHRoZSBmaXJzdA0KPiA+IENSQyB3aGVyZSBjcmMtPmZyYW1lID49IGV4cGVjdGVk
LCBub3QgbmVjZXNzYXJpbHkgYW4gZXhhY3QgbWF0Y2guDQo+ID4gDQo+ID4gVGhpcyBzdHJpY3Qg
dmFsaWRhdGlvbiBjYW4gY2F1c2UgdGVzdCBmYWlsdXJlcyBvbiBkcml2ZXJzIHRoYXQNCj4gPiBy
ZXBvcnQgQ1JDIGVudHJpZXMgd2l0aCBmcmFtZSBzZXF1ZW5jZXMgbGFyZ2VyIHRoYW4gZXhwZWN0
ZWQuIFRoaXMNCj4gPiBoYXBwZW5zIHdoZW4gZHJpdmVycyB1c2UgaW50ZXJuYWwgcXVldWluZyBt
ZWNoYW5pc21zIHRvIGVuc3VyZSBDUkMNCj4gPiB2YWx1ZXMgYXJlIGNvcnJlY3RseSBjb3JyZWxh
dGVkIHdpdGggdGhlaXIgY29ycmVzcG9uZGluZyBmcmFtZXMuDQo+ID4gDQo+ID4gRXhhbXBsZSB3
aXRob3V0IGludGVybmFsIHF1ZXVlIChjb250aW51b3VzIENSQyByZXBvcnRpbmcpOg0KPiA+IMKg
IC0gRHJpdmVyIGdlbmVyYXRlcyBDUkMgZW50cmllcyBjb250aW51b3VzbHkgZXZlcnkgZnJhbWUN
Cj4gPiDCoCAtIEZyYW1lIHNlcXVlbmNlIGluY3JlbWVudHMgc2VxdWVudGlhbGx5DQo+ID4gwqAg
LSBUZXN0IGZpbmRzIGV4YWN0IG1hdGNoZXMgZm9yIGFsbCBleHBlY3RlZCBmcmFtZXMg4oaSIFBB
U1MNCj4gPiANCj4gPiBFeGFtcGxlIHdpdGggaW50ZXJuYWwgcXVldWUgKHBlci1jb21taXQgQ1JD
IHJlcG9ydGluZyk6DQo+ID4gwqAgLSBEcml2ZXIgcXVldWVzIENSQyBhbmQgcmVwb3J0cyB3aXRo
IGN1cnJlbnQgZnJhbWUgc2VxdWVuY2UNCj4gPiDCoCAtIER1ZSB0byBxdWV1ZSBwcm9jZXNzaW5n
IGRlbGF5LCByZXBvcnRlZCBzZXF1ZW5jZSA+IGV4cGVjdGVkDQo+ID4gwqAgLSBGb3IgdGhlIGxh
c3QgQ1JDLCB0ZXN0IGFkZHMgKzEgdG8gZXhwZWN0ZWQgKHBlciBJR1QgbG9naWMpDQo+ID4gwqAg
LSBMaWJyYXJ5J3MgPj0gY29tcGFyaXNvbiByZXR1cm5zIHZhbGlkIENSQw0KPiA+IMKgIC0gY2Fw
dHVyZV9jcmMncyAhPSBjaGVjayBmYWlscyBvbiBsYXN0IGZyYW1lIOKGkiBGQUlMDQo+ID4gDQo+
ID4gUmVsYXggdGhlIHZhbGlkYXRpb24gdG8gdXNlIDwgY29tcGFyaXNvbiBpbnN0ZWFkIG9mICE9
LCB3aGljaDoNCj4gPiAxLiBBbGlnbnMgd2l0aCBpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9mcmFtZSgp
IGludGVybmFsIGJlaGF2aW9yDQo+ID4gMi4gQWNjZXB0cyBDUkMgZW50cmllcyB3aXRoIGZyYW1l
ID49IGV4cGVjdGVkICh2YWxpZCBjYXNlcykNCj4gPiAzLiBTdGlsbCBjYXRjaGVzIHJlYWwgZXJy
b3JzIHdoZXJlIGZyYW1lIDwgZXhwZWN0ZWQsIGluZGljYXRpbmcNCj4gPiDCoMKgIENSQyBidWZm
ZXIgb3ZlcmZsb3cgb3Igc3RhbGUgZGF0YQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29u
LUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiDCoHRlc3Rz
L2ttc19wbGFuZS5jIHwgOCArKysrKystLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUuYw0KPiA+IGluZGV4IGYyMTAwNjc4NGJmYy4uNTQ4
NTA2MjkwYzliIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19wbGFuZS5jDQo+ID4gKysrIGIv
dGVzdHMva21zX3BsYW5lLmMNCj4gPiBAQCAtNzY2LDkgKzc2NiwxMyBAQCBzdGF0aWMgdm9pZCBj
YXB0dXJlX2NyYyhkYXRhX3QgKmRhdGEsIHVuc2lnbmVkDQo+ID4gaW50IHZibGFuaywgaWd0X2Ny
Y190ICpjcmMpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDCoMKgwqAgaWd0X3BpcGVfY3JjX2dldF9m
b3JfZnJhbWUoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5waXBlX2NyYywNCj4gPiB2YmxhbmssIGNyYyk7
DQo+ID4gDQo+ID4gK8KgwqDCoMKgwqDCoCAvKg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGlndF9w
aXBlX2NyY19nZXRfZm9yX2ZyYW1lIHVzZXMgPj0gY29tcGFyaXNvbiwgc28gd2UNCj4gPiBjaGVj
ayB0aGUgc2FtZS4NCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBHZXR0aW5nIGEgZnJhbWUgPCBleHBl
Y3RlZCBpbmRpY2F0ZXMgQ1JDIGJ1ZmZlciBvdmVyZmxvdw0KPiA+IG9yIHRpbWluZyBpc3N1ZS4N
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiDCoMKgwqDCoMKgwqDCoCBpZ3RfZmFpbF9vbl9m
KCFpZ3Rfc2tpcF9jcmNfY29tcGFyZSAmJg0KPiA+ICFpZ3RfcnVuX2luX3NpbXVsYXRpb24oKSAm
Jg0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyYy0+aGFz
X3ZhbGlkX2ZyYW1lICYmIGNyYy0+ZnJhbWUgIT0gdmJsYW5rLA0KPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJHb3QgQ1JDIGZvciB0aGUgd3JvbmcgZnJhbWUg
KGdvdCAldSwNCj4gPiBleHBlY3RlZCAldSkuIENSQyBidWZmZXIgb3ZlcmZsb3c/XG4iLA0KPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyYy0+aGFzX3ZhbGlk
X2ZyYW1lICYmIGNyYy0+ZnJhbWUgPCB2YmxhbmssDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIkdvdCBDUkMgZm9yIHRoZSB3cm9uZyBmcmFtZSAoZ290ICV1
LA0KPiA+IGV4cGVjdGVkID49ICV1KS4gQ1JDIGJ1ZmZlciBvdmVyZmxvdz9cbiIsDQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyYy0+ZnJhbWUsIHZibGFu
ayk7DQo+ID4gwqB9DQo+ID4gDQo+ID4gLS0NCj4gPiAyLjQzLjANCj4gPiANCg0K
