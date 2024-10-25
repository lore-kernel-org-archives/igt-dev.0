Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A456D149E8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C291010E09E;
	Fri, 25 Oct 2024 19:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMMcD4J+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AC810E09E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729884946; x=1761420946;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Tobk3LBEMTSKGhzO05wrN6kvDubTeSY2kRIvDAgHKMw=;
 b=aMMcD4J+EnrE2iIy0j7H6NIF7fHNdony3SdaHVTN6spf3MqKVaXlQQkc
 K7+YnHFZIeEIhwSnZCU4tHpVHmW1x+LWOtXaHhI6UPEiI+oYHHuqAwCg8
 XquSF1Ff2Ihie4dio3dVxzc65vE+RBvnvLCLn+5uU+1atbEqDLf3qJ66o
 ZVaFguofYatO5iAUcnb/rNWe3Ke4tnE6zltPTvA17Bonk/qIqSVNQ4Pvf
 WkkXthfCkhx4P0Lhp9V8X5VU5qaChBKCpWbekloCL/EGWS7F1xojUwDTt
 ouATFdfuo4DMWyFMhc54QAzzpQ7kA4y7OUdodObCHwrQu4a+9rRp60DnT A==;
X-CSE-ConnectionGUID: zOcd5ts3TsescDXJGwXzbA==
X-CSE-MsgGUID: j5tXpkf3Q3qChYedNyNjhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52119196"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52119196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:35:43 -0700
X-CSE-ConnectionGUID: mZxYdv49QS+9np4eM3R1gw==
X-CSE-MsgGUID: NogpDhfvTjikU/G01DQ7tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="80597413"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:35:43 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:35:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:35:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yr6y7Ned+2jRCzTiQIypm0klhWF1QCswis4sPunLUlDDAaDX6urKEAEGsVXDL3iapdwpSwZUQtdDB4PSXvTHY6OcbVqiHIRvs8P+NoUA8tDdey5GJV4KrK8lvY1FX6L0YF0B8grwaK/c7VunBXGrPoLroYA/nOgEzFvx+Sojbxbp83XNPJUe6/u2E87M/6+UVIaRiRfvKNlmgD7Yrlh/Ylo7mXkWQauU7gU5iEdmSON8Yi3dBJfWyk/NBgUVJUjaS3O8dcmNIVnWUY11hWTmB6xgd+hvxKnbJJxhUosrbCzQr1afp9LjcRgbOLGgxta4MlfzEk7aNSFUIWjgyAq43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hv1mfyJSZm/GAKv9uAUC9ZiLSh9bqeskJoG6Z5UBq1A=;
 b=CPyiYQlurHzm/0SFMCdl5u6gALbYlUOXZjPHD9TlsBHiAITc9wv1cbpPj5VCrH3D+MLwlAV23rmdt3oihSWvdqOtveTiZYLEKCo02sZJrEHkdblOcYA1a7Z0Pa9Glz8b4B65fKc076IPfrGvfMzKncn+W3qp4yPSZ9hIt6bfRXK/EQI9WwEMGsy/cE0CDYK9NJij7E+YwlZkpILsW2/y7kF0Wp3MPhh16eguV8tpXScl3LLjQ+9TXRjYw7qhNyUY66n+ksy6/+rMIYSdW99p2gbMSnu9u8tRRUe9TzvzCuRQB/3+EQ29JUfgoizcDkZtSd6sHdaVIrGeOu11TA+yCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 19:35:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 19:35:37 +0000
Date: Fri, 25 Oct 2024 12:35:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_oa: Tests for OA syncs
Message-ID: <ZxvzB74fuMOmw5c+@orsosgc001>
References: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
 <20241025185205.1327235-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241025185205.1327235-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: bde4e3c2-8be7-49cf-96da-08dcf52c334c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW8yTGdubGJiMndvbWRZMUFiakxKaHhSWnBVeDlBK3pxVy9Vb0dZZXVyMTJT?=
 =?utf-8?B?UGpqcklaaVRubGltWXEzZk1Hbis0T1AwbjE3QkRyR0N6bmErUEFiNDBqSGpk?=
 =?utf-8?B?K2cwQTRsdmJEVDdzQWlWZXgwVVd2RTM5VFkxRjd0cmhhZmo5bUlncTE3a2tr?=
 =?utf-8?B?Q3d1ejJHZDNmdFlES2MzZWJicmRzbkoxamVrZThuTlg5NHRBWlpXd09BRVY3?=
 =?utf-8?B?eXBoTUNzK3VzZDlCR1hxVTl1RlYvdC9rOXhLRHp0QW90dnRaN09Ya29telpK?=
 =?utf-8?B?bUE3T05hTm4rZFo5ZzlEQW4vd3R2dkY0L2pyVTFlT2kyOFUyckc4aUROcHpU?=
 =?utf-8?B?T29GRTA3QU1GSE14WFdveGhmL0xwUEtCcHlWVko0UkZabHZRWStJMGNvbEN5?=
 =?utf-8?B?VFZyUjV0Y1ZTeW90R0FFeXJEaU9SRVpSTnB3UXhEditFNm1BVktoTjVYL0ts?=
 =?utf-8?B?ajF1Ti80b0VqWHlJMGdmQXF3UTAvNmxFY1ZKVExCL0pYSHBjaTREdkZ0dkY5?=
 =?utf-8?B?Y2dlL3M2NW05TWV6RUxrU25JQjY5dUxWWVMrZ1FnVFBBSHcwWHE4K25rWnQ1?=
 =?utf-8?B?RlhQWWcrS3ZBZ2YvRHpCcmt0SnZzYm0wRE45UFJ6bXBaTkhqanc3V2RycTQ3?=
 =?utf-8?B?RlBBalFjaUVqSXc5b0JIdTJ0ci9iQ1pYTzBvSU9RYzlCRmNwNERwelBhUFo0?=
 =?utf-8?B?a25MOWJLaVpZQ1dZcFMvZk1zZmtSbkR5R1ZoQUJVaFdDOVdKN2RtTE13bldE?=
 =?utf-8?B?cjAyV2pZMjBZQmFtYm55cVYyOEg0V2NzOVdPSGF4R3RPSXpCWVAxYzNLK0pn?=
 =?utf-8?B?VFYzYzBUZFlTSUp4QUtJWHJ2MXQ5RlZnMG5kK1RJUU9QbkZMZzc5S09FbEcr?=
 =?utf-8?B?Ykg2am5aZ1lqZTk0T29MOCtGOVQ5ZlgyVEhzQTlid1lXVmp2RnBWV2dlQWNr?=
 =?utf-8?B?SlozcG4yUnJYZHBOVlZ3L29Gb3pVZDJrWTZsNmNEMjBoTHcrSFczejA2SDU2?=
 =?utf-8?B?bVEvdkdTU0x6MVZwVXR0c1JQSVM3Q0ozRUxpSnI5WXh5RUVGeEp2THdMQ3F0?=
 =?utf-8?B?ZjVGbDF6VUhpR0JKemNUVzNrcEJwRnE1emozajV0KzZ3YThCV0xhN2hXTkc1?=
 =?utf-8?B?aVFrR0VLZlhwTWxFMXdOVGdSYUFZNE9IRXpJWVovbXEvajhpTmVrYk45NlVk?=
 =?utf-8?B?dU1IYXpadUF0TjlQWVZhb29mbU1md3NMNStLT2k5T0dQbU1HcGtFWExyOGcz?=
 =?utf-8?B?NkIrNXJnUXZMK0s5am9PTjkwMm9TQXlWQ1NwL0d4RkEvcjExNi93N3MyTXNH?=
 =?utf-8?B?bzQvU2ZSWmkyWkxUVXVRSFF0S1VPSzZkV2I1aHpIRHcvbWwxckp2Zk1kSk1J?=
 =?utf-8?B?a29QNnFWRHpBWEpqNWJaN3RZVU5BeER4dk1QbnNlcis1b0R0Z3JXL3ArL3di?=
 =?utf-8?B?N0Y1RjlsbGtkeng5K013RGgrREVleWVYU1FzVE0zS1hsdDlZKzRicU5ubHdi?=
 =?utf-8?B?N0g4djV5K1M2cEtKWEh3dnZ4VkYxZm9uV292L0s1NDNFWXBKc0VKOVdZd0JU?=
 =?utf-8?B?UEdHb29xN0E4R01jSWxNZFp2eUtxb291Z1JGZ3JDeDg0QkN4blJsWHVMTmV5?=
 =?utf-8?B?VnI5VUlLeldwaTIvcDZleDE4Z1lzVG56aGtTdG5peTY4QWhuYS9Td29YUTFP?=
 =?utf-8?B?NThqQ0U5NlhqeVI1SjJJaFVLL2RoT2RWYmZ1VUtJei9GUStWTDdGTGNONk90?=
 =?utf-8?Q?2qjC56dvScQJF/cLyZpbLWo//gJwgcE7scUOxGb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU8wTjNkT1JoV2RGSFZNZXl1aG9oNTc0L3VjVjlrWmNBQ1lOUUxEQ203NlNX?=
 =?utf-8?B?ZW4xUHFZOUVRNnZoMUhpOHRGZmppbXhhb0JWUzEwbzJTYm9HVElnRmNEeEdX?=
 =?utf-8?B?YkxFWk5IVXRWU2ppUTJvbHNoUWhndUFzTG5mbVZxS0ZuVldtN1VXa3dLemtO?=
 =?utf-8?B?dEFqeUs4VHlYTVRFN1FtTGFBb1oxNzZybW1xWXlDOUdENkg3akVXVnhxeGY5?=
 =?utf-8?B?NzVYWDd2dE9EbnJ2SC9zcWlmRWYvK1VaT2NvTUl0QWpYVmduUHdEcWNxVEFI?=
 =?utf-8?B?U0RQSklDZno5WkttNHdBVXR1bFpudnc0N0w4VXpOREE2NkNXY1QrSlF0VkY0?=
 =?utf-8?B?TnZzQUxPU1JCbGtvUCtXUmRQbmUyL1FWZU5DajcrOUNHNHZBWEwzWGY2M0V1?=
 =?utf-8?B?a0labEd1bHM1RzZLdUtiQU1TMmtvZllmVllhTldRZkRKQUVxbjdSd3ZnV0g5?=
 =?utf-8?B?UlBPWEMzdUtZanNBaUt4RFdDSUZTUUp1ZG1tanpSL1VHU0srOXNZN21OWkFj?=
 =?utf-8?B?NUE1M2hNWWNhczJLNk9ybVNXL0F0VlFCQ2hOZU0vbVAxRzVXTVMyeTJySjJP?=
 =?utf-8?B?cTZrcXBGYXdwQ0FvNk12dUpYRitCMjRNUUJmb2VOOXBSbnptV2g5ai9BUStu?=
 =?utf-8?B?M3FrK1ZGelAvdnVRZFdpWk4zWUFuMUw2bTBGenRtckZITmdCQUpmdXJrelBv?=
 =?utf-8?B?SmdOYUJVMG45M1RxSTcrQk9tWGV1UjV1bzdVWXlwb0xoZFN3U3NYOWVwcUVZ?=
 =?utf-8?B?V1loWW4yekk1c1E3VUEyOVViN1QrdHJYbG1HbGd1U3ZXSkc3TTdtY0krNWdy?=
 =?utf-8?B?M2oyZ2xtNG43S09kL2xpVkYrSDNCaVhhK1dGbktOR2NDZm1pdEk5U2RlZXdo?=
 =?utf-8?B?VjBEYnhtR1g2ZjRHOGdHU0JEREZWek14N1hHLzNCY3lqVk04MXBsemI4N0th?=
 =?utf-8?B?VnJRVTVTbkZrcTRYNENEUlRrVGhQaTRITG9SNHh3T2Y3UzBMaitCbFBvYjJC?=
 =?utf-8?B?WHdmWXNjU2F6NEQzU1g0V3J1STYxbjJ6THhtOWxWRmtQUUNyN3J6b29MalBq?=
 =?utf-8?B?WkNwRkRqQ0gveTNjcUxNWkQwMCtpcXo4bG9mN2M0dVpJZi9IRFQxRXlRd0oy?=
 =?utf-8?B?dWVoTHhwL0tUU2xqQ1J0Y2ZteU1Uc0dOWUdmOGlSVk5pSFFyRHpWaTdUL2Ur?=
 =?utf-8?B?UGtGMGJpTUIxWmxhdFlKdG00UmJqS3lKcFVKOFEwaktnd08weVlVN1R0bUIv?=
 =?utf-8?B?RU5nUU8vQU9Qa2dUNTA4RUxMSUlSOGdVR3VlY29JdFVyUmJYSzRSd0pzUktF?=
 =?utf-8?B?Qm94eFhkaUZBVkxUUVFNR1k1emxHbGJZMHVCSURvWEw1YlQ0T0xkMmFqdHg5?=
 =?utf-8?B?ekNOaEFSM2ZueVhsZXJKczMzNEc1T0hoVFBtN1RpSVg0V3FqUThQSURvbnJx?=
 =?utf-8?B?WWt0ek40NlFUVWJhdkwzVHdTMVBHQTlGN2UxN0NFSWVTYTZiUHJIZU9QUTVL?=
 =?utf-8?B?YUlYaDNrUW1KTHJOUkNEc2QwQy93MVNkUjVMUGxtR2xRNHpDWDNSZnZJcGFM?=
 =?utf-8?B?MHdYZHFEb2ZSMkU5NjVWUGppenRUSFZuakZyQlFKa0lwcDdwWnh2bXFLVjhS?=
 =?utf-8?B?NGpmVnA0NEZvQUR3OWRVaEt5RFo0Z2xOVktXc0hhMFBoTTZvZXhzV0tmckFj?=
 =?utf-8?B?aDk5R2NDMHlVS1p4cGpXdDRTNUx4aXJobEZkaHl6MjNvczlndE4vanFLTGV1?=
 =?utf-8?B?dG1xTHVCWG00MXd0UWlFR0NzeVloUWJmb2JiRW96UmFYaUJSa2ZvYURlMDRG?=
 =?utf-8?B?OWQxcUQ5ZHp0cVlaTlVUYjRONk0rKzJMWFdtVS9YU1VackllcDlJeTNuS0hW?=
 =?utf-8?B?bHhMbis3U2NsaWdaZGN3ZDMyMGh4RUJiK1IvLytiTGlBY2p5NmZHZ3pXWUti?=
 =?utf-8?B?RkI4OFN3K0hKcmhsYmVEQmF0NFQxYy92d0pJdjQ0U3YwTVk5bG5QcWE4Um9q?=
 =?utf-8?B?S3J1dXZhNW9adGFDWHVuWWx3eUIrWTlWeTN4UHJoV21oc1FDcWJYYk9taWhv?=
 =?utf-8?B?akNSczdXTG9MQjdSY0ZvMk9MaU5Dai9qWFlobWQ4bE96VFIxVXBZWXBvOTdl?=
 =?utf-8?B?RlNta2xBL3B0WDFmaGRVcEREZEN5VnJtd1pIeGgrb20rU041OXYvNUlxQlEx?=
 =?utf-8?Q?XyNlzg/q6ZM5hjmLTRrUJQQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bde4e3c2-8be7-49cf-96da-08dcf52c334c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:35:37.0000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUXdVXW0dRs8AZs/ZNSEdZy7vGxdFp2pMG7gFZIYlULOfQy60+dniCtKNzl0q3QBQnESpa/WpZd5UZZf1Be5hxh4BGPlzzb6BBMId24mxVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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

On Fri, Oct 25, 2024 at 11:52:05AM -0700, Ashutosh Dixit wrote:
>Verify OA syncs signal correctly in open and change config code
>paths. Verify with different types of sync objects as well as by both
>waiting and skipping the wait for syncs to signal.
>
>v2: Significantly expand oa syncs testing as described above

Are we just enabling output sync for the OA use case, as in, user can 
only wait for the OA configuration to complete, but cannot control when 
the OA config starts? Which is what existed earlier, so it should be 
fine either ways.

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/xe/xe_oa.c      |   6 +-
> lib/xe/xe_oa.h      |   2 +
> tests/intel/xe_oa.c | 261 ++++++++++++++++++++++++++++++++++++++++++++
> 3 files changed, 266 insertions(+), 3 deletions(-)
>
>diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>index 4fdd0b8c95..c168669c5d 100644
>--- a/lib/xe/xe_oa.c
>+++ b/lib/xe/xe_oa.c
>@@ -1025,8 +1025,8 @@ const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
> 	return "unknown";
> }
>
>-static void xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
>-			      struct drm_xe_ext_set_property *extn)
>+void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
>+			     struct drm_xe_ext_set_property *extn)
> {
> 	__u64 *prop = from_user_pointer(properties->properties_ptr);
> 	struct drm_xe_ext_set_property *ext = extn;
>@@ -1063,7 +1063,7 @@ int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg)
> 		struct intel_xe_oa_open_prop *oprop = (struct intel_xe_oa_open_prop *)arg;
>
> 		igt_assert_lte(oprop->num_properties, XE_OA_MAX_SET_PROPERTIES);
>-		xe_oa_prop_to_ext(oprop, ext);
>+		intel_xe_oa_prop_to_ext(oprop, ext);
> 	}
>
> 	return igt_ioctl(fd, DRM_IOCTL_XE_OBSERVATION, &p);
>diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
>index 962f9dddcc..7d3d074560 100644
>--- a/lib/xe/xe_oa.h
>+++ b/lib/xe/xe_oa.h
>@@ -398,6 +398,8 @@ uint64_t intel_xe_perf_read_record_timestamp_raw(const struct intel_xe_perf *per
> const char *intel_xe_perf_read_report_reason(const struct intel_xe_perf *perf,
> 					     const struct intel_xe_perf_record_header *record);
>
>+void intel_xe_oa_prop_to_ext(struct intel_xe_oa_open_prop *properties,
>+			     struct drm_xe_ext_set_property *extn);
> int intel_xe_perf_ioctl(int fd, enum drm_xe_observation_op op, void *arg);
> void intel_xe_perf_ioctl_err(int fd, enum drm_xe_observation_op op, void *arg, int err);
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 92f5828c79..27f30ebe73 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -22,6 +22,7 @@
> #include "drm.h"
> #include "igt.h"
> #include "igt_device.h"
>+#include "igt_syncobj.h"
> #include "igt_sysfs.h"
> #include "xe/xe_ioctl.h"
> #include "xe/xe_query.h"
>@@ -4463,6 +4464,231 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
> 	__perf_close(stream_fd);
> }
>
>+
>+/* Return alternative config_id if available, else just return config_id */
>+static void find_alt_oa_config(u32 config_id, u32 *alt_config_id)
>+{
>+	struct dirent *entry;
>+	int metrics_fd, dir_fd;
>+	DIR *metrics_dir;
>+	bool ret;
>+
>+	metrics_fd = openat(sysfs, "metrics", O_DIRECTORY);
>+	igt_assert_lte(0, metrics_fd);
>+
>+	metrics_dir = fdopendir(metrics_fd);
>+	igt_assert(metrics_dir);
>+
>+	while ((entry = readdir(metrics_dir))) {
>+		if (entry->d_type != DT_DIR)
>+			continue;
>+
>+		dir_fd = openat(metrics_fd, entry->d_name, O_RDONLY);
>+		ret = __igt_sysfs_get_u32(dir_fd, "id", alt_config_id);
>+		close(dir_fd);
>+		if (!ret)
>+			continue;
>+
>+		if (config_id != *alt_config_id)
>+			goto exit;
>+	}
>+
>+	*alt_config_id = config_id;
>+exit:
>+	closedir(metrics_dir);
>+}
>+
>+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>+
>+#define WAIT		(0x1 << 0)
>+#define CONFIG		(0x1 << 1)
>+
>+enum oa_sync_type {
>+	OA_SYNC_TYPE_SYNCOBJ,
>+	OA_SYNC_TYPE_USERPTR,
>+	OA_SYNC_TYPE_UFENCE,
>+};
>+
>+struct oa_sync {
>+	enum oa_sync_type sync_type;
>+	u32 syncobj;
>+	u32 vm;
>+	u32 bo;
>+	size_t bo_size;
>+	struct {
>+		uint64_t vm_sync;
>+		uint64_t pad;
>+		uint64_t oa_sync;
>+	} *data;
>+};
>+
>+static void
>+oa_sync_init(enum oa_sync_type sync_type, const struct drm_xe_engine_class_instance *hwe,
>+	     struct oa_sync *osync, struct drm_xe_sync *sync)
>+{
>+	uint64_t addr = 0x1a0000;
>+
>+	osync->sync_type = sync_type;
>+	sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
>+
>+	switch (osync->sync_type) {
>+	case OA_SYNC_TYPE_SYNCOBJ:
>+		osync->syncobj = syncobj_create(drm_fd, 0);
>+		sync->handle = osync->syncobj;
>+		sync->type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>+		break;
>+	case OA_SYNC_TYPE_USERPTR:
>+	case OA_SYNC_TYPE_UFENCE:
>+		sync->type = DRM_XE_SYNC_TYPE_USER_FENCE;
>+		sync->timeline_value = USER_FENCE_VALUE;
>+
>+		osync->vm = xe_vm_create(drm_fd, 0, 0);
>+		osync->bo_size = xe_bb_size(drm_fd, sizeof(*osync->data));
>+		if (osync->sync_type == OA_SYNC_TYPE_USERPTR) {
>+			osync->data = aligned_alloc(xe_get_default_alignment(drm_fd),
>+						    osync->bo_size);
>+			igt_assert(osync->data);
>+		} else {
>+			osync->bo = xe_bo_create(drm_fd, osync->vm, osync->bo_size,
>+						 vram_if_possible(drm_fd, hwe->gt_id),
>+						 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+			osync->data = xe_bo_map(drm_fd, osync->bo, osync->bo_size);
>+		}
>+		memset(osync->data, 0, osync->bo_size);
>+
>+		sync->addr = to_user_pointer(&osync->data[0].vm_sync);
>+		if (osync->bo)
>+			xe_vm_bind_async(drm_fd, osync->vm, 0, osync->bo, 0,
>+					 addr, osync->bo_size, sync, 1);
>+		else
>+			xe_vm_bind_userptr_async(drm_fd, osync->vm, 0,
>+						 to_user_pointer(osync->data),
>+						 addr, osync->bo_size, sync, 1);
>+		xe_wait_ufence(drm_fd, &osync->data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>+
>+		sync->addr = to_user_pointer(&osync->data[0].oa_sync);
>+		break;
>+	default:
>+		igt_assert(false);
>+	}
>+}
>+
>+static void oa_sync_wait(struct oa_sync *osync)
>+{
>+	switch (osync->sync_type) {
>+	case OA_SYNC_TYPE_SYNCOBJ:
>+		igt_assert(syncobj_wait(drm_fd, &osync->syncobj, 1, INT64_MAX, 0, NULL));
>+		syncobj_reset(drm_fd, &osync->syncobj, 1);
>+		break;
>+	case OA_SYNC_TYPE_USERPTR:
>+	case OA_SYNC_TYPE_UFENCE:
>+		xe_wait_ufence(drm_fd, &osync->data[0].oa_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>+		osync->data[0].oa_sync = 0;
>+		break;
>+	default:
>+		igt_assert(false);
>+	}
>+}
>+
>+static void oa_sync_free(struct oa_sync *osync)
>+{
>+	switch (osync->sync_type) {
>+	case OA_SYNC_TYPE_SYNCOBJ:
>+		syncobj_destroy(drm_fd, osync->syncobj);
>+		break;
>+	case OA_SYNC_TYPE_USERPTR:
>+	case OA_SYNC_TYPE_UFENCE:
>+		if (osync->bo) {
>+			munmap(osync->data, osync->bo_size);
>+			gem_close(drm_fd, osync->bo);
>+		} else {
>+			free(osync->data);
>+		}
>+		xe_vm_destroy(drm_fd, osync->vm);
>+		break;
>+	default:
>+		igt_assert(false);
>+	}
>+}
>+
>+/**
>+ * SUBTEST: syncs-%s-%s
>+ *
>+ * Description: Test OA syncs (with %arg[1] sync types and %arg[2] wait and
>+ *		reconfig flags) signal correctly in open and reconfig code
>+ *		paths
>+ *
>+ * arg[1]:
>+ *
>+ * @syncobj:	sync type syncobj
>+ * @userptr:	sync type userptr
>+ * @ufence:	sync type ufence
>+ *
>+ * arg[2]:
>+ *
>+ * @wait-cfg:	Exercise reconfig path and wait for syncs to signal
>+ * @wait:	Don't exercise reconfig path and wait for syncs to signal
>+ * @cfg:	Exercise reconfig path but don't wait for syncs to signal
>+ * @none:	Don't exercise reconfig path and don't wait for syncs to signal
>+ */
>+static void test_syncs(const struct drm_xe_engine_class_instance *hwe,
>+		       enum oa_sync_type sync_type, int flags)
>+{
>+	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct drm_xe_sync sync = {};
>+	struct oa_sync osync = {};
>+	uint64_t open_properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
>+		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
>+		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
>+	};
>+	struct intel_xe_oa_open_prop open_param = {
>+		.num_properties = ARRAY_SIZE(open_properties) / 2,
>+		.properties_ptr = to_user_pointer(open_properties),
>+	};
>+	uint64_t config_properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0, /* Filled later */
>+		DRM_XE_OA_PROPERTY_NUM_SYNCS, 1,
>+		DRM_XE_OA_PROPERTY_SYNCS, to_user_pointer(&sync),
>+	};
>+	struct intel_xe_oa_open_prop config_param = {
>+		.num_properties = ARRAY_SIZE(config_properties) / 2,
>+		.properties_ptr = to_user_pointer(config_properties),
>+	};
>+	uint32_t alt_config_id;
>+	int ret;
>+
>+	oa_sync_init(sync_type, hwe, &osync, &sync);
>+
>+	stream_fd = __perf_open(drm_fd, &open_param, false);
>+
>+	/* Reset the sync object if we are going to reconfig the stream */
>+	if (flags & (WAIT | CONFIG))
>+		oa_sync_wait(&osync);
>+
>+	if (!(flags & CONFIG))
>+		goto exit;
>+
>+	/* Change stream configuration */
>+	find_alt_oa_config(test_set->perf_oa_metrics_set, &alt_config_id);
>+
>+	config_properties[1] = alt_config_id;
>+	intel_xe_oa_prop_to_ext(&config_param, extn);
>+
>+	ret = igt_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_CONFIG, extn);
>+	igt_assert_eq(ret, test_set->perf_oa_metrics_set);
>+
>+	if (flags & WAIT)
>+		oa_sync_wait(&osync);
>+exit:
>+	__perf_close(stream_fd);
>+	oa_sync_free(&osync);
>+}
>+
> static const char *xe_engine_class_name(uint32_t engine_class)
> {
> 	switch (engine_class) {
>@@ -4511,6 +4737,25 @@ static const char *xe_engine_class_name(uint32_t engine_class)
>
> igt_main
> {
>+	const struct sync_section {
>+		const char *name;
>+		enum oa_sync_type sync_type;
>+		unsigned int flags;
>+	} sync_sections[] = {
>+		{ "syncobj-wait-cfg", OA_SYNC_TYPE_SYNCOBJ, WAIT | CONFIG},
>+		{ "syncobj-wait", OA_SYNC_TYPE_SYNCOBJ, WAIT },
>+		{ "syncobj-cfg", OA_SYNC_TYPE_SYNCOBJ, CONFIG },
>+		{ "syncobj-none", OA_SYNC_TYPE_SYNCOBJ, 0 },
>+		{ "userptr-wait-cfg", OA_SYNC_TYPE_USERPTR, WAIT | CONFIG},
>+		{ "userptr-wait", OA_SYNC_TYPE_USERPTR, WAIT },
>+		{ "userptr-cfg", OA_SYNC_TYPE_USERPTR, CONFIG },
>+		{ "userptr-none", OA_SYNC_TYPE_USERPTR, 0 },
>+		{ "ufence-wait-cfg", OA_SYNC_TYPE_UFENCE, WAIT | CONFIG},
>+		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
>+		{ "ufence-cfg", OA_SYNC_TYPE_UFENCE, CONFIG },
>+		{ "ufence-none", OA_SYNC_TYPE_UFENCE, 0 },
>+		{ NULL },
>+	};
> 	struct drm_xe_engine_class_instance *hwe = NULL;
> 	struct xe_device *xe_dev;
>
>@@ -4713,6 +4958,22 @@ igt_main
> 		}
> 	}
>
>+	igt_subtest_group {
>+		igt_fixture {
>+			struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>+			struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
>+
>+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
>+		}
>+
>+		for (const struct sync_section *s = sync_sections; s->name; s++) {
>+			igt_subtest_with_dynamic_f("syncs-%s", s->name)
>+				__for_one_render_engine(hwe)
>+					test_syncs(hwe, s->sync_type, s->flags);
>+
>+		}
>+	}
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>-- 
>2.41.0
>
