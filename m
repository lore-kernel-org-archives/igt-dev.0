Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1674CD4851
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 07:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EBD10E414;
	Fri, 15 May 2026 07:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SpGArXJ2";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Mr2A8D6w";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461110F41A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 07:04:11 +0000 (UTC)
X-UUID: 437955ec502c11f1b5a00d44d12bea5a-20260515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ezr6uOGDtf8HMFt6Uljs44x9HC6EsTXGUUFUFkcHmQ0=; 
 b=SpGArXJ20eV5+UZQXOhuN1qXmU32sI4CBRJ41jnaiUU+T2rJfiS784LpPJR3l8i+PzLG0tzg8PfXjh29WZHQLHoZV9b+4S+mYOoDuy8GtRrgFgyCOS6Q1PVRgYxDAmAmpVfaUv0Yed3zF0OpnAgpTm4ptLLY+pce+H+1pEjXt+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:cc46e763-3aad-418f-8adc-bf3811dd77f2, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:784e62a4-a669-48ac-a1cb-3b38a93be682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:ni
 l,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
 0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 437955ec502c11f1b5a00d44d12bea5a-20260515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1228180385; Fri, 15 May 2026 15:04:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 15 May 2026 15:04:05 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 15 May 2026 15:04:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxgnZglYPZB205DJIHNlQEQnkiucVcWd3Yy4kR1DXjLGBBcyjpHskm8WX/S1WTCDBf4g/Nvh03r64rlHi9zyaeojMQJgSxBIfjXtLJYYb1xDXazbnRx40FHsBGjaweCtBaK7ZYci/4kpuCQ0jgDuL4xeENeSJgti9y6+rG4MA44l1x61dk7Sr0H4oBoH/ZV4SxT8taBLCS2hcC5CvHybnZsvWOHNlh47pzJnPhVykM3f6kvYuL0mFBM0rrUZTKglLOhezEd22Gb8xhm8oGI8ff7k+fd8hky/WozjZoXtHNfprlaGnQMaH0vE+Y6/ieSHf+onFXySvqpIClEDM3l7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezr6uOGDtf8HMFt6Uljs44x9HC6EsTXGUUFUFkcHmQ0=;
 b=PiWBcvSJwXrhrNBcEafzMG4mrkD/abFqKlodE6Vi7Up9OeuLHgOPBFmllAox3zzEtHv0Tq/tPkZDmaziSPm1p9Npu2SZL4BuymRNyh7HmYUZ4QO6h35FObzuiMdSDKdXiV42WYdeMpkd+DvQgIlj1GraJAvxHr2x3LBPFHxI6bHbJOJ0kBr+5OkJwo3hq9d3mnOp3fn8tQhqx97yA29ewD7vMC2RxWYKzo0r+95boB8LlgF5YzYKvN7vrW0DCKzAsg0hNXktVzMMgotTfQNboeIVk4RcQ/sVUxY4GExRD0MgHDFxN0lTCbfNJhTak5zgLAL9pscYqgX3TBE80f4kzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezr6uOGDtf8HMFt6Uljs44x9HC6EsTXGUUFUFkcHmQ0=;
 b=Mr2A8D6wFoSK602jsCBeFWTXRkTWIFvJ+lYmXaR2SQTB+NQuUYdIwOSnSFuWlG2o0FG0A2SNruEBetcCX039gCC9mpnGpHIulqe6y1cMHomYypy2+9Do0s5l9UBLtPQyesxZl/pKPkDgH8KW11WyPJYA3BZ4GbjjGZwplNyyJ+o=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB7856.apcprd03.prod.outlook.com (2603:1096:990:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 07:04:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 07:04:01 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "suraj.kandpal@intel.com" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "santhosh.reddy.guddati@intel.com" <santhosh.reddy.guddati@intel.com>
CC: "fshao@chromium.org" <fshao@chromium.org>, "suresh.kumar.kurmi@intel.com"
 <suresh.kumar.kurmi@intel.com>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "navaremanasi@google.com" <navaremanasi@google.com>, 
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "ankit.k.nautiyal@intel.com" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Topic: [PATCH i-g-t v1 0/3] Revert HDCP per crtc infrastructure
Thread-Index: AQHc44Xk9iYuV3wY2kWM+00j7/HxoLYOVrkAgAAsvACAAAwsAIAAG1aA
Date: Fri, 15 May 2026 07:04:01 +0000
Message-ID: <755a584d71dd9fe85a0e18285010120e01c688e4.camel@mediatek.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
 <c3346d1f09fc744a543ec86d4bf92b5e69013c85.camel@mediatek.com>
 <DM3PPF208195D8D686AA54FD3CC58A56CB8E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D5491834A5B2BE69F5916E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D5491834A5B2BE69F5916E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB7856:EE_
x-ms-office365-filtering-correlation-id: 7ddeb808-1cdb-4dba-c694-08deb25024d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|4143699003|3023799003|4133799003|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: KNvNgJ/P5X5jqjwksDyeUZLKs3wEkommPXx+MbPyBXKvaevPr5PJrR+W/q7CREovybN8pwhTQ1oY3FWaPcbvQpq8XxeZBIv9O+uzquErYkzUXUjbfLvlo6lodCNjqAIRv71B4SIyaF3lRxKlCkKf4/K3L7OAua7X3DMStW2Mo8q5DReTmQMIhxq2vkeCamW7vhduz2CvctINx57l232HQ31PAtFvketHUksPXqaCnBknFvBnuNa5bTSYHyEbV+qzxkG5NtLOIYeqe09y7vbGQUVlStOKAF2OAmyR6HkS1/FMwUErrFOqblzdWGP+V81S1DsdOdJq8dxxnFO/skyn58jTR5WLU1e7vPai3GpFLaxdvcMBSLIKTD+ExOmWCZVkzD4vrcQ3+F3SzxVVLCSaZgiLiUAQayMN9rB8hFlHM+TBL3A+M4ImGSCAzsB0Vi8q+oLU1ic9tWQwYqr2I5p6Mxn7UVF/q6d5KM5n3DrFC9qmsYUG8kZ3tilZbFSRAZx7xaiLPKy/jzFHWylTKnutNKYv6SsLD3zSFLMk5rSvEs131mZsyui6OCfHIr4xWOck4JOND1iuk01ExnSSVTlkLknPVYpFIh5uKkMhliK3Myg3Ylg3j6qr7BSuDpdUgd5QVVMFY2bAR2CxkPFgT9zkEnl9/7xGOhDfM0GW/LBWsrujvmbgA1h11iBUW2zkuxHiiG31oxHDUVmCZSlftJWweA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(3023799003)(4133799003)(56012099003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1dPdWdtVzYwMlo0YUR1ZTRKVU5UbHBraXJOVXhDTkpUOCtNcUExQjhMbWE4?=
 =?utf-8?B?dUhLUUlTclFLU2RzVUFUbWdGNTlYYWtTMUFYeUVPdW43ZzF6Q1NWWlNkV2NZ?=
 =?utf-8?B?ZnFsdEN4aWdBTkJIQnY5a1VpbHdoUmFTVEt5cHZYTi9BQ25IdXlvQXB0TGxU?=
 =?utf-8?B?RXpYUFB2ZXNMVldmamp5RFU4NTZ4TzU3bFhYYmd0NmIwVnU5cUd1M3F3aXJI?=
 =?utf-8?B?SXp0ek5SenFCUFk1V2U0VUN3aDliRmpSSGtyTTlGOVFBdXB0UDh1aEJveVVO?=
 =?utf-8?B?ZEFLbndvckdtQVI2NE1jY0ZQeUZpM3JXQ3haM3NiK0thOWV3bERwZTh3YW1q?=
 =?utf-8?B?U2tpZ3BoeEhWOG1kSkF3UmRCeVRZbllxMCt4V01SNHNrN3BDVGxoZlY4eVF5?=
 =?utf-8?B?aTJFUm95YjFUZjBLL3Z0eTZMVkYwVjZNUTlYbTkvZGlMenJKdkZoNDNFQ2ky?=
 =?utf-8?B?NFV3SEwwTE5ONkhGUWRKc3BCSjdDNy9DdFg1S0x6K0w0bTNQMFZJdjl2NDNx?=
 =?utf-8?B?aVRrVjlDdG81YVovV3RpZ3Yzb0h5ZmU5bUtIMVVSQm1mUkpvR1A2ZHIwUnFz?=
 =?utf-8?B?RStBR3NZWmYzc2JOekNvL2JOV3J2TW5zdExJbXNSZ01oYzBiVXg3a1NIeDhD?=
 =?utf-8?B?K3RGLzRJVXVWV1FDQUJ5VlByS21ZV1UzdjlPUXN2OUUwNUZpMjVXK1JTQnZh?=
 =?utf-8?B?My9EWGZFME5wdWoveDA1MTlJbUx1SmlaM3BnRjgyYk5EaDJKb1RqdGFkVHEv?=
 =?utf-8?B?SVFwTVRFelNMSzRBaExvSnpkTzRWeDduS05MQWVMNXJ3UmxWUU1BaTFiU1Uy?=
 =?utf-8?B?Q0JGVzh6WHRHMjlWWVJLWnZBSEJTblQrelhTQWVFWjRwQWI3UU5EY2VXL1Rt?=
 =?utf-8?B?eGxTTWdYMC9qZE0zVHJLMDNlM094Wm5XT1lTdXV2dWhRTW9QZUhPQzU0bFVz?=
 =?utf-8?B?NDVnRll2QTE5TWgwUjJzb0trQ2tiK0x1YXE4ZUUvbThxZXJGVmdDYkduUGVE?=
 =?utf-8?B?SzJXYXVCZ3ZWSE40TG9VaVZhRndFR01ldy9DUFNiZFJoVTZPS1lQSVkyNG54?=
 =?utf-8?B?MS93eEM3MlUybC9BUUs1WkVWeDd4WTEzd0lrRUhvbmdJZ21PRzlIWWV4dUha?=
 =?utf-8?B?R2hWU3lSZklNanpkS0VFVWQ4Z0FCYitSbXo0OCtiNUZBYnNhMFE4eG8rSkdZ?=
 =?utf-8?B?N1FWdGI4ZVUwTUQ5c25xdmJIOGZkY3FIZ0liU0NpRkprYWdxNDFPNExiWXFQ?=
 =?utf-8?B?RHJZL093alV3TWZZVEVYZUtKaGtQeWg1UVZpZmFEd255Ui9IOXVwSVVjbEpH?=
 =?utf-8?B?QU90QVkxeWdPRUtrZy96WkpteHAwNStsUzNEOUV5cFpodWNxV1JYdXNsWUJt?=
 =?utf-8?B?YlRsMnRtWVh4RW5ma1NCRTBpanE0aUdsMUFqNlMxOGxBZHRBaFlaOXU5QmdK?=
 =?utf-8?B?aFhKL21zYWJpanZnd09CODNyQTc2UlZPcHZmMlVPMVhXMXhyVDIwcGhmd1pp?=
 =?utf-8?B?YXhYdFVJY2FtYmhudncyM05heTBsUUlqZHh0U3FGSVNKc1pieFFYa3V1d0RC?=
 =?utf-8?B?TDQ1QnZqNXFraVJDZlpTL2pYbU5uaXpGZXRpS1BiL2JLQzNsODBybjV4T0Zl?=
 =?utf-8?B?cjhnOXgrMFk3SmxEVFRQMDFhVGk2UHVuMEV1YWZaUVlZQkxUQjdVclhDZTEx?=
 =?utf-8?B?bEh5cnQ4ZCtIUVZobjVaczU5VlVxMWN4RHNMdFZiM3NUTklkekdiUGt3VWxs?=
 =?utf-8?B?QVhKRGoreG0xcEM2MCtTUWxHRXlKd2hMWDNTRk9yaTVEVVhHeThacjFzVzVj?=
 =?utf-8?B?SGpITU51TXMwWXhqdEpraU5rYnJxeXVsbVJVY1ZLekpwZDcrNllvR0h4bldl?=
 =?utf-8?B?WHJSc00wa0I2cXFrNDBxOWV1dktyelJ2bTRvV3cxUjdYMW1sV01zYVNUT05J?=
 =?utf-8?B?dlE0SnVneUxieVVkdGlwQUNyWWZDM1Q5UmExU0JPR2kxOE5qSnR2dEdlVDJl?=
 =?utf-8?B?SlNReFQydnhkMnRBMFZFcFRwcW5QOG5wYlJqb296MlczamJWWlpGODNpRDBL?=
 =?utf-8?B?ajJjeDdzN1BJeCtGYUpRQlN5Y0pRdmdiTVNwSG4rY25qVE5DVW5qeDBHQUpG?=
 =?utf-8?B?RnpMK0IyK3BJUUk2aklIN2wvYncweEExSEFUTFlyRmhjVjZEQmxCZ1ZVcGRs?=
 =?utf-8?B?NWtFZm1GWVBTaVFHTG5GQ04zbmYzWVBJSzREZ1pQSXEzSXkyOXRSSDE2c2pW?=
 =?utf-8?B?SmN3d1duYll0WWdUd0dwWGVUTHdPcmNaVWcxSVVYNmxpTzJjbDhyVEQ4dHgx?=
 =?utf-8?B?VHY2MlFuYTlmYXNkTlZiRTIxdCswYjRLZmorM3ZsbVRFSGY1VWpOTitjRnFx?=
 =?utf-8?Q?9iaOCvcvYcOssNRc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F469EB2829F094595D6B01D27BF7298@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MATkWF2RYeRr84Al8QJV9SE/GI6Z35TInixMz1Ldldw6S3nwUlvEUfkON3cqeGwB3biDEWDwtb/SCZ94rgHL7GnT5nwjtuVwFBePMBUebUuP0RwYMQyvJ4LMtR2aly2xh+TBrTg5XMBvBFkwIQooUalQMz52fOiib+KV22uD+7XaAyLJ09efb7ICZGHeUOgWJD48fR7lnoj4wJnC1VmC0nRIa3XZEuV6BwiaoO65pwyUjyvajLj+6/Jh3gxsAOHYFX6yoBpx7K7n6Ic4aMGLh56U+hbojYK4Ez9rBvOwevdm+xigUeMG9r0cymuz4SWmKHKY8bymgeIqvBivZWStSg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddeb808-1cdb-4dba-c694-08deb25024d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 07:04:01.7819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UubmVM29qcOh9/4Px5UitX9ODZAHW5K9by0Be9aUeGbjXiIrutp6cbl15xcbZ4mRiqxSjhgnBH64pQbM8SN7fErsEDMqoYJGKezrxD/INog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7856
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

PiA+IA0KDQpbc25pcF0NCg0KPiA+ID4gSGkgU2FudGhvc2gsDQo+ID4gPiANCj4gPiANCj4gPiBI
aSBKYXNvbiwNCj4gPiANCj4gPiA+IEl0IHNlZW1zIHlvdSBhbmQgSSBoYXZlIGEgY29uZmxpY3Rp
bmcgaXNzdWU6DQo+ID4gPiBbMV0gVW5kZXJzaXplZCBidWZmZXJzOiBXaGVuIDRLIG91dHB1dCB1
c2VzIENSVEMgd2l0aCAySyBGQiBbMl0NCj4gPiA+IE92ZXJzaXplZA0KPiA+ID4gYnVmZmVyczog
V2hlbiAzNTA0eDIxOTAgcGFuZWwgd291bGQgZ2V0IDM4NDB4MjE2MCBGQg0KPiA+ID4gDQo+ID4g
PiBbMV0gdGhhdCByZXF1aXJlcyByZXZlcnRpbmcgdG8gbWF4aW11bSByZXNvbHV0aW9uLCB3aGlj
aCBpbiB0dXJuDQo+ID4gPiBjYXVzZXMgbXkgdGVzdCBzY2VuYXJpbyBbMl0gdG8gcmVncmVzcy4N
Cj4gPiA+IA0KPiA+ID4gVGhlcmVmb3JlLCBJIHRoaW5rIHdlIHNob3VsZCBmaW5kIGEgc29sdXRp
b24gdGhhdCBzYXRpc2ZpZXMgYm90aA0KPiA+ID4gbmVlZHMsIHJhdGhlciB0aGFuIHNpbXBseSBy
ZXZlcnRpbmcgbXkgZW50aXJlIHNlcmllcy4NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBIZXJlIGlz
IG15IHNvbHV0aW9uOg0KPiA+ID4gRHluYW1pY2FsbHkgY2hlY2sgYW5kIHJlY3JlYXRlIGZyYW1l
YnVmZmVycyBpbiBtb2Rlc2V0X3dpdGhfZmIoKToNCj4gPiA+IC0gSWYgZXhpc3RpbmcgRkIgaXMg
bGFyZ2UgZW5vdWdoIOKGkiByZXVzZSBpdA0KPiA+ID4gLSBJZiBleGlzdGluZyBGQiBpcyB0b28g
c21hbGwg4oaSIHJlbW92ZSBhbmQgcmVjcmVhdGUgd2l0aCByZXF1aXJlZA0KPiA+ID4gc2l6ZQ0K
PiA+ID4gLSBPbmx5IGFsbG9jYXRlIHdoYXQncyBhY3R1YWxseSBuZWVkZWQsIHdoZW4gbmVlZGVk
DQo+ID4gPiANCj4gPiA+IFRoaXMgcHJvdmlkZXMgb3B0aW1hbCBtZW1vcnkgdXNhZ2Ugd2hpbGUg
cHJldmVudGluZyBib3RoDQo+ID4gPiB1bmRlcnNpemVkDQo+ID4gPiBhbmQgb3ZlcnNpemVkIGJ1
ZmZlciBpc3N1ZXMuDQo+ID4gPiANCj4gPiANCj4gPiBUbyBwb2ludCBvdXQgWzJdIGlzbuKAmXQg
dGhhdCB0aGUgYnVmZmVyIGlzIG92ZXJzaXplZCBpdHMgYWN0dWFsbHkNCj4gPiB0aGF0IHRoZSBi
dWZmZXIgdGhhdA0KPiA+IHdvdWxkIHVzZSBtYXhpbXVtIHNpemUuDQo+ID4gV2UgZW5kIHVwIGNy
ZWF0aW5nIGEgYnVmZmVyIHdpdGggbWF4aW11bSBzaXplIG9mIDM4NDAgeDIxOTAgdGhpcyBpcw0K
PiA+IHRoZW4NCj4gPiBjbGFtcGVkIHRvIHRoZSBjb3JyZWN0IHNpemUgYnkgaWd0X2ZiX3NldF9z
aXplKCkgSW4NCj4gPiBtb2Rlc2V0X3dpdGhfZmIoKS4gVGhlDQo+ID4gcHJvYmxlbSBmcm9tIHdo
YXQgSSBjYW4gc2VlIGlzIHRoYXQgaXQgZG9lcyBub3QgZG8NCj4gPiBpZ3RfcGxhbmVfc2V0X3Np
emUoKS4NCj4gPiANCj4gPiBXaGljaCBpcyBsYWNraW5nIGluIHNvbWUgb3RoZXIgcGxhY2VzIHRv
byBhbmQgSSB0aGluayB0aGF0IHNob3VsZA0KPiA+IGhhdmUgYmVlbg0KPiA+IHRoZSBzdHJhaWdo
dGZvcndhcmQgYW5kIHNpbXBsZSBmaXggZm9yIFsyXSAuDQo+ID4gTWF5YmUgeW91IGNhbiB0cnkg
dGhhbiBhbmQgc2VlIGlmIHRoYXQgYWxvbmUgZml4ZXMgeW91ciBpc3N1ZQ0KPiA+IHdpdGhvdXQg
c3VjaCBhDQo+ID4gYmlnIHJlZmFjdG9yLg0KPiA+IFNhbnRob3NoIHlvdSBjYW4gdGVzdCB0aGF0
IHRvbyBmcm9tIHlvdXIgc2lkZSBhbmQgaWYgaXQgd29ya3MgYWRkIGENCj4gPiBwYXRjaCB0aGlz
DQo+ID4gaW4gcmV2ZXJ0IHNlcmllcyBzbyB0aGUgWzJdIGRvZXMgbm90IHJlZ3Jlc3MuDQo+ID4g
DQo+ID4gQWxzbyB3YXPCoCBhIGdpdGxhYiBpc3N1ZSBmb3IgdGhpcyBjcmVhdGVkIGJlZm9yZSBh
IHJlZmFjdG9yIHNlcmllcw0KPiA+IGZvciB0aGlzIHdhcw0KPiA+IHNlbnQgPw0KPiA+IFRoYXQg
d291bGQgaGF2ZSBiZWVuIHRoZSBjb3JyZWN0IHdheSB0byBnbyBhYm91dCBpdCBzbyB0aGF0IHRo
ZQ0KPiA+IGluaXRpYWwgZGVidWcNCj4gPiBjb3VsZCBiZSBhIGpvaW50IG9uZSB0b8KgIGF2b2lk
IHN1Y2ggc2l0dWF0aW9ucy4NCj4gPiANCj4gPiANCj4gPiBNb3Jlb3ZlciB0aGlzIHNlcmllcyBp
cyBub3cgY3JlYXRpbmcgZmJzIGZvciBlYWNoIGNvbm5lY3RlZCBvdXRwdXQNCj4gPiAtIGZvciBl
YWNoDQo+ID4gY3J0YyBydW5uaW5nIGFsbG9jYXRpb24gbnVtX291dHB1dHMgKiBudW1fY3J0YyB0
aW1lcyBjbGVhbnVwIGlzDQo+ID4ganVzdCBydW5uaW5nDQo+ID4gdGhlIGNsZWFudXAgbnVtX2Ny
dGPCoCB0aW1lcy4NCj4gPiANCj4gPiBBbHNvIGNyZWF0aW5nIEZCIGZvciBlYWNoIENSVEMgZG9l
cyBub3QgbWFrZSBzZW5zZSBzaW5jZSB3ZSBvbmx5DQo+ID4gcmVhbGx5IGV2ZXINCj4gPiB1c2Ug
dGhlIGZpcnN0IENSVEMgZm9yIHRlc3RpbmcgcHVycG9zZXMgYnJlYWtpbmcgb3V0IG9mIGxvb3Ag
b25jZQ0KPiA+IGV2ZXJ5dGhpbmcNCj4gPiBwYXNzZXMgb24gQ1JUQy4NCj4gPiBPbmx5IGluIE1T
VCBjYXNlcyBkbyB3ZSBlbmQgdXAgdXNpbmcgbW9yZSB0aGFuIG9uZSBDUlRDLiBCdXQgbm93IHdl
DQo+ID4gYXJlDQo+ID4gZXNzZW50aWFsbHkgY3JlYXRpbmcgbW9yZSBGQidzIHRoYW4gcmVxdWly
ZWQgYW5kIHRoZW4gY2xlYW5pbmcgdGhlbQ0KPiA+IHVwIGFkZGluZw0KPiA+IGV4dHJhIHdvcmsg
YW5kIGxvYWQgd2hpbGUgdGVzdCBpcyBydW5uaW5nLg0KPiA+IA0KPiA+IFRvIG1ha2UgaXQgZHlu
YW1pYyBjb3VsZCBoYXZlIG1hZGUgbXVjaCBtb3JlIHNlbnNlIHRvIGNyZWF0ZSBGQiBmb3INCj4g
PiBlYWNoDQo+ID4gY29ubmVjdGVkIG91dHB1dC4gU28geWVzIGRlZmluaXRlbHkgdGhlIHdob2xl
IHRlc3QgcmVxdWlyZXMgcmV3b3JrDQo+ID4gYnV0IHRoaXMNCj4gPiByZWZhY3RvciBpcyB0YWtp
bmcgaXMgZnVydGhlciBmcm9tIHRoZSBnb2FsIG9mIGhhdmluZyB0aGlzDQo+ID4gb3B0aW1pemVk
Lg0KPiA+IE1vcmUgb3ZlciBpbiBNU1Qgc2lkZSBvZiB0aGluZ3MgdGhlc2UgdGVzdHMgYXJlIGdl
dHRpbmcgaXQgdG8NCj4gPiBza2lwcGVkDQo+ID4gYWx0b2dldGhlci4NCj4gPiANCj4gPiBUaGlz
IHdob2xlIHNlcmllcyBoYXMgcmVncmVzc2VkIG91ciBQYXNzIHJhdGUgcXVpdGUgc2lnbmlmaWNh
bnRseSwNCj4gPiB3aXRob3V0DQo+ID4gY2F0Y2hpbmcgYW55IHJlYWwga2VybmVsIGlzc3Vlcy4g
VHJ5aW5nIHRvIGZpeCBvbiB0b3Agb2YgdGhpcyB3aWxsDQo+ID4gcmVxdWlyZSBhIGxvdCBvZg0K
PiA+IGhvdGZpeGVzIGJyZWFraW5nIG9uZSB0aGluZyBhZnRlciBhbm90aGVyLiBJbmNyZWFzaW5n
IG91ciBUZWNoaW5jYWwNCj4gPiBkZWJ0IGFuZA0KPiA+IHRoZSBlZmZvcnQgb25lIHdvdWxkIHJl
cXVpcmUgdG8gcmVhbGx5IG9wdGltaXplIHRoaXMuDQo+ID4gVG8gcmVpdGVyYXRlIHllcywgdGhp
cyB0ZXN0IGFic29sdXRlbHkgY2FuIGRvIGEgYmV0dGVyIGpvYiBhdA0KPiA+IG1lbW9yeQ0KPiA+
IG1hbmFnZW1lbnQgYWxvbmcgd2l0aCBzb21lIG90aGVyIHJlZmFjdG9ycy4gQnV0IHdlIHJlYWxs
eSB3aWxsIGhhdmUNCj4gPiB0byBhDQo+ID4gdGFrZSBhIHN0ZXAgYmFjayBhbmQgbG9vayBhdCB0
aGUgYmlnIHBpY3R1cmUgYmVmb3JlIHJlYWxseSBkb2luZw0KPiA+IGJpZyByZWZhY3RvcnMNCj4g
PiBoZXJlIG9yIGp1c3QgaG90IGZpeGluZyBvbiB0aGUgY3VycmVudCByZWZhY3RvcnMuDQo+ID4g
DQo+ID4gQWxzbyB0aGUgZmluZMKgIG1pbmltYWwgY2hhbmdlIHRoYXQgbWF5IGZpeCBbMl0gZXZl
bnQgYWZ0ZXINCj4gPiByZXZlcnRpbmcgdGhlIDMNCj4gPiBwYXRjaGVzLiBTYW50aG9zaCBjYW4g
eW91IHRyeSB0aGlzIHBsZWFzZS4gSmFzb24geW91IGNhbiBBbHNvIGhhdmUNCj4gPiBhIGdvIC4N
Cj4gDQo+IEFsc28ganVzdCB1c2UgdGhpcyBzZXJpZXMgdG8gYXBwbHkgd2lsbCBtYWtlIHRlc3Rp
bmcgZWFzaWVyIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjY2MTQvX187ISFDVFJOS0E5d01nMEFSYnchbjlf
Ukh5em5jcVp1RXJBNXpEUG9DLXdTTlJjVUM5SjZPdzg2QXRlZ2VTNk1qOENuanpwdDE3VG5qVVlR
bGhidUpYTWJscUR1V0lTWDVEempxbUpxMWdRSjVOcXEkDQo+IMKgDQo+IA0KPiBBbHNvIGZvciBz
b21lIHJlYXNvbiBwYXRjaHdvcmtzIHNob3dzIEkgc3VibWl0dGVkIHRoaXMgc2VyaWVzIG5vIGlk
ZWENCj4gd2h5ID8NCj4gDQo+IFJlZ2FyZHMsDQo+IFN1cmFqIEthbmRwYWwNCj4gDQo+IA0KDQpI
aSBTdXJhaiwNCg0KVGhhbmsgeW91IGZvciB0aGUgZGV0YWlsZWQgcmV2aWV3IGFuZCB0aGUgdGhv
dWdodGZ1bCBhbmFseXNpcy4NCg0KWW91J3JlIHJpZ2h0IHRoYXQgc2ltcGx5IHJldmVydGluZyB0
aGUgc2VyaWVzIG1heSBub3QgYmUgdGhlIGNsZWFuZXN0DQpwYXRoIGZvcndhcmQsIGFuZCBJIGFw
cHJlY2lhdGUgeW91IHRha2luZyB0aGUgdGltZSB0byBpZGVudGlmeSB0aGUNCnJvb3QgY2F1c2Ug
b2YgWzJdIGFuZCBwcm9wb3NpbmcgYSBtaW5pbWFsIGZpeC4NCg0KSG93ZXZlciwgaWYgdGhlIHJl
Z3Jlc3Npb24gaW1wYWN0IG9uIGV4aXN0aW5nIHRlc3RzIHR1cm5zIG91dCB0byBiZQ0Kc2lnbmlm
aWNhbnQsIEkgdGhpbmsgcmV2ZXJ0aW5nIGZpcnN0IHdvdWxkIHN0aWxsIGJlIHRoZSBzYWZlciBv
cHRpb24NCmZvciBub3cuDQpUaGF0IHNhaWQsIEkgd291bGQgcmVhbGx5IGFwcHJlY2lhdGUgaXQg
aWYsIHdoZW4gSSBzZW5kIHBhdGNoZXMgaW4gdGhlDQpmdXR1cmUsIHlvdSBjb3VsZCBoZWxwIHZl
cmlmeSB0aGVtIGluIHRoZSBzYW1lIHRlc3QgZW52aXJvbm1lbnQgdG8NCmNhdGNoIGFueSBwb3Rl
bnRpYWwgcmVncmVzc2lvbnMgZWFybHkuIFRoYXQga2luZCBvZiBjb2xsYWJvcmF0aW9uDQp3b3Vs
ZMKgZ28gYSBsb25nIHdheSBpbiBwcmV2ZW50aW5nIHNpbWlsYXIgc2l0dWF0aW9ucyBmcm9tIGhh
cHBlbmluZw0KYWdhaW4uDQoNClJlZ2FyZGluZyB0aGUgaWd0X3BsYW5lX3NldF9zaXplKCkgc3Vn
Z2VzdGlvbiDigJQgdGhhdCBkb2VzIGxvb2sgbGlrZSBhDQpzdHJhaWdodGZvcndhcmQgYW5kIHRh
cmdldGVkIGZpeCBmb3IgdGhlIG92ZXJzaXplZCBidWZmZXIgaXNzdWUgWzJdLg0KSSB3aWxsIHRy
eSB5b3VyIHBhdGNoOg0KLSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gv
NzI1MjQ1Lw0Kb24gbXkgc2lkZSBhbmQgcmVwb3J0IGJhY2sgd2l0aCB0aGUgcmVzdWx0cy4NCg0K
UmVnYXJkaW5nIHRoZSBHaXRMYWIgaXNzdWUg4oCUIEkgYXBvbG9naXplLCBhcyBJIHdhc24ndCBm
YW1pbGlhciB3aXRoDQp0aGlzIHByb2Nlc3MuIEFkZGl0aW9uYWxseSwgd2hlbmV2ZXIgSSB2aXNp
dCBsaW5rOg0KLSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9v
bHMvDQpJIGtlZXAgc2VlaW5nIHRoZSBtZXNzYWdlOiAiRHVlIHRvIGFuIGluZmx1eCBvZiBzcGFt
LCB3ZSBoYXZlIGhhZCB0bw0KaW1wb3NlIHJlc3RyaWN0aW9ucyBvbiBuZXcgYWNjb3VudHMuIFBs
ZWFzZSBzZWUgdGhpcyB3aWtpIHBhZ2UNCmZvciBpbnN0cnVjdGlvbnMgb24gaG93IHRvIGdldCBm
dWxsIHBlcm1pc3Npb25zLiBTb3JyeSBmb3IgdGhlDQppbmNvbnZlbmllbmNlLiIgYW5kIHNob3dp
bmcgbm90aGluZyBvbiB0aGUgd2VicGFnZS4NCkNvdWxkIHlvdSBwb2ludCBtZSBpbiB0aGUgcmln
aHQgZGlyZWN0aW9uIG9uIHdoZXJlIGFuZCBob3cgSSBzaG91bGQNCm9wZW4gYW4gaXNzdWUgZm9y
IGRpc2N1c3Npb24gaW4gdGhlIGZ1dHVyZT8gSSB3YW50IHRvIG1ha2Ugc3VyZSBJDQpmb2xsb3cg
dGhlIGNvcnJlY3QgcHJvY2VzcyBnb2luZyBmb3J3YXJkIHRvIGZhY2lsaXRhdGUgYmV0dGVyDQpj
b2xsYWJvcmF0aW9uIGFuZCBhdm9pZCBzdWNoIHNpdHVhdGlvbnMuDQoNClRoYW5rcyBhZ2FpbiBm
b3IgdGhlIGd1aWRhbmNlIGFuZCBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHdyaXRlIHN1Y2ggYQ0K
dGhvcm91Z2ggcmV2aWV3Lg0KDQpCZXN0IHJlZ2FyZHMsDQpKYXNvbi1KSCBMaW4NCg==
