Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06644C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 16:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32191120C0;
	Wed,  8 May 2024 16:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMLW+7n8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303991120C0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715186615; x=1746722615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F9UIy5FYlRS9fR9qcgwTk42YAHMJ78phpQPBNdqiiOg=;
 b=AMLW+7n8e3bA3iEkUnU+6NKStfUhAxzRo/Q06uN1bsw4ZwXvTebEP42k
 V1scy1vHGE4zTFkBcvp1bifTQIdPTl39psd0lg1Ypm2gX3aXeFndBBKTV
 Jxz+mh57+7XsbauCFOm3HSEyG1+/5dsobbLkr5A8v98CUWfXJDTFbAq+Z
 d9Whyx+ZKBBpebApz8aTR8ZU1U91XvihOrsyaIYJeqwqUCjubnpYUCpiR
 On/6M23ZOpkWE6uupp6gFBAAce3vqJWN9g4X6V3b4P/d3zsMGQvtqWKu0
 vaEPTAs5J3wqiZfptagT85wrY2UwhxmiUU74u2u6qwuwzvEAp/2D487g8 A==;
X-CSE-ConnectionGUID: +RkvwIs+SS631l/LIfhrCA==
X-CSE-MsgGUID: 8jz/RQ1+SryhdhpPQRZBsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36440976"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36440976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 09:43:10 -0700
X-CSE-ConnectionGUID: /V9QYIQ7TuyYJKiOjYtROw==
X-CSE-MsgGUID: eOlVYqgYScKp/Fy9yQ15pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28906239"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 09:43:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 09:43:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 09:43:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 09:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUI0mTFhPMBnMwE6tz449Gnaddj9htgt+FXW6IzoArLJSQuEkL0yip/xor9Mp78P/f8VcXNac3quK95RcSz83lvIgyVHf74suVAGIwVE3wreZHaJrV2HgNdr5Zm3a/cV/lUo5RFVXlOwWzFbdYq71MFQiVoXlxgGAqeyxXZQu1ESjv1D1yqOfMnCYllJWYkVKII0sL394kXXMni/3x2tlQgi+GuIIhVyPnfTC412I3TWPEcQiYbk7Pr47Il0ImBzmkVRDcw2YkxMvhmYr8xklfIfTIknWUzeZD4EB0goETUGiyRRGdrnTO6U4jOWpejPWIenjQh/oRwvbmUW1cGPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9UIy5FYlRS9fR9qcgwTk42YAHMJ78phpQPBNdqiiOg=;
 b=QvDyfgiuRjwD+fGRhp2ofWD0nFaOPBq4B7C3uvEJ+AR2IQuM1PRVnmbBBOuZFZ4HsXIOeB07JHGFsxwLzBQrCR+XV5Nr76+Te+NEg1HFAI787Nob8XYW2jfGXcJKta/CKctR+//bQjNr8ct06KDdZMsPitMYSshecZA/yEg1Gmr0lrCob0Uv/TQnJcNy+rrw/nm82kPjHmL3lTAv76iVOrIKOgSxuUm4zVhrDjEqavn8X5w4GyFo8uphJq+TI02KD1YXqNnQIYdOYWl0tgPdbFwnUw1D3yYdxxx4940DALjvTy/EAAwBBG3FCJJXmzqOL336q/DZn+u+/ZUulexmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CYXPR11MB8662.namprd11.prod.outlook.com (2603:10b6:930:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 16:43:06 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 16:43:06 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Thread-Topic: [PATCH i-g-t 1/1] lib/xe/xe_query: Wait for xe_supports_faults
Thread-Index: AQHanZN24GaWUtUpZkKW//a6akHlCLGNjQ+AgAAB3/A=
Date: Wed, 8 May 2024 16:43:04 +0000
Message-ID: <CH0PR11MB5444E8304D0EF667EB79DBC9E5E52@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240503193714.1967850-1-jonathan.cavitt@intel.com>
 <20240503193714.1967850-2-jonathan.cavitt@intel.com>
 <20240508162349.4v4zpogce7ru6qh7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240508162349.4v4zpogce7ru6qh7@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CYXPR11MB8662:EE_
x-ms-office365-filtering-correlation-id: 1cec578d-9398-4afe-d3ce-08dc6f7deedb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?ZXdPU01temRDazVxa3MxWXpqRFpWY0RXQThxMVlINnI3NU5ObDYzdlU4RWl6?=
 =?utf-8?B?c1RBWmsreGVYL0szUWphV0xVUEYzRDhaWVV4OWE2dzcwRkx1UGUxMlBNYkti?=
 =?utf-8?B?UkM3R0tQTEkzNFJqVi9nYUdzSUdHUW41OXdzTGlURitsQ2FQTUw4Q3pnaGpu?=
 =?utf-8?B?TEJOMDF0WlpyMEg0Ynp4emJvWG91a0FBVGtsVW1wS2UyTE5iRkJ4TmZXZ3g2?=
 =?utf-8?B?V2NHYlY2WGVsRnAxQTFmSGdQYW5rV251MTU3aVNkY3dWOTAyRjZMYUJoWHRJ?=
 =?utf-8?B?TVNTNVlyYk9DOTZLTkFPWG9rMk8rMkxCMGcwSGhmSzJSM1IwU2RzOFAyVDBu?=
 =?utf-8?B?V0dxQ0VSc0lnV0NyNXV4L2RpT1BKZDVrLzh3TFJMNVMwSkNXajd6NVN2RTZP?=
 =?utf-8?B?OWk0dENuR3hPUjVPUERXRTUxYlFlWmpNMG10L3FkVk56eTJCZE43Q0g5Ukhv?=
 =?utf-8?B?UFFZWkk4QUd4T1A4elJWV3RPOWFHZ0lSbWtqTHEzaTJNSVlxcExRaDF4Z3hX?=
 =?utf-8?B?UXlPdlRLaUpYUkNPaVVzNzM4SENic1U5VXYrQUkxZWpGRTNnejViaTNlVXE0?=
 =?utf-8?B?SlladW9VUlFLRVBITlV2cGxneEJxbk11Z2t0ZTlLNnNtWWQ2QzE4M1lsZEVt?=
 =?utf-8?B?dG8zUnMzckVhdGdOemFYVFZYay94NThYaENRcjJ3TkJyY1lWVzlabDlBdU5P?=
 =?utf-8?B?OGtWRWNMS1Uxa3pYdkR1SEp4YU03ME84WFlJT3d4WnpMUHpSdTcybktSaEZs?=
 =?utf-8?B?OXJuZXZYRFlGTVlyaThhcjcyMDB4c3dKQ0E3RDJRUnFVZ2pyVEdZSWRENDV3?=
 =?utf-8?B?MExGQWd4NEdYMEUwRjVkRk1Gd2ZrN05wSjIzQk9LUHBZQ256NjVwVzVPQVVy?=
 =?utf-8?B?Wk8rNS81TVQvdFN3bFd6dXE3c1F4TzI0YmFkWTdYK053c1dIZ2lqU3gxMGxB?=
 =?utf-8?B?c21WRHZXMWU3azVvMlEyUm1WdnZnUWNMeXRtNlRranVlMXFRQVRSQnRTM1NT?=
 =?utf-8?B?aDg2SWFqR0lYcVhDYVRRT2wzLzBJU2x6cDN3dG5NeGo4aW50V1lQR3EvRUJT?=
 =?utf-8?B?d2plVGVMNWwzYmp2ZjUyejhmeFZLcW9IV3o4ck82SUpTckE2amFHZ2J2WTgv?=
 =?utf-8?B?N0JEVmpHajBaaXNVMFJ2cVAvUmx5d2h0MTVlWEUzUVhhWmZNeDRtVm1Xd0Fw?=
 =?utf-8?B?MmhPdlk3NEkzb0JUZ29RRm9IUmtzYUdwOVVZL1pEbWRwazQyUTNNVGwwa1Zp?=
 =?utf-8?B?V1hwVW5sRE81dW5mMVB6WUozdDU0dDlIVDFCZE0zOUJZMDZsL1FPUXBLZHNU?=
 =?utf-8?B?cVRMenJFOTlpdDc5ek1RSHRPOWRiNUg2Ukh0SFhmajIxUzZzS0VGd1kyRnh3?=
 =?utf-8?B?K28wT1RZdFM3SXdqSUFLaE9ETW8wMXlGZjludVIvU1pxWW8zS1drSGVrMXhV?=
 =?utf-8?B?a2Fyci9hZXplNXQ4RDhsT1FObWllZjJMQjFJU1A0emora2ozb3pRdklHTDgw?=
 =?utf-8?B?VUc2dTg4RnFHMFFzdENkMFN1UmQzTitLdVJneEsrWHVZYVljNE03ZHlsTDBH?=
 =?utf-8?B?NEpZYVNnNkY4M0tDQ2c2Q3RvYmNPS1M5UnBYYjEvU0dOM0t2UGlwME9KRTky?=
 =?utf-8?B?Q2FEMkY1Vm9xT2k0Q29nckNJdmtkZjRqNHlZVWRJeFVUanhGT0NIQkI1aXVQ?=
 =?utf-8?B?REhZWDUvMjNoS1dieXBuWHpWbTM3NFBwY1NJa1NvdUJwSTM3ay80Z2FqTHZ5?=
 =?utf-8?B?cWdUMWdzL2JpaU1nVmtZUVo2Rm9YL1RGMHkrM01RQW1kUXR2ZDJMTmpuOW1X?=
 =?utf-8?B?ZjZyT3ErejFBZDJzdGsyZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0xSeVo5L0xDQmRQTXpGT2E3U2wxY3pIaFJoWXlZMm5taWozcnlsMU96M243?=
 =?utf-8?B?TmVnWEh4emFTRFk3RDB2ZzY4dkdTd1J5ZVFxNEdjSkhpZU0vVW9kMi9Mb3gv?=
 =?utf-8?B?bk5MMHBpbTFWdHJyOElQSkRiRDkzUWFTSW1EV2pkZ0VFbThaRXNVTmdFZzMw?=
 =?utf-8?B?S0d4YlZGbkkwYmJ5T1FOOXNQZjh2Y3dGb0xva2tCSGdpbUJheTY4eUlQcFVs?=
 =?utf-8?B?S2JENzZ6dVFDTjN2bGRjSG80MHB2UGxJS3Q5M0ttV0czM3ArTlFkOHFnYk13?=
 =?utf-8?B?QzNjbmVqQzB5TnU3aFJYZENhek1rMmRBdUpVdFVBcTQzbTg3em4xTlExRTlX?=
 =?utf-8?B?dUVUck9uaTNwNEVsL0o1SVpkQi9OenpTdkV6UXlIanlkNWk1U0JaZElEV1N1?=
 =?utf-8?B?TW1IUmxTdFkrNlNTMEVzVm9MZURjaER3TVh2dFp5Mjh2WWhxdzdDTFc4c3hk?=
 =?utf-8?B?ajcxM1lyUjZUTmR6eVlNZ1VXeHEzQkJDeWt2aVFqVHM0YlQyZmlwN20wVHU2?=
 =?utf-8?B?NmloMTJPQmk3U29TUyttUzY5ekVLc1J1Mm1ZTWcwbndCcENkbjgyTjJnTjlN?=
 =?utf-8?B?RkxmeWh1NjJkbkJ4emNCRFZ1elFqUFA2YStUSFh0NkMwelo4Z211SXZlTzJm?=
 =?utf-8?B?TDVsZkpSWk9qaG1SNUlCS241dTNwb0FsYWxPMDk0QWNPOGNxUVNGK1JuN0RL?=
 =?utf-8?B?YmYxbEhLa3Uwcm9pK0pnYm5yMU01UFk2ZSs0YSt1VU9NV2tTTjFCV1IrK1RW?=
 =?utf-8?B?NWF1YVE2K2RXWWhiTHZJM2xhSXBiQ3NWdURPcFhieVlYQWN1NHNCMjd1T09F?=
 =?utf-8?B?QlMrRFpzclozYUh1M3hwMjc1V2pTUkw0UytINEVSSEp5dDdPaGU3a0p6dXVi?=
 =?utf-8?B?L085NFhQYnI0SGlJQzZPa2UxeEVrSDU1VFlpQkFPbHU1NVBOZHZDNXg3Q1N5?=
 =?utf-8?B?ZmJFa21XU2xEaTBwTE5tVnE0aUNyWlpiTlNPbWZRL0xUaStIUkk1Qk5KbTN1?=
 =?utf-8?B?TS9lcTd3SDNIQWx1L1FWMWNNQU83dTJ3RG5VU2RkWWFmcksvUTJRLzJuWmk1?=
 =?utf-8?B?NGZmb2dYV0xtQTRnZ09RTnptdG1NZzh1Qm1xM2ZGLzVoLzd0UFhxSzVkNzh1?=
 =?utf-8?B?c041TDdDZFZhZmNRbm9hRXNheWRkd3ZPOTRkS1A3Y2hUZTBkMG5yMjBzaXBo?=
 =?utf-8?B?QzJWcHU4S2R5V1Zha0hLQU0raGFqN1FhMXZJR1h5c2ViS3B5MWVra1g5TVVm?=
 =?utf-8?B?OTlpTXc0QnVXZWJ4RW9lbENYT3FwNlVBbEZJcTVUK1BYN0dGc09OOVI2K1U3?=
 =?utf-8?B?UDdCa3h1S0N6OWNBeXBuOXl6ZjQ4ckFlblpVYTNKODBGTnBmdHE0RGljRUg4?=
 =?utf-8?B?MWQ5eFFZUjVOME5jLzJrOEYzSitIUFFBLzBPbDZNMWl1aUtuSDF4ZVphczht?=
 =?utf-8?B?VVBqcW5LVm45SUVFQjM1ekZDS2R0UGU3NVE3RUVEMENlemlhS0lnbkpXNHFN?=
 =?utf-8?B?UzBTNnN4RXIzc1haVDYrdGZCZW1hWmRFM051SGV1Y0I3ZUJLOUI1L0l1NXNu?=
 =?utf-8?B?U0FUbnpLVWVpMU1JT2ZHcDlKeTJqcHc2aWZjSlNuenU3L21QdXpzalV1U1hW?=
 =?utf-8?B?U2c1SWNTOHFXRkhWRnFoVlIwc1BveUV5bmtvam13WEx5WENDNXNzY2F6SkU1?=
 =?utf-8?B?Z3RiQ1U3RzhCOGF2N09IVm9rREN1cEV1YWZqaVY5SnZPeVc4SmNSbmpZUmE3?=
 =?utf-8?B?M1ZHVWlIbWJRRW5QOWxiRzVrU0gxZXhjSy8zWEU4V0dTNktNc05Kb3o0R0ZN?=
 =?utf-8?B?blhFV2hDM25ucTNQRGpMdHBxdnhSWTU5a0o3WnJyK2FPeDh4KzFOdzBXc2xT?=
 =?utf-8?B?TSsraUJ4bjl6VjBPeU91ZXpqOFRuZ1Q2bUhOSXpBVHBUV1U2QmpEb0E2KzhR?=
 =?utf-8?B?bjBNUVFWbHVHRS8wK2xGMG9kdTNvNEN3NzhCc0doZU0wZ202ek14MldsRWtD?=
 =?utf-8?B?UGVJWU4yT3RsVVQzMWZQOTc4TGNkOEN0dVNjN29SdVNmNDZzalppRm16Y2VW?=
 =?utf-8?B?Z01KdDcxdFZOMFY3elgxV1B4a1IzTnFzSk1mWWs0LzVJeVdINkhXbXJXNXdE?=
 =?utf-8?Q?7Z/owxkRYDyHuxNkci1c1+AeY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cec578d-9398-4afe-d3ce-08dc6f7deedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 16:43:04.8413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1d4pXdc9BCYmWtt3S9OIvcOrSq2OSVXulOa68+gwE3QDPCUop+iHzV1s+sXWVzYkRxfARanmi6FcWGNf6QY6idDiEfgL/7QIjrH+UQAYU8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8662
X-OriginatorOrg: intel.com
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1heSA4LCAyMDI0
IDk6MjQgQU0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IENhdml0dCwg
Sm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBHdXB0YSwgc2F1cmFiaGcgPHNh
dXJhYmhnLmd1cHRhQGludGVsLmNvbT47IFdlbHR5LCBCcmlhbiA8YnJpYW4ud2VsdHlAaW50ZWwu
Y29tPjsgTWlzdGF0LCBUb21hc3ogPHRvbWFzei5taXN0YXRAaW50ZWwuY29tPjsgR2lyb3RyYSwg
SGltYW5zaHUgPGhpbWFuc2h1Lmdpcm90cmFAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRD
SCBpLWctdCAxLzFdIGxpYi94ZS94ZV9xdWVyeTogV2FpdCBmb3IgeGVfc3VwcG9ydHNfZmF1bHRz
DQo+IA0KPiBIaSBKb25hdGhhbiwNCj4gT24gMjAyNC0wNS0wMyBhdCAxMjozNzoxNCAtMDcwMCwg
Sm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IEl0J3MgcG9zc2libGUgZm9yIHhlX3N1cHBvcnRz
X2ZhdWx0cyB0byByZXR1cm4gZmFsc2UgaWYgdGhlIHN5c3RlbSBpcw0KPiA+IGJ1c3kgd2l0aCBt
dWx0aXBsZSBydW5uaW5nIHRlc3RzLiAgVGhpcyBpcyBiZWNhdXNlIHRoZSBjaGVjayBsb29rcyBm
b3INCj4gPiBhbGwgYWN0aXZlIFZNcyBhbmQgc2VhcmNoZXMgZm9yIFZNcyB0aGF0IGRvIG5vdCBo
YXZlIGZhdWx0cyBlbmFibGVkLA0KPiA+IHJldHVybmluZyBmYWxzZSBpZiBhbnkgZXhpc3QuICBS
ZWNlbnRseSwgdGhpcyBjaGVjayBoYXMgYmVlbiBjaGFuZ2VkIHRvDQo+ID4gcmV0dXJuIEVCVVNZ
IHdoZW4gdGhlIGNoZWNrIGZhaWxzIGluIHRoaXMgd2F5LCBzbyB3YWl0IGZvciB1cCB0byB0ZW4N
Cj4gPiBzZWNvbmRzIGZvciBhbGwgdGhlIGFjdGl2ZSBWTXMgdG8gZmx1c2ggb3V0IGJlZm9yZSBw
cm9jZWVkaW5nLg0KPiA+IA0KPiA+IFN1Z2dlc3RlZC1ieTogQnJpYW4gV2VsdHkgPGJyaWFuLndl
bHR5QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0
aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi94ZS94ZV9xdWVyeS5jIHwg
OSArKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX3F1ZXJ5LmMgYi9saWIv
eGUveGVfcXVlcnkuYw0KPiA+IGluZGV4IDZkZjhmNDI2NDkuLjU0NThjNzM0MTcgMTAwNjQ0DQo+
ID4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmMNCj4gPiArKysgYi9saWIveGUveGVfcXVlcnkuYw0K
PiA+IEBAIC0zMTQsOCArMzE0LDEzIEBAIGJvb2wgeGVfc3VwcG9ydHNfZmF1bHRzKGludCBmZCkN
Cj4gPiAgCQkuZmxhZ3MgPSBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8DQo+ID4gIAkJ
CSBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9ERSwNCj4gPiAgCX07DQo+ID4gLQ0KPiA+
IC0Jc3VwcG9ydHNfZmF1bHRzID0gIWlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX1ZNX0NSRUFU
RSwgJmNyZWF0ZSk7DQo+ID4gKwlzdHJ1Y3QgdGltZXNwZWMgdHYgPSB7fTsNCj4gPiArCWludCBy
ZXN1bHQsIHRpbWVvdXQ7DQo+ID4gKwlkbyB7DQo+ID4gKwkJcmVzdWx0ID0gaWd0X2lvY3RsKGZk
LCBEUk1fSU9DVExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlKTsNCj4gPiArCQlzdXBwb3J0c19mYXVs
dHMgPSAhcmVzdWx0Ow0KPiA+ICsJCXRpbWVvdXQgPSBpZ3Rfc2Vjb25kc19lbGFwc2VkKCZ0dik7
DQo+ID4gKwl9IHdoaWxlIChyZXN1bHQgPT0gLUVCVVNZICYmIHRpbWVvdXQgPCAxMCk7DQo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIF5eXl5eXl5eXl5eXg0KPiANCj4gV2FpdGlu
ZyBhbnkgbnVtYmVyIG9mIHNlY29uZHMgaW4gbGlicmFyeSBmdW5jdGlvbiBpcyB3YXkgdG9vIG11
Y2gsDQo+IGltaG8gdGhpcyBpcyBvayBpbiB0ZXN0IGl0c2VsZiwgbm90IG9uIGxpYi4NCg0KSXMg
dGhlIHN1Z2dlc3Rpb24gaGVyZSB0aGF0IHdlIHNob3VsZCBwZXJmb3JtIHRoZSB3YWl0ICJvbiIg
eGVfc3VwcG9ydHNfZmF1bHRzLA0KcmF0aGVyIHRoYW4gImluIiB4ZV9zdXBwb3J0c19mYXVsdHM/
ICBJLkUuIHRoYXQgd2UgZG8gc29tZXRoaW5nIGxpa2UgdGhpcyBpbnN0ZWFkDQppbiB4ZV9leGVj
X2ZhdWx0X21vZGUuYzoNCg0KICAgICAgICBpZ3RfZml4dHVyZSB7DQogICAgICAgICAgICAgICAg
Ym9vbCBzdXBwb3J0c19mYXVsdHM7DQogICAgICAgICAgICAgICAgc3RydWN0IHRpbWVzcGVjIHR2
ID0ge307DQogICAgICAgICAgICAgICAgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsN
CiAgICAgICAgICAgICAgICBkbyB7DQogICAgICAgICAgICAgICAgICAgICAgICBzdXBwb3J0c19m
YXVsdHMgPSB4ZV9zdXBwb3J0c19mYXVsdHMoZmQpOw0KICAgICAgICAgICAgICAgIH0gd2hpbGUg
KCFzdXBwb3J0c19mYXVsdHMgJiYgaWd0X3NlY29uZHNfZWxhcHNlZCgmdHYpIDwgMTApOw0KICAg
ICAgICAgICAgICAgIGlndF9yZXF1aXJlKHN1cHBvcnRzX2ZhdWx0cyk7DQogICAgICAgIH0NCg0K
SSBjYW4gZG8gdGhpcywgdGhvdWdoIGlmIHhlX3N1cHBvcnRzX2ZhdWx0cyByZXR1cm5zIGZhbHNl
IGZvciBhbnkgbm9uLUVCVVNZIHJlbGF0ZWQNCnJlYXNvbnMsIHdlIHdvbid0IGJlIGFibGUgdG8g
ZGV0ZWN0IGl0IGZyb20gaGVyZSBhbmQgd2UnbGwgc3BlbmQgdGVuIHNlY29uZHMgd2FpdGluZw0K
Zm9yIHhlX3N1cHBvcnRzX2ZhdWx0cyB0byByZXR1cm4gdHJ1ZSB3aGVuIGl0IHN0cmljdGx5IGNh
bm5vdC4gIElzIHRoaXMgYW4gYWNjZXB0YWJsZQ0KdHJhZGVvZmY/DQotSm9uYXRoYW4gQ2F2aXR0
DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICANCj4gPiAgCWlmIChzdXBwb3J0
c19mYXVsdHMpDQo+ID4gIAkJeGVfdm1fZGVzdHJveShmZCwgY3JlYXRlLnZtX2lkKTsNCj4gPiAt
LSANCj4gPiAyLjI1LjENCj4gPiANCj4gDQo=
