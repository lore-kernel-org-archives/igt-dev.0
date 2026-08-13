Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59291C5AC67
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 05:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8FD10E1CC;
	Thu, 13 Aug 2026 05:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="CJarNT+F";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="oxbWkSnt";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F12310E1CC
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 05:37:00 +0000 (UTC)
X-UUID: fe623ef896d811f1b1788b6acf885367-20260813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=x/tzZHHWWNp7eni+yhfYIGAWnNr079yt4WNhW72bKIQ=; 
 b=CJarNT+FbNq6qVxLMEXj97Wr4mcAfDb/18Hvl+wkKvjXUKK2oiYWO8UiI6CidNKqYT2VKXzsSCoLOlbWyVPNxRFVemfw7xntt58RTF5J59fEC9IaaULadMxAWpkEs+Lpa8wohGtcSG11czMYsTYNuJcbc4b0FaK4Gz0hwTFnhOw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:3e3f02e8-0941-4ef7-9ec2-995d8085cdf8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:540a6de2-71f1-405e-92eb-6802d6af74fd,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|817|836|865|888|898,TC
 :-5,Content:-10|-8|-5|14|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:-1,Bulk:nil
 ,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
 ,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe623ef896d811f1b1788b6acf885367-20260813
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 877583083; Thu, 13 Aug 2026 13:36:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 13 Aug 2026 13:36:53 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 13 Aug 2026 13:36:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxvwaGX2sFhjiEWI4N1yw8rd96T6FnT6viFSEnihvINEz6NXgnBQ+ijnkgzO6MJ2zxpRpfQ7nIJiZujnSTkXT21mv5imBKTD9mju4k/+Qx0/T9Sz5xuO0sDYEBrn7q4ixajb2i4Gz+GAy5/H+Zd76CBQFchxRQiK9G/ETPRZF2kc1R71lvqZUGuRHHU92yPPTg4687UFh+X6S4bMZ7u2bODjoqYYBGlmbuL/q00v+wgVq28K4dlS5yM3iAR+2aOvmm5L6BIk9XzdJlTuiOX90KTvAJibgGkiAYr2Qa/8F6E71SurQnUcwlKp9xTkbPSpMhJymb9FHBIW1CkxFIVucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/tzZHHWWNp7eni+yhfYIGAWnNr079yt4WNhW72bKIQ=;
 b=LIviypPF6AbL084f0xWdRiZUTq2EHsKGMMc3Q/s4aV6ogjOmLGWDSwTy1QN3DvckXivIHekhKWM08mh+rw6KDoZHq1mr1DOdTd7IokIlFh7P5v3PrLGqOUW9No+ojO/JJs+54QKtJ/6mpMirUtIh4QmK2bxmSN8h3otV6hTi6gLxtyGFgS+QlYC8A7hlwOVoxkXHYw+HumPW7dPLOV1n/EH8pY/qCGko0gVsQG1KG3mTPl0eRMhAwlGk26n0/fKfjvDhXjgo8Eue9tgNwunml1u/dsl015vOG8/rvX2iPoURGSALsI+0pi8XEw/TSKF+/fVXMvHQpLFJMhh76WieGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/tzZHHWWNp7eni+yhfYIGAWnNr079yt4WNhW72bKIQ=;
 b=oxbWkSntyg6FJV6nXgGoMCtm8J8wLoqpJIyZL8gLLjt/iXIfzqpTtE+gfLeZCcfs1IcTO7hyziJE2Gox+4XIFfH3rTDV2YSYl3nkL4SsT3nISQSyEicaJXMnVe26xJDOaFBEnzGkdBOvS2WVlGef4jtTHa6yPbITE0lt0fWAhhE=
Received: from SETPR03MB10564.apcprd03.prod.outlook.com (2603:1096:101:316::7)
 by TY8PR03MB10571.apcprd03.prod.outlook.com (2603:1096:405:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 13 Aug
 2026 05:36:50 +0000
Received: from SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791]) by SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791%6]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 05:36:50 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "navaremanasi@google.com"
 <navaremanasi@google.com>, =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?=
 <Lancelot.Wu@mediatek.com>, "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
Thread-Index: AQHdKax+FL+tk0d7V02B9zK2G+VE6rabVsIAgAAhXoA=
Date: Thu, 13 Aug 2026 05:36:49 +0000
Message-ID: <43a2e6d0f6d068ccddf8bd16e64dd22fa99dfb26.camel@mediatek.com>
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
 <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
In-Reply-To: <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SETPR03MB10564:EE_|TY8PR03MB10571:EE_
x-ms-office365-filtering-correlation-id: 02f74d8f-0ddc-491c-3f9f-08def8fcdf95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|23010399003|376014|1800799024|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006|38070700021;
x-microsoft-antispam-message-info: 8w3I+5uaDNXgV/cSki+FJUIJVJdjaYfFV8+T/S06Pg4TM9QC4KUC3k/RY/lFqS4WEyI7QSwuCYSiu6AMYAEgKBjRwpMiZlAfqxOvqmR8QhoBN4pY5hCjF/k13Q07yK5ftUn/CQT7Xmb/RL8n9AwcMQF3S6wC7g+qJlevn+93WdEmp0r/PTPtIa5kF23fPn+z7+vKaYWJgpgaV/DnpZywUZABxW6CTFJ91eXlvlMu/mtkdFtCKhEqPkEgOWHBr09MGMJ0LpQWA9kaSnSpss/yylITuQOHHralzOLsPZ6M1K4OqabYA9oBzZLrXdspO97ajbmpmoIps/gr5vBNKUPdiIBIZ2Y28hsaB/PwRK56+0U3Yu8k+Ywmm1KWfbdiPffWmSF/XESYN9pDLMRsiRmyYEXakGGWl2ocQe0EAM3va8Dvj+xFNSWAJgIfA2yrSc3lukWYq6G3ciimO+ek+QoYkQbvWZdAghZIPQ3wCq9T8fo1tD1TCuThDMjiKvHTXHgVqd46zpau9Jq3jbKRLcDPD93oi2YMttQeLnY0xizRF6i6lLjJf5sUIeOJyEpWfGoSZQFfc/t/H/2E4jjRrECycd2HQmsfw8RC7h76dBa9CwqUuYv1GkOSqTJQuYf/CHJQRdDxBPTcBj4PtmNTYT0sOzq0KCBnlAajcxkvfVoHUZ2kKX9LkD0007B55upe6i6e24/+LMmpRAD5QqCZkJlposSfooplXcmlrzNRJHsdblg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SETPR03MB10564.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVEydWJaMlA0THZ3U1BrN1NxMTJmdFk5Um9RbE9KVm4wYSs3a05HYnZqckk4?=
 =?utf-8?B?OUNiQXduWTluYmRjMUJ4WFRUaitpM1Q5UmdHc0NJTEpML05GWDdEN2VFVVJE?=
 =?utf-8?B?TjlhZEw1ZW9DbE5nbzl6WUVPWkplMHNVUFR6ZVRDTGkydkUzNWpsVWhVcjM3?=
 =?utf-8?B?OTNzcEEzS0hLN2JXMk1ZcENUOWwzMWgzeTdGVkNrVzFEc2ZhRmJrYUY3M3Yr?=
 =?utf-8?B?a2x4Ky9OZkZLM0pJZjNOZ04rbVJsTjVRa2gzdWNrQXBnK2xJUTh6QUhKZW1Y?=
 =?utf-8?B?eGx0bFI2M0FSRHFaQkZVNENXVFdJYWNFaUEraHduVlkwdWV0NU5DUHJxRi8z?=
 =?utf-8?B?UmVhcmlQTnpBUDJ4TCt5NGdERGtHQnh0Rzhob3VpZE5vbk8zNzBqcmxPaXJM?=
 =?utf-8?B?bWFLS3Y0R0l4bnNFY09FZzR4Z3VIU0E5OXBoMFZ2YkZ4emhHVDU5anlSbEQz?=
 =?utf-8?B?dnpQalVEZzB0dmRKOTVaS1ZsbzJNb2FCWDQ0anhTMXc5azdxa0V2bmRWYmQr?=
 =?utf-8?B?WWlmU2d4ODhRUGVCNGEvSGlCTFI1ZzZUdXN1cEV4SUtwMFdiamJJOHVHVGJ2?=
 =?utf-8?B?ZmlzQlFmM08vaFEwREZBUm5kYkNGM1VGOVoxQXdUOWZldHIxS3duY1pudVBW?=
 =?utf-8?B?MmE5MTlTU1dBZDVhdlN0SDlJWTBYL1c0ODY0dllvWmVXdjVDWGhaV3Via2dS?=
 =?utf-8?B?eXpBUmFyN2dHN2lJTm9SWFFJM2JsUjh1M0VhNVI5WjZMTW40bGZXZ1hlUy9v?=
 =?utf-8?B?UUF3WC9jK2prcXlUY2hUS0ZOQkNOUVZCVUppT1dPMnZSaFBXL2w1VG9ZS3kw?=
 =?utf-8?B?VVRzbnZBYlhnVHhXdmZEb3FvUmIyajZCSzRhU1FBY3B3NlIrM3N4YythRkxh?=
 =?utf-8?B?U0xxZDdTdVBBUFV1MHNFWkpGbU5VMGdCajJOWUNqZmtpN2J0ZDVIdEVkV0Rr?=
 =?utf-8?B?ZnZXTWR6YVh3OHYrNWI0UVEyRWQ5Y2dYWVZNV1EvNHJMTSt2NGpzWkFLNHBB?=
 =?utf-8?B?aHhHdVU4czNJWXBKUG1kN205amRLckp4eTB3NlFPUjJ6cGpqSmJqcGVUbGJo?=
 =?utf-8?B?ZVlLaGFPUnVkMkdvUmhaTlR4aWU5cThaV2JrQXVMN2wxUWVxUGVPMVhDY0Fw?=
 =?utf-8?B?WGtlSU5acmpRQ0RmMVlWM1JQa2dhK2EwWkttMVlQOHZzSGluK2hOVmc5Ulh6?=
 =?utf-8?B?SmZrNDBDVXJmRGRyRVlHUGZBa2hjZEdRWGVNR3RNeXU0Si9RR2lBeW5SbWcv?=
 =?utf-8?B?cTk5dUMxNEJCNlFSU2RSUjFPekxDUFpOYXExenA3bUNRb3hwVWpIRWxsMG82?=
 =?utf-8?B?d3NDSkNJdkovOTBqWU1KbWQ4RTQ0ajdSSVdWSE5xY2V5bWVDL3c5WHZkNnJx?=
 =?utf-8?B?aFh0YnRQcUV2dGdkMkdINzlPa0dTQzRrVEVUYXAzbmZxYlpsZURySzFUb1Nr?=
 =?utf-8?B?alFYbEQ1KzBkenkwQjFrand5TXdySGFrSlBWZ3lBRnplY0hqMW1LSGhCdERL?=
 =?utf-8?B?eWdlUThobFRvOHQzNFhrajhnVEg0amFhdk5WU0wxU3lVNXBGQlBRTHFLcVJ0?=
 =?utf-8?B?MWl2STUrZlMzMVExQ2VsT3I2VlRpMmVLU2NCZ0tXakJUYUtSemdBZ0VSbkd4?=
 =?utf-8?B?UUpHeXkzZmlLK012dVdtd2JGbmNiTXcwRUgrS0hSa1VmZytLVXh2cWtmVG43?=
 =?utf-8?B?Qm9YTWRBdmRSQ1BVcFcvOEIwcmVHZ3RqczNPTitFcElPS243WVpVZjMzbzYx?=
 =?utf-8?B?VTg4bHgzY3BuRDhLV3VQYkQrWUNnTUpqUVRnQWQ2NmFTVWNObWJnU2ZyYUdQ?=
 =?utf-8?B?T3pVUzFwTUthM3k3dDVvRTd1eEZUS0d0L004by9PUmpHYWhlWmRVYUxrZ2FN?=
 =?utf-8?B?dWpvdzN4UDVCMHRydE11SG5ma0syRjdTVXdPRkZaZGRGOVo4S3dZVml5UFFU?=
 =?utf-8?B?QXNpcTN5bDZUYmlhQUx2bm9kS2VYelIyR2NsRU9WV2JDTXFma2tuL1R4cXNR?=
 =?utf-8?B?ckxpVDUxc21xOWV6ZDlJYTN6Nk84RUl3TE9xaDlMVDRoUkZKM1lpMVd0Mmt2?=
 =?utf-8?B?U3BzK2l3SDd1cER2TUN6Yk1xbkhMeWFlMUU1MEtCWUNQUmZUa1RoSkF1bG8w?=
 =?utf-8?B?NHZrZnZ4L1B0VUVFNUs5YXZWaU92ejJlOWt6QUc2b2V1OGhPK3Z4WUdoelk0?=
 =?utf-8?B?K2JYVjhwTWRKTEhlM1hteGZJT3g2cmluc0FlZVlpYzFHRUM3dGxjaHpMV2l5?=
 =?utf-8?B?ZkVHbm9ETzZBcmZrVTZBQlI4NGFzL1hheTBUTHZOSnZBZDdSeHFoVDJ6dCtW?=
 =?utf-8?B?UFJKbjZkR3RyN3pUVW9nbmdQcFpQREVyVFBHVUxlb3BEUExyVkJhVTUrcW5o?=
 =?utf-8?Q?SFNBji2nUsgRWzTI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6CC26D134DAF124AA726D701687414C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XYJ+SVkTUd8MILwUQrJiPFPgHfLKnjaoQps3wxOkVJIKQ9KmodWiQEmjYcEqVhjqcmFUg+Ld2DlKrYEaHvyBS9wcYAuJyodZTl1zQGJ2us/sZvuSjjBPwCtmRYJ4mDcqoexPKtYh27lIqp0pnoGySfgI30Qz3oQh+XNNcTzRnx92sX9xJXo9R75kosiVE+Mh6NqMhwhqTyzxIDnWw4DbsPGJ2DFx/OvpOjH6XNBIgX5BKWq4tSD+dOGYu6Si3xbS9U3Ae4FHVGmd+QqDs4jt/zeQ4kMjXSs8OYHRnwgOWCdrgbjB1p4xaNyMdjDHnaFPEMKYmaMDEif2ye9dWPj0Lg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SETPR03MB10564.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f74d8f-0ddc-491c-3f9f-08def8fcdf95
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 05:36:49.9527 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tS4uPIaVRtPrCxsnIFykVk6+unXxcn0PaSaY0ccvrYaYmtM7uBt802o6WVIp4y0BMwG20tC6o90lfR+9pfoY+jFBBTy8a8lfD5g7Pvsm+y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR03MB10571
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

PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmUuYyBiL3Rlc3RzL2ttc19wbGFuZS5jDQo+
ID4gaW5kZXggMTJkZmJmZTFkODJiLi5mZThlZTJhYjI2YWIgMTAwNjQ0DQo+ID4gLS0tIGEvdGVz
dHMva21zX3BsYW5lLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYw0KPiA+IEBAIC03NjUs
MTEgKzc2NSw2IEBAIHN0YXRpYyBpbnQgbnVtX3VuaXF1ZV9jcmNzKGNvbnN0IGlndF9jcmNfdA0K
PiA+IGNyY1tdLCBpbnQgbnVtX2NyYykNCj4gPiDCoCBzdGF0aWMgdm9pZCBjYXB0dXJlX2NyYyhk
YXRhX3QgKmRhdGEsIHVuc2lnbmVkIGludCB2YmxhbmssDQo+ID4gaWd0X2NyY190ICpjcmMpDQo+
ID4gwqAgew0KPiA+IMKgwqAJaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoZGF0YS0+ZHJtX2Zk
LCBkYXRhLT5waXBlX2NyYywNCj4gPiB2YmxhbmssIGNyYyk7DQo+IA0KPiBBbHNvIGlmIHRoaXMg
aXMgb25seSBpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9mcmFtZSBub3csIGlkZWFsbHkgd2UgY2FuDQo+
IGp1c3QgDQo+IHJlbW92ZSB0aGlzIGZ1bmN0aW9uIGl0c2VsZiBhbmQgY2FsbCB0aGUgaGVscGVy
IGRpcmVjdGx5LsKgDQoNCk5vIHByb2JsZW0uDQoNCj4gQnV0IGJlZm9yZSANCj4gZG9pbmcgdGhh
dCwgYXMgdGhlIGV4aXN0aW5nIGFzc2VydCB3YXMgYWRkZWQgYnkgYSBwYXRjaCBmcm9tIFZpbGxl
DQo+IGFuZCANCj4gcmInZWQgYnkgSlAsIEknbGwgcmVxdWVzdCBhbiBhY2sgZnJvbSB0aGVtIG9y
IGlmIHRoZXkgaGF2ZSBhbnkgaW5wdXRzDQo+IG9uIA0KPiB0aGlzLg0KPiANCg0KVGhhdCdzIGdy
ZWF0ISBUaGFuayB5b3UgZm9yIHlvdXIgaGVscCENCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K
DQo+IFJlZ2FyZHMsDQo+IEthcnRoaWsuQi5TDQo+ID4gLQ0KPiA+IC0JaWd0X2ZhaWxfb25fZigh
aWd0X3NraXBfY3JjX2NvbXBhcmUgJiYNCj4gPiAhaWd0X3J1bl9pbl9zaW11bGF0aW9uKCkgJiYN
Cj4gPiAtCQnCoMKgwqDCoMKgIGNyYy0+aGFzX3ZhbGlkX2ZyYW1lICYmIGNyYy0+ZnJhbWUgIT0N
Cj4gPiB2YmxhbmssDQo+ID4gLQkJwqDCoMKgwqDCoCAiR290IENSQyBmb3IgdGhlIHdyb25nIGZy
YW1lIChnb3QgJXUsDQo+ID4gZXhwZWN0ZWQgJXUpLiBDUkMgYnVmZmVyIG92ZXJmbG93P1xuIiwN
Cj4gPiAtCQnCoMKgwqDCoMKgIGNyYy0+ZnJhbWUsIHZibGFuayk7DQo+ID4gwqAgfQ0KPiA+IMKg
IA0KPiA+IMKgIHN0YXRpYyB2b2lkIGNhcHR1cmVfZm9ybWF0X2NyY3Nfc2luZ2xlKGRhdGFfdCAq
ZGF0YSwgaWd0X2NydGNfdA0KPiA+ICpjcnRjLA0KDQo=
