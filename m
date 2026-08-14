Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCC7C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 17:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E89810E58F;
	Fri, 14 Aug 2026 17:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="V/tSngFH";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Y43RhFJ2";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DF510E58F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 17:12:43 +0000 (UTC)
X-UUID: 58b18dde980311f1b1788b6acf885367-20260815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=6SWfi2XwUzMxcdMx8YjC7yktUNBm5Dqd/e1Pu5TIH6w=; 
 b=V/tSngFHSCOYg7DB2KbHy9mTuHDS/RGlzdT656JpTIl6G/VSf2pjEJMrSz4fPLCPHvUbup6a7qhTluPlxbLXkhZQR0vwjAZ5wX6IOKzL4E+KeZC1TX4k04om9Okd0E4BfO9ZyH5zSyzkDueXJjjkj+/UXngymhsGraHC8Y6LEqI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:d3575d76-017e-44c5-a01b-590ea14ed1c7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:07737be2-71f1-405e-92eb-6802d6af74fd,
 B
 ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
 Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
 1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58b18dde980311f1b1788b6acf885367-20260815
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1803974466; Sat, 15 Aug 2026 01:12:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 15 Aug 2026 01:12:35 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 15 Aug 2026 01:12:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlcAVHnbSoJP+EPvE8KdQzazeNFx2BMtT0S18/RJG1QyXcD96YandJINE8YxNBUq9zWdkWzI02rebm7PmG0SIrhW3gFGcCw4s8z24dUPxFwFOwJNikZSf70RNt96XRC8oewRlnsphJ33jAO4cuSo6fGnLQomABbv32I8zyftmzBvTLu48MSpgXUABXqXt2kl0MW0Y/Ipx6vi3+idb0qYyCsJJwdpHXa+g6rrR9bAgV0d5b/eitGqGyzRdnClvlBUD55BppE9e8lrpDX6rc7wwrFO4n0MdWGpTZAl3smWF9NEHhBfGEBGPwdviin7zH1h8OanEstSnXv2OEDos+z0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SWfi2XwUzMxcdMx8YjC7yktUNBm5Dqd/e1Pu5TIH6w=;
 b=fzT2MFR2nyMTvtWs1XKah7Vjs+7/fR1OTDJdOonQ8z3vq51149vWrBWBpN9ZXu3cGrOdlsNZozAcY3fat2OJZa14uKesdcLSSQYGoFDbq21bdC2Zlhfy8xAfdZf40JbKq1Gl3FLLxmQ6qddOnR1ZcpDOoTsZFVkMxi2XYQ0Yvw4PDvpqHou8konEQiA5t2g/WW8y6/1n5fOdutFpzrlq6nRpOVdg/w9HGCGe3GHlAHulhqt388i4s3w0doHsHPSjvulV1Ou/FCkv+1/jl90eLUZE+v05vS1gbMmuINGknPKeAxQqrcooulzVsZoZl3RcfxWq8BoUNbU/GxtwxKxgHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SWfi2XwUzMxcdMx8YjC7yktUNBm5Dqd/e1Pu5TIH6w=;
 b=Y43RhFJ2UXgJUkOiqAc19MckTLKKQKMMFm1f3Qp12OVj4AO8OJJWriPxn4Bhrk7bfrhVXYS4h2LMwAy761DODywtrkthrxcCiwVBVyw9Qk2FOvlwodSVRO8EeNhj2r69pIH6a6zKod+sT0taFNoR4lev0bDbQAEFO3YOXL2nTw8=
Received: from SETPR03MB10564.apcprd03.prod.outlook.com (2603:1096:101:316::7)
 by KUYPR03MB10261.apcprd03.prod.outlook.com (2603:1096:d10:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 17:12:31 +0000
Received: from SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791]) by SETPR03MB10564.apcprd03.prod.outlook.com
 ([fe80::9b45:ef7d:a5fa:c791%6]) with mapi id 15.21.0292.024; Fri, 14 Aug 2026
 17:12:31 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "fshao@chromium.org" <fshao@chromium.org>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "karthik.b.s@intel.com"
 <karthik.b.s@intel.com>, "swati2.sharma@intel.com" <swati2.sharma@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "gildekel@google.com" <gildekel@google.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 =?utf-8?B?TGFuY2Vsb3QgV3UgKOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame
 sequence check
Thread-Index: AQHdKax+FL+tk0d7V02B9zK2G+VE6rabVsIAgAB9tYCAAQZ1gIAAiRoAgABozgA=
Date: Fri, 14 Aug 2026 17:12:31 +0000
Message-ID: <fc8cbc455d511ca48e443916d912b42c9871f1e6.camel@mediatek.com>
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
 <7244584b-4bed-4756-bdae-e06b0054d2b7@intel.com>
 <eeba8678-224a-4c9a-8e96-a0507faea016@gmail.com>
 <6ee0490b924a3e4ac37298069092fd955b8be58f.camel@mediatek.com>
 <015adb96-fafd-4736-8d82-63a9f4aff579@gmail.com>
In-Reply-To: <015adb96-fafd-4736-8d82-63a9f4aff579@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SETPR03MB10564:EE_|KUYPR03MB10261:EE_
x-ms-office365-filtering-correlation-id: d90c9b02-8a4b-42d9-6d76-08defa2739c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|23010399003|1800799024|11063799006|4143699003|38070700021|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 6Sh0Ql0R+C3C65jMf4o3QqEkg1DAc5ZbQnre9csADAEFs40fbLQG5+LWneixST2D/AQ7pw79HYY9nBX5glH0x30Horz1ivH0O2uxJU2dNc+kgXvlviU+yWsEH+Qc43/PQ8kWHRBX3cUNo3Pk7HAIupCMVOeDqml+8rx973QCDKQ8drj+Ht0KFRxbYlzM+TvguTsvIsMpMxzUwQckv2vMwWk4BVLff3ACN7u8/ltt2FCvYNWfMt250Y8W8yXwgTVjv1A6R94DV9GXML6ogUo+bpVyk1PlfcrlNFArtJzUHY6cVWPGcuXL66UhkO4YSNcTpKFmH4PaDLR/3Wdsj+t4RryFuQ+UsXHTCElzVhXouHRhAa28KPBxcexG4GlwQAbovrUsMcEC/+bx+l2H/2FJkPDxARJV+ytnPMAL2PpDGN/kbSNAHNPuawewSvmoorqge4zOz150Ss/QwXq/IYWjwPWCcyKGXA1Z+ModUU99I19FXHmuSTNE5WWLP8pj+YHR/Drr6dk78hnffydgA3vTxxhxpziFXArGSt2op/UVhMK9x9MapVcRU6SfgLyhAQgsm6goKB0EZHAZ/EjjuUfuMjkAsmv94wjgkf3Gb3ICQ2ecLManT3OYaJoCilh7cFO7t49gm/Ix3tfXIO7bw6SaZq7ALB+NVIos7HR4e8emN2FwTbDodjtOjPzbShYeCMm/9fcX1atoueXcp8C0iwfpKbj5O2knqDmRRqREhPudi5g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SETPR03MB10564.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnhBTGxVRDZQUkdyTHpyY1liaW0xNlpndzA4dEgrYlRKNWtDZVp6ZFhua3J6?=
 =?utf-8?B?VTJkQkIxOGZmdDB2SHRseE15aTk5N09keUZ0dW51UExzNWNoVXFrNU5nTWE3?=
 =?utf-8?B?bjAySmx4Wnp6ZGgxU2NOcklJa3NCWnZjaVJTZlBodFVaZzkzTUZXbVB5SlQv?=
 =?utf-8?B?QzFEbkdMbEErd0IvcGdTNk1SUnJhWGVxd2xhR1JIa2pyZ0NNRW93OWorRkVa?=
 =?utf-8?B?Tm42T09QS2hQcnRSZFEweUpaY2g2RDI5U2hJL1AzeUhZMlpFNnVDbm5oWWF0?=
 =?utf-8?B?V2FUR3NzT29jdSthVHpLRnRuNzlVUWZkSXJ3aVdVUXM4czBRQjFsSlFZNnMr?=
 =?utf-8?B?dmtsUldUcUtZRGpaeVFMU3dKbXBHYmRMRjhPMXd5Qi9taUxXY3pSVUFicWMr?=
 =?utf-8?B?OXREbnBZaHNCK3paeHVnMGNyMklkeVNDUGN0cmNmSVJ4OHVaRXFuZUtwL0Q3?=
 =?utf-8?B?MkI1S1praVhrNXlEeVFDTFlDeWpORWdMdW1rUStaNno4ZFdzQXNORllicElu?=
 =?utf-8?B?dE05VEwxTmZRWGpRRHhFRHZ3WVM2M1NWaFF0UE4wZWVPQ1BWeUtsSW9Cc3k2?=
 =?utf-8?B?Rklnb3daOXlVdEFLdy94ZlBNTHhmMDFMY2plVDQ3Z08xUmRKdnl6ZkN3eUZl?=
 =?utf-8?B?N1ZtY2ZtY1ByTGwzL00rSDRxYnoreFZpUGdwajdYSUVjR0xBcE9oaWRsbFk3?=
 =?utf-8?B?T0NjL3oyVnAySVRwb0ljTzRGNWpHTE5nN0I4S3p3ZFNPbzc1dDNVZjBlNWRN?=
 =?utf-8?B?L01OQXhLWHBGQTRTbmF1Y1N0U3l4QTdEZ2txSGlZT0MrYkIvNzJrcEVzM0Fy?=
 =?utf-8?B?QVZuUWRGbVhwMWV1V2FjZldEVEEvTjFQcjBuUTN5djZPTEt2eUxmSm00aGc0?=
 =?utf-8?B?ZitaeDdYRFJhd040OWVrNURDNURpZC9FZ0ZqckRMNXdnSTQ0Sk5PemtReXMz?=
 =?utf-8?B?dVlkcWxJbjUxL0UwN2FWcllJeTJDY3hHTUxaTVZsS2ZUaVYrWFFCWm1PK3pZ?=
 =?utf-8?B?U1d0bCtVbkcrTEhWZFZzcEYxKysyc1JoVVI2RjNnNHlMZi9lc010a2JSOGJu?=
 =?utf-8?B?QjcvV1NINnowMTdHRHp0UFA5QXdnRWMzN0o3RERFRnhhZ2J5K3hPa0F5cWlt?=
 =?utf-8?B?bFM0MmYyd2FNeXU5cDBENm0rU1JVTmFDRjBCc1F0Z1pxdW9jZ0c1dVJpNStF?=
 =?utf-8?B?bmZhY1ZzNUJrU3hhbU5FNXFDWHkzQ0dicW5tYjl2UjFWcXVTVEo3dXIwY1N1?=
 =?utf-8?B?d3dmczRJVURKT2xiT05RYmlZdDFXaW55Vzd3Z0o5ZTdKenF4aGtYNDhlYVVJ?=
 =?utf-8?B?ZmdPSWJxVFdOZTFzWVVRenBreDhjV2lweXhHTVQvRTlqY3NKbGYrMDNyRDhD?=
 =?utf-8?B?NmdibWxydk5sUmEweTRIMDl3blpGOEsyTXRscXlBTE1KU09IWHdIRnZLNGdn?=
 =?utf-8?B?M2Z4UHFWbi84UHVEb3A2RHVQQWNvYjNIanBtdHJHTklwOFhnTGs3djcrVWtk?=
 =?utf-8?B?SW1CWHNyNk1HUlRmM0x4Qlp2cUdCZjF5WG90QzF0Z1hrR2JnaytNZjlCVGUv?=
 =?utf-8?B?YjV1enR3V1hsOEt2WHY0amc2dG95S3hxaWZaN081WVVXUThicTR0MkVHN1RD?=
 =?utf-8?B?SVQyNHNNS2FYNjZSb054SEROY25DWndCUklzUnpGcTNaRWNkbVlzOTFtWjVa?=
 =?utf-8?B?K2NjZ2lZZllFTXRKUkpZOWpMeXd2cU15eGRXQWI2cEdGcjJhYVhDVW5lSGRD?=
 =?utf-8?B?ZXE4Z3lUeHlFemxpNG83MWlaUzFFZE1ScGovQTJZVWUveXhYdmJmL2JuN09N?=
 =?utf-8?B?aVdOekZ1ZUVHUnZFMUtxazhtQ0FRQmlkVXV1eCtxM1N4N0R1b2g0dUJVUm9z?=
 =?utf-8?B?MlVqZks1d0Z0Q3oyMVF1VDNEdmx0VDZDa0NhM3pZcHY1YmNWL2duWjQreExp?=
 =?utf-8?B?S0p6M3pNV1E0ZHErZnhGNGNpajRkTGJhcUlTTGI0cHp2R1NmOThIdnJEa21t?=
 =?utf-8?B?dUZxajRpNmhBa3VzZFpkMGJqMEZZSUM5Z3hZeTZPK0V2bGRpbWhYRFdSTjZQ?=
 =?utf-8?B?WHlDWFd0MVlTMTMyMjY2Mlc0WndOakJ2MzFhQm5xcEV2UFNRMEZrbENZNWFa?=
 =?utf-8?B?VlFGc1JBM1lCeDJ4US9Jd2lWMjdmWHVrc2FQLzJTQXBoNk5UMFdLS1RMeHgr?=
 =?utf-8?B?WnFzRUN5Q1RqcGVXWFhoeUZWcmQ4ak9xbjFzNEtzVTF4RnJQQlpxWVppQzRH?=
 =?utf-8?B?YXpNWGxTcklwbStaNUNremxPS2hKREd2Nk0xbkF0VTBUcXNHeitDZW8rY1kx?=
 =?utf-8?B?VGJoeWNIWk52bnh4MVdmOTR5QUxGSVh6Z0d3SzBEeXQ1UmJIV3dBelRTMFlp?=
 =?utf-8?Q?LVSs0s3bSver78Ik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F749E3BA8273B4C8EF601A2885216E3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Snoj2AsR5lUDX48NcO4MhsLYgtPpSKQMHooK09/11HKYXmKrmbhUHqVwzpu4vgfAFcxhM5ede54lyjSSXTpK6eXS+EaGb4BWB2QEXQBupBVt9imZqhuoyNPrKm+JhTg63qJlSDgS/I3K97PtnF9gMdZ0KZ097zec2H28f6CeJu3yY6r1ndC0xSoehaoePrbho72eRVa1WInhxCE8azcgtFlkJ0IUKo8IpKnKckAKgtTkmbdGbpn8BLw8vTSTNQI3zpVONKG7cgkxKWn3INCffnmF2QRUFyNVwoc5oALYjKJJLFQwIFpzkkJDgwfDsHNVV1XdwIPclm4i1ND3Z8RS4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SETPR03MB10564.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90c9b02-8a4b-42d9-6d76-08defa2739c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 17:12:31.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JstFeQnnGY+9MI0QA549CDljIsaiNaoVE/cMASYAxDz0Hqkik23ba/Kav/M0+I8w9TzyT2tDGwXfU6lhqaVB1spq5COCizEgmHooxcKMHxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB10261
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

T24gRnJpLCAyMDI2LTA4LTE0IGF0IDEzOjU3ICswMzAwLCBKdWhhLVBla2thIEhlaWtraWzDpCB3
cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIg
b3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSGkgSmFzb24tSkgsDQo+IA0KPiBPbiAxNC8wOC8y
MDI2IDA1LjQ2LCBKYXNvbi1KSCBMaW4gKOael+edv+elpSkgd3JvdGU6DQo+ID4gT24gVGh1LCAy
MDI2LTA4LTEzIGF0IDE0OjA3ICswMzAwLCBKdWhhLVBla2thIEhlaWtraWzDpCB3cm90ZToNCj4g
PiA+IA0KPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IEhpLA0KPiA+
ID4gDQo+ID4gPiBPbiAxMy8wOC8yMDI2IDA2LjM3LCBLYXJ0aGlrIEIgUyB3cm90ZToNCj4gPiA+
ID4gSGkgSmFzb24tSkgsDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiA4LzExLzIwMjYgOTo0NCBQTSwg
SmFzb24tSkggTGluIHdyb3RlOg0KPiA+ID4gPiA+IFRoZSBjYXB0dXJlX2NyYygpIGZ1bmN0aW9u
IHZhbGlkYXRlZCB0aGF0IHRoZSBDUkMgZnJhbWUNCj4gPiA+ID4gPiBzZXF1ZW5jZQ0KPiA+ID4g
PiA+IHJldHVybmVkIGJ5IGlndF9waXBlX2NyY19nZXRfZm9yX2ZyYW1lKCkgbWF0Y2hlcyB0aGUg
ZXhwZWN0ZWQNCj4gPiA+ID4gPiB2YWx1ZS4NCj4gPiA+ID4gPiBIb3dldmVyLCBpZ3RfcGlwZV9j
cmNfZ2V0X2Zvcl9mcmFtZSgpIGFscmVhZHkgZ3VhcmFudGVlcw0KPiA+ID4gPiA+IGNyYy0+ZnJh
bWUgPj0gZXhwZWN0ZWQgdmlhIGl0cyBpbnRlcm5hbCBsb29wOg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IMKgwqDCoMKgIGRvIHsNCj4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIHJlYWRfb25lX2Ny
YyhwaXBlX2NyYywgY3JjKTsNCj4gPiA+ID4gPiDCoMKgwqDCoCB9IHdoaWxlIChpZ3RfdmJsYW5r
X2JlZm9yZShjcmMtPmZyYW1lLCB2YmxhbmspKTsNCj4gPiA+ID4gVGhpcyBpc24ndCBmdWxseSB0
cnVlIElNSE8uIFRoZSBjYXB0dXJlIENSQyBmdW5jdGlvbiBhY3R1YWxseQ0KPiA+ID4gPiBlbnN1
cmVkDQo+ID4gPiA+IHRoZSBleGFjdCBtYXRjaCBvZiBmcmFtZSBzZXF1ZW5jZSBhbmQgd2l0aCB0
aGlzIHBhdGNoIHdlJ3JlDQo+ID4gPiA+IGp1c3QNCj4gPiA+ID4gZ3VhcmFudGVlaW5nICc+PScu
DQo+ID4gPiANCj4gPiA+IGFzIEthcnRoaWsgc2FpZDsgdGhlIGNsYWltIGl0IG5vdCB0cnVlLiBX
aGF0IHRoaXMgY2hhbmdlIHdvdWxkIGRvDQo+ID4gPiBpcw0KPiA+ID4gcmVsYXggdGhlIHNlcXVl
bmNlIGNoZWNrIHRvIGJlIG9wZW4gZW5kZWQgLi4gd2hpbGUgY3VycmVudCBjaGVjaw0KPiA+ID4g
aXMNCj4gPiA+IG1ha2luZyBleGFjdCBleHBlY3RhdGlvbi4gSW4gb3RoZXIgd29yZHMsIHdlIF9l
eHBlY3RfIHRvIHNlZQ0KPiA+ID4gY2VydGFpbg0KPiA+ID4gY3JjDQo+ID4gPiB3aXRoIGNvcnJl
Y3QgdmJsYW5rIG51bWJlciwgd2l0aCB0aGUgcHJvcG9zZWQgY2hhbmdlIGlmIGV4cGVjdGVkDQo+
ID4gPiBjcmMNCj4gPiA+IG5ldmVyIGFycml2ZWQgaW4gY29ycmVjdCBzZXF1ZW5jZSB3ZSB3b3Vs
ZCBiZSB1bmF3YXJlIG9mIGl0Lg0KPiA+ID4gDQo+ID4gPiBMZXQncyBub3QgZG8gdGhpcy4NCj4g
PiANCj4gPiBIaSBKUCwNCj4gPiANCj4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIExldCBtZSBl
eHBsYWluIHRoZSBiYWNrZ3JvdW5kIG9mIHRoaXMgaXNzdWUuDQo+ID4gDQo+ID4gTWVkaWFUZWsg
Q1JDIEludGVybmFsIFF1ZXVlIE1lY2hhbmlzbToNCj4gPiBNZWRpYVRlaydzIERSTSBkcml2ZXIg
dXNlcyBhIHBlci1jb21taXQgQ1JDIHF1ZXVlIHJhdGhlciB0aGFuDQo+ID4gY29udGludW91cyBm
cmFtZS1ieS1mcmFtZSByZXBvcnRpbmcuIENSQyBlbnRyaWVzIGFyZSByZXBvcnRlZCBvbmx5DQo+
ID4gYWZ0ZXIgdGhlIGhhcmR3YXJlIHBpcGVsaW5lIGhhcyBzdGFiaWxpemVkICgzIHZibGFua3Mg
YWZ0ZXINCj4gPiBjb21taXQpLA0KPiA+IGFuZCB0aGUgZnJhbWUgbnVtYmVyIHJlZmxlY3RzIHRo
ZSB2YmxhbmsgY291bnQgYXQgdGhlIHRpbWUgb2YgQ1JDDQo+ID4gcmVhZG91dCwgbm90IHRoZSBv
cmlnaW5hbCBjb21taXQgbGF0Y2ggdGltZS4NCj4gPiANCj4gPiBGb3IgZXhhbXBsZSwgY29uc2lk
ZXIgNCBjb25zZWN1dGl2ZSBmbGlwczoNCj4gPiANCj4gPiBUaW1lbGluZToNCj4gPiDCoMKgIEZy
YW1lIDEwMDogRmxpcCAwIGxhdGNoZXMg4oaSIGV2LnNlcXVlbmNlPTEwMA0KPiA+IMKgwqAgRnJh
bWUgMTAxOiBGbGlwIDEgbGF0Y2hlcyDihpIgZXYuc2VxdWVuY2U9MTAxDQo+ID4gwqDCoCBGcmFt
ZSAxMDI6IEZsaXAgMiBsYXRjaGVzIOKGkiBldi5zZXF1ZW5jZT0xMDINCj4gPiDCoMKgIEZyYW1l
IDEwMzogRmxpcCAzIGxhdGNoZXMg4oaSIGV2LnNlcXVlbmNlPTEwMyAobGFzdCBmbGlwKQ0KPiA+
IA0KPiA+IFF1ZXVlIHJlcG9ydHMgQ1JDcyB3aXRoIDMtdmJsYW5rIGRlbGF5Og0KPiA+IMKgwqAg
RnJhbWUgMTAzOiBSZXBvcnRzIGZsaXAgMCBDUkMg4oaSIGZyYW1lPTEwMw0KPiA+IMKgwqAgRnJh
bWUgMTA0OiBSZXBvcnRzIGZsaXAgMSBDUkMg4oaSIGZyYW1lPTEwNA0KPiA+IMKgwqAgRnJhbWUg
MTA1OiBSZXBvcnRzIGZsaXAgMiBDUkMg4oaSIGZyYW1lPTEwNQ0KPiA+IMKgwqAgRnJhbWUgMTA2
OiBSZXBvcnRzIGZsaXAgMyBDUkMg4oaSIGZyYW1lPTEwNg0KPiA+IA0KPiA+IFBsYW5lVGVzdCBl
eHBlY3RlZCB2YmxhbmtzOg0KPiA+IMKgwqAgdmJsYW5rWzBdID0gMTAxwqAgKGZsaXAgMSdzIGV2
LnNlcXVlbmNlLCBmb3IgZmxpcCAwJ3MgQ1JDKQ0KPiA+IMKgwqAgdmJsYW5rWzFdID0gMTAywqAg
KGZsaXAgMidzIGV2LnNlcXVlbmNlLCBmb3IgZmxpcCAxJ3MgQ1JDKQ0KPiA+IMKgwqAgdmJsYW5r
WzJdID0gMTAzwqAgKGZsaXAgMydzIGV2LnNlcXVlbmNlLCBmb3IgZmxpcCAyJ3MgQ1JDKQ0KPiA+
IMKgwqAgdmJsYW5rWzNdID0gMTAzICsgMSA9IDEwNMKgIChsYXN0IGZyYW1lKQ0KPiA+IA0KPiA+
IGNhcHR1cmVfY3JjIGNoZWNrcyAoPT0gZXhhY3QgbWF0Y2gpOg0KPiA+IMKgwqAgZmxpcCAwOiBl
eHBlY3RlZD0xMDEsIGdvdD0xMDMg4oaSIDEwMyAhPSAxMDEg4oaSIEZBSUwNCj4gPiDCoMKgIGZs
aXAgMTogZXhwZWN0ZWQ9MTAyLCBnb3Q9MTA0IOKGkiAxMDQgIT0gMTAyIOKGkiBGQUlMDQo+ID4g
wqDCoCBmbGlwIDI6IGV4cGVjdGVkPTEwMywgZ290PTEwNSDihpIgMTA1ICE9IDEwMyDihpIgRkFJ
TA0KPiA+IMKgwqAgZmxpcCAzOiBleHBlY3RlZD0xMDQsIGdvdD0xMDYg4oaSIDEwNiAhPSAxMDQg
4oaSIEZBSUwNCj4gPiANCj4gPiBMaWJyYXJ5IGJlaGF2aW9yOg0KPiA+IMKgwqAgaWd0X3BpcGVf
Y3JjX2dldF9mb3JfZnJhbWUoZXhwZWN0ZWQ9MTA0KSDihpIgcmV0dXJucyBDUkMgd2l0aA0KPiA+
IGZyYW1lPTEwNg0KPiA+IMKgwqAgU2luY2UgMTA2ID49IDEwNCwgdGhlIGxpYnJhcnkgY29uc2lk
ZXJzIHRoaXMgdmFsaWQgYW5kIHJldHVybnMNCj4gPiBpdC4NCj4gPiANCj4gPiBUaGUgQ1JDIHZh
bHVlIGlzIGNvcnJlY3QgKGl0IGNvcnJlc3BvbmRzIHRvIHRoZSByaWdodCBmcmFtZWJ1ZmZlcg0K
PiA+IGNvbnRlbnQpLCBidXQgdGhlIGZyYW1lIG51bWJlciBpcyBsYXJnZXIgdGhhbiBleHBlY3Rl
ZCBkdWUgdG8gdGhlDQo+ID4gcXVldWUgcHJvY2Vzc2luZyBkZWxheS4gVGhpcyBpcyBhbiBpbmhl
cmVudCBjaGFyYWN0ZXJpc3RpYyBvZg0KPiA+IGhhcmR3YXJlDQo+ID4gdGhhdCBiYXRjaGVzIENS
QyByZXBvcnRpbmcsIGFuZCBkb2VzIG5vdCBpbmRpY2F0ZSBkYXRhIGNvcnJ1cHRpb24NCj4gPiBv
cg0KPiA+IGJ1ZmZlciBvdmVyZmxvdy4NCj4gPiANCj4gDQo+IHRoYXQncyBhbGwgTWVkaWFUZWsg
c3BlY2lmaWMgYmVoYXZpb3IuIEl0IGRvZXNuJ3QgY2hhbmdlIHRoZSBmYWN0DQo+IHRoYXQNCj4g
dGhpcyBjaGVjayB5b3UgYXJlIHRyeWluZyB0byByZW1vdmUgaXMgd2hhdCBjYXRjaGVzIHdyb25n
LWZyYW1lIGNyY3MNCj4gZm9yDQo+IGV2ZXJ5IG90aGVyIGRyaXZlciB0b28uDQo+IA0KDQpJIHVu
ZGVyc3RhbmQgeW91ciBwb2ludCB0aGF0IHRoZSBzdHJpY3QgPT0gY2hlY2sgaXMgY3J1Y2lhbCBm
b3Igb3RoZXINCmRyaXZlcnMgdG8gY29ycmVjdGx5IGRldGVjdCB3cm9uZy1mcmFtZSBDUkNzLCBh
bmQgcmVtb3ZpbmcgaXQgZW50aXJlbHkNCndvdWxkIGJyZWFrIHRoYXQgY29ycmVjdG5lc3MgdmVy
aWZpY2F0aW9uIGZvciB0aGVtLg0KDQo+ID4gDQo+ID4gQ29uc2lzdGVuY3kgd2l0aCBvdGhlciBJ
R1QgdGVzdHMgYW5kIGxpYnJhcnkgY29udHJhY3QNCj4gPiANCj4gPiBMb29raW5nIGF0IGhvdyBv
dGhlciB0ZXN0cyBoYW5kbGUgaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoKToNCj4gPiAxLiBr
bXNfcm90YXRpb25fY3JjIGFsc28gY2FsbHMgaWd0X3BpcGVfY3JjX2dldF9mb3JfZnJhbWUoKSBi
dXQNCj4gPiBkb2VzDQo+ID4gTk9UIHZhbGlkYXRlIHRoYXQgY3JjLmZyYW1lID09IGV4cGVjdGVk
LiBJdCBvbmx5IGNvbXBhcmVzIENSQw0KPiA+IHZhbHVlcw0KPiA+IGJldHdlZW4gc29mdHdhcmUg
YW5kIGhhcmR3YXJlIHJvdGF0ZWQgZnJhbWVzDQo+ID4gKGlndF9hc3NlcnRfY3JjX2VxdWFsKS4N
Cj4gPiAyLiBrbXNfcGlwZV9jcmNfYmFzaWMgKHJlYWQtY3JjLWZyYW1lLXNlcXVlbmNlIHN1YnRl
c3QpIHZhbGlkYXRlcw0KPiA+IHRoYXQNCj4gPiBjb25zZWN1dGl2ZSBDUkNzIGhhdmUgZnJhbWUg
KyAxID09IG5leHRfZnJhbWUgKHJlbGF0aXZlIGluY3JlbWVudCksDQo+ID4gYnV0IGRvZXMgTk9U
IHZhbGlkYXRlIGFic29sdXRlIG1hdGNoIGFnYWluc3QgYW4gZXhwZWN0ZWQgdmJsYW5rDQo+ID4g
Y291bnQuDQo+ID4gMy4gVGhlIGxpYnJhcnkgQVBJIGlndF9waXBlX2NyY19nZXRfZm9yX2ZyYW1l
KCkgaXMgZXhwbGljaXRseQ0KPiA+IGRlc2lnbmVkDQo+ID4gd2l0aCA+PSBzZW1hbnRpY3M6DQo+
ID4gZG8gew0KPiA+IMKgwqDCoMKgIHJlYWRfb25lX2NyYyhwaXBlX2NyYywgY3JjKTsNCj4gPiB9
IHdoaWxlIChpZ3RfdmJsYW5rX2JlZm9yZShjcmMtPmZyYW1lLCB2YmxhbmspKTsNCj4gPiBJdHMg
Y29udHJhY3QgaXMgInJldHVybiB0aGUgZmlyc3QgQ1JDIGF0IG9yIGFmdGVyIHRoZSByZXF1ZXN0
ZWQNCj4gPiBmcmFtZS4iDQo+ID4gTm8gb3RoZXIgY2FsbGVyIGluIElHVCBhZGRzIGEgc3RyaWN0
ZXIgPT0gY2hlY2sgb24gdG9wIG9mIHRoaXMuDQo+ID4gDQo+ID4gVGhlIGNhcHR1cmVfY3JjKCkg
ZXhhY3QtbWF0Y2ggY2hlY2sgaW4ga21zX3BsYW5lIGlzIHRoZSBvbmx5IHBsYWNlDQo+ID4gaW4N
Cj4gPiB0aGUgZW50aXJlIElHVCBjb2RlYmFzZSB0aGF0IGltcG9zZXMgYSBzdHJpY3RlciByZXF1
aXJlbWVudCB0aGFuDQo+ID4gdGhlDQo+ID4gbGlicmFyeSdzIG93biBBUEkgY29udHJhY3QuIFRo
aXMgbWFrZXMgaXQgaW5jb21wYXRpYmxlIHdpdGggZHJpdmVycw0KPiA+IHRoYXQgdXNlIHF1ZXVl
ZCBDUkMgcmVwb3J0aW5nLCB3aGlsZSB0aGUgYWN0dWFsIENSQyB2YWxpZGF0aW9uDQo+ID4gKGNv
bXBhcmluZyBwaXhlbCBjb250ZW50KSByZW1haW5zIGNvcnJlY3QuDQo+ID4gDQo+ID4gR2l2ZW4g
dGhhdCB0aGUgbGlicmFyeSdzIEFQSSBjb250cmFjdCBpcyA+PSwgYW5kIG5vIG90aGVyIGNhbGxl
cg0KPiA+IGVuZm9yY2VzID09LCB3aGF0IHdvdWxkIGJlIHRoZSBwcmVmZXJyZWQgYXBwcm9hY2gg
aGVyZT8NCj4gDQo+IFRoZSAibm8gb3RoZXIgdGVzdCBkb2VzID09IiBhcmd1bWVudCBkb2Vzbid0
IGFwcGx5IGhlcmUgZWl0aGVyLiBPdGhlcg0KPiB0ZXN0cyBkb24ndCByZWNvbnN0cnVjdCBwZXIt
ZnJhbWUgY3JjL3ZibGFuayBtYXBwaW5nIHRoZSB3YXkgdGhpcw0KPiB0ZXN0DQo+IGRvZXMsIHNv
IHRoZXkgZG9uJ3QgbmVlZCBpdC4gVGhpcyBvbmUgZG9lcy4NCj4gDQo+IERpc2FibGUgdGhlIGNo
ZWNrIGZvciBNZWRpYVRlayBzcGVjaWZpY2FsbHkgaWYgeW91IGRvbid0IHdhbnQgdG8gY2FyZQ0K
PiBhYm91dCB0aGlzIGNoZWNrIChlLmcuIGlzX210a19kZXZpY2UoKSBsaWtlIG90aGVyIG10ayB3
b3JrYXJvdW5kcw0KPiBhbHJlYWR5IGluIHRoaXMgZmlsZSksIGRvbid0IHJlbW92ZSBhIGNvcnJl
Y3RuZXNzIGNoZWNrIHRoYXQgb3RoZXINCj4gZHJpdmVycyByZWx5IG9uLg0KPiANCj4gL0p1aGEt
UGVra2ENCg0KSSBhZ3JlZSB3aXRoIHlvdXIgc3VnZ2VzdGlvbiB0byBtYWtlIHRoaXMgYSBNZWRp
YVRlay1zcGVjaWZpYw0Kc2tpcC4gV2Ugd2lsbCB1cGRhdGUgdGhlIHBhdGNoIHRvIHVzZSBpc19t
dGtfZGV2aWNlKCkNCmFuZCBvbmx5IHNraXAgdGhlIGNoZWNrIGZvciBNZWRpYVRlayBkZXZpY2Vz
LiBUaGlzIHByZXNlcnZlcyB0aGUNCnN0cmljdCA9PSBjb3JyZWN0bmVzcyBjaGVjayBmb3Igb3Ro
ZXIgZHJpdmVycyB3aGlsZSBhbGxvd2luZyBvdXINCnF1ZXVlZCBDUkMgcmVwb3J0aW5nIG1lY2hh
bmlzbSB0byBwYXNzIG9uIE1USyBoYXJkd2FyZS4NCg0KVGhhbmtzLA0KSmFzb24tSkggTGluDQo=
