Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15521CA5FCE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 08:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53EE10E269;
	Thu,  1 Oct 2026 08:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjWG20Lc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5142B10E327
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790842053; x=1822378053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=h1nJxeXkEgyYxwGpt/SgsLVerA9yJpg/rSw1/3d7vyg=;
 b=GjWG20Lc2iBqVEYF8OMvgVvsbsKXW1zfTNRaKazxTDsU346PAmPy7qaN
 x40bCBQFGaLh16dq64yRsbtv3NhUgTI8i5q41nL/9QtLjOAPUacNQmEba
 YvqKtrDIVuzoaI4gP27voCpyU3BEXfy6BBd2EgBmtX8fwOVCvOkGHvRl9
 61dKXFddE+z6hCv6uXtrjeOaxYkzmVLKMh6o1oXASiyHC/gfrm7A5ZEO+
 37o7UBINMA7RXhVRDFw/0MdbxoX+k2+BsAH0CMGne0zwzbhq5D0QbeoVA
 +776RDSWoWsYsw2lWTbk1QDTaz3nnq99E+e2YUE4TAtLz8fp5DTkO2Xue A==;
X-CSE-ConnectionGUID: H3VxoRLHT3W76PhQ2m/NJw==
X-CSE-MsgGUID: f7CAXRVKS4+u2rdBuwC43w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101752689"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="101752689"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:07:32 -0700
X-CSE-ConnectionGUID: 5U3ns2lORgSwW4v6MhWHgQ==
X-CSE-MsgGUID: yuDJj5DjTTiFj06rbRUOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
 d="scan'208,217";a="275969174"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:07:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:07:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 01:07:31 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:07:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REEUMDuL9znmxUK9qkvri1FJ0MFPmT1BMPWXXZ5+YwQy4MotMEGst6uDmpBFpx90ciDNe+gjfX2XcHXIifKEtN71YAuZDE5RcT8wMbnfk7gwjE2kFNI1VYOhxx26WBJW6RwJJzXdYRlPboAd+nygfvF6cqQ2V3s3r6lrIoqS+AL0wtvs9i0wu3VIgTfBpeSShJ6j18414Z28V1r6E8xOEk+S4YkD2Xh+LMNoBtfNimuD+3WQLmEhWjEYiuvf/MZxVddda7a5VZnCUwh4SEs/ljllhc/l7EaYoJ8Fn8wDbBUAY6X0FUG5TY2PASBglZbZIc6A90jojYaQAsRZxzlW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JsG7T3Hi7LBs/wnglOUQG4A7A4vuinuiTXb6zFJ22g=;
 b=dC5oiYq7zj55fZj7MiMU3a1VOmTY2GJ/5zK4BT6qozoD38bBhRwR+NLc74XbHLhZdI1yX20AjpBZ1FQKRLfPCPNzUSwVVSyV5KxCJF+Yvi8WNEGkGIbeuacc+rvckZCxTfwIKBnX5C/OjZT9bF/gBwRumpzaqPuJRAmE7Ryw9BYOEW7zzy5GwodpPfQyS1OdAm8r8mY8vaHIj+DbtDkRpEHP4KlyhuHq2a6ES+bhsTXZb4oVOM2FSdSaJOS27IETZRbt1pAijfg5pPnwmS82pymVHwAz/GO1Cz2nwSppBjpSiGxS6OvgLsViCQYZhAfUBMV1WW8im0isMQC6Vb1zyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:07:28 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 08:07:28 +0000
Content-Type: multipart/alternative;
 boundary="------------TyvFVVp5K5vBoUxLRlq7VH0z"
Message-ID: <fdaaf967-a492-48d6-8a21-1456bacf36cf@intel.com>
Date: Thu, 1 Oct 2026 13:37:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] lib/igt_drm_netlink: add set_error_threshold
 command support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com>
 <999a0436-4e30-425b-b8df-62b752615b87@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <999a0436-4e30-425b-b8df-62b752615b87@intel.com>
X-ClientProxiedBy: MA5P287CA0327.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::6) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: b7240870-779a-4587-7a34-08df1f930916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|4143699003|3023799007|6133799003|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zHdzV+9CjPBufJ161S0Cn6MfQOPqGppyuaDRr9S6IFclMpvNZA05Fj9MaaY9oFlG4QfMzLEOJVTfugOo5IS8Ds1wiLqcS7Yc9rfRegQfapeGr5qVyEM2A6rzw5pcuTsn8B0pmBHtUNP2KURzfAN3tsPXwLEnLa3Dc9OFPYeTzSDDJY4hXprtZuc2tk8KrgammxpTFtXJ/TMXHldWxj8ZfsLGnhVz5mxswZkNXqA+qh29w1invV6uT8YhzmAKRdzglIAgBpcStCv0PnnZDIO+pxth6WzfzPEP5ti9kwIpXcIL0uUvmiNmTiWwJAajq+fpiWknI93+IXHK4vsTrvwFyJPFdEpdlKrYZ3fwqWGAWUr2P9S43eT9ri8Lcc3eMK7DDkt/MCOylSFErmwjIB3eFiV2ntjz6EMltn1T+KJ5nVIe0+kqWBeTYqFuSoPv+AL18lUh5HquK30ickT6ndXCRueev+ctvLKcb/sMcwbqO3skeJ+YOHH31vE8MpPC1+hjx9ZXB/+T7InM8fF9VzSGzywJFZE263o3vjJsc+JIMki40dulRxpvEeVxDJNGWqk+H6XuKkGFSdBS4Dbj9rvau2Y9UH7gwJNrsrLV3BKHMPTPQGWX61U9bKZHfum8YrET2ETeuTv2zs56kAbI4oi/Tk6iWdV1LHakuj1OUDGnY0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ay9nRjJHNDdrM1dncVJCOEFtSWk1TzU3VXc0SyszWVdBNFdRM3hkc083Z3Mz?=
 =?utf-8?B?MllNS3Y0UFpQcFhrb0xwVS9OOE9qUGtLV3cyUCtTVG1SSW5XZmh2Z05ESCt2?=
 =?utf-8?B?OU9PcHFwd1YrQTQ3NytsVWhRQ1pvN25yOWtEb25KeHl2QjhsOUllQUdQSmdM?=
 =?utf-8?B?RW5HdG9LSWdtVGtVQ1U1d0Vvd2JvS3dscTEwWnV5ZHB2cHpXRjgrajhRWEdz?=
 =?utf-8?B?YU1jQzJvdlh0WTYwaU0xQ2V3WGlKMGtwRFhwL21ZMGxIR3IxbWRkSUFvK2lS?=
 =?utf-8?B?OFFVOE0rYVhJZlpvWURSUEs4eGFnNXFUV2o0OTNKWHNSQ3A2UWZ3US84NTMr?=
 =?utf-8?B?WmpjaTdQUEZLaUxYaEdzcW5BbFJXWjUzVnA2UUExWHBaa3pJcVZvWXdmTjZO?=
 =?utf-8?B?V2ZYd2NEZVJ6M0xUeWJTSWhFRXZ0R0FaNm9VQlNYemtPZDBZMmpKNVZEdHhw?=
 =?utf-8?B?QjI3eEtXOFVFWWpoeWlyVE5qbndyeVlpZWpOZ0k5WElTbXczemhZeWRuL1Yw?=
 =?utf-8?B?WTYyN1pBS1RhZjRjNzFSMmZ5Sm1OZm9rRG5YNHkvUTMzV3JhZ3E2eXFZUkda?=
 =?utf-8?B?cmFsejJxaEJCSmFIMi81dVM1M1ZDNlhTY3F3KzIwaEJRMW9BbHhKbTY5RXRD?=
 =?utf-8?B?ZjdoRHhMSG1pQlE4U2ZMMVoydWhjUUh0UHA2TjlIcExtRVJtN0o1cjd0OUVr?=
 =?utf-8?B?UXhlYytySW5YM09OTTlmSk9MZkhJcDhsWldBQ2RyR1JsMUc5NUM5Qzdocjg3?=
 =?utf-8?B?ZFozYTk0MUFsRU5GVnBNLzZwb2Y1ZWtxM21zSFl3ajQ0VlpkQXRCejY2S1Z0?=
 =?utf-8?B?Mk9oektEd0tuKzQrc3ZCeWJObkhlTkxaQlV5bW93bzVuU3pwWFIyeEUxenov?=
 =?utf-8?B?NVRhMjg4YkZYRlVVWjdzT21WSlEzZjJFSEhJM0k4R0tQdmZxSDc5anJidVFF?=
 =?utf-8?B?VGRLLzBQZ2pmT3k4ZVVteE9Fa0E2cnlNSTNFbkowL09JMHhVM2l6MGR5QXBn?=
 =?utf-8?B?bXU3enkyQ2EvV1RVTXBpajliVmd1ZU5WT0dZYmpkbEJPcjc1TDJwemZZQXdM?=
 =?utf-8?B?Mk1zTmxrT0oxUWtXZS9jbExSYXFseGFUWkl6TjVzcjNqZjdVTE1pMkE0Qkdz?=
 =?utf-8?B?cTVZTk43cFRTUnpCTWRxT0pMM05TOUhFaTZSZzh0WlBIZ1gyek1lTnJqTlZP?=
 =?utf-8?B?VFZDNFk4cFo5Q1BpRUVFRERCQjBLemRLb2ZzU1c3eGEwQUVsRmt0TWpKa28z?=
 =?utf-8?B?a1RNUlJ5aVY5bzNEKzM0Slo5OHY1MkVZVHZoeHhTUW9INlNUS0k4UGF1R0M1?=
 =?utf-8?B?YkhrYktpVTMwbUVUVXlBZXNGVWJtdGNUcmtLMDg5QWdEV3NiYkpsWGRJMFJB?=
 =?utf-8?B?NitPRGl0VGFyazJwMkV6LzRjb29tQllBaHAxRjV2MXI3WUQxekRLZU5WNXF4?=
 =?utf-8?B?aUNmUmxSN0IvcVZNMWhxSlFWYkpwd2xMb0F2SjlxQmhnRHpmTFB4RDVwOGc0?=
 =?utf-8?B?bDhiclgwOTRZM0ViRlZiVnRLNWYxZlQxRnpjN1dXVXRNcW9VQ0R5Y1FVUmh3?=
 =?utf-8?B?VHh5VWxITHdpQ2YxTklCL2J0ak1oWHREdFVCekRkM3M3UkZqRzJHUUNqZmF0?=
 =?utf-8?B?ZElBM2lSNVpwNlRab2owT0hNU1UrSEJoZXlXTmllRGl3Mm5FdzEzQVM4cTdp?=
 =?utf-8?B?K0RSanRweGQyVzZYNWpqT2k3Mkd2MXZPeTAxbmFDQUlqUHM1TG9wL0YxeVgy?=
 =?utf-8?B?dGRxaC9JeGt2bVZZMy80OFJDUjNUT3V4REhDMXgzOWprdFdXTjRiR3FTZ0xY?=
 =?utf-8?B?WEljUUJCY1d2akdFSVJVTXlTRUVad3dEQkQycnIvU3UxdmRSVXQzR2VCQ1RF?=
 =?utf-8?B?NW5Rd1VKRFBZdTI4SndkbVFhTjcwYTRKUFY3RDZ5KzZKaDNDYlEyS2IzZS9u?=
 =?utf-8?B?eTdpeXdmbitzMXZoZXI4dE9GVzhvT1BhUGhDdmdaTlVUcW5LN0E3NW02M3BN?=
 =?utf-8?B?UzRPZHgwVTJEUnJjY1pqbHJvejV2SmVZUGRoMTBTS0J6SnNkYWd3ZndSZFJK?=
 =?utf-8?B?Z3U5NmpsNEV0QkxJYm5JVG9pbnJEdUJZRitXT1JseitZeVptRktKUGJVWDQ0?=
 =?utf-8?B?endTTEM5anpUWDFaYjkyeDJ2Mk5CQVl1MFdMM2N2V1R0UG1EVWZ4NW4xd0ti?=
 =?utf-8?B?aGdYaS94YngwM2ZnZ0p3VGQvRHd4bTUydy8yMmNEVzVJd0RSM3FtTVpBNXlN?=
 =?utf-8?B?R2VORyt0WDRjSUVNM0NaSWlqZVplcno1UEhYakpsK1VrY0JFR2pMTGM5Wmxa?=
 =?utf-8?B?UUlzdEpiVDN4YzFuRlZiNTFIQlVuUlNhVFMzbDBoRHNsQXlUM3hZVFlzUEpq?=
 =?utf-8?Q?GMURSa1ynSm4DkhpafXZFtq4ovtR4oORQWknf?=
X-Exchange-RoutingPolicyChecked: 0JGQ+dBNum+RGPMzPrq5hCvme/Yox7EvtwLwLiRt9c1zdjrgHNcVQDatk/U5R+EIYJzRhZTHK3Zu3Gqu1+Kv4JCGcbbRdN3sGap0/0sMjud+BX4VBhQ+O/SSDkCnM+6Agabj2O7r2UPUvv/5xIsTBY3li7DtXpjlzGlH+dRyRliX5XR5BX6BVeJ7udmtwTdxb09ApFwDVhA1h20jFuu7F46KxInz9Jktd/WJviJNHteQenBqw1a1r38nSaS4A4pObCTs1Akbbrn55UScnrM/oDJgu5WZtBdoqc02EusMNwmtySqHZUqvYazhPjz9V3PWp4//lZ03Ywo+G9ib9qv1Nw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7240870-779a-4587-7a34-08df1f930916
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:07:28.4234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ESMJL5L8A+RxmUedI22EZGsF+yaNUxwkKo0BrVkX5bcEH3+Pc8IkyQlbOsRKpMftT6nw8rdWI7EA4V4nShgW3od0GZ8rcDfdAosAu6MdwQwKj+c5jBsOVYnnpq0LSr0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
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

--------------TyvFVVp5K5vBoUxLRlq7VH0z
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-09-2026 17:18, Purkait, Soham wrote:
>
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Add support for SET_ERROR_THRESHOLD to set the custom error threshold
>> value
>>
>> Cc: Purkait Soham<soham.purkait@intel.com>
>> Cc: Riana Tauro<riana.tauro@intel.com>
>> Cc: Gupta Anshuman<anshuman.gupta@intel.com>
>> Cc: Jadav Raag<raag.jadav@intel.com>
>> Cc: Nilawar Badal<badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh<mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi<harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Marked this command as response not required
>> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>>     Jani & Kamil)
>> ---
>>   lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   lib/igt_drm_netlink.h |  1 +
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index 1be7d4361..c0e3aff9b 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -26,6 +26,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>>   	gnlh = nlmsg_data(nlh);
>>   
>>   	switch (gnlh->cmd) {
>> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>> +		break;
>>   	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>>   		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>>   
>> @@ -201,6 +203,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>>   	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>   		ctx->response_required = true;
>> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>>   		ret = nla_put_u32(msg,
>>   				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>>   				  ctx->node_id);
>> @@ -216,6 +219,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>>   			nlmsg_free(msg);
>>   			return ret;
>>   		}
>> +
>> +		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {
>
> For this command, better to validate it in the 
> "igt_drm_netlink_set_error_threshold" with error_threshold as a 
> parameter in the same function.
>
> Thanks, Soham

send_command() is the common function across multiple commands to 
prepare the message.

Here, if the command is DRM_RAS_CMD_SET_ERROR_THRESHOLD, then it adds 
the attribute DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD to the 
message otherwise not. it is part of preparing the message before 
sending. I feel that current location is appropriate for adding the 
threshold attribute by checking the set_error_threshold command.

Thanks,

Ravi Kishore K.

>> +			ret = nla_put_u32(msg,
>> +					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
>> +					  ctx->error_threshold);
>> +			if (ret < 0) {
>> +				nlmsg_free(msg);
>> +				return ret;
>> +			}
>> +		}
>>   		break;
>>   	default:
>>   		nlmsg_free(msg);
>> @@ -314,6 +327,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
>> +	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
>> +		igt_warn("Invalid error_threshold (%u) provided. "
>> +			 "error_threshold should be >= 1 and <= 16.\n",
>> +			 ctx->error_threshold);
>> +		return -EINVAL;
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -368,3 +389,21 @@ int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
>>   
>>   	return 0;
>>   }
>> +
>> +int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
>> +{
>> +	int ret;
>> +
>> +	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
>> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
>> +
>> +	return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index 89ef58243..9376e3dee 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -26,6 +26,7 @@ void igt_drm_netlink_cleanup(struct app_context *ctx);
>>   int igt_drm_netlink_init(struct app_context *ctx);
>>   int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>>   int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
>> +int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
>>   
>>   #endif /* IGT_DRM_NETLINK_H */
>>   
--------------TyvFVVp5K5vBoUxLRlq7VH0z
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-09-2026 17:18, Purkait, Soham
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:999a0436-4e30-425b-b8df-62b752615b87@intel.com">
      
      <p>Hi Ravi,</p>
      <div class="moz-cite-prefix">On 03-09-2026 13:03, Ravi Kishore
        Koppuravuri wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">Add support for SET_ERROR_THRESHOLD to set the custom error threshold
value

Cc: Purkait Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com" moz-do-not-send="true">&lt;soham.purkait@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com" moz-do-not-send="true">&lt;riana.tauro@intel.com&gt;</a>
Cc: Gupta Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com" moz-do-not-send="true">&lt;anshuman.gupta@intel.com&gt;</a>
Cc: Jadav Raag <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com" moz-do-not-send="true">&lt;raag.jadav@intel.com&gt;</a>
Cc: Nilawar Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Koujalagi Mallesh <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com" moz-do-not-send="true">&lt;mallesh.koujalagi@intel.com&gt;</a>
Cc: Harish Chegondi <a class="moz-txt-link-rfc2396E" href="mailto:harish.chegondi@intel.com" moz-do-not-send="true">&lt;harish.chegondi@intel.com&gt;</a>
Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com" moz-do-not-send="true">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
v2:Marked this command as response not required
v4:Renamed the library functions with prefix &quot;igt_drm_netlink_*&quot; (Nikula
   Jani &amp; Kamil)
---
 lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 1be7d4361..c0e3aff9b 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -26,6 +26,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	gnlh = nlmsg_data(nlh);
 
 	switch (gnlh-&gt;cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -201,6 +203,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx-&gt;response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx-&gt;node_id);
@@ -216,6 +219,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 			nlmsg_free(msg);
 			return ret;
 		}
+
+		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {</pre>
      </blockquote>
      <p>For this command, better to validate it in the
        &quot;igt_drm_netlink_set_error_threshold&quot; with&nbsp;<span style="white-space: pre-wrap">error_threshold as a parameter in the same function.</span></p>
      <span style="white-space: pre-wrap">Thanks,
Soham</span></blockquote>
    <p>send_command() is the common function across multiple commands to
      prepare the message.&nbsp;</p>
    <p>Here, if the command is DRM_RAS_CMD_SET_ERROR_THRESHOLD, then it
      adds the attribute DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD
      to the message otherwise not. it is part of preparing the message
      before sending. I feel that current location is appropriate for
      adding the threshold attribute by checking the set_error_threshold
      command.</p>
    <p>Thanks,</p>
    <p>Ravi Kishore K.</p>
    <blockquote type="cite" cite="mid:999a0436-4e30-425b-b8df-62b752615b87@intel.com">
      <blockquote type="cite" cite="mid:20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com">
        <pre wrap="" class="moz-quote-pre">+			ret = nla_put_u32(msg,
+					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+					  ctx-&gt;error_threshold);
+			if (ret &lt; 0) {
+				nlmsg_free(msg);
+				return ret;
+			}
+		}
 		break;
 	default:
 		nlmsg_free(msg);
@@ -314,6 +327,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 		return -EINVAL;
 	}
 
+	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &amp;&amp;
+	    (ctx-&gt;error_threshold &lt; 1 || ctx-&gt;error_threshold &gt; 16)) {
+		igt_warn(&quot;Invalid error_threshold (%u) provided. &quot;
+			 &quot;error_threshold should be &gt;= 1 and &lt;= 16.\n&quot;,
+			 ctx-&gt;error_threshold);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -368,3 +389,21 @@ int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	igt_debug(&quot;Set error threshold: node_id=%u error_id=%u threshold=%u\n&quot;,
+		  ctx-&gt;node_id, ctx-&gt;error_id, ctx-&gt;error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index 89ef58243..9376e3dee 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -26,6 +26,7 @@ void igt_drm_netlink_cleanup(struct app_context *ctx);
 int igt_drm_netlink_init(struct app_context *ctx);
 int igt_drm_netlink_get_error_counter(struct app_context *ctx);
 int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------TyvFVVp5K5vBoUxLRlq7VH0z--
