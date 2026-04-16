Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97B2F8A140
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 08:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E14B10E840;
	Thu, 16 Apr 2026 08:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ICgZn6by";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vdXMam5a";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972ED10E840
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:12:50 +0000 (UTC)
X-UUID: 0d7affc6396c11f1ae70033691e9ac7d-20260416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=SKwBHzP/lbRtUR/q+7KDkTBfmUG2Jh+IUpbHug0odlU=; 
 b=ICgZn6bym237FmSJGQJ9MgtH7CMdE24W1xVhcjDjNS2vvTzhR2/8A3fzC0vb96kyGN9dmA3NfjTJEC4nc9WO+WgNNfhaYWA9lCVKvd/F5tbqWjn2Z2TQx678009mr1pIC6LYiA2I8ApLHEorSHnrs003CU7h3uEyxsA1+ioQ27g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:985aa543-edaa-4553-a38d-151c750e4657, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:4d590195-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
 S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d7affc6396c11f1ae70033691e9ac7d-20260416
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 862392048; Thu, 16 Apr 2026 16:12:47 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 16:12:46 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 16:12:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo3xQ+jgNFWdn8EQKolTc38w3UKCFAJOUzIAmhcsFs+1fD6a5kR9SOh6xWlIQw2ryB//dCadGNcAfO4GaMY7PJGrAy8TNrHDynx/pzz0YVmTxXaoqzZWNPIdripnvbpA92dLyIg6LvO4mCTWwZ0OI4fnDRK9OAnSr97xnR98rDclrEaOlkOJ93+BIlOXrRck47Es+WUsQu94i7xBplzaSlB8dgPvopuvaJyznm7dnUOI3BOBbXVc0MOMmsJyqJIWO7xVC7Kvsu0MOaujOOr1IGcEvH4X8YBuzS1d4n1ERNUtaaj2YS7dCCPwE+6iG9P6DBmqUPzcui4ERmmENo6W9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKwBHzP/lbRtUR/q+7KDkTBfmUG2Jh+IUpbHug0odlU=;
 b=kzY0ncjYdT/CzhqijWsD4J5sHy/lQ5F5xq7j3YNsadk+mm56X8iq6nN0843vQka0tLPI749sA52td1iAjkDZ0ZRetxQZeZ1p+9O5y+CRS3SuR8eI/EiZjr5y92AoJnn6kDBdeAtWcFsPGpmDNdQpyDPBJX1ArOVcuHmlMDCF24L2pDhNnJXL3EsMzbJ//671d4hLoToPV69hLsVJe62AlymXpwJb7LuEP5QK2zV4pRXVi6G9ifwZwrMKSqSbLG/dcrGIBvwSoztugYlThUyhjkyokkgiztzG+JU20sDLyzmBfoDF8JmlYENPWDq4l2RapYJMOX+EcyCTSdlLkkrmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKwBHzP/lbRtUR/q+7KDkTBfmUG2Jh+IUpbHug0odlU=;
 b=vdXMam5aCCgu2c5iUvFh2YsOEo34k74jeMBZys/91MYT/X2IoDeFQs4VE0Pf5JDZJgdhCLJNEIQjvtkf8w6l+aBzGbC0VPm2VkaefFGViuytWcBhDCEkZWaHgLdS9bzLDYL8Tl4Etn4z063jHM3B7PzNqpSeiQ94R4dFF9sQ+qs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB8224.apcprd03.prod.outlook.com (2603:1096:405:14::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 08:12:42 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 08:12:42 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "jeevan.b@intel.com" <jeevan.b@intel.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "fshao@chromium.org" <fshao@chromium.org>
CC: "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Relax vblank timing tolerance
 from 1 scanline to 1%
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Relax vblank timing tolerance
 from 1 scanline to 1%
Thread-Index: AQHczUxiBp2QJ2IrsUWjvT+Z4fjlxLXhMP6AgAAmAIA=
Date: Thu, 16 Apr 2026 08:12:41 +0000
Message-ID: <f5fef861d2e27252d5f911b9ae4fdb2d94b9e2f8.camel@mediatek.com>
References: <20260416025408.2924216-1-jason-jh.lin@mediatek.com>
 <DM4PR11MB6312060B26A9D7B66930D2FC90232@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312060B26A9D7B66930D2FC90232@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB8224:EE_
x-ms-office365-filtering-correlation-id: 634fac91-0196-42df-adcc-08de9b8feeab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: hsV19fuG6b3DtBZUoXSkWmntS3A9u0F/Goid4xyHtLWf61huoN5twh67tlcXNL6X9auJZYK8xV0WM0Rr7LCn4lAAyUoYTt3vRKtxOYc7euWccAWajfuRNoJScp/3RDDru2CW3woh+h3ZVSNcCIFdMmy280FCvFzZ1dyaaNiOJ064frNbzt7DvVUbHAXfXdht6ZhMrSBYUPDu8KRBDkmeUfot61UOvK6sDVhYCiURn/hLlh4/9UUva9drxjs7S2nVywst8WCUrBw0OOIkWjxtTEeLA/6eR5Cd8WDe/v9oQI6Iq4RP8oQY4P931ttb39Y99ISPrzJtOokzVxk5BnQYfgwHjfSzGvf31V2ko5lMsqHUwDHHXrr9jochEXFbWMrglOFjop9BGwkLZ7w64+lCPG6qkNXWLeEjJdkyO3L0ymP3Wdy0YC8h4yh3jGxKTZlqNdbJPdFO118gs1blK3gXDXwqQb5x3qxQ/BChmh78ikimwaz33fAMipO1H/AlvryjAo0W7xcpBAN5VFw861rz/+f0siZ/EqIsb4BFnBanVo5UheMSxiROH6RSyEYsq8ScdVoCmpEKb7rVMZXBrvmEUWRzRJewo3DIX2AS8XlyNabj88aU8DhIPYeonL8k41QxSLNROAJPtmoPFOIGsNV+a/dTSvUtanh7ZfcrBzyeFCWFA3yNO0AAQxh6p6eHWXkiefZbv/4uM0PKRPziMlCluA44XM8M5/s8pIYmgzOZI5yC5XLpkPJWACEaBEVBfUgrxoYxTc1/F5MtngIg5SQLAOxB+3cQRaBGNn3KUVg/HLg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1lLM2hEd0lNN24zUnJuSHd0cUFYUW16NlNHU3Bid0w4MnF6ZDJDODdROEoz?=
 =?utf-8?B?cTdCeXF5NVBGcmU4TFhpSnVua3llaytncXh0dUYwdXhHTUViL09xanY2akVN?=
 =?utf-8?B?R3dqd2svd0M4TU5HcHlLa0ZlSDJTSnpxakp3Smt5WXlKTnFta3RYUHJxZTJW?=
 =?utf-8?B?OGw5bHZ6cERtWlZKOHZYTXpKWjNZaGFpZHZHc21Ib2F5Z24xR0Q0V1FzWjhV?=
 =?utf-8?B?QWdidy9vaTc0SXlnSXc4am1TRXZvVHdEVlNUQWNwekMwWS9GZDJuRTMvbmJG?=
 =?utf-8?B?ZjZKSWRiRjg1NzR6Zm1LNEsxZ2xXYXNUVlZXVStQRVdKU2p1SUZlc0NZaktY?=
 =?utf-8?B?YTNVS2Z2R2xOK3dmbDRCaXI0b3VtMnJteGFnaXhxalFOREV6QzB4Nk91eUlY?=
 =?utf-8?B?dkg1R3huVEM0UzNrVnM3NnlLVU1xbnZZSDc0RnJxS3RjSHN5WDRiVm5Nb2JO?=
 =?utf-8?B?a2NRUXdlb0lZMi92eW5tV3dtanhCUW1naWhBdUhGSmk5MG9ITmQvTkdyMHRj?=
 =?utf-8?B?dmtkZXllNlN2a3JvcXYvRy9QYVgzZDBmT2dJMGg0VS9VaGZUaUxYVXBHVmk4?=
 =?utf-8?B?L1hxeTh3TlpWSE9kOVVFY1drUkRRTGx0RVVSN3gwNW13bGRSYm5leC82eDN5?=
 =?utf-8?B?bjVTZGhHcmNvaHZ4bXFVTTM2VVBNU1A1bjYyRVhST0pjSlNMQnNBQXlhK2VE?=
 =?utf-8?B?UVJRcXhacFdDVEp6a3JobThPNXh2Qlg1enczR1ZYUWpNdzVlcVpycHZJVC9K?=
 =?utf-8?B?RzBBcHVQbjRuKytuVGdMdXUvaUhVcVFNVnBnTFJhY2pQaHBJSlplWnd4bDlO?=
 =?utf-8?B?VkQvSnAra0c5QTJiNmFtSjlmeXJhL1U3R3JUVUlnQ2k0QzBCRU1Ua1IyQzFa?=
 =?utf-8?B?VGx0cFdsUUk4S1gxTFJYSXlNUzQ5b3h6ZlJEaVF1R1E3c3FuclhxbWY4OTh1?=
 =?utf-8?B?bVVwM0trQ1A1cVR5TDlicEsraUlKVGJIeWo4RGZNbnRQSFBoZVd4MXJiZmND?=
 =?utf-8?B?cWNGYmptS0JVUGtES1FlRzZ0bzVKSmRtM1RZZ0JjZFhkWE5yNzZtLzVCQ1N2?=
 =?utf-8?B?MHNBUDNmeWQ4dXRPcFBrZDYzb3ZFcDlYN3Vla1d0Tllhc3VOK3FaQjkzNFM3?=
 =?utf-8?B?SDhOUzJGOHV3dFJzNUJsd05FUXlSNzNlUm5jakhLUCs1QUI0ZzRaWVJ2V253?=
 =?utf-8?B?dmJlVktudGF0NWovaWlOenJWSDQzVUJVR3BUaWIvODRrdWdIaGlpTDVTdGYx?=
 =?utf-8?B?dkx6UFRDMEhKSkJoUnMwWFByL1ZzUkxxbjRZdExrQUlXR3lGckJXMG5Nb3Jz?=
 =?utf-8?B?ZjJ0bTlwVjcwbWhYQU9UY1Z0MW5KeSs0YzcvMWNJQVJheUJLMkpKdjV4dmJw?=
 =?utf-8?B?YzNwcm5NTjFEcVZIa3pWMzRncFNVcmEvMCtMNC9Bdmg1dUgyZzBjQXZJZFhE?=
 =?utf-8?B?bGwrRFM1ci9kV25tYkpQcjVRaVVPNy9VZlhKYmpleDE5K0kyRzRDKzNyMFlU?=
 =?utf-8?B?eFZzQy94dW9TL1lCbG41TVFZZVVmQU54R3FNazQ4VzdoSHNLc1hsUWtkWEZk?=
 =?utf-8?B?MzNhcTA5T01jemxidCt5Tis5djBOay9YQVUrMEFXeWtrWjlSamFYbEg2cWsv?=
 =?utf-8?B?M2Vqd0JzTmFvSVdBWUo4azFRNnZMaFZRMjNxTzZFa1Z5MUF2NHlSOWlXN2xM?=
 =?utf-8?B?Rm5mbnNOZ3dPVGxvWTZ3YnUvc0prbFJXQ1RNTk5yakhvZkFYUGV4QmlMWi9i?=
 =?utf-8?B?Z0VzVG9xb3BYTWpvaG8zbFFwcVNwUGJRcWRCYkw3SHNZRk9CWXV4U3BLU0NH?=
 =?utf-8?B?aUdtSzg0aktsbzhvR0F0U3A5aStQN2NVU2czU0ZPWVR5U3BoWGpDOVNMVFkz?=
 =?utf-8?B?K09ueWkrVVpReWVJL2dxcnRWMjc1d0JISnltSlJGcXRMaFhDdndaVC85Umtr?=
 =?utf-8?B?elpaZmlyNS84OHh5VVdWQTlUb25IMGh2ZWhjcnJEcmhZVGZ6WlpuWXRQcW1o?=
 =?utf-8?B?NW5ZN3MrZUFkcy82ZytCcktoWWpqQnFrWXlWdlRxT2FNVzl3aWJZcytkMFZx?=
 =?utf-8?B?ZStIL29oenFkSUp1ZmpQeTk5R2czeEgxeHB2dkZMNDV1ZTVzYzROTkd1dHVM?=
 =?utf-8?B?aC9IRkk3a1hQZTFEU3RIVGtyYjhjV3Y1bzRqMzF2c0hRWFBUNGFsaEQ2ekM2?=
 =?utf-8?B?SzJzdmZabVkxeStNcDVwaVhLRkF2amVmUDVOLzNmb0dhYVpnYzBRSDdqWGJC?=
 =?utf-8?B?bzJSSFUraytQeG5HUjdYdVFRRWdzR2tPVVM5UDdkbE13Z0o0RmRvWEdDN29Y?=
 =?utf-8?B?L0hDaW1QZnlLbTdjSndaeWlYMU1nRS82QjZhZzBwMHgrclFHN1JSdlU5cTE4?=
 =?utf-8?Q?vr+N1Fa8JQgSDbpI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44FCD4623F37E1449E5AD95F10103F50@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tlfnAJBWAIqmJVnCSERLzPHw/JmD/LPTXlavUHPEj68aFq/qIw3aD5TfO4+ZqgWh/CCxszne5sU86EhnppQnwqwmAa0NWuU2mFZrEl0sZuBK3I6v2HiLLu+x+HWwkSfIFWl15icZcQ8fT4Wy0bhyvSm6fDzpBDhxEexLtCEk8bWFgKbzt5ZCd/v9zt6P3aaF2epfgpVh9dhpuvblJG4Cf/JmFChsgKXW+dd1KOMS5Llmim4+s44/2iZWcgYfY0Sc1SDAeOQA8rxnHM/Ldh4SSMT92IS7t35lnB/4Kb2UoeDzvEH45IbHA0IMVOVmwTps9qkcoBC+Ykq413/56M4FrQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634fac91-0196-42df-adcc-08de9b8feeab
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 08:12:41.9663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWHm6ciduXSdFwbq/2EXXjI+QNPdDHWPKq5Bxakeb8s94OlwAjkun+3obD2c9tA+6aBxx5DaW1Wk5ZsdHIcjno+hGlWoMpaepNsOY+hXpsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8224
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

W3NuaXBdDQoNCj4gPiDCoAlpZiAoZmFicyhtZWFuIC0gZXhwZWN0ZWQpID49IG1heChsaW5lX3Rp
bWUoa21vZGUpLCAxLjcxOCAqDQo+ID4gc3RkZGV2KSkgew0KPiA+IC0JCWlndF9pbmZvKCJ2Ymxh
bmsgaW50ZXJ2YWwgZGlmZmVycyBmcm9tIG1vZGVsaW5lIQ0KPiA+IGV4cGVjdGVkDQo+ID4gJS4x
ZnVzLCAiDQo+ID4gLQkJCSAibWVhc3VyZWQgJTEuZnVzICstICUuM2Z1cywgZGlmZmVyZW5jZQ0K
PiA+ICUuMWZ1cyAoJS4xZg0KPiA+IHNpZ21hLCAlLjFmIHNjYW5saW5lcylcbiIsDQo+ID4gKwkJ
aWd0X3dhcm4oInZibGFuayBpbnRlcnZhbCBkaWZmZXJzIGZyb20gbW9kZWxpbmUhDQo+ID4gZXhw
ZWN0ZWQNCj4gPiAlLjFmdXMsICINCj4gPiArCQkJICJtZWFzdXJlZCAlMS5mdXMgKy0gJS4zZnVz
LCBkaWZmZXJlbmNlDQo+ID4gJS4xZnVzICglLjFmDQo+ID4gc2lnbWEsICUuMWYgc2NhbmxpbmVz
KSAtICINCj4gPiArCQkJICJzdHJpY3QgY2hlY2sgZmFpbGVkIGJ1dCBjb250aW51aW5nIHdpdGgN
Cj4gPiByZWxheGVkDQo+ID4gdmFsaWRhdGlvblxuIiwNCj4gPiDCoAkJCcKgIGV4cGVjdGVkLCBt
ZWFuLCBzdGRkZXYsDQo+ID4gwqAJCQnCoCBmYWJzKG1lYW4gLSBleHBlY3RlZCksDQo+ID4gwqAJ
CQnCoCBmYWJzKG1lYW4gLSBleHBlY3RlZCkgLyBzdGRkZXYsDQo+ID4gwqAJCQnCoCBmYWJzKG1l
YW4gLSBleHBlY3RlZCkgLw0KPiA+IGxpbmVfdGltZShrbW9kZSkpOw0KPiA+ICsJfQ0KPiA+ICsN
Cj4gaW1obywgd2UgY2FuIGZpcnN0IHRyeSB0aGUgc3RyaWN0IGNoZWNrcywgYW5kIGlmIHRoZXkg
ZmFpbCwgZmFsbCBiYWNrDQo+IHRvIHJlbGF4ZWQgdmFsaWRhdGlvbi4gQW5vdGhlciBhcHByb2Fj
aCBjb3VsZCBiZSBhcyBzaG93biBiZWxvdy4NCj4gYm9vbCBzdHJpY3RfZmFpbGVkID0gZmFsc2U7
DQo+IA0KPiAvKiBTdHJpY3QgY2hlY2tzICovDQo+IGlmIChhY2N1cmFjeSA+PSBsaW5lX3RpbWUo
a21vZGUpKSB7DQo+IMKgwqDCoCBpZ3Rfd2FybiguLi4pOw0KPiDCoMKgwqAgc3RyaWN0X2ZhaWxl
ZCA9IHRydWU7DQo+IH0NCj4gDQo+IGlmIChmYWJzKG1lYW4gLSBleHBlY3RlZCkgPj0gbWF4KGxp
bmVfdGltZShrbW9kZSksIDEuNzE4ICogc3RkZGV2KSkgew0KPiDCoMKgwqAgaWd0X3dhcm4oLi4u
KTsNCj4gwqDCoMKgIHN0cmljdF9mYWlsZWQgPSB0cnVlOw0KPiB9DQo+IA0KPiAvKiBSZWxheGVk
IHZhbGlkYXRpb24gKi8NCj4gaWYgKHN0cmljdF9mYWlsZWQpDQo+IMKgwqDCoCBpZ3RfaW5mbygi
UGFzc2VkIHJlbGF4ZWQgdmFsaWRhdGlvbiAoc3RyaWN0IGZhaWxlZClcbiIpOw0KPiBlbHNlDQo+
IMKgwqDCoCBpZ3RfaW5mbygiUGFzc2VkIHN0cmljdCB2YWxpZGF0aW9uXG4iKTsNCj4gDQo+IHJl
dHVybiB0cnVlOw0KPiANCg0KVGhhbmtzIGZvciB0aGUgZ29vZCBpZGVhIQ0KSSdsbCBzZW5kIFYy
IGFzIHlvdXIgc3VnZ2VzdGlvbi4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K
