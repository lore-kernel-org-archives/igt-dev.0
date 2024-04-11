Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CC3C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 15:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298A710F192;
	Thu, 11 Apr 2024 15:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FM0V1biv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E34710F190
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 15:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712849545; x=1744385545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MOW7WqNogWnUwy5o4xb2C9hci8KgEEG5GYZx6q4jmSM=;
 b=FM0V1bivxTLWTyuPv8Kcc5vD3kmZi175zJl0bPdVyLVEccqNIebVysGY
 FTq6MW6Le/QpNbWEOc7+S8IGkKmiS6AzywEo0BvtFq9b66KIwXme40mgK
 eXDDpv7fRfZ63KOmX4Sj7mIcOp9yVKXqiFlDjML4DPlv3F8/3wR+vfaCL
 15mkx+K5XwPjeDeuWZCe+nOkshOaiypSmjnHQnl9Vlph+zmMFzee+mvp7
 1QPkZLLXCj2kBrv+s2NwHiPKe+7cUichZbbWuMhU9t4uqYavGizMEusWX
 isCPOWFgduj9yH3PpsMhcrRVbV3m40If1LGYjlM3EScwJ2kmjdKussy6H A==;
X-CSE-ConnectionGUID: hYLIpkqtT++N5Us0ioAxcw==
X-CSE-MsgGUID: /ZxB+3NNRyGzHdPqY50etg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18824702"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18824702"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 08:32:25 -0700
X-CSE-ConnectionGUID: phMFKx+gSiqx8rocXHk9Zw==
X-CSE-MsgGUID: Dh+EaokaSCi76x541m831g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20841552"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 08:32:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 08:32:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 08:32:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 08:32:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 08:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4uNaSZaAy0gKBO8a8kIwN0UhCPbnIRIuPmtivuYYstoMv6gMdF9u6qtMuMhhfAbusc5Yz0ww8duujZqDobKfcNYLQeGNXHOcCkJ/V/pMu6HmkqBt8x6cj78wutRRNj7lQs749nX1p8r0oBbVr/CG3HIFrDkxtdHWn6v+I/Kh5oA2NLQOkWMkycIIfyrBGdbJW2Tm6/hZ1ks15ooE2MkOGCWLTnNqPL2QVh//F7cLYSFAuqquDYhLJ5NQAFCabWS5bTrlsYfvTyje1hgKPCk1nNRe+XQvj9FFvE7DolAm1EsoxQAyPBaB0vTeKSkT5PCSVC7rtH4dkN+uOrOhYVXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLjy4vLusNrHMN7Tx4kGyFovgK6rc9x3vBUe3b+CHfE=;
 b=NuEI0FRakzX+i2wA8h+fxc0Z6NS57Bk6wj6aiwC334W73qDUFSTN5TSzeA61YlFXN/h/TBCrEOg8Y1EAdvv8t1OMqJWHzJq3bcj9+3Y5eQktvsTT4vwU1pPrUmjXvLW7WeLjrpETvmfHZOoOcQgCIQPPWY7uxX8BBWId2yKjgZdJODonkbb1E4Y5KELu6G+1rI79vUYB5XluiAaQoAarVYMF38uK5VKpWas1hEO/scm0PUoktBRmM1joVDwAqXmOZEDtnhCA5lii+MEyfTKLTWJpoLuQxXzqdfGBZXrVrtYnmLN8d2u7YBR1JGne9ifkeg6i6UGfm7O8J+sOJQyB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 15:32:14 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::2875:354f:eb25:a4c5]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::2875:354f:eb25:a4c5%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 15:32:14 +0000
Date: Thu, 11 Apr 2024 10:32:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
Message-ID: <t5enlgj5nis26yzjvbwxlict6rpbugc4yj56zai5ibxw72g634@vvfryvmvmk5u>
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
 <87le5k7028.fsf@intel.com>
 <bwwkqrnrd75zdnllhhtw3bapgz3fzdv2gjestlahdr4rxohxx5@5xgdosdtqwsa>
 <87cyqw58x0.fsf@intel.com>
 <75oqxqfgpu2gop5zq37hctzul7ztx2r2gwigxvl2trmwomn2lz@zqcsidtq627p>
 <87a5m054pp.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5m054pp.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: d8be69b5-dd06-4ea4-7b2c-08dc5a3c9024
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kod6uUi9zvUDFynvIL+XLda66D8ZUmzEf9F96++HFej/3JJpoUYLvg6y71ZXIPmAjSuNZ7AS4RtoeM81h4D50lX6krbWbvKX6CCEDSXp0OiOSIyf2MswIN//BK2t+jHk33BE1WAj0e2OQ42F6k7ygA1g5CAPXJ9aINPQxflDQdyVSk9YUN5cDXD5dJkeMoEKgqlPyn08aPKSJdsdKl0E67JLP4tr9/mzM2IAqJPuoX9T2wiYCA2JoDeC0DhH1jcFQox/spjTjMATIWZxOyviTVUD6HqpH8zWGxObD7iMtwULOLNVHVEopkk5SappkI7aLj2Sq3nR59wTV2rjrtELeMeNeeVSsQ1QvAVOtl1sWYJfOyhZfvIEaVaj2PLSaS2kSNOf8dVT7VrsrpyVw4tmmB9TK0ckK3RZw2Qr4MoePMvvFVHbzx3qTE6Ekry1eIjXP2N9vFyRaqcB1d7VKbOCbDMle4RvFTCkSDk8CF9eNMGtCYBQmLd0rI4kFvFHLE+5UQWfP8k9ygkNRm87Bu2jHVQZlGT201cBQy+UY0bhS4tsI/6b2/0jLmGWd8Y2x4sKEgLomGWCSpE2yMR7Xkh08mB4ARNGUmZ4EgPb3lzCgbW1+MGQ3gBil8neFNQC0nLlaixn0kAu4mPg3V62VPMFczPen4MUi02xeCuL5lRd/54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jl9TS/EWPGhZnjwpQByGCb2oFlyZYI49BR7FwQg6uriD55aOBuebDsFCI8mO?=
 =?us-ascii?Q?5eAfsv7Z5G7icYpBF4/j+I+GWuCPAyz4tCQw5PqH33vxjTB8Q6Q0AAc3MPEM?=
 =?us-ascii?Q?07NTfW0q+nbY19oNSJKYrFxtThck32m0LENHtEZxfqeiwp1k5/THtmqR1kiK?=
 =?us-ascii?Q?DtyackchtidcNS/BCX/yzUJOMM/l6MDtrKUqttbfj+bCofzXiI4/8U1eLX3Z?=
 =?us-ascii?Q?7nei5BUxv5KQbvSxyfmVjMDAuKl9KpykF34aBjZzDREfuyvF0L8lsD8QFkjJ?=
 =?us-ascii?Q?OwyOrzadRp5pfL957Md+GvaRiYlcnVZ90sTKo8n1ftfgc6vz4tTSmkqYAdDf?=
 =?us-ascii?Q?Kdi7rJeRQRnDWs94M+vB1Yl2GUf0PQv75oAccWAWIG6pId5tFS/9SOPhUOAF?=
 =?us-ascii?Q?MZ0kaogmtlFnUKNtBY4D05At1ETsASher5ItXx11EvK6tCCmJt5C/2QcpK33?=
 =?us-ascii?Q?O/rBsLhbbjhiQmoqFnrdKUVMff6fO5xLjOS9Ok2aqMUoX3k8LnqBT/ycjZ/1?=
 =?us-ascii?Q?vANkQuY/W5DsDNEEwwmk3FJKB/Kg0toPrqn25sNlq1nMTE3iKQIM7n0LVASJ?=
 =?us-ascii?Q?7gsFIJm4GS11SCUM9gh4FvDY0yjsQKHgG+08GgqiqgPMfFzOvyUPR64SFNLZ?=
 =?us-ascii?Q?5Ou3XgxiQEeu98RbjipB6FMu5IMJ8xwzVbpf/EOOPwWdQ6ameIRqH30OPZCq?=
 =?us-ascii?Q?acQ8lJvyO/fgHZGYZVcKwqpvdHbdk0orptFJlBmvqrtt/g8pdqSEBnx/66Gs?=
 =?us-ascii?Q?YmGCrFNP0gi+AdQ79tb5BD1Z2h21aQZi8ezu8oDk9gZ1L0gvj7FiUrZRdKF0?=
 =?us-ascii?Q?34x67lVyAdg5ehqvQwdBi1e+v57dqTsqNMeKWWpgc8VQ85ST/oFGVIOyYuCW?=
 =?us-ascii?Q?EvHduUaukWOQmHP3UYWWhJE0HIh35P6t99uqJrGAxR8n5eoLX4modqXyrekH?=
 =?us-ascii?Q?D/PmAHMWbCMvZVCsemT3SJrG8UJk+9KhRnAGtfuwlFKm6GUOFIyStCBZytXw?=
 =?us-ascii?Q?tsGD56/zXzCMWsKAirz0TZJ18Ek4/gqc07Bs/6W+UQE/2OSeaUb1W7BnNM+P?=
 =?us-ascii?Q?hrdKivbsuloPJvaPHs2z1h/i9ZwcVAcwoL44BWug6lwoM8NZ05VtK0EdADB9?=
 =?us-ascii?Q?HcvlwVmaBlsVta95ViwzTWQj/TRJsH5JF6w+QRg7A35vJh7oR3JKkzX9A8RM?=
 =?us-ascii?Q?VyQcKI64hIy98phLRf/MS29MU+APR5AvlPU9wf7ywPZQmcP1PqqifrusxvNd?=
 =?us-ascii?Q?cDfwkQbIjAutw8l19dqyQuf3Z71dAkA9dieiya8bNkX1PpYISth9AxCWG2v0?=
 =?us-ascii?Q?O2i9MmUbA4gu2UJz7xkSUuJNSflFodfSQ0NkGcFnupkgqMbqJ9ZNp0SZPA4U?=
 =?us-ascii?Q?ZUXUjWTaU9CdPIM0rq4VwkKtIT3GIN+LvkuZAtGUwAcQSPkGRgDCbiKogGR+?=
 =?us-ascii?Q?LzrqkoMWwoPAkggTk5nzQ9m5J6ZBnVeglPlWl882k/6R4KWLCOGKNmWOkWQY?=
 =?us-ascii?Q?NWZr5pqDSr5YSif01K/jBLyGVLnSqJF+VavW6i6iQGyHPmD42Z0+EbtSU1Wy?=
 =?us-ascii?Q?nupqF68pueFZCpEB5LMIEROfEroFX12y1WolqyBp5vU/WHQNPYUZUwzRwutN?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8be69b5-dd06-4ea4-7b2c-08dc5a3c9024
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 15:32:14.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0fzMxJbYpyhw6ZcAhlATHusFBCcryDjjW6x6KUmStPW3qWKi/LMMDH68PeL1HNR+nXTmkrZXXua2u8fVIisUfp4sCTc4xl/w4wxcySD29g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
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

On Thu, Apr 11, 2024 at 05:55:30PM +0300, Jani Nikula wrote:
>On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> I don't think we will be able to invest time to manually update them.
>
>Agreed.
>
>> I have a dream of being able to partially generate the regs/*.h file
>> in xe. Maybe if we ever achieve that we can think of using the same
>> source for igt.
>
>Agreed.
>
>> But as I said, I think we are far far away from that. What do you think
>> should be done in the short/mid term?
>>
>> a) this patch as is
>> b) keep the warning for verbosity > 0 as sugggested by others
>
>Either as the first step is fine by me.
>
>> c) just remove tools/registers to simplify the code. To be added back if
>>     we ever figure how to autogenerate them with the same source that
>>     autogenerates the kernel
>
>I think they're still useful for deciding the contents of intel_reg
>dump, for the platforms defined anyway. I wouldn't throw them away.
>
>> d) something else?
>
>I wouldn't object to incorporating the information in the tool at build
>time. But if nobody has the time to do that, just let it be until we
>have figured out a way to generate the info, if ever.
>
>Since the decoding info is starting to be out of date, especially the
>builtin stuff, maybe it should be made optional via a --decode parameter
>similar to --binary, and default to off?

sounds good. v2 will be  "keep the warning, but hide the feature behind
an option."

thanks
Lucas De Marchi

>
>BR,
>Jani.
>
>-- 
>Jani Nikula, Intel
