Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A2CF6BF0
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 06:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342910E02E;
	Wed,  7 Jan 2026 06:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qzN9wnFo";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hi7iw/Dv";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1938410E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 06:30:01 +0000 (UTC)
X-UUID: 4789343aeb9211f0942a039f3f28ce95-20260107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=ubQMyvauj2Gr/MgBDvOzHo1Of2qaZ+TvGaSeAAkT6Jw=; 
 b=qzN9wnFoRE+Uq6qtskOS2z+YTByotHaw4P1UUqNa1Dq0bH8DKC82lJTJlBEjRugNqb6BUdGbXvGsOGXiPHFNEAoES6vj2qkFmxixwnvAQiyCx8Z/RRdEOAlsv2+MDc/Rr/w0hqC3sE+8AwIRRMpvabFo0TKhrJds5HdiD8rC/oE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:4aee988b-9c92-415d-b3d1-b1b9b2d52f5e, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:cd0d2e1c-569f-4a0f-9948-b21a1d8a5571,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4789343aeb9211f0942a039f3f28ce95-20260107
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1299007397; Wed, 07 Jan 2026 14:29:54 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 14:29:53 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 14:29:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0+lVsjzZ0MAAzZoUi7u0AddrVoarv9cpVowUTDKZAm3oHci1JCUVuBbdoO4usiOzQJCKiSzhwF9iq+nr/MiylaU5k65322gyCt6libu2Db+EdsYevZPLJ3+nPH/OQSkOTZFDUOK7ruFEnVNnWyjvD2HNfThhRfB+JBTvrDXZwSSUNx3xnSvNxQrej7X7UOOSPqP2Wcr1xlFqmlaKWY/FYWIoIQGvURFbM7Hinj3RoXLxqqMiJwH8PD8moLZSJvOloU0xe3ya2HcQ883dEA7lueGn4MwfFvv+Cg/F6Uy3gR09vmwmkAmsjO/O2IPI917wTpz5IVQp19mI7N2uHsdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdc9a41aVl5O9Vi/Go3ksEpx9l5IuPYaECx20Q9CZvg=;
 b=HY+ER9CUHuaru2xKMpgly9H5RwbpxsLfpDSZDpqrOLTWwLwhv7VhZirrl4F5iqvR5Rxu3PPpVloFTGbxylukP9dFaAzzFEZ5h+sUc+bcTfgpNQbpfWF7z6+s6OCv/QL6F4xkYxpZqLd1ROb5Jo2LkZbP5+c1Hv+BtOnip6B0CjjM5h6MmNA/dY0supg72PY4XTh/+oGM4maIxwGGwpd/OQI9onP9nb1NIsEd/K1etKlGGFYWxzIOJGSRlQzH5d2hdafISGivfCGjgEBcZ41GHKVqsKDYUBDnsaIxFR9bI5lQ+xGRLIM2qFnCqSUGo8Cvy5O5s0njnPxtuGQ/VNXIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdc9a41aVl5O9Vi/Go3ksEpx9l5IuPYaECx20Q9CZvg=;
 b=hi7iw/Dv6HIo9kZRZ+ecp8i9ML9bi8vpzPdSPoZ1ZWEort116H9SMm+1VPidvqLvIOU+vioXmvQpXhlxTBOITOx5/gSguN7+Hbv0kAAHM+NwXupakMjH/kdjh7oWgkOW/CykZv2RYyweADjsG2N6CIcPiiGIlxIh/ABhcbX8B6c=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by OS8PR03MB8827.apcprd03.prod.outlook.com (2603:1096:604:28c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Wed, 7 Jan
 2026 06:29:49 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:29:48 +0000
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
Subject: Re: [PATCH i-g-t 1/1] tests/kms_content_protection: Re-create
 framebuffer before each modeset
Thread-Topic: [PATCH i-g-t 1/1] tests/kms_content_protection: Re-create
 framebuffer before each modeset
Thread-Index: AQHcfvaaOXjhfGGf6Ea9xeyB9FsEnrVGKDSAgAAX6IA=
Date: Wed, 7 Jan 2026 06:29:48 +0000
Message-ID: <e0e342ca008117af5f88ea8b022cbc07ce11c6e0.camel@mediatek.com>
References: <20260106102207.2530864-1-jason-jh.lin@mediatek.com>
 <30bf18ef-c09a-4719-a0ed-0c20d49ce7e4@intel.com>
In-Reply-To: <30bf18ef-c09a-4719-a0ed-0c20d49ce7e4@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|OS8PR03MB8827:EE_
x-ms-office365-filtering-correlation-id: 6e2af1ad-5266-4e4e-27fd-08de4db62847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aUFrODZvRXp1M0U0TVF4TlVrSHkvR2dKb1I2Vzd6d2sybWlaNDh5bWpVYm56?=
 =?utf-8?B?NmRUNWYvbnRRdk81Tzl3YkVpdTY4WmRLaTN3Zk1Mc2VvUGpqUUh2Ui9rR0tL?=
 =?utf-8?B?UVpPSHI1Sjd3ZTFWRnpKMkM3SFZMN3B2TzJoUWtjOWVCaDlZU0x5WnV5dDg5?=
 =?utf-8?B?RTNCbktzbEo3UDg4dUFTN0FVVWcyNWlQNjRURXp6aEdoUnAzYnU4MGRBNXpw?=
 =?utf-8?B?MDhxbk9zcGhibFFPWVZlT253ZjFFOGIyZ2g3RVRIVUR5dENVd2FsejZ4d3h2?=
 =?utf-8?B?ZC9GQ2VVc3VqeFpDK09sZjhkS0F4LzllNUJ3eVoxR2ROMDhCUTdkTTRxR3VL?=
 =?utf-8?B?QXp2R2N5RFNGSXFMT2tyWVF2cWRjMFd0b3FMOGNrUzZxRVhRR3NNejdOZ0hD?=
 =?utf-8?B?RENZT3pkRW5YenJpeTNHTEd0K1FndFh2OG1xcjgxWVVDaHhBVHdPSVU5UjVH?=
 =?utf-8?B?TnNTNXV3SVZUMWVrUGtXc3E1SmFIV2dIR1k4VTlaWUVoeHR4TDRDZDZoOCtJ?=
 =?utf-8?B?cXo3VUp2Z0FUWHVYR0dIVDhqTU8vK3JIcUY2bThGemxHU0pwQlVZQVdpQ2FW?=
 =?utf-8?B?MytSYkdEWTBRTWJnMG9oK1hMVHVHQ0dxUnZFTW9PSkpLRFJ1ME5JVTRWbWM2?=
 =?utf-8?B?S3VsbUp4ZG1KNW85MWx2QlZSY3B2dFQ2dlFkSm5BTWY3VDhDUjFUTHo1TXdy?=
 =?utf-8?B?NGxZbmN5bFREUTNrQWR1K0dCd0prYWlyelJWZGhvUHpYc3ZEVGdKRmtUd2sr?=
 =?utf-8?B?ZTl0WjFRK2xnV2xzM2lnVWdzYkUrYkJSN3pMK0lKTTVvSkFvRHNycUh2ZnI2?=
 =?utf-8?B?TmR3UE1kL0k4VzBRUHpncGtHb3kxd3VkMi94NytlOU5yOGRMeWtibCsrR1hy?=
 =?utf-8?B?TGM4bkFyaE9tQy9pL1pDNVZmbFBRMlBUVmV3TnA3QVJyM0VLeXpXR0d6S1Bv?=
 =?utf-8?B?citEK3U0TmVzdHFTczdSOE94dDd4dnVrd0FZQ2JrSzBLN2pyRGtZU1BGajdj?=
 =?utf-8?B?VjBJRDkwd1l2cTNIR2Z1VUVwYlMxRTZPaTZuYWYzWWxGM0loMXQxWU5XY3hP?=
 =?utf-8?B?NEVkV3h1L3NYVlNPaHQ3ZklrbFlVMFRtMHlJaWhIRHlVMDBJcGZHYWVlUVpU?=
 =?utf-8?B?MkxtOTh0VzdVemxJeTU2bWFkYnN2UURxUUhvN1JpbW1UeDdGZDNiS2hLdGl3?=
 =?utf-8?B?TSsxSVR2RmRxR1ErZ1RQd01YcG9TVk8vZ3dhWVdZRXFtc3hhSEF5VTlCanls?=
 =?utf-8?B?eGN4Q0Z4YUxnSG83a1NIdGljMGd0SHBOQWFTUnE2ZlVVVkpCbVR4Y3ZiYnFZ?=
 =?utf-8?B?dlpLRi8za041VDBJT3UyN3FDL3hNUWkzeXBoK3JHTUx1N04rbUM2dVFIUXBy?=
 =?utf-8?B?VGcybTFydWgycVQ2c05xTkNXK0xJZ3pjVCt4NmRpMlhmWk9GQVZDY0pZWFRi?=
 =?utf-8?B?UnpuSDBmdHBNaWowaExoVkhLL3dMUC90OFJjK29hQkNGb3FDdzJpYXJRMDBK?=
 =?utf-8?B?b0pmbkVtTEtCdit0R2lRc3NaK0lQYkhjNzV1SHUxMU51OVVYYWRRR2NDcUZm?=
 =?utf-8?B?c3JPRVdNVzRXWHJUVTFTUStwYUU5VUFRdWlWaWJLMTRxLytRK1R4SmF3aFF2?=
 =?utf-8?B?Uk8xSCtJSTdGZnY1dmZKeW5heEpRcklqZGhxSnltWU8yQXhuV2VCR3VjMExn?=
 =?utf-8?B?MVBJQmxEY2M1dS9tUnliamZFcDd0OHBvWFl0QVZ6djVjZC9LbC9Ldjc4MkRk?=
 =?utf-8?B?NkRUUzBENWZadHV4M2pldUhBWVR4aS82Q3d6bjFOSlNFY1Q1U1pNRHo5NzZ4?=
 =?utf-8?B?b3hua096V3haTURYaUVIRFhXanljbUJiR2huV1NwaitVK3d6Y1dxdlNvdVl2?=
 =?utf-8?B?T2tnL0djenN4THp1bDRadWFkU3NDNWpwUzI0UzdEUEVrdXZLUElqSVhvVjNp?=
 =?utf-8?B?WGlLUkZYK3dpUmdDR002VlgzRFE5M2M2RzhiTlFFTG9scGl2NWJ1djNsTEpt?=
 =?utf-8?B?VWswcTRhNzF2VUxGQmRNSlRmcmpndk9DRWhlVGFadGw3eENmTE95ZVZoTTkw?=
 =?utf-8?Q?Dja9T9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXlOL24zQ2Q0TWNCUTFTMllvWEUzWUE5R2Y3cG54YklCR095TlRYZFBsQnpl?=
 =?utf-8?B?WklyNFgvNkZyMjd5TnBSYWFzMndBMkdsdXJDUG1TM0RnWDVJMDNwMS84MVVP?=
 =?utf-8?B?WmR6UER6VGhsRW42Q2ZLeW85L0Rjam4veUpGOEFQUS9Lc1A5YnV6T1l3RE5F?=
 =?utf-8?B?U1JZaDY1czZOSng4NHhMdGl4MSt4a0lXUko1amJvRUdheTl2amJXY1BkVU1J?=
 =?utf-8?B?OGNuZE13SU94dHM0NGQ4eHJOWVdJSWlLcjMwbWQwYjB2c2JwY0ZtSVJBMlla?=
 =?utf-8?B?T3crdjRQaWJMaEpMYUw2aG8zRytxcnNUZnp2dlZXQUpkanFZSVhrZ005Znpi?=
 =?utf-8?B?SmZCZG8zS0xQaXRqbUFnUURtakhBWkY2T0cydjVpQys5bDFqYTRFaUtpMzU0?=
 =?utf-8?B?OFZJajF2c2s1eno5VEZ1Rjc1TlhnM1RZaGVlYUl6M2YxRHNnckR0L3IwOUh0?=
 =?utf-8?B?cXVsaDJUeHltMDVlSUpXL2RGSS90UDBVN3I2dnh3VXZyK0d6emNzQUhWS3NX?=
 =?utf-8?B?N3hZS1BPbVpmcUoyMTI3TmJBaHFmcTlKOWMrR0VIYTVhMXNaRWF0TDRQb0ZY?=
 =?utf-8?B?Q3NHNFZWdisydVVQVUxoUVdIRld6NVI0MlpQNzExM3N4OVFpMlFVclhEQ3Mw?=
 =?utf-8?B?aGNIL2R6K0RLdFlsNzFCdmZGTEZ0bEJDWFpOYWZIQU43NjBQb2hUbzdDUjY3?=
 =?utf-8?B?ZjNQVEdiZkJXelQ5VWZmbGwxUjE1cjZYR0FsWE9BVjZwZENwU3BKT09pWkdX?=
 =?utf-8?B?ejJuZ0J1U2hmbXRrY3RZMDBFNXUvZHNKVUhaUE1HWGZCVGxCbklPNFpmSVl4?=
 =?utf-8?B?aGF2UEhpNzN4cHVyTnhtYkN6dk1kay9wYjJQRlFVQXY4bFFEYUk0U0FJSjc5?=
 =?utf-8?B?VmNYbHk0Mjdxc3RkcC8xVUlydUgvNTFvYy9vVldiMXkrdk0xU242aHZQcVkv?=
 =?utf-8?B?NjE3bVhWbFFadVZPa2FSUTlHcFdFcVlyNnZvMG0xRkFLOVJCaVVVUVJjQ2VM?=
 =?utf-8?B?dFpOaWVwNEVoRXIxVFpFd282UzNJUnUvcnFYdlJkbmFuaHk1V1FWR1hEZU5N?=
 =?utf-8?B?OXlueVdSU1FOUXVhNHFlRSs4UWNSYmkxTTNzWFhHbW1CeURHaTlQeldpTXVO?=
 =?utf-8?B?SEV0UEtzTWdDU1F4T0tQd0UwdUJyZlZhazN6L1cvYkNXR2drdTJsUjF5aFF5?=
 =?utf-8?B?WE53d2o0c0o3VXEyYXplUSsyMkZKMTIxWUQxNWYrQXEySnRaVEJPUG9CZnAx?=
 =?utf-8?B?bElIMGRtMVZFMnhQZFJndmtkZ3h6NnpOM0ZwMHp6K0tOalZVMEJiMEtPNjJu?=
 =?utf-8?B?aUpwY0hlMUtDMnkyTHlUbVdiaEFqMnZNQ0hNd1FFS1BnN1g0L1hZRllETDNV?=
 =?utf-8?B?emhITFFwUU5PNUJtalhLVTUwb2RlM3VreVk4c0Q4ZGdwN1g2U25nV0pueXov?=
 =?utf-8?B?Q2VnZ3UzVFlvWU9yU3M4SEF1Ri9NU0M4OThkOFkwS2VnZDlYeWI0d0xjc0lz?=
 =?utf-8?B?b3ZRM1pTMVF2dmh4ZFU5TXhWTEtOeFNvRWNlSWtRSHUwVEZ4NHBRR045MGM5?=
 =?utf-8?B?QTJsbXF6OTBlblhzeG9oeWdKMmpZdXdCYTJqbUMyd1RhaExvZWNtdGdJRHgz?=
 =?utf-8?B?SVlpbmpyM1FuOW5NVDIxVkJWQXNoY1c1TU5nKzdPNHZzTkRsOFc0NmR1S3Bn?=
 =?utf-8?B?R2tuY3FvdG80ZDlPYUJrTW9zWEZ0ZmFPcUlNaUhveE1vQWRDbWZFN21wMGxD?=
 =?utf-8?B?blZUdGRNREhVVnFvQmQ4Z20wVURRNy9TcDN3aUhmOGt2cStNOWF2THdlb0Q1?=
 =?utf-8?B?cjM1N1dYYlNHV0pibDJEWi91WW1PajVraFEvVHhqRlNqZmdncWdQS1RFdDVR?=
 =?utf-8?B?THBEOGpoaWRrc2pabUtDc1FEa3NyUzJXeTF0UE9CWVdtS3d1QWcxTk0xaTFW?=
 =?utf-8?B?aGxjRWFFQWtudG84THp2cFZjMzY3ZDNOSENkeks2b1I2dWJrL3BnZFRPNXNO?=
 =?utf-8?B?WUJ4bm8rOFI2T3FmelJxMlBVQlpxNStpeVYxVkFKRE5mQTMxTGdESHRFS21u?=
 =?utf-8?B?dVBSNjNYeUY1RzRrbDhPckEyK28yWmYxM2RxQXZPcVkxdFNjc2w3d1huQTVr?=
 =?utf-8?B?RXF5SDNHaVFsdUl0OXZieEZuNno1TGU0aEE4dWRndGdwWDgyUzFWQnBWQTZw?=
 =?utf-8?B?d3E4czRZbzR6RG9BWlhhV1NqWXNOeWdPemFFdVdkZWVYQnF3NGgyNmZpRDRr?=
 =?utf-8?B?K0tnTUN0MEliV2EvVFg0dWxzTk9HQUczVU8yRWFNRFdhaGs3T1RXeGdLeE9Z?=
 =?utf-8?B?d2RnYktBUnBreGUwNC9NQ3Q0R2t4ZUFPZVBMMjliV0MrYzRtYk05SmNza20x?=
 =?utf-8?Q?Ec3ujPpg+QOgRg/k=3D?=
Content-ID: <72814AB42DFD8E418B9C2370535C313A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2af1ad-5266-4e4e-27fd-08de4db62847
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 06:29:48.7950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vECoRztbxl0fdRolXTOCtGrPeKnlvqkHBdqtC6KgUmoRivaK3uHiL+8HAkpcYAbdrEsspdDg5c8ceX51c2i5kZXcOrdUNp9mVHYVXdpE0Lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR03MB8827
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_004_850266450.811145732"
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

--__=_Part_Boundary_004_850266450.811145732
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2FydGhpaywNCg0KT24gV2VkLCAyMDI2LTAxLTA3IGF0IDEwOjM0ICswNTMwLCBLYXJ0aGlr
IEIgUyB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiAxLzYvMjAyNiAzOjUxIFBNLCBKYXNvbi1KSCBM
aW4gd3JvdGU6DQo+ID4gVGhlIHJlZCBhbmQgZ3JlZW4gZnJhbWVidWZmZXJzIHdlcmUgcHJldmlv
dXNseSBjcmVhdGVkIG9ubHkgb25jZSBhdA0KPiA+IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHRlc3Qu
IElmIHRoZSB0ZXN0IHJ1bnMgb24gbXVsdGlwbGUgb3V0cHV0cw0KPiA+IHdpdGgNCj4gPiBkaWZm
ZXJlbnQgcmVzb2x1dGlvbnMsIHRoZSBwcmUtY3JlYXRlZCBmcmFtZWJ1ZmZlcidzIHNpemUgbWln
aHQgbm90DQo+ID4gbWF0Y2ggdGhlIG1vZGUgb2YgYSBzdWJzZXF1ZW50IG91dHB1dCwgY2F1c2lu
ZyB0aGUgbW9kZXNldCB0byBmYWlsLg0KPiBJIHNlZSB0aGF0IHRoZSB0ZXN0IGlzIGFscmVhZHkg
Y3JlYXRpbmcgZmIncyBjb25zaWRlcmluZyB0aGUgbWF4IA0KPiB3aWR0aC9oZWlnaHQgYW1vbmcg
b2YgYWxsIHRoZSBhdmFpbGFibGUgb3V0cHV0cywgc28gaWRlYWxseSB0aGlzDQo+IGlzc3VlIA0K
PiBzaG91bGQgbm90IGJlIGhpdC4gQXJlIHdlIHNlZWluZyBhbnkgYWN0dWFsIGZhaWx1cmVzIHdo
aWNoIHRoaXMgcGF0Y2gNCj4gZml4ZXMgb3IganVzdCBkb2luZyB0aGlzIGFzIGEgZmFpbCBzYWZl
Pw0KDQpZZXMsIEkgZGlkIGhpdCB0aGUgaXNzdWUuDQpPdXIgZmlyc3Qgb3V0cHV0IGhhcyBhIHJl
c29sdXRpb24gMzUwNHgyMTkwLCB3aGlsZSB0aGUgc2Vjb25kIG91dHB1dCwNCndoaWNoIHN1cHBv
cnRzIEhEQ1AsIGlzIDM4NDB4MjE2MCwgc28gdGhlIGZyYW1lYnVmZmVyIGlzIHNldCB0bw0KMzg0
MHgyMTkwLg0KDQpTaW5jZSBvdXQgcGxhdGZvcm0gZG9lc24ndCBzdXBwb3J0IHNjYWxpbmcsIGF0
b21pY19jaGVjaygpIHJldHVybnMgKC0NCkVSQU5HRSkgd2hlbiB0aGUgZnJhbWVidWZmZXIgaGVp
Z2h0IG5lZWRzIHRvIGJlIHNjYWxlZCBmcm9tIDIxOTAgdG8NCjIxNjAsIGFuZCB0aGUgdGVzdCBm
YWlscy4NCg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggbW92ZXMgdGhlIGZyYW1lYnVmZmVyIGNyZWF0
aW9uIGxvZ2ljIGluc2lkZSB0aGUNCj4gPiBtb2Rlc2V0X3dpdGhfZmIoKSBmdW5jdGlvbi4gVGhp
cyBlbnN1cmVzIHRoYXQgZm9yIGV2ZXJ5IG1vZGVzZXQNCj4gPiBvcGVyYXRpb24sIGEgbmV3IGZy
YW1lYnVmZmVyIGlzIGNyZWF0ZWQgd2l0aCBkaW1lbnNpb25zIHRoYXQNCj4gPiBwZXJmZWN0bHkg
bWF0Y2ggdGhlIGN1cnJlbnQgb3V0cHV0J3MgbW9kZSwgcHJldmVudGluZyBwb3RlbnRpYWwNCj4g
PiBtb2Rlc2V0IGZhaWx1cmVzIG9uIHN5c3RlbXMgd2l0aCBtdWx0aXBsZSBkaXNwbGF5cyBvZiB2
YXJ5aW5nDQo+ID4gcmVzb2x1dGlvbnMuDQo+IA0KPiBJZiB3ZSBpbmRlZWQgc2VlIHRoZSBpc3N1
ZSBhbmQgZ28gYWhlYWQgd2l0aCB0aGlzIHBhdGNoLCBmYiBjbGVhbnVwcyANCj4gbmVlZCB0byBi
ZSBoYW5kbGVkIGZvciB0aGUgYWRkaXRpb25hbCBmYidzIGNyZWF0ZWQuIEN1cnJlbnRseSB3ZSBh
cmUgDQo+IGRvaW5nIGZiIGNsZWFudXAgb25seSBvbmNlIGF0IHRoZSBlbmQgb2YgdGhlIHRlc3Qu
DQo+IA0KPiBBbHNvIHdlIG5lZWQgdG8gcmVtb3ZlIHRoZSBleGlzdGluZyBmYiBjcmVhdGlvbiBh
cyBpdCBiZWNvbWVzDQo+IHJlZHVuZGFudCANCj4gd2l0aCB0aGlzIGNoYW5nZT8NCg0KWWVzLCBJ
IGRlZmluaXRlbHkgYWdyZWUgd2l0aCB0aGlzLg0KSG93ZXZlciwgSSB3YXMgd29ycmllZCB0aGF0
IGl0IHdvdWxkIGJyZWFrIG90aGVyIHRlc3RzIGluDQprbXNfY29udGVudF9wcm90ZWN0aW9uLCBz
byBJIGRpZG4ndCByZW1vdmUgdGhlIGV4aXN0aW5nIGZiIGNyZWF0aW9uLg0KDQpTaW5jZSBkYXRh
LnJlZCBhbmQgZGF0YS5ncmVlbiBhcmUgc3RhdGljIGdsb2JhbCB2YXJpYWJsZXMsIElzaW1wbHkN
CmNhbGxlZCBpZ3RfY3JlYXRlX2NvbG9yX2ZiKCkgYWdhaW4gdG8gb3ZlcndyaXRlIHRoZSBvcmln
aW5hbCBmYiwgYnV0DQp0aGlzIGNvdWxkIGluZGVlZCBjYXVzZSB0aGUgcG90ZW50aWFsIHByb2Js
ZW0gb2YgZ2VtX2hhbmRsZSBub3QgYmVpbmcNCnByb3Blcmx5IHJlbGVhc2VkLg0KDQpEbyB5b3Ug
a25vdyBpZiBJIHJlcGxhY2VkIHRoZSBvcmlnaW5hbCBjcmVhdGVfZmJzKCkgdG8gaGVyZSwgd2hl
cmUNCnNob3VsZCB0aGUgb3JpZ2luYWwgaWd0X3JlbW92ZV9mYigpIGJlIG1vdmVkIHRvPw0KDQpS
ZWdhcmRzLA0KSmFzb24tSkggTGluDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEthcnRoaWsuQi5TDQo+
IA0K

--__=_Part_Boundary_004_850266450.811145732
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KSGkmIzMyO0thcnRoaWssDQoNCk9uJiMzMjtXZWQsJiMz
MjsyMDI2LTAxLTA3JiMzMjthdCYjMzI7MTA6MzQmIzMyOyswNTMwLCYjMzI7S2FydGhpayYjMzI7
QiYjMzI7UyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtIaSwNCiZndDsmIzMyOw0KJmd0OyYjMzI7T24m
IzMyOzEvNi8yMDI2JiMzMjszOjUxJiMzMjtQTSwmIzMyO0phc29uLUpIJiMzMjtMaW4mIzMyO3dy
b3RlOg0KJmd0OyYjMzI7Jmd0OyYjMzI7VGhlJiMzMjtyZWQmIzMyO2FuZCYjMzI7Z3JlZW4mIzMy
O2ZyYW1lYnVmZmVycyYjMzI7d2VyZSYjMzI7cHJldmlvdXNseSYjMzI7Y3JlYXRlZCYjMzI7b25s
eSYjMzI7b25jZSYjMzI7YXQNCiZndDsmIzMyOyZndDsmIzMyO3RoZSYjMzI7YmVnaW5uaW5nJiMz
MjtvZiYjMzI7dGhlJiMzMjt0ZXN0LiYjMzI7SWYmIzMyO3RoZSYjMzI7dGVzdCYjMzI7cnVucyYj
MzI7b24mIzMyO211bHRpcGxlJiMzMjtvdXRwdXRzDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt3aXRoDQom
Z3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmZXJlbnQmIzMyO3Jlc29sdXRpb25zLCYjMzI7dGhlJiMzMjtw
cmUtY3JlYXRlZCYjMzI7ZnJhbWVidWZmZXImIzM5O3MmIzMyO3NpemUmIzMyO21pZ2h0JiMzMjtu
b3QNCiZndDsmIzMyOyZndDsmIzMyO21hdGNoJiMzMjt0aGUmIzMyO21vZGUmIzMyO29mJiMzMjth
JiMzMjtzdWJzZXF1ZW50JiMzMjtvdXRwdXQsJiMzMjtjYXVzaW5nJiMzMjt0aGUmIzMyO21vZGVz
ZXQmIzMyO3RvJiMzMjtmYWlsLg0KJmd0OyYjMzI7SSYjMzI7c2VlJiMzMjt0aGF0JiMzMjt0aGUm
IzMyO3Rlc3QmIzMyO2lzJiMzMjthbHJlYWR5JiMzMjtjcmVhdGluZyYjMzI7ZmImIzM5O3MmIzMy
O2NvbnNpZGVyaW5nJiMzMjt0aGUmIzMyO21heCYjMzI7DQomZ3Q7JiMzMjt3aWR0aC9oZWlnaHQm
IzMyO2Ftb25nJiMzMjtvZiYjMzI7YWxsJiMzMjt0aGUmIzMyO2F2YWlsYWJsZSYjMzI7b3V0cHV0
cywmIzMyO3NvJiMzMjtpZGVhbGx5JiMzMjt0aGlzDQomZ3Q7JiMzMjtpc3N1ZSYjMzI7DQomZ3Q7
JiMzMjtzaG91bGQmIzMyO25vdCYjMzI7YmUmIzMyO2hpdC4mIzMyO0FyZSYjMzI7d2UmIzMyO3Nl
ZWluZyYjMzI7YW55JiMzMjthY3R1YWwmIzMyO2ZhaWx1cmVzJiMzMjt3aGljaCYjMzI7dGhpcyYj
MzI7cGF0Y2gNCiZndDsmIzMyO2ZpeGVzJiMzMjtvciYjMzI7anVzdCYjMzI7ZG9pbmcmIzMyO3Ro
aXMmIzMyO2FzJiMzMjthJiMzMjtmYWlsJiMzMjtzYWZlJiM2MzsNCg0KWWVzLCYjMzI7SSYjMzI7
ZGlkJiMzMjtoaXQmIzMyO3RoZSYjMzI7aXNzdWUuDQpPdXImIzMyO2ZpcnN0JiMzMjtvdXRwdXQm
IzMyO2hhcyYjMzI7YSYjMzI7cmVzb2x1dGlvbiYjMzI7MzUwNHgyMTkwLCYjMzI7d2hpbGUmIzMy
O3RoZSYjMzI7c2Vjb25kJiMzMjtvdXRwdXQsDQp3aGljaCYjMzI7c3VwcG9ydHMmIzMyO0hEQ1As
JiMzMjtpcyYjMzI7Mzg0MHgyMTYwLCYjMzI7c28mIzMyO3RoZSYjMzI7ZnJhbWVidWZmZXImIzMy
O2lzJiMzMjtzZXQmIzMyO3RvDQozODQweDIxOTAuDQoNClNpbmNlJiMzMjtvdXQmIzMyO3BsYXRm
b3JtJiMzMjtkb2VzbiYjMzk7dCYjMzI7c3VwcG9ydCYjMzI7c2NhbGluZywmIzMyO2F0b21pY19j
aGVjaygpJiMzMjtyZXR1cm5zJiMzMjsoLQ0KRVJBTkdFKSYjMzI7d2hlbiYjMzI7dGhlJiMzMjtm
cmFtZWJ1ZmZlciYjMzI7aGVpZ2h0JiMzMjtuZWVkcyYjMzI7dG8mIzMyO2JlJiMzMjtzY2FsZWQm
IzMyO2Zyb20mIzMyOzIxOTAmIzMyO3RvDQoyMTYwLCYjMzI7YW5kJiMzMjt0aGUmIzMyO3Rlc3Qm
IzMyO2ZhaWxzLg0KDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1RoaXMm
IzMyO3BhdGNoJiMzMjttb3ZlcyYjMzI7dGhlJiMzMjtmcmFtZWJ1ZmZlciYjMzI7Y3JlYXRpb24m
IzMyO2xvZ2ljJiMzMjtpbnNpZGUmIzMyO3RoZQ0KJmd0OyYjMzI7Jmd0OyYjMzI7bW9kZXNldF93
aXRoX2ZiKCkmIzMyO2Z1bmN0aW9uLiYjMzI7VGhpcyYjMzI7ZW5zdXJlcyYjMzI7dGhhdCYjMzI7
Zm9yJiMzMjtldmVyeSYjMzI7bW9kZXNldA0KJmd0OyYjMzI7Jmd0OyYjMzI7b3BlcmF0aW9uLCYj
MzI7YSYjMzI7bmV3JiMzMjtmcmFtZWJ1ZmZlciYjMzI7aXMmIzMyO2NyZWF0ZWQmIzMyO3dpdGgm
IzMyO2RpbWVuc2lvbnMmIzMyO3RoYXQNCiZndDsmIzMyOyZndDsmIzMyO3BlcmZlY3RseSYjMzI7
bWF0Y2gmIzMyO3RoZSYjMzI7Y3VycmVudCYjMzI7b3V0cHV0JiMzOTtzJiMzMjttb2RlLCYjMzI7
cHJldmVudGluZyYjMzI7cG90ZW50aWFsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjttb2Rlc2V0JiMzMjtm
YWlsdXJlcyYjMzI7b24mIzMyO3N5c3RlbXMmIzMyO3dpdGgmIzMyO211bHRpcGxlJiMzMjtkaXNw
bGF5cyYjMzI7b2YmIzMyO3ZhcnlpbmcNCiZndDsmIzMyOyZndDsmIzMyO3Jlc29sdXRpb25zLg0K
Jmd0OyYjMzI7DQomZ3Q7JiMzMjtJZiYjMzI7d2UmIzMyO2luZGVlZCYjMzI7c2VlJiMzMjt0aGUm
IzMyO2lzc3VlJiMzMjthbmQmIzMyO2dvJiMzMjthaGVhZCYjMzI7d2l0aCYjMzI7dGhpcyYjMzI7
cGF0Y2gsJiMzMjtmYiYjMzI7Y2xlYW51cHMmIzMyOw0KJmd0OyYjMzI7bmVlZCYjMzI7dG8mIzMy
O2JlJiMzMjtoYW5kbGVkJiMzMjtmb3ImIzMyO3RoZSYjMzI7YWRkaXRpb25hbCYjMzI7ZmImIzM5
O3MmIzMyO2NyZWF0ZWQuJiMzMjtDdXJyZW50bHkmIzMyO3dlJiMzMjthcmUmIzMyOw0KJmd0OyYj
MzI7ZG9pbmcmIzMyO2ZiJiMzMjtjbGVhbnVwJiMzMjtvbmx5JiMzMjtvbmNlJiMzMjthdCYjMzI7
dGhlJiMzMjtlbmQmIzMyO29mJiMzMjt0aGUmIzMyO3Rlc3QuDQomZ3Q7JiMzMjsNCiZndDsmIzMy
O0Fsc28mIzMyO3dlJiMzMjtuZWVkJiMzMjt0byYjMzI7cmVtb3ZlJiMzMjt0aGUmIzMyO2V4aXN0
aW5nJiMzMjtmYiYjMzI7Y3JlYXRpb24mIzMyO2FzJiMzMjtpdCYjMzI7YmVjb21lcw0KJmd0OyYj
MzI7cmVkdW5kYW50JiMzMjsNCiZndDsmIzMyO3dpdGgmIzMyO3RoaXMmIzMyO2NoYW5nZSYjNjM7
DQoNClllcywmIzMyO0kmIzMyO2RlZmluaXRlbHkmIzMyO2FncmVlJiMzMjt3aXRoJiMzMjt0aGlz
Lg0KSG93ZXZlciwmIzMyO0kmIzMyO3dhcyYjMzI7d29ycmllZCYjMzI7dGhhdCYjMzI7aXQmIzMy
O3dvdWxkJiMzMjticmVhayYjMzI7b3RoZXImIzMyO3Rlc3RzJiMzMjtpbg0Ka21zX2NvbnRlbnRf
cHJvdGVjdGlvbiwmIzMyO3NvJiMzMjtJJiMzMjtkaWRuJiMzOTt0JiMzMjtyZW1vdmUmIzMyO3Ro
ZSYjMzI7ZXhpc3RpbmcmIzMyO2ZiJiMzMjtjcmVhdGlvbi4NCg0KU2luY2UmIzMyO2RhdGEucmVk
JiMzMjthbmQmIzMyO2RhdGEuZ3JlZW4mIzMyO2FyZSYjMzI7c3RhdGljJiMzMjtnbG9iYWwmIzMy
O3ZhcmlhYmxlcywmIzMyO0lzaW1wbHkNCmNhbGxlZCYjMzI7aWd0X2NyZWF0ZV9jb2xvcl9mYigp
JiMzMjthZ2FpbiYjMzI7dG8mIzMyO292ZXJ3cml0ZSYjMzI7dGhlJiMzMjtvcmlnaW5hbCYjMzI7
ZmIsJiMzMjtidXQNCnRoaXMmIzMyO2NvdWxkJiMzMjtpbmRlZWQmIzMyO2NhdXNlJiMzMjt0aGUm
IzMyO3BvdGVudGlhbCYjMzI7cHJvYmxlbSYjMzI7b2YmIzMyO2dlbV9oYW5kbGUmIzMyO25vdCYj
MzI7YmVpbmcNCnByb3Blcmx5JiMzMjtyZWxlYXNlZC4NCg0KRG8mIzMyO3lvdSYjMzI7a25vdyYj
MzI7aWYmIzMyO0kmIzMyO3JlcGxhY2VkJiMzMjt0aGUmIzMyO29yaWdpbmFsJiMzMjtjcmVhdGVf
ZmJzKCkmIzMyO3RvJiMzMjtoZXJlLCYjMzI7d2hlcmUNCnNob3VsZCYjMzI7dGhlJiMzMjtvcmln
aW5hbCYjMzI7aWd0X3JlbW92ZV9mYigpJiMzMjtiZSYjMzI7bW92ZWQmIzMyO3RvJiM2MzsNCg0K
UmVnYXJkcywNCkphc29uLUpIJiMzMjtMaW4NCg0KJmd0OyYjMzI7DQomZ3Q7JiMzMjtSZWdhcmRz
LA0KJmd0OyYjMzI7S2FydGhpay5CLlMNCiZndDsmIzMyOw0KDQo8L3ByZT4NCjwvcD48L2JvZHk+
PC9odG1sPjwhLS10eXBlOnRleHQtLT48IS0tey0tPjxwcmU+KioqKioqKioqKioqKiBNRURJQVRF
SyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioqKioqKioqKioqKioqDQpUaGUgaW5mb3Jt
YXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgDQph
dHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnksIHByaXZpbGVnZWQs
IG9yIG90aGVyd2lzZQ0KZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxh
d3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIA0KY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRl
ZCByZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sIA0KZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMgDQphdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0bHkg
cHJvaGliaXRlZCBhbmQgbWF5IA0KYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFuIGludGVu
ZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZSANCnRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciAN
CmltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5k
IGFsbCBjb3BpZXMgb2YgDQp0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykg
ZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhp
cyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_004_850266450.811145732--

