Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934F9C43458
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 05:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B58510E27B;
	Thu, 16 Jul 2026 05:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/167fqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F4010E27B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 05:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784179466; x=1815715466;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DvgE/W8LsRBGC7cgEYhUFrzPuEf+6Ayk5bEylSTEfK4=;
 b=X/167fqTWIIu/YyUhoLpXDceRihHmwqP326Qhoj7kf6bK+GDqV3+hFaV
 /xh+xqkjo4vS2pxEBQz7To2sydDvF2dUSXgBU1+5muSpnFNO+sR1DXOer
 U1scxMjJVDTHCKXPQ/f/3QVd6xmany7KjMTLZ0DdR+O7Cjmds9C72sSrN
 Nlocvr3fLUF+8QDaVDApeGO/A2Ba5JuLZIZp1RdLcb7LHui132GvvqIfc
 ZjyNTuxdZJiSZOLvDel+m7lv3YcSbrjpjt1mnHkfbhYD4QNsLMF+h0BzK
 12ORlVWW8f8ttrUKjEBR2mSrCrZGXu7fba6gjoI96SalfOh41UPrP1MqV g==;
X-CSE-ConnectionGUID: fF4qthiqTp+VgMM6MPBRNQ==
X-CSE-MsgGUID: 5hIRecxWQm2Dr4IR8zZWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84944367"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84944367"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:24:26 -0700
X-CSE-ConnectionGUID: J1OzjCRTQme7GgT24K9leg==
X-CSE-MsgGUID: BVy8vv6jQO6LupKldXNPzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="253764872"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 22:24:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:24:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 22:24:25 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 22:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0qWhzH9Pb0pqS/0akRaODJhvVlQTEdr1VMfXi0jl9cJDqf0zQzzrh6uuo93T1qzJ5AS14QjO8YU+8lRbXG4HiK+eNDhSnC273RN4gl38Xv326HuSNfEJDn2QIC6/FK6ILnBk5OHOWIOPWGYwQ39OkbO8iDpqnxrpk958BmjCHJ49qA1Nf+UybBjpoItl/knIT233/PH3tqDDAcy4SRqWsiX16xiQrdKJA3Q7Pgwq3bBnxiZHpduMAqL0DqMwnlgTKIHREP4voZCyz5zxAe6vX9oF4pH17sPZXI469oZyDbyvcCGc9YGtmIVzu1ePQAuSJHWDNBLJgTOsQA9CsQglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ap6zjdE84SFHXXJqD6C62zahpHmIzG97PeLMj+xjmMI=;
 b=DoyrEH1B+vP4JujOuaU7xdwlwwU9xQZokABNf8ZLrgDR0WTxxsE6E0rZMuvPix+duymmInQImLoseFdEM9ZvK3zHJ88LYuVxLbkEQIyKBHaTkUpbRTlKmkTagIHVIE56JdGgnuUsLor/mzizJZxm4gdU8gAjlo5k+WdCtNiC0t9fEd03+DPh3g33i1kGjUlptw5S5rDdlA4wZJaXygBWDACqqxSPcK6JDULXSg/aJioRdf/LJt52/Z4KzffzZs3S3/MMS/KTYqKAUc7LD1Gikr6OyKQWHCCYAYG7Xph1TbTQgk3jubA0ENNBtAwh0alBw9RIQBnor30UcsQmcpYRcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 05:24:16 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 05:24:16 +0000
Message-ID: <b08a5b96-a284-4cc7-acb9-91a4f1ef123e@intel.com>
Date: Thu, 16 Jul 2026 10:54:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_joiner: Fix mixed_output subtest
 skips
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20260708075822.96872-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260708075822.96872-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c93cb4-6ad5-434a-011e-08dee2fa7ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|42112799006|1800799024|376014|366016|3023799007|10067099003|56012099006|5023799004|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: xOTU9+z4iTvEfNggb2EYKKghITi23R4HBdHDyynjP/a51aa2GoARgys7i5H4tctlk53K5palarV2jVL5h7Nv13ggSxI7kNnwmalGB94eiBv9eBHVZY/OZbn9n2RTaftKplIyhNL+1CdGLSPRVOiZEnqZh3GQSmHdrp7KdyqGaawktHXfgxgkRebjXBpHEaBx7ra0PpMRyJs5ZjZRZ3adg7p6WAG5EXTV5q6PVyzWO3Ls549qBIbD8bM74vLrEFpLB6TwZA8OBXKK6J2zLvKEc6k5eEJS0FD45y1g9nNIEddx9XtZBQBvOa32/+yILBSMGvHySztb4d/w0aRDXE5Bgz1o7Te0URIua3qgPXzLFKsOcW1zHPowpdyysRxg4ckdDXswnoqt0iNzy289YUnQhDixdLHUZ1516hpPWG1wX7mbxlW1Qq3ifQCVTqIUh6uB+6lbdvw3kpzEDpNxfn5vhE3I3FDLbU5bS9BK5CwwQdD4lNnw04rv5sYQ6i4dFRa8f2du/dV+Heo911HQ6qxVPJRKukM55EnJP8Xm0aoL0gQ3XOhjg0+Ygg3jYp+HuaHaNd1K07I7CPfJiezJnALxnpIHMV/nYb3VFLFxq0dgEkQH66dGrDps4W7ibAfpVqjdPz/2xwdnjO3VTyoCUz3Fw29iuYoXDUhmXeGuNgRRlkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(42112799006)(1800799024)(376014)(366016)(3023799007)(10067099003)(56012099006)(5023799004)(22082099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVlzWDdqL01nblYvanlITTBudUZHV0xZU3NKNTZjRmhINUJQclNOOEVUQ0Q5?=
 =?utf-8?B?dFlIRHdLbnl1NTBKL3VUN3ZOb3FYTnF0N3dpeGRrc1lmRDhPdTFRNlJxcnRp?=
 =?utf-8?B?TExLMEpPU0wzK25sYzFsQ0JTUXU3UWJ1RG92ckVnMER1R0x5Yk8xREtGUUZY?=
 =?utf-8?B?OUFnalM4WDluMTZYdktOV3gvWTZQcTBWNWpYWXJvbksyMFhaNEV5UnlzNjF1?=
 =?utf-8?B?dVhMbnk0bzFsUXYyc2tIVG9GV2ZUcUVHeVFSOHIvdG9nZVRnUkRma0RITS9v?=
 =?utf-8?B?YUh5Y3ErbCswalRkNmNzNCtCYkwzYXpuMGJtejFBTGVSRTA2NXRrTS91ckVa?=
 =?utf-8?B?dkRjQTBmb1kzNnRCbkIwbnlGbVdrYmwrdi8vV0pMV01NZlQxWWhVWTN0UmJD?=
 =?utf-8?B?V1RiWGpMaTRweEdZOXcwYXpvay9QdDByT1ZyMHExQWs0YXhuNnpUcHRnYUY4?=
 =?utf-8?B?Z2kyMkRjZmEvaEJmWmpXMnpqbGdTQ3F1MEpuYnZhK21VdmdZQ3VNWlBFWFV6?=
 =?utf-8?B?RWtKem84WTJ3L2lLOXkyMlRoaXM4V2FQejN1NXVSZjJNbm5YbXU1R25yb1l4?=
 =?utf-8?B?VCsxS3h5SHdzcU9RN01oRjNDbUVFVTI5MVJtOHg4L0dNbnhOSnBHZGlZZmgy?=
 =?utf-8?B?UWNzZldiR1Bod0l4L25aRTF2MnY2aUd3UWZVQXBsZmhLSzlsV1RFOGZrVEdR?=
 =?utf-8?B?VWZJdWRVUE15bmt1Y2pMbkhLQTBXVDZpUG8vUlhnTkpBd0g0eTJrM1hiVU1k?=
 =?utf-8?B?QXN1WUpCSlptaUdmU3Bob2d2YWtBbGV4OGdrdXR2QUFpczVWK0JJVS9iN2Z5?=
 =?utf-8?B?R01RaUZBNTRQanhESURrYkRNcVN3azh2eE83L0l1K2ZDL2M2bE42MXo0V01j?=
 =?utf-8?B?dURuZTd5MG1ZUm4xSnNXWVRRT1h4RDJWYkVUS2xLeVRVaHQ0andoTnFsQzZD?=
 =?utf-8?B?U3JuT1RyQzgyVU5uenNHYWU4WXZMVE1SRUN1NEZDenRBVjl4YVQwRy9OOGpN?=
 =?utf-8?B?b2tjTjBlNlhoNkcyWXBnRGc5enFzOVFuZitGZW5jTmk4dnBmUS80TkpTeXhv?=
 =?utf-8?B?Y2krWnN0dC9PV2JzT0dyT1YzcGRzWjJrd1Rua3lHSmdEaTZEaVNjb3JZNDJ6?=
 =?utf-8?B?YlA0YzczMm1ncTZTb0VFOXJGeVdHWGl1M2hJazlldmViWCsrWHZlN3ZTMDVr?=
 =?utf-8?B?ZEZMRTlOQmQxTzhVRlVDZHJUaVdlc0IxR01WbmE3eCttL0xremJCSjlGQnZ6?=
 =?utf-8?B?YTNsQWxCUTZJbm1NN3lrbFN4VnZvYUZhcFdRM0JzZEMyZEFGRkNISERxQUJL?=
 =?utf-8?B?enNza3BYWitxc1BySjc1WkJwMkFnbEQ5dERaS3BGVnVVUmVrak01SUc5b0dR?=
 =?utf-8?B?d3VNaTlXRWlTcVZKWUkyTFhqeGVsUmZhak5CVHdqMkdGdk5mbXNSVndhaEFW?=
 =?utf-8?B?YjdSUkk0eEdVbGE2K0s5cVVYSnZhbThORjEzaS9MOTVVclpzTDVLQ3ZsVHF4?=
 =?utf-8?B?TU1NSWJTSDhTZWlUcFA4bHEwalpraWdUdUdhYjlockFWVk5RZTBobDJQYzd0?=
 =?utf-8?B?MmVBckZpQkpxWFI1NmlUNXlLSzF5Q1BNTGRiYS9IZTNFMTFpN2YvVkdSbis5?=
 =?utf-8?B?Y3hyWXduTTNqTVl4a3MvUGphK3JUUTRNclQwSUhXVUFDOGJJTjkrSTZpY3o4?=
 =?utf-8?B?bFVFVHBGcFUxSm51QWdkMmJsOEJZWVJnUEQvaWxQUkVvMmlrdExCbElsVjlR?=
 =?utf-8?B?V3NaUDYxNi9Dclo5ME5NY3lUWno2d0I1SXlmY3hJUmdZb2JZVDFoWWk0U0pO?=
 =?utf-8?B?d2NaWkF5KzhweU5pTEUreDFNb1l0emt0d0pQcWJPWDhqNGRWVXNXQU9QenJJ?=
 =?utf-8?B?WGRvbTdRRjZtVHhmaGpnblcvYTlBeGlEcjBvZXp1NkVuejZyRmw2QTVUNW55?=
 =?utf-8?B?TCsrckw1UER1eVMwc0xtTHV5RDRFd1VJNVhDM2ZEVldTRDBvQkd3VmNCYWlx?=
 =?utf-8?B?Mnlqd0N0VnJCS0hvaEFjWjVEZ1BxVVFha3NCMmprV1I5Z2sxMWJKWGhvWGpF?=
 =?utf-8?B?Mjl1SVhkRWd1U1BZMFdqa2VhSENkQkgwSHdvOXM0T25YbEVpUmdwR2kxUmxa?=
 =?utf-8?B?NHg0MWFuelEwMHdzSXp0TE44aHo3aGcvRzdodkw1SU5BU0lPejFUeGx4WnFn?=
 =?utf-8?B?dEdQbXpUYUx6M0NJdVNVN0RiYkNSSndUSjduY0QxZEE4K003dkZpcWNpd1Jv?=
 =?utf-8?B?d3FrV1FLOHdyRmFvZXVKSldKeWNBd21BNDAvR3Q0ZXVlOTFuby9DYitVYitz?=
 =?utf-8?B?UVBSc3BOWFEweVhsZ2JUTkZ0bkNVMitsU3Nwc3R3ejZLMURXUERWUT09?=
X-Exchange-RoutingPolicyChecked: FQ5qRqWf7IRuvaE8xXbFyEvO6/2i19/TszQ1J0HmWzIzkeUFVQIDYJb/uQwrEpmhCwcgc6CMBL0Qh1nKG+aUWRh7TZWDXtJ4h0nDe+yduY6Ax319ksN3YbmVLEuhHyleTNoLBi+xYP8tl1gC9pl6ts07fiu7zduF6lFVVDjV7BbAuPGtSM8efd1xt0kFJuVzV0i431VCvq21pMh/3zWI+6890rBBHodmZJtHSSJ+0OnDQ0Nyfa3pKSV771tqJpMQcObBmyPX3ZaAflVLVg5QeG2fub69VHe/8xHO/razSTmq6AtFYgmUIxOqMM3IrsfZER8eraH4yYz8WyHV+qSY0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c93cb4-6ad5-434a-011e-08dee2fa7ac7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:24:16.4627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38HGllCzckAQKgMOKJxQRejF89byCTnK+rAjeL53WcNC6nlSb7Yenr/uW4zJGdsrqj8K96rI6pnx8yCuDT6HMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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


On 7/8/2026 1:28 PM, Santhosh Reddy Guddati wrote:
> In the mixed output case, mixed_output[1] is a non-big-joiner output,
> but bigjoiner_mode_found() was unconditionally called for both outputs,
> causing the subtest to skip. Only require a big joiner mode for the
> first output (j=0); the second uses its default mode.
>
> V2: Split compound statements by replacing with variables (Karthik)
>
> cc: Karthik B.S <karthik.b.s@intel.com>
> cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index d26eb3b01..dfcb24004 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -382,10 +382,17 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>   			igt_crtc_t *crtc;
>   			enum pipe pipe = data->pipe_seq[i + j];
> +			/*
> +			 * In the mixed case only the first output (j == 0) is a
> +			 * big joiner output; the second is a non-big-joiner output.
> +			 * In all other cases every output is a big joiner output.
> +			 */
> +			bool is_big_joiner_output = !mixed || j == 0;
> +			bool needs_big_joiner_mode = !force_joiner && is_big_joiner_output;
>   
>   			output = outputs[j];
>   
> -			if (!force_joiner) {
> +			if (needs_big_joiner_mode) {
>   				igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
>   							  "No big joiner mode found on output %s\n", output->name);
>   				igt_output_override_mode(output, &mode);
