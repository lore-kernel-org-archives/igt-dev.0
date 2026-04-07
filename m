Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70F1FB5188
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 04:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5918010E074;
	Tue,  7 Apr 2026 04:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXduVeS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0882510E074
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 04:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775535712; x=1807071712;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1eNnwnXiC4+kM0YIdj2sZsEoMYrNfuis+go0S2Ch8gs=;
 b=aXduVeS66wSrDcF++n2WgTNDGDWH9tnceSwdU1iViAiItM8Apv5Ak/BT
 Ig4k0hn6/4lda3kTNoDXespL2USBPq2IOIeD1UMsgwoWP/G9MyGCco8md
 uaw2QtTYV3ZP0AKnrus10Rs4XPKgufLn25KESzNlPOb7E4TTd2JxYRqh6
 GmN4VVos3LJzFWtalrguD3rKOXW6sOy4QmOl0z6sLSnhT+KkuPGFkCA8V
 /krzm7P/d5euM1/GFkaSAjy+zEN5Q6t7Xr8ph5O0MGQIcQfUApswERCUo
 xx4opvMSX1iPHERD8uOVgbzrqjZtC+9EaHdzMEkLUUGx9iFMTaS2fetMF Q==;
X-CSE-ConnectionGUID: 0pmYtZyrT9OmkgFfUY43nA==
X-CSE-MsgGUID: kNC6pG26RBG+qE/FMOvyEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75665140"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="75665140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 21:21:51 -0700
X-CSE-ConnectionGUID: vsxFe9r+ThGIzzKQY3w05Q==
X-CSE-MsgGUID: fltcLWOVSAiu9WaVepzJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="228323602"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 21:21:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 21:21:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 21:21:50 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 21:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfBCBYrVzmqva7t+D1eGj2C7uKBx39GlSrh4fKo89aQ9yMxfg0fQCNgshURWBD2743pw805mTn781A/i0raNpBmnQ7UEh+H0+XJ9TeFXGGe3jMFHuVyZOM8XVYbHJUEKor71JOUvjMutWuujRa5IostMZ1zhu+9e2lg0ARhTWxndnOLllsnlzE7zLrzDz6tVnaUW7x0so5tapof6r7whdPnsXJGE3Wnni0hSTBZu2cf2N4a8hKSuxvsTkeu5HrNO+iyWd57e1qRSHv6lwSNodc/Bp1D1A9HVuwjqFUw2OBopRdoRE+EgQn15EiYUGbao2YrQnqEKL2JhHEDtr56ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVZWwLtf0hYe+4Dg0yJPRYy8BTGCcuotLf4dV1l3tso=;
 b=NLtbOeyBNH08SCR5tS8J3qGrU6WA7QGc6d9TZeP1lFkeNvb1ztnbvrmXmY4p/owPosVKsqlh/8wQf1YUWRGc7ngP1dS+wuda3gnHh+aviTgSrEeQAVSUVCc4IGNxIpo0vbR+Mf6Pe4TkmYLRmWJo6V6MJ/eVgOOAxPNxXmMrtwdBXPq22TeiDdShZ5VUQcGH7n6odYQmqxEm6jdgj8Hlhrm0vi1HO+2y2AAuYROe/yHZk8JVILHPOof18qbxLZ1vdNUza74CQdt+JtbxmrOe+0fxVqTg++b284fEbWAxCaFaS1q75avQtwCEjBp+nBrbZXDBxYzDLHMYY+N6o46YrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 04:21:46 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 04:21:46 +0000
Message-ID: <e145a30c-049f-45fd-b839-d0ada666e4d2@intel.com>
Date: Tue, 7 Apr 2026 09:51:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/9] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-4-arvind.yadav@intel.com>
 <1db6f1ca-4706-4ed3-9ad0-219a956e4cd3@intel.com>
 <c30a0712-9d64-4752-af84-cd9dd598caf3@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <c30a0712-9d64-4752-af84-cd9dd598caf3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::15) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4251db-a75f-4d68-b0ff-08de945d2dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Fp5EiZVum/EALbRqiTqjChq7bHHdJkOezg7rPj+/JwbfHdlpwg9MZLsouxMynEoCLRTcBhh3rNMGMwyQkn6U9i39VRS7f/4ik+pc+0HupZl4W1DqDcPNJREJR8QVcx9fZrmJAhcwzlTAKz6z6xF329AWb3FPQft3/Ih7CxLZTh0y5Qp9h8kO3cygcXEzYQjEB/YqyqO/WOX0zYGT5VgT+6hUGR9OiuD5K6YQqXL6COMXCYZWQdGaOwQZqR3VlfY7tS/dgHdqTrqpPvJSbTqzMtp8WUJ5/C/ISwK5W0tBpAyEKYqaSM7qSv7aX+E6EC2h6Qtr9mvdjkeIXyW05mUAWM3SCp2XWp8Rg7tALPcmwpe/ano7JCOghzeEMSBuehPmM1k3rMgR4XcEPf6AdZ3eXoQnsOR9i6nhSFCmqujR+NpGqEJtnRpfqPelhdVOJQM3cfV9JJCxZ/oeFR1T6FrXlSgVMnrwGvJU8xW7IWCQ4LoZNFxtuVmsUSHVcYN3eqau/epqYgrGdw9SDrEpXetHJ+Vu3mjLInOb1oPDpwM79uKKbY5vtqXLjX5gWdQZuYk6rqZ7XVu5RHK1+nvqTwwxmtWmh32zkEhDV+mbsvE9ugWuNPaJ1OFfgNECFopp2q0NbrXDp8F7uS4Yv3VVFNoqWN3utEBsmRDY1XmuUrAtwPMRTSsMTR8jW0lxeDR9vBXWrPJKLr6DI+/GAPARgAT+3LvGprY8lRyKb4M4R1S5VUE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEFUQVpCcUdHdytjYmZpeXdtSzAwN2hEbGt6SjZ6OVpla0VpalQ2SnB1VGZK?=
 =?utf-8?B?U1VTVDgzVDZrVCtPdmQvY3F2aG81eld4eURXRW9LNkJ4aEI0Y3Baa0xQMkZS?=
 =?utf-8?B?TzQ2NUdwQTBxOVAyWUJ2MFBwRVJHZ05ZWG1HMGF4eUpoUTBuRC84MzZEc1V5?=
 =?utf-8?B?LzB5VER0TnNlNEcvY0hWOC9RTDVBLytaSm5vaUlCb2M0RS9aR203UEFKZDFD?=
 =?utf-8?B?ekF2eG1OcUY0QndlYnhOekRMdHE5RFhxN1QwVHdFTkJLRTl6dEhWdi9hZDQv?=
 =?utf-8?B?OEt2UmxVUlFSUkQ4WER2ejYraXBBNWpXSlV0dnR6RTdnVVJqMUdwNGhHOUV0?=
 =?utf-8?B?a1N6L3NJczgvMnhvSXd0MUhPUFBZK1F0NFJUMTNIQmc3MVFad2EyclFtcWZX?=
 =?utf-8?B?V2NCYzhoRzhaZDN5L2lOZFk4cnZhTzVXVnRsYjZ2ZnNVRksxeWFZeDVRTU9X?=
 =?utf-8?B?YzRIMEI5bjZKczhQbjNvbU1KWmhaa2cxU3dtUmRzWTZST3pENDBUcENNc1Yr?=
 =?utf-8?B?ZDhJaVJKVy9WQjFQa1VCZ09IbXBjUEk2NWVoMjg5QUU5Ly9QQXo2VWp2ZE9n?=
 =?utf-8?B?ZWdEb3lPYWV0dTQxZEpGdGZGMitvc2Z3NEdwNmtsYmhnOTR1RmFySmpJdy8w?=
 =?utf-8?B?VWNwRHNURlAwcGpzb0FhN1c1NkdPSVN6d2VHbERyTHdWb0IwWktibVJoZWxD?=
 =?utf-8?B?bUx4MEZRYWZOTmdKNy8rak81Z2lZeEo5U010clRZc0VGZ0NlQTNKU0lwOFVT?=
 =?utf-8?B?WmNDM2xSNENSbHZRNWxadWN5OHFRQlpZWWRCNjdYUFVJejRrdi9wVGdLeW4v?=
 =?utf-8?B?a0Jld3FOSE80b1FGYXNNSEZkSjg2NEFmQWZISmlIYVpLWjlwZVU3QmVaOWov?=
 =?utf-8?B?VUhkOGhiSUZoak5zOHBNd3E4NnROaE5kUlhkdk9QTEdkZmloaTdvZUhYbXpK?=
 =?utf-8?B?K0R0WU9mS3RGQUdzUHVaclp0bFRyNFBma2RReG9WbjM0QU9xaE5BZXQvMnBw?=
 =?utf-8?B?T0FoendEWE5KdHhKTW10a21EbjNkZ0Y4S3l4cFp2UVJTZTZIRUJlSUx0Q2wr?=
 =?utf-8?B?OTN5MWFZaWEzYUJwZ1gxdjdBK3ZvNE11c24vZjF3L2lMdjF0aFVETmt2UjNV?=
 =?utf-8?B?RUdhRHVESkZOQkxTRnNwRnRIZ0U3WUNRNHREMCtnNTdZMVhXa2JlSWlSeVZr?=
 =?utf-8?B?eTVNN1F2bEdPejRjTlF3VzhOV0pRVy9lMTdyOTZrbFMzbzVhcjZ1dlNaNEtv?=
 =?utf-8?B?bmZoSkN5eTlQWHhNVUNvYko2Mmdxdmh6M0JuQUt4aS9NRVN1UVJ6UFV0YXU4?=
 =?utf-8?B?Yy9manpSVlNaUWx5VTNZUWVXSHdUakdsRWJZaGVOWEdlcUlWSGFmcGxYUnow?=
 =?utf-8?B?MWtaSENyK2MxYUlFVnJxODZHQzhoU0QwT0pQRkNSWjZjQ3JXTDZlM1M0djVW?=
 =?utf-8?B?YkZsSmR0cTdXcmN0Rkw4L2lsVDNnV1JpWWpJUnRsbU1OcHJOUGU2L1RoQ1R2?=
 =?utf-8?B?VjNFZ25HR2dJaTVxZ2ZNc3F1OXNqZFFnQm5hR0xrS2RtM3RYcUgzeWRuQ3V3?=
 =?utf-8?B?VGExRmNrSjROenBjRGkxa3hjamg3T3NPa2FadmhURmEzMUxUTnNGTmtWTU1Z?=
 =?utf-8?B?bHBWMWNKekRWSUMrRVN1RHdVbTE2djllaklESUFkdXE1TWlnNFVxbWhvdmxZ?=
 =?utf-8?B?VnlrdndtSkFhMXlyejV3S2FBK0p2bEM5NjVsVVRPWFlZY3ZOeHdtVjdoNktk?=
 =?utf-8?B?QkN2cXl0WExoTnpDU0l1VkFsS3k1TGtUaGQ1a1Q5aDl2dnFEMUVDdkpzOVFX?=
 =?utf-8?B?S3ZDZUYveEkra0dOVVZJU0NRUU1ROHVNeXI2bTJET1YwbDhqZkIxVGFubHd1?=
 =?utf-8?B?d1J4L2lMcWxBK0JhSGMzdCtuLy9lU00wcWhSb1lwdEpDU05VcnRmaXJwQjc2?=
 =?utf-8?B?cGFhQUpDTWlJVmd2bXpnOTNEMW80R3pOZlQwWkQxR2NWOThyMEhTbXJsMFM5?=
 =?utf-8?B?MlBBb1AvSStVU0FGcnBjbk5xdDF0ajYxVHUvcDZJSElZNXZlQ2toUTlBaDU3?=
 =?utf-8?B?dk5IOXYzbEFDZ0dhcjZnaTdkRENZdjdlSkQwaGF0YXdkMy9uNmc1L2JERzBZ?=
 =?utf-8?B?OC82dHRzVGo4QU12bXRlUWZlaW42UFZZRzExQzJDOWVGZ0dEODlXWUxZZldo?=
 =?utf-8?B?K0FVVi9kOWxSbTZaNkRUQzFPUndmYm1ET0N1Wit3SlhGS3IrTCtFNlVJNjNv?=
 =?utf-8?B?V3pmSHQwMnpVWFpjRko0Sms0M0NwWnhEbG41ZHlhcmdwaThxczJRS0pBamp2?=
 =?utf-8?B?WXFCV0dKeTd5MmVhYmwrWUN0RStwdUNLUVR0NExtTGJSZElTeWJUZz09?=
X-Exchange-RoutingPolicyChecked: n/Auxjo1NO30TL0+zBnm9EPYUi/AXjE82o4AV+GR4TSTV5aEFZOP4ZMkQfPgnx525HOV8Wpi2KWaddkVNhurlTdSlxFcG6O3gzzCVexQQKbxgr07hNoMwFgJd5l1Axtv0YNRBZSpsnBTzYgmgM12m1GUXlmJ9h7HOXTQRNL+lCOOZ6W6gO38bM153UUpr3gjbrA0LUmTBdD6N8YC63tP1GnQo1nEd5ox+3tOf4bgf/x3Wt3/QR+Tv0cp2nQWYncQEVFJw8wuMA0sbt1TSRDwUtnE81j8IdvpifX8E0E/zEl8si7vKokqW8q1TsvMAVojzSu1/a2AsYSJhhNf28lXOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4251db-a75f-4d68-b0ff-08de945d2dff
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 04:21:46.1572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrQA0aKQvlcpjz3y/ZpF0NGRRRAFI1ejxl12JoYV9N4LBDXX9N/1io3Ag9bHP3CW7RGMjCM8nQGRsaCeyPouig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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


On 06-04-2026 16:00, Sharma, Nishit wrote:
>
> On 4/6/2026 3:23 PM, Sharma, Nishit wrote:
>>
>> On 3/25/2026 6:14 PM, Arvind Yadav wrote:
>>> This test validates that mmap() fails with -EBUSY when attempting to
>>> map a BO marked DONTNEED. The mmap offset ioctl succeeds (it just
>>> returns the pre-allocated offset); the purgeable check happens in
>>> xe_gem_object_mmap() at mmap() time.
>>>
>>>    - DONTNEED BOs: return -EBUSY (temporary purgeable state, BO still
>>>      has backing store but can be purged at any time)
>>>    - Purged BOs: return -EINVAL (permanent, backing store discarded)
>>>
>>> v4:
>>>    - Move unmap outside the block. (Pravalika)
>>>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>>>    - Added assertion for xe_bo_map. (Nishit)
>>>
>>> v5:
>>>    - Add kernel capability check *_FLAG_HAS_PURGING_SUPPORT for
>>>      purgeable support. (Jose)
>>>    - Drop memory pressure trigger path; mark DONTNEED directly and
>>>      assert -EBUSY from mmap offset ioctl; restore WILLNEED before
>>>      cleanup.
>>>
>>> v6:
>>>    - Support iGPU by using total system RAM as the pressure baseline
>>>      instead of VRAM size (which is 0 on iGPU).
>>>    - Raise overpressure from 25% to 50% of the baseline to ensure the
>>>      kernel shrinker is forced to reclaim on systems with large free 
>>> RAM.
>>>    - The DONTNEED enforcement point is mmap() itself, not the
>>>      DRM_IOCTL_XE_GEM_MMAP_OFFSET ioctl. Update the test to mark 
>>> DONTNEED
>>>      first, then verify DRM_IOCTL_XE_GEM_MMAP_OFFSET still succeeds, 
>>> and
>>>      finally verify that mmap() fails with -EBUSY
>>>
>>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   tests/intel/xe_madvise.c | 233 
>>> +++++++++++++++++++++++++++++++++++++++
>>>   tests/meson.build        |   1 +
>>>   2 files changed, 234 insertions(+)
>>>   create mode 100644 tests/intel/xe_madvise.c
>>>
>>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>>> new file mode 100644
>>> index 000000000..de4a6e34c
>>> --- /dev/null
>>> +++ b/tests/intel/xe_madvise.c
>>> @@ -0,0 +1,233 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +/**
>>> + * TEST: Validate purgeable BO madvise functionality
>>> + * Category: Core
>>> + * Mega feature: General Core features
>>> + * Sub-category: Memory management tests
>>> + * Functionality: madvise, purgeable
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "xe_drm.h"
>>> +
>>> +#include "xe/xe_ioctl.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +static bool xe_has_purgeable_support(int fd)
>>> +{
>>> +    struct drm_xe_query_config *config = xe_config(fd);
>>> +
>>> +    return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
>>> +        DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
>>> +}
>>> +
>>> +/* Purgeable test constants */
>>> +#define PURGEABLE_ADDR        0x1a0000
>>> +#define PURGEABLE_BO_SIZE    4096
>>> +
>>> +/**
>>> + * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable 
>>> reclaim
>>> + * @fd: DRM file descriptor
>>> + * @vm: VM handle (unused, kept for API compatibility)
>>> + *
>>> + * Allocates BOs in a temporary VM until memory is overcommitted by 
>>> 50%,
>>> + * forcing the kernel to purge DONTNEED-marked BOs.
>>> + */
>>> +static void trigger_memory_pressure(int fd, uint32_t vm)
>>> +{
>>> +    uint64_t vram_size, mem_size, overpressure;
>>> +    const uint64_t chunk = 8ull << 20; /* 8 MiB */
>>> +    int max_objs, n = 0;
>>> +    uint32_t *handles;
>>> +    uint64_t total;
>>> +    void *p;
>>> +    uint32_t handle, temp_vm;
>>> +
>>> +    /* Use a separate VM so pressure BOs don't affect the test VM */
>>> +    temp_vm = xe_vm_create(fd, 0, 0);
>>> +
>>> +    vram_size = xe_visible_vram_size(fd, 0);
>>> +    if (vram_size > 0) {
>>> +        /* dGPU: pressure VRAM to trigger purgeable reclaim */
>>> +        mem_size = vram_size;
>>> +    } else {
>>> +        /*
>>> +         * iGPU: purgeable BOs reside in system memory. Use *total*
>>> +         * RAM (not just available) as the baseline so that we always
>>> +         * over-commit regardless of how much is already in use.
>>> +         */
>>> +        mem_size = igt_get_total_ram_mb() << 20;
>>> +    }
>>> +
>>> +    /* Scale overpressure to 50% of memory, minimum 64MB */
>>> +    overpressure = mem_size / 2;
>>> +    if (overpressure < (64 << 20))
>>> +        overpressure = 64 << 20;
>>> +
>>> +    max_objs = (mem_size + overpressure) / chunk + 1;
>>> +    handles = malloc(max_objs * sizeof(*handles));
>>> +    igt_assert(handles);
>>> +
>>> +    total = 0;
>>> +    while (total < mem_size + overpressure && n < max_objs) {
>>> +        uint32_t err;
>>> +
>>> +        err = __xe_bo_create(fd, temp_vm, chunk,
>>> +                     vram_if_possible(fd, 0),
>>> + DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>>> +                     NULL, &handle);
>>> +        if (err) /* Out of memory — sufficient pressure achieved */
>>> +            break;
>>> +
>>> +        handles[n++] = handle;
>>> +        total += chunk;
>>> +
>>> +        p = xe_bo_map(fd, handle, chunk);
>>> +        igt_assert(p != MAP_FAILED);
>>> +
>>> +        /* Fault in all pages so they actually consume memory */
>>> +        memset(p, 0xCD, chunk);
>>> +        munmap(p, chunk);
>>> +    }
>>> +
>>> +    /* Allow shrinker time to process pressure */
>>> +    usleep(100000);
>>> +
>>> +    for (int i = 0; i < n; i++)
>>> +        gem_close(fd, handles[i]);
>>> +
>>> +    free(handles);
>>> +
>>> +    xe_vm_destroy(fd, temp_vm);
>>> +}
>> This function is called from below function which is not part of this 
>> Patch-3/9. This must be removed and introduced in Patch-4/9.


Noted.

>>> +
>>> +static jmp_buf jmp;
>>> +
>>> +__noreturn static void sigtrap(int sig)
>>> +{
>>> +    siglongjmp(jmp, sig);
>>> +}
>>> +
>>> +/**
>>> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, 
>>> check purged
>>> + * @fd: DRM file descriptor
>>> + * @vm: VM handle
>>> + * @addr: Virtual address of the BO
>>> + * @size: Size of the BO
>>> + *
>>> + * Returns true if the BO was purged under memory pressure.
>>> + */
>>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, 
>>> uint64_t addr, size_t size)
>>> +{
>>> +    uint32_t retained;
>>> +
>>> +    /* Mark as DONTNEED */
>>> +    retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>>> +    if (retained != 1)
>>> +        return false;
>>> +
>>> +    /* Trigger memory pressure */
>>> +    trigger_memory_pressure(fd, vm);
>>> +
>>> +    /* Verify purged */
>>> +    retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>>> +                       DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>>> +    return retained == 0;
>>> +}
>> This function is introduced in test_dontneed_after_mmap() in 
>> Patch-4/9. Remove this and introduced in Patch-4/9.
> Correction here, this function is called from subtest 
> test_purged_mmap_blocked(fd); which is in Patch-4/9. Please move these 
> functions in Patch-4/9


Noted.

Thanks,
Arvind

>>> +
>>> +/**
>>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>>> + * @fd: DRM file descriptor
>>> + * @vm: Output VM handle
>>> + * @bo: Output BO handle
>>> + * @addr: Virtual address to bind at
>>> + * @size: Size of the BO
>>> + * @use_scratch: Whether to use scratch page flag
>>> + *
>>> + * Helper to create VM, BO, and bind it at the specified address.
>>> + */
>>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, 
>>> uint32_t *bo,
>>> +                      uint64_t addr, size_t size, bool use_scratch)
>>> +{
>>> +    struct drm_xe_sync sync = {
>>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>>> +        .timeline_value = 1,
>>> +    };
>>> +    uint64_t sync_val = 0;
>>> +
>>> +    *vm = xe_vm_create(fd, use_scratch ? 
>>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>>> +    *bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>>> +               DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +
>>> +    sync.addr = to_user_pointer(&sync_val);
>>> +    xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>>> +    xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: dontneed-before-mmap
>>> + * Description: Mark BO as DONTNEED before mmap, verify mmap() 
>>> fails with -EBUSY
>>> + * Test category: functionality test
>>> + */
>>> +static void test_dontneed_before_mmap(int fd)
>>> +{
>>> +    uint32_t bo, vm;
>>> +    uint64_t addr = PURGEABLE_ADDR;
>>> +    size_t bo_size = PURGEABLE_BO_SIZE;
>>> +    struct drm_xe_gem_mmap_offset mmo = {};
>>> +    uint32_t retained;
>>> +    void *ptr;
>>> +
>>> +    purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>>> +
>>> +    /* Mark BO as DONTNEED - new mmap operations must be blocked */
>>> +    retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
>>> +                       DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>>> +    igt_assert_eq(retained, 1);
>>> +
>>> +    /* Ioctl succeeds even for DONTNEED BO; blocking happens at 
>>> mmap() time. */
>>> +    mmo.handle = bo;
>>> +    igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, 
>>> &mmo), 0);
>>> +
>>> +    /* mmap() on a DONTNEED BO must fail with EBUSY. */
>>> +    ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, 
>>> fd, mmo.offset);
>>> +    igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>>> +    igt_assert_eq(errno, EBUSY);
>>> +
>>> +    /* Restore to WILLNEED before cleanup */
>>> +    xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
>>> +                DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>>> +
>>> +    gem_close(fd, bo);
>>> +    xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>> +int igt_main()
>>> +{
>>> +    struct drm_xe_engine_class_instance *hwe;
>>> +    int fd;
>>> +
>>> +    igt_fixture() {
>>> +        fd = drm_open_driver(DRIVER_XE);
>>> +        xe_device_get(fd);
>>> +        igt_require_f(xe_has_purgeable_support(fd),
>>> +                  "Kernel does not support purgeable buffer 
>>> objects\n");
>>> +    }
>>> +
>>> +    igt_subtest("dontneed-before-mmap")
>>> +        xe_for_each_engine(fd, hwe) {
>>> +            test_dontneed_before_mmap(fd);
>>> +            break;
>>> +        }
>>> +
>>> +    igt_fixture() {
>>> +        xe_device_put(fd);
>>> +        drm_close_driver(fd);
>>> +    }
>>> +}
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index cecb4a8ae..a6370b685 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -314,6 +314,7 @@ intel_xe_progs = [
>>>       'xe_huc_copy',
>>>       'xe_intel_bb',
>>>       'xe_live_ktest',
>>> +    'xe_madvise',
>>>       'xe_media_fill',
>>>       'xe_mmap',
>>>           'xe_module_load',
