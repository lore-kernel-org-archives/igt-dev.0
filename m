Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E805FC47DD9
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 03:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C03510ED9E;
	Mon, 26 Feb 2024 03:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glpkgySN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCA410ED9C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 03:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708917671; x=1740453671;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X1aiT2bvK737SaI4XrorLE9xza6+BBvww0pS+8TzNC8=;
 b=glpkgySNxwH2Qm/WQ9koyWkJxeT3ifYKEhcFMK7RHntbdM5ZI/QmJCI+
 rXbzkve720QcbXmsRv2Qjb9lLCQ/CYdODFqH8sBUWMxlgvtPIcaIniqte
 wKfSDn/RN7UBMnnZtCbj8ZsB90kKAiKAvjjp6TJ8cOz9Vn8rZYI4Nn2AW
 QIR5IvXjeHHpkGCWPqaSxmSr3RUAkFWNwWaXwuF+f4ie7NOq8vi4XSIQx
 2UTUrT4PUsqcpuAnnWhKjL+QkixntknK/zq4ivVqhFiUf4UZxkpgnSx48
 KnkMzT6PUDI9ryA/QHixXMx1IAGa1+P2og5GASGj+i2fK0Nm34Z/27eAp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3337829"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3337829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 19:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6877657"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 19:21:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:21:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 19:21:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 19:21:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 19:21:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DIOVDVV2Kw9H4r84IP8VR93Rklkz7/VWCM0dcscNuB3sWOjkM8Th5HqQWrB3Pnd+Ltjpdv9lbU5+6S8hLyPl47EKhjxXoAi59DYGSMw7feYRRwaK+jPBtCQuxl9P0htKa4qlZxn0SVkdtz0nfESYycKsJotVW7ucwovW6tcSfuHUMm82JaUu6rSzafnAng5cMtiw1h4WDWBr2Z3YVPjPqJ7fjHozPJ4JcPSSzneQjNF2UaTccX985fKfnSWr+eQ6Z4ogCNgNI3ALo47ffQybwUndx8TBCk7UqFmX7/W+9ntY1XtUddplmHBwxh/dxN6k/QT1mJG3na/mO5K0dsyTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNlwOMo3JZn+cNHMaAf/qhLFJvOD5NIjuFSSwTrdjOA=;
 b=R2cFnIqjxhGkrD4+BvFKZwwPYQjdvB4iVzM8UtQcmLosOVggCUbg6ad26ThUCzFGf0LNICpzsMxSnEQN0gM3bimUl8IVZXvGxmpDUVEfV30oCjMihabBx5WxHgPf3xfLNNPakNYUKjfLtPiy8zyWJLcFQmwMbAjHR48yYr/5hy0YBeqfdYpNZubA7QKQMlj8d0G9cEUyTmiYFdO5szlvfbCo8TUMcJSucde6utRHjjWsFMyvtVTXu7cd5ik+8eD5CFXLZWv0t2pxB0XNhu1tpkHGxlgLAk7q35GFqczSWsPCnOdrwnraoONTOP7jVff7qlWPLIyqQrwkAWiIpCMzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB7506.namprd11.prod.outlook.com (2603:10b6:8:151::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.21; Mon, 26 Feb 2024 03:21:07 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::950a:155f:7cb1:b9a3%6]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 03:21:07 +0000
Message-ID: <3cc2055d-7ffe-41ad-8d55-40873373be44@intel.com>
Date: Mon, 26 Feb 2024 08:51:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel: Add tests to run suspend without display
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
 <cb29fe35-0e68-402e-ac9b-a18addd3a48c@intel.com>
 <CY5PR11MB62114DF7228979346319F8DB95562@CY5PR11MB6211.namprd11.prod.outlook.com>
 <42bccfef-c5e1-48cd-a6ce-9f3bdc1efd30@intel.com>
Content-Language: en-US
In-Reply-To: <42bccfef-c5e1-48cd-a6ce-9f3bdc1efd30@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::16) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DS0PR11MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b3ae77-a8e4-4467-7d5f-08dc3679f8e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y46wx7MLGjbjjwsaJ+R6fXU44sDM74HrkU9jIYKkZgNJGXNSZs/6K+R4oRXaTurAKLllJTyoybrHMVWTzJSv3/aljjKc1ohwG1CyK1sIOqdj/MG5QkNLIUAbCC+c+Lz7PVNyiReMYl0/X7jujF1sTTA2z+X4Q2PFDEprH4SHjYsE6sBe0114Br3wl8x1b83iQi1re8NgT8NShWA+yHp2IF0K5sio/d+/VbXJSuS1cqCCOGmxMguQ3MHm+9ZZBBBYkTk0fqFMTn/ZHcHlNaRMZ10aNdeX5Cl11Lgv9pd51gZHqTLhESyz5LQQPJpc+5VHkU9vcN98RpLPbQHgEmjaWNVkSBPgo9b2t9fSqa6l5p+IYMlqlUEgboU5dS+FrcROjGMrrXL2FrHk8kz0Dr/YHsH8FXUgPzaaUsl12vFOHhTBb320W6g0oDfqGqm+WVXQU+gruXVUVUTYnHvGjImmaerZ+kPhygHsOnRPcrLg4r/wbrV4RIuANV8E8KnBRX/Yfia9TXsTLMBDWvPithJQbr4+JYV47yUr4XGVHDJaz5BnPcGvQf1ISxvt5UxYUKg4oi7LbHMNXvNScPU1cOxH9R13GywBRdsbSSiiYTX94De0wPDF+7uGa5/txpocX8HDkvhAq8HxXpTeWc3ijSWdgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1pKa1RCTGx3UVFyY1ZYTm01SDlNWVRzRVdsRnd3MitBL2JpR1IrR0xSOGt6?=
 =?utf-8?B?dnN0UGtSd3pWNnE5WDhtOERKcWFFQ3pCWU5adVRlRzdZL0pCcGZONExZd09P?=
 =?utf-8?B?MWxkQW95ZDJZU3UxMU94VG1XR0syQkFTWVY1YllnRzk2ZzJDdmZ4dW9tWmpE?=
 =?utf-8?B?dTJuVzduN0VyT29xWlpNd3c2cUxGMDRoWldML3ZvbXI3NEpjbUhyWThaOHJv?=
 =?utf-8?B?c29yaHNDTWZZSm1YTWxxNnlzVDNaTFNMZjJVbjUxSUMwUkp6WXloUkJMSm0y?=
 =?utf-8?B?d3J1MjMxbDduQU5DeXhiZ3FQOGEvTmxrazQ4WDl1RTRuQXExWDF5dERqTEZr?=
 =?utf-8?B?bWl1b2tZVVJ6RFRLVGxYQUE2bVhPUklIYXNCWnhHVXNjQ2JDaDlOSmFhQWtW?=
 =?utf-8?B?Wk1uUlU2M0VXemphVWVhVUhPWlpldzJXVHduTHdpRnJuRWtZWDBvVnVFb25P?=
 =?utf-8?B?a0YzRWV5azB5MUxNMGkvN1lMQUp2QW5YNldGRkREOTVYa1dmUUh0L085T244?=
 =?utf-8?B?YWw2NDlsRDVyWGYyNHErd294akFlOEFOMVpoNFIyZzF5eFh3clZsVFJ1c2Ja?=
 =?utf-8?B?TVdyRzFHcitUQUwvUXFYN3RpdU1LR2J5Yms5UHFXYTRsdndheStQQWpJRkI4?=
 =?utf-8?B?a3YzM3FQeVZiNHdGcVJhSGtzbjNWS0RFTndIQk11cTVzaFN5WmYxZTN6OW9q?=
 =?utf-8?B?eStMb2lKNEJxVUhySmZxYzgxb2piZ21KV0xBOFloK28rTEF6eHdpMThMOCtV?=
 =?utf-8?B?YXNibTRzMG5aYXlubEdrM2FyZUYzaEhDdFNIcXpjNytjdjY3Vys0NVd1T0JY?=
 =?utf-8?B?ejVvQlVxNkFBSDVzamlNYUMvL1JBR1M2MUtBbVNFcGIzSFNqR216STRXaURk?=
 =?utf-8?B?WFpwMVdIdjhReHhvZjk2YW90U3RYUWNLemJCWHorYktwUVRpOU1sdlpLU2sy?=
 =?utf-8?B?dWxjcXliL3VRbDZ5RE5nQWU4ZGRjRmpkV1hKdDJqRWM4SFBSaENLeklqZ0JB?=
 =?utf-8?B?VWtDbDdrQzlqZTRQYVNBOUxJMjZUTWtFNVFscnlZbnNYMVFleWZyeEhxWGw5?=
 =?utf-8?B?NFZsL2FmbDhzL1QxaHltT1ZFSHlQRWRKUEFxR3ZINkJ5Sm9JajcwOUJtcVVL?=
 =?utf-8?B?OStFbWg3VmxaUkI0a3AySGl6dFpxUWY3a2M5cjZPa21vRkh5OUNxc0NDZkRx?=
 =?utf-8?B?cGJEYnpJOTJLTkFKQ0d2emZMTDhNV0hyWDcyYTI3alJNQm14all2SVFFTXZs?=
 =?utf-8?B?VE54aDRpL0RKSWlLMkhkcFhlNnVFTGdzL0RLeTRQaUMzMzBsK0xQZ3FzWm02?=
 =?utf-8?B?M083WDdjWDltZjZ5TWdEZEc0YkhyYzhYZk9hSmYrNEtBTlNFWjExYWhyK0JT?=
 =?utf-8?B?WHJocklRZEFYRTRVOHMrZEV6elh2VXZtNEE0UHlIYU02NWlYdFoydEZ3enpE?=
 =?utf-8?B?Tm9wenBMVUpDeHlnZ2U5MG5JV3ZqbTF5M3NUZTRxaEEzTkx1aEV3MWVIS01G?=
 =?utf-8?B?YzBsWWdaR2V1cElXLzB3bmtFd2Nmd2ZSS3lOMUFZbEYwblp0VTdKOHM1bjlD?=
 =?utf-8?B?OG05Q1pyTVVnTS9PZWphSVBndGRLcHdtWVhvR1JqS1hpVzZJWFhpWkJhYUtv?=
 =?utf-8?B?dUZqN0IwU05WcEFsMTBmVWEyR3BreEZaVmhmRS9ScU03NVNldHpLdnRYY3lT?=
 =?utf-8?B?NDVaTFFSZ2ZKZXhid3BsMno1TmJtZldGdmdrVE5IT2VkTVZBeGZaUnNORmx5?=
 =?utf-8?B?Rm8xaHl2ZUxucVdEaDU1MmUzUGhtUkdaNWtnMUdMcHBxQ1BIeE5yNHU5SU5M?=
 =?utf-8?B?aFA3UlV0SkFSOE9wcE96RGVXeUVUOUpZVlFqbFI5cnpDNnNWS1VNOHRpQjg1?=
 =?utf-8?B?OU9kQWtrWWFWb1NKbUo5bHlzYVVIY3NUYytFUFZiV2RjVW81dGRFcXR4TjBi?=
 =?utf-8?B?ZkdtQjRTWXhaM0VhRmQ5UkhUSHZydE9LMURaTjIxYkJCNTJHbVNWZVJheXV3?=
 =?utf-8?B?cmdJUVQyalp2b2ZybnJFSUpiYk9tTks5WFVPRnpBQVpFVDJlUzAvYWRDYzBw?=
 =?utf-8?B?RWJOQmJTWU02azgyeDhFQ2ZHejBVR2tjS1dNUFFxUTFFaVZ2bmw1ZnB4RVBk?=
 =?utf-8?B?akxqWktkQlVnTDBOeVN2RTJGNG1RNVhMc21Cdmc5cWdMY0R4UDF6QXRWUFhZ?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b3ae77-a8e4-4467-7d5f-08dc3679f8e1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 03:21:07.8025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThqxgTEcNARA6dwgVcvzmgML/2ycRds+9Wp+DH7igAYUbjnEWZJPfK1262LBTxRZO69m0h4UpYjgos8H6CQbq6nIOFbv43jtzzMdCXEf0Co=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7506
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


On 2/22/2024 12:49 PM, Sundaresan, Sujaritha wrote:
>
> On 2/22/2024 12:33 PM, Gupta, Anshuman wrote:
>>
>>> -----Original Message-----
>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>> Sent: Thursday, February 22, 2024 12:26 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>
>>> Subject: Re: [i-g-t] tests/intel: Add tests to run suspend without 
>>> display
>>>
>>> Hi all,
>>>
>>> As a heads up to those reviewing the patch, the pre-merge testing 
>>> for the
>>> added subtests is likely to fail due to a known sporadic issue with 
>>> unloading
>>> and reloading the driver with no display.
>>>
>>> Thanks,
>>>
>>> Suja
>>>
>>> On 2/22/2024 12:36 PM, Sujaritha Sundaresan wrote:
>>>> Add tests to validate basic execution suspend/resume cycle without
>>>> display module to rule out display related issues from the
>>>> suspend/resume stack.
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> ---
>>>>    tests/intel/xe_pm.c | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>>>> a0045da0b..e94835f0d 100644
>>>> --- a/tests/intel/xe_pm.c
>>>> +++ b/tests/intel/xe_pm.c
>>>> @@ -16,6 +16,7 @@
>>>>
>>>>    #include "igt.h"
>>>>    #include "lib/igt_device.h"
>>>> +#include "lib/igt_kmod.h"
>>>>    #include "lib/igt_pm.h"
>>>>    #include "lib/igt_sysfs.h"
>>>>    #include "lib/igt_syncobj.h"
>>>> @@ -236,6 +237,10 @@ static void close_fw_handle(int sig)
>>>>     * Description: suspend/autoresume on %arg[1] state and exec 
>>>> after RPM
>>>>     * Functionality: pm - %arg[1]
>>>>     *
>>>> + * SUBTEST: %s-without-display
>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>> + * Functionality: pm - %arg[1]
>>>> + *
>>>>     * arg[1]:
>>>>     *
>>>>     * @s2idle:    s2idle
>>>> @@ -618,6 +623,23 @@ igt_main
>>>>                          NO_RPM);
>>>>            }
>>>>
>>>> +        igt_subtest_f("%s-without-display", s->name) {
>>>> +
>>>> +            if (!drmModeGetResources(device.fd_xe))
>>>> +                return;
>>>> +
>>>> +            xe_for_each_engine(device.fd_xe, hwe) {
>>>> +                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>> +                igt_assert_eq(igt_xe_driver_unload(),0);
>>>> +
>>>> +                igt_kmsg(KMSG_INFO "Re-loading Xe without
>>> display\n");
>>>> +
>>>     igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
>>>> +
>>>> +                test_exec(device, hwe, 1, 2, s->state,
>>>> +                      NO_RPM);
>>>> +            }
>>>> +        }
>> We need to reload the driver with display as normal ?
>> Anshuman.
>
> Hmm maybe. That will need another unload and non-conditional re-load 
> cycle right ?
>
> Suja
>
Hi Anshuman,

Should I go ahead with the above change ?

Thanks,

Suja

>>>> +
>>>>            for (const struct d_state *d = d_states; d->name; d++) {
>>>>                igt_subtest_f("%s-%s-basic-exec", s->name, d->name)
>>> {
>>>> igt_assert(setup_d3(device, d->state));
