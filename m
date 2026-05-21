Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204FACD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 03:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E4710F1BA;
	Thu, 21 May 2026 03:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="p4LkSRwU";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ink7mPu0";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C7110F1BA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 03:01:36 +0000 (UTC)
X-UUID: 5cdc032454c111f1a3561939bc42ff46-20260521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=/9WvEFzVkwc+6vS4AQpzwgbb7zLBH4XK5dflpWYaAz8=; 
 b=p4LkSRwU4UWUMtCEeG5uLetQIPGLHv1u5geG3/5ZpiCkf2dt5fbQEGj5tY/ggifwBim68pvl/b4MccZmBzLDwoPEv4GHMoiX/ZaU4gyPyEYuEOdsqMKYVolQOMe0EPUQfTWqU8LtSB350GDnwR8FYGdwUO4h02e8ermKUUv5mrU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:65d260d7-5d6a-4e5b-917e-60c5eaa5c1c8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:19e92b22-bef7-463f-902c-5f40f7404c33,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
 l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5cdc032454c111f1a3561939bc42ff46-20260521
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 592370753; Thu, 21 May 2026 11:01:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 21 May 2026 11:01:27 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 21 May 2026 11:01:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4JBKD1owmzCPh04QLnUsUsSlZPKzy0JZOev91Yter1NuQG5F3XxPPgYrWwAfYRXl5dBUMCCWzKhFIqTgRc15OnkCfY/HbgAOdMdfHn5lGyx8hQGFlQH7x0Dj+Alhb5zxpiZW6jJfgp0WKlTdoHdlA3pMj/S5o6QZG9qVbah1S8SR0NNLOjt9YzsYi+FDldmemFZ9lbcgBXQX8u2dF9JjZGWylDipmnQqm/i/SEihZdneWscz5J0Iayza50/aLwXPqatV9V70Ld8zi/FcVw+P/xsQtpzY50rzAQNAu9BP6gkIKoM7vuH3LGHtZyUdMfnUZ/V3XkHkiLTYy22gbcKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9WvEFzVkwc+6vS4AQpzwgbb7zLBH4XK5dflpWYaAz8=;
 b=hT6B37zP65dKFYerUeK/BeYCb9pHW2rpwDEqMEEuvqQnX8Vf4L9NDH6UTpbkchmipgnJnciqxxdlA7VI95AbuDwhnK2W7R/jFrCcPHguMbpmSRBvxMdVBZ9ZknOdGHv2x4W17CLB56f7QZV9WcsYFPeq35xFUURnp9sV/eFGgn2B1ngA73eUBAdEHkRjFbrzMS9pw5hdrbzBungDymrh1LZb0+WKFE+P/qAoiSYDPjYfU/MiPux6mTew/mNta8REzxQUHgSymtNqMij32odyKRvyD7OXFUutMJBVoF3/GGpB2F4Zxz3CpRPolxqUnBC4VijUCeSOo5u9l+JxX7jczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9WvEFzVkwc+6vS4AQpzwgbb7zLBH4XK5dflpWYaAz8=;
 b=ink7mPu0lrSyQd9+38Q6HVPLE1TCcH0wQO3dsGuGo2od+WSJj4BLwPdqMvLBEWvbueSnhaQTM1aWsXX5+GJ77JfW9/c3RYAqwKERoQ2HYX3DPKd+fCeCTuGtkZiE3JoAh/2wmpXPq7YY+zqnx43u5fVRs6ZabYFsId8K7+tnpjo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KUXPR03MB9906.apcprd03.prod.outlook.com (2603:1096:d10:9d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.6; Thu, 21 May 2026
 03:01:25 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0071.005; Thu, 21 May 2026
 03:01:25 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "karthik.b.s@intel.com" <karthik.b.s@intel.com>, "swati2.sharma@intel.com"
 <swati2.sharma@intel.com>, "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "fshao@chromium.org"
 <fshao@chromium.org>, "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Thread-Index: AQHc6CSPGBSfXb3UvEKHnz7wd/zZw7YW7uCAgADdDgA=
Date: Thu, 21 May 2026 03:01:25 +0000
Message-ID: <53284b68be0216eab50946da686968691fa59a56.camel@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
 <ag28FVTooBC6Yly3@intel.com>
In-Reply-To: <ag28FVTooBC6Yly3@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KUXPR03MB9906:EE_
x-ms-office365-filtering-correlation-id: 3a8d28ea-2eb4-4d68-5e63-08deb6e53eee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003|38070700021|6133799003|4143699003|11063799006;
x-microsoft-antispam-message-info: /B554/BiAvZmGHqdwxz7Yuw2tiX3Rjn4YjzB73h28y50XDVP6MjUi4MzoIMCbEMiHhcsAVQmli6QFld3rNFBeyDJthVGrNthAX7lPPeDDeGdwcbPpRFvY8PDmFNGT3KcfVK+KNTZVoNMh1tvXRdjjhDb9omnQo5PZWGqRyf71nT3O3Kfwcu+7FdUvDpGx0aDWwPU6Y2aNaG25e+EsS61Njh/6m1CiOWaDivIaRjtb4Y5TF6at5Vg4b7JzHAm9IYLpUubwns0Gvo8h3WhHEV9ZvkODYyjKRvD08v+VHyepuuwBJCJ1gC0YA7spzVj1cE/ZpWSZKFteDuAocPlcMJvBvitxzeQU33D4F9jsdxK6Jt5oQsXFTLmMBkh9BNr6hqRU6zyTjC+ymQnUI1El2cbpqYEcLJ6klC+NMXPj5+O+YQzMoERxpwWCWMgPW2WeTvDMiS4fAQAIbxAAKzJuydzIMGjv9eBVEjo/ye8fqQdblHNReFO3daDQ7AtZi1xX6AIQmAFrjOlnOlloEitg+ONECh21wRYNZtDqRB7b8dLwq/OW5lF20lW2SXZI586UPWdW04Sz3EQ8zh6x8mtoFMpGzkHZmxIeSabjhwAVxGKg3Lv7SIDYlMArMd/JYZ9Xm+wQxLoP+Aij00jOd3arejKDu9ICHC2HQ+kwsKsp2OKXtzERu0DNFB/fim+prhPB98v/yBJ7/OQsnDEdF+knEBM7wMcf2wpESaZUOkMeDp9XwsQeF036kw14npqSLWY4zga
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003)(38070700021)(6133799003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cE5SR0JsMnRjOU5zT2NOdVBZY0p6Yi9UVE5YNGhuKzRKY2h6c1FiTmhUbi9v?=
 =?utf-8?B?QnpmZWZiL2FxVWplY2s3ay8wTVpWaTNMa0hMNEVaY0VhYklrN3IyNXRYS3pp?=
 =?utf-8?B?Yk5oL1hLVzhOMGFVTzZmSGVlMGh1UVpGTDJ5TWVYSkxJZy96L25iaWwvd0Uw?=
 =?utf-8?B?dHQzMTJrNmlpa21jSTVIVXZIaENWMTdKbjBJSjVQcFJrU09aKytwUS93Yi9u?=
 =?utf-8?B?VzNacklnNmxOSGt2OWNsRnpjRG5TRXJDenRKQ1NSQUpOUUcvaXBpdThIK0Rw?=
 =?utf-8?B?bkYwNVlkVUhqaG5Eem80bGxTT21Fa3lFS1RxYkNxQWFKQnUxaWdYWkhpTHJZ?=
 =?utf-8?B?Q0prdlVJTGpZZzNxWU5WVVlMb1E5U2JYZ0l5SlNzeUhOcFhteGI1ZUZkNVpO?=
 =?utf-8?B?YWp0NEFaazFUQ0k2eFAvNnNiM2owTzZiNGlMNk1HU2RvNXBWbXd3bnBnNWsw?=
 =?utf-8?B?Q0ViRVRWTmdYemdwc2ZkRng2Wm0wVmoyYytVTjZoVloydjlYL1BXT3FVTDhO?=
 =?utf-8?B?bk5FQWE0QjArc1l2Wm9KUk9QdmJ3ak5WVDlvZU1IZDZIWE4xZC84THpxVDRQ?=
 =?utf-8?B?UUtXVWJPWElHMVZ2V3VqdytNQmhGNnNocFpucjcyeHNHRnMrcFdHdzZJMUhK?=
 =?utf-8?B?Umk1NitTKzZTZ3BhOGRQY0FwdDVmMW1QdVpCOEF0K0hEakhwRlBhcEIvcUk0?=
 =?utf-8?B?MkYycjJlcXFOUUtJZDNvRElzbEZiUmhFZXV3THZRek1iME1KMzJVOStCRG5M?=
 =?utf-8?B?MjVveExXMnl3YS96SGQ4bnRGbU5xUTh3MHVJaFQyWktQNlhyR3ZZZXJFVTZX?=
 =?utf-8?B?N09lRGVCdXJlSXR6MExiUVNJM2dwc3hWcEsvOVBYWGpNSkoyTndRYUI4eUVQ?=
 =?utf-8?B?NGRBeDRwWHNWNHhUMHBSMHY5WkMzZ0ViSkVucXdNWTVRMEJrcFc1THdFYUNB?=
 =?utf-8?B?TjZqOEc4VnNSTTJqOTlDdlV1UkJFQVBpUDUwSjQzNFJlS3RqVXNVeDBXWjN0?=
 =?utf-8?B?NGF6dmtYMkFOZDdRWTJlTFhSWWRtWHRocFhyOTV4cnFUMlJUOFZUVk4rWEVW?=
 =?utf-8?B?ZVNid1FYRnNxcUtKZWFOY1p3T3BOMm5kU1I0d0R5U1k3SXhNbmRXdGs4NmJS?=
 =?utf-8?B?K0czaUR4V2VnSjdQemIzUEpOemNLaUpkeXZ4WFlPRTJUUjEzbUk2RmpaUVhC?=
 =?utf-8?B?cG1yeEV6WW9kbHptZGZOWThFK0xMKzE4c0VnMTNIOUM5b3J3Y0I0UmxXZCt0?=
 =?utf-8?B?MlNjZ0wvY2JaNXJ0eTVNNlN5cDhSV2FVWGFFOUo4cmo1K0dEU1hWbFdsWUt1?=
 =?utf-8?B?b1lyTHVmYWgwVHozQjJvOGQ2ZGMxYjhJMG91RFdrTXdSNUxkdGhYbjF3L0k1?=
 =?utf-8?B?OTdkMTlhTnppU0ozTmtIdEtOSGxjdk80YjE5SHl0SEpSL25BNTMzMHJRd3Zh?=
 =?utf-8?B?Ykx6VDZ5c292Ym15bDQ0RGFMWG9rNDBtY2lDbi9PcUZuMXlwekQ2U1ZFUDhu?=
 =?utf-8?B?ZktmUjdjQnpmLzQrVGN4b3NUdVdKbit4eU4zb0pTUFVoOUJTWFNUZlRXNjMv?=
 =?utf-8?B?MWVMNlBQREE2b0ZNSExQclBFZklnNU11eWF0WG9XcHB5RmlZODRLU2svbmxV?=
 =?utf-8?B?cnN4N2MrVjN3eHJzakZlSWc2c1hTVzhISHowazJJSU9CMk13N2U2eTZVbzM2?=
 =?utf-8?B?OGZ2L0g5cnhKcnlWZjhaRGJmb21BTTJHYnpzY01ac2hyRHhzQkRrZnJoWjNh?=
 =?utf-8?B?bW9mNDNRMEhDVUw3MkIxMDJHOXRmZmZ6WE1yMWk0RDhObEwwSkdZYzB2Qzk2?=
 =?utf-8?B?SG9SUFA4VkdDUnI4c3p2Yk84aHFLUFlOczZWdHN0cC8wTlA0TDVMQVpoOE9D?=
 =?utf-8?B?SXdzMFYyV1REdExZYVFBZ2ZGaFZPaHBZMWFtenhMYTBlcVJQMFpTVTh5bGlF?=
 =?utf-8?B?WkRFbGlGVmJvdVJvZ2xpVG84Szd3Qm5KZ29rYStKNm1sR0tMZk9pSE9XYW5X?=
 =?utf-8?B?UGR4bnJqbkRpZm51OFc1WE9Rbkt2RjU4VlFsN3BhMElWN3ROQ0NZVFZBUm93?=
 =?utf-8?B?ekRXUStNUlcwRjl3clYyRzJwbkVFVjFSb3ExN3JpaTVFMU9CNEg4cjBsY0NP?=
 =?utf-8?B?Mm1MSGRjR3ZFVEZrSnFnbTRxdHhBWXVrT2VHVlVsYUdzY245eHltRW9HcHJs?=
 =?utf-8?B?bm1sN3dqUEJoYWZId3AzcWpKMnAyaThzcXNUNmlUZlNrSmxDK3cvaHp2cks2?=
 =?utf-8?B?QjYzWjY2U0hMZjJXWFExaVBhS0Rka3BDV1BsOE9ZWUVIT2JnbnUyWERSODVB?=
 =?utf-8?B?NkxsbERXY2JvWWJpd3VtY1Bja0JtRmxZMFRSSlYwVjFyclBlQlZ1QXRHKzZs?=
 =?utf-8?Q?CwtFZP4YTXZcxmDk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8332473D4FD374DBB6317B8D7AAFCBA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UFODDyOq9LaCPLtXdjXqmynbR6AjZGC07XjJPHb2IiayXTMCmm8bnk/5iQkcHYKwoPhO2tLKgc6UnvXK6yLXw13zu/su2w39BMaE5dzgywljhOHidrN2VZgSkNVBFjiV2SU4SooLmVidcBkVyBjxJWQeJzcSUpr6F1nT+h6i7LCg+vShjdcg/rLbi+z/kDodefNmLEzaXcQwMJFyVt4O/rG0+1lZEHLyQSX58d+XHaI0kOS2xgPtXLrDZDcfbbZtSHnwR9ntYhP7hfVdh1Cc0QDHMgchBaGgy6KeAYvunaZBpxWVwhbQo5qU2Vwu11h02tvEPfuGFydElbY0MR+CNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d28ea-2eb4-4d68-5e63-08deb6e53eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 03:01:25.2582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v2PybFvJ0PSFKNXH63AQ72NbBiFfpXW7eiOKZONEP1ABoCPptkT8DhumzqZak3DMJYknHmtrA6RYKaXa/LYUMVVantNX/b4HyMkO7CVDfM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9906
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

T24gV2VkLCAyMDI2LTA1LTIwIGF0IDE2OjUwICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0IDAyOjQ2OjI2UE0gKzA4MDAsIEphc29uLUpIIExp
biB3cm90ZToNCj4gPiBVc2UgaWd0X2Rpc2FibGVfY3B1X2RlZXBfc2xlZXAoKSB0byBwcmV2ZW50
IENQVSB3YWtldXAgbGF0ZW5jeSB0aGF0DQo+ID4gYWZmZWN0cyB2YmxhbmsgdGltZXN0YW1wIGFj
cXVpc2l0aW9uLg0KPiA+IA0KPiA+IFRoaXMgYWRkcmVzc2VzIHZibGFuayB0aW1pbmcgc3RhYmls
aXR5IGlzc3VlcyBvbiBNZWRpYVRlayBwbGF0Zm9ybXMNCj4gPiB3aGVyZSBDUFUgZW50ZXJpbmcg
aWRsZSBzdGF0ZXMgY2FuIGNhdXNlIH4yMDB1cyB0aW1lc3RhbXAgaml0dGVyDQo+ID4gYW5kDQo+
ID4gdGVzdCBmYWlsdXJlcy4NCj4gDQo+IENhbid0IHlvdSBmaXggdGhlIGtlcm5lbCB0byBnZW5l
cmF0ZSBhY2N1cmF0ZSB0aW1lc3RhbXBzPw0KPiANCg0KSGkgVmlsbGUsDQoNClRoYW5rcyBmb3Ig
dGhlIGZlZWRiYWNrLg0KDQpDdXJyZW50bHksIHRoZSBrZXJuZWwgdGltZXN0YW1wIGl0c2VsZiBp
cyBhY2N1cmF0ZS4gVGhlIGlzc3VlIGlzIHRoYXQNCmV2ZW4gdGhvdWdoIHRoZSB2YmxhbmsgSVJR
IGZpcmVzIGFjY3VyYXRlbHksIHRoZSB0aW1lc3RhbXAgY2FwdHVyZWQgYnkNCkRSTSBjb3JlIHZp
YSBrdGltZV9nZXQoKSBpbiBkcm1fY3J0Y19nZXRfbGFzdF92Ymx0aW1lc3RhbXAoKSBjYW5ub3QN
CmF2b2lkIHRoZSBkZWxheShyYW5kb21seSB+MjAwdXMpIGludHJvZHVjZWQgYnkgdGhlIENQVSBp
ZGxlIGV4aXQNCnNlcXVlbmNlIGJlZm9yZSB0aGUgSVJRIGhhbmRsZXIgY2FuIGFjdHVhbGx5IGV4
ZWN1dGUuDQoNCkFmdGVyIGxvb2tpbmcgaW50byB0aGlzIGZ1cnRoZXIsIEkgcmVmZXJlbmNlZCBo
b3cgSW50ZWwgaGFuZGxlcyB2YmxhbmsNCnRpbWVzdGFtcHMgYW5kIG5vdGljZWQgdGhleSB1c2UN
CmRybV9jcnRjX3ZibGFua19oZWxwZXJfZ2V0X3ZibGFua190aW1lc3RhbXAoKSB0b2dldGhlciB3
aXRoDQpnZXRfc2Nhbm91dF9wb3NpdGlvbigpIHRvIGNhbGN1bGF0ZSBhY2N1cmF0ZSB0aW1lc3Rh
bXBzIGJ5IGNvbXBlbnNhdGluZw0KZm9yIElSUSBoYW5kbGluZyBkZWxheXMuIFBsZWFzZSBjb3Jy
ZWN0IG1lIGlmIEknbSB3cm9uZyA6KQ0KDQpIb3dldmVyLCB0aGlzIGFwcHJvYWNoIHJlcXVpcmVz
IHRoZSBoYXJkd2FyZSB0byBwcm92aWRlIHNjYW5saW5lDQpwb3NpdGlvbiBpbmZvcm1hdGlvbi4g
T24gTWVkaWFUZWsgcGxhdGZvcm1zLCB0aGlzIGhhcyBub3QgYmVlbiBmdWxseQ0KdmFsaWRhdGVk
IHlldCwgc28gZGlzYWJsaW5nIENQVSBkZWVwIGlkbGUgc3RhdGVzIHNlZW1zIHRvIGJlIHRoZSBt
b3N0DQphcHByb3ByaWF0ZSBzb2x1dGlvbiBmb3Igbm93Lg0KDQpXZSB3aWxsIGV2YWx1YXRlIHRo
ZSBmZWFzaWJpbGl0eSBvZiBwcm9wZXJseSBpbXBsZW1lbnRpbmcNCmdldF9zY2Fub3V0X3Bvc2l0
aW9uKCkgYW5kIGltcHJvdmluZyBvdXIgdmJsYW5rIHRpbWVzdGFtcCBhY2N1cmFjeQ0KYWZ0ZXJ3
YXJkcy4NCg0KQmVzdCByZWdhcmRzLA0KSmFzb24tSkggTGluDQo=
