Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCABC79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF110F09D;
	Wed,  9 Sep 2026 10:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HblNWViy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C241A10F0A1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788949680; x=1820485680;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l7EWSAxJEFl1TebYJI9vjpZEyY01WHaxfkT833dQiyQ=;
 b=HblNWViyiHrPIYxbT7DqqsBOw2/V66HDsdqFbEX/4I7k02i0bmljDjf4
 6X9y19XJ4vW/fGwbgu950B5lzxXf9jq7VMHa+lQhhSqIouizut+DELO2N
 T7YhTjiaaQSwrH6Cp5nhVCsy0c4TS25IK+rjF2b8BghS++mAh5xQ+j5rG
 IKRLUOeNkj7ThN42QV2XVZSpAgw/p+PZFn8kevbLvqhcHBBVQJiGzOMzw
 YtABpubjDCb43bJGJ4lOVQxJBncp6ZcXHBUkfu0/Us8vhVpSK9Tzz3ZZ8
 5Xhm0wqqbg2a4rS62+0rZRTu9U4IaO/uto14jH8SWP/CvIBz0IIzEebIc w==;
X-CSE-ConnectionGUID: 1xWC6hCkQxS7lVrx7BvSqw==
X-CSE-MsgGUID: zQ06MbV8SZ6kifIvGeShAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89388630"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89388630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:28:00 -0700
X-CSE-ConnectionGUID: tUUoLWBaSkOyjkf9tn97Cw==
X-CSE-MsgGUID: LjxlxRCwRmuKcw72xCRTeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269940270"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 03:28:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:27:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 03:27:59 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.41)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 03:27:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub8QDHIbAlFx5hBOKzcnkL5qByfGQ6hVWO6TYCIwEjDVAEcTH1dEOj4Eh791i1NzczZD9/tqDkOMoPyfxA7hsJgr+BguVxLW3SoMaNbu39mLbYvrnekfoLcRsZX6axfFYAAzItVRDGfp9LuGH/feRo8dEjB+QQkmFG6QZC8ysRh0YkEndPmTRR+IKv/6ybDG8HKmEy44qCVb0mrvDR2IthYSZljPYqFKEt21BfUd0sEQjS0rVAUYj6HV83ncRC7rIVNjXoZFWev7+FBMVM5aYhYNuJaR2ARPcclTk5sbTmzBhJ/DfzShj3BmR1uFZX4025KOQUuuYdwLSrkngsulcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaRE/Y0NSP/WUqAShYyGBBICa6/u5j+e5LKfRCRGIXw=;
 b=RaQ5cm5Nd6Z/afPHQan5QqT64YQs+9ldU8JisPsvy5QtVlkFjw3k2qOkrxedV2xqm7WvbpiiwU8vISGKTbxvY9V3BN0BAwkRVYq1yknFiOC/D9PrHy9sa44A9nCmym7NhJlrLY/Dc871GSee4QahitrzxelCvsGJbPtUGd/kklf/efl4NHBRF24RblztKfngDZ8TGyHAYzPsSiULYAQC/+Nvph2wpv3YWmuUx7not0vaNNFjaFTwi996k4ip2UaooWtMLbmDwdBJdjuLevmZYUbTsBL+imiZalKA7QQBLbZF3Mn4PhavOrJ8f0jSiYZrKXfo6vR9IklLP5sErBik6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB9828.namprd11.prod.outlook.com (2603:10b6:806:4d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:27:57 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 10:27:57 +0000
Message-ID: <fc7592b1-e18b-4995-bd71-03031681aa0f@intel.com>
Date: Wed, 9 Sep 2026 15:57:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 2/7] lib/igt_kms: Order
 IGT_COLOROP_FIXED_MATRIX_TYPE before IGT_COLOROP_NEXT
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260831192935.463134-1-swati2.sharma@intel.com>
 <20260831192935.463134-3-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260831192935.463134-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0047.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ee38e1-20ce-4f01-84bf-08df0e5d03fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: o+1zL51NouoFrBAXiU4goUq7/sVCOfSqZ9C3Ca3Rj8Q/MvsXzDCl02d47J8Xo1pDBfWC3TVrT1KneagjVnLpW/3yh34+2DzwNVrKTQm7xNWB1tnc6sbZXV3492TDiTSv6iHpy6kufU1CmvLiqGvyXE+lNVaCdTyuXBrP6T6jociD+gEsNzUbW4EJkafBAabNkB+VRQt+5KD7g474CXhND20GPTb6MEFCSSPxb5cQ0H+n2ijPlodez8TPAu2e9kcm1x0jDOPyXZjUO9/oHZWD2iX70DkMaylYC8p340zHKb0jUDgsxbrXn0/86wjP5ZYT+Wz7v3oBGTkv6FAUK3CuTPZEF6HnNcX33ESxQh1zyH9P7jtGOcP46tI0VbBcjqVxdapF1KDn+EEWDA7SeugkLoCc++QcQXTrVyvdMTrY6+349Yk04JdnjYuNRCocVUIptqzZCtKB3wVFZA0n+wKNG4bqBudJQrIU4UkqiOb/5e9fWx5zk4Myj8xv419NzohTjLo5GcUbsxuUaHs0kcKWNHWg3c5NZWmpvGEh4CBOwgNSXPEhOgDBopHDddHti5CX5MAsab1O1IN7zK12eC7L7DpOuCmekvP+5gFa2wYTN0Zc+yFTjz7xy8+IQ7McCe8YcXlGqj4AwCKKrEZxYK/YymONX+K/Fjgf5xP/DUCO2KY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJPdWU5ZWp5QmVsc2xUcjNJVTB5TlZ5ckNXbjNiRFI1UDNoTVY0YUwwT1pP?=
 =?utf-8?B?Y0dHUFRSZFZuU1FrektJTjJER284emFwQTRXQU4yZEw0dmUza0NTUnFnRkpV?=
 =?utf-8?B?blZoMlBpbUIxbFY0KytPYTFnWU91blFIR0dOOHhuSnV6bFM5T2Z1N3lHS2Yr?=
 =?utf-8?B?ak5pWUhNVFhLL1pwSG9LV3VtNDRFaGFER3FiRzZMVEdZRjVOdzh2ZVR4dVY5?=
 =?utf-8?B?eUVCTUFubGRmcDBrZm0wN2UzWTVnTlRGVVNkbGkxdmw2OUVFTXUxcnp5dlJS?=
 =?utf-8?B?Uno5V2tFcVFDRTdXQXBVLzQwZWNDaTZJakNYQmR6bGNYMnNYZ3ZGajVPRTVh?=
 =?utf-8?B?SnVLMlpVREV6dnhlTGZDYjRISUVxbWRMU3p1dTIrQVF2OStkdTk3ZTJHKzJD?=
 =?utf-8?B?MkFBdHppSGJzUGEyMWlHby9OOWtwTDJ4dWRTNGdGcGZRTU5pTXl6a0ZKOGRU?=
 =?utf-8?B?UzdXYmZibnV3MXRVKys0Mm1GR3VJS2tUWm8yNTR6RjZLUnhZSHBDbEhxS1k5?=
 =?utf-8?B?WkY2dmFjdDI3MDEwVmZLUjhOZWVUZjVEdVF0amZBekFnMDJsa2ZYVmRnT01W?=
 =?utf-8?B?SklyZU1reVFqWk53dHNDdE9NeWorSTJuRXRRTGhjbkhYTlJiUEZCdHlqaGNJ?=
 =?utf-8?B?UEM2bHZjcEJONnhleVFOWGRRdjdDQlJFc2xXVG1HSnBDcDhLZVdzK20wVllm?=
 =?utf-8?B?VXJLZzhVR3h4WjRWV2I1a2NhTGFOeVVNejgzNVpQeEZJSmI1ZG5ETENNajJI?=
 =?utf-8?B?SU1yeWp6cGUybURYVDZvcDRadHlnVllXb2JxU0M3amhsTzdva2RsVUZ2QzNS?=
 =?utf-8?B?NzVZZTlaN0QxUTQxNWhBNllJSXUxYUlicVVEblJ0QXA1TkVrK2M0VnU2Szlv?=
 =?utf-8?B?N3JnMzNVeGlFbUNIOERWNWV1UUJZREwrLzNKUkpxMjFuK0dRT1dLSEpwRFV0?=
 =?utf-8?B?VjRxVGUzdTdOblB5U3J3NzJpeUlKT2U5REF2ekJLSFpiLzNtK0xHbDNkRjhl?=
 =?utf-8?B?VTZkRGNSRU5CQ1pHOExuaFdwNERXVGtxRnplV2hnOVU0SFdZQzRTR3Jrd3BW?=
 =?utf-8?B?NWFsY250UitSb1Y0RG1NT1lMTlZOUXZUQTNGN1FuZVplT3FhUkg1NG5PZ0NB?=
 =?utf-8?B?cUh3ckFLaUQwais5MWdicjFMTmlxanJzT2RQd2VrcVB3VnIvOWRBTWdLOHZk?=
 =?utf-8?B?N28vUzVuNnhQcURQRDJrUWdLUVVHVDVuL2ZFbWw2TnBhTmxseWFhbGpQRHlq?=
 =?utf-8?B?K0FOK1Y1d3BLYVdiUzdPVE5NYmJKMkdqZmV6ZDIvQkQ4bXdNeVNaek5pcGZl?=
 =?utf-8?B?c09zSmJJamUrUHR4N0c1eUhWcC9EbXpidEVqMHlNNVJ0dmJYS2JCL1E2dG9Z?=
 =?utf-8?B?REdOMUZCcmVneXBja1pad3diNGlxcUdTQ2pMZEZBREdxd0RSTmxPQTNZTnly?=
 =?utf-8?B?T0RZWG5pMkdpSmhNRWNZMTBqTk1DTEZUUit1d3RvbWVOSmFJbTRQZ3oxZTdo?=
 =?utf-8?B?ckVidXMweU5McUxFYjRqZkVveDRyZ2JTVUpGR3Z3KzdhYUVyOHpldUNmc1RJ?=
 =?utf-8?B?TTJTSE1lSDNTQVVNdmZDWVMvaVh2SGRCZ2dsamFncjVMd3JSK3QzZE1udERx?=
 =?utf-8?B?SFBkRWt5Vmx0djgvaUxBUUc4Sldna3lxLy9rcktoZGtqY05FUW9CS3NqVmJl?=
 =?utf-8?B?TExKQlZuV2plSFVSRzVEY0pZR1Q5cTZ6UC9LQTNiaW5Cemwycy9QUUQ0VnlM?=
 =?utf-8?B?R3J5R1Z2elh5UzBkZEhISWp4ZkZsbTFXcVZmZm55Tk9kRCtmMXA4bGRPdlJv?=
 =?utf-8?B?OG45NERMYUUzMHdVU2RjWlRVblRVMUQ2V24vQ1MveXgrNVg3cmpTTy9jcXpm?=
 =?utf-8?B?SlVQc3Z1RmlYNkU0bHZNRzNXUlJ0OC9tenhhTXdiOXhUT2xnOEcwLzVVZEo1?=
 =?utf-8?B?d0F3VGdRMFhCc0NqU2xZajZienV3MVRUWktWN2dCZmJGVXJFVG9PQTdUUjc0?=
 =?utf-8?B?WVc1THBoYmpWMk5nN1dYYnlNT2Q3TFh1TGc2Wmh2YXBkRytrbElPRDVBclIy?=
 =?utf-8?B?OVh5eC9xdXBYZGkwZ2FEZ0dvVS9XMG9Gb0xwTFpKczU3MUhsNXMzU2Y0NFdh?=
 =?utf-8?B?TFZVTENobG5DTmkwK2phVW11TFlzcFNLZEE5cTJQV0JMUUQvalVsekgrOGQw?=
 =?utf-8?B?c1ZqTTN4NXRLNGp5SlY0em9TZFE0RXJ3RU10Z0VMZ3JPK2pxcFlib0FWU0xS?=
 =?utf-8?B?V0prVXNEN2NOVzArNVJVYnNFaUVrSG1FaENLbFpSTUVHS2RoeUNyOTgrMWkr?=
 =?utf-8?B?bTM3aEJEcFYyTFZZb1ZCak15d0wzUFZSQU5JQW9QYUJtWkZXYUZSWGx5SE9s?=
 =?utf-8?Q?vAblPwZMsFSQOvUY=3D?=
X-Exchange-RoutingPolicyChecked: 1o6aX9mj+TszjcWmMGqrBI/1Kcy+P1a8yn1f56e/lqAxS4T4+S/fwNiRSHxjAflHQkkzZPnAQ+CtwbtsMZZraupvC676B9vbW3bpm3sPT8Zk9BITiiaiMS1rqRsfLxmL5OgqcR/1NeKQPEKYGqPyufg7kr40ZGuypRfj6HlZ2NX9IB2J63Dgaiy6OkuvIqBZSGEmSmlffkwn1sAlTSOxmp3NkvV3wtnClEWC0GfagGKiWACBn0E4K6QLygk0RDCUfaq8HRIs2foSjlbdqsn1hDI1OkTzjmozWgTF3VBnAGJ7fJk2XJfq/JJnphx1OJuLrkOLbEQPp4pmPoDabc0PPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ee38e1-20ce-4f01-84bf-08df0e5d03fc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:27:57.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NyxAepGPc8U7fVPC+tCI/9/zXqNGsTLeRc3ue1OlZ6pNRbeHBmNxF45Q0M5xOhZKDg3oZh+Ka+BvwkVfhho+kF4kJS9nCqEQW7Kug0WBdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9828
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



On 9/1/2026 12:59 AM, Swati Sharma wrote:
> Keep NEXT as the last property defined just to represent its
> unique role as chain-terminator/pointer.
> 
> Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

LGTM
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: GitHub Copilot

Should Assisted by come before Signed off?

> ---
>   lib/igt_kms.c | 2 +-
>   lib/igt_kms.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1e27a25f6..7f3b464b2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -724,8 +724,8 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>   	[IGT_COLOROP_DATA] = "DATA",
>   	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
>   	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
> -	[IGT_COLOROP_NEXT] = "NEXT",
>   	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
> +	[IGT_COLOROP_NEXT] = "NEXT",
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c8fa11b47..8ba8e3891 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -362,8 +362,8 @@ enum igt_atomic_colorop_properties {
>   	IGT_COLOROP_DATA,
>   	IGT_COLOROP_MULTIPLIER,
>   	IGT_COLOROP_LUT3D_INTERPOLATION,
> -	IGT_COLOROP_NEXT,
>   	IGT_COLOROP_FIXED_MATRIX_TYPE,
> +	IGT_COLOROP_NEXT,
>   	IGT_NUM_COLOROP_PROPS
>   };
>   

