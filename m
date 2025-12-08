Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C902D3B7DE
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 11:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC9710E427;
	Mon,  8 Dec 2025 11:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzoRrfnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B3910E427
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 11:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765194303; x=1796730303;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yLYMgNaC/DxYpRxmxhNPimWsxJ5Ml953nRefpJZ2XQA=;
 b=SzoRrfnrVtVwAwGSbdPbosn6oJBH7+vi2olijoB5Qi7yNxtXcrUsHPwS
 XoWmOFPiZNxDQw1gi39UDNxyTC0bAeS9ADagphT2a75OhwZHkgtIJAFMz
 cx37eJiIesumneBJpB1hoaCEcTQ6BIt0Fq3WAu8UnQN2EHn5yq87a3Spy
 yoX5ovAn1paVOo6IlOeZnHtw99AeoxI/9EEpUvV4/bu2p0mdERKzjRG5M
 cdfSQW9SoAbbAF0VSj0eAJZ029V8JBLTv6z4I2axoah7Szq3Cm5LYKf9q
 Y/7sjjDeFjGwEO02rzGOvognY297tIozmtU5IU6dNducMNAfavtpiLu3J Q==;
X-CSE-ConnectionGUID: lS8oMIPqS4eckwvrls9fyw==
X-CSE-MsgGUID: IFFMaNl6RFSQP4/2az3qZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67214618"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67214618"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 03:45:02 -0800
X-CSE-ConnectionGUID: ruxiYh20THS1px25d0pOvA==
X-CSE-MsgGUID: vIx1b3DTTEuh/cUrsfi4Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195933488"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 03:45:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 03:45:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 03:45:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 03:45:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exhV+sTfCQSpGXUpEtNJ+1YG5MDSZ59x3wFmbezewTv/0DzvWeO/eQAihoiuoMa1ZzgVpaUwVLJlBE50sb7JWqniuZgeFq/6rcrjeXiVfEXIDSnN/mogdx8pWJDElkZrNEq9F6DIXIlq6KRpNQSf7PzgaTRyz/WQlBaDuzyXfpGNF70ExHmfjPry0C11QXIcN2cZoWMU64qlgS3DZJKROkwcbnldQ6qbO6dtV+nNcKJkwsRBcOF81kOXyaMDtTJb8IHRQcomJwBrBuUAKzquuAF97IcVGXcxsvXDD+n767F0j7tApLZaIPXJwqhn3p0MKkZFI4oBj+xOcfPzlAXU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U5RGUO8BILOsp5yJrdqnfZnLhEhsjFDx0OfqeFekBg=;
 b=JiIgXcbQNNXLBEGjMeBxVHGQh7s2XvJC0Nf51R0VO7vGeHztVuOdE+TdZxFCHd9ArWUpYJHdJZKwiwhqG4QjBABKQYKNKlClpH1limIBlqQosCpRX9CYy5sXf0Vz3MjUJ89CnCPVncGdskwtCebPrNZ3qsUd6NFSHRNZwSNhHMNHC2+GSgakGNq2tc5hY56bKGilWx4SWs6EYW6Syc1Vs+XyNmFF+L2Pr/OZO31bK0Xzx6+iL8uahqMv83HbsJ62GwC9/LRqcGWDIQQk9ckzrCL+5Mbmojm61LynO79ssXaj7KPZ72cYTTkDGJVLsbYU+ts+ggzSVBRgm+mEW/ogsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 11:44:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 11:44:57 +0000
Message-ID: <1be8f3aa-3276-4da8-8620-607d20b0a3db@intel.com>
Date: Mon, 8 Dec 2025 17:14:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Blocklist kms_colorop tests on i915/xe
 due to missing writeback support
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <chaitanya.kumar.borrah@intel.com>
References: <20251208113243.1242127-1-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251208113243.1242127-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3362ba-644b-46d4-9b58-08de364f3660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjBDVXRJT1IxWEhDT2ZNUlpMcHZHODVLbU05ZjJCZm52Y3Y3TktmS0ZxZXRn?=
 =?utf-8?B?RHNWRzloSFh5bS9vK3VWZzlVU05ZM2lvZFBEcDlqSk8wWGJhN01SWDVBai9a?=
 =?utf-8?B?c3liVjJsL3ZiMW9oZ2hnL0M1TityY0tvSHhFb1R2R2ppcW1jOTQ1am1SZEdZ?=
 =?utf-8?B?SWlyNy80SldYZmZiVEtqVEpvNU9UR2NEVU5kUEJybHZGemo1ODBQdVM4TGdr?=
 =?utf-8?B?WHFtSTZOT25ZL0F5VFNwRFhxZGV5djZnNmI1b25nNHpSMGx2ZXlmZmx5Umxt?=
 =?utf-8?B?NldkNE1Gd0FDb0RtcENlZDVER1ZZeld1NVB5NzRHRFl5ejNsUlE1NTZDR3R5?=
 =?utf-8?B?c3A5eEtHbHFqcEdBSzVyUk56SUxJNUh5V3ZQVmxoOW9ZVkNoNE5oUzZabjQv?=
 =?utf-8?B?NE50QThZNkZRUG01RmJMTWhwYVlyZG5kMDJMait3dEt1NEkwWmQ4UmNRc05B?=
 =?utf-8?B?dDhhMS9QWHJLaytvamRrNFYvelUrcmcwQzVkQ0NSSlRQeHBxRnY2M04yMTE4?=
 =?utf-8?B?anlOVGVXWUtzS3NCZmFDUyt5Unl0WHRGbjJUZVFZTWFLQU1JT1U5dWZDdGpE?=
 =?utf-8?B?OUlnbkpSdFJCVkY2TTNrOG9kR1pCbnErWVdLT2I1QkVPQW1lbkY5cW5GY2gx?=
 =?utf-8?B?dmdCQjM1R0doZW5yNldNbFd4RFYwTkVCOVBkRjRvSXRWRGxBblFQcTVSbmJ3?=
 =?utf-8?B?ei9EbVNQREhaVDd6WExkSnBBaVpFQUV2eDlhMXAwbFFHV0RKTFJheUhOR1FH?=
 =?utf-8?B?Y2c1TCtwcFlxZnlNcWtpZGoyM2xhVDB1eFdINEt2Wm5HeDFXQmZzcmMrT3Nw?=
 =?utf-8?B?YlV6c2V4MmZDajdPcmRKVk9TdmtVdEkzcnZjbVR1WmFRVVJYQlp5RnFJV2FV?=
 =?utf-8?B?bmtFK3JKMGhtVFZWR25KUE9nZldBMTFqY3ZaVlMzVGQwVnpZUVdLc1J0RjRv?=
 =?utf-8?B?T2UyTmZPS2pjUjYwUWlpd2pGZlpRQkkyUzFZckF2bjdYa3d1ZTdmL2RDRFJz?=
 =?utf-8?B?YS9pOUoyTXd4ZGNTYXlmZzIvOVFEcmZCUk1MYTJpZElIT25STnhHZHJtNlA2?=
 =?utf-8?B?NFFONExZbXEzNlJZcXM4VGdINHphaEExc05iQm0ycndLM0xsbDFYY21XVWNY?=
 =?utf-8?B?ZC9UTWxSdVR6c2dYU0h1cVIvRUdPWWZVdW4zMXg2Z3JMekMvMmVoVkRiQmdr?=
 =?utf-8?B?aVlLNUo4UFJVSkpLelZVR3h3R092aHRtbCtsNEpsbHBGanZSM0djV1Znc2dn?=
 =?utf-8?B?Um5aU1c2bmNSVUk2RE1QeGlmd0NCdGpYL2pDWUkvZmE2T3ZMWWZhMHVZRytp?=
 =?utf-8?B?dEkyWE9QNXNMckk2aWpLZ3duNlhtZDkvZGpwUGR5SDR3cFRTNzF6ZFJlUmhm?=
 =?utf-8?B?RlI1SWtLMERWVFkxTC9UcWpWK0tUMzg1blB1elpoc3ZQWTRRYkgvNFQ2SXh4?=
 =?utf-8?B?a2xDZFYzSzB2NnBqVldxU1pLN3d5RzZxc3ZMeFVQVjR0WFNIdlR4K2UwYnEy?=
 =?utf-8?B?dXVxS0xvK0Z4blhiVlZYcnBUdTJDMDdQWVZLQnFxcE44OU4zVmVrZHVkR0cy?=
 =?utf-8?B?RUxqeTh0Q0lRb3BaY2xadmRiU2IxS0V4KzhrREQ4TWcxRVlrcFhsbmpiVkRw?=
 =?utf-8?B?R08xa3NQR1VtOU1kWExzb3ZCSGt3Y2RxOGhKR0VCTmlHWTBVRm5uRjdKM2dR?=
 =?utf-8?B?aSt1emorWnowQ01iZnRENTdnUUNwc1VCSC9LSW5zME1RUGdQaGlPdFRkU1VW?=
 =?utf-8?B?VEVxbnFic29QRk9OdTNOVGNTMXdCS0dVa3hEeHNCdTlCRFBpaFJ6Z1R1ZDlS?=
 =?utf-8?B?RmM0d0tDd3dkZS8rV1JwZHl2SmFvUDhPVFR6V1NVTlBSZ3RKMGprOUlWZ3c2?=
 =?utf-8?B?Y3MrOE1VdFVpeVJvMFo1enhDeXVnU0VQdHZxU1M1VGh3SXlpS1FxZWZOdWF1?=
 =?utf-8?Q?gNu8pX4AtfdYCV8/KidDwy6yBbSR9bWF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHZGT1hYUXovYWZGYUVVSmQrQzRnUDVtMXVITVE5d2lubW9SRGpmQTJOWjY1?=
 =?utf-8?B?VHIyZy82a1ZlYUQrMjNYUkRWQnhzdjZPYXliTlFQdWNZNDgzdmM2MjdKajI0?=
 =?utf-8?B?VUNQT3ZSSWF6QjI1cUpxOWxZenpCYU9xa1p0Z3JHNkhZVmxPLzYwc1Z3am81?=
 =?utf-8?B?UlF5MUsxclVlM3kxVGdxSVJONGdMVTNlZ0lPdW5pVmVOS0ZIdW9Odzhrc1di?=
 =?utf-8?B?NUQ2ZklmdDhpZDhuMTVtQ3pYLzlua2drblNvMzUzTDBBN09Jd29mbjl1ZWQr?=
 =?utf-8?B?Z2h1T2tFWDBZRjNPbTgxYVFhL2FNajBFNWxxWnZVWXFZUHlSaFVLbEVPZUlX?=
 =?utf-8?B?eXlVdVowSkhUangzd0MrdHBoZ0ZqalZCa01oa2tPWnlzY1JxOFU1YjIyQ1Jz?=
 =?utf-8?B?cjJYT3pEeVNkcHkwTjZ1QUQ5ZGxqUDJFd3Z5UCtPZXc4OUJHN3hyVnVOVUp6?=
 =?utf-8?B?dFFKaGxYOVE4bVp6TkFHV2JsQ21oRy9lWlExRWd3eVU1RUNCamtIMXlsZHEz?=
 =?utf-8?B?a0NjdVJVdFlmRWYwQWxtMDFTTzlQMjY1YW5IdnpucUJLV09ac0grYzgralR2?=
 =?utf-8?B?eEJwSHZFRnpFajFiWFphRE5TSmkwZkt6ZjZGd1hUNEdxUWpMZ3MrZHI1YjJ2?=
 =?utf-8?B?VEVvSTBaMzlUL2p5RXFnYWhUUVZsMk5BM1dndWRBM3pXQ0Vjb2d6TTNYWmtK?=
 =?utf-8?B?ckNBdXMxV2VSV3p5Ly9oLzFGQTFwNytMODJ4cktNdkNlWjZPcEExTjRzMDJB?=
 =?utf-8?B?L2tFQjFxUjdzU3ZtWXRjWmp2QkRiVkJlY1BXbjl0WmcvbE1DaEMxeEtWUTMw?=
 =?utf-8?B?S0lmNi9JTG5BZVFKb1dSOGs4VHFocEJlNkZkMGgvYXVTanlWaHlmS2lnV2x3?=
 =?utf-8?B?bnU5SDBiT2NVeE1qdkIzQnplRHhPeUZCbTFsaTVZYnF1bDFqTUk5cVJreUox?=
 =?utf-8?B?T0pWN2ZNUDY5T1JCWjYrdGQ5VjJFQmE4NHN2WWNFekRMbmI5NUFyN01zZUZr?=
 =?utf-8?B?V3lXcmwyVVdnNjhiVzQ4S1FVUlNrOXhsNjdtZzdjam41OFlOSkFMdTVCQmlh?=
 =?utf-8?B?VE5JUXhUd1psMnlMZTJ0T1JHU1M0cWQ0RjdmUE1zTVBsWUtOOFFlM3NyK3FH?=
 =?utf-8?B?OXhZY0Z5bnRFOTVHNVAxYWFEcEV0ZnVnbVE2ZDY5UURjSGNBV3U1LzQ5U0VI?=
 =?utf-8?B?d0w2WnFlS1hMeURPS05mWnhqT1FDVmdCVE5GT09BMjdxd094R1E4SHNDRU81?=
 =?utf-8?B?bytIdi96NFROWjgyWEx1NXZVdHFBQ2IrejFmN241Si8vVmloS1NmREM3MERI?=
 =?utf-8?B?WHZ0L25rSjQxQ0ZBcEpVSWFXdG9aZUZjMWM1WEVRQ2FlNmd3Zk4zR2VEeWFY?=
 =?utf-8?B?NTZ0UnJxZjEwM2gvbllBMUZOcXNYcjVmRTN2S2REWEllcnc4aithTTJhV2Vm?=
 =?utf-8?B?NTQxQ1V6OFg3VDhyRmxQZlNtSkRTZVU4VlhuRnVJTDIwQVpNVEMvMWxjanBK?=
 =?utf-8?B?d2ZzMFNKR1d3Sng5TkxYNkRQRW85QTVndndmNFJ0Z0N0OVZhdjFDRUNMRHVD?=
 =?utf-8?B?T0RNVFAzcU9pZkJQbTd0R0w3bW9VWkkxMnVkVGtiejloVTIyTjYvMThTOUNW?=
 =?utf-8?B?ZmRWSmowVkxNdDBzV29qVVYvQ1BIeXNjM1p6cFIyakwzUmRqUlpsMXN3ZWU5?=
 =?utf-8?B?RUs3c3dBdHNqUzhkSWJLTEUzWU11eWcwMm81Z3VCMTRYckh3ZzRSUHdPZ0xh?=
 =?utf-8?B?cjRLd0VTN25lQk9qT3cyazFCNmtlWHFwZ0JsK0hGNHNTdkJSOFc5dlJ2citO?=
 =?utf-8?B?aG5nTHJyRklTWDE5SzlPSHcwVndTSnNBb3FkUHNzWFZPUWp6b29MZU5MZVE4?=
 =?utf-8?B?YXJsNm9uUjV5TzdDY0o0Y1hpNjlIU2d4c3BEdFBTQ0lZN3RURFRGaEo1N2Q5?=
 =?utf-8?B?T2h6Ti8xcitSVEFJTnRmT2xoc2pOT0NBbnFnTktGeVovZ29zaUFpSzFTL3gy?=
 =?utf-8?B?R0xjQW1wYlgrRGRpMUJiM21kd1NuTmplR3U5L3dWalZXdXRkZDN5OGRyR2t6?=
 =?utf-8?B?SitNbFpzTlBjcEJhRHN1dno5YndkMC9HTGJodEJtUW9FNkQ3TFh6QnNKUndx?=
 =?utf-8?B?c2NJMUNwakszaktpT1F6KzF4K1grbHFvVk1DanpJUUMzeDdlTlVxWGpPZDUx?=
 =?utf-8?Q?MKtDvSf9mazg2XujtYfwHJk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3362ba-644b-46d4-9b58-08de364f3660
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 11:44:57.8862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Gb74/VWtxVptcyzqJQPRix1DE5Au8gMpPXt+x5ILQkwMuslpg+1gqqVr18e9HycNaVczQc5Gi1EtyxSh3B3QjxRtOvIqCmu9SiRlyH9mio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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



On 12/8/2025 5:02 PM, Swati Sharma wrote:
> Colorop tests rely on KMS writeback functionality, which is not yet supported
> on i915/xe. Add the relevant kms_colorop entries to the blocklists alongside
> existing writeback exclusions.

Acked-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt | 6 ++++++
>   tests/intel-ci/xe.blocklist.txt   | 1 +
>   2 files changed, 7 insertions(+)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 96d69ca79..dffe464dc 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -192,3 +192,9 @@ igt@kms_sysfs_edid_timing
>   # boards (which support 4K @ 60Hz) are available in the test environment.
>   ##################################################################
>   igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +##################################################################
> +# KMS: Yet to add/missing i915 support
> +##################################################################
> +igt@kms_writeback@writeback.*
> +igt@kms_colorop@.*
> +##################################################################
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 63f969416..bd08aa594 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -89,6 +89,7 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
>   igt@kms_prime@.*
>   igt@kms_scaling_modes@scaling-mode-none
>   igt@kms_writeback@writeback.*
> +igt@kms_colorop@.*
>   ##################################################################
>   # KMS: Test was written with the idea that edid read shouldn't take an
>   # unreasonable amount of time. The timeout is an arbitrary value

