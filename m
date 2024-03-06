Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C7EC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 20:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DE710E842;
	Wed,  6 Mar 2024 20:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8b1b0/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AFC10E842;
 Wed,  6 Mar 2024 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709758419; x=1741294419;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ob/gnTidlPdfwfhpDDujQRa66hQ17R5eCK78rUr9yhw=;
 b=R8b1b0/EM+MbqT1Ccdx/Ht4rVCuQzvjAppnhvQ6zP9tITY9cbKu2ku6b
 IYNw89Y9s2xGC9Cp4s7SQrNqLJY4fjBjTaKT3eYiQRW7r7gu3Gc2JNMWc
 qKM8E2VPzSkW9mPCbDRqkRUsj8Yiy7PoKL2ARIrgs8+EM9g1cRxAAK1Ho
 Zc938sVA1E8D5A/y6gkJlQk0H+XEUdZcd5jy66mT0thq9ch/1fbfuiY9U
 VRqPtweD4qdiTT1Ld7q+wTRKBE/6yVO01fOyQFFIHWGe+XX5pqo/N+bkL
 +te38uG3FNLO0CUeBR4ZsRZWKIjKi9WLGwCimM8EBFbZ9PaP9lHDr5fOt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4521067"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4521067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 12:53:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40766031"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 12:53:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 12:53:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 12:53:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 12:53:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkqNI74KyQoACsfF764MEjScfL39gRuXq+b4pA5QZ+MjZB7h05kcc3zhAIgbdAAorirOv3nsptwssSKuCXJLoHrOC/L/Z+uTFjq+FmnWJ9sl0/BOdMX5aIA9G2BUP9Jrm9nm5fE1n6+iu4pRrvRPWfRqCslyJVJTFw3F9zsP1ikMb5wC5q7JdiYC88pzV+pd+ItayFRJv7b5lXP/23mYliWhUamGrYQ9vZHeLLI/BnOHU4GQAiX5IJUd9xSEDMKNBfJD1nwO6dRJP9ZZ5ad4HSbjLR1YJTks3x0MhmxfNcU6bW4YoZRUs2tVNWbx8bcWNrMML2zlZYZB9RJiq9phBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBUq4ehIA1zpQPMZ2Zp3qgTKMoyrPaWSaACvmvviGV0=;
 b=l+/bUxwHA6yAC3h1BUn6K2Bs09qqiNP7aBKZ1CH0tHNIOHIQuJ7VknAhPoyw1AmAQiZXIKL2zwvta64sCwchZuAPCL0nNxZjp2P/LiwYTMtOI51cPbpR9sWyikMFCHxG6crBAD2k42xy1mifNvsbFPt1TJ3jATTfxcauFUmfifRlgcOCFwAU3Qj2nN6vr3E1WSEHO9t2yuh5dfSJc6XrhEM46egub9BPPN+cU3q/dR7Rta7NC2nkYM/YCp8btFz16iPRLNDr34rf4bBTI8Z2knpmJ61k/umVDC9N0HhwGfzdsCfU4KEjMghXSuqkyEqEBSgXUA6QTrLIo5fRc8V63A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Wed, 6 Mar
 2024 20:53:17 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 20:53:17 +0000
Message-ID: <fa581ce2-ea6b-4923-b2c0-1fbe05f0b9ac@intel.com>
Date: Wed, 6 Mar 2024 12:53:14 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?gem=5Fexec=5Fcapture=3A_Check_for_partial_register_captures_=28re?=
 =?UTF-8?B?djIp?=
Content-Language: en-GB
To: "Musial, Ewelina" <ewelina.musial@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>, LGCI Bug Filing
 <lgci.bug.filing@intel.com>, "Illipilli, TejasreeX"
 <tejasreex.illipilli@intel.com>
References: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
 <170933449068.453612.2245101994274581916@8e613ede5ea5>
 <20240305175020.owfzmpn4frw2n7yy@kamilkon-desk.igk.intel.com>
 <52567ff5-e174-4842-bfda-304ef3f8066b@intel.com>
 <PH7PR11MB7073F81E83BDBC349214CF3893212@PH7PR11MB7073.namprd11.prod.outlook.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <PH7PR11MB7073F81E83BDBC349214CF3893212@PH7PR11MB7073.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e85266-db6a-41d7-82d0-08dc3e1f72da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gp9o/3LauaXwz/TzopLbEc68McQgiRMqjUmqIrSKDbFm+jjvJg/iG4PbT94LUlYWgzJ1JyONdOlGytSXc8c0VnESgO26Z5fO88tjUm/2uhzMMiCpyvWrCrgZuy+ZaT4GLXH65IAP32MgCOrHUnNtn8updGWLU4jVeNrIk5iO1AnIxFiTWBRtcTE05/JqfUiZ7sKTUmTPf5+vNnle6PKZFtPuaqolbtQHFXZ51w0eDXCtrM0Edhy21zPyEJLDk1Mv7aXkPCKbDL9+If499+Wma/8A+3VrA6RtKD8WjimUCVOQl8KK1IyQPbdTOtO24iyyUSRXn7hnlaXl0JXmeTy8TzWrS65zOuhnkBbIbcS7iZ2vunIXxRqx+6swVUbTBCyFQFpd9opj12ZBcf/bQVg4Hzrtb+CRZ7BsA9KJ1Cn4iFo7JK7Tg7GKFLh/HO/NY9w+ehNBdI5GdTdY218/nhUWKCaNYuMs03rUxcDLYKU42L+R4d7DReN7jPESmKA3I84jmb36zjPQa753dWvH0KzkbPMBp6dFhh+Yv5GJROQ0TDEciV7aCylg6e3CTp670wmbj9ct03PsB+KW/+6rGmfyRRbHJysGYNqWsWgfr2lCLnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVd0QkhCVEdmckFSY09uQkhDQWEzM2VmMWVXOTQ3NlJiTk93SklubkFKTUZW?=
 =?utf-8?B?QmtMMVYzTjNDTXQybWR1T3dSdDVCL0lxZTB0dUhhNThkS3VlejZsVVpSU095?=
 =?utf-8?B?OG9RUXF2YUpFU01qLzVvQ3dwOUpvRURMeWROb2JSNi9sK1d4ZGpHY2xnS1Fa?=
 =?utf-8?B?WXhVK2RIMzJQU2J2Zk4vWmdVUWE2bzk3R2VEODcyd1Z4NHU1Yk1WcWFKdDFG?=
 =?utf-8?B?SzZtMzlJM1RIZjIwZHNTVE5Nb1B2bURKQjZrOGdtbTZhT2V1ZGhVZHcrQm9o?=
 =?utf-8?B?aXhqMzArYjl4cUVFbEl4SjRoS2xnOElpN1hCN3AwcnBlc2JZNUc5VHIwVEpu?=
 =?utf-8?B?ZnhiOWxERkxTMytRY0o3NzVQeE9OVFYwT1dTTjF0RC91VVgvK0JtM1d5TlZo?=
 =?utf-8?B?dk83OVdzQ041VUN3YlMwUm1rYzQxeElQcWhjZm45M1FDem80a2VMV0crRnp4?=
 =?utf-8?B?QTF5T0x2TGcxd0VmOS9vMmd5cWxZQVRWcFR0RDVUMVpUdzRVZDZRM0dmV24r?=
 =?utf-8?B?ZWtnTDJlL01pVGdjRnFNd25WOE02NnlOcUcyZ0tROThiUmlLYXdIdDI1UXdi?=
 =?utf-8?B?VDZLcjR2dGdwVzFWTndweTdSMnhVdEZmaWtkS3V3VXI5MzZwRWtzSmk4OUtZ?=
 =?utf-8?B?UlQ2TEZENTFDNGdHd3JYYU9RZnBjVTVENENXKzYwREJpd2VhQzl1eGN3Z1RN?=
 =?utf-8?B?eVNoQjdROXZXK0IxcnhjcGY5Z0lKR3JDRk5kdkZscXl2aFhDc2VUTnFzc01P?=
 =?utf-8?B?WEZRZGlscG40NktCMzVUS0Ixb2s4REhYbEJuSjB2Vm5RclF2K3pyaUtmM1Nq?=
 =?utf-8?B?RDN0eCtYRTVvYk04VjJnZXQ0WER3UnRFOFNFSTRaY0t0M0ZqbllFemtEVXdN?=
 =?utf-8?B?V29tbUNMNk5JN3k3QTNYRU1RWEZqMURJVi9zcE9Ra09NOS9RZ0hNTitJMnVP?=
 =?utf-8?B?Um55bStUWWdrRDJsUnJYUDFsYTdmY2Rpdi9Vb3JGZEpUaVZPNEkvVkRZY0VC?=
 =?utf-8?B?SkV6cjFlR0hxRDZmdWpvekFZMW9NS05INzVCUzN5dm5qRzMwSm9Xc3RsYW02?=
 =?utf-8?B?VEtFbDZJd3hNNEcwZEw4bC9IRHk1WDNCVGlEYk10Z2l2QnRzQXh0b3dIdGpi?=
 =?utf-8?B?T201Y2V3Sk9GdjhRem9weVgwNTZiYUZjeGhjOXhkQ2dhT1ZVMDc5eWJwZEow?=
 =?utf-8?B?bGZZRS9KVUF5SXM0d1VPMzNJZ1RCbkdJZHI2S1J2TnVQbFk1cmlQK0ZSUE80?=
 =?utf-8?B?ZmFrZkFwdjVoUmFOajhFUmFSdU5iZHVydUlzS1QralNkaUJQSUhTU3l1c29a?=
 =?utf-8?B?bmRHZEJ3VklyNEFVRjZWWEVnQzF5aEEveExtdmdEYkJKY2tmTjI2Tjh6RFgr?=
 =?utf-8?B?RFY4blYzdTlpREVPRjRiM040VDVtb3ZYQTZWWk85c3ZVdzQ1MDh4MVFTRnBu?=
 =?utf-8?B?ZkF3MksxdG5Zemc5VUVhNnZId2VyUEVlTTlvd1FvdG9mU3dXOHpFWmtQUjdR?=
 =?utf-8?B?b0l3bEVhM3FSekVEajdnMzRIWDlXcWhYYy9LUSt2eGpyN3Y2VnRKUmZBNjhk?=
 =?utf-8?B?dTFBbUhURHN0WlM1bFc2a3VEbjZnSkhvMENCcFJ6ZWJ6VWw4RkdCcVBRUEtN?=
 =?utf-8?B?dHpnM1lTZWxEV0pvc1gzMFlKcU80YXN0TW1HVVlFQTJXU0RORWZiYnRUNmN0?=
 =?utf-8?B?Qm9IRHdGMWZxbVN3emlZWGxEaVFXOEJFYXRlRWtZbmdWaUcwRE5qYXE3UmhU?=
 =?utf-8?B?aG9PcXVRb00yd1FHaUd6ekY2L2JrMmVvVVVOZ2ZKeU9SQUJKU0ZTUFRGR0Mr?=
 =?utf-8?B?bzR1eVlkT0k2K3RrNlJiWUlFSGVVTHR3di9JLzd3L1FvZFVYbGtzdmdhQmcx?=
 =?utf-8?B?OUw3Sk1oczVHYjlzeWdQOG45aUdXVGZEUGIrNFZVMXIxcXFQV3lHV3ZJTDhs?=
 =?utf-8?B?aHNqR21TRnBuZmFnNXppMlRKaEc0MmZrNkhCTmo4Y21hb2RzTkxvcEI0c25z?=
 =?utf-8?B?RHB6KzdkR2RnbWc2aGR3d3hvUzBKQzN0eEdBZlFZN0dnODF0WTlFcmRxRXh3?=
 =?utf-8?B?emwrNElSYU1nRnIyb0lhTTB1WkczWGc4ZDBpZCtPdStSazlJZldmNE11ZzRB?=
 =?utf-8?B?WldLM3Jvc1M1NHUxbjNWZnJydnIxbU5YemtoTnZSN2gzOVIwLzZsWldoRWdO?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e85266-db6a-41d7-82d0-08dc3e1f72da
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 20:53:17.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/opUx0E9whuB6QS67MF9JHYeJvWufeKAH1CTuziWAaz1IPm2Zqx6s3fLBP+puAZUjvhBCjh/FB4YPKaOTn4y6Y8DdFKDJEZFk8mFZv529I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
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

On 3/5/2024 22:35, Musial, Ewelina wrote:
>> How does one know what build of the kernel the test was run against?
> At the end of premerge report you do have "Build changes" section where you have info about components like IGT and kernel, eg
> Build changes
> IGT: IGT_7738 -> IGTPW_10760
> Linux: xe-876-12db124b8cef9c32b7bc69a5abbaff016965cf99 -> xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774
>
> It means that IGTPW_10760 was tested on xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774 kernel.
I have no idea what that means.

That git sha does not exist in my local pull of the drm-tip repo. The 
xe-880 naming suggests this is an Xe driver build rather than an i915 
driver build but this is an i915 only test.

Is there a wiki page somewhere to explain how to understand and dig into 
the build numbers and where to find the git hashes? If so, it would be 
useful to include the link in the same email.

John.

>
> Regards,
> Ewelina
>
> -----Original Message-----
> From: Harrison, John C <john.c.harrison@intel.com>
> Sent: Tuesday, March 5, 2024 7:07 PM
> To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-dev@lists.freedesktop.org; I915-ci-infra@lists.freedesktop.org; LGCI Bug Filing <lgci.bug.filing@intel.com>; Illipilli, TejasreeX <tejasreex.illipilli@intel.com>
> Subject: Re: ✗ Fi.CI.IGT: failure for tests/intel/gem_exec_capture: Check for partial register captures (rev2)
>
> On 3/5/2024 09:50, Kamil Konieczny wrote:
>> Hi igt-dev,
>> On 2024-03-01 at 23:08:10 -0000, Patchwork wrote:
>>> == Series Details ==
>>>
>>> Series: tests/intel/gem_exec_capture: Check for partial register captures (rev2)
>>> URL   : https://patchwork.freedesktop.org/series/130332/
>>> State : failure
>>>
>>> == Summary ==
>>>
>>> CI Bug Log - changes from CI_DRM_14370_full -> IGTPW_10760_full
>>> ====================================================
>>>
>>> Summary
>>> -------
>>>
>>>     **FAILURE**
>>>
>>>     Serious unknown changes coming with IGTPW_10760_full absolutely need to be
>>>     verified manually.
>>>     
>>>     If you think the reported changes have nothing to do with the changes
>>>     introduced in IGTPW_10760_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>>     to document this new failure mode, which will reduce false positives in CI.
>>>
>>>     External URL:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html
>>>
>>> Participating hosts (8 -> 8)
>>> ------------------------------
>>>
>>>     No changes in participating hosts
>>>
>>> Possible new issues
>>> -------------------
>>>
>>>     Here are the unknown changes that may have been introduced in IGTPW_10760_full:
>>>
>>> ### IGT changes ###
>>>
>>> #### Possible regressions ####
>>>
>>>     * igt@gem_exec_capture@capture@ccs3-smem:
>>>       - shard-dg2:          [PASS][1] -> [FAIL][2] +13 other tests fail
>>>      [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-10/igt@gem_exec_capture@capture@ccs3-smem.html
>>>      [2]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-6/igt@
>>> gem_exec_capture@capture@ccs3-smem.html
>>>
>>>     * igt@gem_exec_capture@capture@rcs0-smem:
>>>       - shard-mtlp:         [PASS][3] -> [FAIL][4] +3 other tests fail
>>>      [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-mtlp-8/igt@gem_exec_capture@capture@rcs0-smem.html
>>>      [4]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-mtlp-6/igt
>>> @gem_exec_capture@capture@rcs0-smem.html
>>>
>>>     * igt@gem_exec_capture@capture@vecs0-lmem0:
>>>       - shard-dg1:          [PASS][5] -> [FAIL][6] +3 other tests fail
>>>      [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html
>>>      [6]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-19/igt
>>> @gem_exec_capture@capture@vecs0-lmem0.html
>>>
>>>     * igt@gem_exec_capture@userptr:
>>>       - shard-dg1:          NOTRUN -> [FAIL][7]
>>>      [7]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-18/igt
>>> @gem_exec_capture@userptr.html
>>>
>> Above are bugs which were spotted by a change in test.
> Correct, this is the test saying that the kernel is broken.
>
> How does one know what build of the kernel the test was run against?
> Specifically, does it contain this patch:
> e45afbeb59347 drm/i915/guc: Correct capture of EIR register on hang
>
> If not, then the test is expected to fail.
>
> John.
>
>
>>>     * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0:
>>>       - shard-dg1:          [PASS][8] -> [ABORT][9] +1 other test abort
>>>      [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg1-15/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>>>      [9]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg1-16/igt
>>> @i915_pm_rpm@gem-execbuf-stress@extra-wait-lmem0.html
>>>
>>>     * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
>>>       - shard-dg2:          [PASS][10] -> [ABORT][11] +1 other test abort
>>>      [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-dg2-7/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
>>>      [11]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-dg2-11/igt
>>> @i915_pm_rpm@gem-execbuf-stress@lmem0.html
>>>
>>>     * igt@vgem_basic@unload:
>>>       - shard-glk:          [PASS][12] -> [INCOMPLETE][13]
>>>      [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14370/shard-glk8/igt@vgem_basic@unload.html
>>>      [13]:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/shard-glk7/igt@v
>>> gem_basic@unload.html
>>>
>> These are unrelated.
>>
>> Regards,
>> Kamil
>>
>>>     
>>> New tests
>>> ---------
>>>
>>>     New tests have been introduced between CI_DRM_14370_full and IGTPW_10760_full:
>>>
>>> ### New IGT tests (4) ###
>>>
>>>     * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-dp-4:
>>>       - Statuses : 1 pass(s)
>>>       - Exec time: [3.52] s
>>>
>>>     * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-dp-4:
>>>       - Statuses : 1 pass(s)
>>>       - Exec time: [3.31] s
>>>
>>>     * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-a-dp-4:
>>>       - Statuses : 1 pass(s)
>>>       - Exec time: [3.46] s
>>>
>>>     * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-dp-4:
>>>       - Statuses : 1 pass(s)
>>>       - Exec time: [3.31] s
>>>
>>>     
>>>
>>> Known issues
>>> ------------
>>>
>>>     Here are the changes found in IGTPW_10760_full that come from known issues:
>>>
>>> ### IGT changes ###
>>>
>>> #### Issues hit ####
>>>
>> ...cut...
>>
>>> == Logs ==
>>>
>>> For more details see:
>>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10760/index.html

