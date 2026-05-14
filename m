Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18258CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 06:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A025E10E367;
	Thu, 14 May 2026 06:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="n7JfsJd/";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WEH7DouL";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C56B10E367
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 06:12:38 +0000 (UTC)
X-UUID: e3c1c9484f5b11f1b5a00d44d12bea5a-20260514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=3Ez/tfXm2cdSR2wN3m4pzyRH7uWR89SugmkQKsg6GOk=; 
 b=n7JfsJd/p+ITDqq39+QimjO1iKqbzHTZpAc00DJ5+T01TTk5ID0TWbPTI4tpJSFyqRABTtarjw95orEQ4wsN96JScPWL/zc60pNIEEhpyrbRI/ZKvmHltLnxONcN+s1UBU7ZeIpqhuAKaqiO7uqXaqb6gB5yldbt0CNQBW/p5Ps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:d4764939-fdb4-4882-964e-b1015dd91325, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:c41614f6-8c44-46d7-a1ca-a9bdc4d4a626,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e3c1c9484f5b11f1b5a00d44d12bea5a-20260514
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 886367442; Thu, 14 May 2026 14:12:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 14 May 2026 14:12:30 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 14 May 2026 14:12:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7N4QQVi0jF7WFWRGH1UliMd4xEBgm/aN/u/CJgt5SNMq1OQDg7bU7U4XdNvJBJude/yO5ciivgdCL2Xh7tQd559d8Impqw55IXSOYyBUvEbg+qZPg91lqFLxAXJ3LCws/2h8jnwvZuM8wVqGW1oQTKeYmekmMhNzbs9JpX2mvRgC8P+bF9Eeun13RFa2Kmkt8RGZp5ilsljV1B7fAMbfj/nks9lrxJtXRvZS1NqnWjJ/OBNRb/O1WMeGCpwPcyWrB3lqbvJPNUmbF3u86QpRc5MoIjUdtatJc/+rUdFc3zcCwmRdQpRinB8dBDIrk6dqgyBOS6/hr/MTnBDwd/bYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ez/tfXm2cdSR2wN3m4pzyRH7uWR89SugmkQKsg6GOk=;
 b=YtoyuBbLGXtZOBNl69uVv1epxSvCUQRCqdVpuhvPDUkGfzu0cjT5SVXNlBVAGQELQ3ld6xqfiI4YWOUVcXrDM31PA5GKejWi2Ip1zDZz0hF3fC0rIWpYY+JQ1Njz4jdvpIlpwSrFhLCrh2kB6mXz58SJQYALav2JUgUaMvQdzeA1iiCRsWs8e4CFF5suz3OnQ1dv4JTBeDoasINNdCuubSQhGtRLLKCdgZ+E8i8dGSjMjpBFkiejUsC66BweYmPIJbm4262VukKLPT0fVenVIGy1Z7IcLVKYwv3N+Ba57wWMbcoq0134OVOAoQaVJ724j7ZqDVKxxI7iDZ4vU9tbsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ez/tfXm2cdSR2wN3m4pzyRH7uWR89SugmkQKsg6GOk=;
 b=WEH7DouLNC69DdYIn8iB5PxTcXWT0Q5PXo9AiMUlOnt6H2yfgIWs31TEo/BJJjkjMw39xpqzBTSUjLfTGG0cu/vszE1Qj4mo6fMXVqrs5rGPFgPAGyqOavQQDpFSztMfmlCoJ7YkuDCgeQeufh+VBcNYKCygX58eizX1bNM/UAI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB8726.apcprd03.prod.outlook.com (2603:1096:405:65::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.16; Thu, 14 May
 2026 06:12:27 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 06:12:27 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_cursor_legacy: relax checks on MTK
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_cursor_legacy: relax checks on MTK
Thread-Index: AQHc3T9WPO821zIkWkayXz+uELypjrYNFsYA
Date: Thu, 14 May 2026 06:12:27 +0000
Message-ID: <bcc30a317c92d2e5d410c536f29b0a82d1c6b9e4.camel@mediatek.com>
References: <20260506100126.9827-1-xiandong.wang@mediatek.com>
 <20260506100126.9827-2-xiandong.wang@mediatek.com>
In-Reply-To: <20260506100126.9827-2-xiandong.wang@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB8726:EE_
x-ms-office365-filtering-correlation-id: e10c6555-2ee5-4901-f50f-08deb17fc5fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|11063799003|4143699003|38070700021;
x-microsoft-antispam-message-info: 4DshJoZYNqNEB09D3XZLwHRvSwxcUIWAmK0e0VtOZsOzRQwH8g5FHB1zSYRwSERfbLM8PCQ2Tuu0A23jvUjqn/j9RYFMPy7mqlm0lff17sfN+hblEcD6mxIVKgKjYh4mRZheV68lPQ0pKZOjVaxvJmR4mDm3EsyLB9XcSgg+5AT85FgkvBQWATm6PCSNhbWQxHTQqgL+qQqSpvxaf470W0bkk2reDkAaA+pWHj31qaid0JnqwJAT0Wtx3bSm+XdYmJEZxEADOIo+7BZJwRjCxuSSqzqPF9nEm1+mv27EZH4vOlA7O/Oo+ly1QSUEA8XwfDNqaDBpNwvyoQ1FC2e8XXfCZooRDcj1UWKwVm4WMaaNy2EuaknqE/l30SKSA8DzAW4az4XPb1AhExCdZF9p2QTWG+vFZEdkruewRAWGoYYdE6Ezl6Bdpb+GDfKh829f8kzwz8iF+XPMJD9RaxX/1EKu0mhZhb8Xi2MdyUyxWGsEZeXDygl6nLgj+BLUvQsStLSOtzfD7uj8A0WilXjKSL3oxhkA1Deqj5vUrhCGdn12TvNrW+ok8/z4kzXUm3/TYTTnUqz3qcHQp9YD87IMcQ0BBCnGyLR6h86EJNr/yEK1cSAOOt2JcVCjJY9Ch1BVqrqko61LbSalH1/O8/2L7wyGIQ1zCzsGgtrAZv3D64jN7lOjbufeoBMvlCIfkhSvyubRT9n+3s0+Dy3ern1p4r+uf746PdLgVl7+GnGqUqBzmP3wAAGNTvRMvgaGbpde
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWFUczFpYk84c01BVURoMlhDN3BjMGRrZFRtUm1rRDdOWlJmYjJwRDJZaHZi?=
 =?utf-8?B?eGJneGYwTDJtVUNBbmJFRWcwVkd2Y2pTTDVkaS9TWHZnd2ZZUDVJU1c3UlZY?=
 =?utf-8?B?L2QwSERpWEllcWNOcTJ3QTNSSkRBOXkrZXh0RitVdi9aUFZpS0trc2M5dXVy?=
 =?utf-8?B?c3hDTnNDVldma2RHZlVidkxyZ2VUOG9jMmRlbi82Vit4ZVBTZTBIazhRQzZ6?=
 =?utf-8?B?MEgwN0VWVyt2eXZQTTVPSVNhUFdFK1Vra3cwM1k3V2NoRWtZdXphTVlxMit4?=
 =?utf-8?B?NTRaTGt6RDJXQnhMRCtCN3JlakpxM05kVVdoa0V0NmRqQmk5UGxpN1BtVGVT?=
 =?utf-8?B?U1Ezc3pkN1FGdXdVa1hHdzV4TXZJQ1NoOFV6WVdJRkYxZStva21ab1FSWWVU?=
 =?utf-8?B?cWR1d1pXTk14c0R2QlV1czZONEFWc0RmSnpqMnFoTkNoQXJPRzdmZUJPN2Jj?=
 =?utf-8?B?RGNuYVFpUUZKYnFBVXpEcVFGZXdFajBBSE0rNUdFREdjbzN5azJrUkJIV2VD?=
 =?utf-8?B?YU13bjhNNU9hOXR6V2QyTHcrcVUxU3B3NWtjTEJOb2t3N3NwT1lVUzZtb2hw?=
 =?utf-8?B?MHY1SUFhSHlBY3VNUW5MVVBONkFkK2Q2T216NENFZ0ZHWW5pWXJCR2xxVnQy?=
 =?utf-8?B?WFpXWUdSRmpCeEJ5c3ZBWEdpZVg2TXdoV1FsQ1JQNGtIZUNKWWY0WlR4WFFV?=
 =?utf-8?B?TGFqblR4UHFhdjl2Z1JaVFBDSzZ6dnJMS2t2SWt4WkV1enNabjBUZXZaWmlM?=
 =?utf-8?B?N1NiaWkrYyt3bERJaWlweGVhTFNROFdTdEYyd1FRb3phUmtLMlN4UC9tR2NK?=
 =?utf-8?B?a2xDOHBvZ0dUeHZ0clpaaDFDcVp0cHoyczJlVjlyQWdETklqTlBpblNpUyth?=
 =?utf-8?B?Q3pNcDQyUGpMVVJ0STA1YXlhU3o5T0ZGalQ2ZnRsaUc5WlRDSGFPU2VuaGda?=
 =?utf-8?B?enR5bTAySzdJR0NYa3dvM2w5TzBmNksreXF2OUZBdVBua3k3UUltckM5UEcz?=
 =?utf-8?B?Wnk5RHd2U25NU0tXZlZvZmN0QlVtOWxydXlDNkRscnMzUXhQbmwwdURmRzZP?=
 =?utf-8?B?bmZHd3BwdDl3aHEvVHZpRGNNRDFyQ3V0Tm14RTQ4TktQQnU0dkFJcW8wNjBn?=
 =?utf-8?B?UTJ1QktydS9vazhsK0tiNk5FT3dmN3MxWmtOeEhLSUl3N0pTUzZEVVBLQ24v?=
 =?utf-8?B?TjRkTmRzWDArS1JkOStoSVpsZG4xRkJZdDVrWjB5UHNNd2tQNFZ4VFJhTGRJ?=
 =?utf-8?B?NEhpaStBTDE5eE5XKzh2R2FaWEhxbUhNcWpLSXVtQ05RWXB4cUFCcUhkdjV3?=
 =?utf-8?B?azlsOG8wam5iNUZVSFRuajFGY0xXTHZpUzFKMUQ4dzNrM0Q1TnlDT3VRbk44?=
 =?utf-8?B?WnRTRFdYR05kSW8xK2pUTUt1aWxJNHNiRHJIUklSM2ZERGhoZkN3Z1dsTjZK?=
 =?utf-8?B?bTFrN1RxVVAybTFCRjRTMzNWUS9CN0ZMbk54L0E4Snprb0M2VG8rSXBBa1FN?=
 =?utf-8?B?QU4vLzlReVlaTDJKTnZOOXdnNWg5QUhPOGdzMTF4Vm9BemJjQ2pPU3JraE1q?=
 =?utf-8?B?MFN3WkgzbFRHWUxDeW5KY01lenBvb0dWNFMxYTRyRjlCVjZzRzJHVGFhS1NX?=
 =?utf-8?B?ZXJjM1ZJMXZHSVowTVJVZVlhWFJkSWI1UjJGWmVjM0tZY0c0VGNsWTV4aUFn?=
 =?utf-8?B?dkZLa1QrWFRjSXZPeTY0R0lpOWJSaGdBKy9TUGEwSHBacUpUSHFKQi9Dcjl0?=
 =?utf-8?B?QXdwT3gxcjBsTU1TOW1OaUFZbk9sMmNkbDhXUVJBVlV6QytWSDU4RlBSNGJt?=
 =?utf-8?B?QzBTeTQ2M1ZQRU15YS9lNGt0dGxoUktNVXVPTElIRG9Ea29nQmpHSkk0eTIz?=
 =?utf-8?B?YjllL2pUVjN6L3Rjd3MwVU1IT2FVZjM5ZjZPTXVGQ3MxTVVmQ016QjFHc216?=
 =?utf-8?B?U0xwSUNxVEZpL0FvYVk4MVNMTTZpdzJBZXpzSEJWQ0V0NXhFUC9VVGoxMU84?=
 =?utf-8?B?TElIRzR3QjFrSWEzNmVnTzdnMHU4TU1JVzE1VkRoSnJ6Q2wrZGo3RHh2U2h0?=
 =?utf-8?B?L3d6MUVzanBoLzJTSTZPMktOcWVHMllmT1JsTUFBdzlta2N4dG11dm5uaTFa?=
 =?utf-8?B?eDlralV6Mm9YQStOM0wxbU95ZGtJYUFxUHc3bmk1QXk5T2g3cUdvL0REUzNu?=
 =?utf-8?B?ZzM5Q2ZjdmtkUTNwZlJ5UEdieTl6cWJQUGcxMjF4UWVpZTdaU0p6SVdjV3cr?=
 =?utf-8?B?N21GemdDVEEwU1NpUWFINmhwa3lwY04vME9NRGJpUWhUVG9nbFJNZ2tKZ0ln?=
 =?utf-8?B?UThoRnpsSnNTU2szSnZyYkU2cXcvbnJBQkEvQnYzVmV4NTY2bElRWWw4NzRW?=
 =?utf-8?Q?fynNxYnXDztelxkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B87AEF6A9FF7B46949D0F75D3496E3B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: M/7Dr9qS5mJURrKwY6LFyeG55VxydpX1OXwhpQpcwIWshx4Q/MtJv7XmjYG6GsZweeEJqWcC5gH53KCJZ2XDZQ5W0CjeXPLBFINqhG6ld2JLoS2jsIrwpWQGX33qVHiPZcQdP8lpgUDSjijA2Z8P+HrnDqq4YTcuenl776FSk23JQad48TRWqO26qVDrJS+ke1Lqr/7xJmwl2gNfvlxaYcm6DgC3jaU6fzCdE52ZwgJ8rd2hiSuWuOu35X3FxjGK3Wr2kKuuOS9ZrpDSHj+AF0BJOH7XzI/Ps4O1iqyhfrgPwZnJtj5PbDYBYzHH+C6Y1/b+ZLQZbgGWWvJENoHyRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10c6555-2ee5-4901-f50f-08deb17fc5fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 06:12:27.3151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ByKFEMzEadYvbqfnaMQ8Lg0fEOuTkkQgsyUWWbWxR0UBA6z12NmUcO3ilBqnnmImvF2rJYUuZ4XVoHMdgU44/mt6mhcaiTV2Ik00M8o6XbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8726
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

T24gV2VkLCAyMDI2LTA1LTA2IGF0IDE4OjAxICswODAwLCBYaWFuZG9uZyBXYW5nIHdyb3RlOg0K
PiBGcm9tOiBYaWFuZG9uZyBXYW5nIDxYaWFuZG9uZy5XYW5nQG1lZGlhdGVrLmNvbT4NCj4gDQo+
IGttc19jdXJzb3JfbGVnYWN5IHVzZXMgdGlnaHQgdmJsYW5rIHRpbWluZyBhc3NlcnRpb25zIHRo
YXQgY2FuIGJlDQo+IHVuc3RhYmxlDQo+IG9uIE1USyB1bmRlciBoaWdoZXIgc3lzdGVtIGxvYWQs
IGxlYWRpbmcgdG8gaW50ZXJtaXR0ZW50IGZhaWx1cmVzLg0KPiANCj4gVGhpcyBwYXRjaCBtYWtl
cyB0d28ga2V5IGltcHJvdmVtZW50cyBiYXNlZCBvbiByZXZpZXcgZmVlZGJhY2s6DQo+IA0KPiAx
LiBJbiBmbGlwX3ZzX2N1cnNvcigpOiBDaGFuZ2UgZnJvbSBpZ3RfYXNzZXJ0X2VxKCkgdG8NCj4g
aWd0X2Fzc2VydF9sdGUoKQ0KPiDCoMKgIGZvciB0aGUgbm9uLWV4dHJhLXZibGFuayBjYXNlLiBT
aW5jZSBpZ3RfY3J0Y19nZXRfdmJsYW5rKCkgd2lsbA0KPiBuZXZlcg0KPiDCoMKgIHJldHVybiBh
IHZhbHVlIGxlc3MgdGhhbiB2Ymxhbmtfc3RhcnQsIHRoaXMgcmVsYXhhdGlvbiB3b24ndCBjYXVz
ZQ0KPiDCoMKgIHJlZ3Jlc3Npb25zIG9uIGFueSBwbGF0Zm9ybSB3aGlsZSBpbXByb3ZpbmcgdGVz
dCBzdGFiaWxpdHkuDQo+IA0KPiAyLiBJbiBjdXJzb3JfdnNfZmxpcCgpOiBJbnRyb2R1Y2UgYSB0
aHJlc2hvbGQgdmFyaWFibGUgYXBwcm9hY2gNCj4gaW5zdGVhZA0KPiDCoMKgIG9mIGhhcmRjb2Rp
bmcgdGhlIHRpbWluZyBhc3NlcnRpb24uIEZvciBNVEsgcGxhdGZvcm0sIG11bHRpcGx5IHRoZQ0K
PiDCoMKgIHRocmVzaG9sZCBieSA0eCB0byBhY2NvbW1vZGF0ZSBsb25nZXIgY3Vyc29yIHVwZGF0
ZSB0aW1lcyB1bmRlcg0KPiBoZWF2eQ0KPiDCoMKgIGxvYWQuDQo+IA0KPiDCoMKgIE1USyBkaXNw
bGF5IGhhcmR3YXJlIHVzZXMgYSBmcmFtZS1iYXNlZCBwcm9jZXNzaW5nIG1vZGVsIHdoZXJlDQo+
IGN1cnNvcg0KPiDCoMKgIHBsYW5lIHVwZGF0ZXMgYXJlIHNjaGVkdWxlZCBhbG9uZ3NpZGUgb3Ro
ZXIgZGlzcGxheSBvcGVyYXRpb25zIGluDQo+IHRoZQ0KPiDCoMKgIHNhbWUgZnJhbWUgcXVldWUu
IFVuZGVyIGhpZ2ggc3lzdGVtIGxvYWQgKGUuZy4sIGNvbmN1cnJlbnQgcGFnZQ0KPiBmbGlwcywN
Cj4gwqDCoCBDUFUgcHJlc3N1cmUpLCB0aGUgY3Vyc29yIHVwZGF0ZSBwYXRoIG1heSB0YWtlIGFk
ZGl0aW9uYWwgdGltZSBkdWUNCj4gdG86DQo+IMKgwqAgLSBEaXNwbGF5IGhhcmR3YXJlIGNvbW1h
bmQgYnVmZmVyIGFyYml0cmF0aW9uDQo+IMKgwqAgLSBNZW1vcnkgYnVzIGNvbnRlbnRpb24gd2l0
aCBvdGhlciBkaXNwbGF5IG9wZXJhdGlvbnMNCj4gwqDCoCAtIE11bHRpLXN0YWdlIHBpcGVsaW5l
IGxhdGVuY3kgaW4gdGhlIGRpc3BsYXkgY29udHJvbGxlcg0KPiANCj4gwqDCoCBUaGUgNHggdGhy
ZXNob2xkIG11bHRpcGxpZXIgKGZyb20gNSp2cmVmcmVzaC84IHRvIDIwKnZyZWZyZXNoLzgpDQo+
IHByb3ZpZGVzDQo+IMKgwqAgc3VmZmljaWVudCBtYXJnaW4gZm9yIHRoZXNlIHBsYXRmb3JtLXNw
ZWNpZmljIHNjaGVkdWxpbmcgYmVoYXZpb3JzDQo+IHdoaWxlDQo+IMKgwqAgc3RpbGwgdmFsaWRh
dGluZyB0aGF0IGN1cnNvciB1cGRhdGVzIGNvbXBsZXRlIHdpdGhpbiBhIHJlYXNvbmFibGUNCj4g
dGltZWZyYW1lLg0KPiDCoMKgIFRoaXMgYXZvaWRzIGZhbHNlIHRlc3QgZmFpbHVyZXMgb24gTVRL
IHBsYXRmb3JtcyB3aXRob3V0DQo+IGNvbXByb21pc2luZyB0aGUNCj4gwqDCoCB0ZXN0J3MgYWJp
bGl0eSB0byBjYXRjaCByZWFsIHRpbWluZyByZWdyZXNzaW9ucy4NCj4gDQo+IFRoaXMgaW1wcm92
ZXMgdGVzdCByb2J1c3RuZXNzIG9uIE1USyB3aXRob3V0IGNoYW5naW5nIGV4cGVjdGF0aW9ucyBv
bg0KPiBub24tTVRLIHBsYXRmb3Jtcy4NCj4gDQo+IHYyOiBSZWZhY3RvciBiYXNlZCBvbiByZXZp
ZXcgY29tbWVudHMgZnJvbSBKYXNvbi1KSCBMaW46DQo+IMKgwqDCoCAtIFJlbW92ZSBNVEstc3Bl
Y2lmaWMgZ3VhcmQgZm9yIGZsaXBfdnNfY3Vyc29yKCkgc2luY2UNCj4gaWd0X2Fzc2VydF9sdGUN
Cj4gwqDCoMKgwqDCoCBpcyBhIHNhZmUgcmVsYXhhdGlvbiBmb3IgYWxsIHBsYXRmb3Jtcw0KPiDC
oMKgwqAgLSBVc2UgdGhyZXNob2xkIHZhcmlhYmxlIGFwcHJvYWNoIGluIGN1cnNvcl92c19mbGlw
KCkgZm9yIGJldHRlcg0KPiDCoMKgwqDCoMKgIGNvZGUgY2xhcml0eSBhbmQgbWFpbnRhaW5hYmls
aXR5DQo+IA0KPiB2MzogQWRkIGRldGFpbGVkIGV4cGxhbmF0aW9uIG9mIE1USyBoYXJkd2FyZSBj
aGFyYWN0ZXJpc3RpY3MgYW5kDQo+IHRpbWluZw0KPiDCoMKgwqAgcmVxdWlyZW1lbnRzDQo+IA0K
PiBTdWdnZXN0ZWQtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogWGlhbmRvbmcgV2FuZyA8WGlhbmRvbmcuV2FuZ0BtZWRpYXRlay5j
b20+DQoNClJldmlld2VkLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+DQoNCj4gLS0tDQo+IMKgdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYyB8IDIwICsrKysrKysr
KysrKysrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pDQoNCg==
