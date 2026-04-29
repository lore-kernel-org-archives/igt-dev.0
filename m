Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32004FF8867
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 13:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBD110F020;
	Wed, 29 Apr 2026 13:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBQeG+83";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6710E3D9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777469146; x=1809005146;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HW60zLswiceIxY1Btd25jzz2dQtoVHWeyn4LD5cMdRM=;
 b=QBQeG+83JKb0jDO7tXmBQFtHQV2Qko8jJIXwxM/AyvgOkC+xPD+R7aMk
 CSyIpY5Jl5bhx5tVwMlY8eNxao3b5RGZt87OHepxThM0cFiSiEL7zgOph
 zZ0l2uDgDEn3sygZ/iedzTCZe+gGqnrzhP4eAi1fdIRg3s8SA8tB8Kx0E
 vW3BJvHozK7Doy8iyeXZtyn3/vJ5FVSxr6SWsT8wvxp3WfwI+gXUfSSJB
 ubFSBSa/4z1kfRlcXCwioPGqfxOEG3QlFc517gS2u29ElOP94to6BH7Is
 YQevgqroaCMHw13O7gvqbwcB+742BTur8/75bJdtFObht4RgNU/lN7C9O A==;
X-CSE-ConnectionGUID: BhZDqNpSR9qOWrzIznqwzA==
X-CSE-MsgGUID: ktVsW1VXQJWocblQEoEa8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78452397"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78452397"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 06:25:45 -0700
X-CSE-ConnectionGUID: AamYq0M9Q46k8ZukkM50bg==
X-CSE-MsgGUID: fqT82UCcR9C0O6hO4Xx1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="272404912"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 06:25:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 06:25:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 06:25:45 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 06:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bC0g1b/WFychYuaBU0HaVjJJBL/9Cryag31YzSF0QlZmLHMxnBP09Q3K+NQXQF7F6Sv2+FOaoffmy4VWC4ekntJGovkQ5/zEZTAyuht3rAvkeXiYdYY/vP4XsuOugqEAm0Oz3pjdYpKGwTMcG4IK8RmA7sBeJmkFn5h4HaSI4zrZZOG5hUr9U8WVT6hpwW38YirQXjH1Y4e8wt04jooyYbKMsmSYo5eKilvnieIAezcXrF/e4ayPljG1GCLavVhV0XxTOxm6YJamTX/6XmyhSCrbBMdG6k/zs8fohDFPTLtwx+73EKQJKPcpU9HuT2sBvmi6aiTQie2OrZ5TiMWjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdIuYEYWU8wjZpAVRcZuUyLZcmZT5tabT49US047VuE=;
 b=mwv5I8gO9nVTdUZMm082jXuxnnJABVT+wYyilipgOXmCTd4kGCzzY+382bGFKTnvzuMnty8sUEO/xC29Q3D+bGqrsjGRJ9Z7XFE8DahbArYsTzD3tObr/rnNkKPRjhvgQxdAKBQmj4j0geEUZL5LFC8Dr0Fhg1OPkE6D8L82md2eqP97NWRRuJYpxRMKaY5vNUcW9mD1eD8ysZSOt1dfeZblJQF7KbEAMas2vu5jF7EpmROD+zcZQipD/JUQ4DiCnMKvZ09+6ycKBvk9xsrrNienIDQkdEufWKay5ZS4CsBiTsBh3oYFRykqaFeZyfvnTLqf6VyxEy7BjeB1/lDDpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 13:25:35 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 13:25:35 +0000
Message-ID: <a6ba9e79-cdd6-47ce-848c-4866034e65ef@intel.com>
Date: Wed, 29 Apr 2026 18:55:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_madvise: Add atomic-cpu subtest
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-5-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260423063904.3944005-5-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0213.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::11) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MN0PR11MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ac0ddf-2b31-448d-feab-08dea5f2cb78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: +gz4T+GEsLI+RipmSF7Q+kIEi4jgVKhs85XCiU79ojZgM4c7xvA1VSi9FUxKzS0y8JkGPAHZFriOhFSrZVzTGBY98+YOTeAezRxls5Yz4wiETcPmf8WKRXrgOVSdGuqco+E4tomlDzznpRr1WQV6n68jVxoOSZd8X1sWBSFZ8Nq5KVcGWJ0nFE2BmBOzTc9xQh1w43yxcF+lsZtCqzSv8F7TJkl+5DrRBKIEMhItLOnbWRBZb2UZFP9cx0mp+/l3OL8Yg/gvpHPu3Dxkc07J5b4/NZ2W+VAeAH8IBW+xwxUuRUuXdvvxn1xen3Epw9fyA0p5AETLwKEuhDEkFckMueW7xeUpo+LHDhFXb37k2g42v7DlFkQsOSYl75N40+VDRZ8NTnqsYclSD4QGED5YayZG+QFAIY796sVKYG2NAsHym7UsRIz3MKsOhjj9mcEPZemblgvNE7zmk6h95u1ht5YPUslKKw0Gizd/Ro5BRPUEm6ga0kBwpW2prHn7XR2gJB9mHPzP6l1vkHtuod6+qPm73Oq00GcCbbngi7u8bH7th6WwjawDmqEXfyJX0/6wdM/YiIUd7wkywypddG2rGKuYYJJBNu633z3uF7UHHzV+0+Iql/xrRRWLn0VMfuV/5teT0SW23lohzwVfOTUR+cUKCwq0ne9eJVPzdrxChnscjPOO48bWsGamK7xqhdpLymI15cQ30YQYhKiDlKad8XZzzwtgQ7keWysKlMTG2Lw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFLTVk3b1NjQVZOd0FjOGtuVVZtQm51ZDNBbXBrUFNpaFFDdUNWQ092ekZt?=
 =?utf-8?B?VmZIaHl2SndPQS9EQ29scEF4Z0M0UEZLbjdLVDhPWkZGRlJiUVgrenFLUGFC?=
 =?utf-8?B?TXJsMHc2M2xzTnRwN0tVKzZ2c1ZJcHhPeWoxcS9Ua2N5S2Fvb25kYmdIVlpE?=
 =?utf-8?B?eFVFaDVjNkdoc1FGalRJcjhlbHBBN2FOanpuRjAwMTRqR2t6dzRJakRBTHNo?=
 =?utf-8?B?cml3ajRxN2lKMmltYTlRWjNYbnc2SE9PSXVPMEFQUTZmcmwrMHdLZFh6SFZS?=
 =?utf-8?B?alR6Q1FtVEROeG4vSEVEYUxZV0NSNTNnRjlWYVVMTHB5bEt2MlRDZnBWQ0Yv?=
 =?utf-8?B?UzBJV2xSdjNDRGZvN1lNUDU5M0hMOFlxUGFYVTJBWGNvNmsyYkloT3c0Nk8r?=
 =?utf-8?B?ZFdoKzJ3TzFuUFR4SG8xSE1sdno3ekQ3TFpBekJLS1IrMmF5ZlpzZUVMWWli?=
 =?utf-8?B?UkIyRktQKzc2SUhCRFBoZmdCbnpNcHEyb1RUMGtSWDBXUDB2bmd3dUk0ZkpT?=
 =?utf-8?B?S0FieXRPMkVHaUE4bFFGVTZ4bXFiR0FYT3d2Y2p6SThxZFdLSUpBeEZKcHF0?=
 =?utf-8?B?MWMyMnFtSGZvWXU0OHBSUTJQOGFmV2R5NThTWHJJbnV6c3hLOS9hK2thMG9C?=
 =?utf-8?B?bzVJMDFaQW1NQ1Z4OUNVUkZ5OVZPM0UrdzdPZUdwUDRRaWZML3NCeU1nanBo?=
 =?utf-8?B?aG01c0lMajQ1QzFFcXRON1FPT1hWWW43enFBbi91UVQzc0NoTlBxNzhNSUQz?=
 =?utf-8?B?QTliaDExQVM4V2R1eXJONGExTFNRUmxPS2V0eklLQlVnMGI2cVlYVG0zS3JF?=
 =?utf-8?B?anpkY1BvUVNLOXVQNnQrRGFPQWkwemc4Y0hvU3lOeUdsamFIRGljVzlka0wy?=
 =?utf-8?B?UXU0NlRadnZaczFNOVQrSkN1MnNjaURUUUNCTktEZ1IvaTJEQ2I4NWcra0d2?=
 =?utf-8?B?ZG9iSGFLV1BxUkFkY1YxSjNCeThmcHFES3E2REZHeFBua2Z6dUg2THREbUNK?=
 =?utf-8?B?b0R4TTByYUhPMzYvYmVpRDV6bkpSNkE2amh2a1RnK3ZmRitBbExHTFkvNVV3?=
 =?utf-8?B?TUtxMkF6U0FqbVlXSi9zbXUvSGo2SkQ1c0Uyek52RnFyOG5qTW8reXdDM2Jh?=
 =?utf-8?B?MTgvbjRiNDVHWURoQ3dXQ2RPRnd0ODVORWZIMndUbngrUXBiWitUSm5nKzYz?=
 =?utf-8?B?RGdPOXhHd1VteVJmWHNtdEswZ3JvenFId2pVaEJuMVpQQTFTV0doZ25rNlJh?=
 =?utf-8?B?cWFKZTY5VU5SbUFPY0R5V0t1SlFSdG5VZjZwdVpseVNRcS9kay9RR0JyamZW?=
 =?utf-8?B?akd3QVNWWkFqd0dSS2NWKzhhRWo0eGNVN2Yzc2JMbWNXRWFVNjJXNXZVV2Zp?=
 =?utf-8?B?aGtQVkx5OFh3cCs4STBrdVhvU1RhY1NLbjlmZVlxMzVYYUlLYis2QkI0WStx?=
 =?utf-8?B?bzQ5c3lUNE1IVyswTUo5NmIrMU5MN2hTbzJKbHR0N3h1cFhnMktzVy9CWFJw?=
 =?utf-8?B?Y215S29oUkpRZS83c3lLbVRWdGtlelliQnRUWWlrZUZtR09DcThZMCtQZTRN?=
 =?utf-8?B?NUU4U3pJb0V3azYxcmN4QzIxbjU4MnkvYzZYdEV4TnRPbE1KY0ExQW42cXp3?=
 =?utf-8?B?aFJzd0JieDJNRUMxNENwN1VzbGFjRm0xaU1vTlZHQWNVS2pjYk56UGg3SHVv?=
 =?utf-8?B?OEtTSVhJcTk1ZzdiK1BTRU5CYjZtdGJxWWRiOUNySmlmb3lWeFkrOWhHL2dv?=
 =?utf-8?B?Njc2U3pQbEFva0hJdDVBODBId0JtYjhqSWVYbEFzWWZCMjdpK2ZJWENEeEh3?=
 =?utf-8?B?akFaUDVjdUZBYUVvRGYyd2JESFlWeFNEMXlZNXdXZ0J1NFRTZURhY3JQT0Mv?=
 =?utf-8?B?RXZEMUhDMnBKbGNXOUZ6RTV6VSsvRUVWL3FkMEt3c04xQlI2Z0ErdEF3NVFH?=
 =?utf-8?B?Wk1NS3NUdmJGejRFdnJMZkZwT25aMjJrUlRyQUtocWMrZUhxeWkrb2d6RGxP?=
 =?utf-8?B?N09aTStLc0s4YVl4dlMvNm5kY2pQZlB4Q2ZnL2k1TjRxQ2xuLzk0NVJaamVm?=
 =?utf-8?B?SXFPNHBMVVI3eWNCWGtHS2d6Q0E2djJoSXVjLzlNN09rLzFIRmtvYU16MkVm?=
 =?utf-8?B?YVlZc0krZUlMdUswTHhzcjZJSTloWWtzVmpOcnMyMnA1dGc1bnB5Sm1MT3RZ?=
 =?utf-8?B?RzcwaHF0WTZqTFFtc01tU3pqbVpzQkJaV0VUT1BaaTN1dlNGWWNSSlBLWTJa?=
 =?utf-8?B?TElQeXlocWEzWUUyZlNGK3lTWWhRS1E4VkJ1ZjVJTkxLREdiVEtqUWZGOURa?=
 =?utf-8?B?SlNXL0lQQjNmZDJtdCt1RVhPeis5eFRvNkFyNlNTVE53YTVjOWh6MzZseldm?=
 =?utf-8?Q?utQetXYrnIP9WBjE=3D?=
X-Exchange-RoutingPolicyChecked: dOOA3OWVuX1ziFHWQmNmPBMmkL6krM4iFytBggJIyY04Dyg0tm+sJri/13wp/xD22mFdW2Mg42QKivl+TNmoJl4DdCeMh3LC8p5GuH/gR2FwJDr/UKFFX/2hc7LKu3uMhMJVM3MTkSAWAM6yOJxARU1b6V+K/ojfg4iz3XI+r/UVtxdaYEtP41dLii+2bjGdYKvjzMG2c85oBlfPFi79dCW7jlINEJguHmx+0PRr3ScfFycI68hsrXKdospEvlgyUVg67qmJJdVtFJI56yXK8YVjuU+GCrE/3hDZU3dRyIiiB3V6lAHcqTibvDe4rKVxhkffVXww1GaA1UsXhsCMkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ac0ddf-2b31-448d-feab-08dea5f2cb78
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 13:25:35.6277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/0b+ZJiyN7mzAi756nQ424CX39Fk/afY7eo7ojxQ/aWrdB2iO+EUdvxJzCJREEuS9iDDeAZNnoSnL5UZDwhcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6278
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


On 4/23/2026 12:08 PM, Varun Gupta wrote:
> Validate that madvise ATOMIC_CPU blocks GPU atomic operations on SVM
> memory.  The test sets ATOMIC_CPU on heap-allocated memory, then
> submits GPU MI_ATOMIC_INC which must fail because the page-fault
> handler returns -EACCES for CPU-only atomic mode, causing an engine
> reset.  The fence wait times out (QUARTER_SEC) and the counter must
> remain 0.  Only the first engine is tested to limit CAT errors from
> repeated resets.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_madvise.c | 77 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index c251186d3..3411a6f3d 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -936,6 +936,77 @@ static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: atomic-cpu
> + * Description: madvise atomic cpu supports only CPU atomic operations,
> + *		test verifies GPU MI_ATOMIC_INC is rejected by fault handler
> + * Test category: functionality test
> + */
> +static void test_atomic_cpu(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct atomic_data *data;
> +	uint32_t vm, exec_queue;
> +	uint64_t addr;
> +	size_t bo_size;
> +	int va_bits, err;
> +	int64_t timeout = QUARTER_SEC;
> +
> +	va_bits = xe_va_bits(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	data = aligned_alloc(bo_size, bo_size);
> +	igt_assert(data);
> +	memset(data, 0, bo_size);
> +
> +	addr = to_user_pointer(data);
> +
> +	sync[0].addr = to_user_pointer(&data->vm_sync);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_MAP,
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +			    sync, 1, 0, 0);
Same comment as in Patch-2/4
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data->vm_sync = 0;
> +
> +	xe_vm_madvise(fd, vm, addr, bo_size, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_CPU, 0, 0);
> +
> +	atomic_build_batch(data, addr);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr + ((char *)&data->batch - (char *)data);
> +
> +	/*
> +	 * GPU MI_ATOMIC_INC must fail: page-fault handler returns -EACCES
> +	 * for ATOMIC_CPU mode, causing engine reset.  Wait with a short
> +	 * timeout — the fence should not signal.
> +	 */
> +	sync[0].addr = to_user_pointer(&data->exec_sync);
> +	xe_exec(fd, &exec);
> +	err = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
> +			       exec_queue, &timeout);
> +
> +	igt_assert_neq(err, 0);
> +	igt_assert_eq(data->data, 0);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	free(data);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -1007,6 +1078,12 @@ int igt_main()
>   		igt_subtest("atomic-global")
>   			xe_for_each_engine(fd, hwe)
>   				test_atomic_global(fd, hwe);
> +
> +		igt_subtest("atomic-cpu")
> +			xe_for_each_engine(fd, hwe) {
> +				test_atomic_cpu(fd, hwe);
Mention why single HW engine is enough to validate atomic-cpu operation
> +				break;
> +			}
>   	}
>   
>   	igt_fixture() {
