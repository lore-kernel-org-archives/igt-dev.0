Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405D4CD8C92
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 03:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31FE10EC6D;
	Mon,  8 Jun 2026 03:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="t/TtiU4B";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PTSOQJIF";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF8E10EC6D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 03:07:10 +0000 (UTC)
X-UUID: 21fe9f3a62e711f18dc8c9802ae25ab1-20260608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=RmGKGqOcMjpp3kpZ5pr+enHBRD3KYSKCGc6Wi3ZahcQ=; 
 b=t/TtiU4BcdCw22q6ZuLSHSkxGcvsaT9W+c8vBrmjOwocix6o/7/gVFWq22e+4uiDJHWQiW8PIxqfqZbu8/ccAzjDQiZTfOHebzg7MQm1+qsr/mvQXpHLa5mXfLYexMkSYSa8nMsnCwOQRO0e0+h69SYTVoQvFRCfnpcOc1lUlf8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:a72515cb-cd77-4d2f-aac6-ee08668d73fa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:a1a817fc-9da9-43ea-b65d-21c09d566093,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|136|836|865|
 888|898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:n
 il,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
 :0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21fe9f3a62e711f18dc8c9802ae25ab1-20260608
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1361997995; Mon, 08 Jun 2026 11:07:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Jun 2026 11:07:06 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 8 Jun 2026 11:07:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvDAVGvdMzFRge+2wGdoTQRv1lGXonMtPSPOc5+XvTufDIA6C5T34tCjJdIKfcDb3YJN65TccIVqmvpz5DxPpba8j9981b/gB36xtIX401g6eoNKGjhebTmuQNylia6j1VFKjc19Adta1ACLHiGhSffWMKeTgwDeMHeZdgglMMgZLPnDfgUcJdAl6Cw59PTinw7LcTdYoh31rfV+/TzWpCUztHfyG39Jco30ro2dqUMACSzDwBxN8kAc2+05EAyTOKk+AoDB7Uelw8z26HkQernbp0FwsK/L66oYzs2Uehw6mfTo2xmuWSgscZZN5UQMilRJjxEc4wYBgwgZXsszkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmGKGqOcMjpp3kpZ5pr+enHBRD3KYSKCGc6Wi3ZahcQ=;
 b=XAfKCwtG0IxIAkhFEvL97ryPKsRPvDPetH6KgSNnN7MxPJTxoXj2l74u1jpG7OVx13c5vjPiTpCbV7HmIHgYCQG/CG14a6GX6I8DJRTg2KRTgR1Zod6U+m8qpxi1jVUtoQ/dOOIQsNQ6OgrbEn9+K1cZkdcodRML20h6Fg0id3DSRVbIlsulv8g1ZUZwTdRaii2ETHK+cKtRd3NtD9JM0t8iYzRMU7+r9eEVCHxDqpUEgbibl30UM+R32QoxhKtr0Moc7nA24yevIJhzCBYlVOCNWoEPpc1BTIECjIxStqzT8kxzJ87w+XK/gavKkUZcwUeSVDjeI1HMAdyauY1z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmGKGqOcMjpp3kpZ5pr+enHBRD3KYSKCGc6Wi3ZahcQ=;
 b=PTSOQJIFQuk+ZRFKT9V/1X033s5X2TqIFTIp35ohfM7nhEGTilevhIsNXk8z/HnpL4R+pvSGEF37kU9vifFpNfd9Ou9mnWHmYBofEgs7iF9cGNEtPm91XV9J+MS3LwgHdy1FFxDBZJBpyF5I5rKrUx/ucdw4MkOD7R9zRAh6udk=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB8694.apcprd03.prod.outlook.com (2603:1096:990:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.8; Mon, 8 Jun 2026
 03:07:01 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0113.006; Mon, 8 Jun 2026
 03:07:01 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "navaremanasi@google.com" <navaremanasi@google.com>, 
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "suresh.kumar.kurmi@intel.com" <suresh.kumar.kurmi@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Topic: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Index: AQHcyNH2YxjB3EtuVUiEvZIHanYs6Q==
Date: Mon, 8 Jun 2026 03:07:01 +0000
Message-ID: <4f0376dce37c5a5c8c6e849aacd6de30e7bc3eab.camel@mediatek.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
 <ad5De-s-yxyyTt7s@intel.com>
 <73567dcf64c48d1e02206839ce589809b1366d58.camel@mediatek.com>
 <CAMNLLoSF9xLz=2pUwcTULURdxZDn+NR1+Y-oGHBaOsre3Uz-cw@mail.gmail.com>
 <CAMNLLoSDZ5mGALP=vwuL245R+yZWf+adpCD3cFyeqv9k1bKzAw@mail.gmail.com>
 <CAMNLLoSNXHyLS7gftj4ofMFknnhP-tdKoYjG32W3j3kb4DZO2A@mail.gmail.com>
 <61f912e0d6a934afac8e2e978dae27314d27a23a@intel.com>
 <986ffe07650b69ac71c36b10bb6d5e18aa82106f.camel@mediatek.com>
 <ahc3rjW0MFg3LBAB@intel.com>
 <f9fac697509e8c4c543e393152fd5c9809f0932e.camel@mediatek.com>
In-Reply-To: <f9fac697509e8c4c543e393152fd5c9809f0932e.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB8694:EE_
x-ms-office365-filtering-correlation-id: 191c5c4b-e832-4f4f-20fa-08dec50b029f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: aKT82QtDHPJaQ5M0gx+i+uizXg9P6b31gy5hYnIE/e7c65BeNmY/4nEaNFoOGG/RLjbB2ycwubAfxs9uSqD8zqqvxKUBc2QBtd0qiUorMXqu3o/J2/n/umCo1dSM7PjQhtCaVLIRvY5FQlAX5FxP36lRcU7qZrVPu2H8TzfM/rbTG9TuS2b9aReseIS+xIGdTFgjDrWBCawKoE1MTLFSUYcAtwaC1iC+Db6Po3Ngcrb6JucvPY077fxml+dhbvstbk7x99Fwj2aMoXk/GicMbiEg6hDiwRU+/XQ/tbgT0geG6XqVFJQRdleq4rumkNs+7np0bNIBIGTwzpcLptmf5pBoDrKDWnoII9M/dEanEhJEgiMo8QQ5qe4eqcem0RecxfHI/PjRHM+0ds/NlSVnv6oBoH+gT5YZM9YaM22fm6+mVORxxQH5wO4rb0IQvi9xTedSLG5vnAHexGEJaRbwOeD1NPNsycTs1n1rZjszS4w0gS5CBU8sPVMAGtNM/aNB732lMhgbrWulapE3GMMjBHWU8jeaw16IoazjvbGQj0tsYuN2Vb2OcOCgBe3HVG6EyRnIIJ8Ir+Wp25kUIUDaqD3hTABzQN4C/EQnFip5/PHddzD0X7/rLttRTOnNFPD2k+LE8ZFBaDHnx7CYvCK8MzoNg6T8u9TL8gHQGcV5p4QoqKXOXROf86RGy9kSqeWCD0ba2SxN9ZaBMygwCzxGsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlVDUnhkWGh0MzJERWh1dXVqWVVZWjNrazdUUlc1MndtNEcrb3l5V083U0hl?=
 =?utf-8?B?Tmt3MGpIMGpJRlpIOEFrTytVb3J1Q2tra1dZaUlvdTVGNVlyK011SHY5TUgx?=
 =?utf-8?B?cEdYUm5qY2Q3RjRmdzFVWlBKd3VnODBBV3YvWEZZMUsvMy8rV253bWUyNCtG?=
 =?utf-8?B?UHlIN1VQRzh5b3hoS3hUbEVNcWVrY2N4SEh1a2xLeFNkVVZjRDNtbVM5ZDd3?=
 =?utf-8?B?WmFBYU5jSlp5K2xIVFhmeldDN0x0bWJoWkY4N08wVUlFSlExTGtEUHR0V0Fa?=
 =?utf-8?B?a3FFUzBVbmhydHY4Vjh6SW0rSFhzQ3hkREs0UTM0dFEyNG1EdVQ2eFBHSVRm?=
 =?utf-8?B?eU8zRXZzeUg5enVnNWpmQm85bFhkbU95MFhqY1JmbzRhTEt6SkFyTTdMR0wz?=
 =?utf-8?B?TmxwakFXRXN4OUxSMlU4RVdVUGgwMHdBS01EVXk1U1FobitnQ3FvOGx6T0xC?=
 =?utf-8?B?cEgxektReVRRTklEb0V5VTFSaFhnZWxUYzNHVzBsa3RTSlptSmpwWmg1N2N0?=
 =?utf-8?B?bHdEcUxLMjd3QUptczBPM1lrRVBIUCtBYXd4aXlxSjl3dXQvRktiak9TZjc2?=
 =?utf-8?B?Wk1RNjk0ZFdPWFVkbzRBdjY4V29JaDRpQ29GaXVKUkU0R1ltUElhbXEwRTdK?=
 =?utf-8?B?K3pqZUxIbmszR0dFVXZuSWpzMzNrdndRWTdWRVBmQ0JXK2Qya0xwcENtZVhL?=
 =?utf-8?B?WUUveHc5L055dTJTUytnUlFoaUhSeVptQXZTTmpyaEFpWWtQRVBIeFZKSVVE?=
 =?utf-8?B?S1hJSzlHdlVmalBJY0w5Mys5SzAzaXpqZmh5WXovekN2ZHZaOG5OS21TVFR2?=
 =?utf-8?B?RWNuYnBTWEhKS3dscVNlZGtZT284OC9LK3dBWEFrYWQ3RTVaQ01sdVp2L0lG?=
 =?utf-8?B?SDdpdlVVSCt1OC9RMlJjNlBsSHBSek1qZ2ZrczRRem9jWEZ3Z2lFQXdrMjZu?=
 =?utf-8?B?c0x5cUF2N3U2dEc1aDNvUHdBRUM0VzlUaGJJa01iSWhVU1JVQitjd0g2ZHJ5?=
 =?utf-8?B?MXVla0JjNU9ERFNTUVdIUm9RbUFPS3JNZVg0VXM1R1ZpalovMS9YUmdTc2dm?=
 =?utf-8?B?aHFvRnpuSG1XeUhGeEpjS1dZS3JjNExKN2Z6S2JtWUdGclloWjgzaDk3a3FN?=
 =?utf-8?B?cjFBYmIxSm9VTms5SmxDRSsweDRZTXhnekhsa0FIaGZoY3RBVlJSM2s2Qnpo?=
 =?utf-8?B?WFNSc2lZRG11cnN4YWh6NXhIbk5CdEhiMnhhOTMxdmlCNDdyZXV6ODMvTDhh?=
 =?utf-8?B?MCtMeGNzdGwyVWtDVHhVUFl1b0RtQXVKMEt0VmRjY2xjTExKbFRFeUtlNURR?=
 =?utf-8?B?Ym96Rnp6R05kRzU2UFl0QVVWaUc3RVRnVm44M2Y4WmMwWlNLQnJ5YXBsQ0I2?=
 =?utf-8?B?M3NXTjdhSEZCZEtzZk1GODd0QnhBQmsvZDFTWVFGaUtXL0lEdEFTaFJYTjhn?=
 =?utf-8?B?a1hKdytoVk04ZFI4ZkFBNmxXdHRCWk5tS1FJSWtjQ3A1S0RoU1JUREJ0T2pi?=
 =?utf-8?B?T25LNHpOWG94UXVNYVI3ck03Tktqejc3c0x6TWxuS2xqM2NEVlRqb1grT3hh?=
 =?utf-8?B?MnU3cjdCeUJQZ01Pb2p5cHZ3K0RuMFRHNzRqTkNnTDk5TjZiUDRBNFBoaGtF?=
 =?utf-8?B?VEorSklyeUQxTkcxZFdnZWZKWDVtM1E3NmdqZzc4enpIaG54eEJhS2k0bWJM?=
 =?utf-8?B?a1pSaFV3MittdG1yV2JsVzRMZHBSRUViWkxPV1Q1VjhOTGJORnJTdVR6cGVF?=
 =?utf-8?B?UnJJNXQvYW45WXVpZ2lnL2JPaFJISlZKNDRpRVF4UVN3SE10UmQzNkFGMEZ1?=
 =?utf-8?B?azI4akpxSUJIMmt0SGFFZU1Ea3ZUbTRidmdnNlM5VWV3REtvRlBVbHBIMXRS?=
 =?utf-8?B?WlRvQWlUNDJHRXp1cTFHbitSb3pNL1FpQ25sb0pHL3IyWFVnaFQ1N3dXWXRW?=
 =?utf-8?B?eDdPdDVIN0twK1ZHWGVsN1Vna0dpSlVGbnUzTHplTERPV3hsRFZkajE3UTMz?=
 =?utf-8?B?ODZnUzVYR3JCeEY5Y05FRXpsUGxCRzk1VXFpVURrWGZOM1RreENLR2U0OTJB?=
 =?utf-8?B?cW1IQ1dyWUREaVQwWnJSWVZWc3AwdU0yVkIyN2wzS3hkM1NNS3RNNmdJdXZo?=
 =?utf-8?B?RDhuSVV0NVdDSGZkUFR5ek45VXJOQll3bHVCcFJhT3FpMVVjeEhkWjgwTzBZ?=
 =?utf-8?B?b3FHTEg0bkJiaHRjblJwZ0lBM3Jib2lKUFU1VzFML01GNzRmUzlYRUM0b1Bu?=
 =?utf-8?B?dzAxdkp1NG5ZcGlZL3NISWJKRTJpN2wyZHg4eTVsRzBiVE9sK3JzRVlGbHd1?=
 =?utf-8?B?RkJDS25ua0dMVUJDdWVtQ3NnNmZOVkUrMEczWmVrR3NDbDhsWEtLeE9VRnhy?=
 =?utf-8?Q?ukrp9LJZQ/mYKBMM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F69B3E16EDBA1F449E4CDA3E2D3EBC83@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V50ZjPhVWKjUKmPFuEqd3yvZmNPWD0T/e+xi0BIyB5miOLrwuEFO4QPNa3Xq0bwEuoMpNQNwDg+p0L6j4hb/6sK2xxvF5mEnVzej2LSt03/lNtfDxewjFTmpgFo5hAPJZLP/dbn6Mdaeq8KBRIXqu3+hArf3cHFdMf7m8CiOq/pUmjV6msYhxSM+BYSQn8HXYfAvM+FgfgD7CUFIOjilRflKsA+afbCALWAAC0n5wGDG/Zs9Msh1sQ8JCT2iKgu1+axvOHA6RqIKWeliau6b1gIBfwAXQaz3sS82MtZEFQBZydiY1wncwExOnCRqXtoJFvr/gl3tyH/tPnUjpl35WA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191c5c4b-e832-4f4f-20fa-08dec50b029f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 03:07:01.1953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rFxmplpH6WrkjFK9WV1MdERffkGh/Igt2uIKTEqOyIAwUCV/4ieeWNclkafcqV0XetfQgx7iKjDG4QEFlv5bZrSsqUojGnR7J8PWlbkqVMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8694
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

W3NuaXBdDQoNCj4gPiANCj4gPiBBRkFJQ1MgdGhlIHRlc3QgZWl0aGVyIGRvZXMgYSBibG9ja2lu
ZyBjb21taXQgb3IgZXhwbGljaXRseSB3YWl0cw0KPiA+IGZvciB0aGUgcGFnZSBmbGlwIGV2ZW50
IGJlZm9yZSBjYWxsaW5nIGlndF9waXBlX2NyY19nZXRfY3VycmVudCgpLg0KPiA+IElmIHRoZSBD
UkMgcmV0dXJuZWQgYnkgdGhhdCBkb2Vzbid0IG1hdGNoIHRoZSBjb21taXQgdGhlbiB0aGUgQ1JD
cw0KPiA+IGNsZWFybHkgaGF2ZSBib2d1cyBmcmFtZSBudW1iZXJzLg0KPiA+IA0KPiA+IEkgZ3Vl
c3MgaWYgeW91IGNhbid0IGZpeCB0aGUgQ1JDIGZyYW1lIG51bWJlcnMgdG8gYmUgYWNjdXJhdGUg
dGhlbg0KPiA+IG1heWJlIGp1c3Qgc3RvcCB0ZWxsaW5nIGRybV9jcnRjX2FkZF9jcmNfZW50cnko
KSB0aGF0IHlvdSBldmVuIGhhdmUNCj4gPiBhbnkgZnJhbWUgbnVtYmVycy4gVGhhdCBzaG91bGQg
bWFrZSBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQoKQ0KPiA+IHRocm93DQo+ID4gb3V0IGFsbCBj
YXB0dXJlZCBDUkNzIGFuZCB3YWl0IGZvciB0aGUgbmV4dCBvbmUgdG8gY29tZSBpbi4gUGVyaGFw
cw0KPiA+IHRoYXQgaXMgZW5vdWdoIHRvIGdldCB5b3UgdGhyb3VnaCB0aGlzLg0KPiA+IA0KPiA+
IA0KPiANCj4gUmVnYXJkaW5nIHRoZSBmcmFtZSBudW1iZXIsIEkgY29uZmlybWVkIHRoYXQgb3Vy
IGRvd25zdHJlYW0gZHJpdmVyDQo+IGN1cnJlbnRseSBhbHdheXMgY2FsbHMgZHJtX2NydGNfYWRk
X2NyY19lbnRyeSgpIHdpdGggaGFzX2ZyYW1lPXRydWUsDQo+IHBhc3NpbmcgdGhlIHZibGFuayBj
b3VudGVyIGFzIHRoZSBmcmFtZSBudW1iZXIuIEhvd2V2ZXIsIHNpbmNlIHRoZQ0KPiBDUkMgY29u
dGVudCBpcyBpbmhlcmVudGx5IG9mZnNldCBmcm9tIHRoZSB2YmxhbmsgaXQgaXMgcmVwb3J0ZWQg
b24NCj4gZHVlIHRvIHRoZSBIVyBwaXBlbGluZSBsYXRlbmN5LCB0aGUgZnJhbWUgbnVtYmVyIHdl
IGFyZSBwYXNzaW5nIGlzDQo+IGVmZmVjdGl2ZWx5IGluYWNjdXJhdGUuDQo+IA0KPiBCYXNlZCBv
biB5b3VyIHN1Z2dlc3Rpb24gb2Ygc2V0dGluZyBoYXNfZnJhbWU9ZmFsc2UsIEkgdW5kZXJzdGFu
ZA0KPiB0aGF0IGlndF9waXBlX2NyY19nZXRfY3VycmVudCgpIHdvdWxkIHRoZW46DQo+IA0KPiAx
LiBEcmFpbiBhbGwgcHJldmlvdXNseSBjYXB0dXJlZCBDUkNzIGluIHRoZSBidWZmZXINCj4gMi4g
V2FpdCBmb3IgdGhlIG5leHQgaW5jb21pbmcgQ1JDDQo+IDMuIFJldHVybiBpdCBkaXJlY3RseSB3
aXRob3V0IGZyYW1lIG51bWJlciBjb21wYXJpc29uDQo+IA0KPiBUaGlzIHdvdWxkIG5hdHVyYWxs
eSBlbnN1cmUgdGhlIG1vc3QgcmVjZW50IENSQyBpcyByZXR1cm5lZCwNCj4gcmVmbGVjdGluZyB0
aGUgbmV3IEhXIGNvbmZpZ3VyYXRpb24gYWZ0ZXIgYXRvbWljX2NvbW1pdCgpLg0KPiBJIHdpbGwg
dHJ5IHRoaXMgYXBwcm9hY2ggaW4gb3VyIGRvd25zdHJlYW0gZHJpdmVyIGFuZCB2ZXJpZnkgaWYg
aXQNCj4gcmVzb2x2ZXMgdGhlIGlzc3VlIHdpdGhvdXQgcmVxdWlyaW5nIGFueSBJR1QgY2hhbmdl
cy4NCj4gDQoNCkhpIFZpbGxlLA0KDQpJIGhhdmUgaW1wbGVtZW50ZWQgdGhlIENSQyBjb21taXQg
cXVldWUgbWVjaGFuaXNtIGluIHRoZSBkb3duc3RyZWFtDQprZXJuZWwgZHJpdmVyIGNvbWJpbmVk
IHdpdGggdGhlIGhhc19mcmFtZSBmbGFnIGFzIHlvdSBzdWdnZXN0ZWQuDQpIZXJlIGlzIGEgc3Vt
bWFyeSBvZiB0aGUgaW1wbGVtZW50YXRpb246DQpDb21taXQgRmxvdzoNCiAgbXRrX2NydGNfdXBk
YXRlX2NvbmZpZygpDQogICAg4pSU4pSA4pSAIEVucXVldWUge3ZibGFuaywgaGFzX2ZyYW1lPWZh
bHNlfQ0KICAgIOKUlOKUgOKUgCBTZW5kIENNRFEgY29tbWFuZA0KDQogIENSQyBXb3JrIEZsb3cg
KGV2ZXJ5IHZibGFuayk6DQogICAgbXRrX2NydGNfY3JjX3dvcmsoKQ0KICAgICAg4pSc4pSA4pSA
IElmIHF1ZXVlIGVtcHR5IC0+IHJlcG9ydCBjdXJyZW50IENSQyB3aXRoIGhhc19mcmFtZT1mYWxz
ZQ0KICAgICAg4pSU4pSA4pSAIElmIHF1ZXVlIG5vdCBlbXB0eToNCiAgICAgICAgICDilJzilIDi
lIAgU2V0IGhhc19mcmFtZT1mbGFzZSAod2hlbiBwbGFuZSBGQiBpcyBzZXQgdG8gTlVMTCkNCiAg
ICAgICAgICDilJzilIDilIAgV2FpdCBmb3IgZGlmZiA+PSAzIChDUkMgdmFsaWQpIHNldCBoYXNf
ZmFtZT10cnVlDQogICAgICAgICAg4pSU4pSA4pSAIFJlcG9ydCBDUkMgYW5kIGRlcXVldWUNCg0K
V2l0aCB0aGlzIGNoYW5nZSwgdGhlIHJvdGF0aW9uIENSQyB0ZXN0IG5vdyBwYXNzZXMuDQpTbyB3
ZSBjYW4gZHJvcCB0aGlzIHBhdGNoIGZvciBrbXNfcm90YWlub25fY3JjIHRlc3Qgbm93Lg0KDQpT
dWJUZXN0cy9QaXhlbEZvcm1hdE1vZGlmaWVyDQoNCkhvd2V2ZXIsIHdlIGZvdW5kIHRoYXQga21z
X3BsYW5lIHRlc3RzIGZhaWwgYXQgUGl4ZWxGb3JtYXRNb2RpZmllcg0KZHVlIHRvIGFuIGluY29u
c2lzdGVuY3kgaW4gSUdUJ3MgY2FwdHVyZV9jcmMoKSBmdW5jdGlvbi4NClRoZSBpc3N1ZSBpcyB0
aGF0IGNhcHR1cmVfY3JjKCkgdXNlcyBhIHN0cmljdCBlcXVhbGl0eSBjaGVjayBvbiB0aGUNCmZy
YW1lIG51bWJlciwgd2hpbGUgaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoKSBpbnRlcm5hbGx5
IHVzZXMgYQ0KPj0gY29tcGFyaXNvbi4NCkR1ZSB0byB0aGUgcXVldWUgcHJvY2Vzc2luZyBkZWxh
eSBpbiBNVEsncyBkcml2ZXIsIHRoZSByZXBvcnRlZA0KZnJhbWUgbnVtYmVyIG1heSBiZSBzbGln
aHRseSBhaGVhZCBvZiB0aGUgZXhwZWN0ZWQgZmxpcCBsYXRjaCBmcmFtZSwNCmNhdXNpbmcgdGhl
IHN0cmljdCAhPSBjaGVjayB0byBmYWlsIGZvciB0aGUgbGFzdCBmcmFtZSBldmVuIHRob3VnaA0K
dGhlIENSQyBpdHNlbGYgaXMgY29ycmVjdC4NCg0KSSBoYXZlIHByb3Bvc2VkIGEgSUdUIHBhdGNo
IHRvIGFsaWduIGNhcHR1cmVfY3JjKCkgd2l0aCB0aGUgbGlicmFyeSdzDQpleGlzdGluZyA+PSBi
ZWhhdmlvciwgcGxlYXNlIHJlZmVyIHRvIHRoZSBwYXRjaCBoZXJlOg0KaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzczMTEyMi8NCg0KVGVzdCByZXN1bHRzIHN1bW1hcnk6
DQotIFdpdGhvdXQga2VybmVsIENSQyBxdWV1ZSwgd2l0aG91dCBJR1QgcGF0Y2ggLT4gUEFTUw0K
LSBXaXRoIGtlcm5lbCBDUkMgcXVldWUsIHdpdGhvdXQgSUdUIHBhdGNoIC0+IEZBSUwgKGxhc3Qg
ZnJhbWUpDQotIFdpdGgga2VybmVsIENSQyBxdWV1ZSwgd2l0aCBJR1QgcGF0Y2ggLT4gUEFTUw0K
DQotLS0NCg0KRXhhbXBsZSBUaW1lbGluZSBpbiBLbXNQbGFuZVRlc3RzI1J1blN1YlRlc3RzL1Bp
eGVsRm9ybWF0TW9kaWZpZXI6DQogIEZsaXAgMCBsYXRjaGVzIGF0IGZyYW1lIDEwMA0KICBGbGlw
IDEgbGF0Y2hlcyBhdCBmcmFtZSAxMDENCiAgRmxpcCAyIGxhdGNoZXMgYXQgZnJhbWUgMTAyDQog
IEZsaXAgMyBsYXRjaGVzIGF0IGZyYW1lIDEwMw0KDQoNCkRyaXZlciBiZWhhdmlvciB3aXRob3V0
IEludGVybmFsIFF1ZXVlIChDb250aW51b3VzIENSQyBSZXBvcnRpbmcpOg0KLSBDUkMgd29yayBy
dW5zIGNvbnRpbnVvdXNseSBldmVyeSBmcmFtZQ0KLSBHZW5lcmF0ZXMgQ1JDIGVudHJpZXMgd2l0
aCBzZXF1ZW50aWFsIGZyYW1lIG51bWJlcnM6IDEwMCwgMTAxLCAxMDIsDQogIDEwMywgMTA0Li4u
DQotIEJ1ZmZlciBjb250YWlucyBlbnRyaWVzIGZvciBtYW55IGNvbnNlY3V0aXZlIGZyYW1lcw0K
RHJpdmVyIGJlaGF2aW9yIHdpdGggSW50ZXJuYWwgUXVldWUgKFBlci1Db21taXQgQ1JDIFJlcG9y
dGluZyk6DQotIENSQyBpcyBxdWV1ZWQgYW5kIHByb2Nlc3NlZCB3aXRoIGRlbGF5DQotIFJlcG9y
dHMgQ1JDIHdpdGggY3VycmVudCBmcmFtZSBzZXF1ZW5jZSAod2hlbiBDUkMgaXMgcmVhZCkNCi0g
RHVlIHRvIHF1ZXVlIHByb2Nlc3NpbmcgZGVsYXksIHJlcG9ydGVkIGZyYW1lID4gZmxpcCBsYXRj
aCBmcmFtZQ0KLSBFeGFtcGxlOiByZXBvcnRzIGZyYW1lcyAxMDIsIDEwMywgMTA0LCAxMDYgZm9y
IGZsaXBzIDAtMw0KDQoNClRlc3QgYmVoYXZpb3I6DQotIEV4cGVjdGVkIGZyYW1lcyhDb250aW51
b3VzIENSQyBSZXBvcnRpbmcpOg0KICAxMDAsIDEwMSwgMTAyLCAxMDQgKGxhc3QgPSAxMDMgKyAx
KQ0KLSBEcml2ZXIgcmVwb3J0cyhQZXItQ29tbWl0IENSQyBSZXBvcnRpbmcpOg0KICAxMDIsIDEw
MywgMTA0LCAxMDYNCkZvciBlYXJsaWVyIGZyYW1lcyAoMCwgMSwgMik6DQogIC0gTGlicmFyeSdz
ID49IGNvbXBhcmlzb24gZmluZHMgdmFsaWQgQ1JDDQogIC0gRXhhbXBsZTogZXhwZWN0ZWQ9MTAw
LCBnb3Q9MTAyLCBsaWJyYXJ5IGFjY2VwdHMgKDEwMiA+PSAxMDApDQogIC0gY2FwdHVyZV9jcmMn
cyAhPSBjaGVjazogMTAyICE9IDEwMC4uLiBidXQgdGVzdCBwYXNzZXM/DQpGb3IgbGFzdCBmcmFt
ZSAoMyk6DQogIC0gRXhwZWN0ZWQgPSAxMDMgKyAxID0gMTA0DQogIC0gRHJpdmVyIHJlcG9ydHMg
PSAxMDYNCiAgLSBMaWJyYXJ5J3MgPj0gY29tcGFyaXNvbjogMTA2ID49IDEwNCDinJMgKHJldHVy
bnMgQ1JDKQ0KICAtIGNhcHR1cmVfY3JjJ3MgIT0gY2hlY2s6IDEwNiAhPSAxMDQg4oaSIEZBSUwN
Cg0KLS0tDQoNCkNvdWxkIHlvdSBwbGVhc2UgbGV0IHVzIGtub3cgaWYgdGhpcyBhcHByb2FjaCBp
cyBhY2NlcHRhYmxlLCBvciBpZg0KeW91IGhhdmUgYW55IGNvbmNlcm5zIHdpdGggcmVsYXhpbmcg
dGhlIGVxdWFsaXR5IGNoZWNrIGluDQpjYXB0dXJlX2NyYygpPw0KDQpUaGFua3MgYWdhaW4gZm9y
IHlvdXIgZ3VpZGFuY2UuDQoNCkJlc3QgcmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo=
