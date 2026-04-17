Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20384F43680
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB59D10E9AD;
	Fri, 17 Apr 2026 08:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="TXMiNz7C";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="guPGYhrG";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF1810E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:50:18 +0000 (UTC)
X-UUID: 73a7e3263a3a11f19a16598d5ca7f8ec-20260417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=sXCm6xffSg72VNzLObmfm0Y+dorE+8NFvGjcZ7PlY6U=; 
 b=TXMiNz7CQGEoHnhSphoZr94gFkDOJ4Pygnvz+I+xdaC8oHx+jv3MI5xGPAiTFAksq1FCXxCTcE8DH5l8uHQqhCbjUzCM1TvrQxZUl4ZJ//jmHYQ7wsTsqRpvqa/Nnr9peficGznlXuxsrwEL+/6FOTAcR3z9cXwFXvN/RhwMH7M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:66f6bd05-f142-45b1-b426-4edda53f550c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:3f69898f-6df4-4a3d-a7a4-fbdc42d669ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:80|1,File:130,RT:0,Bulk:nil,QS
 :nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
 C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 73a7e3263a3a11f19a16598d5ca7f8ec-20260417
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1240919638; Fri, 17 Apr 2026 16:50:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Apr 2026 16:50:13 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Apr 2026 16:50:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIY74oH9mrMKPf3Zohjwzq2QoPfH7xBx+LuAiJVqyyA3MjyW98vldGL4OVHNT5o5NoL6zQybqQDSgCzIMvhLRjnzpAXD3Be8UmuHGexBl7iRUJFFGuly443XTHbZZGHFWKl24nNDUcq2OJ7quWJOXkfBtA9sm6QJmpCCuEhjGAe5uRFGTR/45+HdfDWMZXCU6pZuEzJan8wqH67v6udY8QI7vVjE6yJlPnSTxK/3jCrucm820pz0Bv2FjaesTytCvRezvjPFZAmqtiybBqzYfN/VQvxBi8GEcnp5KM8o/GUMR/rGc6patK8+GZXVw2uH/W5WTLyGsQaFNcygZOYrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXCm6xffSg72VNzLObmfm0Y+dorE+8NFvGjcZ7PlY6U=;
 b=XhGw3v1boQ7iru+xgUIfBK1irncxRSXN3u1u4g9/rIBG6AvX5MQ32ceNuuSiAO2hrvS2LLWlzltKsvxWfoBAOXKpcqLbkJwFwQ6AoDSSNApeDZmCdBv676L0nMpSdQuShdkwatX5cwTlIKGQkmGAaLPvD7eQU6eWUiFh3m6/FlHq63UWNBU17kUOzhCJbjxZguAECiEGXYgQW6lSEt7dBXrNDpnPGL/mQkIEIn4V97TO/iVmjFt8Pz52+IQineiCVYatub6TWfqj8D24iTfYNvt7NTuI+XYHV4LCxzHhSWDj8uQfhRJU0UpfIoZV/1wvtikTbtKTE4GJDIrC2QZ7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXCm6xffSg72VNzLObmfm0Y+dorE+8NFvGjcZ7PlY6U=;
 b=guPGYhrGeYO+dwJ/y1MVUb/9vZbczJeZW27IvWvl4YsW/sgDdjBXlq/FHiraYZANtF9NaeTDKZFf3qgmsX7sd3x5fOCdqQxhgUS9MGEKXiMtFzjdkuWDAIjoRa0ghFwDbvEIVXUeZAdjlp+PFWUOnqfAKoEiCdCOJxrmRRJ4IgE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB7860.apcprd03.prod.outlook.com (2603:1096:400:47b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 08:50:10 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:50:09 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "jeevan.b@intel.com" <jeevan.b@intel.com>, "bhanuprakash.modem@gmail.com"
 <bhanuprakash.modem@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
 <Paul-pl.Chen@mediatek.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>, "markyacoub@chromium.org"
 <markyacoub@chromium.org>, "gildekel@google.com" <gildekel@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_setmode: Relax vblank timing tolerance
 from 1 scanline to 1%
Thread-Topic: [PATCH i-g-t v2] tests/kms_setmode: Relax vblank timing
 tolerance from 1 scanline to 1%
Thread-Index: AQHcza+25D0Y1Rb/k0eYtYfzjD7CFLXhyEoAgAAH54CAASLTgA==
Date: Fri, 17 Apr 2026 08:50:09 +0000
Message-ID: <7de4af1352d4c25a32319b58bd1bdb0e5c75a266.camel@mediatek.com>
References: <20260416144536.3263173-1-jason-jh.lin@mediatek.com>
 <aeD5qtEo0h4KKDu4@intel.com> <aeEAS30Z9hFW8CSc@intel.com>
In-Reply-To: <aeEAS30Z9hFW8CSc@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB7860:EE_
x-ms-office365-filtering-correlation-id: fc6138d7-6df2-40f6-ee01-08de9c5e54ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: J/yq2aInbB0XHmDL+7iWAChFbj3fVH+pFy54eI0n4iKjU5DAKzxZSY/wFgi673I4xCYrio31VVldBqtJ/C9UcxRZbqVhpnp6uRjkbJeX/2pMJ8BIzycv5WNg8stGNaPItEfaxq6HrXw38NkbW/qPKA1P3A183wOLMebVp5NhycD515f0/gbt6FPVac1K2nJj8CHARP2crC5LAIk8qajng8TSS5rpHdLHiHqHI9gwppTV9YfFkOeRpR2nV20cUqRpaUgN2iRfpAYjqqSPF4pzlWp7grUotGpEEI+6czk9kQQN4IDzvTVZHH9r02s+yUc9BAB+Rg9b2uLwfc31lHaBCDauIob8nTz5tY1KZIcdZdKB979rOPoh8RWkbYbpc0Lf012CFqpKX/Xqwtv0PoUYxiK5Z7Gol89NsdKAx7kh7L1iBfZoKxtB/Tla4NIByZ/84ur8eK7QLytaST5MmZa9tTm5jYUX5IiVjGBzi0tMvQOayBIDFf+2+b5X08dGTAf1UWRIDBZvV1krCHWYVqe12LqiCpyw2CgPTAJT8llXTMYC/NJM+yr2NbqGAMEvgz0CV70yzaDFHngt38/6FH1OD4HNQ1UD3V1qZBpsGo2DAV1YTYzQ9ejjWRlbFUJ717csmLqWv6ULFWDwY3LZDsvv2SJu1lSwyHSKFQs3p2iR6T1XauQt3OM5kdXB05CVs5hnSCwiMiakQlXDKW9yODDiXOGB+xbRu7PrrUflXlS58jgSBf+toEJWKL+tT4Qdu3EL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGZQOGJlUVpJSlpQcEtud1NCdDdMZkJVSXFKM1BiQnZ5dG1Pb3NzbXk3Y1lB?=
 =?utf-8?B?RHZaVlJvNUJoNStSRm1ZZllSc3pUcWd0VFoxVzFRS1A1ekl2TzBwKzF6UlBh?=
 =?utf-8?B?WmpwcHBSUlA5cFgvQ2U5empic21qTkQ1eUJCN21NbEM1cVVML0k4UHpuVlNl?=
 =?utf-8?B?VHd0cDNPMnlJeVFYYWRVM21GRVR4b1JDZit6TzdYZmExTU0reEJaLzZuUnFX?=
 =?utf-8?B?dUx4Z0o4SkhXRDAwS1VNM25uanRWM2plZFJKU2JjYTlQRnJITVFGUHFFeURX?=
 =?utf-8?B?STFJbXJNb3ltMjhlT0I0emdFdW5zODBBTFJqeTIwLyt3cm44ZlZsSENDdFVJ?=
 =?utf-8?B?ZFNWSG1UaTliSzdqa2src1Q1c1JzQ2Uxc3VMK0I5WThhbmI0d2g4WDJLeURF?=
 =?utf-8?B?aGswdHpaWm5ycW5USjNIUlVVaWh2bVFpVTlHbWpPUnAxcmN0YkFWdTdrTEJQ?=
 =?utf-8?B?NFl1K0xsWTNHNnZDQzQ2dWVrYVozaTJwdExwZjZZMlVGLzYrRFdpR0t0MVRz?=
 =?utf-8?B?dWFuZGJJZ1YrYzJSaWRXWjN3cG1wVC9YN0o4VFM2R2hWTEhxbjZoR1N0SWRk?=
 =?utf-8?B?VGMxdENVdkFTTFI3bmtnenFrWHNXek8wTnBGUlZPcnlmLy9aeWgxNm15UUVN?=
 =?utf-8?B?SllUN3h0ZmtUbTh3U0xVejhYc1VyM2xNR1FvQkRkN3FMOEkxbFBWYVgzWkww?=
 =?utf-8?B?MnU0MVJIK2Y5MVBjMFE2Vnl5ZEJwNy9aRDRrbWhqWnRORUtHZVZUT21xT0Nk?=
 =?utf-8?B?N1NvbDRablpuWGUrQ2crUXlBS0R0Rld2QUNuUGN4UEVoeExoUlVqSVEyM0sw?=
 =?utf-8?B?Q0Rsc2MvRXMrd3p5Q3NlNzg5QVRXL0NuUFFBN0NuTkljeDY3NHZJVzBNVlJE?=
 =?utf-8?B?VTZyZWlZejBKaUlIZ0tPWDJWQ2cwaTN4dHBFcFAzMjdSaGV5T2U3bmhpOW10?=
 =?utf-8?B?dmcrK01tWlVxc2taeDRYSmM0K0U2elRCTDhFdlVHVzdjaVEzUHg3SlZnNWJ6?=
 =?utf-8?B?aHF3aG1YTnpqajdoK3hCRGplTTZuaFNMbmd5MC9hcFQ3NXZqdVJ2Wmd0Q2tt?=
 =?utf-8?B?aUxOaXZqeTd6M3RXMll1ekNYekU0VVNUWDZhZlhacDB6clB2T3dtc3dMZkJB?=
 =?utf-8?B?a2FJOTh1bVBtSHpqcGdZcjc5M0x6RjQ4N0Zwby9ZbTdjQW1BMXBRWmtKTzdo?=
 =?utf-8?B?dkF1RjY5ODZSd1B6M2ZOVXlyaWprbllRdm5aZUlNS0w3dmZXNEpaNlE1OVg4?=
 =?utf-8?B?TC9xTEJsR050elMvYlcxZi9XOFlHQy85S2lhMS8relQrNklXcHRxZVkyTm1w?=
 =?utf-8?B?RHRWZmp1elZrRjNTd2sySkxYMEZGMjFTMGo2TGo4bWZxS2k5bEs0SlR2eGdK?=
 =?utf-8?B?cVBjN3RSd21ORTVQVFZUcHBPQzJDM1hqNEZJa1BYVitUaklOVFVsRDJZZWMv?=
 =?utf-8?B?WEZPOXhRNStUaFVnTmxWWlcxc2hRVWdYRXZaTWt2UHFQNk5VYXBFRklnZXNh?=
 =?utf-8?B?V25rK0hRVjJha1ZVQWNlQ1hIajBhcmcvUEVGZENhM3ptaEU0WWpyQzMwbkNH?=
 =?utf-8?B?eUlBdjFLMmtpZ01UaU42T08zVDVNM3dqN3lEK2FORE5PdFJpVG41ci9nS1N2?=
 =?utf-8?B?azRpVy9IeEJSK3RoaWFOSkkvWjdCV1R0QlpNZVhSSVB0ZzNSOTJuTE5IVk1n?=
 =?utf-8?B?NVo1bkFEYWc0d0lSQU9iK1lKRmpmdW10Q3dqeVFmMTBWVkxhdEhPV0pYWlFr?=
 =?utf-8?B?U2p2RXNxUlJOb0pKQW1hSC85cEhCeDkxMCtyRGtMbUp1RDluUEM4RkxIdXJB?=
 =?utf-8?B?WXVoYjY1TStiN2JENFEwWDhmWFdVeStvOGExVXVFQXBqYTZRdkVMU1crVWZn?=
 =?utf-8?B?M3BLOEMxNUk5dmZCdzNGTjRyQ0NQT0g5aGVZOFVnR3B2Z0VtUFEzSW9HUGZI?=
 =?utf-8?B?cnZFNnlCTDNNeHF5VTZsWVVGS1hSbGVzYWRTRE4vQ0oyUU1WNGJCdHhBT3p3?=
 =?utf-8?B?NmdFYkhFL2JKMnRXeHJsWlVrUElYTi9ZalFLVFBEZllWL2dyc3RxeEtjK2FB?=
 =?utf-8?B?UDNkSk9EN2VCdFBLTlZ3a2FMUmxodU1zS3NlMkZxZm9SZGp1OHdpZXJzTllY?=
 =?utf-8?B?dUtoTm55REwzSnFvcWRIS0QrZ0Voamx0Z25tRzNOOVg1bFd6RnZoM1BlaE9j?=
 =?utf-8?B?d3ZkeXNwdlN3Z3BobXA0dVRxazY5eDhmVXlHSENWVUhkbjlpd0YxWGdFc1p1?=
 =?utf-8?B?bG5tZWx5SmZWRFIzUzhhaGhjQ041TFcxNVRuaC91OGY3SE1qR05nQzN6cHgx?=
 =?utf-8?B?Y3hXeGRHQUpSdXB3dkt6b25BVVdTZk8zd2tRejFSRDYwaEJQYlcvSmpjNUIy?=
 =?utf-8?Q?SWIjXAw8zySQRzUQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80D3602579002F49BF79FE9EFA06DA07@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FQFhpd7euWESG+Zo7VHsHCkzZEDIfB0GDo8o8Mr60+l+KzBYF2i8iH9jfE7wvy9bQYaRtua4JC/pMlCMlhPNncUu8Ab4aZwd619bEZ0sWHtohPI9BCxcf860Yc5Jw/faUPLEDDH66UzNVniPyQkJm07sEx+MhT72G7aRJAFKBFfCknqwWEZOpn2iAxmkQ8cIoFyphCPJk3MGUlMrIFxb3GRwfvDIstPitgzUVqqnBw6hA5Sw/7A0wYnw+1eU5FCM491dlh/1PNi0D1HiKYohGRn6DAsdsgLAZYO7brkOz0BpIePbf8HcA6G98W/qAEPP4gFJ+uPbmGijlNDomzMVGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6138d7-6df2-40f6-ee01-08de9c5e54ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 08:50:09.8360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KvQMrhKi/gWwvlkxlr4M/snQIILx5r5TsAljmnpevnEx1fwQ4KLGMpL+HbqmM4U6V3R9FI7QFcCPexjsLDd8mt/E1McqGMioq4XL1OSFOzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7860
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

T24gVGh1LCAyMDI2LTA0LTE2IGF0IDE4OjI5ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgQXByIDE2LCAyMDI2IGF0IDA2OjAwOjU4UE0gKzAzMDAsIFZpbGxlIFN5cmrD
pGzDpCB3cm90ZToNCj4gPiBPbiBUaHUsIEFwciAxNiwgMjAyNiBhdCAxMDo0NToyOFBNICswODAw
LCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+ID4gPiBUaGUgb3JpZ2luYWwgY2hlY2tfdGltaW5ncygp
IHZhbGlkYXRpb24gcmVxdWlyZWQgdmJsYW5rIGludGVydmFscw0KPiA+ID4gdG8gYmUNCj4gPiA+
IHdpdGhpbiAxIHNjYW5saW5lICh+MTV1cyBmb3IgMTA4MHA2MCkgd2hpY2ggaXMgb3Zlcmx5IHN0
cmljdCBhbmQNCj4gPiA+IGNhdXNlcw0KPiA+ID4gZmFsc2UgZmFpbHVyZXMgZHVlIHRvIHVzZXJz
cGFjZSBtZWFzdXJlbWVudCBvdmVyaGVhZC4NCj4gPiA+IA0KPiA+ID4gQ2hhbmdlczoNCj4gPiA+
IC0gS2VlcCBvcmlnaW5hbCBzdHJpY3QgY2hlY2tzICgxIHNjYW5saW5lLCAxLjcxOCBzaWdtYSkg
YXMNCj4gPiA+IHdhcm5pbmdzIG9ubHkNCj4gPiA+IC0gQWRkIHJlbGF4ZWQgdmFsaWRhdGlvbiB3
aXRoIDElIHJlbGF0aXZlIHRvbGVyYW5jZSBmb3IgcGFzcy9mYWlsDQo+ID4gPiAtIFVzZSAzIHNp
Z21hIHRocmVzaG9sZCAoOTkuNyUgY29uZmlkZW5jZSkgaW5zdGVhZCBvZiAxLjcxOCBzaWdtYQ0K
PiA+ID4gKDkwJSkNCj4gPiA+IA0KPiA+ID4gUmF0aW9uYWxlOg0KPiA+ID4gSGFyZHdhcmUgc3Bl
Y3MgKFZFU0EvSERNSS9EUCkgYWxsb3cgwrEwLjUlIHBpeGVsIGNsb2NrIHRvbGVyYW5jZSwNCj4g
PiA+IHdoaWNoDQo+ID4gPiB0cmFuc2xhdGVzIHRvIMKxMC41JSBmcmFtZSB0aW1lIGR1ZSB0byBp
bnZlcnNlIHJlbGF0aW9uc2hpcC4NCj4gPiA+IEhvd2V2ZXIsDQo+ID4gPiB1c2Vyc3BhY2UgbWVh
c3VyZW1lbnQgdmlhIHJlYWQoKSBzeXNjYWxsIGFkZHMgfjAuMy0wLjUlIG92ZXJoZWFkDQo+ID4g
PiBmcm9tOg0KPiA+IA0KPiA+IHJlYWQoKSBvdmVyaGVhZCBpcyBpcnJlbGV2YW50IGhlcmUuIFRo
aXMgaXMgbWVhc3VyaW5nIHRoZSBhY2N1cmFjeQ0KPiA+IG9mIHRoZSBrZXJuZWwgZ2VuZXJhdGVk
IHZibGFuayBldmVudCB0aW1lc3RhbXBzLiBJZiB5b3UgYXJlIGhhdmluZw0KPiA+IHByb2JsZW1z
IHdpdGggdGhpcyB0aGVuIHRoYXQgd291bGQgaW5kaWNhdGUgeW91ciBrZXJuZWwgZHJpdmVyDQo+
ID4gaXNuJ3QNCj4gPiBnZW5lcmF0aW5nIHBhcnRpY3VsYXJseSBnb29kIHRpbWVzdGFtcHMsIG9y
IGl0J3MgdXNpbmcgYSBkb3RjbG9jaw0KPiA+IHRoYXQNCj4gPiBkb2Vzbid0IHF1aXRlIG1hdGNo
IHdoYXQgdXNlcnNwYWNlIHNwZWNpZmllZCBvcmlnaW5hbGx5Lg0KPiA+IA0KPiA+ID4gLSBJbnRl
cnJ1cHQgbGF0ZW5jeSBhbmQgc2NoZWR1bGluZyBkZWxheXMgKDUtNTAgdXMpDQo+ID4gPiAtIFN5
c3RlbSBjYWxsIG92ZXJoZWFkICgxLTUgdXMpDQo+ID4gPiAtIFZhcmlhYmxlIGRlbGF5cyBkZXBl
bmRpbmcgb24gc3lzdGVtIGxvYWQNCj4gPiA+IA0KPiA+ID4gVG90YWwgdG9sZXJhbmNlOiDCsTAu
NSUgKGhhcmR3YXJlKSArIH4wLjUlIChzb2Z0d2FyZSkgPSDCsTEuMCUNCj4gPiA+IA0KPiA+ID4g
VGhpcyBtYWtlcyB0aGUgdGVzdCB+MTF4IG1vcmUgdG9sZXJhbnQgd2hpbGUgc3RpbGwgZGV0ZWN0
aW5nIHJlYWwNCj4gPiA+IHRpbWluZw0KPiA+ID4gaXNzdWVzIGFuZCBhbGlnbmluZyB3aXRoIGlu
ZHVzdHJ5IGhhcmR3YXJlIHNwZWNpZmljYXRpb25zLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gPiBTdWdn
ZXN0ZWQtYnk6IEplZXZhaW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiDCoHRlc3RzL2ttc19zZXRtb2RlLmMgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gPiA+IC0tLS0tLQ0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNTkgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfc2V0bW9kZS5jIGIvdGVzdHMva21zX3NldG1vZGUuYw0KPiA+ID4gaW5kZXggMWYy
ODQ5YmMyNmNmLi5iNDUyZjhhOWU5OTcgMTAwNjQ0DQo+ID4gPiAtLS0gYS90ZXN0cy9rbXNfc2V0
bW9kZS5jDQo+ID4gPiArKysgYi90ZXN0cy9rbXNfc2V0bW9kZS5jDQo+ID4gPiBAQCAtNDk1LDYg
KzQ5NSw3IEBAIHN0YXRpYyBib29sIGNoZWNrX3RpbWluZ3MoaW50IGNydGNfaWR4LCBjb25zdA0K
PiA+ID4gZHJtTW9kZU1vZGVJbmZvICprbW9kZSkNCj4gPiA+IMKgCWRvdWJsZSBtZWFuOw0KPiA+
ID4gwqAJZG91YmxlIHN0ZGRldjsNCj4gPiA+IMKgCWludCBuOw0KPiA+ID4gKwlib29sIHN0cmlj
dF9mYWlsZWQgPSBmYWxzZTsNCj4gPiA+IMKgDQo+ID4gPiDCoAltZW1zZXQoJndhaXQsIDAsIHNp
emVvZih3YWl0KSk7DQo+ID4gPiDCoAl3YWl0LnJlcXVlc3QudHlwZSA9IGttc3Rlc3RfZ2V0X3Zi
bF9mbGFnKGNydGNfaWR4KTsNCj4gPiA+IEBAIC01NjMsMTAgKzU2NCw5IEBAIHN0YXRpYyBib29s
IGNoZWNrX3RpbWluZ3MoaW50IGNydGNfaWR4LA0KPiA+ID4gY29uc3QgZHJtTW9kZU1vZGVJbmZv
ICprbW9kZSkNCj4gPiA+IMKgDQo+ID4gPiDCoAkvKiA5OS43JSBzYW1wbGVzIHdpdGhpbiBvbmUg
c2NhbmxpbmUgb24gZWFjaCBzaWRlIG9mDQo+ID4gPiBtZWFuICovDQo+ID4gPiDCoAlpZiAoYWNj
dXJhY3kgPj0gbGluZV90aW1lKGttb2RlKSkgew0KPiA+ID4gLQkJaWd0X2luZm8oInZibGFuayBh
Y2N1cmFjeSAoJS4zZnVzLCAlLjFmJSUpIHdvcnNlDQo+ID4gPiB0aGFuIGEgc2NhbmxpbmUgKCUu
M2Z1cylcbiIsDQo+ID4gPiAtCQkJwqAgYWNjdXJhY3ksIDEwMCAqIGFjY3VyYWN5IC8gbWVhbiwN
Cj4gPiA+IGxpbmVfdGltZShrbW9kZSkpOw0KPiA+ID4gLQ0KPiA+ID4gLQkJcmV0dXJuIGZhbHNl
Ow0KPiA+ID4gKwkJaWd0X3dhcm4oInZibGFuayBhY2N1cmFjeSAoJS4zZnVzLCAlLjFmJSUpIHdv
cnNlDQo+ID4gPiB0aGFuIGEgc2NhbmxpbmUgKCUuM2Z1cylcbiIsDQo+ID4gPiArCQkJIGFjY3Vy
YWN5LCAxMDAgKiBhY2N1cmFjeSAvIG1lYW4sDQo+ID4gPiBsaW5lX3RpbWUoa21vZGUpKTsNCj4g
PiA+ICsJCXN0cmljdF9mYWlsZWQgPSB0cnVlOw0KPiANCj4gRmFpbGluZyB0aGlzIHdvdWxkIGlu
ZGljYXRlIHRoZSBkcml2ZXIgaXNuJ3QgZ2VuZXJhdGluZyBwYXJ0aWN1bGFybHkNCj4gZ29vZCB0
aW1lc3RhbXBzLg0KPiANCj4gPiA+IMKgCX0NCj4gPiA+IMKgDQo+ID4gPiDCoAkvKiBBdCBsZWFz
dCA5MCUgb2YgZnJhbWUgdGltZXMgZmFsbCB3aXRoaW4gdGhlIG9uZQ0KPiA+ID4gc2NhbmxpbmUg
b24gZWFjaA0KPiA+ID4gQEAgLTU5MSwxNCArNTkxLDYxIEBAIHN0YXRpYyBib29sIGNoZWNrX3Rp
bWluZ3MoaW50IGNydGNfaWR4LA0KPiA+ID4gY29uc3QgZHJtTW9kZU1vZGVJbmZvICprbW9kZSkN
Cj4gPiA+IMKgCSAqDQo+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9l
bi53aWtpcGVkaWEub3JnL3dpa2kvU3RhbmRhcmRfZGV2aWF0aW9uKlJ1bGVzX2Zvcl9ub3JtYWxs
eV9kaXN0cmlidXRlZF9kYXRhX187SXchIUNUUk5LQTl3TWcwQVJidyFtbjREZVJ4VnBwM1ktUG1j
UkxCZk1ZRDR1NHFqUHpteDVKdkJRMVBZWUNCaVRJX3lnTE5SNXNfVDAxQ1RNNlRpLXZuRFN6elB4
QjUwOWJzQmN4Z0ZCRVJwY3FxUmdTTzVRQSQNCj4gPiA+IMKgDQo+ID4gPiDCoAkgKi8NCj4gPiA+
IMKgCWlmIChmYWJzKG1lYW4gLSBleHBlY3RlZCkgPj0gbWF4KGxpbmVfdGltZShrbW9kZSksIDEu
NzE4DQo+ID4gPiAqIHN0ZGRldikpIHsNCj4gDQo+IEFuZCBhc3N1bWluZyB0aGUgdGltZXN0YW1w
cyB3ZXJlIGdvb2QsIGZhaWxpbmcgdGhpcyB3b3VsZCBpbmRpY2F0ZQ0KPiB0aGUNCj4gYWN0dWFs
IHRpbWluZ3MgZG9uJ3QgcXVpdGUgbWF0Y2ggd2hhdCB1c2Vyc3BhY2Ugc3BlY2lmaWVkIChlZy4N
Cj4gZG90Y2xvY2sNCj4gY291bGQgYmUgYSBiaXQgb2ZmKS4gSSBzdXBwb3NlIHdlIHNob3VsZCBh
bGxvdyB0aGF0IFZFU0Egc3BlY2lmaWVkIA0KPiAuNSUgZXJyb3IgaGVyZS4NCg0KVGhhbmsgeW91
IGZvciB0aGUgcmV2aWV3Lg0KDQpZb3UgYXJlIHJpZ2h0IHRoYXQgcmVhZCgpIG92ZXJoZWFkIGlz
IGlycmVsZXZhbnQgaGVyZSBzaW5jZQ0KY2hlY2tfdGltaW5ncygpIGlzIG1lYXN1cmluZyBrZXJu
ZWwgZ2VuZXJhdGVkIHZibGFuayBldmVudCB0aW1lc3RhbXBzLg0KSSB3aWxsIHJlbW92ZSB0aGF0
IHBhcnQgb2YgdGhlIHJhdGlvbmFsZS4NCg0KUmVnYXJkaW5nIHRoZSB0d28gY2hlY2tzOg0KDQpG
b3IgQ2hlY2sgMSAodGltZXN0YW1wIGFjY3VyYWN5ID49IGxpbmVfdGltZSk6IFlvdSBwb2ludGVk
IG91dCB0aGF0DQpmYWlsaW5nIHRoaXMgaW5kaWNhdGVzIHRoZSBrZXJuZWwgZHJpdmVyIGlzbid0
IGdlbmVyYXRpbmcgZ29vZA0KdGltZXN0YW1wcy4gV2Ugd2lsbCBpbnZlc3RpZ2F0ZSBhbmQgZml4
IE1USydzIHZibGFuayB0aW1lc3RhbXANCmltcGxlbWVudGF0aW9uIGF0IHRoZSBrZXJuZWwgZHJp
dmVyIGxldmVsICByYXRoZXIgdGhhbiByZWxheGluZw0KdGhlIHRlc3QuDQoNCkZvciBDaGVjayAy
IChtZWFuIGRldmlhdGlvbiBmcm9tIGV4cGVjdGVkKTogSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2gN
CnRvIG9ubHkgcmVsYXggdGhpcyBjaGVjayB0byBhbGxvdyB0aGUgVkVTQSBzcGVjaWZpZWQgwrEw
LjUlIHBpeGVsIGNsb2NrDQp0b2xlcmFuY2UsIGFuZCByZW1vdmUgdGhlIHJlYWQoKSBvdmVyaGVh
ZCByYXRpb25hbGUgZnJvbSB0aGUgY29tbWl0DQptZXNzYWdlLg0KDQpSZWdhcmRzLA0KSmFzb24t
SkggTGluDQo=
