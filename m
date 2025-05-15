Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF38C2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 09:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A710E1D3;
	Thu, 15 May 2025 09:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQ8BPwxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8C10E1D3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747301958; x=1778837958;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=1I+m7l+MP7uO/iUx7BWzUbu1KOdZ1WOfgfR4CcNJp38=;
 b=AQ8BPwxW3ItVryY3zsI21ifJfZhlTi8Mvg9tmTQYE+Xql3On+fgwCkn1
 MfhkbZdpmcAj5D4aZ6HLnDEvWBipimojNEaicPcHdFa/TOZaX/XY+Q2iH
 mO45csGvDrv/QrLyw+OyASQlz6zu+CWqRHcbSxr31XQ612THAjUbsPPB3
 lKz1CnBgDLu5maGumYsCrhHSRr18sZ3zGxwS+DBk1ez3p4kjX/L+aPY0D
 nJP8eeaGr0835kIjJBrB/RgyW8NLPvWkakbmkIJ3+76tSAjTdRrlS8Oa2
 jyNKIFCn+m960jKLO0fMpEw3ZtcWlHFKpKFuCjK+3Ke1EoOUgQD24Oebc Q==;
X-CSE-ConnectionGUID: +XK+xDyDS3alsSoSZGxI2g==
X-CSE-MsgGUID: PkHNzivWSCi/GgKNzwpfHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="53031163"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208,217";a="53031163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:39:18 -0700
X-CSE-ConnectionGUID: 1ZLOCXfRQtKnS3Xd/Amb4Q==
X-CSE-MsgGUID: GmfQWl6eRuaDOzEacIm0zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
 d="scan'208,217";a="143273150"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:39:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 02:39:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 02:39:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 02:39:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwgue2bS0uov6R19A19uDLfYl69ctoMssvNKAWwstUEv+A2pZThgKisp3JOvnaSPAzO4qOOfOev4FYqksVirkg9iAkoAKzv5Dsj63m7BLgIbMDh5/99g5w0NeBVQ42SglqrCq+L3Q/Fu6k7lgdj801Uow+zyZleo3ramNKBF1QcT2bToP4hLSHvqgsE35wHv6dq0wp9eMWlIBqa3m1rdiXZ1OuZtGqP5zh/6HqA/t0gGBThM1XYo8AIOKk/NEVB/UVqU7x2xFhQSsGIpd1IMSLr8Q5FFSod/cSGdUzPekxLhOtbHAtXU3gllFm750AUOEjZKg0yJ4ZZ1Bd87xk6l0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ0bwiYvo0teImGLpZDUVADRKw6a+QcS1UonyHHF2GQ=;
 b=lqnKXsarW5CpF6l6vl5hSfE7bUMvDTDu5rBh42WQ+WJWUVBoq0DsDZ07YiN1kCxMiBv+bkGxl3VufXhM4/TG0NxTdBnYlBdawr2TgzofBGnjA/cZ4EoEXI0WLM5fbcCsnC6k2HZ//hOiHleRp2s7Wk2hMy8NM0eapTscYb9gZ2HSFHmIjBzbSxal8menJ/kdrMAVpZLXPE5eTi1Yxoey8pYZmd49Mtva7i9Ylh5quMHUuYA+ACVctRGoloHG1uwMr+nk3CsZ4kEgL1cyN49xvmgHf0bdCqa8LzxdSw2AWgZBnWjp8WXg71lyX62S7E39uHvXRkuRHt1ZALbD3gjv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 09:39:01 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 09:39:01 +0000
Content-Type: multipart/alternative;
 boundary="------------zk8oThm4eQQUgUcUnvRLRxGq"
Message-ID: <1cd6d012-3860-4b9b-b4ae-7984a296ff59@intel.com>
Date: Thu, 15 May 2025 11:38:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/1] tests/intel/xe_render_copy: Skip tests on PVC
To: <igt-dev@lists.freedesktop.org>
References: <20250513115252.9095-1-jan.sokolowski@intel.com>
 <imbnou2uahpw276ewjvighty2mz4x3p3bihrmlben4o4btsr52@izy5eroo52mf>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <imbnou2uahpw276ewjvighty2mz4x3p3bihrmlben4o4btsr52@izy5eroo52mf>
X-ClientProxiedBy: DUZPR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::10) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|DS4PPF10012BF96:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec7e02a-e4ce-4f1d-ffed-08dd939452ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFgzU0FPNjlZemxMTDFnNXRRSnlKTUtVMUFUUCtGaC9xYXhvY0hzZm9hSFdv?=
 =?utf-8?B?cWxSNVBMMFNXUXZSaTRvQ0FkTTA1VGNhRkY5Y0g1TjlmNXBzbHZlOHFERVo0?=
 =?utf-8?B?dHVLWWhLZWFEWktWV0VMc3Y0T2M1MG84eWhYNmxVV2lSSDFkamU3U3krSnRR?=
 =?utf-8?B?TEUxVVBiTUVDckkraGtLNW02cTU4WW1pL2xMZGkzbTJXSFJzN1NQK3RhSitC?=
 =?utf-8?B?S1pXSWRZVEx0dnVnV2ZpOGxFc2tHd0ZEVTMzL09ud0U5WDFOdkY4ZEVIMnZX?=
 =?utf-8?B?K3E3R0xJcXgxYVhHM3ozSVJtMHR3STN1M1M2SFdoZ0tNcG5Zb1pRSVlnTU1n?=
 =?utf-8?B?cFVzb2J5ekJwVzdnQk11ZXo3UmM4OCttd0tsdXQxMzRGdVp2SGcxSXowQzVo?=
 =?utf-8?B?bTZIay9kODAxNHpES0RSdXNiYTlXcUZDYUc5Q0Foa2NVWWRQRDU2cE8wcHlu?=
 =?utf-8?B?bUlwaHJ0dEJzd25VS25VRjFXay9WS3grbTBQUXh4cTJhVlVtQnpwM3A4bUl4?=
 =?utf-8?B?NVNlajRUNVI2Y3YvZEo3YjVxQkNrb3VoQStjMWZmYUExWEFCWG9DZy9Xa0NL?=
 =?utf-8?B?Nk5PQWdzR2NSUzhSdFA0UHBRaXJoTFdXQkQ3RHlDeG83K2NPRUJvbVRldm91?=
 =?utf-8?B?MGpZdXkyTEFQVTl1TkVCakFHdlhnUFRtY2NTZGx0bXliaUtJM2NBSndzcE4z?=
 =?utf-8?B?TE9KUnMvZ20zYmJodFdsa0RrbFJFUmxPRm9GY3pKcSsxdWJtRC9Ec3F6UVZC?=
 =?utf-8?B?K3JGUk9vK2pBalFyVU5uK09Ec2o2dk1IVEpqTUtQNU5tdTExd3hzM09RTlNT?=
 =?utf-8?B?VEIvTzAwQzl0Q1FaWXo4QTB4UkdCUHpYU0MyMDRiMXdpRGRIWDZzdmljcm5L?=
 =?utf-8?B?WkN4Yk41S0dIWCtwL01sZUtjTDAvY0c5cjNZNzQ0bzh3aG5Dc3ZObzFQcTFH?=
 =?utf-8?B?Zk5GY1VXZ1NLWTZaV2VqRnMrdm9ZSXUvME1rdWpYNUc3UXl0RlJDa3lyVWRl?=
 =?utf-8?B?bGFONGtzektLNnZXRzBBczQrQ0xac0gzR0pVTGNvNzhBTzRsWWsyRFdTZTUz?=
 =?utf-8?B?bHFPWE81NGw2ZU5QYi9KWTBpT2JaeElUQlR0VzYvemRsNEI4aUpjVzNUOFV4?=
 =?utf-8?B?bXhieEtCV2NRSXZ4VWJVNG91SjZLaVAxeEYwYXV0MVhkUW5UN2x2Q1JlQnJx?=
 =?utf-8?B?Wm1GRDVqeFBUSjBIejlteWpuSTQ2eVVqWHg4cUxZRDExYlJRejV4R3hFRGZS?=
 =?utf-8?B?SWtaMTJEMkd3d293T1FaY2VqeEhzQlpsSVhsbWt5WGlHNzlLT2wrNExpd0lx?=
 =?utf-8?B?bU1rZXl2QmxQa3k1cWgyZHhDQ0RmVk5yTG5tVUJPZGM3MWUwd1BTVUxoNHpp?=
 =?utf-8?B?c2E0M2YxYmR3TEVBMHdpWTNrLzE3UXhkRWlKYzdpY2NlRWxzVVYxNlpMVmsy?=
 =?utf-8?B?bHhWVWJFSGlTSitEN3dZRndHaXVoZEl0TUwvZS9vNVlxbXYza0MzS3RKbTVu?=
 =?utf-8?B?Q09BSHdVczQza2hvMFJBT1FtdUl0NVNwNy8xRVJNdWRKNWRNanJUL2RYYTg2?=
 =?utf-8?B?Y1JuTnFHT1NyUE82Y0Mra2Z1dFVONHZPazk1Ky95ODQvUHpuTFU0emdhZXpn?=
 =?utf-8?B?bm1HdTBFU0J6eTZYd1ptd09mRU5pR3ovdGswNXZPL3AzdTFpc2poTzhUV2U5?=
 =?utf-8?B?c1JoUmpHc0dVN1dDR29qYUpGK1ZINHpJRXNjVWhXRUxDeHNxWCtjUGYwamhE?=
 =?utf-8?B?dDFnbUoxbXR0Q04vczFNOTJOeWJ2L0dHTlZyc0piL0t2d2ZSWXF0KzNhRnZz?=
 =?utf-8?B?Q3pWVk1IMWJOM1hUTFQ0S05Fa1ptajZEdzQ2VE42Q1hOMDdYUDN5UjVRcHJn?=
 =?utf-8?B?dEpRZTdpdG5MdC9lbnliazAxR1dWK0sxL3hFNUVpK0VWWGlKV2lwOTNKbUdj?=
 =?utf-8?Q?dYX1iAKOD9A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkxpVThRR3Y5RmJGSEx6bUgvSGt1d1U3ZUlaRmp6YXZYRm5FTThnOFNHR2Y1?=
 =?utf-8?B?NWVIazlmTUVwUzlVa3hoU2kxd21iRG1ENGpIaEtZbUdYM3VSUHVqWmhKZmMw?=
 =?utf-8?B?allpZ1VEZE5xdjluTVdvbmFiTFNEUEE5L0xRdjdGNW95elZaTFl5WnRhUmM4?=
 =?utf-8?B?K0VjT2h4LzlDUUFKMVE0Q2drWTE3WmpHZHdDK0RodXBrNTNKZTcySkhCeDUz?=
 =?utf-8?B?THNtQWpvWXgvZndncDZQZkpPS1UvRVRUeE5hWFA3NzZRSjBBdGNRanhQTS9v?=
 =?utf-8?B?RWdGUUVadTg4UDlVRzB0MDB5aXBQbldheTBJU0JFVWwrbEJZa2I3WUdJOGVL?=
 =?utf-8?B?ZDZXNERJaG0wQld5R2xJVCsydERzNytOK3ZXZW9ZcFgrcmtJQVduOGVFUU1p?=
 =?utf-8?B?MmdzYWl4bndzVnplQlFQNG4yL2VCVlBvOE04Z1dqMVZGcmdqNzV2Sm5hK0pS?=
 =?utf-8?B?eldPVk5aQUJTT2h5QldySVp0TTV5eUpLSmRiTkdPLy9aRHo5YWNGZlBmNERj?=
 =?utf-8?B?TS9icDBVVjNtMndjZ1hQUmpCODl2UmZZeDYvb3Z5YmIrTXRoWWQzMEZRWGlm?=
 =?utf-8?B?N09zcXQ2d3YrK0FrbmV0VnRXQ2F3aE91WFVLSjg2a3N4aG85alpsa1NjdExS?=
 =?utf-8?B?MWR4S0l4S3BHdXI0WnpmY0VKQzJvdnRMNzRlUXg5a0lURmNoVkVhSDd4VlZs?=
 =?utf-8?B?MU1XYTdVWTczdDA1T2FZWFk4TzlEeTM3NGkxWEdub2hCZGVqOUNmOGNHejl5?=
 =?utf-8?B?V3lkc1NaU2xoQitaREZyMzAzTnhJRHV0MU9rRWhzeS9EL05DZDd3SE5UL1Fi?=
 =?utf-8?B?Y1Zxc1FNemh1cnA1NVJsMlJxTlRuL0hCZis5QUl4TWEwcEdDd2ZhakNFWHhO?=
 =?utf-8?B?YW9yN2pUUVVVR3Z1LzI3RXhMWEZhT0pDb29ZU2U2cGE3U1JZNXVZTFRJVmhl?=
 =?utf-8?B?UjIxNVVHQ3gzWSs4MkRtVUdOS3FubHNRZzdwVFJYb1NWcnk1QW9UYTFXK2Vt?=
 =?utf-8?B?V3QwMUpMRkIzRzFRWFhKekk0QUVsdG9HcStQN2ZhMFkrUGx2Zm1UVTFVQkds?=
 =?utf-8?B?RGNDUHl3UWE1bXlYcjErWFl6Rnl4TnM2QU96NERLcHk2MTN6dzdGT1VIU0hT?=
 =?utf-8?B?eEVXS1IxSllpMUNBSWl0M3UvRGNXNCtVbk04bVEwa2s5aURmNXYvN0FRcFB3?=
 =?utf-8?B?MzR0bCtxNkNpVE9VWTNEZlJveThWcUZsSEFvU09tVGlRYU1UbndNbVVJdStV?=
 =?utf-8?B?ZUhndnpoYXJDUEsxQi9PQ3NaOXF2NmZuREVOMEM2a0Vqd0VLeXBvck4wb2F4?=
 =?utf-8?B?Tk4wL1J3RUJlSG1NSzkyek5IOURjS3NyaGNLVFBCV1JEN1N5WWljQ1BwMkx4?=
 =?utf-8?B?ZDljemhPNVVlanFpQThnNGprMVk1dEErTXMyUzg2SXJrUTdyTGZMMEsveUd6?=
 =?utf-8?B?WnRTUUpUc2c5QlVaSjR4b1JOTWxyc1dCWVBYREk4YkFoc05BWGpzVk1tSXZk?=
 =?utf-8?B?MlYzNmZpQ3BxT3N6eGVwOVVjV3AxelhmT3ZkL3U2Qkhlell1bDdtNTBPbkdO?=
 =?utf-8?B?SFdRWDJYQXo0U3p4TnFZZ2NFZTczMldBYkVudzdHWkh3QzRpNFlpMy80MVUx?=
 =?utf-8?B?cUNxdFB6ZVg1VXRIWUhOZ1JXTVdrOEdiREUxZkNRU3NLeVRaajJtZm5ieCs1?=
 =?utf-8?B?SUNjbFFIdWFuS0xCNGkrWlNMdkY3djVyS3FzM1dvQXRiSkJONnBjald5cElJ?=
 =?utf-8?B?YXp6cnJOL1I1cityWDFaQUVNN0tBZjBTbi9KNHJqTzRqdWZ2NXVwN3pteWww?=
 =?utf-8?B?bUJPSjJDNjlQbXRQaHMyWDJzMzZjNzNKVDZ6YzdrTG1ZSGQ3ZS9QaTdGbGp0?=
 =?utf-8?B?UGFWSHJ0UkVvRHBXZnF1aXcrNkZjSzNiSzV2WnAvSThORE1xUWN4TndOWUVG?=
 =?utf-8?B?REMzVzdvOWFBRkYvQm5vVUU3TVZZNlhXcFovYXhLR1J4a0k2bHJWWlc0M3lH?=
 =?utf-8?B?K2srWUwxai9IMy9neW9HNU1ROHRURDJ4a2JTdmpmeFZuWFRBZGV3cjRIdEtU?=
 =?utf-8?B?QXdsN0xLa05RcnRySmZnZ1NNbXRuWFRBZTFkWTg2eEE3NzRrZm5GRTVCdjZw?=
 =?utf-8?B?b2NGQVptYWpNQlloalJmRktWRHdrRGtzdUFOWU5ieDc4YjhBZHJ2M2V5QnRK?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec7e02a-e4ce-4f1d-ffed-08dd939452ef
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 09:39:01.4858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIB3XoW+RqHnKqL08RAhsKuuJJY5+UmLeTizqawgh44THsdE2Dgl//L3Pk/ZCaczbs/+TBbAruDnM1PLZKma0zMnVfDiLks4RWGU9OPiAgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
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

--------------zk8oThm4eQQUgUcUnvRLRxGq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 15.05.2025 10:36, Zbigniew Kempczyński wrote:

> On Tue, May 13, 2025 at 11:52:52AM +0000, Jan Sokolowski wrote:
>> As PVC doesn't have render, these tests will fail by definition.
>>
>> Skip render tests on PVC.
>>
>> Signed-off-by: Jan Sokolowski<jan.sokolowski@intel.com>
>> ---
>>   tests/intel/xe_render_copy.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
>> index fadfd162c..c36520c92 100644
>> --- a/tests/intel/xe_render_copy.c
>> +++ b/tests/intel/xe_render_copy.c
>> @@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>>   
>>   	igt_fixture {
>>   		xe = drm_open_driver(DRIVER_XE);
>> +
>> +		/* As PVC doesn't have render, we should skip here */
>> +		igt_require(!IS_PONTEVECCHIO(xe_dev_id(xe)));
> Please add is_render_supported() helper below render_supports_tiling().
> Checking cmds_info->render_tilings is enough to determine if render is supported.
>
> --
> Zbigniew


Or possibly just

+               igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));

after the drm_open_driver().


Maciej

>> +
>>   		bops = buf_ops_create(xe);
>>   		srand(time(NULL));
>>   		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
>> -- 
>> 2.34.1
>>
--------------zk8oThm4eQQUgUcUnvRLRxGq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>On 15.05.2025 10:36, Zbigniew Kempczyński wrote:</p>
    <blockquote type="cite" cite="mid:imbnou2uahpw276ewjvighty2mz4x3p3bihrmlben4o4btsr52@izy5eroo52mf">
      <pre wrap="" class="moz-quote-pre">On Tue, May 13, 2025 at 11:52:52AM +0000, Jan Sokolowski wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">As PVC doesn't have render, these tests will fail by definition.

Skip render tests on PVC.

Signed-off-by: Jan Sokolowski <a class="moz-txt-link-rfc2396E" href="mailto:jan.sokolowski@intel.com">&lt;jan.sokolowski@intel.com&gt;</a>
---
 tests/intel/xe_render_copy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index fadfd162c..c36520c92 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -697,6 +697,10 @@ igt_main_args(<a class="moz-txt-link-rfc2396E" href="dpiW:H:">&quot;dpiW:H:&quot;</a>, NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+
+		/* As PVC doesn't have render, we should skip here */
+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(xe)));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please add is_render_supported() helper below render_supports_tiling().
Checking cmds_info-&gt;render_tilings is enough to determine if render is supported.

--
Zbigniew
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Or possibly just</p>
    <pre style="margin: 0px; padding: 9px 12px; max-height: 30em; overflow: auto; white-space: pre; overflow-wrap: normal; word-break: normal; color: rgb(23, 43, 77); font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(244, 245, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
</pre>
    <p></p>
    <p>after the drm_open_driver().</p>
    <p><br>
    </p>
    <p>Maciej<br>
    </p>
    <blockquote type="cite" cite="mid:imbnou2uahpw276ewjvighty2mz4x3p3bihrmlben4o4btsr52@izy5eroo52mf">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
 		bops = buf_ops_create(xe);
 		srand(time(NULL));
 		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------zk8oThm4eQQUgUcUnvRLRxGq--
