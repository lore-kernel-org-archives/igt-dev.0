Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74EACD343F
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 03:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F77D10E064;
	Thu, 21 May 2026 03:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="adowJEAb";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nFZp72/3";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7F010E064
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 03:15:03 +0000 (UTC)
X-UUID: 3ec4f2ae54c311f1b5a00d44d12bea5a-20260521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XRiKsO85cn+219n6Y3SVUbnztH3Ejx5paRFauaURi5g=; 
 b=adowJEAbK91QTF1FCaKK7E3Wgy3M/nYZDcCKGBHfpGufhio7dLlXHL7YPo9+efS7MhECM70pidKPAGkpokh4r3SAGhRLR6HtfDOhrRLQC18j9FcmaHNLrnbaMvq7oigrBYCe79dTlew4m+//pRKj/m4IJ2BY56/zZsqepLu6lqg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:b85304e0-c883-45e2-b75f-bab923001900, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:1f2a2c22-bef7-463f-902c-5f40f7404c33,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ec4f2ae54c311f1b5a00d44d12bea5a-20260521
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1881209350; Thu, 21 May 2026 11:14:57 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 21 May 2026 11:14:56 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 21 May 2026 11:14:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4ZP+Z3oYaSLWyckiBbgYZfGV2D8CjwFy46Gb6tj6z3023gp08YIlCRWaOU9mPBUo83IHeEdkS/X+qqLlDlDYqYl+htxmfAscSNxc5EmmXDV2ituVSvNY1Uupnatwxl63WSWrg+7W8zkkk31wXg+ZEt9w/Z8sdU+XH79zwh2c1VOReyePn83WCWwFzlcBILdijvUfkHGBDsTsrJZnebf0IzSV8daWItjBnTzvZ0TrARKTaKGj/fAVJAV2xNtdLgUIsq7TciEMkAu9gZFyHLR0lCMOeDkZGypSORJYuXFwmsJWQCh1yQLMQfPxOwWlJlCZeWqa9TEGm5W1DfChe9ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRiKsO85cn+219n6Y3SVUbnztH3Ejx5paRFauaURi5g=;
 b=Wz+6T+70oSNkP0R8LKRyF4l5cisEr0z6JmmK4Tdaqjb9ienujEp5G5wPo3YjEML+jF1Y15megQQy7+8G6Dy6xC+6s/syy3bj8tAD+utjwsEwBGgzSyu/AE8I4dmnyEG/I5HYnULEEuckx+mL6Tvtsca7ZT5C2dABBFN8O2Mwp8lAd/Ap8hVvW5GD6t8vd6SwFOtJOkmUkRvwDWesvgOtlJL3rDzws5SAoNuwdBgQ45rzQOcwSAenQyNgMy9giSj2ctbEEyIxKQHQ+CnNRgKIdMXuhvoUM4ehdpgZGR1uZF+R6B9+2n0fKUJ2n7xO2HE732Rzoj9DU3BcDQM8cMHsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRiKsO85cn+219n6Y3SVUbnztH3Ejx5paRFauaURi5g=;
 b=nFZp72/3BZtpd745g4h0dZdY77XHJccBn9rPmsgUOTMJS+T7T8MgTVxgfcggNBXhkswL/mjMKPFy7OZ+cr5Sh1BpoeMt6ftgprynuWEsq4w488hNit6yyR64/WJ1LcbzKzTeXzz93qXCmAhJBWo8+GLrT5MBCXzUAKw1rQMXWUU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6698.apcprd03.prod.outlook.com (2603:1096:101:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.6; Thu, 21 May 2026
 03:14:51 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.005; Thu, 21 May 2026
 03:14:51 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "navaremanasi@google.com" <navaremanasi@google.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>
Subject: Re: [PATCH] tests/kms_hdr: Skip unsupported formats in bpc-switch test
Thread-Topic: [PATCH] tests/kms_hdr: Skip unsupported formats in bpc-switch
 test
Thread-Index: AQHc6C/wVhCI07v9mk+vM+HDuDsmGLYXA4MAgADMFQA=
Date: Thu, 21 May 2026 03:14:51 +0000
Message-ID: <b7849f2c23d1fa9656b231594dfd1301705f4302.camel@mediatek.com>
References: <20260520080747.3311784-1-jason-jh.lin@mediatek.com>
 <e900ae56-a8f0-4bc3-bf2b-1a05b3a24262@intel.com>
In-Reply-To: <e900ae56-a8f0-4bc3-bf2b-1a05b3a24262@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6698:EE_
x-ms-office365-filtering-correlation-id: fbf8f71d-68b3-47e5-a021-08deb6e71f41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003|3023799007|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: x0Sx7LMNgBkdoYaUsztlFM0MRxgQ1cNLpuWL/kzCsFbaHm0UwLFjBdZngxkQFuV7GfOxDGuKdgIF3VQJ+NY9FE1iQeUcX3BRoM2SQQNQoW7Xx68O+JhVIBueNT0W6gZF2I2TIaTwaO/k/DYhrLVY+pUdcxii9Z2Ekoo4/g/pYBt33k7tBLk4gdzF3Ht+EHns+rJeKJIha1WjiXPcxKFthXR/sXnnfT4QMG11celqaruGjnT2yxdIqzAg0LmqcPjkTLvqiPuPyo9GestFNH7cHz+Ufhg0QdBhBag17xlqPua0nE9qcuV4t57QuYb3vQelBWaLhPQ8Ow4qx+ybJt9+9fV0qt0c/1wlleWUJEO/+YLpU7TFA7qg2wEOERzxlTqdZaDTQYjfOMBlc3PIxzGp5ibaB0m5G1TdvUsIGP17DdGmkF8WVfhYJ3WGnh9xtfinnO7AEYvKeSC/MrX0qVFWofDLqUGdNdpld4ecrPACZy29mU+s1DUWTAr6lRP1xvD8G6t4YVc6+LxrheGpt6PzUeVuj5c8BVlXvpy87IF98DERMetv3w39lwli4/I70jBLHyzdMU3zIorY1jp9+6n5clh67/YGYv03fHeiEFf0nVO1Kbu6T4fHOkP2oAJKKo1vhfzk5uOij0enRMgRyw2tcDrrBtgpwvJUyB/qeL2F3MU/yU06SpoGs1y8aOLo3dRR0UrZkWjHiE/In3APIQ4FWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE1BcmNOY1hITUlwN1pkdnBrTjVmUjhSOHpUazNHMlNqL2RPdFo2RWhRVzVJ?=
 =?utf-8?B?ekVoRzRUUmYzdk1xOXVENzIyUXBocHQ1TFdaVDBUWW5hUzdBY2xhTndaK3o2?=
 =?utf-8?B?bXpjcmRXb1lkQ2g2aXNvMVJkSkthS3Y3VFVHdkFvY05PV2syY0JUNnNuTFND?=
 =?utf-8?B?Ui93cG9XNVhmeFpJMjBxK0RKMkVSdjlGelg5anlwU3E0TVJHOVdvMzNKblNE?=
 =?utf-8?B?YzUyVCt2S0FXeGhNdlc3SlFzU0xvVE5pSUV6NXBUeGcwUW1lRE1mOTZIMXJO?=
 =?utf-8?B?TVk1Y2dZTXNYd3UxLzhVOVNwWTUzQ0hmdVNnUks5Unp5SGVBRHFzdjZZVWQ3?=
 =?utf-8?B?OHBPVUYxUHBTOHZ3QlZvNWVEMDBrR0VEMUtJZkF4YTlrdmxoZ1pjZTJhSlJ1?=
 =?utf-8?B?b2JwQlJLSnVOekdUV0NteUNZbzJqWm5SZHl5YXVYSlRIc3AwMVRIM0tST3NY?=
 =?utf-8?B?M2VPekg4UTFyc2pXYlZrYjlaVEFCUXhEeDJORjlkZ2ZkSm1ZVUc4Z0JKVi9y?=
 =?utf-8?B?cW5BVWd3TzNlZXI0azBTQWlTcDFWa1JZeEduUnhRc0VVRll6aEJrQWk5Y2p5?=
 =?utf-8?B?OG1ueDU5Qk5WSXZQOEJXclpqOHVrTTdBOGhqdloxOFlYSDFyTzRmOVpGTkRi?=
 =?utf-8?B?WWwxYlVTaytNWXlvYnR2MmIveGRpOVU3YVpUZ3NJU25NOU1acURwZVp1NHZ3?=
 =?utf-8?B?Z2R1dXl1SkFoL0NDb2luUjlRUkJta3RPd0VCNnRSdVNCUkwxRmlSOCtTWkpV?=
 =?utf-8?B?TEowekdMMlZEcFVNSlFtR29mLy9ndlZaOG5SSlc1U0hnUGg0ZUpiWURPSU4y?=
 =?utf-8?B?NGVSNytJcHVsQW5NQVBLcE5kSW9aT3ZsMmNpbTdvTEFSWnFVZEdwVFhWQWVm?=
 =?utf-8?B?bFdMOVZJQVd4dlRzcDZRM3NzSncyWFBISEJIeWpxL1VTUy81ZTNhMDdQMmxr?=
 =?utf-8?B?elFId3BXU1lYaU9Xem1ndkttNklYeUdXVURuS3BrNWxFS3B1cnRuL3lLQTNE?=
 =?utf-8?B?K3QvaVFjVWtPWXJJU2VsOGlDWXk3b0tia1BERWtkMDd3UmhLZFhqWktBUW9m?=
 =?utf-8?B?VElpSU9xallHb3dnbEVFNjUrMkV2VjRhT2s4OHRiZHJucnNKZXFhY21seTZO?=
 =?utf-8?B?eTRvTWlMNndHcmpiN25SMFZTOW9KOGZnS3Q5bGhkSjdDYlR0WUJsaEo3K2Jr?=
 =?utf-8?B?NFhtVFlXZWFxY1M1K2Jna0R4dmhNdVNqY1hoTnYrdldNRExtVUtpSDdmUDc1?=
 =?utf-8?B?ZFMzTmNySDM0Y25pYXdQeHF1bytxMXJ0VDhpaDVFdnRuaXJoSHV5M1FRekdO?=
 =?utf-8?B?UiszMlo2emR6N0RteW9lM3c5SEpZa0ZTbFJ5TjZzOU50ZTMvU3ZOOXNQcTlh?=
 =?utf-8?B?dCtIU3MvUmJ1RlAxajVtR2krRzRKTC9weUh6K2dZeEZZZDRDYTZEd0VJWENU?=
 =?utf-8?B?a2tVVCt4MDJ2WlJNTWYraGhQWkJ5V0k0cmNjVnlIcFJDbjBjUzFxemNEWldN?=
 =?utf-8?B?Vy9WYml4ZEwwNmdmczV5RzlNUVJvYmR0ejc2N1VlZHdBWlcyZFV3RGRBMWJa?=
 =?utf-8?B?czJJUG5aSnBGaFRPWkhvOHZqTVc5WVRxWVRLS2UrYUlmbEZiVUNDUUx1UmVo?=
 =?utf-8?B?S1lCMkpseUFGVUNoQXFNYnlsUWJSVVd0TzlnK285bmVTdmZsUFFjbEZsSll2?=
 =?utf-8?B?NG5PQTRLMUM4Y3VFMndoaUdtejVlSXN2UU5SVFlvaXhYYjVwanF4LzNKbktj?=
 =?utf-8?B?MGRGRW02VzZTL0tTcEVHZlRrVnBSb1ROWFdJcWNDTitXZ09HVXErNnY1U1ls?=
 =?utf-8?B?ZU9pdVZMZXBDMEs0MWdRZHBLcXRtV1VFNWNTdXRSSFhYSEN6bjBvWDZOdmZR?=
 =?utf-8?B?ZTRxUlV4TU9tVjNEcFBqaHB2Szdyek5xTG91anpNaU96VTFXQi93Szd5VUFM?=
 =?utf-8?B?MExrSGVETzVrQ3RJZjZEeUdhRDBXOVRKMUM1djBveG1pZzF5OURsRWtKWkpZ?=
 =?utf-8?B?UmxPZWZ2YlRhWXJQUys2aytmWnNKRlc0SmkzdTlwR0RFZVVyYWl3ZEdDVmps?=
 =?utf-8?B?TXErM0FQV2N1T3kzenc0YnZOWWFmb3BvaW9RU1EwalU3YnhUeFR2TlFXUW5H?=
 =?utf-8?B?ZVRoQWhnN1JiSVlFYTRocjJDRndwM0tDNGVGcldHOFl4Yngyc1o1UExoOVpP?=
 =?utf-8?B?RFdpNDA5OS9wU2RWQVdnYURhRExPK1dZVkxJMktZL0NXbE9RK2UxSWFaZ0U3?=
 =?utf-8?B?dHd6UlB6cG9oWFRBSTZkdUI2YkFDZmlOekRLV3Nwd1l1alArc3g3WUJsa0Nr?=
 =?utf-8?B?ODVFS2xLamhuQXgwVjVNbnp6MnJOckI3RjAyV2JBbVJ3bSs1c0JKc3JYd2Fa?=
 =?utf-8?Q?+GEOY34YdOv27c/0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A17EC623ACEC0408B08716A10EEAE3B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: cM0eEGsfXbe9m0Jyz5nfLu23+udgVtPqh/vGX1dEISN3sFxvRwAexKifxj9H7uKVoU+fIShHpmCXnJ9esovPw7nUebx8a0qkKNIomW5kT5i9ZjzrBL4t9GUoECLWtNLfLeDDqqwU90AOeddEG99VJtRceP9ccWlTRaUx33L2LAtXkppC5SMPaW3dGZWPedfVb7BKxE2RZ2CG8zXVH55HJFID9iJHfjfvIND/HDUStfF54MP4yPwIlAXF51yZj2fKesX1lNUcDqOsPlUgzbf6Q5G1v/wJduSpRWT32h4yONU07mBBbP07k/G5480ilVW2s1HL5epjWCFQn2QuSSpOjg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf8f71d-68b3-47e5-a021-08deb6e71f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 03:14:51.0707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+UdyaMPEq5FvTnpWJZF420E1e0PqkcJkJJnpbq2VwT/CHyWxK7NTNZbzeQG3OGXt03fG6p2so1AXbY49EJPodt1wBYJeAFpBKaWmVIn8RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6698
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

SGkgU2hhcm1hLA0KDQpPbiBXZWQsIDIwMjYtMDUtMjAgYXQgMjA6MzQgKzA1MzAsIFNoYXJtYSwg
U3dhdGkyIHdyb3RlOg0KPiBIaSBKYXNvbg0KPiANCj4gT24gMjAtMDUtMjAyNiAwMTozNyBwbSwg
SmFzb24tSkggTGluIHdyb3RlOg0KPiA+IENoZWNrIGlmIHRoZSBwcmltYXJ5IHBsYW5lIHN1cHBv
cnRzIHRoZSB0ZXN0IGZvcm1hdCBiZWZvcmUNCj4gPiBhdHRlbXB0aW5nDQo+ID4gdG8gY3JlYXRl
IGZyYW1lYnVmZmVyLiBUaGlzIGFsbG93cyB0aGUgdGVzdCB0byBncmFjZWZ1bGx5IHNraXANCj4g
PiBmb3JtYXRzDQo+ID4gbm90IHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUgKGUuZy4sIEZQMTYg
Zm9ybWF0cyBvbiBNZWRpYVRlaykNCj4gPiBpbnN0ZWFkDQo+ID4gb2YgZmFpbGluZyB3aXRoIGFz
c2VydGlvbiBlcnJvcnMuDQo+ID4gDQo+ID4gRml4ZXM6IDVkNDY2MjVjZmIyMSAoInRlc3RzL2tt
c19oZHI6IGFkZCBGUDE2IGZvcm1hdCBjb3ZlcmFnZSIpDQo+ID4gU2lnbmVkLW9mZi1ieTogSmFz
b24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIHRl
c3RzL2ttc19oZHIuYyB8IDcgKysrKysrKw0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2hkci5jIGIvdGVzdHMv
a21zX2hkci5jDQo+ID4gaW5kZXggZDUwZjg3Nzg3NzFjLi5jY2UzNGY3MTQ5YzQgMTAwNjQ0DQo+
ID4gLS0tIGEvdGVzdHMva21zX2hkci5jDQo+ID4gKysrIGIvdGVzdHMva21zX2hkci5jDQo+ID4g
QEAgLTI4Niw2ICsyODYsMTMgQEAgc3RhdGljIHZvaWQgdGVzdF9icGNfc3dpdGNoKGRhdGFfdCAq
ZGF0YSwNCj4gPiB1aW50MzJfdCBmbGFncykNCj4gPiDCoMKgCQkJCQkJwqDCoMKgwqDCoCAiJXM6
IE5vDQo+ID4gc3VpdGFibGUgbW9kZSBmb3VuZCB0byB1c2UgMTAgYnBjLlxuIiwNCj4gPiDCoMKg
CQkJCQkJwqDCoMKgwqDCoA0KPiA+IGlndF9vdXRwdXRfbmFtZShvdXRwdXQpKTsNCj4gPiDCoCAN
Cj4gPiArCQkJCQlpZ3RfcmVxdWlyZV9mKGlndF9wbGFuZV9oYQ0KPiA+IHNfZm9ybWF0X21vZChk
YXRhLT5wcmltYXJ5LA0KPiA+ICsJCQkJCQkJCQ0KPiA+IAnCoMKgwqDCoMKgwqAgaGRyX3Rlc3Rf
Zm9ybWF0c1tpXSwNCj4gPiArCQkJCQkJCQkNCj4gPiAJwqDCoMKgwqDCoMKgIERSTV9GT1JNQVRf
TU9EX0xJTkVBUiksDQo+ID4gKwkJCQkJCcKgwqDCoMKgwqAgIiVzOiBQcmltYXJ5DQo+ID4gcGxh
bmUgbm90IHN1cHBvcnQgZm9ybWF0ICVzLlxuIiwNCj4gDQo+IE92ZXJhbGwgcGF0Y2ggaXMgb2th
eS4gRXhjZXB0IHNtYWxsIGdyYW1tYXRpY2FsIGVycm9yLg0KPiANCj4gIlByaW1hcnkgcGxhbmUg
ZG9lcyBub3Qgc3VwcG9ydCBmb3JtYXQgJXMuXG4iDQo+IA0KDQpPSy4NCg0KPiBJIHJlcXVlc3Qg
aWYgd2UgY2FuIHdhaXQgdG8gZ2V0IGZvbGxvd2luZyBzZXJpZXMgcmV2aWV3ZWQgYW5kIG1lcmdl
ZA0KPiBmaXJzdA0KPiANCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xNjY3MTDCoA0KPiANCj4gVGhlcmUgd2lsbCBiZSByZWJhc2UgcmVxdWlyZWQgYWZ0ZXIgYWJv
dmUgc2VyaWVzIGlzIG1lcmdlZC4NCj4gDQoNClN1cmUsIEknbGwgcmViYXNlIHRoaXMgcGF0Y2gg
YWZ0ZXIgdGhpcyBzZXJpZXMgaXMgbWVyZ2VkLg0KDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4N
Cg0K
