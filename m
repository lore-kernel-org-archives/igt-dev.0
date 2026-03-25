Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E261FEA830
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 07:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5D10E7FD;
	Wed, 25 Mar 2026 07:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTkJToL6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543A810E7FD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774425311; x=1805961311;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7yb/h+NslHu6tk8WUGBbr0aDYkvvEJwMB9LMTQp+764=;
 b=cTkJToL6OZVH/RLynwbbL3+uN9PRIgOud2eoYNIT2MfTx10CQhppZfgy
 G71KnqIt2xExgCvIImZ6gqBdCjSMlrncsSR91uOPcj34FR8PVVbjqnVLx
 uoRULZIAQRpKnYCOoJgpXZEd+WDkMuHgFgm1qvhialBsUQNZszU1G43Ex
 Blko/LlHCv7SetB7zGhCVAjgW3MrZcL/FVTLAONSJDPwyq1E3NwsjuEyP
 AeizMEM1Ft3qZR7wwuft7sfrZGursCkv38wB1K/RPGluJBnpPKNNgtTSO
 6W8eOfnoUFGHc11X6mx4TnXLEouZCjeYZmw+hOoH+BmhiMXC4HvVTyneU A==;
X-CSE-ConnectionGUID: GIAONP0vQzCKvY4ynjRvwg==
X-CSE-MsgGUID: 4CUClo5lS0iPC5q68yBflQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93032418"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="93032418"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 00:55:11 -0700
X-CSE-ConnectionGUID: uVK9p78TSs+VKdwVINKLww==
X-CSE-MsgGUID: ji3DoGneQNSkGZd+Xejurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221711204"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 00:55:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 00:55:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 00:55:10 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.36) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 00:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7BGcCPPgoF4T5eG8LFOSgl2WDddTRsxbbSPSggaArddeyxbtN6c6xRD2d02UgebuNRZC4I2O9SJZRRhWMtguTC8L1u56huDp6uYNA8HM61ObKeCLdjx0jgdMDhRRUcZhVoa5uyi03lzdcOKg5GBErghdI7V7obFLFzMcp+HVAa8t7ztXON8YFpzuyaXq2Mq+NU29EnR/tp2CQqe0t9XN32mmOxEsWdpgL7Dc2R72FKS/NSbnxXFRwZybzmuu30qZHxmaEIT/f1KopB/NrWijwVW4O9Pj9oF3RfeWBQUHmvDHJJ5dN7UHchFQTO/KVkfNwNJ811LYOPUWkFElE4vaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Hskp1ZVBBB91z5vJUujqrqi/76kz7Yxms/98rJKcBY=;
 b=Fq8Y7hFlf245VeNHeeesur3qV08UyAmsO1H0fYnjgv2+BVq7zTPXGEUUbQPy/gP336mynPNkC1ytb8rFAzZMQhd/dKqoeqEBijX+d2Zqagu9kJZRrsYW+597iXbNLlH8xRiY3mw3nLncvbB7YxTXKHcVfJi/zUq3a+wCF00+MH84M+5WMHf9Dy95ePMu+b4e+HFN+lERuqvPQ3aej0IjA6iL2j7RvNSdLgi7eogZxRxblF/n6e9fRSYZEc90Ioqr+nsf77YgUeKQfafU5Ew2aSwWcIQMOEFTcQazBeDhITQyzqzQwoQ7rsIzeBYez1mZuwHBzEavJOEv9CksIde3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ5PPF57F27BA08.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 25 Mar
 2026 07:55:06 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 07:55:06 +0000
Message-ID: <6144947a-1555-4bfd-b224-7048d1cbca66@intel.com>
Date: Wed, 25 Mar 2026 13:24:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_async_flips: Fix timestamp print format
To: <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <pranay.samala@intel.com>
References: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
 <20260325074923.103348-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260325074923.103348-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0098.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::18) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ5PPF57F27BA08:EE_
X-MS-Office365-Filtering-Correlation-Id: 9609d828-b277-4106-379e-08de8a43d3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: AJejkkiTe4UETSrICOjfcr111eWp3luwS49bv/K67a7+rbpyX+wPXgKc+/mps8/2lsdIuQ4fkid2gIzCKobXjSBqmgX8uIDhYzS7ezR7RYzG7DJgpv6kZlStiqO30VaKY4m6XPGLX60p4IERJAMtK3pN4PFI40eXN/EoQcR2GhQFqiNwcE9DoxbX0rVjKuLBhx6iEZQx2rvgETRUFuWQNz9yxSiA87/SHsSROEm6WDXJyewXlhjcaY/0v3+EE+SIKBJbBOZJ/It8BjIh4v7KGNzSiQc45LT1JsgzNFQYb/U/W+Xrdv4O/apd94nhNGWrf8LAkQS63jmIk9ysipb2Cbe4ul/5nUOK4n/k+tjvwqAeJq8thHsdRR+8oeLUN7oMKnm92sCLXmiadehAXeO8rd22U5MNOhWsT0rOHw/rul83NG9rEMRQ3U9O8XGen7YSgnukbBRG8jHpG7h6AoHjMWRVBfaFGOexzUT17kRzMxpG4riwcYEbnBKORcRl/QFXFo1cu9NXPTr3sSlFqI0R/rkUnG2A70k8EQ9kYSD+17nbnr2EY6886CbWvxLjsgvtrWSOA641uiguXFfyb5YdkjhENqwpK2pFQrvUQzP8BhowaELlPoRPeFIaxvUuxQkvEDJqXILna+sc8F9vSi6ua+dwd0CWLaN3E7dnRKCYFBF8N4BJLuQjteLlZgK7XCGS6ftmF2003+JJTaV6NnCZTBiqhqBB1HLXqP50w/lBsfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkF1NFZmVENWWDFTK2JOWmRVMXc1RnVIam1wOWZ3S0pDVUYxUGNQcmxlNFlS?=
 =?utf-8?B?dnlJM09XSDlLMm9KcUxDdEhweGFkdlprbFN6N0FKeWpJMWN5SjByWCt2MVpN?=
 =?utf-8?B?QVFxWWgvdUZjSG1SeUhJdVRTRHpnVHE1M2FDSU4xVzgvY1lBS2JpYkdncmJr?=
 =?utf-8?B?SmFZYVN2SXFCellOOWZKR3JiOU1jWnB4anV3aFY0cVJRVS9GR0s4dnFJSjRU?=
 =?utf-8?B?bkNzVndCTHlvZDRyZGN5aDZMWm40dXg2M3BZeFpYdVJKYnVjU1hjS2NBVmZa?=
 =?utf-8?B?eXF1S21KVHdYRm5ndkFBS3YrUzlteVFNSzdNSG00eTlxdVBTZVovM1dZWmhK?=
 =?utf-8?B?NnE1RmJ5NWlLV1B6QjRQRTRndnN6TkM0TjRKblArMXQvbHMzVUNaWjJ0a3Fj?=
 =?utf-8?B?c1JpYlJyRlRlem1Vc0RLMjkrN3U5Y2daVzFBU0EzaVZTMWdqYkd3cnpvQS9R?=
 =?utf-8?B?ZytBVFJUS2duMWZtRzd3WVBiL2c5Z3hwM2E1cHlvcUk4Z1pUbGI1MEt6ZTdh?=
 =?utf-8?B?WkVmZTJBcml4QWg0V0o3eU9RT25aa0hsUWNvMjNNRURwaXFkTnNTRmJaYmZz?=
 =?utf-8?B?aEQ2UzdBYlE1T0lBdkFFRktWby9DVG93d0VFUTJ2Qzhqb2RDeHpyL0g2c2lO?=
 =?utf-8?B?YjFTQWpoekt5bTBFZFZQbHJOa3F2U0hGZGdwYUdIQ2h3YUh0QnRuZ2NwMHJx?=
 =?utf-8?B?YUwraVRJU2JtRHhlVkZDOVROSFAwcWFqdnBUNmRnY0cyVy9vbjQ3c3FMUDU0?=
 =?utf-8?B?d1UyeHY3aGdCNjZOS0dqVnpVMDRTK05QRU1NWVU1d2kxaDNXWDVjZzVqdkZ6?=
 =?utf-8?B?ZHAzdUQ2dTlrRjNFbEtxbmMycGpvV29wVlB4dXk1bE1VSUd0VkFpNk5DWk9u?=
 =?utf-8?B?Vi9PRUgvOHdUL1NVVWp1VzJVWUFhSUxlakwyVVc2czJHSXVVa2ZEd1pyRWU4?=
 =?utf-8?B?RWlBV3Iyb3RSM2dDQVYwbkhVWHVWVnpJbGNqSXJ3SnJNUC9ESWpab3VQVUov?=
 =?utf-8?B?TXEvNGNlcmNLSDZlTC9BR0VEYkFRbStVaW1oZnFkQzJBV3ZjMjAzNGVBVzF2?=
 =?utf-8?B?VE5iT1RRTWp6ZUljcWViaCtxd0NlazhJZHZTWmp5QzZ0eVRKZlRVM3B0eGYz?=
 =?utf-8?B?aFdadW4zaDY5UDJpZjlrWG1YMU9pVmJxUkgybUx0SjJMM05FMU0zYWpCbHR0?=
 =?utf-8?B?TVNLdldDciswTXpYRzgxeVpOdEx1RStrL3RtbHRZd3JiN1Z0cVNMRkxabUhp?=
 =?utf-8?B?bXhNTVZxZFJheGVTRE9wbEc1WHNsVU5KaTM4RUllcGxlUTJuZUV3VDZabzlk?=
 =?utf-8?B?V0crK0F6V1JhNFVLLzF1Si9seVNoMHhNS3I2eVRiUGxETHRxVTRYWVFhK3Vi?=
 =?utf-8?B?eGZpZjIyNlhnaTFFTld3R0k1SXhJRDc2cE1JWmRQZ0ZmVm1IYUY3eU14T3VC?=
 =?utf-8?B?WE1oenVjT1Zxa3k5Z2s2UWFrSzhJNERzREtwR2VlZytxUEl1VW5SUC9EWlJQ?=
 =?utf-8?B?dFZNY1JKL0s1cmQyRld3MmR3NEVGZHRYQTNUaFdyUTY5VFkxdjV2ZjNEaExI?=
 =?utf-8?B?TkVxR0dpY3hDbVhNSy9BTXFucUNnUjhIUERGallWSTA4VS9QOE15SzhYcjBq?=
 =?utf-8?B?K3NEamdNK29VTjNNL2trVkRGUmUxTXlqV2xpR1ZWVEd3SXhWdFNjc0RZdHV0?=
 =?utf-8?B?aXhJd0syRlNKcnp5WVd6Y0RmUk9pZitZbUY2enozWGt2Z241NjBHbkdkdlFh?=
 =?utf-8?B?UG9yOC9KQmxFQzZ3dGxWYWtSZlVQdDVoZVR6N1A0VmJja0hnOGE1RE5mOGdV?=
 =?utf-8?B?YlNMZjhER3NudnpkMExYbytjUE9OK2ZDWnpJdHF2MkVyMlhGOHpNUzRGZ0wr?=
 =?utf-8?B?WkJwaDhEbVcwVDJ4Y3lFaEY4QnpZSTZXSW1GUFNZeVVybmxvT2oyTkNWakQv?=
 =?utf-8?B?WDNHRUZDMEVHbW1Dc05NSXQ4OTlvRDh2S3dwMWMzZWRseEk4VEtJSm1INncy?=
 =?utf-8?B?STdsempEODZlQlB4VE9rZEpMRDcwZ3ZoejF6WmltZHoxZVF5aW5uZ3Z5RElh?=
 =?utf-8?B?RWRlYUpMaVpXZ3o0L0pPdHZkK1dTSUNOTDluc1ZKNWwwQUs3a3c4NzFJZ1kx?=
 =?utf-8?B?UC9KdWMwSWh3MjRuZkNKTjNWNXJ1eXpOZmJhd2dOZnRLMktRbEJWdStnTHNm?=
 =?utf-8?B?NjdJVFVyUmtSWkptSDM0SXhTeFluZVZLenlRUTYrUjJIK0hPb2hCSEJMcmdR?=
 =?utf-8?B?REpBZEtqQ1g2aHNXazM3ZFVOZjZQdDNWS0R0a3pzb00yVFBsdHpwcUtCTHFF?=
 =?utf-8?B?OUI1K2hlU0RvM2VkYld0VWRWYkdBK3YvUUtKUHl2YWJzL2JFcEN4MGtPci9y?=
 =?utf-8?Q?Fc7hxtOSuCWXznXo=3D?=
X-Exchange-RoutingPolicyChecked: M73LRv5ybzuWOJOjKDavsYYpsCr4PZu7Q0sWcW460wouefz0Hee4XSJkXnhmpM7xl+DYyCsEyqEk0n5k+QaY9N9QxWseg+6PfyJrohZxTz7uNb0L5R0ISRJegzDCG5q+NqAAM4SCxACp0MtIPCj4W+7JGBuDne7gXaaNFnPH0s+/Hs2RvS+y/lN1kT+SmQ1c+1yZMpfjFS4R8Mgs6voKSw8P+617Hcpo+CJr1UcNLtI+h0Z6CLE9AF7miWcU9tInG8a5sdIUxaggvGGTS+LZQUb2K0PQvXxhd2yj9Q1qcDLTvSARBKvESKh3kiYVookqVofixTXDZhwAcCORU6A9JA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9609d828-b277-4106-379e-08de8a43d3dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 07:55:06.4554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLotW3IOnvoee//WlnIf4l2EWn29lHNDWpYupe4/2NPtauNpA4I8Y6mtwFu1Yb42ueWlcuDQje93ZCIt9Cj54FvJWVg5QHaWX6RIllJi5mXAAJ51ne/cN/CWBmlHNB+O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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

Hi Pranay,

On 25-03-2026 13:19, Santhosh Reddy Guddati wrote:
> Update timestamp print to use unsigned format specifiers.
> Change from %ld to %lu.
> 
> This changes fix the below wrong log formatting.

Missed to update the commit message after removing the log. this "below" 
will be removed during merge.

Regards,
Santhosh
> 
> v2: Fix cosmetic changes. (Pranay)
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 4a2930968..305bd5190 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -599,9 +599,10 @@ static void test_timestamp(data_t *data)
>   	/* TODO: Make changes to do as many flips as possbile between two vblanks */
>   
>   	igt_assert_f(seq1 == seq + 1,
> -		     "Vblank sequence is expected to be incremented by one(%d != (%d + 1)\n", seq1, seq);
> +		     "Vblank sequence is expected to be incremented by one(%u != (%u + 1)\n",
> +		     seq1, seq);
>   
> -	igt_info("vbl1_timestamp = %ldus\nflip_timestamp = %ldus\nvbl2_timestamp = %ldus\n",
> +	igt_info("vbl1_timestamp = %lu us\nflip_timestamp = %lu us\nvbl2_timestamp = %lu us\n",
>   		 vbl_time, data->flip_timestamp_us, vbl_time1);
>   
>   	igt_assert_f(vbl_time <= data->flip_timestamp_us && vbl_time1 > data->flip_timestamp_us,

