Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7FC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 12:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA710E098;
	Mon, 29 Jun 2026 12:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHmYvxuo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BB910E84A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782735539; x=1814271539;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=8p4Ci+2tHtat0AsedqELkSJTAGt4bcV2KKztz3LyJx8=;
 b=ZHmYvxuou7PkCmb1SitSqLCMHCArWfCYTGqcXi23/TMsuWqIwMkuABsm
 eLZIUWjxk+U+G98Yj/mUycKgVEvVtqDtEkC5jM+U5xfdCUA9P58175soL
 7/7Jpfo8/D2xP18NijsRXbJ7FiABtidlx9DoiV7wft4whOI0DjZ4NNcqv
 E26/yHZozRzfEBdDkTCdmOh4s01ggKC5aG4R14NJAzG0HrkEPVPWpMBSG
 Oc8lzliSpM4wRD34eit1PMePSft7fEQExdERj3yHfr/vu1lFmRWDdgTJr
 E5AYiWIZqQGJsuDUrG5nVdJHSpIOLKO/7DUj61xWnhcv6zASHbj7rM292 A==;
X-CSE-ConnectionGUID: 5Z32+uf2SUC2pLUcGXVCjQ==
X-CSE-MsgGUID: 7KOBi9/XQtKKpdoI40u8cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="106215199"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="106215199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:18:30 -0700
X-CSE-ConnectionGUID: BGXncjJ6SJCL71JUi4R7fA==
X-CSE-MsgGUID: 5bvucmV5RuW3utNIj3oKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="250876902"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:18:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 05:18:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 05:18:00 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 05:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyhaFW1DlmIVb5a0n/wjFvaFUmCRULXCM7kKK38lqFBEq4J0UIoWjxx0c19EhDhaTCm331Zd7m+//boBLAayMqHW561d+gV8TlS8M92U9k0acRqRDZwCMWDtYPXKbHNQrJ8Au3WA5KGUJvB3/svZiiF6anS5llToZeaQdpR2EuxiZUnN1/6kEa1KzjIGctBBQBLGiAfTcRhYIX42VJvl6b3ED1XRCf6UhrzemkHoHCO3uAjkSfcA2ASNHMwDN49je9PUNFZqWMRYZTQxVsg56Lb2d75Xx3lYooeq06M4QPBnps8LUWmIZjezjqElw1bVnZr65siN1C2/8lrKxmVV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv2igsYHVatm66vS0aGD7BddZOHnPHDkuyBu7S14rUg=;
 b=oYZ6t5Cb/Ij0dN+jnZ+bjCifPSVms8yelSoXzDhGbY4Dc2Ybk+IKOKwEh2XYwBKYhKooMLtLRdIseJnl0/o6nTMOMUB0qLxE6TPCJlGOGucHGJsek45XXMO+HzpK0B1dRKD124kx13GSpZSVFAjYJe+5VXoQSuRcyp+EbOZ9cVAltmtKFTrC+DNWYBHON8qsIGTGTdgfS/nMHYJhYpHhnE9ZCPYD5+adPMrBk0Zp/TpuFvNcvOiHsHRMpPm+3/ufQqr35s9edohl0EpQ3eIIGbT07/aNyk44JeWdQ8YPVI2flGQ/pEPVZvo1HprtysIv+M8uLsRXjG/cDf6wIYNk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 12:17:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 12:17:57 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
In-Reply-To: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
References: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
Date: Mon, 29 Jun 2026 09:17:53 -0300
Message-ID: <877bnhtua6.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ2P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5090c1-eada-4ba8-a061-08ded5d8742b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: eeWOrsfNshCvHtqV/KZvlgLI+0lqmXA1N/Ykf13QED6V0/IuifRIjZ3Dr9Wc0GRUSscWCffjTobt1QTjUdW+Fe5kSjuvxQwTsJr1JuHYJQXlS5IH/gpKOXCO4Vuj0S+xXUMqabYsTyxj07tvD8KuSMwRYx96byT6Nn5d0tjkzXPTir/HdZ6vw1Y2B7nKgFS3I2MWvqD1xzX4NM+tOy7wNlSEO+nhkt2wdxnIdtcOrGGPmCAvmWUIImmRga3IyQkZgJ6hGf3cvxSgDporP6LKIGtX9wWhELxks/05bbN3LQ103f9BZeIm6mOMj97ZqRGdIugC+Y66RjdmvyrFrDXQYrWV3oukOhht0ZdtVO1KOs3EaLmMcOEm0zrNUEwAWleEpcZBUw/98EmXGrcgr/jvtNaHt4/zzRPRiAtRVbJz6DLBP2sq8YAzsAXm0y4uVpS8eVDghRrVMxByQ0Ss4ltn7TkhADKgKwz7nEE5TkWMp04/kzaPRApZ341Aqgghgp7N6bsrXw5W9wc4uc62euHFgHt4NK1zSApJGzB22u1f0jNifFa+EAIwp9adQO+w9MOf6S6lND2bDKKC8yxinx6q3ecZHTxa2bzZIg6s78F3ISf/NX8yy9mVNnczSGYiCeh0KnmQe72vP6ovh7/tOwshMxRiqlUmrg29Rt+Y1QADWpk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW5IZ1M4K0Rid20yd1doR0M1bHV1Wkt6N2tCTXNIZG5WSXFEcmpjTkpsWUlT?=
 =?utf-8?B?QlAzdWxycXBXZm1SczFDNXViNDNwbUFNMmJ0cDVnOWkrbUpORFY5WittTmtK?=
 =?utf-8?B?OVRXaURERXNZRnFDTlUrQWZOS0NXblJyaUR6djJDVjVjTEN5cjdOcm43NjJl?=
 =?utf-8?B?NFhTdkhoV1RWd25JdUk4ZWFaK0lFM0dYZ3ZtY3R6TllyVFo3d29nTXdxMTdm?=
 =?utf-8?B?Z0VNZDR5eU54OUtlaHFlWkxyK2VaYjhNSUF4VVJFYWp1dXU1QmJ1VGtGcE11?=
 =?utf-8?B?QUZvRmdFUVl1cjhVbXpnNkphdlV1N0pxWUNqQksxVUVzbVVzNUxpcjhwdWlR?=
 =?utf-8?B?bUpIZWtPQXRqVTZIM01UMnFPQVhML2tKRjIrS1E3RlJwVVROTUphYmxpMzVm?=
 =?utf-8?B?dHROcTZlU0tINGFOdFRmL24yRUhTamozenl0L0pDY0xoVm9melJ4SVE2NTBv?=
 =?utf-8?B?Q29UVStRaG5BSkxVczd6cFFkZ1hERG0vc04rMGVYdHRCYXlqVDdtTmJURjdj?=
 =?utf-8?B?azBCT1Y3K2djVG5aL0ZRUkMvTk00dnNBaVZpVE5KZmpiUE9hWjVhMlU4NjZE?=
 =?utf-8?B?NDJwckZOOHhiMCt6TGQ3bEhOWks4TU5SYnpoNlRRZlM5STluTEJtUVlzaGxh?=
 =?utf-8?B?SjRJZm1UU0lYVlVqcVVmWnQ3VHZkNGlJZ1NhcU9mVE1hYXRYOFdwbUo5QkVP?=
 =?utf-8?B?WTlsWkttYkdkNUplZWowbkd1Ung2QTUzUlB2dk5tZ2FMZHhjZmVGS3c4NEdo?=
 =?utf-8?B?TGFKRHBuYVVkaEw1QUpodkphSG1Kbkk3N0h1OCtWTWxmaGU4NWNmVzBEL2ly?=
 =?utf-8?B?dnRiYXJtclIyWmpWOURuVFR6WHlZQnJkSElsZkROY0RCQzVhZEV6WUF3YjFS?=
 =?utf-8?B?YmVhWFgyTmxPbFFLb0xUTU40RHIrLytXR1J4ZnpEOHN2NUJZbzAxVnlaK2xW?=
 =?utf-8?B?aTR1cEhOQThoSmQ5OXVMNGM4bEU3dnNkY2loZjBEQWlhbXVQb1VzYjdvbVVH?=
 =?utf-8?B?Um1GWlFzT3FYQjNZZTNxb29UdjdXVlBDeW40WDVJdmRvYk84V2lpcHdxZjVo?=
 =?utf-8?B?ZmZIS1djYmJRVjkwNEJ2VVRGNFJIN3VWLzFiQjNKSUgxbkd6bkVZdFFNU1d1?=
 =?utf-8?B?ajU5ekhyTmhhaWMvb05oazJjbnpLZE9RUytxZTNGWkFEcWpKVHdvbVhhRzB4?=
 =?utf-8?B?SEJPTlVEcXpCY1MzZzZkLy9ja0EzRy9sWVkwVWFSaUNybEQyYzhDSmFiSDFF?=
 =?utf-8?B?VTlldnNndjJGRlRrakwwdDRUQVdaMWxJZ3I0Q0RkcGFYNnZhclQ3bWkwMytv?=
 =?utf-8?B?Wmk2bE1mNndOZ0twenZsVGlJTVpsbS9xOU5pZm1HeHBLbElvN1Foc2szVjFp?=
 =?utf-8?B?WDNrUTM1Yll2SmR3R2Y0WUp4OXFSTG9nTTJEUFNEYzlTOGhDVU1SUXBMbTBQ?=
 =?utf-8?B?aVIya0dnZFA2amtxQUVhUkVaZnZNNXJGUmNHU0FHRDhYSDg3WlFTdHNXQUdQ?=
 =?utf-8?B?OWJWQVZnZCt0YmtiT0FHT2JNUTFXR09VT05VZzJCQVBHend5dTdJZ0lpR1Ji?=
 =?utf-8?B?dmYwaldyazB2T0ZPdzh1R3pQc3pHQkYyRmxQdk84cEVoYVI5a1RCYXVWemNq?=
 =?utf-8?B?MGNFYXN4VzB3bDFMK3dVa2hQTlBTb05hZGczb2ZsNTVoWUdzbFVkTGhUZ2N4?=
 =?utf-8?B?VjEzOTVOVlpYSVNrQ0EzWXZhM3lGeUJnNEJsRzFqTXFIK1ZEdkprQlZGbmpa?=
 =?utf-8?B?cWl1dkkrVHNQV29vWGwxeXpyT3V0NzlwK3RYckhVemtxMFZicGtQdmprbldW?=
 =?utf-8?B?RjQ3WWlmc1ltS3ZFdGhoblYxMWlCck1LaXRmbmVBN0VncmF3cWRDMTliZzhV?=
 =?utf-8?B?MWJnQStsMkNZZWZITGxyZkhlUVpHaTd2Rm1FM3RGaVhOd1NIQzYxOE1Kakxw?=
 =?utf-8?B?NkJqYVpDR0t1U294ZnVTdzVlM1E2MWlJWGZLSnJQZlBwbWg2S0lNY3J5bmtY?=
 =?utf-8?B?Vk5VWTBBZlVDS0FENkpFdytFUmdTcVFPdEc4TStkYTVUdDd4TGx3U1lTS2xz?=
 =?utf-8?B?RmU2bERjMHdWeHYyaTNXcFh5MlAzWDBUZnYrWjJKTEdodU5FblVIaVM4dzNs?=
 =?utf-8?B?eGlGRUs3M3JIcXllVjhNSXhiWmxyWUE0eHYxRGtyaDQza2Vqek1kZGdmU2FZ?=
 =?utf-8?B?bWJWUUxmRmdZbW9Ia3VEY052Vk42Q3hpRnlqMDVweEtLNnZ2STlLd1hsdS9a?=
 =?utf-8?B?MCsvQm9HMllnZWNsYkJQcFJua2xaV3BwdFVDUERwenNYeEkxM2NqeHp6STBL?=
 =?utf-8?B?SWtKMHBaY1JvU1NHNERrVGlBY2FOR0kzaDlDdDZLQ2JBNXBSMkoyUT09?=
X-Exchange-RoutingPolicyChecked: oDYK+mSvKtLLWYXE3IMasbnuUZBsJvYRm40RTpyl5JxuKE7p5uuU0q2CPp5pm5+xJE4WmAwVSGvvkl8uK4a8Agft7bTbXfE/t16HZHFB07JfeQAA2oogEE6J2wDDnExBvCDC7BYP3sPmpv0Wu1GJYsLgPeOLGawb0bkkSMmFLmA7hACukzVc0AKBs418l0CFIf2G+aVQ/DVfp9qN1Z3eQyk8vJxXxpsb6EzPrpee5yQls3sURr4ZjRcGrOCvhRk0VIBVQoxF6co6K6Ge3JF65xklgYLlg2Q8LupNAvgZ33EY89miRsOqV97L9I25emeytZE5Y1KArl+bHeUfmha+9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5090c1-eada-4ba8-a061-08ded5d8742b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 12:17:57.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STHl4o4+QfUJLsF1qD4v3hlFr5m2ALNGa3lzylW8xJzSPIool3Qna1cWGrzyG/ILIR6OigQxMhdWKljimyt3bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> Doubling test name size might be not enough for realloc if target name
> length is larger than test/subtest name size.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  lib/igt_hook.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> index b8f25b6c7a..a44b852da1 100644
> --- a/lib/igt_hook.c
> +++ b/lib/igt_hook.c
> @@ -300,7 +300,7 @@ static void igt_hook_update_test_name_pre_call(struct=
 igt_hook *igt_hook, struct
>  	if (len + 1 > *size_ptr) {
>  		size_t fullname_size;
> =20
> -		*size_ptr *=3D 2;
> +		*size_ptr +=3D len + 1;

Oops. My bad. Thanks for finding this!

Do we need to use "+=3D" instead of "=3D" above, though?

Also, perhaps we could use roundup_power_of_two(len + 1) to reduce the
number of follow-up reallocs?

--
Gustavo Sousa

>  		*name_ptr =3D realloc(*name_ptr, *size_ptr);
> =20
>  		fullname_size =3D igt_hook_calc_test_fullname_size(igt_hook);
> --=20
> 2.54.0
