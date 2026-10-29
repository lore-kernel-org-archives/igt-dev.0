Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02348606A31D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cEoPQ9vF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60BC1120FA;
	Thu, 29 Oct 2026 09:18:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898621120F7
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793265473; x=1824801473;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u0lQVQ7l2bHNWlsld/b1QnpjJgOSRYE/QeHXPJI9w9c=;
 b=cEoPQ9vFAF+0Hb9TA8POLj8E+ywdadnbI0vcrd8E1rifyS3nRrSS+YSB
 71+ZzGh9AsUVNvT8JEKmCOAWLlB+uyarky1nS6mmvHUy4gWZHuYaLO5Hg
 OzLJAzi07T9v3gWDAPG11QPlvfORjN2uimWvjO9+5IO8sprtAxs8zxUYl
 E4Q/npr+UHWqTmtJVCtfnl0xs4hbdmYSVLnOR3gIs7DYscUaKaHcGX+f7
 jvwcUHo5tMizRYO1qqAb/G/hA9CWHZDnrPvKkzOVILKqFGaPzi+/uTnLA
 2Fwj7Schn3SD4icW8QfpYD+8zxu38wryiK9ARGAeEZ5F0oiSUutdRzcvZ g==;
X-CSE-ConnectionGUID: sQS/kiGPRCK7LzOrIA+AsA==
X-CSE-MsgGUID: L4zPKEpXT9qA5untrLd3qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2005934"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2005934"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:17:53 -0700
X-CSE-ConnectionGUID: cf3PpwWnTuS1Yfsqfsc4Sg==
X-CSE-MsgGUID: nog2pYFaQMq5FvylRkD4ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5212784"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:17:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:17:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 02:17:52 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNQqlfKSbgwo4p35ok+HjzC1/rRUnIm31BKM4JBm7dX+NS6K6NNIXrvPLs5DDTDCOb4vzloeiLQyewRO/5zARyDvxQ9lmTpKvsR9uU9AuyqC8Pn5g9g8VBHn+VK9rsOqoadVE0vz92yUzVkO8Ay8Xcg3kHYrIlb3z36Az3dGE2kk2SzC4LEgXXFjE8kdUlBMSpfTiu/hTocIKVAWNxAINn5QA3FUYeqa3G1m+BD4bTpMMoptbXqpjOaEqI7uiI2UFV+s30rLwhxI6O9IHnOXswuWMzOXxWZx9PBOICjxm5phrCgbP/Gp90pzS7nI6rX6g53VWLc7vCtfdqYs69ubeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vyPOJxVFCyPl5hpikMjdQsYR9sWHFS2F0B8EzC968Y=;
 b=EpR7S8A4dZBgoo6n5qW7SSA/uEmBFJukMukc8yw2qlZd2QofdFVYvPiqQ9eyrnTYIigM3/gcR6PixN4N6gXSDq8iAZid13pCZLnaeCB2FMRC5Ct32gnEY5fK2J+3NCKs0yvOKC6LzJXr92BEqhZk8kqnrVDUBCWgqwomN2k2Pa2zvzJB6ROLHOevQsDzKOZcTj6NZm2GJcWQZ14uVOo6FR4TFZ7YV+EkZPrxtAiZsX2y7kbfbt7ZaY7Qg1drNponIlbifda6smjaaq8YHZcuG0VsEAj1SPc6Pt7+5VViJbsaqhmi2XboWL9RwXCmhq+T7YzjTqsBB85mHHOxnYVzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 09:17:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 09:17:43 +0000
Message-ID: <6afb9c8b-e33e-4d96-9eae-fa902db8a02f@intel.com>
Date: Thu, 29 Oct 2026 14:47:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] tests/intel/xe_err_injection: Add Core Compute
 Corr Error injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <soham.purkait@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-10-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261029085955.1232163-10-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f739809-fc42-4fec-9410-08df359d7d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|261028144727099003|56012099006|4143699003|11063799006|261026121527099003|261022105027099003|261021121427099003|261026140227099003|10067099003|261021135927099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: IyYxRMUoIzQq8faBQKmOEhYJkTPBFf/VnqcXyyrdyKlHry8VRSMTOq4rpDs5Dxdm+MeXVqLJhN+L22/fcj9VF/IqS4/R7RNUFHgg6o5MfA3X2NNiCmH9GOJT5qIqLkecsNusDSA4GDoRRul5p4PpFcE+CxTrTOMMRWlPCKYEzBk5IincswNvs70emXcu8oLq+jU2ELGSEOkZf3YkrxBbCxBRhs+i6YdJKvpul2iq/zZRwzQ/4z8cRCjHmD/FXnf7h9GbalmZmahXvX3vntvXYdMyq0UtyWnLZ1xJ9T9yxSUeqbHqDx1wysg1bFrC51+CgmKjXLkxBLHl5EMzMVfJrjHH+fOPNFYr4ernnHpuquu8pZju1suaNXfD0SqqKJZDRXfGvMCKl4rfFp03Tn4PC3N93qRkttdlqxdvC6dH78fdewQllAmPVAAztpWuPhhmL6nzAUCk73teRu+gwNpJlBkteBMhtju7T8zTkYxgGbBFuh1GduUsQU8LnPQ1uLoYNbIPvR7UUT52Jsjv5OLnV2hKRriU7z01msqRUullSW8yO6eXxi9WAWpC4EJhYBeunR54FZ046SJJDlT4g9eFuJqxO+qQehFQrbguofTeQmA0boCZ36hvev4fm7iRaOizM/XK0HeZHl7m2/W50K89wcYlhModkqh3Fd5n1LThvuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(261028144727099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261022105027099003)(261021121427099003)(261026140227099003)(10067099003)(261021135927099003)(261022075727099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTJOVHEwVTRWVG1aV0hqSGIralRjb0l6VGpqME1INFFFVVlRTkFZdjlnbzNm?=
 =?utf-8?B?K3Q3aXFNWW9oOTFWTm9Qd29vbXZCVi8rcUZjNGRkVmVCOHBQbUUyQVZWaFFn?=
 =?utf-8?B?YkQ3QnprMUxPNC91RGpIeHdCMy9KeUpuK3o1YWIvSStLOHB0bXJXT0F4K2Vo?=
 =?utf-8?B?SEQyOTg2cFd2Z3MxK3YzUllQbm9EM2VBZ0UrME15Y3BMK21LNHVhNWNiMHRE?=
 =?utf-8?B?Z2dVejBlTnFLTVZQNlpZZnRqczhGMDVXYmpYR2J2OUdqRDJWaDZ2M1pKcHdi?=
 =?utf-8?B?T0ZQdkFWUU1uejNueVhRNkU1U2g2aUl6K0J5TXpEOWgxNlliZVdCRlVrdGo3?=
 =?utf-8?B?d3VSMnk0TnJLZFkvaFVFWnF0ZDM1bzJOQ2NGQ3NiUEViN0JYbHNVVjBUckQ4?=
 =?utf-8?B?SXZOVnhCY3NjTGxJK00wM0M0SksvbkUveDFOYmlLUmNLQ3NEeUFYS2M0cE4v?=
 =?utf-8?B?ZEcrdmUzdE5FVjdacjZrVm52UENIa01yaDlCUWZHcEhMT2FyWEs2QkRncy9S?=
 =?utf-8?B?dGRIVFA2NUJFUmp6QVF6VncwdUxaeVpjaEhxY1dHN0VKMVFheXRwMktUSE02?=
 =?utf-8?B?Wm9SVkZZTC9pSS9MZ2Y4ZytDYkltZDlkZWwzczRPV3BOWW1sOXUwenJzYW9K?=
 =?utf-8?B?eU1IYVJJZEZZQ1d2YjhrVExDdFdaNExsZ2lTUjArRzJUaUdGSHRPQXhNeGg3?=
 =?utf-8?B?M2FUcklYa2JlaER1Zi9oMjRuOFBCd0tPZC9HelFSaHhhSk9KeVNmOVdIVFpr?=
 =?utf-8?B?c05lcjF2N0NJZmV1MldQVjkyclVwcVVUTVdFelhoaGpibjZkUzVZZHpsY0lq?=
 =?utf-8?B?cGdiN3U3d1N4UHNsMWllbSt6VFdWK0V2OUpDZUZ6V2lmK012aCtPYjJEWnBE?=
 =?utf-8?B?L1ZkeU9ZVVdLSUE1amM2UXBtTlJ5aVNmMmtEU0RRQmNuMVROYUZ3SUxkaThW?=
 =?utf-8?B?WXJ6RGVVRnFPUEpGRzhMWi80Q3pmampsc21WZWxYQU81UGh6R05EYTB4dnFl?=
 =?utf-8?B?ek1Ueno0QncvMlB4TkJOZWFoUXVPMG4ycXhmaXJ2L0tJZC9LMXpDcE9FRzFX?=
 =?utf-8?B?ZmhobWM1UlA2VXZwVytxUVczNXVqMDJHZkZFZUV3aVRqTzFFemdpK0JLa0Yy?=
 =?utf-8?B?SGtsVnlvMkd2UDNEbDhUVkxDUnRGWGVOc2NUQjZNNzI0QVpLQzg2TDlITk5B?=
 =?utf-8?B?RXlvaTh6S1NUTmhkU0hLYmcwbjl0KytmamxlZUV4cVNEZTVPdmlyTHZZZCtZ?=
 =?utf-8?B?WnlSMFljSXRVYUhMdDhSTjRFVXh2SHFtMW5tYkl3OGhSVjRyZEQ0YlE2Unpq?=
 =?utf-8?B?WFovSVh0RTZxd01tWUpLRERMN2E5WkU3Wk45QzVtRnVORElraXBLcHM2T0dB?=
 =?utf-8?B?WnlmNUxjc2tYMEtoWmFDSmVYd09FVzNVdTNBTVVlVUY1OEtxN3pucmtTUVdu?=
 =?utf-8?B?S3dwYVFKMG9LM2tERUE3cld4bFdxMlpWeWFxT0YwcERRQ2tFTTRhQ3p3anQ1?=
 =?utf-8?B?QW9IMXlEVjgraFpYY2t4K3grUjAwNWZXU2lTc0U3ZExxWmFIQXdJZFgrNjdR?=
 =?utf-8?B?aEhWbmVGV1FBN0NvSHhMOENld1h3NGgwbW5hTGZqb3Y0RUhWa3lkbkNJUUpX?=
 =?utf-8?B?Uy9yVklQelBlMlRtVWtpS2FqbnpnR3Q4YXZ0NVRkeXQvTm95cHQzWkl3ZzJM?=
 =?utf-8?B?bzNtTzU0WjFuSXZHdlpHTnVmRHdwaUpPUDBqaEFDM0VpZ3JFS01teGEzM2Zr?=
 =?utf-8?B?cGEvVkpoNjlKL0lVaDdsNWVFUXdKSjNPMElQRGxKRlBESUJwR2c0Z3JNU1NC?=
 =?utf-8?B?dnp5KzZ1WEVvTlE0NDJ0OFRKcldpNWlIQkVTMVVpU3gzelBnenBRdUtlRnFy?=
 =?utf-8?B?YlFKTGIyNWZteG9Hek84aFZOUVg3Wi8rS2E1Y1RzOXU1eEcwbmQ1WXVaVi8w?=
 =?utf-8?B?OTVYYzh1NHFuM3JMS09pdy85OGNmOWJOQ3FncnkyN3hmY2hNY2RiZys3K0N5?=
 =?utf-8?B?Y3JMNWlIVE5EdW04Z0dWbTZsV2RQQ0pPcHJZb1Vub2crcnErejNPQmFTQXVQ?=
 =?utf-8?B?cXJCY1FzcU9SSit5Z2JnKytqVnhkYVdUL0ZYdEdLNnlzOWREUlBicDdwWWlG?=
 =?utf-8?B?ejNTZmVucHlHTkltQ2hOYnRRR0ljSS9EekJWblBQUUlpTkFVWk1uaUpONEQ2?=
 =?utf-8?B?RnRRTTJaVnNQaWd3NjhKNGk4MFRnN3VCL1lQaThmR3Z0NWUzM2dXUllSay9Q?=
 =?utf-8?B?OEhaWXExb241bnNVcWFJTnFxZUNhKy9teEdnN1dYNUFOLys3RHQ4RFVWb1hM?=
 =?utf-8?B?VTZ6TWVacXRUOHhvM0swMXo4bjJRbzRQelZ6d1ZoUTFyUDZuUmFpQT09?=
X-Exchange-RoutingPolicyChecked: 0yWrqVlEi6JsoaAyjqMyv0thZAEt1UgEeOb4y7UiMo3kckEs3ZK0TvB4a+J8+ryBSRifv+xHm3TzbPh9urXXQ9iQcmzRBMS3Z1kIUF5NDrQK8Rkk+vbEuyYDWx0VI+LdPkZPIxzJ8mberSqimpWU4y5zJXpBDlz+9HjOLMfqy/21xyBo37VSCb8dlGh5uCd1J27y6rG+n3rm21vG/R5ut2eYCL7eSSZd7fscSDWWmnGJyjuimSBlWtJ2g3gWNYCBL3o2jb2rJsHqniVh13ERQ4ZVtgro5kPx83uzUliCN5GS8D75yFI6Fadyx0pq9oiXKfo802dvjuzhndfWGaaVvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f739809-fc42-4fec-9410-08df359d7d1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 09:17:43.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v10tRLujhoTAWgeOCZSN7KAVWPCYdsMq5g4FUp4s+U9AGcRBdYNBfHPN/GRWPiXJfiW7h2H7zThB4RCmd9QG8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1




On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
> Add Core Compute Correctable error injection tests:
>     - Inject a single correctable error
>     - Inject a single correctable error with the threshold set to 1
>     - Inject correctable errors up to the configured threshold
>
> Add DRM RAS netlink error event subscription and get error counter to
> verify exceed threshold and correctable error scenarios respectively.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v6:Merged 3 Correctable error test functions into a single function to remove redundant code (Riana)
>     Updated test names to maintain consistent names (Riana)
> v5:Removed xe_err_injection.h and moved its contents into the .c file (Riana)
>     Prefixed all register address and bit value names with "XE_" (Riana)
>     Added error handling logic for function calls
>     Changed test name comparisons from strings to enums (Riana)
> v4:Add support for steer semaphore while disabling and enabling
>     multicast (Soham)
>     Used updated library names with igt_drm_netlink_* prefix (Nikula
>     Jani & Kamil)
>     Updated error event name from error-notify to error-report to align
>     with the latest changes in drm-uapi/drm_ras.h
> v2:Disabled multicast before arming the injection to perform an unicast
>     injection.
>     Updated the condition to verify response from wait_for_error_notify_event
>     condition from an event error value of exactly 1 to the configured error
>     threshold.
> ---
>   tests/intel/xe_err_injection.c | 203 +++++++++++++++++++++++++++++++++
>   1 file changed, 203 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 2f5f85b07..33fa19821 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -45,17 +45,35 @@
>   #define XE_STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>   
>   /* Node types for error counters*/
> +#define NODE_ID_CORRECTABLE_ERROR 0
>   #define NODE_ID_UNCORRECTABLE_ERROR 1
>   
>   /* Error types for error counter */
>   #define ERROR_ID_CORE_COMPUTE 1
>   
> +/* L2 Bank (LBCFLOCKMSGREG) error injection */

If you are sending a new rev remove this details.
Such details are unnecessary in igt.

Just assign the value to XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG With that 
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> +#define XE_L2_BANK_ERR_INJ 0xB1B4
> +#define DATA_1BIT_ERR_INJ_REQ (1 << 3)
> +#define FUSA_TEST_MODE_ERR_INJ_REQ (1 << 2)
> +#define MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ (1 << 19)
> +#define MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ (1 << 18)
> +#define XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG \
> +	(DATA_1BIT_ERR_INJ_REQ | FUSA_TEST_MODE_ERR_INJ_REQ | \
> +	 MASK_BIT_FOR_DATA_1BIT_ERR_INJ_REQ | MASK_BIT_FOR_FUSA_TEST_MODE_ERR_INJ_REQ)
> +
>   enum {
>   	SUCCESS = 1,
>   	FAILED,
>   	TIMEOUT,
>   };
>   
> +#define INJ_ONCE 1
> +#define INJ_MANY 16
> +#define THRESHOLD_NONE 0
> +#define THRESHOLD_ONE 1
> +
> +time_t event_timeout = 10 * 1000; /* 10 seconds */
> +
>   static bool run_xe_compute_on_all_engines(int fd, bool state)
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -123,6 +141,12 @@ static void release_forcewake(int fw_handle)
>   		close(fw_handle);
>   }
>   
> +static void cleanup_on_error(struct igt_drm_ras_nl_context *ctx, int fw_handle)
> +{
> +	igt_drm_ras_nl_cleanup(ctx);
> +	release_forcewake(fw_handle);
> +}
> +
>   static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>   {
>   	struct igt_drm_ras_nl_context ctx;
> @@ -330,9 +354,164 @@ static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
>   	uncorr_error_recovered = true;
>   }
>   
> +static void inject_core_compute_corr_error(struct xe_mmio *mmio, int fd)
> +{
> +	/* Disable Multicast for unicast error injection */
> +	acquire_steering_semaphore(mmio);
> +	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +
> +	/* Arm the Injection */
> +	xe_mmio_write32(mmio, XE_L2_BANK_ERR_INJ, XE_L2_BANK_DATA_1BIT_ERR_INJ_CONFIG);
> +
> +	/* Rollback to Multicast */
> +	modify_reg_bit(mmio,
> +		       XE_MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       XE_MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);
> +	release_steering_semaphore(mmio);
> +}
> +
> +/**
> + * SUBTEST: inject_core_compute_corr_error_threshold_one
> + * Description: Inject one Core Compute Correctable Error with the
> + *		threshold set to 1 and verify exceed-threshold reporting.
> + * Functionality: error injection
> + *
> + * SUBTEST: inject_core_compute_corr_error_threshold_default
> + * Description: Inject enough Core Compute Correctable Errors to cross
> + *		the current threshold and verify exceed-threshold reporting.
> + * Functionality: error injection
> + *
> + * SUBTEST: inject_core_compute_corr_error_once
> + * Description: Inject one Core Compute Correctable Error and verify the
> + *		error counter increments by 1.
> + * Functionality: error injection
> + */
> +static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
> +						uint32_t ntimes, uint32_t threshold,
> +						bool check_event)
> +{
> +	uint32_t counter_before = 0, counter_after = 0;
> +	uint32_t current_threshold = UINT32_MAX;
> +	struct igt_drm_ras_nl_context ctx;
> +	int fw_handle, ret;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	ret = igt_drm_ras_nl_init(&ctx);
> +	if (ret < 0) {
> +		release_forcewake(fw_handle);
> +		igt_assert_f(false, "Failed to initialize netlink socket (ret=%d)\n", ret);
> +	}
> +
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=0 (correctable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	ctx.node_id = NODE_ID_CORRECTABLE_ERROR;
> +	ctx.error_id = ERROR_ID_CORE_COMPUTE;
> +
> +	/* Query the error counter before injection */
> +	counter_before = get_counter(ctx.node_id, ctx.error_id);
> +	if (counter_before < 0) {
> +		cleanup_on_error(&ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query Core Compute Correctable error counter before injection\n");
> +	}
> +
> +	/* Query the current error threshold before injection */
> +	ret = igt_drm_ras_nl_get_error_threshold(&ctx);
> +	if (ret < 0) {
> +		cleanup_on_error(&ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query Core Compute correctable error threshold before injection\n");
> +	}
> +	current_threshold = ctx.error_threshold;
> +
> +	if (threshold == THRESHOLD_NONE && ntimes != INJ_ONCE) {
> +		/* set ntimes to current_threshold for injecting enough times to exceed threshold*/
> +		ntimes = current_threshold;
> +	}
> +
> +	if (threshold != THRESHOLD_NONE) {
> +		/* Set the error threshold to the specified value */
> +		ctx.error_threshold = threshold;
> +		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
> +		if (ret < 0) {
> +			cleanup_on_error(&ctx, fw_handle);
> +			igt_assert_f(false, "Failed to set Core Compute correctable error threshold before injection\n");
> +		}
> +	}
> +
> +	if (check_event) {
> +		/* Subscribe to error event */
> +		ret = igt_drm_ras_nl_subscribe_error_report(&ctx, DRM_RAS_MCGRP_ERROR_REPORT);
> +		if (ret < 0) {
> +			cleanup_on_error(&ctx, fw_handle);
> +			igt_assert_f(false, "Failed to subscribe to error event (ret=%d)\n", ret);
> +		}
> +	}
> +
> +	for (uint32_t i = 0; i < ntimes; i++) {
> +		igt_debug("****** Injection iteration: %u ***********\n", i + 1);
> +		inject_core_compute_corr_error(mmio, fd);
> +	}
> +
> +	if (check_event) {
> +		/* wait 10 secs for error report event */
> +		ret = igt_drm_ras_nl_wait_for_error_report_event(&ctx, event_timeout);
> +		if (ret == 0 && ctx.event_error_value >= ctx.error_threshold) {
> +			igt_info("Success: Received error event notification from: "
> +				 "group=%s node_id=%u error_id=%u error_value=%u match=%d\n",
> +				 DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
> +				 ctx.event_error_value, ctx.event_received);
> +		} else {
> +			if (threshold != THRESHOLD_NONE) {
> +				/* restore threshold to original value before exit */
> +				ctx.error_threshold = current_threshold;
> +				igt_drm_ras_nl_set_error_threshold(&ctx);
> +			}
> +			cleanup_on_error(&ctx, fw_handle);
> +			igt_assert_f(false,
> +				     "Failed: NOT received error event notification from: "
> +				     "group=%s node_id=%u error_id=%u error_value=%u match=%d\n",
> +				     DRM_RAS_MCGRP_ERROR_REPORT, ctx.event_node_id, ctx.event_error_id,
> +				     ctx.event_error_value, ctx.event_received);
> +		}
> +	}
> +
> +	if (threshold != THRESHOLD_NONE) {
> +		/* restore Core Compute Correctable error threshold to original value */
> +		ctx.error_threshold = current_threshold;
> +		ret = igt_drm_ras_nl_set_error_threshold(&ctx);
> +		if (ret < 0)
> +			igt_warn("Failed to restore Core Compute Correctable threshold to original value\n");
> +	}
> +
> +	ret = igt_drm_ras_nl_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		cleanup_on_error(&ctx, fw_handle);
> +		igt_assert_f(false,
> +			     "Failed to query Core Compute Correctable error counter after injection\n");
> +	}
> +	counter_after = ctx.error_value;
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 counter_before, counter_after);
> +	igt_assert_f(counter_after - counter_before == ntimes,
> +		     "Core Compute Correctable error injection Failed\n");
> +
> +	cleanup_on_error(&ctx, fw_handle);
> +}
> +
>   enum xe_err_injection_type {
>   	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
>   	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
> +	XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE,
> +	XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT,
> +	XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE,
>   };
>   
>   static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *mmio, int fd)
> @@ -344,6 +523,15 @@ static void inject_error(enum xe_err_injection_type injection, struct xe_mmio *m
>   	case XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL:
>   		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>   		break;
> +	case XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE:
> +		test_inject_core_compute_corr_error(mmio, fd, INJ_ONCE, THRESHOLD_ONE, true);
> +		break;
> +	case XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT:
> +		test_inject_core_compute_corr_error(mmio, fd, INJ_MANY, THRESHOLD_NONE, true);
> +		break;
> +	case XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE:
> +		test_inject_core_compute_corr_error(mmio, fd, INJ_ONCE, THRESHOLD_NONE, false);
> +		break;
>   	default:
>   		igt_info("Invalid Error Injection specified\n");
>   	}
> @@ -375,6 +563,21 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Inject one Core Compute Correctable Error with the "
> +		     "threshold set to 1 and verify exceed-threshold reporting");
> +	igt_subtest("inject_core_compute_corr_error_threshold_one")
> +		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_ONE, &mmio, fd);
> +
> +	igt_describe("Inject enough Core Compute Correctable Errors to cross"
> +		     " the current threshold and verify exceed-threshold reporting");
> +	igt_subtest("inject_core_compute_corr_error_threshold_default")
> +		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_THRESHOLD_DEFAULT, &mmio, fd);
> +
> +	igt_describe("Inject one Core Compute Correctable Error and verify the "
> +		     "error counter increments by 1");
> +	igt_subtest("inject_core_compute_corr_error_once")
> +		inject_error(XE_CORE_COMPUTE_CORR_ERR_INJ_ONCE, &mmio, fd);
> +
>   	igt_fixture() {
>   		xe_mmio_access_fini(&mmio);
>   		drm_close_driver(fd);
