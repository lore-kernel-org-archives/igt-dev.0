Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF48CCD8C8C
	for <igt-dev@archiver.kernel.org>; Sun,  7 Jun 2026 17:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531F10EAE5;
	Sun,  7 Jun 2026 17:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tgHzyWDC";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ENQEMo5R";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620C110EAE5
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Jun 2026 17:37:59 +0000 (UTC)
X-UUID: 9b671e9c629711f1b1788b6acf885367-20260608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=+Bn4PxIn0rgfY/t6jMxJCUalINM7h4MEXMrSyU9/lVY=; 
 b=tgHzyWDCeuJ4JshHAG9LHJAoub3+aormE6h3ZwE35Al29JU0W7jparNtM33VzAnsvAws7lLRWa6rUfzhAdtX3gNpmxnq8H54gO2dxGp3PS6nN0VNbKIOlq6k2YYPx9ya5l1tWr4FvDQGZMfNQP8BdvDd3tawRTSIdgAqxY9zJ/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:034f146e-ab70-487f-b4d1-881ca679e9c3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:30c0692a-13d2-4d29-83ea-b8014339a000,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|136|836|865|
 888|898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,Q
 S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b671e9c629711f1b1788b6acf885367-20260608
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1315421016; Mon, 08 Jun 2026 01:37:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Jun 2026 01:37:50 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 8 Jun 2026 01:37:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJudkV4GIwVPxDFuhzNVEEPBtjclooUhtTetDEPQZ03iYk7GuGonDxLQEURGfKGvCrgUvMLCfnIO4ZrzawZ7Uk0jOntDikWpPxMtRrd7jRVoqmtNpbNYmL9r1ZCpDOAdT7JO1WLkmg9lH4gokWBUyPjzvAUlFlCJakgulsZWxOVDiDNBrEbdcIXVGYbfhrGZ93+seKXYvlWYOj2PxN8kamkheqBQvAftg4CFOuGBwf1kZCLZ2cdz2t/jkzPAPHCd/Pf8aAi+BStxQGWS0Ojhfz3A7bWfN0UxzvObza2c4s+QJR/l50T7EklimH/z5k9m990pt4pYujAJ5isaviaN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bn4PxIn0rgfY/t6jMxJCUalINM7h4MEXMrSyU9/lVY=;
 b=Q/h4aNe/Ar2OM2WVoabE9wsUy7F4c0R3RDP4gs4bLQ7JHXWm0xGvw9T4HgR0OacqBNgPi3WyaPk1Xd7hO3f8p7ZvDNNOK1u1ZwstTTXPSvDyaconujsHOsP6MsRY6hgLZcSmCqBonZsXznlSO3cH2f94M2GbJuYvSPv+kr1LzmjdS9LpuRlYST56eQxFkZ7PVU4UvJMIgHw+R2q20qxZoBzcixkdHg1xWeVxFSRHzA5L24TSUEZjcrqpJ83IyIMXRUXzwXgF9UfPDoZOZXTcAn2D2fy6k5bIUw65dqvZa2A3N1EAoPQPOcr04bX1NDBeClQMl1oM5R30r9yllGcqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bn4PxIn0rgfY/t6jMxJCUalINM7h4MEXMrSyU9/lVY=;
 b=ENQEMo5RyYxKYswbGjPIZ7NPePzZkVTAFMnmGxsjVvHHhUqKP/GvpB/Hulh6/XR3xQ2YuAX0vbymM+b0tOFwVQG91k5TaWYDiGKDzI3gyKVZnkwgH4LrosNbn+irkWdlvHMnr+8VAi4bCctQW/cW6KItiNX8oQ/YpXCBC41n/2c=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SG2PR03MB6503.apcprd03.prod.outlook.com (2603:1096:4:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.8; Sun, 7 Jun 2026
 17:37:46 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0113.006; Sun, 7 Jun 2026
 17:37:45 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "pranay.samala@intel.com" <pranay.samala@intel.com>
CC: "sameer.lattannavar@intel.com" <sameer.lattannavar@intel.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>
Subject: Re: [i-g-t,v3,2/2] lib/tests: make igt_get_output_max_bpc() return
 status and handle failures in callers
Thread-Topic: [i-g-t,v3,2/2] lib/tests: make igt_get_output_max_bpc() return
 status and handle failures in callers
Thread-Index: AQHc9qOAn1g5bdYP5EGfX0l1rup8l7YzW2oA
Date: Sun, 7 Jun 2026 17:37:45 +0000
Message-ID: <3ed14927e0f0a7b07b0e9203c472d4a3e1128e55.camel@mediatek.com>
References: <20260529063230.754253-3-pranay.samala@intel.com>
In-Reply-To: <20260529063230.754253-3-pranay.samala@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SG2PR03MB6503:EE_
x-ms-office365-filtering-correlation-id: b0a78a0f-babc-491c-7a85-08dec4bb7c54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|3023799007|11063799006|56012099006;
x-microsoft-antispam-message-info: RTGOifhXQCvtUzRlTkIzZLNqnoBPc9XbrWZouu3ocF0RrviIwpl1KwmaUK8kbAh6BWBiJi2bKd6W4kJn2htMPVCV2aPqwdGWJwo8q6Rx+Zaqa4KJjYaFm80jPlAHISEkrNGZ7T1mvoSk+EyTdC+A7XkqTzNvHhJWB4u5xsrUhZD8luonFYjBNz8I4BEPuhBCNVBCY1sIN36a6s2PhspsqbsUI7ycyptF0JflUoQI9ZXB5gm26T4+SGzOHfe0X8yIdziCWs8H6BRzo9qHRr2bLkc4BWUrymadIv1bXKkyQmkwiXwcKBWefkG6JQZZQLb7k0SsOQah2kd4X9xOsMDoJWkZZiG5kO9gJ9g5XIvglcfjHpkRpIH7Qbu8RbH+/mn0nENM8YRTwMwiQYB0blpD+DuWCV8iU3TJYnP2Z/sX1Gaq2bue950F1BIe6wlpzFXMoK5499XxPj2cRLDsDYZ8FmLqCU4UeGwcqK2nQgxo8RlQmdPMwaQvcn7vHekyRkUJhQ4KHcGMcGl1D3pVbU2xnkU59jAB7xH3/JTzWM5XozKOZJoOzAHCreuRlPVcb5KDL7VPvgV+iJi+OsidY4gpNmTf5o9Pzib8P74y6zYpghAjpKsTxMTE/Pu7kPOCMVlz4Gg020Wsj89kjxaozGfsn3lYh2bxBjEb2hJzEbtbhZL9N3gyfKbKjFax40lXkWKEJMfnlgqhll/8Mft+SxFOBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUkxQjR1TE9FQU1tc1RpQ0Y1WUhCUis5bkhVOEtzaTYrM0NIdEdrUUtKVXFn?=
 =?utf-8?B?VVg4V0hHMVNVcFVMN2pDM0VybXBlTHk3Ym5lOTRMQ1o3ZENlOTFiZUtET0NI?=
 =?utf-8?B?dWRpaWJRQlZmckUvV3RZOXlPMjI0UTEzMHoyaUxOZ0FoQXRlczhLUnpnMjhY?=
 =?utf-8?B?WGJURDdkRXE5U3VsWDFVUXV5aEtFZ1NQS3QwdlBlbkxxVWNXVTNuVnU3dE5D?=
 =?utf-8?B?TFhkN0ZLNDlsVi9GZE1NZjhqQ1pzV3BGVmRrNDdtZmpySml3ejgvTmFhZG9C?=
 =?utf-8?B?VnA1d3BnazNPMTlmRlVzWkJ6aGRxY2Zkd0JjbUZURWFrT0MzZi9PZk1nN1g0?=
 =?utf-8?B?eUdYbk13OUhFMU5yaTZ0VWlzbXNRT25Ldm5jc3hORWo0VFFHRkdzNStzUnh0?=
 =?utf-8?B?eUg2N0owSlQzUndVZERLR3RXajl0bStHSDcyK2NkYW9oTDFkcy9FQlY2UExX?=
 =?utf-8?B?eDdlaktjOCtBc01iSTBhNHZBTHk2ZUxPZm1uK01IQkFiU25xQlE2dUJJNnox?=
 =?utf-8?B?ZERBbEtLWXE2TDBsaDFBZzRXN3BrcUdrVWdObHY0WFlEQUpnaXNzanJXelFj?=
 =?utf-8?B?ZFhMRUl4dDVCbmpjNHdhTlRCMDFRNURpT0F2eE82ajg0V2FVK3JIUlB0OXVn?=
 =?utf-8?B?NHc4SXU2UGQzd0pVbTY3T0dhMHM2UWxlYk9vTkpUR2VLSW5PN1hxMzM5a3FB?=
 =?utf-8?B?TFAvL1JCQWNybTFEM3VnSjJDcmtRa05VbmNnSW43TjFsL2d4YzQ5KzJORlE3?=
 =?utf-8?B?eHUzbnFiUzF5UFlxS2ppdytEamwxa21tSkdoSEhVZ0F4eFhOanErYWV3Vmly?=
 =?utf-8?B?NUNLd1dQQ3hqa1cwbmpqWjBSbEowMWYrWnptT2xkQ0xvVFl3em1jNkFRVlRK?=
 =?utf-8?B?bjlFOHhIYkpoSHVkV3AxVmwrckZZSUw3enlKbG0yT2RLV3JqODNJUkczMStV?=
 =?utf-8?B?bTcrb01INTltR2NZUGhSakorVllROUJpc2d5SzNzaEtmRkVTNWRUQzYva3NP?=
 =?utf-8?B?SWVGR2VCWHE2ZU9BSnJhRkNmVWVIRjN1NGdKcS9CYjFhLzRJbWt3d2ExSkV3?=
 =?utf-8?B?bjlCYi9Cd0hNMDdvVEI1Y3hGOUpNaFMyK2tuQllIYytLbmZqY2htNGM4VlND?=
 =?utf-8?B?V1p4UlI5YnoybDgxbmF4NVlsaU5aRDJXcmZGWm95V0g2NVlnQ21CMlBHMzdU?=
 =?utf-8?B?b3ZRd0ExeTA4UTR5SGlTa3I4VFJzSjdSR0NmQmRObElOSUJoTVc4TkRkQlZW?=
 =?utf-8?B?S2NjM044TVQycDN4cWN3VFpaNzNVUDNKejZ5WmVBNzF3dTJRVHRYZGRqdmtC?=
 =?utf-8?B?OWQ4S05yRnlTd2lETTAxcFg5Qnc5RjMrM3ZKY2w2bnVJSFFkY0pidFFFWEpP?=
 =?utf-8?B?d29BNlNDZHF5ZnpxU2dTZDBkWVVCTlI2UGwrSzZEWGd1Si9BK3M4Tmo3Q1pi?=
 =?utf-8?B?dVRhZzJjc05qRGU4MTVrenB6SDBkVGlLK1Jqd2puUzVGd3BoUDM5MlN5MFNE?=
 =?utf-8?B?ZDcxMlB2N2M3ZEFEeVZyVjIzSG5FSUF3QU9lYmhxNDV2WTMwb095YndPRm5X?=
 =?utf-8?B?YTJJWnk2Q0lsNktvcmY0amx1TDEzUk1IVmdBbjc4NGx4b1VkNWZhbHNQS2Yz?=
 =?utf-8?B?WHUzZDIzSWNUdG0zK0pwcU5tcGp3MGt0V0l4Uk9pb0tXTHYweDdwZ3g4Wkg1?=
 =?utf-8?B?eHgxUE5PRjNRVk9VNDQ0b0FuK1lsNjhxeVVFcStXc3VvMXdOZTI2aTNyTXBr?=
 =?utf-8?B?VytiSTBRaG1mN0xrQXhDWVQydVVlVEY5eHZrUjgvQXhTNDF0L0tJaEpRbWZk?=
 =?utf-8?B?Mi8yNTZENEFXTFB4VXlKcjlTb3hZaElDdG1DakhHQ0JmSEN1bi94c0VteUhX?=
 =?utf-8?B?Q2NpVnlnVHc5aE4wanNJRzU3dUQ2U0dNZFhnNnc4T3N1UzY0UjR1T2NwK0hl?=
 =?utf-8?B?VmU5OFBBUEZmWG5lUS9GQjg3SHFSNWg3OVE5UmtNaWdRYzl2ekk3SUJnZjlq?=
 =?utf-8?B?MEJHNWZLd0lNczltZWNiTFNNeXBjYWtlS1FhTkFIM2RBUWE3THdNeWZTdWNG?=
 =?utf-8?B?R0o5aGM3M2FOZTk5aVF5bmxrMHVLMFRPUVpwSHV2Q2pBR3JaYjFlY0FSRVNr?=
 =?utf-8?B?VndFRnpUY0xoSTdzT0RTWDltckdlZVBCU0Nra3FrejZHRk9yeWZEamU0WVJK?=
 =?utf-8?B?azNKd0FKeTJpRFVNbllwMWxkL0d0WWN2NUpUQWFIQlNsMXIxckNSM3MycWNv?=
 =?utf-8?B?TldCRDRBYVV2WkdHM3dMZExsQXZPaWJEeFdsN2h1RlUyenJweG1jWmVLQWtS?=
 =?utf-8?B?VlhWYTVES1hQazlENGZGbUxyVUNhRFNmR2FJdlBhT0oxUW5jT1VmUm9yZk9q?=
 =?utf-8?Q?FFWoRP/HGd4MybCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DB450366FE019478CD53AE0B9D4F6BE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jNU8XVOZbP7dTt8rf0Q5eALc6V++AtLrPW2xoRsa9E1Wme9WwKbCVrG38XXyHSwbQnGlyejSqaCVAGJJ20hAefoz+4Zr0bD/s0fVODKeGmmqsSUXu6nnidjfVcxsmaQANx2THvUP5EkQek1m87nbjiQhi7w+/zW3n9d5OdvLzHxecMXTMBLbVJgHpdxAOQJczidRGYR4Q3T/E4vsjFqY7Ccy5TsL4xzbwNfKkBl4CVkPS6hul2y6UAEUZGX9ItRSc//BgrbIug7fvmGKOUn8Bj2ByCM8qhKXS/+/5fdc2RwCQqX7bb/Eyi5NkkXYpiiCQBtsOsHhnluEljabjbwbqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a78a0f-babc-491c-7a85-08dec4bb7c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2026 17:37:45.6537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uuoDbuIyEJ3R9gUr499m+vLSI2yH1ncO//Nkpn8lmv3JImFfMGjhvVxGY+A3EJ2qjRjUWUSs+gbpW6nYI9QpXgnFomZTzVSRPQ9cHaTmHP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6503
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

CgpPbiBGcmksIDIwMjYtMDUtMjkgYXQgMTI6MDIgKzA1MzAsIFByYW5heSBTYW1hbGEgd3JvdGU6
Cj4gQ2hhbmdlIGlndF9nZXRfb3V0cHV0X21heF9icGMoKSB0byByZXR1cm4gYm9vbCBhbmQgZmls
bCBhbiBvdXRwdXQKPiBwYXJhbWV0ZXIKPiBpbnN0ZWFkIG9mIGFzc2VydGluZy9yZXF1aXJpbmcg
aW50ZXJuYWxseS4gVGhpcyBsZXRzIGNhbGxlcnMgaGFuZGxlCj4gZGVidWdmcwo+IHJlYWQvcGFy
c2UgZmFpbHVyZXMgZ3JhY2VmdWxseSBpbnN0ZWFkIG9mIGZhaWxpbmcgaW5zaWRlIHRoZSBoZWxw
ZXIuCj4gCj4gVXBkYXRlIHRlc3QgY2FsbCBzaXRlcyB0byB1c2UgdGhlIG5ldyBib29sZWFuLXJl
dHVybiBBUEkgc28gZWFjaCB0ZXN0Cj4gY2FuCj4gZGVjaWRlIGhvdyB0byBoYW5kbGUgbWF4LWJw
YyByZWFkIGZhaWx1cmVzLiBUaGlzIHNlcGFyYXRlcwo+IHJlYWQvcGFyc2luZwo+IGZhaWx1cmVz
IGZyb20gY2FwYWJpbGl0eSBjaGVja3MgYW5kIG1ha2VzIHNraXAvY29udGludWUgZGVjaXNpb25z
Cj4gZXhwbGljaXQKPiB3aXRoIGNsZWFyZXIgbG9nZ2luZywgd2hpbGUgcHJlc2VydmluZyBub3Jt
YWwgY2FwYWJpbGl0eSB2YWxpZGF0aW9uCj4gd2hlbgo+IG1heCBicGMgaXMgcmVhZCBzdWNjZXNz
ZnVsbHkuCj4gCj4gdjI6Cj4gLSBDb21iaW5lIGxpYiAmIHRlc3QgY2hhbmdlcyBpbnRvIHNpbmds
ZSBwYXRjaCAoS2FydGhpaykKPiAKPiB2MzoKPiAtIEFkZCBkZXNjcmlwdGlvbiBmb3IgdGhlIGhl
bHBlciAoU3dhdGkpCj4gCj4gU2lnbmVkLW9mZi1ieTogUHJhbmF5IFNhbWFsYSA8cHJhbmF5LnNh
bWFsYUBpbnRlbC5jb20+Cj4gLS0tCj4gwqBsaWIvaWd0X2ttcy5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MSArKysrKysrKysrKysrKysrKyst
LS0tLS0KPiAtLQo+IMKgbGliL2lndF9rbXMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqB0ZXN0cy9hbWRncHUvYW1kX2J5cGFz
cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrLQo+IMKgdGVzdHMvYW1kZ3B1
L2FtZF9kcF9kc2MuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAgKysrKysrLQo+IMKg
dGVzdHMvaW50ZWwva21zX2RzYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDEzICsrKysrKy0tCj4gwqB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8
IDEwICsrKysrKy0KPiDCoHRlc3RzL2ttc19jb2xvcl9oZWxwZXIuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDUgKysrLQo+IMKgdGVzdHMva21zX2RpdGhlci5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKysrKy0KPiDCoHRlc3RzL2ttc19o
ZHIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNiAr
KysrKysrKy0tCj4gwqA5IGZpbGVzIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0
aW9ucygtKQoKSGkgUHJhbmF5LAoKV291bGQgeW91IHBsZWFzZSByZWJhc2UgdGhpcyBwYXRjaD8K
SSBnb3Qgc29tZSBjb25mbGljdHMgb24gdGhlc2UgMiBmaWxlczoKCnRlc3RzL2ludGVsL2ttc19k
c2MuYwp0ZXN0cy9rbXNfaGRyLmMKCgoKSSB3YW50IHRvIHJlc2VudCBteSBwYXRjaCBWMiBiYXNl
ZCBvbiB5b3VyIGNoYW5nZXMuCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRj
aC83MjY0MTQvCgpUaGFuayB5b3UgdmVyeSBtdWNoLgoKUmVnYXJkcywKSmFzZG9uLUpIIExpbgo=
