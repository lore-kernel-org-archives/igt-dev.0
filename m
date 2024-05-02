Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686A1C4345F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 09:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019D710F413;
	Thu,  2 May 2024 09:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mU/MdsdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06810F41E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714641418; x=1746177418;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p2Vhx9m6d6w3IKPwGhcdf516102S7nuKj55Q508JgU4=;
 b=mU/MdsdMtnBjHi+hx22RDmifYD5D0qZXZbvigEPK22Je2y+jQfSGR03h
 /NnJJtV+8cOMi0WvVAAH6DyGdPpHVh2uayG4ZMfg9V8PO94D9tGzLTVGC
 TS26d/GK0z7MQGMMdZIR8/Nm8g99lmPAaV23Lk6VnuAxy9CBR0rzyJPr0
 kSeYM4NvChWTqIbuRNEP4+dtez+WAX8XTK8srsF9G69jleVN0BqiDKNAt
 aNd+eNzAQrXAo4kCEcCWDkzln45WCUgQrqfgZmBRHm3HtGHJxl9dgfusG
 Ok53+GNSYb7EwWeOZOZMPvGf8ww7Z9nh1F6QAIDyKd96j+WzATHSIVV6s Q==;
X-CSE-ConnectionGUID: cHv6D3fJRreSi3c0xUSdBA==
X-CSE-MsgGUID: J1q6sHPpRWigFVCNe1taew==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="35788413"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="35788413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 02:16:57 -0700
X-CSE-ConnectionGUID: eXIqYhB8TJuke9eIn3NtdQ==
X-CSE-MsgGUID: T5SL99hWS6mV6nl4I6m2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="57952331"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 02:16:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 02:16:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 02:16:56 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 02:16:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b47faaorjeTr/STrQGyO9tFR8yQ08qDwmYg2qkW1TWqtYjgT+lSuZg7ZyAbdmXNT7+aARmWEF1oiTLE6cYNFde2ZOGqFHACrE9RCdtty0n5isnur46i/gIsiFR3uyUevYQi+H9e5t8v7C65j+Iuu10P4bOex+Ef1duj8fqolUl5Orju+6eh1iMsxYq0oOS+EmMewfGVeCsi59/+tGKnbqhyYFUq/3q9s1Rd79Qt6jak14JBY40WprgIOdqM7XRaeACA0zMPQVXRrFwTTXWVG5RAmrLhrRFDwBdWsfc3CoMD65RXUAiCTaApYRsphK4KvBg7JEB6XSyd6solQW6HmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6qTCrWeyQIH/mGa3b36oXtnW3bTXlxrOho1Cnkps94=;
 b=W8Z57phCNw1UGmayvxVHnYrmv9rvDj3fZkOcoU+vbjVqzgce+BdEibeXA5/K/xqn30c2F2tSw619nL1R5xdBbcvnCXDft54jgbhoeh6+yi+Wah7I6Zy5Lzs8gz2yaZdB8qrhxk3i1b1TXNZ5sMu1ePW727snH/+sPOJOPZ5e3tLmYknuMl51/hdz8g8Gs9qdZOhDLgY/k7ACT7UnDjdDBdr19Oa+WGtTwml0hnrfM8VYmZLouuI4E3ULyeLYDreV+ExQ5jFkYVBGh9FJO64CqQaQlXIEPPmbvHZvtnD+sjg5mJf6rWwqRLDaFzYwzU1aauV60aY8J5fy4CXMz2hUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 09:16:48 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 09:16:48 +0000
Message-ID: <c5289376-1841-435b-a605-9ac4da26f521@intel.com>
Date: Thu, 2 May 2024 14:46:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to check
 mocs entry
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <matthew.d.roper@intel.com>
References: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
 <20240424200856.1194881-2-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240424200856.1194881-2-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::30) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: d718b905-af0d-4b79-707d-08dc6a889805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGhmYXZiMG51eWJZa0k1VERCTUtJeHF2ZGl3ZENCOWRQMGhCZnBjVUxaeUhq?=
 =?utf-8?B?YWhuV2d6ciszcERvL2lHOEJPODUwSEg2UlNVcUZ3MnlNdXNuU1lzSkV6R0pZ?=
 =?utf-8?B?S2Z3bm00TzRRMnlJYy9vVlZCclJ6N3pCQU9BNkJ6aFF0ZDZrNGJLMlZYWEdX?=
 =?utf-8?B?MGszMnhCZlN6QU9qTS9vajhrb3RGK1dTUDhqUjBuajVWU3pmQ1Q2anVCOTM0?=
 =?utf-8?B?QS9leXRQUDRmQUZmL3RxR0RXYXNORURhU0NZMFlnZzRtZVV3WlA1cyt5T0JM?=
 =?utf-8?B?bnVLN1VHdk0vK2F5ZWJVdy8xUWpJb050UitJMFVoZXk1MTFiQXJrS2NZeUx6?=
 =?utf-8?B?L0RVUHQ1RzlnQXlFQVdCSFV0ellZRmd3S0xqNEZ3S2dxSWtwK2xqaVJldjgx?=
 =?utf-8?B?WnFDRkU0Uk1TK3ljSmE5M1FqTUY2c0Nxc2I0b1pqMysvb2tUZkNGOURjZkkv?=
 =?utf-8?B?NWFiRXhaVlNKTmhtY1BrRDZCa2duUVVJcHlsU256bTJrQlB1NDEyVTFXOFVI?=
 =?utf-8?B?WWQ5c0pObXk3MkVBNVdzNUkwbjhxOEpQQWVtazExWjBkVEwvalFWRzFTaTFl?=
 =?utf-8?B?NXR4a0lTMkNwTVhNZ3lmdnJsR08wTVJ5QXhqeTgvdksrWlZaMlJlbkdsYTNi?=
 =?utf-8?B?ZnV3dDM3REdZM0svQnhTdEtmblI3dmI0QTQzSkZjWE5Zd2ZVTE9lWUlmUllJ?=
 =?utf-8?B?aFBPWHFMMEtLbjhVTGg1TzNLWERkRGdTTTJPRDF3RGVDYm1temJhdTVDdTJV?=
 =?utf-8?B?MldiZEtGdXdvZHY4eXlUaStnd2ZlTkhMTlV1eTdKWEMxNUhKQVBwSVErUkxo?=
 =?utf-8?B?cTdnNGgwaWNUaEgxWDcwL3Bramw3YjdrSnNra3NJUDNvYldWK3Q2THlWNEZi?=
 =?utf-8?B?VTFPdVBBS1llMTN4Q3U4R1BxQmdsSVpJbGl5d3ozc3FZY0UwclZCRE91ekc0?=
 =?utf-8?B?aW1YcnE2dzVMd2hMZmIrZGFickdYU2RIeHZtM0UyT0txa2lSc1Z6QzNTTkFa?=
 =?utf-8?B?SkZEdVlKa1VGWnlJMkNZZ1c2bXhHSlM5cU0yL3lqWUVCbG9UZTBEWWxIREhj?=
 =?utf-8?B?V1YvblJMOVF3NUc0NzhBNC9xTlJodTlTRVZtWmVPazgxTHBhbjJHMWhiempq?=
 =?utf-8?B?eTR1NjhERnBobWo1YmdGVlBEQ25BdEFKWDBNbWcwNFVTdktmNjRiK2l3SGJa?=
 =?utf-8?B?bTZnYndrc2s3ZUlyNGZRR09LZTB4RUk5bzFraHM3OVh3R09TZG9LVHhWZUFO?=
 =?utf-8?B?TWdjN2lvVllEVnY1b2IyK09KbkxHbFNmeVQ2Q1UzaGlUNkZmZzBrNldkRVVS?=
 =?utf-8?B?aE94SldaMWdVbUhpbFV3RE1OcnNPOXUzWEo5ZFVtSUlabFBYQnJoRjRzMWk5?=
 =?utf-8?B?MDQ2VkxKSTRnTFE1TjN5YWtWM2s4QTVsazlCV1Z2M0ZBRnY4SXNoOUN5T2sv?=
 =?utf-8?B?QmlSMEd6TmhiU0xILzBUUGxDcmhiWFhqUUVleTh6M1pMbWFIODdUY1czUUMz?=
 =?utf-8?B?Z1l1RGJTL2NKT0d2d2NQR0plTlFpQlVNSURtcm80VVY5dWFZRk4yQTA0Q1dJ?=
 =?utf-8?B?R0FBZGFLaUxWUVlRRml3cVgxdXJtTm8xTlNlbHhFUnp6VHduVDNoVGgvMUJW?=
 =?utf-8?B?OHIvQzhnU1BPVEc5SS9oKzVBOXR3T3d5dFBYdktTUjg4dFloSnZoVmhXeUpa?=
 =?utf-8?B?RVRESmRlc21qUVNHM1ZrR1IwY2dQeEZKNUJIZ055S0lwWDR3anhpdmh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXV2eTh2MVI1emY4TGc0M1hIdVZwdWYxQ0d0aGRyN3lRRUI1Sk9hZDd2b3NV?=
 =?utf-8?B?d1c2SVhuNnppaHN3cHlqK3VaUzdTcTllYzNmM3laelFDSmZSYzRZV3NDYmpW?=
 =?utf-8?B?dkQyZmlEWVFXb0lVWGoxYzh4d1VPN0Zhem9rQUNLaWw1RVlkVkxVb3p5SWxM?=
 =?utf-8?B?WHFSQUFwdDNpUjIxUDkvaGx2dG5VL3RsT2NuNEdwU2xxWXUvS3Bndk9oUk1m?=
 =?utf-8?B?dnQwbTNFUzFMRWw2K0RQY0Q2RXVsMjQ5bms3VzN6YVVKd1RpYkYrZTJMUits?=
 =?utf-8?B?VDVuYnhUTm42ZUlwRGFjMjcybjNKb3hINnFXNExsWmw0S3dQWjFPVVRGMTRK?=
 =?utf-8?B?TFJIMXRWdW5sVWQyZkJkbEMvK1BlRDllUDJSU3JOQXdxVjRNYUJPdnhQeVYz?=
 =?utf-8?B?cUZuaE8rM2NYM2dtWit2RXRIcStOTnV6TURmeVZzN2UzZWVwWUFmaDFVUHZV?=
 =?utf-8?B?ZytWMml4NlVUOU9JTnBXU3NMY0RzVGxWL2hoYUt3Um9OcjJqSnJjbUtXR3JO?=
 =?utf-8?B?NENxek5Ub3NCenR4MHR6dTZoaVNoRFdmK2RIKzhHa2wvQVF3NzFVcEIxQU1u?=
 =?utf-8?B?bkNVY0l0Ylk1OERWcGxielpBNFpUSmswTWpFemVuREZEYTF6eGxnOGdjWVlt?=
 =?utf-8?B?UGVxRDVzNlovc1hEU1FFbmZLTnZCQThVVFNpb3BEcDR5elAvdGFZc2JFQ3Fy?=
 =?utf-8?B?U2w1VHh3dGwrRmp5Y0dvQUg2TlNPMWpDTFJoLy8vWjR3WE9TMm1Qa1dNVUhm?=
 =?utf-8?B?dmhVbGNHOHpabEg1Vm9vSHVvbnhVeEhtbDZqYmlCUFQ5ZlpmRkJmVFN4WEtN?=
 =?utf-8?B?dG90Y1grNmUxVEJJcjBCakpHS2Z6TzAxK2FXWVpMMGdlUENwZDFXYk42a3NH?=
 =?utf-8?B?dStYRHhCTHFOUnBHQkx2MEdYNE9rV2ZqUUlESWZKSGFyU2FCTGJiZ2I4NCsw?=
 =?utf-8?B?RlFVM1cwOXdtdnZ3aWZaV04yT0RIWTlzL25kUGlzak55S25CZmR5UDl3b2c1?=
 =?utf-8?B?Y0xaSGhxWnROWThWR3dLb3dRZEdlUGhnd1JOaTVwNERVZkxGWDI3S3hIWG9H?=
 =?utf-8?B?YTJSTzdLQmxaRmNzUVpWRHBMUTNqb2VPdkNpYlVrSDNVQ2pqRWVXTklPVHVB?=
 =?utf-8?B?TFNjSjRTSVMwT0hqaHE0ZHgzTmhVQ2RjcnRCeC9CZ1kzc1BWWjFNTDBiK0xl?=
 =?utf-8?B?bXVzYlUySFhkQjVTb09HT0ZTS2ZESXZENG5WZmVhYll4cnBJNmF5Y29hWTk5?=
 =?utf-8?B?dVJob3owSW9pQ21sbGRpRlB2dHladUVvS3RHVVhhZXNRdE5NNHBWR1Z2RFRh?=
 =?utf-8?B?YzJWdE9QZkJuaWg1RTdjN2Z0NE9IOFo3eDh5Y1I4TmpFdXo4RG1Mb0RiUFFI?=
 =?utf-8?B?RHovckI3VlpCRy9SOTIyVzI1YlpXc0JVNUt0Q0hMRWFoTzRSV1BreVJEWnlV?=
 =?utf-8?B?d0lxSlM3TTZlRjhDZEJBYWtCY0dVSDc1ZTl0OHloN0xSOFI0RTE3NklGcnlS?=
 =?utf-8?B?dzR2T3lnRXBPc0QrTkFISExjRlM5MWk4b0pvUVJWeFN1ekF4QUVsWTFxdUhP?=
 =?utf-8?B?MVlONlBHTG9UaE02MWdLUnV4QUJyYThoSThqMzVrRC8zYVIyNTlTOFM2ZlQr?=
 =?utf-8?B?WTBaeG9Lcmprd1pIY0l4QlN0bmg5WldpdTcwbFZFT0oydHdtWUlNWklyTk1X?=
 =?utf-8?B?N3VGbFppU0VJZ2phdDFCQUJONEU5Tmw1VFRFTEg5NElTZVNxcjlPM0pTQW1O?=
 =?utf-8?B?NkltQzZoVGRFNjRuUnRZVGQ4akxjd0lhYU96S2lWbDIxNFhTNmlNZFdRb0w1?=
 =?utf-8?B?R2NwYnNOUVNNSDJiYk4ya2dwUURXZkh4dnhaWnVHRkp2THp0Yk9RVGdPb0d6?=
 =?utf-8?B?Sk9aRkpnSDRhOWJiUXJLTGlTZjdCWFk2Vm9kOUpBY1BmbUlrNWpIU1FScjkx?=
 =?utf-8?B?VjY5YVJ1eElmdUM3WWphRkR0Wk5IVVBVT2tqU3M0dnZXOVkvTEJuQTdyTzU1?=
 =?utf-8?B?NlBwQ2Ftcm1lbG1EdU9zS0c5R3E2TDArTjlzU1pJYmZjUEpZcldaZkZDdnVn?=
 =?utf-8?B?eWtKTE0veUhVSG1lTXBPTFBhRWJtNnlxUlVtT0I0dWJnQTlyMmEvZjFlY040?=
 =?utf-8?B?VDZPOERXL1VmMmEzNHRQNVhhU0haSE9JZ0pmMmpRMG8yK2d6c3BlVHZSemVn?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d718b905-af0d-4b79-707d-08dc6a889805
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 09:16:48.1319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjkiTz2sX3AvEF9ShGi+CJkT6lSaIubQ25h/1sbvgSiEwlw1aReeOdh/hQPu2oRs0g2Be1AAQgfZUYvw/6wpzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
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



On 25-04-2024 01:38, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Read and dump mocs debugfs entry.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>   tests/intel/xe_debugfs.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index c5a586e9b..ba12f6ccc 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -158,6 +158,7 @@ test_gt(int fd, int gt_id)
>   		"topology",
>   		"sa_info",
>   		"hw_engines",
> +		"mocs",
>   //		"force_reset"
>   	};
>   	static const char * const expected_files_uc[] = {
> @@ -183,6 +184,10 @@ test_gt(int fd, int gt_id)
>   	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>   	igt_debugfs_dump(fd, name);
>   
> +	sprintf(name, "gt%d/mocs", gt_id);
> +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> +	igt_debugfs_dump(fd, name);
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
> +
>   	sprintf(name, "gt%d/uc/guc_info", gt_id);
>   	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
>   	igt_debugfs_dump(fd, name);
