Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D93ACCD199
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 14:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BCA10E2A9;
	Mon, 20 Oct 2025 14:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfpgFDme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9C610E2A9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760972187; x=1792508187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1fc/zJAkqG/9ghMoKJjvRkFIEt7Jh01yZl64vXxZ9wg=;
 b=KfpgFDmezjYrylOsK3ukFZRN/4BLXbUL9IO3407ZKZOWtqxhokwoN4cZ
 dGPzDQ1So9OL04y0R3OvS1EyzYIU2A5cx5HxsTDRw2MvG+gkO7u6881DT
 QZ8wBqCzLEf4tUK2bjVCPfPuQpiAtTAIQuCq3hzIXQW8FmXI0GFg38T2T
 RCiv9IKVHgt017pvPnQpcY5XR1dFXfXz0wYFBuGpVz0qf4xPKHSlRNrno
 dr6bxLHp7eqQSMbO5fxekoxeVTWotG8H+OQpSc7v8svB3dEC9gn//jOt3
 po8/Tl2vBt64fxcJAg+vLs9GtEkYkqJTjgF8UYhrJw49aHbuCV6bxf1CS A==;
X-CSE-ConnectionGUID: e2KV6dVTStSIl0dHxHocDw==
X-CSE-MsgGUID: Un4V8vo5QPq7zTpIPafTaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85709331"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="85709331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:56:26 -0700
X-CSE-ConnectionGUID: l6Xu9cPJQranB6SE8dFvSQ==
X-CSE-MsgGUID: G83vv2iAQrG+k2Qqw8Fxuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183364089"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:56:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:56:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:56:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:56:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUNFnWOBmPBpdZu9BKK54MygbK/aETh2wsHPY8QVP13dmZ6XJa+YENGzUAJWdvzZ/KxYuCJPTj/DR/BJLXtkY1ODKpHszpb0h6UFwihN1ZoIUnehYTlDu9pn+Ns11vfXdB1052GGYe/YIi83iYjLGf5dfIb0xb+RL/W5jWQ56lFc9EZUrW8aA7B/pdUkR/aihG5Qr0JH9/+eSxIYOH1zIaCc3EJXf04oyyEg43jan/E8tIqAfG+j3pvVTQrUHnkqrFlUl/EWwwwCIlAMmRVsXTzoECVc1eY575mW5O7wrHZ9DtRq0LbwzMs73VRW+/PQKfwAa1g7Dk0upvfmy6NWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSYWGNah1XLk3h/L9TKv5NuC+Yw5eqWzZiS6aqWbJW8=;
 b=jHIgKZyF7vQc7ZvMJG91CtgtYrWo6H1r20/i+vm+MByLvrwbjetecnYccxz+7V0TzUxgsMEh5YWIsSbszuHnQGvt8Y3eWZqIXdWssUQUQWGX6Zv8gDfKFmUh1ZmPKfVoF+pfjRSylj9HdZlJGAyt+YlyhuaVPiiHV5wyM7PNqeSQuDhdLjUc77iJwMf9J1Hi4y2VBiYrqMV0vFrckXXcnm9Kf5G4iK1NV0Dbh5dYre68gmWEtWTWiuMFCWVbaALsef3lOtcD9aWyFmUx54GKgbsK2TeY0CAsZOtx6c2uy3ZdHY9Qt9rB1VDN9Tg4fVSluK9U8GVil+BzH+zj/zToGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 14:56:22 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:56:22 +0000
Message-ID: <75bc3d16-dd00-482a-80a9-7ed7dca03237@intel.com>
Date: Mon, 20 Oct 2025 16:56:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_sriov_provisioning: Add helper to
 disable VFs and restore auto provisioning
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>
References: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
 <20251018161549.999459-3-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251018161549.999459-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::15) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f62e56-3408-44e8-3d95-08de0fe8d580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2NrRkVIZjJTa2Q3bVZKSHZOWVE3R3ZHWGlma28veFRqOFYrWU5KanZZNU53?=
 =?utf-8?B?ZldaWlZzVkVDMkJvckczVDRMWitOUGNhVUxIVWR2ekRtY0NCWXJBVzdka2lB?=
 =?utf-8?B?WmU0U0hFLyswZk1kWDY2TlE3SVJrVVc2OFZCcmhYd1pHempVQW5uUzBVd2VP?=
 =?utf-8?B?c0hiSmh1VlYyN1NwS2d0WldqdHh1VGU0MWpNZUVRT29xYks5VVJXanB6NS9s?=
 =?utf-8?B?djd6YUV5Yy9FY2dwZ1kxbzhtOTF1UnpkU0c1WTdkODhMM1FqWkN1UjF1bTcv?=
 =?utf-8?B?ZC9BbnRWN1l4UW81dEhqY2hqVHV5TGVadm9SQ3ZaNkkreFRQNW9PZzYzUWVa?=
 =?utf-8?B?eG9GNndMdWFqNm1IMEZDQWI4SU91djBtN1kwK00vbGJ3dkRRQVoxWFFiTm9D?=
 =?utf-8?B?Rk1OM1pFZFlMTVp0MGgyRzVQTXNkai9QRVF0Z3VQVUd5LzRCbkJ3aW1FaUZr?=
 =?utf-8?B?amRwTHZxQkxVLzI5dk1NVHUwYjN2Mk9LMGNNZWIxcVVqNU56bFBPY2J4OEdn?=
 =?utf-8?B?OStmb2d6aHFMSWNqRTFhbXJqbDZkQzFzeERZR3E2UERXNzZ1djdsSDRFb243?=
 =?utf-8?B?Nm1sU0NiZkg4OFBsa3Q2b2plcEk5T1NsWitjUWdSdzlNeDBsQmFpQVJpdS9Q?=
 =?utf-8?B?bHF6dXZVb0NlNGpIMHpERyt1SndxcEc4OVV5SUx4YVpCZXFjZER0ZkFNVnhO?=
 =?utf-8?B?WVVndjFMbWd1VXI3Z2xPQ0U5Y0kzNUUxV1BYN3UvazNXSHpzaCtxNkdjN2pm?=
 =?utf-8?B?MlpNbXhpaE4zMzhzQU1SR2VhRmhyNUdmNTlaRmNhUDF1SGVpSmxtUk1CKy9T?=
 =?utf-8?B?bHpLak1tSUVBRW9WYXhxcHhKUEcrZTFPSXFVYmp2bmhoWGdWR0NpcDE0eFlJ?=
 =?utf-8?B?TU5PQ3c1Tm5BZ2o0MzNIM1RHbXhFTUJPNTQxYkxXQTdCRGNzRXpqMW4wbVRj?=
 =?utf-8?B?cEIwVU1CUlpRVWlwYkdRRUl1b1RtUU9lWDBJUEtyWDR4M01YeFl0TGRpcjlu?=
 =?utf-8?B?MjJDWU9kd0NoM2w0cmd4ekZFdC9Ud28yckYwdDBLS2cveVEwbDd6cldmMzRW?=
 =?utf-8?B?NThrQ0YrOFpNWTN1YTk4VDlGQW5ETWYwR3pBc0RrZ01uWlhuNFRYSFNsYzc0?=
 =?utf-8?B?YzIxclBpV3h5TkFJQnBqS0F0NllSQUJNQkJZSDhucEJ3cXpnYVRsVGhyY0JG?=
 =?utf-8?B?di9KcGRyR3UydEErYXJrTEVsdnJOWnNQQ05kdUg3UnVHQXVyMDFMWmM2bnRC?=
 =?utf-8?B?NnZyUmd2K2oveWFvZFRIdnFqZzFBVjhXaGUwakMyODdZMnIva2YzY011UStE?=
 =?utf-8?B?MEJ3ZVZyYWQya3BjLzM4aUMyaFJWaFJjQzN6cGxNN3ZwWExTWEoyd2ZwSUcx?=
 =?utf-8?B?UU85dXJja1BqeHFTYTZPcnljemt0cXBaZUQ0dE9zYnlKUFN6dHppLzJnZ2xV?=
 =?utf-8?B?UkJ1OUlmWGdUNGViWXVRSSttRGhBUlJBQTBIeWpyU1FWc0x5VFhyVmVkOFk5?=
 =?utf-8?B?SWpyVlRnaStiemNhd215ejZVZ2Vyd2J0V2lBU2U5QWFHOWlEZUMzNGpoNm5U?=
 =?utf-8?B?NHR3ajRaVS8zbUI0NjFxN2l1QnFCVFVhNk9CSDJ5bnNOdnFxempTeW51aStP?=
 =?utf-8?B?WTRkWW9pMDdXTjVYdjBnbld0Y2ZhKzI3c3BsWVArQXdoRWhFaCtuajVzSnp1?=
 =?utf-8?B?NjhmWEpnL3pDY0NiL0pjdmh6OU82S041ZTU4bDdVeGFiaTNDQzNvNjl1Wmsz?=
 =?utf-8?B?eWNvcUJQQ3picHpLalJ2NjFWWFZDNmNTQUtCcHFkNmhLaEVIRWg2UWluNlBO?=
 =?utf-8?B?Y2RmK1VnTWs5RHBTSlJIby9GZ0NudVZxNmljV1JFVGRkQlBLV1o0bTVNY2ww?=
 =?utf-8?B?VGt1OUxqTkp5SCtveEhxbGU3b0xQcG1rR0RaMndjQjFkM2JuUmZHSUpuODNZ?=
 =?utf-8?Q?PI8XtyWOOeTQsG3dCRHflp2cyPoP3pFo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dURNaXBKalRsdlhoVlczVWk4b210TXF5U0lSS093NmhEcnkvQ1pmWG42Y0NO?=
 =?utf-8?B?Zk4xWTM0RkhrRkVZNXpwRDM2dnhWc0VzeC8rRFowM1g5N1Q5dTUxaEo4ZW5O?=
 =?utf-8?B?d2FzSkkrN0Q3TC94NXY5K0xXeDFzR1NnSHJMbDJ4RDZDMXM2bUxQYWU0ZjM4?=
 =?utf-8?B?Y0lJSFpseGZhaktNei9tZXBQNGVwNFMxNW5oT0xGdXpUM2wrbGloanI1L0s4?=
 =?utf-8?B?ZVJVN09RN1dGR2IwMEtSME91ZUIvdkh1Uy8wN1JjZTc0bVZYQkcwbCtwY04v?=
 =?utf-8?B?a2JWMWFBMkF4Q0dWTGY2Mkh2R1lLczdhek5KZXFXenF3Yy91U25MUU82T1dZ?=
 =?utf-8?B?bDNTS3hPckR4a0JISkdBZ3AzV2dBSmZ2QldKaGNZYXl4Zm9HU3FtZG52Y1Rm?=
 =?utf-8?B?eWY1U1ZJaFBaZmFMOVdKaVRFZ2M3bUd4a0FKN0VQcWZoL2kvWldxSXI2a1ZQ?=
 =?utf-8?B?SXN3dmNMTUc0cThMbjBIR0twSnpYR1prNEkzMnp3SWd1aUlUbTdrMFptVVlQ?=
 =?utf-8?B?SXV0NjlzRlRIdmVaakZpcGtEV2M5NC9YYjdZTmtuMWhNSksxVnJCdWc0Vkox?=
 =?utf-8?B?SDhWdTFzVVV1cTdlSm5VenlZUUlxRk4wUndLTGlGYkZWemRsSVR1T2p3eFZH?=
 =?utf-8?B?blRrS3NxNXFMOEJsVkhEVmNocFViYUxRUnhEU0xwWnFOTzM1NjBBZGNvUmVY?=
 =?utf-8?B?d3dMdHVtUzRZUXdNUmNUUWltUEIvc0JtTVI4L01BNm5TMEFTMGJCd0pENEsr?=
 =?utf-8?B?Y3p6aWlOQzhVc3hOdDN4bWkycWtrL2tZaXpyV2pZSXVCTllZRHdXcFhEY3A1?=
 =?utf-8?B?ZVhMRWNreDZLUXIxdFFHNmV1ZDdxNWZlQUgwYjBXd01qM29jb3FGN1lyZnE2?=
 =?utf-8?B?bG1PaFlwL1ZuTEptQmtka3dtRFhCVU5yVzB0OUgyS21KZXEydENQY3lYRiti?=
 =?utf-8?B?cVVId0g5ZW9HTzFWcGlCZjkxd1FFcjNWZEVaajV6dHJ0bUd0NnNoOWd5Nms4?=
 =?utf-8?B?ZGY4Q2M5Q3dLRmZENHNNRTVGN2JIRmorWWNZRExFc3VaY0xKWVk4bXhRR3Rl?=
 =?utf-8?B?RHF3QXRFRWIxZkxlT1dFem5heVFtWDB6WFN3akdQM2F1d2VXSkQwcjI2VjdP?=
 =?utf-8?B?dG1KcC9Dbkd2VFdqU1B6VytJd1h3akZRUGVZSFJ2NVVEcWFPbGpNNmVNVXAy?=
 =?utf-8?B?SzlnbXJBeG9QU3ZrZnVkRzh4Y2QvTmxtUE5tRFhRL0RpREdhRTZnWkNCQ0RR?=
 =?utf-8?B?U095bVFQVG13amdPbEtZMzFqMkI1SXFBaVNFc3J1Q204eWVBODR1TkptUkVL?=
 =?utf-8?B?RGJBMFJVYWpNVEdFUElDTHlGQTEyUzRjeEFwaE5VT1Ftcmp4dkdRSHFYWUR0?=
 =?utf-8?B?N0JLWVJWek1GcW51RW1ubzgzbGNKdnVXcS9vRWJ2TDBFc1ZRTzRxRmZrQnRX?=
 =?utf-8?B?Yy9rRTlUbGlHallBM25Rc1o4K0htUzlPbTIxYTl1NVlPN0hGSlBMamswYktJ?=
 =?utf-8?B?OXkycExQOGRrdGdGL1F3RkZGaWFFZkpwTWZER2FDV2pnM3Z4ajB6N0Z0Sjhh?=
 =?utf-8?B?UlJ1SmJ1bmxrT01WWGlLVCtJMC9YVjYrRC9sakh5SDEzNDBlV0NYZTdoRWky?=
 =?utf-8?B?Z0huSlVGVlRXNlpwOUZzcHMzMTJpUklxZ0JIbUhOYmh0T20wbTZCQm1uVWJD?=
 =?utf-8?B?VHUvc1VDTFRiM0lQTW51T3lCK21MMjZrbkEyLzFBNVdLZy80a01ENkIrck1v?=
 =?utf-8?B?S21MTjhkM2h5UVJRUFE1dTA1THZXaXNWU1dKbDdmWmIySnBvUFg1bGJkS3VM?=
 =?utf-8?B?eUxaU2F3bWFLeEhGa1ZTanlueUpXM05Zdmg2RFlMT2tvdzB3UjdtVnhjVi9t?=
 =?utf-8?B?dlMvY2ZzcGYxOVZMaS9ScTZwN0oxSmhncm43OENRcDJkOG1qRzVWaUhUc0xP?=
 =?utf-8?B?dXhQck5vZFBMMHYzNXgreER0RExqOTZYWC9WWDRGOVdPdlN3QXFWcERibmkw?=
 =?utf-8?B?Zkl6cU1XOFdMZTNNMVlpdDFQNVdWeGdUcFdTSW1xemU4eUJpdnJDYU9WOExa?=
 =?utf-8?B?Tmc5d1dtMEk5bnIvMnZGM3E2TXZTcDVMdzdtVmxUVHNQNTVHL0k0R1NTZ1I3?=
 =?utf-8?B?RitCZXBjcnZnTVUvQnpoRkoyVW5tYTlHNjBlbFZ0K2pNZzRkWUZjRm5CRitI?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f62e56-3408-44e8-3d95-08de0fe8d580
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:56:22.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F50CrCj8lEiS1E4LNUCrLLYd1kWtaJRTfGXVwWOsCZXIpYVDbTSMQjOxhhcRj/E83HddWFzMkJQt4jx/W7R6BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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


On 10/18/2025 18:15, Marcin Bernatowicz wrote:
> Add xe_sriov_disable_vfs_restore_auto_provisioning(), a convenience
> wrapper combining VF disable and PF restore_auto_provisioning actions
> to reset SR-IOV provisioning state after tests.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   lib/xe/xe_sriov_provisioning.c | 16 ++++++++++++++++
>   lib/xe/xe_sriov_provisioning.h |  1 +
>   2 files changed, 17 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
> index 2a02f7cc8..ff9d1f7d2 100644
> --- a/lib/xe/xe_sriov_provisioning.c
> +++ b/lib/xe/xe_sriov_provisioning.c
> @@ -763,3 +763,19 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
>   		}
>   	}
>   }
> +
> +/**
> + * xe_sriov_disable_vfs_restore_auto_provisioning - Disable all VFs and
> + * request PF to restore its default auto-provisioning state.
> + * @pf: PF device file descriptor.
> + *
> + * Convenience wrapper combining igt_sriov_disable_vfs() and
> + * xe_sriov_pf_debugfs_restore_auto_provisioning(). Ensures that after
> + * VF teardown the PF is reset to a clean provisioning state.
> + */
> +void xe_sriov_disable_vfs_restore_auto_provisioning(int pf)
> +{
> +	igt_sriov_disable_vfs(pf);
> +	if (xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf))
> +		xe_sriov_pf_debugfs_restore_auto_provisioning(pf);
> +}
> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
> index 4f2a4c13e..e1a9d0a63 100644
> --- a/lib/xe/xe_sriov_provisioning.h
> +++ b/lib/xe/xe_sriov_provisioning.h
> @@ -148,5 +148,6 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
>   void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
>   				 enum xe_sriov_sched_priority value);
>   void xe_sriov_require_default_scheduling_attributes(int pf);
> +void xe_sriov_disable_vfs_restore_auto_provisioning(int pf);
>   
>   #endif /* __XE_SRIOV_PROVISIONING_H__ */
