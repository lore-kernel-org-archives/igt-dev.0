Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7707C54EFC
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 09:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C5B10E2FD;
	Tue, 28 Jul 2026 09:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jxk+X9z5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359EB10E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785230606; x=1816766606;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=A6HB5tuL2hPSHAoMYNdzubSnJFWiwsqGRoQxKLws9y4=;
 b=Jxk+X9z5iD2QDqXHAb8t7rkTKUK1EhtVBqNJBpPiMLJn4moC2cqMUIIy
 YhvxO8CMtsvoGNcyNDCa6loe8dqOlV58UzpnzKbm/HMMB0hxwgc81TW1v
 Dsb2LFKU8BmGUGWaBwzR99Rq+gN4NKvoMhpt98a/23CEi5FMqtucW2BeJ
 QKbHTV6LstZK9fWU2gFNGsb2aJi7BWGiYi04wlg1HyIUd5jahQiBVhfda
 uVwT5bcXrzZZYTGjeH30lrCVq43JthZouf2H1ZZcnOTlBPRebSrsYCZFa
 JuOP2MJ5ozeVKWbDSyjYkSRLK8ZfuHpAspez9KkErecQr1uZ2fRocz0DD A==;
X-CSE-ConnectionGUID: YLqSrfKIQHOmyRugj9ky/w==
X-CSE-MsgGUID: tOlVsAAkSL63vLfQZpPfMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84788412"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208,217";a="84788412"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:23:10 -0700
X-CSE-ConnectionGUID: pNCzNHC5TgWFPllcyUq3Fw==
X-CSE-MsgGUID: XU/GH1l0RCyZFjo3cY6xYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
 d="scan'208,217";a="264649320"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:23:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 02:23:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 02:23:09 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 02:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct7F6Xaw6FFQKILd+l5iy+vvSMbLf5DVh0JCC521vsLPw07YoPIoGRqlIMpBPufSawnJB7Qbl3foWiUCC4DBonCefaleTEmzmoS1Kl0lmFuM/nFdulWoMYMEdad85u1yd5PO7aEVWlcoIaIEQeE/dYR2oZ28mIabSGZTOGDXvUsqwzW5KiUYvK7R+9C9og/bjoGNaYlM0Ap+rx3dK44rYpq/SW4ubYN2JXRJz44bGBaQcOPp5ODhrPL5KJIkbFDp83XJw2b9UNUv7U0SEMMkODdXyoTw2CuKJQFxczz1z7kGJ1vPOjrCIpZUEmAcq7jW/Ow95burh/N80oBj88uCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wv8agxcIIyt6+FPydb9oxsekZ7MGtLaaNI5CdI19yII=;
 b=V6NZldnlxwZqfmzh5s+zvKCBR6GivYMenboYZ9BIww9ujzVHaWPtFRADev39eZ1+/LVAyjN/coPbXuNXYQCU8Tml4+YJaB8Mjti3MPMXPO8wPyIN1bGCwO8Z06How6bnq0UY53DfO+TT/OboukbXvfQJFYHzvDIoJKEEzrEPQ66nbaPygK3/U+ByGrIxawz8RdBKofYSKOgrfLPt8XQrKFRHhySy0FsSD4MALUQRbV7kLTSLo9JMllILRXrbj4fgb6C42q1qNnqVRa2tqXgmroky4e9FO3RvYZz+1dmMaKpHrtCUFLq54j4q8uGRUHvp1AvPmvEX0QJX78vgnhgPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by SN7PR11MB8026.namprd11.prod.outlook.com (2603:10b6:806:2dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:23:00 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 09:23:00 +0000
Content-Type: multipart/alternative;
 boundary="------------kKFyJ0AnMxehIvWwX5u0IOXY"
Message-ID: <14fe50ed-db94-4f58-90cf-e0ffd9a0573f@intel.com>
Date: Tue, 28 Jul 2026 14:52:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 08/16] tests/kms_psr: limit #outputs tested
 during suspend
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-9-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260713085515.463575-9-michal.grzelak@intel.com>
X-ClientProxiedBy: MA5P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::17) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|SN7PR11MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 0778fb80-8f46-46fa-860d-08deec89d113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|11063799006|10067099003|56012099006|5023799004|3023799007|4143699003|8096899003;
X-Microsoft-Antispam-Message-Info: 56ePKC/KesPxMDOScsn2kknLW5HgXNbMlZICuP2gJatUb77X/0h66ymoTxXEwgCaKbGDYwEFhQGXUpTjvIwRUHRYnRK0n4idHFGU2dQXYn+0/Jj/XxDTC0O4fFHwQGJYZ9ESHZzI13sR0PhkCM+7gmZKHpgkFVbwFNZqrOJrGUVkKvZz5zOvgHUWaIt0PfXi7ACppG+opKwyrZzQfF6zKENfdu9/e0zMpADdksDjXL1X7J6YVlNB0htOprjUsgGdwkAjUHL2MSd0XgIs7oefDUMokjr5M2fw/xqG6Ha5jk0clV2Pe8O0aI/p+tuTpC0qa1oGMnvbpxu7ZtftMGxIQLMtSZgBBn1Fh6x4XHQe85fqmgmL6wd+B1WAHl7msoGdzqyMI9RvulR/d3v7WptzzQ9AWgRgkuuy834EsCb5rvWkVjj+woWh6Sim+UGqZx3uqoKlVs5vqeiDFwBYyV3aGJwWOVP/RbFYsyEzP/OF4pufcPYJ7S8KAYlJRqpy+WUEUcN740opidTgtqLu9J1sI3vsItdjAaYXkUZPPyTIerNmbuRhIY21teV4LkFdahQ4isVeNq4j90FMrnsVHoUKP1NTmzoZWo8NJmGTCzZE3BQoBxf7V0bqUzHYq73F1Y8fRzGTT872KdvYOZix522n4bCo/MSzCq11ar8uLEv+9vg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(5023799004)(3023799007)(4143699003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXV4d3FlNHh0aDlXaG8rYlVOcnBpQXZDUS9HL0JLNHRKL3R2cTk5S3paS1dH?=
 =?utf-8?B?MzFxMWZaOEplODA2K3I3ZU42YzZrOXFrNTZYT0VBZFZxOCthL2w4Q0FZaGFT?=
 =?utf-8?B?RDlNWnBMTG9STndaUzFqVUttME1tYmtWVkdLeEtQOHFHQXJhVTFiSVgzcG11?=
 =?utf-8?B?VXFENzFDazdlUndQTWlMVUpma3dFYU9MN3gyeTJEUXQ3NERCZlRwTDEyVkRR?=
 =?utf-8?B?S1p0RWtaQmRHTmp2WTR0dkZPZDdIa0dDUXZPaGZrdUtBaFprZ1ZlelAwM3dL?=
 =?utf-8?B?bDZ3dDN5cm9BRTYrYzlRWXZ6NEhsOE44K2Nac2JZa0lqcnB6aEZwV3dBME9T?=
 =?utf-8?B?NnYxVjdjNVVUM0p0V1dVVmdyWXUzNk93OUt6My9NMTVTN1hFczBxTWtxNEQz?=
 =?utf-8?B?N0lPUDk4aWd5dFlWSGtvdkZNRENnN3RWQW5HYk1kYzlsYXovUDFPZnVwcjZE?=
 =?utf-8?B?YjUvQ0ZvQkt4VGlWTWt4RGQ0N0lwOVhhb2U2elVzWFRwOTVUMEJXQWZXMVNW?=
 =?utf-8?B?TzhmVHFmeWFtVXQwT05sT01zSldpMkV0LzN4Y2cvT2FJNXJWOTNhMGY4Si9l?=
 =?utf-8?B?SW1rUWJRMnlkblRRcVVERkc0SE5TMWhFYjNXYllqT2NYekpzblBLVXpZVFNK?=
 =?utf-8?B?bTBoakQxaGhVQXpmL2dVS3Q3QmN1SXFEZldiMmIyWHMwU1FGN0ZJUFBLU0w2?=
 =?utf-8?B?U0hGLzkzS28zMEQyblM4ZVVjZ2dVWkZoTGFoWm50YXlVQ3d3c1pqVC9NVUd5?=
 =?utf-8?B?MXhEOUprUm93WUMvMEpTQUp6KzZVMldKYklSbWVRTUJCc1BFU3liaHpJVW1Z?=
 =?utf-8?B?cG9QM1FrdXp4cnYxMzdURXc1WVU3UG92QU1lZjZ0U1B1YjhjQmxpTEJZemF4?=
 =?utf-8?B?Z0phbzMwUVAwbkNiaDV6SUY2aDdLQmJqU3ExRm5oMXNkL1NWc2xDWTFhZWpZ?=
 =?utf-8?B?eXl1YUdGNUZQT2FIWWdtK1Qrd2Nnc1ViNWdQN0FUMElZQ2tLS1dUVE5abUpm?=
 =?utf-8?B?MlBsZnZUaTZrWlJiNXRrUVkwMHlDWmJ2K3huQTJETTBJWVRWaTNiekhFMTJW?=
 =?utf-8?B?eHkzNy9RZ1JWL0k1dytQb05kQm5wK3FTTjQwNHd1TUJueTlUV3FvT1o2ajI3?=
 =?utf-8?B?V0sycjRqYXd2Mm42cUE2QXl3SkdqQnRjT3Q3aXB2eVp4Qk1YamRZY2wyUkx0?=
 =?utf-8?B?Z3RCOHlobXFMSzRlSzc0TWRtVnd3YWxsOVAwMDdIZUNEd0lRWC81dGcxVjE0?=
 =?utf-8?B?T0Q3blVWUnRRcmJNR09DR245UGwwVWtUNS8yU25SZmN6clI0UFh6bzlUbmln?=
 =?utf-8?B?MVh2Ykp6cytjb3QzZ2M3dmk5c1V2eEFBazVlYWVNTEpscU9MNXNkbERNWVdD?=
 =?utf-8?B?Rk85WFluN1dTVVlMUG5DWUhRSi85TTBwRHZCcUdnUEV5cmMxUEJlV1dTSTFQ?=
 =?utf-8?B?TGpONTFqNTZ5MG9XNzIraytNREthZWhWalp1N3EzYUJlWnNDbG0wOU0wenhO?=
 =?utf-8?B?NWVJZTVWQkszRUdFT2RnV2dURmd0WVdZZ3JvNkpxTzgrN0hBUlhiejJ1eFJO?=
 =?utf-8?B?bGpCb3FocGpKSzdJVys1ZUl2U0Fzc1VwNVloa2hjTEJNV3hpZXdhaXNvK0dF?=
 =?utf-8?B?cnM4RWZpYTZzOFFrTzVNODcxbk9HeEtrdjVLWWNwVDF3V0tjNlArdUs3dkVt?=
 =?utf-8?B?WVVYZGtrZzBPSHRUT0VLNE92SnFMeGpGZzMvT0l4SElPb2tTWEdpOEFDZk5Q?=
 =?utf-8?B?RU1ZQzdpS0ZGWUppNXRjQXpnMk0xWjJVQlIrQjh0SDdpVnV6cys1ZHJHNDBo?=
 =?utf-8?B?R0FXSmVOdU5lMm9wRDZqN1BGcmlRWFJOUlZIZUpEWDc5TDFGc2pHakdvWmF2?=
 =?utf-8?B?QU5IRDJnZHV6R28yRFJVQzl4UXNtN2V0MEFQSXhHNWJUY0hubTI5bnJEWUFD?=
 =?utf-8?B?UW9jY1pJZW9uWFdkUUc2Wlc1b3FBdHQwTkhYS1BsMFdpeEl4dkJkRnlqQlU0?=
 =?utf-8?B?dkRIOGd1SUZMQWc2WTgycWhVODdOOUc4d2hRRExOVHBhNGlZWWlpZks5ZVR3?=
 =?utf-8?B?Z0F0Z25qOGE3Wmx1bndkOFd2SHpvdlRTQWZmak9YTm8wRW54T3VGM0h5MGNh?=
 =?utf-8?B?aUxudnFvOHA3STNRVSs3dDZ6SjB6TkFXYXd2WnphUlFhYWswNXRFOGxPQmt5?=
 =?utf-8?B?UTVLZXV2eUQxNzZZQ050Z0FFdDBFcVdJRWhFdWpGMHlNUmlRaWUyMHVuK2lJ?=
 =?utf-8?B?bUxncFFsQXVtK0FleVhWc3JtSTBmb3BRSEVPVjNqY0lFcW55cUY5MWw4a25i?=
 =?utf-8?B?SFdYVk5DMldraU4yNkd2WHhEdXc0VFM0bi9qZUdCNENHVTczL1Q0cnVVUmpQ?=
 =?utf-8?Q?cEhuQu9TwmbCpxPU=3D?=
X-Exchange-RoutingPolicyChecked: h3wcCq7dlA/bR1+N6LwCLFKtN6fQOQnxlu4EYUphKAz/LQ1qVCWUyR9xG6PHLqGbS/NfhFV5xe9tvds0z+sTUjcVUoRDK37w8kdLHW3llLU7wdAZQvz5FkkYe2qUsNz92+UmVjfw7tIK7M0ZVmYdjBj0Itr1tKZiNLR9vcf3Q40DB2SeTkzo3RJIra9AbrKI8Nyetr+nsAQu7xRWTnWXRX5+tzUCgjDSjgeaea2z6S9hgl7/uwLUZpPw0PxLc9b/JLIqlgAi7iBcRBJlMnUb483tnkG7LVBMkSUz6Ery7uQMYRLDSpkOyvTAs+F2Ml+kfVlutQShg0VM4DEPGAG9tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0778fb80-8f46-46fa-860d-08deec89d113
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:23:00.0750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1F3Pw8cRfEuj3zUGbPmzNXyXhFo0bJQi99PYLN3aYAqzV3u3AajCnwRbJkkJjbZd07UHhodrjwO2EIAgmXg3jN5i1i97U2YeNQ5bypoHTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8026
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

--------------kKFyJ0AnMxehIvWwX5u0IOXY
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-07-2026 02:25 pm, Michał Grzelak wrote:
> We are iterating through each output while testing suspend. This results
> in extended execution time. In turn this leads to hitting CI enforced
> timeout.
>
> By default limit number of tested outputs to 2. Test each connected
> output when passing command-line parameter.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>
> ---
>   tests/intel/kms_psr.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index 7b02dd2072..c3bd7d9f7f 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -275,6 +275,8 @@
>    * @plane-move:         Move plane position
>    */
>   
> +#define OUTPUT_LIMIT 2
-->Update something like: SUSPEND_OUTPUT_LIMIT
> +
>   enum operations {
>   	PAGE_FLIP,
>   	MMAP_GTT,
> @@ -318,6 +320,7 @@ typedef struct {
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
>   	bool fbc_flag;
> +	bool all_outputs;
>   } data_t;
>   
>   static void create_cursor_fb(data_t *data)
> @@ -767,9 +770,27 @@ static void dpms_off_on(data_t *data)
>   				   DRM_MODE_DPMS_ON);
>   }
>   
> +static int opt_handler(int opt, int opt_index, void *opt_data)
> +{
> +	data_t *data = opt_data;
> +
> +	switch (opt) {
> +		case 'o':
> +			data->all_outputs  = true;
-->NIT: double space before "="
> +			break;
> +		default:
> +			return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
>   data_t data = {};
>   
> -int igt_main()
> +const char *help_str =
> +	" -o \tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n)";
--> Make it like--> " -o \tRun on all connectors. By default suspend 
subtests will run on 2 connectors \n)";
> +
> +int igt_main_args("o", NULL, help_str, opt_handler, &data)
>   {
>   	int z, y;
>   	enum operations op;
> @@ -785,6 +806,7 @@ int igt_main()
>   	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
>   	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
>   	igt_output_t *output;
> +	int output_count = 0;
->IMO: This could be at start of subtest of suspend itself before 
for_each_connected_output
>   	bool fbc_chipset_support = false;
>   
>   	igt_fixture() {
> @@ -949,6 +971,9 @@ int igt_main()
>   					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
>   							      data.op_psr_mode, output))
>   						continue;
> +					if (!data.all_outputs && output_count > OUTPUT_LIMIT)
-->This might be iterate through 0,1,2 overall 3 but not 2 better have ">="
> +						continue;
> +					output_count++;
>   					igt_display_reset(&data.display);
>   					data.output = output;
>   					igt_dynamic_f("%s", data.output->name) {
--------------kKFyJ0AnMxehIvWwX5u0IOXY
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-07-2026 02:25 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260713085515.463575-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a>
---
 tests/intel/kms_psr.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 7b02dd2072..c3bd7d9f7f 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -275,6 +275,8 @@
  * @plane-move:         Move plane position
  */
 
+#define OUTPUT_LIMIT 2</pre>
    </blockquote>
    --&gt;Update something like: SUSPEND_<span style="white-space: pre-wrap">OUTPUT_LIMIT </span>
    <blockquote type="cite" cite="mid:20260713085515.463575-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -318,6 +320,7 @@ typedef struct {
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool fbc_flag;
+	bool all_outputs;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -767,9 +770,27 @@ static void dpms_off_on(data_t *data)
 				   DRM_MODE_DPMS_ON);
 }
 
+static int opt_handler(int opt, int opt_index, void *opt_data)
+{
+	data_t *data = opt_data;
+
+	switch (opt) {
+		case 'o':
+			data-&gt;all_outputs  = true;</pre>
    </blockquote>
    --&gt;NIT: double space before &quot;=&quot;
    <blockquote type="cite" cite="mid:20260713085515.463575-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
 data_t data = {};
 
-int igt_main()
+const char *help_str =
+	&quot; -o \tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n)&quot;;</pre>
    </blockquote>
    --&gt; Make it like--&gt;&nbsp;<span style="white-space: pre-wrap">&quot; -o \tRun on all connectors. By default suspend subtests will run on 2 connectors \n)&quot;;</span>
    <blockquote type="cite" cite="mid:20260713085515.463575-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+int igt_main_args(&quot;o&quot;, NULL, help_str, opt_handler, &amp;data)
 {
 	int z, y;
 	enum operations op;
@@ -785,6 +806,7 @@ int igt_main()
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
 	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
+	int output_count = 0;</pre>
    </blockquote>
    -&gt;IMO: This could be at start of subtest of suspend itself before
    for_each_connected_output&nbsp;
    <blockquote type="cite" cite="mid:20260713085515.463575-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	bool fbc_chipset_support = false;
 
 	igt_fixture() {
@@ -949,6 +971,9 @@ int igt_main()
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
 						continue;
+					if (!data.all_outputs &amp;&amp; output_count &gt; OUTPUT_LIMIT)</pre>
    </blockquote>
    --&gt;This might be iterate through 0,1,2 overall 3 but not 2 better
    have &quot;&gt;=&quot;
    <blockquote type="cite" cite="mid:20260713085515.463575-9-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
+						continue;
+					output_count++;
 					igt_display_reset(&amp;data.display);
 					data.output = output;
 					igt_dynamic_f(&quot;%s&quot;, data.output-&gt;name) {
</pre>
    </blockquote>
  </body>
</html>

--------------kKFyJ0AnMxehIvWwX5u0IOXY--
