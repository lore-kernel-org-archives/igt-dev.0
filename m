Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B51CD4F5E
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 06:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8DF89C0A;
	Wed, 20 May 2026 06:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Hhdt2+Es";
	dkim=pass (1024-bit key; unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="uh0k+nv7";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B2210EF0C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 06:54:11 +0000 (UTC)
X-UUID: b1b76a2c541811f1a3561939bc42ff46-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=d9KJIWukzFR9veL0WjAL+iW//bvK2p6lQPo1SxyAPNw=; 
 b=Hhdt2+EsLy8CcrBb3Y/tvHPZOfDA3aUBdASwH6pd8pR7IGRRKuElpQKNma+ztVavNhAOG88Iv9j6/VEG7+8BGe58P2Cn7/gNeQTD0dxxsZ6BgoiHObMcbIUwjnxvUNU5as0ttusGlHC8w5sPNbjEAvqFpAjY2ZoMHhP9/19WmHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:93fdabce-6c59-4bba-a5a6-50f369e2d6eb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:fee51f22-bef7-463f-902c-5f40f7404c33,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
 898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,Q
 S:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
 RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b1b76a2c541811f1a3561939bc42ff46-20260520
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 803237620; Wed, 20 May 2026 14:54:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 14:54:05 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 14:54:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxawuHSjKTOruMmOBOI5Fj35zzDd6cBrPxMUQI5E0gwcnPG/tAEfwE+2ur/LVOIHaegWW0qXpyJ4ae9mL8ptMU3X80Fm3ZKB2Ct6gaxEL/yiV3zVjyuWp2yYMcx28qlfYUcGUrH/lXDbq0GC61Xtgvc7a/M5P3LC/F95RU6boZixlbrnS96qmDphSZQEK14AQzMiE82x+Xkd7H3dRayHhHIc6mRVyDzft36YV8FkMgm2FbKsKFLp+7AEDs/pOKd4UxC/uotSd6zSusgP24PBqQo49oH55NLydUvriDh4f3VjxPhHLTyk1YaepxvKiCOl/RF8ss7rp9n0o+/hOXwYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9KJIWukzFR9veL0WjAL+iW//bvK2p6lQPo1SxyAPNw=;
 b=URS+PnVobWk4qieZdK+vexnnpwsJoecIj8XMpN9s0843hty4RBEizm+vaSTCdfXpCvsJNpkp2hd1QAyVYixzKs8pMSCrH+1VGdfDEv7b9zU+yRWJqDHSMFyRxR67HzlNV03NdKnbHL9aVrrsZB/Y2y15pb/9tNOMO7qnGbQEgYYXoxyBLvk3CILl2iCxk+xSZUNbPM2a0gHvlyhTE9mECAmG9JZO5LS2XBiqBMAjaY89Evqm/owtg1TiV9pRIztSqRlZKY+TjKk3usMNzexgZfYbgprlK40E2HMagTliCs/0aZzLXm4n7tBAmSQKd1a7HKdqe79FfchC2UuGOmBSRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9KJIWukzFR9veL0WjAL+iW//bvK2p6lQPo1SxyAPNw=;
 b=uh0k+nv7ow4SLF/mEVyJAL2JV19YWtnFTm4lxr/URUtLGUTxmONBguve1AAHFuyezeyFjdBW3UqHwEnGtC7FlDGuEMxxQwdRRY2YVe4WxjjwTR02WVcUkTvacJOPjQO0q0xrZtulSDhKPF+Hw1eTPCMgwPfZtiyUc+kXvffauVw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by KUZPR03MB9496.apcprd03.prod.outlook.com (2603:1096:d10:2f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 06:54:02 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::1fe4:fb59:1b1:1646%4]) with mapi id 15.21.0025.016; Wed, 20 May 2026
 06:54:02 +0000
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
Thread-Index: AQHcza+25D0Y1Rb/k0eYtYfzjD7CFA==
Date: Wed, 20 May 2026 06:54:01 +0000
Message-ID: <37eb1de46a4663c18d2374ed5bc49ee8d2760db0.camel@mediatek.com>
References: <20260416144536.3263173-1-jason-jh.lin@mediatek.com>
 <aeD5qtEo0h4KKDu4@intel.com> <aeEAS30Z9hFW8CSc@intel.com>
 <7de4af1352d4c25a32319b58bd1bdb0e5c75a266.camel@mediatek.com>
In-Reply-To: <7de4af1352d4c25a32319b58bd1bdb0e5c75a266.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|KUZPR03MB9496:EE_
x-ms-office365-filtering-correlation-id: 0e303d72-a983-4cb5-f1e0-08deb63c935e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003|4143699003|11063799006;
x-microsoft-antispam-message-info: eMR5yYCxlpgDKiL8moSzXxmGHIt2/XqsHQiZZlcnPA9jyRpSDEuM+j8U0I1MwbHrBpiLs6xpBa4qcZvFP6B++3P7utZRXzz3auWcuO3rKc0mLnaTsxGXAJw4tLz5yndGerThjAghLqLyM7XRPvGUE5dE59EI9slgUKcKdIAzjZf75hKujHSg4wx4YfXgkJkBsqOUi7+4dbVDf8j/wQdQx3LydMnknRp3TaW5aJdh3a2OkGy12uh8aG0PB8nJBFfDj+NmKwxT2ah0tajWNz5c5kilmMWtnnRSVaIrRy+WCo4Hhmc8gs4wfCNPEfNQcwtUlakJN8uJBrZsjD9A7NksIjr4Lb02tRKySl7YCKpm+dWd8A9a9Ios33SsBukd85kWVd6MuiiBU84oG2ai5A6QH8gNQEDLDgzFcQGIa2pRjUwu0EWOdVSfSlcV2fWQ4B1f6wnfrEGnnGRu82qWyiom6E6Z2TKqepmKk2bo2XnqyWao+e0nsERNL/BMlxVATwn3wc6yqNlTyAVtlV4dW6BFv4DH6RfZnAr1Vpoi1aCs2CYekATK9pjoJFvOpVlP15pjIgcVL0C8Xi26ZsXhmedcHaiFDOp3sWFomttfsvfgp7+QvRubTN0vMo9srMUK14VWNCb1/qbq+xCO56uoHYrErAz8VDkZM+1BJ/wRGX0ctuZE/z5vtKm2wJUvcg0JmVYZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB7682.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2FjMVdWR00rMjR5OEtGWG1OYkVtazZKVU4yMTVDWVE0L3BGcDJuMHkwaFNF?=
 =?utf-8?B?N01RQzRYZHlMWkhBYlc1U3NXVGw1dGtxQ3g5TXVBcCtUSjYrYktGMS9tKzdk?=
 =?utf-8?B?emIzcVJyN2huNjhQSU1PdlZLMXdNdklUVHAzMjgvdFc3R0ZqWk9Na2dld09F?=
 =?utf-8?B?Z2Q4elN6enhxQjZrNlZuUWxwbDYrVHBFYStxZnlwWm1JdWZRa3JjaXBDbTFz?=
 =?utf-8?B?aU9IYnF5OVdKUi91N0JhcEhucUpWVmowd1FrMS83OW1aM1FMMk1YUHFId2lw?=
 =?utf-8?B?ZmVzdnJHR29TSWx6WVdleHhrWjU2MTIxaXlRQzdUR1JxZzlrRUhjTi8vUHhV?=
 =?utf-8?B?ZDFOenNXUHYwdkZsL1U3Y25KU0ROTkxCLzBrSVBwY0tvV2czS3FOMWRVZWtW?=
 =?utf-8?B?RmZqVFRkdWlTc2tmbW4vNGVJS1ZaZFNVaW5PbmMwbkdxMTRkdm1wc09qY3g0?=
 =?utf-8?B?UXpkVVVqb0VpbjZKcUczMlJMbXl3R1ExMGJQK3VsaEFxdWt0akhYdThRVlcy?=
 =?utf-8?B?NzI0ZGorclNub2xvRzY0NmJYNmphaGNOMnRqMHl4SDA2SnpMWHZaTVlaS0x3?=
 =?utf-8?B?bE1tZGhsQjcxZ3hSWXdHeWdTaEFqVXhMQ0JoM1cyV0UwRmdkbzhCQ0tRWFJu?=
 =?utf-8?B?Nm9Kc2FKcFJ4NGxsQ0dsUStxQklTYTd3UHBrNXdtbE9GaGxkNGpoejd1TXV3?=
 =?utf-8?B?QTVjd25lNTBWYnZMK09IVE5ENEk3YXFiWGg0dk8raWNDYVJFb0JUUThWclhk?=
 =?utf-8?B?ZzFwaWZ0enlET3lqd3U4RE1yY1RSY2sxL1dON0htK09yUjNQWUlUOGowN0tD?=
 =?utf-8?B?SFJBaDhwcXVhSi9Ec2JKN3NKU09xS2xUQWRBVVMwb01Eeld4T0xhUW85N09M?=
 =?utf-8?B?ckJTb2x6S1JXcjBEWFVBMWpyU0NXZUhYWWN2aFV6Wk0yK0pwSW5TQ1ExY3JJ?=
 =?utf-8?B?S1d3d05wZVBPbDR2VEdUc3kzMkp6bUtFaHlITE1PTFQ3Wi9pbmFSNDJSR0JZ?=
 =?utf-8?B?RnBSUE1SUTliQ0NYSWwzV1IzMThwcTQ0RHRmZEVQRFdOU3VVQXhITERoSjdn?=
 =?utf-8?B?c1EvWTlmTnhzUUxCMDlCSG4xZFQvZHlLemtjdWpjOEc0VVZxUXJDLzBvQ3F6?=
 =?utf-8?B?OVBZWWRsRDZMaHArcWJSMWNsWEJUdkppa3FGMmpVZTdvVXA1amtWOXFlTTRX?=
 =?utf-8?B?dGF3QkJLbE9KMXFNSjhaekY1OXdOMXpOdVhIUFpSaWZJYVNNSUFNMjVaMG5H?=
 =?utf-8?B?WGs3dUp2YWxBK2NVWXNCV1B0cmdDQnF2b0t2YzZYb3JXTlhTVjVpUDl3Qld1?=
 =?utf-8?B?Q0FBc3M5M0txa1hrMU5hNFo3Y0Jqd0ZRclRtMVJXYk9OUHhucld3TGIycXZB?=
 =?utf-8?B?ejVUbFJCdWlFR2FlaVFSaHF3WVVkWWNCVkNZSnN6UytoejFORHpTRTlLT0Yz?=
 =?utf-8?B?NUxwRFJBdlk0Z1g3RWYxSnUxbjdUbWRDR3BBWkVDaVRNTVlpSnY5b2VLa3Z4?=
 =?utf-8?B?SzZvNjE4UjNlRzY5ZysybVVlaWMxbHpKbWdqbUlRYmMvcEZYVEJwN0t5a3JC?=
 =?utf-8?B?RWVtT294OU9RN0trZElYQzQxcllPNys0elk5NTk1dGVuUVdNUmhGZ0tNcHBw?=
 =?utf-8?B?eU95bGtGb2FWNklNeVlxMWwwWDhvbDhpRk9BL2RqUkVLbllwaDVVWnlrYmti?=
 =?utf-8?B?VjdjS1JmckxIQkEyL0JlbTRFRnZKK0Y3cUZqeTQwb2hIaHh0L1NwRWdiU3FC?=
 =?utf-8?B?bUlpaC9mVlBTRGNoemczU3J3N1pCdkZ4TG5HZFFkL0xVUVE2L3IweU1hMitR?=
 =?utf-8?B?TzFPdnpPV2JLeDMzYkRoczl0VitVK2E2Ukgzb091MmY0NndrUG05b3F6WE41?=
 =?utf-8?B?S3BoTytzajExbkVhd0FFMzVacXhBZDFBeEF0OGxNWFNFaTJGRHc2c2toUEdT?=
 =?utf-8?B?VFRWRTVPbEJrNnpOY1c0OEYxK3hyZm1IY0ZLNnYrR2YyK0hqRVdPaWlkQlM1?=
 =?utf-8?B?ak1lZzRoMTZQWFZFUlVLMUIvbHN5NE9VTnlwTXpnS0FEZmJxSXRpWjl5cVpJ?=
 =?utf-8?B?TGZjdVlVbnpzc2h2Yk0rK1lac2dzSXdGU1FGclVRdldlcTl2eHpnR2N2c21o?=
 =?utf-8?B?aTZHdUI2bGM0ekpzTHRsNFg1bDJzNWpOY1BWajlPNE9zV2JLUE9qUEJUMjlS?=
 =?utf-8?B?Q3VLWUEzRDFHNEF1NDNCRTEweTdRbWw2ckRtU25icWFhcHkyZFpxbFdDNm1B?=
 =?utf-8?B?cnVvT21tblRYMGZqZVdPTkdWQlVvWlU5d1hyRzh2eTIvZGpTbmx5VEZUZmd4?=
 =?utf-8?B?ZUE5TlQxbTk2QjdtZnV1VmovaWwrSlBPUStHbDJVdzBxU2l6c2pleVY3a3hz?=
 =?utf-8?Q?bkEGhzLrXPv3resc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D296E49A8FD2344981897542210F9B5E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tOef8H63c6/7iVNMXEjesYbobTIxGVqJBQW6I/BbcdwfzYditLvWN2cGjlQ0Rs05ZIetxxhWtJMTlpmQhw6raNaPTazKao2KB+P1zQBTo8zfGtg2Swl+nBHhbHOUBYx16jrJ05j7A6l81KEh+ok6B1cznqykI+b8yrpBv2n24UrV4OG0R6nMgtt0gUULj4AiWWScF6LEZUGnRHe00Qr/ymny+YuejgjvA9OdyXWnFsfJj4Ba+DCpSyCDLpQfr1ZlDh8TfQKkOtbd5Xgxbu4v+1qDKl74vMn5pw0o/uy4GP67zj4FGHkyLm43iT5VAcITfaAhe109wua/MFN5dgPPUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e303d72-a983-4cb5-f1e0-08deb63c935e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 06:54:01.9724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8TurA37AmV7As4cUP/xS+oCjavnFek58dEHGhHQ/ziTnBjbfkHEIvJI3NSYb6MIBV+dt1v4onuShxmJQUvVSRtOURPjoT/hBk+Yf9q0ENU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9496
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

W3NuaXBdDQoNCj4gWW91IGFyZSByaWdodCB0aGF0IHJlYWQoKSBvdmVyaGVhZCBpcyBpcnJlbGV2
YW50IGhlcmUgc2luY2UNCj4gY2hlY2tfdGltaW5ncygpIGlzIG1lYXN1cmluZyBrZXJuZWwgZ2Vu
ZXJhdGVkIHZibGFuayBldmVudA0KPiB0aW1lc3RhbXBzLg0KPiBJIHdpbGwgcmVtb3ZlIHRoYXQg
cGFydCBvZiB0aGUgcmF0aW9uYWxlLg0KPiANCj4gUmVnYXJkaW5nIHRoZSB0d28gY2hlY2tzOg0K
PiANCj4gRm9yIENoZWNrIDEgKHRpbWVzdGFtcCBhY2N1cmFjeSA+PSBsaW5lX3RpbWUpOiBZb3Ug
cG9pbnRlZCBvdXQgdGhhdA0KPiBmYWlsaW5nIHRoaXMgaW5kaWNhdGVzIHRoZSBrZXJuZWwgZHJp
dmVyIGlzbid0IGdlbmVyYXRpbmcgZ29vZA0KPiB0aW1lc3RhbXBzLiBXZSB3aWxsIGludmVzdGln
YXRlIGFuZCBmaXggTVRLJ3MgdmJsYW5rIHRpbWVzdGFtcA0KPiBpbXBsZW1lbnRhdGlvbiBhdCB0
aGUga2VybmVsIGRyaXZlciBsZXZlbMKgIHJhdGhlciB0aGFuIHJlbGF4aW5nDQo+IHRoZSB0ZXN0
Lg0KPiANCj4gRm9yIENoZWNrIDIgKG1lYW4gZGV2aWF0aW9uIGZyb20gZXhwZWN0ZWQpOiBJIHdp
bGwgdXBkYXRlIHRoZSBwYXRjaA0KPiB0byBvbmx5IHJlbGF4IHRoaXMgY2hlY2sgdG8gYWxsb3cg
dGhlIFZFU0Egc3BlY2lmaWVkIMKxMC41JSBwaXhlbA0KPiBjbG9jaw0KPiB0b2xlcmFuY2UsIGFu
ZCByZW1vdmUgdGhlIHJlYWQoKSBvdmVyaGVhZCByYXRpb25hbGUgZnJvbSB0aGUgY29tbWl0DQo+
IG1lc3NhZ2UuDQo+IA0KDQpIaSBBbGwsDQoNCkZpbmFsbHksIEkgZm91bmQgYSByb290IGNhdXNl
IG9mIHZibGFuayB0aW1lc3RhbXAgaml0dGVyIGlzIHRoYXQNCkNQVSBlbnRlcnMgdG8gdGhlIGRl
ZXAgaWRsZSBzdGF0ZS4NCg0KSSBzZW50IGEgc2VyaWVzIHRvIGNvdmVyIHRoaXMgaXNzdWU6DQpo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE2NjkxMg0KDQpUaGVuLCB0
aGlzIHBhdGNoIGNhbiBiZSBkcm9wcGVkLg0KVGhhbmtzIGZvciBhbGwgdGhlIHJldmlldyBhbmQg
c3VwcG9ydC4NCg0KPiBSZWdhcmRzLA0KPiBKYXNvbi1KSCBMaW4NCg0K
