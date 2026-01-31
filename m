Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79C6D79767
	for <igt-dev@archiver.kernel.org>; Sat, 31 Jan 2026 11:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F3510E042;
	Sat, 31 Jan 2026 11:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HTzKuQiN";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="p2D6aWiK";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CCB10E042
 for <igt-dev@lists.freedesktop.org>; Sat, 31 Jan 2026 11:52:19 +0000 (UTC)
X-UUID: 44ea80a0fe9b11f0b7fc4fdb8733b2bc-20260131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=jcLm+S9wMuajMlYEywFwB03Gj72gHqOnpHWaN43byEE=; 
 b=HTzKuQiNKr/fGfDT9ZlTCO8aQiU1seSZAlTwnMCfujGo4QiNL2wx0utcK59fPBnnClvGBtF7qYNQsTEzk/rVK66ulx9s9XckJSqyf4Dc+786ZxDiV4jayq7OW+atZtYV2FHqlWXba0jrea7JApSr8NH/JzSON3Gx7lsnsPyHG6c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:0c003676-2f99-4c29-a3c7-96e6469b3858, IP:0,
 U
 RL:0,TC:0,Content:10,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:10
X-CID-META: VersionHash:89c9d04, CLOUDID:f6786e7a-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
 TC:-5,Content:4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
 C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 44ea80a0fe9b11f0b7fc4fdb8733b2bc-20260131
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1710175702; Sat, 31 Jan 2026 19:52:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 31 Jan 2026 19:52:06 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 31 Jan 2026 19:52:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KuDciqZdGftFjiAtn2n/sjaUICvVaZcexDpXJuZgs8cE8RWpixTpgPf7eLCoF8k37DjQ1w71hUVp0D4j3efIHc3xgffPOrxtRJmv6QnjDAbRaaZOrKiOCDcuik+gnnviCFwYLNaxDCBKil59ml/9bl5T1ycZB+2pQHmb22Hvn/UIxiIrptIITP3ZTR9NjDWvDGDF2jcS2fYH2KCNmCdXejccjJ4U65oE1K0xoeZZG7mNtAfjH3ygpyIB7VU1jwPDF5QkFmXwtXhdUQ6DXZ84/UqlZLm86dSrIfBu5m5dBJOolS+F6pcgQ+En8vLyI/YXlj3LQWKCTnFyueRABIk0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzv6EUfKnv5fbi1Q3t3794MD67/xaXQrdeEDQ1gmHbI=;
 b=rsP0XkwPfYJKdAcKQsdQa+IRvVQ4fIf8UBuyE9xaKdnk9R45RybirVrW3tt9XI+yp77WNj0ASxHlWdyiMqRHJE9FpGYeHWWvoCPfAXFmieuKdjkQ/v8/uMpXfxsCd0wAG8LK6dd3u/iU19sjOEXrOgYIEdv+ROjHuXezgc3EFLou8zuCevPI4aJYsAnEoekRYF/mC1rox3XfePe3KwOwBAFaVqXBJbKYISUCUpCcuckco6jnLrvghRyd08/Tt7MW2nRB8PtXJo9eNt+/VfMSHCv0ag9SLcB4FUOq8+ZxxbxLsWcILEpCn5+gJ3CfMze3I7SPhvS9ZZuZZ0xJOqNJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzv6EUfKnv5fbi1Q3t3794MD67/xaXQrdeEDQ1gmHbI=;
 b=p2D6aWiKf1Ikf98MzyvpZRcLahIZO1fiBsU7s7OLyyG9WJeLvm6gGDLNIHVewS34kLTUWImdhPgKSIEBxCvfr+am3OIVeex8gS0S9/c3TVu1PpmR+WaynLa+BiH46XG7JdOX3qMG8UIcJytJsn3b7tPL+RrwxS5UztPdzXT/UpQ=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8106.apcprd03.prod.outlook.com (2603:1096:101:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Sat, 31 Jan
 2026 11:52:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9564.013; Sat, 31 Jan 2026
 11:52:02 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Thread-Topic: [PATCH i-g-t 1/2] test/kms_color: Clamp CTM values to -2.0~2.0
 for MediaTek devices
Thread-Index: AQHckC/AlQjiKMuPCEWx24VxlIJLKLVpALOAgAG4kgCAAB4BAIABWF+A
Date: Sat, 31 Jan 2026 11:52:02 +0000
Message-ID: <2baaf7f837b254b10688b697c7aaa62056079dce.camel@mediatek.com>
References: <20260128082517.920321-1-jason-jh.lin@mediatek.com>
 <20260128082517.920321-2-jason-jh.lin@mediatek.com>
 <aXtBQd_hHu3OgCG6@intel.com>
 <46faee5462bfcdc4e40fabaa6d9bc830fb2c51df.camel@mediatek.com>
 <aXzMAJT6ffwgpqZW@intel.com>
In-Reply-To: <aXzMAJT6ffwgpqZW@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8106:EE_
x-ms-office365-filtering-correlation-id: 4a806667-387c-40a0-d75a-08de60bf25c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?alBjdUhscytjRVhHclhCa3dENWZzNHJCbytDTFBhdlo2ZVZ4RVNqbTBMc09O?=
 =?utf-8?B?QXFWT0VwMWVWNmxiOVJUU0hzZXdCcGMxRlAza3RURzhtZndkK21VUTRGYW9a?=
 =?utf-8?B?Qk15bWF1MDFIYXBRZFNZOHR2SG8rOFRZcjUrVFllZmlqT3I5eHhESXdYN1ZT?=
 =?utf-8?B?S1dDaTBNazEyWjl1cGVNcnljTnRhQS8vbEdvSkU2Zm9XV2swdW1zTXNwaUt1?=
 =?utf-8?B?ZEt0RkppdE5GWCtHUzhGTHB0WXk2S09SYVAvMm9kaWZLTkJDa1pVVUVwZENx?=
 =?utf-8?B?WG9TakhIbnhPM3RwV2JmakZ0WE93R2E4VnB4ajJOWjJtQWVhUnJYNzZ0SW1K?=
 =?utf-8?B?aFQvV1doME1TYmdQVlpuNytyUFF6WUJza2VoazlwTkRnUE9SRU5sQlhXZE40?=
 =?utf-8?B?S2FiSlJLUTZUTkd1Y2tNMUtwNFo0eklDQllJWGlmYlJzYVV2S1dGNk5hL2tN?=
 =?utf-8?B?KzFvN3JEdXZRRHdPWDdlS1FIVXdXUkJpWm1qNldFUUZoRytXc2ptNDg0WDlG?=
 =?utf-8?B?QWxraGRLNlUyRGptaU56TGdRRFZHQzBxVmJmaURFMXVCWW1OVy9EdmtkYktK?=
 =?utf-8?B?UjdaUU5jMlBkbGltRlNjbWVwVk95VVdEeHBnQUtyUSsrZkZTbGFkVW51NHUv?=
 =?utf-8?B?Rnp5RVlmRnVGVWlIZmVhR0xsVDBjU2VyZnIrK0NKUHVNQnZWMFRoNDM2L0pq?=
 =?utf-8?B?SllnNmFBbUcwc25XeDFiaTZDejk4c2w0Z3ZybWdJcFIrZGM1MWVQNG1iNG1i?=
 =?utf-8?B?NkthY21qeUhSQ013RDI4bDNLd2I1ZzJkZXdwUmdhaHo1dTVOeUo5bFcvZTNP?=
 =?utf-8?B?VElFVVhJWFRmVGdVQW1vZ2lZdmJRRFR3WlV4RXNPZEc4dHduKzZMRngvRFFq?=
 =?utf-8?B?ZDI0dUFtVXl1UGEwM0NZeWdMUXIyM3NJZ3gvN3NkVHZFbXltK2NHczlsY0lF?=
 =?utf-8?B?V0lQaXhzdWlLcndVd0ZyVEpNcWw2Qmt5NjhydFdINHZxRisxYmQ2aXhCeWRG?=
 =?utf-8?B?MEZHQTY4cGVhWEx5YVhkbXVpYW84Q3NyTzBsSmltWmtRSXQ3blpoMjNVZHg2?=
 =?utf-8?B?TnRFRmg5VU5HVWN5UFhiT0dTZi9JSXZLWjdUdjR3RDljVk5xM1RBQlVNN3Zo?=
 =?utf-8?B?dGtIekpMcDhleGpVVlcvTWN5b2hkOTMzSmZCYlhaUFVnU3piR1E0WFh1UW53?=
 =?utf-8?B?WE1hMjJ4VWtZNmZyRE5nb0Rid0xPeEFOSW1rT1VMZmtPREJyVjhGSmN4d1JY?=
 =?utf-8?B?Q3Q5c0JxTnhDNkp1aXdMVnJ0RjVVeWpnUDZSWVJLMUhOcDFQYURvSDN3bnRN?=
 =?utf-8?B?VlQ5RWJiU0JhOGJUL1VmbHFrNmNoZzU1SmNDV2d2dEVOc2ZIdGc0dkp0RGI2?=
 =?utf-8?B?S0pmL2dxNHNVRS82Tnhid3RSZHZnN21OUjBmakEwZDNHSDFsc2VsVkJ6ZVB1?=
 =?utf-8?B?L3dHUEdsejJFK0xqSTVCU0xYS095YUZGMEJ1b3VFajdJbGtpQVV5emRPdmdp?=
 =?utf-8?B?V0V3NndiRDhQOTJ2VExHZkZaWXdyNlo1QXdBM0IreUMzZFB6Y1Z0R292cmp6?=
 =?utf-8?B?elVBeUtpbW80bkxhN0I4UDVFV1FkNzQrU1lhQ3dGTnNlWG5tN1RhMy8zWFJs?=
 =?utf-8?B?M0JZS21abnVXWGFIZ29FRlRGSUVkcjVDaEVRQ1l6aDdQZzFORldzd2g2azMy?=
 =?utf-8?B?dU9TdmJ2bmtIVTNOa3pxenVzQ2FOdFdFM2VFUDBTMm5zZ29Dai8rOFkxUVdn?=
 =?utf-8?B?R0lSUzhINFFhSTdWK2hRWW1YejhSU204a3FoL29KZVpJT3d0d2h4dVNoUllS?=
 =?utf-8?B?T3JHOUtYOGdXMGk4bUMvclJFbHVDaXlzK1BPMUlYSW9PVDJwTnVwL1VmVHpB?=
 =?utf-8?B?a1pLZXovemRHbnBzc0lIS09jbUpHZkd3bEx2YmNzSVE3ejFybXpNQktMYmtk?=
 =?utf-8?B?d011dHhvNDRCTmxXNXVNL0lHT0swOGVxcVdTS1BMMUZXTFBRSHRJdjNJRXZX?=
 =?utf-8?B?NFBEaW55UmpRMXBycnZSOHFpTG4wa2ovZXhNRUp0Ym5GcTFpNEljNmFjaW9H?=
 =?utf-8?B?RUJmaG1FL1h6YTFBSkl5c1h0RlBrc1E1VEFCVGhVWS9uWmdSZzRZdjlkblZX?=
 =?utf-8?B?cFlaSzRvdUsvQ0xaL1BHR2FIRDZGMmJjUzZSancrbHNXcm5SS3FnUUVMTy96?=
 =?utf-8?Q?jxhdEtzTPMdexnMC60S2ido=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEVPaXJNY0ZpWi9FYlFXajVyS3JGMlltZmxkdXBQa0VucWZsUnQrT0FJY1VB?=
 =?utf-8?B?TklWaUVtMzRsUDdvcWNPU0lrRFpXbE5ZMjR4K0U4Sjg3dEFoRStpbWM4bzF5?=
 =?utf-8?B?ZE9tZkZEbzlpNmt2M3BqYjZHK01hTTlJRkpzTHcvUFNaa0h3RnhZWTNBNzJU?=
 =?utf-8?B?blhaNllJenJDcUlnbXlvYkxhQXpNeDZiOE9hS2xoNG1jWFdweE50M1JQdWhH?=
 =?utf-8?B?WEdDeE5KTWdPZ2wrR0ovZG5PbnlEbXZ2cUs4TzRBdUhRMWlCZTNPRFRRdUI1?=
 =?utf-8?B?ZVJKSFVqTURuNmExWVpxa0gramhYWE1EU2Z0YWxUbVdjd0c1NkJjelRBSUdq?=
 =?utf-8?B?WVhGMkZQdmxocGZITXl3TERXc05Yb1VyV3E5SmVPTElldWUxYTJLSytYVTM4?=
 =?utf-8?B?THZyQTAxbFF2Q0hWSlllbWRHZkdadWI3Y2ljMm5ndUtoRVAyM2F3Wndkb1Mr?=
 =?utf-8?B?MmpUekFLVENJQ28vQ0lFbnhRaFpQOEVoRVc0TEp4YVkxMTVsdmpXK0wzd0k1?=
 =?utf-8?B?S1JHYmsvUXRuK3pEdjV0NlkyY2w2Y0FlMWZtMStOcTJ0dE1KN3JQSjlsazNI?=
 =?utf-8?B?TWJ0NEJQa1JreVR5SXpValJUcjNKWnlMU2hDbHlLcmsrYmViUFBKYmlrTkIy?=
 =?utf-8?B?T2p2eStEYjhUY0hvZVJpWWE2QVlzT3AvS3ZoMWhlblVXNmgrNWJGZzlRbUpo?=
 =?utf-8?B?ZGZweTgvT0grTk9xdjJZM2NERERCeUMzbkNDZlU1a3c0VG0rUjd5TmNXZncv?=
 =?utf-8?B?MDF2dVVRV3hjZkJQRkY2a1VzRDh6Zi91YzdKMFFJL3F3NURiRmY0b1c0VERT?=
 =?utf-8?B?RXE0ZDRGMHhPcFlhcUs0aXhUUndlTWg3YVZYcHFuSzQzbEtmKzZzSGZKVmEv?=
 =?utf-8?B?ejZUTnM3NWpHUlZ4YXJraCszZFNaYzAwdDlCUk1DZnc5T2h3eFpXWVF2MVQx?=
 =?utf-8?B?MmVJajJITWNNL0xuR2lXZVVVWWdiZUc2UUhkVXJoemEwb3RBT1pPYmE1b3JX?=
 =?utf-8?B?ZG9DbGE0SnVZMGROYkN0UHBFVTVwV0hubTJNTktkcXNXbHluV0pTTnN2ZERN?=
 =?utf-8?B?ODFiRkM3SGJ0UWlqMDBHcVZNTVJlckZXdTM0dUc4dHhTeXM0QVlIUHk4dWFo?=
 =?utf-8?B?aG50TCtXd0JYQ0k5N3psWVdnNmpQNjFSd2w5VWVueVc0dGRLaCttQ2pCQ3p5?=
 =?utf-8?B?S0srUk96VllxNFZuTFoxWFZ1YXpnRFByTkNadnpJQ3JMU3ZqM2orb1RlTi9D?=
 =?utf-8?B?NTBmRHlPSVBVT2lXWi9TdHhzZ1c3WGR1TkZOZWs3NHdwMTdrd2JTQUhCVk0v?=
 =?utf-8?B?T2Z2NnppWFc1UGpQSEtJTmJ0Ymltc1dPUm5lMDdNeU9RSkpLMmJaOERWNDVr?=
 =?utf-8?B?dGM4TUMydkl0OVBLcjVmVWNsYXEyZm1DemRlTmJxWStBVnV2Y1hJaG1SREI4?=
 =?utf-8?B?bWhXMHZyWG00aFU3WEZSMVFRZ20yZVZ1NUZ4MHA3OTBzN1psSjN4NmhuYWxN?=
 =?utf-8?B?a3lCUTFxbXZaN3lIWVBZTVN5QVo4L254V3V0dUdjcWRUcVlQOUxqTmJjS1hZ?=
 =?utf-8?B?bDFuRm1QS3hCOVBDaHVDZTd6cmtLbzBMdlI0b2QvME5VK25wOVhjeWlkMlUw?=
 =?utf-8?B?Y1M0TUpXdHB6ajFmOXR6RXQwWis3dEFOd1ROSU9pNmlhckZ0YXFTcGpaWTVj?=
 =?utf-8?B?TG44TWNBbDA2WnBCRS9ncjltV2FnK250Z2s2c3pQRFpmZHdtRUNVcnRZVlJr?=
 =?utf-8?B?NjZTbkJuN0tmYnlTbVFxY2lXNTRweEFxR2JxUFlyUFpsd2FqWlJhS0pYYjJF?=
 =?utf-8?B?OWVWaUsxWWZBNzRNVTBIN2svcDJOdmJveG1ldFFRZk5VNjQrS212MDl2b29P?=
 =?utf-8?B?ZHZDVnAwaXlJbVNDZ0M3THBVUXRrR3RNQ2pLMXNYS1BIZE5VczROdXZuMGtE?=
 =?utf-8?B?S1g3OWlvK0ErM2Yyc2Fma0VGaXhRVzhYdFRnYlIvNkczK013VC9pS0JVS2hN?=
 =?utf-8?B?VkJOMHo0c3RGRFRJdUNjcHRPZzVPOVRoclF1U05wMVpXK2xaNzFQSTdvMUtW?=
 =?utf-8?B?TlhmTWJpRFA1b2ljanUxc2R3aFFqODJaeXlzQi94Q1lUMEhMTG1TYnUwRG9S?=
 =?utf-8?B?MDY2YWlzNkU1YnJNWGt0U3VpT1VIQ2pMaFJFbjJ2RUhyYzdJenJoZjJhc29k?=
 =?utf-8?B?RjJFYmZ6Zmx1MU9obEZqTmV6MHEyQzIzL2s0ZHJsdkNhQUNQS016KzdBaUhP?=
 =?utf-8?B?TzJWajRvT0hOSzdERjBXRk5mUng5SU1aVWRHUDIzR1RQVm5NMWxtY1lXcldT?=
 =?utf-8?B?ZjVtN1FUTkpCdC94YnVOeFptUTBvYzFkcXk0eE52YkRlVFozNDdsVTZmakZv?=
 =?utf-8?Q?QIc82pM8ehOyMPFU=3D?=
Content-ID: <BD8B309AEDD5344E8C3F212C26899258@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a806667-387c-40a0-d75a-08de60bf25c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 11:52:02.1904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxuk5u3L++P/JAi2QMShL7u1I32flPH7K2OLQWHj6ydnaHc/HSykEcDR8rHfnTnXdxtyPe9VGhPPK+pqWofGwiPA17ju27NWyR84iBqup3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8106
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_005_1260114871.1240209777"
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

--__=_Part_Boundary_005_1260114871.1240209777
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDE3OjE5ICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQoNCltzbmlwXQ0KDQo+ID4gPiA+IMKgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGN0bV90
ZXN0cyk7IGkrKykgew0KPiA+ID4gPiArCQlkb3VibGUgZml4ZWRfY3RtW0NUTV9TSVpFXTsNCj4g
PiA+ID4gKwkJY29uc3QgZG91YmxlICpjdG1fcHRyID0gY3RtX3Rlc3RzW2ldLmN0bTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArCQkvKiBUaGUgdmFsaWQgdmFsdWUgb2YgTWVkaWFUZWsgY29sb3IgbWF0
cml4DQo+ID4gPiA+IHJhbmdlDQo+ID4gPiA+IGlzIC0yLjAgfiAyLjAgKi8NCj4gPiA+ID4gKwkJ
aWYgKGlzX210a19kZXZpY2UoZGF0YS0+ZHJtX2ZkKSkgew0KPiA+ID4gPiArCQkJaW50IGo7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwkJCWZvciAoaiA9IDA7IGogPCBDVE1fU0laRTsgaisrKQ0KPiA+
ID4gPiArCQkJCWZpeGVkX2N0bVtqXSA9DQo+ID4gPiA+IGNsYW1wKGN0bV90ZXN0c1tpXS5jdG1b
al0sIC0yLjAsIDIuMCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkJCWN0bV9wdHIgPSBmaXhlZF9j
dG07DQo+ID4gPiA+ICsJCX0NCj4gPiA+IA0KPiA+ID4gVGhlIGtlcm5lbCBpcyBzdXBwb3NlZCB0
byBjbGFtcCB0aGlzLg0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlld3MhDQo+ID4gDQo+
ID4gVGhlIHJlYXNvbiBJIGFkZGVkIHRoZSBjbGFtcCBpbiBoZXJlIGlzIHRoYXQsIHdpdGhvdXQg
aXQsIElHVCB3aWxsDQo+ID4gZ2VuZXJhdGUgYSByZWZlcmVuY2UgZnJhbWVidWZmZXIgdXNpbmcg
Q1RNPTEwMC4wIG9uIHRoZSBDUFUgc2lkZSwNCj4gPiB0aGVuDQo+ID4gc2VuZCBDVE0xLjAgdG8g
a2VybmVsLg0KPiA+IElHVCB3aWxsIGdlbmVyYXRlIGFub3RoZXIgZnJhbWVidWZmZXIgdXNpbmcg
Q1RNPTEuMCwgdGhlbiBzZW5kDQo+ID4gQ1RNPTEwMC4wIHRvIHRoZSBrZXJuZWwuDQo+ID4gDQo+
ID4gVGhlIGtlcm5lbCB3aWxsIGNsYW1wIHRoZSBDVE0gZnJvbSAxMDAuMCB0byAyLjAgZHVlIHRv
IGhhcmR3YXJlDQo+ID4gbGltaXRzLA0KPiA+IHNvIHRoZSBoYXJkd2FyZSBvdXRwdXQgd2lsbCBu
b3QgbWF0Y2ggdGhlIENQVS1nZW5lcmF0ZWQgcmVmZXJlbmNlLA0KPiA+IHJlc3VsdGluZyBpbiBh
IENSQyBtaXNtYXRjaCBhbmQgYSB0ZXN0IGZhaWx1cmUuDQo+ID4gDQo+ID4gVGhlcmVmb3JlLCBJ
IHRoaW5rIEkgbmVlZCB0byBjbGFtcCBDVE0gZnJvbSAxMDAuMCB0byAyLjAgYmVmb3JlIElHVA0K
PiA+IGdlbmVyYXRpbmcgYSByZWZlcmVuY2UgZnJhbWVidWZmZXIgb24gQ1BVIHNpZGUuDQo+IA0K
PiBJSVJDIHRoZSB3YXkgdGhlIHRlc3QgZG9lcyB0aGluZ3MgaXMgdGhhdCB3aXRoIHRoZSAxMDAu
MCAob3INCj4gd2hhdGV2ZXIgPjEuMCkgdGhlIGNvbG9ycyBzaG91bGQgZW5kIHVwIGZ1bGx5IHNh
dHVyYXRlZCBhbnl3YXkuDQo+IFNvIHdoZXRoZXIgaXQgdXNlZCAyLjAgb3IgMTAwLjAgc2hvdWxk
bid0IG1hdHRlci4NCj4gDQpGb3IgTVRLIGhhcmR3YXJlLCBDVE0gdmFsdWVzIGJldHdlZW4gMS4w
IGFuZCAyLjAgcmVzdWx0IGluIGEgZ2Fpbg0KZWZmZWN0LCB3aGlsZSB2YWx1ZXMgYmV0d2VlbiAw
IGFuZCAxLjAgY2F1c2UgYXR0ZW51YXRpb24uIFZhbHVlcyBhYm92ZQ0KMi4wIGFyZSBub3Qgc3Vw
cG9ydGVkIGJ5IHRoZSBoYXJkd2FyZS4NCg0KVGhlcmVmb3JlLCBpZiB0aGUgcmVmZXJlbmNlIGZy
YW1lYnVmZmVyIGdlbmVyYXRlZCBieSB0aGUgQ1BVIHVzaW5nIENUTQ0KMi4wIGRvZXMgbm90IG1h
dGNoIHRoZSBoYXJkd2FyZeKAmXMgb3V0cHV0LCB0aGUgQ1JDIHNob3VsZCB0aGVvcmV0aWNhbGx5
DQpiZSBkaWZmZXJlbnQuIEhvd2V2ZXIsIGluIG91ciBjdXJyZW50IHRlc3RzLCB0aGUgQ1JDIHJl
c3VsdHMgZm9yIENUTQ0KMi4wIGFyZSBhY3R1YWxseSBpZGVudGljYWwuDQoNClRoaXMgbWVhbnMg
dGhhdCBDVE0gdmFsdWVzIGdyZWF0ZXIgdGhhbiAxLjAgbWF5IG5vdCBiZSBlcXVpdmFsZW50IHRv
DQpDVE0gMS4wIGluIHRlcm1zIG9mIG91dHB1dC4NCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0K
DQo=

--__=_Part_Boundary_005_1260114871.1240209777
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGJvZHk+PHA+DQo8cHJlPg0KT24mIzMyO0ZyaSwmIzMyOzIwMjYtMDEtMzAmIzMyO2F0
JiMzMjsxNzoxOSYjMzI7KzAyMDAsJiMzMjtWaWxsZSYjMzI7U3lyaiYjMjI4O2wmIzIyODsmIzMy
O3dyb3RlOg0KDQpbc25pcF0NCg0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7
JiMxNjA7Zm9yJiMzMjsoaSYjMzI7PSYjMzI7MDsmIzMyO2kmIzMyOyZsdDsmIzMyO0FSUkFZX1NJ
WkUoY3RtX3Rlc3RzKTsmIzMyO2krKykmIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OyZndDsmIzMyOytkb3VibGUmIzMyO2ZpeGVkX2N0bVtDVE1fU0laRV07DQomZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrY29uc3QmIzMyO2RvdWJsZSYjMzI7KmN0bV9wdHImIzMy
Oz0mIzMyO2N0bV90ZXN0c1tpXS5jdG07DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjsrDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrLyomIzMyO1RoZSYj
MzI7dmFsaWQmIzMyO3ZhbHVlJiMzMjtvZiYjMzI7TWVkaWFUZWsmIzMyO2NvbG9yJiMzMjttYXRy
aXgNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO3JhbmdlDQomZ3Q7JiMzMjsm
Z3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtpcyYjMzI7LTIuMCYjMzI7JiMxMjY7JiMzMjsyLjAm
IzMyOyovDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsraWYmIzMyOyhpc19t
dGtfZGV2aWNlKGRhdGEtJmd0O2RybV9mZCkpJiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7
JiMzMjsmZ3Q7JiMzMjsraW50JiMzMjtqOw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0
OyYjMzI7Kw0KJmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7K2ZvciYjMzI7KGom
IzMyOz0mIzMyOzA7JiMzMjtqJiMzMjsmbHQ7JiMzMjtDVE1fU0laRTsmIzMyO2orKykNCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOytmaXhlZF9jdG1bal0mIzMyOz0NCiZndDsm
IzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyO2NsYW1wKGN0bV90ZXN0c1tpXS5jdG1bal0s
JiMzMjstMi4wLCYjMzI7Mi4wKTsNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMy
OysNCiZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOyZndDsmIzMyOytjdG1fcHRyJiMzMjs9JiMz
MjtmaXhlZF9jdG07DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjsrfQ0KJmd0
OyYjMzI7Jmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmZ3Q7JiMzMjtUaGUm
IzMyO2tlcm5lbCYjMzI7aXMmIzMyO3N1cHBvc2VkJiMzMjt0byYjMzI7Y2xhbXAmIzMyO3RoaXMu
DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyO1RoYW5rcyYjMzI7Zm9yJiMz
Mjt0aGUmIzMyO3Jldmlld3MhDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMy
O1RoZSYjMzI7cmVhc29uJiMzMjtJJiMzMjthZGRlZCYjMzI7dGhlJiMzMjtjbGFtcCYjMzI7aW4m
IzMyO2hlcmUmIzMyO2lzJiMzMjt0aGF0LCYjMzI7d2l0aG91dCYjMzI7aXQsJiMzMjtJR1QmIzMy
O3dpbGwNCiZndDsmIzMyOyZndDsmIzMyO2dlbmVyYXRlJiMzMjthJiMzMjtyZWZlcmVuY2UmIzMy
O2ZyYW1lYnVmZmVyJiMzMjt1c2luZyYjMzI7Q1RNPTEwMC4wJiMzMjtvbiYjMzI7dGhlJiMzMjtD
UFUmIzMyO3NpZGUsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjt0aGVuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtz
ZW5kJiMzMjtDVE0xLjAmIzMyO3RvJiMzMjtrZXJuZWwuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtJR1Qm
IzMyO3dpbGwmIzMyO2dlbmVyYXRlJiMzMjthbm90aGVyJiMzMjtmcmFtZWJ1ZmZlciYjMzI7dXNp
bmcmIzMyO0NUTT0xLjAsJiMzMjt0aGVuJiMzMjtzZW5kDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtDVE09
MTAwLjAmIzMyO3RvJiMzMjt0aGUmIzMyO2tlcm5lbC4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7VGhlJiMzMjtrZXJuZWwmIzMyO3dpbGwmIzMyO2NsYW1wJiMzMjt0aGUm
IzMyO0NUTSYjMzI7ZnJvbSYjMzI7MTAwLjAmIzMyO3RvJiMzMjsyLjAmIzMyO2R1ZSYjMzI7dG8m
IzMyO2hhcmR3YXJlDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtsaW1pdHMsDQomZ3Q7JiMzMjsmZ3Q7JiMz
MjtzbyYjMzI7dGhlJiMzMjtoYXJkd2FyZSYjMzI7b3V0cHV0JiMzMjt3aWxsJiMzMjtub3QmIzMy
O21hdGNoJiMzMjt0aGUmIzMyO0NQVS1nZW5lcmF0ZWQmIzMyO3JlZmVyZW5jZSwNCiZndDsmIzMy
OyZndDsmIzMyO3Jlc3VsdGluZyYjMzI7aW4mIzMyO2EmIzMyO0NSQyYjMzI7bWlzbWF0Y2gmIzMy
O2FuZCYjMzI7YSYjMzI7dGVzdCYjMzI7ZmFpbHVyZS4NCiZndDsmIzMyOyZndDsmIzMyOw0KJmd0
OyYjMzI7Jmd0OyYjMzI7VGhlcmVmb3JlLCYjMzI7SSYjMzI7dGhpbmsmIzMyO0kmIzMyO25lZWQm
IzMyO3RvJiMzMjtjbGFtcCYjMzI7Q1RNJiMzMjtmcm9tJiMzMjsxMDAuMCYjMzI7dG8mIzMyOzIu
MCYjMzI7YmVmb3JlJiMzMjtJR1QNCiZndDsmIzMyOyZndDsmIzMyO2dlbmVyYXRpbmcmIzMyO2Em
IzMyO3JlZmVyZW5jZSYjMzI7ZnJhbWVidWZmZXImIzMyO29uJiMzMjtDUFUmIzMyO3NpZGUuDQom
Z3Q7JiMzMjsNCiZndDsmIzMyO0lJUkMmIzMyO3RoZSYjMzI7d2F5JiMzMjt0aGUmIzMyO3Rlc3Qm
IzMyO2RvZXMmIzMyO3RoaW5ncyYjMzI7aXMmIzMyO3RoYXQmIzMyO3dpdGgmIzMyO3RoZSYjMzI7
MTAwLjAmIzMyOyhvcg0KJmd0OyYjMzI7d2hhdGV2ZXImIzMyOyZndDsxLjApJiMzMjt0aGUmIzMy
O2NvbG9ycyYjMzI7c2hvdWxkJiMzMjtlbmQmIzMyO3VwJiMzMjtmdWxseSYjMzI7c2F0dXJhdGVk
JiMzMjthbnl3YXkuDQomZ3Q7JiMzMjtTbyYjMzI7d2hldGhlciYjMzI7aXQmIzMyO3VzZWQmIzMy
OzIuMCYjMzI7b3ImIzMyOzEwMC4wJiMzMjtzaG91bGRuJiMzOTt0JiMzMjttYXR0ZXIuDQomZ3Q7
JiMzMjsNCkZvciYjMzI7TVRLJiMzMjtoYXJkd2FyZSwmIzMyO0NUTSYjMzI7dmFsdWVzJiMzMjti
ZXR3ZWVuJiMzMjsxLjAmIzMyO2FuZCYjMzI7Mi4wJiMzMjtyZXN1bHQmIzMyO2luJiMzMjthJiMz
MjtnYWluDQplZmZlY3QsJiMzMjt3aGlsZSYjMzI7dmFsdWVzJiMzMjtiZXR3ZWVuJiMzMjswJiMz
MjthbmQmIzMyOzEuMCYjMzI7Y2F1c2UmIzMyO2F0dGVudWF0aW9uLiYjMzI7VmFsdWVzJiMzMjth
Ym92ZQ0KMi4wJiMzMjthcmUmIzMyO25vdCYjMzI7c3VwcG9ydGVkJiMzMjtieSYjMzI7dGhlJiMz
MjtoYXJkd2FyZS4NCg0KVGhlcmVmb3JlLCYjMzI7aWYmIzMyO3RoZSYjMzI7cmVmZXJlbmNlJiMz
MjtmcmFtZWJ1ZmZlciYjMzI7Z2VuZXJhdGVkJiMzMjtieSYjMzI7dGhlJiMzMjtDUFUmIzMyO3Vz
aW5nJiMzMjtDVE0NCjIuMCYjMzI7ZG9lcyYjMzI7bm90JiMzMjttYXRjaCYjMzI7dGhlJiMzMjto
YXJkd2FyZSYjODIxNztzJiMzMjtvdXRwdXQsJiMzMjt0aGUmIzMyO0NSQyYjMzI7c2hvdWxkJiMz
Mjt0aGVvcmV0aWNhbGx5DQpiZSYjMzI7ZGlmZmVyZW50LiYjMzI7SG93ZXZlciwmIzMyO2luJiMz
MjtvdXImIzMyO2N1cnJlbnQmIzMyO3Rlc3RzLCYjMzI7dGhlJiMzMjtDUkMmIzMyO3Jlc3VsdHMm
IzMyO2ZvciYjMzI7Q1RNDQoyLjAmIzMyO2FyZSYjMzI7YWN0dWFsbHkmIzMyO2lkZW50aWNhbC4N
Cg0KVGhpcyYjMzI7bWVhbnMmIzMyO3RoYXQmIzMyO0NUTSYjMzI7dmFsdWVzJiMzMjtncmVhdGVy
JiMzMjt0aGFuJiMzMjsxLjAmIzMyO21heSYjMzI7bm90JiMzMjtiZSYjMzI7ZXF1aXZhbGVudCYj
MzI7dG8NCkNUTSYjMzI7MS4wJiMzMjtpbiYjMzI7dGVybXMmIzMyO29mJiMzMjtvdXRwdXQuDQoN
ClJlZ2FyZHMsDQpKYXNvbi1KSCYjMzI7TGluDQoNCg0KPC9wcmU+DQo8L3A+PC9ib2R5PjwvaHRt
bD48IS0tdHlwZTp0ZXh0LS0+PCEtLXstLT48cHJlPioqKioqKioqKioqKiogTUVESUFURUsgQ29u
ZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9u
IGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNo
bWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBv
dGhlcndpc2UNCmV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJ
dCBpcyBpbnRlbmRlZCB0byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVj
aXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRp
bmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0K
YXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQgYW5kIG1heSANCmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCBy
ZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJlbGlldmUgDQp0aGF0IHlvdSBoYXZlIHJlY2Vp
dmVkIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgDQppbW1l
ZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwg
Y29waWVzIG9mIA0KdGhpcyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20g
eW91ciBzeXN0ZW0sIGFuZCBkbyBub3QNCmRpc2Nsb3NlIHRoZSBjb250ZW50IG9mIHRoaXMgZS1t
YWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCjwvcHJlPjwhLS19LS0+

--__=_Part_Boundary_005_1260114871.1240209777--

