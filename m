Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCE8C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 04:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA3E10E4A2;
	Tue, 20 Aug 2024 04:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWNwzaD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D4A10E4A2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 04:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724129006; x=1755665006;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+9IgdHg7ap7nNHYZkj3d1aRpPLtsmh6Z9ZwccGaO1wY=;
 b=QWNwzaD5+lTCnOOvDOB16mojbYmE/sZZF9rzHVXK+pDxDwo/K4cSXvbP
 i9YIVSDezevZXoVl3GtaCmcKp9MeTQTN7yJFIsIzkjxWiuZIhpLMhOQQq
 wAyKgxG17CxMbdPHW7yaDg3xXh+/LMMTKxMbxJwNOyct/ojVWReZVPrBf
 A5QjHl+o3WuVra/cS/3936Rdvqv+FpfBPdAWL0mO3Nt7oLx7ZnXUThTud
 wiTBi71OU23QKXtiUHh8u5LRWXWG4lv3peEe5iFw4tZMbPjdBVBar4Rbj
 9CuhI2Q5smLbH6xIJeVOYccLDeEV0Kl1eYc/uEZHjXOrReKRgH+NjQG+3 w==;
X-CSE-ConnectionGUID: 4VeRNMmsQZKSpizOQM4PZQ==
X-CSE-MsgGUID: EfLNpaN5TbWX5rSbk1xuUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22548730"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22548730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 21:43:26 -0700
X-CSE-ConnectionGUID: vHuhyGBJST6V18HLVCaW6w==
X-CSE-MsgGUID: KRS/ttE7RM+asqgy6bLqow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="64969571"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 21:43:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 21:43:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 21:43:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 21:43:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 21:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5bxHVEvttWeP5XW98efbxaRsWls/vxnb256kcW+UiuUl2rbOoXi2xCbGpoKVRSpcWY165tvsEt3EUj8QD+AMVUxUaXaribvfZik2x9iW+OmQMdG+/wMtqVhKwOnr48BXiHeIyRTC0mDOV9p2ZfRLxBECsrEO+/Yr88kjT56zUWw7PgogIGod6d9aYPw+TvjDd9Qj0oio/DM5kT7uCuh4V8c4zAfMjCoK/PdAH/tFhXndoGGyUWFBZZlhrjC+wvi60J0y5jhzCT1WxEx+3MOdvy34qhCcY9OrUj+sPgwoLPb6jmNgCNlbuMrzQytVv0A8vWf4jWOoa23Kbd1JVP0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnOcrIAL6PPwJyFQJdFrSc7xRFnosa+1xU38WO8uh+8=;
 b=NI7JPVEOD4YrjxOIEY/efuS0g/5zqTkrLW848Oq8EvF1SuMgwa9iYJI5dRSD6/CqeUuQS7loA+AY/Dh7DmWj9H/L+bZRXhUKx5MjFjydNmOxYv0dHJkcfISHkaAr+EVTyP29LFsTJm/O/GHBR4mBxsriTVrsIFqA5GLgWKLdkgA5CmJoGGpfheStsnEtnkDOnsMtXK4jybdfDiLari8ipm9k9q17Qucf7sSwIrMUSO7GsoYOxnoB+l3VxFtJyDe2kYJKQFytZt9UpV8O2V35RN+eieaA62r/FCt7VVHwxVGzZa9OFXDDTPabHXeaQHa3GSN3oi9QxWu3jj9guM7Nkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 04:43:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 04:43:22 +0000
Message-ID: <e7e9c3a3-1c7f-4f8a-a208-ef9e09edd5c7@intel.com>
Date: Tue, 20 Aug 2024 10:13:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_gt_freq: Rename
 ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240819100146.3130945-1-karthik.poosa@intel.com>
 <20240819100146.3130945-2-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240819100146.3130945-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee251c6-7c94-4a8d-0efe-08dcc0d29e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGdDVThRSzZnbkpkWDVBTXlXc0FFM2NsY3o1b2J0TkFJYjJyUk9Fdml0aitS?=
 =?utf-8?B?TFoyZ3dxQVZkSFJERU9EaGQxNk9KUzY1aS9ycU1JbmhlRk9MZ3V3Z1VrVlJQ?=
 =?utf-8?B?ZXQ1VEFIdEhRNHMreC9qMHZTOUtEeFVmZ2dDQlliKzkwcFM3UVVWWkpJM2ds?=
 =?utf-8?B?RUlFQTZSZFJUV1ovVyswcFl5MDhnSU8xMWZuOGx0TGd5dUZCK25CVCttaXlv?=
 =?utf-8?B?VWg2bVdjYVhlNlgzTnVlVk11UFVEb2g5RHErZ3VjV1V3R2VhUmpydE1TSFoy?=
 =?utf-8?B?QTVrUDFKcEVlVERhYTk2MisySDh5Q3pDMmRoZ3FJRGxPZUJoTkozVi90cHNP?=
 =?utf-8?B?NVoxdk9YUms0M1dRUUx5SUJtbG9HVVhGdGlBL2cza0UraEtySGFRdzdJSFdk?=
 =?utf-8?B?citFYldJQTJvWGNXaU9sVUxFV0t3TmdyNTZvVEd3YTdNVHhna2xieVFrQWI4?=
 =?utf-8?B?OERkWlAyWUJoQ3B5Q2ZmVXVxRFE3QklkN2EzaGpiOEZkYXFydURSR2tpS2Zl?=
 =?utf-8?B?UEp6QU1vcjh3eXBFY1RVRUhQVklSRnRFRlBMNEEwS1FZbVJCc1Jwdkx0RmRU?=
 =?utf-8?B?bExVNS9Kd01YaTFvUFZRODB2bkpLTkozeGJyVUY5c0VBQ3UycDJhR2szWUdE?=
 =?utf-8?B?T05mTjlObHQ4RllFY0g5UzUyMXk1b0hUNDlMREdveUkrLzBBdXpIN2d5aWth?=
 =?utf-8?B?a0ptejhlWU5iQTRGZWhNZHphZkg4T2N0MTZIWm1LT3czblV3eFZkWk1nWnRt?=
 =?utf-8?B?VVI3aXpuRGNwVWhrYVNuQ3BMU01DQjVncmtHSXNDdElDVGJTcVFpdVlCL1Yw?=
 =?utf-8?B?cGlmRm1IZ0huWGRRdWU1VTlFSi8zdmZ1WlVsWko5QTZDNU5WYTJKdElIdVI2?=
 =?utf-8?B?MUlsYWxjenRxaXozQkFEb29NZG5YeUU3U2VJcnByNkpwd3Z5NjN5c3ZZNWdq?=
 =?utf-8?B?dWR6eEFoM3FWbXp5TWpLZ2laQSs3WVRUUnJGNVhiTmZLZzhVeHJScS9BbGZV?=
 =?utf-8?B?dEo2ZlhQYWtlK0FSSERUbU1Ud28rczYwQmpKQ3hHdjNSbHkwVWxRUkozNDB2?=
 =?utf-8?B?djdzbUYwT2VpcHpDQzIxSlg1MVRMblBLNUFNdFJaWFBySFFadmFhMXZkY1Va?=
 =?utf-8?B?UFJZZHVMRlloWDJ3eDVUc1R0bW1Jc0QvR3Fob0VKZ2N3Yk82VWtNYTdNc0ZQ?=
 =?utf-8?B?WmJ5aFMrVFU0cFU2TFpXbDBTWUQzZmpoUVlLRVd0aWxNTkY4VGtucW9pSk8v?=
 =?utf-8?B?UXRpRGhqRzVueVJmSUdFWlBWMVRDRVdabUo3QWxvZThzdFV3TVoyWmxNdEgz?=
 =?utf-8?B?SWtnd1VVZTRPWnhPS0NlNXIrWSs2M2hSUlRDVVhucVBLMHlyQmpQUzF1ZXow?=
 =?utf-8?B?bmJmQnY1enpOcFB0SDkwbGd6ZXF0SGxoYldSNlcwYUROQ1pjY3kvRTNQak4r?=
 =?utf-8?B?MVNRblNxa1VIKzNCVzZCQ1ZIdDR2Sk43YUwrNFp6Z01BVEtvdnp3aWZ3bm8w?=
 =?utf-8?B?MHcwclB4TlBxd1JkeE5oNVcrLzAzZjJWUnVvTC9MTy9mNzlWM1NXNUFxZ3dC?=
 =?utf-8?B?N2p5dnFiZm5sQUxQQjJrNFJIRVliYWtoclNvUE1nSVAxdVNNUkd0RmkxamZB?=
 =?utf-8?B?MGs5ODNiRUYrWUkxRE9lalJQelRoM1ZZOGZ1Mml2VCticnJZcVBiMXhoZEpo?=
 =?utf-8?B?eUViditab2NaQlllN1dEWDlrRmJaY1BSSVY1L0FNRFNkQ0VJZ2d1MHlyU3VM?=
 =?utf-8?B?ODc1MkxZY2xNb3BvTHJ3YU9GZEZOa0tsbnpYL3NhbDJCclNreUs4OHJVNUNT?=
 =?utf-8?B?RnJHOTVlREhncThFcVRBZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVBUDlnS1ZrbDBDc0lOZnF5ZlVTcjN3eWt5bm5Za3hJRytsV3pwY3dySElj?=
 =?utf-8?B?UEZSZnNCSVNOZmZEVTVaQ3RldjJNR2F1WURQdjI4MUUyeHhiYjA4MEN0VnFQ?=
 =?utf-8?B?SWREM3p6R0ZNTGNPMkJHL1JFNitDVkE0bXlSTU5YaFM0N2ZjS3ZsZTZnWGNi?=
 =?utf-8?B?dzVwZmRPUFRsSDBNQ3ZFRGRMR1dhN2lNZ09nNENaMzE2TU1jYW5BRXJxUXRY?=
 =?utf-8?B?WHFUQWJxMDRhQWtvRU1PQ2U3TUJPZlJtOCtCNGVEb3pOcGt2SzBKd003TGxO?=
 =?utf-8?B?N09aVmczL0c4Q3I2cHF5ZzFVMnc1Tk8yZXFlOGZ3N1Q2T0hxazZFRzcwb1hZ?=
 =?utf-8?B?ME9qTUJwU1IwZFZJT2VyR0VQTThaRGxNM2VvV2kyVFg0MXNRWDlVbjIzaFBn?=
 =?utf-8?B?YXhRNFZTNm1xZmsraFB3VDZBell1anNXYjg1R3BRUUwxZDlScC9WRjR0VmNR?=
 =?utf-8?B?UmN2ZTVmaDVYNzhRK1Rxa1lHd3JNVjFBOGFXNXFpS0FHTjBSRGFQamFscU5z?=
 =?utf-8?B?Nkl3V25RV09mNDVIY1gzanY5UFk0WmhWUGZ6UG9Id1VoMmtvS1RpcHJ2akto?=
 =?utf-8?B?RjJSeEVOVXZiS2pqT0ovVTFsa1dsUkRPOHpKZCtndmQ3M1cxby9ERWJlZ2ZU?=
 =?utf-8?B?UmI1WHhtTlNsZTVRNFI5czIzTnNQTDcwSW51VFRtdHRVNWptTldPdUtZUHVw?=
 =?utf-8?B?TDFLTU9BT1pkVG9vdDBPc1E3UFYyTmFUUStoNEF6bmlFYWdzN1QzeWxxcGd6?=
 =?utf-8?B?blo0alJwdmZoL2QvdnBuVEFrTmd0bFZ6Z0dWUmM1cXU4aWp1TlhoMngzVGZz?=
 =?utf-8?B?b1RQWnB1MzlnYWxIZVNVTTdBT0dVaTZuc29lWm5CQlV3QXBMWitIZ0FtNDR1?=
 =?utf-8?B?NkJLL3dEb0g5YWthS2lBTXJwcW9Tb0RTaC85SjVJUWlHdS9YUnNraXR2WXU3?=
 =?utf-8?B?RDFBNmoyK3pPOEJWN2tOZUNYcG5Ta1BJcFJPV3djS0lHMHJQNTh5czlxcjUy?=
 =?utf-8?B?ZzRPZHF3cmVnZVV2ZkRmMXA3R1JwSS9LNW16MFpWdnRoMHFIengyeGtyOWw2?=
 =?utf-8?B?dmxBazNMQzVPdHNHemxXZWN2QXFKNFNoRUJYL1B2UUNlekFwa3QwdUFkNVdO?=
 =?utf-8?B?N3dvNHpmKzFRcDlycDdXOHNNY08xdDBrUTdicWhYTkRlcm1raEg1U21CaWl5?=
 =?utf-8?B?VFdzQ2xTOWg4UzVyUVV4RjVkaWp0b1VzMi9JblJXZk9pUjEvQUF6NFlmQTBC?=
 =?utf-8?B?R2l6MDRMc2l3dU0yTGVTMjN1QXdra0lxVGlqemlicWNCVGk0QkZJd2JWbHlO?=
 =?utf-8?B?MVJ0QlFWb29udW1rQ0dCcjdnYTJlWnFWMnEzMm13VkdQRFI5MWFVMGJweUlm?=
 =?utf-8?B?K0U5UmhvcnFYZ2lDdVA5ek9ZdkVtYUR0TmxmcUx3Q0J5Z3ZEK0pLUHhlYkQ0?=
 =?utf-8?B?d0pNNnVwWlZidXlOSWY3dXZaaHdyQmloQmJJWkFNZ0VESno4YVZodVZSQ2NI?=
 =?utf-8?B?MlFvUGxxdFNCbm1nOTY3TW1iNDUrcmVJcHlLQitOZnNXRFlrUVdCd1hNTXUv?=
 =?utf-8?B?UExZR1laWUJqdTYwSTNkMWFrTFVaakhDSm03TTRYVFdjOGd4Y3licmRNdnZp?=
 =?utf-8?B?YTlzd2V3Z0QzTDY5SnRqbEpPVTliNU9jM1NpOTJoemhvL1lMcWlrWEpQY1dU?=
 =?utf-8?B?NDlVdjR1bzl1eldsMHRNZjMvSDVCU2t3UFBzVGxvOFY2UzV5ay9iOEFPd1hz?=
 =?utf-8?B?Mm45QzNINVprb2owdndmNHNXcm1xWXVVYlZJS1NGK2dvSXdTRWM2cmFyZ3pZ?=
 =?utf-8?B?RnZMb3daZ3FlckxadHNsQmNES0FFNGlFMEdLUEpGR3NPN2xNSTBGTzUvekJp?=
 =?utf-8?B?emw4UWtYcEVxdWY1T2k3Y0xqeDgzZ0xHTXk5eDRvditpSUVTMmptT3NFcldy?=
 =?utf-8?B?aHhORXNuZmtJZ3NvYTlMWXAvUnpGdkc5WjBUZEM1THR0K0Q5YW1Xcmd2N2FF?=
 =?utf-8?B?Z1BXckxJUElRMUpiL0RwcGptcklJajk2OEg4MWJGenhwWHk0RVh4ZWhzZ04r?=
 =?utf-8?B?T1ZGYldOa3o2RkF0ZkVxWkhDaGpNRjdOY0RQTTQyOGN5VnUxaTYxSklRdmlD?=
 =?utf-8?Q?qjsBqxyP1USSoLpgm6SyN+qHC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee251c6-7c94-4a8d-0efe-08dcc0d29e82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 04:43:21.8916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuzTPRF5M5/QO5oUWQQHDPWo3DMLBozLgzBQPKa8vLJZ+pHmg9PyZ9PW7yYqwchbV3ahpgR8xtrnNvzX+fA0yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
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



On 8/19/2024 3:31 PM, Karthik Poosa wrote:
> Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US as this delay is
> not specific to actual frequency. 


We may need a wait after gt reset
also for min and max frequencies to get set where this can be used.
Rewrite this sentence
"This will be used in a later patch to wait after gt reset ..."

With the above corrected
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 171f9cb44..56cc10ade 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -34,7 +34,7 @@
>    * Too many intermediate components and steps before freq is adjusted
>    * Specially if workload is under execution, so let's wait 100 ms.
>    */
> -#define ACT_FREQ_LATENCY_US 100000
> +#define SLPC_FREQ_LATENCY_US 100000
>   
>   static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
>   {
> @@ -194,7 +194,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   	 */
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
>   
>   	if (gt_idle) {
> @@ -208,7 +208,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	cur_freq = get_freq(fd, gt_id, "cur");
>   	/* If rpmid is around RPe, we could see SLPC follow it */
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
> @@ -224,7 +224,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	/*
>   	 * It is unlikely that PCODE will *always* respect any request above RPe
>   	 * So for this level let's only check if GuC PC is doing its job
> @@ -259,7 +259,7 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	cur = get_freq(fd, gt_id, "cur");
>   	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
>   
> @@ -292,7 +292,7 @@ static void test_freq_low_max(int fd, int gt_id)
>   	 */
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   
>   	/* Cur freq will follow RPe, which could be higher than min freq */
>   	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ),
> @@ -310,7 +310,7 @@ static void test_suspend(int fd, int gt_id)
>   
>   	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
>   	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
> -	usleep(ACT_FREQ_LATENCY_US);
> +	usleep(SLPC_FREQ_LATENCY_US);
>   	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
>   
>   	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
> @@ -337,7 +337,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>   			     "Failed after %d good cycles\n", i);
>   		igt_assert_f(set_freq(fd, gt_id, "max", rpn) > 0,
>   			     "Failed after %d good cycles\n", i);
> -		usleep(ACT_FREQ_LATENCY_US);
> +		usleep(SLPC_FREQ_LATENCY_US);
>   		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
>   			     "Failed after %d good cycles\n", i);
>   
