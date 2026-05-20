Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497ADCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 10:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA58410E048;
	Wed, 20 May 2026 10:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="j/T6d0ID";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZpD+ohiN";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40E10EFFF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 10:17:25 +0000 (UTC)
X-UUID: 1682bbf2543511f1b5a00d44d12bea5a-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From;
 bh=dRQY3nczvD1W/BI+2y0NX84+CFmjvd3wKs7hcxJQDg4=; 
 b=j/T6d0IDtFSWKrWxuoGIMx0XFeR6OBRSnP1MfKjUfhdFjWlJT+5FLwtZ0g2QvfgR5ojVVUMR1l7ovOZQo6P6EJea6Og2IsA/b3yJeysYJP63sUZPW/lbobiIaSChMfnaWBiv4miKpmLl4Bjex3bwbi82hs4jI1HyfbYxnu5BNXU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:ba141a2c-19f8-4227-b42f-4631d1c53452, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:02172322-bef7-463f-902c-5f40f7404c33,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,Q
 S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1682bbf2543511f1b5a00d44d12bea5a-20260520
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 339184901; Wed, 20 May 2026 18:17:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 18:17:20 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 18:17:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPkn3PfXnXBze3v6pbePDinI4oVAKupW5WMRivkhdYefnwXINPrMOARyqC/MvqEPcs4L4ofPyh5icXgLPIpWhkBhVznaHKFwJ2dA1Fn/AROVpOG1jTqysavOC40NwhjrBGXSjP9lv8WM50gdrJ0sgTZV9kWM9oDaqmMZvKT7KZ0rr22zWIB6979jni+PHVkuQggGy8KyAYCsMiwwdgIge+ibNm0qrc0N6ouAcF6/TTpPgQE60xoOQQs158KsCMJVe2ibyDUThyyAnM1Oi1txP6vuadx7qb0CzznJsSS2ZylW9ntZ8zpzLd7hw3k1n/biNCvNBNeZcMrKZr6KwMGDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRQY3nczvD1W/BI+2y0NX84+CFmjvd3wKs7hcxJQDg4=;
 b=IbDl1K/YvCrDmdK7KBngqxHHykZlUPLw5IzL0i0FL41sYYvAxs7yxW10oN+vJHObR6aTVymQEnpr3fx9Rnosz/yzWaPxO8I3ifGwSxgvK5bdxWt7Uu6TCntwoSdUmjNdFsuBPXaMcrXwni+0MUNmBxQVPtw87W4Yp4BcILF8I8uNAm1dEDQAtPCttZlh6y3Bg9nFPMC9a7RcKY/YDEOdahA3nsQ5w65oV7qV2li922Xem59zg/kpDg6Ar45N31j1x8R1K/wxtMeUCBPN8+8qFT9R7EmvziXu+d5xnfH3B+ygtPEZNlnSYVTBIU/WKSo8wHVT//B8vXJzv6wcC/6aYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRQY3nczvD1W/BI+2y0NX84+CFmjvd3wKs7hcxJQDg4=;
 b=ZpD+ohiNROmVKspbtvsWWfzEBh2ZFvJDdAnV2Le5Nqq1UJpvu8UwBJN0KD+AewTqHsbv/BPNHSA0p1XEIe150cGaUWX9Z7tBpI44bVTofInd7JinmPY84D9bWnbDn+SpVKi4kSAIlFanO/kCx2fDUkASUdwG1ic2FDQnBVMKick=
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6)
 by SEYPR03MB7359.apcprd03.prod.outlook.com (2603:1096:101:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Wed, 20 May
 2026 10:17:13 +0000
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::1a5c:29d7:cb68:2d36]) by KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::1a5c:29d7:cb68:2d36%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 10:17:13 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep()
 to control CPU C-states
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep()
 to control CPU C-states
Thread-Index: AQHc6CSFeY/lRZNLyU6LJ8RFMCqvkLYWq1+AgAAH/oA=
Date: Wed, 20 May 2026 10:17:13 +0000
Message-ID: <4e16a5e72e2201d71586851a9496a90ff8dbcd39.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-2-jason-jh.lin@mediatek.com>
 <20260520094837.g3d333dbkd5wntqc@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260520094837.g3d333dbkd5wntqc@kamilkon-DESK.igk.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7669:EE_|SEYPR03MB7359:EE_
x-ms-office365-filtering-correlation-id: 5e35849b-e795-4009-cc7a-08deb658f60e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|3023799007|38070700021|921020|18002099003|56012099003|22082099003|4143699003|11063799006;
x-microsoft-antispam-message-info: EKxfx8ea+JE2Rsj2CZ5Kgm1blliACzpFYYrOdNTCu6MX5vls52sbfVKj+LzhgBkjPJHVaAtKUSGcTtTLGzk4TtMOqds1L0cR/sZ+DNQIGXXVawFjBvU4Khg8QdJW8r7kepahS+XdJRVcU1oac0OgHsgm1YvNw7feXM5fdSsS3ubJbNe/h61Pq8nCoHAXBKVdV8fef/BwN72f0Y5Meb3DeAUmA/L2jjSj3vJhFT8T5K97m7e5epzvZ05EZ+H8rLs5i0ZklG/QOl/ZXyfs1/L/pk+yg6rlM91uV1BkTKabNGkiVNvN9+qiEP2uE9NiIf2ufHBV+gEtgipcMFNP/n8CrDWhsFETs97/QMb33s07bWaOrMLZh3gdh+JQDhGA7GQsmTlFeNlN62vFZRhfH0jE1zrehGZjo17yrcXzbxwC3WcfKIpKci+x5Sy3JDFvz3Qzq9+Rc0eIWayEOjEOVIOWfRHdQppiteY8JL31PbW6wAgITKxQKOTBLzrzBi+ZbodyXx6Njd0+WzKWyTM9dzoKFwt130T2PYqYhlvuxf6UEw7QAmEbjPZYkyHYBgdoVkIJBJNqJCZMvNWubtOg4Bygnk7NH4Ch+Fndkod8U1xmydehi8615PpzoIBktCFe58bKN1BU111Zy9sWUTaehX8OxF50za7QW+XY35A//Smlnh443NtU7dSkyCypO5bTIPhQ//emi1EZ2ssSVSMjvQ7jSiIiGi63QKfT8fL2Kbcf9p4OeMdydeDag7ChNiZ1N5Tc/0e34jaFsoxJURYjyn/FZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB7669.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(3023799007)(38070700021)(921020)(18002099003)(56012099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUlJRThpL2lDWlpyRFV1Z3VVQUhHV2NzUFVZcTRTOXlZQ2tzYktucEMvQmNv?=
 =?utf-8?B?NThxU01IbGVGamVVQnkxSW9pdko1TnVucUt5L1VzVmYvTjcxZHVKZTJzZXpF?=
 =?utf-8?B?N0ttSC9MZkZveWkrM3VndHc5K2k5ZGJleGlyZVN4Wnd0NEJ0VHg1TklzQnFW?=
 =?utf-8?B?dXZIUkcrSDY4cldlbExEQUdGUTljZGQzanRXaGRJdmlUeGtqcCtZdFFiOWFO?=
 =?utf-8?B?UHVkdGNiSk8zUS9qRWZHM3h0cmo4WTJEdXdJTjJ3U3hiNVlnUzFwd2prenpE?=
 =?utf-8?B?TmJ3aE1pRkhMYVJSQ2Q3VTM5UVdyVzRCQjROaWo1WFNjSVdBcGQ4ZEdVeFMx?=
 =?utf-8?B?TE50cjJHTzkzb2tZMlEyaStrZ2lydHRXRExKNFdGUDM1WklBdXhGSkNOSStS?=
 =?utf-8?B?YS9pdDJha1d3ejhJenUzZFF2ODczS3dmRGNRV0xLeHhROXloRXkrdXVyZGM2?=
 =?utf-8?B?OW16NWpSUlphYzBia3VDNVJWWi9jWXorbnpNaWhXN1dYQWp3Ri9UTno1YWw5?=
 =?utf-8?B?NVJ2QmdVTnFNREdJWWhKeTJqYjZINFhuUHdUYkloMC9uc241S2lJdnJhTlBZ?=
 =?utf-8?B?Um1vNmhkQlZxbUNLaEszTkI2R0dhZmwxR3JVZUppWGtURUI1YzUwN2FvMUY3?=
 =?utf-8?B?MXQxUEZBc254WjNldktnVkxBb3pGOGttQnRMQ3JXR0h0WEFpN05JaDBvTVZX?=
 =?utf-8?B?MFhxZks3N2xhYnNHdkp5M2JwUVpUczJ1SEp1VXk2Qk5RV21jOUp1SzhzTy9j?=
 =?utf-8?B?am5qS3V2SC83Q21qdlN1MExpc2l2VWxPVlZQcU1ROHlLazdJOEdNeW5zSWlJ?=
 =?utf-8?B?Z0hGMUtEYkJReFZVQ2NjWG9kRkFwUW9TL2xZMTZleDRVeSt5TzRleng2TW9o?=
 =?utf-8?B?UEEzRGRjL0IrdzBjRDJYVGlKWGdBR3ZpWC9lYUpSeFdqTnlrNlQ2QnhhYkdj?=
 =?utf-8?B?OWk2OEpFS052bmkrbVhPQlRLV0x4M0Zyd3ZVMHY0TmlTc25jRkE2aHhOUEZU?=
 =?utf-8?B?YUF1UDhjQTNEWmp5SXNJWVhmMVJCZ0VnNDRWeURYeWZHQ2RGQk51WW81TG9N?=
 =?utf-8?B?Zno2WGZzRk44dWx4T1BHcTFYNTM1a2M3QWdHWGkvTDFIZjJ3WjdyTGdlS2xS?=
 =?utf-8?B?dndLN2N4Y0xTVzgvaElSZll4NEpFSkxJRTAzcXZGWm52S2o4WnVob1pyNlhD?=
 =?utf-8?B?cVVabGJTSnhMdWxDaEpaZGdEb1hsVXFjL1ZlL3RpN3NQMWIza3VjZEpiSFdQ?=
 =?utf-8?B?TldEV1VraDhua1ZzV0toaCs1c1ZHSjM1ZmE4RGpjVGFyZVB3bUFxanBnMTVN?=
 =?utf-8?B?d0dhRnRjTXdNR3NxNW1uRkZBMWlwek00ZEoyZHBpeHdVeWp4dGFDVGZrZGI1?=
 =?utf-8?B?TTZyT2ZxSkpIY2ZkWmFOdFlDOThWbGpiT1loYnRYOCtrZzdkWFhMbFFaR2Va?=
 =?utf-8?B?WWpUUzBmcHNTZExlellyRkpZNmo0OXRIajlKTlBhMzI0bWFKTHJoUFYxbTRz?=
 =?utf-8?B?VE41dXAyQjkxSlBaV2t6L3RLbC9WYyt2Y09kNW84RW1RbHhTa2xlTlBuclZP?=
 =?utf-8?B?MXZWOGd4RVpYSzF2ek8zS2Y0cFhvdGl4V1QvQldOWERITnZiMGhtdzA2SnBW?=
 =?utf-8?B?OVBoeFV6Nm5LVW5yby9YR1gwT3Z0OVlRMjRXbkZCUzl6bjNlMHp1cHpWRi8x?=
 =?utf-8?B?Qmk0MWdMVmJmR2puZDVrNE1iVmMycVBiZ1I3djUxMFNHT2pNU1RmcGZDc3pG?=
 =?utf-8?B?SWZaNC9MT3hKWktwUUdLZ1J0U25yeTVhNTlnVVM1OEVzQndtYVFFVzN3V09y?=
 =?utf-8?B?UVFyK1gxV3VoQzllSmpUZmJjK1NCckxGbEEwbmtnaUZwT0lPcXZnR3R3VzNH?=
 =?utf-8?B?enVpNndBZHhQNWJmUThadkFpbkp5UE9lWmd3elFkNGNRd2pYZVVyb2ppTUFX?=
 =?utf-8?B?QWZKTk85T09vM3lXWG40TzRha2wyMGk1aW1kWEQwZTAvUFJNaDU3dHV1YWJQ?=
 =?utf-8?B?aU5ZMnhWdVNQZkFhajFPazl6bGsxTm1WaU9SOGtGdGE4WTEwcjdza3pZbnRL?=
 =?utf-8?B?UFB2eXh1KzdURVg2blVWVnBLZ1hZb3BoYkUxL25HZmV1N1JiOWcrR1JDQnhW?=
 =?utf-8?B?c0MybnppMVBoM2JFd1FzcHd2bm9OVkV5VFJqU3NKOVBTVlY2VHdnSytBazFV?=
 =?utf-8?B?cFcrK0RWaXlZZnRwMUk5dTdQNjBZLy95bktUNFQ4OTN4VWpTang1NDZ2TVYx?=
 =?utf-8?B?bnJVSHVaZkprdFhuYnlnRVFuMVFRc29palUrRkh0QkpEL3BGU3dSQVo3SkY3?=
 =?utf-8?B?ZGlDQ2lyOVJqZGkzY25ISnM5OEx1WjVIN21sNkdua2hud3MxWU9YRUswTWVT?=
 =?utf-8?Q?fvtwqPQkL/Jz/0yM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A122DACFDE2B014282D023E8B99BDE54@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CvAOZO2d+rTTJGY4H//WTdAoUuTT/xxSZ8OblIEKl3I14BhdqSZqIVSuTljK/lFxo9KjHGOCijeFmRmZnRitt/vSCbaKr6IBnmAsH44/qzFW+73D2sWIx4GIZw/sQsqEQwHLSuTQ/Swa2h7aamQa2IkGctSYOIVTjXO4zw88GrVBCtIk+iAhOAa7LiJNC1xLW92P4NPZbo2ezLvPcAgZMvnh5UpMzypoAJLdtS0onADIt4mRFpbCKTZvKuY4yxX9b5hP2HARbFw/zqupn/RYGclkIjzvk4llOZ6seWz7iUZ36Lm5YbS0UeiEQQ6IQ2nstwp5luDF18CnX3HfV7UUNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7669.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e35849b-e795-4009-cc7a-08deb658f60e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 10:17:13.4332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1mIk37b9PRl8C8WPDY8NSPaXa4QYjvb8+VpKdWWQVufvN/3Q4AtyJUEoqh0S9hPfKvW/rFu+xcDi2XioHJlVSLx6VwPOPF7tQdRL+wTnZYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7359
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

W3NuaXBdDQoNCj4gPiAtLS0gYS9saWIvaWd0X2ttcy5jDQo+ID4gKysrIGIvbGliL2lndF9rbXMu
Yw0KPiA+IEBAIC02Nzc2LDYgKzY3NzYsNzIgQEAgYm9vbCBpZ3RfY2hlY2tfb3V0cHV0X2JwY19l
cXVhbChpZ3RfY3J0Y190DQo+ID4gKmNydGMsIGlndF9vdXRwdXRfdCAqb3V0cHV0LA0KPiA+IMKg
CXJldHVybiAoY3VycmVudCA9PSBicGMpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gKy8qKg0KPiA+
ICsgKiBpZ3RfZGlzYWJsZV9jcHVfZGVlcF9zbGVlcDoNCj4gPiArICogQGZkOiBEUk0gZGV2aWNl
IGZpbGUgZGVzY3JpcHRvcg0KPiA+ICsgKiBAZGlzYWJsZTogdHJ1ZSB0byBkaXNhYmxlIGRlZXAg
c2xlZXAgc3RhdGVzLCBmYWxzZSB0byByZXN0b3JlDQo+ID4gdGhlbQ0KPiA+ICsgKg0KPiA+ICsg
KiBDb250cm9scyBkZWVwIENQVSBpZGxlIHN0YXRlcyAoQy1zdGF0ZXMpIHRvIHByZXZlbnQgSVJR
IGxhdGVuY3kNCj4gPiBzcGlrZXMNCj4gPiArICogZHVyaW5nIHZibGFuayBldmVudHMuIFRoaXMg
aXMgYSBzeXN0ZW0td2lkZSBvcGVyYXRpb24gdGhhdA0KPiA+IGFmZmVjdHMgYWxsIENQVXMuDQo+
ID4gKyAqDQo+ID4gKyAqIFRoaXMgaXMgYSBnZW5lcmFsIEFQSSB0aGF0IHZlbmRvcnMgY2FuIGV4
dGVuZC4gQ3VycmVudGx5Og0KPiA+ICsgKiAtIE1lZGlhVGVrOiBEaXNhYmxlcy9lbmFibGVzIHN0
YXRlMSBhbmQgZGVlcGVyIHN0YXRlcyBvbiBhbGwNCj4gPiBDUFVzDQo+ID4gKyAqDQo+ID4gKyAq
IFdoZW4gQGRpc2FibGUgaXMgdHJ1ZSwgZGlzYWJsZXMgZGVlcCBzbGVlcCB0byBlbnN1cmUgc3Rh
YmxlDQo+ID4gdmJsYW5rIHRpbWluZy4NCj4gPiArICogV2hlbiBAZGlzYWJsZSBpcyBmYWxzZSwg
cmVzdG9yZXMgcG93ZXItc2F2aW5nIGlkbGUgc3RhdGVzLg0KPiA+ICsgKg0KPiA+ICsgKiBSZXR1
cm5zOiB0cnVlIG9uIHN1Y2Nlc3MsIGZhbHNlIG9uIGZhaWx1cmUNCj4gPiArICovDQo+ID4gK2Jv
b2wgaWd0X2Rpc2FibGVfY3B1X2RlZXBfc2xlZXAoaW50IGZkLCBib29sIGRpc2FibGUpDQo+ID4g
K3sNCj4gPiArCWNoYXIgY3B1X3BhdGhbMjU2XTsNCj4gPiArCWNoYXIgc3RhdGVfcGF0aFs1MTJd
Ow0KPiA+ICsJaW50IGNwdSwgc3RhdGU7DQo+ID4gKwlpbnQgY291bnQgPSAwOw0KPiA+ICsJRklM
RSAqZnA7DQo+ID4gKwljb25zdCBjaGFyICp2YWx1ZSA9IGRpc2FibGUgPyAiMSIgOiAiMCI7DQo+
ID4gKwljb25zdCBjaGFyICphY3Rpb24gPSBkaXNhYmxlID8gIkRpc2FibGVkIiA6ICJSZXN0b3Jl
ZCI7DQo+ID4gKw0KPiA+ICsJLyogT25seSBNZWRpYVRlayBuZWVkcyB0aGlzIGN1cnJlbnRseSAt
IG90aGVyIHZlbmRvcnMgY2FuDQo+ID4gZXh0ZW5kIGhlcmUgKi8NCj4gPiArCWlmICghaXNfbXRr
X2RldmljZShmZCkpDQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiANCj4gRG8gbm90IGRvIHRoaXMs
IG1ha2UgaXQgYSBnZW5lcmFsIGZ1bmN0aW9uIGZvciBldmVyeSB1c2VyLg0KPiBBbHNvLCBpbWhv
IHRoaXMgc2hvdWxkIGJlIGluIGFub3RoZXIgbGliLCBub3QgaW4gaWd0X2ttcy4NCj4gDQoNCkhp
IEthbWlsLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KRm9yIHRoZSBsaWIgcGxhY2Vt
ZW50LCB3b3VsZCBpdCBiZSBhcHByb3ByaWF0ZSB0byBtb3ZlIHRoaXMgaW50bw0KbGliL2lndF9w
bS5jPw0KDQpJIG5vdGljZWQgdGhhdCB0aGUgZXhpc3RpbmcgQVBJcyBpbiBpZ3RfcG0gZG9uJ3Qg
dGFrZSBmZCBhcyBhDQpwYXJhbWV0ZXLCoGZvciBkZXZpY2UgaWRlbnRpZmljYXRpb24uIEZvciBj
b25zaXN0ZW5jeSwgaWYgd2UgYWdyZWUgb24NCm1vdmluZyB0byBpZ3RfcG0sIEknbGwgYWxzbyBt
b3ZlIHRoZSBpc19tdGtfZGV2aWNlKCkgY2hlY2sgdG8gdGhlIGNhbGwNCnNpdGUgYW5kIHJlbW92
ZSBmZCBjaGVjayBmcm9tIHRoZSBmdW5jdGlvbi4NCg0KQmVzdCByZWdhcmRzLA0KSmFzb24tSkgg
TGluDQoNCj4gUmVnYXJkcywNCj4gS2FtaWwNCg0K
