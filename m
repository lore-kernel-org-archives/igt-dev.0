Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D60ECCD187
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6710E2B7;
	Fri, 10 Oct 2025 22:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6KJSbDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0481F10E2B7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135420; x=1791671420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+vcol1B8lo3Xsnq8uyibvJSYw7DOJfke/Q5IGAfq7MM=;
 b=d6KJSbDxFoxe/1JDHgOb9x2T4eMWgphmQmi3h/IuLNZ5S9TPgAaAaTAD
 ffcZrxtiq1psue7v96YbfkXIHzO4+B/BTamMOkgIun9IIm88jWxfoVaMK
 9S9enHlptwbOfGwDELSYdUiRVrNfnSJrmJVUsJ+ttIACqOWxg/EC1PyRD
 MQbTxaBWdfRvmSCxIS6z/pID18CbU4LFU0svP25TaooksnUHeuivYxr3D
 Crhf+cb14MR8bQGPqfJLw4kjNFjS7MtdDOt2pgAVEtDvF1/6LJljK08Qs
 CwteN9Phqgi9ht+UpBR2x10ELhj9vMUC7qM8rZ9DVn6u8WDSqipoLiIjL Q==;
X-CSE-ConnectionGUID: hQmRNWFITO2E37txRalXYQ==
X-CSE-MsgGUID: 1n923oj/SguiOoSi8Bxssg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62400109"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="62400109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:30:20 -0700
X-CSE-ConnectionGUID: c7kdQbcaR8CxDXq7j+hdLA==
X-CSE-MsgGUID: 56s4MGZeQPuzcxGeuRngEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180908862"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:30:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:30:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:30:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9R+VjAqmjFVYAYAmI7+yQ5Ej0p1PqHMP5gFuP9vw/70Pm4TN8my/kpFqtHRnX4QAxBU/n+/6U0YT3ICM1GZSfHM3ch9RjgfhpZdO8MIkmweWfe7vYg6ObmrErSYF8y/zFLYcU/6k3ovB+izoxN3EfZBwcHMBWALjB1DJU5t9toAtrsgog1POuThNl4rcRw8PR1jxhetSPFV0fU2o5eg0Ty18DVXI8IcvxmLcL47/mbgkbxP5247x0GWGkhDVQ9HoIoFpgESbjOTUfyNdzbZaTR+pY45b32a7kHfzG9eaRpJcmD0Mi+Yfh5svdPtGCm50/ZzmUGD6jKWU7CmsvLf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH1kJ6o7O40+Qa0Kep0LGAFKURCMU9ppItnluArRp7o=;
 b=n4iSSlAezaB7y9b44TH+BrKRA/zUoQ1v5+yAl9bY3CBeVgmVgoBBtNGKmVACpIAQqOYwhVwjEopT+Wevsq1bNA8tG9kdGiHekP1WLkmGq3Fd1sGaYIkA+s3O/Q0wqHOVRDQ5LcZ5lB5zBiU+C36YdOm4NZagXHJiKA1G/sT65JxEKREucwyY/C8lYIsBFnvorolKYEqEYxfwv+JZvc2gqQW3qEq+a5/djptIHQ9lOlXJziQlpg9XIDwxIvPXWNcdgL7f22sg7GTbB+WIla3u40pdkMhozXEVhLncvcN94bAT5kYhEbp2hP9NVR2UNgJonEPh8omu0H9fzYSGrq2aSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:30:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:30:17 +0000
Date: Fri, 10 Oct 2025 15:30:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 15/18] tests/intel/xe_oa: Convert sync tests to
 take OA unit arguments
Message-ID: <aOmI92OaBg0m7Du9@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-16-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-16-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c0549c-6f60-4556-1301-08de084c96b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2hzdm1TRXkza2xkbE1peW9DZVpIUitBeC9mckYranVzVXZVZnBqTzQ3Q2xP?=
 =?utf-8?B?Y2lqQno2Y0xMOGFndDk2SHJFc3lvVFNGb25pdzJvTUVncTJGT1AwOUVBdklU?=
 =?utf-8?B?aWJvYjVNa3ZJWVNJcHBDNTZ2azFDUmc4cTBUTU8reGt0bUhyZ0FLYThObVk5?=
 =?utf-8?B?aVM4eWxxa0JDUkNzTmlYMFQzQ0JxeHFRWnMyeVQ1YmJOQTFjV0JZcjB0aS9U?=
 =?utf-8?B?dmozTm1oRExUbVBpdEFhbkF5WThJMGNUanMvRVlFc04wTEpnOFI0NUxjL2Ez?=
 =?utf-8?B?a3U0ZUhic0FrbnlQWDNlQVU0b0RuZHJ4NWV0Y2ZRbUw3M09xZFIxMVBDQWlx?=
 =?utf-8?B?MmM0ZWJMdnBQVW5MSlVIWDZtLzlFRDJJVnNweVRhZ2tKN0hzV3hKZzU1OWZN?=
 =?utf-8?B?eHBKZ1JMVW1XN1NpQ0hLaWNWNmhRS1hXM2lydG5rd1VzODJtVVpXb3Q2NXZt?=
 =?utf-8?B?L3BEUkE5dkIvTGFJVktrU3E4NEI1WEE2MlA5QXZQenJMenZicG42Z3VvWkJC?=
 =?utf-8?B?Zm9ERi9YalREL0FSQmhnOFU4ck94cXprd2hybEpLdTN4Zk1FaDlpVDROQVVu?=
 =?utf-8?B?RUxBWmJDSWxOV0Z6NE9xVldWek01bFYwL3VucDVqczltQUprNDFGdVdNdjhO?=
 =?utf-8?B?OGFZcGlHeDVtOXRseWM2ZmJlV3ltS2cvRVpMTEJkbmZ1eUI5eXdIK3h5S2ZI?=
 =?utf-8?B?ZGptMWppNjluaDJCdG5mdFc1Tm5Vd0k3NFFGNGlqenB3b1hIbmtYeEVaTFdq?=
 =?utf-8?B?dGpZMmhPc0ZUNTdaQmxtN1NJbVRuQXZ0eUN5cWIwR000di9nMEMxNU9DNlFY?=
 =?utf-8?B?aSt0cDFZdmc3c0x2b29FVy90Y2p3VkY1T1NsSmRDbVExR2hwbXRlL0hVa1ZD?=
 =?utf-8?B?aVh2ZFQrSXc3S2FsaGxqVGMyMkFINmw1Q3BvZTYydE54WHBzbXFYNUhmS2lM?=
 =?utf-8?B?Q1lTMHFHMU9maDZHODdKZnl2c1NBdDViSjZhbjRpRjZRdzRXeC9IRDMyUkZj?=
 =?utf-8?B?NVVtc21aVzQxRHdFSjV4emhJQVcxQkdQQmxGZFNKcVB4VmlkemNXV1RiSjZl?=
 =?utf-8?B?M1hZOSt1MjE1YWNwVzlDSHE3WlF6VTVBSDFMQ1pMYXJibzhsUkpya0RrQUg2?=
 =?utf-8?B?ZnZyeVpmKzJYY2JzRmYrQkkyU2tZVVVaTmNTU2ZadXNkRk9DdlhpUTdBRXZH?=
 =?utf-8?B?STBRUGp1N0R6cW51WHJMZ3J1QlBWWTlLVUg5NFlLc3FUNnJiSzU2ZFVLYkxC?=
 =?utf-8?B?bzZyUllHVDI2Z1ZRbnVOUnZBb0dYRXBZdnR6MlVscndtTitBRGhmb3VZOEZB?=
 =?utf-8?B?QXh6Z2VoZ1VibkNxeHA3c2JvTWphWnliWE9keUZJMk1vMzhna2lYdUpmUTNq?=
 =?utf-8?B?eE1FRWwvY2pIdndSdkhwdG9zUFhFNFVkYm1UNWlZWUZmQTN2RHJwYzZ1cUVr?=
 =?utf-8?B?dGl1a1hVQUhRK0pZN1BHTjJqVzBnQUdwcGZJUVczRjhQSExIOUJJT1VGREQ2?=
 =?utf-8?B?WUR6dWdQTVhtdmhuZUFvSFVTZjB4TXM3cGtxNWpBRUJyRXhVVDllVnJHbFZS?=
 =?utf-8?B?VTN1SmFVVXNHTWVIaytIMjA0U1lEQUJvNjgxam0rVEwwOUFJd3pDM2duUTR3?=
 =?utf-8?B?Sjc3eUQ0a052bTNIZTh2WkZqVVVnbFdhSWNRaE9vcTNWVWNraVVTd2pSRldG?=
 =?utf-8?B?cjF0VFRwc0VDbm9jK3lDMU9MTlMzTGxDU1hZamV3QjNydlpZL01qN3o0T09L?=
 =?utf-8?B?Zk5wOWZhTS9zNktBQjFmK0c2dzA4dWRlY0N5SU50ZmRoQnplWThqVlFSM0to?=
 =?utf-8?B?ZGdRbGRYMW10d3cxZ1IzUUJ0VUoyWmZUT2QrWHB6YlFXVzU1b0VVZjlxN0xx?=
 =?utf-8?B?aUh3TDRCdHc5S0tQRHladWlYNU1xb1hHcnRjNUlKeVZTWVhrQS9rd2JZMEVI?=
 =?utf-8?Q?w7MMr2wxGq3QT5oKSf3k7iF8debJhVLd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1ZCK1l1UklJWG1zNWpFcXNMRCtyY3lhRXVtdVE3SmRoUjNXcER0Mm5STEJx?=
 =?utf-8?B?R0xuWVFqREU4RzY5b29XTFdFY3VpWUZlRzlIbnJiVVVieGFiK0M0NUpMSU0r?=
 =?utf-8?B?QVZKaTJjZWhXeHRzRXhNaUJmVHhKaUlHbEdCV0pKMWpxZU1yOWs4SUoxWnZr?=
 =?utf-8?B?VFFjRVNQWktzRDd4VjFMSTJGNzc4ZlpZUG1DSVFqZ1M2bWVhbVNFWWtzdXdE?=
 =?utf-8?B?aGZ5Um5PUTQyK05wSVNaRlcySm1DOTM2QlBuYnF4MTAvdDJXK3BlOUZKK1g2?=
 =?utf-8?B?RlFSTGFnVzV1L2Jyd0djZ0lZMUhVNnR5eGNzQUxTcHFwNjN2cTJSOEV0RXUr?=
 =?utf-8?B?MnBVL3RWMFlXU1kzR1g1a3BIMmQ1L2lHdWRYZUMyeXpTT3dHc3BYc096enFy?=
 =?utf-8?B?OGFtSXkwRGtER0VwZUZWQmRkMXZVQ1BrL2J6MnJFRHd3NVo4Uk1jdGZQeWZY?=
 =?utf-8?B?ZUpYQjJyTTNYMDdUd1kxQWVmRFBvK3F6ZGd6dDJCSENhdnU3UWZRcXljV2Ju?=
 =?utf-8?B?MWZWWFlla2VqUjQrRlEybXVnaXRrN1FVT2ZjUGxEd1N3d1phZm1tdzRseCts?=
 =?utf-8?B?UlRVU2EzNHZhemRuZVloMVcvd3dJTXAwWjk3aEVCUVZYT2Z4Vm1TWVhtZExS?=
 =?utf-8?B?SmJqMjVYTDZmbWoyVkpGajd6L3FnZWZVdThDQTR1alhuR2ZVTmJPK28vYjFG?=
 =?utf-8?B?cW1VbER6ZWc2TVJCdHBjbDFndVVjUkR2ZjVYaVQ3bTdzMlJYeUxhUncvTHF5?=
 =?utf-8?B?KzF6aHcrRS82SnIwbzFRaGx6YzNaNG5aeHlweXdnWWR6QnBlK3dzVDYveno5?=
 =?utf-8?B?clVUUUtUNWJ2emg1TlpwdHJySEFNRmk1bTF0a0NIbGtyTm5OZklQVmxVRXBN?=
 =?utf-8?B?SDBPNDB2TVFsbmtyY1NLMVBMekpaR01BS1dpOEw4SnJ4a0o0eGYyT0lrSUZz?=
 =?utf-8?B?Vnl5bHpDVVVDWUhTRXBxdithZ0FSSk8vUk1UeUk4a1lDODQ0TCt4WWdZZUVr?=
 =?utf-8?B?MDhncG1rb3BzMEhwWXQ0YXdPaFdsOEx0bVNpL051RUdQamhRdE5XWWI0VkNL?=
 =?utf-8?B?cHZRcHdPWnIzeHpOUUNXQ0RIYXRYT2J1eXg2b01vR2xXVTZLT2Jyc0FQdFpt?=
 =?utf-8?B?enlWMHlBeGExR3RXdldCOENVLy90M0dZYThMYS9rZmI3bHBiQ3hhK2NrbEsr?=
 =?utf-8?B?S3VPWEluNTYxb3ZoTlNld0NtMy8vNkh3TmpJTEFiQkhKSmpOV1ZoaFlKSVBR?=
 =?utf-8?B?eU1uT09scHlEWFN1SHFLRWNYSUV2ekFMVlJ4cTVCdVdVQ21MV1FiNlE4VjNj?=
 =?utf-8?B?QW9zYlU0T1owcjRIRzJ0YzhSSVhpSWtSYjdvNmlRZzJvVXBPTjB0UENOVHE2?=
 =?utf-8?B?d1A5Y1luRnNXaHo1NzVCZkhKQW9DTjNLWGNTc0JsZVV1TmZxSWJ6RlBRUmhJ?=
 =?utf-8?B?ODZtc0VEOE1SWnJjZVZQajlEeld0cGt5NUR0MExyZ0hxczRpUEVLdHI5anQ2?=
 =?utf-8?B?L2dYSEtsYzlzRmtDZFVwamMya0pscEtvbmNOMzJ1YytNcTlHbHNwa3RCTnQ5?=
 =?utf-8?B?aTVFcUdWc2FXOVcxMUptWDFmaHBaMWxNNFd2eXR3RzRENlY1bTFmMEhicTI5?=
 =?utf-8?B?RG82Wm53VDZuMmFzbEFjZDA3UnpuWEFjUytnNGlMV2Nici92WEQ3dHo2TW45?=
 =?utf-8?B?VDBiY1VSQzl2eU9PTkdjY2dzM1pMV0ZEZXk3NG9OUWFwOXQwL00xSllvZWtR?=
 =?utf-8?B?V2JLQlBnZmxMUHJWY2FOdThBQmJWekszcGNyd3RaRnJhR29pZHRMVGRGYzJn?=
 =?utf-8?B?SjJwekI4dGNJcGloTEZKRXZ0RU9WRkR0Y25vdFgzSmpWZFpwRzdwcFVtM3Bm?=
 =?utf-8?B?MW1Va0NpYytOU2phT3FzQWlmTWtid1Qyeno5ZjljcmRaQW0yTjVuMFFBTkJ5?=
 =?utf-8?B?NlJha21xY2hEUnNhTTcyRWFxaGk5SVB1K1pGcmVWY2laSzkrNENIaHovdEZs?=
 =?utf-8?B?NEJIdE5EU0hOcUlVV1gyRlZmV2dVUkFnTG00d0tuTUxFcjhaTXZjRTNWV3p0?=
 =?utf-8?B?TysraUxEeXVScnhTTXQ0bitxQk1vWHZmNFRVa3JBMTRETGZkV3BtbWVreXpG?=
 =?utf-8?B?Z2dwM3pZdnZaV0ZVbnZrV043WjRXMXpBSEhLUkhkTnJBamZYNW1MRkEyWjVB?=
 =?utf-8?Q?jniq42IbgNJB8Alb3JAG4yg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c0549c-6f60-4556-1301-08de084c96b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:30:17.3798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLJBdOhMReIEnrO2AXZICvTJXAqK6xLrTYgKuvDqkrY+GjhFGjGgq0UPqwEhXjka2R+Ozpcn5zcz90yJcsYWWLEN83sPjJPfngGj70m1yGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:18:02PM -0700, Ashutosh Dixit wrote:
>Convert sync tests to take 'struct drm_xe_oa_unit *' arguments, to enable
>them to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 35 ++++++++---------------------------
> 1 file changed, 8 insertions(+), 27 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index a3f4a80d6a..75142e610d 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4766,9 +4766,10 @@ struct oa_sync {
> };
>
> static void
>-oa_sync_init(enum oa_sync_type sync_type, const struct drm_xe_engine_class_instance *hwe,
>+oa_sync_init(enum oa_sync_type sync_type, struct drm_xe_oa_unit *oau,
> 	     struct oa_sync *osync, struct drm_xe_sync *sync)
> {
>+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
> 	uint64_t addr = 0x1a0000;
>
> 	osync->sync_type = sync_type;
>@@ -4890,15 +4891,15 @@ static void oa_sync_free(struct oa_sync *osync)
>  * @wait-cfg:	Exercise reconfig path and wait for syncs to signal
>  * @wait:	Don't exercise reconfig path and wait for syncs to signal
>  */
>-static void test_syncs(const struct drm_xe_engine_class_instance *hwe,
>+static void test_syncs(struct drm_xe_oa_unit *oau,
> 		       enum oa_sync_type sync_type, int flags)
> {
> 	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	struct drm_xe_sync sync = {};
> 	struct oa_sync osync = {};
> 	uint64_t open_properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
> 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
> 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>@@ -4929,7 +4930,7 @@ static void test_syncs(const struct drm_xe_engine_class_instance *hwe,
> 	if (sync_type == OA_SYNC_TYPE_USERPTR || sync_type == OA_SYNC_TYPE_UFENCE)
> 		flags |= WAIT;
>
>-	oa_sync_init(sync_type, hwe, &osync, &sync);
>+	oa_sync_init(sync_type, oau, &osync, &sync);
>
> 	stream_fd = __perf_open(drm_fd, &open_param, false);
>
>@@ -4956,25 +4957,6 @@ exit:
> 	oa_sync_free(&osync);
> }
>
>-static const char *xe_engine_class_name(uint32_t engine_class)
>-{
>-	switch (engine_class) {
>-		case DRM_XE_ENGINE_CLASS_RENDER:
>-			return "rcs";
>-		case DRM_XE_ENGINE_CLASS_COPY:
>-			return "bcs";
>-		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>-			return "vcs";
>-		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>-			return "vecs";
>-		case DRM_XE_ENGINE_CLASS_COMPUTE:
>-			return "ccs";
>-		default:
>-			igt_warn("Engine class 0x%x unknown\n", engine_class);
>-			return "unknown";
>-	}
>-}
>-
> #define __for_one_hwe_in_each_oa_unit(hwe) \
> 	for (int m = 0; !m || hwe; m++) \
> 		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
>@@ -5055,7 +5037,6 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
> 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
> 		{ NULL },
> 	};
>-	struct drm_xe_engine_class_instance *hwe = NULL;
> 	struct drm_xe_oa_unit *oau;
> 	struct xe_device *xe_dev;
>
>@@ -5301,8 +5282,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 		for (const struct sync_section *s = sync_sections; s->name; s++) {
> 			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
>-				__for_one_hwe_in_oag(hwe)
>-					test_syncs(hwe, s->sync_type, s->flags);
>+				__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+					test_syncs(oau, s->sync_type, s->flags);
> 			}
> 		}
> 	}
>-- 
>2.48.1
>
