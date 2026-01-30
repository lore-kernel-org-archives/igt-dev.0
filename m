Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B575E6BF3C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 23:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20D10E109;
	Fri, 30 Jan 2026 23:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K17AUxFn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756A210E109
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 23:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769814250; x=1801350250;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2uG7OIYIpfV0t5u1/7Vn5bf35lLVlaOcw/4Okc+Lx+c=;
 b=K17AUxFnPZVb2I7TEakTEHKp8Lwadj8cJ2XD78zoVqoUnAYYMqy7PA+C
 5h9C82kEaHhy/YhdXWVG4zX35mMKMLWWBqosMRdpNCxRG+9Cse6a01VZ4
 PMnxCTriLBDwGr7EUDEaAVzKNa+/TURTUat8eZqH9+5ThgkoKG9uu8dF1
 w0K0wrmFxt7uXS5JUXqlFg7lQLxv9KYR43w7hYl6TlMDJBTel5x1KWVWn
 Y4xVqdNyeXJ5VH/Vs1DCJflIBJcJolFA/RRTAX+4UsHmd40IUJul4yVxV
 V4xow9pLWbfmRYMZcBd3qYR4PRKemS17bVmyVRoeLeY56mGOWeZ8hnI6e A==;
X-CSE-ConnectionGUID: jkdtq+IrTPWoAtJ5pjBdCA==
X-CSE-MsgGUID: UgCS9jjBSXaUX0Wvw8FWkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71153446"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71153446"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 15:04:09 -0800
X-CSE-ConnectionGUID: gBc+mJTwSwyK1RReGknBaQ==
X-CSE-MsgGUID: Jj6+OqG+SOuwlKgNJg/OcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213497324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 15:04:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 15:04:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 15:04:09 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 15:04:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJlDdOioq+yXUF63gbI2SVvbNkNT7kRAFZjofs9q6SP4UMfaAzzvxCeBJXAeruvhrd5Y7naTJBthBC06pVmrikBgr8lyXqsylnK3hJ9EgIC/CHT6HazxCTF7bJLmZI1cTZ4Tcw4qMRWhStsB8t+Cru5y0dsY9S74kkI3wTaQyUQj8mHGNbtzj5LseCLKmmjWM4P0KiuuLfHYM9pr1SPteYeXY9gE8Mn9Sm3xGg2Ud6PGMzOHw8//Z2490ZxCPLa0DYpf2tPC4SOu7Doc3Wnm3AMJz7HpVIoxHFjlZbFYvhadjOys3ld/mdfbGNAEwys3e3KAC+f6sfyaDTwcSfShDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPpzidHb494ALOKHxkOtnCRL8atsHDmMm3xppNk4OaQ=;
 b=iLpUh1R5bOf/AxhFy9s5leW9soSVkWn6x6sXpw4uwWcmo+uvzfjeQbxKSvMMONrfLylWNF/lvofXeEcQpXNiPaOXcojBItp0fDPek/N7UpBIKrAGxp0SzdjIy6P6n4DzG39LDQiH4E0eiIpvTCjip9kP0+wIjFcuzYKNXUCGavfCQRqwjfvcx/GwA7YwJYIhmlYdLfcc0hvFYGRE27DcsNjZ3db95xrE0vYm/3YW2d9QoVFW1kkL8XUwT8BacWKwXySJfAJ+NBOUK7gn19Mc9/8DzFTDEEi6J4AYhXHIv2trfx9WKs+kZGhumfqNeNFALq+QM/1i4JQfgVwjXFJzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 23:04:06 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 23:04:06 +0000
Message-ID: <8a703da8-94fa-4950-b45a-4e8184926e54@intel.com>
Date: Fri, 30 Jan 2026 15:04:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
To: Jia Yao <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260129003146.340181-1-jia.yao@intel.com>
 <20260130201257.572902-1-jia.yao@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260130201257.572902-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: b06f1fd9-b78c-405b-894c-08de6053de7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHc3V3FhYmlyaGhDU3BsNEZaeHc1ZkNSdUg4b3I1d2taOEhoUlZEMkJhaThy?=
 =?utf-8?B?ZVoxMGprcmJLYVVmY25JY1NBUyt3R2lrQklPZWppRzB4Tys4bDVuNDFZTkw5?=
 =?utf-8?B?aWkyOWdIZmF1dXZIUG9RZkM2QVc2ZVRNSHhOZkVsZU9SYmtLNGoyQkFWVy9Y?=
 =?utf-8?B?Nm1wZUNUaVE0cEJJOVQvRUpBUkI0L21La3IzREFIekhUamJKeDB1c3BlZmVI?=
 =?utf-8?B?emkvYkh1czN5UFo3cWhNNjZqK214REZkMDVuaHRxYmJ2SEx2dnp5VDZLaW51?=
 =?utf-8?B?cjVSUHZqNCtZOStZMTV5VVFlV01uV29idUkySzNHQkFDZFJRVmF0d2RNeDRK?=
 =?utf-8?B?M2FocXZGOHFwN0plSkxtR3YxWjMybEVEemExR2hQVk5vZGJqSHJvb05GU0Q0?=
 =?utf-8?B?Y3VnN2hVd200MFVHVVo4UVdqSEZJM25QZGF5cVBWekR3T0pHRXp1amMrUDBo?=
 =?utf-8?B?WTRqTUtwMFhZSkhKb3lsRkU1WnBMaXJIMWtQV3UvcnJjY0JyV3IvUUpGUGpa?=
 =?utf-8?B?K1hnU3FOcGpYUFNKNXE4VjZTblBITkc5eDg5MU0rcUxIVFhrVXVRM1pUa01V?=
 =?utf-8?B?djBvN3J1T3hXN01ERXk0T1pEV2R1dTlWT0pnQnFtcWtCcUZmdVRlK282R0w3?=
 =?utf-8?B?M2EzZWlhYm1ZMnhTcmJWVDZDbEZCdGE3UmZ0a0ROeEV5elhRWDRxUEozOFlK?=
 =?utf-8?B?U3FjRm5HeUw2bFpwU1hNUGxNUUFRR2tCQnl5OTFvVC9hM3hySDYyYzZhVEY1?=
 =?utf-8?B?Zlh1SVdQV0I2N2QvYUdnREQ1bkFBaDVWZTlYQmcvbk5OY0JoYk15RER6S01D?=
 =?utf-8?B?NGdLYXhCNy96VXF4YWQ1cG5pM0c3VjloVTdoVEpuZFNaZ2IxZC9Dd2JDUXVl?=
 =?utf-8?B?T2RCcnpGTkxrRm1RUkFSR2FzbENWTm9KUGs5Szl3OEhJZEd0K2VKTkxTYklT?=
 =?utf-8?B?d0ZXN3UwcEVRQjBuTnBrMFQvdngrT3lXTVBMYjRMU3FpNUZjWnVZQVFwNi9E?=
 =?utf-8?B?MHRFVkNYSjJsZ3VLTmRtdXo3a1h1NEFONHFYVTZIdW9nQmRUOEJtTld1Wkp4?=
 =?utf-8?B?QSt6UFRYd1pvNnN0RUo4K2ppZjBwcFZJSDVNNXV2VW9lMGFTZTNtV0tNZjIr?=
 =?utf-8?B?d2k5NU5lRGtQZW5pUTVSd3pURHV2d2pIYm9sdVFnQ3ZNNGpjc0lnekg4Z1RS?=
 =?utf-8?B?MW42M1BjRHc4ZnNXSE9UcHZIYlFEeGtaR2dnb2k5VTdVYUZ1OEt5OE14V09z?=
 =?utf-8?B?c3dHQzdPMTFiN0hWK3pCK2JGL1VPZHlyMjQ1RmJzREtSZUZIK21xUjFWZTgz?=
 =?utf-8?B?QUtnMUpNS05HZmRkVnhhRThvU3B5VlBHSUI3TDNpcW9OK3RueDJ6R3pTMmhD?=
 =?utf-8?B?QXhGRkxNT3VNY3M2OEF0WmF6S2RudTFiN3Evb1g3SFBwdE1oS25xR01RNDVV?=
 =?utf-8?B?N2hOUGdpYzNLMmF5QXJmZ3F4a0VoanRZMXVKYzFEMXBkeDVXOEFoUHF2RXJm?=
 =?utf-8?B?R0tRdllIL3JRa0hrTU1rMVVaM2hQN3ExS2ZWcmJXWlVzWjZDTlNqTUp1cXpw?=
 =?utf-8?B?ZStvSjdWVHpIcFhEZWh2aVJJSWExYzNhT29STWxGVVFkdVFva0QwNXI1K2xN?=
 =?utf-8?B?QVVCUklnaDJJcXcxS0tMMDg3QUVUb3ErNUxhdHdkWFNXbU5HT05WNGxZK2V0?=
 =?utf-8?B?cXB1TldjbXRKb0pscTYzanNJZUNkOHpkYlZaTVltdk1Fb3RrMHNCWEtmMUFl?=
 =?utf-8?B?SWNwUlQzaWJvMFo3VFBWQTFiWjJURUN6dE5ERU95di92bEVQVm1JWFRxb3B6?=
 =?utf-8?B?QTgxS3V4UENBTmpHK0s0dUJULzU5S0xxcHl1QXBkT3ZhSEZHb2t5RVJYVWJZ?=
 =?utf-8?B?VkUrUlIxSmNBVnJHeGhpWk9JNWl5dDk0VVVCVTlnMnU1MXFYVWdxcXpkdDFu?=
 =?utf-8?B?VDVBQVcyNUJjSVdpUVVnRWtHOG5Ib0xlUlVWb25xQU8vSDdaa2VDYkFsWlZv?=
 =?utf-8?B?aXJTOEN4Q2FZRkZzd0tnbVg2TU04V25MdERZLzRTWFREM2c4aXgzc1hGYjlT?=
 =?utf-8?B?RDJOQWhobEhvRHZvOVlaSGIrMjZua2c2bWhGcTY4VXpRVHZyTGhXaEwzU2kv?=
 =?utf-8?Q?i2CQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3N6VDJJOWx3MWNLTHFCVUxralhCQ2RCdTR2MU5aSHpDM1loVzJzTU9pV2tN?=
 =?utf-8?B?OXVwVkhCM2xXTzBUeEo1a3FqNncrZmd4Yk5oK1g3V0kwbGJpdVZxbWhTU2o2?=
 =?utf-8?B?S1lSeWpZQ0c5cTFxcCtvcHRmSFJSdnYraVJxR1VWR1h6T2pTNjQ2dTdUU0ht?=
 =?utf-8?B?aE9yOHJ3bTVKbUxQNFJ3ZzRKam5FVnpoMllyc3Z6TVJ0dEJpTHpJQ1lISjdn?=
 =?utf-8?B?aTY3VW5YUmZ4c05Zcitjb3ZUK2ptRUZ0ZXdmZE8rMXE5bnJ4UVN0TzhiZ0hi?=
 =?utf-8?B?ZHFLMEJjbFhZdEFVUlFaT3g2Z25LTmcxcHVwVnlYUi9GOU9Id1BLZU8rTHMz?=
 =?utf-8?B?MksyQ3F2ZXAxMnF5U2pSQWZObEtHdVl2ck1zRzQzeG42M0orYW5LQ21aNFNZ?=
 =?utf-8?B?TldmZmlhdFY2MEJpVzdxMEpLL3h6YStMamhkVTdSYmY5cXNIYW9CSzBFN2xF?=
 =?utf-8?B?Q1R6TW1tYVo4Z3RyMjkwSURERmFMYWdoeHltM1Z1OW1abnlzWkFnWUQxUVNn?=
 =?utf-8?B?QktMY0tMcnZsQ1BXWVgwTnYySGh6SkhXYWlGN3ZIOE9JMkdHb1pIMlNTYVVX?=
 =?utf-8?B?OGNyNVhiSnZKK2dMTHZ1SGVGTDVkUUtDelhnMzhRV2VFNlJzTk1xREhacjAx?=
 =?utf-8?B?NTdQUXdtRHVHd0FuMmpiN2NZQUF2alRQYWF3VUNZbjFweVd2MlM0bE5OT2N0?=
 =?utf-8?B?QUIyQUZqamFEUTF5NlM0RzI0YkV4dXpiQjFZSnlQUTNTd0V2Z3Jtc0hTRXVE?=
 =?utf-8?B?TWZ6UUFMdlVuYWJyN3BNWDkvRVZBekdaSVB6dmVCeDMyNHY0N3FvWGxONW9v?=
 =?utf-8?B?N0ZVRG5yNlhjcE9SL2wvTXNyNVEwRSs2OXlKcVliWVVRa0l0aWV0d25DU2Ro?=
 =?utf-8?B?VlQva1VsR0FVYyttalkrc3BkVmNCT2lHQ3VKN3hzNFFPTklPOFAxZWc5bEti?=
 =?utf-8?B?YnVUSGZnSVNlSmZ1WHdMMWlCZ0RyWTU4TWMzL3lFc3dLb3FYbWxzcVJiWHdI?=
 =?utf-8?B?Rmkxa3BOMWVRREF4LytMU01HQ2lyaUxQS2o1Zm1IenREVEpOT3hVTi9mNVVB?=
 =?utf-8?B?cExTY20vQWFYZnJHUXdOd1J6RllXYStPeisxWS84OU1PVGROejNqQXBUMzZD?=
 =?utf-8?B?QXpOSDU2c2RacXNtcXQ2bUVpSGlzajREL0U0YjRLNmJXSzBaS2ozcklLUHE2?=
 =?utf-8?B?S3p5Yy9McHN1bkNJUmNFUzUweXk0ZFV4YmRITmxaNGZQQXQ0TjJWZkVsQ2xI?=
 =?utf-8?B?TlhmMFZ3L2ZZVlZZQ2tRRDZSOHRrTjQrM2RpMGlwTjkwUk5VM0dzdEFyalRz?=
 =?utf-8?B?SElnY3FCYXRBWTlSZU00WVk1ZzFxNGpNUWJwQU9LU1lSVTNwTXdWTktRdndO?=
 =?utf-8?B?YTJ3a1ZUWjNPNWYzeFMweXFJcmhGbTVPYUpWK09IWml4TStEeTR0ZmVpazZW?=
 =?utf-8?B?UjFWV0Y0dGN4SG5HbklnUElzRTFuaERha1ZOQlpUWGZvNHNqUmlyNG1XTGNQ?=
 =?utf-8?B?dFNSU1dJakxyaGhJTXZlcStqV0ZoaTJIbWdKZG9PY05GV2Z0cldjY3RRRnRs?=
 =?utf-8?B?ZmNic0ZhVGdENzVqdG4ybjJ6K25KWCtFZTBnZU9FVG93bTF3UlJjOGhmMVB0?=
 =?utf-8?B?MjdGbk10T05tWGhGK0VwSGhpRkcwVFBuZWQrT08zdVJGWlprVHE1ZGFoWjhG?=
 =?utf-8?B?SnVWOEZodEFUS3JRaUhFc0pkVW5oVGg4YkRkRmN4bytqUkxUOUxJQ0NTMlNW?=
 =?utf-8?B?L3NJdEFybmhTaWk3aTVyMGx3b0EvK1prM0FlcDhlQ290R1RKRGcwMTR5RE1v?=
 =?utf-8?B?U0dsUEV5RnEvajdFakN3QVNuRVRCK1ZKb0lHZVF2ZDVmNlB6TENjbzFqRVRT?=
 =?utf-8?B?Tmhlck5DajZoZk5XWHRwWmpueUNjMzJVSW5sbTJqNUdSTzhXVVFWbkd3NUJy?=
 =?utf-8?B?YUhRMk1Seno0VWJpSndEcDlzOUR3WU9OWEIxQ1J6YmN0NHV5dS9QcW5zRDFE?=
 =?utf-8?B?ZFluZkcrd0dLRE1iMHdYSjY1OTNvT3hadjVvQUtmVzRZQWJwTEtLTU5taWJ5?=
 =?utf-8?B?YmE4SGdNVDhFL2ZJZWpCd3BteFV1SlJOcGhhWXJxcWtXcFFuL1VuTCs2TElq?=
 =?utf-8?B?ZVpPWXd4bVMzMTFvbVgvY1Q0a2NPNFJXck1oSzNOMlZCbGpGc25hbm5HUndX?=
 =?utf-8?B?bkVGaEJ6YWo4SThrN0Z3N3NqYTBRSVJtNVFtRUhwQ205WVF4RHBWUk9FbXRn?=
 =?utf-8?B?UGdkTVM1SzRBNWNSSjJXejFSeUluQ1N0cHZKdkNyNW5Uc2lmSnRiTWdmaFJM?=
 =?utf-8?Q?pDbqUuX42RHs5QYBJ0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b06f1fd9-b78c-405b-894c-08de6053de7f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 23:04:06.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHkWjcAdWaBfv8nd5214BWTOMV8ge+/qbR/09J8W7cvn0n+D4gaHoBZbrqUj1qXKGzVDKxFO80in53M3Z1jFaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
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


On 1/30/2026 12:12, Jia Yao wrote:
> UC PAT index with CPU cached memory (system allocator) is now rejected
> by kernel to prevent security issues where GPU could bypass CPU cache
> and read stale sensitive data from DRAM.
>
> Modify UC PAT index tests to verify kernel correctly rejects the madvise
> call with -EINVAL, instead of attempting to execute batch buffers.
>
> v2(Xin Wang)
> - Put madvise rejection in a function
>
> v3:
> - Add multi-vma check in the function
>
> v4(Xin Wang)
> - Implement reject function inside test_exec
>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 47 ++++++++++++++++++++++----
>   1 file changed, 41 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 412ad0384..6a15089b3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1193,7 +1193,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
>   		      DRM_XE_MIGRATE_ALL_PAGES, 0);
>   }
>   
> -static void
> +static bool
>   xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   			    size_t bo_size,
>   			    struct drm_xe_engine_class_instance *eci,
> @@ -1289,10 +1289,39 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   	if (flags & MADVISE_PAT_INDEX) {
>   		uint32_t num_ranges;
>   		struct drm_xe_mem_range_attr *mem_attrs;
> +		uint8_t pat_idx = pat_value(fd);
Also replace other occurrences of |pat_value(fd)| in this function with 
the locally cached |pat_idx|
> +		bool is_uc_pat = (pat_idx == intel_get_pat_idx_uc(fd) ||
> +				  pat_idx == intel_get_pat_idx_uc_comp(fd));
Calling intel_get_pat_idx_*() multiple times is expensive since each call
performs a heavy IOCTL query. Instead of repeatedly retrieving the PAT
indices, we can simply compare the function pointer to  determine whether
the PAT entry corresponds to UC/UC_COMP.
> +		int err;
>   
>   		if (bo_size)
>   			bo_size = ALIGN(bo_size, SZ_4K);
>   
> +		if (is_uc_pat) {
> +			/* UC PAT should be rejected by kernel for CPU cached memory */
> +			if (flags & MADVISE_MULTI_VMA) {
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data) + bo_size,
> +						      bo_size / 2, 0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size,
> +						      0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data) + bo_size / 2,
> +						      bo_size / 4, 0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +						      pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +			} else {
> +				err = __xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size,
> +						      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_idx, 0, 0);
> +				igt_assert_eq(err, -EINVAL);
> +			}
> +			return true;  /* Skip exec for UC PAT tests */
> +		}
> +
>   		if (flags & MADVISE_MULTI_VMA) {
>   			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size,
>   					       bo_size / 2, pat_value(fd));
> @@ -1308,7 +1337,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
>   		if (!mem_attrs) {
>   			igt_debug("Failed to get memory attributes\n");
> -			return;
> +			return false;
>   		}
>   
>   		for (uint32_t i = 0; i < num_ranges; i++)
> @@ -1316,6 +1345,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
>   
>   		free(mem_attrs);
>   	}
> +	return false;
>   }
>   
>   static void
> @@ -1535,8 +1565,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	addr = to_user_pointer(data);
>   
>   	if (flags & MADVISE_OP)
> -		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> -					    pat_value);
> +		if (xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
> +						pat_value))
> +			goto cleanup;
>   
>   	if (flags & BO_UNMAP) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> @@ -1946,8 +1977,11 @@ cleanup:
>   		gem_close(fd, bo);
>   	}
>   
> -	munmap(bind_ufence, SZ_4K);
> -	gem_close(fd, bind_sync);
> +	if (bind_ufence)
> +		munmap(bind_ufence, SZ_4K);
> +
> +	if (bind_sync)
> +		gem_close(fd, bind_sync);
>   
>   	if (flags & BUSY)
>   		igt_assert_eq(unbind_system_allocator(), -EBUSY);
> @@ -2633,6 +2667,7 @@ int igt_main()
>   			     !xe_has_vram(fd)) {
>   				igt_skip("Skipping compression-related PAT index\n");
>   			}
> +
We probably don't want this extra blank line here.
>   			xe_for_each_engine(fd, hwe)
>   				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
>   		}
