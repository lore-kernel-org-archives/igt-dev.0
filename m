Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD1DCE7D10
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 10:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB710E108;
	Tue,  1 Oct 2024 10:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nL3HYQlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301F110E108
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727780354; x=1759316354;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7V6TD7NfRsS00lMH8AxNV30qlkV2uzntaM3Nb1zV8EU=;
 b=nL3HYQlCJ3uSHyH3fSn1Q82faEB5EQ/Oa9FlMCt9lQHIr2d/CFUwruVB
 GRQj1e96biCkMkiNRxGqdbHX482ia7YVan3mHH5oGspA2aH+XfM5Yhj1O
 Vn60t9zYIZ+IwvJHJFutlEzEPJQB6+1CiZBs1fIevvJax7g7UWW/HWMww
 wyb+fab5aSDtshlrryy6oUT+SEOM38HlXN6oMD8mp5Naq6C8N9zgS+3Q4
 ACF0aD+aC8/TV/p3DW5w3f8QY/bmmCIJEi2XjfE62lkw99PyNGMioHW9S
 N801abVp9UKw87IE2I2AtNCOxMfeiB9u+DwODu1V5Gu79BL4mSduCftYP Q==;
X-CSE-ConnectionGUID: FeUpoLOmSSKOxQv+WF9qOQ==
X-CSE-MsgGUID: n4Vy41u1S3qc+POyynE7wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27002301"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27002301"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 03:59:13 -0700
X-CSE-ConnectionGUID: RuhRV4ArQKGT6aS0tskx9w==
X-CSE-MsgGUID: WNKVS4XdQMmNhugqSV01Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78368901"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 03:59:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 03:59:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 03:59:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 03:59:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUKSZnoAZr+gA8G7OzRqGIXjsX1naGXsbdD5PlhE5yYOs2pqgaSmJovNbH31DHEWIT6T1SrL4Qz7NvDSrKotw6eRISdPFD4i0wCeAFrR4gpNS6L1dPWOw9KxlQSr3Qx4OtywOJG6Y1LKJWYSf7jXW268KRJhjZvkwnRQBOaWvoxJF35kG3si6f7ntQTuaNHxQhD7GuZqYE8Yt/TwNKLK7xUXxkQWGgEKg9VRRRL/hhPX8vkN1lb5tiSX2zkQRtGPpbbFReZWr7f5t4l41lIJMnSA1jXp7Co+I0psgYV2K7woVPMGBykNk5PTG8yQZhP6fCFf+gyXDh+0N0i+LrTIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eygJFwC+ETRuF39w1GARkaQ2wL5Xtxx+cL91UaP/2rU=;
 b=AKpZfRE8Z7s9zIfQp46ie+8gnWv/g7fyYqzcpMc1oM7Gew89RX6fz9NhQPW1gelzHaDlOiibOt+ZfRnXadYi9fjgFj4dbDp//igAOZSvxlWt5SVKVJp/ukMwuIsLBP201kYB4OMRgGg+w4s2DgyFdbvOC7B2cWhEieXwDwQRmgh0EP/dofutHWA2O9atOz9vdHNV8DSiNRrWc3QVCI//iVfrzS2HB2iLOUzI/cseBH/zFqTdO2/aUUd88V0IL0/wYc9ineIVMnSypUht4Ow0XB1t+IAINVTEG88PNRUSHm/kLyP1Lfr+7s4IPJQfATb3kw5q8yossSECtbqZkz75gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 10:59:09 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 10:59:09 +0000
Message-ID: <9599c8c2-96ff-4801-bf3d-18b046598426@intel.com>
Date: Tue, 1 Oct 2024 16:29:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_joiner: Reset the force_joiner_supported
 variable
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241001094506.25037-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241001094506.25037-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: dd862464-8656-430a-0abf-08dce2081347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzN0VEFyZTFhcU5qemlkR2hkeWROT0RjZnFSSWF1ZC91Zi9VNkoxRHBySDBq?=
 =?utf-8?B?cXlmMEUrbVAwWHVKQ1ZwWTBEMFJiQUlNZDljZlV6NGtqSjc5aElSUHpMVmVQ?=
 =?utf-8?B?Tk44M0FDdnVLdG9HRTdrUE42K1BXOUR2YmlIY01JTGVaZEVXQTAvK3dlNjAy?=
 =?utf-8?B?blBMbXoyS2ZnNnB2Mm9qQlFBemMwOTdURjUwendSYUdLaFVDQXVOYjFwdSt0?=
 =?utf-8?B?QlhDMjhHTnBjQ2ZRaWlwWExVT2Nsd3NudWRrTlJHMWNYQTJvSlpNTUpNWVBZ?=
 =?utf-8?B?Ry9ySmZDdlM2RTh1bnJaUm5hdzVYTDljd3RaZW9pT2h4amlVdG1NSHViY0JP?=
 =?utf-8?B?RlhpZHpmN1FHYjQvZ1ZoR0ZrQnU0a0p5cTU3VEtXVEQ5SHFLVmhpWndTSTFn?=
 =?utf-8?B?eVVXcHh5S1JQd2wxdUtRUXVwQStLeUlvMWE1UHhFajkzb29HemFmSDVtRHZV?=
 =?utf-8?B?REprZW9PeXhSZ3lVSjFQbXNXb3NuTWl3d1FLMVRMaGxtVm9qNmR5c05seEZr?=
 =?utf-8?B?ZkdUYzJJUzc3cEdQUEllOHFpeU92RHVoaUFGbFl4c1A1NUF5Rm1DQ1NJSTdQ?=
 =?utf-8?B?bHBzVnBOSVVDR3hyNld4SGdYRmgxeXBycitsWXBERXdDZm1xWFB5T2ZuMktB?=
 =?utf-8?B?RWRVRGRWY09mSXkzK0ZiaUd4Nk16eHVmRERpRkNUdkNhSXhYeVhid1QrRVZI?=
 =?utf-8?B?ZUFWVXRHWmVDRTBnOWpoVVpuUWJuYjhtTlJrRFNEMk9BOGhXVkVGRVVGbWxX?=
 =?utf-8?B?Ni92RXl4S2ZaeEhZYVd4VE5qR05Yb1QvNmhJTTIyaUxyZGRaMWtWdTNGRDdT?=
 =?utf-8?B?bnN4WVNtY2krb1RmQjlJN0pMQlBPOENQSU44MjFXTEFRek5uZ3pvVUlmai9P?=
 =?utf-8?B?QjJKVWNKY09WN21FMHJkZkVEK1BiR3hGUHJRNVhvbFQ4YmR3em96OWNTNHRU?=
 =?utf-8?B?d0NsK0dIV01kSk5QK090RDFXaksxdVloNUNkTVV4WXpYK3ljVzZ4Uk5qM1Bl?=
 =?utf-8?B?d1dBK1ZwV0dCNHhwRUFPNzE3Kys2b0VuTHB3WFg5WkJhcGV4NVBiUWNzQ2Fm?=
 =?utf-8?B?MFF0Um1XeFd4ZktWU3M0WXFxd0QvTDB4S0lCWHV6OEJCT0Z5MkxjYlZTdDVC?=
 =?utf-8?B?WnV0bklubncrSTViWjFDRzVQaE1xYkVsTGhmZGRUb1BSYTFvcGxMRUpVK3B4?=
 =?utf-8?B?ZXpkbFh6bDN0b0x3WlRQcXBRQ1FzQm9veU92ZGIxQyt0VG1MZ3YvMTJOeFFa?=
 =?utf-8?B?dFlCRU1Qc0h1eFhpV0JkQmJhWWpOcmFydS9tQVVjcnYrUE9wMTVHZS9veEZv?=
 =?utf-8?B?V3Rzd3BNQ0pjV0V0dGJ0QXlveHpYYm0wQWx3YzA0TU9GMS90NGV5OWFjcWZi?=
 =?utf-8?B?cE5aK0RLU09UWFI1YTRoSFhHUEVLYjJaL3RqM2ZobytMR1RnZWNZRnREaEE4?=
 =?utf-8?B?Mk1mSENFNzBaRmp5ODFRRTRUcFp1TmZYSWlUSGljanBMakphS3hFMmZaZmo1?=
 =?utf-8?B?a3JRQ3hqRUxHRDJJL2JSU21YYUhUYjIxOXlpMGZDQmMrQUdPdEdwQTVva3Zt?=
 =?utf-8?B?ZUozTFA3TGFzaXNGMGYrRnA2cVBXbDMyZTRYOGF0bEI2YUd0M2tUeDk1UXl4?=
 =?utf-8?B?VmdQZWpmR2pwcVVRUlY2a0lmS3pxVVJqSEhHMm5TQUx3S05UUkp2TUlZZkNr?=
 =?utf-8?B?aDV6c0pDWGZ1VGxBM05iY0VaQzVnMEZERjdDYlVuTWNFcWVQNHowMC9VTUIx?=
 =?utf-8?B?cXB5MnZ6d2pTYVk2aDFhVTVDelRYdFRXTDRDeVNhbXpaNHRHeWEwUDk1enpm?=
 =?utf-8?B?dkN5dWhncWdPeHJ3d2Z1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q04xRzY3WTZtbWh2SkxWUWJMMmYrUE0vUGZGTjFoWUZIdjRhUGlscFJmZHlY?=
 =?utf-8?B?YlhxVk1VZ3dMMFBmb0pUQ3Jpeld2QnNZNG5HUjJVRUl2cHUrOUhkNjRkMUJS?=
 =?utf-8?B?V1llenRUV3NvTnJGMVRWb1RaaGVpZXRnQ1ErajdjV2VzWWlnOXF1dW4xK3BS?=
 =?utf-8?B?eExMNXNrNENsZ2ZvWnNUVFhGMlZ5MmFId29yQVBaN2lmdjE2dEFZV0ZaNHVV?=
 =?utf-8?B?ZG5YRWhBcHJGZzVmOENXOEpIN3B5THVZazV2TW14eG8wN2ZLVzVERUdvb0Ni?=
 =?utf-8?B?UEdHYzFRbzZ3SWd4Yk9vMlZ2bUhRcnZqbGJoYnRKTmc1b1Q1M2tuM2dCR0Nh?=
 =?utf-8?B?RXlFTkVvWkRpeHNkc2tWV2V0cU5xYWdvVk5Zd2R3cWJXVzRHaWdBdWIvcCs0?=
 =?utf-8?B?TGQvYU1pcUk4Um5NeHltRTRleVZaeXcrVkVwVnB2b1l0Q24ranR3TTdtRmhq?=
 =?utf-8?B?TzZDZnF5ZDZsWk83bUFLNnZ2NkZ6RDdnV2dqMEZXWkRob2cyT3Q1aTRZZk9M?=
 =?utf-8?B?ZTM0amE5NlFDRFVtaUhQUUVNYkxOUmRtV0NhdEJQWmVzUnRDL2VlSnF3QkxY?=
 =?utf-8?B?SDVjNlpHM2lqd1Y4eDA3NUdzZHFocXVFZTQ4YXhROXk3ODB5R2dXSG1VZ0Yz?=
 =?utf-8?B?YVNLQ1ptUHgrOW42ZWJmbFZiUHFiaXFHOU0wRWp0dzBPdFdBRU5XakcxMWNw?=
 =?utf-8?B?SHFPbVpOdVluRTg3TldMaGNDUEo3azMvWmpmTGUxYkFUTkI2NkdUMnF6dmJs?=
 =?utf-8?B?ejBHS3VnTVNzTStidktCU1hNTXAwSnFWTCthR1pKWGladzJUZmt4YXEwYWxT?=
 =?utf-8?B?K3R2OHhka2NpZjBZUjJtbjhWdVpZZUgwN2xPOStVK29BUEEvbUJNeVFTZ0cr?=
 =?utf-8?B?STJJQmJPZ0xsdkordDdic2xlRE40WEVuVU1DS0p5cWtLS05tWGhtV3RWSldF?=
 =?utf-8?B?RksrMFRUb0xoOGNBdDFiNzBzQTZEZUkxWnBYMkxhNlZDZkExR3owdmgvNEk3?=
 =?utf-8?B?c3FaK2MzdGZleHMvT2F5WlIyRVZ6Y1RHV2hzbDNhSkNjYlYzNTJmOFdmMGN4?=
 =?utf-8?B?UEsrci9UWUNoaW0yblJDeERoUzZCQml6R3BCSitVNVNZWjZFVGgvaTlzekUr?=
 =?utf-8?B?UEZScHlSQzBLc1k3dDBLZ0pxRDNUOEV3dU1vTTRYU1VHSXcvRXZwaW41dlpB?=
 =?utf-8?B?T21KWGxVQnZCc096b3A4ZWVTU1didUJsU080dkx4Q04wV2xEVTBoc1hhTHB6?=
 =?utf-8?B?M2FZNnpvQ05sTjdxcnoxOUtGSEpiUDZGRHZHOTYzWHVZSk83eEdWa3hpaUR5?=
 =?utf-8?B?MUUyUWx0VXNNQkNPUnlCRmNJY1JDY2RGUXJOOUNteDZ3UEdJVFNqSXBQME1j?=
 =?utf-8?B?TVlzcTJ5Mk82dGVlUk40NjdZbzZtUVo3Q2NneTZadm91SHVpOWlscmxvTjVx?=
 =?utf-8?B?b0lNOXJBa1dHVHk2L0FORDkrSy9ZT29HNG0zU3hkdVNRc3pmRkhrZUpSN01x?=
 =?utf-8?B?YWhUVEIvVlBWMlJ6YnFNL0dabUZxMThUelh3VjZSN1lNVWRxL3Z3YmQ1ODJj?=
 =?utf-8?B?MHZwTE1vQTRxNXN6MGd4TFBKZ2dWamdKeVpJcTNFQWIxWTZkem9uU21ENnBw?=
 =?utf-8?B?T1lhcmxqWVZZdXRoUDhURFNuNGNlbEFRMmtNU1lsaytQZWFHOVlMbWNiTkdC?=
 =?utf-8?B?bkdocDFHaFFHaVgya2t1YjNtS0wyc2h3RTdPcDlLUlRsYk1kM1BpbUxtMUto?=
 =?utf-8?B?ZE9YSHdpSW9vK0x2NjBLY09xSnpSc3Bldjc0UE5oc1ByV3V0NG4wZ2d4WVRJ?=
 =?utf-8?B?eFU4ZFdKMnBKWnU2SVY5Y2JYcVUyejRzTHdzNnlrRUxOcEljcDB5K3Y3bHN3?=
 =?utf-8?B?WHVBSi96TmdRZVdzTXVKQUZITFBGb0phQzhTZHBodldJVTFTZlMwUWNNbldl?=
 =?utf-8?B?UVN6VGtJREpOekJyZXB3UXg4d3h4UDhnbm1uVERwSHhsRWZOemo2cVpid1o1?=
 =?utf-8?B?VlhQd3U4MkNjWmhrT2ZKT3FyR1ZlRTFsQjM3bkQ1Vnd0MElsMHdwT3lmbXRt?=
 =?utf-8?B?WWpBamwvUDRCT21iVEI1dDAzNE1JNnF5WjlEbkJDMHBhT2NWVFk5MGorcFFw?=
 =?utf-8?B?ZjZ5elJLa29wUEQ1RkZuY3ZKdjR6U0ViSEJ0b3VZV1BYN0xzT0Z1SU9TZWJx?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd862464-8656-430a-0abf-08dce2081347
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 10:59:09.4772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvBuf9hR8QdX/FZAWNUC6n2MiW49h4B6Hqdm/7uAqtHi8YXij06MrQb0gTeirsj8XEsWDXEzjrxWuUDlU/tU1z+ABepIbbLdjBFkOjx4lgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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


On 10/1/2024 3:15 PM, Karthik B S wrote:
> With the current logic the test will fail on configs where the first
> display supports force joiner and the second display doesn't supoprt it.
> Reset the force_joiner_supported variable at the start of the loop to
> avoid this failure.
>
> With this remove the redundant check in all the force joiner subtests
> for force_joiner_supported as the following output check is inherently
> checking this as well.
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 508e82ce3..198de9e43 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -418,7 +418,6 @@ igt_main
>   	data_t data;
>   
>   	igt_fixture {
> -		force_joiner_supported = false;
>   		ultra_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
>   		data.ultra_joiner_output_count = 0;
> @@ -443,6 +442,7 @@ igt_main
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
> +			force_joiner_supported = false;

Perhaps declare this in the loop itself, we don't seem to need this 
outside the loop.

With above addressed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   
>   			/*
>   			 * Bigjoiner will come in to the picture when the
> @@ -539,8 +539,6 @@ igt_main
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic-force-big-joiner") {
> -		igt_require_f(force_joiner_supported,
> -			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(data.non_big_joiner_output_count > 0,
>   			      "No non big joiner output found\n");
>   		igt_require_f(data.n_pipes > 1,
> @@ -560,8 +558,6 @@ igt_main
>   	}
>   
>   	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -		igt_require_f(force_joiner_supported,
> -			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(data.non_big_joiner_output_count > 0,
>   			      "Non big joiner output not found\n");
>   		igt_require_f(data.n_pipes > 1,
> @@ -584,8 +580,6 @@ igt_main
>   
>   	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -		igt_require_f(force_joiner_supported,
> -			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(ultra_joiner_supported,
>   			      "Ultra joiner not supported on this platform\n");
>   		igt_require_f(data.non_ultra_joiner_output_count > 0,
> @@ -600,8 +594,6 @@ igt_main
>   	}
>   
>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -		igt_require_f(force_joiner_supported,
> -			      "force joiner not supported on this platform or none of the connected output supports it\n");
>   		igt_require_f(ultra_joiner_supported,
>   			      "Ultra joiner not supported on this platform\n");
>   		igt_require_f(data.non_ultra_joiner_output_count > 0,
