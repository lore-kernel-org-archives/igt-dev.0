Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43011CD4F54
	for <igt-dev@archiver.kernel.org>; Sat, 23 May 2026 06:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02A610E2DB;
	Sat, 23 May 2026 06:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="RThEqmF0";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Q55ITPxE";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891AA10E2DB
 for <igt-dev@lists.freedesktop.org>; Sat, 23 May 2026 06:02:01 +0000 (UTC)
X-UUID: e6769bb0566c11f18dc8c9802ae25ab1-20260523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XOwMHA1EmDN+DBLOHRzesZksWVMVIytvZAyD1vdxOGg=; 
 b=RThEqmF05dsNTbyNjpYtn1zlk45/KlGX2bLku9nEP6q5nkNmFkRpPvGWB52hhJl6t16y63oG8/7vv6HRB7qSc8FieguqdVBubx+SojA75H57+20/OtbNHB58iqXq0xMbetN50IjCepKBsacQICXfiPQA3QdMiuSpf9mmcER+oYg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:1920a343-9680-45aa-9446-6132124f0a9e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:ccc82d1f-023f-4f87-9e9c-6c116c694fb3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
 S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e6769bb0566c11f18dc8c9802ae25ab1-20260523
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1808232735; Sat, 23 May 2026 14:01:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 23 May 2026 14:01:54 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 23 May 2026 14:01:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECMN2SJ1JEdEpb6HmyMCAy0e6LkLoGlQ6PlQ9bPQg+NKqOglK0i+Z2Wh1ex6e6W8ehE4Rnh3CQHYQTZNv2hjYN9l0cpXXvc0/gu4185zMS153+3iIfc+r7GuepFhtXZD+F/AuhN55S+JgVTCTx4ijKq9jouGIysf7SRl6RwdFXlZAfCnPxf1ThVRjnkxjFMWvxPVNuMHPLLYjUsfhHOWLIrtx/gMTw5KGQXuRbOS50dTz/EoywP94DQ1zZkJbMsmsB+bxSZvKV8Qk5L4RdwWdxVG36m2NcItCvq2J01BjkOBy2DAodpbe57Zlhadv1cNe9ozTxZBOEQRngK/1DeeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOwMHA1EmDN+DBLOHRzesZksWVMVIytvZAyD1vdxOGg=;
 b=dZr3ngn3KPaBELbSfsPAP/fEwax3Svk/lq1MU6IfEZXtSQJpv7JK5JkT5veuE4KratFV9D3ijnli7dmmQhZa6CMcHsSUPtbfA1jlTCuSTeW73D6bgY2gk5HF86P5Os9LvGQ5hmD01ndm/ZoP+suZyXyuxRR6txhGCcOviD1lwSBVQ7PpXXocTFEnrArRsdKKHCUzbY6Orbl0nP3I0CqmRvQy6PP4yWgCUXclBfAHzYJXgFLBhLZDEWrjSRcs3CgLxfJY9NjxxqKlxxEnAf4tvAzlCSZOo/6ewRIxfqh2Kp48UL4T4htveEjN9WNiRBXzbIuYkSc/DSOTAVpnKDc3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOwMHA1EmDN+DBLOHRzesZksWVMVIytvZAyD1vdxOGg=;
 b=Q55ITPxEu2pqZfJN1ux7csZtaOaIiQUDkZN4OqZC6DPPr4B5HGmhCxAnyYVPNa0G8orbmoqduRu6IzZhWks3YD7r6lqmhnMEzAtdH4FFLigQYYQ7UBQOE2Gs6UrKaI7qfSmOL6xdkpZjxhSTxvts1qHV6CCd3ZrXGfN3EWkfPEs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8607.apcprd03.prod.outlook.com (2603:1096:101:237::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.9; Sat, 23 May 2026
 06:01:48 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.007; Sat, 23 May 2026
 06:01:47 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "navaremanasi@google.com"
 <navaremanasi@google.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YW7uCAgADdDgCAAH/sgIABEb0AgAD/xQCAAMWgAA==
Date: Sat, 23 May 2026 06:01:47 +0000
Message-ID: <af89358195f2780dd882f339db7198e48543fb50.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
 <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
 <ag7g07pHLWgPViVh@intel.com>
 <988bcdc233564b398a87190cb40489d43ed3922c.camel@mediatek.com>
 <ahCdAq03EHvn3zu9@intel.com>
In-Reply-To: <ahCdAq03EHvn3zu9@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8607:EE_
x-ms-office365-filtering-correlation-id: 1fa2cca7-6d6f-46cb-f1d8-08deb890c678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|11063799006|5023799004|4143699003|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: P2MEZfHwPX9PSTdTYjziAcyy/kjztedsX/iM9e+FzIlZftGdickGyksqgDdbBwcvxpQeTfURZvvFkmpPh/RoGVRWEwKsagFrgoUx+8JgH+/uuhC0SmC8e5De/5/do8MFevPcMXVm+2agl/YmON148RTyZOd6duN4eGBpTTX59M7lpIsdhEfd6INmC4kcJ2QPtgrFnR56ZjVfBfmupkLGmisujPNz2n/T6jp+1csvc0D+gN+95YpHS+/Bxg5Bh+AJ61ti5vtDFXh9mxxV79yLNuLIzOl3IDbzQu0vH23UpxeGcYc+3JvgRw8TmpIe8iX08MuSz/XKJsTtHouf56BV9rtIzOBo0Dty7rSaAHsrR8wG3by1Tsu981RRH+VOdRHwhsEwLg3YMMZ+PKnUFEFj4T5UjdZ5hirt/gTydUaL276HfVPJrP9Dx48MfSyBv6/nQ7bwYcw921Cdf1xajgT4EjWn18H/K6RpBsOrClo6Yvja8317g9S5KRA/85rLMaqFWT1bFazc4XJaKxEuhdx/2aYPq9FN2og5peItrQjH8cLy2e5N0lKsMEQr6HCnp3QQfIU1iN/6CL+6DuSPKR3PkVipgjDLanxh53a2/fSUSzN9N9SQZSJ58Lkf5vn60dHnWWvItLmbBM34zS0xUhLbn5J7Ikjx7R5EY1XMvcsjIgcvGH+OVjPgGofVlhnj4rcIBm3Ed7d6qGL6+yAAVNrHM8Q2m9BfE/JArnS3Qa4aPa+rn+YYrUhuKv+flbcxGZ57
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(11063799006)(5023799004)(4143699003)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2VEYk15M1BRbVhtZS9kcmFNVnZPaitxZCtzQUhrZjVNQUU0Ym5xTW9LODhS?=
 =?utf-8?B?bCtOMGFBZ1RwNDN0UEdwU3VUY1QyLzVBSWRGTldYbm4vK3YydG1DUVByQWpX?=
 =?utf-8?B?VitBeUMvNTZxOTlsMEprdHR4bVZDbDBpTDIzd1F3d1cwcFZOVGZqRWJVWXQ4?=
 =?utf-8?B?U0FmSFFIam10bkwxdDlwbzVIbDdFN0U3SGp5QVl6VHNUYVFZVndXbmN5dTEv?=
 =?utf-8?B?RHd3WXRYM0x5R216Rk9INWVvSm5sZVBmQnFtNjZOalUrWjVIa2ZabCtkMnZR?=
 =?utf-8?B?RzBhR3hsT0xGMTZGVkZnS3J6a09jMHFtRlpsMU9DWjMrZE8vbU83dTZKY0Np?=
 =?utf-8?B?cDllcC9vK2VSMG92QXdDTHMycDRHWmEwV1Y2RzJER1Jjb21OVTAxcm5FbCtw?=
 =?utf-8?B?M0xGUEMvTTZ0dG14d0V4c3pPQmtSTkk5RHhFSEFJa1RzSHczemtNU29UMFhL?=
 =?utf-8?B?cytpZkVVSE84cStFVld5ZHRsRkdFcHNtdlFGcTF5QzVVYTh2QlArNmhMV0Vl?=
 =?utf-8?B?c1FiUjQ3TVcrNXlFbU5YSXpadWNwWFRkLzlHYjNPYjRRdXZQSGpiQjhJck1u?=
 =?utf-8?B?dXRFLzhuQjEwNWNLcEU0STJBbVNyN1BuUjE5eDAvWXp2ODZjVFVlRHFxcGR4?=
 =?utf-8?B?bFNUSkpQOEhTTlpsc01ya0N0Z0MvME5vRlM0WTFjYmF2VkV6STNRb3NMVmU4?=
 =?utf-8?B?UnBKS3d2eGxqZlh6Z3RDVzRGcGFhTllxWkIrYmR2SlVadE5paDNxbXcxdXIr?=
 =?utf-8?B?Y3hrc24yQ3liS2ZWcTMrY1M1Zm5kUXpVU0NMVElKYk8yMGk4VU5PczBlMTFz?=
 =?utf-8?B?ZCtLS20rZ0FvRkxEM3JYMi9ySlBXTURsV2FReDBzMnlZeCtrWnRQc3JuSElS?=
 =?utf-8?B?bWZwd2duZTJJMEtTVkRENHhLVDA0Q2E5dHZ5QVp3MG5WZWJxN1RVYU5QNCs5?=
 =?utf-8?B?OWRheW14Wis0amlSbW00dGp1YXBOb2pBeFBrYmJTYUpRVFQxMU5RSUg3TSt4?=
 =?utf-8?B?Z3UxVHN4blFKY2MydktXeXl3dlJPWXRSYUN4TUxXbzBZWVdqMmtzRGtxRURr?=
 =?utf-8?B?aENkM0FEbW03MzBYdU11cGZYN3doZlRUV1BpcnFzek1ycWpBU1FRdlN0UkhH?=
 =?utf-8?B?M0c0K0ZDeGdZem94MmJOSVNSaFp5STBBaW94SDc1VzZxaVNLTGJCQ3NGa2NL?=
 =?utf-8?B?Q25XS2V6RFlmZnVFRUxiQ0t3bnkrRUtCTnIzSk0wU09nL1FBcHlFWFVURXl2?=
 =?utf-8?B?RTJJemUzUWxtNkM2UXR6L0M1VElUSWI4d3lYOFVZOWI3K09iMnpYM3gwSy9M?=
 =?utf-8?B?VTdzbFBmWmN6Tkd2YTR4bnhmSGIxUm1adDdOalFqZmhIVzZCRVgwd1d1VEpL?=
 =?utf-8?B?ZzhSZ1lSVlpzYnJkZC9ZbTc1TFZYV0VNYzBmelQyOW5SWHlxUHliZTBMM1J5?=
 =?utf-8?B?TUVGTFJxdDlFc3l2UjlnOURJYnZRbjdneTZVV0x3VlY2MXpMMk5FWHEyTXNk?=
 =?utf-8?B?Y1FudmJkcm1ydTJTcGxEUkg0Vy9adGJUVWs3NEsxRUswbzlqMW9uRVhXUGhZ?=
 =?utf-8?B?RGhmYUtERXdCU1pLcndiRkNlL21vUlVibmRrRkVUR25ObDV1UStSYUdQajBC?=
 =?utf-8?B?andrY2oyOGFDUVBvVHdxQU9SQ005YzBESitTeGZoVlBpNTFiZWJrYmhieGxG?=
 =?utf-8?B?TG1ud01WRitUWFN0Uy80OTlaUXFGdzhtcm92V0M3VHBFbDIzWHd2NndCQWxF?=
 =?utf-8?B?bkVhQWRkZU0wRlJSUzV2TG5uYWZjMTNSSkI5QitDQ25UYjZJUlpTS1Y1NHdR?=
 =?utf-8?B?RG9WRmd1b0pqZ1J1Yk1oTHhEbXk4b21Rb2ZxYXhNMmtuYW1nQXlSSWpJd0wr?=
 =?utf-8?B?MldRTFZEdnQyaVBSMnR5UG5walg4ZUNSNjdEeUROQVlGNE14bUJObmJ3VGFh?=
 =?utf-8?B?TDg1bi9YL0tSazMwQjZvV21QUDJnRUsvUUU0eVAxU0J4NjJrNGRaU2JWUXQ4?=
 =?utf-8?B?Zlk3SUtNVUthL1JsSHgxclZnc1kweGpFUHg3aFZFOFM2RjNYSk56VldXSzZm?=
 =?utf-8?B?eGM3V094RVBGL2lRa3poZjhNM2JPb1hlM0E1UTJpSDB2cjFEbEhRNU9zbUdK?=
 =?utf-8?B?ZTVNUWpNR0tkVGJESktMOFBGMDE0N1hRUzlqYWdvS0h5Tm5ndWE2NEQ2R2c3?=
 =?utf-8?B?L0lJUnM0VGpGYkhDMm10T1l4QU55MmFZSzJqUXBOVHc4N3VwWmpDMVVwV1JO?=
 =?utf-8?B?SEhxR1pnR0RPdUNQV0FoN0Y4V2FwR0dhckVVVHZrYVR2UW0vSnFKQTdUMlVO?=
 =?utf-8?B?ZWp6K2hPZDVqNkVrNFV1RU9SOGdEbkx4ZWlqVERHaVI1Nk5VNFY5R1I0VG04?=
 =?utf-8?Q?GQgjBb37jta/OId8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C75033D69BB6F46A4D2D62A4FB06036@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WLc58afKS5H8WwISpQbH5L3AfUH68R0l4lf9QjZfl/ri/cU2EsE31bvD8mFoof6KXJMrCmU64b1puBMpc4R85+dp4+XnARKzVnYZJBP5jzpEjZTkGPy0L1vqjRQoDCht1Dmc15p2WNgpFuqL/3vo88OOHzG1U1afVr1l46zj2414m6fhr4KCWVxqJWg2AlQxVKnZLLzpD8C27YBwyU3kq5bXX9t/+rAJdVWT2m/bnaskqr9dO31G2p/M8TG/7zt5eyRJzLPtZ4HTD144DnQk49Zt1JTBUtftN1+MmmFQSQJXjcAYkuuReJiCJv6s1/xh1rSQEfZVW40jM08VaYpbvA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa2cca7-6d6f-46cb-f1d8-08deb890c678
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2026 06:01:47.7694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nc0U6fr5F+0X60IgWw3oeTfHdrtcmpg2B9TdkOGkJhJ39HHrH71HrxKdPM1Ofr9MXZtTf3n57arMzoEA5h/zgyGIT7FBu0rj8ZdFFbiWhsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8607
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

PiANCltzbmlwXQ0KDQo+ID4gSGkgVmlsbGUsDQo+ID4gDQo+ID4gVGhhbmsgeW91IGZvciB0aGUg
ZmVlZGJhY2suDQo+ID4gDQo+ID4gWW91J3JlIHJpZ2h0IC0gdGhlIHBhdGNoIHdhcyBwdXJlbHkg
dG8gcGFzcyBJR1QgdGVzdHMsIG5vdCB0byBmaXggYQ0KPiA+IHJlYWwgcHJvYmxlbSAoYWx0aG91
Z2ggd2UgaGF2ZW4ndCBlbmNvdW50ZXJlZCBhbnkgaXNzdWUgd2l0aGluDQo+ID4gcmFuZG9tbHkg
fjIwMHVzIGppdHRlciBvbiBvdXIgY3VycmVudCBwbGF0Zm9ybSkuDQo+ID4gDQo+ID4gSSd2ZSBp
bnZlc3RpZ2F0ZWQgdGhlIHJlYWwtd29ybGQgaW1wYWN0IG9mIHRoaXMgfjIwMHVzIHRpbWVzdGFt
cA0KPiA+IGppdHRlci4gSW4gb3VyIGN1cnJlbnQgQW5kcm9pZCBTdXJmYWNlRmxpbmdlciBpbXBs
ZW1lbnRhdGlvbiwNCj4gPiByZWFsLXdvcmxkIHVzYWdlIGlzIHN0YWJsZSB3aXRoIENQVSBkZWVw
IHNsZWVwIGVuYWJsZWQuDQo+ID4gSXQgc2VlbXMgdGhpcyBpc3N1ZSBvbmx5IGFwcGVhcnMgaW4g
SUdUIHNpbmdsZS1DUlRDIHRlc3Rpbmcgd2hlcmUNCj4gPiBDUFUNCj4gPiBlbnRlcnMgZGVlcCBz
bGVlcCBkdXJpbmcgaWRsZSBwZXJpb2RzIGJldHdlZW4gZnJhbWVzLg0KPiA+IFRoZXJlZm9yZSwg
d2UgcHJlZmVyIG5vdCB0byBkaXNhYmxlIENQVSBkZWVwIHNsZWVwIHN5c3RlbS13aWRlIGluDQo+
ID4ga2VybmVsIGR1ZSB0byBwb3dlciBjb25zdW1wdGlvbiBjb25jZXJucy4NCj4gPiANCj4gPiBI
b3dldmVyLCBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIGhvdyB0aGUgMS1zY2FubGluZSBzdGFuZGFy
ZCB3YXMNCj4gPiBvcmlnaW5hbGx5IGRlZmluZWQgZm9yIHRoaXMgdGVzdC4gRG8gcmVhbC13b3Js
ZCB1c2UgY2FzZXMgYWN0dWFsbHkNCj4gPiByZXF1aXJlIHRoaXMgbGV2ZWwgb2YgcHJlY2lzaW9u
Pw0KPiANCj4gSSBkb24ndCBoYXZlIHNwZWNpZmljIGV4YW1wbGVzLCBidXQgcGVvcGxlIGNhcmVk
IGFib3V0IHByZWNpc2lvbg0KPiBlbm91Z2ggdG8gYWRkIHRoZSB3aG9sZSB0aW1lc3RhbXAgY29y
cmVjdGlvbiB0aGluZ3kgaW50byB0aGUga2VybmVsLg0KPiBBbmQgaW4gaTkxNSB3ZSBhbHNvIHNv
bWV0aW1lcyB1c2UgdGhlIHRpbWVzdGFtcHMgdG8gY29vayB1cCBhIGZyYW1lDQo+IGNvdW50ZXIg
KHdoZW4gdGhlIGhhcmR3YXJlIGxhY2tzIG9uZSkgYW5kIEkgd291bGRuJ3Qgd2FudCB0byBkbyB0
aGF0DQo+IHdpdGhvdXQgYWRqdXN0aW5nIHRoZSB0aW1lc3RhbXBzIGJhc2VkIG9uIHRoZSBzY2Fu
b3V0IHBvc2l0aW9uLg0KPiANCj4gQW55d2F5cywgc2luY2UgdGhpcyBpcyB1c3VhbGx5IGltcGxl
bWVudGVkIHZpYSBhIHNjYW5saW5lIGNvdW50ZXINCj4gKHNvbWV0aW1lcyBldmVuIGEgcGl4ZWwg
Y291bnRlcikgdGhhdCdzIHRoZSBraW5kIG9mIGFjY3VyYWN5IG9uZQ0KPiB3b3VsZCBleHBlY3Qg
dG8gZ2V0LCBhbmQgc28gdGhhdCdzIHdoYXQgb25lIHRlc3RzIGZvciB0byBtYWtlIHN1cmUNCj4g
aXQncyB3b3JraW5nIGNvcnJlY3RseS4NCj4gDQo+ID4gDQo+ID4gTm90IGFsbCBwbGF0Zm9ybXMg
c3VwcG9ydCBvciBpbXBsZW1lbnQgZ2V0X3NjYW5vdXRfcG9zaXRpb24oKSAtDQo+ID4gY291bGQg
dGhlIHN0YW5kYXJkIGJlIHJlbGF4ZWQgZm9yIHN1Y2ggcGxhdGZvcm1zPw0KPiANCj4gSWYgeW91
IGRvbid0IGltcGxlbWVudCBhY2N1cmF0ZSB0aW1lc3RhbXBzIHRoZW4gdGhlIHRlc3QgaXMNCj4g
ZXhwZWN0ZWQgdG8gZmFpbC4gSSBzZWUgbm90aGluZyB3cm9uZyBpbiB0aGF0Lg0KPiANCj4gUmVs
YXhpbmcgdGhlIHRlc3QgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lIGJlY2F1c2UgdGhlbiBpdCBj
YW4NCj4gbm8gbG9uZ2VyIHRlbGwgeW91IHdoZXRoZXIgeW91ciB0aW1lc3RhbXBzIGFyZSBhY2N1
cmF0ZSBvciBub3QuDQo+IEFsdGhvdWdoIEkgZ3Vlc3MgeW91IGNvdWxkIGhhdmUgYW5vdGhlciBz
aW1pbGFyIHRlc3QgdGhhdA0KPiBtYWtlcyBzdXJlIHRoYXQgdGhlIHRpbWVzdGFtcHMgYXJlIGF0
IGxlYXN0IHNvbWV3aGF0IHNhbmUsDQo+IGV2ZW4gaWYgbm90IHZlcnkgYWNjdXJhdGUuDQo+IA0K
DQpIaSBWaWxsZSwNCg0KSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsIGFuZCBJIGFncmVlIHRoYXQg
aW1wbGVtZW50aW5nDQpnZXRfc2Nhbm91dF9wb3NpdGlvbigpIGlzIHRoZSBwcm9wZXIgbG9uZy10
ZXJtIGZpeC4NCg0KSG93ZXZlciwgSSdkIGxpa2UgdG8gZXhwbGFpbiBvdXIgcmVhc29uaW5nIGZv
ciB0aGlzIHBhdGNoLg0KVGhlIHB1cnBvc2Ugb2YgdGhpcyB0ZXN0IGlzIHRvIHZlcmlmeSB0aGUg
YWNjdXJhY3kgb2YgdGhlIGtlcm5lbCB2YmxhbmsNCnRpbWVzdGFtcCBpdHNlbGYuIFdlIGhhdmUg
aWRlbnRpZmllZCB0aGF0IGRpc2FibGluZyBDUFUgaWRsZSBlbGltaW5hdGVzDQp0aGUgaml0dGVy
IGFuZCB0aGUgdGVzdCBwYXNzZXMsIHdoaWNoIGNvbmZpcm1zIHRoYXQgb3VyIHRpbWVzdGFtcA0K
aW1wbGVtZW50YXRpb24gaXMgY29ycmVjdCAtIHRoZSB+MjAwdXMgaml0dGVyIGlzIGNhdXNlZCBi
eSBDUFUgaWRsZQ0Kd2FrZXVwIGxhdGVuY3kgYXMgYW4gZXh0ZXJuYWwgaW50ZXJmZXJlbmNlLCBu
b3QgYnkgdGhlIHRpbWVzdGFtcA0KbWVjaGFuaXNtIGl0c2VsZi4NCg0KVGhlcmVmb3JlLCBiZWZv
cmUgd2UgY29tcGxldGUgdGhlIGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkNCmltcGxlbWVudGF0aW9u
LCB3ZSBiZWxpZXZlIHRoaXMgcGF0Y2ggc3RpbGwgaGFzIHZhbHVlIC0gaXQgYWxsb3dzIHRoZQ0K
dGVzdCB0byBlZmZlY3RpdmVseSB2ZXJpZnkgb3VyIHRpbWVzdGFtcCBhY2N1cmFjeSBieSByZW1v
dmluZyB0aGUNCmV4dGVybmFsIENQVSBpZGxlIGludGVyZmVyZW5jZSwgd2hpbGUgYWxzbyBwcmV2
ZW50aW5nIG90aGVyIHBvdGVudGlhbA0KaXNzdWVzIGZyb20gYWZmZWN0aW5nIHRpbWVzdGFtcCBw
cmVjaXNpb24gb24gTWVkaWFUZWsgcGxhdGZvcm1zLg0KDQpXZSB3aWxsIGFkZCBhIGNsZWFyIG5v
dGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBjb21tZW50cywgZm9yDQpleGFtcGxlOg0KLyoN
CiAqIERpc2FibGUgQ1BVIGRlZXAgc2xlZXAgdG8gZWxpbWluYXRlIHdha2V1cCBsYXRlbmN5IGlu
dGVyZmVyZW5jZQ0KICogZHVyaW5nIHZibGFuayB0aW1lc3RhbXAgdmVyaWZpY2F0aW9uLg0KICoN
CiAqIE5PVEU6IFRoaXMgaXMgYSB0ZW1wb3Jhcnkgd29ya2Fyb3VuZCBmb3IgcGxhdGZvcm1zIHRo
YXQgaGF2ZSBub3QgeWV0DQogKiBpbXBsZW1lbnRlZCBnZXRfc2Nhbm91dF9wb3NpdGlvbigpLiBP
bmNlIGdldF9zY2Fub3V0X3Bvc2l0aW9uKCkgaXMNCiAqIHByb3Blcmx5IGltcGxlbWVudGVkLCB0
aGUgdmJsYW5rIHRpbWVzdGFtcCB3aWxsIGJlIGFjY3VyYXRlbHkNCiAqIGNvbXBlbnNhdGVkIHJl
Z2FyZGxlc3Mgb2YgQ1BVIGlkbGUgc3RhdGVzLCBhbmQgdGhpcyB3b3JrYXJvdW5kIGNhbg0KICog
YmUgcmVtb3ZlZC4NCiAqLw0KaWYgKGlzX210a19kZXZpY2UoZmQpKQ0KICAgIGlndF9kaXNhYmxl
X2NwdV9kZWVwX3NsZWVwKCk7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCkFk
ZGl0aW9uYWxseSwgdGhpcyBub3RlIHNlcnZlcyBhcyBhIHJlZmVyZW5jZSBmb3Igb3RoZXIgcGxh
dGZvcm1zDQpmYWNpbmcgdGhlIHNhbWUgaXNzdWUsIGhlbHBpbmcgdGhlbSB1bmRlcnN0YW5kIHRo
YXQgQ1BVIGlkbGUgd2FrZXVwDQpsYXRlbmN5IG1heSBpbnRlcmZlcmUgd2l0aCB2YmxhbmsgdGlt
ZXN0YW1wIGFjY3VyYWN5LCBhbmQgZW5jb3VyYWdpbmcNCnRoZW0gdG8gaW1wbGVtZW50IGdldF9z
Y2Fub3V0X3Bvc2l0aW9uKCkgYXMgdGhlICBwcm9wZXIgc29sdXRpb24uDQoNCldvdWxkIHRoaXMg
YXBwcm9hY2ggYmUgYWNjZXB0YWJsZSB0byB5b3U/DQoNCkJlc3QgcmVnYXJkcywNCkphc29uLUpI
IExpbg0K
