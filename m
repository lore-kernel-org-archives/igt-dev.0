Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A40FF886F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6479210E11C;
	Thu, 30 Apr 2026 10:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYjvlwXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F85910E0F5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777543457; x=1809079457;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=APLrg0Li4fLFWmKGFJCL0bO+S0OnFpss1AmjCot9gfw=;
 b=SYjvlwXNumspXhQ9WIuM9eSEHSPK0kLz3NCASaUwJCBDzgwH/4VxPIPV
 L2wNUrNaC0/djz9rZ5zInDyImsskwETTW+OSmz3zRnRVhxm544rCit2F8
 i9QXqpIDGkYaV4swcVoYl8nEg5aiR90wds15h4HkJNfVEWgY/9eeZVXkQ
 bbnPgTfwEskwFqRBp6HgZKKO2mhko5xb+eVrSqaLJ5SHu/YXuPd0WEO28
 B1aPqtCTQ/705a3fkX/CXI45nVVJJyCpImNu4Eznjx42zM9xxoTTVKFlP
 teF8rfZAjEopLvPvhW6WB7HYqyxTxAuVbCjeOaUVywfhhq/CNxbyvdcAD Q==;
X-CSE-ConnectionGUID: BsxFxGhSTeCB4fkLwXno/g==
X-CSE-MsgGUID: rujs0sP4TNWrtnIY4QAbGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81066061"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81066061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:04:16 -0700
X-CSE-ConnectionGUID: R/fXW9WaQM+LLMQKYdToxw==
X-CSE-MsgGUID: DYWeJvBTQyyZg/KbkRMfNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="258117845"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:04:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 03:04:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 03:04:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 03:04:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbG+2ypfedo4ZITlSllU+Q6Nc0sSZkHTJ0AntJB3Ypl+3lNyhmwK9f4Y6FFiRlComRcWqKrbKNtYLkI4e/PDkbdWhnnhjj40iF5AbUaw352bTEEVfR+abV+CT1YXGZcdoLdurFw226SCs2jxM4s7MK1kvaCyCYJIFf2rgLfdLSZUyZRjjI9RpYSfwwdVPYqj0X9LMQJBCmcwKNAsu8WWzADEPVEWdnq1A8Vg7vzGVKBM+vAuFePDIQoCuhzQZkzg4d7n5yO1jb/SaewqKewd0q1Lyr8ciuPZHAgztHmLCeFDqvubBaSdhPg8lxMDqeWsVL7j5n6je4oRVnU61/oHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNQMGLdY/qmnVO/u0O4Hf94HeVyM8Cqp4IoNxQaTISU=;
 b=oFFO4WyPYYrC45hs58mEmRvwNT+KE76gnONVaZck6S/rF+5OrvNZXyH1oV+gOeRSpocwFIkV/aSntLQN7wGrB+D4BeCmaHzyeRtZYyA+SBIy1eZdqcxfk3a3tXBfKs2k/tX7oYjVjHJWBpRNgDhSqoMdjltIonTfaI3AT7fMxqcSfCHrtEa51Sak2af+ULz0I2xVmREX/oLRblbbIA8IVFJEo0n/PbimPQ3KyvvWV3Te3MDzyLlvHJIqDZGFo5iS/a+p5/xfECwSfQTeH16IKER5Aqfyb2bFy7Slq8wv1okFUpaRCaOv0tdbYUAdi4Z1UR4iVnXNfYzLNrA6Df2FcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Thu, 30 Apr
 2026 10:04:12 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 10:04:10 +0000
Message-ID: <3ea30cc5-22da-49b0-8b3a-3f4c9272da0f@intel.com>
Date: Thu, 30 Apr 2026 15:34:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 4/4] tests/intel/kms_dsc: Add force dsc and
 joiner test cases
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260429195115.2332923-1-swati2.sharma@intel.com>
 <20260429195115.2332923-5-swati2.sharma@intel.com>
 <2ae52502a329392abcf7c1c76224e35e18335dfb@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <2ae52502a329392abcf7c1c76224e35e18335dfb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: e2daa273-112c-4fe8-0940-08dea69fd2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: izvYEuqmCCqVfD/VN2CmDOtH8/Da1+FWNjmW7Aiv1L5jlOquB7mW9UoG2cmBk71pQgE5AA2g33jPCU0L4dJPs9sbossaFfcHukfwk1lYjRifBaqW6UM/16icKOKAKU3BI6tDs+yEZ3AXHM+GTlAGDkTpn3ahRTjV7xSpYu5VdMl2IKQSFtNatBSZ9FyTOYUq6uIVvojQIA3vYJCq5RT9Vdwz+eDO8FMDfQV3mQrfrS6SkqwSsnLTVeq/f//i1sLjII6ptFfVF2doXRIKnVDf5lViVPJpZg/JOBz/NVcL4o17nD+K2GlcDhfZ9wjdWLdjiKcQP0f9DpIT2mUuy2EVTsUGfiVK8FD93p32I3eq/lUj+RqYyc3a6Jbudy0muwRvKhEpNs295QEQhKkc7dBj7urPVes36d8+b4korga80ZlaRCpug2FjvVoEBapnn8qIJyhziqSYr13P5vuLKNAFkIRJQ1Wvv1K89oSm/IkFkZ9kl1ErpgMxKPL5nQc0HAWE+awcGXLJhNVdF2sRhDxPbZqi/QTN1bl9m7VM43yIOtqmS8xPwny8d3QJyzSbQRSZTdQWU2BrJkJPD8t/ciiczmIJACucAKlGNz/IM9gHmjwcnwQnYMgLQILKKZlV2gq3pEdyOyRDr96/Oxr7HHLypcPL2Lcds4lTIifY7Lj8CQXgT+z8AmBRFYfLlXGoMBrq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3Z1aHdObFg4amRzMXJHWE5Fc1JUQkJiWmxMb1dYTGJDOENGMlBYVjc2Qmg5?=
 =?utf-8?B?ckx0RmNmdUQ5R2dXdmtENUprR01SS212aGRHditaMXBUcmNveThCNmdseStS?=
 =?utf-8?B?bGF2L1FmZkpkMFd2Tm42bXQvWWdxQXZNbnQzU3p2MHVhaFNod21TTmNGbG96?=
 =?utf-8?B?bzRQL04xWkMwblErNEVVd3cyRk91NmlCTEhxc3BVRzVhaFR5d01Xd2ZWM21O?=
 =?utf-8?B?NmduWGV4NG9hUmNwdUFoK1FDSysyOEVNUFMveG1NK2IxN3I2ZytlZlpBRE1M?=
 =?utf-8?B?OCthaUF4WVBCRzNhdjBFSythcVo5a0FGSmVQQkNhbnBwYnRKZmM0L2xtcjJM?=
 =?utf-8?B?MnFLcGo0VFA5cG5OdUJDb0ZVOFprajlYcUMzZXpiaENSZ0d2RFRKd3BteTZX?=
 =?utf-8?B?UmwvUE52aGlzeGJlVUM3TXdNMXNHczF3UGZDTW5YdnMyMks5OVZCeFB3cDBX?=
 =?utf-8?B?dVNpQXpQWXVKRzFCOVJnMXJLS0NuUW4vcVh1d3B5LzkxV0RPNGVQcFV4SDFW?=
 =?utf-8?B?MFE0YWtQVVR3NEdmT1I0ZXkvQUtPNDk1eENQRy9sUlhvODcxeGVLd1ovNXdF?=
 =?utf-8?B?UXc4TXZORmJSNk1sbVgveGdFNnF6dzJnbXg1Si96dFd1T0ZLdEFVa3dua3lo?=
 =?utf-8?B?K0piZnZwalM1djY2ODVvc3pWeXlvT25uMGxTL1hZbGVUTk9KYTJCT1B5Q1A0?=
 =?utf-8?B?eGRzT1BaeERwSGtIeGVueUZtWXphL1kydUU1dGx2UDB6YURaeHZiQnJkbFJZ?=
 =?utf-8?B?cXdUSzBLek9zSVRDNjUycC9JM0E5VUVMQnBDVkV5Qkd0SEtmNjdwWGdrS2Qz?=
 =?utf-8?B?aHNUckpnZVJXMGtKM2VYMEVPc1BHNVl6aitGRHBnbnkwcU5VVzZuVGlKa3JG?=
 =?utf-8?B?MXNkU3dHd0pEYnMvTFhiTXZnOW13Y1NweXN5R2JQVDFUWSt6YVFuaW03eFJU?=
 =?utf-8?B?MnFKc1hWUWlrRHcxSG1adCs0cVhRTkdYcGR6b21STzB4UUxDWGxEcHM2SWxB?=
 =?utf-8?B?bThYeE5uUmRsWnB3RkRCcUZnbGN1OW14WHl0OFM2Yll0SUgrY2U1RFR1YWcw?=
 =?utf-8?B?QjlSOEtnNGo3YmpveVRURW5qY0cvZHFkSSsxQ2J1cisrTXhnZWUvakJYZzFW?=
 =?utf-8?B?dUxOZjlRdkM4NTNWZXNvZEh5MHNRRGc2TzdweFdhMVFRMmkxQmEzanQzcis0?=
 =?utf-8?B?anFraDg1c282ZTlFaFV6THNydmlMQ2lRaFVBTG1TN3BvZXdodjNlNUlpK2Jw?=
 =?utf-8?B?Uzk1dSsreWg5Z2FtWDdZeVBHWW10QUVTOGRXeW9TMC9ES2R5Tk91QnhMcHZs?=
 =?utf-8?B?NDhaOVI1SkVibGtXVVVoSklic1g4aHlCZHlsbDQycmI3YXAwaUg5YjBSRktw?=
 =?utf-8?B?aEZQQUZWR1hNbkswRWtwbmF3Um5Fc29YOVRaSFZKV0Q2MkRxckpnZzZJbTNF?=
 =?utf-8?B?bFo4K2l3NjN1NE5BWlJVNmlMZC92QXQvT21KeHp2UWRidUI1NWwrb25YVVI1?=
 =?utf-8?B?cVlRY05rcDVBSzM1ejNuMHVxYyttZnJvcm0vY3g1Z01lNks4MXJKaXhmUjR0?=
 =?utf-8?B?QWZNVGRzWEgwN3FhSWpnaFVUNWQza1NySjhDTG5rVUNsR1JpMVRMaFBLN0Vt?=
 =?utf-8?B?QW1GUVhaK3Q0M3JCWWhFTExFKzhySFZQYTlIUGkrYVpsTlRvYVBIU0s0b2pR?=
 =?utf-8?B?QWFnL3VYVy9IVFZMNnJZTVpnbjdHVlVxVWpvNis0V3U4dEFzOHlnSmRPVlh1?=
 =?utf-8?B?UVdzLzVCSllwUmN3ZTMxQlpCeFFOc2NPNklLWnRoMHB0VHVOMnU2bTlRQWhX?=
 =?utf-8?B?cDF2SXdwd3BjK3Nib3NOMUFSdlBjWnA4RmttVHJLd0lRd3FpWlFWa1V3czhP?=
 =?utf-8?B?UEtIdTJBdmhIL3loaU1HLzMvYnNEY2Vva2w3VDdEbGRNNkhtcjJCdTZjWmNl?=
 =?utf-8?B?UWNNUnpYaXdUcXlIWFBxNnArM3JSRmY2WFRKZzUxb2pGemxEZ2gzSEJPN2d1?=
 =?utf-8?B?QkNGTmx4ZUlDbmEyVy9iZEp1aUdYaUE4Kzc4SVQwU0dlVzZtQTRWRjJPeUR4?=
 =?utf-8?B?dDhHamxteW1jNEFzNlpQNGJaa0x1MHZGYzdyWTdUVVc5T2ZHMmw3ODVsK0pO?=
 =?utf-8?B?am9iK3FaNGVkb3Fid3NYeGttbnpsNHdmMWdRYzBhQ1c4SklCeXdQUTdBU2dM?=
 =?utf-8?B?YkFrbWV0QUx1U3N3aVplSWNBaU9Oa2ltaDdNaEdINXVVSDU0NFJaNHMvWXNv?=
 =?utf-8?B?QTg3VXRva29QUkF1MGVZYWhVdUlBQ253QlZtUFVzZklyZFBHRlpmMlZ1cnA0?=
 =?utf-8?B?QnljdDZ1VTRxV09JdCtYZm55UGptM1ZscHlzbnlNVXh1aFBwZndEdz09?=
X-Exchange-RoutingPolicyChecked: c1gr1ouL0TqfuDyIqZ2xgAeMpY87oBXpE0R5ecKyAYiPjBidwYpbnzRGsdJD+ciTD53ZshAOroO7bPOclgkOGHOCfs8/cSiqXWjMYFFO1JwIQ2Ub0iZU8uqIGtbZr2A7v8laLXkOTUvJYaxa153sQcH939E0nBmIjaJ5g5e6pNfMCHF5TCTM9NVVz5XG9moD1BNTNibJ/ATMLyL2sIUYNSJJBqCxgpEBMG22TjcmUcHif/jwoVOehkauyBcqydvwbmzHDKkpUpvlpekFJoOQbileBCjS8UcVMrdGDfcE1KRVDcdLHt7bvC4RgshGY4p4Ke6KCEJ4l6HPd5+rjvtwdg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e2daa273-112c-4fe8-0940-08dea69fd2fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:04:10.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ree2E0ckX93aohcIYoGrRYZa4FiAc2vZa3vo4SMQo+ty3aB0qrcTzLrzZpn8m5ZOU1c7t1bcixSkzYnYevyjRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
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

Hi Jani,

On 30-04-2026 01:03 pm, Jani Nikula wrote:
> On Thu, 30 Apr 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
>> Add test cases where we are validating force dsc and force
>> joiner.
>>
>> v2: -fix if() for ultra/big joiner (Ankit)
>> v3: -Add '-' separator in subtest names when using
>>       igt_get_joined_pipes_name (Santhosh)
>> v4: -Use 'enum joined_pipes force_joined_pipes' in data_t (Ankit)
>>      -Use dsc-basic-%s format for subtest names (Ankit)
>>      -Use igt_crtc_for_pipe() to check consecutive HW pipes,
>>       handling fused pipe holes properly (Ankit)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_dsc.c | 206 +++++++++++++++++++++++++++---------------
>>   1 file changed, 134 insertions(+), 72 deletions(-)
>>
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>> index 69f335da3..bfd84e59a 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -55,7 +55,27 @@
>>    * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>>    * @fractional-bpp:               DSC with fractional bpp with default parameters
>>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
>> - */
>> + *
>> + * SUBTEST: dsc-%s-%s
>> + * Description: Tests Display Stream Compression functionality if supported by a
>> + *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
>> + *
>> + * arg[1]:
>> + *
>> + * @basic:                        DSC with default parameters
>> + * @with-bpc:                     DSC with certain input BPC for the connector
>> + * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
>> + * @with-formats:                 DSC with default parameters and creating fb with diff formats
>> + * @with-output-formats:          DSC with output formats
>> + * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>> + * @fractional-bpp:               DSC with fractional bpp with default parameters
>> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
>> + *
>> + * arg[2]:
>> + *
>> + * @bigjoiner:			  big joiner
>> + * @ultrajoiner:		  ultra joiner
>> +*/
>>   
>>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>>   
>> @@ -81,11 +101,13 @@ typedef struct {
>>   	int disp_ver;
>>   	igt_crtc_t *crtc;
>>   	bool limited;
>> +	enum joined_pipes force_joined_pipes;
>>   } data_t;
>>   
>>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>>   static uint32_t bpc_list[] = {8, 10, 12};
>> +static enum joined_pipes joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>>   
>>   static inline void manual(const char *expected)
>>   {
>> @@ -135,6 +157,7 @@ static void update_display(data_t *data, uint32_t test_type)
>>   	int current_bpc = 0;
>>   	igt_plane_t *primary;
>>   	drmModeModeInfo *mode;
>> +	bool status;
>>   	igt_output_t *output = data->output;
>>   	igt_display_t *display = &data->display;
>>   	drmModeConnector *connector = output->config.connector;
>> @@ -147,6 +170,11 @@ static void update_display(data_t *data, uint32_t test_type)
>>   	save_force_dsc_en(data->drm_fd, data->output);
>>   	force_dsc_enable(data->drm_fd, data->output);
>>   
>> +	if (data->force_joined_pipes == JOINED_PIPES_BIG_JOINER || data->force_joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
>> +		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->force_joined_pipes);
>> +		igt_assert_f(status, "Failed to toggle force joiner\n");
>> +	}
>> +
>>   	if (test_type & TEST_DSC_BPC) {
>>   		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>>   		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
>> @@ -246,25 +274,35 @@ reset:
>>   
>>   static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>   		     unsigned int plane_format,
>> -		     enum dsc_output_format output_format)
>> +		     enum dsc_output_format output_format,
>> +		     enum joined_pipes joined_pipes)
>>   {
>>   	igt_display_t *display = &data->display;
>>   	igt_output_t *output;
>>   	igt_crtc_t *crtc;
>> +	int n_pipes = 0;
>>   	char name[3][LEN] = {
>>   				{0},
>>   				{0},
>>   				{0},
>>   			    };
>>   
>> +	for_each_crtc(display, crtc)
>> +		n_pipes++;
> Nowadays that's just igt_display_n_crtcs().
Ack
>
>> +
>>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>>   
>> +	if (joined_pipes != JOINED_PIPES_DEFAULT &&
>> +	    !igt_is_joiner_supported_by_source(data->drm_fd, joined_pipes))
>> +		return;
>> +
>>   	for_each_crtc_with_valid_output(display, crtc, output) {
>>   		data->output_format = output_format;
>>   		data->plane_format = plane_format;
>>   		data->input_bpc = bpc;
>>   		data->output = output;
>>   		data->crtc = crtc;
>> +		data->force_joined_pipes = joined_pipes;
>>   
>>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
>> @@ -285,6 +323,26 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>   						      data->drm_fd, data->output)))
>>   			continue;
>>   
>> +		/*
>> +		 * Check joiner constraints and verify that we have
>> +		 * enough consecutive HW pipes starting from this crtc.
>> +		 * Use igt_crtc_for_pipe() to handle fused pipe holes.
>> +		 */
>> +		if (joined_pipes != JOINED_PIPES_DEFAULT &&
>> +		    !check_dsc_joiner_constraints(data->drm_fd, data->output,
>> +						  n_pipes, joined_pipes))
>> +			continue;
>> +
>> +		if (joined_pipes == JOINED_PIPES_BIG_JOINER &&
>> +		    !igt_crtc_for_pipe(display, crtc->pipe + 1))
>> +			continue;
>> +
>> +		if (joined_pipes == JOINED_PIPES_ULTRA_JOINER &&
>> +		    (!igt_crtc_for_pipe(display, crtc->pipe + 1) ||
>> +		     !igt_crtc_for_pipe(display, crtc->pipe + 2) ||
>> +		     !igt_crtc_for_pipe(display, crtc->pipe + 3)))
>> +			continue;
> I don't have the time to look into all of this properly, but I have a
> feeling it would be worth it to add a coherent set of joiner helpers
> under lib/intel, consoditating the joiner stuff from lib/igt_kms.c and
> tests/intel/kms_joiner_helper.c, and possibly kms_dsc_helper.c etc.
>
> It's just not tenable for tests to be checking the above.
>
> That said, it takes time and effort, and I'm not insisting on it. It's
> just something to think of, and maybe start moving stuff to a single
> location to make it easier to re-use.
>
> BR,
> Jani.

Agreed, consolidating joiner helpers under lib/intel/ would be the right 
long-term direction.

For this series we'll keep it as-is and file a follow-up to refactor the 
joiner helpers into a common library.

Happy to do that as a separate patch series once this lands.

Have created WI#205: 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/205

>> +
>>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>>   			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>>   		if (test_type & TEST_DSC_FORMAT)
>> @@ -334,85 +392,89 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>>   	}
>>   
>> -	igt_describe("Tests basic display stream compression functionality if supported "
>> -		     "by a connector by forcing DSC on all connectors that support it "
>> -		     "with default parameters");
>> -	igt_subtest_with_dynamic("dsc-basic")
>> -			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
>> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
>> -
>> -	igt_describe("Tests basic display stream compression functionality if supported "
>> -		     "by a connector by forcing DSC on all connectors that support it "
>> -		     "with default parameters and creating fb with diff formats");
>> -	igt_subtest_with_dynamic("dsc-with-formats") {
>> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
>> -				 format_list[k], DSC_FORMAT_RGB);
>> -	}
>>   
>> -	igt_describe("Tests basic display stream compression functionality if supported "
>> -		     "by a connector by forcing DSC on all connectors that support it "
>> -		     "with certain input BPC for the connector");
>> -	igt_subtest_with_dynamic("dsc-with-bpc") {
>> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
>> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
>> -	}
>> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
>> +		igt_describe("Tests basic display stream compression functionality if supported "
>> +			     "by a connector by forcing DSC on all connectors that support it "
>> +			     "with default parameters");
>> +		igt_subtest_with_dynamic_f("dsc-basic%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>> +				test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
>> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
>> +		}
>>   
>> -	igt_describe("Tests basic display stream compression functionality if supported "
>> -		     "by a connector by forcing DSC on all connectors that support it "
>> -		     "with certain input BPC for the connector with diff formats");
>> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
>> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
>> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
>> -				bpc_list[j], format_list[k],
>> -				DSC_FORMAT_RGB);
>> -			}
>> +		igt_describe("Tests basic display stream compression functionality if supported "
>> +			     "by a connector by forcing DSC on all connectors that support it "
>> +			     "with default parameters and creating fb with diff formats");
>> +		igt_subtest_with_dynamic_f("dsc-with-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
>> +					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>>   		}
>> -	}
>>   
>> -	igt_describe("Tests basic display stream compression functionality if supported "
>> -		     "by a connector by forcing DSC and output format on all connectors "
>> -		     "that support it");
>> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
>> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
>> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
>> -				 DRM_FORMAT_XRGB8888,
>> -				 output_format_list[k]);
>> -	}
>> +		igt_describe("Tests basic display stream compression functionality if supported "
>> +			     "by a connector by forcing DSC on all connectors that support it "
>> +			     "with certain input BPC for the connector");
>> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
>> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
>> +		}
>>   
>> -	igt_describe("Tests basic display stream compression functionality if supported "
>> -		     "by a connector by forcing DSC and output format on all connectors "
>> -		     "that support it with certain input BPC for the connector");
>> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
>> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
>> +		igt_describe("Tests basic display stream compression functionality if supported "
>> +			     "by a connector by forcing DSC on all connectors that support it "
>> +			     "with certain input BPC for the connector with diff formats");
>> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>>   			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
>> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
>> -					 output_format_list[k]);
>> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
>> +					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
>> +					bpc_list[j], format_list[k],
>> +					DSC_FORMAT_RGB, joiner_tests[i]);
>> +				}
>>   			}
>>   		}
>> -	}
>>   
>> -	igt_describe("Tests fractional compressed bpp functionality if supported "
>> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
>> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
>> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
>> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
>> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
>> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
>> -				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
>> -				 DSC_FORMAT_RGB);
>> -
>> -	igt_describe("Tests fractional compressed bpp functionality if supported "
>> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
>> -		     "with certain input BPC for the connector.");
>> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
>> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
>> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
>> -				 DSC_FORMAT_RGB);
>> +		igt_describe("Tests basic display stream compression functionality if supported "
>> +			     "by a connector by forcing DSC and output format on all connectors "
>> +			     "that support it");
>> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
>> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
>> +					 DRM_FORMAT_XRGB8888,
>> +					 output_format_list[k], joiner_tests[i]);
>> +		}
>> +
>> +		igt_describe("Tests basic display stream compression functionality if supported "
>> +			     "by a connector by forcing DSC and output format on all connectors "
>> +			     "that support it with certain input BPC for the connector");
>> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
>> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>> +					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
>> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
>> +						 output_format_list[k], joiner_tests[i]);
>> +				}
>> +			}
>> +		}
>> +
>> +		igt_describe("Tests fractional compressed bpp functionality if supported "
>> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
>> +			     "with default parameter. While finding the optimum compressed bpp, driver will "
>> +			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
>> +			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
>> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i]))
>> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
>> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
>> +					 DSC_FORMAT_RGB, joiner_tests[i]);
>> +
>> +		igt_describe("Tests fractional compressed bpp functionality if supported "
>> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
>> +			     "with certain input BPC for the connector.");
>> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s%s", joiner_tests[i] ? "-" : "", igt_get_joined_pipes_name(joiner_tests[i])) {
>> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
>> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
>> +					 DSC_FORMAT_RGB, joiner_tests[i]);
>> +			}
>>   	}
>>   
>>   	igt_fixture() {
