Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60166F30297
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 02:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D886310E1B7;
	Mon, 16 Mar 2026 02:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ix8+HaxG";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="CSklQNBc";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBFF10E1B7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 02:11:55 +0000 (UTC)
X-UUID: 7e38b03e20dd11f1a39cd589f645bc18-20260316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=oEoHIl9p5MLFkciIaJJkp5bJFGB9+jY2pxKjTKtKs5I=; 
 b=ix8+HaxG21N9dKuPOXK9QRhlQM6J872YGRRJKIVAaaNLo+lW37Cj21k616B5DxYsNEYXbUkjyROzpEvkkh9OeZi1fLNk67Jklxhm3e0ne9NFPV8rxK+p4NsR3/fW3IMZ5uuI56lsKxdKZsXCeMbAc4vj42HF5DarAUbpvVMDXAc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:95876c3e-bb97-4354-a528-373ea621c18d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:29dba0eb-3b42-43ec-801b-62c7b12ba70e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|52,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7e38b03e20dd11f1a39cd589f645bc18-20260316
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 262885111; Mon, 16 Mar 2026 10:11:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 16 Mar 2026 10:11:49 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 16 Mar 2026 10:11:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ta/eUpsc8b7zG+LNL1+zIuVcemaXM2XfwUcrgVyqQyJPvPeQW2dnVXV+/04qCvnYEL/Zxmqj5Ex+B6cfzHAQKzmnsdQl9Hu8yxWv6JWwOEKthUg9XCOK+FiFPD3EeUa66s3mLP/vJzkEAAIVY/1xvYGy0njCA8aUwl1M7kkotNKb0vjf0vqJaaXErO6jo7xIW7nmVZ7X7oXl3GfPJQDGUD+shlyQe9w6AwK4DvYOOqRhOiMjqSn34NwS9L7x7SNSiKPyR3wtJi/wOhx+b410kCADjlaupa1rObbiZtjafOW2ThJUEIKCSRUnDWTmuNuyYdxueAYhKISfAO0AiNUqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nibepJRsOM3DzS6MyFFxbufZGcSM9DS4snjMNrxVDRs=;
 b=UoSzL4yIoBx3XtSM1OHBx89yZgzMNZ4S6XdFj40i8W8s8ZsowybEkE0CWGMzkd4ChgtlAIhrg/iyGak0SNq/0mF5zILutl7j+uBis0kb1Zbdt+0hJVqzjOEVQJtGy8gSZz32pKQYYhydOve2iyglaBlZ0WV4MSNhbH7Jzo7AjwBkLCFEvkGW8CoZBBBItdeoKdjBO7gzhT/xquDZ//80eeuZNEAPKmflD21TG/7zBzhC82VGG7sZP/VF8B5JAKyp+6Dx4yOCxUmUo2hAdFGePxW1ElNoUjb2XMfIM/k3YLCS/SPFB9ZlOxP8/3FHneJ6MdF3/5eFgmXc1s/pG8MXyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nibepJRsOM3DzS6MyFFxbufZGcSM9DS4snjMNrxVDRs=;
 b=CSklQNBcasxEeVrqcGCc9wVySXWL1rEbAUK1ErQA4TA1aG4Ys1fPiJXMj/g8HeeF4yU4V6DMSmzmL/IaQAfJLRTt6wng9rSVD51727rEqlUCFRMTYZlStoT6M5V3Fqhqt+NwdY3+1+ciIJ9GaPZb9Y9SkNLcHCAs7zVI8ev0oZg=
Received: from PSAPR03MB5735.apcprd03.prod.outlook.com (2603:1096:301:83::6)
 by TYZPR03MB9670.apcprd03.prod.outlook.com (2603:1096:405:39d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 02:11:45 +0000
Received: from PSAPR03MB5735.apcprd03.prod.outlook.com
 ([fe80::fbb0:b153:ae19:807f]) by PSAPR03MB5735.apcprd03.prod.outlook.com
 ([fe80::fbb0:b153:ae19:807f%6]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 02:11:44 +0000
From: =?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "Gil
 Dekel" <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggaS1nLXQgdjMgMS8xXSBza2lwIGttc19mbGlwIGNh?=
 =?utf-8?Q?se_for_mtk_driver?=
Thread-Topic: [PATCH i-g-t v3 1/1] skip kms_flip case for mtk driver
Thread-Index: AQHcsb9QfUP3HdTSuEiC1SJGGb8vs7Wq5kSAgAWKk5A=
Date: Mon, 16 Mar 2026 02:11:43 +0000
Message-ID: <PSAPR03MB57355CF396D54FCF4DEAD3778640A@PSAPR03MB5735.apcprd03.prod.outlook.com>
References: <20260312012507.23682-1-xiandong.wang@mediatek.com>
 <20260312012507.23682-2-xiandong.wang@mediatek.com>
 <20260312133359.v2762oikzujy7enr@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260312133359.v2762oikzujy7enr@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5735:EE_|TYZPR03MB9670:EE_
x-ms-office365-filtering-correlation-id: b96d7295-87ca-44b1-a75b-08de83015eb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: S7rUg1E6IB6rYAXzgMcMrlTFCQIlHr6C3qLBQsGWEWIaR/KSTia4sV2T4hDqeoYAzuSYj3o+Fhruo2ef9FePtzf2VFw/ue+YIiPVA7+QqgY7Fcy23XTo1UL+b5Ohg5gu4Tv0JjDikeUL5Ehq8zeMNurHblPfY+RuVIkXGE2dOv0+ziks89lKJJQTLRMGYVnKeimT05yLVlwm3UwAobGnD6fGff3jzW723Lil1HVPf5mxIB3AmfTq74DchD+nENmXAD5sEmuXUIJJGGrl0jJv8JDxxY1I7hlaEDM6L4XB5pT1dCenxmDm8641RjDedzdMzj8QsUEdji8DAp5LLD08/pdOzvtpTm4aZOl9xhOu8TC76nL9tRB+tJw5vy4yV5mXOfQc/Uc3AKUDlZl/z6tgq/au0JwkH7V0teDATkTQut6ie2huGPaUq6NpO1Yzg2pPuOFb/mNirAzIsz8HpDsgaUUw9btQyFBEOIS8Mpuvc+6mPBFZkJXJmNH01QcMp9BkOlc25e1ws6eJZNJCEXZrh69Q486rQ+JX/3xMOBqg+8XiZ1f0MaPO1mjM1sgtv0ZhoKtDjnfupSKp48gL1Yoq+xZc1DWimtWGtd8kZGehgUMtXoQhsBU1xsnbNpZJ8R3RQC3+q3PQXfTPvQTCWS88cOhjaOO3+gu/is2EL7YXy4xKwkWOsvwBlUhG66CR52rjyQi8bvaQXzG0ze9KtlNxtVkUWuqftmXfCyALTeBG2M3umtRq5H6cgZci/CP3WS9Mb0FAnVfCfWuHsP4hTd5KajEK41AqSsAqH4A/xQC1i4Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PSAPR03MB5735.apcprd03.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDJ4bWVHR1NQNVJFTG94NUZIQjZKTFpzRTVsN2diK3UzR0htM3VBNVUzNjBp?=
 =?utf-8?B?MkN2RkZlcWFDWW1IMWVWRGFkL29LbzRLNTlvYk9JVWFxQzhyaEJvRHBhM3NN?=
 =?utf-8?B?SUJ1ZzNUMTBGYUp3M2cySDFIVU1Vemh0S0taQk1FclBZYzRLdzhWUk9PN0tF?=
 =?utf-8?B?MG12MjVwa0toK3ZRN1pINURGSUR2QVFRamdXb2htV2lZWExHVTNLK3RZQ3V4?=
 =?utf-8?B?UEtBQjE1VHVTcVlxb241RDRlcUlzZ0VCUmFWanJEYzZXdHN4WDVnQ2xPTzFX?=
 =?utf-8?B?bkV1UU1YS0JYYkNVcFR2ODhHUldkc08xQk9mbzJYSEVmQmI3MnArdWFFV0V6?=
 =?utf-8?B?Y2pMdWlLVjVtK1lvaWhKd1p2eXN0OS9yRVBRdEJXZUFOdUZzR21teklsSldH?=
 =?utf-8?B?YkV6S3NNakMxNGFLQ2pobGlJS3BSSzMvRXp3eFRMbk1FVDJtYS9uQnNqSHo5?=
 =?utf-8?B?WkhUNU5vTXZnNDBDUmNHS21mbGExTDU0KzBaNUhnRkF0V0JyM1RnK2xEcVdr?=
 =?utf-8?B?cmdBa2J6S2VOdDNBVW1oTVIyUUxZS0xhTVZhSXRRSFlFZzFwSS9vbDBJdm15?=
 =?utf-8?B?SmhyUU5VbTh5eTI3cHBLSjl2TmJTc1BwWmNaT1hRMDlUNzQveWl4UXVjaWFs?=
 =?utf-8?B?bHIvQ2NEbURoa05paCtQOUZ5b2NDc1F1WDhpayt3bmtPQ1RGRzB3VFdHWmN2?=
 =?utf-8?B?VHBNT3FQbUpJNnJWdDJ0b282bktxeXE2bGJMY3RaWTExNEVDUTBqck5TSGdQ?=
 =?utf-8?B?OU94UnUxNUdCbGQyNDJoemdVSkFKRDJ0cGppV3JCSDhIS3NCbUx4Uk1JdFZQ?=
 =?utf-8?B?d0xUSVVKbnFMQjVRaXZlM0h3cEdnMWQ1d2lhZHpDZTVMenlDdmN3ZmJVbkVp?=
 =?utf-8?B?ZFgya1R6OXZ5NXJ5ZUtZdVRWbzU1dFAzdTJ5KzVnZm43UFZYU1VqTVgvb3ZD?=
 =?utf-8?B?RFlrKzlCd2hoa0Y1WkRYQnUxTGYzakRiaWRZUXpPWHhRempmb3BFaXlNMkh3?=
 =?utf-8?B?ckQ2dHhrNXpocmluM1k5dUhwLzJ6dnJIaGtGanppdFR2ODdHZTVLWTVQQmZo?=
 =?utf-8?B?ZW1IV3ZWY3ZVWFRRSjY1Z2VpRlRyVEpkYm1Tbnk0VTdhZnhBU3lmOXorYStL?=
 =?utf-8?B?T2poZWFEemY1c1UxUG1iRm1laEQ4SU4weUd4ak1oSWk2VHdERCttU21WL3li?=
 =?utf-8?B?UmoySGdzN29mY2ZSc0ZuVVBqaUoyY3N0dVJHOEpyeEJUYXU1VVVsVmlLRGhN?=
 =?utf-8?B?WU5iUlg2SmVsYUFFeVhad29sbmVPNHd4NlhWOEVtS1BFdUpxbFV1RFVVaUMw?=
 =?utf-8?B?azZTR1lxaG1yR3JmaUVVZHEvdW5RcHF5VTlXSHZkemhrcjc3cWVjcnZPQ2pP?=
 =?utf-8?B?QXVMbW1tbGEvdCswZklWN3R4bmp5NU8yeXN0b2hXQ0E4MmY5dlFRYWxKNWp3?=
 =?utf-8?B?QkpjcGJ0Vy9VVlQ4SU4rUHA4cDFVVmJMZUJNTlRLemlWK2lTSmFmRXNDNTBO?=
 =?utf-8?B?UjhJeTJDS3BQbTk5b0ZjNUZybjVlMkpqY3pPTVhLK0piZTBkTys5VWJ1Y1lj?=
 =?utf-8?B?MWEvQm1hRmJuMnE1bXA0ODdKVHF4RzZNYVh6MWZRLzdMOGorNnpzb1JnbTBP?=
 =?utf-8?B?bDBJeFV3eW5ra3hOR1Z6WmZtSGhKTk9FcC83eWY4aElMaWhaQmVSWENKQVpL?=
 =?utf-8?B?NlpTVE0rSXRmVHRIcHdRbFNYRzJUVzdCaWZXWVhwMENFenNndTM5MlRaRGIv?=
 =?utf-8?B?bVV1b1RSS0IwejBUWDcyQ1FsV0lLTHY5dFp2bHpid2xaTlVYSkJiM09CQjJj?=
 =?utf-8?B?WUtiSEF1cko4dldUaEN2UUhzVVNOelZPdk5PbmNMM0pTZDA0eFJyeWxINUc4?=
 =?utf-8?B?dytkTm0wajk2eEZSVHFtUGl3RG44S0d2TXdEQVA4RU5rS3hHNlk3TEk1cm9U?=
 =?utf-8?B?cUVqamZtTk9nSnNOVnc4NVI1N2trVVhWMjdiS21XR0tsdXdQaEY4a3M3cjRp?=
 =?utf-8?B?UkNsNkhhU0NuU241WEs4R1BMMld5eFpmT28rZmM2cFBGQTV4MjZ5MG1kUnN5?=
 =?utf-8?B?eEsreGEvZmVaZitqYnAxSVZtbkl2Sy9rcjBCOTltRmhLNnBQbkNLbVJwVmFt?=
 =?utf-8?B?S01hZ1NPWVZsUk1zYkkxUnVLYWhzd3JtWlNpU3U2SThaSWpQVmcwYVZvVXIx?=
 =?utf-8?B?Y2VNU0V2MTVhRmEzcW1UZDFGbUJrVjNmUWVoTC9jb3cxb1phcWZMTGQzbG9T?=
 =?utf-8?B?YnF6Z0hhNlJobFFqZUxQOGNMc1Jlc2x5K2w0ZWlqaFVXcytrQU9OVlYwUnVD?=
 =?utf-8?B?YW8zRllCeTlKeDhnU1AybEQ2RnNpclN5RWVoM2R4ZnJhWkZpTElqZz09?=
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GtDMhLcGdn2QKkUU/qdNy/0WBmWsC2tvooxaT5cMpu3Fev3fi8z6psIxt47mPita6N3AzwiaEmAqDDiX6Ppk3d37gTfpkRcSqI0wu/Dr6EvmFn5n/fBbyDn7H+Tj3r2o7W/ghr0W0WJWMUseVlzdz/msMMiKaOdWBsNUo1QbaJ93zkXGQI9MraU3IJSJdgfESoybqncIi+Zmrr5iK18VAj2Q6Ip4kWUEvVRcs6tgdb/w3xGpVJb9e9VXhcTF35Yu18zwTo7lzYacubmIiogXjmrzSgi6RwfXDrj3WbHa4xy+3zTYJw3eGC+50F2U2hRkFf4w3b6OMZUV8A3dNMVklA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5735.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96d7295-87ca-44b1-a75b-08de83015eb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 02:11:43.9953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPUtQ9NzU0b1YHCDxeupLCiJGXWH8n/hWFnNYrcTrUPE5xPW5uToam/kXaE+H5psqQpPBMEw/0dbF3WcPYoPTPzHHvJQj6sLVEeH930nDwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9670
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_009_763702943.1768111295"
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

--__=_Part_Boundary_009_763702943.1768111295
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBLYW1pbDoNCg0KVGhhbmtzIGEgbG90IQ0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrl
j5Hku7bkuro6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNv
bT4gDQrlj5HpgIHml7bpl7Q6IDIwMjblubQz5pyIMTLml6UgMjE6MzQNCuaUtuS7tuS6ujogWGlh
bmRvbmcgV2FuZyAo546L5YWI5YasKSA8WGlhbmRvbmcuV2FuZ0BtZWRpYXRlay5jb20+DQrmioTp
gIE6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBKYXNvbi1KSCBMaW4gKOael+edv+el
pSkgPEphc29uLUpILkxpbkBtZWRpYXRlay5jb20+OyBOYW5jeSBMaW4gKOael+aso+ieoikgPE5h
bmN5LkxpbkBtZWRpYXRlay5jb20+OyBTaW5nbyBDaGFuZyAo5by16IiI5ZyLKSA8U2luZ28uQ2hh
bmdAbWVkaWF0ZWsuY29tPjsgR2lsIERla2VsIDxnaWxkZWtlbEBnb29nbGUuY29tPjsgWWFjb3Vi
IDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz47IFByb2plY3RfR2xvYmFsX0Nocm9tZV9VcHN0cmVh
bV9Hcm91cCA8UHJvamVjdF9HbG9iYWxfQ2hyb21lX1Vwc3RyZWFtX0dyb3VwQG1lZGlhdGVrLmNv
bT4NCuS4u+mimDogUmU6IFtQQVRDSCBpLWctdCB2MyAxLzFdIHNraXAga21zX2ZsaXAgY2FzZSBm
b3IgbXRrIGRyaXZlcg0KDQpIaSBYaWFuZG9uZywNCk9uIDIwMjYtMDMtMTIgYXQgMDk6MjQ6NTgg
KzA4MDAsIFhpYW5kb25nIFdhbmcgd3JvdGU6DQo+IEZyb206IFhpYW5kb25nIFdhbmcgPFhpYW5k
b25nLldhbmdAbWVkaWF0ZWsuY29tPg0KDQpJIG1lcmdlZCBpdCB3aXRoIGNvcnJlY3Rpb25zLCBh
bHNvIGNoYW5nZWQgc3ViamVjdDoNCg0KdGVzdHMva21zX2ZsaXA6IHNraXAgb24gTVRLIGRyaXZl
cg0KDQpJbiBvdXIgZnV0dXJlIGNvbW1pdHMgcGxlYXNlIGFkZCBhIG5hbWUgb2YgY2hhbmdlZCB0
ZXN0IGxpa2UgYWJvdmUgKHdpdGhvdXQgJy5jJykuDQoNClJlZ2FyZHMsDQpLYW1pbA0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBYaWFuZG9uZyBXYW5nIDxYaWFuZG9uZy5XYW5nQG1lZGlhdGVrLmNv
bT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfZmxpcC5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90
ZXN0cy9rbXNfZmxpcC5jIGluZGV4IA0KPiA0OWE1ZjRlZDEuLjI5YTI0YzZmMCAxMDA3NTUNCj4g
LS0tIGEvdGVzdHMva21zX2ZsaXAuYw0KPiArKysgYi90ZXN0cy9rbXNfZmxpcC5jDQo+IEBAIC0y
MDk1LDYgKzIwOTUsOCBAQCBpbnQgaWd0X21haW5fYXJncygiZSIsIE5VTEwsIGhlbHBfc3RyLCAN
Cj4gb3B0X2hhbmRsZXIsIE5VTEwpDQo+ICANCj4gIAkJaWd0X2Rpc3BsYXlfcmVxdWlyZSgmZGlz
cGxheSwgZHJtX2ZkKTsNCj4gIA0KPiArCQlpZ3Rfc2tpcF9vbihpc19tdGtfZGV2aWNlKGRybV9m
ZCkpOw0KPiArDQo+ICAJCWttc3Rlc3Rfc2V0X3Z0X2dyYXBoaWNzX21vZGUoKTsNCj4gIAkJaWd0
X2luc3RhbGxfZXhpdF9oYW5kbGVyKGttc19mbGlwX2V4aXRfaGFuZGxlcik7DQo+ICAJCWdldF90
aW1lc3RhbXBfZm9ybWF0KCk7DQo+IC0tDQo+IDIuNDYuMA0KPiANCg==

--__=_Part_Boundary_009_763702943.1768111295
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KRGVhciYjMzI7S2FtaWw6DQoNClRoYW5rcyYjMzI7YSYj
MzI7bG90IQ0KDQotLS0tLSYjMzcwMzg7JiMyMDIxNDsmIzIxNDA3OyYjMjAyMTQ7LS0tLS0NCiYj
MjE0NTc7JiMyMDIxNDsmIzIwMTU0OzomIzMyO0thbWlsJiMzMjtLb25pZWN6bnkmIzMyOyZsdDtr
YW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tJmd0OyYjMzI7DQomIzIxNDU3OyYjMzY4NjU7
JiMyNjEwMjsmIzM4Mzg4OzomIzMyOzIwMjYmIzI0MTgwOzMmIzI2Mzc2OzEyJiMyNjA4NTsmIzMy
OzIxOjM0DQomIzI1OTEwOyYjMjAyMTQ7JiMyMDE1NDs6JiMzMjtYaWFuZG9uZyYjMzI7V2FuZyYj
MzI7KCYjMjk1Nzk7JiMyMDgwODsmIzIwOTA4OykmIzMyOyZsdDtYaWFuZG9uZy5XYW5nQG1lZGlh
dGVrLmNvbSZndDsNCiYjMjUyMjA7JiMzNjg2NTs6JiMzMjtpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyOygmIzI2NTE5OyYjMzA1OTE7JiMzMTA3
NzspJiMzMjsmbHQ7SmFzb24tSkguTGluQG1lZGlhdGVrLmNvbSZndDs7JiMzMjtOYW5jeSYjMzI7
TGluJiMzMjsoJiMyNjUxOTsmIzI3NDI3OyYjMzQ3MjI7KSYjMzI7Jmx0O05hbmN5LkxpbkBtZWRp
YXRlay5jb20mZ3Q7OyYjMzI7U2luZ28mIzMyO0NoYW5nJiMzMjsoJiMyNDM3MzsmIzMzMjg4OyYj
MjIyODM7KSYjMzI7Jmx0O1NpbmdvLkNoYW5nQG1lZGlhdGVrLmNvbSZndDs7JiMzMjtHaWwmIzMy
O0Rla2VsJiMzMjsmbHQ7Z2lsZGVrZWxAZ29vZ2xlLmNvbSZndDs7JiMzMjtZYWNvdWImIzMyOyZs
dDttYXJreWFjb3ViQGNocm9taXVtLm9yZyZndDs7JiMzMjtQcm9qZWN0X0dsb2JhbF9DaHJvbWVf
VXBzdHJlYW1fR3JvdXAmIzMyOyZsdDtQcm9qZWN0X0dsb2JhbF9DaHJvbWVfVXBzdHJlYW1fR3Jv
dXBAbWVkaWF0ZWsuY29tJmd0Ow0KJiMyMDAyNzsmIzM5MDY0OzomIzMyO1JlOiYjMzI7W1BBVENI
JiMzMjtpLWctdCYjMzI7djMmIzMyOzEvMV0mIzMyO3NraXAmIzMyO2ttc19mbGlwJiMzMjtjYXNl
JiMzMjtmb3ImIzMyO210ayYjMzI7ZHJpdmVyDQoNCkhpJiMzMjtYaWFuZG9uZywNCk9uJiMzMjsy
MDI2LTAzLTEyJiMzMjthdCYjMzI7MDk6MjQ6NTgmIzMyOyswODAwLCYjMzI7WGlhbmRvbmcmIzMy
O1dhbmcmIzMyO3dyb3RlOg0KJmd0OyYjMzI7RnJvbTomIzMyO1hpYW5kb25nJiMzMjtXYW5nJiMz
MjsmbHQ7WGlhbmRvbmcuV2FuZ0BtZWRpYXRlay5jb20mZ3Q7DQoNCkkmIzMyO21lcmdlZCYjMzI7
aXQmIzMyO3dpdGgmIzMyO2NvcnJlY3Rpb25zLCYjMzI7YWxzbyYjMzI7Y2hhbmdlZCYjMzI7c3Vi
amVjdDoNCg0KdGVzdHMva21zX2ZsaXA6JiMzMjtza2lwJiMzMjtvbiYjMzI7TVRLJiMzMjtkcml2
ZXINCg0KSW4mIzMyO291ciYjMzI7ZnV0dXJlJiMzMjtjb21taXRzJiMzMjtwbGVhc2UmIzMyO2Fk
ZCYjMzI7YSYjMzI7bmFtZSYjMzI7b2YmIzMyO2NoYW5nZWQmIzMyO3Rlc3QmIzMyO2xpa2UmIzMy
O2Fib3ZlJiMzMjsod2l0aG91dCYjMzI7JiMzOTsuYyYjMzk7KS4NCg0KUmVnYXJkcywNCkthbWls
DQoNCiZndDsmIzMyOw0KJmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO1hpYW5kb25nJiMzMjtX
YW5nJiMzMjsmbHQ7WGlhbmRvbmcuV2FuZ0BtZWRpYXRlay5jb20mZ3Q7DQomZ3Q7JiMzMjstLS0N
CiZndDsmIzMyOyYjMzI7dGVzdHMva21zX2ZsaXAuYyYjMzI7fCYjMzI7MiYjMzI7KysNCiZndDsm
IzMyOyYjMzI7MSYjMzI7ZmlsZSYjMzI7Y2hhbmdlZCwmIzMyOzImIzMyO2luc2VydGlvbnMoKykN
CiZndDsmIzMyOw0KJmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvdGVzdHMva21zX2ZsaXAu
YyYjMzI7Yi90ZXN0cy9rbXNfZmxpcC5jJiMzMjtpbmRleCYjMzI7DQomZ3Q7JiMzMjs0OWE1ZjRl
ZDEuLjI5YTI0YzZmMCYjMzI7MTAwNzU1DQomZ3Q7JiMzMjstLS0mIzMyO2EvdGVzdHMva21zX2Zs
aXAuYw0KJmd0OyYjMzI7KysrJiMzMjtiL3Rlc3RzL2ttc19mbGlwLmMNCiZndDsmIzMyO0BAJiMz
MjstMjA5NSw2JiMzMjsrMjA5NSw4JiMzMjtAQCYjMzI7aW50JiMzMjtpZ3RfbWFpbl9hcmdzKCZx
dW90O2UmcXVvdDssJiMzMjtOVUxMLCYjMzI7aGVscF9zdHIsJiMzMjsNCiZndDsmIzMyO29wdF9o
YW5kbGVyLCYjMzI7TlVMTCkNCiZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmIzMyO2lndF9kaXNw
bGF5X3JlcXVpcmUoJmFtcDtkaXNwbGF5LCYjMzI7ZHJtX2ZkKTsNCiZndDsmIzMyOyYjMzI7DQom
Z3Q7JiMzMjsraWd0X3NraXBfb24oaXNfbXRrX2RldmljZShkcm1fZmQpKTsNCiZndDsmIzMyOysN
CiZndDsmIzMyOyYjMzI7a21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOw0KJmd0OyYjMzI7
JiMzMjtpZ3RfaW5zdGFsbF9leGl0X2hhbmRsZXIoa21zX2ZsaXBfZXhpdF9oYW5kbGVyKTsNCiZn
dDsmIzMyOyYjMzI7Z2V0X3RpbWVzdGFtcF9mb3JtYXQoKTsNCiZndDsmIzMyOy0tDQomZ3Q7JiMz
MjsyLjQ2LjANCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+PC9odG1sPjwhLS10eXBl
OnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxp
dHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQphdHRhY2htZW50cykgbWF5
IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0K
ZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVu
ZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCByZWNpcGllbnQocyku
IEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0YWlu
aW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMgDQphdHRhY2htZW50
cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQg
bWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVuZGVkIHJlY2lwaWVudCBv
ZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
LW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChi
eSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2Yg
DQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3Rl
bSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55
IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_009_763702943.1768111295--

