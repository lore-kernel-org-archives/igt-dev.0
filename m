Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B337C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 08:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1EF10F221;
	Thu, 16 Jul 2026 08:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZovwdUKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B8E10F221
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784190421; x=1815726421;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0WOASKcnzNmjfMxCKXxFSIXTAk6FFTiW0qpEv+1GxUI=;
 b=ZovwdUKW9AcIuxmIiAWIHeGEf5a/2nw9JuzyyOEbzjTyyDD5iN3/BOgw
 jIOKRLA/ely4/6aYrLcJgGjTb5bq69vAc31TY9oJtGFVrItHq0KWERzlL
 hseYNvUn3Qc/NGMBEKb645hB55G4TGOin6wJZcTC+q2rNM4pQsoTmyk1Q
 RG0eVOreHryOo/ocBKVw1ot4R3j43TfVJHrtevbcwgpZkRl7EsDdSWwiz
 ixg4mr4W9MHN2AYZn1nyPbFodzJSqF2EdsZ/otyYKM4ZXeM55ZOiMgKOz
 RTDkF5pIH48X61I37Tbtdw/yt7Cxsk19gEES34UyGj2fll1A962WIQwS4 Q==;
X-CSE-ConnectionGUID: +XOUFU8ZR8G0y/PJg6HAQw==
X-CSE-MsgGUID: b7fhWBlWSTi+iri3QX/lIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88667412"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="88667412"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:27:00 -0700
X-CSE-ConnectionGUID: oenR7N2FQumcC8/V8wBXuA==
X-CSE-MsgGUID: Qn8agR9WR1uHYeu2dpOVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253805677"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 01:27:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:27:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 01:27:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 01:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdsaA0YPjPdjYnQGrY1x3uvadmFODSwRm/vjQvKu9GCk2SqApa7wH/hatGFoBGWBFSTgKZz8rX4N+2LgmtWNoTNazAA6KaRpoQNWB9RwQBZqJcaS3r+Bx02tBTCrT/lV/tTcFq6inmN1ydwQ0n1O92njZjqYa6XI7dFlY9SuGyucuhA0VctweHDl8l0UuBpmOR4T1InWvQ6knXjSu7/X+j/2udhOWoN4LrknU0gXaTCq2TybaRAgHk5ldTfdHBExRJRIYMcOAQMzT5aYdfJPBFo5nsgpC1Unbkz3U55BiHfJWSv9SVCnWH/c8Ef2P87gKB6kDu97t0a8sFDXAT9WLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38GI4EIQaK97UN6taWf9udF/b5nV0yIgoClprvJjBZw=;
 b=BHKsLAV0OVEeXWYiA0soGxsjl2bJZIIjFWNVyCQ/5I4gk9RezLKpuqbOxVf5Tj8AzU+jpni95wUhSQPPLvXIKgO90KDqV+xD9S2DrAYEra6OXAEJrcxaZbGvKmiigcp2id/DB8qUqmCYw7EkE8KJahroLVl+bWJHruKPalt83nZvddRTtre9L4GPUY5IIJIVsQpLhoROgLBZ8ypqJKZh+DfxwPlR4DmqeT60Lb0Qgqe9DAXC41mI31mSShIuA2aIEBUn+IbufcOaXEJ1m03K5NwAtpKDSAeRcgEwa7fJlukFWOFcu/aiGd+AhwSL3Jquinf862EEBFSBUJXVc9hR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 08:26:52 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 08:26:52 +0000
Date: Thu, 16 Jul 2026 08:26:42 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 11/31] lib/i915/intel_decode: introduce static
 sub-library for tools
Message-ID: <uicyvxmw2wpw3q5tdznb46i7owzm7elx3lmtzmd3yaeupuhvam@65wz3pf5gbjw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <25e1c4c9e4e0dad4bef985cb29556115f7f60bfb.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <25e1c4c9e4e0dad4bef985cb29556115f7f60bfb.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TLZP290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 9386f91c-cc33-499f-db48-08dee313fd3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|4143699003|6133799003|56012099006|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: PeuvQjFygzV58QOp9hKChFLq1El/Hk7RDL0c73lsycEhtOhM2OI+rX1vxDPZ4KbSqvlH++DDaKTIpXsJCkMkqBFbyuQzi4YVC0+EZ5Bo4GDnwMHOH39KqL+TSBO6trXb92QOGyM0oBH2lwD5WvhtgLSKo8MEesZAtOhsTRI5c10nJza1udiW31n4dwHEBhq/OoojdUmT8u05Js7XkGTO2zGuSL74zGcrYOCPs/y4nbgkopTq3MpEigsD3Ndl/shaIugZwWH+x3OX329QCMiXI9DTo3KysyDnGJbS7W8SIMmwrN2erUDf5MzhxHEba0A+usBEEujNW6OdVdn7vScjDmrl40anBJap08ck8MgipEQa/pBVVhczG81t1Ib2gG1VR6LBIDNKTaCJ/vt4ojgRZLQgYoZDk4Z3MLlYLpAoHuIVn2dvFyW6e89HJF/nmAEx/4c35OUXt+lsoVUYz01+LuyRqxE5H0Gqa6rk+PrcZ7LarYzayPSS32VNzlLMNsrJaqVg3Q0Z82Zx+yADJR/6RYMRdWAmjE1dtuSqOTBLq0rp4Z6+3KzbU4aouWbYCzwIAb6uSoD/JhirGJOeFQal/NUWlB0YUvlnlb0Ri265zL917v+S/p8vrk0cbhAXa+BgrMXfrkanDEo9iybEzfe2tsxqnNvMO3+sehwD9qQ23wg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1ZkN3ByV3dYeEFPbkwzd2ppNkVHQ05abCsvbFNUUFNLd3JXeDgwUDRUSnhX?=
 =?utf-8?B?aDVESkdNYzZ2ZVc2SFVYRVZld1NZdGl5cytyWUdaRDVzS0R2M1hJWlRvejN4?=
 =?utf-8?B?TDcvSnQwcTYyeVQ1dDZQRHVhTWcyOUN3UStPQmZwSHZkRjdxd3cvWDhSRWNp?=
 =?utf-8?B?dExOKzVHTW1FcDRESGlMakhHZFNZWTFFYWdWZ2JUcW13WXlPa3YwT1dkLzlY?=
 =?utf-8?B?Qy9DdVpBRldpT3lJYkxNKzBSYXBzcmQ0SFNobUlsSGtnaG9ncXJZNUlaeGd2?=
 =?utf-8?B?RDhuaVZlb0Ryd0xNK3YyOGNveUxobWhPaEpkZ1hoblhtUzVrYzV1WkdkcW9G?=
 =?utf-8?B?Yi9MbW02b20yTVVXbDZDTDNzTkdoZG16VFVQQjhKTCtQZGZiaXBocFRSSEgw?=
 =?utf-8?B?UUQxdys4K21ibDdNZHp3c0hqSXlGV0x5ZUdUSVVXUHZLWE1JeVRTRVBWc0Ex?=
 =?utf-8?B?aGsvNkt5bzJyL3NyaGJHWFVpTGk0ZGVPVFJhMjh4N29UZWVtNklUM2lxbXRq?=
 =?utf-8?B?TDgzRk52aHdHa3lvQTVEMHYvSmRmQlQ5OHRlYWJZVStYbzJMOC91R3NxNmE3?=
 =?utf-8?B?WlB6V0RCc0pUZFhMQ3pJZFhpWldJazNNNFNNdW80VVFuMmc3OXFxMzFBNXF4?=
 =?utf-8?B?MmlCVTJPTi9iaWQzN1FrZjhNRGVDblpOZWJzZTlqZzkydE1jVmxNZktTNDZS?=
 =?utf-8?B?L25hNnNNbytjdC9aWW4yR0J1M1hlTDlPU2JlQjRhWlhzWlB0WlZHQTkvQllT?=
 =?utf-8?B?clRXMERSeVJHeVBRVzRROFlld0lsdkVHZWFCamtmdEh4Z09SNFo0cFZtNWFz?=
 =?utf-8?B?TWp4WmlQb0RkdGt6bU1CaXVmNGVIVlNWbTBtRWFmL3VwSVlkZ1FlSTl5Vmwx?=
 =?utf-8?B?bGovV3VHUm1vM25rbmlFZUs4dXFzc29aQ0UwanM5bnpPM0dtOGxTZFh3YVh4?=
 =?utf-8?B?eUd0UzR3V1Vqa2ZyY3Z0N3VFNHlsQkJiVFI0eU5yUjFNZ2NEckorL2pZbWNY?=
 =?utf-8?B?dHpFb1dpUkYvNkJBcWEwL0hOSzJDeXUyc2J3eUhudUYyWVR5TWs5eGhkSWVy?=
 =?utf-8?B?SC82YUJlQ3hrajRWak1aZ3hqQ2k4RGVxNkp3eFBJTWFHeG9VbXZZSlVzZjZM?=
 =?utf-8?B?Y2g5SjZrVkNrcU45aVZxd1ZWQjZOR2pzZnNXSGh1V0VDVnE5VjhEQis1VHRa?=
 =?utf-8?B?WUhsQUNxNysyZUNwbE02WTRlcDk5OTd6MjV5WTBzUlJ0YWVydnFLWFp3ang0?=
 =?utf-8?B?UzdlQS9yWS9kWU1pek93Rjh5OHB5eHMxdmNvK1dTcVlHb2ZVMkpNLzNidkds?=
 =?utf-8?B?aTdNZlpLSG96L3BmbGlFN0JEbTZWNjlsL1MxcXA5dm51eHpxckQwcWxIaDhj?=
 =?utf-8?B?L0V6MmEyOWVsYXJleURpeWNxdUowSlF4eEhaN3hIVjdiR1UxQUM4Q2x4aHpK?=
 =?utf-8?B?N1pYcXBKMUVvRW4zbXV6M25XMTl6d2NydHgrb3pNNkx0SEw2Zlg5Tm9GR3J4?=
 =?utf-8?B?ZXNxTFNwYUxVVG9LQll5Rk00Q0ZZVEl1SElxRnBKQ2pWdzNWWjRIc3NzTnRm?=
 =?utf-8?B?R3RRMWxZV2hhRURHMEFXcERoVDhpUEJXTnFZbGlpN3UycXlvZTVhY1RCME1F?=
 =?utf-8?B?N210czBIU2gwTXdvcTZNSXYvbk8xYTc4c1dub1d5NEgzKzhnMDhyUUN6ZmhU?=
 =?utf-8?B?cnJmTlBxZWhXMVNDYmpsQy9oQXZCbjQxQTRSZlRUTy9IajAvK3VxOGVwL3hL?=
 =?utf-8?B?ZEQ2YlA3WFh4STZHaVFmdGQzQmlqT1BsVUxiSndPaHIzVlk1V2UwTmxlQVFX?=
 =?utf-8?B?azFVbUhrbVVOUGlqK3dnQVJGclNBMXZ6aFJleE9VOWxuUmFwcXNOT3JHZU1C?=
 =?utf-8?B?bnVUQ2xsVnErK2prMFVxUm1XQW5TK3poaTJLT1E0NElOSlJYbnB6YUEyT2xJ?=
 =?utf-8?B?VWhWcVFIL2Z0QlRRRDZ1ZXRPN0ViRW56VnlUamdDZmcwQ0RPN0tZOWZLNWVZ?=
 =?utf-8?B?YW1GWmlaQlQ3elhWcWtqNUw0ZE5BaEt1RCtnNXQ1dzZGZEtmYkpGakFEaVM2?=
 =?utf-8?B?UEZVc3Q0V0Q4d3dlbFloeE9LRk53TFk0UWRPRVg5MHVMd1VHR3ZNTHlMNXFw?=
 =?utf-8?B?NjJqZkVIMjh0YTdXV3dtWDlMN0crSEY0MFhENG9jdDZONlNrK1pRTE9kZVMv?=
 =?utf-8?B?b2gyQjFaUzY3Z2c3dHk5ekRqNzUyTVBHWFZ3elRhOHdoQ2FhU21iL1Vscm5T?=
 =?utf-8?B?MFJmRE5QNHZnalJZV2ZHOU55cVNRV21lanRWanVGK3l4R0h5MHROUm0vdkVx?=
 =?utf-8?B?WjBXamduMHR6OE5KYkRVM1hTd2FDS1N2VDBlTEcrRXlvSWF2SlUyWGFXWllC?=
 =?utf-8?Q?sjVfFKZlWbyneETE=3D?=
X-Exchange-RoutingPolicyChecked: LvoXb4z2/ZjhoTBMIiwi5LLPYkc+w5WBHhAgwRPoG9iPMO2iFbmSeARJyDOL5kPcBctUrZdqrzn4X4BHXn6rpRcFKV84exckB9B7fBg2M5m9hnuQlC4/jm5zQ1L7UwSsbbkos2ITUIWL/DFSOuI8oUZ1X5XxKaHj0S8/N4zb+xIT/+Rl7URnRn2v/r6w1GmPRE8Z8cVnfDcZdI6s2xsF3AbJu5+z6MI3MOwcInrSClEv3WzeTKEtlfTENwUPA4rOM5DXYPqUMGvCwyFGMaZwN1kazJflxpYcV8ksNIdedO9PJuNCl6hbjk8FxjU+JuDEtJ+loBlnHVcm468H5bcK5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9386f91c-cc33-499f-db48-08dee313fd3d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:26:52.7076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DANq5kfmYzhXGE1ljafZTOZBnPpW8YCOGRn413d29IfW1XD499aT3jKaABvhlQviavvKeUBObI1gaXjf89Y/VgKaxE8bK2stmwqKe7KzjIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

Hi,

On 2026-07-15 at 14:15:21 +0200, Sebastian Brzezinka wrote:
> Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
> This lets tools like intel_error_decode link only the decode logic
> without pulling in the full libigt.so.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  lib/meson.build | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/lib/meson.build b/lib/meson.build
> index 93db217f8..8addc8982 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -423,6 +423,20 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
>  				       dependencies : [math],
>  				       include_directories : inc)
>  
> +lib_i915_decode_build = static_library('i915_decode',
> +	['i915/intel_decode.c',
> +	 'instdone.c',
> +	],
> +	dependencies : [lib_igt_chipset],
> +	include_directories : inc)
> +
> +lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
> +				     dependencies : [lib_igt_chipset,
> +				                     lib_igt_tools_stub,
> +				                     lib_igt_drm_stub,
> +				                     pciaccess],
> +				     include_directories : inc)
> +
>  i915_perf_files = [
>    'igt_list.c',
>    'i915/perf.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
