Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B44BCD128A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 05:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41A210EEA1;
	Mon,  1 Apr 2024 05:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXHHpECF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FB410EEA1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711949891; x=1743485891;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5yo0rzMEGzecZyhK8zYdxmv9BJ3VkFjFhbyhjRvEXPw=;
 b=bXHHpECF0funHQBRRKGAbTimnvfu04R+PkAGGO3xV5WDocNXbeE9/1Sf
 R7U6PCXUudyK9FkMy7TxoSPqvoCsAi5rjKiFiWIQ0Dgft9WuD0493jb2H
 S8MtENRWJcqNWy4KNK81ND3hqJHR6ghjBhz45AmQe4w3+KXx1qV+khfML
 FezWPiReBH5X9BCG3UA3SxRZDVvSf4haeYwl904er5742CYeN7FUJpUMn
 BvfEimYA3h1PIqjTc6XW4Uf1EeYQl/hvnIw/gaE/ysgGl+aORZEceUboS
 N6aSJbK6quGttrmWWI5UeS7J0aX4bF+TimuRpv/dm5DHJgEMIPvCYGuv+ A==;
X-CSE-ConnectionGUID: cg8PR4WfQ0C6460Y+lJNug==
X-CSE-MsgGUID: Xr7kuic+S9yLyT6bz34DPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6928817"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="6928817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 22:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="17429442"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2024 22:38:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 22:38:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 22:38:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Mar 2024 22:38:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Mar 2024 22:38:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqAo6DaNQg/Y9TOzpnvFQyBWQgjg97z+1exJy4vnLNrUijIqYEJZTb3LyNhUU7P8S/itvLJ9efPo01WHWcF3KFEX8XxWQ4t6oPMcSkkd0NEP1dKLD5t0bWeQ5h07yVkG9Kh15KtmQcQcXR4mI/lcRLwo+MtULwv6kl/91guRmwQqWwzvqLRZjSDOOvrAlUNOVoMEXV5P6U+GBLxVmkzMUe0NDgyP5kE8UbjvULRUD3gYzV/fUZn68RDOwKZotdrKTcjpnEutOo7uE/JNW0CB3btk8NAqVaBIg9+zp1y4Blv0L6XhvNySH/ZsGyEIPG3TsT2HI0Z4Zix4IiaT8QjGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yh6b4zge6csPVdU8ToV6ZEcUs9azb5KcRrmH9Gj4OBQ=;
 b=ZqIQJS8jBeAlcUFxN8cqc5EwDtNMghlvXwbccgxbuG17oLfbkzq+lslVQW5e0LVApmBpqSLF5uCf0bYPgKQfk6i/Yc2kE1VqBtJ9oHOMCy9RS+Ql/phYwG9oUq88n5S6wtsSC9Ndrkiq391UKCkDFzdVF9NWSfE0z7v+dAEMedXH9Ejb8UxDGiEHD1kw1XtFjMimv4Qnu0XW5TxpsMW5ElOkC7IL0upRTxtOUQgArZZmTPNMdteNkn/T6bsXUsyGEBuYZ56ERNrUCgR9e8HiT+xxJRNweCmqyzuJ4gP3eXDtXo4tqDHIPYxQHda7cf/WwQ308TtDSCGBl/w4NbDXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 1 Apr
 2024 05:38:02 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 05:38:02 +0000
Message-ID: <23d645a4-66fb-4690-bf03-68bd4090c610@intel.com>
Date: Mon, 1 Apr 2024 11:07:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/5] revamp big joiner test
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
 <d6665d97-1d61-4e8d-adff-b49bd5611550@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <d6665d97-1d61-4e8d-adff-b49bd5611550@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::36) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|MN6PR11MB8218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AcY8B532qdKGYjNxkKgNVZyLDNd1ezq9xyxJ+tkIO0Qsv2cgWsO6Jdf/rvSPbfP/O6xCE5KVOD1HaGGp/Qi3E1QR88LhkWHu7kmlPyZzwMV0tOisgn5HnXrK+NDBQ+yNexTgz1naIp9t6E5qENBFnRsbULDNAx9grzfoaUfc4hfNFfRn4n6NdylnzhmCM7ng3k03V4I7bMjIDW1+PKXenwklNw9yhwKirrp4QdYFrFqBbuG+v8tHL4+n7pNVpIGJuMSVeECqxXuDxUB/bd+tV0XULVfKyX9RV3Fb15cn/TO5c0vKQlThgcPGCZqSnLGXhXVFf34B5ksILyFnvWC64JfeaNFH1KscJ35FglMvGM98p1rVwi4NY8UIxkSd0JvXb+NJp5xMo+JbHMb46kQp/y3BB0GGB70go7xioLqJ1dCygmSCIuxHQw08PDAIVOFMldBsX31br5mLFiRpeNj+TJPLbHSClTWzwuVxnWIkukn9r9Dhe0Zce6B1QAl+zJ37eWaCIgzWKu2txBy+sfaEGo/TmNLsAuN+szJaygiuQgTXo8DM8BKFhm6+gBZ+30YAYF1HxqV4IL1Bg7hH7EzfkVIbA4E4V7Bwb1va3k4grYDADOAgkJwPjVSXvzJNHuUSKP5C6EQhJWAGwV/2I7rAO0KSIC72Y17qkQD3yRjixJw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFHRzZsMU5kc0dXRE9ONXMzS3FZM1lheSs4YnpPV3B5ZEdQV1MrcVZJbTRx?=
 =?utf-8?B?eGtNdHYvNFlVd3RaSzBvQzNtak9MelV2Z01tdWNyTmlkWWhndjZFM0FwTU8x?=
 =?utf-8?B?aWxQM1A0eGgxejE3MHcvWlpMRlRyMXJXZlMyamp4Y2tYUjJiUU1ySHNML1dS?=
 =?utf-8?B?K0JKTjNwaE40dlNsRitFR3ZKSjllVW9qc21yUTJndmtsOEEzaGRTdFRZN2J5?=
 =?utf-8?B?ZCt6UG5HYVkrRWRJY2Z2Z1IrTjdmZm9kNzJ3dkN1NCtadVJmUW1IWDJvM1hP?=
 =?utf-8?B?NEhlKzg5QnV3R25FYnZHa0x1akdGK3lUUlFBdWUwZHNMdnZpYVFOSW14UWlU?=
 =?utf-8?B?T2NhdWFMTSt6Q2VpZkJCeGlhYUJQK2FQRHZRY3pvZmhFRXBTMnk5Yjk2VEdt?=
 =?utf-8?B?NS85RTV5dHUyby83VzdnTVFoR0dEb21kQ3lwbDYraFQ0T3RWRHFKVU4vb1BO?=
 =?utf-8?B?NEZVd2syc1phd2VZMUlqSS9qT1JwRFI5bXArNTdLcmR5VTB5OXIycWFMYmEz?=
 =?utf-8?B?UGJhN3RYOHhZdndmdmxYZWZlV0QwZjlvUGhHaE15bHp6WlZFVTZZMmNvY3RB?=
 =?utf-8?B?WjB2R2U1aVlLNFl0dVBuY2VjcDBHeHhhdHZvTTdVclprTFJFSE1pQmdscEta?=
 =?utf-8?B?bHhHY3lsVTJFRlRJcHRXV3VOZzU1T1lHdEF3bnFwRkFhbkRUZUw0akczWEdk?=
 =?utf-8?B?bmY4S3FIRTFBUFAydEw5WG56eFA1T3ZtUjZjR0o5M2djYWs2c29HbWNOZTV3?=
 =?utf-8?B?Z3ZNU295THhOS1FkcjBOZGNlbzVtVW14QStOT3h2dlNBeEE3RllSdzJUUEVI?=
 =?utf-8?B?OWV6dFVyUkE2dGJBR24zZXBGUnhiQlhzQkdMbVl4OVBZbnhyNVNjRy9KMFhM?=
 =?utf-8?B?L1U5QmllMzhiVDlyME9hTmhBcDVnSXdhMG0rcmEzSmRGYU5JK0pSNGFXOG9z?=
 =?utf-8?B?eXpBSWsrRUxtMkFKSDFORDRKVTVFODNPNDlQb01aZzlVem5IQlJCd251RldV?=
 =?utf-8?B?dUdUUk96Y1JwUEs0MTNUcWRnWDVZV25lSW9JMVNzT1RXdjVPRWlOaE1DTlZp?=
 =?utf-8?B?aCtIeExQSWhLSGR3dWE1ZFphSWlXa1B0K0RVQjdVVGJuSjZYNm1SbmgyTnJl?=
 =?utf-8?B?a3pveVRyd0lpakNqUlU4VmUxQkRLeHJ6TlhITlJCS3JVaVFMWEExSEs1cjRn?=
 =?utf-8?B?MDEvQTRDNGozVktYSkpPS1djSWtpcWhhNVpqWTF3K3IxMmpQMGlNZjh3OUhI?=
 =?utf-8?B?WkNVZHAzYWplNHowUFl2MiswanNyakNuOU56RzJPR2hpSUtWdnNlbUszVjRw?=
 =?utf-8?B?Q2NPNzEyN0JSNW9wREo5ZlU5bzl4Rk1Sbmp4TnFZcWNwRTJaSFg2NWJmTmVv?=
 =?utf-8?B?STlrR0tiRjRCSHBNc09BTWJXNWVsdFU5Z1Nna25ONWNrajN6Y3pUWDVxWmUz?=
 =?utf-8?B?ZGhBdmF0SmFmUFEzalpmV1NuM0VZcTFhSXlPTmZ0d2ZvYUdLOGNvRjgwNUx5?=
 =?utf-8?B?WHNvSlR6eW5pVnk2TUNmQTRBcnVBcjA0ZUVtWHh1UDJQald5ZVRhSGlLRWdy?=
 =?utf-8?B?Z1E4T3BNVHZ1ZTRRZThnTkFRcFlBRCtLYVpyQlJsbTFmWS9XeVlBcEdBaitw?=
 =?utf-8?B?TVlaci93SEpROWxKS1FJUThGNE04SEpwRHhlRlc1K29TNVdwdks0bnM1WVZl?=
 =?utf-8?B?Y3psQWZibzhGL2lNc1VhOXJ4cjZGWjIxV3hkVXlaNlN6eVJlcFJhWU1nN25k?=
 =?utf-8?B?WElhNlBpYk0rZHlIRktCZkhaWGIyKzUrd3pGV0ZTclRyZmlsemxjcjV5VFFq?=
 =?utf-8?B?a3RoQ0hDM1IwL1NJa0pINERwMy92bFNpaTFmMnZiT3BQMWZCbFpxdE9FaWFM?=
 =?utf-8?B?WGNvc0FrVlkxVVZ3bndVWnVOREx0KzFtQUQ3Nkw0anoxMGJiR1BRRG12akEv?=
 =?utf-8?B?T05jNDVvMlluV3ppRG01YmhLeHJWQWdLQWIybkVRSWM0TDFwK0lPcVJyYzBu?=
 =?utf-8?B?Z3Rhek1SeDdPZ1RkbWxBK2w0VVl3bzhsZDdQZjlKWW92N1FORWlQSjhiVnE4?=
 =?utf-8?B?dVR0cmcyOHJHN3ZuMDFHZ1V6RzlMTkVvTm5sTXQyaWJqbC9xVW1MKzNNdDh1?=
 =?utf-8?Q?1yVpaktVQntZxmXTkP35KxPmc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda8ddce-fdaf-426c-b9b3-08dc520de5a9
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 05:38:02.1983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaI2b2cMMdnQa1f7LY//sdXLUFZjFpnK5MdDn5yvcbVUbOPFQ74NrUXkT7wiiLvdQsGuHqYU98/YVwaR4btP/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
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


On 4/1/2024 10:47 AM, Nautiyal, Ankit K wrote:
> Patches LGTM.
>
> There are a few nitpicks in documentation in the last patch.
>
> With those fixed, this is:
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Thanks Ankit for reviewing this series.
Issues reported in testing aren't related to this series.
Skips are expected when no panel is connected.
Can see test working fine on one of  the mtl-p systems where display is 
connected.

Will address comments while merging.

Thanks and Regards
Kunal Joshi

>
> On 3/28/2024 8:15 PM, Kunal Joshi wrote:
>> modify test to support multiple big joiner outputs
>> simultaneously, support for ignoring fused pipes and
>> addition of subtests for testing force joiner support for
>> which is added by below in kmd.
>>
>> drm/i915: Add bigjoiner force enable option to debugfs
>>
>> Kunal Joshi (5):
>>    lib/igt_kms: move bigjoiner_mode_found to lib
>>    tests/intel/kms_big_joiner: revamp bigjoiner
>>    lib/igt_kms: add helper to enable/disable force joiner
>>    tests/intel/kms_big_joiner: add tests for force joiner
>>    HAX: tests/intel-ci/fast-feedback: do not merge
>>
>>   lib/igt_kms.c                         |  79 +++++
>>   lib/igt_kms.h                         |   4 +
>>   tests/intel-ci/fast-feedback.testlist |   4 +
>>   tests/intel/kms_big_joiner.c          | 483 +++++++++++++++-----------
>>   4 files changed, 369 insertions(+), 201 deletions(-)
>>
