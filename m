Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE1BCA9EDE
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 03:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E9710E9DD;
	Thu, 15 Oct 2026 03:44:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E41410E82C
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 03:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792035825; x=1823571825;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=a+sOXN4PC0/3ejAtynheHsXOErr2WFpMBqXyN7cJibw=;
 b=bop0JiLSs8Vb6rHK21zMIr1yMjSe3tzuUl/u6K/FPL6YZe2PPe80vKmR
 dGeyaThvp2Hs+0xq+m9EhS55/FNY8PZ98e8wc5Y8xjph4q54aHm8P2aUt
 BQaRcqm5LWbs89X9vJNzOB+hL4MLJjfniBFVRy7LRbTV68asJQjq161QS
 biv6xw3D4k9dlykJJ9gMdCzBPKxzxNpfVH1hHAO63Z1h4vRnngypU6oUG
 dvta+6mJ5zqWDAJML18zS0AuhQMJnOkNmmJ1XtSypL3EVL39onHkWHA1L
 tE6a8AJTxyJ0+MvlMd6go0Bg8rtKeLtkjyPlTwXqrLefmKx6NgLqPGuHn A==;
X-CSE-ConnectionGUID: x/uhrDlgRjiRWlhNB/qIDw==
X-CSE-MsgGUID: rY8E6ti+QXmQHqK1FnNONQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="900936"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="900936"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 20:43:45 -0700
X-CSE-ConnectionGUID: FYjDzdvdQuW2CK7qeIpzvw==
X-CSE-MsgGUID: +naxhwWjQRSsAp8vPkp4NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1542779"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 20:43:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 20:43:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 20:43:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 20:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKMkZcPdzRBC9IsPV+lNSQykWhWRpmJ4fdhQiSSEoO7LlpTSpvVQSe1tbjrXugiImgb7g8JrKxcl7kFiMCme4IhtFEU1/zIofZxoknhomi/oaBbXnOEOB3aesao540ZWNcetSAbmRbfFeyJdBNf/9c33bRTVoEIuAYyLzQFtxOuiG/6lx8W2Idp/RtodcW17buTDGGhnIqgBHMW9d5LAv5IXyw6ya26CYwVO1Ng8OX9kCWpY62SqMJZELVeoGvTmeTMMJnvfVMO+Pnk5Ra8hyEhtvWAGgbDnQNkCU55CJT1qDqc/0fuuttVm9iaxs7i9F6A6CRsf4De9WIfKh2rNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXlUAK14oIH0I9QyoV5FiZMmPHedONdLDHBh2EJ4emQ=;
 b=TY7CFe0Rsm6tiXVfuzPof38LlwaMO/tmzmiRqc7uqUKlzCObhxOfvZBIWwjcUqHAhnn8QBGxFsv0eDOn+kvcS4UEg7jjERWXW+KDrV8byPnEqEqgE5BZwE4QWB+fbB7LDw5BwPehlSs9lrfktQ6b5SzIBVNiOviiL9vzDP7Yhlk4A4SY9ZlSDrlZlSqwwXgLBllK5sBTYkSmGDr+856/wKdmvBM3BLEhKWVlLYO9SADpyQUjOWpfVJjJvxxLJQe+Ge4sk7A6JXmeSVyKlwGyhzCXgUNtn+O5eNrw15vtFGdgF0RScVKFU8rhcJLm9VG+55BX8Q+2Ml99JritBmyPxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Thu, 15 Oct
 2026 03:43:42 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 03:43:41 +0000
Message-ID: <1b0fc53b-6344-43aa-bbd3-f374fe0dc1a4@intel.com>
Date: Thu, 15 Oct 2026 09:13:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected CORE_COMPUTE error
 in dmesg
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, Nishit Sharma <nishit.sharma@intel.com>, "Shuicheng
 Lin" <shuicheng.lin@intel.com>
References: <20261014115047.352174-2-mallesh.koujalagi@intel.com>
 <20261014132143.k3z6i2aqzsv3cnyi@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261014132143.k3z6i2aqzsv3cnyi@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0202.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::9) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: d9507c87-f87d-463c-1ff3-08df2a6e815d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|22082099003|18002099003|921020|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: gBOTtMjTQgeTzZV6ZpeAwlrkL8Rhz6Nqn2go4IpxmgWAglscMVWxt81e63PXAAi0+fNGWOBpJ0bpkRxdimH3970r8NWNLm1GuWQ3wCNeo2f6yEPqSaMEvsupmw+2aNWbYvjYdMlDLontpoUpOAm+aDpkexB46mKylfFUpjZpe9mVUZhuuu2d+gv/A5+umZF0dRP9ji/LXvs3chtzsAt/oN95lw4ktFd6BFT38MWfy556bxEXgOjzpbeugJNWqeh4e7jOl/JFdTYJ3cTdQTkAZFPjM5BorlU/qfH/TwVj6/9sa6GZ5yhZPxTDfL4TYFzEiIcqwubZlk52yv8TAKUkAY4Hb95h1IzjMtcgDHusMl6sP+OIMHDy9pZSfAJvlOQLWmONvX1/lwGHredudi8Jt7UsjbyoBv2U7HcxCQUj+CPCSiCB61YOgqJB1RlvEzJXI6MKYkfjfE3MyyDKxrGi6MjxwDCayN2JN8+ShuTsRFj3wUfOQzg62xgeaFdpiswOyaNpRUKj+nX6rfJ105LTkQLphDB4wpi8OQj5R5LKaIgJ7TSywbQMTmJ8sdtM3gj0mJzvLfPWnbpdYIkz6seS6jeLaW5TKAGXdLUr8ARA5QXBZSwmTVB3/KE/i1YgJIZ0ft1rd/C0UGKKaQzVlWsEmpcnrZTgDGl6htJ6bWGX+NnEeQvWkc9VpoG9ws2dg42t7Lstx463lptiSVboRHQQpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(921020)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dza1d0aFFxRlN0NGN0UHhUcktVK1hMVnA0ZVlPNWdhZExTWWcwVEF4alEr?=
 =?utf-8?B?ZU5JeE5MRENoMitUNmFBNVV0UkliS0pFY1pKZm8yUVhLM0huWld4M3FRdWdv?=
 =?utf-8?B?REhNcFZhOVo4ak5LUmNJY1VDVXdQejFDejRpd1NCN0J5RVJiRklweVdxV3JG?=
 =?utf-8?B?aWxFNlZYM2FFc01OU1Z5eVV0cUx5aWVsTkpQSWdrcGpNWjR2cTBtQlBHOTV2?=
 =?utf-8?B?V0sxOXhReGczR043L2ZiQ0dTZDVnSnVnVndjZ3BQSEpZb3o3dFJQak1LMHRk?=
 =?utf-8?B?blUweVAvdVZvSHZlNXFYcS9TbHN0Tm1SclVpUjNCV3JUYWVIUFZYWmM3M3dt?=
 =?utf-8?B?aHdTVGhuK05nUFpMcy9PUVpCTWhvd1lJMXo2NE1WN1RsZEF0aGN2aUtwUGdm?=
 =?utf-8?B?NFU0b3YvQTBweGdjZFpGajBLL1prQ0JSWENSK0hweFBUUFZtU1gwcmpySUVq?=
 =?utf-8?B?eFZ0L3VRYm5lemdFRDhaN2FFQnUrK1h4aElmRFFGZ3daOWdWRTR1WTJWb1l0?=
 =?utf-8?B?QkpRTXZSMTdBMndJMGFhaXUwc3N4WlZMeUxsTFZpaEdEV1NPaklVVnBjRXB5?=
 =?utf-8?B?Q3JOLzQ3bHFKVlo5NTlFOEJ5TTVGTytWWXNvakZMWVF1WTQwb2twQkF1QWVm?=
 =?utf-8?B?VG9vNlpiNVM4MlFSRy9ZNkV1NmpwZlZWaWpRT290V25HN3dPOGFWRVpMRkZo?=
 =?utf-8?B?emxNY1FkT3Z3N1Z0ZklsSFdmNDZtNE5iTVdrQlpjSUExMWY3YyszbXpxY1lE?=
 =?utf-8?B?YzRXWlV4RnB4Qyt5SGZlditWNVFBUW1ickZOSUNvOUtvZHZLWWlwLytJYTdE?=
 =?utf-8?B?UFV6WnVLbU1KSVN2Y0xEMjRtdHAyUTk4UzdpSkRvTm9Hd3hJc0xaTU43dFY3?=
 =?utf-8?B?YmcyMnpXR3Z5N2tpdGRnMmFLNjlMMk9MbUxESTFreGNiRnNtV1RIc3pEQVpu?=
 =?utf-8?B?bjV5NktyL0drRXhZcUxZWnlQZTE1TzhhMnZZV1NZaDNFcnhwWnNDN3ROcUxt?=
 =?utf-8?B?eXpuMUV1NDllNktISFJDS1FPS2hxazZuVndFWVNxOXV5YURma21nKzlETlBM?=
 =?utf-8?B?T1ZzQ2NFSVNiOElpNVlYYjV1eEcyNkRSVTRJUFkrTzh3amlBdi84b1c4Y3JP?=
 =?utf-8?B?MEVVMDRNKy83MDRJRlp6YklJNU0yYWk2NlNPWTFaWXlnYjh5U211MXR4bWlJ?=
 =?utf-8?B?K0hlc05oTm5jeWVJc2hQa1RGV1NkblBiODRkY01CYUdmNWVxUmlPZnJYYlBv?=
 =?utf-8?B?eW00ZDBHQkhCRmJPblRONzk2RTQ3WXdWRG51bWNiSnNVQkN4Q2RzT2JJcURI?=
 =?utf-8?B?bElxSHA4YlAwRGgxUEFzMGJ0TmtSL3FlNEVIbkkvOGdpVXRCOVFnWVI1MnZQ?=
 =?utf-8?B?VU5lMUZtQXIxOTdPdXl1eFdUNXh6VkFZcFJOelBwckFubGZJa21MbzJJWEk0?=
 =?utf-8?B?Q01OMjU2Nmd3Tm9VbER5OGt3QTBGUVZQM2t1TGlKb3RwWXRVS2J1aHpYenUv?=
 =?utf-8?B?azVRRmN6czREa1VpMDNjZWhMWmpZQlZ1RHd4NnlhaFhlRFBjQitPaU1SeXMz?=
 =?utf-8?B?aEhLOU5MU0FScXJRVTZhT3NhcTJISFlmak5WY3V6aVlZRlFLTC81VWFDZENB?=
 =?utf-8?B?M08wMVNEbWE4WVA5VUEzSUFPVXhuNGFkNEVwNW5wcFBXVmppVDFrN0I4WFhK?=
 =?utf-8?B?UFkvNzVoUkFqRkJZQldBMjlKYjB4NnoxZUFLTWFadzFlVENiMTBmY3NiaWpV?=
 =?utf-8?B?VkVrbUNIcGVGaGZpNnFMbE50L1g3VlZIaHNCMkdyVmZWSGt2YlNyRm9pdVYy?=
 =?utf-8?B?cDJNOWMvTkFRWGlMdURPeThjTVJnUlQ4bnljZy9lamxKM1J5UGdDeWcyODI0?=
 =?utf-8?B?ZGVuTVIyWHF6WDREdys2N0U5ay92cjlIYWJ1NXdXU3lEWFQvMTBGQnZMRTJ3?=
 =?utf-8?B?WENYOTZseWJLc2l6Z0pmeThJUi80MnRDTVYvd2VlNWhRNm9xZm1xZnN1MExW?=
 =?utf-8?B?UUlCQzlSaE02QnhiMERZRHRQTStSU2VCM2pqUTdxYkhtTEQwWjVndjVWaGJo?=
 =?utf-8?B?TFRSdDR4R3JLYTJ4QjNKb0dhd3JRZDhXZmNPUzdrUU5Ncm5oVGZZN3NCTkpk?=
 =?utf-8?B?d3RmSEZXaTVYY29DYnJsSW04NnI5ejUwK2o1dWVsTDZFd0QreGZ4VWVMczQ1?=
 =?utf-8?B?bjUvTVlka3NOVDg2d08wUXh4Qi9xdVpxbXlxWjNLTGhpbnVMQ282R0lGWDRh?=
 =?utf-8?B?Tmt2R3I5N1JaaUprMTZKMExrZ1AvVXpkMEcxRUlnUW1hL20rUlpoUllDeERn?=
 =?utf-8?B?U01qRU5CSERHTGhOcC8xZEY3YkZScllqWk1lMTA2ZmRoMG50L2lQWFhxYytr?=
 =?utf-8?Q?SINjQwe0UBlLUDB0=3D?=
X-Exchange-RoutingPolicyChecked: sqWJFGeW1/Q2R4pU9kk0n/kk1+U9iaZnYbfmvirrzqtLFbcCwsyDLmTm4I3r0ma+sQY8r1n55LLWwRmSL4cUXqKMENavaPipkPxu/WZzkSdO/0xnso3hp/hKHQZ5mCbL28vII79nUxv5f/sj4chGYUoJ+m8cAo1pBCTAeqvNYZwG5qzehcyISBHr9DcM0hopuG2b4fSr7unwj0R6aoYqjQtrWc8SlRkkS1Z+9ufrwGwPXPILOm4ZjWDyhxVNKRG7NUjRqJ+/P24XDR6hYIl+fULA7PiKVYidosZBr63E3eHXP07YoiAej+RnVZyCgc38g2K9+dp8825tOXAEnnVvDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9507c87-f87d-463c-1ff3-08df2a6e815d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 03:43:41.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjAuFMEY5RfLRaRr6JBJ5l3U6NvugH6PlUjmDqYNFNyT+c1y0tRs4+KOfZllW2FpXYgUOMYbajsPsnjtMjKsSF6DPj13RqambWQAOygF9Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
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


On 14-10-2026 07:24 pm, Kamil Konieczny wrote:
> Hi Mallesh,
> On 2026-10-14 at 17:20:47 +0530, Mallesh Koujalagi wrote:
>> Wedge tests intentionally force a GT reset failure, which can trigger
>> a CORE_COMPUTE hardware error (SIGID=203) in dmesg.
>>
>> Ignore this expected error so igt_runner does not treat it as a test
>> failure.
>>
> Add cc before your s-o-b, also add few more devs found by git blame,
> so also +cc
>
> Nishit Sharma <nishit.sharma@intel.com>
> Shuicheng Lin <shuicheng.lin@intel.com>
Sure!!
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_wedged.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>> index 4f5197e2a..fe8ea6969 100644
>> --- a/tests/intel/xe_wedged.c
>> +++ b/tests/intel/xe_wedged.c
>> @@ -54,7 +54,8 @@ static void ignore_wedged_in_dmesg(void)
>>   				    "|EngineClass: [0-9]+ [a-z]+"
>>   				    "|EngineInstance: [0-9]+"
>>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>> -				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error");
>> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
>> +				    "|SIGID=203");
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Thanks Kamil!
>
> Regards,
> Kamil
>
>>   }
>>   
>>   static void force_wedged(int fd)
>> -- 
>> 2.48.1
>>
