Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91027C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 06:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CB410E3EF;
	Thu,  9 May 2024 06:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZoD2vnO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4133810E3EF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715236869; x=1746772869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Aw01fd6L+h6yqnC+Pz2MRjPJgyJ8nmm4HloogBMKnCU=;
 b=gZoD2vnOPTWtwKLTNL2cuHCUPBP+ywCp/gi9CcELc1SPpnW3pXdq5dAc
 fGl5543vvUWPDfhMqQkou9Z59STEOgXDN4zDA6ucT9M0uenGOoVQxIqyo
 lPTzj+KZp8ffOvIIEBHZx9emj7eCD3+Q/Dwjm1fL1mqoBLyYgLZjwYqEA
 Lt2ITi7068PbxcwqDsJ3jtePqpYgHg9kk+HB6EvAwgF3kNCsGQqDtRw8A
 MmMv2ZkZOT4xdetVY58h718C/wqRlod+UytQEZLGiqtPynuCBkQekSTn2
 ctJXFX/U1MSwiJKyOZEPy15cNJo3QCwjgMRNgIHhtT8WNVcuOnMnMdLYk w==;
X-CSE-ConnectionGUID: 8wL0lw8sQBauZG2zahBVlg==
X-CSE-MsgGUID: 7tiqhhVDS22F9gOalGS3hQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10974374"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208,217";a="10974374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 23:41:09 -0700
X-CSE-ConnectionGUID: aLPMrYKkQeuv/JEDU2msFQ==
X-CSE-MsgGUID: jkiO8MRwStC8C99oZkYWAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208,217";a="29200562"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 23:41:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 23:41:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 23:41:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 23:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfL2pnAHOPghrMxuLyhmJW7k8kFjWCK7JCp6v6zTQrr4JDlJVst/qramm2KwdsxT65MW98wsPijSNYPLL/R27eOUfyUBkkv0LfIORyCue4Z9mk7a/nSJbvAGmuTSb4IOIRYkMfKi+P0axT9OCh370yzMm4/TmzZrLKlQ+vUh5jWZ+DDb0vNsGeHKLMz8+O8B82QTcLduRne6nmzRdjp68/Idla6dmRPTnoLhGdfZzDv+jJ00F3V/y6Ed0pyM0C8AzLjNiB2cuTye/HSTNJvQunaVoWpgG6MKQySrs0Qk40tsBZCQNnU9k3ZBGOHSyJbf9g9aT/4Akgc3m+Zupnz7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueefLdDTnsK96wqpKL4vGyBh0iO6yRM4t9jAb1kIPT4=;
 b=L5yPziUV9D2OCXo1M8WQ4HR7BxDGmrMF9h3D0bPLDv/HwDfutkAfW/cabo+GEEPzkcSiRgz1+3BpbnfLFWJKGy2YXM8N76NauhXzku+qs0qAnxmfYinsiFGTUvpv7O8IpPXIDxWnEjMQxevTddqpBsjWY3jiD57A+m74dYjiqIgNY00egHid6UjBsr6oAzxad00Sl1kV/ojigZmCvQPgAnkC4jt9sbr3M/3bFlw9hqecciIaGl24VWGwCS3Mumtg2+ZRNcJXfBYJHrIu+or+WZIIB3Zy7WkpvdgWZ+uNt8kSz8uSSUCyRyx85ereLIVhw0ZyKYaPYXOPL4Q2wX5zpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 06:41:06 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.7544.041; Thu, 9 May 2024
 06:41:05 +0000
Content-Type: multipart/alternative;
 boundary="------------k2BiK5YDETNWa8RBWeWyE5Dp"
Message-ID: <3a816e86-2a1d-433b-b004-a3e61c712b20@intel.com>
Date: Thu, 9 May 2024 08:41:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/sriov_basic: Skip tests if sriov_totalvfs is
 zero
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <michal.wajdeczko@intel.com>
References: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: DB8PR09CA0031.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::44) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MW3PR11MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ffa6ae-30f9-46e2-4e9b-08dc6ff30097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVpjejV6bFhmQlY2Vy9WSzhKTDlpSzR2MzN4ZWtvR2VRaW5CMkZpV3BCK1Qy?=
 =?utf-8?B?cnhFbld4cUpjN3VKU0pPQjZIckFYdHk4Q3EyWVdqakc0QkZ4bkpmZEs5NVJw?=
 =?utf-8?B?WW1FVW1jejR3THA4VmZ6d09nSlR5bDUycVJNUlBBRUNpZEQxTXYvajRSaWF3?=
 =?utf-8?B?KzM3U0V2ckNKRFpXb2ovaHNUQ0ptMkJMTWJ2UHBad0NTZWE0L0h3LzJ5dEQx?=
 =?utf-8?B?dTlCOXlSbDRJd1dnczFYd045RGlQdG9QZVZVMzk3WFoxdTRKUzJLSmNlZ2JD?=
 =?utf-8?B?Q0dqSit2TDJVVUFvZ1htYWpSN09UUlhjQloreFF2VGdkSmVyc2c0Q0U4M1JT?=
 =?utf-8?B?QnNXeTI0NklYUjhvQVJLd2s3QkdCaFdUOE9wNVJ4bWJCWVE1bjF5cG5vWlh5?=
 =?utf-8?B?MS96MG14UXRPUk1Td1RxWDBzQ3JIclliSGl2MVdJSlRkZU9NcCtGMHR2aDN3?=
 =?utf-8?B?NEhXOVR3N1RQMmNZUHFGVDFIc05KNnR4M0kxSStiL3o1YTNFbXJaanVwVjQw?=
 =?utf-8?B?ZmV5N0FSdnJOMXQ2TjVmTFZ4WUdpYXg0TTJZYlVDOVdGRHVpdTluNUhMbmRY?=
 =?utf-8?B?Rml5K2MvUldUcS9hb3AzeWtYVFBoN1BDMGs2ZUFUUWtJYnBTNzdoYnN0eldo?=
 =?utf-8?B?VVI5bUtSb1ZURUNPL1ZpYWgraDNVZXQrYnFVbHk4aUh4WFRjbDI4UkZFYk5F?=
 =?utf-8?B?N1BYcnZMcndUc3RhWmtrUFpJU3E2anQyclFZZnRsNXhWQ0h1cFJKM3BQMDRt?=
 =?utf-8?B?cTkwKzhEMStTN2xHSzZnN3ZrNXA1elFGWjRQczM2R1dNbU4rd0dNc3pndkVZ?=
 =?utf-8?B?Vjg4ZENqMk8vaUo1WmR1MWZDMk5RMzkvZmpoOENKVEJXWTRlSXFwY3kvQW9m?=
 =?utf-8?B?K1VnVHg5Qk5xd2ZBZEFPSEh2aUR3LzArUExGaTNEdDNWTTdnOWZqdkp3RW84?=
 =?utf-8?B?QjYySWxZNVVmNjhtQ2ZkNEVpeWJJekFrb3Fzdm43QUJ2cWI3ZTdTNEVzakRT?=
 =?utf-8?B?MHh1cVU5Njk5YnlScUxMUGZlaXFET1Jub09VWGJnckd5WG53KzZFZ2RNZktP?=
 =?utf-8?B?YUVVUnV0RC82TzJ0WDhTNjd1cUJYQzF3T1lRV2F3VHNWMnAyTllEbTA3WTFt?=
 =?utf-8?B?TXFMTHY1OXlxREJDM3hHQTI0N1BWeXZyMS9NdTNTOEVGdFJ5WUppcUVJUFlP?=
 =?utf-8?B?ZTZqUFhreGdUbVJQL0xobmtzWTNpVTAxVXJkYmI4Z2JtUmVXdWdzTGM1MnMr?=
 =?utf-8?B?WjI1WTU2SUZDNnFFN1NmMmo1Y043UG5PRjZYQ2wyS0RYK2YreUsvbGt3Si9q?=
 =?utf-8?B?aFh6ZnBEcjQ4UjBweWRxMFczQVZhOFlWdnB3Y1lLUjZheDhsOHlta2NSTFJw?=
 =?utf-8?B?UC9GQy9IWVVDQ3ZtODMyM2pDL080SGJXelRPejlpVHQ2SW5pQWEveVJEdXpS?=
 =?utf-8?B?blMvdkFFMlJIV0dtdXlTUVJ0V2FuazBFVmtRT2pRN2tTUXdoZXZmcDBUZnkx?=
 =?utf-8?B?YWxHYm4vWFlUNmxRU01BRGpnS1lPbStjVnNrZmtYVXdNVEFzWE1halloeVFa?=
 =?utf-8?B?V2xFSkFIbndMWWVPOWVqSTIzSCt5K2Q5TFpCYnZtZ1N3ZTNrYjdYM2w5WjBx?=
 =?utf-8?B?cnFreHRha1JteFR2cUFmV0d4S1dtYzViZk40blQvN3g3S3RDQ0cySmZ5KzN0?=
 =?utf-8?B?dWFZajREK2VZMWk2aGRabEFobGhIY0NTU3FoT0hpRVhvVlVWRzdHWWZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3FzUHlYTWNHbmhCdzlPcENZTUkvMGhjZld5MVNCZWJrMTZMMVl0Q0hkYXly?=
 =?utf-8?B?V2NlSUZKRDRHcWZRWUdvMFZIRVk2SXBHY0hjbnNHd0hPd0V1ZGxNL0MvVHZ0?=
 =?utf-8?B?K0ZHUjVQS3RCSmFmbVNpMDQ4QlBmSENnSUk5NDJSb3dtb3l3MUZ5RFFPcUhO?=
 =?utf-8?B?V3FLZThIUnJ4dEJWQXJYc2crTkFZN1hTZG1yMnlpbkVXOFJwVXZNa0tNQ2cy?=
 =?utf-8?B?eDMrc1RFNkw5V2lyOHU5eXowelN0S3RLTzVUY1I4K2tGclJhTE4zR05HNUE4?=
 =?utf-8?B?VVI1UERPcmNwK1FTWk5ld3FGK29oWVQ0dS92YzFkcndva2VlN3Q5TEVsOEpo?=
 =?utf-8?B?OE9Qbk5LNmlYdWtOZDk1bDUwejVId0YreUViME5QU2l2NHpOeWcyYmEyNEdo?=
 =?utf-8?B?Uk5KRXpPMEp0Z2w5bEcyUHpOZXQ0WWFDTS9leitqT3FPVjlxblVpU3haeHA5?=
 =?utf-8?B?NFhjZGZ0SlpsM2dGcDJhcWY2aXllK0djZWhqbWJ4anIyWVRidm1JZGdBTTVR?=
 =?utf-8?B?dmtIV2kyVjdkRzBFK2tHL2NhKzc3QXA4WS9CaThzb1VzTnowM1JETTNBQ3Fs?=
 =?utf-8?B?UGdTcDE0V0tBVU1kM1dCaFRSbzM3dkthZTI5RXJPbU1HT2dSS2N1WktaeGVx?=
 =?utf-8?B?R2dXekR4YWlwWC9LaTk4dFEyd0lGbmJQU01KV3RhNWhkdmI1OWIwK2Q3VTM5?=
 =?utf-8?B?QU1lS1ZreC9aT0ovREMxcURLcTg4ZlR6cXBldlB2blpDUmtmelVnN2k0RGRq?=
 =?utf-8?B?TDdDc0FXZStISmhld1F0SktOazFZVmp1SU14VC9iLzlkbm5aSFl0MWREUUVq?=
 =?utf-8?B?M0svbjArb2Q5cFIwVlpHWWhzQS91WWt2a011ejc2NlQ3bWtYZVVkbXloOTk4?=
 =?utf-8?B?M21pSmNqbC9oWEQ1d1JtZ0tnR2JuOFp4TE1vbllYWWtZeFhwOFNQTlArRnR0?=
 =?utf-8?B?TEFkbGIxbDNpTWFsTUdCY0dPdThRNFl5a2tXWHViMnNpbW90eWpNQ0RyQytu?=
 =?utf-8?B?OVRKTktPbGVTZWdCd1Z0SzVaYzNLSzJqR0VYaElFUmYxMTB0VlhLQzNWM2N0?=
 =?utf-8?B?VkU4eUkvalJzSkgrL0pLNEdaSit6L3VDUUU1Y0FpbmYzdk9YSXE0ckNyRjVy?=
 =?utf-8?B?WDJqTFpiYmpIOWdsOXRiQmI4ZlA2bkx6dlFjQ0Zmd2gzeXdoOE41VFBmT0JO?=
 =?utf-8?B?OVR6Y3lmdFl5Z0llMUlhRWRKcG5ZbHZjeXJCOHJuWGJOKzRRTFNaRGx2a0U4?=
 =?utf-8?B?MUg1eGVQRU8wSVpkRzNWQWZwU3lVZUdWN3RXcGRoSGI3SGk0bG9NSHhVUFZp?=
 =?utf-8?B?M2EreExYbXRZYlNyUjVTN0hoY1dncHFNV1poa2N3OUJNYWtuN0hCNVhGajRu?=
 =?utf-8?B?OGN3d05RdVY0Y0lJOU0xSi92WTJ5K2d4K3lwa1dFRHhQNkxvb01DRHBzTENV?=
 =?utf-8?B?NTVXeXVoaC8xUlNVdHhxcisvZW4wTTFFckFhUUpVZlVPaDhaZGxoUndBaDJR?=
 =?utf-8?B?ZE8vYzVNSVpSVCtENzROdDFFSHRWYXZkOUJGSVpGQUk2Y2NwUFYwSjkyNTha?=
 =?utf-8?B?TytPRmd5L1pDVm1PNzA4cUpPUTdEMEZWdDFnajBqZ0JjUjd3ZEo4TUJIcU5q?=
 =?utf-8?B?bDdSTHUxaURQWjVUZGV6VFplNHU5emRTUnVwN3hWNDF1ZkkvK2pmUFJzMlRt?=
 =?utf-8?B?dThlSytkR3R5MlRFTko3eGJZeFhBS0g1SWhXMTdmU1RleWRFd0tReHA0TDBC?=
 =?utf-8?B?V1FDODdNenZTN0tneUpobGdiQ0lZcHFFQXh4eXFPbFRFL2Z2VWZkQ3VYKzM5?=
 =?utf-8?B?djBmUFJqSlFsTDZJTkNRL0s4TVZLRVVFZlBVdThwSjVKZVBobVIvTnVMNGwy?=
 =?utf-8?B?R1FtcFhLb3QvTlpsZEs1anVWVUFOSFdNN1M0QWNZejcwd241Uk01NVZHM04r?=
 =?utf-8?B?aE9LUGJEQk45NS8rRXJtMGpUeUErVjR0RHYyc252TDBjcWZkbURLaVJ6VW04?=
 =?utf-8?B?T2lNR0lmaEVyWmVmei9oQkc2YVdJQVJwY2Z0dUhwZXhINjc5Vm80UGRIL0xR?=
 =?utf-8?B?RC9PdmdtcE4zRi81RGNseGpxVHpOZDg2T2lOTEhNYk9Kb1NvaGtOZUE3TDVX?=
 =?utf-8?Q?z1erG9dTpySpl7+lmrQQV4pyI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ffa6ae-30f9-46e2-4e9b-08dc6ff30097
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 06:41:05.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+6TRmGa5fVLv36WUPGNhHwWv3/uc0t3cNgpQwRhki2D/QKlgfwQFRbPr0lpvdzN1d2ZwCCL5Od1vo6g+DVCew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
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

--------------k2BiK5YDETNWa8RBWeWyE5Dp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/2024 21:32, Marcin Bernatowicz wrote:
> There is no point to run the tests if no VFs can be enabled.
> Additionally, the `for_random_sriov_num_vfs` macro will lead
> to undefined behavior if `sriov_totalvfs` is zero.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> ---
>   tests/sriov_basic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index f58b3b7ba..1bc082d76 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -120,7 +120,7 @@ igt_main
>   
>   	igt_fixture {
>   		pf_fd = drm_open_driver(DRIVER_ANY);
> -		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_vfs_supported(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>   	}

LGTM,

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>

--------------k2BiK5YDETNWa8RBWeWyE5Dp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/8/2024 21:32, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240508193258.4069853-1-marcin.bernatowicz@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">There is no point to run the tests if no VFs can be enabled.
Additionally, the `for_random_sriov_num_vfs` macro will lead
to undefined behavior if `sriov_totalvfs` is zero.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
---
 tests/sriov_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index f58b3b7ba..1bc082d76 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -120,7 +120,7 @@ igt_main
 
 	igt_fixture {
 		pf_fd = drm_open_driver(DRIVER_ANY);
-		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_vfs_supported(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 	}</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">LGTM,
</span></p>
    <p><span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;</span><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------k2BiK5YDETNWa8RBWeWyE5Dp--
