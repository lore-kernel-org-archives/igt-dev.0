Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA00DF36BA9
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 05:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F0510E117;
	Fri, 10 Apr 2026 05:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TU8VuaVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369FA10E117
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 05:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775799368; x=1807335368;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7t7/illj83/n6d8SC7neuYrQJIPtSz1dPmX4yWzU1nA=;
 b=TU8VuaVVqZ3O/q2Qz4lTSR17sc/gLMuplXRMOQiOcxXhS7AW7pWqfmoT
 S45Uky5KCQ/xnuwlbW4SbPNUH5jDVtH6Gae01YrsguIe0UtxA5qGcUnfF
 7PJ0hB0vJFKXlcXNj23u4PTyd3Fc9rkuFaYo9JTfDzWB+l9anliX79nj2
 QyuZ2FegozlUtiTRed6fj/l8PKa3QCc05UG4y6ZLgGiDdbFpVCgEl1SEE
 8pB8gufsVsuf6+gm4r/roOsqwZJw3u8TMkFc4u5RVTjredNu7F3JcAKNd
 ptGmOd3Q3T86sh00w2xZq5rFHs/vDyMKm8bRSDpYTQtFM+gkIpZ40DNLI g==;
X-CSE-ConnectionGUID: /W/ckWT8SQe7pJFRHHL6VQ==
X-CSE-MsgGUID: uypVze4LTZuWXRgw1hhicQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64350679"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="64350679"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 22:36:07 -0700
X-CSE-ConnectionGUID: cyuYT3qFTLeiNHM778Wc4A==
X-CSE-MsgGUID: 2rY/SRXSSL2OrXX5YRcCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="233068829"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 22:36:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:36:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 22:36:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:36:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmQoi5GvFHNDl51qIkDBkwIBNVpp8ZyKUn1H/9PrInoIfAuRSWIhdtlKf3HGd3JbMebGP429Zd1iSaJvVClWxMh/G953NTAQ7kQZCKoBrvSdwcuaedK6Om5cbAaGCrEdKDDiGN+Webkn6HESroXHEnEEn0hc35xqv/3IP2yMXXr35dh6A0dCXmOGz7qTzr13pko3rW2fuQ0YMETRlp18We3ahJHGf+tFPfLlqLcOzVQvAUF/D4FXvNHnzWjfXpLjJx3ex6n4WQUUOwxHutzUjszvhglLdj4ZFvobHEHo4qSJv8mSC1OcAgj63Brro3STJZuKaKSv3ETtJGiIG+MAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BobfPjIYDLo01m/dL+9NLrzeisMlWcwUuMoo3lGpzE=;
 b=XXSRVOPRAeCMqH4R1KAbpwnK3Xi+WwBUd051EbUktJ8uaEI2/VTnT1igO/ciWnpok2kzW6Jnr3VLidB6cHcMbVqUEyK7bwzYFrdSm3LYp66qiQRIRVUp4OxymA+zzB10W+Kfi4EslT+EQRzuP5tNkcVltYpmnKgYVHJj3HbfLHD6/Ft/7G5/ocZKOuumsqcJYyLJ1ak/ESSsijpdRxtTXUigOxGHISBRSMl7lKR7G8txSCUNwd0hIuxY8KqLvq262Mn1dbI50mXA98byMT7THEM87n4KlfV9uAj0+J5k/FPopo3lo/bPKoAtIons3M78438igNWIBKakC8bv0fpv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB7494.namprd11.prod.outlook.com (2603:10b6:510:283::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 05:36:04 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9769.020; Fri, 10 Apr 2026
 05:36:04 +0000
Message-ID: <22ce481a-7936-4b2a-bf76-3caa60ec1927@intel.com>
Date: Fri, 10 Apr 2026 11:05:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 1/9] drm-uapi/xe_drm: Sync with Add UAPI support
 for purgeable buffer objects
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <nishit.sharma@intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-2-arvind.yadav@intel.com>
 <20260409154216.7how4uzxrkeroxp5@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20260409154216.7how4uzxrkeroxp5@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::36) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: a717d6d7-9913-496b-4b98-08de96c30eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: FCIBCCwk2N0z5V6rj7jWnuzwr5v8Lp4eqT1n1+279ZyKo9nmurmJvDMtZsDpidXQ5EIa0rIP+d5bWsQScySDvFBzR73AU+u9qN6nXPidIg7jNc/14BGGATWzbtVOB470AvWVv6OGxZI8MLoUjFEx2wdNlANWThEBHaiZMwfTXfpsvSqxANb/19broNgqyMuNv3El9KQRjG4wABd13vuGwgd/AVZYQnvkWOAoIhGBSzxd/CXeioHfZX570VwuL4nwDKBTm45a46hZAlOWO3LGoOA6NqlQmDuLzVjErL8K2FShfHY1eNT5K7W28CkxEZssM9yK20qtfEtFnzXCkoUPP2NYI40k0Zuy0OKkQ0TEuYn04746b+Qbi26DZ5JcUpRvBZWkasN3BeR1njCnvw8bfbHyuEmofkL/lBiZ5F62DfL2R2YNmtFqr3vsmiIcwjImmMN5YMt7QnHjX6zPNw7Kot5y4GRwBb5ygghXXA1rNXUjV8hSMp0gSEtnifcAn2AU1omdbP+/f8HLxBHsveu6dcmn43qEgtQjLyvl8FQ2LwKTSrEytGCqOush3m+6UpzxwS+JOhDPfp1ppxJG+z9yAWpcB0+xgOzrF6W6UuG9KW6MiRGe3pO/rw9Z6EfAYJxWgbvRu4RsOK6jHRZqdyjDR9JBm1XDphgsp+X2A5SDOixCCxTs8/Aby7Z6EDazLKxcNkon4F1XdWjrvU8qgo6dJVXKu1ZYteUcuHzrEAtGsBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajE1dXZUZFdwMERCbEJkVlJvdUd0eG10UVVuWVNYcUhDQURhSFRkR0EyQUpU?=
 =?utf-8?B?bGJZa1pVdTBTdFl5dmZ6SWRhT3JtYzEzU2JINnpJZWhpUXMrVU9IdkZrZ0pR?=
 =?utf-8?B?U0pqVkExUnl5UTdncE1Iak0zcmt1OEtXcWxBdDFtNFVTUHM4RGluc1prUW9M?=
 =?utf-8?B?MGZRbEhIMHh3OHZzc2tpd3lnWnI4cVhBay9iNzVqN3Bla0RMeUZsdEtVMmJn?=
 =?utf-8?B?VjIwQVRyakxFclJCWE9iRFMrUjBYQmhsWDhaeVBob0ZzbmF6dVBXSnRIbUFJ?=
 =?utf-8?B?dTBNdE9iKzMwYTlGcXZMSXRRcjl3K3ZjNkhlVmsyM3F2N0ViaHpuMGQzYUlo?=
 =?utf-8?B?RmdWNDhTbGR6WnBKTS9XNnZjbHpXSVJyR3VkOEtaWGhYYzR1U2lJajNrNkIw?=
 =?utf-8?B?cmRZYko1SUlxR1VZTW9ERHg4MTBUeXBaejR3SThjUCtmamZmTWpnVFZiN1J2?=
 =?utf-8?B?MythRGp2bDNjYmR3Qm1oUWJXWWhJaGQ1cnQ1WFRvUXlVYmZhK3pDYksxZGRF?=
 =?utf-8?B?SzVwdGpZMm81N2l6eW1zcFBzd3d6ZUMvMEpXNzMyLzl5Z1hxOHYwa2pSMmRW?=
 =?utf-8?B?eGpwQWh1SWxkaTJKU00rUzVJMHNkOUNyOGNyaEp6NnRHQmV5SlgyOHFnWm8v?=
 =?utf-8?B?S3hadStmUkdPS1pkaDhLYkFUSFAvVlB4bXo1RWFsejdUcVAyZ2RKRXZYTzBZ?=
 =?utf-8?B?YkptNElzWnR5andpaGc5L2ZQMllod1JyeFhCRWJwZ2g2VjVNcjd0R1VaUkli?=
 =?utf-8?B?Uy9SOVdRSzNmb1VRajlpRzZUc2pEc1Q4d2xRc1VHdHc1UStlSEpIUVI0Vkxt?=
 =?utf-8?B?TmFsTWlhVXVneW0za0lMd3Jia01Md3A4ZmM5b1NIc2VGMTFLRkx6c2NxN253?=
 =?utf-8?B?dWg0dmZpMGdXdHh1aGRWSnlLeDN5TEdaakkxbVRlQWFKZjBPcW5EdmlBbnBj?=
 =?utf-8?B?VnNGVWNPSFUxcGtmd1AxZW1zZHJOV2taY1lxUGRLSjdFRVZmWkVDSVF1MFI5?=
 =?utf-8?B?RHRyWDVVN3RFVjJTN1hTdkl1a1JGYzRNWFJ6aHNGbGYyR2d5R2hkakNhckh5?=
 =?utf-8?B?ZXpINWp2akJzc1dDMVdyMEozRG4wR3ZpOHBNN1Qzd05RMjhxdzJPVzBNRnpz?=
 =?utf-8?B?bjRSOTJDTXlQM1lUczN1aWE1aHRXZHpOMG5YbzhlUytmcDJibGhFT2VFM0pw?=
 =?utf-8?B?RXlyclBObGx1QXBzd0xBQW5kN3o5c0w0RDVWUEd0RHFZZ01nR2JkUW5qMFJq?=
 =?utf-8?B?WlVPSlBKbTk1SVZiVG5MQkVHdjZFZ2JLUVZlREszeEdTNmVOR29EWXFIMUlT?=
 =?utf-8?B?Q3Z1WDZJU0phVnYyYnNjelJ4TWFlOHM1blpqSmtKL3NDeTBkS2JJU1BpUXNh?=
 =?utf-8?B?T2RQZEFlRFlNeUlQaHpzb2I1d3duNENIMFpValhZWTF5NkRKcytSZk9rSCsy?=
 =?utf-8?B?T2RGREEvODNFVGV1L1AvVzhwQngxbEFhdVh5UGE3bkZkRHlqSEZFbWlTQkJL?=
 =?utf-8?B?TklqTUhmemM5aFcyS21vS3FwdEFkZFJBUGZtRVAyUDdjU09uTjRNa3NGa3h0?=
 =?utf-8?B?ZDVoSXFYc0pUM21PM2hPMGl2OVFIZmM2QjRFc3kyVTQvSXRvMElaSGRoR1lV?=
 =?utf-8?B?bjFLMmhXM0RYMEdwdjlHZUFUZFFCNkRScHRscDE4UCtqRmN6SFhJYU80V2xI?=
 =?utf-8?B?eTRoMktQSFpNanZnVExDSk80M3RPSkFGbm1Xek1TRmt2SXdLRjNNUGtidDI5?=
 =?utf-8?B?eEpkeXdWQm1RczJsc0dzMU1CMFZqL3RVRTJKYURkOVNmK3l2a3psRE5CRURn?=
 =?utf-8?B?Z0JRV0NXTWljQzdvNmM0Sm13QmU4U28vRmpReUJsMk9xYnFNV2toL0s4QzVy?=
 =?utf-8?B?UWtPTmkwT3Y3enFTZmRFVWUrT2RoVW51NnBMY1NqK1JNd1hwelF2cUdXNmo0?=
 =?utf-8?B?QllaUTgwUnEyZlVoS2RGU0FDTGtEcDFDbmloeHI1aENJdEZGTGx3Z0dCVDBx?=
 =?utf-8?B?LzJEK0l5bUcrVVRLb1Z6M2l5Z0JyRmZ4bWZlSHQyUUg1RGRNdHREa21sVHEy?=
 =?utf-8?B?MkVLL0tpeE85T0I3ZUdzUm8rQUVnVkdzNTVEd3ozTjU0bENQUXREcERYcFgx?=
 =?utf-8?B?dU1aS0dqMjllb0ZLOGozWlcxbTcrVUp1V0t0VFNldDlLc1RhWkY1R0lYVUU1?=
 =?utf-8?B?bnNuZjVzelExUUZnNUtHZmdwQnhJcHRVWGpkbXczeDVDcEY2KzRvUCt5VzdF?=
 =?utf-8?B?dlozTkJiTThMNEYzSHVub1BVelp4ZXI3dUJ6VmI4VGhKUFFrRmVESzJ6VHNn?=
 =?utf-8?B?SXdNY1RZd3B0bEtOeWc3ZXppT3ZFWDlzS1ZDWXlkMS9OY3JqamM5QT09?=
X-Exchange-RoutingPolicyChecked: WS1Jtpd9vG886NU0Nk2/HhQ1OF9OQB/FGeWlJJv33Vgc6N4einEN4S+mvzxA1XSIBZMoSyEQu/Y8lm7p8+bRn/b8Zjkob/G0cYCa6XmTIBY81XT03zbb3Pv3h0+HyaQ4QzSmtYe9Tf99+3j+b8tAraii5m3xcSgrRrsIrLEhs7mdq9YXtQGy9GJ0/Qo9BzZiY48Ez1X4aeTtnU/mLI2W18TegbUMMkro2/pktS/t36mVu6RmovGmPEiZqbYYKe0eo2x4BN6748byrm0k69mVr8ejoGIpbbjIGRFNBk2SrxRrDLv4xEThvT3ygKJ2wp20AymnLA4MxV0ndmxjJh9MYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a717d6d7-9913-496b-4b98-08de96c30eab
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 05:36:04.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnFfCUly/DCerAeBp1qhAP5fOlpCY2dEcWa/QH79S1jHeVoFZPSfiZttAltbVUuuGMkJL5t3BaDCudwm4+Ql8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7494
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


On 09-04-2026 21:12, Kamil Konieczny wrote:
> Hi Arvind,
> On 2026-04-09 at 12:31:10 +0530, Arvind Yadav wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Extend the DRM_XE_MADVISE ioctl to support purgeable buffer object
>> management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute type.
>>
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> - WILLNEED: Buffer is needed and should not be purged. If the BO was
>>    previously purged, retained field returns 0 indicating backing store
>>    was lost (once purged, always purged semantics matching i915).
>>
>> - DONTNEED: Buffer is not currently needed and may be purged by the
>>    kernel under memory pressure to free resources. Only applies to
>>    non-shared BOs.
>>
>>    To prevent undefined behavior, the following operations are blocked
>>    while a BO is in DONTNEED state:
>>    - New mmap() operations return -EBUSY
>>    - VM_BIND operations return -EBUSY
>>    - New dma-buf exports return -EBUSY
>>    - CPU/GPU page faults return SIGBUS
>>
>>    This ensures applications cannot use a BO while marked as DONTNEED,
>>    preventing erratic behavior when the kernel purges the backing store.
>>
>> The implementation includes a 'retained' output field (matching i915's
>> drm_i915_gem_madvise.retained) that indicates whether the BO's backing
>> store still exists (1) or has been purged (0).
>>
>> Added DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT flag to allow
>> userspace to detect kernel support for purgeable buffer objects
>> before attempting to use the feature.
>>
>> Align with kernel 'commit f99a05cc0b85 ("drm/xe/uapi: Add UAPI support
>> for purgeable buffer objects")'
>>
>> v2:
>>    - Update UAPI documentation to clarify retained must be initialized
>>      to 0(Thomas)
>>
>> v5:
>>    - Document DONTNEED BO access blocking behavior to prevent undefined
>>      behavior and clarify uAPI contract (Thomas, Matt)
>>    - Add query flag DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
>>      feature detection. (Jose)
>>    - Renamed retained to retained_ptr. (Jose)
>>
>> v6:
>>    - Updated UAPI documentation as suggested. (Jose)
>>
>> v7:
>>    - Commit message updated with kernel UAPI details. (Nishit)
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> Looks like this commit is already in igt so you could drop first
> patch and resend. For example:
>
> grep DRM_XE_VMA_ATTR_PURGEABLE_STATE include/drm-uapi/xe_drm.h
>
>   *  - DRM_XE_VMA_ATTR_PURGEABLE_STATE: Set purgeable state for BOs.
> #define DRM_XE_VMA_ATTR_PURGEABLE_STATE         3
> * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
> /** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>
> grep purge_state_val include/drm-uapi/xe_drm.h
>
> * @purge_state_val: Purgeable state configuration
> * Supported values for @purge_state_val.val:
> /** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> /** @purge_state_val.pad: MBZ */
> * @purge_state_val.retained_ptr: Pointer to a __u32 output
> } purge_state_val;


Noted, I will drop this patch.

Thanks,
Arvind

>
> Regards,
> Kamil
>
>> ---
>>   include/drm-uapi/xe_drm.h | 69 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 077e66a68..cf0eb3f99 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -431,6 +431,7 @@ struct drm_xe_query_config {
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT	(1 << 5)
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> @@ -2067,6 +2068,7 @@ struct drm_xe_query_eu_stall {
>>    *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
>>    *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
>>    *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
>> + *  - DRM_XE_VMA_ATTR_PURGEABLE_STATE: Set purgeable state for BOs.
>>    *
>>    * Example:
>>    *
>> @@ -2099,6 +2101,7 @@ struct drm_xe_madvise {
>>   #define DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC	0
>>   #define DRM_XE_MEM_RANGE_ATTR_ATOMIC		1
>>   #define DRM_XE_MEM_RANGE_ATTR_PAT		2
>> +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE		3
>>   	/** @type: type of attribute */
>>   	__u32 type;
>>   
>> @@ -2189,6 +2192,72 @@ struct drm_xe_madvise {
>>   			/** @pat_index.reserved: Reserved */
>>   			__u64 reserved;
>>   		} pat_index;
>> +
>> +		/**
>> +		 * @purge_state_val: Purgeable state configuration
>> +		 *
>> +		 * Used when @type == DRM_XE_VMA_ATTR_PURGEABLE_STATE.
>> +		 *
>> +		 * Configures the purgeable state of buffer objects in the specified
>> +		 * virtual address range. This allows applications to hint to the kernel
>> +		 * about bo's usage patterns for better memory management.
>> +		 *
>> +		 * By default all VMAs are in WILLNEED state.
>> +		 *
>> +		 * Supported values for @purge_state_val.val:
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): Marks BO as needed.
>> +		 *    If the BO was previously purged, the kernel sets the __u32 at
>> +		 *    @retained_ptr to 0 (backing store lost) so the application knows
>> +		 *    it must recreate the BO.
>> +		 *
>> +		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Marks BO as not currently
>> +		 *    needed. Kernel may purge it under memory pressure to reclaim memory.
>> +		 *    Only applies to non-shared BOs. The kernel sets the __u32 at
>> +		 *    @retained_ptr to 1 if the backing store still exists (not yet purged),
>> +		 *    or 0 if it was already purged.
>> +		 *
>> +		 *    Important: Once marked as DONTNEED, touching the BO's memory
>> +		 *    is undefined behavior. It may succeed temporarily (before the
>> +		 *    kernel purges the backing store) but will suddenly fail once
>> +		 *    the BO transitions to PURGED state.
>> +		 *
>> +		 *    To transition back: use WILLNEED and check @retained_ptr —
>> +		 *    if 0, backing store was lost and the BO must be recreated.
>> +		 *
>> +		 *    The following operations are blocked in DONTNEED state to
>> +		 *    prevent the BO from being re-mapped after madvise:
>> +		 *    - New mmap() calls: Fail with -EBUSY
>> +		 *    - VM_BIND operations: Fail with -EBUSY
>> +		 *    - New dma-buf exports: Fail with -EBUSY
>> +		 *    - CPU page faults (existing mmap): Fail with SIGBUS
>> +		 *    - GPU page faults (fault-mode VMs): Fail with -EACCES
>> +		 */
>> +		struct {
>> +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
>> +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
>> +			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +			/** @purge_state_val.pad: MBZ */
>> +			__u32 pad;
>> +			/**
>> +			 * @purge_state_val.retained_ptr: Pointer to a __u32 output
>> +			 * field for backing store status.
>> +			 *
>> +			 * Userspace must initialize the __u32 value at this address
>> +			 * to 0 before the ioctl. Kernel writes a __u32 after the
>> +			 * operation:
>> +			 * - 1 if backing store exists (not purged)
>> +			 * - 0 if backing store was purged
>> +			 *
>> +			 * If userspace fails to initialize to 0, ioctl returns -EINVAL.
>> +			 * This ensures a safe default (0 = assume purged) if kernel
>> +			 * cannot write the result.
>> +			 *
>> +			 * Similar to i915's drm_i915_gem_madvise.retained field.
>> +			 */
>> +			__u64 retained_ptr;
>> +		} purge_state_val;
>>   	};
>>   
>>   	/** @reserved: Reserved */
>> -- 
>> 2.43.0
>>
