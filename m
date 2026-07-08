Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992BBC44501
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 08:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310C10F060;
	Wed,  8 Jul 2026 08:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cf3sjSJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1813210F054
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783499890; x=1815035890;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mYyowz/PyWqOPsQFNkLQ1L8sPMfylD7c2UzMov7WeuI=;
 b=Cf3sjSJXxyjO0WBr7vQibiK/n5r/A0ykN1iJoyF3nBPtZZfbvI6/t6Z9
 XTUEj3MZpLTx6WtJBgQiJIyfHhiqrqG/H7KQCXZ+jrWyRfydLyEWrQ09/
 EqNiO82EQyt+9+rxBYHjWiXeX9/bPWco+DwgG1Cs28ZjV6CGJXv5A3TV7
 VZk+qXx+KLYWAlG9O86GZXG/AAK1HggLX/A6JnjHKx+JbkhfjWv1J4dkb
 xi9/dSvuiUvkwtOV4T/PV++S04dcAeuHVogq0b3yqBjcjXzhuLGV32VkG
 0HWMaUqX6DFRPgNxisKoojMz0QeGWogPy128Z88Py2HpSRyDx7BCujETT Q==;
X-CSE-ConnectionGUID: V1UVXYKETbeLpyEvIPgJdA==
X-CSE-MsgGUID: bw1pPryiS/iUQaT07E3NbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94800328"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94800328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:38:09 -0700
X-CSE-ConnectionGUID: N6exiKjtRiqN2uw+BwaXtg==
X-CSE-MsgGUID: Kl25neKDRd6QWMgTKgsUfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="292416200"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 01:38:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:38:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 01:38:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtfQW9TLKq5lpxlO5MovVsyZLYw3/d9ivR9boAdndqztGzQC21LiE1Y6SqIczUuI3Db4h2Kkg+bH21WIR50sz2rdOiBhdiNCUzXj7R5nMDFPM4q8oOdjsBbQYcjLg2jMvUDeqdsvXT5XJrD4BZZgj701uGkWPIPcdGrw3HZb0y3XbPRYBE5q3nPY+Dsw+FFzf+lLMQ88Mt2fhG2so3A1vWB0a2oTjeanrNHR9GK/8TwBukwyYlVUOMd0lWy+I32p0jSus+xfAJpvX3Casicg6mcjz4oJEf5aVf9IWDWkBI6+hhxNjweu1bsF3QDZ/jTKmdvTCsFEpI78AUJ+xEFzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRLhcomNOpruyohNrG1uaqth6aPjLUjXXd01BdBjX9c=;
 b=cbqXt9uOs9/LTeYHmDY6i2dIhdCkrS78gGQRxqGiY2ZpI+lvTUpG2kFSR2vPbjIceEYBPyPyymFt2Ez7XV8N2fTSJ2MVMMgycvOGQn6PyWgY14YRuO39pJ8FHu/HocMzwQe9TVTWtAUa19o9E+2blUtCAAj/WFJTPd8RwbHNka3n0+lckpK1iUpGh3ZMS4UkllSUdbVUdWpH/0RUoTEd1duw5diD//R0QpFoU5xqse8JzjtGRBTs1QYE0cLWLhzigSEWTGrda5/uQ42wtzHgsZChlZWATc58fk6hmx+5sRySD/ItmAkwUwwwdFwnqNIkXrF6/dBKXgEVfIFSwyK3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Wed, 8 Jul
 2026 08:38:00 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 08:38:00 +0000
Message-ID: <b74ee4cf-0e49-4e34-b641-237c7e10e2fa@intel.com>
Date: Wed, 8 Jul 2026 14:07:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/kms_pipe_stress: fix plane
 source crop and separate cursor loop
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20260706065019.416906-1-sowmiya.s@intel.com>
 <20260706065019.416906-3-sowmiya.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260706065019.416906-3-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::12) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 3127a7af-8867-4460-dbcd-08dedccc37d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|3023799007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: lKOT2D5pVI0TVOt0jbtJ1WcpOIQ1yHgPn3Jl568iIVmG16WsE0kk939YLBZjFMVl6qliW4a1Dqw2dIuysRoPsvrtYIfvP+7E2C5OnO/atFSkI4peU0DfBT1LU3c8b9/7TFBulwbJRDcVs9jTv+hrT7qVZ774kKy62k4LWc6EUvY6JdM15gnVsDv6WR/OWwJ3aGJnoPoLmcaHpj3LUmS50vvkmI4J2agKMsmLzy9CdP6JT6uWdyxcPDBZk6EcwHkzgiiEZdl2BD19S2///KhrpzWqBepSTqY+w7QiyMgTfF96jG+3zRuuhCHyeyIEyjeVlJxpvuq1PVgkNkCenhFy3aGNhftlSTX+dFdwZsZQ/WJdt4t/yuoWXEXCbRrdzVorjXenNJ4q85YORR1xSRYDmF3CSTCP/XqK/cYPN/wV7xdttgXeg45+8qvvH5HnH9O2Og1VNUGs+4hkm0Ti5Buz6Rlq6X/vohLfefKAv6AWursAUGCOluD2ONhKjJspBAsIZrLFLagSxu48XSavUyETGa4Wba22Cv6GwnmuFv5+10RqKBscH4tyuNc/3bwyEMzHjtk/lvi1P29tUili2Zq/0qqu+XeIbXyf5CoJYd9eRXjYTz82HDGvo+/4AC7tx6u5cu8LINkZgOuBrhE3urIbJBpjS8jDrxoXmLzA6ffrE8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkpQN3dBNTg5NTZPajFsenJROWRkay9lMnJWNGMvYkdZRWlQU2tyTkNKVnZt?=
 =?utf-8?B?WHJJTjIveGFtcEZwbE5CQWZyTDlKYk9hWTg5Wm5WMU0rZEwvSkZFdnZ2c0pN?=
 =?utf-8?B?MExyRk53a2poaWJZT1hFR0swUk9ONXJ2TmlRdmp1bEw0d0VrMS9xV3lvUklJ?=
 =?utf-8?B?OWZSbmJBQ1dSbnNnWVlKcldBQURmbDNIYmZRVXU5enRmUjU2WDdxRVhoSFNW?=
 =?utf-8?B?VkE3RktwamJ0MDlvL0YrRDZRSENLNWptOGREQ0dwUVFBMFF5Qjc3Q2MxLy9h?=
 =?utf-8?B?aGtENzZqd0dsTHhwZ3JPNmJzczhJRFV2OUl3TVAxcTdBbG45SlgrbTdtdS94?=
 =?utf-8?B?L2V6MmRNQys2dGJvRjNMVnVPNFo3c0dvcllBQjdHNGc3bTZxU2YyNDQvRlND?=
 =?utf-8?B?MTdMT1Vzd3ZTWWZOUTQ4VmcrYXllRm1OY21jcHIyY05ka2VVSDhwK2UzNWNs?=
 =?utf-8?B?czI2U3hKdEZDLytwQ0hGZWFQZjNtVVB4Z0xDV0RzY1NlR1ppZERjdnVMcjR1?=
 =?utf-8?B?ejMvTHZtS3NkbjdMT2hCUzluVGlhcTBoU0JjR2hzc0E2cW9FVDRaRExZUGxX?=
 =?utf-8?B?ZU9EcmVYSEw3L2ErdnJTOUVDd25DVTRYQWZSZWdVeVV1R1RaSGNzdGRDemNG?=
 =?utf-8?B?cC93U2pBUjljNmVlaUJrUnpta3p2N3hTTm1hME9sZ2ZrU1lYQTE5eC82cUg0?=
 =?utf-8?B?TGJGb1grZGtmVXpoTUQrWFpNMTBmWDc2R0N4LzFUNmk2dGhtRThRMFl6VUhw?=
 =?utf-8?B?dXhDak82ZzUxNGhZd3ZRWkhFTW9UR2VHWFdIaVNxZjVoTFdFMWlMU3l5UVNy?=
 =?utf-8?B?OG5nbjB2Z1ZSRWhKbVBDNnBoSXJZN2Z5dFgvekJmMjhKeUZKb3J4TWJmVjNa?=
 =?utf-8?B?TnRXcmliajU2U0V5SlJkeVFjZzhKU0tFZWhmVWpqVFVjeUZoZHZJb3pScnRN?=
 =?utf-8?B?TjFBcmN2SVhTZjRIL2cvV1B0dVY2YjNiTjJLeCtDWWdGVDlVTDF0RTZSRFJi?=
 =?utf-8?B?bnl2MmZ5Vkx4Qy84OHloRHRxWFEzZ2xiR052azBBV09GcVJHVGZiM0tkYVlw?=
 =?utf-8?B?cWwxNDF0YTcya2o5ZUVzRFRyMUhPUXJFYnFEem1EN1h5SENIL3VNMzJoa2Jq?=
 =?utf-8?B?N3dKd2VaQ3B6ZG5NNmxaUEFGSlk0WVR4VkRFcXh4Z0syRzlLQXpLVkpXTGhJ?=
 =?utf-8?B?dXBtU2RsNlhtM3RBdWE1emNlbHZ2WkxBMDNYYkt5YXJHZTNGUlkrUSs0bTF6?=
 =?utf-8?B?cDE2K1oxcDA2TzRRYVQrOFloOGsxaC9ITVM2djJxTDVRMVRHbUhHOFNvUVB2?=
 =?utf-8?B?eDJvRU9vdHA3ZmwwNDlJd1JOYTcwTTVpRmp0U2JuaEtHUzlxbGd3NWFMcXlX?=
 =?utf-8?B?NXp0SE1uN1J1N01XSndoalI4YUpCdGJTTkNLV2pEUE9YNG5RTUlxYUxCcVpU?=
 =?utf-8?B?M0FCdVR3TFRlc3V3ZVp1a05rYUUxbjVSMGNmTzI5Z1E0WTZ0QzhXU1VRY2wx?=
 =?utf-8?B?Ym1HdVpnNEVCTXYrNTdYQUJTY2VoTGsraXBpTEk1N3ZjT3RPcXl4ZG0rVlMv?=
 =?utf-8?B?c3lzVUdrdUpBY1NlTDNIZmdFQkFOSHBRTXE0WFZjemI0NmlIZ0hQSUdvZVdN?=
 =?utf-8?B?Qk5GUGM2SWVLL2Q3aEdpT1UzTFRrVGZlOUM1dzd0SXdPa1lmdFl4SjkrTlRq?=
 =?utf-8?B?UjQ0OHpNWUxlMFE3WC9WMnNaNEpUZ2FBbUQ5MS8vL2VZN1F4bzV0bFU4cDc1?=
 =?utf-8?B?Wm51bkUrN0k1WnhWK0poOGVHSG91UExyMUZ6bldKeVp5ZXQ1a2lBa3VZWWNy?=
 =?utf-8?B?c2xEeG94bm5ESCtxaFczUWEwTFI4T0lkZWc1RHR0OVN2Z3NwSU9GRDJxV2px?=
 =?utf-8?B?b0doUG5HUFNuYTZPM1NKUEIrNnQrK1ZVM0wvUkRnMHczWTI4R2VjbmZPcVhh?=
 =?utf-8?B?V0l6c0JoU2k5aEpBdlNDS2VHbWhYUk1KdUpyOXhIYUdtbDNHcU11MUo2UVBO?=
 =?utf-8?B?TVhJL0xuekdDVnJhYmZoYXJyWStuZ1pra0YvM3A3elNLWXFwNFpIL0VCczZ1?=
 =?utf-8?B?ajBFeFlEcU9XYWdsZVFFdEh5aGN1TUNrcmwzYVdYaXh2QnRXNFphUVZZQ1Ry?=
 =?utf-8?B?NGlkRk1PYlM2WWF3STlNczluVi9mcGV4UHAzcHA3aDdmTzBTQTFYTDliWHBV?=
 =?utf-8?B?Mkw5a3RYdXVTM0dsL0xSMW1iSWU1aW45bHBkSXBacVk1Z3ZGRmVYVmVHV0Y5?=
 =?utf-8?B?K3pDS1JTakh3Mk1Zdm5wU3lxK1doTm9zSlROMUhybHd2Y0F6VlNoWklSZFR2?=
 =?utf-8?B?MTgvTmJUQ3krdWVTMG1RcEg2S3ZuOW5KMVRtRTF1RWY1VXBzQ2RrSXJ0RDZM?=
 =?utf-8?Q?LrUwX+9vGVICPctY=3D?=
X-Exchange-RoutingPolicyChecked: OFYETzl3Pesc5NWSPDIfUXeb1v7WD8RDLTheIX+7IK0T0+lZcP34dDtj9pzBTh548g9E0Y5v0zG3rgvYmsMomKxwK938sx+mgL4sKiN7Sgd6buGVHDCf66YQ2bkUI9gAc15vEU7l/AO9mBORx3EWUC+s+VtDHFTzAXUCU4WqM2tTGq4pCXW2NKeLb0VpDSLm7/IsV8a7nHDKosohnUItTpmQpANdfEzx2jwMhcvlkrClipnh20GywmX2EN7uDZugvO+QS1py1G0qtPPTeVBboWIxzDniGNEZVWLOw453V8oEo+ZtP4+ePDutYKisO++gTBKRLKb21d42gvBPLCnKdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3127a7af-8867-4460-dbcd-08dedccc37d4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:38:00.5251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6CdZy8nLCSnJVOLFIwQt7fBB38lEht8mAigaadkATjArAP1t7/5Ce6H7wsNunaMvBDlyUv1xjBsQDjU5ioxiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
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

Hi Sowmiya

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 06-07-2026 12:20 pm, Sowmiya S wrote:
> Pass 3/4 destination size as initial source crop to
> universal_plane_set_fb() to avoid an immediate
> downscale. Keep source in sync with igt_fb_set_size()
> in the reduction loop so the downscale ratio never
> exceeds the hardware limit (~3x).
>
> Move cursor handling out of the overlay loop into a
> dedicated second for_each_plane_on_crtc loop with a
> DRM_MODE_ATOMIC_TEST_ONLY commit. If the test commit
> rejects the cursor (e.g. unsupported format or modifier),
> disable it gracefully so the final commit with only overlay
> planes can succeed.
>
> v3: Rebase to latest (Swati)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_pipe_stress.c | 110 +++++++++++++++++++++-------------
>   1 file changed, 68 insertions(+), 42 deletions(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 8724a674c..a84433b9d 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -425,57 +425,83 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>   	if (!data->num_planes[crtc->pipe] || !new_mode)
>   		return 0;
>   
> -	for_each_plane_on_crtc(crtc,
> -			       plane) {
> +	/* Set up overlay/primary planes up to the configured limit. */
> +	for_each_plane_on_crtc(crtc, plane) {
>   		int plane_width, plane_height;
> -		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> -			cursor_plane_set_fb(plane,
> -					    &data->cursor_fb[crtc->pipe],
> -					    cursor_width, cursor_height);
> -			plane_width = cursor_width;
> -			plane_height = cursor_height;
> -		} else {
> -			universal_plane_set_fb(plane,
> -					       &data->fb[crtc->pipe * MAX_PLANES + i],
> -					       mode->hdisplay, mode->vdisplay);
>   
> -			plane_width = (mode->hdisplay * 3) / 4;
> -			plane_height = (mode->vdisplay * 3) / 4;
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR)
> +			continue;
>   
> -			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +		plane_width = (mode->hdisplay * 3) / 4;
> +		plane_height = (mode->vdisplay * 3) / 4;
>   
> -			while (ret) {
> -				if (plane_width <= cursor_width || plane_height <= cursor_height)
> -					break;
> +		/*
> +		 * Set the source crop to match the initial destination
> +		 * size (no upscaling).  Keeping source == destination
> +		 * prevents the downscale ratio from exceeding the
> +		 * hardware limit (~3×) when the destination is halved
> +		 * in the reduction loop below.
> +		 */
> +		universal_plane_set_fb(plane,
> +				       &data->fb[crtc->pipe * MAX_PLANES + i],
> +				       plane_width, plane_height);
>   
> -				plane_width /= 2;
> -				plane_height /= 2;
> +		ret = try_plane_scaling(data, plane, plane_width, plane_height);
>   
> -				ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +		while (ret) {
> +			if (plane_width <= cursor_width || plane_height <= cursor_height)
> +				break;
>   
> -				igt_info("Reduced plane %d size to %dx%d\n",
> -					 plane->index, plane_width, plane_height);
> -			}
> -			if (ret) {
> -				igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> -					 crtc->pipe);
> -				data->num_planes[crtc->pipe] = i;
> -				igt_info("Max num planes for pipe %d set to %d\n",
> -					 crtc->pipe, i);
> -				/*
> -				 * We have now determined max amount of full sized planes, we will just
> -				 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> -				 * Don't destroy cursor_fb as will take care about it at the end.
> -				 */
> +			plane_width /= 2;
> +			plane_height /= 2;
> +
> +			/* Keep source crop in sync with the reduced destination. */
> +			igt_fb_set_size(&data->fb[crtc->pipe * MAX_PLANES + i],
> +					plane, plane_width, plane_height);
> +
> +			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> +
> +			igt_info("Reduced plane %d size to %dx%d\n",
> +				 plane->index, plane_width, plane_height);
> +		}
> +		if (ret) {
> +			igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> +				 crtc->pipe);
> +			data->num_planes[crtc->pipe] = i;
> +			igt_info("Max num planes for pipe %d set to %d\n",
> +				 crtc->pipe, i);
> +			/*
> +			 * We have now determined max amount of full sized planes, we will just
> +			 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> +			 * Don't destroy cursor_fb as will take care about it at the end.
> +			 */
> +			igt_plane_set_fb(plane, NULL);
> +			cleanup_plane_fbs(data, crtc, i, MAX_PLANES);
> +		}
> +
> +		if (++i >= data->num_planes[crtc->pipe])
> +			break;
> +	}
> +
> +	/*
> +	 * Always attempt to enable the cursor plane.  First validate it with
> +	 * a TEST_ONLY commit: some format/modifier combinations (e.g.
> +	 * XRGB8888, 4-tiled) are not accepted by the cursor hardware.
> +	 * If the test commit rejects the cursor, gracefully disable it so
> +	 * the final actual commit with only overlay planes can succeed.
> +	 */
> +	for_each_plane_on_crtc(crtc, plane) {
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
> +			cursor_plane_set_fb(plane,
> +					    &data->cursor_fb[crtc->pipe],
> +					    cursor_width, cursor_height);
> +			if (igt_display_try_commit_atomic(&data->display,
> +							  DRM_MODE_ATOMIC_TEST_ONLY |
> +							  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL)) {
>   				igt_plane_set_fb(plane, NULL);
> -				cleanup_plane_fbs(data,
> -						  crtc,
> -						  i,
> -						  MAX_PLANES);
> +				igt_info("Cursor fb not supported by hw (format/modifier), disabling\n");
>   			}
> -
> -			if (++i >= data->num_planes[crtc->pipe])
> -				break;
> +			break;
>   		}
>   	}
>   
