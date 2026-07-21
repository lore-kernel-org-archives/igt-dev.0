Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3FAC4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 11:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124CB10E8E9;
	Tue, 21 Jul 2026 11:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPbKrPmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEC110E324
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784631619; x=1816167619;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZTbSzU/3n9XwrboEflauyoLUgvLgYDsvEvLzsQ4Tfu0=;
 b=lPbKrPmyAfUqC7lFGvkNqAeNx7S/Cup/1dZyytW52ZxCTVj9y/nf/OOY
 RDRHT7pajh/Lq+OBSpbCSGLIHcfKpQDp6gxObNxqNzStj5/5lhRgAMR4k
 U2mrsLtRijZQWo8uwrThUSs/mJlzTIK4/ae/eHy0ar2QFybxnXgb8jZe4
 E+qY62MueFYvF1MqAfkhM8XR0OSExyihFTj+AQK0wkcnTJ+IaulaV2f3T
 ZZJavw+89ClgQ7ti8QKqYWEFRFdEiqXtT3Ixbgw4BnJY8APC56NCVZO8x
 GLeimM6WA2tW8+yw0PZ60LeD+qF/gYBt9H6sCc+lvCE8pz/Zs4j+KX5n9 g==;
X-CSE-ConnectionGUID: liAx4YuuR9mfbT/CJT6/jg==
X-CSE-MsgGUID: KWVVxDXKRseCzHPyXq92kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102776722"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="102776722"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:00:19 -0700
X-CSE-ConnectionGUID: 92Ytu2PmSma6IIlS5H2AdQ==
X-CSE-MsgGUID: O0PadLxBSge/wcBpKuhbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="255090289"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 04:00:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 04:00:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 04:00:18 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 04:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwGEH/FBf3LR37vXSIHBVv3PTt2KZkeFOs797sjuBiKzzNWs6GT2xSlT7AZrek35wImjYau6MS3nE8+0Qs/kW2F/AAA6vpoZfh65vRNz1v4qKhIX7p81H36XRJ+5NysGwy7kdFrdTO/jvtkiuxW9ovb4F81NEyczt2ELGA4F5emM5wMh09KdQ+4fRq6ZPjeDMnZ66Hldfq9lo9GWrqqIPGB8XCahZ8x0fEgvP0ExF1lHLFhywtd4b6wEmB3c9gDQX+Kux0hKywE9MIQGuzApCBrPXdeb/Hi7cA1mh1LtQ/m3R5RG5ylHF63tf8TA7Z6xtMpJXwUmL1hBneTqEMaRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kll82bSgYRDaN01HMU+9ksceVTZyx8ErZeKDW7yesAg=;
 b=SWARym6sfu5X3uNqS1M6CavS8S69CITyw3XOR4oj8MGN6TcMCRdLIPbA4b6nh2RDoFttl1yMaKPYGJzzrotAPZCZOBSkE9Yo5bIq9oCYYAL21N27dko0UAHrQdinUXjr61iUJjQ+iWmSrN+0PkGAWAbRfGZea4AJOmDNSoVKAKQpx9hI6A/0/OMBzgBSlDMw4PDWfmxqNCFoj5MYkX3ouUKvlAzz9pVpTWblZQEH8HUZNPwODG0yR+DDg16Qot68IMVGrKY3hL3sYqhwZuuF1R9nlnupWZ4bWWhk+WDPULVXfNbJ6Pwzg7dnn2EGWRBh05noI1xKq6fTFKygvulgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 11:00:16 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 11:00:16 +0000
Message-ID: <63abb020-7f9a-4974-85d9-d9a7f3a0dc81@intel.com>
Date: Tue, 21 Jul 2026 16:30:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "lib/kms: Set
 display->has_plane_color_pipeline automatically"
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: John Harrison <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
 <88217722-843f-46b7-a2e5-a05262243b4c@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <88217722-843f-46b7-a2e5-a05262243b4c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0084.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 11244e3a-7e32-49e9-041e-08dee7173f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dJHSnzoZzll9Jkxj4rqSKC4ceWoQ9UdVcZnjdyhek3u03b1/oReScJg5PeuU9SQ11aouw7mudUA5paPFtpDIi3HSFKB8q97uO5C0ccMZDICR9OyCLpnIR8LKyjxb4WhFii6C+ZDCMgaRwlkYvneX3mEOTZ68Hs9diPVeuQBGEjrAPAUD110MrwKVO9PW3vUA2/Alnt3Vm7YKdif5gCrrbe3A5MDjG7Z8N69itLmPrBtBupzyUQus9JjV23HwVVllSj8jfPsaIRIquMNcGq+w8i2kJa5C4F4wABd0bqOhJPmnfeerxWNgl50RyfGmBlfVXaHJ0tNdKidKilcxgYh/38nS7+5dWNWupF15fk4SOVMs8fdVNybiyMQ9zX9wM9PuGL5DtP3LqbHk2tAPsH+SxaIzyTnzi2OZLFvz60xsiJesKTO2XY4YKaq/G16eSHsyYBnBPNAuh+0XQ4ZEnPiVhqOKs/rG7bMFdQ2IOKIElBMTX+XPkpL7peK4c22wTZs4rqae3D4asKlL5EMWrnwtNYn8WZguMaiHts9zpegqx4sJZ3qK66br45FeBSlmb9H7JJJbEstjJ7Ayk0XlpSfeKPQpofEGsxIamVqH9+81xYMHrEwESvqTfo0Ay9qvFjIhA5nHLMM/ut6yroQ7vLXSuNqoleKUYIv5JOTZ5O+dB9o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXZqZmlEUjNmNXVmVlAzYjZzR0k4QVpkbGNyKzlORjU2dVQ2RUh5UW5LUVF6?=
 =?utf-8?B?ZmpOTmdZSHZCa0R2c3ljaEFWUEhWdXgzNUg2OGRGWW5rc1R3bVI0MUVDbG44?=
 =?utf-8?B?aHduS1VUeXUvWjBpTEVEb281MHVteVEyNTZEZHpZWGxKOWRqMlVMUGdvWFor?=
 =?utf-8?B?bFpJWUpCVjJWdHJOZFowRXZiTHZzRzFCWjk0MGdvZXQ4WEpmYklTWmRMVnZZ?=
 =?utf-8?B?ZFVLbjd5K0N5MHdvVHRKVWRydVBZeStKR3ovSEhkS1lMTnVaUEo0dHB1djRI?=
 =?utf-8?B?aXM5MUJBUC9XUW5WSjRWeWs0dTJXdkdrODRJVEx3Z3NiVE1tWjV5bXJmRVRF?=
 =?utf-8?B?RThqVnB1NUF4VEt0cjJ0UDRWYnh2MW1qLzRra1k5NmFoMWMyaGhzUGZ6SG41?=
 =?utf-8?B?R3owdndTbDdZTnNua1N1VE1ZVjRSeXJMaFhwOENya3RLK2tuWTF2RktRcGVt?=
 =?utf-8?B?ZzJvZG45RlNuNnpLdW92QVFTaDlIK2kzcmJCUTh0ZWNaZ3U3YUZUS0NxdTYy?=
 =?utf-8?B?T2NsaURmUEI3RDlTakE4TVpEYkdRbXVIaGZLcWk0dDBtRHhacFJHNTFOblpp?=
 =?utf-8?B?U3A2NFZDQ1h2TmVhcUxjeWNJU0xDV3R0UGpZaVQzWU0xMVlYbW15ZXBFRmV6?=
 =?utf-8?B?NXNEVnhaZXBQOGMyVXMwVzFGcVdESXQzczdQUFB1ZkkvWmdUN2t6YzI1YU0x?=
 =?utf-8?B?cDl6V0NwazFFWFRrWlBSS1ZRZGQ2cHFON3YzcVRhYmJ5K0FoYkFPK1ZLa2Q2?=
 =?utf-8?B?VWlSRDdUN3orcU5DT2NmVHFlZllrT2dVaWxyZEJkWU9uUHVPRTYwVTEvSGc2?=
 =?utf-8?B?NTdUaWN6WVZESERKQTQ1MkhtTk1Hdmp5dDVTdloyWTdSVXRONWJiSjJGc2ZV?=
 =?utf-8?B?bWRuTC9HZkVuM2ZidjdjRDFacmtBZndTQk5pQThGY1pxNC9YZWJLamtmeGt0?=
 =?utf-8?B?UFNLWGErTDdzNE1FOGc4MzMrK2JYek1rbWhJMURXaDREUytXV2pMU205TVVh?=
 =?utf-8?B?aFlrTjNEUCtDemZCZ21tSjBhaDdrNUplczM2bkljWTZnOG5FdURqTmhoV1ZL?=
 =?utf-8?B?U05yVW1GK29YWEVELzgwcDdWWlhMM3VBYzZjcDFOR0RneFpUaEpLS3BqYzhQ?=
 =?utf-8?B?elNhbXhmbkxVaXoxZkVnSXdWVkhNRFdjRkh1aWpCRlZJWURSbnFBSHRuZkZX?=
 =?utf-8?B?WTcyNG1NcjAzMERzTWhQaDJGRytOZ0hJMk5yT0hkQU9sVUlRdnVWUHNTQTFj?=
 =?utf-8?B?ejFRbHdzcDBVZG1aN1FyaGovc1FzNnN0ZUpDcFRZaHNjQUJiZGM3RHZETkxy?=
 =?utf-8?B?eGRpeXhpZk9ObkxZWlhMbWplSzZHL1ZoVzRiSWo5OExQQ0tsSTNjaWtucGJp?=
 =?utf-8?B?QTlZMkJYR0VwTXhYb2M3TDk0b2RaaEVNQ1UxNGR3ZEhRRXV6QVBCMHZZS0FL?=
 =?utf-8?B?bkN1Lys3bkk3SWY3a2tMbTJ1UTdPRS9kZWhEUUFmOUR6dHlDRU9DVG1SY25J?=
 =?utf-8?B?YzVQQ0x6MmNOWHZrUU8xYXVZMlgvQk1tT1VjRk9JQS9Qb0VDRzV1UjhPc3JG?=
 =?utf-8?B?dFpUYkNaM2JlcjMvR1JOcnhTOUFrVDRGK29teFNNTXNXOVdZdHFQdjQ4WDA1?=
 =?utf-8?B?eTJQRk80NVVTVytYME8rQkN3SGpISEUreTdROGV0RmlEZjFvMDRmckpwcCt2?=
 =?utf-8?B?NEhyZllNMU9XR2NVcUhyaW1YemVuWWlLS05XdEN6cUN6OW0rZFV6N28wNHNU?=
 =?utf-8?B?Y1lFZjVmOENlZDdsbFY0L0crcC9JTGgvaGpra3NxcTd0Nm5sK3JuRnVYNmlG?=
 =?utf-8?B?eTBZVUtZbXRCRXE1TlVHeDFIKzlpVEY4ektJRjRkalFYclpNVTNCNHE3Q3NP?=
 =?utf-8?B?U1ZndjhHcGNEWVBvVG10eUNzYVVkZDl0ZDhETkV5K3lPajRaQXRpbDROY1lH?=
 =?utf-8?B?SzJma3FTOXdLS1RNOW5iZWNlaEVIL2pLQUwvUVN3NUlqT1dubHNMaTJWanht?=
 =?utf-8?B?RlBndzQ4THhGWTByTnczQmZERjRhTDk5NnhIRnZpWC9JSlZ4QVM3OXhveDB4?=
 =?utf-8?B?MmV5ZGk0Zlh3TW5wZE1DTEdUNFBwSlZyOXR2RC9NOGVaQy9Kd2xyZFp5QmFD?=
 =?utf-8?B?Y3I1N1RiZUhOTllsOWw5Z01UeGlYNFRCdTZTMlVwTlgvcDMzVXNpTzRTZEl3?=
 =?utf-8?B?TkgzU0tZdFJnY25HSjFIdFd4R2x0Q3BScUpTTkJ1OU9RRXJaM09PQkVlQkZP?=
 =?utf-8?B?UlMrSzYzZzNHMGd4OGNSaXpNeXU1MVNzSlhJSUk3ODJjTVRiTnlFYTBPcDhB?=
 =?utf-8?B?VTVjeG5ObTZEVlROZ2dLNXAzNThnMUJLcmFxK3p3STJnZnd2S1AvOFNrUXhT?=
 =?utf-8?Q?0x5ICm3wtG2xI8UU=3D?=
X-Exchange-RoutingPolicyChecked: chqx6sLlS4Dobi8fdTaLSUxvgaUUbHCCBYYSmRoDQJraIpe+JPOxVMEhkpNJfh9nBce+W6agme/4MIU5wLWFqoFU4wKgKhJlokx5UV8EXxlNXs/JBs13o8xedw5VNJjKQSspfgj39OJoB+RxmYK3aAUDXKnqnE7jOtoB4Ut4SYtSwVY+GxgfU/vu1OS5MjWDi/jJuEXrefpHYJTfBDfqrrqRdDV5VBy32PFy6toCiipCRMzQIg8icnT9pv00JxQQw4fRli6HMQQUJ4rmlveFQo2oCeqPj3tj2x1CedUuYnQKUMEEVx+Nhe3wK5/OeZmiZ6Fiwyg/vYvzLwWvwhrEdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11244e3a-7e32-49e9-041e-08dee7173f12
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 11:00:16.4478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNdQIUWcXkfuoq7HtKz8azr/BQa/hZ+Yiu253yqVCCIaDI/X2BU5x1SClI0Xq1u5AANXnivjmiVrjCEHH2KVjG2V4Ma3Wnzj52iRMx/EYFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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



On 7/21/2026 4:25 PM, Sharma, Swati2 wrote:
> Hi Chaitanya,
> 
> On 14-07-2026 08:15 pm, Chaitanya Kumar Borah wrote:
>> This reverts commit be4e98c3b79e8bb843f7bb762616742691fee72e.
>>
>> Enabling DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE from the common
>> igt_display_require() path makes all IGT display clients opt into the
>> new plane color pipeline UAPI.
>>
>> With the color pipeline client cap enabled, legacy plane COLOR_ENCODING
>> and COLOR_RANGE properties are ignored during commit preparation.
>> The driver cannot distinguish this case, because enum drm_color_encoding
>> and enum drm_color_range do not provide an explicit uninitialized value.
>>
>> Revert the global opt-in and keep the cap enablement local to the
>> color-pipeline-aware tests. kms_properties colorop coverage shall be
>> preserved separately.
>>
>> Cc: John Harrison <John.Harrison@Igalia.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   lib/igt_kms.c              | 2 --
>>   tests/kms_color_pipeline.c | 5 +++++
>>   tests/kms_colorop.c        | 4 ++++
>>   3 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 2eefb773b..c56127c42 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -3201,8 +3201,6 @@ void igt_display_require(igt_display_t *display, 
>> int drm_fd)
>>       if (drmSetClientCap(drm_fd, 
>> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>>           display->has_virt_cursor_plane = 1;
>> -    if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 
>> 1) == 0)
>> -        display->has_plane_color_pipeline = 1;
>>       plane_resources = drmModeGetPlaneResources(display->drm_fd);
>>       igt_assert(plane_resources);
>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>> index 6119a830f..78860a845 100644
>> --- a/tests/kms_color_pipeline.c
>> +++ b/tests/kms_color_pipeline.c
>> @@ -349,6 +349,7 @@ run_tests_for_plane(data_t *data)
>>   int igt_main()
>>   {
>> +    int has_plane_color_pipeline = 0;
>>       data_t data = {};
>>       igt_fixture() {
>> @@ -363,9 +364,13 @@ int igt_main()
>>           if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) 
>> == 0)
>>               data.display.is_atomic = 1;
>> +        if (drmSetClientCap(data.drm_fd, 
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> +            has_plane_color_pipeline = 1;
>> +
>>           kmstest_set_vt_graphics_mode();
>>           igt_display_require(&data.display, data.drm_fd);
>> +        data.display.has_plane_color_pipeline = 
>> has_plane_color_pipeline;
>>           igt_require(data.display.is_atomic);
>>       }
>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>> index 4db83470d..16db0b8ad 100644
>> --- a/tests/kms_colorop.c
>> +++ b/tests/kms_colorop.c
>> @@ -418,10 +418,14 @@ int igt_main_args("d", long_options, help_str, 
>> opt_handler, NULL)
>>           igt_require_f(!ret, "error setting 
>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>           igt_display_require(&display, display.drm_fd);
>> +        if (drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> +            display.has_plane_color_pipeline = 1;
>>           kmstest_set_vt_graphics_mode();
>>           igt_display_require(&display, display.drm_fd);
>> +        if (drmSetClientCap(display.drm_fd, 
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> +            display.has_plane_color_pipeline = 1;
> 
> Can't we follow same local variable pattern as kms_color_pipeline? That 
> will avoid calling drmSetClientCap() twice.
> 

We can but since this is a pure revert we can take it up in a separate 
patch.

I can float one if this gets approved.

==
Chaitanya

> 
>>           igt_require(display.is_atomic);
>>       }

