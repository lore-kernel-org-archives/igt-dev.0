Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C725DC54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 10:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641A910E24B;
	Thu, 28 Mar 2024 10:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVb8T0Uo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A66A10E24B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 10:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711622605; x=1743158605;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xgqa2vfxqVLmdmRnE+nGo/epIhVyEu731SDUDpdNR6Q=;
 b=eVb8T0UoCKKcT+/VxNS/gjFh0sA9nwAm8b/FqktwsJu46wvodLP9vXdB
 ZAvHU5QuEIMJ3bzCTi4jspRQRcXaaJVdLRKtETu+sorloILdN1IqHuTkA
 +GzdeI3bjrX/5tBbfdRaSo1WGd8APtegpUdxyd1U+CLx3+A/sQO0T2W4q
 ciMIkroBnjPKU085eEbbtGzGkEQa2ayTG2J7gfMpsoNYmJN2HnexG04NV
 IL3nt1rSiRa86P1sOifYTVnEm7kJmV6NvK7qG1LAfnOs2iLLifQZoRzNz
 fwpwWUFRHOH4TYC32rko4LxvkVFT1VCOPGmJBRS2CcJAehqkOjvBM79UE g==;
X-CSE-ConnectionGUID: llAlV1xBQruIqABsvtK71w==
X-CSE-MsgGUID: tscYF7OaRpaSxL1NwqTBHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6881106"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6881106"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21269566"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 03:43:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:43:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 03:43:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 03:43:22 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 03:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cezr/pdSFDRZSKGojBDLQ5J2lKQD/3WP306DmjoS/sp5b6l8ibvkJQUUNOiGbAIvcj4c3Z+djMzL6SSJqgVYWGeCtL5Jypn5+Kr7ac9I/VS0/CAEFJ0h7WnaZTxfJGXuHYY5OFZ6lfIFT/X0ram4mdTKFG3OQMAS9v7+4/nzHD1wMnEm5Rf2LaFJJPfQsH1lOPiIl9a+8nutefnXJ7iGMyl29mu50TOksZrlPlzwhfq2j7O/m4UWzPvBL5OLqc7YvXqxyaXl+mDKockZkZwrCmusiU9VQ85lNpoT5qjoPks2jmRqE9ryOsbSZovMHYYuVCZ36s3xVBQhe36WugQtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeJyHcGboCxgTFx6IQzhj3lO9PadFn+B3UCeEhGY1NU=;
 b=aCTq9j4Y6UoLSjM5i6zdzIEdKklzpOTmct1QQ1kvG6tLhmFxPguCApBuKq3BRe6j973TVzNzzFb7Q03mTZNdfGYD8f9TAcokaHle2dwcGCArFR5Ecxdd0igfZKTI2iZkv0InSx0SpivkwmUhNHA93QIRbkkFEdeXGZBajv6I+sPtRLpGe9iCptzsquyA+Ifvi74SiM+heP8cuJpgfrWMYHWqI+gZ6f2z6BWV4cRRI+pJ5AYbHZ1tOF0Q8qcB874NT5kjslLy7soPhydYPOKf3YPOj4oGxkNF6+vcO5DZUeXwSc0FFMsLwfyZ7oT0R60cu36IK3DKAnLCJXdJIoYQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ1PR11MB6155.namprd11.prod.outlook.com (2603:10b6:a03:45e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 10:43:15 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 10:43:14 +0000
Message-ID: <69e2f5c1-ef28-410d-b819-0c62b9708496@intel.com>
Date: Thu, 28 Mar 2024 16:13:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Drop "xe_exec_threads" from XE BAT
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240328051139.819455-1-bhanuprakash.modem@intel.com>
 <20240328101339.s5od4n66fv7idtkg@kamilkon-desk.igk.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240328101339.s5od4n66fv7idtkg@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ1PR11MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: e90444cf-486a-4c0f-747e-08dc4f13df1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GoBdocAba7woIbckCol5KGrnJh+HiNMjxjSok87bILkQ8BFLQ6YB79rxfKquEcFCYpZddoJlaa0W4062WEJTLJ+6ACbCP6VU4b3Eji0ElvNuB84R856Zl/hFQc2pZlW+mr8pqwd9VLwpeLhdca//TVjeOLudRmhtQY56mWjMUcavN0FFnQuwlA1Xd7VlRUcEjcdh+Mg6Z4lwQbkMZDqvEiun5jRaVrrqRJtIqslPQx+mptwqpUUmteZ4O7ow+naFkpznu/sr4Efq9sKiqy14G/gCJyNQ8agx/idNSRDlGb6/qqEi0gPAmc+OOMmHdNsKfZ4AV68nRIEGO5L0fMl7Hkh61gY5daG2lcFdggiBaOzoYxUgsOZ4MgEq2ZAcrrcivVrBbUeZBDWBzeSOXqiWaL/c9p1eGDoWQOhs+5XXzjm3vM/REfouJBoUcQcoh9S5Q0imYVb6uCmhtPwANAET1nn8xOTy46nBWW2PBvxNC6YDMn03PfXCbwts8sOyLfOjEC0IaLnf6dmV3Ay7Sl7xLRE5j1Z+zCdJhAvHtTwKh9VN17HU/t/oW+nXUQ9qtLTj6IS40jROVXaUoSCAiODqxXbYmrnNBFiu0K2wjF/WNco=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajUyN0d5bFdQQTlWei9YWGdYQ2xKRTdNZUp1ZkpBbDJ6Z3Z5VzV0M3REUXlS?=
 =?utf-8?B?S3d6SUtpcTRaZFF5Zk1HcUdydHdmcDB3aEM1U0Y3WndSODV4d29QUk9SOXJp?=
 =?utf-8?B?dk1zWFlZdkxaeEVIeG9waHVqbjJjWjhKYlQwQ1d6S0FOcUFxeVF2dW4zemp4?=
 =?utf-8?B?cERoRWFlV1BOTnM0WGxaemFBYWZlSmNRTDdZNmQvY3pxTytRZWFVQVFJbm41?=
 =?utf-8?B?UUZodTNFbW9HTzQvdkFQWjR1Y3hER1FYOGNuQVBqVFkxN2JNVTVlWmVHZE5U?=
 =?utf-8?B?RTJVNWVMK09mTFZYQ00rVk9rREFhTFlwOHBuNFBHZm1rZmJLZ0x2SThRNHFz?=
 =?utf-8?B?WUhyRzd4TTRyL0tmRUY1OEZDc0hYbzlDSEZYNUMyY0NjRVk4NmpEZ2dWOG1o?=
 =?utf-8?B?eVZKc2k2QkNZY2FkZVZXWjZuNVlRU1VaMm95cU9ZMk84bEpmR1BITmRTREZH?=
 =?utf-8?B?Q0JmZ0EwS09UVFM3T1F5QmNGNWtRdU8vUVpIY1dxNWF6T01CSmlIY2lpQ3JU?=
 =?utf-8?B?bkR0ZjJjR1RyWlJmVlo0aUFhNXRQTGhjT2N5dzZMUXZQRVhPVWFyRFp1TE45?=
 =?utf-8?B?QU9Yanpja0JsZlhtODNKb2tGd2YwVXBKVXNZMWYxd3dVVjlPWWczUEdDazJJ?=
 =?utf-8?B?Rk4zM1VjbGl0YU9wQTgvUGhWZXJnVjJ1Skd2aTVpMCt2YmVNYjZDeVdYdW04?=
 =?utf-8?B?dGxVMGczdC9PSjZrNFlzSGQ2UFJ1NldmNHBSN2d6TkdKeTVtYzU3V0JLcWZG?=
 =?utf-8?B?Mi9FdW5BMGNOQ0tzL0cwTi9aWEZHaW1ZUTdyT2Q0b3lIQUlrOEVKcnJKMXVK?=
 =?utf-8?B?dE9VWldtaFh4TVVxbnZCQ1p6d25zUDNMQ1JGU2pYVlNYWWw2cEdHalh1b0Nh?=
 =?utf-8?B?ckkzZGtsNS9KRVVQT2pFSHJSVjY2Mm9zVitRWkRRLzBBR3FhQTN1TWJvT01H?=
 =?utf-8?B?ZjNPVHdiVndQTWx4dTdscGN0YlJhL0Q4QXNxMkFqWEdSQlA5NzJFaWxobmFJ?=
 =?utf-8?B?elpGZjhBUHo1R2tRWlR5aFhpL1pZcnNGTEtrWHVRNW9UMk52eUpxdGhJU2VV?=
 =?utf-8?B?Ym5nZVdvQ1JxUWZHWEZ6UE9TbjdaTEtQUVNLZnRKRWxoODhQVjI3YU9xblB0?=
 =?utf-8?B?TzZQL3dlL3I1djFsbTlwK1RtT0pOOVdLVWpEUEhxc3l4dkVjbG1iSVpwcTdR?=
 =?utf-8?B?czJ3S2JtQWVNdmhnVTFwc0ZlR0xVNnBNczVBWUhYY2xvV0tZNnpiOHdYclRN?=
 =?utf-8?B?dXQwMmpVSWtYQmRySE1LSks0ZWdiTGxwMW5LVlFzaXVsOFRISmZoNlRGQVBu?=
 =?utf-8?B?KzFDaVJIR0lTSG9kUDY4SnVxellVOFRYQjRZSmlxMGdkNGpzMmlTdVJSM0lR?=
 =?utf-8?B?VnVsY0pMQ2sreUxCRjg1OHQybEpkN3FrNEhZdnlWV2FYMzR1RFdPRjdUS3gx?=
 =?utf-8?B?ZSs4NDBteEVNZjVUcmUydTV0c2UySU5YeStZMnF4RXBaSm5IS2luMHhCQlF2?=
 =?utf-8?B?bFllNGcyVlg4a05aVWNnWFh1S05URURZaTRhOXIreUhzTW40TjNZQ05vYytW?=
 =?utf-8?B?MWxOVmNoV3ZvaUljSzFOV2FEaVQ4SG9xVnNkUlNyY0tYc0NiRnBUTHhwdlFr?=
 =?utf-8?B?cE1NTlBFK1VDRjFMUkQwNy9TOHJIdlJuM2pUb1Z0MjVBdll1SUxPbS9CVmhC?=
 =?utf-8?B?TEZEbFZYNU1ENEdlMGNqUnBCdkdYQTRDSmxQRGVTb2YwU2c1Sjl0OTZpMUtR?=
 =?utf-8?B?eGNRNXZLSkJvREJzRDZVc1NDK3BZUkgyL0V6aW0wWlZZQXg1SWYxYVBjQ2VX?=
 =?utf-8?B?SlRicktsQWdLcVhocTQ0L0pQZDdiNC9oQW9YYXdSaGlCM0REZDdWREJ1bEtG?=
 =?utf-8?B?QXJ5ZXB3aFM2TVdVWUJta0FkTXRKM01LZUdwU01zVUxvSXlKVUFJSXF6Rm1N?=
 =?utf-8?B?U0hMRC8rNXVMTkZjQ2hQODg2dWJUd0ZnY1Rvc3lhQ0hzVGNIaFpOcjVubG1o?=
 =?utf-8?B?eHdCN25qSGU1dnZpZFV0R2hCTkorNjRvZ3NoS1g1TWlzWStrZ1BjcXBIb2RB?=
 =?utf-8?B?ek83TDN0TkwzeHl1YWc2ZGdReWZQZ1JjcTdRSWV5aXVYN1lhQmE4aHBWLzZ3?=
 =?utf-8?B?R1ZGb3I5OHZhWTB3ZGFYWmx1M0E2WUdHRVI5OXQza1BhbDJ6a3RLMTRMUC9s?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e90444cf-486a-4c0f-747e-08dc4f13df1e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 10:43:14.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6//3utwmemyQuLmkIR6+/HZVbezpXYJZuDyO4fD9N2WFonI6cAOfmrPLUJcUYir4E30t/7f3Iq+46FT+4hgp3cr6BvtVGhnFo57gAM2Jv0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6155
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

Hi Kamil,

On 28-03-2024 03:43 pm, Kamil Konieczny wrote:
> Hi Bhanuprakash,
> On 2024-03-28 at 10:41:39 +0530, Bhanuprakash Modem wrote:
>> Regession with "6.9.0-rc1-xe" is preventing to run KMS tests
>> in BAT. Hence drop "xe_exec_threads" from XE BAT until we fix
>> the regression.
>>
>> Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1044
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Btw this looks like a temporary solution, such breaks can
> happen for future rc1, then it will go back and forth...

Thanks for the Ack, yes it is temporary solution to unblock KMS test 
execution.

And, looks we need to drop few more tests for DG2:
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10938/index.html

I'll float the new rev.

- Bhanu

> 
> Regards,
> Kamil
> 
>> ---
>>   tests/intel-ci/xe-fast-feedback.testlist | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>> index 17863b6b1..55339b8ca 100644
>> --- a/tests/intel-ci/xe-fast-feedback.testlist
>> +++ b/tests/intel-ci/xe-fast-feedback.testlist
>> @@ -80,12 +80,6 @@ igt@xe_exec_reset@close-fd-no-exec
>>   igt@xe_exec_reset@cm-close-fd-no-exec
>>   igt@xe_exec_reset@virtual-close-fd-no-exec
>>   igt@xe_exec_store@basic-store
>> -igt@xe_exec_threads@threads-basic
>> -igt@xe_exec_threads@threads-mixed-basic
>> -igt@xe_exec_threads@threads-mixed-shared-vm-basic
>> -igt@xe_exec_threads@threads-mixed-fd-basic
>> -igt@xe_exec_threads@threads-mixed-userptr-invalidate
>> -igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
>>   igt@xe_gpgpu_fill@basic
>>   igt@xe_gt_freq@freq_basic_api
>>   igt@xe_gt_freq@freq_fixed_idle
>> -- 
>> 2.43.2
>>
