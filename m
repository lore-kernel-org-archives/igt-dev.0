Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AF1CD6E57
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 14:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDBB112025;
	Wed,  3 Jun 2026 14:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5T0VfCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513FF112024
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780498763; x=1812034763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z70o79D3Gu48ZEUPytsp6/9+DkwduXXBrE5/5CsjtrQ=;
 b=b5T0VfCzPONHwo1IuTnfMbPLc0bvNUbJFfRO/2sTU1RAw0C19xKJkY9+
 7BqfJg2IJFq6lejQDR4xJo0nFnUA72Z0AzLUEhrk+tAv0FbS6eFO3W23A
 xuROLVB45V+yX5fELxp53Wgw49yjHjAjKbBKpNxYB6WAjzo3IHcLbQVJe
 v+Uy8zcDBNik4d1owYMAaUd2jy6CAYwSlup0cQYZ8sBBlw98EdRoiWMpT
 7/X3HRpManEy8vCn3oCPH5L583rgARrdgCxTBGSsCRWz5jt0VHNd5q4U6
 CpdfuQGJyTFn/c3MvGZpUEtDKd4gzoWe3xb08fr0CbYcIxkZbh+j5S6M0 Q==;
X-CSE-ConnectionGUID: NLfTFsMARJCexp74eWsBhA==
X-CSE-MsgGUID: 0OaBHcLIQw+3GW8iYG/ypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80453563"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="80453563"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:59:23 -0700
X-CSE-ConnectionGUID: Bq7imw9eTOShJEb1OWbzyg==
X-CSE-MsgGUID: kAZ8OSQWS1OL/5gbzqyXvA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:59:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 07:59:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 07:59:22 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 07:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0Tp7aATzr3c7uruU8rWVy1ILBMwo32appdHWNWQMTPzIld8kfy98DiZXUSkJ6ANIELeoyfpQf1v8XTq2zC9NtB9eyNylGOtw4YqWLqyPTOgW5W6oMnGdbkiS/EB8VAJ0i2sj4PFa8j2EM2mSo2A/XqUfQq7u9WvJ90bKNOP/51VYR8VgmpQ+iKH3kyG9W8K5LladzV+Apm18Dww+s9l+9wP4hxLbpEEu0eoWBkRzKELEdipiOCzfaOHZm3Vyx3Mwz3dgyoOG4BlMGtqApKj3ZGFKmqHl2LaC3/3p5IfxjP8I0gVLFYhEx+pq5dyj/gM0FsJmS0z+LBNhKK1ICgq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odpAl67jmAoQIMgI7Vka+Ejf5lFF0VUMiz5gJJWpNM4=;
 b=mfEUpCpn8Gz9KDPSyzceR/8R2tK1Bgn8jmWT8EpumZDzhPTE6Tzv+D5F2zjiEzfW6qaBEMsJZ0TEHqCsEyG6vKnMNGcpIY1ALS/joPivblNle/FwaS8H5XJQna8maR+DkM1EAsL0vP/192GCy5+9j3nmOE4XJN1lMz9LOFapZBNygw52hHMASLMvcLLBNVaSAFyROCka0cXCNkeXHgfPMf2+68OLuKE6cUn6kly2xjPejHVFHJl/DtDqU6E30HdwCn7SBvZYgDY+jj06eYc0jdQK/vtoAtPs5EuZ2zewKWEOGjVi5lIzdahmdwjghgQfdPdlKU0lJxeq/ys9dM95wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:59:16 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%7]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 14:59:16 +0000
Message-ID: <227ef624-bc65-48f2-b4f5-5cca81e32e3c@intel.com>
Date: Wed, 3 Jun 2026 20:29:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7] test/intel/xe_vm:Add oversubscribe concurrent
 bind stress subtest
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260601171848.10873-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260601171848.10873-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::14) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fef6706-e5f8-48cd-1f9b-08dec180ae65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 5Ev9h14e7sKzbvoBL4pxcT0GtnBci5Nus84MDpMQJCX891la9BPWaGRE8NL00uzcBV1MBOKXcrheEVcVkQ8ZC3DaSJGtHMj5I/O8xzd48egGJHEaoI/QjO0fEKW2C2p7zga+pAvSoa3D9FYUYrTXj7PQSGv0KO0Hglk/lSvUwrXtrGYKsCgpOMRMwI8+9Eg1GP2yO//eEIm1WEkZtU3ymyAFG5PigH3csNNI495m81WjM5R2nFfmndlsWvTuK15khQ6XEjHmX+buuFbi46XBkMA5w14mdVc+hTinnqsDg/98dzSFxkI1fgniRWGz/TZxanyDKNTJBnR3NqaxuL1pAR0YDvMcMSKNSUXB/4rO44dGjKjjZ40OQ/9g1pRjsRjiKWhOSVwIX8SOEXXpmAzwb6z7XoKC3s0yEskfblJFmOugOZIZ02JFd5gaFVw7BDNzZv0Y7tCI0OSDkX4Xcha+zyfFso/q1yWHp9I5bOOzbU3LxAeePo+YxKyQqqJs/CpjNSxOUoKKNELCOAoIvCTOBZFbTTsXgoeOBW6n/TQAKiUAPhOEiifAyaevkT60OwCIC3sDGx64fccyf/kEoAs/U/dZ23qU+DWW7Crd0jRw7bjYylGLcmv2bRa8sa57E9JlQJgB1qeee23GOFvUqdugtf4jZlhOIqZAghRwujJ2O1LTiwoitOGHavgmfCJinz6C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRIakFpQzlWZEQ1UVVBNDg3bkpKT29UMlVqaXM1bGhxSDhhQzFjSTZvazdM?=
 =?utf-8?B?ZUxFRjBMemFUelB6aExPekVIem9LV2NSSmlVbFVnVEp3Qm00VzdhU1htbVFp?=
 =?utf-8?B?dWowZGFySkxLZjJuZFZJRFcwQ2J1aWlheUlyUUIxVTRuaW1JSEQ2LzR0YXBZ?=
 =?utf-8?B?cnB5RkJrdWZWeUlmdk9YVlArU3QzWVYvOC9LZzR1bXg2MkhFTFJIVDB0bzUy?=
 =?utf-8?B?VWprUlRzTkJPUGN4TmdkWElqbTFyazIxWHZPQUFuZWU3eXB5YkJoa2p5VDVK?=
 =?utf-8?B?dXRubTRUQVFxd2N4QnlVdHBnNmk4UlNIaXI0QjNFWWNOYkZvTnRRN0NOTGRk?=
 =?utf-8?B?OUkvK3R2RzQyNVg1bVhBMUZVQjBGUUQyTzF5aTBCU0QvNWxSWkpyTGp5dWNt?=
 =?utf-8?B?dkJ0NndGa1c1M3kvUlVoODY1RWtKZTRNZ3J0eDlFZ1FwUisvZjZIMjdIVEp4?=
 =?utf-8?B?enlmdjBveC93QWtZdE4ycys2MUVaV0l1Um9pSUwzdkF6S050Lyt4U1ZtazJt?=
 =?utf-8?B?clRjNU02d1Q2UDNYVHhyMEVERUtsZWZwQm5Yd3g1M3JUeE15eHluQ0wzeEli?=
 =?utf-8?B?enpFSmM1TGlNUTl3dmYrUXFKR2FNaEdDaFJyeHJmKzRKcWgzTDJWNmlsWWFG?=
 =?utf-8?B?RWR1OUoyY1EyVThGMlpVY2hCNDREaTUzd0NldUpQZmNhaG5JcENUT1VYdUFR?=
 =?utf-8?B?TnJ6ZndPYWpmYU9KQ2o0TmJ5VEQvM0x1OFVPaHI1a1ZwVXBYUVpRekNodGdz?=
 =?utf-8?B?UldqbXFjWkxLR01JY21vUmQ1cDA3aGtKTEt5czFLSW5BMTl1REFXUWN6K2hM?=
 =?utf-8?B?N2NzVE16QVNTMkpoOHBQcTh4eHRpbUp0bS9MbVJBbUNSYXRyVTljMnpKNEdG?=
 =?utf-8?B?QXI1WHhTd09jNzYzVVd1REE2MkR4RUtzbTYwU29HUGw1Mm5NRUE2R3l0QTNt?=
 =?utf-8?B?Rk81Y3oxZ3RESGFhK29VSFpwODZqQUNSMzhUUU5CUUlENzZzNWtwcVhpb3hx?=
 =?utf-8?B?dDNLOUY5OTc5eUlmeWlDSjZ5TFFtV2JYMHd6MGltNy9ud0IyN3c5VXQ2RWJS?=
 =?utf-8?B?WndRSHJrVWZEUmpMdkdhOUZ1YkcrS2dNanh0V3p3ZmpSRC9Sa0tIZWFrdW1D?=
 =?utf-8?B?WHhhUlkza2xvZ011SERhYUpTb001SmdlRG1IaFRSQkRBSk11blhiZU9ZbjBQ?=
 =?utf-8?B?ckNRVlJvTDI1TmtpbithSE9ZYTVmQ0hGZmdlRTRpaHZxUnhsempFNVhIVlFh?=
 =?utf-8?B?c2FqOVJjaVJXZXhacGhBSU1qbkUrVE94MHZOSnZWTnZ0NFNjRDFLMlJkMlla?=
 =?utf-8?B?RExWTkIzWmdvNW8xcjdRMGhZWXg4azhsUThoUlYzL29xc3RyUnlGbzlwQUty?=
 =?utf-8?B?a3Y0eHlneE1rc0FFNWZ5QnFjZVpBaXJhZEkreGV6c0NnVGloTVUyKytTRStw?=
 =?utf-8?B?ZXZpSysyTUpDZWZacENxdzl5b01TYWdYWnRESmRIcHpiVytSdEVONlg3WW1N?=
 =?utf-8?B?cS9nQS9ZcXZxNzY5aFBqc2NhMVNIT3V5eVdnLzRWcXgyNlhvYlk2TkFtMTFr?=
 =?utf-8?B?VTJOaUN5Ky9qbkxhUC9CdFFIQWsvTmdLSWdnVmpVRFB4aFZFRzRMeDdlYmp4?=
 =?utf-8?B?ZTFXYW5lajJXWWxEY2tqWGNObjB0V2JkaWdRT0czWGV3N1djK2o5TlZTUk41?=
 =?utf-8?B?dG1SYWRpZC9QTmRpQ1VCVWpITjkzRTM2NUNTaVEvYUdKU0FTanNFbDBlS1hY?=
 =?utf-8?B?KzM0Z1hxUEJJUnZrV1ZVeHdqV3VKZ29kUlVoRi9FdjMxS3hxN0J0TUFMSWpl?=
 =?utf-8?B?U1BiUHd2V05xNTBWNU9BZ1dhVUNaNGovaFVRUzRuWWpSR2dFbzlYQmZXOUI4?=
 =?utf-8?B?UzlpVHVBU0I5WWVrbTd6bVE5NEgwZS9zNytBWGJqNE5ITVdEVXlLRUw1KzVv?=
 =?utf-8?B?T0daZVd5d1kzb25xMGUvSmtuak4vQ21tQVhoajVwTmZXVmlRODRsQmxpUDFT?=
 =?utf-8?B?SHp3VDQvNWZOYTBXa0FrNkhURVZkU2gzcXhrSnYzbW9UYzZyNTFKc0ZUZ1BE?=
 =?utf-8?B?NFdnUHBoTUY2R3pvcGtSMURrRWtFaXdXYm1ZNWpCT0RMOGZpa3AwRjdSSVI4?=
 =?utf-8?B?STBic3kxeTFaZG5sYmc4RktKZUV6VHc1d2lVUExDTUlaaFh1ZGVoaWY3YlZk?=
 =?utf-8?B?R2lqZW9HT3FKcGdySkxjc1ZwWDZoemtXT2pUUU1ISjNBVjBhejkrUFovT1Yv?=
 =?utf-8?B?dkxMbUc2ektVVkVXUXk3NGY2ampLVUU1SHVvYkV0MXpNY0N0T1pWYXZVUWFm?=
 =?utf-8?B?SHRFWmozMUhWdjFMMGkrQVRHcW1UU24wVkN0UXJxTkl4bGMrQ2NMUT09?=
X-Exchange-RoutingPolicyChecked: GeIF7SgOQa+Erk5K0sbL0Y+OzKOXwzwMWPw+rCzQbx5JgppWUf61LMERHdgj5EG63P8fA7qoMLHzV1q4rFbECcJc85otiyiH5BFU7ejDJzK1FXL/wXUz5NrXjEN6FnWG5OTy2ghlkN4BvgWwcYoR/T6v5ghdVCb47CXs8aDH8FKbgVl1cSZWOCj5wN5Noq/FQ58hHSwD3L7ZjP2deJn91UaVVXjtiOHo92fVYVhkgBaQQCowNbmhralLabnlUW0jkPCkGKVlEGNvEKJgOqn79RZqSK0BvcdfDqcXlM6FXDykluwYW7cVnncbw7HbwogFISqvF+YJiWzXd6O25/ebTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fef6706-e5f8-48cd-1f9b-08dec180ae65
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:59:16.0512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZvUlKEEjViK5ygp5I3GZfrxD02sFOu3O8EN7awcjPkO/gNQgrFSykCvlF83A9qfQeQFnJe3DIRGKldGSH1jZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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


On 6/1/2026 10:48 PM, Sobin Thomas wrote:
> Add test for oversubscribing VRAM in multi process environment that
> creates VM, bind large BOs and submit workloads nearly simultaneously.
>
> Previous coverage lacked a scenario combining multi-process bind
> with VRAM oversubscription. This generates memory pressure with
> multi-process VM Bind activity and concurrent submission, exercising
> the bind pipeline under eviction pressure.
>
> v2: Removed helper APIs usage clock_nanosleep and commented
> code.(Nishit)
>
> v3: Refactored code to smaller functions.
>      Added check for available SRAM usage and keep the max process to 20.
>
> v4: Remove explicit macros definition
>      Replace Bind ioctl with library calls.(Thomas)
> v5: Remove unused query_mem_info
>      Fix xe_exec_with_retry (Thomas)
>      Rename align_to_page_size with ALIGN macro (kamil/Thomas)
> v6: Fix vm_bind_bo_batch: move igt_assert(ufence) before first dereference
>      Fix create_test_bos: check errno instead of ret for ENOMEM/ENOSPC
>      detection, since igt_ioctl returns -1 on failure. (Thomas)
> v7:  Save errno immediately in create_test_bos before it can be clobbered.
>       Handle non-ENOMEM/ENOSPC failures in create_test_bos.
>       Remove dead code (retries == 0 check) in xe_exec_with_retry.
>       Add igt_skip when both vram and sram n_bufs are 0.
>       Add MAP_FAILED check on result_bo.ptr after xe_bo_map. (Nishit)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 423 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 423 insertions(+)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 408bfdb71..33eb6cea7 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -21,6 +21,7 @@
>   #include "xe/xe_spin.h"
>   #include <string.h>
>   #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>   
>   enum overcommit_stage {
>   	EXPECT_NONE,
> @@ -29,6 +30,69 @@ enum overcommit_stage {
>   	EXPECT_EXEC,
>   };
>   
> +struct gem_bo {
> +	uint32_t handle;
> +	uint64_t size;
> +	int *ptr;
> +	uint64_t addr;
> +};
> +
> +struct xe_test_ctx {
> +	uint32_t vm_id;
> +	uint32_t exec_queue_id;
> +};
> +
> +struct mem_bind_sync {
> +	struct gem_bo *bufs;
> +	int n_bufs;
> +	uint64_t *binds_ufence;
> +};
> +
> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance eci = { 0 };
> +
> +	/* Use first available engine */
> +	xe_for_each_engine(fd, hwe) {
> +		eci = *hwe;
> +		break;
> +	}
> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id, &eci, 0);
> +}
> +
> +static uint64_t *
> +vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo *bos, int size)
> +{
> +	uint64_t *ufence;
> +	struct drm_xe_sync bind_sync;
> +	struct drm_xe_vm_bind_op binds[size];
> +	int i;
> +
> +	ufence = calloc(1, sizeof(uint64_t));
> +	igt_assert(ufence);
> +	*ufence = 0;
> +	bind_sync = (struct drm_xe_sync) {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.addr = to_user_pointer(ufence),
> +		.timeline_value = 1,
> +	};
> +
> +	for (i = 0; i < size; i++) {
> +		binds[i] = (struct drm_xe_vm_bind_op) {
> +			.obj = bos[i].handle,
> +			.obj_offset = 0,
> +			.range = bos[i].size,
> +			.addr = bos[i].addr,
> +			.op = DRM_XE_VM_BIND_OP_MAP,
> +			.flags = 0,
> +		};
> +	}
> +	xe_vm_bind_array(fd, ctx->vm_id, 0, binds, size, &bind_sync, 1);
> +	return ufence;
> +}
> +
>   static uint32_t
>   addr_low(uint64_t addr)
>   {
> @@ -3073,6 +3137,360 @@ static void test_get_property(int fd, void (*func)(int fd, uint32_t vm))
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
> +			   struct gem_bo *result_bo, int ints_to_add)
> +{
> +	int pos = 0;
> +	uint64_t tmp_addr;
> +	#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
> +
> +	batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +	for (int i = 1; i < ints_to_add; i++) {
> +		/* r1 = integers_bo[i] */
> +		batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +		/* r0 = r0 + r1 */
> +		batch_bo->ptr[pos++] = MI_MATH(4);
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
> +		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
> +	}
> +	/* result_bo[0] = r0 */
> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
> +
> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
> +	while (pos % 4 != 0)
> +		batch_bo->ptr[pos++] = MI_NOOP;
> +	return pos;
> +}
> +
> +static void create_test_bos(int fd, struct xe_test_ctx *ctx, struct mem_bind_sync *bind,
> +			    uint32_t  placement, uint64_t *addr)
> +{
> +	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
> +	uint32_t ret;
> +
> +	for (int i = 0; i < bind->n_bufs; i++) {
> +		struct gem_bo *bo = &bind->bufs[i];
> +
> +		bo->size = GB(1);
> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
> +					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
> +		if (ret) {
> +			int saved_errno = errno; /* capture before anything can clobber it */
> +
> +			bind->n_bufs = i;
> +			if (saved_errno == ENOMEM || saved_errno == ENOSPC)

Can you point in which part of KMD code ENOMEM/ENOSPC is returned while 
creating BOs? In xe_gem_create_ioctl() EINVAL mostly returned.

Am I missing something from KMD side? ENOMEM is returned in bind_ioctl() 
in KMD.

> +				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
> +			else
> +				igt_assert_f(false, "%s allocation failed at buffer %d: %s",
> +					     mem_type, i, strerror(saved_errno));
> +			break;
> +		}
> +		bo->ptr = NULL;
> +		bo->addr = *addr;
> +		*addr += bo->size;
> +		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
> +	}
> +}
> +
> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
> +{
> +	uint32_t expected_result = 0;
> +
> +	for (int i = 0; i < ints_to_add; i++) {
> +		int random_int = rand() % 8;
> +
> +		int_bo->ptr[i] = random_int;
> +		expected_result += random_int;
> +
> +		igt_debug("%d", random_int);
> +		if (i + 1 != ints_to_add)
> +			igt_debug(" + ");
> +		else
> +			igt_debug(" = ");
> +	}
> +	igt_debug("%d\n", expected_result);
> +	return expected_result;
> +}
> +
> +/*
> + * In concurrent VM bind stress tests, multiple threads simultaneously bind
> + * buffers to GPU virtual address space and submit batch operations. This
> + * creates significant GPU memory pressure where the kernel may transiently
> + * fail batch submission when:
> + *   - GPU page tables are being updated across multiple bindings
> + *   - GPU memory is fragmented across many concurrent buffer mappings
> + *   - Multiple processes compete for finite GPU resources
> + *
> + * Without retries, transient ENOMEM/ENOSPC failures cause false test failures.
> + * Retrying lets us distinguish temporary resource exhaustion from actual
> + * driver bugs. Non ENOMEM/ENOSPC errors still fail immediately and are properly
> + * reported with full errno context for debugging.
> + */
> +static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int max_retries)
> +{
> +	int rc = 0, retries;
> +
> +	for (retries = 1; retries < max_retries; retries++) {
> +		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
> +
> +		if (!(rc && (errno == ENOMEM || errno == ENOSPC)))
> +			break;
> +
> +		igt_warn("got %s, retrying (%d/%d)\n", strerror(errno), retries, max_retries);
> +		usleep(100 * retries);
> +	}
> +
> +	if (retries == max_retries)
> +		igt_warn("gave up after %d retries\n", retries);
> +
> +	if (rc)
> +		igt_warn("errno: %d (%s)\n", errno, strerror(errno));
> +
> +	return rc;
> +}
> +
> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
> +{
> +	if (bo->ptr) {
> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
> +		bo->ptr = NULL;
> +	}
> +	if (bo->handle)
> +		gem_close(fd, bo->handle);
> +}
> +
> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
> +				   struct mem_bind_sync *sram_bind)
> +{
> +	for (int i = 0; i < vram_bind->n_bufs; i++)
> +		gem_close(fd, vram_bind->bufs[i].handle);
> +	for (int i = 0; i < sram_bind->n_bufs; i++)
> +		gem_close(fd, sram_bind->bufs[i].handle);
> +	free(vram_bind->bufs);
> +	free(sram_bind->bufs);
> +	if (vram_bind->n_bufs)
> +		free(vram_bind->binds_ufence);
> +	if (sram_bind->n_bufs)
> +		free(sram_bind->binds_ufence);
> +}
> +
> +/**
> + * SUBTEST: oversubscribe-concurrent-bind
> + * Description: Test for oversubscribing the VM with multiple processes
> + * doing binds at the same time, and ensure they all complete successfully.
> + * Functionality: This check is for a specific bug where if multiple processes
> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due to
> + * deadlock in the bind code.
> + * Test category: stress test
> + */
> +static void test_vm_oversubscribe_concurrent_bind(int fd)
> +{
> +	#define MIN_BUFS_PER_PROC 2
> +	#define MAX_THREADS 20
> +	/*
> +	 * Cap SRAM test usage on large-RAM platforms (e.g. PVC). On small-RAM
> +	 * platforms (e.g. BMG with ~32 GB RAM) 50% of RAM is ~16 GB which is
> +	 * below this cap, so behavior is unchanged. On large-RAM platforms
> +	 * 50% can be hundreds of GB; cap it to a bounded value that still
> +	 * provides meaningful memory pressure for the concurrent bind test.
> +	 */
> +	#define MAX_SRAM_TEST_SIZE GB(32)
> +	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
> +	uint32_t max_by_mem;
> +	uint64_t total_vram_demand = 0;
> +	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
> +	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
> +	uint64_t target_vram = vram_size * 2;
> +	uint64_t target_sram, total_vram_bufs, total_sram_bufs;
> +	pthread_barrier_t *barrier;
> +	pthread_barrierattr_t attr;
> +	/*
> +	 * Dynamically cap VRAM oversubscription so the overflow into system
> +	 * RAM stays within 25% of available RAM. On small-VRAM platforms
> +	 * (e.g. BMG) the 2x target fits within the cap and behavior is
> +	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
> +	 */
> +	target_vram = min(target_vram, vram_size + sram_avail / 4);
> +	target_sram = min_t(uint64_t, sram_avail * 50 / 100,
> +			    MAX_SRAM_TEST_SIZE);
> +
> +	total_vram_bufs = target_vram / GB(1);
> +	total_sram_bufs = target_sram / GB(1);
> +
> +	/* determine concurrency from memory pressure */
> +
> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
> +	n_proc = min_t(uint32_t, max_by_mem, MAX_THREADS);
> +	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
> +
> +	n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
> +	n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
> +	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
> +
> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
> +		  vram_size >> 20, sram_avail >> 20);
> +
> +	igt_debug(" n_proc = %d\n", n_proc);
> +	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
> +		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
> +		  n_vram_bufs, n_sram_bufs);
> +
> +	barrier = mmap(NULL, sizeof(pthread_barrier_t),
> +		       PROT_READ | PROT_WRITE,
> +		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +	igt_assert(barrier != MAP_FAILED);
> +	pthread_barrierattr_init(&attr);
> +	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
> +	pthread_barrier_init(barrier, &attr, n_proc);
> +
> +	igt_fork(child, n_proc) {
> +		struct xe_test_ctx ctx = {0};
> +		int rc;
> +		uint64_t addr = 0x40000000;
> +		int expected_result = 0, ints_to_add = 4;
> +		int max_retries = 1024;
> +		struct gem_bo integers_bo, result_bo, batch_bo, *vram_bufs, *sram_bufs;
> +		int pos = 0;
> +		struct mem_bind_sync vram_bind = {0};
> +		struct mem_bind_sync sram_bind = {0};
> +		struct drm_xe_sync batch_syncs[1];
> +		struct drm_xe_exec exec;
> +		struct gem_bo ufence_bo = {0};
> +
> +		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs, sizeof(struct gem_bo));
> +		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs, sizeof(struct gem_bo));
> +		srand(child);
> +
> +		igt_assert(vram_bufs && sram_bufs);
> +
> +		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +		create_exec_queue(fd, &ctx);
> +		vram_bind.bufs = vram_bufs;
> +		vram_bind.n_bufs = n_vram_bufs;
> +		sram_bind.bufs = sram_bufs;
> +		sram_bind.n_bufs = n_sram_bufs;
> +
> +		create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
> +		create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
> +
> +		if (!vram_bind.n_bufs && !sram_bind.n_bufs)
> +			igt_skip("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
> +
> +		pthread_barrier_wait(barrier);
> +
> +		if (vram_bind.n_bufs)
> +			vram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, vram_bufs,
> +								  vram_bind.n_bufs);

Here we are calling bind_array() and not checking any error return by 
bind(). ENOMEM should be checked during bind() call

> +
> +		if (sram_bind.n_bufs)
> +			sram_bind.binds_ufence = vm_bind_bo_batch(fd, &ctx, sram_bufs,
> +								  sram_bind.n_bufs);
Same as above.
> +
> +		integers_bo.size = ALIGN(sizeof(int) * ints_to_add, 4096);
> +		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
> +							  system_memory(fd), 0,
> +							  DRM_XE_GEM_CPU_CACHING_WC);
> +		integers_bo.ptr = (int *)xe_bo_map(fd, integers_bo.handle, integers_bo.size);
> +		integers_bo.addr = 0x100000;
> +
> +		expected_result = fill_random_integers(&integers_bo, ints_to_add);
> +		igt_debug("%d\n", expected_result);
> +
> +		result_bo.size = ALIGN(sizeof(int), 4096);
> +		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
> +							 system_memory(fd), 0,
> +							 DRM_XE_GEM_CPU_CACHING_WC);
> +		result_bo.ptr = NULL;
> +		result_bo.addr = 0x200000;
> +
> +		batch_bo.size = 4096;
> +		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
> +						       system_memory(fd), 0,
> +						       DRM_XE_GEM_CPU_CACHING_WC);
> +
> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle, batch_bo.size);
> +		batch_bo.addr = 0x300000;
> +
> +		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, ints_to_add);
> +
> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
> +
> +		/* Wait for large bind operations to complete before binding small BOs */
> +		if (vram_bind.n_bufs)
> +			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, INT64_MAX);
> +		if (sram_bind.n_bufs)
> +			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, INT64_MAX);
> +
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
> +				   integers_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
> +				   result_bo.size, 0);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
> +				   batch_bo.size, 0);
> +
> +		ufence_bo.size = 4096;
> +		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
> +							system_memory(fd), 0,
> +							DRM_XE_GEM_CPU_CACHING_WB);
> +		ufence_bo.ptr = (int *)xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
> +		ufence_bo.addr = 0x400000;
> +		memset(ufence_bo.ptr, 0, ufence_bo.size);
> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
> +				   ufence_bo.size, 0);
> +
> +		batch_syncs[0] = (struct drm_xe_sync){
> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			.addr = ufence_bo.addr,
> +			.timeline_value = 1,
> +		};
> +
> +		exec = (struct drm_xe_exec) {
> +			.exec_queue_id = ctx.exec_queue_id,
> +			.num_syncs = 1,
> +			.syncs = (uintptr_t)batch_syncs,
> +			.address = batch_bo.addr,
> +			.num_batch_buffer = 1,
> +		};
> +
> +		rc = xe_exec_with_retry(fd, &exec, max_retries);
> +		igt_assert_eq(rc, 0);
> +		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, 1, ctx.exec_queue_id, INT64_MAX);
> +		result_bo.ptr = (int *)xe_bo_map(fd, result_bo.handle, result_bo.size);
> +		igt_assert(result_bo.ptr != MAP_FAILED);
> +		igt_assert_eq(result_bo.ptr[0], expected_result);
> +		cleanup_bo_resources(fd, &ufence_bo);
> +		cleanup_bo_resources(fd, &result_bo);
> +		cleanup_bo_resources(fd, &batch_bo);
> +		cleanup_bo_resources(fd, &integers_bo);
> +		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
> +		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
> +		xe_vm_destroy(fd, ctx.vm_id);
> +		close(fd);
> +	}
> +	igt_waitchildren();
> +	pthread_barrier_destroy(barrier);
> +	pthread_barrierattr_destroy(&attr);
> +	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)), 0);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
> @@ -3486,6 +3904,11 @@ int igt_main()
>   		igt_assert(xe_visible_vram_size(fd, 0));
>   		test_oom(fd);
>   	}
> +	igt_subtest("oversubscribe-concurrent-bind")
> +	{
> +		igt_require(xe_has_vram(fd));
> +		test_vm_oversubscribe_concurrent_bind(fd);
> +	}
>   
>   	for (const struct vm_get_property *f = xe_vm_get_property_tests; f->name; f++) {
>   		igt_subtest_f("vm-get-property-%s", f->name)
