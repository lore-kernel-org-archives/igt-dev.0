Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5526CDB479
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 03:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A55210E027;
	Wed, 24 Jun 2026 03:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Baz22CTy";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="H05X/UnW";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA510E027
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 03:56:43 +0000 (UTC)
X-UUID: b34d5e2c6f8011f1b1788b6acf885367-20260624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+k9BrQTQHfXWSIg113LhfKFouMbfn2jqxnIfSN44Mug=; 
 b=Baz22CTyy8Alw4c/rvPLv/A/T2GAQMWlIU+hNeDnwFGGbkqXaTqF6i4np2nKx8FW7+0j8azb9wvxB0o59sJsXgam1zSHg7Jwa+9TSyj1JlaZ7ET26l3jhD2g9y439DrJVk6kNsexQP+1s9cbxQssn3OD3l/uCo37wGrw0SztT4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:ca37db55-81ea-4f84-a08e-be2887df6c57, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:d497b38, CLOUDID:8720c7fc-4e5b-4880-a751-e09c9abb260d,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
 :-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:
 -1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b34d5e2c6f8011f1b1788b6acf885367-20260624
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1890169720; Wed, 24 Jun 2026 11:56:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Jun 2026 11:56:36 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Jun 2026 11:56:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKmJEaip9rw7gAJqGTE9PR0IEOqsYDjx0bF2qNvssOK1yy3vVRAirYf5sSPPaS4InINprWw8j2AOu2QrLAxO2RAlBnicWaJKeHK6yx4IRbfgl3OcYiqhYDBBualrGcb8spTNX99T8yB7ZUV3CELrQrv18yTeriaCt/WqBDfKU0MYK12OCabWffxUEK1ZN8i+Qxw9UIJVHw06OqXP8BGbHLz3DycFjIyuYbb4W89APj5gRnK7ZUTdcmi0Ki2vKzBQ6PZeqPN8jyTTebLdYRqO+p68oXexH316kcHOik1+X+oq+tx5Ue52YBOhCOMGLGMXYA08/J6osx4u8VCdKCY9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k9BrQTQHfXWSIg113LhfKFouMbfn2jqxnIfSN44Mug=;
 b=I6Qp0PkysQ9+AzBj/8iX9+Jo9vAstW6kOgB9Ya4BiD6CPRcobviUEjIez7gOcgp87EDs0QRKGSttZzwUJL/FoCrE6TDlGLHk/XX9gLfY0jpdatnHwbaFSYl70hPYVIL3qbikbPLcxXSnTgj3j6TnUQhaHmF+P9ATEERE4eCZA4ig4a7hDCnR4F/A9vawOxwxjzAHW8t5bCWKrHDg24Ae1JtiF8sELoQxfiVuST09SDPuyra06EG5qvw6GEdTDP8YEL1lJKNylZpm0mgxm5zN6JpneAtxQtE0gKNJgbCyp2PKky7CcWc1zcQzinnz1HaFdiKwLe8olsKWxYI/Pm11GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k9BrQTQHfXWSIg113LhfKFouMbfn2jqxnIfSN44Mug=;
 b=H05X/UnWqGajokgfIxWASA8qXAyMoLwLITJhuv0O/NSoBdCWT05Qyrrbe84y8JJYYHYvvUXM5sTlyE55Lh5H/LRonXYnDv4QkSC58esCf3L30oXhfKNeL+ySYIFRvy0Sb2EbZpmvASDh295esL3Fvuj1HH+PSJ5j44F+uLvmWSA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY1PPF8B545E21D.apcprd03.prod.outlook.com (2603:1096:408::a60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Wed, 24 Jun
 2026 03:56:34 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 03:56:34 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?SmF5IExpdSAo5YiY5Y2aKQ==?= <Jay.Liu@mediatek.com>
CC: "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH v5 1/1] tests/kms_color: Add 10-bit color depth support to
 gamma test for MediaTek
Thread-Topic: [PATCH v5 1/1] tests/kms_color: Add 10-bit color depth support
 to gamma test for MediaTek
Thread-Index: AQHc9ZPZP2mYOD6bKUeDjzvpFhZm27ZNL7yA
Date: Wed, 24 Jun 2026 03:56:33 +0000
Message-ID: <32e14ea13ac8fb61f37e29732724ca511ae9696f.camel@mediatek.com>
References: <20260606090557.8879-1-jay.liu@mediatek.com>
 <20260606090557.8879-2-jay.liu@mediatek.com>
In-Reply-To: <20260606090557.8879-2-jay.liu@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY1PPF8B545E21D:EE_
x-ms-office365-filtering-correlation-id: b59d6524-4129-46be-b854-08ded1a49525
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|3023799007|6133799003|4143699003|22082099003|11063799006|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: B7dz2QR1zzRXUFXX2Zf3d1ErNYecPwkm/ZOn/OmPupimelnZvpipHmjI2yjtblarcBOaMoqPpBZf3gorHRXA9T+fQVj4exE0GtD5CJsb453UX8IWUcpmDz9wrBPUVzdujfAsmD35o58qnhCNAOxj3Yg02bxKho3Df4C+rp59GkCOATaTWTPkMekTiRTq8D9pzdGU8Eqxl4D4yPMwxD1hJ5c2Yjinps9cAAyRO/LV00p8F85sQMAlyUBUyBqGkgVEaogwJPiov9dJwcX5NS2NhUKPp1HLm2yOtbgRwVN8sLBhaW3mcpAeyvH6QRmdCUq1fmbAdSLbbM0a8DseJFUywU8rTVGzbFeU88gr9uKItimhNUM6aV8sPyyKHyrsKYvAtU3mXWRZ7GM/Sl8NoMos3FaoHz9acs27GTzbgAa94IHRaqKMhge7PNXmOGRsivQvwS0K56QP9RbJz0ESGuMm13QLgmAzJxz6XAJMMQbPMhkSzeCHRUbbvrDDjpV/qHrCa+vfP+5JXEhLko2ks1tjGxcGx/146URzrLCWClljkg/bDfaW7YIiJhj0T5kDFwk92wh9CQkh9g4dh+bC2rsd/gLIRbgKS6NAUxonH5wMPWzwdpJAlZs/PuoB5Zs0vri67ON2EMBbfuyi1swoSNbkXrLM7O9zyxYxRzplAL5K+6EnqOU45OE5N5gTJk81Fu0tva8UJl3JXojGS5nczF217kt5f9G7seZZNXho7HyW4yQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(6133799003)(4143699003)(22082099003)(11063799006)(18002099003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkZweHJPZGU5d2doaUxmRm5vU1BYQ0NQclZ5VVNyUWlSQ2Rvb2h3R2hFSTV1?=
 =?utf-8?B?V1RaR3k0ZTd4bVNOUThnd1JDS2pOczdlaENBYlVDa3NScitMMTZxeDVxMnhx?=
 =?utf-8?B?S0FUbm9HWFhNckVsU0x3WkNNYWc0MUJlR2d3a1R6NEFsTE1mNk5LR2hST2Vj?=
 =?utf-8?B?SzZQSUF3aUhTK0w4UUhoVHFRaHQ4aWUvUEoyb1czWmxUK3h6SHlIUCtRd2o3?=
 =?utf-8?B?T1dWeklQbU1kWm40U1dPSjZOWjJ6bUNDT2kwT0M2a21ra0tmeUF3ZzFwQmZB?=
 =?utf-8?B?OS9OT1ZZbHlGN0hWcFg2MU5WUG9DaFcxbDVLdllReWpBVmEwd0ZnZ1VRTUtN?=
 =?utf-8?B?RjZDWGEyUmNMcUNWVXFPN1FtY0kyZk5qUkJXR0lQSHRnOFQ5cWNmQmpybnYr?=
 =?utf-8?B?K1NnRW43ZnRhTFJZUkxub212M0dpMWM5Vnc2dzd3ZFFOZ0hPelpuTWRSb2ds?=
 =?utf-8?B?Rk1QMVh5R2RDZXNyUXhnTlRwZDY0WXR6dEhMeWJJNXd4OHBXS2M3ZkRxSmJQ?=
 =?utf-8?B?R2MvMEdJejRxVG9sTnZWbkdlY2xEQVFpVUlXUTh1MGlhNEdCeU80WWdwVjg0?=
 =?utf-8?B?Nk83bXZKM2xMdzlDU2YwMHpadFUybWtDR3NHV1pGTEtYSjJ1dm5pbmk3U2Na?=
 =?utf-8?B?WWMzeUJZQU5QRzBZMjU2WDRlVHZLcWdEc3hIWHp4djJBNmUxNzk3enJFcFVz?=
 =?utf-8?B?dXMvblg0aUQ1R2RCYjBJdnRQa2JpcWJOTjc2VHhPVXEzNkJCd2ZhNU4zREQx?=
 =?utf-8?B?eENRRHNyTjdwcUt1MmNnTkpCbHd4RitwVHlBa3ZjRXJvY3lMY3lMWDVJanJY?=
 =?utf-8?B?Z1g2VEg5akVTNjBqdVhLNnowclBLQlN6d2IrWlNLK3o0OGxEamJ3OVJxWFNP?=
 =?utf-8?B?WEJKb05JMjJ3QXg1VGt2MmY5ZkFMRGNKVHFlSWtJVlkrVUU5RFE3Q0hIZ3Iw?=
 =?utf-8?B?eE9SN0RrSFR1c25CeG5pdHQycXZtV1FqUklyVEN0SFhlRzFtUGFKTTBYMmdT?=
 =?utf-8?B?TDZUVS9RZjR0UEpSNjdIQWZrcE5uaG9jTUdwcU5OYlI4RDZnQmRYZkpzVXJ5?=
 =?utf-8?B?cGVCRXVwaFZ2S2NwUndnZTBROGZDZDFxcVhveS9MUTRrejA4MmlHbTV5NEVj?=
 =?utf-8?B?Njh4dGhJTUo3VHAxZkNEV215THY1eWw3Tmc5eGpYSnFHdGFXcGs0Szk4b0dq?=
 =?utf-8?B?TzhCTlJKNkdPTkJITnNtcVRQQ09KWlZzNW4rQ3FoNnMwYjJ0dlNhUUNpOHVF?=
 =?utf-8?B?WVlBWk9sQk84S0kxdFRzaXgzdzF4b2FLQXRIZVNGK3M5YktiTzVINnhRSGZu?=
 =?utf-8?B?VU9pRXhYdXJvWHZUSTROd2Q5ajMrbGtGUGhBcVlyMWlkT0dpekV4RjhtLytI?=
 =?utf-8?B?ZDdROWFEVW9LbmF3cWNKVUFGNXJsTzBiUmdwS2N0ODhGYjgxVFhMZDZNNW5P?=
 =?utf-8?B?ZFErK0w4MUt3MDZHLzdvL1FpYXRmUURLbTVzcU4yQk1RclVOMTZYb3ozTGh4?=
 =?utf-8?B?VE0vb3oybjFkR2xhcmFhQXFZOXF2OFBBOTJNU3dEdGc5M21DVjhIUmVGaDho?=
 =?utf-8?B?cTBUQkxGMlBVaHdiemZEbGVaV1N0VzRiNnJ6TXlkdTFQa2haOUQ3ZEVOejJM?=
 =?utf-8?B?VExackhWaVJJSEJBQTFlcUFJT1lyTWhqUHR5VWJUdWg2dTJkVkFLRThoR29r?=
 =?utf-8?B?T25vNXpPVjh2dXBwM2YzNStDWUdld0JGYk9md3A3dEwycDBXT1BtUmRtVTdC?=
 =?utf-8?B?aVZveEdZWFNMOUgrYzN3dGFhK0ZObFgvVjY4OXMyTVJncXdaaENWakZlT1A5?=
 =?utf-8?B?eVBBOGJ5RWc0WXo5a0xvdU1BYnltcmdQTERGSkhaeHFNd1FRRGwrb1FIL2hM?=
 =?utf-8?B?T0hjTUNaK3M4cjdUTncrbDRUVUxjcGxMbzZnUk9ZSTE5SnpjS0Vldi8vSTFS?=
 =?utf-8?B?SFVMT2hKam5Md0JIZFZ1bk1pNWNxT3dSU0JaeDhCNHVCOHpFNVhncVZRVTJu?=
 =?utf-8?B?MmxLRUxodDdiRTRhdTdSc1oyTEladllaTXlQc1FCL0N6L05QQTFNNk5pNTN6?=
 =?utf-8?B?L1dwa1BSQzNIYjRLUDkzVTNTSFN2UEZZTXMxUXFxdG0rbSt4amtydHJpbFZi?=
 =?utf-8?B?T1FaM1NYMUxienBKM1JUd0dDdUh2TDZhTmxHbHRlbjhDbUdOWDFPdzlMbXV4?=
 =?utf-8?B?QW1kUmkxMjdQTjY1WnhCMk5PZWFJcUNXZUVDdjFZYzFBcU5DODNkYnRGUFgz?=
 =?utf-8?B?SFo3L0ZaVHpUSm5ScTVEanRxYTVUa2dqUkpUcXNpYmFieU11cENLL0pOTTB3?=
 =?utf-8?B?Qnd0YzZFbzFyZ25Od21lUTY4RlBZL01EYzlsNkNlakxrbWFxd2gyMitRRXFx?=
 =?utf-8?Q?3P27Ox7cQWc41UIM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B2F6DEDD295044A806CC7E31566C251@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WfGGfPe8a322M3TM9Xt+uvWQBINfy/1eTpqLMBJFdz4RUncUqrnDsLpQEKeNTnqg5WwLzkOAWh9fZUVv/w4ULc1IFhEq/gQKERsiFj+y0S44hlkF726qsVMPDrPg7jycQh18Y++k5FvzONIHL465pY6eF3Kk+Ll/3F1ReLAL2EZBFz7qBRWgGap7gkhkp/7P5m9DupquiUV8/m06NHeTSOzXcnSB7NKFyHzTOPbyviLOcpa6Qcdt21BFghBXqg9sAhzhV+ejgUYcBen1N2WFtKlGMMWsLVDPxiaPrDB97jr8QDIBF/S7vWeB7rbPxMobkumtKisdybxjwjoZbWf/6g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59d6524-4129-46be-b854-08ded1a49525
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 03:56:34.0039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJyW6JNxShBWfBx0dnAvrBe/uFWyb83BGr4c2nt3+CIPmVdYsu7krd+hIx4sBgC1mNrqdvsNAftW4HEcalJ5TTIbWvAnnJwlBhem6X7RHZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF8B545E21D
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

T24gU2F0LCAyMDI2LTA2LTA2IGF0IDE3OjA1ICswODAwLCBKYXkgTGl1IHdyb3RlOg0KPiBNZWRp
YVRlayBkaXNwbGF5IGhhcmR3YXJlIGhhcyBzcGVjaWZpYyBjb2xvciBwcm9jZXNzaW5nIHJlcXVp
cmVtZW50cw0KPiB0aGF0DQo+IGRpZmZlciBmcm9tIG90aGVyIHZlbmRvcnMuIFRoaXMgcGF0Y2gg
YWRkcmVzc2VzIHR3byBrZXkgYXNwZWN0czoNCj4gDQo+IDEuIE1lZGlhVGVrIGRldmljZXMgcmVx
dWlyZSBhIDEwLWJpdCBjb2xvciBwaXBlbGluZSB0byBhY2hpZXZlIGJpdC0NCj4gYWNjdXJhdGUN
Cj4gwqDCoCAoYml0LXRydWUpIGdhbW1hIHRlc3QgcmVzdWx0cy4gVW5saWtlIG90aGVyIGRldmlj
ZXMgdGhhdCB3b3JrDQo+IGNvcnJlY3RseQ0KPiDCoMKgIHdpdGggOC1iaXQgY29sb3IgZGVwdGgg
KERSTV9GT1JNQVRfWFJHQjg4ODgpLCBNZWRpYVRlayBoYXJkd2FyZQ0KPiBuZWVkcw0KPiDCoMKg
IDEwLWJpdCBjb2xvciBkZXB0aCAoRFJNX0ZPUk1BVF9YUkdCMjEwMTAxMCkgdG8gcHJvcGVybHkg
dmFsaWRhdGUNCj4gZ2FtbWENCj4gwqDCoCBMVVQgb3BlcmF0aW9ucyB3aXRob3V0IHByZWNpc2lv
biBsb3NzLg0KPiANCj4gMi4gTWVkaWFUZWsncyBHYW1tYSBMVVQgbWFwcyAxMC1iaXQgaW5wdXQg
ZGF0YSAoMC0xMDIzKSB0byAxMi1iaXQNCj4gb3V0cHV0DQo+IMKgwqAgKDAtNDA5NSkuIFdoZW4g
Z2FtbWEgY29ycmVjdGlvbiBpcyBkaXNhYmxlZCwgdGhlIGhhcmR3YXJlIGRlZmF1bHRzDQo+IHRv
DQo+IMKgwqAgb3V0cHV0dGluZyA0MDkyIGZvciBtYXhpbXVtIGlucHV0IHZhbHVlcy4gVG8gcGFz
cyB0aGUgbGVnYWN5IGdhbW1hDQo+IHRlc3QNCj4gwqDCoCB3aGljaCBleHBlY3RzIGNvbnNpc3Rl
bnQgYmVoYXZpb3IsIHRoZSBMVVQgbWF4aW11bSBlbnRyeSBtdXN0IGJlDQo+IHNldCB0bw0KPiDC
oMKgIDB4ZmZkMCAod2hpY2ggbWFwcyB0byA0MDkyIGluIDEyLWJpdCkgaW5zdGVhZCBvZiAweGZm
ZmYuIFRoaXMNCj4gZW5zdXJlcw0KPiDCoMKgIHRoZSB0ZXN0IHByb2R1Y2VzIGJpdC10cnVlIHJl
c3VsdHMgbWF0Y2hpbmcgdGhlIGhhcmR3YXJlIGJlaGF2aW9yLg0KPiANCj4gVGhlIHRlc3Qgbm93
IGF1dG9tYXRpY2FsbHkgZGV0ZWN0cyBNZWRpYVRlayBkZXZpY2VzIGFuZCBhcHBsaWVzIHRoZQ0K
PiBhcHByb3ByaWF0ZSBjb2xvciBkZXB0aCBhbmQgTFVUIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBKYXkgTGl1IDxqYXkubGl1QG1lZGlhdGVrLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCg==
