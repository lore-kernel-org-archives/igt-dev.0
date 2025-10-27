Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D2ACCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 17:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEC110E4F1;
	Mon, 27 Oct 2025 17:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HqFq51Xe";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FirEp09F";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0062610E4F1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 17:05:18 +0000 (UTC)
X-UUID: 194c5af2b35711f0ae1e63ff8927bad3-20251028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=C9rYWfJhj704LwS3K70URWu1u1XNCzal6Cbra50NHs8=; 
 b=HqFq51Xev7Pb92im63blErQFlIzkxn4dxCT3NnfT4O5xavvCyEmRRmTc5J0/QK30FMUGYbuX4XxTpCSTUpEmgNQPTN0T5xzjPm1JWMg4Ufs0/Z23L4d3CkVm+4awXU9cFHY46QJkTgh2W7BaX/YASyiLFIZvVhhomrjyOveS3MM=;
X-CID-CACHE: Type:Local,Time:202510280105+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:e992c338-ee5f-4d5c-a367-448d3eeb254b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:44a15b84-4124-4606-b51d-d5c9eec0e7b9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
 BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 194c5af2b35711f0ae1e63ff8927bad3-20251028
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1917562225; Tue, 28 Oct 2025 01:05:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 28 Oct 2025 01:05:06 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 28 Oct 2025 01:05:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEglpbmt/8SIaI1zCI0jTMKDGNw3zDBKyK3H5lsKbZB4zjTovKeFJh5WWVKHi5XYP7S/hUfpNWpk+owaTqRpGh7tdFnTrzmT1j1PbssMtgb8t+rwX+Xqp13qp9HcULbfUUD1kxXXGRyXLFpc3fF767hz2T/MsXNGiJIz089IbhntokjrwJO4JYiqFnTHBd6omqHW/Kjqyw586HrlR/76w3aD2auKFwKRvcmCOsFTzJIxQhfFXK2wOXzBguU8RYZl9hU4bSaKhOiptKgalfo76L9D+vCVsvgEXGZYGqRk7McRuriePho43nOrTXHOqYHY6ctx12rdVGbSMQgaGwoiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNdNSo+AbdE2HL540j8MIkqiGuLI/6TA8c79H0WXPTE=;
 b=getGZhvdstqKcqTMo/X2RxincOuKK6w44hz5INTxafF1fHuNumQJrA8mpX5771AruUPMkVQQol1ikjeeb+MKcByFlt1fkeWY08qqwzcTqLqJtc5Evl9BdWHNV1n3vNWPpmbYBYePZJKX7w187EINXynKyVf44cyKCV1MO2jtCUbIBtQ86pNOMN4RIZ15zZLXeRiA6RiM0nBw6fK0cl/Hitoqr4kBxHCS4YwHXs1c1sPP3uDREY5I/FCtFoXFe04XIOPZqY+WVRRPkn2fKx1rbFZj++AafcEOvt2gBVKC4FbuYHqDOQricldr/iUndc1xnNifIzFXatKfF7pFPs61Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNdNSo+AbdE2HL540j8MIkqiGuLI/6TA8c79H0WXPTE=;
 b=FirEp09FK26AIPIDsz6bVtZP9FEMpwQkeCzjlPMumP5WsdoHWt5OR9BUdfRdomWcPxrmO1YS7ts0sZDPaUabbVPyI618U6h2nl3o7xl6DTi9DMBmvugYBU+959/SWdh7+van8sUZQ9muxNAW9Emklh3EsMxMMozP/YYDus052nU=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8736.apcprd03.prod.outlook.com (2603:1096:405:55::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 17:05:04 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 17:05:03 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@google.com"
 <markyacoub@google.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "juhapekka.heikkila@gmail.com"
 <juhapekka.heikkila@gmail.com>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "gildekel@google.com" <gildekel@google.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>
Subject: Re: [PATCH i-g-t v2 2/5] tests/kms_content_protection: Add "SDC" to
 HDCP panel blocklist
Thread-Topic: [PATCH i-g-t v2 2/5] tests/kms_content_protection: Add "SDC" to
 HDCP panel blocklist
Thread-Index: AQHcQrG8S9Aia3BFUkye+k9/uS+3U7TN16+AgAHkp4CABoXygA==
Date: Mon, 27 Oct 2025 17:05:03 +0000
Message-ID: <406a91affd6456bb30110540389ed1c0b2e014f8.camel@mediatek.com>
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-3-jason-jh.lin@mediatek.com>
 <CAC=S1ni8gxFJC9Qu6UUx9BtOZUPLgm1vuwHcDe5ZdOw3kO89vQ@mail.gmail.com>
 <CAC0gqY6wHwvKzRcKB73n2kWuFXp2+F-Z2hru2vAPTjCmYL9hRQ@mail.gmail.com>
In-Reply-To: <CAC0gqY6wHwvKzRcKB73n2kWuFXp2+F-Z2hru2vAPTjCmYL9hRQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8736:EE_
x-ms-office365-filtering-correlation-id: 8b559ef9-539c-4b58-bb49-08de157af8c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Ly8zd3JaYkREZm5aSFlOTDkxQlZuMW5IcmRabzlqWmNZVTNPOGp0OUwzTG1S?=
 =?utf-8?B?SmRDRWNkV3ZEcnp2aTFZRUhZaDdiT1NqSEF6ZXB0cVlJV1VNNDhheWZXZWxw?=
 =?utf-8?B?ZmV6aE9odW1GMVFTSDhrYTRKRTNVRm1FZVBVWlhUN3BTRFo1ZTZDdEFMc1Nk?=
 =?utf-8?B?NUxJUnB4Q1lqd1V2bFdzb2I2NGJFaFhkb2lBaXp0WEFPbktKRHpHbC9oYW1X?=
 =?utf-8?B?a0hhUjJvMUVPbmJmUDY0SEViUHVLaHF4cFcyZ0hXaFVIand4ZzY2ajk1RVdJ?=
 =?utf-8?B?WitwbFpLaktjZWlOMm5uZDFUdDM4RHE2Y1BlQlduKzJRQVd3WmlDOTZaSzVV?=
 =?utf-8?B?K0VQajVXRmdOd2Vwak5oMDlBR0dmMzJ1R3FOR3pzUHFHN0dTbW1GUFpFeExq?=
 =?utf-8?B?bDQ1bzZuaDMzVXYrN1ViaGN3eGJhN2dZc2R0cU1SVjdyTWh4UjhydERxMTE1?=
 =?utf-8?B?MWNyVExtVUIrd1VwNEZnczM4eGVDaldWSjBnUTF6Nk10Njg4Q0pOVldzTzNz?=
 =?utf-8?B?QktnaWRlTW1MZXA5MzNWeG9YTFhJWFRzTm9wMkdLaTM4Z0RYRjFmcGlQUVFI?=
 =?utf-8?B?QWp4NEx4TGp6WU9QK1FpRDNLSGZGUmZucllySTRyanArV3UxUUQ4YzNjeHow?=
 =?utf-8?B?NE5KOGJDaDloU0JZckc0dE5iTFpKNGtiQTg3d29FOXVRTmlXQWlVdVhUckcx?=
 =?utf-8?B?Q1VOcEtXN3JJMVA1bThXd1BHWXdxNUZ6NGNYU2o3REg0cDZZWUJra1JPemRw?=
 =?utf-8?B?Q3JBUzdaOTlDMHZCNG5SUDRITTdlUG1iUHk0T0NpVW4rTHdORzdmL1Z6MUNN?=
 =?utf-8?B?UC9vYkJTSVVSQVJXNHFkckMzODVqYjNTZkxGMnJydHFKb3QrNXpQOHdieTRs?=
 =?utf-8?B?cUd4R3pMa05UTmIyWndVK2R0UGpoRUFLY1F0NUFSSGlZOG9CMUpWYTZIVSti?=
 =?utf-8?B?TjV5NzZJVVM1UEl1clJEWGlnN0g0YXhjbXpCTlpqWHVvZVdtdkJmYm9GZXlU?=
 =?utf-8?B?Z2RxREVhU1FFT0lvZ0hjMDYxUklTZFdWa3VLRlRUNlN1R3JNRjc3RkQ3c1Rk?=
 =?utf-8?B?NTRBQk40ZEFxOVJJN1lFYUNsWDJLL29MWjNKYjRiSlJFbjZZWEZvS0lJQ2Ew?=
 =?utf-8?B?OG5hRFRhNFlkazFmblVEL1RzYXhkVU56dFZpc05jT0RWcEhxMnRkSGdrcEdr?=
 =?utf-8?B?QThUeXlqdzV2VVhQd05PRG1pSG1UT2t2L3pNNU5ZNTJwdEJQaVBGVG5sc0dj?=
 =?utf-8?B?ZzNkUVRhVDFrT0lCak9qOXFZZ29STVFMcnZJYWFmY09FS3dJYlJhVGhPYU1q?=
 =?utf-8?B?bVpoVzJZZ0hxREtHZkF3QWdlcWJicnlUR2taR2xXK3V5b3JUTHpQZmFuYjRp?=
 =?utf-8?B?RnVMNi9BRm9Eb2s5Um1yR0p2V3ZvZ0FPaGR3cnpTaGJrMWJJcnlETWhkYkJV?=
 =?utf-8?B?Uk5CMGFCYUlISlJTNTlTbTZMVUNNY2M3cXFUTVZReDEwM1pDYzBvQ1R5UjZE?=
 =?utf-8?B?a0duMFhlOTkrUDBNTnZmYlF6eW0zSXBudnh0Q1VvLzIxVG13VGNvVjZVQWd4?=
 =?utf-8?B?YkFXM3NIbnJ5cXZtL0ZrQ0FzQjBMMFIxOGNZaWlSVVAyb2ovU1U1K3BJeU5i?=
 =?utf-8?B?SU5rclFaRGxJL1hLeENsZ2J3YlpBdmlYTE1YVDlpdjhNRERtblpRQkU3Z1hZ?=
 =?utf-8?B?bjlqYTFQcHZ3Q0tyazNrVTFBaUpvRzc3UWVpRy9CZGlPbnZOK0JIUDgrUTJH?=
 =?utf-8?B?NlJueEFxampzL3RlMW5sTmhacnlPa0lxc1orUWtjempJUmFacVQwUVJPWUtW?=
 =?utf-8?B?U0pyTGNGN1NpQ2F1REFlbEJCcVNyb3ZBbjA3Z0N0Y245Q1hBMUZabEJDWUZp?=
 =?utf-8?B?NWZEYWNUYjc1YUFQTHBKSENKWEdybkszNG1vY2tad2FkWkNmQW9Db3Q3eVQv?=
 =?utf-8?B?RWM1elYvYU5pRlJad2k5RFE3YnM5QnNxYlcvMXU1aW52a3lPUXN1T2F5dTll?=
 =?utf-8?B?NUpDa0xZUTdvNHBjNmxGcENDKzhNa1R5a1Q0QysxSzBUR0x5eUhjeFlaejhy?=
 =?utf-8?Q?+30n/H?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VncrMkdZUFhaL25PZ2VxZG9waXoxWGJCUCtSVkRwZTZpbFFHNDcyRkZuVHZ0?=
 =?utf-8?B?eEM4aDBZTitmOFRrYUx6d29FRHdxbGJVR0pQTCszOUkyOUdVWWJXL3NPQmtn?=
 =?utf-8?B?RHB5ejFGZCtvVkcrSllQTEFYQjNCN2RsbGp2Q2QwZC84TUcxVGtKR0swcVVt?=
 =?utf-8?B?TFFIbE0xNDFQZkIxSy9uR1hMTE9CTTNFY0N6V0NyR3hRcnFYK29TVVlrT2t6?=
 =?utf-8?B?Y291K0xZVEM4bHhFaVR0R3A3WGN0VUdvRUNQd3VxdzlacTZEVFBWcjZxWUZI?=
 =?utf-8?B?cUUzRHEwSndtWU0zUVlPQ0ozeVJOVHphYjRZL0QxY3JibmtySzB2cnA4OW5q?=
 =?utf-8?B?bkJXbVc4Y1FoT3l5ZGttNjdpKzR0QXNZWHVXT0R3RkxsRkJiUjVaVHhrRnlX?=
 =?utf-8?B?RE5DVmNyTkdXcGhCUHhoanJ2QVVJSlhoaVlVd3J4dzBDMkkvUUpWV0swdkNp?=
 =?utf-8?B?ckRiWEFKNXQ5WC8rRk5pQmF2WXBlUEdRM2Z3MXR5TitlR1FWQ2lmbEtVT2c2?=
 =?utf-8?B?VXlEYVZlZXpyYVN4MGdNeWsyWEpJSk1OcHhFY1JvRTJyZVlhYjB3ZUhoVGdJ?=
 =?utf-8?B?K01MYXJvanN6TDREblVvdDlLV0JiRmZkSjRDZDc1RFZOdCtKQzdLOHdORjY0?=
 =?utf-8?B?VUw1MDNGdUJOZGdnbC83SWhjS3dxSG9HcEQxQW5Nd1g5ZmJJMjF1TlNzWm1a?=
 =?utf-8?B?UnZMTkg3bTdoTDE3QXhZYWgrNTRRTUIvRVA5d0d4dGRPRWVac1ZDZldPWXQ3?=
 =?utf-8?B?cFNIMzU4TVhrUWRWRnBMOEVRd2s5RHBoQ1dwQmdxaERVckJHWnErWmdDR1Fi?=
 =?utf-8?B?cm9TblUrZzUweEp2TXQ4cnBPQjV2Wm9lY0lNbXBDWkNXa1JJdHdMT2UxNkw2?=
 =?utf-8?B?RFd5Ym93TUJwTHVyLzZ0cUV0YjhyRzJqUTJsN1hnRWlMTGV2aFZuQlFnK1Aw?=
 =?utf-8?B?U1pPeUdTV1RDK2ZnbnNPazU1c0xUckk3YVNYUkkrdzg5cExEYWVyaHVEbVI4?=
 =?utf-8?B?Q3ZDR2MvbWN5WVFtemhObXJVNkhCVnpoeW44TFpOUXk1cW4wbSsxL2Q5ZVNW?=
 =?utf-8?B?dTRzY1czN3VYNEZMc2ZmbXRyVmNWc2N1TFZPUUZlNjAwYTlYYm5sV0QweDRD?=
 =?utf-8?B?TXZBeUpLcm02enc4ZUxiU2ttSG55VGpwbjlPc0dtOEp0U3lXellqOWdjcFVQ?=
 =?utf-8?B?dEMvcW5UU2ZkbUxlZFppalArSTNTU2QvMitzRWR4TkpLaVY0TXdjU2RsaHFS?=
 =?utf-8?B?amRVaTlWT3dhNTh1NXh6eTZTdkZrOXVidG5xVGYyRi83YkNtWFF4b3dWdENr?=
 =?utf-8?B?RE5OTUxUZXUrb05uTEl5dTEzMWY5VVhDUmZaNldoMGIrbXY3K1JnUVIvWXI0?=
 =?utf-8?B?eUx1ODZkT1c0RHZld3RFZDZmUW12bjNROEhYZmdXOHRHTnV6TUlNV1U0b0Mx?=
 =?utf-8?B?UzNKbnR2cjF0MG1iRU40L3J3SFExMUU4dHN5UTlUQzlEK0dSd0VCdDl2V3ho?=
 =?utf-8?B?cTg1YXkyRjRBS0ViVGY0c0ZSVnRiQjVIb3NpT1pSODUxRmRqcVlGdVB3RWVJ?=
 =?utf-8?B?bEJhaStCa2JONHkyNWtwMFJmd0pUUVFGNmRyKzQzMDNVTnl6cGlINWxkSytw?=
 =?utf-8?B?RUFhck9uWTlMODJORldISnovY1dDU2o4MzBrNSt4d2FmTzlCQityTFNkY0w4?=
 =?utf-8?B?cjh0bS9tdldVcmhTTzJpOEpGM01ETERPb3FaTldKRWcyTWEyVlVUTmJpWVZQ?=
 =?utf-8?B?RnFUZ054NS9MRmVTNm5DVUV1Y1NFelZ5RlZ2bDhENEUwVU5TTUZlTnNob0g3?=
 =?utf-8?B?RTFJeXlSVUNKK2F0azlCMnA5R253ZTRVTkIxQkhLYSt6c05CK2lOREFzRzQw?=
 =?utf-8?B?TVlPOUNsNXNFbDA1ajQ5RGJQUEVLTVFxd090WlI1MXlnZTVFYmV0SFdnQmpl?=
 =?utf-8?B?WllFc0k3QkZiS2lsUUpBdzhNNG1qT3pGY3lUaXFXU0huQ2NZRjdZUnQrQ0Zn?=
 =?utf-8?B?bnJYT2NEZkp3TGZIcTVMTDhDTkhxOGV4UDYxYTBnUlhHWmxGWXJpMkI4RDlJ?=
 =?utf-8?B?WG0xb0wrMnVTMWhxSEhEZG9HWkpYeHg5WFFVbE94NmFxUnFNZUxsVm9aeHJu?=
 =?utf-8?B?cE4xMWRiQ1M0VkhudWFlZ0NsQ1VXM21WMVE0Mzl2WmZPaFhGbEdDcXVDbktu?=
 =?utf-8?B?bmc9PQ==?=
Content-ID: <C77D6B54B673584DB84D0B0CC075B8CA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b559ef9-539c-4b58-bb49-08de157af8c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 17:05:03.6772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re2pE3qVARuSaH3TNS4QqIf09h2tbaR56fcehHm0JHOK0ywKhP6zh+YqCoQu3HptMskPM71STc2mmAigOTai8BJ+hNk/x++wv5ZnQij8vZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8736
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_003_1661476459.2017426394"
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

--__=_Part_Boundary_003_1661476459.2017426394
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI1LTEwLTIzIGF0IDA5OjI4IC0wNDAwLCBNYXJrIFlhY291YiB3cm90ZToNCj4g
DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNv
bnRlbnQuDQo+IA0KPiANCj4gT24gV2VkLCBPY3QgMjIsIDIwMjUgYXQgNDozNOKAr0FNIEZlaSBT
aGFvIDxmc2hhb0BjaHJvbWl1bS5vcmc+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFdlZCwgT2N0IDIy
LCAyMDI1IGF0IDE6MznigK9BTSBKYXNvbi1KSCBMaW4NCj4gPiA8amFzb24tamgubGluQG1lZGlh
dGVrLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IEFkZCAiU0RDIiB0byB0aGUgSERDUCBibG9j
a2xpc3QgdG8gaW1wcm92ZSBjb21wYXRpYmlsaXR5IHdpdGgNCj4gPiA+IHBhbmVscw0KPiA+ID4g
dGhhdCBkbyBub3Qgc3VwcG9ydCBIRENQLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
YXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
IMKgdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jIHwgMSArDQo+ID4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2NvbnRlbnRfcHJvdGVjdGlvbi5jDQo+ID4gPiBiL3Rlc3RzL2ttc19jb250ZW50X3Byb3Rl
Y3Rpb24uYw0KPiA+ID4gaW5kZXggZmNjMDAyM2UzNjVmLi5lMDU2OTUxYzkyZjQgMTAwNjQ0DQo+
ID4gPiAtLS0gYS90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMNCj4gPiA+ICsrKyBiL3Rl
c3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYw0KPiA+ID4gQEAgLTE0MSw2ICsxNDEsNyBAQCBf
X3U4IGZhY3NpbWlsZV9zcm1bXSA9IHsNCj4gPiA+IMKgICovDQo+ID4gPiDCoHN0YXRpYyBjb25z
dCBjaGFyICpjb25zdCBoZGNwX2Jsb2NrbGlzdFtdID0gew0KPiA+ID4gwqDCoMKgwqDCoMKgwqAg
IkRQRjkwNDM1IiwgLyogRXhhbXBsZSBtb25pdG9yIG5hbWUgKi8NCj4gPiA+ICvCoMKgwqDCoMKg
wqAgIlNEQyIsDQo+IEp1c3Qgc28gdGhpcyBsaXN0IGRvZXNuJ3QgZ3JvdyB3aXRoIHJhbmRvbSBh
Y3JvbnltcyBpbiB0aGUgZnV0dXJlLA0KPiBjYW4NCj4geW91IGFkZCBpbiBhIGNvbW1lbnQgbW9y
ZSBpbmZvIGFib3V0IHRoaXMgZGlzcGxheS4gYXQgbGVhc3Qgd2hpY2gNCj4gZGV2aWNlIGl0J3Mg
Y29taW5nIGZyb20uIEp1c3Qgc28gaXQncyBhIGJpdCBtb3JlIG1lYW5pbmdmdWwsIGFuZA0KPiBt
YXliZQ0KPiB0aGUgcmVhc29uIGl0J3Mgb24gdGhpcyBsaXN0Lg0KDQpPSywgYnV0IGl0IHNlZW1z
IHRoZSBwYXRjaCBoYXMgYmVlbiBtZXJnZWQuDQoNCkkgd2lsbCBhZGQgdGhlIGNvbW1lbnQgbGlr
ZSB0aGlzOg0KDQoiU0RDIiwgLyogUGFuZWwgb2YgQ2hyb21lYm9vayBOYXZpICovDQoNCmluIHRo
ZSBuZXh0IHZlcnNpb24uDQoNCk1heWJlIHNvbWVvbmUgaW4gSW50ZWwgY2FuIHVwZGF0ZSB0aGlz
IHBhdGNoLg0KDQo+ID4gDQo+ID4gPiDCoMKgwqDCoMKgwqDCoCAvKiBBZGQgbW9yZSBtb25pdG9y
IG5hbWVzIGhlcmUgYXMgbmVlZGVkICovDQo+ID4gPiDCoH07DQo+ID4gDQo+ID4gQSBwbGFpbiAi
U0RDIiB3aXRob3V0IGFkZGl0aW9uYWwgbW9kZWwgaWRlbnRpZmllciBsb29rcyBzbGlnaHRseQ0K
PiA+IG9kZCwNCj4gPiBidXQgSSBndWVzcyBpdCBpcyB3aGF0IGl0IGlzIGZyb20gdGhhdCBtb25p
dG9yJ3MgRURJRC4NCg0KWWVzLCB0aGlzIHN0cmluZyAiU0RDIiBpcyBvYnRhaW5lZCBmcm9tIEVE
SUQuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg0KPiA+IA0KPiA+IFJldmlld2VkLWJ5OiBG
ZWkgU2hhbyA8ZnNoYW9AY2hyb21pdW0ub3JnPg0KDQo=

--__=_Part_Boundary_003_1661476459.2017426394
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO1RodSwmIzMyOzIwMjUtMTAtMjMmIzMyO2F0
JiMzMjswOToyOCYjMzI7LTA0MDAsJiMzMjtNYXJrJiMzMjtZYWNvdWImIzMyO3dyb3RlOg0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtFeHRlcm5hbCYjMzI7ZW1haWwmIzMyOzomIzMyO1BsZWFzZSYjMzI7
ZG8mIzMyO25vdCYjMzI7Y2xpY2smIzMyO2xpbmtzJiMzMjtvciYjMzI7b3BlbiYjMzI7YXR0YWNo
bWVudHMmIzMyO3VudGlsDQomZ3Q7JiMzMjt5b3UmIzMyO2hhdmUmIzMyO3ZlcmlmaWVkJiMzMjt0
aGUmIzMyO3NlbmRlciYjMzI7b3ImIzMyO3RoZSYjMzI7Y29udGVudC4NCiZndDsmIzMyOw0KJmd0
OyYjMzI7DQomZ3Q7JiMzMjtPbiYjMzI7V2VkLCYjMzI7T2N0JiMzMjsyMiwmIzMyOzIwMjUmIzMy
O2F0JiMzMjs0OjM0JiM4MjM5O0FNJiMzMjtGZWkmIzMyO1NoYW8mIzMyOyZsdDtmc2hhb0BjaHJv
bWl1bS5vcmcmZ3Q7JiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0
OyYjMzI7T24mIzMyO1dlZCwmIzMyO09jdCYjMzI7MjIsJiMzMjsyMDI1JiMzMjthdCYjMzI7MToz
OSYjODIzOTtBTSYjMzI7SmFzb24tSkgmIzMyO0xpbg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmx0O2ph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20mZ3Q7JiMzMjt3cm90ZToNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7QWRkJiMzMjsmcXVvdDtTREMm
cXVvdDsmIzMyO3RvJiMzMjt0aGUmIzMyO0hEQ1AmIzMyO2Jsb2NrbGlzdCYjMzI7dG8mIzMyO2lt
cHJvdmUmIzMyO2NvbXBhdGliaWxpdHkmIzMyO3dpdGgNCiZndDsmIzMyOyZndDsmIzMyOyZndDsm
IzMyO3BhbmVscw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7dGhhdCYjMzI7ZG8mIzMyO25v
dCYjMzI7c3VwcG9ydCYjMzI7SERDUC4NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7U2lnbmVkLW9mZi1ieTomIzMyO0phc29uLUpIJiMzMjtM
aW4mIzMyOyZsdDtqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYj
MzI7Jmd0OyYjMzI7LS0tDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDt0ZXN0cy9r
bXNfY29udGVudF9wcm90ZWN0aW9uLmMmIzMyO3wmIzMyOzEmIzMyOysNCiZndDsmIzMyOyZndDsm
IzMyOyZndDsmIzMyOyYjMTYwOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtpbnNl
cnRpb24oKykNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7ZGlmZiYjMzI7LS1naXQmIzMyO2EvdGVzdHMva21zX2NvbnRlbnRfcHJvdGVjdGlv
bi5jDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtiL3Rlc3RzL2ttc19jb250ZW50X3Byb3Rl
Y3Rpb24uYw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7aW5kZXgmIzMyO2ZjYzAwMjNlMzY1
Zi4uZTA1Njk1MWM5MmY0JiMzMjsxMDA2NDQNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOy0t
LSYjMzI7YS90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMNCiZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOysrKyYjMzI7Yi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyO0BAJiMzMjstMTQxLDYmIzMyOysxNDEsNyYjMzI7QEAmIzMy
O19fdTgmIzMyO2ZhY3NpbWlsZV9zcm1bXSYjMzI7PSYjMzI7ew0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7JiMxNjA7JiMzMjsqLw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7JiMxNjA7
c3RhdGljJiMzMjtjb25zdCYjMzI7Y2hhciYjMzI7KmNvbnN0JiMzMjtoZGNwX2Jsb2NrbGlzdFtd
JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzE2MDsmIzE2MDsmIzE2
MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzE2MDsmIzMyOyZxdW90O0RQRjkwNDM1JnF1b3Q7LCYjMzI7
LyomIzMyO0V4YW1wbGUmIzMyO21vbml0b3ImIzMyO25hbWUmIzMyOyovDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsrJiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsm
cXVvdDtTREMmcXVvdDssDQomZ3Q7JiMzMjtKdXN0JiMzMjtzbyYjMzI7dGhpcyYjMzI7bGlzdCYj
MzI7ZG9lc24mIzM5O3QmIzMyO2dyb3cmIzMyO3dpdGgmIzMyO3JhbmRvbSYjMzI7YWNyb255bXMm
IzMyO2luJiMzMjt0aGUmIzMyO2Z1dHVyZSwNCiZndDsmIzMyO2Nhbg0KJmd0OyYjMzI7eW91JiMz
MjthZGQmIzMyO2luJiMzMjthJiMzMjtjb21tZW50JiMzMjttb3JlJiMzMjtpbmZvJiMzMjthYm91
dCYjMzI7dGhpcyYjMzI7ZGlzcGxheS4mIzMyO2F0JiMzMjtsZWFzdCYjMzI7d2hpY2gNCiZndDsm
IzMyO2RldmljZSYjMzI7aXQmIzM5O3MmIzMyO2NvbWluZyYjMzI7ZnJvbS4mIzMyO0p1c3QmIzMy
O3NvJiMzMjtpdCYjMzk7cyYjMzI7YSYjMzI7Yml0JiMzMjttb3JlJiMzMjttZWFuaW5nZnVsLCYj
MzI7YW5kDQomZ3Q7JiMzMjttYXliZQ0KJmd0OyYjMzI7dGhlJiMzMjtyZWFzb24mIzMyO2l0JiMz
OTtzJiMzMjtvbiYjMzI7dGhpcyYjMzI7bGlzdC4NCg0KT0ssJiMzMjtidXQmIzMyO2l0JiMzMjtz
ZWVtcyYjMzI7dGhlJiMzMjtwYXRjaCYjMzI7aGFzJiMzMjtiZWVuJiMzMjttZXJnZWQuDQoNCkkm
IzMyO3dpbGwmIzMyO2FkZCYjMzI7dGhlJiMzMjtjb21tZW50JiMzMjtsaWtlJiMzMjt0aGlzOg0K
DQomcXVvdDtTREMmcXVvdDssJiMzMjsvKiYjMzI7UGFuZWwmIzMyO29mJiMzMjtDaHJvbWVib29r
JiMzMjtOYXZpJiMzMjsqLw0KDQppbiYjMzI7dGhlJiMzMjtuZXh0JiMzMjt2ZXJzaW9uLg0KDQpN
YXliZSYjMzI7c29tZW9uZSYjMzI7aW4mIzMyO0ludGVsJiMzMjtjYW4mIzMyO3VwZGF0ZSYjMzI7
dGhpcyYjMzI7cGF0Y2guDQoNCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0OyYjMzI7Jmd0OyYjMzI7
Jmd0OyYjMzI7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMxNjA7JiMzMjsv
KiYjMzI7QWRkJiMzMjttb3JlJiMzMjttb25pdG9yJiMzMjtuYW1lcyYjMzI7aGVyZSYjMzI7YXMm
IzMyO25lZWRlZCYjMzI7Ki8NCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyYjMTYwO307DQom
Z3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO0EmIzMyO3BsYWluJiMzMjsmcXVv
dDtTREMmcXVvdDsmIzMyO3dpdGhvdXQmIzMyO2FkZGl0aW9uYWwmIzMyO21vZGVsJiMzMjtpZGVu
dGlmaWVyJiMzMjtsb29rcyYjMzI7c2xpZ2h0bHkNCiZndDsmIzMyOyZndDsmIzMyO29kZCwNCiZn
dDsmIzMyOyZndDsmIzMyO2J1dCYjMzI7SSYjMzI7Z3Vlc3MmIzMyO2l0JiMzMjtpcyYjMzI7d2hh
dCYjMzI7aXQmIzMyO2lzJiMzMjtmcm9tJiMzMjt0aGF0JiMzMjttb25pdG9yJiMzOTtzJiMzMjtF
RElELg0KDQpZZXMsJiMzMjt0aGlzJiMzMjtzdHJpbmcmIzMyOyZxdW90O1NEQyZxdW90OyYjMzI7
aXMmIzMyO29idGFpbmVkJiMzMjtmcm9tJiMzMjtFRElELg0KDQpSZWdhcmRzLA0KSmFzb24tSkgm
IzMyO0xpbg0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1Jldmlld2Vk
LWJ5OiYjMzI7RmVpJiMzMjtTaGFvJiMzMjsmbHQ7ZnNoYW9AY2hyb21pdW0ub3JnJmd0Ow0KDQoN
CjwvcHJlPg0KPC9wPjwvYm9keT48L2h0bWw+PCEtLXR5cGU6dGV4dC0tPjwhLS17LS0+PHByZT4q
KioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioq
KioqKioqKioNClRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1haWwgbWVzc2Fn
ZSAoaW5jbHVkaW5nIGFueSANCmF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9w
cmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQpleGVtcHQgZnJvbSBkaXNjbG9zdXJl
IHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8gYmUgDQpjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlv
biwgDQpkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBvZiB0aGlz
IGUtbWFpbCAoaW5jbHVkaW5nIGl0cyANCmF0dGFjaG1lbnRzKSBieSB1bmludGVuZGVkIHJlY2lw
aWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZCBtYXkgDQpiZSB1bmxhd2Z1bC4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxp
ZXZlIA0KdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIA0KaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsKSwgZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcyBvZiANCnRoaXMgZS1tYWlsIChpbmNsdWRp
bmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQpkaXNjbG9z
ZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVyc29uLiBUaGFuayB5
b3UhDQo8L3ByZT48IS0tfS0tPg==

--__=_Part_Boundary_003_1661476459.2017426394--

