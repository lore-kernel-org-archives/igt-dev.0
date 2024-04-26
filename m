Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55107C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 03:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D8811A9C8;
	Fri, 26 Apr 2024 03:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdsEPdMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D319B11A9C8
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 03:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714103086; x=1745639086;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VnE9qsp123sbrdFQmVonBsrsV9qe6y/mQzXaddaiBbc=;
 b=CdsEPdMiOu03bq79vHV+UsLkG5Vv1KCoQx9PYBKe54B5oNOlEBWpiTQG
 jzdNTCMrA4/+vP4LpeSYddLLI6dJ8xcVHH+pS1ENSSgfRqsUr4bPc2D+J
 1Tam5aSAIpjn7MhzMKRMXSn8qptYR4IiNEt4sCHgtec8IzMA1tKtvrO++
 IDOHjxEHzByDqQFXyq1lriRazooim/VK9JW9MEmZxJGtNQ3Jyx7EKBx9/
 z2Uoc85yEh67Bla6xHUGUeYmpHx+nx36txDahJL/HIuioXcnlH6nw4qo4
 TeNB1ZDKxNx4pTBP64o3zHQISI3d7V7jlkyNDzPsKcVeLR+BlGTVTbhsA A==;
X-CSE-ConnectionGUID: dTblFObvTgqka9lLWUNO5A==
X-CSE-MsgGUID: 8mVXYWfHTVOSim8g13SnuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21248712"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="21248712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 20:44:44 -0700
X-CSE-ConnectionGUID: LXzyTbqKSlC/M5xYnC1zgA==
X-CSE-MsgGUID: T7ELuxfsRvOUB0eJaNkU4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="30103236"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 20:44:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 20:44:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 20:44:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 20:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4JLcKZw4dnq5Tkn5TFYIpuU7/QHhDj6GInQk/TVvPS24i1uNntA2X9s5gnyy/oX8gmoF0V/wQ7p+TItIInV2Bs0VFZ7XgdavWshZTbTkf0PhL/rdSCr/QYSUtKakZb3Ex2oGKvScbHhO458q2gmOZf3UTcQAX+70edf9O4sKKKOrQyayuPbSRoWryMgibvFXZn291v68Ocp754q09t/TQiqC3bPJki46ZgEWJfYak4u+AuhIvXWNsr5Lh3UATazB8O54ajM3peTsH+Tt5oZ7ggUjkezQveoBiqa9fS0SHVNXMfOzUGTESMe274vrYKCZzVSW4c4rf3aYhKEZ43WRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCSwRZ2OsCg7Wz3U1YN/C9APa4VEX6/oE+a9GIAeMWg=;
 b=I70Kb+mv1+IJyhj2iCemCizmcYa1BW9+34329gZJ+tbPdeKvxDcbXzI0g2tw3uQi8cjXQfBADRTKy0G78G2GozN8acrfsK1d4Cweow/sbZdVTg0SSuJSBXwLmWDVm3lPGDI+mzy9rb7wRR8j1idWmU3Hc+x8rIoaTJ5z23kqRCpxxJH6wuqtvXtCudcJMKgtkR6xfaXp6l7BqkUS3ciRRv7E4c02jg2tzKjZURgXp4Cvg6qhgzd+DEHKNV34F3505vQhAiuAHxRNojkwfE3wnyKwrn0T5rLRUv8CpBwLZb9b5OarKrMRQPbtd85/VH4sdSHn2FZGYZKPXAScdLFhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.20; Fri, 26 Apr 2024 03:44:36 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 03:44:36 +0000
Message-ID: <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
Date: Fri, 26 Apr 2024 09:14:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
To: Manasi Navare <navaremanasi@chromium.org>
CC: <igt-dev@lists.freedesktop.org>, Drew Davenport <ddavenport@chromium.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Sean Paul
 <seanpaul@chromium.org>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
 <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH8PR11MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acb4c7c-f396-4ad6-173e-08dc65a3317f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVNwcVdXT0x2NFRBOGQ5QlRLNjF2WEJURXY3bVJ6R0syakwvcXhCSUpxVndm?=
 =?utf-8?B?TVJUWkt0UDRvYlQ1dlhqeGtta3Z1b2NXeHliOFdVK1loV25ueWI5VmhuMGs2?=
 =?utf-8?B?NEFFTW5EZzFOZytNWWFvbldxRVBHYnpySTFQV3k5MmhtSU1PSFlRODNLVlV3?=
 =?utf-8?B?b0JSN3IyVGZRb0t5aDVPMTE5K1JnTENLa2lTajNkamd0bDZyOE0rUkVZdllS?=
 =?utf-8?B?RFBncjkzSW9JYVRqbW8yN2t1Z08vN0VKN3Y4eDRHdFhDcVd2UDZpeXg1a1A5?=
 =?utf-8?B?bXEveTA4NGYyc2xXeUNvTzE5dEFxVHlhcVJQZDZ4MGlkbUJxT3pjWERkWDk2?=
 =?utf-8?B?SDc2ZVJyM1dtcENlTzdVakRvWkRqNC9oTFp5TzZ4UzNlcXorNGdnYWNvNzlO?=
 =?utf-8?B?aC9UTHdJOTFKSlNiazIrVkpxVUExVVo0MUh3MEdhWGJCWXp3VlJYL3dZWng4?=
 =?utf-8?B?UDFaUkw3d1ltUGlCa1Zld0FiR0k2citqL1crUFZRa0sxUEhGMHpNdGxCZG9V?=
 =?utf-8?B?aFVxeUE5SnQzNkExcFZhVnF3dkIvMFRuQjdJK0ZOSWx5Y1lLRGtmTU9lYmhl?=
 =?utf-8?B?dVR2YUFuQmN3aEEzZzBmeC9iY2l3RFczRVUzVEw1dUtDK0hZUWNkY0V2QXBE?=
 =?utf-8?B?WGwxZFoyZ0puWHRRcUxDK3Q3TDc1SjVSZm1PYWhyVFo2YndqK21GUnpOWHk2?=
 =?utf-8?B?aFJhZDNWSHF6SnRJd2k5N0g1c1dyRFdmQmVWczltV1RJV1VQT2JPUU85OTNv?=
 =?utf-8?B?L2c4QTE3ZE1TMWUra3VvTVptcnNmaTM4Mmx2ZmRCNk9pSCtDN3hpSTdnQngx?=
 =?utf-8?B?UjZVRjcyRlNiWUh1bjZpbTc2UkYxVGtrYnlhdGpTTjQ1K0FydVBYbFJndkdo?=
 =?utf-8?B?RCs0WEpBdldwNGFKbzh3Nnd2bGk5aHBOU3dVSkorTjl1V1R1RTZPVU5qY3du?=
 =?utf-8?B?ajk1T1owWDM2K2x3eUlVYkxFNTZkZUlENWU5aTVOTU9ySXJ0c0tzYUFrRHFu?=
 =?utf-8?B?cFo4ZlNDUWNaQ29zOGIvOUU1V3Foa3ZGbFl5emxaUFJXV2xwTjArTTk2NmxR?=
 =?utf-8?B?UmVMSUJiYzA2Zk05Vk42c2hVU3ZaOFlyUnQ4ZjVRT3JhSGRNWmx2WWJ1djJN?=
 =?utf-8?B?N3VlNndVMXV3aFA2VGl6U1ZIL1VHK2RnU04yaDJURUlGblU2OTdWZWRKcWxF?=
 =?utf-8?B?dkwzdkJxZTRpdnJBanMvcDdhYUQraWdnWXZaaTc5N05LV2FWbWpkaFN6VWNI?=
 =?utf-8?B?WFpZd1pwbTdwYU92UGNocnVrZUhXeC9sRlRSYUNuS3RBSFlUd0pNY20xbEJO?=
 =?utf-8?B?a1hGQUhNbW9YMXNWSElNQjhpaVNvM0RmYWcwZU1Zb0MrYnBMR1RpbnppT1dP?=
 =?utf-8?B?UTdZSWoydjJab3FIZ2RsSXBVcHhvNlcxaWtCVldwQmIvVjRkTFo0VmxlSzAv?=
 =?utf-8?B?elBjZGRITWhzVU9nUEQwQnVUWnBwMUdoaitZZTZ0MXkzWGRzdTBVUVlHYVhQ?=
 =?utf-8?B?MC9yVXNtZWlDblZ6aXVrVXN2ZWFDNHVsY0lHRUNRTnA5WXo4SE9QT3BNdlFY?=
 =?utf-8?B?ZktiUGIvUXRsSmdZNm9lR2RwdGJ6MmhRMDRUVEVVcmErVnQ0Q0EyNlgvci8y?=
 =?utf-8?Q?Aoa8TQ8YTQs1B4p/tvybbyLM/ut7cJc45kOYJvGQ4DhE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHhSZTZ5T1lNcU9KRjI2SXkxNnc5NUp2YzllZEVSL1gwOUZNSmE1cFJpNXBw?=
 =?utf-8?B?c29PQmNUamdGOUFRWjM5ckNFR3A1VWdkL1p0eTBHeWxNNkxjSHI3eExTaVRl?=
 =?utf-8?B?dE1SdXNHQXFOTWlMUk4rRTFXTzV6WHFjSWpVOVc0RXdwWWMrbU1VdDBQQllj?=
 =?utf-8?B?ZTN5V1locWVQbjZBVEpDZ3FVcWV1R3dpNngzV2d3SzYwZUNubGtVMUtQRzlH?=
 =?utf-8?B?dWlxczl0QitTdHZGUXhRaXhFajBucUVYMWtVMmNlUTY3QXhoOXc4cXdsLzVZ?=
 =?utf-8?B?UVhqbjYzVTBMNWs2Y1ExUjBkUnZkZTgyMU1lS2tKRjhycFhNNW40RkRadFM3?=
 =?utf-8?B?ZlZNc0JENzJmejhaZEQ0d3RIb1IyNDNFRVZGNVFiNmJLeW9vNDRkOWVyM0Fr?=
 =?utf-8?B?cFQ4L3I5WEFHV25PSGp6QnlsU0VrVHR3STgxK3RWcWJ5L05mRlUwVlhYRVRj?=
 =?utf-8?B?eGluVjBuYnFkMnNvNVE1aUZvZXR3WjkwYk9sVFM5RkVaRWYxa2Rod3Zjdisr?=
 =?utf-8?B?b0VUUWdOSlRlQkNjYytWemJSZVFjMGR0WEI4T3J5R1FCZzFOOEx5dUhwanBM?=
 =?utf-8?B?QnZqeGJlTnJHc0l2Y2xkYkZnbHhXYy9sUHZKL0FyUXNCeFlOOVpqV0xtWGZW?=
 =?utf-8?B?VHI1bVFHSjdrWTZjWkpkRUZmRGM0UmJHUktIN0lGWTBEYTl1NGxGZTNvSUEx?=
 =?utf-8?B?U0pRSTc1d2tOTVJoV0FLTnFRalZhcTErQkJFcDExQUNZakJ6bE9EemRORGRy?=
 =?utf-8?B?YlBaRlA2WHJ4Yi9CeWVFWW5VZ0Nrbm4rVm9pbk02em8xMThZNW5WNUxTSlRs?=
 =?utf-8?B?d25UdkQxZ1dPZEJDQjhzNjBTUzFldDBKWDlMQkp0SDFMRUJzVHRidko4SDkx?=
 =?utf-8?B?eHRZRW1FRVJqUStEL0M5cTBWd1M3VHNlV0RQbEJGcGFUakhHK2tRRFUxNnpy?=
 =?utf-8?B?bS8yakxlOE9xLzBMNzA0SE1aUWx0ODVHY2VpVTRwc2NWK2RjeDBVSVFSMDQ2?=
 =?utf-8?B?M24wYzdLOUcvREpzVTBXMXdmNDFGU1UrMWhIZFUzc2Vocy9qSnlCQTYySy96?=
 =?utf-8?B?NW5NOS9zNEIyL2lFZDFxM1FKa29WWGJNalJNOGFmMDhXcmtiaFBDcXl4N0R0?=
 =?utf-8?B?K05YcEN0M0l2SXdxckZkVzh0TUJ3NHdYekJuN2RXNmRVUURwZVh5RDJ5WFNx?=
 =?utf-8?B?MkNObyt4di9SZ0ZMUjJKOFp1L3pKdCtNWmtLc2kvZzF0c0NBb0krQTBiZ3Mr?=
 =?utf-8?B?RzIwUDBSM0hXTitLZHdDUC9WUWRDLzJSSmJuemR0N2ZOcWRCdTFzdzNuQkhW?=
 =?utf-8?B?Z0F0NGlnMWNON0xOU0dXNnBSNWZ0SHBrNWI2L203NnU0c2F6YVVjNzdqM0hV?=
 =?utf-8?B?U0tvTzJINlg5dEp4VDZGQ1MvTFJMRldpSUVtUFpLNzE1YWowWVFWMGlkbmE3?=
 =?utf-8?B?M1FhQitJcFdwQXBZWUNlRFN1KzFSS2NpZ1g2T252VmgyS2FTbnc3TXVNOWJR?=
 =?utf-8?B?VDdiSDVzQVBidzhnUlcwdW5mK3ZldzV1NTFBK29jR1FFcG5XMmpuZFNkYmU0?=
 =?utf-8?B?OXJlV01PUDJFNXRER2wxdDZxQkIyV1FMNTF1U1VjQXY1VnNMcGwveWVwUFQ1?=
 =?utf-8?B?R09jWkdYcDNPblVZWXlEZ0xyeUlrcmJyM1BkWUpvWXFpWnNhdlRMRmFSVWZ5?=
 =?utf-8?B?YzUwUUg0Vkw5VHZqRGJkajRqVTMvK1Yya0xwMkxROUtTVWJPcS9UY1lYczVB?=
 =?utf-8?B?UDltUzEra1d0RXBkSlUwUVhRMkMrNURqeWdrcUxkQ0ZicWJ3K0RXdnplaFhq?=
 =?utf-8?B?T3h5TkxnSFlmeG5BKzJTSGpaWGJJNGFxOXFVSVNMSWRjMW5PRkhJU1B1dFZN?=
 =?utf-8?B?YldQYVBEME9WWk1CZENBdUIxdWR2a3NoWU50TnBTNFBzMU5ZSWhGQ01QZTFn?=
 =?utf-8?B?cXd1aEkrWHNwQXVZNDFscFVFV0U1aHllT1VoaGdJQk4rQnZpQ1dhZWJhYWtK?=
 =?utf-8?B?dUpZSndOT3RDWXdscWVuaHo2dytqNUJrR1A1cVFRaldFbHJrRVpNRVJxMnl3?=
 =?utf-8?B?cW44QkZBSWlkOG5kTGU2NVJJTDJEWG0yOG56aFNpQWQ5QzdxcXhLRk9RVE56?=
 =?utf-8?B?ZHR5UHZKVDJoRUlrVy9EOWlOcE1JcHFTMXNaeXQ2dlYxakxkN01zSXBpd3BI?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acb4c7c-f396-4ad6-173e-08dc65a3317f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 03:44:36.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3biqYTtjpB5qg2uFoBUkhWVaIdbGSG43tLquCASSU0miroirEfIWzNsVlIxd4r96FqOt/gxAZeO2KJXEB9tCpVgeI3Wf+hHCrASWIpOnTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
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

Hi Manasi,

On 25-04-2024 08:50 pm, Manasi Navare wrote:
> Hi Bhanu,
> 
> Thanks for the review.
> This is not specific to edp, it applies to all connectors.
> 
> If the BAT results look okay and I have your r-b, could we get this merged?

Looks, BAT results are not OK to me.

The newly added test is getting skip on VRR configs:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11065/bat-all.html?testfilter=kms_vrr&hosts=bat-adlp-6%7Cbat-adlp-9%7Cbat-rpls-4%7Cbat-adls-6

- Bhanu

> 
> Regards
> Manasi
> 
> On Thu, Apr 25, 2024 at 12:39 AM Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com> wrote:
>>
>> Hi Manasi,
>>
>> On 25-04-2024 01:43 am, Manasi Navare wrote:
>>> This subtest validates LRR fastset functionality by testing seamless switching
>>> without full modeset to any of the virtual LRR mode within VRR range.
>>> Here we start from highest refresh rate mode and then switch to virtual LRR
>>> modes in the steps of 10Hz within the VRR range.
>>>
>>> This is used to test the LRR fastset functionality of the driver.
>>>
>>> v5:
>>> - Pass a reference to flip_and_measure (bhanu)
>>> - Add a new line between between declaration and code logic
>>>
>>> v4:
>>> - Change the test name to align with drrs/vrr tests (Bhanu)
>>> - Fix some build warnings due to rebase
>>> - Use a local virtual_mode variable
>>>
>>> v3:
>>> - Fix build error due to rebase (Manasi)
>>>
>>> Cc: Drew Davenport <ddavenport@chromium.org>
>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Cc: Sean Paul <seanpaul@chromium.org>
>>> Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
>>> ---
>>>    tests/kms_vrr.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++---
>>>    1 file changed, 69 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
>>> index 15c62b34b..7f64d6806 100644
>>> --- a/tests/kms_vrr.c
>>> +++ b/tests/kms_vrr.c
>>> @@ -66,6 +66,11 @@
>>>     * Description: Test to switch RR seamlessly without modeset.
>>>     * Functionality: adaptive_sync, drrs
>>>     *
>>> + * SUBTEST: seamless-rr-switch-virtual
>>> + * Description: Test to create a Virtual Mode in VRR range and switch to it
>>> + *           without a full modeset.
>>> + * Functionality: LRR
>>> + *
>>>     * SUBTEST: max-min
>>>     * Description: Oscillates between highest and lowest refresh each frame for
>>>     *              manual flicker profiling
>>> @@ -89,9 +94,10 @@ enum {
>>>        TEST_FLIPLINE = 1 << 3,
>>>        TEST_SEAMLESS_VRR = 1 << 4,
>>>        TEST_SEAMLESS_DRRS = 1 << 5,
>>> -     TEST_FASTSET = 1 << 6,
>>> -     TEST_MAXMIN = 1 << 7,
>>> -     TEST_NEGATIVE = 1 << 8,
>>> +     TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
>>> +     TEST_FASTSET = 1 << 7,
>>> +     TEST_MAXMIN = 1 << 8,
>>> +     TEST_NEGATIVE = 1 << 9,
>>>    };
>>>
>>>    enum {
>>> @@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>>>        return mode;
>>>    }
>>>
>>> +static drmModeModeInfo
>>> +virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
>>> +{
>>> +     drmModeModeInfo mode = *igt_output_get_mode(output);
>>> +     uint64_t clock_hz = mode.clock * 1000;
>>> +
>>> +     mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
>>> +     mode.vrefresh = virtual_refresh_rate;
>>> +
>>> +     return mode;
>>> +}
>>> +
>>>    /* Read min and max vrr range from the connector debugfs. */
>>>    static range_t
>>>    get_vrr_range(data_t *data, igt_output_t *output)
>>> @@ -641,6 +659,49 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
>>>                     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
>>>    }
>>>
>>> +static void
>>> +test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>>> +{
>>> +     uint32_t result;
>>> +     unsigned int vrefresh;
>>> +     uint64_t rate[] = {0};
>>> +
>>> +     igt_info("Use HIGH_RR Mode as default\n");
>>> +     kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>>> +
>>> +     prepare_test(data, output, pipe);
>>> +     rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
>>> +
>>> +     /*
>>> +      * Sink with DRR and VRR can be in downclock mode so
>>> +      * switch to highest refresh rate mode.
>>> +      */
>>> +     igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>>> +     igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
>>> +
>>> +     result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
>>> +     igt_assert_f(result > 75,
>>> +                  "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
>>> +                  data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
>>> +
>>> +     /* Switch to Virtual RR */
>>> +     for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
>>> +             drmModeModeInfo virtual_mode = virtual_rr_vrr_range_mode(output, vrefresh);
>>> +
>>> +             igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
>>> +             kmstest_dump_mode(&virtual_mode);
>>> +
>>> +             igt_output_override_mode(output, &virtual_mode);
>>> +             igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
>>> +
>>> +             rate[0] = rate_from_refresh(vrefresh);
>>> +             result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
>>> +             igt_assert_f(result > 75,
>>> +                          "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
>>> +                          vrefresh, rate[0], result);
>>> +     }
>>> +}
>>> +
>>>    static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
>>>    {
>>>        if (vrr_capable(output))
>>> @@ -686,7 +747,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>>>        igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
>>>
>>>        /* Search for a low refresh rate mode. */
>>> -     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
>>> +     if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
>>
>> Does this virtual RR applicable to eDP only or supports other connector
>> types too? If it is eDP specific [*], then we must add a check for that.
>>
>> [*]:
>> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/kms_vrr.c#n660
>>
>> With above comment addressed, this patch is
>> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>
>> - Bhanu
>>
>>>                return true;
>>>
>>>        data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
>>> @@ -841,6 +902,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>>>                             "between flip timestamps converges to the requested rate");
>>>                igt_subtest_with_dynamic("flip-basic-fastset")
>>>                        run_vrr_test(&data, test_basic, TEST_FASTSET);
>>> +
>>> +             igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
>>> +             igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>>> +                     run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>>>        }
>>>
>>>        igt_fixture {
