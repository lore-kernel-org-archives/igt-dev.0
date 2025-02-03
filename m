Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDBBC02192
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 13:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BA910E4E7;
	Mon,  3 Feb 2025 13:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hw1+71BZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6A110E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738590481; x=1770126481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yla0lH36ltN0ofkttDu4hg077qhPD+MaMYvRTRp+EDY=;
 b=Hw1+71BZ7AFqAFeNuUf+WoWjRbpCNWLVw/kIbF14leDUW80jprhCpCJB
 UfxSP1jt/8hmGT3hLXHQxtCBoo15mqrE2rn44H81DYuO0XJTH6RWVGuj3
 1raSzn8Z2eNXdOoMYnyxepxxR3bi+QvUjcbAscyCYylqmLBSQDTHw2x4d
 3o+9IwD5nKqClWidRMCkzdAjQaPetvJZPx0AHf6sBxkA8grw/M9iucA0h
 8nMA5o4kYN5lEYw90go4jvTTGuKHJv6g3bI3B3OXwIbeQb07iJ3/egkRs
 m/7jzMskD+SMs4NHEx/7KZYh2au5MLTCUA96KM9ZAphk05BNBIoKhBhXI Q==;
X-CSE-ConnectionGUID: UPhbutSNQ9Gn0BIvKJCA1g==
X-CSE-MsgGUID: gUSo9+NqTB6bbvzAHNA+bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49686030"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="49686030"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:48:01 -0800
X-CSE-ConnectionGUID: CYUvx/i6SzCacfR7p9L+Lw==
X-CSE-MsgGUID: Xn82knqJQtqTtoaWIE2Mbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110109175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 05:48:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 05:48:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 05:48:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 05:48:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJLMRQ5tvG5oamiMb83a3yKJB5OTXMF+yKM4JtMkWFxxZj+Ne7uUe9ZV74dSQxGY7kColkJf4PkoX4EYQx3O5J9vervkgkva/Fpk1hQl+kReQlBuObn6Mu6lPQtqjYzQdYngMST88pZE4kPYmiMlnM1mwwTCME0dJvayQUztvsn6x4sMY3d0G+/ujJ2udLP0UB5xFG2z3GbmgHjxaOlsCkLAJJhHDi7jNIwGMvs6h+f0Y3WqgLDUAMT4EL22wVHNcOZEl/8rN/2C1AjaA1tBJHIflslH0j0zSy9VoMkEJ+z6kYCrtOxtfN5XyPa/Q/A2vPLXmtdPPfh1D39Q8G7K5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKgaroSzwnin04TaaN+kiLKkEDpYNAGC1Oo5KN3xuLY=;
 b=O6uS2Jh73e3HarGDbTDfnS3Thq2J3zRkv3/c8aT1koyaNePWR/NDFrBC7wA5IG/tl9oFh9Q7yE0qQR7BIN1ugIm0akCSSWxuO7oXQ1WJsodnbNSVJmrrIeEtPlXZisypCweQ9qBfYpUyo0lMH439/xr17QbwFMeCob4JkIaJoL25lSwkNgwBdc+JOONlaMTwMmigWdl2W6zknMQHp2297SgLMRl14wCiVxoDwN/fRj6Av7Rt6DcHsBblxsOIrn+GN0bgymh0VCaP++kNnOwLsIY18K13jinDzWjMNUwVMezFhWnR4W82Qtkh06FvT8Rns1m9ltuomhgVPfhDXe66Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB8213.namprd11.prod.outlook.com (2603:10b6:610:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 13:47:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8398.017; Mon, 3 Feb 2025
 13:47:31 +0000
Message-ID: <6ea5f553-a9b6-4bd3-8bd9-20837ce5e8cd@intel.com>
Date: Mon, 3 Feb 2025 19:17:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
 <20241230190315.48821-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241230190315.48821-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b638cc-9dfc-477f-9f90-08dd44594e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFNBNUVvNy9adERBUDY4TG13UFhXdlZoMU0vdHRRenRzRVVSR1JLWkloZU5V?=
 =?utf-8?B?THMydXpCeTJvc2pSVE05R2dpb0pJTjgxTC81b1dnK3hPaURsMGhSQ1JkNURT?=
 =?utf-8?B?OW01M3FQdFM3RzZGU0gyZmpBelMwUVRDWlh3STVnU25vdHBHSmlncWtMY202?=
 =?utf-8?B?Tlc0Q0x5bkxqd2FtZmJUTkNjaWVwUFdUTmlmU0JMaVZ3bm8wbkt5QXlzbFE4?=
 =?utf-8?B?d1RSMjJnWHZNeFhWRDdrSzRkVGNUY3pYZWxWcUVyanZtd0VsempLQURFTE53?=
 =?utf-8?B?a2NCeDU3cTAwRk03cnhVNTNVNmF2dUg3NzlteUYzOTRqZzhUbGlyTmRaaHl3?=
 =?utf-8?B?T3M0REtrMmJNaENWWmI4SSt2M2hsYVNjMWgyeVg5UW5NK3N5Q1BscmYwMURX?=
 =?utf-8?B?TWlkbHplOUowSG9GS3FTZnpNVVF5bFVFMVBaYTVIZ1piSGd3SUhPcE02cTdX?=
 =?utf-8?B?eXBzUjhyckp6UlJMQWpuMnArOEllS3BFVERXbHhna3hGdEVZc1plcUhIZ2xy?=
 =?utf-8?B?Uk83aTN3eFZiYmRJZ0dPb1VEM1FVR1UyZXNQQTY1U3l4eG5taGRBWFk2SkRI?=
 =?utf-8?B?SjNKeHl0RlIrYkZWZU5HU09aNmNkNUsyUlYrQVM5dE5XaGxpU3ZPN29oMkNW?=
 =?utf-8?B?ZGJGcTRIbEIwNzhOWlVjL2ZLRFVhcmlYOFd5WlRkU2EwYWl3dHBrSTF5REtR?=
 =?utf-8?B?NlFGOGpEVFljRGtxQ1QyamNQUElwVzgwNlNISnBiVWFXSWE1dVpYRGlEODU3?=
 =?utf-8?B?SUhUU0JINjRSVEttUmNYUkFncDBQa05ObjR3dWpzRk9SZEJHWFRZNTlNeE9o?=
 =?utf-8?B?MXhaa2krUTNBcnNKa25EY0VXODFRUE9JTFlYZ3lSUzZLL3VwOFBhWjBURE9v?=
 =?utf-8?B?R0VjeG5HU0ZrU09kNGJ3bFhrVnBySlJSbWpkMVgwU1B4cjJzbE9KdVF2NGFi?=
 =?utf-8?B?eEhtYmFsRnd1c0FxVm5oZ0FndHltYVlraW1kYjlEM2M0eE9OdjBqWC90SHY3?=
 =?utf-8?B?N1l4Vm1hWkQ0ZGpxZE01Q3BTbUlDL3p6bkhGMUU0V0hnMG5CNTNMbE92OWw0?=
 =?utf-8?B?VStsNVBxN1NMejJ6QnNJZ2RwTll1ZENnR2FZWkRodm83dEwyemxNUXAxMUdH?=
 =?utf-8?B?NnBWMFRFakRFWUQycmYxUlVTQXBUSFhQNm1RMUttRUJ2Y0xEelV1VnYydC9x?=
 =?utf-8?B?anB6YnlvaThCZDhFWHhtQ1BuVHE3WHJEVWVsSmFCS05aV3NJTjdWZzE1cFhF?=
 =?utf-8?B?aEFGK3hBS2lOMklMMDhWMCszeVBUYzl1RjVwdHl0V1AyckxDb0h3KzBkN0Q4?=
 =?utf-8?B?L20rMTR3VWxzQXBiZ1RxT2g2bDYySGd0cE1jeS85NVk2ODZQL0FnbklwWnl4?=
 =?utf-8?B?UDFYYURqS3FIWjEvNzk0S2RQbDdQQXMvRk1KbS8rWEhjYU0rb3FqTlQzNTRL?=
 =?utf-8?B?aHJOYVhOdDhiYmovZWkyMlFLaFFCaUZDREQ3QUV3T0tPTzEyS0xJRlFkd0l4?=
 =?utf-8?B?YVBuNFNzeGZaaVB2Um1ycDUxZW5VbStQbWI2U1Z4cU1ua1JUL3VmT1VEYUxC?=
 =?utf-8?B?ay9EdlFJcHpBUU84SW45WERlTmdrSGdUdm95VW1wVytWQjJzNFlycUdtQkdD?=
 =?utf-8?B?Ky9qUXBJL2hFMnpaTHZ2WEJQckZ6aEc5M2tNMEwrY1M4bG1zYUJSallJQ0U0?=
 =?utf-8?B?YXNMR29KTGFjeDNpMzBkcFhhLzVoR2hWcHFqaTFldkZwVFhadmI1cU1IMUxX?=
 =?utf-8?B?OVBZRDVSVzJVcTFLZkNYbldjZkF6NmlCQVRNNmxLelg0cGEvNForQ2NlVk85?=
 =?utf-8?B?UFNhMlRwbGNuekV3ZkMvTm91M0xtQ3lyd3RDVVZjSWs2dHk3akovVDNCald3?=
 =?utf-8?Q?dp58jUOdFtiWj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXlmd09tR2x0OEpNdi82aE9pOGZtU1lqaXVUSjZCQzNRWkNLV2hNWFRoUVZ4?=
 =?utf-8?B?U2hLR0E5Z2s5WjJrQWhXVVlYUVhZS1ZGakl3cXNMZUlvSnU1SUp0SjBmSWlO?=
 =?utf-8?B?OVh6RnlidW9YV1A5TmN6K3pSY1F2SlVWMk9qalpONkNKaFJkOWh3TDFFcXJS?=
 =?utf-8?B?K0w5RlJjZ2h4SW05d1hRbWUwOUZUTUdlL0Y5NTZzczA1TmlpMCs3TjhTSTc5?=
 =?utf-8?B?V2N0cGw0eFZZYjdqd1hyMjJJb3ZZZEFEVDBtc3NCUFdSSkdScXR2UGY2RTBC?=
 =?utf-8?B?b2xwRzBmUDFnYzNkaXF1N3ArQ0ZpODEybmdWbHFLRjZIbkFlcCtOb2xFOXlo?=
 =?utf-8?B?L2tuOU5WektvcCswS2ZFejR6NTdRbzhGWTVCNTRPOWdSMit4T2NRRGc2dFgy?=
 =?utf-8?B?djI4Q3UxYVEvbEV6TUUrQ3hGTUhnNTRDbXlrenJNUnRrQmx1UFUyaXJYNWRh?=
 =?utf-8?B?YWVhcndUZnFUUi8xSi8zY0VyT0tCb0JWM0d3N2VUYTJVMEJ1eEF6MVNKdUla?=
 =?utf-8?B?V2FRbVVpUjVVc3Q4bEFCZWpVUEFrMDVNMVEwRmlGVy9IWEJtcnY2SmxrbStL?=
 =?utf-8?B?eUxPR1Q2R3RCZktqTHd5WFVBUEZjc2hhQVVxa2tnbjRBSmpka3plTUJYaVp4?=
 =?utf-8?B?S21qM2t2Tyt2ZmhTV2FWZzZId29MaGZTei9OaEc1bE43S0s5MVFmZ1E2VHNs?=
 =?utf-8?B?Yzk4UjJFQW0zMitCVXRac0VUS3RNMC9KMTQzbzFlejBNNE91ZjMyV2R2Zk9l?=
 =?utf-8?B?TlB4cjJwRGo2RjVnMytTVzZiMEM0WklFc25GaVFLWXZGU3R0TnFFMzJVYzJu?=
 =?utf-8?B?T2JtVHhQNFY2TzI3RlpDVGVMamIwbmdOaGE3QTRvQVVUVFdodFdpdm1wZTB0?=
 =?utf-8?B?WE92MjdQOFFUTVdzNTBHaWNTVVpMR0RwZmxwTDlVVDNxQXo3QjI0L3R3cDJR?=
 =?utf-8?B?dlVEcXZpMGQ2VTJHUm4xYVRGUVFmV2hlYlhSbEtaS01DYmEya01yQlZNM2Jj?=
 =?utf-8?B?S0o5NW9ob2pxYk5QN3pTOHA4YUFLanU2WTlxUkswamdPY3R6NUM4YmNXT3No?=
 =?utf-8?B?bjBUVWVPQzAwcDJaa2xBa0VXK2JKVnd3dEdpQ25YN00wSDJEN1QwUVNGRUla?=
 =?utf-8?B?bGNyUEFCZEg5TmcycmtYTkM0Yms2SERDR1dhNU1PRmU0SFJuQ3dITFk5NXhM?=
 =?utf-8?B?VVhyNE96akEyNmNpMTl0b2Rld0lnSWxTdVdZMkNKY1Z4YXIvUEExV3UyOHZV?=
 =?utf-8?B?eWlYRytnS3VQNVlRZkpYd1NPbmUySDMvcmRHMEd5NGtRT1dVZzVwclA5c0Rk?=
 =?utf-8?B?cTNSMUc2bC9NVDdUNWpGNUFiekJsWHNFcVBqVVFBdXZIQVFrdFZaNmZlTWNE?=
 =?utf-8?B?TEJFY01KSG03RlBleFBaTUprOWtSaDVTeXF2ckxTQ2loRy9sZVdXckl3Um9a?=
 =?utf-8?B?ZU1DRnh0V2FqbFFHdFQ3NmFaWjk2b20zUy9OK29UMXF5d0huMGZuU2RoekFM?=
 =?utf-8?B?VUNvOEZPbmFQanNySFFuZ2ozNnVpNGh3TFN6Znl0bW9tRTZXVU5JSFRnRGpM?=
 =?utf-8?B?dmVFNzFDMWp3bzN5eDZ5S1MrdXU4cCtxQUVoY2pvMDFvZ1Vocm5wcTVncnNH?=
 =?utf-8?B?NGFPOTJNd0I0U3I1V203a204QkhpeEFKRlQzMU9Qb1R2cTM2ZU5BZHpJUDUx?=
 =?utf-8?B?aEt6R2dwQVl5bXRiMnMwVEpNd01VQktOQWNoT0gybHRMZnhLM0pUL2pBL2lK?=
 =?utf-8?B?Z3FEMGdhQlM3VHY2VzFrUjBPRXRMeXY1a2JydEdZbytRTVNTZ0NSM0dlTnlj?=
 =?utf-8?B?VHAxNGpLZWRrbmJPN3hOcGdrT3JFVWNmYkJMMmxraE45VUdFTEZWcDNlMVhy?=
 =?utf-8?B?M01uSWdCUTkrLzlTZDNLSEgrQmJEblJHT09JOGV1bG5XWFNQbzhJWER1TElZ?=
 =?utf-8?B?YzVsUE9yek81QkpLQ1NVS2o1cWNQSWcrMVZwTWxVWHF0YW9BVGI1V1Z5SkM4?=
 =?utf-8?B?RmgweUt3RUJKNFowVnpJL0JUU2ZBWUxEVENSU3o1MVJRdEdXb05pNFRDWGll?=
 =?utf-8?B?RTdjT3dSdFIrWkhndWVwbjRqTDJOY0loYTJNOGFYenJNSXhEMTZDdXdyZThY?=
 =?utf-8?B?S2ZvbjVnT2NxVWhPbE0vdzd5enI1R0owYWRHYnBYNExVZzYyZ1dHazkrVVFZ?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b638cc-9dfc-477f-9f90-08dd44594e39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:47:31.5289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+LkrOlNmAcO4SoVGq7cJzX6IO3bpeSGVXDtvwk477UZFdNPAUtD4dyYCsiX70PYhqIbPK/qtD6l9IOnbxQfNyrbWV3ioLGeV1vz8mamBw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8213
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


On 12/31/2024 12:33 AM, Swati Sharma wrote:
> Functions returning highest and lowest mode are added to lib.
> Corresponding changes are done in relevant binaries.

Use imperative mood.


>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c             | 34 +++++++++++++++++
>   lib/igt_kms.h             |  2 +
>   tests/intel/kms_cdclk.c   | 77 +++++++++++++++++----------------------
>   tests/intel/kms_dsc.c     | 14 +------
>   tests/kms_display_modes.c | 14 +------
>   5 files changed, 72 insertions(+), 69 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a67d17c4f..4f2a5ca0f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4851,6 +4851,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t *output)
>   		return &output->config.default_mode;
>   }
>   
> +/**
> + * igt_output_get_highres_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the highest mode

Returns NULL otherwise


> + */
> +drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *highest_mode = NULL;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	highest_mode = &connector->modes[0];
> +
> +	return highest_mode;
> +}
> +
> +/**
> + * igt_output_get_lowres_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the lowest mode

ditto


> + */
> +drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *lowest_mode = NULL;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
> +	lowest_mode = &connector->modes[0];
> +
> +	return lowest_mode;
> +}
> +
>   /**
>    * igt_output_override_mode:
>    * @output: Output of which the mode will be overridden
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 1e2a927ab..18c480ce5 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -546,6 +546,8 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
>   
>   const char *igt_output_name(igt_output_t *output);
>   drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
>   void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
>   int igt_output_preferred_vrefresh(igt_output_t *output);
>   void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 382b3e9d1..f1a019eb7 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -110,24 +110,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
>   	return data_rate;
>   }
>   
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -	drmModeModeInfo *highest_mode = NULL;
> -	drmModeConnector *connector = output->config.connector;
> -	int j;
> -
> -	for (j = 0; j < connector->count_modes; j++) {
> -		if (connector->modes[j].vdisplay == VDISPLAY_4K &&
> -		    connector->modes[j].hdisplay == HDISPLAY_4K &&
> -		    connector->modes[j].vrefresh == VREFRESH) {
> -			highest_mode = &connector->modes[j];
> -			break;
> -		}
> -	}
> -
> -	return highest_mode;
> -}
> -
>   static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
>   {
>   	drmModeModeInfo *lowest_mode = NULL;
> @@ -172,7 +154,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	int cdclk_ref, cdclk_new;
>   	struct igt_fb fb;
>   	igt_plane_t *primary;
> -	drmModeModeInfo *mode;
> +	drmModeModeInfo mode;
>   	int scaling = 50;
>   	int ret;
>   	bool test_complete = false;
> @@ -182,14 +164,17 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
>   		igt_display_reset(display);
>   
>   		igt_output_set_pipe(output, pipe);
> -		mode = get_highres_mode(output);
> -		igt_require(mode != NULL);
> -		igt_output_override_mode(output, mode);
> +		mode = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode.hdisplay == HDISPLAY_4K && mode.vdisplay == VDISPLAY_4K &&
> +			      mode.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
> +			      igt_output_name(output));


This is functionally different than what was happening earlier. Earlier 
the test was only getting the 4K mode from the list of modes.

Now the patch is getting highest mode and checking if its 4K or not. 
With 8k config, this will result in skip now.

I understand you are trying to solve two existing problems.

1. if a config has say 8k mode the current code will always take 4K mode.

For cdclk transition, as I understand you want to have anything more 
than 4K (as done in next patch).

2. For finding such a mode we iterate through the modes several times, 
you want to avoid this and just sort the mode once and get highest mode.

If this is the case, you can combine patch#1 and 2 with the above 
reasoning clearly called out.


Regards,

Ankit

> +
> +		igt_output_override_mode(output, &mode);
>   
>   		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
>   		igt_create_color_pattern_fb(display->drm_fd,
> -					    mode->hdisplay, mode->vdisplay,
> +					    mode.hdisplay, mode.vdisplay,
>   					    DRM_FORMAT_XRGB8888,
>   					    DRM_FORMAT_MOD_LINEAR,
>   					    0.0, 0.0, 0.0, &fb);
> @@ -225,18 +210,20 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   	int cdclk_ref, cdclk_new;
>   	struct igt_fb fb;
>   	igt_plane_t *primary;
> -	drmModeModeInfo *mode_hi, *mode_lo, *mode;
> +	drmModeModeInfo mode_hi, mode_lo, *mode;
>   
>   	do_cleanup_display(display);
>   	igt_display_reset(display);
>   
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
> -	mode_lo = get_lowres_mode(output);
> -	mode_hi = get_highres_mode(output);
> -	igt_require(mode_hi != NULL);
> +	mode_lo = *get_lowres_mode(output);
> +	mode_hi = *igt_output_get_highres_mode(output);
> +	igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
> +		      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
> +		      igt_output_name(output));
>   
> -	igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay,
> +	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
>   		      "Highest and lowest mode resolutions are same; no transition\n");
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -248,13 +235,13 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   				    0.0, 0.0, 0.0, &fb);
>   
>   	/* switch to lower resolution */
> -	igt_output_override_mode(output, mode_lo);
> +	igt_output_override_mode(output, &mode_lo);
>   	igt_plane_set_fb(primary, &fb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>   
>   	/* switch to higher resolution */
> -	igt_output_override_mode(output, mode_hi);
> +	igt_output_override_mode(output, &mode_hi);
>   	igt_plane_set_fb(primary, &fb);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   	cdclk_new = get_current_cdclk_freq(debugfs_fd);
> @@ -273,7 +260,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   {
>   	igt_display_t *display = &data->display;
>   	int debugfs_fd = data->debugfs_fd;
> -	drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +	drmModeModeInfo *mode, mode_hi, mode_lo;
>   	igt_output_t *output;
>   	int valid_outputs = 0;
>   	int cdclk_ref, cdclk_new;
> @@ -297,11 +284,13 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		width = max(width, mode->hdisplay);
>   		height = max(height, mode->vdisplay);
>   
> -		mode_hi = get_highres_mode(output);
> -		igt_require(mode_hi != NULL);
> +		mode_hi = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
> +			      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
> +			      igt_output_name(output));
>   
>   		igt_output_set_pipe(output, i);
> -		igt_output_override_mode(output, mode_hi);
> +		igt_output_override_mode(output, &mode_hi);
>   		i++;
>   	}
>   	igt_require(intel_pipe_output_combo_valid(display));
> @@ -320,12 +309,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> -		mode_lo = get_lowres_mode(output);
> +		mode_lo = *get_lowres_mode(output);
>   
> -		igt_output_override_mode(output, mode_lo);
> +		igt_output_override_mode(output, &mode_lo);
>   		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
> -		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
> +		igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisplay);
> +		igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);
>   		i++;
>   	}
>   
> @@ -343,13 +332,15 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);
>   
> -		mode_hi = get_highres_mode(output);
> -		igt_require(mode_hi != NULL);
> +		mode_hi = *igt_output_get_highres_mode(output);
> +		igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
> +			      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
> +			      igt_output_name(output));
>   
> -		igt_output_override_mode(output, mode_hi);
> +		igt_output_override_mode(output, &mode_hi);
>   		igt_plane_set_fb(plane, &fb);
> -		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
> -		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
> +		igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisplay);
> +		igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);
>   		j++;
>   	}
>   
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 5508e7a9e..1392e1cd4 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -94,18 +94,6 @@ static inline void manual(const char *expected)
>   	igt_debug_interactive_mode_check("all", expected);
>   }
>   
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -	drmModeConnector *connector = output->config.connector;
> -	drmModeModeInfo *highest_mode = NULL;
> -
> -	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -
> -	highest_mode = &connector->modes[0];
> -
> -	return highest_mode;
> -}
> -
>   static drmModeModeInfo *get_next_mode(igt_output_t *output, int index)
>   {
>   	drmModeConnector *connector = output->config.connector;
> @@ -184,7 +172,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
>   		    DRM_FORMAT_MOD_LINEAR));
>   
> -	mode = get_highres_mode(output);
> +	mode = igt_output_get_highres_mode(output);
>   
>   	do {
>   		if (data->output_format != DSC_FORMAT_RGB && index > 0)
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..6ea44944a 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -60,18 +60,6 @@ typedef struct {
>   	int n_pipes;
>   } data_t;
>   
> -/* Get higher mode supported by panel. */
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -	drmModeConnector *connector = output->config.connector;
> -	drmModeModeInfo *highest_mode = NULL;
> -
> -	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -	highest_mode = &connector->modes[0];
> -
> -	return highest_mode;
> -}
> -
>   /* Get the 4k or less then 4k mode of connected panel. */
>   static drmModeModeInfo *get_mode(igt_output_t *output)
>   {
> @@ -344,7 +332,7 @@ igt_main
>   		igt_require_f(dp_mst_outputs > 1, "MST not found more then one\n");
>   
>   		memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
> -		memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[1]),
> +		memcpy(&data.mode_mst[1], igt_output_get_highres_mode(data.mst_output[1]),
>   				sizeof(drmModeModeInfo));
>   		igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
>   			       data.mode_mst[1].vdisplay >= VDISPLAY_4K), "4k panel not found\n");
