Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE7CDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 16:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1719610E331;
	Mon, 22 Jun 2026 16:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lF/uPPYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABBD10E44D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 16:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782147295; x=1813683295;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lkWyG2bLRh2s9xtBcb5Q7I5DDZeYrTO9pQPFF6AVSIg=;
 b=lF/uPPYF87UDA3MFGmpuPpkcDzuwcBTuOgh1CcUHCzDUcx7faBxhz/Fa
 0+c9VrXJurBsWH1WPHwAEe/LimFBgs7bleygoLYC7bFzv8/MUpQiwoyhN
 auf3h8ET9Cx/jH+RXWCJ8XmNkEa0B+Ho0YRidPGs91MicF3/QIMZYZz2g
 /Jt7bTOTDGPrFKI8gPQF3cRoSu2PWx0xawBFbOIxgy3RNy5FBhihdCqjT
 17VRcgMz/ZlbTe7n5eAXKc/H+/eXftS4/4qStlSN60SwHEVicb5lHGRiG
 ACGN5Mmx/wIqgCbDV35S+cr4xFwoaWEOSigiG10lNVG1FcXtzIrYk2A9m A==;
X-CSE-ConnectionGUID: eOw5kbAdQWyQbkMiPlT3Yw==
X-CSE-MsgGUID: TcpwY5QSTlarx6s1d+e3/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93247609"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="93247609"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 09:54:54 -0700
X-CSE-ConnectionGUID: WCY+aq3hTaWGYmXz0roUxw==
X-CSE-MsgGUID: B/AoIJqZRTCsrSRlVydCfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="251207101"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 09:54:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 09:54:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 09:54:52 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 09:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EckIBnGyT4UGVk5/9/Y6fZ3dftkTq2+R9iRsZD4ZO2joJ17Qjar5Jf6uT+N9so4eQbaFdKRXYvCRW97lhoFREb0WXQKa15XdRIIQGsFexaS2DoTPMQtvrYb8P3IzkvPKzf6Aw4V54IsH5UgrFpMiSskJnQvKlSTXqzNx+4UEwjzDeI6+/FDaK9Mn46zL8nexd0aENEAM/JgyEDwJU2+24aIqRDJ+TJVCB7iNGNkMl6S+veGNOBIfyApu84lEJC2gdrriIF1EXNw+MqhGclo6Bb+2bKz/Y+lah502agO+aYYkYGGF3xu+1o4m7H0h4XFR+OWcfCfIH9hvSRV+/3ruzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKLTf9YUWkKjFt79KZGN5FpvaZD8MZ0LPVvhWliC4VQ=;
 b=uyIWpYSJdPPHhyZuYBYsfoHHJUoraMgtHsfHjt8RGB6XFCCbiQo8XtTv+rNR8MWBdnolEZ1HQBeZoAnFCV0gxzbCtFzKUli+d/ImxfprdeKXiVPTJSBqwl22Lc2oYAQr8da0m/cshWpEDDOW2JRUmz2NABBi7uRNzMzGxxNwDsVKzaGe3l5s0EkOSxn08pArwpPzpBzZb/89+GLRI1Skfh2/KOMAE+51OLbukES5clThjOpFPWXhsAalsJrZVnpzGLFWCczB8fQmb/GnPUUgiQzS376bTJg1aR1aIrQDfdklkUz8adJg+BMuwFOx3iY6yHF4se+XPOfqKArVF1Y+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23) by SN4PR11MB9944.namprd11.prod.outlook.com
 (2603:10b6:806:4ff::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 16:54:50 +0000
Received: from DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963]) by DS4PPF46B98A11D.namprd11.prod.outlook.com
 ([fe80::5a0d:e357:ce45:3963%8]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 16:54:50 +0000
Message-ID: <274f9e7d-2bbb-41bd-b5d2-8a24753212f5@intel.com>
Date: Mon, 22 Jun 2026 09:54:46 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fpat=3A_dynamic_PAT_index_selection_for_pat-index-auto?=
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
 <177859364488.61708.10805810984231941063@5ab824fced77>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <177859364488.61708.10805810984231941063@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To DS4PPF46B98A11D.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF46B98A11D:EE_|SN4PR11MB9944:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cc0d8c-4553-4bc1-2882-08ded07ef947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|13003099007|18002099003|22082099003|6133799003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: VCQtDyGnS1RV50/1o8qOu8kRK7BfYO/OkcyiN/tiq25+nz9axCt8wqRrVTLCRrnNgkpp40z+9kfOlaCZ4MeZhxZSljdFpw2N4sGmXo2uKfMR03BHAn0sk8yzORAiPTQpLiXIrnJRhIvEEH6Hsya7gdJxQ8hPpnTcd7zbjuHx4zAf4ZYX4fyg2dR2Fct2mZs6RvjrOvqKF78NVAt/dMvTVUlAirYcEz55uXPDxZ9kvMrHhaSQzdY53Ah1Glfgv9JZoxGItjkIJYTWKWMeDbz6pipjS3o1QpMeoFieX1vRmi5sK+zEKtONx862dLlWeFb3lHtszLLpVcnBd+K55yJhjK02UQ5yIBxwXTOVR0oKAj/rjnvFkQlS/aJuOve6WiYrM2NvQ+jojb3dCsPuAY46sL/VAHWHg5qUfIifF6W+USW6jKTw1HiUAVZsLmz51jcZ3aosGU5SnAKmHDTjzcWJ+0Qm7EK0aMjbsaJxphtBdi14WmkaoAOQ8xFAKjWuTEzGwnVhlLc0JiECvYQQsLETEUXUO1Fh2jJCFgus6mSpeBi7wLnjzZm0TmsY76WKfbcRUquY0b0Rh0EsddDmS9bbyZ5dJuKASXmp6Y1nCqSva2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF46B98A11D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(13003099007)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZNN2J5UDJEb1paSUR6VnVvY2VRV21pcGVyd2JNTG54andBaVBEZGVaczky?=
 =?utf-8?B?ME53VVNvam80bkVyQkVMR2gwVE5haXZ1OC9qNnBuajVITk81ZSs4ZXRVTFZj?=
 =?utf-8?B?REdpVHErTk9ZTTMvU0tTVGNCWGpOSnRZYU5WNWc3bHViRzRiSEpKci9wajZj?=
 =?utf-8?B?RW5ZOThZRVZ4OGwzTERlYVc5N2NVdWFJalBUZWRFSisxQkRnRGw5cEdEcVRy?=
 =?utf-8?B?clhXMytpNzVXVHBNMGVoZHZqbGE1NTlvdHZ6OU9US1pyU0lFQkpSN1VKRjJN?=
 =?utf-8?B?azNGVnhiM3c2VjM5RitFanJ6Nk9GNTFkTE9pcm0vZ0hHa2EzbU5URytUK1Ft?=
 =?utf-8?B?cVozTDBVbE1CSGk1d2c5UVVLWkN2cTQrb05FeGUwRkRUWjFMZWlTM2xvN3Fx?=
 =?utf-8?B?NmRJVE9YdXgwblJJNTc3NG1ab09vK2c5azREODBvN2trYVNWVEhMQk9Ec0Qw?=
 =?utf-8?B?RHlCcWRuVXZ3eDdSTEwwdDE1T0JrZlZrSFNYbGJrejk2TjVVWGUwODA4ZnN2?=
 =?utf-8?B?ZXBoRXh4WjUzRTlGZEFvU3dDRUtFYlFTcVNqOVcyemNDRytFaFgzVklXdzUz?=
 =?utf-8?B?RkFvdGZ1WTZ4aTFBSE5majl3RWlEclFpMDBZaXhnMVVZdHNTcUFBSkRudW9w?=
 =?utf-8?B?V2lKNmtaS0x2S3FLdG5rcjZHNEZlVjhuTlduam95OVduVGYraE1wVlNySTk0?=
 =?utf-8?B?RGJvMFFSaTJxYzQ0cy9lNTkyZ3RhRUljbkxtWDkzSHZvSllrSzl5MHh0S2NJ?=
 =?utf-8?B?aFZ0OGc5cEs1aGZjaFV2cllFM0w2QUJxVEY2dUtYc3pXeU9jR2FnU2Rac0xz?=
 =?utf-8?B?QjNOeWYrSjV5TjNzRVpoejVURU5EdzcvTUtOMHdXeVBFTVhmZWd5OGd1VTVl?=
 =?utf-8?B?UHhBaU94NFA1bW5LZ3pZdmgzRGt1WU1lK2s0WE1zV3YyM3Rla3NNc2hCaEFr?=
 =?utf-8?B?c3RWZEJiZWFnMCtxNlYrZUNHVU1xM0kzWWQ0QmxpT1l1cjFvTkNCL01NL28z?=
 =?utf-8?B?TlNLWmxlTUpBbjNTZGVpUWpDS0RPWjVLZUhoaG5hRjU5bFVmS244emQzWTI2?=
 =?utf-8?B?b2NUWXIyaWxUOGxoRzNPMEhuaU1GeisxSks1cTFFbUJxZjJ0UkxTSjhGUVNs?=
 =?utf-8?B?b2tXRkRWQTJCMTllSUJEK0h5QXJ1NlMzZHNKQ1hFSGVlVUtLWUFhZGdReTR5?=
 =?utf-8?B?RG1PVHl2VDhxQUhJeFRpbUJva1RtaDFWd0VZNjBmd3ZmL3pSUnlNUi9DeVh6?=
 =?utf-8?B?R3oyeGlLRTV5Wk5Jai9aWXlaT3M0dFlXYXNOM2c1STIwTS9VaW95RHRvKzVr?=
 =?utf-8?B?aG80aENicnJYRFNKL2w5WUxoR3ZUcmR6M2dFRDl3Y0pSeEZ4Z0VQMHlqV0ht?=
 =?utf-8?B?SHAzcnc4Q0R4MDFTajZPdWQ5ckhuSWEzanlzTlQ3NjZNVmp2bkRqeEFvREV1?=
 =?utf-8?B?THFUVGtteUhsV2VDZS8wemovVVQrMEM4dHB2eGxnbWNlU1JwQ1RrUGtydUJL?=
 =?utf-8?B?RVBrRzByalprL3VFa05jS203b1huMG90L3I0SCtORmpUYWs5cXFoRTZMNnFn?=
 =?utf-8?B?aExIZDJvLzN1NDRuenFNTmNnaTJORDgveUJ6c3NxNk5QbVdoa0FLTFM3SFpX?=
 =?utf-8?B?UmxoYnMzMlNmK1U0L0M2clNjTlk4aVVYaHFDYllQaExnNk5qQ2pQRThyc3Ro?=
 =?utf-8?B?eWFEcDZUQ2xKdjhtbkE2ZlNuRVU5dzR3YjJ4MkxiWS9lTlYwYUlUVDROYkt1?=
 =?utf-8?B?SU1Db3QwQk1OZGZVMVpSNlVpVVJPczRNd1RGaTNJcDl4SWVHaWJBRDh6eWhw?=
 =?utf-8?B?OFVDSWNjQ1JMcFM4VHQvWFp4emdicmVrN0xqaGZRcEF2cFlabEdzVTJReTFD?=
 =?utf-8?B?RXRlOTJZU0NvWmZ5VUhNK3pFRy9tcU5QTlNhS2x6eE92bkFibWRycndSeGcy?=
 =?utf-8?B?STVNckpHWnUrMGNrWE1lZzZrYzg2Y1hrMG0vbk9CYWdzbThSaGFCVkd1VlBN?=
 =?utf-8?B?bVI2a25VaXlrd1BMOTBORmNvd25OT2ZTU3U3Ym5OdVd0dm55L1FNRmFSWGtp?=
 =?utf-8?B?UEpscGdmR3NxL3V3ZEtLQ3l1NUdXbXdHdW9ReG1sczdkaDRkYWtUNjdta0Uz?=
 =?utf-8?B?aUdidWJuTzZKMVVXQm0vNDNaZEtGMjY3VFAxT3pyM091WWNOcUY4SkFRQU9z?=
 =?utf-8?B?NFh5SmQ2ZnZzTThYejFGOEtxQm0xUWZBb2VJOHhlL0lRNFlFblJqSHA5d1pq?=
 =?utf-8?B?ZVhVczE4ck5zSVhrV2UyRzF1eHRaR3crU0gvYnhQZWJnaWc4YzdITFJFc243?=
 =?utf-8?B?OVBJT29NYjROTFJnVzF3bmNLSlV3SytsYkNlak1PR2F3V1JsbkpyUT09?=
X-Exchange-RoutingPolicyChecked: g09HL97ioBnHo4avvxRPKJSH+5afHiDPxy5z3lqLFGdwDrjdvztPoUdH7seBL90JnwmHqdKNl4qWXt9ayhHRokpsglmE15dY3nGxavQdFl7idj3xapxhMQsM1YqZMysODJYxmYg8gN95QP9g/e0UGL1CYRFJ+Zi8Cu0f8oYcUjLU5JeS0TUc5inoGgGKF+rS7yuaV9B9OTsRVNnfrwyN2Y8af2ciyYnPeTHv1AY5cxpirbSLM2BXRYE3aKk6Kex1b114UCHcFzZLWpsio4Qy/U3d01ZYpq3INd7VZWWMDXLl0PnGmhHP7+kVOLFOHOc5nWZSl1u1JbletXVT/rxV1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cc0d8c-4553-4bc1-2882-08ded07ef947
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF46B98A11D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 16:54:50.2657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ie1foPoJiFJVM0EKC9tkRT/T1c8VOav+eHBAN5qG8r0VDbL43AGm089xH7vFYUe4rDsv6KszLlMbyOM6OdCNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9944
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


On 5/12/2026 6:47 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_pat: dynamic PAT index selection for 
> pat-index-auto
> *URL:* 	https://patchwork.freedesktop.org/series/166367/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/index.html
>
>
>   CI Bug Log - changes from XEIGT_8903_FULL -> XEIGTPW_15155_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15155_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15155_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15155_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@fbdev@unaligned-read:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-5/igt@fbdev@unaligned-read.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@fbdev@unaligned-read.html>
>  *
>
>     igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html>
>
Above 2 possible regressions are not related to this patch, thanks

Zongyao

>  *
>
>
>         Warnings
>
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-msflip-blt:
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-msflip-blt.html>
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8903_FULL and 
> XEIGTPW_15155_FULL:
>
>
>       New IGT tests (4)
>
>  *
>
>     igt@xe_pat@pat-index-auto:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [5.79, 13.65] s
>  *
>
>     igt@xe_pat@pat-index-auto@blt:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [1.73, 4.58] s
>  *
>
>     igt@xe_pat@pat-index-auto@dw:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.69, 2.51] s
>  *
>
>     igt@xe_pat@pat-index-auto@render:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [3.37, 6.57] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_15155_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotrebind-lateclose:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose.html>
>         (Intel XE#6779
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-7/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-4/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#7642
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1
>         other test skip
>  *
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354> /
>         Intel XE#5882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#6126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545>) +3
>         other tests dmesg-fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-blt.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656> /
>         Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#7905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +15 other tests skip
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-6/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#6901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021> /
>         Intel XE#7377
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +12 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
>         Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309> /
>         Intel XE#7368
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029> /
>         Intel XE#7395
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#7383
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@kms_psr@fbc-psr-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330> /
>         Intel XE#5813
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813>)
>  *
>
>     igt@kms_sharpness_filter@filter-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-4/igt@kms_sharpness_filter@filter-suspend.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-4/igt@kms_vrr@max-min.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@resume-one:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_eudebug_online@resume-one.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-small-multi-vm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-4/igt@xe_evict@evict-mixed-threads-small-multi-vm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-5/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap-eocheck.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +136 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-coherency-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-4/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245> /
>         Intel XE#7590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>  *
>
>     igt@xe_pm@d3cold-i2c:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#7417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>)
>  *
>
>     igt@xe_wedged@wedged-mode-toggle:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html>
>         (Intel XE#7914
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914>)
>
>
>         Possible fixes
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-9/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#7445
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@intel_hwmon@hwmon-write.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>
>       o shard-bmg: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (Intel XE#7922
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-8/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         (Intel XE#7915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         +1 other test pass
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#4692
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692> /
>         Intel XE#7508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_copy_basic@mem-page-copy-17:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-lnl-2/igt@xe_copy_basic@mem-page-copy-17.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-lnl-3/igt@xe_copy_basic@mem-page-copy-17.html>
>  *
>
>     igt@xe_sriov_admin@sched-priority-vf-write-denied:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_sriov_admin@sched-priority-vf-write-denied.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@xe_sriov_admin@sched-priority-vf-write-denied.html>
>         +123 other tests pass
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html>
>         +1 other test pass
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#2233
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#7059
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059> /
>         Intel XE#7085
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_content_protection@legacy-hdcp14:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_content_protection@legacy-hdcp14.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-6/igt@kms_content_protection@legacy-hdcp14.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178> /
>         Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304> /
>         Intel XE#7374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html>
>         (Intel XE#5408
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408> /
>         Intel XE#6266
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +7
>         other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>)
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#7376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_psr@pr-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-9/igt@kms_psr@pr-suspend.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_psr@pr-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_psr@psr-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@kms_psr@psr-basic.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@kms_psr@psr-basic.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#7795
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-9/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904> /
>         Intel XE#7342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_rotation_crc@bad-tiling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_sharpness_filter@filter-scaler-downscale:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-3/igt@kms_sharpness_filter@filter-scaler-downscale.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@kms_sharpness_filter@filter-scaler-downscale.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-10/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-10/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>)
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248> /
>         Intel XE#7325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325> /
>         Intel XE#7393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_page_reclaim@binds-1g-partial:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-6/igt@xe_page_reclaim@binds-1g-partial.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>)
>  *
>
>     igt@xe_page_reclaim@many-vma-same-bo:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-5/igt@xe_page_reclaim@many-vma-same-bo.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_page_reclaim@many-vma-same-bo.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-4/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>  *
>
>     igt@xe_query@multigpu-query-gt-list:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-6/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-2/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_query@multigpu-query-topology:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8903/shard-bmg-2/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15155/shard-bmg-5/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8903 -> IGTPW_15155
>   * Linux: xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565 ->
>     xe-5044-767b83aa80c6d7eaa1204a866b287b56a1a33122
>
> IGTPW_15155: 6c2d3b992cff4ab9b8917f254ae543b72344fba5 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5041-f8ee23694aa6be213355905a78f79bb1b0861565: 
> f8ee23694aa6be213355905a78f79bb1b0861565
> xe-5044-767b83aa80c6d7eaa1204a866b287b56a1a33122: 
> 767b83aa80c6d7eaa1204a866b287b56a1a33122
>
