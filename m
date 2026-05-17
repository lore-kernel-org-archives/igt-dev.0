Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2374CD4F4A
	for <igt-dev@archiver.kernel.org>; Sun, 17 May 2026 17:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8046910E0B7;
	Sun, 17 May 2026 17:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig1OtqsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AAD10E0B7
 for <igt-dev@lists.freedesktop.org>; Sun, 17 May 2026 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779038154; x=1810574154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=fQpaGsa6cLJAsDio+72JJw+xz20pXGecblWwIly+pYA=;
 b=ig1OtqsNg5tKASe+d5UVJD3YoMBHlAphv5D8Nm35LOhFqkvRpJF/1Bwj
 bia8PG07FS563f+CYXWWS1sowTvZsEnTKxTHPn8OdaDt1o9HdhjynhUlk
 /LYmHHi4lhVs2E7jgiNW6q8lMuitlxaN/z8ZYNNRrfl9b+ICkaZKAA1Io
 0/0GRh36WHKgr9EFKscK5DoccALJU2nw8cVT9Phjt8irjRZ+EDayUL2x5
 mru1RXGDFW0tcHp8LX05ub0gihxj49wn0FPa1qGLCJIK20li1J7bRtv12
 5NSGhHtcYwysGCxDl1WZvD2l6PCzEDw/eK0a2Vwwjo6WSJ/gHdpIjUbAO g==;
X-CSE-ConnectionGUID: 7IdL3uwBTNuDo91NiM245Q==
X-CSE-MsgGUID: FOaMP+tqSCOdEF1RCicB1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79876449"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208,217";a="79876449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 10:15:53 -0700
X-CSE-ConnectionGUID: Knxmrme6RC2KkcmmWb/1GQ==
X-CSE-MsgGUID: L6/t3fdvSheszULID+hyvA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 10:15:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 10:15:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 10:15:52 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 10:15:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfgrFDTIXdaQzVyVuMc9Orwa5mriiVaDVVcZuzkxkac3Q9ajvQsYxbr03bBL+xLbu4ATKk82NT9hjKiDkaGixqvZ2s8RVBidXk5NWx+BR9KHqPg0qwshfPhn8FsZnMy7g09ff5A6MniqDu2NV1XSMT/sbA24d7KLEI6Fb1Tq/BtZgvjuff5lQBdpByN0sB3TcSjvRO0TCwGwktwTl20/ybY0MVeKaooF2PcXAqkvH1AEL5wu7AXWDzvco4cG+/1+po1cweOhayy+8DzuhPxuafHKoIEKil3ZbN8wt0zFyCPuJckQxAa8sJEkr8lLC4KwRqPMars3ecGtcu3g2HUJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kauRKKktkwx+c2YOKwzEaAcfAbXmDF+E4DBr17htbv4=;
 b=QFZIlQmxRlguwnO2qICU/Y4//PrEHWj9KbmnQrJ1QMorS6Yc1ivB1UeIJGwr8+NA4sZqly4hIrRzsvY+cnXIruc4UcNAz2dJWVV/Ol+FrzQ+JkrgYmK/aiAH31yIv/UndEacyRR9LgyVkUCom4aWzKBMkiNMdzRfZ21CTO2mWK80el5No3bWAuJac9iDzCd5U7OWmtQ5bdAM2xnwLhaY4+18PEAuGPjhLs/GSO2UMXRfz3ruxIepEkyuir1O+j0il/onDBC+E1Qd6g9tJglfozfVIwjGf3+bm/oiaQG9yuvjpJEUMx7YTlY0XgDM1xHbtePPmXLB44ItYiJAL4d3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Sun, 17 May
 2026 17:15:50 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 17:15:50 +0000
Content-Type: multipart/alternative;
 boundary="------------TVwLcCJtl4RSZDcEMqO0RnjE"
Message-ID: <68a778ef-867c-465c-8943-fc151a21edd0@intel.com>
Date: Sun, 17 May 2026 22:45:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v6, 1/2] Revert "tests/kms_vrr: Start virtual RR test
 above midpoint to avoid mode fallback"
To: Lee Shawn C <shawn.c.lee@intel.com>, <igt-dev@lists.freedesktop.org>
References: <shawn.c.lee@intel.com>
 <20260515063251.2239524-1-shawn.c.lee@intel.com>
 <20260515063251.2239524-2-shawn.c.lee@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260515063251.2239524-2-shawn.c.lee@intel.com>
X-ClientProxiedBy: MA1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::27) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 627a198b-1eb7-4615-e9ee-08deb437f179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|4143699003|8096899003|56012099003|22082099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: dbMNUkss+YQX5HJ6jP/NBwxYo3IRi9x72Xg76dZesqLl0wjwUCoS3fN0IE91HPzZAH4oq1ddy1iRjbVSjcrxTfh86kz4Md76zCiNTw7hDYBsOjeTQ+hPHeH9orNO7TjkU4Ih5eDYwzF8sTrH6BZGLg48PaMNIF8yUrrB11vtTIpsNbuoNkYh+D12XDBugZO2WLlPyOGigkCRge2fdu3VkFEKGCBHiXPTzGs4qOD2vAb1IdJPj+ivOBDCzt/1dvXSjcCGYG4iihE9bTSNsCpGIWrASZ4qhusHDSCH3upngMuyBqRJbBWoannIxo1iOns2fivhuKAcHWfpAIlwFJAzUHBXVbHpU5KYZRTwww5ruH/odyi+MCnXImkjOBAYTm4HOjre+zp6XKPpFKNcX8H3VXNC6Cz41whyA0Jx3OP3qVt4uJTQV46jlTIrF0T3B8kmUTbZWGbNcN+QmwkpyXT1TRv78zlJbJU1cekxpHkVvlFT6coXBriv/evm+4QE1wmWImL/r9oq3gXS4F6oqonUYvfQrxS9fTojHaM1JHmN6KRuB6mmBd5/YANgZ6VKwu4Wb5E/dIQiBzE5NLDGR8A6j1NejgVGG6i4dUKDoqaGz+X6OlEsPuKKWc9tpC5gXBqtiMJwRDsdLuagQuXVX+Ry8zxqggYz1hYebQV5wuZ9wdQ9iiE7V5vJJtmuw90BHA0Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(4143699003)(8096899003)(56012099003)(22082099003)(3023799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0QzdEE2dVNKODNVWVZCcHdGWEhPZEcxL0MrNG5xQWxYY09KSHBBTm5qMURa?=
 =?utf-8?B?bHZTOHRvWitlcE1MeGNyMnJ6QWpzdWdqZW93em4wcmJGU2dVWng5eXlEbmd6?=
 =?utf-8?B?b1k1NFJuNjg4OGZ2QmJ2WlllVGN5MWRaTHBuTnRsbnFxM2JkVDBPQlRUUjli?=
 =?utf-8?B?WEpvWGNrNXBLVkxJM3VrMDRKMGNVTU5qa1pzUzNSN0dEY09IbnkxclJpVlRO?=
 =?utf-8?B?M0lIWStKM2dOck1CSVYxTW0zVmtGYU1lMmV2bXVPTzBXQlc1UXVFSzBrNWRs?=
 =?utf-8?B?SGhnREpWMHovMnFLOWFudXdSZDlIYzRBeGRtQVI2T052THZ4dUVncHB2Y2Rh?=
 =?utf-8?B?Y1NSZ2twY0xWTkhiNkp1ajduS1EyWUswNmtqMlpTcnVqUWZLWHFaWE1UOG0r?=
 =?utf-8?B?ZGE1VWNHdTVDbjg2M3QvWWNYaVhyQURyM0FCOFhWREFuMkZiNmhaVWIvdURU?=
 =?utf-8?B?ampTSkVSSng0SG1UWlVSTkFOK2xCTkJueUN3RzU2cElSNHBYS0tGd0ZzZ1Ns?=
 =?utf-8?B?SFN5VlI2TGtpS2ZLMkhuTWg3eDJVVWdmRUtJcmlGeDZINHFsYzB5T00vWndl?=
 =?utf-8?B?THhZT1NETkNMWTIrZHVnbVUyOHZaUk9td1c5QmlSVlZWUlhqc2ozZGdEM203?=
 =?utf-8?B?V0tsRXR4RWxDMStoQ0FYcVU0WGtLOFllVk45VzZUbWEyS00rL3FhcXlvV2Z0?=
 =?utf-8?B?T2dtTzhqdU5UdlhlWnJSN2hkMjZFbXhPaVVocGx6dFhOaXlHeUkyYXR0U204?=
 =?utf-8?B?TDBIaCtGcm5JenZ0WFZJRklLbkRadFhwa2lRV2pvemR6eDhUVlE2akl4VGJv?=
 =?utf-8?B?UDZFdVJGYjRRL2dHUWtIYnU4emo0ZUxYMTVRVGxMYW52Z25oR0VST1VkVXVs?=
 =?utf-8?B?RE5POTJtOWQ0QmhrNEp4Z1Y1bzhWclJwa21UNmczckhRb3pCYjRxalA2MlVX?=
 =?utf-8?B?eDlDYnhSL1VKYjk3RUE2Q29aTlNINjlwbWxWK3lsNmVrZG1TSUxvR3Z4Y3hW?=
 =?utf-8?B?T2RWa2VINEVsNkhoWGU1SGg5S1RhL2IyeG1KZzZ0Q3J5ZXVHNkNBVkNLUnht?=
 =?utf-8?B?bHVGSUFsczBrYkdRYmZxak1zNXBpcjVUNGprSnpnRU1zUzNHMXFrTW5vc3NH?=
 =?utf-8?B?ZlduRHVMR2ZZVDVOYTl3T0lQN1ZvV25YTFUxZG9YRklnNkFWVUNLRlJ5LzZu?=
 =?utf-8?B?Rm0wM0hmT3EwZG5HUzZOS3ZJV0dzUlNrR1V0eXNqcmhtOVhxbmdLdjlFemNm?=
 =?utf-8?B?RjNDejRGVkNZU2Y0aEFGdldIVWdQZWpBTlRna1FDTSt6Z242MHlGZHdTcFV4?=
 =?utf-8?B?LzB2cGFRN2Z0K0EydGpTOUptUjRBVFpxYThWRmtScE9RM09xOHRYUW04RlV0?=
 =?utf-8?B?UnZMaXd3aC92THRWUHkvdGQySnhzeENiMi9RcmRBcUJMTGZJbEF1TWZUeTg4?=
 =?utf-8?B?ZEdHYW5vRTFkVW81NFVlTVF3dnltdWFDak5qYmpDbFQyUmNEeHFKSmgrTkJF?=
 =?utf-8?B?ZFBxcDNGWWd0dDlVY0lMdXIwUXJnUXJnYUZqS3hxbmZMNlZMclVGRFpHNGhJ?=
 =?utf-8?B?WllmZlhVNkZ0cUtiR2U4WVB6OFVzaWRUbGlzQkR0azBFUHVGUUQzM05yZDBL?=
 =?utf-8?B?RkRoOGlIa3pzQitTdS9hMTE0Z0NzeWtwU1hyWGRnVTJibmFGejBPRUhQWkll?=
 =?utf-8?B?NTBPeloyN3FKNTNOQXBPUmdXVGt0K200VWFTVVkva2VEN0tMcmxUdm9PUzhv?=
 =?utf-8?B?a2xVT0hhdHQvWElxeTJsY3lpT1VpaFFkZnExY0lsZmtjOERxdC9hcE9Cd1Vp?=
 =?utf-8?B?bHpRTHJzNXFvQ3FHd1EzcitkSkhQbm5Ka3loa055dC8xTkNXSWwvQTV3a2Vz?=
 =?utf-8?B?MU9mUXlkRyttaDFQb2UzQStBd1N5OUtJZ3R5ZExKc29VMWNFNHhQb3I0MFZC?=
 =?utf-8?B?ekFDY1BrRm5pbjlYaXFNQWVjVzRwSUI3UE95cy9wL0tFSlJuSFduenk1YmFF?=
 =?utf-8?B?bXNTSU1pSDh4KzBlaW9PZjBtT3E3ZXhVeVI5UnRpV095UUpnaHFaM0kyVG5M?=
 =?utf-8?B?SFdWbWJHd3pqd3RwQm54bEF1ekhIcjhYQkZuOVV0N0NJdWtLQ0pLUFRkcFBu?=
 =?utf-8?B?NVpzZXhqcTVCdFZBN2JYZ0JyaFM4ZlRIWnlFek1PUmxSakxodXljWlBKVGk4?=
 =?utf-8?B?emJLQlFJaE9aWTFLNHRIMkJQRnN5Nko4L1lQNUpobldHYU9Bbk5mcVZVNWRG?=
 =?utf-8?B?UFNWa3JCUlVlQWl0ME5DNW5XSXJHSmhneFRZdDMxWWNzUzlTcWxpcU9LbGpV?=
 =?utf-8?B?VjhNVmhoU01VV3hQam1nSWF2SjcwcS8zazRpdUtiTFdzLzFWNTJGS2xkNlht?=
 =?utf-8?Q?cv+Mk62hSuiANyqk=3D?=
X-Exchange-RoutingPolicyChecked: UNile+tFZqQVtcW0jmXBgnAb8vGJVJSwZScVB+zCUdr650ZVR1m6fDncRpaqIQERmuWK1X/2lJJkQn2PAEwe2xo6tCMOkOXJw/QCbVJZQjLEG/IE9YnvM74I0fMtvXa69Kjv4ZpUm0v0sSdF8IVIaB0IItpSq1GWrBQsHmvJ3Y2226tgbQqYWxcDq0ZllFEHAtjndYdSxVhXkgRBGKDbi15zxT8BOKEEWSnYN+TW4HgZgVlBk66pyBbAvR0oaUuvfQHheiInUuuqyCkgRO/vWR2obBSRaNgfBUNsGh+u41JGFa39gyhdbc/aQSE6RjbsL0ehnO8oIabw05EhnnUGSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 627a198b-1eb7-4615-e9ee-08deb437f179
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 17:15:50.4006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jb7xhhAsqe5W2bfwmDdHdHHqwmaewn6bnCMSKz+VxQGCoUWCnqjK1Si5eBoCy2L2W3FXLqIWXRMN6aYdMyFUZW9t7nJoyIzWq0Hr8NpzM6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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

--------------TVwLcCJtl4RSZDcEMqO0RnjE
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee Shawn,

On 5/15/2026 12:02 PM, Lee Shawn C wrote:
> This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.
>
> The following patch will do full range testing. So no need to start at midpoint.
>
> Cc: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
> Signed-off-by: Lee Shawn C<shawn.c.lee@intel.com>
> ---
>   tests/kms_vrr.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 6043d40f1d74..8f5c4a7c1501 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -786,16 +786,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   	/* Switch to Virtual RR */
>   	virtual_mode = *igt_output_get_mode(output);
>   
> -	/*
> -	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
> -	 * modes are available. This avoids the driver mode adjustment. which can cause an
> -	 * unintended clock change.
> -	 */
> -	vrefresh = (output->config.connector->count_modes > 1) ?
> -		   (((data->range.max + data->range.min) / 2) + step_size) :
> -		   data->range.min + step_size;
> -
> -	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
> +	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
>   		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------TVwLcCJtl4RSZDcEMqO0RnjE
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Lee Shawn,</p>
    <div class="moz-cite-prefix">On 5/15/2026 12:02 PM, Lee Shawn C
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260515063251.2239524-2-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">This reverts commit 862eb176244feac8ee711f381fe1be1fdc6a7ede.

The following patch will do full range testing. So no need to start at midpoint.

Cc: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Signed-off-by: Lee Shawn C <a class="moz-txt-link-rfc2396E" href="mailto:shawn.c.lee@intel.com">&lt;shawn.c.lee@intel.com&gt;</a>
---
 tests/kms_vrr.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..8f5c4a7c1501 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -786,16 +786,7 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	/* Switch to Virtual RR */
 	virtual_mode = *igt_output_get_mode(output);
 
-	/*
-	 * Start virtual RR testing from above the midpoint of the VRR range when multiple
-	 * modes are available. This avoids the driver mode adjustment. which can cause an
-	 * unintended clock change.
-	 */
-	vrefresh = (output-&gt;config.connector-&gt;count_modes &gt; 1) ?
-		   (((data-&gt;range.max + data-&gt;range.min) / 2) + step_size) :
-		   data-&gt;range.min + step_size;
-
-	for ( ; vrefresh &lt; data-&gt;range.max; vrefresh += step_size) {
+	for (vrefresh = data-&gt;range.min + step_size; vrefresh &lt; data-&gt;range.max; vrefresh += step_size) {
 		virtual_rr_vrr_range_mode(&amp;virtual_mode, vrefresh);
 
 		igt_info(&quot;Requesting Virtual Mode with Refresh Rate (%u Hz): \n&quot;, vrefresh);</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260515063251.2239524-2-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------TVwLcCJtl4RSZDcEMqO0RnjE--
