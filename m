Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6825C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 05:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DDD10E002;
	Tue, 15 Apr 2025 05:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrYd16lp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0942E10E002
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 05:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744695852; x=1776231852;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j+AkzY9Na3pAUR1LAh63TGkVeqUD14+hw6CLQSBDmHg=;
 b=DrYd16lplmvMFdC6QC5IffeUGiprvleBzlUOJYI3duDJd+DEWOmbaX5I
 6DgxeyoeMQktujZzpp/MVpZbPza/9olf6R0+qnG2TkdK/chGHJa+a07ua
 RXz+i2jgJBduOMjaCI76c8ByJegpKwFxjyuHdzIdUg9Rl9/KIssqzlAcz
 FUDJhhZBtVnKSFnp+g3ZbURT+nueSQu9FGbjDzuNzf4pQgm8LZ265l4Zl
 VCK9FMbSmY2OznIOvT5GWI2ZosvKKmCxVWOla0a4PxL1C8+2Y0GmEhV+7
 VpN5RVkBUZjFDh7y/nV+1OpBLD7O1Lj1CM90X4jvBxnBvtbPNMnDja8IA Q==;
X-CSE-ConnectionGUID: KyE0pknDRXCHVByqweVa1Q==
X-CSE-MsgGUID: COrdqUqUTUS09gqo4AyEfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45898076"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45898076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:44:12 -0700
X-CSE-ConnectionGUID: J3/4QWYzSZa3JNTicLB+2A==
X-CSE-MsgGUID: qaEkxQ+URTeMYKgoXPrgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="135195801"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 22:44:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 22:44:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 22:44:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 22:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1WWdItKdcwpuU7nX0SlVbyH9zhfkHlVUjikjIOiIxMtacyhlZxIz5gzyyGUG1EKWRQL7uykA8GxB5zRXEtvYs7Ahbn8beYAR8Jm777j317sBJ8BYsw6uPm9yn5c28Tl8dRdUQjD0T6KC7iWsJ3vq/Vym3FB2oAu2bxuVsq65qX9u4ggSn3i9Yw9XRXtOuKUI7D8fKPVATKoM9oJfVFz+AMDehugfl4UPDG7eKD6lPNIr3JbpNtzRLD9RRvhZrfYYEfTzkmEH0QiTxgxsJZFTgMGla9oY+z498K4WXeeKcscRVTpSYJhK3vcoIbwxyUXc2ltD+B/Y/LDD3SEZ1ZlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSS/XbEbGlR0cnx5MQLJ8HUAQ5WzylKyuiqtWhPr6qM=;
 b=M5MYmUFekjhsKKaKO8MCNSXEdfmEPiZq+k+7SRdveWZAh8pM61qBeJHiSQaJxpXDFiX++kWZ9VBU8jDdXpx+3HBqLDTSrpFLmhs1WrS9s9LeBE+BXonZsn0nPARxN+GfEwThxiEj1gF10yZUGJONEAkt3rXXuqtcgp4Jl2OrlheZX5PkHt5FSdTE9vj/wt7R6Q8JDrYbVz2XpaeoaIrMACTlkuupkipifAXkg2uIm8LJwAYoM4cGEFYY8nU3AbPk83kjU8bc44/+l+qMtbmhdBZGM2H178KH1gIO3xO9PE4ZHeUW43bf6pBK7GoYWtzNtEbtxld44f9omEW1Acrfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 05:44:09 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%7]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 05:44:09 +0000
Message-ID: <44d24376-7ce4-4e71-8854-a682b8641669@intel.com>
Date: Tue, 15 Apr 2025 11:14:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Add test to validate
 survivability mode
To: Louis Chauvet <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>
References: <20250410060727.1857299-1-riana.tauro@intel.com>
 <20250410060727.1857299-3-riana.tauro@intel.com>
 <4edbe1e1-b8d4-4598-bd9e-2a72cf18feaa@bootlin.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <4edbe1e1-b8d4-4598-bd9e-2a72cf18feaa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH7PR11MB6008:EE_
X-MS-Office365-Filtering-Correlation-Id: 216dade0-b0fd-45e9-9dd2-08dd7be08aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djJ1aXhSaFUwTmlKWC9KcTFubDc2N3J3ZTVrWCs3TFdBZUJ6OFFKN2ZvYXpL?=
 =?utf-8?B?U3NBYmRzNWRLV0c2d21Bb3pOMmdLOFV6UGlrSDBXcWtJUFRKWmhVSWtMNFRS?=
 =?utf-8?B?TWFIRTFPcEx5SFh1dDI5N3dKRXpGdy9JWHE2UXpFUWlRcTdhUkpaS21rUDJV?=
 =?utf-8?B?RVJ3NitIVktmd0YyMnBsYk12Rmtzakt4a3Z0SVJrazlqb3RiTjlQcUdpYXpo?=
 =?utf-8?B?eXJYaUFKMTB2SjEvYjFQSTRLbm9TQmdxKytFc25JT3RSNEdpY1F0UVdDWHFn?=
 =?utf-8?B?ZzRqWUdLaC96VlFqQk9QYkdLdjhuWlVIeDZlTjVaZUZlNVd4OUNHU2RBa2cr?=
 =?utf-8?B?cUozNWEyRnlIdGFVaFB5ekZValVOUWtGOUM4Q3dkN1BhSjJvQnZFZDkyV05t?=
 =?utf-8?B?VjNINDVyUWdzUUNFZ3IrRWlnaU9VaWl2c0l3QXlDR2ZyRHpWTjZDU2Vsd0hY?=
 =?utf-8?B?OXFCeGcxUmJDSFhvTWs4UGp0bXNoNEJja0o4TjI5b3V3NW9NRkxFdWhzZExh?=
 =?utf-8?B?UWtPSXl6RGdkTmFOaTczb2U0ZlIyeWt1YUo4YjNoei9WOWc0T1Q3ZDNWUUNR?=
 =?utf-8?B?UVVQSzBvRzVCZ1plNnNXam1pVTFEQ2ZHOW14dVl6Mmx0b1hIeWExZDc5UVdm?=
 =?utf-8?B?YUxLVFdrRnRZb3dLSlRWL3JTb3JDNzNRcVRPaHI5SHYxOHRxa3BuM3lzVXFx?=
 =?utf-8?B?dXI2ZmNQS3hLZXhndlpUbUNnWkRpSyt5NnpJMzlKQ3ZBVm5SbFN6Zmh4SXV0?=
 =?utf-8?B?UFY1MHpYZlRKSStzd2FtQVZnS3J2aUFlUVdma3luclFTNmNMWkF3ZGlZVDJI?=
 =?utf-8?B?aW5SYzUzbTlydllVUEM4MG5tTTVsdGRvRTAwWmwya29aREpjWUZuU3NrV01G?=
 =?utf-8?B?bVJvTi92cEY2UFBxTzZwS2lXNFBBcDZ1NTllQmVmR3d2d0NHeExoL0tLbjgz?=
 =?utf-8?B?NWVMc2xYV0RZc25CSTZINnMzd0JhOTF1eS9aSU1YdDMramhOWjdTZ3hscWF6?=
 =?utf-8?B?ZHBsWFVFNjBpdW9ud04yQTJ3SVBoQUhkdkF5YUcycVloRlg3VVVTNTFROUtZ?=
 =?utf-8?B?NHE4dURrVG1HZm9YMUozMlNYdk9zSHIrZ3d3WEpSSGxqUWlWNjFWMmk0Zldy?=
 =?utf-8?B?SE9aUFlyTmxySVVmaHYwVThlWnVCVUFBUUY0a2FPTDhXdkZ1TkhEK2VDdDVP?=
 =?utf-8?B?c1NpUXh1WWQ5RWhUc3ZmK1JZTzdXZzZJQmJ0REcyYzgvMnhVWlMxTDFqdnU0?=
 =?utf-8?B?d2ZXVDB5emt6K3lyR2hWekxOSEJ3K3B5Um5xdUNQYlE4aVVwemEvQzh6UGF4?=
 =?utf-8?B?dkxYcW9wRjAxZDArbG54ZEdNVkVsc3BOOE5kK1hxa3ZjT0ljVkFJZGlsdkpN?=
 =?utf-8?B?ZUNCTFp6YXYwTGRKbEoxditTNmNPSyt0OXhNVTJ6VkhqcjI5VHB5SnhUZXdn?=
 =?utf-8?B?dnpCMDZQZSs3cGNSSnJVOGRaZ09UYXZzWDBPTHFFL0NabW05T255dXRPckYy?=
 =?utf-8?B?ODhHSFBCSnhUYS9VQ05yRllDSXpiZDQrcmg1d2hBdGl6cUpITVVScCtmVnEr?=
 =?utf-8?B?dTdJSE5OaDA3bzMvb1pDYkg5cTI4b0dtcFdFRW0xYmhiTU0rajV4QURodWQw?=
 =?utf-8?B?NmpFa2xaT2g0bkZIWmRocENXTU5iR0xWbjlYOXU2MGFmYVdVSkRHb1owSmVZ?=
 =?utf-8?B?VXlWNU9QaWpLM2VLakxqKzVrV3lraTdTYmdEV2twZ2tZc3ZoZHRHZk9kUmpL?=
 =?utf-8?B?ejVrRWxNRjdNNXVNME11S0dNcmwrSytuT21WRDZHQTJrc0dheWF4S0YxQkc0?=
 =?utf-8?B?TU9paE9xZnZwMThFY2swd0NYODVhNXl2R1dMZkNhbU1oWkZKNnZvRm4ySkRR?=
 =?utf-8?B?dnJJOVliUk5OUEJjVHZ6c2FqMGQ0TWN3eHJqYW9LcTAwR051dmxDUFRnYW11?=
 =?utf-8?Q?urAOJKmzXjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFXaW5xaVRjL3AzVXVMSHl6M0RDQnM5Wm1EMExMTlg4SnJvYWNaL1h2eHZ4?=
 =?utf-8?B?L1VUQWhSL3llcUhVdnRWcWxjUStKeEdMTGxROWRKckJvREF0bW1zWE5KeC9n?=
 =?utf-8?B?V3hCbVJlc0gvYXVrMWc5Zzdxb1VjN0NZbjBBV2QxS2ZQSnQwbENBbXArSWxU?=
 =?utf-8?B?OFNubGh3V0V6NGVUTGIyS3NjR0tIcms3cVVWc242VUZJUE9MRFB1aHlEY0Jw?=
 =?utf-8?B?Ylo1Q2dHMVMwWTQ5YS92R2t1RFJ0VjRFTTFFd09YQUZ4eHpqRFUwTm1PaU5G?=
 =?utf-8?B?V2daZ1N3dVNRelNPbUtaWEFZcVhVYU9qcFdkaW00cjVSQlkxNTVmMWFhN0VL?=
 =?utf-8?B?b090M1ZDUDYwdytHeUE3N3RlS21SL0FCOVA5QUFEY0s3M1lvWm1PeDROREp6?=
 =?utf-8?B?RnRjVlJsV0FiaWpucUNxWE8xZ0c3a1pQUGtYQ2JsMnFmR1NzeW9IMDE1T0I4?=
 =?utf-8?B?YThtdHcxanhJNDZucWRDQzcyeHBqQlNWS1FsZTJjaGdLWDNWbzdZa25uUXln?=
 =?utf-8?B?b2tYRU1SMnhRcVVTVmZLZGhZTHlkY1p2WVFuQVBaZmFQTVlRY29tanhxd3Bp?=
 =?utf-8?B?S1VuQ2ZMRyttVVhLeVdGM2kvL3N3bU1nU1JFeHhZanBCeEVyeHFFSzY4Mkpr?=
 =?utf-8?B?Tng0Rk9OU1ZONHd4d2VodVpmTmVQUGFzV0JkOFdxZWtJNzRLSzk4ZldzODl6?=
 =?utf-8?B?L2Z4ZmczcWVqdXNnNTZ5RDZVRktIK2xRZVFmYlVlSTlmRnBPaFZwZ1dCVENn?=
 =?utf-8?B?eEdTWnhWVWFXenFSM1Q5aFd3T0FWMmtiekZmclEyVnFyQy84Zy9uZWtPVTJJ?=
 =?utf-8?B?b2pCdlVXejBlOWdrOStjZzN2NnBrWVZQTUN5UWRLUHlXM3hsR3JpYTlsbWpZ?=
 =?utf-8?B?Z0NpNjJReXUwVWZYcEFvc0JDRk90ZWs3a3VxRXUzZTdvWjFIWnVoL0MwdTFW?=
 =?utf-8?B?OUFHUFc1Y2M1bTFqR1ZPUExyL2xPVmN6VCtaUllMRmo3UTZrdVQwYlgrRTBr?=
 =?utf-8?B?b01CdlhHUzJLVVBXQmRNM01ydXdQVERzLytNcUJHTm1TQzdQNUhrSk8vWkx4?=
 =?utf-8?B?WDJFTWFXOVJTM0hVSmFuVmxtT3ljODVKU0R6SjY1T2pSVlJ5dHUzOStmQzc1?=
 =?utf-8?B?NTFoNjVTbnVuMTBqbmlTYkdFQnlaSFVWYWpVNlhsZk53ekJpZUZ3NTExRXUx?=
 =?utf-8?B?MTdjbTJiekthVTVIcjc5S1lyVS81KzNjMld0R2s5ajRLQ2E5UHNqQ3kvcVY0?=
 =?utf-8?B?QWFOSHEyVElNVi9wWUczTm9DRGM1Y3ZJeSs1VzdSdm5GSm1sdjlIejA5OFFI?=
 =?utf-8?B?cmU3aTV2ci9rSlgrTGkycVc1K04yWExpMVBIRlRBd2lrQlRvZXlJQ2t6WFZZ?=
 =?utf-8?B?NXVGQnhBeVE5V2s5cEpQUUMvUWxKTFBhUVFTTGtsTWZIWTZJcGxtNVBFbTNi?=
 =?utf-8?B?VU9TK21CUFJYQnVraklvTnpnS3pKblJ3RVlsL3NYd1VYZGJTV0ZxNnZpNUFs?=
 =?utf-8?B?cmU5WDFRNXpUMDZya3gxMWFZeW91L3NKQVVPdXN0SVRLSkQyVzBtditUOHZG?=
 =?utf-8?B?UHBMSk9aVFdEdU5GRm1kVmRsK0xlaytibUU3cThrbXZsUlZabi9zR1hUVjJM?=
 =?utf-8?B?a1BoQjR2bExOblhBUnNMYnZ5YS9EQitBWUh3R0ppZTNCRkdGQzZaU09hUlcr?=
 =?utf-8?B?ajdCYytHaG9hSXNzY0hKMTkrdENwblVlTW91TDNMVHB6MVNkVWoyeW8xcjgw?=
 =?utf-8?B?dWg0R3F2dGYyMkQ0cjY4TERvNXlmZUlHNlpSdHhMeUlWK1oxMjBnaU5JVnRp?=
 =?utf-8?B?ZEFVbXlZdnRtZ2lTZlFRSUplTm1rWVA2V0Znak4rTVhuQTNtajFzelBxR1U1?=
 =?utf-8?B?V1RvWFNkdHY1dFhXakFEeTg0QmpEY2FVNWpyR3JyQ1Q4MGttcmt1ZlVSNkYr?=
 =?utf-8?B?OUNxT3phKzljemQxcnJydUJSR2lySnd0SzU2YjZpTy9xODNnREpwNnRNQ2J5?=
 =?utf-8?B?M2pRbDg4MVliVm9WaXQ5SmNHSUlQSHZPUk1uekdZWEF1ZjBkYkk3NzFqRmFz?=
 =?utf-8?B?TlBsbjVPdVJ2aDd1RW40d0I5SmVtNzJSTlhaaThIaWpzbHNRUFpDb0tia0RZ?=
 =?utf-8?Q?KCUH5RV7a8Uh5nWxALKhwr+9H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 216dade0-b0fd-45e9-9dd2-08dd7be08aba
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 05:44:09.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wlk/UL+GydcR9w1QVrSkp4QFGQCYAkYOVRgUXp44VD4/PE/3U6j/96kTK6GwAF/1kJclAfWS0T2aqn39Hu7Suw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
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

Hi Louis

On 4/11/2025 1:23 PM, Louis Chauvet wrote:
> 
> 
> Le 10/04/2025 à 08:07, Riana Tauro a écrit :
>> The test validates if survivability mode is enabled on supported
>> platforms when configured using configfs attribute.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_configfs.c | 138 ++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build         |   1 +
>>   2 files changed, 139 insertions(+)
>>   create mode 100644 tests/intel/xe_configfs.c
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> new file mode 100644
>> index 000000000..8954ed87c
>> --- /dev/null
>> +++ b/tests/intel/xe_configfs.c
>> @@ -0,0 +1,138 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#include <limits.h>
>> +
>> +#include "igt.h"
>> +#include "igt_configfs.h"
>> +#include "igt_device.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * TEST: Check configfs userspace API
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: uapi
>> + * Functionality: configfs
>> + * Description: validate configfs entries
>> + * Test category: functionality test
>> + */
>> +
>> +static char bus_addr[NAME_MAX];
>> +static uint32_t dev_id;
>> +
>> +static int driver_fd(void)
>> +{
>> +    int fd;
>> +
>> +    fd = open("/sys/bus/pci/drivers/xe", O_RDONLY);
>> +    igt_assert_f(fd >= 0, "Can't open path\n");
>> +
>> +    return fd;
>> +}
>> +
>> +static void driver_bind(void)
>> +{
>> +    int fd;
>> +
>> +    fd = driver_fd();
>> +    igt_sysfs_write(fd, "bind", bus_addr, sizeof(bus_addr));
>> +    close(fd);
>> +}
>> +
>> +static void driver_unbind(void)
>> +{
>> +    int fd;
>> +
>> +    fd = driver_fd();
>> +    igt_sysfs_write(fd, "unbind", bus_addr, sizeof(bus_addr));
>> +    close(fd);
>> +}
> 
> Did you see the functions xe_sysfs_driver_do in igt_sysfs.c? It seems to 
> do the same thing as driver_bind/unbind here.
> 
Didn't see this function. Thank you for pointing the appropriate function.
There is a new series that adds a common function in igt_kmod [1] and 
removes xe_sysfs_driver_do . Will use that once it gets merged

[1] 
https://lore.kernel.org/igt-dev/20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com/T/

Thank you
Riana> Thanks,
> Louis Chauvet
> 
>> +
>> +static void restore(int sig)
>> +{
>> +    /* Restore after survivability mode */
>> +    driver_unbind();
>> +    driver_bind();
>> +}
>> +
>> +static void set_survivability_mode(int dir_fd, bool value)
>> +{
>> +    driver_unbind();
>> +    igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
>> +    driver_bind();
>> +}
>> +
>> +static void check_survivability_mode(void)
>> +{
>> +    char path[PATH_MAX], buf[4096];
>> +    int fd, len;
>> +
>> +    snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s", bus_addr);
>> +    fd = open(path, O_RDONLY);
>> +    igt_assert_f(fd >= 0, "Cannot open %s\n", path);
>> +
>> +    len = igt_sysfs_read(fd, "survivability_mode", buf, sizeof(buf) - 
>> 1);
>> +    if (len > 0) {
>> +        buf[len] = '\0';
>> +        igt_info("Survivability Mode:\n%s", buf);
>> +    }
>> +    close(fd);
>> +
>> +    if (IS_BATTLEMAGE(dev_id))
>> +        igt_assert_f(len > 0, "Survivability mode not set\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: survivability-mode
>> + * Description: Validate survivability mode by setting configfs
>> + */
>> +static void test_survivability_mode(int dir_fd)
>> +{
>> +    /* Enable survivability mode */
>> +    set_survivability_mode(dir_fd, true);
>> +
>> +    check_survivability_mode();
>> +}
>> +
>> +static int create_device_configfs(int configfs_fd, int fd)
>> +{
>> +    int dir_fd;
>> +    struct pci_device *pci_dev;
>> +
>> +    pci_dev = igt_device_get_pci_device(fd);
>> +    snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>> +         pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +
>> +    dir_fd = igt_configfs_create_directory(configfs_fd, bus_addr);
>> +    igt_assert(dir_fd);
>> +
>> +    return dir_fd;
>> +}
>> +
>> +igt_main
>> +{
>> +    int fd, configfs_fd, dir_fd;
>> +
>> +    igt_fixture {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        dev_id = intel_get_drm_devid(fd);
>> +        configfs_fd = igt_configfs_open("xe");
>> +        igt_require(configfs_fd != -1);
>> +        dir_fd = create_device_configfs(configfs_fd, fd);
>> +    }
>> +
>> +    igt_describe("Validate survivability mode");
>> +    igt_subtest("survivability-mode") {
>> +        igt_install_exit_handler(restore);
>> +        test_survivability_mode(dir_fd);
>> +    }
>> +
>> +    igt_fixture {
>> +        igt_configfs_remove_directory(configfs_fd, bus_addr);
>> +        close(dir_fd);
>> +        close(configfs_fd);
>> +        close(fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2a63d888f..74684ea35 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -279,6 +279,7 @@ intel_xe_progs = [
>>       'xe_create',
>>       'xe_compute',
>>       'xe_compute_preempt',
>> +        'xe_configfs',
>>       'xe_copy_basic',
>>       'xe_dma_buf_sync',
>>       'xe_debugfs',
>>
