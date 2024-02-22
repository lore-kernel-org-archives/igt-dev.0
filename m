Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00510C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 06:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C8F10E87E;
	Thu, 22 Feb 2024 06:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8mx/Y2n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9AC10E87E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708584975; x=1740120975;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CdZr0p1vNYnQCUxKeP5lIX6njbu5JPU6SehjVh03H/g=;
 b=b8mx/Y2nZ787K6Yhy+Im41QcinEQunWJFMIElRP1eEeduucKWsN2SEgA
 K6yqcPefn81qRASNkLQlTz6Gyr7+8JDNh246on4BQjFieU9m6OBubu+80
 SRLJZWA/G+HfkSHEVbg0Y0gEwFTJIWD9842gF2/fVnAoje8L+Z9VXqc4U
 91qOk1Cunhzxg1FtamQzQDLvJErxHexfujYbdZMxaefQFg914AumFbonH
 WbqwcPnolJVTRSLbMXSegelTKOQdQwYOppGw3Eix9z17qV2MrTzztwqy7
 DoajcQZFZL3PffJWSmnkQVO7qctNupYCqOsDRczgU/zkWFO3LTIx+xeV+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6568336"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6568336"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 22:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5769098"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 22:55:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 22:55:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 22:55:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 22:55:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 22:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RpXEbCPcGsY9ODC7Bb/RpWSYBHaUCINMXfsItFLNTJwmcO/Qm1QppcJlvmNiZuPDIfCIGWtBfHxghBwrtMVRDA5lOJfv2JH3BCc/p7xxx3qMGyDUAJPU1GQOvM32uKEOJyB0bHZxNaWboJjZBhbejiXdGOCjbEEU6np+sljcwgrsrE3tbEAjcDxVd4Cw9LORc9E1zPrCDov8vSBSyHAEI4AFDSAtlQIqi3WAPoIckVMx58osULA1bF/FF4fK6ufDgBLUjVuaT2HX54oN6BEX/kMMSRywzhmU72+fugxkMMa9nFlkGsU0iAVHvBgOLAevmYeM2g50ryvb92vAtnEoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKMfwmHRPYGXJiSiw56SP1OpbKWZUi+0milB4cgq3cw=;
 b=BwUuoted6yd4+FPXD7dovDJqEiwTvnk+6MCaCEnhpn/r8xh0eK9bldoF/tvYW3Vpeojx6k/9eTcYya6S2mIgH5AZrgHIrh9pxSVTJj9+wzI/KGdI0a56gOw8Wsr0esdsE9MH3LBnI1EAk7YkUchc7Gc/sG2iXIsbqQat6Ll2VgidVeQvusubU6IzHhsWKQ4Uqxpcb3hzZgPLnWx7gHdjKP3cMeqxqs5Mjks5ur0cIy5AC1wqMaKmvgJh3/yHsdqaQttUcQbkm2hia6r8wD7y6ekdr08mcVkWBMdmJhalhQnz+Nc9s8E37D6ILXglIWqTw9ntenPLamMirndaBRQTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 06:55:54 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3%5]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 06:55:54 +0000
Message-ID: <cb29fe35-0e68-402e-ac9b-a18addd3a48c@intel.com>
Date: Thu, 22 Feb 2024 12:25:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel: Add tests to run suspend without display
To: <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|IA1PR11MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 006e695c-0008-461d-fa25-08dc33735043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mz7wcnRuE2Yt6GyJhLkGv5Yt5CvOsfN7zPJPU4/03vC/4/IwpPXWbXh2bQKzXsBIqndjjSZaQ2BZiS2rbEo+w4xVUHQAdXNt97tSWHZQolct0GC95K+9SJstXdrBf8Vv5hU9CoyWKhY2QPahKdechbLFTDgmwK1Q8TtsYwYGBNybCGSIWpe7aBBLHPR8MxpnWPBLMLltHf09cZWaR3crWfk7wY5ZBN0evrQlZuSxI0OtPyjlfNKAgdvPpkrz3p5xX6rj9eS+4WW+ctXos6lCMSdTGaXpBh3oJEMMc5BwGxixgO4+MuXqNaA999y08a3P54WlZcvmd3NfhEyqwpMZP/sq6Mj9E9Ez86cLz/XIotSOCcuRTaeS0HCzQj145cYgAHoAvO3M3laAC33mVLtPOSxNF1MfbKJW84zwGRHgXZF8o00ls7XkWfVz4Dzcee9t2xygQxaiPxzfpDnHECSAwdYKSDEUpUFlpmwPnUKNDWlwjxAPISuzlzw9icBjAIHfOyKSqYtVJ5dU0UlT76JoEe1CDLBaneQeq52QFJKnE9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNKRGNqV0hrejhqNzZ4dHorTGtvUTlWNW1QZFBvdFJmRUFDZjRGNTdydmlP?=
 =?utf-8?B?VVV0U1Z2YnVvdkJrM2ZoWGZWQkw1WVhIS3lLWlRtM0FQL0NPdWpXY2ZCWit6?=
 =?utf-8?B?SHJodGgwZU94K1hYMFhvMUV1SVZMc2dQYzVxZGxjVzR5ZldjN1NhejhCSmlX?=
 =?utf-8?B?d2JHVEFCNkxBZzhMUy9YZFVpSWRNVEtJVGpBYSsxZGhoN2FKT1EzUkNjWGRi?=
 =?utf-8?B?NTNUcjNKaExPN0hDeTYvOEtuVHJmOUxNeGlYd1dKNVliN0JueTIyRFI3NUMy?=
 =?utf-8?B?MitldHA4LzBaVlNhOG1NSmxYMVhmbzdYUWdjUzdHdWcrZUhCeUVYSzFBNEp2?=
 =?utf-8?B?SGwya0J0eGxQSlR4VENoeEZtZ1RpS25SSjlzNmtIbW84UCtITGRMdWNmT0pV?=
 =?utf-8?B?SE96cUJleDgrLzg3eGl5aEc3U1RnYlUvdU8vQXRMTkE0aEFoWVU5MWJ3K0NF?=
 =?utf-8?B?a3RrMmRVK09zaHE0SCtONWY1eXV1T21lSE1YTTFtem4yck1sclRhMDdEK2lY?=
 =?utf-8?B?YldENUNHTnRHUDR4QU43ZXVNWURqRW9jNStoTm40U0U2ek1YZmVMSjlwRjNo?=
 =?utf-8?B?VkIyczVRWDlidXN0b002U2JTdDcvOWxQcXdBd3ZaUUs4eWRhaDVmdC9GS3hD?=
 =?utf-8?B?eUdVc0V5bnVwVHNwenhUcmJ2MTZGVCt4KytrS3hKaHNYT0hoUWR0VDlLUGVG?=
 =?utf-8?B?L1N3VnRnQ0w5OFV6TUZZblkzNG0zc3J5cTQvSEdsMXJFOGs2ejZyYTZJeFNY?=
 =?utf-8?B?MkNVdXIwWFBoUi9oUW9QY0t6WHFGMUY0cXJzUitZVEpoOHhqUElLaGFnRU1H?=
 =?utf-8?B?bktxdTZjK2NEcnVwaTdzY0Y3c045bStveXlSTTlOME5yRnlVMW9qcVUyZkFF?=
 =?utf-8?B?citTR3MrS0UxMWErK1U1R1FvRGRIVzRlcEpSMnczY1RTQzBlazd2dXpjL2hD?=
 =?utf-8?B?RXkySjZMUk45ZW9oOTBCdUZsdkp5Q1VKYUtTQ3VrbSt1V0U4d29ybXY4dGs0?=
 =?utf-8?B?MFdoY0IxcEJPYkJzZlZwMnlrdlpQcUEvcHJ5TjZVQWZKRlBhNFM2eTJKZkJY?=
 =?utf-8?B?RlEzT0JEQnF3c2NNRGNlTzcxdWw2Um1LQzg3WjRqbnZMbDVMOU5mWm50dEJE?=
 =?utf-8?B?bGJ4K0F3R1UwbXB5RFlhWG5SaDBlQjVvWGFsM0VOUi9xQzV6SU0rVXRGZ1hT?=
 =?utf-8?B?V2M0SmJhUStCanJwZjM4a3dDbmRWTDQzUFpoajF3bGF3RmhUZVNqNWZ1eG9r?=
 =?utf-8?B?cUtLcDVUYUJWRVlIZUV0Q0NzSXV5SnlBazh4bVBNVmdEcTNWY2EwSzhWZWox?=
 =?utf-8?B?VTlHSkphUmdTTXBsMWxUSmpwVExKdnFDVHF4Vmh5ZGJaRHg0bTRpOE0zWW9I?=
 =?utf-8?B?dmFZOENsdXo3SFJ6UXVsdzVjVzB3SG1VdmsyVHBhZmF3NEczNHVUZTlYUkJS?=
 =?utf-8?B?dExmdkthMmhib3RzWnArNFIwWUcydGdjTTN6cW9LMTBoMDVxMUN4aWtmNkRt?=
 =?utf-8?B?RXc0RjE4Sm5Wa21lSnFSMURzeU5xbXp0U0pzeXVNenFZRklEVFhCaGhsbTFW?=
 =?utf-8?B?Qk9PRWQ4Z2xGd3RuZVVrMmU2TFVFeFlHcTlOekRzWDY5TUt5Yjc2emZhdk8w?=
 =?utf-8?B?LzNkRkNiQTAxQXcwa0xNWGdjcmxia1VKU254NHhpVjhQeDhXcWtOV0pkL0N4?=
 =?utf-8?B?dnRDQmdScGdwcVBQVXhQdXVPeHpkbmFuYzVlZ3VILzQ4eVJRZ2g1Y0NndllT?=
 =?utf-8?B?RnNKU1VXQys5cGp6SDY4dzBmTW8zcHNsaWlsK29zYkQ5ckVWT3BsZVhGTFY3?=
 =?utf-8?B?R0JCWjFuQ0JFVDJSYlhhRjduN0N5UTR2eVFueDVSbS9ITXdIY21DUjNBVm8y?=
 =?utf-8?B?Kytock9ZeXBPNUI4RUgwRnQwTWhTY21MeGI3bzVWUCtQbEVmSHVSOG83cHR6?=
 =?utf-8?B?Mmx2THVqUWZRUXM4b2xMdlBHTCtwRXBQMUN6L0c0Wmh0aHlmald6VGJEVm42?=
 =?utf-8?B?bnpzRUM2YlVYeTZWQUxjQ0VRVENaNHJlRmlOY2k4SFI0RmFZblc3OElHTEpp?=
 =?utf-8?B?YndsTEVURHozcDY2SHNhQ3Y1bkh6eGE5eU9uMWU5R0dCZU4vaytxUDR4d3Nw?=
 =?utf-8?B?NVB5UHBsN0Z5K3M1U3pWcFRUZkxieXFhNWRaSVAzbHBodjhhWE1MLyswUk1Y?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 006e695c-0008-461d-fa25-08dc33735043
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 06:55:54.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzeqC/7aq4dUeGxhlfbU+28Qjl1DFFNDmDFHjGoNmn+mIZQGwFlOvFR1FWWnSe6zcSAI1eu69GEDXxzMRO9iwFH8HS5X+yr2WXECwZYdLsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
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

Hi all,

As a heads up to those reviewing the patch, the pre-merge testing for 
the added subtests is likely to fail due to a known sporadic issue with 
unloading and reloading the driver with no display.

Thanks,

Suja

On 2/22/2024 12:36 PM, Sujaritha Sundaresan wrote:
> Add tests to validate basic execution suspend/resume cycle
> without display module to rule out display related issues
> from the suspend/resume stack.
>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   tests/intel/xe_pm.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index a0045da0b..e94835f0d 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -16,6 +16,7 @@
>   
>   #include "igt.h"
>   #include "lib/igt_device.h"
> +#include "lib/igt_kmod.h"
>   #include "lib/igt_pm.h"
>   #include "lib/igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
> @@ -236,6 +237,10 @@ static void close_fw_handle(int sig)
>    * Description: suspend/autoresume on %arg[1] state and exec after RPM
>    * Functionality: pm - %arg[1]
>    *
> + * SUBTEST: %s-without-display
> + * Description: suspend/autoresume on %arg[1] state without display
> + * Functionality: pm - %arg[1]
> + *
>    * arg[1]:
>    *
>    * @s2idle:	s2idle
> @@ -618,6 +623,23 @@ igt_main
>   					  NO_RPM);
>   		}
>   
> +		igt_subtest_f("%s-without-display", s->name) {
> +
> +			if (!drmModeGetResources(device.fd_xe))
> +				return;
> +
> +			xe_for_each_engine(device.fd_xe, hwe) {
> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
> +				igt_assert_eq(igt_xe_driver_unload(),0);
> +
> +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
> +				igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
> +
> +				test_exec(device, hwe, 1, 2, s->state,
> +					  NO_RPM);
> +			}
> +		}
> +
>   		for (const struct d_state *d = d_states; d->name; d++) {
>   			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
>   				igt_assert(setup_d3(device, d->state));
