Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C316CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 08:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB30610E1A6;
	Wed, 12 Nov 2025 08:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SqPU64NA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6064C10E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762937527; x=1794473527;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LwGIQvN09GbMeIhyKxNmS2omO40R4lGAGay23lX5XIo=;
 b=SqPU64NA50fT1JZ8/oIMC4yIgER3EW/86ahB9oTbuZnSVzG2Ql549Cfz
 et76cPj4DHMrS7+szwal6BrNH4GQl1fBK8zJIYnfBfexR0LibHzD7c7Mn
 SzfTvuc4qOCZwAReMidaZ5CtPZQYHh7jf6tUHh/4EG4x91YcNQ6gp5R/V
 yzGldmDnq3MCzw/b2vJzRNNySYsDQvHZmW+gIQ238+t8Wq5RNArg4pjYo
 WF9UuqKioVKBIJww/PVdNSupbyWSGJoJ4eCpvgqFXpnyfVeLwgMB/5pop
 i6eSBBjsI0iw2kKoSK90snHlozV69+OyEKUfAAUo4eq32l4qn7UOrFSKz w==;
X-CSE-ConnectionGUID: 3IvEBWH7TCeeSR7f3GX6RA==
X-CSE-MsgGUID: HdsNvdFVR4qZbDG/09Liow==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52555661"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="52555661"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:52:07 -0800
X-CSE-ConnectionGUID: R6jWGHq6QQWFest6xZOtFQ==
X-CSE-MsgGUID: 25H3lAaCQZSzTJOpAiwyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188940297"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:52:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 00:52:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 00:52:06 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 00:52:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GuRmX1o3URx7srmyiQ9cnSnW72aROG+OHwQxKvkTOHnK/rJl+0W0ASrNP5R8oM2CE+CAr8EtRVfnj9jFKQmLBJJlUdsuN+Si/DQWGXHWNoe0mh8RMS0DEboLhX8yCQhMQqFcDkQ1bOr5aQ382c0A0zhvv86T0XqKYil+YF3gO9LKmV+boYQrCHcgciUPBvUh1ufh41s2+rALlfgrKOAwLJG091FilAHkZ5lLZ1RdLuEltSk1c2rqCvfgBMmTgRiEte+R0FBhPoKu2Juhg+/7yNmzZ/8rs+t19/ogRCfJ8z+miS2apviFw3+HUxthZYDhTDlItzDdNcJEKer5bxatxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeGkFV2XiCXV5Z9opU8+1EZeFBIyxfCMOPYvrv7p5Ag=;
 b=CiORlFqQiNItvedXRzp4O/BtpK9lfiR76DpWY/W2HwLoEKVgahN0KZVdlO62xkWu0AIWI56odcRvyEYCInj0FALeh/ylbgjkycabnY9m9UabzMoiZOlH2cxPiF2vEizbostjpXGQ2pN5eoQjNnHwS+Qc/titaRT7dan0/JDtONUHcSxuXhZSS/e79854+EQcT6Kog1fyOc/EPnzUVeXfObZ0eUPmL59itRS7xerABt4mCx5Kw12Lgup3OcERuVU7HoDGqc5WhCM004sVlcx5ux3kR76ylerjWU3pQMEZimkSnjS1WsyiF3PVeve0wWO8MnudHPPkszyH2YqXqgI2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by PH0PR11MB7657.namprd11.prod.outlook.com
 (2603:10b6:510:26c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 08:51:58 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:51:58 +0000
Message-ID: <962a181a-1640-4e5d-a811-970e8ac67e51@intel.com>
Date: Wed, 12 Nov 2025 09:51:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] lib/xe_query: add helper to get first value of
 hwconfig
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
 <20251107-xe_query_helpers-v2-1-ec66ba6af1c1@intel.com>
 <CH3PR11MB84342FD5C775668DBFCCDCE88DCCA@CH3PR11MB8434.namprd11.prod.outlook.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CH3PR11MB84342FD5C775668DBFCCDCE88DCCA@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|PH0PR11MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 397586f2-3792-4834-58a8-08de21c8bcec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnphQVExNXptYzZXMzA0T3B6SHRySDNXd3doaFJGMnpSRC8rY1IyUktTZmFT?=
 =?utf-8?B?V1ZOTmJ2Y3E5VTd1dVJNUHpJNlVPT2JETFpHMDgvNFhHOE9kcGp5UkdLbXRv?=
 =?utf-8?B?VUVRSjNxU25CK3ZHOHpTWlZ6ZUlVOFpRMmRKQ3ovTDh1VThXSUxkYnY1MktN?=
 =?utf-8?B?WUQxNlY1SWE3RE9PTUlUZFRnMmFpQ2o0RUNxRzNrUTNQcU0raFBzUTFrM2l1?=
 =?utf-8?B?cGZSNjQ0OWtyb2luNWZzSXg0RysvVWQyZHlkSmpCVVV3SlAwRzk2OFBmVlVH?=
 =?utf-8?B?b0NLRlRYYUlDc0VhenpQVE45emdYakNoYnhEV2RiRm55N3FQUUU2alUwaUpU?=
 =?utf-8?B?ajQ2ZnpRTHpZL3h0YmZDdFpLRDBSbTYvbkI1T2dsVmdvZHdYMlNtVlFuVWVD?=
 =?utf-8?B?cVhnc2h4YlpXUTVoM2pUUHVWRlU1QllMYjRjM3lDRzRKL3EyNk1MWVVhK0dX?=
 =?utf-8?B?Qy9KYTRlRXJ6NkxYQnRqQUZTTEEwN0ZoNEZudFZ6K2JYa05lRjhKVDJWR0Ey?=
 =?utf-8?B?WWx4M2dZVlJ2TEZuRzBHUzMzc1NqNHRkYkd0MVBaSG01L3N6ekl3VGxacXJG?=
 =?utf-8?B?TnJaTG14RkVUZzBQQXhiNGFVdi95S09BL1lyL2wrcHAybUhtQnUySDZOV2Ni?=
 =?utf-8?B?aTFORTcrSlpRd2kxaFFUK3Jma2t3QnVHRVYwK1hSNzVQVU94Wk5ZQmowOXRx?=
 =?utf-8?B?Y05pcHBpRk54bmZSSi95QXI0ZCtlVyt5cTRHVDYyMDVhSFBxa3FrQVM1bTdr?=
 =?utf-8?B?Z1pxOER6R1dQRkdIU1A2elBOUjgrOFFCY0J2VDVRcFpMQmUwRm9DWE96T0pV?=
 =?utf-8?B?NlVrMUgzc2tWR3d6MFhFbnRKSG5CNzRsQmU1VHFKWkRTVWtHQmttTGs3aFMv?=
 =?utf-8?B?azJoV2s3MGYwTUJrdFFIK3phS1MrWEppc0NXakVSMDhsMG5ycXl4ZmJ6Z3RF?=
 =?utf-8?B?Z2o1MFVvRUl5N2hkTk9uNVlOdE5jN1pDN25Gdk1SU0d4WVdqYW1Vb2gyaXBE?=
 =?utf-8?B?RE9HVXFMR1VyRUVuRitsOFY4YmhBK0E1bWFhZUcxYmpFNUQvblVRbjV2c0Uw?=
 =?utf-8?B?V01EOWRrWjIxT0JqUUZUL09vbTVXNDRNU0NFM3NYT3hsNnRDTVEra29WdDhB?=
 =?utf-8?B?MWg2VFNETDBVSFducVF3algzeUN2dzk4SXBZWkRiWndmZWVmcVVKdmlBT3c4?=
 =?utf-8?B?K0I1MWorOXV0RTFlaHcrdUtJelc5d1NWUTNPMk1RT3VIY240aGRtTGxXRHBO?=
 =?utf-8?B?L3NxNU1tNExVMjNEMTZMWEJhWXlEZXBaVlRKT3F0ZUQ4WFVTRVJJNThKQ0ZF?=
 =?utf-8?B?aUtCdlkyVlArdlp6bXd0eDFJamdGUTR4NXh3YTlFajAyZzVVN1QyZS9QdlVU?=
 =?utf-8?B?THcxdmgxa1gyclRBbHdROFR3cWZYMmM2UWYxTmw0eE1HalFFY3UwYWpGakZY?=
 =?utf-8?B?cG1ORDdqQjc2MHpyWUlySXZKVC9mRk13eklZbkI2eDNnTmVLa1FSTmxWR0Yz?=
 =?utf-8?B?TGh6V1NJeS93M29ya3MzNHBDdWJxK25FYWZ6M1RTdXZWeExhUkdvTFkxSE9B?=
 =?utf-8?B?U3Fic2RibUhBMGFUTUlZOGJqT1NYd2s4Si8wd1M3dG5YSnpnSm1aWTdSL1ZJ?=
 =?utf-8?B?Z1RrWXRlTGpMN3VYR013YUpCalVKMTU0dzlHL0c1c3dsTm1GdmN5YitpOWtR?=
 =?utf-8?B?UFhjOVhNUjFNRWtiTlBWVDhMNWhNd0tIdUdreEFHTzZiWURPTVhUYWJsTzlh?=
 =?utf-8?B?b2RPU2NYTGVoUE9XN1NTRklsY0RyWTR6T2ZLR0xiY3QvVXVTWTVteFg4V3k1?=
 =?utf-8?B?UVlJcEJCdkVhZEZueDIxbHNCdit4Tk9ENUZXeUxQMlIvQkZBNHdoSWJ5Y2Rh?=
 =?utf-8?B?a0lEMGhidFIyQ3JMUFRwSlpDUzFWa2Y0Uk0wNUM5bEwzbXplcFQ1bjlmOVJN?=
 =?utf-8?Q?+Kghm06gavMTu19tOrh0Jg+g+S5hPs3Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEVxcFQ2NU9XVnNNejQyMkhuaHhCaThJdzd0T28ya1kvcmdCQUhTU1g3UjN0?=
 =?utf-8?B?SWNRY3VYQXMyUWoxKy92cFVCYllESWlFaC9RNzhVKzRaZjJtSyttbmtkVVAw?=
 =?utf-8?B?TDNBb2JTMHlqZGM1cldVNGxJSDB4QVRmUVJuTGRuNklRZTIxcmJpZU5LbDBF?=
 =?utf-8?B?NE51dTdxR25JUkpPODZ4aGdxS0I3eXBNT0tsUW5XejdGOFhqNWxJdUJySEdq?=
 =?utf-8?B?eWZwelJhK0lRUVFvMTlYelBpeStPaVZDVGw3VmY5ZklJOUVORWh1WklvYU5W?=
 =?utf-8?B?Vi95aExwMXZJSG1rSmM5ZGpVUUkxVUlMamVMaGY0dnBHNW1WRTNGcjZ1MU45?=
 =?utf-8?B?VTZKaE04enVuOTg0UGxyUnZnZG5YakxxaktUVkoybnp6TmZWeWgzVGJSZjR4?=
 =?utf-8?B?UnkvUnVZSHBDVnBQenRXV0ZpSzZDUThWUEpETHhtQVdUTzBKQmVCNmhMODNB?=
 =?utf-8?B?N0FlRDJKa0lVZ0JPaVl2Q2pIYm1pS3Z6WHo3QWkvaHhjSG1aSVFNZmw3Umc4?=
 =?utf-8?B?cFdUbzg1VUdsS1B0QkFSVmpDaUVpZGVST2grZEhYaGNaMzA0YjhuSVlQby8r?=
 =?utf-8?B?UlBvZUhVMGp4eGpDYUFiQTBjK0d3dnRhL2lZN2pwWjBLdDVXUkwzSlVmOHJ1?=
 =?utf-8?B?V29hcDZvNE5IMFd1ZjJ0QzZVVkhYbGdvYmk3am8xZEY2Y2w5YmZpcUFYUmxh?=
 =?utf-8?B?bmxKTjVHWDZKMW8xcXdiT29DVVlVaFBlaEZhN1BFQUF3WjJDbVppMGNMVnhv?=
 =?utf-8?B?UDlsdzFjWitrQVlCdVZFcEhtV25ldFF2Uk1XQ0lFa0pPWlRIWXNqR2RwOHRD?=
 =?utf-8?B?aHJ1OXlGdUhyekVreklWamJ6WllTaTg4SVdjREFCa0MxYjdmTjhqVWtuL2Ev?=
 =?utf-8?B?TThjK0RTY1p2d3AwWEJMQU4zdnNJaFhpc2JlUnhCNTBLUHFUVFBZb2lHYU9t?=
 =?utf-8?B?YWQ1RmpJMFpqM0xiYU1FUmJieEE2bDFnSjJTYjBBakpRNzFvN2xNL2VRTzRT?=
 =?utf-8?B?eGVaZWE0M1Z5MzBsTG5JVnMzZWhHQlk4dUtYVUtmcVFXanEvUm1kYWZSQzFG?=
 =?utf-8?B?QzRXY3hEYnR1eENvL2hkdHVEdlN5bVo4RUt2WjZWelRPWDBmUHYzUG9ocXNq?=
 =?utf-8?B?L0tjK2VVVm1lQ3VnSExBNFZTZ2hGME1TTlNrYmlYcFJtQ0F2dmpPU2IrcU85?=
 =?utf-8?B?aVl4TXNBZ2RKWGhwQ0MrT1NBSmFwUm02YWlvcldLNDJWSDZzRzRReWdYMGV3?=
 =?utf-8?B?a2QxZmovMTZQMFhWMWM1TDVXYmxnckJSTVQ5VUFrdFgvemw5T1VFemR3WDhO?=
 =?utf-8?B?bnBDL3JhUng4SEx0UFJ2eFJqckNMQlFGUmQrWWY0Tk9od3BrT2tQL2gxQ3dP?=
 =?utf-8?B?QTd3ZnVET2xIcWhEY0hqTGJ1SVhTSStIUmNIcys0eXJJeEN2dUZyVlJNMkd0?=
 =?utf-8?B?Uk9odGtMeWtMUkwydGpVc1AwSEpxTmlCRnc4bExRL1N1Zkc1TE1ySjY3L0hz?=
 =?utf-8?B?aWlEQTZXdGRIUWVJWmpRTFNndjZhRGUwM1hMYUhkNWYya1VJMmFoUExkUzF5?=
 =?utf-8?B?MEViWk51ZmFMV2VYVVp5WUgyK3pyYm1FcmtwQVFvcmYxbjZNc3RZMzVTVE51?=
 =?utf-8?B?QlZnM0gzVjBsY1hBMFMyVG9mcnNUbHpwTmZqbkU3ejd4cWNaaXBJYitJUmxI?=
 =?utf-8?B?R1dVUUVGMHZ2YUZQdzByVGsvWnBoR2JLTTdiUXdObVBXUmxmMllIRGYzT3Fu?=
 =?utf-8?B?UDFqZU5qWFdPSjRjbWRSUVdkSWxNcStDaTl5SWU2ZzhCVFc5aXFidTd4N1d5?=
 =?utf-8?B?NzZ2bWlaYVpQTVFFMEZKQWdJcFl5WGtvSUlhQ3RVeUFpYTY1cTNreG5KMTl1?=
 =?utf-8?B?RjFZcklJUU1uRVpmcWxvVjI0UktNVDZHVzZkTEc4R3VGdEtHV1A3NURYa1Rm?=
 =?utf-8?B?MzFPQXZpUzdISlhBR3dRakhsVFV1aGtxTWtGWE5qM3F5amcvMm5pNHpCQUxx?=
 =?utf-8?B?WkIrWVJhNEJ0K3RLMDMyK3RNenRSejU0L3QwNzZBNTFVVEFtWlNkTEMzMjJU?=
 =?utf-8?B?U2tIQ1JBSG5NRG5UTkVPa0tnazgvYkU2Wkt1OTE5cWptaWNGODVJOG9MMjFU?=
 =?utf-8?Q?Zy7SEiFZh6vFqcMs/ZsDNj+Ir?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397586f2-3792-4834-58a8-08de21c8bcec
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:51:58.3092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ3bzlNPRRTxYnJIYjRXslfFUqVMnwAYLDDfJ+WXMFdYbzmXyhYrZprnF8P+1lyIuZTaGf/mc8hy2BatDX4Yzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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

W dniu 12.11.2025 o 07:44, Dandamudi, Priyanka pisze:

Thanks for looking at it.

> 
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Andrzej
>> Hajda
>> Sent: 07 November 2025 05:53 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Hajda, Andrzej
>> <andrzej.hajda@intel.com>
>> Subject: [PATCH v2 1/8] lib/xe_query: add helper to get first value of
>> hwconfig
>>
>> Most hwconfig attributes are single values. Let's simplify querying them.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>>   lib/xe/xe_query.c | 17 +++++++++++++++++  lib/xe/xe_query.h |  1 +
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
>> a89e0b980643e9aa16b35d9a98c180ffd92a543c..d8ea79108d67dbbb8c85976
>> 2b1f56d954ee749c3 100644
>> --- a/lib/xe/xe_query.c
>> +++ b/lib/xe/xe_query.c
>> @@ -1035,6 +1035,23 @@ uint32_t *xe_hwconfig_lookup_value(int fd,
>> enum intel_hwconfig attribute, uint32
>>   	return NULL;
>>   }
>>
>> +/**
>> + * xe_hwconfig_get_u32:
>> + * @fd: xe device fd
>> + * @attribute: hwconfig attribute id
>> + * @default_value: value to be returned in case attribute is not
>> +present
>> + *
>> + * Returns attribute value, if present, @default_value otherwise.
>> + */
>> +uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute,
>> +uint32_t default_value) {
>> +	uint32_t *vals, len;
>> +
>> +	vals = xe_hwconfig_lookup_value(fd, attribute, &len);
> igt_assert about the len is not being checked which in original eudebug code is checked.
> Igt_assert(len == 1); Is this not necessary?

Two things are here:
1. len > 0: I have assumed that non-null 'vals' value should be enough, 
but since data comes from external source (GuC), better would be to 
check len as well. Will add it in next rev.
2. len == 1: we could return the 1st value if there is more than one, 
but since we do not have such case at the moment, let's check it as well.

>> +
>> +	return vals ? *vals : default_value;
>> +}
>> +
>>   /**
>>    * xe_query_pxp_status:
>>    * @fd: xe device fd
>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
>> 715b64e2f62cfbbce8dcd987dffefef7b1af72c4..acf3291b07968e829e6e72ebc
>> bf08f00e847e27a 100644
>> --- a/lib/xe/xe_query.h
>> +++ b/lib/xe/xe_query.h
>> @@ -136,6 +136,7 @@ bool xe_is_media_gt(int fd, int gt);  bool
>> xe_is_main_gt(int fd, int gt);  uint16_t xe_gt_get_tile_id(int fd, int gt);
>> uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute,
>> uint32_t *len);
>> +uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute,
>> +uint32_t default_value);
>>   int xe_query_pxp_status(int fd);
>>   int xe_wait_for_pxp_init(int fd);
>>
>>
>> --
>> 2.43.0
> 

