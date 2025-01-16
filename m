Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A47C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 10:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D0910E940;
	Thu, 16 Jan 2025 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knE6lGKQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C244510E93B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737023966; x=1768559966;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jsjj5adOWYOPcR24Bu2f+NnpiVwr6YMYr8jvIe49Wlw=;
 b=knE6lGKQ3PziQ87VELRpAupspTgHBJXqYANMRHM4nl+i/zn3rZgGSWGC
 Hj5d2/0JBcHR+8vpGBJA04m0gA2scy2Q+cx2tmRtQgYbB7ouHqFgficZF
 gQT8Hvynl6H5uis7h1+/4PUrSjy6EITOue8CqIvxr6Kn5WBjAkgAr+Y0v
 R5JVDnTCWBw6xIzv/ihHnTN20ksy9uH/tivYQ+T/NIF2WYJCwPPj05VhO
 z0saWxVYrv7RXrxyrxNr6qQDVpk1z18DcDlDtLjqaD4dMfuwjYc5ceGLY
 ngEFQJT3mVtlBksHzq5B29mvqNZAYSvNqgwguTd9+yWOkM5WAL6SxtuCC A==;
X-CSE-ConnectionGUID: QNv3F62HTbKJKIZ1/VZntw==
X-CSE-MsgGUID: 6ANQ0+elQzu+jR0xDvUUEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36612444"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="36612444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 02:39:26 -0800
X-CSE-ConnectionGUID: t5lBktbwQCK9VmWwj6Ydsw==
X-CSE-MsgGUID: 6yXD1vVfSVi9kXlh73CyaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="110423917"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 02:39:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 02:39:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 02:39:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 02:39:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlFxw5JnObkNNoLJD+LLlgj6i7bLkot96snw08i51qSpxEImoK9XLooxBHkLKn/jOZu7QTvnmM1MjlRXDG1wd6DpNsFdnPVkFXRK+MEw7tUVoK8tKEiI53M4pXpVaA+LAAiT9BnKXJAWvcS3Q4hgomuKDLWxQRw4IqB6WX7NREKbn0EzorMpWoSdOG7XYqUi2eQZxFASsT0DkWEzLX15emGgIB/BzCP9EY45NJI7pUCc6lgbtmzcT57a+LHp7XX9+IsoqXWI1PqMX1qGvvgRHRDa3kQHdkAhc7CwjJiQMirQHkJghmW0Kzih6+w6G8jA4NopJh7aSyDVXbo0m8hcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1YMuDfTUUfLb16s1Okq0X5xZ1M8zhDi1maR9QT8bI8=;
 b=XVDZFNqnbBMaZuSr2kj0zWj/9k+wvjPmG3HmK6KGeZFzYPnSVRuLCDMIU4IWkUDUfz388I7ugT11YIai06uWCKbKp2yN2rlUCQs31lJQW+Quh7DVDKdJL4+jx73CYfaVsfsd5d4Cb2zLh7Se1PylK1oVTwJspHxV3GqeUNyGqdIfpelR0Pb4JKVD1JUVRWLdYOz2wv4m8HIUf745T5wCXookjxD7KOOKUTvTDmeF54QCECsB7sAB0HTabgWr19RmG8U/5vGge4vGQCJUy40rG+SlftMYDOxZuKauDezoLZjEr0y/sXlaAcsuJCo90oWP+a5P70H2TBn60SrL7octjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 10:39:24 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 10:39:23 +0000
Message-ID: <0dfb0496-b46c-4bca-ab6a-3d11afbd1ac6@intel.com>
Date: Thu, 16 Jan 2025 16:09:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/chamelium/kms_chamelium_color: force connector
 reprobe after plugging ports
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250115151507.2023293-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250115151507.2023293-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a04d21-78ea-4485-dd94-08dd361a0ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enlUMlFJcy9GNU1mSUl5c2FicWQ4aVZzczliVW9UM3p5S2crdzBKcDJSN3Ra?=
 =?utf-8?B?a2dSWFE1Y3Z3Rk1nWjlQK21kdUtDT29rdHdqVEJLek10czEyQXlmSlJnT1M2?=
 =?utf-8?B?VTJ3R0RZVXBKMmJOei9ZVUx6RXhHZDRBNjdFbzFrL250MS9VakI3YkJvRDdE?=
 =?utf-8?B?TzZlVFdqOXdQbHVLQkFOdFVpV0dHQUVpQ0dseWUrK0c2WG93ZGRJWjk2UXQz?=
 =?utf-8?B?WVZwRXd2TjgrSnlFWFIvaTZOY1N0a25OSUluSjJjaXZVOC81bDQvLzJuaXJm?=
 =?utf-8?B?MjEya0t5ZWZwS2xuZWNnNWlkdERZWDd6cEZPWFQ2V0dhaXIyYm52cGhIOEVo?=
 =?utf-8?B?eHhnd0tsdllKamo0NG85Q01oUGg5T3M4bTJnMUp2c1R4VWVIblVWdGdBY1lV?=
 =?utf-8?B?TFVBcjBYNFZpYnZNbjkzTEdhY1FFSjZNMUtVMkF1ZUE0UVBwWVhEa3RkLzla?=
 =?utf-8?B?VVROTTBMbmhHa0o2QmRVQTdBVmd2Yytpa3ljbnBheklkME1KMW1xdGo3dWpQ?=
 =?utf-8?B?anVUQUJ1UHl2TEZEV2V1ZkhNWkV1Y1NKOUFTWmEwVmRaaUZFemh0QnNxUi9i?=
 =?utf-8?B?S0NQUGhJZ1pNRUI4ZEkwNEFSQi9VelZTaGMzcUN3ZDZQOUpMeVpwSzF1NjZ0?=
 =?utf-8?B?bCtmVW1BaXFVRzFNUDVoRkNZVHY3VVR4MjRqRnVFV3N4cWF1ZWViaW93Umla?=
 =?utf-8?B?VFFOL0xTZE5JSFZaSEFqTDNLQTVvRzFERHlUeStjekFLYXFNTFBIdFg3MG9Q?=
 =?utf-8?B?RXIxbGFzcVdtUUZEVFFJcC85ZWRmNjltUTFxbkFHR3dHZCtvcHFQWFRVdDQ4?=
 =?utf-8?B?aXgweXNRdENnc0wzaFppS3doV2cwV0Z4UHJJZXg3dEw5M0V3c3M1VHF2ajhv?=
 =?utf-8?B?S052a3JpQ3hab2FaQlMrSzNxOGpXRVhOR1NsUlZ4Q3BnWk4zRXR1R0NJWGEy?=
 =?utf-8?B?aUIrR2lucmFaaE9BazBqclZybSs0M3VqM280Y0djengwUUQzVnNiajlON012?=
 =?utf-8?B?REtzQ1EyQU00ZlUvdFFySVB4TFNRengrL3lIRStKcmhGNUV1TWRxVmVjb0kx?=
 =?utf-8?B?N3pMWThEaXFUR0RqOFdaUFE2c2VFcjZ6bnVWK1JvdGNBWnpZSWtBZml2a3c0?=
 =?utf-8?B?Z0FPeElyUExpaFVpZklUTEo2SUZaQkZPVEdlUUtWSkg3UHdodTFDWEY1THNO?=
 =?utf-8?B?bTRBeTB6YzZicW5sa1hDM01EbUNKUnZPYm5nK2VlcWY5UStGdlJpSkJxRWlj?=
 =?utf-8?B?YTZ1dWp3UkZzY3k4YUI4dEhqZ3hGelFRNUJxNWZLdmhvV3Y3WTVmUzJBa2JO?=
 =?utf-8?B?MStCNTlPTWZuTmZDemVUeWxsVUhGOFgrZkQyRW10R2E3RlBILzhXYysxS0cw?=
 =?utf-8?B?Q3ZuZC8rTkQ5RWxDUnBBYlJ5NTJZUTF5S1JJblk4c2pESjM2QWpvVmFhQ0do?=
 =?utf-8?B?c1VQS3p1dnB3U0Q3Q1FYOUZzVXl5NlUxUDFqMnV0TTNCL1VXREQ5Q25CZjBw?=
 =?utf-8?B?aDJUZVVJSWtwN2hoNlVkcHNYYy8xTFJta0JFamhES0oxYSs1YmtITXNXUkdH?=
 =?utf-8?B?aDlqTG45cUlWQTdmczRtczNXa2Q1Z2Z0dnYrZTFZVGNZM3JpaFZTcWFBSUgx?=
 =?utf-8?B?UmxlcTBuUk1MZE1uam55dHNYZE5SY3BTK25HQTNCV2FYZU1walRUNlBucnE4?=
 =?utf-8?B?L25SeERhK3RSS0d2bHg4bzRxak1SWERmVHIxRmhkZUd0dnlEOERURTNSL21z?=
 =?utf-8?B?c1BmdGUvZ0RyZFpHQThnS2RQT04vYWFUU2Z1VkxQbHlCcDFwZ0h5QnJlc3pm?=
 =?utf-8?B?Q0ZxSG1oQmlqejVuYnA1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alVJbnRITnhzL0lzMFVxak9LOGJnYVZrYzJGTzVMT2IvZjJpNWN0Z0VFSjFS?=
 =?utf-8?B?dkxhNkRBNHdPelRTd1p4d3Q3ZkJGQjVJcHE4aXZwalJEUmNVYm41aDIvR0xU?=
 =?utf-8?B?cFBlNWROall2T2lqKzMvKzFGN3hRVEwzTWErREJWdlFpK09RMlRud09Uc3A3?=
 =?utf-8?B?TWc1YTZpS0RMaFZsZFFLL0NYdkFJSW5PQURlaUhwa0RYRWc5U3BVcHgzTUNH?=
 =?utf-8?B?SkhBandJZjBpYXJiajBGSWJ1Z1BUZkdPa0tOMGpyVHBZMDJ6KzV1UTJFcjhG?=
 =?utf-8?B?d2pQekNXS1czVzE1YjdKakZMdkNaQjFJTzBmb1NkV0pxK0ZnaktReWkxbkY4?=
 =?utf-8?B?U1R0elpWaE80cjB6dyt5bHN5dCtsNTYxbEs4SkJZSldEdFJpck9tYkpRczUv?=
 =?utf-8?B?bVk1c3UwdmVKemJhVFVBUnRBdW5Ha2lNQjRiQld0OGprWjFXQXBhUU4vS2JC?=
 =?utf-8?B?WG5RR09NSW9mcTUyZkl5TDZ3WW1YYXNXSGNQdlk0ZWFCdkNBV0g0SXY2dlBR?=
 =?utf-8?B?WWxFakhLNUFnYWIyS3RldmU4VXNjZUZUOCtrS3hDSWJXSXBoZ1NYVnN0dWxq?=
 =?utf-8?B?aStrU1oxM0ZOaVhUUnRxbUtmVVhJZ0tJVTdwOEFsRGNYbElIc2graWFHUHhZ?=
 =?utf-8?B?TDZSSnlzeEduRVRNanpuWnFVd0J2dGhJMFR3STFEdm9yQ3EyWUpjR2VEZFpv?=
 =?utf-8?B?S1VTY1hSZ253bytTd1dielh4OEsxd05tK0RHS1lwd2lSQVV1WnFxZWVucklN?=
 =?utf-8?B?VWVpL0JFWHZDR1RHY0RwbGJzR3FBdlFsa2kxdU5PR09NdFVxdDBjNHhMN09Q?=
 =?utf-8?B?cGo0MDUvOWZxSjAweFFMMzZvY1JCbGc4Uis1ZjNidGMwTDc3UWRFSEFxV1Rq?=
 =?utf-8?B?cDRNMER3VWxpNHUxQVpra3RIRkdjVW8xWW9FaXpnaUM0NlFkb3BKMU5heTZ1?=
 =?utf-8?B?VThMQVRZTTcxM0pKRXUxUnByUEp5UWFldStoRE5ZamtzRGpDaDl4T09Kd09r?=
 =?utf-8?B?anBNZFFpNW80eTFLcWN5NTBIU243VzVTenMwczl1WUhvUHlZaGx4dFNHZ1Rz?=
 =?utf-8?B?OVp5eUdRdUtzSHNvRkVDbW1oT1JEazNiMEZOMXR5ZE5ONm9ycG94c0g4eSt4?=
 =?utf-8?B?amFQbDYvTHppZlpSaUV3UG9MWG04ZGVXTm9YNXZkS09XSC9KaVJuU0pJbGF2?=
 =?utf-8?B?V0hUTDczY0xuRXlsUUQzRkJIVWpKT2pzbGJKRERHdFBJUWhaZjltU1Y3cVVo?=
 =?utf-8?B?UkY0TU9La2x0dkJWRWlSdW1hanhUK3pwb01EU2d4WU1ZRWMrMkM1RFVSeXY2?=
 =?utf-8?B?WTllUnRHMHFPKzZpVmNNa3NhQTZhUFlzekdSQWYyMVpIK1V6U3M0V0ZUUGlo?=
 =?utf-8?B?T3FSaU04L0dnZ3ROc216NkFXRFdrdUZjK1ZqaGhLVnFTTDA3eUdsTHNWTUZK?=
 =?utf-8?B?SEFVL1dSd3pWbStPOEdseVNpOEZDekdPSlRHSVZvaWRLSERrKytKb1ljQVE4?=
 =?utf-8?B?TFM2MUhvbmhpUERxa0gwL3A1aGlUSjNFT3NJREp4L1haeCtlcnQvdFROMDdJ?=
 =?utf-8?B?U0pWcC9iRGlsZUxHQmVUVEJIVmVUYndCTDdKcXVmZVl0VDR4T3VnM3dtank4?=
 =?utf-8?B?Mm1mRktMZ0Q0TkJTTGNhQWtnOE5PYWFGQ25kcW5WcUxXUE9kaEFRK3VLT3dO?=
 =?utf-8?B?d2JxaGd3RndRZ2dtUU5icjA0NE8vZDFUZmtneGJ0VTBOU24ycnRvU1ZxZ0FQ?=
 =?utf-8?B?UmFjYXRGUzF0U3NkVVpOeVkyNFM3Y2ErV01DZDdHYUVzMWR4ZG1naXpGWWxR?=
 =?utf-8?B?bi91ak4zSXp1anZJdmgycEF0VG1ZUlhXK1ozN0d6UHZHOFdnOG94MmdxYndj?=
 =?utf-8?B?RU82aGI1TGJWem1sZjAvSGJyKzd6dHdQYXU3djd0aDRUcFhXNzR4T3RJM2p1?=
 =?utf-8?B?Tm10MXI5aDJLUVcyR1JST1M2NXRoWENraWV6SWxVS2dCODUzanpiZmVXdnoy?=
 =?utf-8?B?c08xbHh6ZGZPK3JabUwvYWROUDBrZ294eXVkendGS1NseVZpd2pNRG9yUVZz?=
 =?utf-8?B?L1JjdW1vRDBxVWR0aGgrczVkS2NiRVRoUTIxY2JVSjQ2ZXNuTUxHVzgvanpZ?=
 =?utf-8?B?M3FIUDJ1bnNKd0hrbkN3VHZjYlBzQU8rb0xoYmxyRlpIT0ZmcUY5TCtiMkFB?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a04d21-78ea-4485-dd94-08dd361a0ae8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:39:23.8683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSpiJlvxE9JDBAW8R9NL8KG2o2w5Cmxo0aqbKDRbacYyPw/tDumfi/jTk6+TFSVb+F7fVLZi6q994RwL+mBjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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

Hi Kunal,

On 15-01-2025 08:45 pm, Kunal Joshi wrote:
> Force reprobe connector status after plugging to assure
> we always have DRM_MODE_CONNECTED status for the connector
> before proceding with the test.
>
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2371
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_chamelium_color.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index 5550cec22..7c88c022c 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -749,8 +749,13 @@ igt_main
>   		 * discovered ports, just incase they are not plugged
>   		 * we currently skip in test_setup
>   		 */
> -		for( i = 0; i < data.port_count; i++)
> +		for (i = 0; i < data.port_count; i++) {
>   			chamelium_plug(data.chamelium, data.ports[i]);
> +			igt_assert_f(chamelium_reprobe_connector(&data.display,
> +								 data.chamelium,
> +								 data.ports[i]) == DRM_MODE_CONNECTED,
> +								 "Output not connected\n");

Please add output name in print message. With this fixed.

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

> +		}
>   
>   		kmstest_set_vt_graphics_mode();
>   	}
