Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BD3FF4931
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 02:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8BF10E166;
	Mon, 30 Mar 2026 02:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="IGgduyV2";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JxzwTzO9";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D57510E157
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 02:41:06 +0000 (UTC)
X-UUID: e37552362be111f19a16598d5ca7f8ec-20260330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=l0hCy+bieGZRRFKDiON8E1qEtR64foysB7jCnJtD+TI=; 
 b=IGgduyV2Uzbv3PKiffuNSyguJwi0JGWU0H6N3tr6qav5fao9SObDOGp8R99t1Qq+lCAh93ozVePQGt/g9whOX4h2zdAIHANF8mPWO3dpPqrRUNP73myP86cRiJm+eLrIj5sIke2LjXSrC6JdpQ2EalbvuXi2cpTCG9zXIEfxNRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:572af403-6199-4874-ad45-ab5a4fe3affd, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:af5a5994-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e37552362be111f19a16598d5ca7f8ec-20260330
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 556460497; Mon, 30 Mar 2026 10:41:00 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 30 Mar 2026 10:40:59 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 30 Mar 2026 10:40:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKwTFI8hnMPihhrMtYv2LqL/b2fhnOuJs/l8VmfzIBPEgJ8UgHL2psM980iMgyrpMwKk605xqKFwZiew+FDx+t+ZXag/PSy2HVU72Jq9Wf4dam09eUhaLnsCcmckOUvsXM5MXAM517eU+jfEWXfuERSIAGg32BHPmNSoTrdeDBdbzSIO+CmQs51MqrLWgIplwq7ITL8ok3pGbm60i4CY7JDwAXIBXdeMqIrOQqYLWo52174QdQXpuRJD8I8yxEKoA2NSPkyClmKkVKmjLk9P02Sy5C6+SRq5uOEbNF1zsdhNScFDhbvbWBS8PqJoCNBsiG3CQPCuf5u0ZFroxRfgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0hCy+bieGZRRFKDiON8E1qEtR64foysB7jCnJtD+TI=;
 b=DZV+baDMkVOq7SLiGqTLMn3UAK8qTt9Fvf5pGxNeQvFnwUoojtQ9owtW3EcM6kmVpFqiVMTTc0wk0Ugchsa3TGe67mmanHfgK9gnN7fEapR+jUtzfU40eoNCysAxIXIVObwhNUunIdABoQBh486CrDanVwKvFRkVftxBrE3tfxwUq4Hp4S3Npy6WPXu18/33Z9xsxTDkcYa3WOhu7+KQ4YdGgB/0jXg8JJ9PqW0vYl60WNKe70Wdrrr+inxgE4aL538yHewgY44wHffMoEEshgrx4wHmS01Fj+HLi07/eLu2Z/eY6cSm5zZAeSpucljxamh4yHAn+PDNOtJa7NhZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0hCy+bieGZRRFKDiON8E1qEtR64foysB7jCnJtD+TI=;
 b=JxzwTzO9Kr8DltwWWzzS62Pmsq45Oiun2D+uP+IFSbDdECX19dT0Usd08tr3waEDo5RJ+YcgIJN0a0z/tHqd1riosK9MpV2CvnlHCunnQor5bb5bWCYvVnW/C8ipFuKt1l9OkglG++BGIdyR8dhkrsKb7zzBSJ2xwzPKjDA9vWA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB9547.apcprd03.prod.outlook.com (2603:1096:101:2f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Mon, 30 Mar
 2026 02:40:56 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 02:40:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v4] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Topic: [PATCH i-g-t v4] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Index: AQHcvZ14FByFW3XwAUiqozMCg0v91LXCMSGAgAQw5gA=
Date: Mon, 30 Mar 2026 02:40:55 +0000
Message-ID: <e92e960b530a30352f1ad7d3d3d3a9f29b9106f9.camel@mediatek.com>
References: <20260327035405.3151190-1-jason-jh.lin@mediatek.com>
 <9500f111b76bdfd7dfe77dfb5d70b7d525cfa0f5@intel.com>
In-Reply-To: <9500f111b76bdfd7dfe77dfb5d70b7d525cfa0f5@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB9547:EE_
x-ms-office365-filtering-correlation-id: 974e0a88-82b4-40e6-4812-08de8e05c485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: /tjlgBGu3OHaD4dHhjMHfxFNMqh9bl1ssnbWgVc/dXi1xU6ZMANf7lX6lFlrXjrtqd48Ijo75UOcnftwWJDYjcQpByNb5Ds+6F4m7LoGQlRfIn/bRlWbTHUvb8G4LerNuTsxVhvOnrwRPjJAib+iOMqR6fOXjlwit1c/oq0EKB1lKAzFA4gEKssB+qqFnVId8+otuTVRSygerGPI3rmHkU2DZjFKTNav56cBewKdfuFArftOj5uwlnaXMxnjghvzTlI99ekNPCtmnFn1WDAMt4ItnmpKFn0OkB1neI+GUD0ptS5opju+wcDc1yZ1kBwGGcIoTK/awS8hdY2E2Q72gkFfpnVSLf2cl0/I9ufkqeTAhJNruZDVu6p05aJ68fGHiG2G7uMazZkKEa/UuKO/31I8/m09ITswZA/xsVqtk2z7qQWycv+hAXPZDdb1Lc61SP5mDOxwZalG+Gq4IGUyi+IqhHZKucq+tiOZreP2YedolUobq+u3vyJoFYz2o4gLVo6kNT8+4AfdqxOh2NTRcfCpTLLoobocpAV77Ug2AXCLgCDa0siYA1fYyApzh9CctxkgaTxQk7FShSxDPuwJ0y+pS585ZAYyVRSvUQPZJ7h8v45T5kO1hNP3noCgnVwuwnbAc+wGKEx1wxEexc1vhQKvkhgxy6dcEfTmGJIqu4QMpWL2FlKmEjNPsgTGEwr13SVQEHXC00EfRTQ0hgIBsOlMQWqDU+kRtPwrx0Rzgn46GvXUc9qqW4eHiIVEQe54S7KUnYcOAwkiqvwKKP19MPUOFR4+2mD8MuCAHW5B7Yo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm1Nc1F4Y0VEL0lBV1ZnYkFwd0o0aUwxVjlrYTYra2YvSDNPSndXQ3VncU5l?=
 =?utf-8?B?SWQxVXc4M1NJUURTTW5oc2d3czBkd0Q5MlhrWkVuZkZaVmI1alBQK1dkRk5V?=
 =?utf-8?B?Wklhcys0V0FXdm40VXUyZzR2T1RUajNNa21ERFg5TGZjZHJFRGxPY1kvQjBN?=
 =?utf-8?B?YmVac2g0cUZ0V1hMd084UTVSNEJ2VFJDaHFFcmtxTHQ2dXFkUC9zdmxPZWlM?=
 =?utf-8?B?SWFJTFFsWGY4ZnBOQlYrcEFhREFNNWt4V3IzdGlBNlByY0ViVGRPeHFoMk13?=
 =?utf-8?B?NC9abWtmUGtyUVErSi9vQmFHTFQreEI5b2prMmdDUzZPTVhQTGRNZnZHVG5Q?=
 =?utf-8?B?bUlFdjNJd0QrbjdUMHpnelBiVnFqQ0ZhK1FxbzEyRU1hNnNZc1pBUDl3MTIz?=
 =?utf-8?B?TWFFVERRTzJWNkZmQmUxWkNtVWVmSmlEMDBNTFhadDF3eDQ5TzJwMko4WGN2?=
 =?utf-8?B?QmhXRi90Z2E0cGVpcGRNdmZrRWhLY2U3S0swVk16bEVkeVJPcXo3Zm8zbGJ5?=
 =?utf-8?B?cW10N0RtSldjUlI3ekt4MjJTa1J5ek5kbGc1YmdjZE4zc1FGdlc1WllzYm1U?=
 =?utf-8?B?RnI4YWg3bmJ0bXhHNVhJMVBxWndWNmNlb3Q4SUUvSkZQcWJuL0RDWURjT0NQ?=
 =?utf-8?B?dG5aUStVb1FBK2tNNTk5bHNXS0ZkWFRpaVhpMDRtbW9oVm9lZ0c0WStCVU5Y?=
 =?utf-8?B?ajlZWlV6ckRSMEhPWEtQemxQRmRMM1ZCaSswQzAxQ2hJZGJ2RlNRVTRXcy96?=
 =?utf-8?B?NTUyK3NjQkxZTFhMLzQ3b04wMGJ6SHprUWZyd2wxVXRDR0xxT3VPdXVlcXRG?=
 =?utf-8?B?aWZNYWpiMldzUVJOaXdtL0wxVUhPUmJTTHZOR2ZMV1RWQlpFR2tPUGJ2UlBr?=
 =?utf-8?B?YlhlUE1STEJwcGNTd0o5ZURLNGxCOFhLb1RNRjZucVVPeCtqaStPOTlPanBU?=
 =?utf-8?B?OWZhaXRkMDhGdTdlTjB5NndkRDk1N1pPamxNR3ppNzZ6M0dzTVpFZDJ5M1Nv?=
 =?utf-8?B?SzFQQ0hCSm1RQkFmWWdvODI3a0FrY3FYQThYWTNmL1Z0ZysxcXo3cGt4ak0v?=
 =?utf-8?B?WmM1N2tFWGExZ0VkS0FBa0xjb0VZNmxrL2VYZCszUjlUNlhPNWZUdkdBUHJv?=
 =?utf-8?B?WENLbENmK1Nvbjdja1NuUisxRFVXaHVQSDJmQklYMlZIZ3c5RHBLbVg5SFhD?=
 =?utf-8?B?Vng0cnkra3E3MTVpUEhHcUdNcDJ5bU9rM1pQdlR2VmN4MTd3V2lTLzhBRWVR?=
 =?utf-8?B?MGhZV21FL25CYWpxOHdNRE45Yy9JbW15ZnBKQ3ZqRnZkdWc1bEsvdnJ3d3ZF?=
 =?utf-8?B?b0NTekJCajBuckpkNjJHZGVIT1JJZWRFeUthYWtWQ3h1QVhydjE3WHltMXFu?=
 =?utf-8?B?b2dHaFk4MGNZNU5tMkRweTBPczJKdVdHL2VvNTBKT2JlTEZSbVNKb1pHdEpI?=
 =?utf-8?B?MDFlelJOT3FLTExZcnR0QVRuSVJhL3hPc3lMNHFkUlNYODBkWkFTelhHWlJF?=
 =?utf-8?B?eHdjK1N1aGNXSUhpNGFmb2NtL3FaUU82a0dwL3hFZjJqK21keXFRam1UTFBs?=
 =?utf-8?B?MWZRY2pMa3FkN2tHMmJGT2xXWVNtQ3RsMDFweU9DN0Q2Ykt3N2FHM0Z0ZWhI?=
 =?utf-8?B?R1M5NkFyR2kwUTFkaFJieUZYTWZzZEoyTFo4NW1qcktRT2QzTThBdTh3cmFz?=
 =?utf-8?B?dUs4cnhmWklzVmdrb3NrY01kckZlUjJMeFVxZnJKQXlWTktaVEVnNWd4VW9F?=
 =?utf-8?B?aDhUU3VkQmRTRUxMTm1KaVRmRVgyYWhIdlhuYTJRZ1NqKzVSbTJxQkdmdkRM?=
 =?utf-8?B?SmJrRDY3b3dHR29rL05EZ0JiN2tPeWowSk00VkhxUlg4a1JxdUR6V0pMd3RN?=
 =?utf-8?B?cmpLNFZMVml3ZzBuK1lJTlFoNWxONW13emxuTTdmdVY3NnQ5aURUTXE3MmdH?=
 =?utf-8?B?dzN5QjMrc0pxZ2hoWjlMNUtkd2ZJNkNNWHppbHQyNlZqSFBMY2RSOHkyN29R?=
 =?utf-8?B?OVJGZGtKUkJUSEJtcVJQNzhmclNnRUgzZDh1NjhmMXM0bWZRL3N4L0dITFlm?=
 =?utf-8?B?UGwzL0VyTGJkME9WN3hSejhWYzdCejBDMExJcFYwOUFSb1VpWkxWUC9sTmIr?=
 =?utf-8?B?c3Y2bnB3Yzkyam0wRmFNcUdlUUZYbzBnWnpCOS81OTdsNWFFUEpXb1lXYzlo?=
 =?utf-8?B?OXc1NG4zUUlIK2V1ZkRmNENxRll1bXBUaFUvQWFSN2M3aG1HS0dyQmI4MWoz?=
 =?utf-8?B?NXhPbEcvd1NNOWtVUjlUYnJEVmRuREZra2JwbTg2OEsvcS96alQrSjBjVFVu?=
 =?utf-8?B?cUhJZ3dNM3d1anRNTzlHaW9jVXk4bkp0SGtkaW9WRUx5OWt1ZFJVOWtOZHNH?=
 =?utf-8?Q?pBDlr3CLrEgFDNJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E1DC31C719CC24785C2768F8D577573@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wqwU+xJVKjoihOg/OWwUfMxdbFwhW/ZYHjXjlC7bMx+Sm3jN498W3j4m+gDfHgt8jdO9xV2+AfMdjbOom7iB8eDoxjgr1gdvkb6woxTj4qGts1TY91oYfvMAPCg2N5ulDvxBNqz7NwUZUOhKiJWjdSHDlxklITwExUMmyhz1I94WZPMG0Cc1TNuI2TVlJKHfP1TLbLSiHV2TOGu8UHeHH18GOi4kYFbMJSrlxu9IbNTqQYOvNgIvfqlSmMMdhKnZScfGJ6Zm78FS84Z4+btKCmPKsOlF42FbhASeh3W869ru0NKA3xnZhv/rV24wjpbtJE2r1mYd1X9814Ws3Qxhdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974e0a88-82b4-40e6-4812-08de8e05c485
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 02:40:55.5489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JXQR+B1yth+GGQsHur3hdCz9Mm88igZQUZ6VZB13S6XEc2QI1G8v8QCel2T/aFCjXyi+znw/RuPqHsfJlTWmiBeDzkZCf40bd/uKquKCjIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9547
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

T24gRnJpLCAyMDI2LTAzLTI3IGF0IDEyOjQwICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gRnJpLCAyNyBNYXIgMjAyNiwgSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPiB3cm90ZToNCj4gPiBSZWZhY3RvciBmcmFtZWJ1ZmZlciBtYW5hZ2VtZW50IHRvIGltcHJv
dmUgcmV1c2FiaWxpdHk6DQo+ID4gLSBDcmVhdGUgZnJhbWVidWZmZXJzIG9uY2UgcGVyIENSVEMg
YXQgdGVzdCBpbml0aWFsaXphdGlvbiB2aWENCj4gPiDCoCBjcmVhdGVfZmJzKCkgYW5kIHJldXNl
IHRoZW0gYWNyb3NzIGFsbCBzdWJ0ZXN0cw0KPiA+IC0gQ2VudHJhbGl6ZSBjbGVhbnVwIGluIHJl
bW92ZV9mYnMoKSBjYWxsZWQgYXQgdGVzdCBmaXh0dXJlIGVuZA0KPiA+IC0gVXNlIHBlci1DUlRD
IGZyYW1lYnVmZmVyIGFycmF5IChkYXRhLmZic1tJR1RfTUFYX1BJUEVTXSkgaW5kZXhlZA0KPiA+
IMKgIGJ5IGNydGMtPmNydGNfaW5kZXggaW5zdGVhZCBvZiBzaW5nbGUgZ2xvYmFsIGZyYW1lYnVm
ZmVycw0KPiA+IA0KPiA+IEVhY2ggZnJhbWVidWZmZXIgaXMgY3JlYXRlZCB3aXRoIHRoZSBhY3R1
YWwgcmVzb2x1dGlvbiBvZiB0aGUgZmlyc3QNCj4gPiBvdXRwdXQgdGhhdCBjYW4gY29ubmVjdCB0
byB0aGF0IENSVEMsIGF2b2lkaW5nIGJ1ZmZlciBzaXplIG1pc21hdGNoDQo+ID4gaXNzdWVzIChl
LmcuLCAzNTA0eDIxOTAgcGFuZWwgaW5jb3JyZWN0bHkgdXNpbmcgMzg0MHgyMTYwIGJ1ZmZlciku
DQo+ID4gDQo+ID4gRm9yIE1TVCB0ZXN0cywgbXVsdGlwbGUgb3V0cHV0cyBzaGFyZSBiYW5kd2lk
dGggYW5kIG1heSByZXF1aXJlDQo+ID4gbW9kZQ0KPiA+IG92ZXJyaWRlIHRvIGZpdCB3aXRoaW4g
YmFuZHdpZHRoIGNvbnN0cmFpbnRzLiBXaGVuIG1vZGUgb3ZlcnJpZGUNCj4gPiBjaGFuZ2VzIHRo
ZSByZXNvbHV0aW9uLCBwcm9wZXJseSBkZXRhY2ggcGxhbmVzIGJlZm9yZSByZW1vdmluZyB0aGUN
Cj4gPiBleGlzdGluZyBmcmFtZWJ1ZmZlcnMsIHRoZW4gcmVjcmVhdGUgdGhlbSB3aXRoIHRoZSBu
ZXcgZGltZW5zaW9ucy4NCj4gDQo+IEZlZWxzIGxpa2UgdGhlcmUncyBhIGJ1bmNoIG9mIGNoYW5n
ZXMgZ3JvdXBlZCB0b2dldGhlciBpbiBvbmUgY29tbWl0DQo+IHRoYXQgc2hvdWxkIHByb2JhYmx5
IGJlIHNwbGl0IHVwLg0KPiANCj4gRm9yIGV4YW1wbGUsIHBhc3NpbmcgdGhlIGNydGMgYXJvdW5k
IGlzIGEgY2hhbmdlLiBBZGRpbmcgdGhlIGZiDQo+IGNsZWFudXANCj4gaXMgYW5vdGhlci4gQWRk
aW5nIG11bHRpcGxlIGZicyBpcyBhbm90aGVyLg0KPiANCj4gVGhlIHBvaW50IGlzLCBpZiBhIGJp
c2VjdGVkIHJlZ3Jlc3Npb24gbGFuZGVkIGhlcmUsIHdvdWxkIHlvdSBiZSBhYmxlDQo+IHRvDQo+
IGltbWVkaWF0ZWx5IHRlbGwgd2hhdCB0aGUgcHJvYmxlbSBpcz8NCj4gDQoNCkhpIEphbmksDQoN
ClRoYW5rIHlvdSBmb3IgdGhlIHRob3JvdWdoIHJldmlldyBhbmQgc3VnZ2VzdGlvbnMhDQoNCkkg
d2lsbCBzcGxpdCB0aGUgY29tbWl0IGludG8gMyBsb2dpY2FsIHBhdGNoZXMgZm9yIGVhc2llciBi
aXNlY3Rpbmc6DQotIFBhdGNoIDE6IEFkZCBwZXItQ1JUQyBmcmFtZWJ1ZmZlciBpbmZyYXN0cnVj
dHVyZQ0KLSBQYXRjaCAyOiBQYXNzIGNydGMgcGFyYW1ldGVyIGFuZCB1c2UgcGVyLUNSVEMgRkJz
DQotIFBhdGNoIDM6IEFkZCBGQiBjbGVhbnVwIGZvciBNU1QgdGVzdHMNCg0KPiA+IFN1Z2dlc3Rl
ZC1ieTogS2FydGhpayBCLlMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1i
eTogRmVpIFNoYW8gPGZzaGFvQGNocm9taXVtLm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNv
bi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gwqB0ZXN0
cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgfCAxOTAgKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0NCj4gPiAtLS0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKyks
IDQ4IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29udGVu
dF9wcm90ZWN0aW9uLmMNCj4gPiBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYw0KPiA+
IGluZGV4IGNhZjNkN2E1NmFlNC4uOGIxMzEyNzdmZmVhIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3Rz
L2ttc19jb250ZW50X3Byb3RlY3Rpb24uYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19jb250ZW50X3By
b3RlY3Rpb24uYw0KPiANCj4gPiBAQCAtMjU4LDcgKzI2MywxNSBAQCBjb21taXRfZGlzcGxheV9h
bmRfd2FpdF9mb3JfZmxpcChlbnVtDQo+ID4gaWd0X2NvbW1pdF9zdHlsZSBjb21taXRfc3R5bGUp
DQo+ID4gwqAJfQ0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gLXN0YXRpYyB2b2lkIG1vZGVzZXRfd2l0
aF9mYihpZ3Rfb3V0cHV0X3QgKm91dHB1dCwNCj4gPiArc3RhdGljIGlndF9jcnRjX3QgKm91dHB1
dF9nZXRfZHJpdmluZ19jcnRjX2Fzc2VydChpZ3Rfb3V0cHV0X3QNCj4gPiAqb3V0cHV0KQ0KPiA+
ICt7DQo+ID4gKwlpZ3RfY3J0Y190ICpjcnRjID0gaWd0X291dHB1dF9nZXRfZHJpdmluZ19jcnRj
KG91dHB1dCk7DQo+ID4gKw0KPiA+ICsJaWd0X2Fzc2VydChjcnRjKTsNCj4gPiArCXJldHVybiBj
cnRjOw0KPiA+ICt9DQo+IA0KPiBJJ20gcGVyc29uYWxseSBub3QgZm9uZCBvZiBhYnN0cmFjdGlu
Zy9oaWRpbmcgYXNzZXJ0cyBsaWtlIHRoaXMuIERvDQo+IHlvdQ0KPiBldmVuIG5lZWQgaXQgcmVh
bGx5PyBJdCdzIGEgdGVzdCBsb2dpYyBpc3N1ZSBpZiB5b3UgaGl0IHRoaXMuDQo+IA0KDQpJIHdp
bGwgcmVtb3ZlIG91dHB1dF9nZXRfZHJpdmluZ19jcnRjX2Fzc2VydCgpIGhlbHBlciBmdW5jdGlv
biBhbmQgdXNlDQppZ3Rfb3V0cHV0X2dldF9kcml2aW5nX2NydGMoKSBkaXJlY3RseSB3aXRob3V0
IGFzc2VydGlvbnMuIEFzIHlvdQ0KcG9pbnRlZCBvdXQsIE5VTEwgY3J0YyB3b3VsZCBpbmRpY2F0
ZSBhIHRlc3QgbG9naWMgaXNzdWUgdGhhdA0Kc2hvdWxkIGZhaWwgbmF0dXJhbGx5IGZvciBlYXNp
ZXIgZGVidWdnaW5nLg0KDQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBtb2Rlc2V0X3dpdGhfZmIo
aWd0X291dHB1dF90ICpvdXRwdXQsIGlndF9jcnRjX3QNCj4gPiAqY3J0YywNCj4gPiDCoAkJCcKg
wqDCoCBlbnVtIGlndF9jb21taXRfc3R5bGUgY29tbWl0X3N0eWxlKQ0KPiA+IMKgew0KPiA+IMKg
CWlndF9kaXNwbGF5X3QgKmRpc3BsYXkgPSAmZGF0YS5kaXNwbGF5Ow0KPiA+IEBAIC0yNjgsMTgg
KzI4MSwxOSBAQCBzdGF0aWMgdm9pZCBtb2Rlc2V0X3dpdGhfZmIoaWd0X291dHB1dF90DQo+ID4g
Km91dHB1dCwNCj4gDQo+IA0KPiA+IEBAIC0xMTgwLDkgKzEyNjQsMTggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCB7DQo+ID4gwqBpbnQgaWd0X21haW4oKQ0KPiA+IMKgew0KPiA+IMKgCWlndF9maXh0
dXJlKCkgew0KPiA+ICsJCWlndF9jcnRjX3QgKmNydGM7DQo+ID4gKw0KPiA+IMKgCQlkYXRhLmRy
bV9mZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0FOWSk7DQo+ID4gwqAJCWlndF9k
aXNwbGF5X3JlcXVpcmUoJmRhdGEuZGlzcGxheSwgZGF0YS5kcm1fZmQpOw0KPiA+IMKgCQlpZ3Rf
ZGlzcGxheV9yZXF1aXJlX291dHB1dCgmZGF0YS5kaXNwbGF5KTsNCj4gPiArDQo+ID4gKwkJLyog
RW5zdXJlIGFsbCBDUlRDcyBjYW4gYmUgaW5kZXhlZCB3aXRoaW4gb3VyDQo+ID4gZnJhbWVidWZm
ZXIgYXJyYXkgKi8NCj4gPiArCQlmb3JfZWFjaF9jcnRjKCZkYXRhLmRpc3BsYXksIGNydGMpDQo+
ID4gKwkJCWlndF9hc3NlcnRfZihjcnRjLT5jcnRjX2luZGV4IDwNCj4gPiBJR1RfTUFYX1BJUEVT
LA0KPiA+ICsJCQkJwqDCoMKgwqAgImNydGNfaW5kZXggJXUgZXhjZWVkcw0KPiA+IElHVF9NQVhf
UElQRVMgJXVcbiIsDQo+ID4gKwkJCQnCoMKgwqDCoCBjcnRjLT5jcnRjX2luZGV4LA0KPiA+IElH
VF9NQVhfUElQRVMpOw0KPiANCj4gVGhpcyBpcyBoYW5kbGVkIGJ5IGlndF9kaXNwbGF5X3JlcXVp
cmUoKSwgYW5kIGlzIGNvbXBsZXRlbHkNCj4gdW5uZWNlc3NhcnkNCj4gaGVyZS4NCj4gDQoNCk9r
LCBJIHdpbGwgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBDUlRDIGluZGV4IGNoZWNrIGluIGlndF9t
YWluKCkgc2luY2UNCmlndF9kaXNwbGF5X3JlcXVpcmUoKSBhbHJlYWR5IGhhbmRsZXMgdGhpcyB2
YWxpZGF0aW9uLg0KDQo+IEJSLA0KPiBKYW5pLg0KPiANCg0KSSB3aWxsIHNlbmQgdjUgc2hvcnRs
eS4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K
