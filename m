Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07220D6E2B7
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 22:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC3610E3E0;
	Thu, 18 Dec 2025 22:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0spa2nX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A89010E3E0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766096836; x=1797632836;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0hoz8nTdtylL6sb4xV8IHf1Mp88hb+dtZXynSYiTNnE=;
 b=W0spa2nXJdEaazKx9hkgQkmx4ImEL1X+bO80vWke4zdb13XzQcBbNnna
 vXMNT1obq/HQdmzGDVNMEyZH7oHHtK8kKh12KAQKRMrQDRWUmLgusvv2U
 fUn2bsmgt/rjwYbNkaknvgLjuXtsyCJViev1HzD+7AH1wKKKJBb+RAdd2
 gnlSd6RVQio64AM89fSywNR555fH191z9Cs08g2IEbjlqiD5DNlS0AHFV
 iW2keZUMiQArmAoARhkEA0Ft1L9V+7uxc5Qc4UkB7s/P3JA1gAk1z3ZwH
 VGPmJ181q8ft29fCWXKg146z14Op8D4U3qQ90lT1QIxqusAW81ChoPjVz Q==;
X-CSE-ConnectionGUID: ghwCeyuWSbSDvDOd0/9yOA==
X-CSE-MsgGUID: cJgl/wVsRpqtYGLMYLK+Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="85481348"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="85481348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:27:15 -0800
X-CSE-ConnectionGUID: 9uxolM6jQy6RDIHpG5VMpQ==
X-CSE-MsgGUID: YcFFhQLvRJmHGaLzsvlaxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="203785221"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 14:27:15 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:27:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 14:27:13 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 14:27:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnOOn5HZiT0otqURgGRBkJR3dPU3Ob9wweiDVmZtwMpIHVcwuKGX5ofTnIoF/X7l51Qxh8pQLsctsTzG6WG5ql5e0eg6iFwJ3L8reKwdO4VTLvncCkxfZ5gYXB5x8MlxZcfzfhgOXBgkTWwgHu0N1sr28qZvhBFdjH8nI+B+t736CHMItZ6uCBepbdmSdBTwxA21hW8VBf1bDqKC2Pd+9DINOMMRmO/NoDMY6oXRxtIrgiWR8ItXQ0jtE05+2Qg6cxJ8aMrp5Taf8VApXfG+torPJBeMyhHpA4nIb88WhZocwWKZ8NBO4chBuYsfEWix5Zk+wuUr8NFLJvnJ5j51RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZykWV7UWNmiTx0tYXgNAe5Sk5xtrhtVaJSOFkujtWgs=;
 b=vh34gMwsU8DKU312Lb+xtRPW38zHIj/Pbtg2GWn0X3YIGVa2o58kdCQ9hywY6n2n5Pi2AteAtn9L7RJ7HFH1AvHQmxYqRTOs5w9LC4fkMPMTXau5jXZEaXI8obKEX5pqdwrEhBacHhcQWqr4CtxxkTHs0GIDNAOYj44fT3aUGTXbwfL/FjG2agbkY2tz/n9HJ9MXBafoTcSz+3mLxZVgk3FfrTo8BM/cYuQOB+GOJrfXcZCoociuEhdq6EO2LQFoV4qgoqIb36T15+o5xa3fgxxXsU0io7/MC1P+aNGiWqzyMKn7fEJGgc8xH+yD31qVc8MVCNQdkyTTLnW0rmVqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 22:27:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 22:27:11 +0000
Date: Thu, 18 Dec 2025 14:27:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
Message-ID: <20251218222708.GM4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
 <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
X-ClientProxiedBy: SJ0PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0a0b11-7dd1-4181-6729-08de3e849601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEpLWGRsR09scmR1Z25xendCczcwaVZXLzhsWVlTMEtOSFVTOHY2aHZCUGxE?=
 =?utf-8?B?cE1ob01GQ2tzU29GSW1YVEdFWEZLZFpUaTVqai91eUlRUk9VbGE3ZTVBeDRm?=
 =?utf-8?B?WmxwZGdMNGtUV2xQTFlCUnlYVjhiWTNVZFRWbTRzQUVrZEtoSkRZVkxoMWM3?=
 =?utf-8?B?cFkvWjMzTmJ2QXN6L0llQWk4S1hqQXd3U1RNSkdNQlU1dUhaR01CdU91d3Jw?=
 =?utf-8?B?a1drdHA0eHdma2xzdjhKMFlrc0ZYSGJsdG1rYWlaWmZsRENpSFdGbkYwMk5s?=
 =?utf-8?B?WXFENW4rK25yVXFiTkhIdDBkbG5Ca2hUenBtU2tZTHo4cXlENFZDYnJ1Wkxr?=
 =?utf-8?B?OUJaa0VtL0VEYkpRRWQ2SkgweFYzMDhiUHFiZ0tpWEJuV2trRC8vVUdkYzhK?=
 =?utf-8?B?czZVU2JpUXNHY3RUUXVqWjRZcEtML2JxU1FnS05xL1dlbGVWN015aGxXUVI0?=
 =?utf-8?B?dU5tL3k4TExhSy84cDJKNXVYdXdVSkZMTXJ1Mkx3ZGFzWTJlSWpkLzJoVE5V?=
 =?utf-8?B?YkRLT2R5UDRCa25jK1RVUEhsdlNxMThXSnhKOXp5RngyMm9yaEFwZnlLRWdP?=
 =?utf-8?B?ZjhTMTJya2YwVGtHUTlING05M3VvTmRUeG1UQmVqT0xramJ3bDRsNVFDbmRB?=
 =?utf-8?B?b0pjM0JwSnRLQjgzZmtCck00YUpDMmx4ZTFYREV1dFM2WFpRWXRCSGowQWFZ?=
 =?utf-8?B?KzRkRVFLUURocjRXK2orV3pKVmozVExLNzFOcnJ3RVdCYSthOXdWZjNFMkJO?=
 =?utf-8?B?aE9GdE1SQU9DVjN2SERNOGxISG1IL0VYMThKUW5aa0oxQUYyTDhSbWo5amdR?=
 =?utf-8?B?VzJmNldGMko5KytrbGF3NHFEZHBSQU42T0hNai9vY3pyMWNEUDBKdGVCNEkv?=
 =?utf-8?B?Q2lrSkp6T3JtUW9Kb1RxZmowQjMyaTJBVzRqa0M0VW15SmZ5WCt1SUp1eEhN?=
 =?utf-8?B?ek4xMTF6UXVIRjUxaE1JRUtSVUc3Q2tUUmd4VUxXWDE0TnZJZ2xUc0NuazZW?=
 =?utf-8?B?NHpkMUJGamowRDlmMDRFeDRJOUV3Y09lWGxSKzRuNitlOGtad055Tzk0dy9a?=
 =?utf-8?B?WEM3dmZNQzF2N1RyTmg5M3JlN1VWZnRTZ3NZSDRMU0VPakhzWmpJKzQ2Skhw?=
 =?utf-8?B?WUtvaHhHcWFMZThHWS82UnVRbVl4TXp6WTBnV2ZFRzU3ZHdnQkJvbjdSNkFT?=
 =?utf-8?B?NjIyZmlZWng0Q0tPSnc5eFZUbVM5a0lQWDJOSXJXWFBHRTl0a0xiL0hTbzJG?=
 =?utf-8?B?QytTV1ZCRUQ3L3plZkpTQXM5QldxRXZEcVp3YmVhSi9qenlTVFhwUDhQRHVt?=
 =?utf-8?B?Tmp4dUUvWHVWSGZENllKQWgwbGtWVUE4dXVMWG80TzZFb2REN1lBNkd2RGJE?=
 =?utf-8?B?VS9JRmlGeUppczNNT1ZPRTlabEVVWW42aG5jNjlmcDQvKzJOWTcwU3N0bS9t?=
 =?utf-8?B?SlNqdVJTTFBHVFUzS3YrSm16b3RFTW5GSFRCQzMrSEloN05mUC9oeGhqVnlI?=
 =?utf-8?B?VmtmcDdmL3NpT2FZSUFyZmRaVmRhZWg4c0FicnlySVRDNVNvNjIyTWRYcHNj?=
 =?utf-8?B?dU1DcVhDakZLTkZXZzBMK1U3R0hEMGVCQ3R2Qk40REdBV3l4bHdha2hkaFh6?=
 =?utf-8?B?WHJhSyt5aysvSkYyLzJPbURVR1FudFJwTzBwU3ZjdEx0ajcrOEJFRHFad2VV?=
 =?utf-8?B?a0RnVGZWU0ZzMVVib2RsTi9MUXExYk1BZkg0cVd5djU4Y0VWeDUyWExETHhH?=
 =?utf-8?B?U1FBbG1IYkJoa2NHRmkrd05sMEEzaEU0NmgwYm5rWXJTcTA0VUZtbjRVdmkz?=
 =?utf-8?B?bC9BSXBZMEltYmwzRk9IVlFxaWZ5SFBHSGMyVCtjZEUrRlA2d01oMDFVTkE1?=
 =?utf-8?B?UFptOEhTRU5BUlFoMG12dUJpSFpMbC9FZUF5N1R6dThaaG9qS21jL1hZNEhH?=
 =?utf-8?Q?w9fBbA93F61+evx6mz1Xh2mXt18sxDFh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJLZmNnTnpiQk1jQnZvaTNVc2ZYNVNOdDBqSTZ5TllOcXNlRlJha2gzLzNh?=
 =?utf-8?B?Y3BKOE5IeWpLVE1nZ1VrSnl1YzdWYitMT0RiVmFuNFNlK3dMUmN6MUtXSlBK?=
 =?utf-8?B?Wk9DRGdRSkZOUENoaGJhRDMyQlVCZmpiT0hQcVErbVdGdWhESzRTaTZCaFZl?=
 =?utf-8?B?c1FSY3N0OEVISm9lWWlBdWFJUkRER2xUd0RLeWJZQWdCcTdUUlppKzZJU2h1?=
 =?utf-8?B?Q3NPSGlTVW82MXZBRHUyckhVNEs2U1pTdzd4RGtzejhKRVRUWHR2SS9HQXll?=
 =?utf-8?B?OUlRTlFLVEN2bTVrQVBxSDRkdnliaCs4bVdIQlZ5RzFtaVpQdCs1bHhaS3RV?=
 =?utf-8?B?S09UNktkQzBPUDk4UUJ1T1hHYzRxMk9mSjZjT01jeFJDTjdGSVBtMStyZGtZ?=
 =?utf-8?B?dmc0SGhpeGtxdGw3Q2kzV0JhVzQ1cEdiTjBuVWFqVU93bktwMTRWUzZNY0Zs?=
 =?utf-8?B?djhEOWJWMk9SU1FmQzhMYmQxdFlpSS9DWVpBbDJEV2VGV0VWdFMvR0JLQ05y?=
 =?utf-8?B?V0xYaSt2cGg3dkNxeUxGZG5qSXRGY3o3UlNiVFpZenBBTHVMK1kwTzc3OWxs?=
 =?utf-8?B?UEZUeS8xZTRYaFhrVHdSRGdMR1VYSEJxcnk0dVphSy8xMlU1b3VQM2dUekg3?=
 =?utf-8?B?OEtCRXJoNmlaUWFIVzMyMzFYM2RpWXcybmFER1V2aHcrQm9IazFSaVFuMTN2?=
 =?utf-8?B?QXN6anBGRVI1a3E2NkM1eWlqc2NjUTFhUzREYjFHdENWNmVMT0ZyUFVOSDBm?=
 =?utf-8?B?eTYzVy9YVElLMWhGRGJQMnMveDF0b2lTenBsK3ZjdWsxM0djRksvRXY5WFYr?=
 =?utf-8?B?TDY2T0phdXdGaW1zQW5INlFjSllSS2JjT0NsRjBwWWVhVENsWnJyV01nYmtU?=
 =?utf-8?B?UzNXdDFwVTd5YytTM1lhK1NMZG1MUFp3VElnRU9qODhKL3Y0Tmx0Mm5ZOFlT?=
 =?utf-8?B?V0x2QUFXZUsrRXZNdUZDUlU3cVBvMlh5U2dNSW10M3V4Mlkvd1YrNUxXalZM?=
 =?utf-8?B?aHhsUkpsZDRIOUYybTVMbjAzYVQ1UjFYYVpMcTdxdVFoMVRKaVVEK1h5aW1v?=
 =?utf-8?B?UHhBRTRNSnRHcERyVUdjRXF5ZWFyQ3lFWHY5K3ZiVys2TEVpcGpRK3RoR1Bu?=
 =?utf-8?B?TW01ZnpoVzF4UEozMktNTmxtTnF1V09UUUh2OERPOVhRWjlDbGczekM0LzZu?=
 =?utf-8?B?Rm1zSWVTM1V1dnQ1Sy9EQ2N6WTQ5L2RJbDRRaW1sNys0OHFFbWJoQmRhZTBj?=
 =?utf-8?B?YjdBOTJsM2tyWXJDZ2gySnhrOGN6TjlVN2ZUeUJNWEJNZ1RiQzQzRGcrU1VG?=
 =?utf-8?B?Uk9GQzBaOGpKRVgwaDdXOURBNEtqaHVkMU52SEJlc1VEeXBjeHh2Y2ZKd2FY?=
 =?utf-8?B?V2RmWm0wbTFld25IcTZ5VWNOQnJONk9DSHVmdkRtR216eWJwSm1vVWF5VFk0?=
 =?utf-8?B?bTl2MGt3cXp5UHdzTlJTRk12by9SRTlxczZFTHZyQUplVmI5Z1NFdC93SUVy?=
 =?utf-8?B?V2JqRDZmRzVSQXI4VWlFK2g3UVlDWXliUEI3VjJscFBBeDM5eFhZZmlQSktF?=
 =?utf-8?B?K2Z0VzJEQytMVmxwNzk1Q0ZveVYzN0JyeG05K3dWQ0RWanVoeFRlc0VjcjhV?=
 =?utf-8?B?V1dQdzFZVTMxTnJJbU45aWpQT3pGSzRCdllGcGw3NWZXVGdOU005TGR2Wkxr?=
 =?utf-8?B?YTRPVEZGTks2RXp6OVFlRTRVdDNOUDJyYWdvcjF3TlRpMzI0TlBoWUNnbmZp?=
 =?utf-8?B?Z0hXTlcrZ1NaanVMNGtlclZteGxIMC9tN2pjMnpSRjFiN2hnK01YVE9Qb0JG?=
 =?utf-8?B?ZVdRYzdPVnpwV3QrNXA0WlNiQkxTRUhXVW5TbXRJeDBBM0doZE5CV1c0amFx?=
 =?utf-8?B?MVZhV0pzbUxsendZQnRGbUM0bnVLYy83VzA4MGhwNmc3cXl2WjdjWm4zYUoz?=
 =?utf-8?B?bUo0eU8yY21RVCtrTnloekhWbWNFZ3Q5WUplKy9yQWJIRG1TU3A4dmVab2xR?=
 =?utf-8?B?UGF1d0cyYkpVU2w4TnpJVExaUVVHaUhUQmg5Sm1HWDNZbk9MWmdLYTVKa3lW?=
 =?utf-8?B?Skllb2VjbnptWGVFbEhmSmZsK1Mrang3Y0tnd2pKQ1RwS2YyWExKYzhXYW03?=
 =?utf-8?B?OElSSVd6UVF5MjN1WFJOUVE5alROM054L1d4SzdlTEV4RWdiYlUzd3FnVlRG?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0a0b11-7dd1-4181-6729-08de3e849601
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 22:27:10.9077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcOQmZYSAZt1cihQX+Ba3Q6mVVqteGV1DchatiNdfwKBIqkeMzthZDrIV08Yj1wZQ894hQHZIDc/cjxb3mLMUF7h/hA+gbIYGKAsyZjxIb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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

On Wed, Dec 17, 2025 at 06:43:42PM -0800, Wang, X wrote:
> 
> 
> On 12/17/2025 11:15, Matt Roper wrote:
> > On Wed, Dec 17, 2025 at 08:07:27AM +0000, Xin Wang wrote:
> > > Parse the PAT software configuration from gt0/pat_sw_config instead
> > > of relying on hard-coded indices.
> > > 
> > > V2: (Kamil)
> > > - Show a detailed skip info when opening the debugfs file fails.
> > > V3:
> > > - Save the Xe PAT software configuration into the xe_dev structure
> > >    to prevent scenarios where certain test cases drop root privileges
> > >    after execution begins, which could block access to debugfs.
> > > V4:
> > > - Cache the parsed PAT table the first time we read pat_sw_config
> > >    and reuse it for subsequent calls. This avoids repeated debugfs
> > >    opens (and failures) in tests that drop root between steps, while
> > >    still returning the correct PAT layout.
> > > V5:
> > > - Make PAT debugfs parsing lazy: avoid requiring debugfs from
> > >    xe_device_get(), so tests that don't need PAT won't be skipped.
> > > - If PAT info isn't available at device init, keep pat_sw_config empty
> > >    and only require debugfs when PAT indices are requested.
> > > - Add xe_get_pat_entries() helper to expose the parsed PAT entry table.
> > > 
> > > CC: Shuicheng Lin <shuicheng.lin@intel.com>
> > > CC: Kamil Konieczny <kamil.konieczny@intel.com>
> > > CC: Matt Roper <matthew.d.roper@intel.com>
> > > CC: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >   lib/intel_pat.c   | 140 ++++++++++++++++++++++++++++++++++++++--------
> > >   lib/intel_pat.h   |  21 +++++++
> > >   lib/xe/xe_query.c |   6 ++
> > >   lib/xe/xe_query.h |   4 ++
> > >   4 files changed, 148 insertions(+), 23 deletions(-)
> > > 
> > > diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> > > index e3588110a..46f6cd884 100644
> > > --- a/lib/intel_pat.c
> > > +++ b/lib/intel_pat.c
> > > @@ -3,37 +3,118 @@
> > >    * Copyright © 2023 Intel Corporation
> > >    */
> > > +#include "igt.h"
> > >   #include "intel_pat.h"
> > > +#include "xe/xe_query.h"
> > > +
> > > +/**
> > > + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
> > > + * from debugfs
> > > + *
> > > + * @drm_fd: DRM device fd to use with igt_debugfs_open
> > > + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
> > > + *
> > > + * Returns: The number of PAT entries successfully read on success, or a negative error
> > > + *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
> > > + */
> > > +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> > > +{
> > > +	char *line = NULL;
> > > +	size_t line_len = 0;
> > > +	ssize_t nread;
> > > +	int32_t parsed = 0;
> > > +	int dbgfs_fd;
> > > +	FILE *dbgfs_file = NULL;
> > > +	static __thread struct intel_pat_cache cached_pat;
> > > +
> > > +	/* Return cached value if already read for this thread */
> > > +	if (cached_pat.max_index != 0) {
> > > +		*xe_pat_cache = cached_pat;
> > > +		return cached_pat.max_index + 1;
> > > +	}
> > I'm not sure we really need to worry about caching the results here.  Is
> > this getting re-called repeatedly in a single test to the point where
> > it's creating a real performance problem for our tests?  If not, we can
> > probably just keep it simple and re-read the debugfs if this function
> > gets called multiple times.
> The main reason for caching in xe_get_pat_sw_config() is not performance,
> but
> correctness in the presence of privilege changes. In
> 
> igt@xe_oa@unprivileged-single-ctx-counters
> igt@xe_oa@mmio-triggered-reports
> igt@xe_oa@mmio-triggered-reports-read
> 
> these tests drop root privileges mid-run; after that, accessing debugfs can
> legitimately fail, and without caching the PAT layout we can end up
> re-parsing
> (or failing to parse) the table later in the same test run even though it
> was
> available earlier.

This sounds like a bug in the tests themselves.  As Zbigniew said, the
tests need to be fixed to obtain the information they need before they
give up the ability to access it.  I don't think we want to be adding
workarounds to the library itself when fixing the tests would be a
cleaner and simpler solution.

> 
> My current approach is a compromise with some trade-offs.
> 
> On the first open of the device fd, we try to read pat_sw_config from
> debugfs
> once and cache the parsed result in the xe_dev structure. After that, we try
> to rely on the cached xe_dev from cache.map rather than reopening and
> reparsing
> the debugfs file repeatedly.
> 
> However, if a test doesn’t actually use the PAT table (or is running on a
> kernel that doesn’t expose/support pat_sw_config), then forcing a hard
> failure
> during xe_device_get() would be unnecessary and could cause unrelated tests

I don't think we need to put everything into xe_device_get().  That
function is mainly collecting information acquired via the ioctl query
interface, which mimics what "regular userspace" would do.  In contrast
PAT information comes from debugfs which is a test-specific backchannel
(regular software shouldn't be using it) so I think it's fine to acquire
it separately and explicitly in the tests that want it, and to require
that tests that want it grab it before they drop privileges.


Matt

> to abort/skip. To avoid that, I changed the logic in xe_device_get() to only
> attempt to read the PAT config and tolerate failure there. We only report
> an error later, when a test actually calls intel_get_pat_idx() (i.e., when
> PAT information is truly needed).
> > I think we should really try to minimize / eliminate the whole "use a
> > static variable as a cached result" pattern.  It leads to inconsistency
> > (and possibly mistakes) when we implicitly cache some types of lookups
> > that IGT libraries do, but not others.  And honestly using static
> > variables this way just feels kind of hacky.  I think needing to add
> > implicit caches like this is really more a signal that the function
> > interface we're using isn't very good and could use some refactoring.
> > For example for the PAT stuff, we currently have a bunch of API's that
> > take a device (fd) as a parameter and return one little piece of
> > information.  If we want to improve that and eliminate redundant
> > querying/parsing, it would be better to recognize that if a test/tool is
> > working with PAT in the first place, it's likely to need several pieces
> > of PAT information and define our library API accordingly.
> Regarding the “static variable as a cached result” pattern: I agree it’s not
> ideal.
> Longer-term, we should move toward a more natural API where callers fetch
> the PAT
> table once (or xe_dev provides an explicit “ensure/prefetch PAT” helper) and
> then
> query UC/WB/WT/etc from that in-memory table. I can follow up with such an
> API
> refactor; for this series I tried to keep the change minimal while fixing
> the
> privilege-drop correctness issue.
> 
> 
> > For example, if a test wants to get the UC, WB, and WT PAT indices,
> > today it does something like
> > 
> >          pat_uc = intel_get_pat_idx_uc(fd);
> >          pat_wb = intel_get_pat_idx_wb(fd);
> >          pat_wt = intel_get_pat_idx_wt(fd);
> > 
> > which triggers three separate debugfs open+parse operations unless we do
> > some implicit caching inside the PAT library.  I think it would be
> > better to just redefine the library interface to something more natural
> > like:
> > 
> >          pat_table = xe_get_pat_sw_config(fd);
> >          if (!pat_table)
> >                  // error
> > 
> >          pat_uc = intel_get_pat_idx_uc(pat_table);
> >          pat_wb = intel_get_pat_idx_uc(pat_table);
> >          pat_wt = intel_get_pat_idx_uc(pat_table);
> > 
> >          free(pat_table);
> > 
> > so that the data is only queried once, and then the caller is empowered
> > to manage its lifetime and do further caching (e.g., stashing the whole
> > table in a 'struct xe_device') as it sees fit.
> > 
> > 
> > Matt
> > 
> > > -#include "igt.h"
> > > +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
> > > +	if (dbgfs_fd < 0)
> > > +		return -ENOENT;
> > > +	dbgfs_file = fdopen(dbgfs_fd, "r");
> > > +	if (!dbgfs_file) {
> > > +		close(dbgfs_fd);
> > > +		return -errno;
> > > +	}
> > > -struct intel_pat_cache {
> > > -	uint8_t uc; /* UC + COH_NONE */
> > > -	uint8_t wt; /* WT + COH_NONE */
> > > -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> > > -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> > > -	uint8_t max_index;
> > > -};
> > > +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> > > +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
> > > +		uint32_t value = 0;
> > > +		char *p = NULL;
> > > +
> > > +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
> > > +		if (strncmp(line, "PAT[", 4) == 0) {
> > > +			bool is_reserved;
> > > +			p = strstr(line, "(");
> > > +			if (p && sscanf(p, "(%x", &value) == 1) {
> > > +				if (parsed < XE_PAT_MAX_ENTRIES) {
> > > +					is_reserved = strchr(line, '*') != NULL;
> > > +					xe_pat_cache->entries[parsed].pat = value;
> > > +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
> > > +					xe_pat_cache->max_index = parsed;
> > > +					parsed++;
> > > +
> > > +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
> > > +						  parsed - 1, value,
> > > +						  is_reserved ? " (reserved)" : "");
> > > +				} else {
> > > +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
> > > +				}
> > > +			} else {
> > > +				igt_warn("Failed to parse PAT entry line: %s\n", line);
> > > +			}
> > > +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
> > > +			p = strstr(line, "(");
> > > +			if (p && sscanf(p, "(%x", &value) == 1)
> > > +				xe_pat_cache->pat_mode = value;
> > > +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
> > > +			p = strstr(line, "(");
> > > +			if (p && sscanf(p, "(%x", &value) == 1)
> > > +				xe_pat_cache->pat_ats = value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
> > > +			p = strstr(line, "=");
> > > +			if (p && sscanf(p, "= %d", &value) == 1)
> > > +				xe_pat_cache->uc = value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
> > > +			p = strstr(line, "=");
> > > +			if (p && sscanf(p, "= %d", &value) == 1)
> > > +				xe_pat_cache->wt = value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
> > > +			p = strstr(line, "=");
> > > +			if (p && sscanf(p, "= %d", &value) == 1)
> > > +				xe_pat_cache->wb = value;
> > > +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
> > > +			p = strstr(line, "=");
> > > +			if (p && sscanf(p, "= %d", &value) == 1)
> > > +				xe_pat_cache->uc_comp = value;
> > > +		}
> > > +	}
> > > +
> > > +	free(line);
> > > +	fclose(dbgfs_file);
> > > +	cached_pat = *xe_pat_cache;
> > > +
> > > +	return parsed;
> > > +}
> > >   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
> > >   {
> > >   	uint16_t dev_id = intel_get_drm_devid(fd);
> > > -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> > > -		pat->uc = 3;
> > > -		pat->wb = 2;
> > > -		pat->max_index = 31;
> > > -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> > > -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> > > -		pat->uc = 3;
> > > -		pat->wt = 15; /* Compressed + WB-transient */
> > > -		pat->wb = 2;
> > > -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> > > -		pat->max_index = 31;
> > > -
> > > -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> > '> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> > > -			pat->max_index -= 4;
> > > +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> > > +		struct xe_device *xe_dev = xe_device_get(fd);
> > > +		memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
> > > +		if (pat->max_index == 0) {
> > > +			/* If PAT info is not available, try to read it now */
> > > +			igt_require_f(xe_get_pat_sw_config(fd, pat) > 0,
> > > +				      "Unable to open the pat_sw_config file in debugfs.\n");
> > > +			memcpy(&xe_dev->pat_sw_config, pat, sizeof(*pat));
> > > +		}
> In the next revision I’ll simplify this block to only fetch/require the PAT
> config into xe_dev->pat_sw_config when needed, and then do a single memcpy()
> into the caller’s pat:
> 
>         if (xe_dev->pat_sw_config.max_index == 0) {
>             igt_require_f(xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) >
> 0,
>                           "Unable to open the pat_sw_config file in
> debugfs.\n");
>         }
>         memcpy(pat, &xe_dev->pat_sw_config, sizeof(*pat));
> 
> This keeps the same lazy behavior (no hard dependency during
> xe_device_get()),
> while making the flow clearer and avoiding the redundant memcpy().
> 
> Xin
> > >   	} else if (IS_METEORLAKE(dev_id)) {
> > >   		pat->uc = 2;
> > >   		pat->wt = 1;
> > > @@ -96,3 +177,16 @@ uint8_t intel_get_pat_idx_wb(int fd)
> > >   	intel_get_pat_idx(fd, &pat);
> > >   	return pat.wb;
> > >   }
> > > +
> > > +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry)
> > > +{
> > > +	struct intel_pat_cache pat = {};
> > > +	uint8_t max_index;
> > > +
> > > +	intel_get_pat_idx(drm_fd, &pat);
> > > +	max_index = pat.max_index;
> > > +
> > > +	memcpy(entry, pat.entries, (max_index + 1) * sizeof(*entry));
> > > +
> > > +	return max_index + 1;
> > > +}
> > > diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> > > index eb48cbc65..48ee10c0e 100644
> > > --- a/lib/intel_pat.h
> > > +++ b/lib/intel_pat.h
> > > @@ -6,9 +6,27 @@
> > >   #ifndef INTEL_PAT_H
> > >   #define INTEL_PAT_H
> > > +#include <stdbool.h>
> > >   #include <stdint.h>
> > >   #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
> > > +#define XE_PAT_MAX_ENTRIES 32
> > > +
> > > +struct xe_pat_entry {
> > > +	uint32_t pat;
> > > +	bool rsvd;
> > > +};
> > > +
> > > +struct intel_pat_cache {
> > > +	uint8_t uc; /* UC + COH_NONE */
> > > +	uint8_t wt; /* WT + COH_NONE */
> > > +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> > > +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> > > +	uint8_t max_index;
> > > +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> > > +	uint32_t pat_mode;
> > > +	uint32_t pat_ats;
> > > +};
> > >   uint8_t intel_get_max_pat_index(int fd);
> > > @@ -18,4 +36,7 @@ uint8_t intel_get_pat_idx_wb(int fd);
> > >   uint8_t intel_get_pat_idx_uc_comp(int fd);
> > > +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
> > > +uint8_t xe_get_pat_entries(int drm_fd, struct xe_pat_entry *entry);
> > > +
> > >   #endif /* INTEL_PAT_H */
> > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > index 981d76948..a456aa44e 100644
> > > --- a/lib/xe/xe_query.c
> > > +++ b/lib/xe/xe_query.c
> > > @@ -299,6 +299,12 @@ struct xe_device *xe_device_get(int fd)
> > >   	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
> > >   	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
> > > +	/* Populate PAT software configuration */
> > > +	if (xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) < 0) {
> > > +		/* If PAT info is not available, zero it out */
> > > +		memset(&xe_dev->pat_sw_config, 0, sizeof(xe_dev->pat_sw_config));
> > > +	}
> > > +
> > >   	/* We may get here from multiple threads, use first cached xe_dev */
> > >   	pthread_mutex_lock(&cache.cache_mutex);
> > >   	prev = find_in_cache_unlocked(fd);
> > > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > > index d7a9f95f9..12cae99d9 100644
> > > --- a/lib/xe/xe_query.h
> > > +++ b/lib/xe/xe_query.h
> > > @@ -12,6 +12,7 @@
> > >   #include <stdint.h>
> > >   #include <xe_drm.h>
> > > +#include "intel_pat.h"
> > >   #include "igt_aux.h"
> > >   #include "igt_list.h"
> > >   #include "igt_sizes.h"
> > > @@ -74,6 +75,9 @@ struct xe_device {
> > >   	/** @dev_id: Device id of xe device */
> > >   	uint16_t dev_id;
> > > +
> > > +	/** @pat_sw_config: Xe PAT software configuration */
> > > +	struct intel_pat_cache pat_sw_config;
> > >   };
> > >   #define xe_for_each_engine(__fd, __hwe) \
> > > -- 
> > > 2.43.0
> > > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
