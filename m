Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0475EEA3F38
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 10:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB58710E542;
	Tue, 10 Feb 2026 10:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="J72NFcLd";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nnu/ngZw";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF3910E542
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 10:15:16 +0000 (UTC)
X-UUID: 62400f64066911f1b7fc4fdb8733b2bc-20260210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=4ovlxmZ+5kMCW349n2+xdlRyGM3u/42L1ec/zS+QwSU=; 
 b=J72NFcLdlxqDxGEc9G9XOCvWcuh0OoJGckCG0wa9CK0kMe9Weesz9hZ+Yu1ENiXoM5j/8VNAcxJVVH1kSYJQMXoRH/6+2cmFNVsYwobRM+BEd6UEFG7SyDvuPzDyDP3D3tDC7uHOjv3697xhUk9ni6Yyr8HMK+JrNZYWqXYAbxA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:8739d2a6-a418-4f7a-8264-bee912196617, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:89c9d04, CLOUDID:ae008af0-16bd-4243-b4ca-b08ca08ab1d8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62400f64066911f1b7fc4fdb8733b2bc-20260210
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 65155089; Tue, 10 Feb 2026 18:15:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Feb 2026 18:15:10 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Feb 2026 18:15:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Epi81AO/ooHBpOjMeZcW4nL8w8fipeLN0UCLfZnADFQVDRi+6VZeWKUSbrfpMCBXDg12cCRPAXHlAlp+YQj/QYZlJdR0fLzEi6Flg2AwGVg6QIrlnNkRsKFPG0gDqnzLM1i4JpIQ9ykp6c0MTe5C9orlBMqakvq29i8Zf8+feU95KnCgUBU8R0hu8mBTwJs3Kcnvsw8w//N0LmuPBODNbcwH392lNEyANyolskT8h3wUq1EpaQDQcYl+97tYTauwZgxrprosJDtkM4r2+++mBTeSvTZKR+clS986jrYNshdSq1wVAi8zkWq08T1Fl+FF9qAIly2SQOZebVHYXpoOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8igcO7KLomrnz0Vv6XJrRdo4dBHrW4hwQCXjngi0Szw=;
 b=zPCAFduDcdgCek2U1ekCYD97UAKPxtnchL/8kqzZyifVg0+8pgee0BwyP7gd99lQIcX1yO0oHjTpjBCIOWjZZEgZ7MNY7EzhYTYaWI1dfcZuSOAoyjpVaxG0ef5a/PJxfyzfoBfPFdkKObopfMJzarZakNdHBVxQ13s3EyVC0yXNT3YzLIPkoEbBy2s80cNP5/yEJ8xf5I9MNs1ybV7ccRePzIZEfcMDKhmujMb9sjVJds+pIHrcXiLp3+3PTxDv7x8QFOylEQTDqiXtmfwgDHJ4E4GSYOIZVoR8eqNN/tPeocFHO3XE1f3FCfdH02eH3IUquYA54oqgo3mG5lZCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8igcO7KLomrnz0Vv6XJrRdo4dBHrW4hwQCXjngi0Szw=;
 b=nnu/ngZwpE4i2ZPjOPnLlnwnoPkY5XWaG1B0/lu/9AVKRa6ZANe5eco9wGNyg7YDaUpc3SyaNAW/7yD4EbJT5BY9BbaDlhyXECrStzmZwIJIVKHv5HmGmrEfANgconNnwmdO0XXA4NFqM4SGoUmCIjX5fnn7w2dQM42Jlhn6djE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OS8PR03MB8825.apcprd03.prod.outlook.com (2603:1096:604:289::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Tue, 10 Feb
 2026 10:15:07 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 10:15:05 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "fshao@chromium.org" <fshao@chromium.org>
CC: "markyacoub@chromium.org" <markyacoub@chromium.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t 0/2] Add MediaTek CTM color test support
Thread-Topic: [PATCH i-g-t 0/2] Add MediaTek CTM color test support
Thread-Index: AQHckC++TyCyliIvGEGseyHSy/rb1rV7y98A
Date: Tue, 10 Feb 2026 10:15:05 +0000
Message-ID: <828b2d14d2f2c061b01af5b83f388340e9e0ade5.camel@mediatek.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OS8PR03MB8825:EE_
x-ms-office365-filtering-correlation-id: e142408b-7345-46f7-c8e0-08de688d42ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ckpubzEyRDdTUEhKcWl1dnJ0a0pLaUZpaU12elZoWmtpdTltT1lxWjZzdy8r?=
 =?utf-8?B?Sm4vcVp4RFlKQTUxMEtRWEFUcWwyeFJIcDFmemhoa29NSllwY2puYnZxZ09y?=
 =?utf-8?B?azJpTnZQSnJaWlRnM2RIVjhBQkFMNjZubitSUGdCdkpMZW5WNkpIbjFLekhh?=
 =?utf-8?B?endXeGNka2JoN2tlV1lRUmIxYllDclBuVk14cmNCNHl4d2hlWDBNa0JKVXdz?=
 =?utf-8?B?SDJSVmNPODlqZzVyT1BkdEZyTDBIQWNUM2I4ank3MlpHUmp4U01lbWpLVmxz?=
 =?utf-8?B?bjdVQi9QMTVwQlRoN3gzZjYyRFh6Z3Z2Rmt1a0x2OTR5TnZuRDY3dktmMGsv?=
 =?utf-8?B?ak1INTFnb1IvNzhSNEhnNWltaC96OGI2b1BqempEbEUzVkh4YTRueUczd1Bk?=
 =?utf-8?B?cm1zM1RoT1FYcEdac2o2ZFZITEJDSkJkTGNsT00rU25MOUZTSWtHbHVjd2pq?=
 =?utf-8?B?TjVGM3I1eFF3bTVDbWo5Z1A5cjFKU2xCUWlxS2tNVlhIZ2xIY0pyZzVrVEZu?=
 =?utf-8?B?cVYrdFJHVXhMVFVmRmJRZWRwRmg0TExRSGY1ZS9yeVp2ZXJ1UWVLMXRYZjdy?=
 =?utf-8?B?azJVTUk5SkxqZ0szeHZxUXdEUW5oV2tNMWU1R0hCY21LZWVBdVIxY2FQcngw?=
 =?utf-8?B?VFZ2aGpkVVlXSmlIVDBmd1BSRUN2eEJnUnB5UWFROGM4YkN3TzVST1p2QnJS?=
 =?utf-8?B?TGprQXFUUVNwL29KMjJka0IveTlZa1E1STRNRlZKcitycnRSdUZnWjk3ak1L?=
 =?utf-8?B?b2lsWGZKOUVVK0NjQzZ1SjlJaDcwNjhaaXpHMlZpZHE3bzRuNTNWZm1PVlRq?=
 =?utf-8?B?dHZwNUoxVjlRRTY3dUp3NWJNN0F4bzllMzJxckVpTGFhK1F1V0JjQVZsSmk1?=
 =?utf-8?B?L2NXeGhhMkVGbE5Db3RMZmZCZmp3SjNMOGlYRXRTc1d1NTFOdDlqKzFFZmls?=
 =?utf-8?B?K3I4TkVPQWh0enlYbnZwSjJHdnNRbFJMOUFBQ3VxZXdaS2l3QVRxdzhqT1hx?=
 =?utf-8?B?dFZTa0ZiN1ByVlFFQmpZODZFd08va3ZNakc5Mzh2cXdWWGE3RzZtdXVkVmxW?=
 =?utf-8?B?bC8wclNMWno0aFdxNkxzWmlBUTNLbEJqUVI1QnFDL0FWS0FLcmJxWWNhUVI1?=
 =?utf-8?B?UVkvdmtkUEdlSGlFU05lUXRVTzc5cW02SEppZ3d1Unc2cEx6Yi9McWNnNERi?=
 =?utf-8?B?RXN5d0gvaWxhWk4xT2lFa3NKVmpuQmFUeERGRDhnRnpuQ2sxZXpDbjBtSDIr?=
 =?utf-8?B?OXZheUJ4K0lVaWpkd2ZKUTdqcDlQNktpWEp6ek1jMGlzMWxuSE42RERFOW5W?=
 =?utf-8?B?dVFsL3BpQ2NHSHc5Q2NRclJvRDAzNStqdWhuZlBsN0E3WjE4N1dUd3h6Smla?=
 =?utf-8?B?QkhNNXhkV0M5T1dWVFlmbmlNTjR5VXlPN3NVOHo2bWpmN0VVUlU3UWh4dWdJ?=
 =?utf-8?B?eXM4aXM3d1liSTdWMXR0U2FHSUlJMHZGRENHNFZQdWJWNExsR2h4ZzZwQXl0?=
 =?utf-8?B?b2hHVFc0NWVXMVdvMlRhY2UxQW4vbUp5TDdUSkVDZ1lqR1VyclRqLzRPTnly?=
 =?utf-8?B?UnJXQStZUXA4aTNYZzQ5SUxPMVgwZkdPUXZIdFZMNk0yakRLOUlIVG5uSVI3?=
 =?utf-8?B?eHE0SGxiK0FXSFpGYzZpVlMraUdSVS9FUFByZHo1bkdjcUwxV0U5aG1FZ05h?=
 =?utf-8?B?ZEFFUmhVcXdnVEwzOXdCbjdxLy9TSHgxYUxHM2RFY293WmE2dFlxZUJvUEQ5?=
 =?utf-8?B?NDVXYVQzWXVKL0xvOGFhOG9HbXBvQitVaWpqZXdSZW5UdW9DSUw3UDM4V2hV?=
 =?utf-8?B?N2xablRDZTFaQmk0TVNyMFZiMkVsenkxYWxZY0ZRUFdnbzEwKzVBcVorOHFo?=
 =?utf-8?B?WWxTcjcwRVNYVUUvSDVUQWhOVUxqUUptWHhvNUtwUmpwaFNLQmxMWTk5K0R2?=
 =?utf-8?B?aFZMa1lvdUVIOVFoUEx3bXY1ZEc5Z2xmTXl3NXZqdDdGV0tpWktjOEp6YWN5?=
 =?utf-8?B?YWl5RllzREVUdFpwcmxLN1dmSDEvY0R4bXVDTUF0T3JSK2ZNeXRSeUowc2JC?=
 =?utf-8?B?RDlES3lOWm1oQUZkZkZkOHdqcUMxUHRNUEJzMDg2anZpVFRBeDhNYnhYcGxi?=
 =?utf-8?B?c0JKeUdwWTJwQzBKUkwvZDhQSnh2ZmJycjhwVk9WMHArdWFXNHdvb3BTNHVN?=
 =?utf-8?Q?BD4etj6+wc1bDIliyVYy4fk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0QwV0hUeW9SaDlNVndtazlSZjFNRk1sb0NxT2RTK2tobGY3YmQ2a2FYV01P?=
 =?utf-8?B?alBpeDQyZnZvaWJFRkpjdmFlb3pQelhrK2UvVUJXaVVIb2lHQVlhMWhyM0dN?=
 =?utf-8?B?MXd4QXROWWpZUFlsM0UyWG4ycnl2SlB5eHlzN2ZGSHZnREJDdGFnREdaRE5z?=
 =?utf-8?B?RU43RUhOYjJaVi9nN25ET1ViMmxCTGsxbUpLa012a01OMnBzMlZyUC9SRDRB?=
 =?utf-8?B?NjVSNElwcEk2dkhJN1BZbGVGNXF3QnhZbWZ3eWoyV1Jwc01IdHczZVRnTitl?=
 =?utf-8?B?OVhTbXZNLzEvUDJQRjYxd2tBTnEveHVPUGRGaWlVVkRmUjhqcXJoLzJoQ3dt?=
 =?utf-8?B?UlVuQkJ3Y2EwNjNKOTg2UFRUUExKVWt2cmNtMVRvMEF1dDJiS0FDNVV0c0ox?=
 =?utf-8?B?ZE5waysrUEhqNW1hMjFlbEV3NyswSlV5UTVnSWpWNjNwUjJKMTBuYkZDc2xY?=
 =?utf-8?B?SklvY1g3RUw5TW1sT0RkR3RpcDlZM1lQeGtJdmEzUVl0eHpsdzhyeFFUYVoz?=
 =?utf-8?B?VHd5VEtUNHlTRWpmNmZFZ2N3OVQ0Tm9CN3M3aGE3VmdtYXlkcFNmdW1sUXhl?=
 =?utf-8?B?OWdqb2crenJqQmZjSXBhNEV5Wk9IK0J4eUh3Nndla3RKT1p2VXo2YUNMTmVr?=
 =?utf-8?B?M2NOVWZuMXl0Ymh3cFlzd3d4bTFoY0RJVGFNY241WDhoZ1BLWE1pbDdmUGpy?=
 =?utf-8?B?T0R3WXZtNTNKZ0J4TmxhdkdWajh6blRqdnVYSGxrdXl4ZHpreXBSMEJhbllu?=
 =?utf-8?B?M1pUS0s3SCtvV0JvNDFNMlVuUEFHbnJ0TkNZNTczOEZRNmJyM0xCTjFGcFJn?=
 =?utf-8?B?NlFaZlhiWFJJYnZsR2pmbkhENXBOSktqaWhGYUJCa0p3cHpYZzAxdlhFRUZy?=
 =?utf-8?B?UzlONTQyM2xxR0hMS3hXUmNXTFA2VExTaE9tclR5U05LbWlxSVEzN0Mva0xr?=
 =?utf-8?B?bzZZTE43OU5lbjFQdlorWjJ2aGFRdVpwdjJtVmQwaG5QT3VlRDJRcXVIN2R6?=
 =?utf-8?B?VDBPbkxwd0hVMW9yTjdFQ0dGaUJwb1dPU1Vya1VsSTNJeFg0UjlEazFlNWg4?=
 =?utf-8?B?YjJVSUFqQkpIeG8wZlhpSFAweGtCMGF2d2Y4dzA4NnUrK3NVUXI1enE4SjZ2?=
 =?utf-8?B?ZlptSlp2dk1CeW5xS1AxWjdiaEFVUDJuOWNycUErL2ZhdTh1R3ZjMDFYZGUr?=
 =?utf-8?B?OGV3dXFCTkdiSFhhaEdyZXpiL2pPakx0M3lNQ0JrT2YxRmhUdFUrUTgxSmVt?=
 =?utf-8?B?WmFNcnowYnkrMWZNUjFYdHJwOVZwbUU2aTgyMk1HdGFFVjVLRDZjbC9BVzQ0?=
 =?utf-8?B?SmFwQUlzR0NibXpNSWM2ZHAxd2hKMDRyd0RvY2d0ZVcyZVhHRmdRRDU2QURR?=
 =?utf-8?B?c29YMFdmN2Mwcm1heWxzU1JSMkFFRStJYmpoNUswcHJFRTBqV3hJbDdHUWNN?=
 =?utf-8?B?bVFYVXlZa2V1MEFlMkx3RDNOSjFJNkc3elBETjNTSWprc3dRRGNrLytmYXd3?=
 =?utf-8?B?ZmZmbmUzYU9NR0tLdGRucmlZeW1WRVZZU1hNa3MrNi9aNEpsRlN3SllqY3FU?=
 =?utf-8?B?OXN1cFFEZ042VmNQQTNXWE1VQVR3OHF1VTBoUUNXZS9nanh1L3pRQjRMQzli?=
 =?utf-8?B?OWV3TzJYTWhmMEg1WGxpM2dZbmovaW5xVVZ4SkVBeVZNbjdWSUhqbXcvVzZN?=
 =?utf-8?B?TjFDSzdtMDFweGowNXNRdmxQUGRsSCsvUTJQcVVxSXFtNEMyV1A3eVpkTER2?=
 =?utf-8?B?d3hFOWZSQU8xM2hWaDNBYVJXZ0ErU3czMUplZXI4TUIwMVZIUHpNd2dTaFdh?=
 =?utf-8?B?TGU1dXRnc0R6THZsUWk2b0svQ05mM3VyWUJxTVlFeEhiSndHU3N5Y3U2ckxt?=
 =?utf-8?B?bFYvbitvRHdTWXBkU1NRMy9sbVhVRzFGNUtxdXoxVFNsL3lEWURpWUhKTUpn?=
 =?utf-8?B?Z25qZWd1R2xwWHlHNWtHRm9xOHFRNk1JNUxaMUZuZDRIOEd6bHJ0dVpZanZn?=
 =?utf-8?B?bVVhcTVhWElHSmdlRUxBUEhCSWhFbC93dEM0WGMrUmwxaGV3WmpldDZ3djVX?=
 =?utf-8?B?L25VOTNrY0l2VmM4bnoyTnBxMllwMDdCanpPUWdTS2RmUFV3SUVVK2xqUW5v?=
 =?utf-8?B?V0dXSmZOYzVYYnZJaFBGRmQ1TlM5RUhOTVRQVjl5UXkxakZIc0thZG1wSmlW?=
 =?utf-8?B?bVBDQWJZWDlWWXdIOVNKRStpV08yeTgxYkZMaU1jZkNmMTIyZEVXQVNiY2pi?=
 =?utf-8?B?dm5iM2gwRWxidDM1Qm4vbU9FVVJOSWU5VkVHc3kyNkkrSW1Bdm84MUt4S0Z6?=
 =?utf-8?B?SXQzK2pvNndnQ0E3NlhzaWZnM0VOMHI3anJOSHR6eDdFYkdmaWVGVHIzYkV5?=
 =?utf-8?Q?KiYAAs0Q77+rZlLY=3D?=
Content-ID: <D1D693DB58FA1A448C6ABC5D5999E69A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e142408b-7345-46f7-c8e0-08de688d42ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 10:15:05.1187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKyhvNbggGWAIRdZYmj1CN0tZnAfYShaai293C1revPqNg/t3kcmYvbKC9x31lnWy5I30HZ9ch0QUAXyRG3b3FNJfY7zzy2P59SKikxTpGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8825
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_008_2011847264.361128881"
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

--__=_Part_Boundary_008_2011847264.361128881
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2FtaWwsIFZpbGxlLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCBndWlkYW5jZS4N
CkRvIHlvdSBoYXZlIGFueSBjb25jZXJuIG9uIHRoaXMgc2VyaWVzPw0KDQpJZiBldmVyeXRoaW5n
IGxvb2tzIGdvb2QsIGNvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBhcHBseSB0aGlzIHNlcmllcz8N
Ck11Y2ggYXBwcmVjaWF0ZWQhDQoNCk9uIFdlZCwgMjAyNi0wMS0yOCBhdCAxNjoyNCArMDgwMCwg
SmFzb24tSkggTGluIHdyb3RlOg0KPiBUaGlzIHNlcmllcyBhZGRzIE1lZGlhVGVrIGhhcmR3YXJl
IHN1cHBvcnQgZm9yIENUTSAoQ29sb3INCj4gVHJhbnNmb3JtYXRpb24NCj4gTWF0cml4KSBjb2xv
ciB0ZXN0cy4NCj4gDQo+IE1lZGlhVGVrIGRpc3BsYXkgaGFyZHdhcmUgaGFzIHR3byBzcGVjaWZp
YyBjaGFyYWN0ZXJpc3RpY3MgZm9yIENUTToNCj4gMS4gQ1RNIG1hdHJpeCB2YWx1ZSByYW5nZSBp
cyBsaW1pdGVkIHRvIC0yLjAgdG8gMi4wDQo+IDIuIEJpdC10cnVlIHJlc3VsdHMgYXJlIG9ubHkg
YWNoaWV2YWJsZSB3aXRoIDEwLWJpdCBjb2xvciBkZXB0aA0KPiANCj4gUGF0Y2ggMSBjbGFtcHMg
Q1RNIG1hdHJpeCB2YWx1ZXMgdG8gdGhlIGhhcmR3YXJlLXN1cHBvcnRlZCByYW5nZSB0bw0KPiBw
cmV2ZW50IHRlc3QgZmFpbHVyZXMgd2hlbiB2YWx1ZXMgZXhjZWVkIHRoZSBsaW1pdHMuDQo+IA0K
PiBQYXRjaCAyIHN3aXRjaGVzIHRvIDEwLWJpdCBjb2xvciBkZXB0aCBhbmQgWFJHQjIxMDEwMTAg
Zm9ybWF0IGZvcg0KPiBNZWRpYVRlayBkZXZpY2VzIHRvIGVuYWJsZSBhY2N1cmF0ZSBDUkMgdmFs
aWRhdGlvbi4NCj4gDQo+IEphc29uLUpIIExpbiAoMik6DQo+IMKgIHRlc3Qva21zX2NvbG9yOiBD
bGFtcCBDVE0gdmFsdWVzIHRvIC0yLjB+Mi4wIGZvciBNZWRpYVRlayBkZXZpY2VzDQo+IMKgIHRl
c3RzL2ttc19jb2xvcjogQWRkIDEwLWJpdCBjb2xvciBkZXB0aCBzdXBwb3J0IHRvIENUTSB0ZXN0
IGZvcg0KPiDCoMKgwqAgTWVkaWFUZWsNCj4gDQo+IMKgdGVzdHMva21zX2NvbG9yLmMgfCAzMCAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuNDMuMA0KPiANCg0K

--__=_Part_Boundary_008_2011847264.361128881
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0thbWlsLCYjMzI7VmlsbGUsDQoNClRoYW5r
cyYjMzI7Zm9yJiMzMjt5b3VyJiMzMjtyZXZpZXcmIzMyO2FuZCYjMzI7Z3VpZGFuY2UuDQpEbyYj
MzI7eW91JiMzMjtoYXZlJiMzMjthbnkmIzMyO2NvbmNlcm4mIzMyO29uJiMzMjt0aGlzJiMzMjtz
ZXJpZXMmIzYzOw0KDQpJZiYjMzI7ZXZlcnl0aGluZyYjMzI7bG9va3MmIzMyO2dvb2QsJiMzMjtj
b3VsZCYjMzI7eW91JiMzMjtwbGVhc2UmIzMyO2hlbHAmIzMyO3RvJiMzMjthcHBseSYjMzI7dGhp
cyYjMzI7c2VyaWVzJiM2MzsNCk11Y2gmIzMyO2FwcHJlY2lhdGVkIQ0KDQpPbiYjMzI7V2VkLCYj
MzI7MjAyNi0wMS0yOCYjMzI7YXQmIzMyOzE2OjI0JiMzMjsrMDgwMCwmIzMyO0phc29uLUpIJiMz
MjtMaW4mIzMyO3dyb3RlOg0KJmd0OyYjMzI7VGhpcyYjMzI7c2VyaWVzJiMzMjthZGRzJiMzMjtN
ZWRpYVRlayYjMzI7aGFyZHdhcmUmIzMyO3N1cHBvcnQmIzMyO2ZvciYjMzI7Q1RNJiMzMjsoQ29s
b3INCiZndDsmIzMyO1RyYW5zZm9ybWF0aW9uDQomZ3Q7JiMzMjtNYXRyaXgpJiMzMjtjb2xvciYj
MzI7dGVzdHMuDQomZ3Q7JiMzMjsNCiZndDsmIzMyO01lZGlhVGVrJiMzMjtkaXNwbGF5JiMzMjto
YXJkd2FyZSYjMzI7aGFzJiMzMjt0d28mIzMyO3NwZWNpZmljJiMzMjtjaGFyYWN0ZXJpc3RpY3Mm
IzMyO2ZvciYjMzI7Q1RNOg0KJmd0OyYjMzI7MS4mIzMyO0NUTSYjMzI7bWF0cml4JiMzMjt2YWx1
ZSYjMzI7cmFuZ2UmIzMyO2lzJiMzMjtsaW1pdGVkJiMzMjt0byYjMzI7LTIuMCYjMzI7dG8mIzMy
OzIuMA0KJmd0OyYjMzI7Mi4mIzMyO0JpdC10cnVlJiMzMjtyZXN1bHRzJiMzMjthcmUmIzMyO29u
bHkmIzMyO2FjaGlldmFibGUmIzMyO3dpdGgmIzMyOzEwLWJpdCYjMzI7Y29sb3ImIzMyO2RlcHRo
DQomZ3Q7JiMzMjsNCiZndDsmIzMyO1BhdGNoJiMzMjsxJiMzMjtjbGFtcHMmIzMyO0NUTSYjMzI7
bWF0cml4JiMzMjt2YWx1ZXMmIzMyO3RvJiMzMjt0aGUmIzMyO2hhcmR3YXJlLXN1cHBvcnRlZCYj
MzI7cmFuZ2UmIzMyO3RvDQomZ3Q7JiMzMjtwcmV2ZW50JiMzMjt0ZXN0JiMzMjtmYWlsdXJlcyYj
MzI7d2hlbiYjMzI7dmFsdWVzJiMzMjtleGNlZWQmIzMyO3RoZSYjMzI7bGltaXRzLg0KJmd0OyYj
MzI7DQomZ3Q7JiMzMjtQYXRjaCYjMzI7MiYjMzI7c3dpdGNoZXMmIzMyO3RvJiMzMjsxMC1iaXQm
IzMyO2NvbG9yJiMzMjtkZXB0aCYjMzI7YW5kJiMzMjtYUkdCMjEwMTAxMCYjMzI7Zm9ybWF0JiMz
Mjtmb3INCiZndDsmIzMyO01lZGlhVGVrJiMzMjtkZXZpY2VzJiMzMjt0byYjMzI7ZW5hYmxlJiMz
MjthY2N1cmF0ZSYjMzI7Q1JDJiMzMjt2YWxpZGF0aW9uLg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtK
YXNvbi1KSCYjMzI7TGluJiMzMjsoMik6DQomZ3Q7JiMzMjsmIzE2MDsmIzMyO3Rlc3Qva21zX2Nv
bG9yOiYjMzI7Q2xhbXAmIzMyO0NUTSYjMzI7dmFsdWVzJiMzMjt0byYjMzI7LTIuMCYjMTI2OzIu
MCYjMzI7Zm9yJiMzMjtNZWRpYVRlayYjMzI7ZGV2aWNlcw0KJmd0OyYjMzI7JiMxNjA7JiMzMjt0
ZXN0cy9rbXNfY29sb3I6JiMzMjtBZGQmIzMyOzEwLWJpdCYjMzI7Y29sb3ImIzMyO2RlcHRoJiMz
MjtzdXBwb3J0JiMzMjt0byYjMzI7Q1RNJiMzMjt0ZXN0JiMzMjtmb3INCiZndDsmIzMyOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMzI7TWVkaWFUZWsNCiZndDsmIzMyOw0KJmd0OyYjMzI7JiMxNjA7dGVz
dHMva21zX2NvbG9yLmMmIzMyO3wmIzMyOzMwJiMzMjsrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0NCiZndDsmIzMyOyYjMTYwOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsyNSYjMzI7
aW5zZXJ0aW9ucygrKSwmIzMyOzUmIzMyO2RlbGV0aW9ucygtKQ0KJmd0OyYjMzI7DQomZ3Q7JiMz
MjstLQ0KJmd0OyYjMzI7Mi40My4wDQomZ3Q7JiMzMjsNCg0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlDQogKioqKioqKioqKioqKioqKioqKioNClRoZSBpbmZv
cm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueSAN
CmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdl
ZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUg
bGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25h
dGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwgDQpkaXN0cmlidXRpb24s
IHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5n
IGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQogDQp0aGF0IHlvdSBo
YXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5k
ZXIgDQppbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVu
dHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9m
IHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19
LS0+

--__=_Part_Boundary_008_2011847264.361128881--

