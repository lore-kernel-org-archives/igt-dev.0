Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA588F531E3
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 03:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E5710E059;
	Tue, 14 Apr 2026 03:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="nmK7LtlY";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FiY1CF0C";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D5110E55E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 03:11:34 +0000 (UTC)
X-UUID: a0c6572637af11f19a16598d5ca7f8ec-20260414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=7s1oArpHmX5TXv+10OP+ne1mmZlbyfJWm+sQwTK54AA=; 
 b=nmK7LtlYI0qz78u3BmngPyUq1eHVFaAw8+GVoA6/tN/KA+Ub0s1zVwiTG5U2lM9mGT1m+pcGqlJ9cL/Sjxj31kmUK5GUs7oRlcH0610hzNDGM5Uj8MhpEsatmqrrK+6yHxAlhmAWJAGOkSlG6chVzN+Iyy/H21jNdnFN4HyAZBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:8e42235d-3444-49e5-8b40-45f6f7ad1c2a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:85aed424-cb5c-4236-a89a-9a7fb20c9bc4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0c6572637af11f19a16598d5ca7f8ec-20260414
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 243533563; Tue, 14 Apr 2026 11:11:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Apr 2026 11:11:26 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Apr 2026 11:11:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CM7/VvxPzF1Yn4+ubeFAxTmM//exdO93uXcMY29DmkWYe43v3PyZWRGw+TmkBjLJzj2VZ7vVDdxQ1kPKRIoP4BfZPYrlcDpxjw4qetlzjUQuFR11G+PgxMWyWPp+j6AlNd5YsSAK63N6e3Brt5/XZMviAAyO78cCvIyamKN3SFWZxWmjr1EyoBEXjw1v/WySlkPBZzM4GJoGaroyfQN/1Tg2B1EnDhTSDofL3VwjwKm7kb86cWVy3rUSL7ZJCmR51I0GACK1iXhVx0TjpcrQFvbi93hMwVoYvOCLNBjhiQ3nNrSJ3QIJmNus1wdoQNmAgYomALYD3HcH1PbkXaFfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7s1oArpHmX5TXv+10OP+ne1mmZlbyfJWm+sQwTK54AA=;
 b=rf7iqa7fxBQeJho76Va1T1ubTzjQuc0b+v+cz2XFlQ15/xMrNWrSL3qDR5PxCgCP7ZT362BpUHLcv6tOPRNc8CuoORF6Y+zPx07/I1KYYRabA3Tq12Lo0mHyYBNh98lEE+SUD0lguXwqptLl7iX5We0zBVSr/BnaXkzJhBmViP6Lx1+pFeL0/V7uA+a01DM5QySUSliWN02GkAnDhAd4Nr3oo3M75zQpelkNoNaCNenESrVish7YUuI7NV5Tr5gayThbwnD4jbb5OSL7DzyplJ9MIeeFyeIDXXxCbcqbQxRz9To8M1NoQcPuBzhfaAt67SWNnGeZqE9KTEMcqMpnSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7s1oArpHmX5TXv+10OP+ne1mmZlbyfJWm+sQwTK54AA=;
 b=FiY1CF0Cg6fxN2Gp0GS4CL5NSDYg3Lvm+VVQRChn82a35Ehpk2kRKf9GApbmpp57hCuwT7sLPrf0OpfbLGOtQT0VsoIKLoJebsp9kFHOK+YKeiFkfmuUexYbrNbSi7RAhUC7uoql7dIYlwNeXT9VcXn1XbSwpVC+S8HZMeCTNI4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SE1PPF9EBD1952C.apcprd03.prod.outlook.com (2603:1096:108:1::85d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 03:11:21 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 03:11:21 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "gildekel@google.com"
 <gildekel@google.com>, "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Topic: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Thread-Index: AQHcyNH2YxjB3EtuVUiEvZIHanYs6bXYFx4AgAXP+QA=
Date: Tue, 14 Apr 2026 03:11:21 +0000
Message-ID: <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
In-Reply-To: <adjQJE8Ok5K_sNuc@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SE1PPF9EBD1952C:EE_
x-ms-office365-filtering-correlation-id: 5c23fbd8-e557-4bf9-8bf4-08de99d380fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: BLy88NJNPhVe7cXG6/nnGwErNWLwyEwFUZ3Mldj0jWAghgQCzPMJxiVPEifg6nlFcxijPeOgZbNzoUrIdMyrf57xaVEe0yd8U9w3fvgyk8LV9RNaICvnkpyzroNVgynZRSZT65WaJh54kXVoaT9UStz7HZh0wv8h6kq6EfFDThzArlz63Dpm+rW9rk3rK/Md6kyGLM5BCp3MN/UcUe74ywbx1p3ElFepymzB6nAfYg1yyXBQdp33JEQp5fBuf3yWrxIN76nFhK77uqUI4t1g94/MsbYCVmPB9bScX0koNBq4d0yM5fdKqlbyGHBR5zMHIHvEZ3bqi/gpqEZtlrrefNFSoCPHyn5TjD6h9/W8pdduJcl6/7wItzP4YbRwGv/Qdj+vfvO/ZwI7Ki2Fdoz+5B7eScWyrnM+uSBr1VqgwDwsv7a4B5lZVVWqGzNfmvcmLCKqMVz6KnvsonbnDEqMpj+R33bMSPVglfSnzM7C7cxvz3oNiTSFqxIdjPm4Fe6F1yiloTo0qBFnSKCHz06ekJLKdNeIez5lnByd2LfCD9HcwDshCyPtfGwkT60bRw6jqiq4DKBOyMzPhmHH98lJlaDoDcPc298Wft5uWFj0lbEuagqrznhNbPE5H4rMKw/xN+M6LpLU2BzPCs6DrXEkbMrFxtFExmRD06ysfjkaNGfWQYkDHeE62rFca3J6vtWeSmzDXwU7X7BN/owRFmA2xs5Qrg3DiZwAKrubvpYvC/+oFJfAIirqlly+c+5tfDTE9soVrKGgNf+ogeAuYl/PaWkNSfYTIAAy1zc21mXVLpc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2JTVWJobDQ3QTR5LzJkczZqbXRIdWJsdElWMlZhNzlqZkRBZHJ2QTliV3VX?=
 =?utf-8?B?MXdGQTZYUVE0Q0crRVoyT0tWR2hkM251MzNnMHZkZjliVHJLMnNTc2I4enc1?=
 =?utf-8?B?N1BCMHhMNVltZE44MUFiMVNEVmFncEtReVJveXl0b0JQaGhwbUs3Mi9uaGEx?=
 =?utf-8?B?MUpxeklVa2k3K2VtbU9zc3hsdlR2TzVHcDRHZjZpVGw2OER0ZmZJaFpJMm9y?=
 =?utf-8?B?NjdpdzRzZU5xMVNMbkQ0U0hQeWpiRHZ6aVd2UUc4eGVqcmFIQlJWN0lNR1pw?=
 =?utf-8?B?MmlUbTMzK2dISXkrRXFsWU1kb25rVnJyL1VaSnFqdlp3a21FNE1GZG50QUdC?=
 =?utf-8?B?ZWNteGhtTWI3bXZtdFNHMGYyNTdmelljMXcxUFp6M0lHMjFYT2NlZTBPOVpL?=
 =?utf-8?B?dHViSTQyQjd4c1ozb3VIWnQrZ2xBNzZkMEFvRGE3eTF6bDdRSHhCa0xRZ095?=
 =?utf-8?B?WFh1VVdOMGd2eThaeDVTcVZZTmxUU01rcEJPTzBvRGFVb05ZcUlDaGtkL2VO?=
 =?utf-8?B?OUxNYW9KczgrbVl6Rm8xa3M4Q3VzMXZrS2FvTFZSL2pjdzl4QW1US0VPTkU2?=
 =?utf-8?B?MmMwRjEwR2FhbE4vUzZFT0hmcExWaE1HeURzV2d5V0djMUh6a0lNWS9HMHd1?=
 =?utf-8?B?UVQ0WWo1UEVCRGlQZitKQ2I0TDJyMkQ3b2htdkNDblZac3BVZ1hKZDJlRVd5?=
 =?utf-8?B?KzdVTnhicmN5VUhkOHBodm50cjRMSU56NXF0MEZUT1FwalFiSTl2a0lSck0r?=
 =?utf-8?B?YXFsNDNyV3pWdWc5R3cyS3MyWlRNUHZRa2V6cDllbkxybkNNREZQZmhmZ0Zi?=
 =?utf-8?B?UHRWWkxGTUxtaHJkWHRzQUgwVVdlcWJNNGFCWUdQVzdXS3JRVkszaG50bzd2?=
 =?utf-8?B?TkpTdkJwWXpvaUFQRnRQWEdhSEZybFZCeHpPcTFoMDZoakIzc0xsbGkzS25o?=
 =?utf-8?B?OXFLNzE0NUdMV2xOaWJPR0xaSjlEUlB1cXVuQ0x2Lzg5TDVsQTZ2a3dsRUhO?=
 =?utf-8?B?SXVZMm1NT0lsVStFT2hYWHBWN1Y1OTVEMS9yNjFlMHYwNW05Y0RFZGNTK0Rw?=
 =?utf-8?B?S2ZBK1VCaDZVK1gwaHc5V080UUFjaWNJQXNOU2l3OTNQL3cvSWFEaVVxSks3?=
 =?utf-8?B?Z3ZrM0kyc2l5OWFIR1lnRTh4cHExKzJQWEJEMXF3UGthSmdXSmtiZzBYa25o?=
 =?utf-8?B?a216Qy9NOEJUR2M2VU9DZ213ZkplaWlUUXFuRXpnOEpNS0F0QTEwOFJHbUN1?=
 =?utf-8?B?RzVWMExUb0tYR2ttdEp2am5nVkpCVjhIMXFQczRUQmJkbjZvNVhMNFBsTVlY?=
 =?utf-8?B?RkFMdW1WZGpxVWlrNjhHZGk2Y1ZiaXJSL1JlMmp6WjdRWEFGcFNEbjBaNDhY?=
 =?utf-8?B?Qm5yN3FoMzVOTjlpMXZyKzVncTdzcUpNRzhadmhyWXFhY2N2b3dpazBXOEkv?=
 =?utf-8?B?cFozcUJTUXhEM3A5ajVxOStMRXM5Nm55VGtuUUtvb25BTXVGWnk3Ry9jYWov?=
 =?utf-8?B?czNPeGsxK2tObm1zNGJYeStmUUdyZm1yMUtPMWNyVjJldElMbU9ITEZpRU9j?=
 =?utf-8?B?d1FUOFZlaWUvL3FxMmlCQ3JtcWF4QVFHV09TaGlWMVFvZzZtS2RId29NZm5D?=
 =?utf-8?B?cVlPbTNXRnZlZm5LbjZkcEVJemc5VXpEVCtheEdLQXZNWldlQkNGVnd3aDFY?=
 =?utf-8?B?eituTW1SZDRmTUN0YjZKNFJWK09RU3NNenY4L0RMdDgwSm1zOVduWmFDVDFy?=
 =?utf-8?B?REoyaFBQdjBoc3I2aEFZS0R0NXNlMGRwK0tBVmk2Mktxb2pHVXBCZlZzckFm?=
 =?utf-8?B?R2VxZWh2aHdzS2QvUU5XUmZZUzBEaWo0MzN4REZ6dWJ4WDVzSGxyY1VmQnRt?=
 =?utf-8?B?T05xcWllVmw2TUU0SG1uS3NKMWlHWVROeFNQeEFpY0xRTWRsaGNuUjIwRlgy?=
 =?utf-8?B?bG5iT0h6YitrbmIveFBLVk91UGpGT09TMXF4dldUU2VnQlJodCtZbDQ3VlJI?=
 =?utf-8?B?MElHUTVwODZZU1BjZDA1M0R2UGRBVnA4VDcvYmZrQzZKdnZUVnZqamMwMkZw?=
 =?utf-8?B?ckRJTVNqbWtBeUtrYUg3OTA2RWtyaHVsY1VrdEh1NjVBMDJaQ1YzYnVkWW9Y?=
 =?utf-8?B?OU1NeGJtSUN2ZVNsWlMrQWQ0aUthSmYzVUJKdkpZaFdRYXVmSmhvSUVDOGlz?=
 =?utf-8?B?RnlYL21WTkgzVmNUcFhQSHNGaXNrc2NrUXV4THJhWGpKYzVPT2wyeHlhRkxi?=
 =?utf-8?B?dE1wYklPVDY1d1JwM1QvNXR0L0QrSjIvWlpwOFY4ZkpQNXE3R3F0OTZybXZ3?=
 =?utf-8?B?UkNNVWVMVXFNNlEvWG16R0lJNC9GamlsZHh3b2JzQnpSODdITnJaY29SVGds?=
 =?utf-8?Q?pY9bSLcxekwY6dcE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F6E07F9304E2E4396FBBFA84F6694C6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ssMq1+E/IuJOYTz9J5KGY3+gZLmpwBcwOtJUejyXF0Xyb0HoE0Flzqp8o7YHsK2m8/0TLb/cQUrT1AwB88R8NZOtv3DLy/h/qIPFP0dPojuXhToT9d6psmbrmlwwHC9IqAlGM8GGboKmLMkmV6ketDyphS+0Zg4uMFRhJa3dGtV23dJB5u+Z5Geqor9uLKjzPnoTM4RNh+6BQ0y7dHWVOLXE0a0a9bNU/UvRbRP4UFCHwS3CzjkRisA8+r5VRkyD+5VropjjHIjRzUtDCZhzmMU6LzUFNz7ytXKH7xQbfJ+MWvs9dSX0cdl2xt6yPbGhLVvalPBt3852s75FmDTCWg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c23fbd8-e557-4bf9-8bf4-08de99d380fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 03:11:21.4250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7yWSSuY2vntM/pFfoToTHVGvNhbqldvRCKeDxCaUMYSILwRG7AvQ/6TEMNEKmhqBDb0U68tcBSAqkV4gLw/HslqDjN4h/RoP2CpCsODTKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF9EBD1952C
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

T24gRnJpLCAyMDI2LTA0LTEwIGF0IDEzOjI1ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDA2OjA3OjMxUE0gKzA4MDAsIEphc29uLUpIIExp
biB3cm90ZToNCj4gPiBBZGFwdCByb3RhdGlvbiBDUkMgdGVzdHMgZm9yIE1USyBkZXZpY2VzIGJ5
IHVzaW5nIEludGVsLWxpa2UgcGlwZQ0KPiA+IENSQw0KPiA+IGFwcHJvYWNoIHdpdGggZXhwbGlj
aXQgdmJsYW5rIHN5bmNocm9uaXphdGlvbi4NCj4gPiBNVEsgZGV2aWNlcyByZXF1aXJlIGEgdmJs
YW5rIHdhaXQgdG8gZW5zdXJlIHJvdGF0aW9uIGNvbXBsZXRlcw0KPiA+IGJlZm9yZQ0KPiA+IENS
QyBjYXB0dXJlLg0KPiANCj4gSW5zdGVhZCBvZiBhZGRpbmcgdGhlc2UgY2hlY2tzIGFsbCBvdmVy
IGlndCBJIHRoaW5rIHlvdSBzaG91bGQNCj4gdHJ5IHRvIGZpeCB5b3Uga2VybmVsIENSQyBpbXBs
ZW1lbnRhdGlvbiB0byBub3QgaGFuZCBvdXQgZ2FyYmFnZQ0KPiBDUkNzLg0KPiANCg0KVGhlIGlz
c3VlIGlzIGZ1bmRhbWVudGFsIHRvIE1USydzIEhXIGRlc2lnbiB3aGVyZSBhbGwgSFcgY29uZmln
dXJhdGlvbnMNCmFyZSBhcHBsaWVkIGJ5IEdDRSAoR2xvYmFsIENvbW1hbmQgRW5naW5lKSB0cmln
Z2VyZWQgYnkgRU9GIHNpZ25hbC4NCg0KTVRLIEhXIENvbmZpZ3VyYXRpb24gRmxvdzoNCg0KaWd0
X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBDT01NSVRfQVRPTUlDKQ0KICAgICAgICAgICAg4pSC
DQogICAgICAgICAgICDilrwNCiAgICAgICBhdG9taWNfY29tbWl0KCkNCiAgICAgICAgICAgIOKU
gg0KICAgICAgICAgICAg4pa8DQogICAgICAgQ01EUSBzdWJtaXQNCiAgICAgICAgICAgIOKUgg0K
ICAgICAgICAgICAg4pa8DQogICAgV2FpdCBmb3IgbmV4dCBFT0Ygc2lnbmFsIOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkA0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUgg0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKWvA0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEdDRSBhcHBsaWVzIEhXIGNvbmZpZw0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChSb3RhdGlvbiBwYXJhbWV0ZXJzLCBldGMuKQ0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGR1cmluZyBWQmxhbmtpbmcgcGVyaW9kDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICYgR0NFIHJlYWRzIEhXIENSQyBmcm9tIEhXIHJlZ2lzdGVyDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50byBEUkFNIGJ1ZmZlcg0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUgg0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKWvA0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE5leHQgQWN0aXZlIERpc3BsYXkgUGVyaW9kDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSFcgcmVuZGVycyB3aXRoIG5ldyBjb25maWcNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDilIINCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICDilrwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBFT0Yg4oaSIEdDRSByZWFkcyBIVyBDUkMgZnJvbQ0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSFcgcmVnaXN0ZXIgaW50byBEUkFNIGJ1ZmZlcg0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKUgg0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKWvA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFZCbGFuaysxIOKGkiByZWFkIENSQyBmcm9tIERSQU0NCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDihpIgZHJtX2NydGNfYWRkX2NyY19l
bnRyeSgpIOKchQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChNVEsgYWx3YXlz
IHJlcG9ydHMgQ1JDIGF0IFZCbGFuaysxDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFmdGVyIHRoZSBFT0YgY2FwdHVyZSkNCg0KDQpUaGlzIGRlc2lnbiBpcyBpbnRlbnRpb25h
bCB0byBlbnN1cmUgYWxsIEhXIHNldHRpbmdzIGFyZSBmdWxseSBhcHBsaWVkDQp3aXRoaW4gdGhl
IFZCbGFua2luZyBwZXJpb2QsIGd1YXJhbnRlZWluZyB0ZWFyaW5nLWZyZWUgZGlzcGxheSB1cGRh
dGVzLg0KQXQgdGhlIEVPRiBzaWduYWwsIEdDRSByZWFkcyB0aGUgSFcgQ1JDIGZyb20gdGhlIEhX
IHJlZ2lzdGVyIGludG8gYQ0KRFJBTSBidWZmZXIuIE5vdGUgdGhhdCBNVEsgYWx3YXlzIHJlcG9y
dHMgdGhlIENSQyBhdCBWQmxhbmsrMSBhZnRlciB0aGUNCkVPRiBjYXB0dXJlLCB3aGljaCBtZWFu
cyB0aGVyZSBpcyBhbHJlYWR5IGFuIGluaGVyZW50IG9uZS1mcmFtZSBkZWxheQ0KYmVmb3JlIHRo
ZSBDUkMgaXMgcmVwb3J0ZWQgdG8gSUdUIHZpYSBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkuDQoN
CklHVCBFeHBlY3RlZCBCZWhhdmlvciAoSW50ZWwvQU1EKToNCg0KICBpZ3RfZGlzcGxheV9jb21t
aXQyKGRpc3BsYXksIENPTU1JVF9BVE9NSUMpDQogICAgICAgICAgICDilIINCiAgICAgICAgICAg
IOKWvA0KICAgICAgIGF0b21pY19jb21taXQoKQ0KICAgICAgICAgICAg4pSCDQogICAgICAgICAg
ICDilrwNCiAgICAgICAgVkJsYW5rIE4g4pSA4pSA4pa6IEhXIGNvbmZpZyB0YWtlcyBlZmZlY3Qg
aW1tZWRpYXRlbHkg4pyFDQogICAgICAgICAgICDilIINCiAgICAgICAgICAgIOKWvA0KICAgICAg
ICBFT0YgTiDilIDilIDilrogQ1JDIGNhcHR1cmVkIHdpdGggbmV3IGNvbmZpZyDinIUNCiAgICAg
ICAgICAgIOKUgg0KICAgICAgICAgICAg4pa8DQogICAgICAgIFZCbGFuayBOKzEg4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pa6IGlndF9waXBlX2NyY19nZXRfY3VycmVudCgpIOKchQ0KDQoNCg0KTVRLIEFjdHVhbCBCZWhh
dmlvcjoNCg0KICBpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksIENPTU1JVF9BVE9NSUMpDQog
ICAgICAgICAgICDilIINCiAgICAgICAgICAgIOKWvA0KICAgICAgIGF0b21pY19jb21taXQoKQ0K
ICAgICAgICAgICAg4pSCDQogICAgICAgICAgICDilrwNCiAgICAgICBDTURRIHN1Ym1pdA0KICAg
ICAgICAgICAg4pSCDQogICAgICAgICAgICDilrwNCiAgICAgICAgRU9GIE4g4pSA4pSA4pa6IEdD
RSBhcHBsaWVzIG5ldyBjb25maWcNCiAgICAgICAgICAgICAgIOKUgOKUgOKWuiBHQ0UgcmVhZHMg
Q1JDKG9sZCkgZnJvbSBIVyByZWdpc3RlciBpbnRvIERSQU0NCiAgICAgICAgICAgIOKUgg0KICAg
ICAgVkJsYW5raW5nIE4g4pSA4pSA4pa6IEhXIHVwZGF0ZWQgd2l0aCBuZXcgY29uZmlnICh0ZWFy
aW5nLWZyZWUg4pyFKQ0KICAgICAgICAgICAg4pSCDQogICAgICAgIFZCbGFuayBOKzEg4pSA4pSA
4pa6IENSQyhvbGQpIHJlcG9ydGVkIHZpYSBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkNCiAgICAg
ICAgICAgIOKUgg0KICAgICAgICBFT0YgTisxIOKUgOKUgOKWuiBHQ0UgcmVhZHMgQ1JDKG5ldykg
ZnJvbSBIVyByZWdpc3RlciBpbnRvIERSQU0NCiAgICAgICAgICAgIOKUgg0KICAgICAgICBWQmxh
bmsgTisyIOKUgOKUgOKWuiBDUkMobmV3KSByZXBvcnRlZCB2aWEgZHJtX2NydGNfYWRkX2NyY19l
bnRyeSgpDQogICAgICAgICAgICDilIINCiAgICAgICAgICAgIOKWvA0KICAgIGlndF93YWl0X2Zv
cl92YmxhbmsoKSBpcyBuZWVkZWQgdG8gZW5zdXJlDQogICAgaWd0X3BpcGVfY3JjX2dldF9jdXJy
ZW50KCkgY2FwdHVyZXMgdGhlIGNvcnJlY3QgQ1JDIOKchQ0KDQpBcyBzaG93biBhYm92ZSwgZHVl
IHRvIE1USydzIEdDRS1iYXNlZCBIVyBhcmNoaXRlY3R1cmUsIHRoZXJlIGlzIGFuDQppbmhlcmVu
dCBtdWx0aS1mcmFtZSBsYXRlbmN5IGJldHdlZW4gaWd0X2Rpc3BsYXlfY29tbWl0MigpIGFuZCB0
aGUNCmNvcnJlY3QgQ1JDIGJlaW5nIGF2YWlsYWJsZS4gVW5saWtlIEludGVsL0FNRCB3aGVyZSB0
aGUgbmV3DQpjb25maWd1cmF0aW9uIHRha2VzIGVmZmVjdCBpbW1lZGlhdGVseSBhdCB0aGUgbmV4
dCBWQmxhbmssIE1USyByZXF1aXJlcw0KYXQgbGVhc3QgMiBWQmxhbmtzIGFmdGVyIGF0b21pY19j
b21taXQoKSBiZWZvcmUgdGhlIGNvcnJlY3QgQ1JDIGNhbiBiZQ0KY2FwdHVyZWQuIFRoZXJlZm9y
ZSwgaWd0X3dhaXRfZm9yX3ZibGFuaygpIGlzIG5lY2Vzc2FyeSB0byBlbnN1cmUNCmlndF9waXBl
X2NyY19nZXRfY3VycmVudCgpIGNhcHR1cmVzIHRoZSBjb3JyZWN0IENSQyByZWZsZWN0aW5nIHRo
ZSBuZXcNCnJvdGF0aW9uIGNvbmZpZ3VyYXRpb24uDQoNClNpbmNlIHRoaXMgdGltaW5nIGJlaGF2
aW9yIGlzIGluaGVyZW50IHRvIE1USydzIEdDRS1iYXNlZCBIVw0KYXJjaGl0ZWN0dXJlIGFuZCBj
YW5ub3QgYmUgZWxpbWluYXRlZCBhdCB0aGUga2VybmVsIGRyaXZlciBsZXZlbCwNCmFkZGluZyBp
Z3Rfd2FpdF9mb3JfdmJsYW5rKCkgaW4gSUdUIGlzIHRoZSBhcHByb3ByaWF0ZSBzb2x1dGlvbi4N
Cg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo=
