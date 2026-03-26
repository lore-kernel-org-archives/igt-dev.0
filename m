Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2851810A88E4
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 16:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFF410E1F9;
	Thu, 26 Mar 2026 16:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="VijwQNCF";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fRgqzgyE";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1176810E1F9
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 16:25:20 +0000 (UTC)
X-UUID: 5cd02fd4293011f1ae70033691e9ac7d-20260327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=PQNmx9lWvaQDR1q2Tbb/0RqrQlbOdDiWK8A9TlmOGPc=; 
 b=VijwQNCFtvIB6p/0jBZ1+2fqrYHjCFEdKVcXvc0or7/G7ZvU5q3jGToHFvMhFMwk3MW3cnRMu+FrTFrQPBgA2BYUSJfovzsTANc2GhBz7c/AuOWD/38NK24FHuW4bUBIv6PYFDVY7yJg59GEEP+ZqM//0wzlI48/4TZEeJjASKw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:dd176e46-e14d-48d6-b8c6-c1ad2aee471b, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:eb8b303f-41ee-42eb-90dd-1068410e1f48,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5cd02fd4293011f1ae70033691e9ac7d-20260327
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1687548494; Fri, 27 Mar 2026 00:25:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 00:25:10 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 27 Mar 2026 00:25:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olCEETQo0EgkNp/qu81He1YD0QoPelJJfPwcTtiU+FkST17Fr9rwiIF+BM4KkxaRSG0BzlvF02U3mSp9l08uM0XQhu9ms6FQWqCVZ/796Py2mZUWILt61JCjLLe+hjibITX143gae38EXlBmXK0WYcUMu6q1OsZe1WFGkCfx679bj+EOSU98Y2XLeEdI77mtYY6MlUoT+I3Y/lXyuAaU4tYu/vxwEyD+6q8q3dLIvlMwvX7V+QsSKQqFlewP+LBc0eBl6613DuhgMF5GazCaphK1cgE1C5rotLYVsUsLTKSK2er54fYpNLC9NO+o8LzwB8QcnuMRzmQ/EIOe0Ctwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQNmx9lWvaQDR1q2Tbb/0RqrQlbOdDiWK8A9TlmOGPc=;
 b=dVe9wCgfVp1h6EgH70hC0B1jlgheIHwiiu0sjmrQrXgMD4U3C2LBMH0k65SsJAgr92WomdKt9LkbIVr4P3DsttN4WwBxrU4sSTYnP4GXHw8Dj8GXlaUVchyYNAqYOl0T9cKVTP+5GYQhoqLcoXE0X/331h8Pm38gD+AZnemAYiF20L6FhNW1Y48iY8TpYmVDqbSPaKlk5HjIly0FzJKafQoPru7EZfKlvx9VHAUMg/E7u/2/GtmJ+2g5GPSqfO1+O24LG7JnYmPF88/M/Y8XnWTlcyBe6S8wXrMJwuYen9ic6mP03ORl18whQHSZtzdZclO7H5b53anySQAbaetgaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQNmx9lWvaQDR1q2Tbb/0RqrQlbOdDiWK8A9TlmOGPc=;
 b=fRgqzgyEbxI1NYafBeRV4NuFELt9txwfclTlYHNIliR0Fr0y5ZynA+O1edOGkNYIxluCem48ruqbabmDLvmFUytA5ndQm1+4ri7ZNAIPf93u1pK06ZF/snFLObZDTGYJeLnNAgsmvoAA8agpEIksbNdWDuMUqk76ziUYtpnIpTg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB9464.apcprd03.prod.outlook.com (2603:1096:101:2d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 16:25:07 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 16:25:06 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v3] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Topic: [PATCH i-g-t v3] tests/kms_content_protection: Optimize
 framebuffer management
Thread-Index: AQHctieabuRQnTMAmEqT67l/QnRpT7XANHiAgADZbYA=
Date: Thu, 26 Mar 2026 16:25:06 +0000
Message-ID: <9d080b0677d12cdc5c088a4ffaaee8c2226228d5.camel@mediatek.com>
References: <20260317160255.3351177-1-jason-jh.lin@mediatek.com>
 <30fc7420-6ccc-447a-bc56-cb106b587b10@intel.com>
In-Reply-To: <30fc7420-6ccc-447a-bc56-cb106b587b10@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB9464:EE_
x-ms-office365-filtering-correlation-id: ae9243c0-a6d3-407c-8a87-08de8b543de1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: k/OHcQrGR1CYmPgzxv3QvjkywrGYCXgi9AGbU+MN5JUvZg1WY38PT51JlPKcLYo9rqRnz54enKDLOng+cSTquNwAGB5fAPku6LwAeHSG3IC7u7UP1lpAsv1A3mDdGhYknFS51DThQik2SnP8OQKD10DUbPsqNoAiQXRgA0KEZpOmVky48xCFQ3+dk/wRAQZnIJM3xhiGBYvAhPkqiuSYO2fKNvBoinFxFcZG0M13Byh/Pvf5EUsjKUYe/OoUioVVrrSxddNsxUaBV0a33KCQ685nvCna7/wzOLpestIfA4PIYeJmhooY2lqBZAFD1mM6IynFPH/4d4jjyZjrNW8KLCjFNh2IBLEAPutesJveGumOhakco8bnevP0XRo2hmED7Q9QgYueU7G/HtTACeplqJndno0kjq9Ayf7YDBP3NuYxuigu0tFgEXqu3LqZI+UTnVLHL8bqcKFDyyoCehDcmu69CJYpoLMMS4pwfwc87vKZiG97HgRAMEuSqJ8DawIaZHbj1PwVNpT4HRqqJnh08Nq6N2RCP7pcNTt/8ql6tj67csJo7MzihM6guHefikqaJIXFkuzKaVumfpisHEZWOR4v+Zr0EJQY9paD9DZEDOjJ650eK/FZYW0DFLoVMIQ85wCDPBEty+oFakNd0RaANyI3180K0qz56STaiWVZtps/AqYKwyPKUp2Jhk8CuVLF5UqXL7Qygs9YAaik017X3ichYO92q7DzA9Fkh9rrqWFEhkN5ZY/nxARJ5ucP0J6MyeAtkOYJrLcShjMwstZQ8M1UdveMX4Yg/WzN8O91rak=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWNnMi9NWFhmUkducXZWaldEWEl1QXhEVTJVdmMrL24wMmt6MHE5eHZDeXBZ?=
 =?utf-8?B?a1pZMTJHbFlYemJpNUxuRzduTWlKQ2NSdGQ3ZXduTlYrOURHVHhxRU9HL1BY?=
 =?utf-8?B?bmlnZndoaTd2NEV3aGs1OFA3MnpmMThkWmcxbm9LYUplQkpHbDVwQ2R1WkZD?=
 =?utf-8?B?WUtFK2x0d2VzWkVVMjM2MlJzQml1RFIwNmgyUUJlRzJYUml3MVNUSVdyYmZj?=
 =?utf-8?B?Sm1sSDdqWXpYVDVHamJLUFFWU3k0d2dFbXdFTm5LU2Iwd3dzMkFsUXJyaG1K?=
 =?utf-8?B?S3VDdUJubmROSzhjanoyNllCSFF0TjA5cS94YWpvSDRDck1WUXJFK1NVblVJ?=
 =?utf-8?B?K2FMN0RnWndXblU0b0d6b0lqNGhMRktvdlZObmN5My85R1YyT3dIL0VmRzFs?=
 =?utf-8?B?SlpWSHFRY3lNVnZjczZ4R0dGSDB5UjRubUpSaEJJa1dyejYwMHdOYkh2dXl6?=
 =?utf-8?B?RUFZcnNZOE1FQU9MZVpacHR3amw4eUFxcjNsOWNJYWIyOGtleHlXS0NqSlE0?=
 =?utf-8?B?c2VNcVdjMkdjc0pnbkZzRFNiYnp0Mnk0ZHVSZmRZY2tYUlNXYXJvQ3hKN2pS?=
 =?utf-8?B?UU11ZFE3cnl1eVZMRnN2cmgvSDUzM01XWXRtYy9BMitlNDRsdzMyVzNLMUUr?=
 =?utf-8?B?OHZiODZLMEVFZTJkNzgvcWNaZmVGS1JIQzVEOUcwWUxWT2UyQzd1STBCQU02?=
 =?utf-8?B?RDNvaXcyTnNjci9obm1CeGYvQkJtSkVsREphL0VyZEREWEFkSUFjQk41bjhN?=
 =?utf-8?B?c3FhemhqN0ZOeXpxWWdWL2twSS9NeDJOZm9JR0lVZXJlajMxMzZmVmNPVDJo?=
 =?utf-8?B?TDRHeDBiQUhhOCtmUklwNnRzK2JFbFNWOWF1VzRrUEQzVkl6aG00cTdoTXJN?=
 =?utf-8?B?ckxBdnVsOFVzeXZEWlZWYjVMK25Zd0c5M290NUt1V0k2MngzaTFOWW83dXlJ?=
 =?utf-8?B?ZTdDZkhXNEhaQm5EaGhMVUxvdTZQL2IzYnNzT094MUx1QitvajlrSnE1dGtG?=
 =?utf-8?B?YldvSzRobmZTRWtoejVKUmZjTnFVV0owa2M1aWRtcWhqREJZTjE1UmJIOVVo?=
 =?utf-8?B?OG41TWNGclR2ZHpTenpHZk90RGordjdkRU5oYjhZc1VLczllVFUyUVNpRVd4?=
 =?utf-8?B?YkQvb21xN0c4RG9pN1I5ajVjU0lpSmNzUkZBWEh4QnEzNDVYT2t2L1pJZDhH?=
 =?utf-8?B?Mi8xZjJ2MjJmOEk3U1RSdnBsYnl1eUxrZXRON0NPU25wa0pWQld0L0FoK21T?=
 =?utf-8?B?VlJpcThpR3RDc1ErY1Y0M1V2Uk10ZXhvRG1WdXB2QUZrVWpSdmdWZ0U0azJ0?=
 =?utf-8?B?QWlFalNNZHI1MlZOSEVUekZRSyt1eDdzNzhjeGF2Q3AvN1V6MFRzcE4zc2V3?=
 =?utf-8?B?bjBSNGY5VmV2YnRmTEFsYWVERWVtdkowMGtvV2ZKTDNiYndPa241UnVGampJ?=
 =?utf-8?B?V1g2UTV3UE1BN2t1Zm9CU0lDcFVjUmxBVElpaG91WkdtNjNMMUpta2J3dkdJ?=
 =?utf-8?B?ME9RaEJUbXhPRzRaRmVxWlBWREd1Yy9SK2FZTFZUN0t5L3c5ZngrcGJ5dWZP?=
 =?utf-8?B?RDFkYjdDUElTYUxnbGJsSmJyUHhEZ2YwMmZrMnBFQU1uNEhvUXBGZ2kxWk1a?=
 =?utf-8?B?ajh5YUtTTDB1K2w5bTc3RWw4bGk4VDNZM1RyOGowZ3g0Q0dUL1NSVG5IK3N2?=
 =?utf-8?B?K0gyaVoveG0xTG5DMXJsL1BPOEpYbzg0dXBWQjZqZlFSMDNvMGlYTDdiVm96?=
 =?utf-8?B?Zklmei9CZ2ZIY3JpdE1tb21wdmtteDNLajMycXVsbkhoL2F5MldDMjlMUFBn?=
 =?utf-8?B?MGY2ZHY2WGt1Ny9YdmFCSTJGY1I2dGFObFJkQmJBWW9lbkx1M255bnVGemNN?=
 =?utf-8?B?Ty9LbXJCS2YrLzJqMG5XWHdYbFFaTTZWMkNQa2JYYWtubnJleCtHTEhsTytx?=
 =?utf-8?B?TmRaYVRUUEdWL1RNaDhkY1lIZlhiUjl4UXN3UVJHRCtuWjU4MUF1bTV6cVRv?=
 =?utf-8?B?RUZpK01kamNmcnZaMkN4bjMyUFMvUGlUOWFQTUlaZWg2bG94QWVpK1NRVURY?=
 =?utf-8?B?a3ZVa1J4S0JUWG4vbHV3aFJEbzc0cmgvRkRFTS9tZHhSb0t4cW9oR1p0Zks3?=
 =?utf-8?B?TTBBL3Q0YnVFSjNmU0FUUzllZVFKVVQrQTZXSzZxcUhncjZXOENWUWpGZ2hW?=
 =?utf-8?B?aXMzcEpJRnRnZ3FQVjRjMW55dk9lRHc5bi9BQzFTeWswMzYxVEwzMkVpV0Zh?=
 =?utf-8?B?c1UyWU1qeG1WK3pPNjVRQTNDcVFkcW9XbUpWZk9KUThoaGFqRFVUcjZjUEVQ?=
 =?utf-8?B?QVV1OVMwc2N5enBYYjNxL0J0QTduWG1xY1NUMmFDS0NidER4cllDUTJvL05l?=
 =?utf-8?Q?ZIB2mJIycwBJGguQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86247C9B4BC63A42913058B5ED2D086A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Jb2Pl5TlIy+Bi6B2a6Y9Z/MmfUe04MH+rig8ORdnANgPCZ4HFehO5CMOoeDgGtXrcndNOhJjROInv0l2uGGRn6qRpolhAGHv7n63QKNcAnqzbsWFSX3urbXlx475lEEqcJBZngAVABcVcSTem/iPDIHC5HNGha8tgePeFQ19vo/QWEtxny3Vv8pzOias3tbw6CTlGYDXqrGwA/SHQhTgx4Ne2Z7we2KEBVOrdFSBqasMPBjmLescGclV+rpelsOqT15YBhLcSVJZwrXFBqzZGx7RfAAVfMpn1ZkhYSrxzYeEN7gzlmgNUvdE5SKxIRQWL2oDMEjihr3Drq/rgO+PLg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9243c0-a6d3-407c-8a87-08de8b543de1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 16:25:06.4552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+AKXkaIvEUGN0a63EioaCXwQcCEQXjR6y5SEplyVVw215lvVy5LEoKM5bkIcOUFhnNY+dUeOX1V2peFw9SPY2eH09+INiW3/FOy1hlY/9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9464
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

W3NuaXBdDQoNCj4gPiBAQCAtODY5LDYgKzg5Myw3IEBAIHRlc3RfY29udGVudF9wcm90ZWN0aW9u
X21zdChpbnQgY29udGVudF90eXBlKQ0KPiA+IMKgwqAJaWd0X2NydGNfdCAqY3J0YzsNCj4gPiDC
oMKgCWJvb2wgcGlwZV9mb3VuZDsNCj4gPiDCoMKgCWlndF9vdXRwdXRfdCAqaGRjcF9tc3Rfb3V0
cHV0W0lHVF9NQVhfUElQRVNdOw0KPiA+ICsJZHJtTW9kZU1vZGVJbmZvICptb2RlOw0KPiA+IMKg
IA0KPiA+IMKgwqAJZm9yX2VhY2hfY3J0YyhkaXNwbGF5LCBjcnRjKQ0KPiA+IMKgwqAJCW1heF9w
aXBlKys7DQo+ID4gQEAgLTg4OSw3ICs5MTQsMzQgQEAgdGVzdF9jb250ZW50X3Byb3RlY3Rpb25f
bXN0KGludCBjb250ZW50X3R5cGUpDQo+ID4gwqDCoAkJaWd0X2Fzc2VydF9mKHBpcGVfZm91bmQs
ICJObyB2YWxpZCBwaXBlIGZvdW5kIGZvcg0KPiA+ICVzXG4iLCBvdXRwdXQtPm5hbWUpOw0KPiA+
IMKgIA0KPiA+IMKgwqAJCWlndF9vdXRwdXRfc2V0X2NydGMob3V0cHV0LCBjcnRjKTsNCj4gPiAt
CQlwcmVwYXJlX21vZGVzZXRfb25fbXN0X291dHB1dChvdXRwdXQsIGZhbHNlKTsNCj4gPiArDQo+
ID4gKwkJbW9kZSA9IGlndF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0KTsNCj4gPiArDQo+ID4gKwkJ
LyoNCj4gPiArCQkgKiBDaGVjayBpZiBmcmFtZWJ1ZmZlcnMgYWxyZWFkeSBleGlzdCBmb3IgdGhp
cw0KPiA+IGNydGMgZnJvbSBjcmVhdGVfZmJzKCkuDQo+ID4gKwkJICogU2luY2Ugbm9uLU1TVCB0
ZXN0cyBydW4gZmlyc3QgYW5kIHNoYXJlIHRoZQ0KPiA+IHNhbWUgZGF0YS5mYnNbXSBhcnJheSwN
Cj4gPiArCQkgKiB0aGUgZXhpc3RpbmcgRkIgbWF5IGhhdmUgYSBkaWZmZXJlbnQgcmVzb2x1dGlv
bg0KPiA+IHRoYW4gdGhpcyBNU1Qgb3V0cHV0DQo+ID4gKwkJICogcmVxdWlyZXMuIElmIHNvLCBw
cm9wZXJseSBkZXRhY2ggcGxhbmVzLCByZW1vdmUNCj4gPiBvbGQgRkJzLCBhbmQgcmVjcmVhdGUN
Cj4gPiArCQkgKiB3aXRoIHRoZSBjb3JyZWN0IGRpbWVuc2lvbnMgZm9yIHRoaXMgTVNUDQo+ID4g
b3V0cHV0Lg0KPiA+ICsJCSAqLw0KPiA+ICsJCWlmIChkYXRhLmZic1tjcnRjLT5jcnRjX2luZGV4
XS5yZWQuZmJfaWQpIHsNCj4gPiArCQkJaWd0X3BsYW5lX3QgKnByaW1hcnkgPQ0KPiA+IGlndF9v
dXRwdXRfZ2V0X3BsYW5lX3R5cGUob3V0cHV0LA0KPiA+ICsJCQkJCQkJCQ0KPiA+IAkgRFJNX1BM
QU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4gKw0KPiA+ICsJCQlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1h
cnksIE5VTEwpOw0KPiA+ICsJCQlpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksDQo+ID4gQ09N
TUlUX0FUT01JQyk7DQo+ID4gKwkJCWlndF9yZW1vdmVfZmIoZGF0YS5kcm1fZmQsICZkYXRhLmZi
c1tjcnRjLQ0KPiA+ID5jcnRjX2luZGV4XS5yZWQpOw0KPiA+ICsJCQlpZ3RfcmVtb3ZlX2ZiKGRh
dGEuZHJtX2ZkLCAmZGF0YS5mYnNbY3J0Yy0NCj4gPiA+Y3J0Y19pbmRleF0uZ3JlZW4pOw0KPiA+
ICsJCX0NCj4gPiArDQo+ID4gKwkJaWd0X2NyZWF0ZV9jb2xvcl9mYihkYXRhLmRybV9mZCwgbW9k
ZS0+aGRpc3BsYXksDQo+ID4gbW9kZS0+dmRpc3BsYXksDQo+ID4gKwkJCQnCoMKgwqAgRFJNX0ZP
Uk1BVF9YUkdCODg4OCwNCj4gPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gKwkJCQnCoMKg
wqAgMS5mLCAwLmYsIDAuZiwgJmRhdGEuZmJzW2NydGMtDQo+ID4gPmNydGNfaW5kZXhdLnJlZCk7
DQo+ID4gKwkJaWd0X2NyZWF0ZV9jb2xvcl9mYihkYXRhLmRybV9mZCwgbW9kZS0+aGRpc3BsYXks
DQo+ID4gbW9kZS0+dmRpc3BsYXksDQo+ID4gKwkJCQnCoMKgwqAgRFJNX0ZPUk1BVF9YUkdCODg4
OCwNCj4gPiBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gKwkJCQnCoMKgwqAgMC5mLCAxLmYs
IDAuZiwgJmRhdGEuZmJzW2NydGMtDQo+ID4gPmNydGNfaW5kZXhdLmdyZWVuKTsNCj4gPiArDQo+
IA0KPiBEbyB3ZSByZWFsbHkgbmVlZCB0aGlzIHJlY3JlYXRpb24gaGVyZSBiZWZvcmUgd2UgZXZl
biB0cmllZCANCj4gJ2lndF9vdmVycmlkZV9hbGxfYWN0aXZlX291dHB1dF9tb2Rlc190b19maXRf
YncnPyBCZWNhdXNlIEknbQ0KPiB0aGlua2luZyANCj4gdGhhdCB0aGUgbW9kZSB3ZSBnZXQgaGVy
ZSBzaG91bGQgYmUgdGhlIHNhbWUgYXMgd2UgZ290IGVhcmxpZXIgaW4gdGhlDQo+IGNyZWF0ZV9m
YnM/DQo+IA0KDQpIaSBLYXJ0aGlrLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXchIFlvdSdy
ZSBhYnNvbHV0ZWx5IGNvcnJlY3QuDQoNClRoZSBmcmFtZWJ1ZmZlciByZWNyZWF0aW9uIGhlcmUg
aXMgdW5uZWNlc3Nhcnkgc2luY2UgdGhlIEZCIGNyZWF0ZWQgaW4NCmNyZWF0ZV9mYnMoKSBhbHJl
YWR5IGhhcyB0aGUgY29ycmVjdCBkaW1lbnNpb25zIGZvciB0aGlzIG91dHB1dC9DUlRDDQpjb21i
aW5hdGlvbi4gQWx0aG91Z2ggd2Ugd2lsbCB0ZXN0IG5vbi1NU1QgYmVmb3JlIE1TVCB0ZXN0IGNh
c2UsIHRoZQ0KcGh5c2ljYWwgb3V0cHV0IGNvbm5lY3Rpb24gYW5kIENSVEMgcmVsYXRpb25zaGlw
IHdvbid0IGNoYW5nZSB1bnRpbA0KaGVyZS4NCg0KSSB3aWxsIGZpeCB0aGlzIGluIHRoZSBuZXh0
IHZlcnNpb24gYnkgcmVtb3ZpbmcgdGhpcyBhbmQgZGlyZWN0bHkgdXNpbmcNCnRoZSBleGlzdGlu
ZyBmcmFtZWJ1ZmZlcnMuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiBSZWdhcmRzLA0K
PiBLYXJ0aGlrLkIuUw0K
