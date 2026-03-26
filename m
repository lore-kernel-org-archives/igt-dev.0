Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB57C109E542
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 03:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7096C10E8F7;
	Thu, 26 Mar 2026 03:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXr/fLGU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A4910E8F7
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 03:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774497518; x=1806033518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=SlqRUyJ8UMZDUj/l3lcOtqv7JkQ2xzlgmoOAGXjHQs8=;
 b=SXr/fLGUVanJ4efFk+8Kw5iftThw9kywooNaRiTXSscH9IKbVD9cG/ND
 o1qvAZv+4WCq/IYlOaKOR6Rc1Ro2gcxeeMlNHfyokGfYBq3f805RASUzE
 xVewKkyEZNZx66PrE04QVJcuVFUwiETa2uGpcVii3AebrkS3g32V4zR3R
 5PhHY1Pfnp49AE2NJRcD7coBE826nX7Ge+ybamwddgzYW9wHRPABuQE2t
 njU0XF2ZCwEfGPk1ZNGD9Rj7nn/N/DqEv1mk1wQf54oXYj4XtSUmMc2Jd
 eMbZ+9OdzNr7KbAe8dCP80dENK6o9GQY1S5vv01VoX7IqKl4bpYPYdQPE g==;
X-CSE-ConnectionGUID: hUSXoiSGTh2KM473DGATCA==
X-CSE-MsgGUID: bTiNd4WcRBy7XxU6mOacQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79453508"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208,217";a="79453508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 20:58:38 -0700
X-CSE-ConnectionGUID: 6xzdGwXOSu6CfA0qYf15bQ==
X-CSE-MsgGUID: ir1r9kYpRIefoTGeo5vW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
 d="scan'208,217";a="223939868"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 20:58:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 20:58:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 20:58:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 20:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxNZrDXbls75f9JFOR8XLWen4AnKPxALjFedcJxWwh9j1g2wL0hmhsxfvh2K/n3lGP2O7nESXF/H31GQO6QP8OL1C+PvUIy1sPAkyynKPLb75uQBZ+tZUqiytiAB38cq0+ZPZL+eDL4irdgEHlFuc96mBYXjpGcji/mpc3Bq2dkxQJGRO9Tjd2L6ekBDp/2TvbfJUxccPSDN05Zmod/4Rj7T4nRlQ2VWlIyjrzq7ix7nMb63hTeHN9Qr6diUWslYMhtbj84wi1u3Es5ddNe1Rx+xXO04BoYc3yItnyx2/mBY5NB7QwOnF0yHQYIvOCz59LWWjp/T9Sv+rcAJyHpcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDDLaRfgb1Jel5YUb4yzTyRNLMWNCwj+ylEAlIAwTsY=;
 b=CE1FgsOoy08ahUlcKKr9oIm1lv0hIhiW1vFjv+/W22T6Ro9qlPoK/NxTvS0f2WkK5u55L3bKsdF2R1DLrK+irX8PvvKKAfeuwR1SlwE8mcCpTr6awankAvZk1qGIDoBmvE2l02lZAhrnRuhxuSa3lssibsSqhURQR7p22gcRZ9lKHC/S37OfxFb+5vqj8F+pV8c8/aY0rkV6LJsUvke7Sm2tqwpFx0dITMA/lJwsOEekitwEJFsFu6fy+20rJt6cEPKTxDYosRi4eCz7ySenQXyH62AnbQCzLHXRtChzVrE68FzkhFbUpNLE6dwc6ywycA5R8kZ/Dxqe5Qw/kHhLSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 03:58:32 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 03:58:32 +0000
Content-Type: multipart/alternative;
 boundary="------------yvfXodvZz5bwwOW0jiEu0rHK"
Message-ID: <046333f4-b4a1-423c-ab7e-f08c099f668b@intel.com>
Date: Thu, 26 Mar 2026 09:28:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_sharpness_filter: Fix stale mode
 pointer in joiner bypass
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20260325112320.2879230-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260325112320.2879230-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 130226df-69df-491a-e802-08de8aebf259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|13003099007|56012099003|22082099003|18002099003|8096899003;
X-Microsoft-Antispam-Message-Info: 9FJRDmHjYXETa+Mi2l9/FuNTC8YIrG2jk+ezov3PrvlE95kn6w//UcKMTxiNi1shfV7EasT0MRW/rF506rX9vouS/rZfG2QE253zvOOjGui8yaotkX+lnSPSkqxsMDJLO4uDTXPu3ayMCUAZ2Y6eAQ7e9ZecFpg1TD4LZS45DynlLZWe/R2IG/w8ztGvQa7W200KQyU1IvudvPhoLJVWgK8GP8pbjpVxqiy5LaQ3drDwXGDBOnvaGoUcMB7HTBV782rQEXG4DfDVQ1vD6IQbhyao3sVKWMKEnROz9AMOCNPMKZT01LR5ZAkuA2mZzTgUZBngDuSdAKw2FYYLhLFwo933IVgYTSI5IsudFWhVF98t1EK6lcMqXmUbu9ckj4L7yzeCy/SqZQYoVIpXCnJovSBbLrA2lpazY0K+lE/BjpafoKRW2vNL/rtcyMyTeHlVYGc8gX9KZJwEtaUY1Y09OBmeyeOJ1rekGhX48ZhEtZibqDdkeeEU0A1bN710Ed3Xvc1PIP2dt3FmRwxdeStjQdy2fJ/3b/5r/71ffnPUqWebHL7rquPqZLzCwkYN6UWTfWtXG8Ulh9FerE2p4hojLLG2osh06sRvH9RRPWINxfl2I1HHEPhKsA/1QzJZxZfXSUm6I/9mMKVJ0E6wU3dVnZbm4HRXWisTqogTQP962j8Z6fOTVL5A0HPYfhXSQBX7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFFrMHNIeHV1SG1aeThyT0p2MVJOckRvV0ZocVJFRFJNeXYwcDNYRzF6VjV2?=
 =?utf-8?B?TVp2TlZ4TXhLRnpkdmhzdTF2bnhabGE5VHJHNHREemFWVURGSzM2WFVjOC9H?=
 =?utf-8?B?ekQweDRSYzNuakQwNUpDdEVMaVlpRUt2V0JObCtmd2s2ak5HWlhrMDh0WHZL?=
 =?utf-8?B?bnlxNElOa3FuNFE3YThaaHNqa0tKRU5hbFlMOUlKYkE2UzBRaks5VmRjSVN2?=
 =?utf-8?B?V1hUak94Q0lHZytHK0h3V3dlMGZ1ZjdaVVZmR2xpUTdmRGs3S1R2NXV0VWY0?=
 =?utf-8?B?eVVyVDZ5YjJ1NUpQR0JodUpMK3hya0ppV0tPdE1OckFickIxK0tuaHJHV1lH?=
 =?utf-8?B?TGFOMlFVaUNPMExSUmtqL1FEdThSVjF2NUZqS0xpakVkNW5HNk5KTUowekc4?=
 =?utf-8?B?Rko3M0NDSGs1cU9ZZW9xdElYSklhb044M0RjVCtMSkpjeEY0Wmw4TGdLc0pT?=
 =?utf-8?B?WjR5dkdRMEYxU09aUkx6T21vZXJSS2NxNlpXd0g0bkY5UCtaa2JIdTRlM0Zv?=
 =?utf-8?B?TEo4QVJLOWJ0c2ZTVThjcWRCak5kQllEdGU5clNxbGFHazBpV0doOU9TSlFn?=
 =?utf-8?B?R3BqcTQySkV0RnJoU1J1dEhtcm1CSXFFczVDSE1MM1JqRHNFaGJIQSsvNFpL?=
 =?utf-8?B?QWFyeHRZRXlFZW12ZkdsZzJOM0Z2MFlKVjdSZmIxNXg1SzdHQWNoWVlHWTFR?=
 =?utf-8?B?c1Fjc2xnVER5NVF0YjFSRDdSK0x5VW9TTmhiQk5SSGc1WFRIOFdNMlFEYW1Q?=
 =?utf-8?B?TjEvc0pkNWpoZTJTK1djVzFUa0lmZFdqT21EQjdYUHZkd1hhN04yc0drNU1i?=
 =?utf-8?B?dzJUeXZ4SXJmOXFKYnEzdDhwZm15d1BBald3cGJMQ1RFbmRMWGVFZ0NvUEEw?=
 =?utf-8?B?K09rMEJFNUd0K2ovSTJiZzJVNEZ1SWJPem9jTlhmYnhmYUFCZCtIdlhZSVI5?=
 =?utf-8?B?YXJaNWhiTVRScnpqa0JPUFFxVSsrSlhkSFJjZWtBOFRUQUdKaFpqd3lNTHdz?=
 =?utf-8?B?Mkh2QWVnMDU2a0ZHL3RTc01pZ1J1K1E2aDN1dGZ0NXZPdVFYeVhmNWViU0lO?=
 =?utf-8?B?VkN5Ym1YdG0yWmVDOGMwMSt5VVZaRC9nanJVV203QytuSkR1MkNBS211Nk52?=
 =?utf-8?B?QnJqQ0srM3JKcnY5TUZIV1Nucm8rdE1xYmhhdVlwTzRIYnFrdTRnYWkyQnBu?=
 =?utf-8?B?eThHVTZXNGx0Rkt3MUdpOU9FSVdJNWhTU1prclVQYTNTVmUzYVIwNmFCbSts?=
 =?utf-8?B?N3pCT09xOFlMTkFtRnhRWXVVcHgvNTE4WDVVWXBEUUZsZE5LRTZManFVZjZE?=
 =?utf-8?B?VWN6eWxpVy9DNkdpMEVYTXRSY0VBaGhmcTEwN3pIUnBtRUhQWnl0U0k0NnZB?=
 =?utf-8?B?SVpPOFIvU3BBdmJHcjRFWW96b3JDeFpQYTQwZUFmTW95Y3BwdzNERnZ1YVV2?=
 =?utf-8?B?N251KytQSlBYZndmaENIaFliRlFXNzEzMm9ta0U0bDUyQ0pZbEpsSlBwVUIx?=
 =?utf-8?B?YUwwWjlaeGVXWnhvQWVKbm15VWRWWlZ0WEJGcWpDU3FWcC9LMFlhTnhJVGhY?=
 =?utf-8?B?RTFyblJXaEdnL3kreDVEbDJMK2pZRnlvWTFHd2w1dEw2QXR1ZlNkVGRJNXc1?=
 =?utf-8?B?ejFEZ3BBcENoR3pPRzkxTit1QVZ4Y3l5QytFNjJTR29CV0VYeis0ZVpJNUor?=
 =?utf-8?B?R3BzNWUwVEhIRThQMm5PNEsvU0kyYnNRY0dWNkVObWprQmI1UVo3aVlvRGw2?=
 =?utf-8?B?bk80N09Udkd2VmNoN1FtYVF6RzE1UjBqQjJNalRrb0ozNlZLK2Z1cGZ5Vnhm?=
 =?utf-8?B?Ums4WmpLZGxlZC9IUityRXVVSlg2Y2lUK0dyb1NuMEZWUnVRbFhySy9FY0lj?=
 =?utf-8?B?Uk9LeXM2Smo0T2thclY4TlA3M2FkNjI5VHV6TzZxMmZKM3hnRkFpMm13endE?=
 =?utf-8?B?T1Z0TTVia0d6MmpIRWw2UDdrQ2w1dUd4UDYwUjBXQXRUUmpneW9DbHphN0sz?=
 =?utf-8?B?MENMVDRLVXllbzVGUzVBejFoVytZajhOdyt4NGFqSCtkbm5Wc0RTOWdta3Rt?=
 =?utf-8?B?Tzk5ZnRRVmZGUWZCT09HT1pzMXQ1QkNrMDI2S3NwR0wyb1lpc0NxclhHdGFQ?=
 =?utf-8?B?cHNQcnA3YkVnNXhMRmNQK3czMmJ4QkZMUWpHanpvdE90dDhPZjRKMGlCZ0hw?=
 =?utf-8?B?Vm8xQ3IwY2svQmt3ZXN3MFRqb1k2MWExTitRTUZWd0ZTYzI2UlFNUjJVSWZy?=
 =?utf-8?B?MmVRaU5hOTdqNUFVMUhFYzJORjB5ZGc3YjZQZjZ6K2llY1hIeXpad1NnTXFK?=
 =?utf-8?B?SVVDcG1IemJ1Sis0NjVjajZiUkpBOTRnOGl5OTNlWFZZUW92Mjk3dz09?=
X-Exchange-RoutingPolicyChecked: c/6qioPeENzK7wy1xhhJqMeDPBtLKrTNmUgThVWWwzfpisMcuNia15XveF7jZDcZhxAZKChyuZEnXPmUfs9SzFWM2xRu+bsykSDE9cxyiCe5jwuz7n66r1EuZYiDKAwzCxWC/QtiucCV4bfdwuC4sLpdFelwWaPhNIU8FGoZCFQOGnOeXysg2fWPBanem9LtoV8DZiR8Rs7ZeLDNfFBtZYOhNIRQ3h5zQq6CGUje04kPJ3v0YMT/MvXJ55nC/i3IATlNOsgqYVTuGoUGOOHHMw6lP23LV5NOFNy4JZUf7x/GNI43SGhGk+Y9ZVJASqOybO5QbDqChLEJasOc2rx1AQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 130226df-69df-491a-e802-08de8aebf259
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 03:58:32.4399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fquTt1ProCgID2lBJtpumDKjB8Vsf5Kc5R6923A29QSORhxLf+YHUZEH2TCRTUXIU/fhLqpwgbd6uT1XZwk4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

--------------yvfXodvZz5bwwOW0jiEu0rHK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 3/25/2026 4:53 PM, Pranay Samala wrote:
> Set the output on CRTC before getting mode and override it on output,
> so the selected mode is used consistently during validation.
>
> Also handle the joiner bypass case where no non-joiner mode is available.
>
> This avoids failures when CASF is run on joiner-capable outputs and
> keeps execution on a valid non-joiner configuration.
>
> v2:
> - Get mode after setting output on CRTC (Karthik)
>
> Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass joiner modes")
> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index 96fb139ae..c9fc191fd 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -438,7 +438,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   
>   			data->output = output;
>   			data->crtc = crtc;
> -			data->mode = igt_output_get_mode(data->output);
> +
> +			igt_output_set_crtc(data->output, data->crtc);
>   
>   			/*
>   			 * FIXME: Joiner + CASF currently unsupported.
> @@ -447,7 +448,13 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			 */
>   			if (is_joiner_mode(data->drm_fd, data->output)) {
>   				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
> -				igt_info("Executing on mode %dx%d@%d\n",
> +				if (!data->mode) {
> +					igt_info("No non-joiner mode found on output %s\n",
> +						 igt_output_name(data->output));
> +					continue;
> +				}
> +
> +				igt_info("Executing on non-joiner mode %dx%d@%d\n",
>   					 data->mode->hdisplay,
>   					 data->mode->vdisplay,
>   					 data->mode->vrefresh);
> @@ -455,15 +462,14 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   				data->mode = igt_output_get_mode(data->output);
>   			}
>   
> +			igt_output_override_mode(data->output, data->mode);
> +

'igt_output_override_mode' should be moved inside the 'if' as this is 
redundant for the else part.

With this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Regards,
Karthik.B.S
>   			if (!has_sharpness_filter(data->crtc)) {
>   				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
>   				igt_crtc_name(data->crtc));
>   				continue;
>   			}
>   
> -			igt_output_set_crtc(data->output,
> -					    data->crtc);
> -
>   			if (!intel_pipe_output_combo_valid(display)) {
>   				igt_output_set_crtc(data->output, NULL);
>   				continue;
--------------yvfXodvZz5bwwOW0jiEu0rHK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 3/25/2026 4:53 PM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260325112320.2879230-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">Set the output on CRTC before getting mode and override it on output,
so the selected mode is used consistently during validation.

Also handle the joiner bypass case where no non-joiner mode is available.

This avoids failures when CASF is run on joiner-capable outputs and
keeps execution on a valid non-joiner configuration.

v2:
- Get mode after setting output on CRTC (Karthik)

Fixes: 10dccc7fc82f (&quot;tests/intel/kms_sharpness_filter: Detect and bypass joiner modes&quot;)
Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045</a>
Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/intel/kms_sharpness_filter.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 96fb139ae..c9fc191fd 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -438,7 +438,8 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			data-&gt;output = output;
 			data-&gt;crtc = crtc;
-			data-&gt;mode = igt_output_get_mode(data-&gt;output);
+
+			igt_output_set_crtc(data-&gt;output, data-&gt;crtc);
 
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
@@ -447,7 +448,13 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			 */
 			if (is_joiner_mode(data-&gt;drm_fd, data-&gt;output)) {
 				data-&gt;mode = igt_get_non_joiner_mode(data-&gt;drm_fd, data-&gt;output);
-				igt_info(&quot;Executing on mode %dx%d@%d\n&quot;,
+				if (!data-&gt;mode) {
+					igt_info(&quot;No non-joiner mode found on output %s\n&quot;,
+						 igt_output_name(data-&gt;output));
+					continue;
+				}
+
+				igt_info(&quot;Executing on non-joiner mode %dx%d@%d\n&quot;,
 					 data-&gt;mode-&gt;hdisplay,
 					 data-&gt;mode-&gt;vdisplay,
 					 data-&gt;mode-&gt;vrefresh);
@@ -455,15 +462,14 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				data-&gt;mode = igt_output_get_mode(data-&gt;output);
 			}
 
+			igt_output_override_mode(data-&gt;output, data-&gt;mode);
+</pre>
    </blockquote>
    <p>'<span style="white-space: pre-wrap">igt_output_override_mode'</span>
      should be moved inside the 'if' as this is redundant for the else
      part.</p>
    <p>With this updated,</p>
    <p>Reviewed-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a></p>
    Regards,<br>
    Karthik.B.S
    <blockquote type="cite" cite="mid:20260325112320.2879230-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 			if (!has_sharpness_filter(data-&gt;crtc)) {
 				igt_info(&quot;%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n&quot;,
 				igt_crtc_name(data-&gt;crtc));
 				continue;
 			}
 
-			igt_output_set_crtc(data-&gt;output,
-					    data-&gt;crtc);
-
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(data-&gt;output, NULL);
 				continue;
</pre>
    </blockquote>
  </body>
</html>

--------------yvfXodvZz5bwwOW0jiEu0rHK--
