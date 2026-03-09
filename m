Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9959CEA854A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 03:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2174310E0D3;
	Mon,  9 Mar 2026 03:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qlRkdr8C";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="nxenp4cE";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F174110E0D3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 03:16:41 +0000 (UTC)
X-UUID: 5dacd5ba1b6611f1a39cd589f645bc18-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=rfTO+E12DdSipd4RzXpEqJ02CmAAvEEn8HJLubKCbRI=; 
 b=qlRkdr8CZQ5uHxlTBnPW+71gIPfFeQ3N5eRwIeQ/FP9DLBv1wDy/y2Cw0hBhfHFhSRr49B36yPBDoXXbfmNm4oBhsiiZ2AQhBvPzRtuYvZXl3o5QsOnGJSqTeUp3nkTWJI+sOBqzbHV+pVI8mKTDhS2OnB328PrzNmYcg9598ro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:f70e0e56-0772-46c2-8efc-e0f115c57a08, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:b32e035c-a957-4259-bcca-d3af718d7034,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5dacd5ba1b6611f1a39cd589f645bc18-20260309
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1139682291; Mon, 09 Mar 2026 11:16:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Mar 2026 11:16:28 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Mar 2026 11:16:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itKnO6jQXUaMIvusYgDJ+5s7xAqT0NT6Cs66S4x1o1k2SFlugJZBKhYyFfQMFZEotSdMvQ/lbdvOLOj87ESndtNA09i1KiYAGFIKi9BovTh+oxUAYZ1SDuXnCxazbkOagJ1gQwykzXnsX2GhR3lswximxB8/9C1FhgInPScVrrCfyKpyfO0kRErgBto4OM4FB94LL6qepZczT6jRrACfM71WzejAg5CoyWZI7V4qDRXcxC8zGZo/CJFHZ/5F4S0+6A8bmisccnW4GFV1HsQiyLPxFgRxWwg+n3gtydKbvynQsIq05QVKVrvXxKj57atb7+9cj93+LOp2+sDxJOTLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfTO+E12DdSipd4RzXpEqJ02CmAAvEEn8HJLubKCbRI=;
 b=buNBPOQeIs+nWrsySgin++bkwAhtiDRLy5w5vYbV7hbU03nA7opzeAUkkEkcema/ehbV5MeDEv6gBH4fKzo6Dlz/TNA76VfAjeZ3IES7x5nL60bb+70T2dyVj5pOL8+R4CYYkp1oTIHUbJlmiDAjWPLBO27i0K1LXe7uGDtgnJ7R0NavHlbwpOPycrw/1Uhq99Btw6Rga/7mP7Aj0PKCVt2X6YlN2TEWEomvmNd9sVuUfffwUm5tfPN1rvu4DZ6G5WRB6ZRv8hkRpstUCL+VduizGRPp+FUpizODDjvUVnKwjxeN1nyzOyIMROfPLnzWPKRL7RGo54H4TzqegvwfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfTO+E12DdSipd4RzXpEqJ02CmAAvEEn8HJLubKCbRI=;
 b=nxenp4cExzE+T5rjLhEq8LG2DZMfLBLKTDGQ0kGspvGlG4pFd3otpgaMyGBY/BKUG8ey8+eYqaqbw6nizph0uw0x8mF1kXR54jpHcr8bmfz8rVLiimBX6qtBv4qjyadK9qVFoic9Gm6W1BXdeXuzgYBbtcrfcZZx6iiDOt3ItZA=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KL1PR03MB8195.apcprd03.prod.outlook.com (2603:1096:820:111::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 03:16:25 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 03:16:24 +0000
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
Subject: Re: [PATCH i-g-t] tests/kms_bw: Skip tests when outputs don't support
 the mode
Thread-Topic: [PATCH i-g-t] tests/kms_bw: Skip tests when outputs don't
 support the mode
Thread-Index: AQHcpnBv+cBw1fdCD0KF0VpHGuKOLLWhLUSAgARsEYA=
Date: Mon, 9 Mar 2026 03:16:24 +0000
Message-ID: <7a3640abcbaeb6267d4ab7fdfcead80d79383d1c.camel@mediatek.com>
References: <20260225160408.4116524-1-jason-jh.lin@mediatek.com>
 <CAC=S1njW84bqLR3UvHHdPXT8yDECkd7UM9_o1oVDcWU70oy0Uw@mail.gmail.com>
In-Reply-To: <CAC=S1njW84bqLR3UvHHdPXT8yDECkd7UM9_o1oVDcWU70oy0Uw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KL1PR03MB8195:EE_
x-ms-office365-filtering-correlation-id: 75524b50-8d36-47f9-ba94-08de7d8a3ee8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: 6mWPJ6TSEebJpEGTn5H3ucBELNN/zj4F2exUAkaA4oHvLrzSV3PlMNQeO8CNN150/ILGGCgO7+j6eSNbVYcudpAe6FjamyJgNoLuukwFiEU5wGj1OOGdP0gW+UeXAFSDWVu2QOMGPrZ0hGvwjqphisjZ14TFNp6PpZQtfD17MoOyD4xHPshwsS/clDr6UXr0WHYgJYUPCrzmVBWwh3tICQb7hRbL+F9JB6KywXxBixY7b0GzLuZLMN31Uqy3/Pf+hqM0JByWkrRCip6Vy/McEt0zjiQbP1y0IIpQ5DdKhS1pvaX+tvAP1FeUMKC1eskTYZa/c9vkel5RA7jHmXHF2G0QKTYSm4Maj1q4l/xFO5/bFg1wN0+wjAdyzBME+a1DFUh+5cYKrzchi0AM4jWGIBi8fDNgWfx1HB5WjXkznq/hEJdJBnrqa/b1U/kBxhcl7wIDZgm9yiFPaFZQY+yhjfW0+x3hc8dMTifnROJeEOomNJbQYLJbIAVTXk7evALliV5ZEnQl3ClnR4plKn4YXv/vUliBFj0OfYLNPLqfyg3GV+aK2Y9icD3jhMzk3kATFRz/JJMJ6OfpMV+AzQzMzaqNUqUyCFvScsxBckN2JQgSStlRNMnLZI72PlZBBYnpLsnFRvStfQ3cl8bh8ETxrW9WPz403rpJsfYTPZGROXETZy6xA3N06mYN67EfHvFKE9vcxqR4SdN1lt7xryUX1HdSkZ0NrbHabqTrAtRnPYTxUgjKBPTd+a3omJ357uT2hAKXbipR662poTFl7GNZLia+gA3BKTZ+h7bg2lx4o3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDZRZ0MxOFIxTEc2NERlRERrRUFqazVIdGFHR2FTdzdrc1N5NWtyaVdXRnlm?=
 =?utf-8?B?K3UrU0tDUThUR1NDWFJwU09pdHV1M01LYnF5VmJBOGpyS3Jzc0hnWm9YaDIz?=
 =?utf-8?B?bUxRSDlqaEErd3E1QXl5cWdYNXM3cUwzSjZCbDU2cWdHanNNZDRIQWtsVEho?=
 =?utf-8?B?eHhEUnRrWWljbVorOWlmN3Z5Z2pOTVcvbVJTYzlEU0JDODRsbWdVRSt4UkhY?=
 =?utf-8?B?Y0Z5Z29ZU291cGt1YnE5Smx6VzNSd0pNd1JDWFYrQm5aSlpEdkpiRzVoZENr?=
 =?utf-8?B?dStOK2tXYU55d3JNTU1BSDhTRU55Z0lrUi9OU1FUYlVTQ2c0YXFzaUJ1MEhS?=
 =?utf-8?B?SmpRS051cnovN0N0eDljQkZnbW9rM0FPM1RwV0I2RTVFWmV5TlpJMjJRa1dF?=
 =?utf-8?B?RkxVOFM3Y2JWaDN3L1cxSGRpUEsrYUVXNk5Ea04vNFFzSmlYaCtmWUpxOFVR?=
 =?utf-8?B?dlpsQS92SGR5YnFGV0Z3M3hLekdrOGFwSFgxTTNBYTFBR3htUU0zdENrUVoz?=
 =?utf-8?B?M2g5VDA4LzFOdHlpWmJFNzJaV2w4L0htRzRjODhmQk5vbWdremEvSTV0dUNN?=
 =?utf-8?B?Q0FRelhCZUZhbmlwaHR0Z3FYRElBWEkzS04xZXZaUmxxQzBRWWt2Z1d0OFpT?=
 =?utf-8?B?WC9NcitrMGoyV3g3MElIcldsd3NweGxJT2xYeW83VW54Yk9rNFlySHhTTTRq?=
 =?utf-8?B?Wkh1aGo3ajZWcHJ2ZXpmNHYrWWozbWVFSnk0RUI2L3NaaWg1WlhSb2pjRVo4?=
 =?utf-8?B?cGo0SklLNmcxQVdON2xBS3Y5bFhhWWRvNVpVdmtmMTJsM0ZMNExvbzlCb0xE?=
 =?utf-8?B?NzNySmJMNUw2TjVhTjNaQnZhSE9NbmpJL2UwZEtpcllIbHRFQzBNZkNoWVI2?=
 =?utf-8?B?eVIrSDNDa0twbk5kMlFwNm96djBDcm5iWXdsSXJDNzdBbkpZQVRsREI5T2dp?=
 =?utf-8?B?cEFmeUg5R1YrM1ZkUis5WDNncEY2WDNWelUxU3VpUU52NFVIaFNOWmlheVhV?=
 =?utf-8?B?N0k3cWptdlZycldNQ3lYQVpQam55T2k3M1VWWlJWK2lDK1R6WGRWRTdGVk1G?=
 =?utf-8?B?WW5NY3lMK002N1lncUNka0E2ZUwveWNkUlNia3RwVmlieEw0NE5venRPYVJt?=
 =?utf-8?B?c0RUK3NrQkNuMU5LMGsvNkFpbng1dDRxSTFUK3dPR0FSMVR4WVgzREZRcVda?=
 =?utf-8?B?LzNXQUxRMzFMSVNXcnBXWGhQT1ZvOTJCcndpMDRYbzFWNWd5Tmo5dWF4UEth?=
 =?utf-8?B?S3R0WXBvdkY0WjliOUJvVXVNR2ZMdm15MUJvM3ZtZG9NckpPeG1jZDlkaFNT?=
 =?utf-8?B?RFRmRlRHV09RTG8ySW1xR3NaaWNQV0IvUlVPYWd4SkwrY1RLemJ4UzBiN28v?=
 =?utf-8?B?RVViUmZLTHFKZnBYR2ltNUJWci85U0pUU1dQdXJaQkNVcFRPTGNvNHlHL3pX?=
 =?utf-8?B?YnMrajd3a2pCTlRPUnlHcnVLOTlFcjZ1eWNJSHR4T3JIaW93UmR3OFlaZ3hz?=
 =?utf-8?B?VytBejdCUldoNHhJdkpCcEg3a3J2UlgwbFk1THl2bHEyNDFaN0dDZkwxWklX?=
 =?utf-8?B?S3VIZU1IN2FGUDZIazM3K3BKNk9FSFp1alU4dWNrRGlNcEhqdjlyYjZSUEY1?=
 =?utf-8?B?c0RGdHp3YVVVcnBFUEdyeUJ0OVloTDBoeFBaaFlJcmQyNGVlVGtxVUw3M2JN?=
 =?utf-8?B?NGY5REJLblpMMUZxU3NPVHJNWnhYUFhtRUl1QTVuYVRDR3QrWG8xYk5DWEhI?=
 =?utf-8?B?Q0FnT2RsNVpjeFd0czJMYTVRQW0wVk1hVmdBMFJ3czJsWGhsZlhrVWFMb2dJ?=
 =?utf-8?B?ZVdsRlc1alRlbldqWk0wdkxsNi9EQTZBT2tLYVV0MCtDVjRQOE5XUVBDaGVK?=
 =?utf-8?B?OGxEQkRZSGJUa2hUSVpMWUphWHZwcklkUi81UUJJY29HbVdCVlVXWDVXSDRF?=
 =?utf-8?B?YlBia2V4UTE5SUpvQXNhZFZuR2YyaVAwVXUxZk5UVWl6ZFN1N2VmL2NyN2kw?=
 =?utf-8?B?Tlg0TXhEWW4xUDRiQ1QzcmdKSjRFYktjRGd3RStzQW1sTjI1cHJTenM0MWc0?=
 =?utf-8?B?bUJVeHRwUWVrbmlnd2ZHRnBWVGF0NzUrb0daNFVTcG9RL0tUTS9rVWxwcVN2?=
 =?utf-8?B?OHZkQXFvUUVkcEZBUFhjdG9VZjVUU3NFWUtBLzc1TlNBOWhuUEVHSGpBbUMx?=
 =?utf-8?B?U0s0QUF0bWhCRkRSMnVGRVJrRk9OZzlVdmNBV003ZXdHeEU2alIyRDZyOWhi?=
 =?utf-8?B?cVBSeGxHNHR0MTJ2T3N4TWVXa3ZOaGV5cjkxclQrSzNwTkcwbnQwTkUwQXVs?=
 =?utf-8?B?ZVp1ZDhSdzcxOUJXQ29US0tTcjYvclBsZUtSUEhWZ043aGR5NmZTYTljRks1?=
 =?utf-8?Q?e6jdyN5FBRDnyAOQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80D210404EF5654493578D5C81CE4304@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mb/DhZz7FJvxtWSu1I6AiHtbbAi2JPTU63gghpiKOj6JA9l82wPbQGho65PYxxvPvukr7VHji540madJD/cI2J5EnAKm8YSj+yjGFNQwUm9PvEo8Ix5gGYO2c0vznKHIWwyoh3WY8/XY+Kw80olSBYfEOTq+dSRd0+Nh0SHvpjtCZUj+sABI3tgPIsOJ7ZAyIZtuLMVDYcjhVfOzVctm0lKE4c63RqNuXzPMvzO7KStN6id6mdSzeAqypUJFlQfpPE9GDCGNKWomTi90zO6WqDbciJgkoTRHYzYADIkMwuOY484pkTWa9pUVHIfbaIZfG2r3WJiz7kIA2knGVYX9iQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75524b50-8d36-47f9-ba94-08de7d8a3ee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 03:16:24.7075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRJAgvTISvfGGorRWinK0rVYoZ4ryDIOjtfIdtITmKCK++jAVIBK9GAJIx7hqcnGYqjLf4U5wSKS+H0T4Zo/Dku++j0IdG597YoxveDmVXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8195
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

PiAKCltzbmlwXQoKPiA+IMKgc3RhdGljIHZvaWQgcnVuX3Rlc3RfbGluZWFyX3RpbGluZyhkYXRh
X3QgKmRhdGEsIGludCBwaXBlLCBjb25zdAo+ID4gZHJtTW9kZU1vZGVJbmZvICptb2RlLCBib29s
IHBoeXNpY2FsKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZ3RfZGlzcGxheV90ICpkaXNwbGF5ID0g
JmRhdGEtPmRpc3BsYXk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZ3Rfb3V0cHV0X3QgKm91dHB1dDsK
PiA+IEBAIC0xOTQsNyArMjIzLDcgQEAgc3RhdGljIHZvaWQgcnVuX3Rlc3RfbGluZWFyX3RpbGlu
ZyhkYXRhX3QKPiA+ICpkYXRhLCBpbnQgcGlwZSwgY29uc3QgZHJtTW9kZU1vZGVJbmZvCj4gPiDC
oMKgwqDCoMKgwqDCoCBpZ3RfY3JjX3QgemVybywgY2FwdHVyZWRbSUdUX01BWF9QSVBFU107Cj4g
PiDCoMKgwqDCoMKgwqDCoCBpbnQgaSA9IDAsIG51bV9waXBlcyA9IDA7Cj4gPiDCoMKgwqDCoMKg
wqDCoCBpZ3RfY3J0Y190ICpjcnRjOwo+ID4gLcKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+ID4gK8Kg
wqDCoMKgwqDCoCBpbnQgcmV0ID0gLUVJTlZBTDsKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgLyog
Q2Fubm90IHVzZSBpZ3RfZGlzcGxheV9uX2NydGNzKCkgZHVlIHRvIGZ1c2VkIHBpcGVzIG9uCj4g
PiBpOTE1IHdoZXJlIHRoZXkgZG8KPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBub3QgZ2l2ZSB0aGUg
bnVtdmVyIG9mIHZhbGlkIGNydGNzIGFuZCBhbHdheXMgcmV0dXJuCj4gPiBJR1RfTUFYX1BJUEVT
ICovCj4gPiBAQCAtMjExLDcgKzI0MCw3IEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0X2xpbmVhcl90
aWxpbmcoZGF0YV90Cj4gPiAqZGF0YSwgaW50IHBpcGUsIGNvbnN0IGRybU1vZGVNb2RlSW5mbwo+
ID4gwqDCoMKgwqDCoMKgwqAgLyogY3JlYXRlIGJ1ZmZlcnMgKi8KPiA+IMKgwqDCoMKgwqDCoMKg
IGZvciAoaSA9IDA7IGkgPD0gcGlwZTsgaSsrKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgb3V0cHV0ID0gcGh5c2ljYWwgPyBkYXRhLT5jb25uZWN0ZWRfb3V0cHV0W2ldIDoK
PiA+IGRhdGEtPm91dHB1dFtpXTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
ICghb3V0cHV0KSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIW91dHB1
dCB8fCAhb3V0cHV0X21vZGVfc3VwcG9ydGVkKG91dHB1dCwKPiA+IG1vZGUpKSB7Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gQEAgLTIyOCw3ICsyNTcs
OSBAQCBzdGF0aWMgdm9pZCBydW5fdGVzdF9saW5lYXJfdGlsaW5nKGRhdGFfdAo+ID4gKmRhdGEs
IGludCBwaXBlLCBjb25zdCBkcm1Nb2RlTW9kZUluZm8KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZ3RfcGxhbmVfc2V0X2ZiKGRhdGEtPnByaW1hcnlbaV0sICZidWZmZXJbaV0p
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlndF9pbmZvKCJBc3NpZ25pbmcg
cGlwZSAlcyB0byBvdXRwdXQgJXMgd2l0aCBtb2RlCj4gPiAlc1xuIiwKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrbXN0ZXN0X3BpcGVfbmFtZShp
KSwKPiA+IGlndF9vdXRwdXRfbmFtZShvdXRwdXQpLCBtb2RlLT5uYW1lKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IDA7Cj4gCj4gSSdkIHN1Z2dlc3QgdXNpbmcgYSBk
ZWRpY2F0ZWQgZmxhZyBpbnN0ZWFkIG9mIHJldXNpbmcgYHJldGAsIGluIGNhc2UKPiBhbm90aGVy
IGByZXQgPSBpZ3RfZG9fc29tZXRoaW5nKCk7YCBpcyBhZGRlZCBiZWZvcmUgdGhlIGZvciBsb29w
Cj4gc29tZWRheSwgd2hpY2ggd291bGQgb3ZlcndyaXRlIHRoZSAtRUlOVkFMIGFuZCBpbnZhbGlk
YXRlIHRoZQo+IGBpZ3Rfc2tpcF9vbl9mKClgIGJlbG93Lgo+IAo+IEFmdGVyIHdoaWNoLAo+IFJl
dmlld2VkLWJ5OiBGZWkgU2hhbyA8ZnNoYW9AY2hyb21pdW0ub3JnPgo+IAoKSGkgRmVpLAoKVGhh
bmtzIGZvciB0aGUgcmV2aWV3cy4KSSdsbCB0YWtlIHlvdXIgc3VnZ2VzdCBhbmQgc2VuZCB0aGUg
bmV4dCB2ZXJzaW9uLgoKUmVnYXJkcywKSmFzb24tSkggTGluCgo+IFJlZ2FyZHMsCj4gRmVpCj4g
Cj4gPiDCoMKgwqDCoMKgwqDCoCB9Cj4gPiArwqDCoMKgwqDCoMKgIGlndF9za2lwX29uX2YocmV0
ICE9IDAsICJVbnN1cHBvcnRlZCBtb2RlIGZvciBhbGwKPiA+IHBpcGVzXG4iKTsKPiA+IAo=
