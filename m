Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52853CC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 08:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012410F5E0;
	Tue, 13 Oct 2026 08:03:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FA710F5D7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791878550; x=1823414550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=izOmLaFQUNOEB1HhMb3INOsuRZ2rSCR0l/QtJHWFi0g=;
 b=kIFXNI7EA8yjwn6biV282y1NgX9FntjgQxs4UVQ5y4H739tShG78CsIP
 3jhx3ioS662wgfJRXl43vHGOavyb7xTXYETnoa8al3YCsm8MGuJFKyZwO
 qMnOBq+Qhss0mmO5HpD0XPI8nl0fMuZFZadlwcMWZ7+hUQWbKeaF1m2ZN
 G2/NBr62/iu3QBtshYGm6CRLLGPH53KvFl0REwXCy7oXhJ+u6eBYTUj72
 0hKGAQpL1BlVRnZ/Vtdg8uZti8hJqubEcwzeEATMb1tF5dwT0Mf1pWPho
 ubg0mp5oVftgyYivE0g2zlab+bxAUMEpXnsKe7Mtl5QhLAIpR3+IK7rVG g==;
X-CSE-ConnectionGUID: 66xq+aj7Rdmf4iXUViMyHQ==
X-CSE-MsgGUID: 4Pj1tVW0RvqC3Yth0mBdIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="626613"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="626613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 01:02:30 -0700
X-CSE-ConnectionGUID: z4ShMcenR9ilsawtIjZBXQ==
X-CSE-MsgGUID: FsoSorJBTfKxwdjRK//7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1070173"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 01:02:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 01:02:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 01:02:14 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 01:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coiUj5ppsjTSDdR5Zl67F9m/x41x5WCzFaWKmm7pFadjLBAjlPY93hOv/v6WRNN2fU2wnRzZEbPj3rKWtlAsVGYF6Ti4Ccp0O3bn1ATtFVQ8tpci7ByQgSJsUeIp40I8SSyxVdzs+hnO/sogIS7tyJrii0WuEHhZRBcHCi6hw6mQp6EaoW8zxE0thqpsfcmSFI5XD0Fph/CQYNi6iesjx4kPuDT+PzFkXZyfe7lWdzSYsvZfDjiyHHYcvIPEXoyxQewfTJueyR86WXJXUAs5Ndc4JloAPyxaxweCJGkU6ohNy/+jN0uQJEMr202KNS8Dj28hTejEpj9cnFPABsmeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAlAKo0oZMgnSjrDQaVQKKg1I9WbLDESxtsII/n7d08=;
 b=FikefrP9KD4gd+KQzeo49+feU3LJqPo7uZRswj59wlzMQN+8rAS2hhuJ0EDuJhTh3Xec4HznyHoOZaXvATWarjZAeeRqAlrGG62F0OVxWMiBdubA6tYQwrGUGZHOKj+E/y88QoVP9oZEG17tB2CxFP91NYWynHUM4xyaFyfTDY7T0sH3c8pTXScytad9M7Hi/0oCDaVr5qpFmwAJ+ctwLrovjz6aIjYlZx3u7WeBwYl9lVj30TTm3uhGc1YGUnMTRHtpa1hrLGaVtdyXZEh1t5dJRMohYY6vRCggPwuJoL0j4y/qzaxzs7JZcC3Vrpjxb8Z9DbU91zlhSkeBa8z7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by DS6PR11MB647574.namprd11.prod.outlook.com (2603:10b6:8:410::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:02:10 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0522.012; Tue, 13 Oct 2026
 08:02:10 +0000
Message-ID: <feb2936e-d9b7-4aee-a175-d45c1b5cafec@intel.com>
Date: Tue, 13 Oct 2026 13:32:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_vm: Validate host memory for
 overcommit tests
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20261013073532.2885788-1-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20261013073532.2885788-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|DS6PR11MB647574:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b06c81-d00f-4e01-7d52-08df290048a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|10067099003|22082099003|18002099003|260925021311599003|260925022911599003|260925021911599003|11063799006|261009223027099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: Kr/B/82RQ4UTTMbno/ecLOBXyBb+++6LasN8Rrj+w7dPzgfchn5yDio9haN6QzvZAy0mK2a8p8hZvgH2FuWUe0jmbqaEf8f9ZqNEeQEPxNtk7E5GAZe8stN1Uuhc8xttRR03DIwDKNwbTfywygiQK+/AK+imwo7BGpy+ePoLD5KDVKQ87RsIa3/1OJbV8qjNrPMBP5OtrzDZI74DUO2ltHPGtyL9jWDBjj5oAQLJ2i+tcckJRsznaBpLqDmY2eot4PaEspYDKOY6+nJRR+1asuBN88PDVAf+6UByTphTRqjlEgIFdZACbQ6uM72XSN8BshK4HGBy6Ixzl3w0+dkOulIhtM0nN9PDmrY8arNHfrNim4o0cQS7A0EuhvZTiNIEL99IO4g54ocBA++Zv4rdRh20IkLXhov7/DZUfyvAjm8hZPOPbjSguFzB4E/hlcOO723UTfNAQeYxw1pyvsioaZaISq83UgxZoEXS5J1X5pupC3FMFLRHgKd6YjRA0LXAFJs3f16QzbmoTYIj3GU/c+7nPRvjgmlh2yOAdd9lY+xMkj3Y1G0TFGKJO1WUo2q9xkNuvhTBZ/EHWqWqWwfzpn+7garc1+Vm0oA+IaD+auHJvamFqTkDeHxSyZCKisDtyawFI2lsXYU1hUsTISPUHu0BP1w4FJegW8SnN/eniMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(261009223027099003)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWljY1RSSzVLc2o2b3RtZjdlcGRGb2RqQ2FzdlJ4ZXJtU3IvdjZra2dSdVEx?=
 =?utf-8?B?WXF6bHJYK0RPazZuRjRoWWNnYmdPWjllbzc5Ung0VGQvKzk0cmNXbjFtNWNo?=
 =?utf-8?B?TGhMaXhYVkZwTkowVm9ueTRLNTMzazFyUHJlYlBXTmg0amhsanYvZ0Z0K3Av?=
 =?utf-8?B?ekFscVgwZnRDcUU3V2QwTlAzVk1DRnErSWFWSDhxS3ZoWjd3UkFsZThlM1Uz?=
 =?utf-8?B?Nlc3cEpRS2VnNWU3N2F4eUZQRE16UzN5cVNYM1A1ekUwaWsvNkJuTGVibkdG?=
 =?utf-8?B?cTdnb1ZQWHFqbmZwQis4YnNHRVE1UkxJakpiczFadzFoQThORUtLWXVvczJx?=
 =?utf-8?B?dHRJNWp2KzBZem0rT1ZWbmlSTWdoamowTSt4OHRvY1lQcFBYQkhZWHUyQ3lS?=
 =?utf-8?B?VFc3RFdoaC9Ea0hqT09aN0xIV0R6Y0lycFdVVmFIc3hmWFR1azUzU0RhV3hS?=
 =?utf-8?B?YzBuWGtTMmJnaTNUL0dlRzJGUGd3c2hnb0pJNUhnNWJtblppUUFhL0xLcG4y?=
 =?utf-8?B?enBUZnBKZ0M5STlEVkY1U0ZUeS9rVFhvUDFjTVJHZkpyZFpWNFBwVzZMK1I4?=
 =?utf-8?B?dzJBQjhEUjF0NjBac1NaWi96blU4VlpoVEdLRHpwVm1pWk44akI5V3hVcjk3?=
 =?utf-8?B?NWpQZlcxYUVkQzRHNE92Zy96N3orMWFUdGlGZHA3Y28xaWNHYWR4bldHclk0?=
 =?utf-8?B?VG1uNlk5citJcTFYNHZLZmlvNWg3ZFc1Q0pVM2hpQWtabUJjem5WZ1FNS3ZO?=
 =?utf-8?B?MGlCRHNGUmY4RmxETmk1dkJOMFZ6ekxyVUJWTE9DdUYrTG9lU2cxa3czOGRN?=
 =?utf-8?B?VG5TNHVXTW8vUUpOWGs3RWVldlZwTkxKMG1xZ3ZoaENaQ1phS2JaelJFYmNY?=
 =?utf-8?B?U2Y4dmgzTkFEZW43YnZDVnI1RVk1RnNPandJYzljSGpudHRsM2Z0T0xlRjNQ?=
 =?utf-8?B?S3BuRWRFbktrT1U0bEk1aHJzK0VWdVBrWDRnNTNsWS9GcVptZ1VLd2FhajR2?=
 =?utf-8?B?cDE0R0Q1MFFubDR1aU1XYkdKMmhQbzczd2d3RC8rWFNwMk5zN2g0a2oyek01?=
 =?utf-8?B?V0JzamZPb3RtQitQck1VSFlMVHl6YlMxT05PZkZsRStEQWZPZ25YVFpTMVAz?=
 =?utf-8?B?RFY5b05jUlhvT3BDOVJwRVF3S0ZJVnY2OFdDSGZhUVBuODVWYkNEMnhrdEli?=
 =?utf-8?B?ZTNzZTBHVm1XSmsxaGpJalUrL0g5MU9OT0k3SGdjWksyT2d1T2d6T1NsMTdT?=
 =?utf-8?B?MFlmZTdVWVVQNXpkd3l6YlI3SThIZlVEWkhQREdrazdoY2ExdFdtSE9Dd2Jw?=
 =?utf-8?B?RTZmdm5UOWtHbzBNeUtmaUFSbkdhYk1tdFJ6dXpJVzViSGxIVEFZTXpac3pD?=
 =?utf-8?B?YlpGVGwvYVVGcklnb3diOW1rRXByWk1nb2R4YU13RXNsdXpzZFRiWERRcVdE?=
 =?utf-8?B?bHVlTHBkZmZjWTV2L0JtSXlEN2VqWHBtK0RkRE5yYU54NHl0ajlkNGF2dFpI?=
 =?utf-8?B?UWxIaGtRaUIrM0s0M0pVRFk3dkNGalM4S0FVeVZKQmQ3ZytGakFmRHNtdVB6?=
 =?utf-8?B?d3FySVo1WFVVKzBXM3ZycFVGT0lkblhHanFwU1JiVno1aUFsMEcyYng2dDVZ?=
 =?utf-8?B?Z2JDRUFNU2l4NGFwUCtLNldHVVRuV2xQejIrRDBLaEl0cVNZOHdwaUFPVWxZ?=
 =?utf-8?B?ZkxHdTJDcm9VSHc2WTJmQ0FUL2FyTDVwWFh3dWZOWVdOejk4SkNEVzB3YlU1?=
 =?utf-8?B?TmdaTjN5c1J2UTNnN1JPYy9SQnJKeW1TREEzM1JVNkJyR0s1Y0xnQkdGVGVR?=
 =?utf-8?B?Wk1oSUxvVlQ2c3ArbFRmOU9WL1JqY09VVExBZEZLa05IQ095ODVPem51NGc1?=
 =?utf-8?B?S2tiKzh5MnFNWkVXY2VvWlFHN0haeHFyUk1GUy9vRVY5TW5nTGFuTlFSTUd6?=
 =?utf-8?B?Z2p3OU5MazRDYjJ3NUdQTlEyTi9TSXV2T3hIUGRCaTNOeUdlaFJ3NVlmMG0z?=
 =?utf-8?B?a2xPWC9tWEtkRFBsMDFwSUxXelhVdjJrbDVhdTRpNWFVS1NEYVdmdG9lVzFw?=
 =?utf-8?B?SWtubGRGbFZ2MmpEaDNCNjMrZ3B0cVB4YllSOUswYjloem0vS3JEVVN6YzE2?=
 =?utf-8?B?clBiMlI5STVrM2lsVHNHWUwvTGpsMDVkMnR2TWxMUW5uSWZ2MFhhc0IrV2cw?=
 =?utf-8?B?aEEralhySTVIa0M5VFMxMDE1SUZzcU5GcHA1aHJRSG9lczVqbm5lellrUi84?=
 =?utf-8?B?VHR5UGhnbjFxMDA3TkNCT014V05GOEs5RWdBS3hES29OV3YrY29kRVkraU1Z?=
 =?utf-8?B?MVY1cjFwcXhTMzJ5VDRQSEZKTk1kaUtYN2pZWWZXS3doWFFGTXFJZz09?=
X-Exchange-RoutingPolicyChecked: bZaVMCDcUCHyUrDsEA///7JJVXxApDbCHkt88niklmK/wHSyjhBEolUJc/hI1YKoT9Lxfz018EPEt5vZKCzUrDQuXOIafiEe3Apxs3hXwk1PmqH1eW2JhvSMLdIP5HXrtMIcDZAlfQr+UtZKlZl2qUaaSFGWu8H1Y7DElvLOfv4y348b7NGcry6Z2hRG3ezsX8mMwmlNcRFIUie0cvxdItsjnGBKDpTYSqKJh5N6a0sb/hXh/IJesAWn1p/PaRL8D3JurYilQyRpwoXsJLYmkl6To5nJT2usTH4RIgOpO2gFnEYJLeijwGBcb4faju+Sv9AV2kV9KtnGBz0VyBKAOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b06c81-d00f-4e01-7d52-08df290048a7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:02:10.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdCVEFQJIQcubVgQOW2L+qsLoOE1z9sFAnH5RV1YB3PrFnjluScyfHRLOED8l/BMvIaT4TiT3nGM13BOsOUgGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB647574
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


On 10/13/2026 1:05 PM, Sobin Thomas wrote:
> The amount of VRAM available for the overcommit tests varies
> across platforms. As a result, the host RAM space required to
> support the overcommit workload also varies based on eviction.
>
> Query the platform RAM space and visible VRAM before running
> overcommit tests. Skip if the expected eviction footprint
> exceeds 50% of available RAM.
>
> v2:
> - Base host-memory requirement based on the run time budget
> - Drop use vram and SRAM Handling; all the cases are VRAM
>
> v3:
> - Moved BO calculation at the caller side of test_vm_overcommit
> - Modified the check keeping total bo size instead of swap
>    space check and multiplier (Nishit)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>   tests/intel/xe_vm.c | 93 +++++++++++++++++++++++++++------------------
>   1 file changed, 55 insertions(+), 38 deletions(-)
>
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index a0a6616c3..d1157803d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -20,7 +20,9 @@
>   #include "xe/xe_query.h"
>   #include "xe/xe_spin.h"
>   #include <string.h>
> +
>   #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
> +#define OVERCOMMIT_BO_SIZE SZ_64M
>   
>   enum overcommit_stage {
>   	EXPECT_NONE,
> @@ -2385,10 +2387,10 @@ static void invalid_vm_id(int fd)
>   }
>   
>   static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos, int num_bos,
> -					     uint64_t nf_bo_size, bool use_vram, uint64_t data_addr,
> -					     uint32_t bo_flags, int gt_id, int *num_bound_out)
> +					     uint64_t data_addr, uint32_t bo_flags, int gt_id,
> +					     int *num_bound_out)
>   {
> -	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
> +	uint32_t placement = vram_memory(fd, gt_id);
>   
>   	*num_bound_out = 0;
>   
> @@ -2397,7 +2399,7 @@ static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos,
>   		int create_ret = 0;
>   
>   		/* Create BO using the case's create function */
> -		create_ret = __xe_bo_create(fd, vm, nf_bo_size, placement,
> +		create_ret = __xe_bo_create(fd, vm, OVERCOMMIT_BO_SIZE, placement,
>   					    bo_flags, NULL, &bos[i]);
>   
>   		if (create_ret) {
> @@ -2411,7 +2413,8 @@ static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos,
>   		}
>   
>   		bind_err = __xe_vm_bind_lr_sync(fd, vm, bos[i], 0, data_addr +
> -						((uint64_t)i * nf_bo_size), nf_bo_size, 0);
> +						((uint64_t)i * OVERCOMMIT_BO_SIZE),
> +						OVERCOMMIT_BO_SIZE, 0);
>   		if (bind_err) {
>   			if (errno == ENOMEM || errno == ENOSPC) {
>   				igt_debug("BO bind failed at %d/%d - error %d (%s), %d BOs bound\n",
> @@ -2425,21 +2428,21 @@ static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos,
>   		*num_bound_out = i + 1;
>   		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
>   			  i + 1, num_bos,
> -			  (unsigned long long)(data_addr + ((uint64_t)i * nf_bo_size)));
> +			  (unsigned long long)(data_addr + ((uint64_t)i * OVERCOMMIT_BO_SIZE)));
>   	}
>   	return EXPECT_NONE;
>   }
>   
> -static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t nf_bo_size, uint64_t stride)
> +static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t stride)
>   {
>   	for (int i = 0; i < num_bos; i++) {
>   		uint32_t *verify_data;
>   		int errors = 0;
>   
> -		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
> +		verify_data = xe_bo_map(fd, bos[i], OVERCOMMIT_BO_SIZE);
>   		igt_assert(verify_data);
>   
> -		for (int off = 0; off < nf_bo_size; off += stride) {
> +		for (int off = 0; off < OVERCOMMIT_BO_SIZE; off += stride) {
>   			uint32_t expected = 0xBB;
>   			uint32_t actual = *(uint32_t *)((char *)verify_data + off);
>   
> @@ -2451,7 +2454,7 @@ static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t nf_bo_size, u
>   			}
>   		}
>   
> -		munmap(verify_data, nf_bo_size);
> +		munmap(verify_data, OVERCOMMIT_BO_SIZE);
>   		igt_assert_f(errors == 0, "Data verification failed for BO %d with %d errors\n",
>   			     i, errors);
>   	}
> @@ -2497,7 +2500,6 @@ struct vm_overcommit_case {
>   	const char *name;
>   	uint32_t vm_flags;
>   	uint32_t bo_flags;
> -	bool use_vram;
>   	uint64_t data_addr;
>   	int overcommit_mult;
>   	enum overcommit_stage expected_stage;
> @@ -2510,7 +2512,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x1a0000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_BIND,
> @@ -2520,7 +2521,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.name = "vram-lr-external-nodefer",
>   		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x1a0000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_BIND,
> @@ -2531,7 +2531,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>   			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x300000000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_NONE,
> @@ -2541,7 +2540,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   		.name = "vram-no-lr",
>   		.vm_flags = 0,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x300000000,
>   		.overcommit_mult = 2,
>   		.expected_stage = EXPECT_EXEC,
> @@ -2553,7 +2551,6 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>   		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> -		.use_vram = true,
>   		.data_addr = 0x300000000,
>   		.overcommit_mult = 2,
>   		/*
> @@ -2568,17 +2565,16 @@ static const struct vm_overcommit_case overcommit_cases[] = {
>   
>   static void
>   test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
> -		   const struct vm_overcommit_case *c,
> -		   uint64_t system_size, uint64_t vram_size)
> +		   const struct vm_overcommit_case *c, int num_bos)
>   {
>   	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, bind_exec_queue = 0;
>   	uint64_t sync_addr = 0x1000000000, batch_addr = 0x200000000;
> -	int i, num_bos, num_bound = 0, bind_err, create_ret, wait_ret;
> -	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
> +	int i, num_bound = 0, bind_err, create_ret, wait_ret;
>   	enum overcommit_stage actual_stage = EXPECT_NONE;
> -	uint64_t stride = 1024 * 1024, base_size;
> -	uint64_t overcommit_size, off, data_addr;
> +	uint64_t off, data_addr;
>   	int64_t timeout = 20 * NSEC_PER_SEC;
> +	uint64_t stride = SZ_1M;
> +	size_t sync_size;
>   	struct drm_xe_sync bind_sync[1] = {
>   		{
>   			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2607,18 +2603,10 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint64_t *user_fence_sync = NULL;
>   
>   	data_addr = c->data_addr;
> -	base_size = c->use_vram ? vram_size : system_size;
> -	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
>   
> -	num_bos = (overcommit_size / nf_bo_size) + 1;
>   	bos = calloc(num_bos, sizeof(*bos));
>   	igt_assert(bos);
>   
> -	igt_debug("Overcommit test: allocating %d BOs of %llu MB each",
> -		  num_bos, (unsigned long long)(nf_bo_size >> 20));
> -	igt_debug("total=%llu MB, vram=%llu MB\n",
> -		  (unsigned long long)(num_bos * nf_bo_size >> 20),
> -		  (unsigned long long)(vram_size >> 20));
>   	/* Create VM with appropriate flags */
>   	vm = xe_vm_create(fd, c->vm_flags, 0);
>   	igt_assert(vm);
> @@ -2632,8 +2620,10 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   	exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
>   
>   	/* Create and bind data BOs */
> -	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
> +	actual_stage = create_data_bos(fd, vm, bos, num_bos, data_addr,
>   				       c->bo_flags, eci->gt_id, &num_bound);
> +	igt_debug("Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n",
> +		  c->name, actual_stage, num_bound, num_bos);
>   	/*
>   	 * On EXPECT_CREATE nothing was bound so bail out entirely.
>   	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
> @@ -2680,8 +2670,8 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
>   		timeout = 20 * NSEC_PER_SEC;
>   
> -		for (off = 0; off < nf_bo_size; off += stride) {
> -			uint64_t target_addr = data_addr + ((uint64_t)i * nf_bo_size) + off;
> +		for (off = 0; off < OVERCOMMIT_BO_SIZE; off += stride) {
> +			uint64_t target_addr = data_addr + ((uint64_t)i * OVERCOMMIT_BO_SIZE) + off;
>   			int b_idx = 0;
>   
>   			batch_data->batch[b_idx++] = MI_STORE_DWORD_IMM_GEN4;
> @@ -2725,7 +2715,7 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   	/* Verify GPU writes for bound BOs */
>   	if (actual_stage == EXPECT_NONE || (actual_stage == EXPECT_BIND && num_bound > 0))
> -		verify_bo(fd, bos, num_bound, nf_bo_size, stride);
> +		verify_bo(fd, bos, num_bound, stride);
>   
>   check_and_cleanup:
>   	igt_assert_f(actual_stage == c->expected_stage, "Expected overcommit at stage %d, got %d\n",
> @@ -3499,10 +3489,37 @@ int igt_main()
>   		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
>   					"fault" : "nonfault";
>   		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
> -			igt_require(xe_has_vram(fd));
> -			igt_require(xe_visible_vram_size(fd, 0));
> -			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
> -					   xe_visible_vram_size(fd, 0));
> +			uint64_t vram_size, vram_mb, avail_ram_mb, ram_mb, required_mb;
> +			uint64_t overcommit_size, total_bo_size;
> +			int num_bos;
> +
> +			vram_size = xe_visible_vram_size(fd, 0);
> +			igt_require(vram_size);
> +			vram_mb = vram_size >> 20;
> +			avail_ram_mb = igt_get_avail_ram_mb();
> +			ram_mb = igt_get_total_ram_mb();
> +
> +			overcommit_size = ALIGN(vram_size * c->overcommit_mult, 4096);
> +			num_bos = overcommit_size / OVERCOMMIT_BO_SIZE + 1;
> +			total_bo_size = (uint64_t)num_bos * OVERCOMMIT_BO_SIZE;
> +
> +			igt_assert_lt_u64(vram_size, total_bo_size);
> +
> +			igt_debug("Overcommit %s-%s: mult=%d ram=%" PRIu64 "MiB\n",
> +				  mode, c->name, c->overcommit_mult, ram_mb);
> +			igt_debug("Overcommit avail_ram=%" PRIu64 "MiB vram=%" PRIu64 "MiB\n",
> +				  avail_ram_mb, vram_mb);
> +			igt_debug("Overcommit size=%" PRIu64 "MiB num_bos=%d\n",
> +				  overcommit_size >> 20, num_bos);
> +			igt_debug("Overcommit bo_size=%dMiB total=%" PRIu64 "MiB\n",
> +				  OVERCOMMIT_BO_SIZE >> 20, total_bo_size >> 20);
> +
> +			required_mb = ALIGN(DIV_ROUND_UP(total_bo_size - vram_size,
> +							 SZ_1M), 64) + 64;
> +			igt_require_f(required_mb <= avail_ram_mb * 50 / 100,
> +				      "Need %" PRIu64 "MiB, > 50%% of avail RAM %" PRIu64 "MiB\n",
> +				      required_mb, avail_ram_mb);
> +			test_vm_overcommit(fd, hwe_non_copy, c, num_bos);
>   		}
>   	}
>   

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

