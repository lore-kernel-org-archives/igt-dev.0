Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3D8FEDA1B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 19:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5C10E1CD;
	Tue, 17 Mar 2026 19:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpyn+zIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556110E1CD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773776673; x=1805312673;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=o832CIxmOrRaytGz1q0UeXBJtiWWtE+pLGxhx0ePW0w=;
 b=cpyn+zIrMEPri278LLH0OqguSfbb80NNYBDxF1OPHL0XU4TEqzCXLD+8
 wTme9eDjGPDYw2QU9d/tgz36bh+qJFSalAPcuKm52MbXnS7ulXkeeIEHl
 W9NkN8BE27Iqig8m8PZQJd/TAkNHV84e+mNsC1t/8jL2RnI3iVzlDjMAH
 yOws7ol82nHBIqUyxGLDLUzNJbmNWPz1uvmOedIMYCQufm9FITRaB2k0C
 3Q144l5GGjzBR0D/5VdqdLPpwtA6rBoH2RhKQkZBmjRfxDaNTwYuS2Vpw
 AYS9WGPkiF9rRFQ6r473oSTUQuQz2UyW6tBSI8fW1DiHyYDwKEmQAzYUW w==;
X-CSE-ConnectionGUID: BvsIUq8vSlipt43+Le1ftw==
X-CSE-MsgGUID: hv9lLokTRsmzQP7bx0KC/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86296691"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208,217";a="86296691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:44:32 -0700
X-CSE-ConnectionGUID: XkhpcA4GR3WLAb8QKvxU9A==
X-CSE-MsgGUID: PEhnoYhnRf2MJ0+jYaqoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
 d="scan'208,217";a="221443096"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:44:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 12:44:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 12:44:31 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 12:44:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=copcBHcAcM9k5+pWiNkszyEGz0kUyhTXLoTVhGv5LT2H4bK8C5icDVm4ULqnY4aNjJRhKMpayincUkf+D36ZDDV/WOkpivKCBP5C/ZQQAp7l4NMzMNzs5MBsk5S19ZayHC/+APGL0B7OCH3azR5HSI32Dq2aRGImzbD0kQWGeptv6L5kdxuMgxm+mI5z/Yoq+WnOKAyJmbgXn+htV1Ma4UVcd0rIWRsA6KVHsPtPQP1NAm99faBz0nae9DvFiqBeKJirBW/HeqWG0r1JL67bsly1FZplPIfaQZqfsW4PVWxTOn1tqAJVBz1OMyjte/gPaHJ+wNu6NsQJiAZqI/iYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTAMvnCEzBowEKQtadhPtU8xPADaIVEtUt6yw083Gm0=;
 b=Yn7h/LFUjVDbHJkWrhrf8DA9/UqkhKO9QKYK6llJrn1LKb1cn2C0BRMEeLatOyPN6bkhHnTwhMDZxLjlKC2RVabNRHS4IOi4t46bBxcP2WRyrYJo5layXXi9cuJHKsZPoNc6+6mCobV7GATow1DlyggaITBgHXR9uptHZdOSGMgxg3BSdUbyPDSonolbcWR2C2kEX8RO8VDRdowJUC9Wq1yKNmFnEm+HnoGfSrPjjyIyJWGrKOlCzb4lWFnGdA2ozTkCDvO0O1Czl+uYHiYZfOCtOEIHnQmoBg0bMk9PJQC1btM4gotSdrIHtR3rgJJ9rk4+1UFay43/m7ahFvGEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 19:44:29 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 19:44:29 +0000
Content-Type: multipart/alternative;
 boundary="------------b7KTD0oCI2wl4tVuduwmUxfe"
Message-ID: <7b527da4-787f-4623-9bed-f574daec7fb4@intel.com>
Date: Wed, 18 Mar 2026 01:14:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
 supported
To: "B, Jeevan" <jeevan.b@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260316033807.24078-1-jeevan.b@intel.com>
 <abgWhvmToId2i7mj@intel.com>
 <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea28e8c-fcdc-4970-668f-08de845d9a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: XpKmiZpHYih5NOz9e6cIF9cFkJgVTTMkKvFCijz9jIdYklRNk9U0d9uQq0uolkMdPRmjIGTaCkM8+NaG7ETYfEOxPagaLJJ48bI7cgU6XWdgnGF1B+bHW6VHGvPzuqulitZxA0v+D9wMdRYAGWne5vxPGUfvb8l83LWAnGmj21QXSFM2llMM+GtXpDT674dnacJfWNYpY/ku6UfTCCtsAQd3iEHeafnh+CnIk6DboIce/FSdWH6KdrkoFV9RGXb9FyuqEO4esMr7KRg+TKEUjUTDtysXV6pkqj2N3LElcSF3YwtKy4CK4KkiSerGYooW6C9pMeai5VkK5sr47GudCtIpYcwXWyJ0jjq3CwuTkfl5S+wqN32LZWUUl+zvg2h9XY79LxlWcOypqG5vM8mpcuCjf1CjDx3qv6DFdvMinTbhAgP2ttD/KeYxdx8I8ybsNp1SitLmCaooYPO4Onl8Ki3s9TFavOQpTxCHBURQ1WWSBYnV1J0LLFod/g5PCFGjuzkm/lS5ozYqJvbk5jSuOwcUvYJHGe8PKYiy3BZ4EdBcABTmsUadfjdtOeiaXUZhwDvK/JmGtj4dzv5C1n9rdlJLVJv9y5qUyHM2naEa75DeYLkgsnaGI7kuF8pGO8U/MpY9ZXEvRzqWZ6R2dielN5CfsMMLDGy9OiPG4jxIpctPSpXQTrTlV5Vb3CRI/UHDMkSt774ocId2YYkWS4TI1yBU3yREvWq/hasG0Uz4gOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlaVUlZdHgrVDJDaFhZMzcwN1BpOXE1di9vK0ROYThtdjFhRXhRRGJuVjVn?=
 =?utf-8?B?R1hBV3hqOXdtR2t2dkNyZVdxUGFXT0txRDBUMW01VDZ6WkhUaUthZDVKT2lu?=
 =?utf-8?B?WWdmcjZYVEFBVmgyQkxSVkpSVFdoejA5VndvbjhNeUdOS0pSY3orT0JTU09Y?=
 =?utf-8?B?VGVZYlRvSlQrSHhZZGt1SmNzbkpGaTlJZTJOZWxGYVI4RE9vRHpLSW02N2pz?=
 =?utf-8?B?SjVack02ZDVpQXJ1UTQwTWVXOGd1QkRPYndnb2t0bEJ5N0ZOVXNNRHhqVjBv?=
 =?utf-8?B?Q0hJeGZXSCtTUExuRXl2WUxlTlZ6ZkRjUEtxa2xQZzNkUjduL0E3ZWpsN1FP?=
 =?utf-8?B?NVdnSk55VU1YQlhMSWNwQTJNbWhoTko2Z0JucXZsMytkaHNWWU1Ua0dqSzVI?=
 =?utf-8?B?dkNzWUZkQkhWK1RLdUk1eUQ4eURkSkFPWlFYT3BSTnIvbzNnSHh0VlFkVmho?=
 =?utf-8?B?UlNtN0t0SUI4Q1A4Z2dQQXhjSUs0SjhITzNLSTlqUkJ5TlNWSXZXWFlVR0Vx?=
 =?utf-8?B?c01STGJibW1Ub3Q1THMvd3J3bWsxaURxS2loNTZqV2hQenpFVzFXbkV4MFhV?=
 =?utf-8?B?QzkyOGQvdFhEN3FoZmdLWE45cFZ5U2lkMnpZVGt1Q25QVUVIaXBFTk52NnNR?=
 =?utf-8?B?cWF0dFZaZjMwRWdPTjhvUmlmN0hyYjA5R2hhUk1GbDJPeFBSR2RkVGlaWHZi?=
 =?utf-8?B?Z1YxWTUxZWNYYXdHVmNUdGdrbzY3a2hHOWRiTTlWb0FtS3VoNDVOY3dKYita?=
 =?utf-8?B?VE1CcU81ZVJaWWFCS1pjcllsL0NzbGlHMEdUbGZVanRzaUdOa3FndGlwWVAz?=
 =?utf-8?B?b01uUnl1bjB1Q1hKRGJjekFaS1JrYUVvSG56UHFyTlJBWFZnQkl3aWZWbFRF?=
 =?utf-8?B?S0t6d1J6c2RXZm82bHZXK21uS245c1VoRzBHOE5UZUphcnI4MHFMSVZRY3l1?=
 =?utf-8?B?Z0hxS3lkNmx2dlAwWXQvK0UyamdpQzhUVDVEM0JOazFnd2FsYWJFc0dJNmw5?=
 =?utf-8?B?TTBGblk2WjYwaTlEb1Q1YWlaM0gybVlKY2pnV3FhR05NV3RBNkZBMHpqaXU1?=
 =?utf-8?B?cWlTQTgvbksvY0FpVzlaYk9hTitoMjNGdCtTUkwvNHpxeU1QaExoQUhiL09i?=
 =?utf-8?B?VEVKeE5YSjN1T0ZoZHNxV2dXYnBmbU5QWW9UTlpTQm04MlUrczJ2RlRqMDZQ?=
 =?utf-8?B?ZktIdENyZy9ZZE1tQVZQMWFZZFhsNkN1QnFpTHRXSmhTbkE1Smd0Vk5LSU1x?=
 =?utf-8?B?K1ZQMDFnS2w1V2o1dUtBM3FaSDFjc1hCUjNrUGQrZ25GVVVFLy8xRjhXS0t4?=
 =?utf-8?B?L1l6UWRlWDR5V0k1UGl4NlNablI2ZFhEdmIzK3VxaXhlTHBGZWZPTUdiQWRo?=
 =?utf-8?B?VktyNXZOWGNhQXNSN0dNcjk3RG55WXUrSmhXRjNPc3o2UVppMUk4eDRsVVRu?=
 =?utf-8?B?UTQzVkVpZko2L0U5ZlBCVkJ4MjU0YXI0d01UcTFTTm5HQUxvbVAyUDNqUGRK?=
 =?utf-8?B?c0IzRmd3NCs3dWZPZUxqYS9GS213YjVmd1RUVVM0MmJzeGtUcGlvMlJsR3dL?=
 =?utf-8?B?Y1l3WWJzT28xQXRLekdZQnVacUNCNjdwc0sxbGZGUzIySFpteEMyZ082cEta?=
 =?utf-8?B?bjRSUzdzRld5SkFrUDNGejdhT3JMaXJCUS91Si9tWXVCeHNHOThRNHdQYlJl?=
 =?utf-8?B?T2tITFNHRVk4MElWLy9GS2NCalNlSmJqWElFRDIzUFovRWdNdHpXSjkyeEpr?=
 =?utf-8?B?MWNIOFVSR3VNWTM4TzBUZGw2VWNXVlE0K3doSVppRXVhSHJMVlJxdHZzY2wy?=
 =?utf-8?B?V0RCUjl5bTRTTThoR01QQURaQ1h5MVB3aEFPWHdrUGRTeWF2dGRTTVh6QXQy?=
 =?utf-8?B?SmpnNGZFajl2bnV0S244bTJBOHlzUk5QNEdyb0xFdnhVNU9mcFRTTDdpV24v?=
 =?utf-8?B?L2xFZGxxZzJIR2QyQ2RJdGZxUlVwM29LWldtMytBSUs2N2VkNmU1cnE3NUVa?=
 =?utf-8?B?NmNjK1dyeWxLUTJxS0kycWYvdkRZMWh1djk2ZGoyL3pKS0J1TE5RZ0R5Sm9r?=
 =?utf-8?B?Syt3em9ONVYvSnBsdTJpTWloZFF2dVM4ekw5eDFIeHh2cHFQQUZGdjVBNzBq?=
 =?utf-8?B?dDB0Qmh0Mi9LOXJ3eGNrdVR0Z2trcmtnSTY5Ky8xeElET0FFUnY4and5TnQz?=
 =?utf-8?B?STFWOWwvNFNONWVld2w2UFBma2Rua2pWcjArRWQyMWJoYSs1T2gyMVJtYlNh?=
 =?utf-8?B?U0FrVHpiS2hWMjlqb3BRSkVDOGdCZDAzUFVMNmpta05lZXFOOVpwSjY3Mm5R?=
 =?utf-8?B?R2ovVUNTTjBsOS9tQjFvRlR3T0dYRFZ4L1dFcjdVay80dXhQOTlOOFNSVkh1?=
 =?utf-8?Q?1jiFECF39KpaP89Y=3D?=
X-Exchange-RoutingPolicyChecked: itvi+xKqe1OtrgrGN5Rf81ErQZns/79bt7CDhGPYAHloqJpSxFCsV7wob2E1O/1ksFIH2GBXX+owS+n854BX2nkyCPzNkfzZlPIaYZjTfqPNenZBku0Uirkcpz8qFSWHbtMAz1c089HMNUDiDPAFtEYR6fJ72/vPvzRB6hvu9pCvw74SbCZ0E7DthyS+2oneITYuG2liEl46i76slLgxihZ6ozTRTKaeNZHU2dpwXcuY0Pys5tYAtcnZCwcQ/mwwu4E2+iirhHjgjC7644FmkYaQBnYX2GlHk6VP656Y20ZMsVGHpBzIOTMKkRNMkIhR2U1frxiQishrjk8DENpR9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea28e8c-fcdc-4970-668f-08de845d9a9c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:44:29.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hw9fmeDrKInZcswAcQ5nccJKiCWoM5CNNLKkrp7/kNKBhG0/+t54xGXHgWmmMckVNQiFn4s8g2zCphak4o4b4WF0btPtuQsLFSGqIJ7eF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
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

--------------b7KTD0oCI2wl4tVuduwmUxfe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

++ Arun

Hi Ville,

On 3/16/2026 10:57 PM, B, Jeevan wrote:
>> -----Original Message-----
>> From: Ville Syrjälä<ville.syrjala@linux.intel.com>
>> Sent: Monday, March 16, 2026 8:15 PM
>> To: B, Jeevan<jeevan.b@intel.com>
>> Cc:igt-dev@lists.freedesktop.org; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
>> supported
>>
>> On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
>>> While creating the framebuffer, prefer tile4 when it is supported
>>> instead of always using linear. Fall back to linear if tile4 is not
>>> available.
>> Why?
> On Xe platforms, using the linear modifier takes longer to prepare and submit a flip compared to tiled modifiers.
> On HRR panels, the available frame time is small, and this delay can cause flips to be submitted in the Evasion region,
> leading to sequence mismatches.


Adding some points:

XE does not include memory optimizations for linear surfaces, which 
leads to higher processing time for linear buffers. Consequently, linear 
stress tests are intermittently failing.

>>> Signed-off-by: Jeevan B<jeevan.b@intel.com>
>>> ---
>>>   tests/kms_cursor_legacy.c | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>>> index 5399ef481..4c4e477a1 100644
>>> --- a/tests/kms_cursor_legacy.c
>>> +++ b/tests/kms_cursor_legacy.c
>>> @@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t
>>> *display, igt_crtc_t *crtc,  {
>>>   	drmModeModeInfoPtr mode;
>>>   	igt_plane_t *primary;
>>> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>>>
>>>   	igt_output_set_crtc(output, crtc);
>>>   	mode = igt_output_get_mode(output);
>>>
>>> +	primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>>> +
>>> +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
>>> +				     I915_FORMAT_MOD_4_TILED))
>>> +		modifier = I915_FORMAT_MOD_4_TILED;
>>> +
>>>   	igt_create_pattern_fb(display->drm_fd,
>>>   		      mode->hdisplay, mode->vdisplay,
>>> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> fb_info);
>>> +		      DRM_FORMAT_XRGB8888, modifier, fb_info);
>>>
>>> -	primary = igt_output_get_plane_type(output,
>> DRM_PLANE_TYPE_PRIMARY);
>>>   	igt_plane_set_fb(primary, fb_info);
>>>   }
>>>
>>> --
>>> 2.43.0
>> --
>> Ville Syrjälä
>> Intel
--------------b7KTD0oCI2wl4tVuduwmUxfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>++ Arun<br>
      <br>
      Hi Ville,</p>
    <div class="moz-cite-prefix">On 3/16/2026 10:57 PM, B, Jeevan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
Sent: Monday, March 16, 2026 8:15 PM
To: B, Jeevan <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>; Naladala, Ramanaidu
<a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
supported

On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">While creating the framebuffer, prefer tile4 when it is supported
instead of always using linear. Fall back to linear if tile4 is not
available.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Why?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">On Xe platforms, using the linear modifier takes longer to prepare and submit a flip compared to tiled modifiers. 
On HRR panels, the available frame time is small, and this delay can cause flips to be submitted in the Evasion region, 
leading to sequence mismatches.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Adding some points:
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">XE
        does not include memory optimizations for linear surfaces, which
        leads to higher processing time for linear buffers.
        Consequently, linear stress tests are intermittently failing.</div>
      <br>
    </p>
    <blockquote type="cite" cite="mid:DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_cursor_legacy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..4c4e477a1 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t
*display, igt_crtc_t *crtc,  {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;

 	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);

+	primary = igt_output_get_plane_type(output,
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">DRM_PLANE_TYPE_PRIMARY);
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
+				     I915_FORMAT_MOD_4_TILED))
+		modifier = I915_FORMAT_MOD_4_TILED;
+
 	igt_create_pattern_fb(display-&gt;drm_fd,
 		      mode-&gt;hdisplay, mode-&gt;vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">fb_info);
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+		      DRM_FORMAT_XRGB8888, modifier, fb_info);

-	primary = igt_output_get_plane_type(output,
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">DRM_PLANE_TYPE_PRIMARY);
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre"> 	igt_plane_set_fb(primary, fb_info);
 }

--
2.43.0
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
--
Ville Syrjälä
Intel
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------b7KTD0oCI2wl4tVuduwmUxfe--
