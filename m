Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF456C5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 08:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4894B10E09E;
	Wed, 19 Aug 2026 08:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4Gl/zll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD9D10E0F1
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787126624; x=1818662624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KfLq4yaKEHUcftMuluG+X+0d4FkJGZvzrAANeZMelQo=;
 b=E4Gl/zll7oTass/78KbyNABfw+pMALauE9AjPO7auDe4W46LYBS5mS7a
 uL6TChYsGIVk3DYb+PD7AspUnomRRezWxLgFSlGUoVSeIv3yNzrtgOUbn
 YeNLTEbxeaOLDGn+0NQBYkUNx9JOodLNCNKOzfA8qud0W4qV+bPTa1BMO
 FRv8xu5McS5OB94MJAI4fVCiokwEHZImvEewQRTmbXRNxOvLt3F6SmOu1
 kUa8PY1XeaPyXTpWHDn1ag/+/7HZBJDFKWseWOQd11cKrww57/bafGlWo
 GotDZ/DZNvg0Ihh5QwVqyOj168UA5VGeDHpuizDaKJZCUL+4xDrSDk+Hr Q==;
X-CSE-ConnectionGUID: Yg/g62YwRMGQYYNLRQz1Ug==
X-CSE-MsgGUID: dNZV0abJRYii4UMwaZDytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98298447"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98298447"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 01:03:43 -0700
X-CSE-ConnectionGUID: t1Dqro47TvmdgrTQbslnRQ==
X-CSE-MsgGUID: RuHVEF2ZQVGXxjLjh2mcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="262847571"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 01:03:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 01:03:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 01:03:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 01:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKnRHXb727Yd9oQNa4Dq5WON32zWB+JLBq8XqmGbmax1MxEew3HfP4DEF0lvvTbO48QeIjUVRzapQLOc4SNuahrNpZn8m0PZ9EiCsHOltV0+ngykiZzgWGJx6ZZ5IoJ/zjQJrpyNaMhb2j9hm/USL9fAGehnt59kQuaY9FtzUeDAOZbV51j7nkdx8AKIZh2eKWJsgFhzIpVWxXOQiqGGoX5OwS8SxQBZemcYbO53h9lGhY8ALfcz4N7X65S1ddp0U5mPKrn3ley651Tmm/JyHbyFyiKvyxz9AnpLaUxdHtf/UQ/8G30ZJB9YbH9gYygDvxEW/YnyFHq0kd5lHte9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNO5tlQ+NTXzvRaOiBdM0APBixv48yvz0s5EdjjTiIQ=;
 b=BWCxXsv/eJ33OJcJH2WvDg3vzeoLlpPHp/36smPMBWWTRJ1XAv1fEMDL7rYxSUv8rtwDtsSAwR7D0GtpBv25ZZSf7dEurl87uDmYKUOPAA7lWCZ2F1u2Sl7hHclv8ToWfb/Z4BqIHSerCpDEOH0A69j5d3Eyl+dGWopIkc4VVZyrjg8cyFAyuk+ZxuMwz2gtP8WveInJ13Aj9ZkkxjYPlPyenPQUEpTxNwBmPZp/YYwQE0/DVzGv+V5caE69z6KlBPIuMiexyPtkQBTlfSAzFRzZ6HXeaaIEIFczK2nZBB3uyi5ZDMWQQbJbQ+7YOfSrcYq5+xwnKGsF9wWmPNJt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 08:02:39 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:02:39 +0000
Message-ID: <90d75ba9-48c0-4c12-abcd-d03e244aba2f@intel.com>
Date: Wed, 19 Aug 2026 13:32:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [5/8] tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker
 Command Parity Error Injection
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
 <8fe92398-5835-4493-8679-c673b0277e60@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <8fe92398-5835-4493-8679-c673b0277e60@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0296.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::7) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f86ca4d-fd58-4021-aa04-08defdc83ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|3023799007|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: n5TItMyEyByVALbs2W2pOozjMhHjoh/wbrIXX8O0i0W5jK4GahD0I8mNqHhqxsRIkIOJREKBvP8wYQQlum98IX23bkC/IuUbucGYTz79SgMJjYBOfswBOeUq6NWvx7hSWtRCj40ls8TI+Flg/AMwcmn53p82RmE98XvilN/bBi6qwTcoGKj//LvLeSbQTNr4aAv8+TpgzBEBKa6uD1TLeqAyGd6L1bY1Ka9hLj0uKCzx51r8/khCucuoak8eHAEXLAz+F8gCU9+3WOHcAYLMNsB6M8ImzmZeXl+Ow0tRUuLCGHuqaEmZALqGrWoBQ1zYxHX+6lLLMopbr3JIvXA7pvqQ42UBSqznzXztPuwQzyFXcDzUiaNUUs7vwDviQ0Zr5r5n2ayKwvVShqI66VyRulre88fjpt1Demus9mYRR1Io47/wzxZssY5jy/V57wFklWjG+H9+IU7tdvSQ8kdl9SfwP/+ytUglclZEO0+iigam3FOmEGisB8lz16ET49wnYunJyEyjJOEL9KoDLJTxdTa+1wEXatpWMC+S7vXdvMhZ/EywfN7DwIGGucsGOqzQtM0fKh5pLXcNAFrK+yhUjwMcHbAf0o5JP0I3dlLGpgydGJedjEg+IN3eGsc8dK1ebR7MP1qhKp1GsVGP5C9OHeGMpxdSj2iha39Glf/KsN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnFyTmxyYzU1VXE1TmI1aWk2T3BTRW5OT0ZSbUZpRjlKYVhhMUl2emZGamNu?=
 =?utf-8?B?NHRLamF4bWJOSzZIdlh4bnR2cDdvQkJSQkNwMmRVMmxaS1VjNnNQTUtBZVdW?=
 =?utf-8?B?L05GTXozKzJ5OEFXVExIVDEyMml0Q1ptL2pTYUx2WU9JdVZ0bERCbXlaYmRp?=
 =?utf-8?B?aHkyRlFmL0FlU05tdmw1aHRUQ1RQVG1hdC9BZk1TZkg2dlppcjBKcWhyVXJ4?=
 =?utf-8?B?ckIxNHJVQlhGL0JLdXJhdU1zQWUzRys2b3BJRit6ckxudUd0ZGNDamtXVU1x?=
 =?utf-8?B?dEhEczZFS09KS2VLc0lBVWhnRnZhK1I0TXAxTlp3c1VZd1FoRzFmbEVsbVp1?=
 =?utf-8?B?a2h5d2ZyWU80WnBRYWJabG85ajBncmtxOUhsVXlnUGxNNDZyUzc3dDJtUmp0?=
 =?utf-8?B?NzJmTEdQN05TQU1kTVJmOTd0WlFCcWFad2swZHduUDNnTGVuK0VLaWpiUVUy?=
 =?utf-8?B?NjNxbHR1RWZKb3BxZzlRVWYxUXh6SXg0ZmNxUkxoQzBZdTFyVVNhMVl5VXBU?=
 =?utf-8?B?Y2tCMXRSQXdpV25ac2l0QmIyNStUSUVlOG9tYkxRMkxXcWhuZUpCdlI2TER5?=
 =?utf-8?B?aDZvc0dzdFl6d0hIanNad09OOFNvakRZUUp4L3gwTVI4WTZwU1h0QXM4UEpv?=
 =?utf-8?B?SElUaXNFZnVpZFRVWTRtRjVOdU1yUW5mV043STVUemZmSklvZEVyWDVpdjlG?=
 =?utf-8?B?d2pwQStRYXh5ZGhOSGpWanYxaDkwUlFxalNYOXRwQmduMDB6Skl6NVJLNWhL?=
 =?utf-8?B?Mjc0bWZ1ekIrZzhNdFhnT0NvVG54UWNCNEd2ejBNWlpIMitEZkliMEN4cXJS?=
 =?utf-8?B?dUUzSVV5QzhrSHhYZlFrSVVZajJnZkcrV0R5bXZXZU5rdUFLVTRMZFNlY09J?=
 =?utf-8?B?dkcrb2lBcU5seWZtSUI2VEhYenJtd1ZMM2tOdmFmWE9sS2FLeVV5N1dBVmZ5?=
 =?utf-8?B?ZHh3WWZjKzYra3pJa0Z5ejZhemt1Q3dPNUxxNmhkNlJ1N3FocmlVNm5oYlBG?=
 =?utf-8?B?ekh2OWQrdTh6L0p3Skc0Qk1OUnhPMGlJdktPY3pvU2JPMkNCV0RXZXVVdDFB?=
 =?utf-8?B?QkU3TXNybzN6aWV4N2pjVklDQXQ2dUJrKzBVWk55c0x6Y28wdkVKTUFITitm?=
 =?utf-8?B?cDhtenlDRm14MkJVdGRQRUZLalhhVEZoRUE0VzJjaHNscitKbTkyeGZ4ajVk?=
 =?utf-8?B?UWJZYmhsMzI0M1FHclhpSzF6L25HNW42QU02eGtBNWZTd2xpMEtwVTFaRFlH?=
 =?utf-8?B?VFd3ZFJ4RDIrZHVDT0plTWR2S1FkSnBWazBDa0pWNFJLMTk4RGpxWkpBMVla?=
 =?utf-8?B?TEdRT0NxY2FCaWd4dWZSMUdtUng4MnBjMU5NZ3BWUDVya3N5NnhWamsvKzBa?=
 =?utf-8?B?ZUhpYmJZQXFreVpRcHRjZ1VuMllOSFV1bkJ1Y0QycDBlSHZ2UUlLOVJ5UzJw?=
 =?utf-8?B?anE5c1FOZ0ozaWMrZFJTVjBuZ2ZPazJBcWlQRkxvMXcyN1dpRzE1R01zVkRa?=
 =?utf-8?B?RnBmcFI5QnFqNTc0ZzNHTm5wZThpMUdnaDdyWFNhQTZZTnVkL3kyOEFUV01V?=
 =?utf-8?B?NkdBTHpDRmV2VzJrRUdZN1d1Q2NJdVZ2Zmp1MmVnTWNZc3lhYWFoUnJ4cnk4?=
 =?utf-8?B?MEhJNUFRbG9hOXdtQUk1eU9nWUdiZS9IaFJUcjRsYnBIUmg0TXRvTWFRSC9Q?=
 =?utf-8?B?UHNuTjl5T2VjOWpYOXlvdFY1UGpnRkpFWmlqTnhVQzVkalY4WWZDN29ncWRH?=
 =?utf-8?B?K3B4aGRyK0Zqc3YrTnRXVUphM1ZId0srV2tXSU55VjJxdkw2RzFadW1oMTRF?=
 =?utf-8?B?ckZPb3hycTZqVUNmcC9CbGV3U09yNmdYMVNYbzZQK3loV1A2and4MjlUOXhL?=
 =?utf-8?B?OGxNSTM1T2pmajdvVEgxWmhVYVUxUitRbVRiK005bHFzUGd6VnRtMVZZeW1C?=
 =?utf-8?B?MTF6QWdJbTNjZ0Q3YU1sQURFOXhzM1RnZUhhd1dZc0VDVS8yNTV4Sk1BK0VB?=
 =?utf-8?B?UUxPbXpKUzV3bDBzVW90YnpwRWdvYllwT3lpVHZIYnpMRU9mVkpBalk1SWVD?=
 =?utf-8?B?R0t0NlZBMzNabmlPTDZzVUxEVUY5eEFnTWU0YUtkNmJ6ZTZKS1Y5VkFVbW9a?=
 =?utf-8?B?czJUMGxITFR5bzk4RllGbVFRZFIyendCZzNZTjliS2gwSXFhRHUrMExYVm05?=
 =?utf-8?B?SmQ1TXJKYUxYam91VllYYXJ3YmRLME85aWRFVmJHTGprSWRMQ2NmM0QwMnhn?=
 =?utf-8?B?TFlrbXE4WlRycEY5NVlaWDlvYWZ6enZwRWZlL1I3Qi9WTG1hd0xqK1JIdFN6?=
 =?utf-8?B?TXZjc3dUTFlsVUVQV2twZ09RVkVzT1dGekd2djVKWndXb3IrMGhtK0ZqQ05q?=
 =?utf-8?Q?nm7hzrtgfi8R6hrSVvW9uktxw2pvjytOgGWus?=
X-Exchange-RoutingPolicyChecked: Iw83t8OS8EZ+X7ZEOOG971cW9paxzeNR0E7tASHufkO8RyFFos+qWv9xIJXL9ZM23O1MaP375aYLZyORPl+b+WQsGd8GuhmxUpUYfJwKmMVHkpFo7FHewVNZl/LcwRWdDYVyjZObJkid5boms06HnIS5XrpB5aoFXkD+uwWegcN2dO3Kiiw+/UJlGqyAQSOhgy17N78uKAOjqXGLrPRkfmj/+IB+26o8J2m4YA2Y4PseqEV3q7PK1Ji3NHvDjpPfvft6YsULI+BFCjo2J4xGOgpfN3MVaaREFxaCDjwL7GzPqjenu3AtyMpWqute2vJT0l+FG3N8Tg+OshrfFMZ1tA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f86ca4d-fd58-4021-aa04-08defdc83ced
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 08:02:39.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbB5MOfJ/cy+5dioLIBufc5/ynrf0D4QVJanR8nAwXMKyEf/btztfnLYpv2jKsx9OkBS9avR2OjJ+7X0/5jtXHB0SRsSdXm4/KeDGL2GPHqLGrr3g/gHl5VEMSEMNkdP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
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

Hi Soham,

On 14-08-2026 19:28, Purkait, Soham wrote:
> Hi Ravi,
>
> On 29-07-2026 17:49, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   tests/intel/xe_err_injection.c | 313 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  18 ++
>>   tests/meson.build              |   1 +
>>   3 files changed, 332 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c 
>> b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..afbaf0646
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,313 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +    RECOVERY_SUCCESS = 1,
>> +    RECOVERY_FAILED = 2,
>> +    RECOVERY_TIMEOUT = 3,
>> +};
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +    struct drm_xe_engine_class_instance *hwe;
>> +
>> +    if (state == POST_ARMING_INJECTION_WL)
>> +        igt_info("Running compute-square on all engines post 
>> injection\n");
>> +    else if (state == POST_RECOVERY_WL)
>> +        igt_info("Running compute-square on all engines post 
>> recovery\n");
>> +
>> +    xe_for_each_engine(fd, hwe) {
>> +        if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +            continue;
>> +
>> +        igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, 
>> NULL,
>> +                                    EXECENV_PREF_SYSTEM),
>> +                                    "GPU does not support "
>> +                                    "compute on engine\n");
>> +    }
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t 
>> value)
>> +{
>> +    xe_mmio_write32(mmio, reg, value);
>> +}
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +               uint32_t bit_mask, bool set)
>> +{
>> +    uint32_t regval;
>> +
>> +    regval = xe_mmio_read32(mmio, reg_addr);
>> +    if (set)
>> +        regval |= bit_mask;
>> +    else
>> +        regval &= ~bit_mask;
>> +
>> +    xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +    int fw_handle;
>> +
>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +    igt_assert_lte(0, fw_handle);
>> +    return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +    if (fw_handle >= 0)
>> +        close(fw_handle);
>> +}
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +    struct app_context ctx;
>> +    int ret;
>> +    uint32_t error_value = UINT32_MAX;
>> +
>> +    ret = init_nl_socket(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("Failed to initialize netlink socket for error 
>> command (ret=%d)\n", ret);
>> +        return error_value;
>> +    }
>> +
>> +    ctx.node_id = node_id;
>> +    ctx.error_id = error_id;
>> +
>> +    ret = get_error_counter(&ctx);
>> +    if (ret < 0) {
>> +        igt_warn("get_error_counter failed from error command path 
>> (ret=%d)\n", ret);
>> +    } else {
>> +        error_value = ctx.error_value;
>> +        igt_info("get_error_counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +             ctx.node_id, ctx.error_id, ctx.error_value);
>> +    }
>> +
>> +    cleanup_nl_socket(&ctx);
>> +
>> +    return error_value;
>> +}
>> +
>> +static int check_dmesg_for_recovery(const char *marker, int 
>> elapsed_secs)
>> +{
>> +    char *buff = NULL;
>> +    size_t buff_size = 0;
>> +    ssize_t line_len;
>> +    FILE *fp;
>> +    const char *success = "AER: device recovery successful";
>> +    const char *failed = "AER: device recovery failed";
>> +    bool marker_seen = false;
>> +
>> +    fp = popen("dmesg", "r");
>> +    if (!fp) {
>> +        igt_warn("Unable to open dmesg to check recovery status\n");
>> +        return -1;
>> +    }
>> +
>> +    while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +        (void)line_len;
>> +        if (!marker_seen) {
>> +            if (strstr(buff, marker))
>> +                marker_seen = true;
>> +            continue;
>> +        }
>> +
>> +        if (strstr(buff, success)) {
>> +            igt_info("Found \"%s\" in dmesg after %d secs\n", 
>> success, elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return RECOVERY_SUCCESS;
>> +        }
>> +        if (strstr(buff, failed)) {
>> +            igt_info("Found \"%s\" in dmesg after %d secs\n", 
>> failed, elapsed_secs);
>> +            free(buff);
>> +            pclose(fp);
>> +            return RECOVERY_FAILED;
>> +        }
>> +    }
>> +
>> +    free(buff);
>> +    pclose(fp);
>> +    return RECOVERY_TIMEOUT;
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +    time_t start_time = time(NULL);
>> +    time_t timeout = 5 * 60;
>> +    int time_interval = 30;
>> +    time_t elapsed_time;
>> +    int status;
>> +    char marker[128];
>> +
>> +    snprintf(marker, sizeof(marker),
>> +         "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +         getpid(), (long long)start_time);
>> +    igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +    while (1) {
>> +        elapsed_time = time(NULL) - start_time;
>> +        status = check_dmesg_for_recovery(marker, elapsed_time);
>> +        if (status < 0) {
>> +            igt_warn("Failed to query dmesg for recovery status\n");
>> +            return RECOVERY_FAILED;
>> +        }
>> +        if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +            return status;
>> +
>> +        if (elapsed_time >= timeout) {
>> +            igt_warn("Timed out while waiting for error recovery\n");
>> +            return RECOVERY_TIMEOUT;
>> +        }
>> +
>> +        sleep(time_interval);
>> +    }
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>> +{
>> +    int recovery_ret;
>> +
>> +    recovery_ret = check_err_recovery();
>> +    igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +             "AER error recovery timed out\n");
>> +    igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +             "AER device recovery failed\n");
>> +    if (recovery_ret == RECOVERY_SUCCESS)
>> +        igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +    if (val)
>> +        igt_info("Injection status SET: %s\n", err_name);
>> +    else
>> +        igt_info("Injection status NOT SET: %s\n", err_name);
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error 
>> injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +    int fw_handle;
>> +    uint32_t error_counter_before_inj;
>> +    uint32_t error_counter_after_inj;
>> +    uint32_t node_id = 1;
>> +    uint32_t error_id = 1;
> Why this magic number ?
>
> soham

Fetching node_id and error_id dynamically is pending to implement.

On the systems with single CRI card, these magic numbers work fine 
(verified on multiple setups).

For multi CRI card setups, need to fetch these node_id and error_id 
dynamically by using

list_nodes and dump get_error_counter commands and then use the 
appropriate numbers for the operation.

For now, using node_id=0 (correctable_errors) / 1 (Uncorrectable_errors) 
and error_id=1 (core_compute).

Thanks,

Ravi Kishore K.

>> +
>> +    fw_handle = acquire_forcewake(fd);
>> +
>> +    error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +    /* Arm the injection sequence. */
>> +    write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +    modify_reg_bit(mmio,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +               true);
>> +    modify_reg_bit(mmio,
>> +               MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +               MC_PKT_CTRL_MGSR_3D_VALUE,
>> +               true);
>> +    igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity 
>> error\n");
>> +
>> +    run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +
>> +    release_forcewake(fw_handle);
>> +    print_aer_recovery_status();
>> +    error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +    igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +             error_counter_after_inj != UINT32_MAX,
>> +             "Failed to fetch valid error counters: before=%u 
>> after=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_info("error counter: before injection=%u after injection=%u\n",
>> +         error_counter_before_inj, error_counter_after_inj);
>> +
>> +    igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +             "GT Uncorrectable Unicast Walker Cmd parity error 
>> injection "
>> +             "failed: before injection=%u after injection=%u\n",
>> +             error_counter_before_inj, error_counter_after_inj);
>> +    igt_info("GT Uncorrectable Unicast Walker Cmd parity error 
>> injection successful\n");
>> +    gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio 
>> *mmio, int fd)
>> +{
>> +    igt_info("Starting Error Injection test: %s\n", injection);
>> +    if (strcmp(injection, "GT-UC-unicast-wkr-cmd-parity-err") == 0)
>> +        wkr_cmd_parity_err_injection(mmio, fd);
>> +    else
>> +        igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error 
>> injection.
>> + * Functionality: workload validation
>> + */
>> +
>> +int igt_main()
>> +{
>> +    int fd;
>> +    struct xe_mmio mmio;
>> +
>> +    igt_fixture() {
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>> +        xe_mmio_access_init(fd, &mmio);
>> +        igt_require(xe_mmio_is_initialized(&mmio));
>> +    }
>> +
>> +    igt_describe("Inject GT uncorrectable unicast worker command 
>> parity error.");
>> +    igt_subtest("GT-UC-unicast-wkr-cmd-parity-err")
>> +        inject_error("GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
>> +
>> +    igt_describe("Run post-recovery workload after GT parity error 
>> injection test.");
>> + igt_subtest("GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +        igt_require_f(gt_uc_wkr_parity_recovered,
>> +                  "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>> +        run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +    }
>> +
>> +    igt_fixture() {
>> +        xe_mmio_access_fini(&mmio);
>> +        drm_close_driver(fd);
>> +    }
>> +}
>> diff --git a/tests/intel/xe_err_injection.h 
>> b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..d7efc2fd2
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* GT Uncorrectable unicast worker command parity error injection */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>       'xe_debugfs',
>>       'xe_dma_buf_sync',
>>       'xe_drm_fdinfo',
>> +    'xe_err_injection',
>>       'xe_eu_stall',
>>       'xe_evict',
>>       'xe_evict_ccs',
