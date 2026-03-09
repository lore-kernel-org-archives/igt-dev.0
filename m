Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52105EA854A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 03:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5F810E0D3;
	Mon,  9 Mar 2026 03:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jGYdUqrp";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TnI4gVe+";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5538D10E0D3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 03:22:59 +0000 (UTC)
X-UUID: 40e5e93e1b6711f1a02d4725871ece0b-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=vohVW6lmafh/VTiy7YZd1difrBBw5EnJsv3uEvg8n+Y=; 
 b=jGYdUqrpEgdUHHRRo45NqTYdJd0NNHRvNSrcDkx/D8vUyChpFSey4EI07gEO8kcuYsxk3TURX5MVZg0s/9rryQpLcmkZK9ulftqEWLp+JXvnZHdghli92WCmvACOl1MtO8ddkRwotohctAy5GafhoNudrjDAPvcLz2ooyapvMdM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:7dde9cfc-6fd4-4394-861a-b7fd60b414d1, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:443065ea-ef90-4382-9c6f-55f2a0689a6b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS
 :nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
 C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 40e5e93e1b6711f1a02d4725871ece0b-20260309
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1244230662; Mon, 09 Mar 2026 11:22:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Mar 2026 11:22:49 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Mar 2026 11:22:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aK+fy1JnVWg33kHPL9PxUe6eOgt2BlkVIRHQLyr+q9BqRzB/lruFGx+04lXBqkfh/n0WTfF0xXWiG1BwAVQZUwFJMivN4phoF4VuCvuRGdEoZ7lHvsMM/B7Xu5tgIbNvrtSyaIXlY9XNHDXaKfJAbr/pBZuRFsWYQQD1kQ654iyNH5+UdMSXnH94cnl0kU66gwy36HF0VI+2vOU3OTzKiZIZPuRvCk+e+Avo8pRUFS5BGe0ERzsGLvwTqBTLtcLaiHpEsTcUTSpzOiwX8bYmAeuRGRk0/tYIbgDfjH6nMRAQ/TlX81tOg/vGQLl+1BczMD9eRICQ/IfrF18l01WLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vohVW6lmafh/VTiy7YZd1difrBBw5EnJsv3uEvg8n+Y=;
 b=gpQ2x1T4ZYB+TQBNtfnAIB+nBeKjuAWGDK/PXIggiEuNYaGMgw42osLgApFKalWDoLlLUBw/305JFJjDoOjmkgiGU1j9RkWTRjKaf3nZvyP/5PfZ7AiXkv5C5ZGeFuVhcZDJYwGT1nbjMRZrf+6LhsBv2Ebn9PeXbzPNWMuylSIx73n4BxnPJ58QIg2gZI8Fi4A4fxbomjNHQrtcZXY1QW4zowrns/t49UCiHxp/3PTJnygrtUL+z+8mi4rLk9fpJ1SRBPyiWdqmQTE6bw8kAkw5thjyfqoxPc9hQ1R1XCpCamY+abeXLSH4zhDCFm50cBl4mJQe/Yftp/VIoxZfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vohVW6lmafh/VTiy7YZd1difrBBw5EnJsv3uEvg8n+Y=;
 b=TnI4gVe+0e54MHJng/F+LOoQTkrJxpSKBj8APGdZNTQxaGh88n6IcVeouPNOzhShx4+uTMAas8xKkUsMzxlBdmTFUoDLLDdrJ6PgL4mCe25ASX5r+EtYiBhzHD5CeRmKxce4XTPWZNstofa5/oyOGjZTso4IaB204UBv4eJF/WI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB6514.apcprd03.prod.outlook.com (2603:1096:101:44::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 03:22:45 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 03:22:45 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "gildekel@google.com" <gildekel@google.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Add vblank waits for MediaTek CRC
 timing
Thread-Topic: [PATCH i-g-t] tests/kms_plane: Add vblank waits for MediaTek CRC
 timing
Thread-Index: AQHcpnCKH08bLEut3EiM0FQc50eoWbWhEQCAgASKGwA=
Date: Mon, 9 Mar 2026 03:22:44 +0000
Message-ID: <c0307de5c50d00da68e6192be0ba5fce591b5f4e.camel@mediatek.com>
References: <20260225160428.4116800-1-jason-jh.lin@mediatek.com>
 <CAC=S1nguWJMH=CeRxhvxooqf5XZFwOZSbLr0JUXC490kLNAcKw@mail.gmail.com>
In-Reply-To: <CAC=S1nguWJMH=CeRxhvxooqf5XZFwOZSbLr0JUXC490kLNAcKw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB6514:EE_
x-ms-office365-filtering-correlation-id: ec64bfb7-02b7-4ab3-af53-08de7d8b218b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: CKYMNb5HoLzKJsRvcluu58sFE2khqlgBj29W0qDxo8DEoE6ex0dhx1f3kbozb7KNf5yjSJKN+IPwWlA06TWYvYBTX/xHY+VZr6gXgrbeLdJ29mesPeMeXZoZHsDHRrPgOKlw7vmTI1CokKUKrOgvfjDR9FIGpQIU+Guhb41Xd/Sk/YXxGIyTUJEF39ESRB7wX8CHu3JClV1Z+cmpby4SBvf1DkqZsEQrcC4x0dFSWwfhJLgmSYjeRH7Tga235yv7jUcNT4/rKWt/ovEXNp5Tr9ppl3J6g/EgcB7PIP/zHAmgj7FmoY4yzDDE/lqbWt+N5gLLBUlETdq/SP8t4oBwtWn0dL9PqEyE+/b0YNOSXZDoVKRMqYAdnv/dsVEdrWlbPwu3Q1er07syRdJqsEoaw40k17S5znxQZO9fLIAh+9nGEp/L4oAFb9Rl8bmNHzy1/Q5lQRo6hdlC6YQEgzrjTPuS4Z0Swli/JJQh8gPJkCB8FF1zTKvQozDyL+agA4rn8pYCINChY7FXS0rUDeB83/oQ1jC6zixX6bmdhcFrxhZb070bd7mAAhoPOAw9bxMenehJIg2KCZiCbniPQDGLDO7Vzd3d0jVU3oXi4FQpMSn4OJZgsX/ax52liuhCiwoMZ0JpMLy1FCAXy63KWp7Z8b6WqqOiG2TERDeEOYjZ6wlZHXb8Htncxb7/NdYryeRzmW3E7y3g+ehwbAK326iGs8OK1bAbZofkRywQ7iEPs6Rz1R8XvWrCgfTBwfqH2zZc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0pia0hUL2lCc1RIaEpMcHE3TVU2MnZRcTYwd1NuRFZIVlgyNFZCS0NYQjlS?=
 =?utf-8?B?cUNFeWVCTkMzUlIvNzhTVHVoTStsWUhDWk5WR21LTS9NUWRFblpoNkpDZkd2?=
 =?utf-8?B?dDRoZ3h4WFcrYkpaM3ROYnFkeFVUMm9lb081WjdGRXY0NjlFWUFPS2xIdjRF?=
 =?utf-8?B?Tzl6RENQazZkbWp5QXNLb2g3aUVDQkxQTU5USHZuMm95ZzdMZ3pPc0liVlZ6?=
 =?utf-8?B?TDRwcndTZ28zcDFhMUhPWUVkZmdVKzNDeGpKazNCWGIrdW9IdXVDTkNWaDJR?=
 =?utf-8?B?U3g3dTYxT0EzSlVhSVpISzZSUmlEcjVQdlVNcyt4QWVtZzBWY0pqQnpXK0Np?=
 =?utf-8?B?dnFiUFhRT3Q1UnBnTnU2S1loQ2swbkd5eXhTd2FmVHMrY3dsU24vN29QN0Zy?=
 =?utf-8?B?QjF1TWxJRVB3cjNNVFBHTjBZalNsQldCb3Y5WmM0R0VtZHVQSkRlSGlXWmQy?=
 =?utf-8?B?Ly8xNStuWGJxREM2aFRmcTJDR0JIWXdjSlhxMzkwdE1DZjRVcFF0dVdHa1hi?=
 =?utf-8?B?Q3RxakcxeVh5N0Uwc3NHQXFjWEpvYTNVV21XVUxhU2NXZ1RFcGdxSEdwN2FX?=
 =?utf-8?B?Sjdxd205Q09KUnp6MzJYTTZSVUUzT2ZJcng5RjFobWFpcE1xak9JUmtHYlF3?=
 =?utf-8?B?d2xGRmdHYzdsSEhiWm5jTklkaFVucEtKQnJ6R21QWGJzRjYydUpsb2J2cStK?=
 =?utf-8?B?Nks1dkg2NE8za0dGZUtyYmY1VjR3VmhtZEUzd3BqYXg1cnMwUXUxWHJsMWZD?=
 =?utf-8?B?NGRUUzJ5LzN6ZXFkTU9PcHdFM0lseFNxMHA5K3g5NStSdlZ4UUkveHFvRExi?=
 =?utf-8?B?WmVGMURkUm1aSWVldXYvSm9iaDFCeUFmNC9jZEs3T29pYmlva1ZwN0w3QW9m?=
 =?utf-8?B?Z2hVblZmNWZ0cDZIUzM3TTA0ejI0dWdCeHlTcTllRE9QUWRPdERaNkhPd0dV?=
 =?utf-8?B?VDhLNFkvOVBwQ3pTZHZwb1ZGLzRKckVCT0xvanpJZXdwZTFFUWZ6RVhtQkY3?=
 =?utf-8?B?emlmNXN6TEFGNWgyQVFLRWNvMVZsWU92MVpLUWZydUVPWTNPV0NCWFVvdFQ3?=
 =?utf-8?B?dGJsbGlSUExJUHJYZXJJZTdEL3JxdUZTeHhqVlZ2VlN5VGJEdVlPS3pwb3lC?=
 =?utf-8?B?Q2lQZFhJVStzR0pGTHhncjg3OFBjWVh4K1NvbnBCLzI2NFNJVkxEWkQ1aUFv?=
 =?utf-8?B?NGMvcDJaZmwwaEFKZStiU1FMcllwQzUyeTI5bGhvUTdrc2QwdWt2azRGcTFG?=
 =?utf-8?B?dmMyVWJEdzF4WDg1dkR1RlFYekpBUXdVVGFTNmlQTC9MVlJiNldnaWNub0pF?=
 =?utf-8?B?alkrYUltMG11bW42bytsbnVvSWEwMGRtN0hsWnczTGUyaER0TVkwWERKOEw4?=
 =?utf-8?B?T01JekFCeTdlK0JyTDNTbmUzRHJNMElIdVlwUFhoNnVkMWZjVEUrUCsvM0s3?=
 =?utf-8?B?ZGZxeGVQL0dIbWlWdkp5aGRRU0NkMzdQME9tZ2R3WTk3Z2dXZUpaVEtJWHNs?=
 =?utf-8?B?ZjZyOW0vTkVFeDJTQmtrUERiSDlyZDRjQk1nTEl2Z21uN1dOVU81NXJBV2RP?=
 =?utf-8?B?VXVQNjV4bFd0aDUrY0xGbWFxU0NjN2MyOFlseEVDamxuaUVwNTliOVplRHFJ?=
 =?utf-8?B?dWdLbVFleHE2cjlNM2hYRUZJVTFVbVFzYVVMSFNoOUU3TFluZVhULzNFdy94?=
 =?utf-8?B?OW1GZE9IVzR4akhDVTcvN3pORzJkdmlYNTJCTzlCT05mOWtXWDRoOXhXSjkx?=
 =?utf-8?B?QUlMTzhLcmJodGFoRTkrcEczdWdmS1VZemRRc1oxYTZxQk5iNjlJU3BuUjcv?=
 =?utf-8?B?bUdYZEUxK29SYW9mUktzQVRMM2sxaC9nS3BnajczeXBLNnZjTXcydVpheDY1?=
 =?utf-8?B?NE51MzJIWjhBVEhFQWRCK2Q0Y3RGYno5NGlUT29RVGs3SmtBRnR1QjdTZDBY?=
 =?utf-8?B?WmdzcGVUbWhoQTBDbVQrQXgxdDJJOVhobWtMZUF0TmlxUHl1QVJGL0t2Ulg5?=
 =?utf-8?B?UHF5UjJWa0hEcHFxYzZpK04xYUNYc1dwbTJ3UTRCRFJsU0ZxMmk1WithVmJS?=
 =?utf-8?B?YVc1ekN4OXh1OEViTEswZzFYN1JwU2RjT3FUdEhGNWcvd3Q1RDlXcEFKYTY2?=
 =?utf-8?B?V0F5cnRlZjhOdmt1R3J2L01iZFlJc2xDRDk2c0tlUTZmd0cvWVR5dGxXOWdj?=
 =?utf-8?B?OEZTb1ovN3J5YzljUW9HNHZaNzlaQ2g1TVhQcUUvU2hyV0x4bUNJVzRxbUFm?=
 =?utf-8?B?T2UwRFlBdHhxMGMrWEh3QXEvVzJ5U2hQLzNaUVBXWHF4VE1heE5ubTRzRXA0?=
 =?utf-8?B?bDJOQktzZVlIVzduSjMwTktXc1l5bWJ2SUJHaTBsbXZhZTZLK1ZhSGoyR3hI?=
 =?utf-8?Q?yBqHBuv5K3u46wZg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B3962D97B649547B44D67D80A20E75E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YPGe2wysWf2WQfSeP67WkbfeZf1/J+UibHU/IpDog4PhLN2i4B5RqS5D2BPjkxGz+8Aaqlh9pWamDYfGRUv4EAlWL82Akt8pCnHTLVwyQm3Y8n3F73LbkmTeSkxX6Yg/oi2XGRkvWlXtPtC/x0WdF/YIhh8HGIhsVFPvWsKIlXlxO7ANPjNobBNLWqhNuJYSQLewUUuaf4fnVWoBV9bQaQTjLrKJnschpH65dwzxIuQ16jwDmf8j3ToWaL5o80bDddSilnILY9/+7btrBWkhjom9IHX1kXPJ6A2kH03NL/J5xZ72asl5wRMAjCYnwPMXEmjYXR4F/IifZc7MFVe16w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec64bfb7-02b7-4ab3-af53-08de7d8b218b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 03:22:44.9317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYisD8uZ0tZ2FkKH+4ZV8YN+O3VtRSEJ6Dl6vlft6bu/ynNGE3PsErQESU3x+4SABEFA7ErcPrbZGn2mEQRa44w82hDTmIxvxyEkF7IoXnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6514
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

PiANCltzbmlwXQ0KDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMv
a21zX3BsYW5lLmMNCj4gPiBpbmRleCA4Y2VmOTRhMWYzN2UuLmU0NTM5MDc4Yzk4ZSAxMDA2NDQN
Cj4gPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19wbGFuZS5j
DQo+ID4gQEAgLTM1MSw2ICszNTEsMTUgQEAgdGVzdF9wbGFuZV9wb3NpdGlvbl93aXRoX291dHB1
dChkYXRhX3QgKmRhdGEsDQo+ID4gaWd0X2NydGNfdCAqY3J0YywNCj4gPiANCj4gPiDCoMKgwqDC
oMKgwqDCoCBpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3BsYXkpOw0KPiA+IA0KPiA+ICvC
oMKgwqDCoMKgwqAgLyoNCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBPbiBNZWRpYVRlayBoYXJkd2Fy
ZSwgY3Vyc29yIHBsYW5lIHVwZGF0ZXMgYXJlIG5vbi0NCj4gPiBibG9ja2luZyBhbmQNCj4gPiAr
wqDCoMKgwqDCoMKgwqAgKiBDUkMgbmVlZHMgdGltZSB0byByZWZsZWN0IHRoZSBuZXcgcGxhbmUg
Y29uZmlndXJhdGlvbi4NCj4gPiBXYWl0IGZvcg0KPiA+ICvCoMKgwqDCoMKgwqDCoCAqIGEgdmJs
YW5rIHRvIGVuc3VyZSB0aGUgdXBkYXRlIGhhcyB0YWtlbiBlZmZlY3QuDQo+ID4gK8KgwqDCoMKg
wqDCoMKgICovDQo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoaXNfbXRrX2RldmljZShkYXRhLT5kcm1f
ZmQpICYmIHNwcml0ZS0+dHlwZSA9PQ0KPiA+IERSTV9QTEFORV9UWVBFX0NVUlNPUikNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZ3Rfd2FpdF9mb3JfdmJsYW5rKGRhdGEtPmRy
bV9mZCwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGF0YS0NCj4gPiA+ZGlzcGxheS5waXBlc1twaXBlXS5j
cnRjX29mZnNldCk7DQo+IA0KPiBIbW0sIEkgc3VwcG9zZSB5b3VyIGNvZGViYXNlIGlzIGEgYml0
IG91dGRhdGVkPw0KPiBDb21taXQgMTgzNDlkOGJjMWIyICgibGliL2ttczogUGFzcyB0aGUgZW50
aXJlIGlndF9waXBlX3QgdG8NCj4gaWd0X3dhaXRfZm9yX3ZibGFuayooKSIpIFsxXSBjaGFuZ2Vk
IHRoZSBmdW5jdGlvbiBzaWduYXR1cmUsIHNvIHRoaXMNCj4gcGF0Y2ggZG9lc24ndCBhcHBseSB0
byB0aGUgbGF0ZXN0IHRyZWUuDQo+IA0KPiBbMV06DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvLS9j
b21taXQvMTgzNDlkOGJjMWIyNWJjZjk1M2UxODY4NjY2MjE0ODI5Zjc1YzQ0Mg0KPiDCoA0KPiAN
Cj4gQnV0IEkgZ2V0IHRoZSBjb25jZXB0LCBhbmQgSSB0aGluayB0aGF0IGxvb2tzIG9rYXkuDQo+
IA0KDQpIaSBGZWksDQoNClRoYW5rcyEgSSdsbCBjaGVjayB3aHkgSSBkb24ndCBnZXQgYSBidWls
ZCBlcnJvciBpbiBteSBjb2RlYmFzZSBhbmQNCnNlbmQgdGhlIGNvcnJlY3Qgb25lLg0KDQpSZWdh
cmRzLA0KSmFzb24tSkggTGluDQoNCj4gUmVnYXJkcywNCj4gRmVpDQo=
