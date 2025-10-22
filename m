Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D6ACCD1BB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 11:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50C210E176;
	Wed, 22 Oct 2025 11:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="J0p3TvVx";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YHmBTr+E";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E026110E176
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 11:16:34 +0000 (UTC)
X-UUID: 8d44e71caf3811f0ae1e63ff8927bad3-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=EkNzickDvZuYiySLABd6BMjK/XR1d2Thk2gwURPGJcc=; 
 b=J0p3TvVxfsJ1Oye5CS2Cg+qKQcqfEZQnZB2E5q21zcklw+jpktAvytDONsH/WpGGtGbjkBrdY3tjcl0CBcUN5t5zSKcqotXknFsAfFSrWLD7ivoOPXgH/t0qWSEZ9d7fj+Mk98m/3T7I+cnWxBarpigXfkNAPSkAHdwfyd50tKU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:2a6c4b98-5d7a-430f-9dfd-94cde51a722f, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:0fd0ebf0-31a8-43f5-8f31-9f9994fcc06e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:
 nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
 C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8d44e71caf3811f0ae1e63ff8927bad3-20251022
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1086756270; Wed, 22 Oct 2025 19:16:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 19:16:25 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 19:16:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rANcOqQVem/awxzTr3VfHTV/lTbxIkv3Njudf1hIXIcT+DmF54jJPl25jAvYsk025IP9HiuKG/RtEzjktsQuGhv/xojd+zVb4aulgcl0b5uN1d25X4LmyJuMa4rxLwcs3POfkaR+MAUPbJk44X10EJijE3UR91ra8u7lyj5mq7LS3U/v0q9qzjRWfrty7EPsHlcs9iAuAzWgd+z70qlE20MUx1LQPZVy9ugGCcShtpYKoLjvyDhDoCHgwCYgIJfh/PLdSQA90YFB3lliQhTha9WGvE875ZxFv2zwEBo0t1UqiSkh7CeHy+RPQRErb8GuaALiw9UsPBzYgVLWsuu0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8ng+OkIlcxDsr7rVqWorqJjnEbvZaBNooPLgqRbP9M=;
 b=ZzGxPhHrL+rrxCrK9td+sjnQbQgqm2L+slNrORvOLGzZ01UDIy8VaHyczfHtrUX0sXUZIFSCOIo8306ROsxwXScFK/A0LmX6F4OnXKrgHcrgDZLyhfHjx4xWl0MXKtEurH2Vvh7hdA5SASm/0LcOFiCtI0m5gWKO+tUX0JwDcD7pNoEl8Q2+1Zvy3xYE69NEpobjRqL6P7fz9Q2VjZLr8qaz7QCzvlXy68lXgXnhwxWd03cmgF1rxbghITre5UZSTziUikR0JV2fYKaEIaAfqfeCUYD+tNJ0ifEp94gC+Tc/D6iWwGQJnwTyVr68sqzZ5yxW7JXdYCWCQhNIIm4nWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8ng+OkIlcxDsr7rVqWorqJjnEbvZaBNooPLgqRbP9M=;
 b=YHmBTr+EKjtYDkXyzpmC/uQ5EUMGKx6qx1yPjVia3zRa3OLXh4zRaUbF9V1PlsrxecqYT4MXfTUutaxLwgGBitTuT5KLG308APiEzYtTkgUhniqKWC1we1Gjjhyf8yK1Bg7hwSN5wzoN3PRg3TQ7C//X6/4Z/CeGt9njvycPKbU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYZPR03MB7574.apcprd03.prod.outlook.com (2603:1096:400:3ca::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 11:16:23 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9228.016; Wed, 22 Oct 2025
 11:16:22 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
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
Subject: Re: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Thread-Topic: [PATCH i-g-t v2 5/5] lib/igt_edid: Fix monitor name parsing and
 trim EDID string padding
Thread-Index: AQHcQrG+xQaGWGCWJUG68YAqXMkrw7TN8hoAgAATGYA=
Date: Wed, 22 Oct 2025 11:16:22 +0000
Message-ID: <31c5cc112765c060e4dd723c5873988526fba63c.camel@mediatek.com>
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-6-jason-jh.lin@mediatek.com>
 <20251022100800.lpa2fibl3u662egy@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251022100800.lpa2fibl3u662egy@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYZPR03MB7574:EE_
x-ms-office365-filtering-correlation-id: 5a5775d6-f33e-4976-abee-08de115c6ead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Z05JZVFTUjhEaUNTTGdCZHNLL3VZZVBrTzhUY0hqQjBTSHRQd2pSZlVCVWI0?=
 =?utf-8?B?TUtIQ1c1N01QWTFpT1ZtNTg2ZENzS1dYUCt2Mk5CanF2MjRBeUlzTXFPbmRN?=
 =?utf-8?B?dTBxVkxYNVA5RjdNMkxoZ3FKdVpTNHdURWhhUURJYmxtSDFodnI5ckozVHpt?=
 =?utf-8?B?WXFhREJsS0ZQQlRTL3AveEdHeStmaGFIdTl0bmRPWERLUzhnOEpxK1B0cTVS?=
 =?utf-8?B?elJTVzMrLzZWaVlMakRJL1R6MVlycmp3QmpHblFxRjVwMTkweHFYdFpDa1I2?=
 =?utf-8?B?MDZBRnVjWkxhYmROZUhhVEg2aS9icFczQnRyRjE3bzFMemZ4dlhrQ2lsSXNu?=
 =?utf-8?B?NGhmODF2TGN0amovTk9xbm9MbHNuVmdJdnNHWk51RlpiemdNZ2JIRDdWdHdr?=
 =?utf-8?B?VEdaUU9ZWVkwbVNVbTQ0MHJYZXZkOW1GQlhkYlhFQWphNFVxTXM0NHlraUlZ?=
 =?utf-8?B?OG5sbmtoK2RoN3hMNXJHRjlKTWpQaFdQRnFhY2puNTcyODhQcUk0djlMNTZu?=
 =?utf-8?B?NWx5K3BKbWVpaWlyZitjb05nNUlGd2RUUU5TSElOTThvRVdYelE4bEpmd1Ba?=
 =?utf-8?B?SE9hdmw4TzZOd0RJYnpYVmtia0JyTDdUQTh3R0FxRmZOc0tLaTZzdXM4Q3dB?=
 =?utf-8?B?cndYM3o3dlQxUlBzaVdoWklod21jRlZGeEptMjdyUHZycEVRSE5qK1ZyUmxN?=
 =?utf-8?B?dE5KSmU0TTlKTW15Y2hGTXlDQ2xySFdEQVJuQko5aldidXZaSXRDWGtsdlVp?=
 =?utf-8?B?bHlGbzROVXQzQW5xZWZ1K2dWRkkrbzlIRlhxc25wOGpwbFNUcjhoMGZ4R0kz?=
 =?utf-8?B?R1czN2liRTZPQlc1MVRLTmNtQ3NvQ255enNCTVdYa3lDeUNyblBqWFJQcHJJ?=
 =?utf-8?B?MUFnSWlzREFJcGxoa0Z2V1czcWRiM1dyWG1ib2lUazIvTHNXWXZSZ3B4Y2dl?=
 =?utf-8?B?QlNaQU9oeGRGeVd6SjBDZTNSRlZVL3ZLZHBhUlJ5UGVpRFZYdE12YzdNZHp3?=
 =?utf-8?B?Q2x2b1R4R24rNG1JMkpDWWVZRHp1RDg5cXNBM2FWV1dFWk1xMVBDOVpnWDhn?=
 =?utf-8?B?VU9QRmc2TktEVmtNbmYyYXdUek5FNjU1NzNsYkQxeGcrNk5uUGcycWNIWTNu?=
 =?utf-8?B?bDNaSTA3ZkFwY2QvMUhzUERLMHEzVjVBZ25MUWRWQXEweEE0eTVtbCtCUUF1?=
 =?utf-8?B?VDAxZWVIbVZxSVRQOXFRV3lXTGh6aGlKR0twd2NvR3BzN0ZtQ3JWNTNGNVNU?=
 =?utf-8?B?U0ZmOXQvWEdsK1NaV2xjd0JCcjFVUGJwMm1BZm1LTDg0cWJQb0l1bk8rTkoz?=
 =?utf-8?B?SUJ3UzJIbURPcFpWNjYxSkhJcGdiQy9mN25jQ0llZTEwYm41SldXQmxrakJN?=
 =?utf-8?B?TUhTblhJdlFOc3h3YlZsK0dad0pxRFpPdXc0dENpZkFzVDBqT29XS25PLzFY?=
 =?utf-8?B?cWFtRE1GRHJ1UVBJdTN0L0xLL1p1dExtSjd4dEhUSVlndUlDUlZKUTdZU0RU?=
 =?utf-8?B?OXBhc2pudjNEMWZIaHgrbjRPWlg2MkszVTJxNlo5eDl2M0pLOGJ2dm5RTCs5?=
 =?utf-8?B?Q0IzSkJ2NG9RaHdPYm5YRDYwbitnZE04dWFGRmF4NW9qMWh5cTBTZnVjMFVt?=
 =?utf-8?B?Wkd1Vm1ZVENhRmlKaXBpTG9ueU5heTd0OTQ5YjJ6WVJnd2JQMW1pUGsvWDJx?=
 =?utf-8?B?MU5TbThkZDZGd0hIWE9vKzJVK0xNb2JiTGhCMUJvR2tLS1BscVI2ZnNsQW12?=
 =?utf-8?B?OVlybkFPdlNLZTBlYkVZL0FVcHZyVlROYjFZdHR2L3Y2S2tmbjhPVnZPd2FD?=
 =?utf-8?B?NXVMZjF2Tmo0YmlIYWlEWTZlaW5YTHcvTitjMlEzWGJIMWRlTnBIT1lMNWVQ?=
 =?utf-8?B?em1oVXEwR2VjMFVtQ1RLTmhqYzZ5WGhyakpTdXZuR1FXVU1PRWNtSmhUNVBY?=
 =?utf-8?B?OXk2aXByMmMrRktOY29OMjlEU3p5ZXZBcW9zY1JzT3FSS2N4eUtKam02T3hL?=
 =?utf-8?B?WDN1NDJvWmwzZlhpQTB2dlE3YkhRbk5HampuaW0rWmZtS2psNVRqdkprMnVC?=
 =?utf-8?B?dkxXaVdmZ1RWU2wwN2xPd3U1U1QvR21hS3RxQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXZhbGo4RlBmcWNXZ3V0VTNFYmZNUUZjQU9Kb2hQT2R1UjNyYjlYaVR4ajN1?=
 =?utf-8?B?ZStJWlJTbGpCd1duYkFiVHAxelRReUkyTlc5THlzc3JpSUpTWUtwazlpbHRU?=
 =?utf-8?B?RmJwWWxKNm9NZzhaVnM2MjhWQno2M2Z5Mm03UWs1MnF5a0dVWjJBLzgyR1pE?=
 =?utf-8?B?T1d5N0EzMG1GRW9tamg1QmhCd3pjQkxqV3VrTzk2ZTNuNGF6d2RmYkZYVFM5?=
 =?utf-8?B?djg1My9iSFJ5UEtSWEplRFNZRnJudEhTL3ZyVTRia01MR01RREZ6UEsrTGNn?=
 =?utf-8?B?NFIxTmFHa1NWVThnUWRhUDdZcXpXVnNHUkN6OThPTnJjQmFzZ281R0M5Y2pL?=
 =?utf-8?B?UHdKcmxjRVJOeE91RUg5U3VZU0Q0c3A4V3VzcG10NHB4Z3I3Q2dWUXhQbFp2?=
 =?utf-8?B?dm00MW1sRzZpRjdyclIzK3BNYXdWKzZxYU9NV1ZKeVpkZ29rOUdyL1JWNFVG?=
 =?utf-8?B?VTh2VHdjc2lCaWZ0cFNwTnVXUmN5UnlGTVJlSTJybXoydlVtVm9sZlZRR05O?=
 =?utf-8?B?MFp0cW1vTUpGVVFkOXo5S2t6aXdOUkt3YWYxSGRxV2hYU3FuM0RhVTA3ZFVR?=
 =?utf-8?B?YU1GZ1dGdnBDQkMwRTAvV0xnNXlOR0t2dUx5L1MxelNhc2szcjR4dXdXNEF3?=
 =?utf-8?B?WVpSOEN6M1pUWGJWb01KRjE3R1FITDVpT25RN2U2V3VtZTNOeGl0cEdmbEhm?=
 =?utf-8?B?S2ZBdVFtUFpuUVdCT0c1blN2M20xZ3J6akpMUlVIYnQ3THY1bEFGQXZEbDRa?=
 =?utf-8?B?MVpFek1qemJEb3JaYU5pYkprdWpYU3JkK0ZqcytXYmwwNUtlcHZ3V3RUWXl6?=
 =?utf-8?B?NklDdG9nREZBWmNnOVY0SzQ1d0dDMk1idFVXTzNGUXBVMThiejNvd21xeDU1?=
 =?utf-8?B?UkxhRGs5OHZaUC82c1hUWmxoSWc4Y1lOejMxdjR4TFlSRjNpU1VodVdpVzR4?=
 =?utf-8?B?bzZVRERZWG5HRUd5SHRTdWhTVTFPdUpnS090RThmY29IUVpITHhWTWpUaTBt?=
 =?utf-8?B?Y1VkSmFMSzJBTERlVkF0OFk2L2U0RGRTekwyVHg2d1pBQzVpU2F6L1dXZFg3?=
 =?utf-8?B?dzBzd1VpZ0gzWmNJQ3A1R3FKWDdNQ29WMUtyY2NCWSt6Ylg3RTJlb2M2dHda?=
 =?utf-8?B?UEwwTFhMWjJkLzN1ZTgvUXVBdkFkRHlUM1pvSWJQLzhabWNGSmE3TkE2YWR5?=
 =?utf-8?B?R2tKeUZ6OHJ5bjZUVG02VStWcU9JWDIzc1A4L3dyaGFWMWVSdkJYdlBuMjBD?=
 =?utf-8?B?dmw5VW82b3V0dXA0d3dqNTV1VCtYQ1Q2dXBSYW5lRGQ3aFZ1UTdTV0ZGTERW?=
 =?utf-8?B?MjBXMUZBMVJzMlZtbmJlQ2VmNDJCRDluelVMY25jQzFKL3J3SmlBWkk4dzQ0?=
 =?utf-8?B?Ym5uUkUzWlljWWk2L3B3VXBxbGRqQ1FzQjdIdnFTMTRNdzltWmxLTnVLTUN4?=
 =?utf-8?B?Njl4bW42QUpGWElLZXNHNXMraHI2ZC82ZjQ5R1JNQUhCekZzQTNrRkhMLzVH?=
 =?utf-8?B?UVBPdEJUdVBONmw1aFg0dEI0aGdDanpFaWpUUUdlZEdadURrUmhIelFWL1Ra?=
 =?utf-8?B?cW1zQ0E1SjhVeGF2UEN6aWRPYk92a052b1ljSWNBVzZ2bndQcFg2VFB2dURT?=
 =?utf-8?B?Q3lWNTVySm9xb1NtOG4xaG0rSFZOWHdQcVJsY2VFbXFrZUkxM21Bd0NHYWtq?=
 =?utf-8?B?OTNOaEVTL2Y1ZFlkc2tTb2FvZmc3VmIvQlFKMVFkaU1lWWg5QkpkZysrM2Rq?=
 =?utf-8?B?djd4THBaeG0rSlZLM3B4VndseTcxOFdSd0FrcGM1SWxMTUg1RmJ5RXFEaDJm?=
 =?utf-8?B?R2xqZUwzL25qTmZ0VWY5NkdiL2d3eU5vYytmeUM0U25yN0VZL3lUSlJweE9p?=
 =?utf-8?B?aGxzZm9jZlpRL1BOVlQxK09PZlZvMG1nL3YvbGxId1dXVXRvdmFLWWFGMGhZ?=
 =?utf-8?B?NENia3UxcmplanVna2ZicDVtODZPeHR6c3Q3ZjBjNjhXZDVHTDZwd0x4MlJ0?=
 =?utf-8?B?a3NpQ1lzeDV6WCs4VFRaZUNFYmI4OUNXZ1JGY1M2Q2Npb2h5c1NKN3U0YlBG?=
 =?utf-8?B?eUtWVHhtTDlCQStGdm0xb1Vpb3RuWndVaWFiT2U0MzFoaEZSREtUN09mMHlQ?=
 =?utf-8?B?dSt6d3kzcUZWaGZRRnh2K0ovTlFnWXNoY1h0S0hQbFlsYWVUMDQ2U0hHQ3E3?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <AE64B37193309246B473BEB8BADD9A73@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5775d6-f33e-4976-abee-08de115c6ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 11:16:22.4677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHfHMJWh1VxCpx8KbKrDD5Dr0W5/gPRn0C8oyGTPegQb9fDPklukCUExG80+Fux7NTMFWMUJCaaLX0sxAP5X0e2cSVP5COk6+I2JvNxFHD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7574
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1181250464.557300665"
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

--__=_Part_Boundary_005_1181250464.557300665
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

PiAKW3NuaXBdCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcyA9ICZucC0+ZGF0YS5z
dHJpbmc7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJuY3B5KG5hbWUsIGRzLT5z
dHIsIG5hbWVfc2l6ZSAtIDEpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZVtu
YW1lX3NpemUgLSAxXSA9ICdcMCc7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qIHJlbW92ZSB0aGUgcGFkZGluZyBzcGFjZSBmcm9tIEVESUQgKi8KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZm9yIChuID0gbmFtZV9zaXplIC0gMjsgbiA+IDAgJiYgaXNzcGFjZShu
YW1lW25dKTsgbi0KPiA+IC0pCj4gCj4gV2l0aCBzc2l6ZV90IGl0IGNvdWxkIGJlOgo+IAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKG4gPSBuYW1lX3NpemUgLSAyOyBuID49
IDAgJiYgaXNzcGFjZShuYW1lW25dKTsKPiBuLS0pCgpPSywgSSB0aGluayBJIGdvdCB5b3VyIHBv
aW50LgoKSWYgd2UgdXNlIHNpemVfdCBuID0gbmFtZV9zaXplIC0gMiwKd2hlbiBuYW1lX3NpemUg
PSAwLCB0aGVuIG4gPSAoc2l6ZV90KS0yLgoKbiA9IDB4RkZGRkZGRkYgLSAyIC8vIDMyLWJpdCB1
bnNpZ25lZAogID0gNDI5NDk2NzI5NAoKVGhlbiwgbiA+IDAgJiYgaXNzcGFjZShuYW1lW25dKSB3
aWxsIGJlIG91dCBvZiBib3VuZCBpbiBuYW1lW25dLgoKSSdsbCBmaXggdGhpcyBhdCB0aGUgbmV4
dCB2ZXJzaW9uLiBUaGFua3MhCgo+IAo+IHNvIGZvbGxvd2luZyBsaW5lOgo+IAo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZVtuXSA9ICdcMCc7Cj4gCj4g
d2lsbCBhY3R1YWxseSB0cmltIGl0IGludG8gZW1wdHkgc3RyaW5nLgo+IAo+ID4gKwo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWd0X2RlYnVnKCJNb25pdG9yIG5hbWU6ICVzXG4iLCBu
YW1lKTsKPiAKPiBXaGF0IGFib3V0IGluZm9ybWluZyBhYm91dCBlbXB0eSBuYW1lIGhlcmU/IEZv
ciBleGFtcGxlOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZ3RfZGVidWco
Ik1vbml0b3IgbmFtZTogJXNcbiIsIG4gPiAwID8gbmFtZSA6Cj4gIihlbXB0eSkiKTsKClN1cmUs
IEknbGwgYWxzbyBhZGQgdGhpcyB0byB0aGUgbmV4dCB2ZXJzaW9uLgoKUmVnYXJkcywKSmFzb24t
SkggTGluCgo+IAo+IFJlZ2FyZHMsCj4gS2FtaWwK

--__=_Part_Boundary_005_1181250464.557300665
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KJmd0OyYjMzI7CltzbmlwXQomZ3Q7JiMzMjsmZ3Q7JiMz
MjsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyO2RzJiMzMjs9JiMzMjsmYW1wO25wLSZndDtkYXRh
LnN0cmluZzsKJmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtzdHJu
Y3B5KG5hbWUsJiMzMjtkcy0mZ3Q7c3RyLCYjMzI7bmFtZV9zaXplJiMzMjstJiMzMjsxKTsKJmd0
OyYjMzI7Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7
JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtuYW1lW25hbWVfc2l6ZSYj
MzI7LSYjMzI7MV0mIzMyOz0mIzMyOyYjMzk7JiM5MjswJiMzOTs7CiZndDsmIzMyOyZndDsmIzMy
OysKJmd0OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7LyomIzMyO3JlbW92ZSYj
MzI7dGhlJiMzMjtwYWRkaW5nJiMzMjtzcGFjZSYjMzI7ZnJvbSYjMzI7RURJRCYjMzI7Ki8KJmd0
OyYjMzI7Jmd0OyYjMzI7KyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7Zm9yJiMzMjsobiYjMzI7PSYjMzI7
bmFtZV9zaXplJiMzMjstJiMzMjsyOyYjMzI7biYjMzI7Jmd0OyYjMzI7MCYjMzI7JmFtcDsmYW1w
OyYjMzI7aXNzcGFjZShuYW1lW25dKTsmIzMyO24tCiZndDsmIzMyOyZndDsmIzMyOy0pCiZndDsm
IzMyOwomZ3Q7JiMzMjtXaXRoJiMzMjtzc2l6ZV90JiMzMjtpdCYjMzI7Y291bGQmIzMyO2JlOgom
Z3Q7JiMzMjsKJmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMx
NjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjtm
b3ImIzMyOyhuJiMzMjs9JiMzMjtuYW1lX3NpemUmIzMyOy0mIzMyOzI7JiMzMjtuJiMzMjsmZ3Q7
PSYjMzI7MCYjMzI7JmFtcDsmYW1wOyYjMzI7aXNzcGFjZShuYW1lW25dKTsKJmd0OyYjMzI7bi0t
KQoKT0ssJiMzMjtJJiMzMjt0aGluayYjMzI7SSYjMzI7Z290JiMzMjt5b3VyJiMzMjtwb2ludC4K
CklmJiMzMjt3ZSYjMzI7dXNlJiMzMjtzaXplX3QmIzMyO24mIzMyOz0mIzMyO25hbWVfc2l6ZSYj
MzI7LSYjMzI7MiwKd2hlbiYjMzI7bmFtZV9zaXplJiMzMjs9JiMzMjswLCYjMzI7dGhlbiYjMzI7
biYjMzI7PSYjMzI7KHNpemVfdCktMi4KCm4mIzMyOz0mIzMyOzB4RkZGRkZGRkYmIzMyOy0mIzMy
OzImIzMyOy8vJiMzMjszMi1iaXQmIzMyO3Vuc2lnbmVkCiYjMzI7JiMzMjs9JiMzMjs0Mjk0OTY3
Mjk0CgpUaGVuLCYjMzI7biYjMzI7Jmd0OyYjMzI7MCYjMzI7JmFtcDsmYW1wOyYjMzI7aXNzcGFj
ZShuYW1lW25dKSYjMzI7d2lsbCYjMzI7YmUmIzMyO291dCYjMzI7b2YmIzMyO2JvdW5kJiMzMjtp
biYjMzI7bmFtZVtuXS4KCkkmIzM5O2xsJiMzMjtmaXgmIzMyO3RoaXMmIzMyO2F0JiMzMjt0aGUm
IzMyO25leHQmIzMyO3ZlcnNpb24uJiMzMjtUaGFua3MhCgomZ3Q7JiMzMjsKJmd0OyYjMzI7c28m
IzMyO2ZvbGxvd2luZyYjMzI7bGluZToKJmd0OyYjMzI7CiZndDsmIzMyOyZndDsmIzMyOysmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsm
IzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2
MDsmIzMyO25hbWVbbl0mIzMyOz0mIzMyOyYjMzk7JiM5MjswJiMzOTs7CiZndDsmIzMyOwomZ3Q7
JiMzMjt3aWxsJiMzMjthY3R1YWxseSYjMzI7dHJpbSYjMzI7aXQmIzMyO2ludG8mIzMyO2VtcHR5
JiMzMjtzdHJpbmcuCiZndDsmIzMyOwomZ3Q7JiMzMjsmZ3Q7JiMzMjsrCiZndDsmIzMyOyZndDsm
IzMyOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7aWd0X2RlYnVnKCZxdW90O01vbml0b3ImIzMy
O25hbWU6JiMzMjslcyYjOTI7biZxdW90OywmIzMyO25hbWUpOwomZ3Q7JiMzMjsKJmd0OyYjMzI7
V2hhdCYjMzI7YWJvdXQmIzMyO2luZm9ybWluZyYjMzI7YWJvdXQmIzMyO2VtcHR5JiMzMjtuYW1l
JiMzMjtoZXJlJiM2MzsmIzMyO0ZvciYjMzI7ZXhhbXBsZToKJmd0OyYjMzI7CiZndDsmIzMyOyYj
MTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYw
OyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMTYwOyYjMzI7aWd0X2RlYnVnKCZxdW90O01vbml0
b3ImIzMyO25hbWU6JiMzMjslcyYjOTI7biZxdW90OywmIzMyO24mIzMyOyZndDsmIzMyOzAmIzMy
OyYjNjM7JiMzMjtuYW1lJiMzMjs6CiZndDsmIzMyOyZxdW90OyhlbXB0eSkmcXVvdDspOwoKU3Vy
ZSwmIzMyO0kmIzM5O2xsJiMzMjthbHNvJiMzMjthZGQmIzMyO3RoaXMmIzMyO3RvJiMzMjt0aGUm
IzMyO25leHQmIzMyO3ZlcnNpb24uCgpSZWdhcmRzLApKYXNvbi1KSCYjMzI7TGluCgomZ3Q7JiMz
MjsKJmd0OyYjMzI7UmVnYXJkcywKJmd0OyYjMzI7S2FtaWwKDQo8L3ByZT4NCjwvcD48L2JvZHk+
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

--__=_Part_Boundary_005_1181250464.557300665--

