Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A9606A323
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 04:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IzMAIDPj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65FA10E26B;
	Wed, 21 Oct 2026 04:29:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D8010E27F
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 04:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556914; x=1824092914;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JbJPnUXOcRiKDVxGI1zbuu28L4LFnb81iCEDNuJmYLM=;
 b=IzMAIDPjxM+FRRrBMu8FAisQYclEOx9QIK++I7FnEnSPjVmMES5p7ZjK
 tXPWIqlyKYo8q5AJMQjNKoyjKBtz9YV+bWt7NHdWpoytSaIizfSjvRr78
 y9W+G8GJjn11BkdbF8SxpeylF7umQQAc8zm7JKzndFnIlCGRIZU7bn//R
 /KlZZJhcBOBDOGyzUHkvt5dPyC4Wg63sm8gpVH3e+zRN6xX8e+NWn1F8v
 B6qEKlNft3Q/gUUpZLIMfeyMMEaLoAwrnK/e5tQEo2bw+u2RA7Fvdm/SS
 IHfG8IfQmsH77jB/gRKiMCUKpXs+hrAdkelSJEPoUozkHCzLw2S4V4QuW Q==;
X-CSE-ConnectionGUID: q/rpwGQXRXanjnQA693/Wg==
X-CSE-MsgGUID: 48cnGDyUTsKPCqnX4cUDmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1171846"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1171846"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:28:33 -0700
X-CSE-ConnectionGUID: EeqQVdD6QaK1TZIypjYBpw==
X-CSE-MsgGUID: oLN9jbtNRXuN27ex/Ortvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4787943"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:28:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 21:28:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 21:28:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 21:28:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk/uFzQ8dndNukYORl1JmA4e3VoViKNFnoRKeYmX6NUqkLUOOMpNCFh4PwqiP74vlcqRvqsa/drZvhwqBNJDtZN6BrIR577bn030WjRH4WvPXVf51wKHKUDV2JV/bDEJuFlhxoueFCZsMz7tTzG3oT4v6Va4jbUTe9sE2w63J9biLiE3UM96u8Akk8PQIXQwkavJbK/m2LTckSfQ3OLNlNctzIyPA7nTqOk1rrr3tb1Fg9Q7tlxrofx0u22H5zbh0Ik3wUuRI0qNT0hY2aUhLMivvRpYyxMGVrbf+Vy4FgMTqGlgmunyYaHBqiKBLTTV9xDTPBcYIjzCmtWu/gs86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTEF+1smLG1nervfEKfKNdEmN9GeU6jkNA626uCkGdo=;
 b=A1dz2aTqedVymj4x9fU3HDx1mh5HpQ2E38jcqFRyA9AMci3zt4qpSj9I9QK161jMwZlB8j15tWCnXRlBDaJrUkLyDbct977gViXmWdW6d7EiJL8VreDZRyAPZMZBJfd00fU1O71SzwZdQH08loPQxlWIM42kLtHt/DDjZSXLNK7+B+gEd1VoTWUqg9WVLbNN0KQUivBq/sFb/Sx5mKAqQr6eV/g+4AV4PA7H7Py9HjL6PTf4cEWiT1WDEaNVzVrHildCfL5H8DbQiHMvNhDdYLh/1gLPoAzgZ/6zB57DPid0XjUYcaWKfpMoRkol/JzC+uU3Itar2DABKP8dJVsI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 04:28:30 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 04:28:30 +0000
Message-ID: <4b3996cd-a864-4d51-be1a-6feef5605c06@intel.com>
Date: Wed, 21 Oct 2026 09:58:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected GuC error in dmesg
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <nishit.sharma@intel.com>, <shuicheng.lin@intel.com>
References: <20261016074501.458311-2-mallesh.koujalagi@intel.com>
 <20261016104251.n6quohfxk2nayzax@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261016104251.n6quohfxk2nayzax@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 621192de-7cf2-48d4-c47f-08df2f2bc2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: daAD/3TDxKl0lqEc5AIBwa4aJd8hIzzP8AMvoJDtwb8D+6Cr4IFWyeeCwq4ADgkmm+pYugJYbSTiGJ03xiEjxD9NQ1DKtekbrCa6oHOtjPjURk+agR14ytWPyuwcoFkHSpgjLJ5u7aq93fPK5A9h7S/66YIqEOCxYNwfgmPwgz3VWn5icb115my/1M75aHW8AV23OJX1UKtkTjXnIV8nEux2tEirrOviiMbOOezCCA0HGzZ6uSu8UxyxYNPAV9KvwKdzNnVbjLgk4v+15uFAYAFNf1OpjkfP7xKZcwZrTQKVTMFX6n2PFZ3QXvlyQ1m66gnSKspBKIQMLvaMkiqk5k/1+zs9yktJHmUSRALHqq4Oxa4aGc/LBatzGPfPobW7LmPQqiDnwGe5yjeKiF45tcSrb8nBr/ldVFw2YOcvXZs3raxpHriAJWvZHJ1WG7/Lg6vJ1Z+WfReZgll70F7luAqECEaJMSuTNOJS3NWzPzh5lS2Lct1X7GnTiKLbjC/9/xGdGw9gq8+xH4R3uD1tSnBbvjAw/y7yziWQcnT0PQgE9JpWQqSl/kxrtKy41beC11IZ4anJs2J7gsYaw16Wc2vxaRJaBZV48sjlXHr+HCSusvUoAYpJgpA5i52q/k1Td8UApVlTElo+X3gyQJwPCL91u9tPAUMPu1zSqVRD7GU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGQrQjhMc1dpVVhmSzVIQ2dXaUpXc1VPV3VLM2x4OUh3NzBka0pxMEtUZGFC?=
 =?utf-8?B?K0FuRDF0ekZPTW5HRzBZSTFleXc5MGlIdXJkY00vNXo1VnJRSU1nOVBqanla?=
 =?utf-8?B?SkRib2h3aGxwY1RuV29jNEdpS2t1ZGt2aTZJaGdFejJ4enFWQVlBUjF3TXVY?=
 =?utf-8?B?ZVMrSFRFdnNQUmJqQVBnODRLK1dDWUVtZkV4QU5NS0JxallET0dVMUJ5bXN1?=
 =?utf-8?B?ME1ZVEQ1bE15MG1wcWVON3dzUDdqN05PTmhSdlNETmpmbWl3Qjl2WllxWDUz?=
 =?utf-8?B?cjBFL2l4T1hFeHpxOWVBRVQzL2tCNldrREdHbHV2aGZKS1JkVDlHZCs3cDNa?=
 =?utf-8?B?ZU5NQ1duOVpTREMzNEZybHZFNnBsWElQNWRmZ3FFTW5QcFNOMHBIS3pzNUli?=
 =?utf-8?B?OWlBQ2k3blllWmtsNjhEQUg0bnFjQnpyVUxPTnh1b09hTEJhYVcyY0t6TnlD?=
 =?utf-8?B?ZTUvdkdad1BMNlFwK05xY0ZGTXJhUzYySm1MS0dUK1RrRU5OWFdxenNIZ08w?=
 =?utf-8?B?WjIzaXpMODRHNU9OVkZ0RnRFV3oxRjZQS1VuV3doQnh5TmJoYzE4ZmZwMnkx?=
 =?utf-8?B?RVhTdjJ0MExuRFcxLzRxQ2NsN3l4WlNsQ0dSeFJYSmJmNUl3WEpBWmZrcStQ?=
 =?utf-8?B?ejZybHQzSWNnTTlaVDYxc085KzdnRGdTcTZtZTkzUDVDbkxPWDc0NHlhMi9o?=
 =?utf-8?B?OVdiaW5BWFZJa3hYWkwxa3gwSFRXcHc3K0Fmd2x6eGZVejN5ZVpIQzN5cXBM?=
 =?utf-8?B?U2pCajl4Ni8vMFhEU0xwUXFZdjZRbjBDcFZjaXpWNWFwNG8yOGpxTEJiTTRm?=
 =?utf-8?B?aG9EWlBlWmNIbVB6QjVXa0VNZzlvbXBhM08rYXphSVNhdDV4aG9sdi9aVit2?=
 =?utf-8?B?eUUwWWVQSWJKeHJiRGNFRGpaYnhabm9mYkEvc0FVMzA5eXFFWEpmbDAzdHMv?=
 =?utf-8?B?RFNDRVE1TE1NVm1pN1k2QnVHNFhLQ0tDaW5sTXZGcmRhY3l2OWZneEFZRU9N?=
 =?utf-8?B?QzhjdEtYbVZQc3lXc3ZBRWY1TGdCQ2s3SGdpQ3JKQUpPNU4zd1NKN0dUVFNJ?=
 =?utf-8?B?RFI4ZlVuUlVEaVJUV3pHU3RPUUxqSFlody9RWjRGTEtFa0ZXZGVIRUZwd3la?=
 =?utf-8?B?OGk3RS9vWkhSNFhwckl5VjFNRDFSd21FU3ZucitzZHJUWXMweGV4c1N5VEww?=
 =?utf-8?B?U0Y2a0R6OUFDaFg3dFVVazVVb0tMOWY5K3I1RU0zRThBYW5ndE0xaXpUY1cr?=
 =?utf-8?B?VGdOc1R0S0xOZHhZbEdINVRsTWdHU09XOXVZVjZTMW1NakJxb0hwZThFTkZJ?=
 =?utf-8?B?dlorUnpMV0Rpa05heEJhcERoQzZLWElKUGtKRWp2NCtoa0cvcUt2UW83RHVj?=
 =?utf-8?B?OU8yODZXenYwT3NwMG1xTjY3ZlNVS3lHNVpRWFAyTDROZkwyMHgxTWZhNHpx?=
 =?utf-8?B?TjJ2L2V6ZmRSZFBVMmloVTJONThIWlZxZFFZYXpCQW5DMGF0SXVSdFZ1alZ2?=
 =?utf-8?B?RmRmRERsUWRCVnRYb0IrTmdDdVI2aTJBZ1E4a0J3aGRJRk5Tc2ZJa29Sak4v?=
 =?utf-8?B?dFBCYjQwRE9uclhmdnI3UzNXa3VIRnpZMFhveFFMMVVhV3VjTVVkdWE3OGIw?=
 =?utf-8?B?SGFLMjZuSlFZYTRQeVB0T1V6aDRSM2J0QSsxZHdMcCtyeW1GQVBicjNXVlpv?=
 =?utf-8?B?ODRNbk9LS0Y3amtiRzN0TlY5MnV0V0tFRE9jeEpmb0NZUElha0J3Q2haRTF2?=
 =?utf-8?B?dSs5SWsxWWM1ZDlIRmFteHlrSFVhN01YZlhlWDI0MzRmMk1UcjRtRWFNWDBB?=
 =?utf-8?B?aGtINWZOUGU0N2cvWG92MURZR29XQktUdGxQUElyT0wyNzluenJ4VmxWaGY0?=
 =?utf-8?B?SlVxNk5UOWxRQzFBN05qeDJLdWMrcUw4d0d0bHVmQ3RFbXQ0dE1mNlp6blQ4?=
 =?utf-8?B?eThSSjkwZllhV0pPcTczakNmVDh4TXJ5YzZ5Z1hsczRJckZHb0pFSWhIbTZu?=
 =?utf-8?B?cGtGWFlqZUJ2RTFGcnAvYVplMEhwQkJLbXZ4eFRndGkwTUo1a3dTTjhBa0Q4?=
 =?utf-8?B?L1J5YzBhckVWWVg3NjRPRzVDSStYUmo0VUovTkNBZnJvRUxlbi9pVWlUNTB0?=
 =?utf-8?B?UmI0M1VMWndMOGQ0RkY3RUdzYTIweHRUR21iRjY0TFFRQXJjS1NJUEU2UmZY?=
 =?utf-8?B?c2o2bENXaDlRcHNRU0dWaTFOZTBNeWVWN3o1cFh1aWNnMk4veXdldFhqUFdX?=
 =?utf-8?B?VFdpQmEyTzZiTkp0WXJRellYR2pqSFJzMk5MaDVmc3o5dTRPbWV0OUhxRURN?=
 =?utf-8?B?WXJYRURQUjc4MUg4dkdwclNaRmxnNytNOW8za1dLcTJhZjc3QXBkeko4L1FM?=
 =?utf-8?Q?OrgSQvsB+4tSYb+4=3D?=
X-Exchange-RoutingPolicyChecked: WRKYT1BTyM/LiXLwSplimEEJM+yd/tddt92pQkylrfyUsx2yFtyfGCjnbpxuG0ceESFJqmwvYQj4JfPtGPWZrIAy+Bm4Rus45O6DpLCkns4aphiIvtlQA3biA+N515k5YNdY2cF3salN4x8i3zxPu0IWQYAaXZwE3sSyzF7STc4e8CjsqTWztNlpR0h9pBY6ZBYbxZipSmfhB2HCI5iaXo+qM+MKK4PyFx/gNOGK0TyRF5Zzr/gGZr6M4v3YhmC6qBCueHb8WPx1pRACKvlLNLfiZLYCewx5OCMRNz360QAlb9QtiDHJDKTktjzZt2HuXUrCNHuiWYTXHE+fVQ399w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 621192de-7cf2-48d4-c47f-08df2f2bc2b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 04:28:30.8275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzM6HBr4oNzy38IHQvqsYotyxvIo0e8JkNO2RTqqRgv2huRFXBeobIfp8zqdPgNcCpskb0xwJAjKLdEPCuuVXz2RWjqyFNnJ+RwqWHwJZLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 16-10-2026 04:12 pm, Kamil Konieczny wrote:
> Hi Mallesh,
> On 2026-10-16 at 13:15:02 +0530, Mallesh Koujalagi wrote:
>> Ignore the expected GuC uncorrectable local error message seen
>> during wedge tests.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   tests/intel/xe_wedged.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>> index fe8ea6969..a75433c91 100644
>> --- a/tests/intel/xe_wedged.c
>> +++ b/tests/intel/xe_wedged.c
>> @@ -55,6 +55,7 @@ static void ignore_wedged_in_dmesg(void)
>>   				    "|EngineInstance: [0-9]+"
>>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
>>   				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
>> +				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable local error!"
> Please remove last char '!' so to avoid problems with regex.
> Or could it be shorter?
>
> 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
Sure, I'll update next revision.
>
> Can you get more results from different runs, could there be also
> 'Correctable' error?

I checked multiple runs and only observed Uncorrectable local errors in 
the logs. This is expected since

xe_guc_uncorrectable_error_handler only handles and logs Uncorrectable 
local errors. I did not see any correctable errors so far.


Thanks,

-/Mallesh

> Regards,
> Kamil
>
>>   				    "|SIGID=203");
>>   }
>>   
>> -- 
>> 2.48.1
>>
