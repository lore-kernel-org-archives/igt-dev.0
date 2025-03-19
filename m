Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A15CC35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 23:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCCD10E096;
	Wed, 19 Mar 2025 23:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iH/X6nSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D8110E096
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 23:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742425876; x=1773961876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r+TwfYLEOXqOF+obkug20bAb5shPM4QxUIarhYF/5ks=;
 b=iH/X6nSMLjZgdrS8AnzIeFY4ZXwgSl6B2ek6pLo/PMy5/LESkBZn2x7r
 H+uK9jfKcS8tyMe5dO/dXtM95GOAnBPTobjCwfYV9CHTeegy9dPXx4xYe
 R7IbpElxBswTJh5Bd4rByQvFZjK89+hmfw3qy7vDSofKls4nLIUjRAe0O
 dUaEMBgNpP97FAU9CJgHFAukKWNiqgJSjqQpJORJA7nNb3ioYTaD+EcZK
 Qu3g5Ltx7LKuU1/gVJSNGaqnZxgdvkXPXjOmZEsNnJ5adG3NUx3lpBUwF
 5HWlcjJS2IUOdO7oACyNDppDakBTimJdcQQIyPyZ74Cn2OL2IghVlAo3g Q==;
X-CSE-ConnectionGUID: 5zoFLSHzRFuRP4SSsmSkJQ==
X-CSE-MsgGUID: xojT65VmTbaSJnA9Oid6Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="61031891"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="61031891"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 16:11:15 -0700
X-CSE-ConnectionGUID: w+8sw4QoTDGTqOmqlspb9A==
X-CSE-MsgGUID: XCQ7ufs/QXud+FyieQz3uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; d="scan'208";a="122846087"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 16:11:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 16:11:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Mar 2025 16:11:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 16:11:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ndnrmf68JqRpjUj+9+VfVomDz0ky7VFJrOn8uAeWZALXhUjcElxqStuxNT5VEnenw6WON4dHS1xsowQVUzXd7GpSrG98c3rmXLng2dPIZEnCGWBo0LR43fkwsKVMlguTeuhKp1hosieiDNzkbxQ78PIs7VinLyNInyT7sRqzYm3uKSiqOjxIMRW21Olf0JNFvBySwQy2ZWqZkBOiqLq0z/1kJT93tDBOyWKSE8rS3WkmioORKUpwMpLR2ZBGrHpaRQtxwrLaYlWxWHvOG7KdsoMbl/Ol0NN5blB3OSUoVprdxiI4gBzvsE65SPxgeTMxfV5ZNFDuECoDaFZ49SgyHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LbQGKFCu642EI4lRAhKlIPpvSJ08Th1Pf5NyaGooNg=;
 b=dqTflznoBN2z0FBYH7nCQP+3UbWVAMLwD0GJ1bfEKYwIvjNrd/IeAKCredybATAjm9mIAM/aD58Xc/sETeCyGD4/j9stQ/9AdACqcgmogl9U7IO8wBTgTyeonya1Go6u0Ki2AnS10Os7hoR26B3nZEIA5mv4LjpReT+GFEh3CmU7qMztxuRD7aK7bqxwyrtRJLu6C6Ms2FOcInHeYrNjEJ7a/G+/prdCqHC03MCeKuYVhWqq/ksjHB8vCuEuL2IE7I6Ahm55afIrbruh5sd7JNLHhEkyNIM8HlUe10IOXHGveU8Xz01vjNoL3nbK4TdbDhkFfcu2uJUohrG2y+0bbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8740.namprd11.prod.outlook.com (2603:10b6:8:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 23:11:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 23:11:12 +0000
Date: Wed, 19 Mar 2025 16:11:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_pmu: Add engine activity
 test for all functions
Message-ID: <Z9tPCpmzPE0pGbmN@soc-5CG1426VCC.clients.intel.com>
References: <20250312062431.2238409-1-riana.tauro@intel.com>
 <20250312062431.2238409-2-riana.tauro@intel.com>
 <Z9tDiCsZ7XHXN8ja@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z9tDiCsZ7XHXN8ja@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: SJ0PR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0de4ab-d1b6-4d20-0c37-08dd673b5773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUt6ZWMrMnY3NWJLOEZWa3FCUnRyb3VWVUdyakkzYmM0UTIxNXdxMkJRMEI1?=
 =?utf-8?B?ZS9lbU0zRGJoNEUvUVl0eVpJUkkvRm5XekFYWklWNjRpSDllZUM2SVN0N3Fv?=
 =?utf-8?B?TlZ6cVNxdURZNmpyanF3MTdrQ0w1ZUxIWHlrTkRUNTdsajZIQUVQSFpCNzVR?=
 =?utf-8?B?NEpiSTNySXhKaDdDUzBJMXpscmtnNmxNK3d5WUNYVEdrUmR6YitjRXFIbFJ2?=
 =?utf-8?B?RHNIT2hmR0plaWNYc1ZMbklma0FiRk9nRkc1bDZFdllJbGZCOThXNldscnNC?=
 =?utf-8?B?eTE0TTAvV25VazRXUU5ydCtKRDNGMWxRKzJzdFppWE1aMzFsUmg1cE9zb3Vh?=
 =?utf-8?B?RmsyNGVmenJ6UVVyOVlSdWNEdnQyQllsdmlXWjJZcFRtOEJxWXpuYmp4MzFV?=
 =?utf-8?B?dVpoVGMwTjRpQ2xwTVNsY3lvdmwzYWJCcXo1dmJxTnRzSDY0RjEvNFJHWEVy?=
 =?utf-8?B?NTc0anFhdHVDZ1VQaHQzQXV1VldUT0RjeG1jMTVRMFBtQ1RGSW9QbkdjWjN6?=
 =?utf-8?B?Ynh6MnNjekFGaTAvWFN2Vjh4NVhCYjJiUkpRTlRoZmJnb0VLOThMSW5ZZVhP?=
 =?utf-8?B?dTJpZUppSFJyUW1UenorMlo0Rkp2WkwvM2lOanhKTW1BVytFTG1odkxGbFQ0?=
 =?utf-8?B?SjNMd0tuYjcrdlBpMU9VTWQ4VU1rTVNXVzdtd29tOTFGZmFVaklEa2NpWDJX?=
 =?utf-8?B?SWZEdnoxNVhNZWhGSDNyYmxaUUFFVDl5bFI4ZExveklZdkM1a1VlTGdqK3RU?=
 =?utf-8?B?c3FhR2ExenBpdDkvSUJDeEV2bmkxQjNDM2w0YjJ6c2JKd01ObFVBaTkvczY4?=
 =?utf-8?B?Z2QyUWIyZ2syN3VlbWRyN0k0R3krbGxQb1Y2MENFdGE1R3lSN0lpSjZwemZ1?=
 =?utf-8?B?RlBZTkFXaSt3d2tKcmZZbzBNeWRqY2dxSmk5RVZzZ29TenV4b1laQklzNlcx?=
 =?utf-8?B?Nk9XRExOZldBWUR3ZVFGM09sTVV5bExiUTdiWWFXRG5lUmZacXpZQlJWSTZ3?=
 =?utf-8?B?K09OaHNUbXVlR3hBUlVuK3pPaFp6S3hUQnBCOSsyQTh5ZjhuVlBDclZsNmhW?=
 =?utf-8?B?MUN3NlpDOVNrUERDeXRnck96WHBBSU9DMkdISXZlVDBhTkh1UXN5aUZyM0t6?=
 =?utf-8?B?dWNLUkFvTmtTL0RuV1MzdUozQzRHT2gyZXQvT3ZHMTZPZVR1ejNRNko4RWND?=
 =?utf-8?B?NCtiaFB4dEZkdzkrd0RUYWltQ2xUMzE5alpmQW00VXEyNG5QeGtxN2ZFL1Y1?=
 =?utf-8?B?SmN6VTdEeEJqQ0wrd0lVbi9ySEJzMmV6VWtLUXZ6bExyMzN5ZTQvaGRrOEkr?=
 =?utf-8?B?UDloK2dKRkMzbmZKdTNROWlVZHhIcGM5TGpoS04vSHRvdE5hRmpCVUppQnlw?=
 =?utf-8?B?YnR3d21xTFFHRHJlWjVaRjZBTjhhSm1PcnRhRDh6NjNNZDdlTXNiR3Q5MUJQ?=
 =?utf-8?B?dXRCdmhQWXZ5bjZUWURyTlFiUTFLSGZLOWxLWWpFWnVidmg4ZXQ5QzB2QVM0?=
 =?utf-8?B?WGlZejBHS0JkU0ErdlZYQ3ZJMUhoRVptZnVCdnU3RzJsQ2t4b01FWlhhbUxK?=
 =?utf-8?B?OFBJSEI4MHdHaDArNVhmRHRvRFdTNXZvdXBXdFIydW9JZ09kN1FGRWNOTnc5?=
 =?utf-8?B?YkI2aE85YzIyTGRkTHZ2elc2Wk91Nm9QNzIxdFlLbTBNTTVaUmErdUh3UEl1?=
 =?utf-8?B?WE9va0Eyd1lPeEtPU1VTZ2RESnBoQlBYRzBrVVJlYTFRTmZHcDBJNCtCZW5t?=
 =?utf-8?B?Mm5DYnZPcU1TdWE4c3djOU5qVUdlVDZ3Yk1BU2dOTlBrSzFZdlBKRkhjTDNl?=
 =?utf-8?B?UmxKRFg0UTVTTWJoeklEemRLQW1CWW9xcDc0VVo0dUtpTVkyaWtTSkVHczAx?=
 =?utf-8?Q?fGrNuR9IeHcSm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlEwTUIwQ3REVitrNjhnSTBLYkVTS3hwNU5ibHlQZ2JlZEQ3U0xIMnVhZkF4?=
 =?utf-8?B?Q0ZUdjNnTmlpdHZibHM5VnFFcnd2VlJkbENEaVh6bStlOUpvQ2dVV0hISU5w?=
 =?utf-8?B?eFVTbTBWV1gxSC9XS3hSSXBpZi9sVE5BNWVqRDFrQUJkREppU0lSWnRCckNq?=
 =?utf-8?B?SjhGaGNHcW1ydS9od3NtZGdON1h2VUZnM0ZlRG9Zc0gwMThpZW9lTXNIRTBi?=
 =?utf-8?B?QUovNU1ZZi91UFlYU29RejhNKzAwbnMxU2ZITXNvbEFnOFY3U0tCSE9OQVhK?=
 =?utf-8?B?dzU3R0hCajIvTXYyaGpzSE9zdGJ0cTNYUEFPMVpxS1l3anpVTngzRGduMmhN?=
 =?utf-8?B?bHdiaTNFT1pZbFNMVGtYY3BiWE9KTEFzMlczV3Axa0piYll1VW5hNlBnZjRj?=
 =?utf-8?B?UmIxY3E2U2g5aTdlU090YUVLd0ZRb0Q1VjFOTW9QNm1OTWFxd3JNQ2pGRDR3?=
 =?utf-8?B?WS9xRjFiZDdRM2czWWlSbUVXRGFpM0dqRTMzWWdnWGE3VEdkSVlhZ3FXWjkz?=
 =?utf-8?B?dVA1ZVJENkdNcG5Qa1pBRHFmYU9NZjdObitDNXZ2QUVRSkpGS2U0dWN0V2x5?=
 =?utf-8?B?c2FyeFVmQWwxOUFqOHB2RlJ2V2ZWR2xFV0xwUTVCTHlIUGRaTmVxMEROUzZP?=
 =?utf-8?B?YnNDVlU3djVYNVNLMWkyQzJFM2p0K1dCbndNTkVyeVRoQWVuK3dsbUxxSFNa?=
 =?utf-8?B?aDhvK2hNNlViK25abmZva3BJWCtaSWtDSnowbENZd05VQktyUzF1SjVkZldi?=
 =?utf-8?B?NEVHeFlaaW1weHpjcS81MkFOQjdNOXZwSHhMc1lyOFNJUThmVWNubG0vbjJs?=
 =?utf-8?B?S0VsYnFadFlDc3FuWDlzelNRQjB3c2tvYU9MWTBKdHVtOC85bitlblg0cllw?=
 =?utf-8?B?OFlWTXVReWM2T1F4bEVzTktWT3dsV2hpUUZiTTJKUEo0aFZiemtwL1ltZGEz?=
 =?utf-8?B?aTAzU210UkRtWENjNDdnWE1KTUtsdmVKb1hwYWZ6cnE4Q2RzbmRKYk5CTi9o?=
 =?utf-8?B?MnNxOXdkVVVoNXBJbmlyL0RYbEdFTkt4ZnlaNHdiekw5b2hDelVrUUpXSUx2?=
 =?utf-8?B?cFE0cjZqcVlOU1V3YmNNOENwcXhGWWlpNWZiQmZhb052MXVVZmZYbVljYXln?=
 =?utf-8?B?eUVRRE52U3RGYnNQbVJwb3JIK25GZHlZd2hyT2VPSjRidVlCKzMycjgzZ253?=
 =?utf-8?B?UVBlQmJrT1I3L2tGamlETmY1WWNyN0NGbEp1ZUI0UStPWlU1TDk1bWVKQ3VK?=
 =?utf-8?B?cTVKVHE4R2I0WTlKSGhhZXpLcXVseXNJeVhKNTZnak9EekxzcEErRTEwcUVr?=
 =?utf-8?B?MWJzbHFGcW0vVWo4R0dTYk5vQUt6ZFpWQTAyR0lNYlRpNjFBY3FUckE1K1Rr?=
 =?utf-8?B?blVtdis0LzRYSDlxZE00WldhMG5vcExML2JkTFpxM1JQVklhQTVENDluL3dM?=
 =?utf-8?B?V3JHYjlCaXgveVdlQ2tMMEJ5ZFVVRndIK3llN0xnOUtTVVYyNlpyTHBmdVRQ?=
 =?utf-8?B?VDlGYzNiRnVOaTk3azdMYnE1Y1c1R3FmRnA5SHV5UUM0RFB2cDUyWHlvZlJz?=
 =?utf-8?B?M2VIM1FYZ3JiaTAyQzNPZjNMa3VXSFpjdnVQU0pCWjk4OGNoWGVMSFJWdDhp?=
 =?utf-8?B?ckJ1d1UxWUtaSEpKQVF5UTZTVUYxSC9ha3hXS1dGaU9jdDVzSHRtcVNwNGli?=
 =?utf-8?B?Nnc4KzhLL1BBZ2tmb0dlc09jY2cwWUJzQkF3NmxxL1E1VzgvNVJSSW4rUFJw?=
 =?utf-8?B?Nkh5TVozdEhORFFrU0FGZ2U1NS9rbWc3MDZrOVpMUkcwYktGVE9TZExkdkQ1?=
 =?utf-8?B?cncwRGRzZmNsN2VvcTVVT2d3c3k1UklMWkt5NU10VEg2YzJIRUJtM2R3enhK?=
 =?utf-8?B?M2YzdVhjeFhUaDNLeTUzSVVEYjlYeCsrY2VvVTlUeDNHQ1pWTHdhM1RpTi9p?=
 =?utf-8?B?SThIYjRtbWtvUy9WU25rV2h0WHJMTCs2ZXk2VkRGdFFBL3E4ZDJlZkxzd1Aw?=
 =?utf-8?B?dFVkaTRwemRZUm5BclJsU3V2NjVLdm9ocHVlYTlRdzhTcW5DQlQ1cjU4b2hs?=
 =?utf-8?B?Y0pRSDZoTVkvSG52YkNsYlI4RjdNbFBRbmh0WFgrdUl6d1k4Mmo4NGdQUld0?=
 =?utf-8?B?TUN6RndSNTJwY1RJSlgrTGJVL0JPeVlUYWRLZ2Z4M3F1N2ZwRDVvSkxDbmJL?=
 =?utf-8?Q?GJPsEyCkb69hAczstLiS0A8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0de4ab-d1b6-4d20-0c37-08dd673b5773
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 23:11:12.6903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4dbBfBMuAnsOj6JXATX2NEQwyY5d0ijsz8mZf7KO6KD+eVMkQaoHU3TWEnf9IACvSWkk7bfFCYhkt5wzqI+T8AqqcUliy8YrI9yoxr49uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8740
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

I missed out some comments, adding it here:

On Wed, Mar 19, 2025 at 03:22:00PM -0700, Umesh Nerlige Ramappa wrote:
>On Wed, Mar 12, 2025 at 11:54:30AM +0530, Riana Tauro wrote:
>>Add a test that runs workload on all functions simultaneously and
>>validates that all engines are equally and fully loaded for the
>>entire execution quantum of the function
>>
>>v2: add a different function for function config
>>   add function details to log
>>   move pmu_fd to struct
>>   enable and provision VF's (Umesh)
>>
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>---
>>tests/intel/xe_pmu.c | 130 +++++++++++++++++++++++++++++++++++++++----
>>1 file changed, 120 insertions(+), 10 deletions(-)
>>
>>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>index 66edf24ad..a95ee1777 100644
>>--- a/tests/intel/xe_pmu.c
>>+++ b/tests/intel/xe_pmu.c
>>@@ -14,18 +14,22 @@
>>
>>#include "igt.h"
>>#include "igt_perf.h"
>>+#include "igt_sriov_device.h"
>>#include "igt_sysfs.h"
>>
>>#include "xe/xe_gt.h"
>>#include "xe/xe_ioctl.h"
>>#include "xe/xe_spin.h"
>>+#include "xe/xe_sriov_provisioning.h"
>>
>>#define SLEEP_DURATION 2 /* in seconds */
>>+#define TOTAL_EXEC_QUANTUM 128 /* in ms */
>>/* flag masks */
>>#define TEST_LOAD		BIT(0)
>>#define TEST_TRAILING_IDLE	BIT(1)
>>
>>const double tolerance = 0.1;
>>+char xe_device[NAME_MAX];
>
>These globals should be static.
>
>Optionally, for easier reviews, it's better to split the patch in two 
>- (1) make xe_device global (2) Add the engine activity test.
>
>With just the static change, this is
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Thanks,
>Umesh
>
>>
>>#define test_each_engine(test, fd, hwe) \
>>	igt_subtest_with_dynamic(test) \
>>@@ -92,7 +96,7 @@ static unsigned long read_idle_residency(int fd, int gt)
>>	return residency;
>>}
>>
>>-static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
>>+static uint64_t add_format_config(const char *format, uint64_t val)
>>{
>>	int ret;
>>	uint32_t shift;
>>@@ -105,26 +109,30 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
>>	return config;
>>}
>>
>>-static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>>+static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_instance *eci,
>>				 const char *event)
>>{
>>-	char xe_device[100];
>>	uint64_t pmu_config = 0;
>>	int ret;
>>
>>-	xe_perf_device(xe, xe_device, sizeof(xe_device));
>>	ret = perf_event_config(xe_device, event, &pmu_config);
>>	igt_assert(ret >= 0);
>>-	pmu_config |= add_format_config(xe_device, "gt", gt);
>>+	pmu_config |= add_format_config("gt", gt);
>>
>>	if (eci) {
>>-		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
>>-		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
>>+		pmu_config |= add_format_config("engine_class", eci->engine_class);
>>+		pmu_config |= add_format_config("engine_instance", eci->engine_instance);
>>	}
>>
>>	return pmu_config;
>>}
>>
>>+static uint64_t get_event_config_fn(unsigned int gt, int function,
>>+				    struct drm_xe_engine_class_instance *eci, const char *event)
>>+{
>>+	return get_event_config(gt, eci, event) | add_format_config("function", function);
>>+}
>>+
>>/**
>> * SUBTEST: engine-activity-idle
>> * Description: Test to validate engine activity shows no load when idle
>>@@ -144,10 +152,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
>>	uint32_t vm;
>>	int pmu_fd[2];
>>
>>-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>>+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
>>	pmu_fd[0] = open_group(fd, config, -1);
>>
>>-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>>+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
>>	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>>
>>	vm = xe_vm_create(fd, 0, 0);
>>@@ -188,6 +196,73 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
>>		igt_assert(!engine_active_ticks);
>>}
>>
>>+/**
>>+ * SUBTEST: all-fn-engine-activity-load
>>+ * Description: Test to validate engine activity by running load on all functions simultaneously
>>+ */
>>+static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
>>+{
>>+	uint64_t config, engine_active_ticks, engine_total_ticks;
>>+	uint64_t after[2 * num_fns], before[2 * num_fns];
>>+	struct pmu_function {
>>+		struct xe_cork *cork;
>>+		uint32_t vm;
>>+		uint64_t pmu_fd[2];
>>+		int fd;
>>+	} fn[num_fns];
>>+	int i;
>>+
>>+	fn[0].pmu_fd[0] = -1;
>>+	for (i = 0; i < num_fns; i++) {
>>+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-active-ticks");
>>+		fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>>+
>>+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-total-ticks");
>>+		fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>>+
>>+		if (i > 0)
>>+			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>>+		else
>>+			fn[i].fd = fd;
>>+
>>+		igt_assert_fd(fn[i].fd);
>>+
>>+		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>>+		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>>+		xe_cork_sync_start(fn[i].fd, fn[i].cork);
>>+	}
>>+
>>+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>>+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>>+
>>+	for (i = 0; i < num_fns; i++) {
>>+		int idx = i * 2;
>>+
>>+		xe_cork_sync_end(fn[i].fd, fn[i].cork);
>>+		engine_active_ticks = after[idx] - before[idx];
>>+		engine_total_ticks = after[idx + 1] - before[idx + 1];
>>+
>>+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
>>+			  after[idx], before[idx], engine_active_ticks);
>>+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
>>+			  after[idx + 1], before[idx + 1], engine_total_ticks);
>>+
>>+		if (fn[i].cork)
>>+			xe_cork_destroy(fn[i].fd, fn[i].cork);
>>+
>>+		xe_vm_destroy(fn[i].fd, fn[i].vm);
>>+
>>+		close(fn[i].pmu_fd[0]);
>>+		close(fn[i].pmu_fd[1]);
>>+
>>+		if (i > 0)
>>+			close(fn[i].fd);
>>+
>>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>>+	}
>>+}
>>+
>>/**
>> * SUBTEST: gt-c6-idle
>> * Description: Basic residency test to validate idle residency
>>@@ -202,7 +277,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>	uint64_t val;
>>
>>	/* Get the PMU config for the gt-c6 event */
>>-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
>>+	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
>>
>>	pmu_fd = open_pmu(xe, pmu_config);
>>
>>@@ -226,13 +301,34 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>	close(pmu_fd);
>>}
>>
>>+static unsigned int enable_and_provision_vfs(int fd)
>>+{
>>+	unsigned int gt, num_vfs;
>>+
>>+	igt_sriov_enable_vfs(fd, 2);
>>+	num_vfs = igt_sriov_get_enabled_vfs(fd);
>>+	igt_require(num_vfs);

igt_assert(num_vfs == 2)

I am thinking maybe you could use globals instead of the define and 
initialize them here.

	pf_quanta_msec = 64;
	vf_quanta_msec = 32;
	total_quanta = pf_quanta_msec + (num_vfs * vf_quanta_msec);

>>+
>>+	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
>>+	xe_for_each_gt(fd, gt) {
>>+		xe_sriov_set_sched_if_idle(fd, gt, 0);
>>+		for (int fn = 0; fn <= num_vfs; fn++)
>>+			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? TOTAL_EXEC_QUANTUM / 4 :
>>+						     TOTAL_EXEC_QUANTUM / 2);
>>+	}

maybe also cover the case for sched_if_idle = 1?

Thanks,
Umesh

>>+
>>+	return num_vfs;
>>+}
>>+
>>igt_main
>>{
>>	int fd, gt;
>>+	unsigned int num_fns;
>>	struct drm_xe_engine_class_instance *eci;
>>
>>	igt_fixture {
>>		fd = drm_open_driver(DRIVER_XE);
>>+		xe_perf_device(fd, xe_device, sizeof(xe_device));
>>	}
>>
>>	igt_describe("Validate PMU gt-c6 residency counters when idle");
>>@@ -254,6 +350,20 @@ igt_main
>>	test_each_engine("engine-activity-load", fd, eci)
>>		engine_activity(fd, eci, TEST_LOAD);
>>
>>+	igt_subtest_group {
>>+		igt_fixture {
>>+			igt_require(igt_sriov_is_pf(fd));
>>+			num_fns = enable_and_provision_vfs(fd) + 1;

How does this work if VFs are already provisioned before starting the 
test?


>>+		}
>>+
>>+		igt_describe("Validate engine activity on all functions");
>>+		test_each_engine("all-fn-engine-activity-load", fd, eci)
>>+			engine_activity_all_fn(fd, eci, num_fns);
>>+
>>+		igt_fixture
>>+			igt_sriov_disable_vfs(fd);
>>+	}
>>+
>>	igt_fixture {
>>		close(fd);
>>	}
>>-- 
>>2.47.1
>>
