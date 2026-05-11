Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A61CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 05:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA8510E127;
	Mon, 11 May 2026 05:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsIhNP0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBF110E127
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778477518; x=1810013518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nhZ1yXUsAV3BrM02fpFvMFCvk4fBtfayFHXvybCT54o=;
 b=SsIhNP0Sw0Q07EOOBpXJbEDnN5uBxmTRhqqgd6ZNa9n61FOm7aXc1XN1
 9kTqt1s9IfewdRq011EhJd6Efcymj/LMWaPsenfZjYeGwYow+XEIl5T9w
 ZI9DKzgsL22e6/IfffQSsmAL6v1x2tMYheKYCeOlnOtfNr1+BwyVYBmtO
 l8KqRzchmlQS5QA4K8O+j/HvjnkWLtQpXg1c93Y5Pe6ovtFSyUX6MIqk0
 7EvvFxGXqCr9mnV+ngw2P3vll7ipZw/a78LKuZZTjfyuOvW+ZX0CKEEvK
 wzU9DHW5vMcsEyCfA2cY7EuYZLIeqmTk1VREy14YPkpGQ88qdxUrVC1tY g==;
X-CSE-ConnectionGUID: c/whbKvDRzqg/BzhQ7hLDg==
X-CSE-MsgGUID: XRTXXCFASmGhDhnSkEzHFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79081123"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79081123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:31:58 -0700
X-CSE-ConnectionGUID: I/U08hpbSBKpqr8n8VZiPQ==
X-CSE-MsgGUID: axoaA6G+QvSEy9plSbJHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237581405"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:31:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 22:31:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 22:31:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 22:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUZeO57SY+UVvxAcstjHhUZ2EAaAezhef3Rb3zjZKkRFTM/TFIw02qrBmB1f5wo7HgJ4Uals61cdP3+uzg+ohor3Kuii1pwFbwWxfg4meDRM0A94+T3gVU0d0tFaa/UndBgTyQUNGQJo2jrjBolNF3VG14nLQlxAtHh7a5YC0hRR4+bacWxyKXxqYS7lWF7vEMNm6Be282r+K5EkN5ILuP6FTfdpzsX5/I8b8fWFlxm+cKtETrc25+hncdCXycJlgou930nK3UkQ8BIaJlz+D8g25+5GJ0cNwobZUcOylbU8WAnisA7KFA4mKfxHz5Azg55+idlrnRJMa37PZ4vhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bh/89NSEPArnCPujPntMH331GBKNn3Zu7pe3rzl40Y=;
 b=mHvxTEymwESeek1nz0Z+wwG6OdfV9EzLlDzmwRYdR5ptWs7SLaOmAJf9x0ANQi8VwoiW3SsagmPlQ117bpJT39KtuhQYnozzyKu+2/u3DBIElyjFrUwLwhiE7rjRx84rveBLustCc/sGViVmU0n7Xfzwze4t54+RrprLVrofsPBwaDbByHPzUlZKuRdOHpSheWSSMM8JMO5aI6pn100xieZ5eaBTe9s/wIbpxSRJtYnPABlN5KdYwPsGQKxCpcuCk3tcwQn58nl+Cdc3TLmwqI4h7qJpNYKEv5pyTkzIah/tJL7CB4jBPJPB8U+0gpWis66RKD/sPYkd9lyytyQ16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 05:31:49 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 05:31:49 +0000
Message-ID: <4336b790-8eac-4308-b430-72b215c3d293@intel.com>
Date: Mon, 11 May 2026 11:01:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_madvise: Add partial-unbind-dontneed
 subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260507060335.3397890-1-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260507060335.3397890-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA1PR11MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: e985328b-4695-4424-e1e1-08deaf1e9962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: JN9FS2vtIA40nxoToZm7CePvb6Weei4s0O434xtAja/Kk9w8RHpgDSQu2h23XHjzJK81kcfYKHg6N6u0g/7WPsiJrenCsydgb+xYSWRgdceqPgOKVYLZ34RjE+ikeTbGc3gYcy6l58wMpgnw6cIpRkWCwmYXC5IFzcEXsW6IeMpGcxZIefgHeS3ZN7ahgJIbTEedxisCq6uCdBvwf8ipPua2EmFijvifgsVo367joHxbjK/KHOnZHLW1qULCCroYz1OZBLR7FAbZTgU3C8C2f82MfemODKc/0kmMzP9dJUR/7e327GPyCcYstmXbqQLOv4FrErBYljxfXO0txTQq/b8IaE5iP6NJbMvaGaIJCgjO1VgoFlOLaRez2tEnZEa3VZ41+PKX5DsEFjE+U+DxRA/YMOBUfOJxBRkvAaf6hoyo89xQdZVqruoUKp/Kq+7bSHtWC9/xsI4MQXdrhraE9ogub2Zh+Kj3nuCXKZcp7J0W/WrTtVT+SzwnoJOGwMAbyQojBCMJHiCByu7UqHnWXQwSw8CixSyBDoVkeAiOWP+LKpWDIvC+THMNQm8BvyCd/yOacfsRjvBsj5AA5OwOc70qF+7QmjnpxZdp24HRGdYVIoiuvj469N5pX5ImZbjLKwHY7sFcJW1zdW9G5gLuLf5Wjl85jA3hZkASNr9jwusUIt/slXBYutph1/4quBI5ugkUUP79I0Sus6pAnD8C3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGtsVitoellVejVTN3NXRG8zWENZTGk4K3A5cGY5TjZFYkZVVnR6SDN2V3Bn?=
 =?utf-8?B?TWIyaVA1cWZFVWdjYXRJV1ZYU0RtWnVXT214bGRzTWFpRUc3ZGlYaERHNUdZ?=
 =?utf-8?B?UlRuRzFEMmJ0dVhzcS90bDZBZ013aVVDeHZ5UWdUUzRVOGQ4SlExQ3hTdlNq?=
 =?utf-8?B?Ymo1QzV1TEo1VUdrZlNqSElpRnc3aTI2bkNRTGJBQU5ReE1RVXIwZ0RhWExx?=
 =?utf-8?B?MTNiUjNXQjkxUmlnU0E1bE9WVnFtSXBOaFY0cEZmNlBvMEZ1Q0poNG5HT2hS?=
 =?utf-8?B?enE3TzJTM0dWVlRXQXRMQmk2RHczc3E3Yzl0aGc1TDZPejBzQXJpa2dSMytT?=
 =?utf-8?B?cXBXeWlJSzBCUllBd1pkTE9jZTdzenBidnFKNXZESjZWOXhmUlR2UGdkWk9Q?=
 =?utf-8?B?NVhkSkdMVTRSVmdFWG50UjlERnpWekF5VGRCZ1pFZDd2MTRWTVJTRTFFNzhN?=
 =?utf-8?B?bm85RHBHekt6TzR5akc3M3JMZjlpK1lNbEoza2twT25xbzUwdDNYdHZZVTFZ?=
 =?utf-8?B?V3V3MHgvc0Z4Qkh0bThNNWFJVVNCUHd1SVZ4SmlFTmswQk5qM3NXMy9zQkFX?=
 =?utf-8?B?YWtodTNxdDQvb3VMbTU1STIveHZrQVBHRU9McEdyaExxVTdGYVp6STFhVWQx?=
 =?utf-8?B?QVhKQ1d5QjJ1dWpFQ2FTSkJmNXJuVjI5M0RKTnQxL3lqUXNCTFRsejZPcUli?=
 =?utf-8?B?aGRPeDVDK3licWRXQXdFcUlUOGFML01kR1d5NEN5RUZWV2V0UTlWcnB4U2hW?=
 =?utf-8?B?UU5DeWVsUkQxOFJWYWNuMzlBNmovS0Y5UEI1TnB4TDlQR2QvRmI4Zjg4SkxR?=
 =?utf-8?B?dHk2Uk1UWHFnTkVZVDBBd2VLQzNnWjNHeEhHWEM1ekdicWh1N0tsYTh5Rnht?=
 =?utf-8?B?MWJWZTQxRDcreFJkbDg0MVFjZ3BLUE1lTm42UDFPRk5uNjJ5M21OVFo1c2JD?=
 =?utf-8?B?QjdvRWdlZHFRY2I5UktLZHltK2ttQjB4WGJ1aVVOSWRQemRXMktkai9DU3FF?=
 =?utf-8?B?VksydkI2Z0M2RkJobS9TTkFDYTBmaUhsek9qRjh0OWtjYVg1ZFJ1dlp1azhy?=
 =?utf-8?B?Lzhid2NKNGxtL2RPa1NWN3k4UzJuQVhpN0VKU056UkdUeEprTFIvZE5LaUkx?=
 =?utf-8?B?S1VkeHNRQTlFOHVsYVpPQXZRWEhuaFlqYXU1ZGZZWmlLUExLeFBSOHpmcXAx?=
 =?utf-8?B?TVdYZ2l6Nk1WYXdXMjhDMjFVeCtMV2pOWm42S2xxWmR6WFB6dDdlcnZEdVJ4?=
 =?utf-8?B?N3ZJeXgvODY0SHR1VmVMbTlpY0RLbW1rSm9qN1NNMHVOeG8xU1RMczNlOWhC?=
 =?utf-8?B?K0xULzlzQ3Bnbm10U3BWK2hnMytmRzlkQTBNTkVUdVZrc21HajlPNkFDUWRi?=
 =?utf-8?B?WjRHcU5rK2V0WDNmemFFQUIwdXcvUmhueW1Nd204SXZLSGYzOFpRT0tMd0lB?=
 =?utf-8?B?M2VCaWZwaWZTUkJLR01MVmtnRkM0MVZPUzVvMWx1TzFtVTdrMFNhTjRHN2E1?=
 =?utf-8?B?QWVBbHJqM2h3WmFxSFRZd0N1NEtaSVoveHFwbWUvK3Z4d3VsYXd5VWkzbHdH?=
 =?utf-8?B?UERWQ2xaWUhXdzVIdXFSOGI5MVdhOEtFR2dDdG0rVXd4U0xwdlhITG9veGJF?=
 =?utf-8?B?Sk44RHBoVTZsYk0rN3ZBbXRkV1dKUGVUWlZaZ3hEUEo0UGJDWmFlMXE0OWxz?=
 =?utf-8?B?elVYVmc2VTdxakpUUWxESHZNVytGdkluRE9XWDVBVUxXOHZyNDgvY2FvU3FL?=
 =?utf-8?B?QTVKMk1QSm03Uk5lT1Erc1lhTWIrOGdZZHpzckk2SXQ0NGNGQlRudVpvRW9X?=
 =?utf-8?B?ek8xMXJTei9DN0tLNjUvUmt1cEF1TkVuVEZWUzlTOHlBZDRtaklkdCttOFpD?=
 =?utf-8?B?QkN0c2xaa2NBY0c3aE9adWJrRTFPM1JiTm9uTTBSZ0t2MVZGWTRjc0FsakNm?=
 =?utf-8?B?c2F2dWtIRnppQk1lbmxmQXF0YjR5Tm1yMGY0UHV2NVFIWnJzV2tKMVg1VmFo?=
 =?utf-8?B?REVhUVp3dTlkRGVSME01ckVOT21wSVJ5OVQ4dTZ2WU11Z0dibTgyR2Ura21s?=
 =?utf-8?B?WWVQY21pTmV3aWM4WnkxUHJZREgyU1pZQ0hlU3ZzdkJkL3ZQZng1TUhMVDZP?=
 =?utf-8?B?Y3pmVWNMc2dIQmZXUldaUlpOTXNLWEUvNGxqeFRQUHVDYW5aQ0NHbExXeGVt?=
 =?utf-8?B?SlZKMjVRdjNXcFhlc2RCenh0NkdBUFRZRm5WWW9EcDlidGtUdUJXMGMxK1Rm?=
 =?utf-8?B?ZnpPUXYxMkphWmhKa0hPcHZIY1FzTlp5U3Z6TEhUcGRqWENQekRDZDRrREVo?=
 =?utf-8?B?amx6ZlUzcVRiWC81cy9VTEhiV0ptSDFraGlqMTltUmtVTkladGRYZz09?=
X-Exchange-RoutingPolicyChecked: kyEagQfGm1gbAsSIaboO5cdpD4+4NCP63C3f4NMw0oa72ktedBnME0+F5tIWrwke9v7EGvpc/pUOSoMM4M2bHJaJ0bJdIexxUJMg+fxX0waS345aQ8afVgc7bZo+anAmQCL8KfgmupwW41oDB5Wo+Wh7X+xFvcC/6Mn3yNVfX+C2iXB1XsmUCdVFqSwzUkX4+BtNmnCe/G91W0tmpH0QxCVGdK7lmi9mk4bO8vUI9UBqcqI9iLdtnYMxAQZ0D7zAUnderKO/IdEGZjZJtyhJVApv8BtLBiHxJFHBmIRGZYZCVETNQTb7hwdOpd02W8sprmG+it40tsUGgj2md3HRGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e985328b-4695-4424-e1e1-08deaf1e9962
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 05:31:49.4051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGhZDpjfjZSO2d9p6/8uwnCmMJFxDaNr16N7Zjyy5YbQC7CSTv5AE7b/g25pq0lidMS+uRUCmD2bI54/uY43NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
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


On 5/7/2026 11:33 AM, Arvind Yadav wrote:
> A partial unbind on a DONTNEED BO must succeed because remap remnants
> inherit the existing DONTNEED VMA state. A fresh bind on the same BO
> must fail with -EBUSY so a new mapping cannot promote purgeable memory
> back to WILLNEED.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 65 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index e9bf55ff5..629c5eb06 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -14,6 +14,7 @@
>   #include "igt.h"
>   #include "xe_drm.h"
>   
> +#include "intel_pat.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "lib/igt_syncobj.h"
> @@ -768,6 +769,64 @@ out:
>   		igt_skip("Unable to induce purge on this platform/config");
>   }
>   
> +/**
> + * SUBTEST: partial-unbind-dontneed
> + * Description: Partial unbind on a DONTNEED BO must succeed; a fresh bind
> + *              on the same DONTNEED BO must be rejected with -EBUSY.
> + * Test category: functionality test
> + */
> +static void test_partial_unbind_dontneed(int fd)
> +{
> +	uint32_t vm, bo;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	uint64_t addr2 = PURGEABLE_ADDR2;
> +	size_t page_size = PURGEABLE_BO_SIZE;
> +	size_t bo_size = 2 * PURGEABLE_BO_SIZE;
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = PURGEABLE_FENCE_VAL,
> +	};
> +	uint64_t sync_val = 0;
> +	uint32_t retained;
> +	int ret;
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	sync.addr = to_user_pointer(&sync_val);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
> +
> +	/* Mark BO as DONTNEED. */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/*
> +	 * Partial unbind of the first page must succeed. The remap split
> +	 * inherits the parent VMA's DONTNEED attr and must not be rejected.
> +	 */
> +	sync_val = 0;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, page_size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
> +
> +	/*
> +	 * A fresh bind on the same DONTNEED BO must be rejected with -EBUSY.
> +	 * The kernel must not silently promote a DONTNEED BO back to WILLNEED
> +	 * through a new bind.
> +	 */
> +	sync_val = 0;
> +	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr2, bo_size,
> +			   DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
> +			   DEFAULT_PAT_INDEX, 0);
> +	igt_assert_eq(ret, -EBUSY);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -822,6 +881,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("partial-unbind-dontneed")
> +		xe_for_each_engine(fd, hwe) {
> +			test_partial_unbind_dontneed(fd);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);


LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

