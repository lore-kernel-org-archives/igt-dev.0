Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CC8C54E64
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 23:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B30112887;
	Fri, 22 Mar 2024 23:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTvVFU9R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7DF112887
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 23:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711149508; x=1742685508;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=yDCFa6/H6k6Lzgpn7IsFssg1yyDZPPv5ZpdViM1bUsE=;
 b=RTvVFU9RPfXeq9cjlWDux1574QWV32Nu1Bf8HqYyiH1B9Yz3upqMs+Tf
 iiAWRrZnkcjuSNIExed2qDnUKhpvpz4szhaIKTUyIwECxJRj4US0FV0oV
 2GFpinja1vg822BuBN/kcbSQUhfYqaC0R2UXbwylPbsLri4m/OB1GoV9C
 RoNTjiizMVgNwxpvj8haG9ViQfrNZpjeM1vqVb6X7DXEV8CX3mXvHMEMC
 rTmgUAYdffBSiUE2uNflrmf8I21iKu4DNbvtNAi6Tjl7nMP24Z7FefMbS
 slvg+lJn5/SCXucb40nMm+wxUhCvrRuLhXNlkDaleZ5dUdPGQElwqUjSo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="10005595"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208,217";a="10005595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 16:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208,217";a="15474583"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 16:18:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 16:18:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 16:18:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 16:18:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 16:18:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5+GTppNK8sI8d6ywWT8YQSjLJGMyNUZTzYbcZ6Z6eHDRFHUIpgRqV6deKJokEczdxnK8aiMSFtTtQMsUu8w32PLD6TzdzG3dTWFS/0XM1IfXgCJTNy1PTC7AK9JOactc3mfyw8xcA4SqzBS+NSXk5Trsa+T/Dxa+VvnO/9o0uTwl2qGRlJl7sujopsVAI1BG+gL/1lHK1Hm8PYyoQhil6hQ8NtX0wQk47BEluNzM1/y+NewR4yFM7gKYS1QgvsccnTZIO9QdC7ncsX+XFNCNfgd9YtAGoVR1EOyeY5QdXcxYjDIWCRWAbjA55bbeJhsyORlk4wQnW13xcuDQmpwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KRIb6DY8YOAyn9LUrbaLfDtPQL9aRRj+dc3FR21I64=;
 b=m12bVpM2bP4CDLaDEGtZv51meVJgEJ4IqK5XjJUkifsAtIAppYS2QlHi3ad5iU0UMZxiut48E5nNkk0Ub6Exhk9Vxad9g9UWxgWkJxSq/sjvGaEgTlomuEPHlwHK//+6XHBnBaP3RC5x31uXLptOTn6V53Qloj0zW5DgVscdV8ab2B/RiTXwddjX+/eC5dkdJ5+cO1InqV+qcbSVNkchb1/Z/wC99/pB/Bp98O+W04lRUCc3es4VI9VsRrH702XTKLPKVe+BTxGiiIrTfTR3kHQIDKJJF+5+jrPM/ovnUeZfAiZMjpPCEB7RmEPi27NQXvvj0VIod/TldJgVHLWUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.24; Fri, 22 Mar 2024 23:18:24 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::57f3:87f3:884d:2c32]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::57f3:87f3:884d:2c32%6]) with mapi id 15.20.7409.010; Fri, 22 Mar 2024
 23:18:23 +0000
Content-Type: multipart/alternative;
 boundary="------------ptVdPSHpijg0yFCb0c0HuS0Z"
Message-ID: <ab0782c1-5694-4e28-a9ac-ff71ded025bc@intel.com>
Date: Fri, 22 Mar 2024 16:18:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_vm: DRM_XE_VM_BIND_FLAG_DUMPABLE is now a
 valid flag
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240322205327.850864-1-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240322205327.850864-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5305a7-4416-438c-af17-08dc4ac65ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4aPyt14LDmqW8l9IThowLmWhRXmtYkmU6/9VA33l8dXC+jggiDzdYGiHBcZwxo6cU5F/SPKDpFOGRD8fzmaeH595YZakjdMTf2GpoiPqIqk5PGOv5gfqcVFYJLV6DCX0n8elFnt/egJXeiDypc9E/OasM8SAepNN6rQlTWEw5c/b3Cnnmaf/bT3ZxuEzztQ0HZwzTofNvS5CC9QqcXUSCcDEiWT9g4VT65nsiWUPQADdhSuRYW+k1TTuWkwkEq6RGde24M1btqCDMNC3c5H8lCrzAiFzGoV+4quJgvf+68RbTJ+NTYc724ibuiZ2p0zcuM4eAPXsFbrAJhYZ3HK73riIFmqeRxH8PFX/Hnt1PCGmzjuhGHmmuSVjIfpDBjI2UjhX2dwcL+2aBs6zpwN8wIC7AVgtqbzMuOpklcYbL06TycOYdEm5k6AWOUy5cfCFj3tSGqA4HiDKQtnjUU+D1Ok2AE5173ZYpNQAW3YsH/WaFzUwXYMs8PtF0altH4FxCNV96pQ90LPZYPdWgW5Pn+SpNdQ+22rLcntamZW197/ivHIrlNEao97u+uf5BKHj+SBmJcvusgX7LcCxDJqr8JcWsFihTG/ISWVjBJHVmY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpNMGRQM0ZPd3ZTRmRMQncycFV0LzFlRXh3M3BXanlndFRjSnJDai9OYlRZ?=
 =?utf-8?B?Y21hYklQMEw1LzVDSWZRMlNPY2E3Zk5WeVFXdXN4V1hPckdWM0lkK1R6UXd2?=
 =?utf-8?B?ZjZFYm8zcXZTcmtCc2F5TE5BTmR4b0RqcUNHOUhJek50UU1xSTdLd0dwM2hL?=
 =?utf-8?B?bHBDU1NVR1VjSWYyU3YwNzg0N0xMUEVvWVJEbUNydlZEUTUwc2JveUxhL3ZQ?=
 =?utf-8?B?RllROS9YV1N6YW5ZYitZY05BRWFQcXVOSUZyb0ZlMUtwOVJUb1c4aDR1Rmph?=
 =?utf-8?B?WHlWdEJOOVBSRVJLckhQU2dqb0RzY1diVy91bTJkSnc4eFJINDNIUE53cFo2?=
 =?utf-8?B?d3Z5R1EzcWsrK1MxM0p5WW84OWNURkZNVzA0UlVBTmVxRWJOK1d6NkJxbWwv?=
 =?utf-8?B?L1ZyTWVkU3dJWWk1MThRandkZXE1Y3c2WVRsWVhHaXJ3VWdsMFNraTh4MWRw?=
 =?utf-8?B?KzFhZjAwRTdGTHd6cGNuTVZiMlZLMUtIbExKMVM4Um02czNxOGNEb2ZBMXZj?=
 =?utf-8?B?cW1DbDZZallJdFdhVW43MTRhelgrbm5XdFF0ejNpd2lVUDBmWWFKVis2eE9n?=
 =?utf-8?B?UzlUMDFaNzh1ZFdVMVJ6ZzVERm1mZXJnTWIvRHR0ZGJBbjd3SzZ1SGtxM2hF?=
 =?utf-8?B?VERrb2pMb2IyanBMN2gveWRyV25NU3ZYZW5icURQYmtpV1NCRFhIZEYyZ3Ex?=
 =?utf-8?B?OFkrVVBzdDRoN3hJN203TGh6eExCUnpyQzhCMG5RaHVsWE16eUJKMVEweHBV?=
 =?utf-8?B?YzBPc1BaU2w4NE14NXdoZ09ROGczZ3hBTXBKdlVNOStNZUFhZmNkbnUvRkpr?=
 =?utf-8?B?OGo5bUVSeWcybHBHc2hTZll5eExoZmFSTUNDU3NpVTAyZFp1VXVZdHhPNWdG?=
 =?utf-8?B?QWU4cEFSWWtzdDN2Q0dwbVlnVFY0VWUrY0Y2aGJzUkMwV2RHeElPNkR1M3Az?=
 =?utf-8?B?SjBVYk00VEpJVW9QRHNyUXA1Q1ZObW03ZysxQ1NSaFVBdGZFeXNtQzMvVWVD?=
 =?utf-8?B?NHRaR3BHM3dhanJSOU5EVGhNZ1k3MUNvWTNwZC9hSGpwN0QvNCt0K2RhRXpU?=
 =?utf-8?B?MnNCTC84REw2MFpVQXBrQnNLWnJJWXdYUWo5WmFFa283SUtVdXdHR0xtUzZ5?=
 =?utf-8?B?Z24wdDg1a2NSQ0VTSDV1U0pjS3V4OGRHRlpmUHkvR25lcm9neVVhSWpkdW9L?=
 =?utf-8?B?WHQwQnBzb1ltZHJ3RFVNdjVzQWdwMHFaQUU1TDR2ZjBSZHhzVHdBaU5SS28r?=
 =?utf-8?B?eVNYemFCSm1KcjhBQVlXaURvdVJDRWRuTDdWVXhDK1lJWWI4Sm81bE9FK0c3?=
 =?utf-8?B?VHN2TmlKZDAwRk9Da0RqMytjT1RHOG9VMFBaU2JqYzJ5V3Zlb21QWWlIUFBB?=
 =?utf-8?B?NnFweHAzYnY0MmpwbFFYdzEvbXdWNVRtd2FyU20rdC9nTktJMnBzZmVLUTFy?=
 =?utf-8?B?NkljYUw1c2NOd3YvT2hkSmdBK3hhaTVHRTF5N3Vmem9wU3RJR0ExVCtmUnV0?=
 =?utf-8?B?U2hZNU1hektLMWozREVaSWhFS0VSWXFmNVMwNEp5VUtEeU15L0dsYnRDTkNr?=
 =?utf-8?B?bXl6WkNCWjZYYzFoRENvNFRUa0ZwMmt5TjJVVWsrZ3l5MzNxa0pDODRENk5U?=
 =?utf-8?B?amhNK3ZQMDJRTTQwMHJ0dlJhYWE1WFhPdXp3K011SktHV1FqNERoZVRVdTEz?=
 =?utf-8?B?aFhxZWZ1NE8wTXJkM2hXZld5QllDQnd6NmZWZlZyZC9rY00yL1JqbGZtVmIx?=
 =?utf-8?B?MGdyMUVEZVpiRVBVTHJMTEdZaXE1bVk0NEpEeVhrbWdwSWM4Q0ZHZ1dib0Va?=
 =?utf-8?B?S3h4bTZIMXArUmt3dDJuNlF4b3V0SzRZRDFlUXVVTXlVN0hNSHNUSEhTUXJE?=
 =?utf-8?B?T05zS0ViZkFIa3lKcG9telRKQ1Y3UXN6a2E2b1ZSdjA3TGg3SjRNMzZLNS9E?=
 =?utf-8?B?MnJvOVJYYjFBU3FJb1pEOTRxVDF4RGFVaC9tdGJkQnFyVmc5YlRCMmprTzBk?=
 =?utf-8?B?TUJxVEZiV0oya1o0RkFnNEpuZDdBYWo2V3BiVmtFeHZ0ZlI0cnVTcnFsNXQx?=
 =?utf-8?B?ZUNzRllBQlQrSGk4c09ZMi9DR25LbVJEL2NKcE02dFZ3Q0VoQkdJZC9wVE1P?=
 =?utf-8?B?T2kreUZzWnVIWnQzdEpGYkNEZDVJb2xESXQxdFUxVDFNbUNyU2lua2ozOHJB?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5305a7-4416-438c-af17-08dc4ac65ef9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 23:18:23.8380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i/ynRM02llik7Pdgz8NV2dfPWEv5IPrTy4Sw/MxkB3Gw+U8n+AkxZm89kSGcYYV3V+Gt2ydvuTb0CHLglAmaYaQ+DoPIic2ihX7N8BC0LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

--------------ptVdPSHpijg0yFCb0c0HuS0Z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/22/2024 1:53 PM, Matt Roper wrote:
> igt@xe_vm@bind-flag-invalid should no longer consider BIT(3) an invalid
> flag and expect failure since that is now used by
> DRM_XE_VM_BIND_FLAG_DUMPABLE.
>
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1285
> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
> ---
>   tests/intel/xe_vm.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7c061c497..00c428bb5 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1805,6 +1805,11 @@ static void bind_flag_invalid(int fd)
>   	syncobj_reset(fd, &sync[0].handle, 1);
>   	bind.bind.obj = bo;
>   
> +	bind.bind.flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
> +	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_reset(fd, &sync[0].handle, 1);
> +
>   	/* Using invalid flags should not work */
>   	bind.bind.flags = 1 << 0;
>   	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> @@ -1814,10 +1819,6 @@ static void bind_flag_invalid(int fd)
>   	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
>   	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
>   
> -	bind.bind.flags = 1 << 3;
> -	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> -	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, EINVAL);
> -
>   	/* Using valid flags should still work */
>   	bind.bind.flags = 0;
>   	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);

This patch provides a partial fix for VLK-54352, and together with my 
patch it solves the issue.

Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

--------------ptVdPSHpijg0yFCb0c0HuS0Z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/22/2024 1:53 PM, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240322205327.850864-1-matthew.d.roper@intel.com">
      <pre class="moz-quote-pre" wrap="">igt@xe_vm@bind-flag-invalid should no longer consider BIT(3) an invalid
flag and expect failure since that is now used by
DRM_XE_VM_BIND_FLAG_DUMPABLE.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1285">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1285</a>
Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
---
 tests/intel/xe_vm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7c061c497..00c428bb5 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1805,6 +1805,11 @@ static void bind_flag_invalid(int fd)
 	syncobj_reset(fd, &amp;sync[0].handle, 1);
 	bind.bind.obj = bo;
 
+	bind.bind.flags = DRM_XE_VM_BIND_FLAG_DUMPABLE;
+	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind);
+	igt_assert(syncobj_wait(fd, &amp;sync[0].handle, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &amp;sync[0].handle, 1);
+
 	/* Using invalid flags should not work */
 	bind.bind.flags = 1 &lt;&lt; 0;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind);
@@ -1814,10 +1819,6 @@ static void bind_flag_invalid(int fd)
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind);
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind, EINVAL);
 
-	bind.bind.flags = 1 &lt;&lt; 3;
-	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind);
-	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind, EINVAL);
-
 	/* Using valid flags should still work */
 	bind.bind.flags = 0;
 	igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &amp;bind);</pre>
    </blockquote>
    <p>This patch provides a partial fix for VLK-54352, and together
      with my patch it solves the issue.</p>
    <p>Reviewed-by: Jagmeet Randhawa &lt;<span style="color: rgb(50, 49, 48); font-family: &quot;Segoe UI Variable Text&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><a class="moz-txt-link-abbreviated" href="mailto:jagmeet.randhawa@intel.com">jagmeet.randhawa@intel.com</a></span>&gt;<br>
    </p>
    <blockquote type="cite" cite="mid:20240322205327.850864-1-matthew.d.roper@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------ptVdPSHpijg0yFCb0c0HuS0Z--
