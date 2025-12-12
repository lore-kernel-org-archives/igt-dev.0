Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED25D4417E
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 11:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BC210E6FA;
	Fri, 12 Dec 2025 11:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AM0NZOLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0444B10E6FA
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765538973; x=1797074973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K2kALsU1C1ffZ6o7P5ccYZVFk6XCJifUG3z2+5gl5/g=;
 b=AM0NZOLetFoXhQi1z5LfAOuJEKWD9tvuos4NgpbBVwgHYIDy65hGgdVt
 VgzdPYn69EAj5kQqpe8h8P/UhGuXvMfwsrcVbnIe8k1i8OuxrsWuBVK6G
 Hm5yg7TVMgVTeGarYV43qXslHEML8Zi3xoHWfkmKokX9EN0ZQ7wThGoa9
 VEMPYa+RVnLKer8FreZM7eSEH4i05MZm0eg3tAYtHsCDrvoP1Vi4MDj9/
 q8TST1gPp1nhrE8BmpgnUJx0GCkkKcoGx5yer7YSt7eajJM6f+E8NX4aH
 KHnZGFsQQ6YHiCb9Q9+qP6Cki8hQt38TRrItj1ggFirss4p+/cU+p95Fk A==;
X-CSE-ConnectionGUID: CBpbSxFYQymEi7JcQT6EZA==
X-CSE-MsgGUID: nMlN3MDXTCWsfiobidUIjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67611925"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67611925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:29:26 -0800
X-CSE-ConnectionGUID: dhbSUJTySN+dPOyEbybLAg==
X-CSE-MsgGUID: Dv2wVO5PQQKm4hBKCEMv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196970955"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:29:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 03:29:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 03:29:25 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 03:29:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcsVGuOn5eCauMsnjWpgI8mz+YOtCOcY9Cqbh73Ik5YhbCQqBz9loD3fDxs70FXpv2zBuE3qHmTvGuWA/6K7fzT1ZP32jDjqqfmBuENaaL0Y2errwo8MOMUeRH2z/VTmZZSpdMLqvnmhwHmwRxhWKCcyAKHV/8u2JDLpU/XuZwY1t88vYp7/NKI0y90gd4yOmo5byUfB70J7waMeXTs+HVm12UVrm1vzBZzcB4+KhTQEDkomBXYSCVM1bB3++aSKIGp/QzxLh2jlVMXJG4ENDZZwZvxtdq5HygsAyT0GUD9hrSvfIP55Pd/9xDH2QtC6fc1hcgCgzW5hDeatFT/v/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb6TyPaXRRd9fgD8Pu8ujzadoCNzCaoB1SbsmXMc4L8=;
 b=Ro2ehYbKo5gXGvztDP2jJLj/lgdDskp+H9+VWZskMOZw17WJI8QgvBPyuKw4V3sgSVKB8AqO8fflmsqBHYGNvgoOO94uO9ykfmhHdVCbgXka1t0mJh1YvTwaqoge792Ymc8cr4XH2ZudftSjbXfa6OvCQAKB1sfg35HN96jYQKCh7qozA1RJi1LiII35Fgkk6rnMcxa4CxMeQ/NL/Mid0l/iA0D4KwLcjObSYPeodhBKXrZZs2LVOwRCJN1lP4lQJpy2r+VYVevOXLNREvKYn8kReDmcQ6K+egrWj3E1CK8E+9O5zRvPS9Wmd4LEoTg2Jrqnn+0dG+cwxF2+gHNoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 11:29:22 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:29:22 +0000
Message-ID: <aa80e13a-ad5e-4c5b-925c-c84f18857703@intel.com>
Date: Fri, 12 Dec 2025 16:59:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20251210104400.4141969-1-karthik.poosa@intel.com>
 <20251210104400.4141969-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251210104400.4141969-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f7d09e-7d9d-4c95-4662-08de3971b25b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THhXdDZSOUtkeTVydjhINlBiK2h2NVZiUXJNa0FGbjRwc24wWkZFWGN3U1No?=
 =?utf-8?B?WnVMdVlQLzM2ZTZWYVJiRE9QcS8ydDVBN2ttc0pmL0NUZHJwdHRQQ2h5WkNN?=
 =?utf-8?B?OE1xdFVrU2c1RFY3Q0JmeDJtYjJZRCtsRVhId0dTUUZoRlBpUmtCVWtJQXZi?=
 =?utf-8?B?KzAzR251c0lwWHdHakZQTGp1bWI5enlpaEhqNUM0M1d1VjVUTWdxcmR3VTZz?=
 =?utf-8?B?dUl3eG41ZHhjemQ2YTFJRTVWUjlZYWszVXp4b1p5c3NBQnNnMSthSmVtQzJk?=
 =?utf-8?B?SVNLQ1dteE40MkN2b2JKV2NlQ1dLWkFuY2VMbXU4L0R6TGpyd1BYeFZqSXpC?=
 =?utf-8?B?NGlxeE5HRUwvb0JRcXR5T2F6SVB5b2s2NElEWTZ1VWJYdmFaRUNvRVR6ZGph?=
 =?utf-8?B?Z0hWS2JyNXlQSmpNZzlmM1VWdEdyVDdpNHFIVGxUYWVLR2ova1F1d3ZFRVdY?=
 =?utf-8?B?a2J5TGxZb2dFU3dxYkt3SnZrd2FUSG53dVJ2YzFLWXZNZlRtNklRU0JmYklK?=
 =?utf-8?B?WUFHVVJPdXM5WFVCenl1STQvL0NtQ1N2eWxqbGhGQmxXditVWllxM1R0R2du?=
 =?utf-8?B?N3RqS3JtWmFjY01iYkhCejlmYjJUaElzMXdNcW9ldnVsMktZYlJKU3FYbFhC?=
 =?utf-8?B?NU1JelBabWFIVXpRTzhiaCsrUldVZjQ4d1ZnK3JmbWh6bHMrZFo3VHcvY0NR?=
 =?utf-8?B?NytjSWFYWlBhOSswbmJ0MlA3aGFpUTU3cVVCckl1OVREMG5lN0kweWRneUh2?=
 =?utf-8?B?azFPZDZSQlJROTFIMjBnSWd4dkliYUFZeVZCdGJ0dDlkSXdaQjNLL1ZFZU9r?=
 =?utf-8?B?eGY4VnRCeUlWMzd3QWZGYmZXUXF3THcxTkpBdkNuRWp1S21Ra1UxVDZlNWtH?=
 =?utf-8?B?emt2cWpRYTBZSEY2QnRRdkR3RG11K0RabVRLWkkrR2pBNnMrSE5kODJFOGhp?=
 =?utf-8?B?Um12aTVLcWVXR0RKdE5mcVhyUWJjMUQrb0h2L0wyVFlxNVdWN1dtd25PT2ZU?=
 =?utf-8?B?b0ZnWWZnOE1KQWw0c3ZxM3RGaEFDVjRlaENMZURVcGZwWWtVanUrNmlaWmVO?=
 =?utf-8?B?bFZ4Ukt6cmc5Qy80TjdwRFNzbG1EUGYzc2kxQk5SNzh3OEFRa0YrUm5BY1h1?=
 =?utf-8?B?aWdxZVBUSlZObzZFRUhLa3ZRajJLWTNQMFF5MTdUTDVYZWF6WHFpa1AwNEZB?=
 =?utf-8?B?ajhuVllqRXNPWmFxalR3RC93QkJweXdpWDRGcmdnU2xhN2tCYmFrZVl1UzlU?=
 =?utf-8?B?clhDMVVYb3ZsTnI3OW9VazhTZEhwa0N2Sjk0bGJzM0xEQ3A3bFdDUGhPSWwx?=
 =?utf-8?B?bTQvMU1uL1VCRnZ5Rkl2aHFzdUZ6cndxY3o5ZG0zYXJTd1ZkZkhER0VGeHkx?=
 =?utf-8?B?WmNIQ2pYK3MzRGNwa2hLM2tsbzl4K3B3ajdtOXM5Q0xhTnZFS2lQMTNqUm9X?=
 =?utf-8?B?TUpJWWRWcnRINXZWdnBrVmN1bTdiNWFvcTJ5RmwraEkxOWRZVGVYNDlGaHpH?=
 =?utf-8?B?eFd1WCtNQ2JNMjRnbUZVK2tjRTc3N1JPdE55VFBrZEV6YmZ0UC9HVURrOVVm?=
 =?utf-8?B?NkdsWUZZVWZjdzdUSzBrMnRxSXFNWXlHdWV6eFVJek01UUZJR0paZ1hTcFN1?=
 =?utf-8?B?b0htLzhoRTM2bmxPcnpjTHdRSVhSTTFObG45QnQ1R0lWbXlWOGZtNSthSUEy?=
 =?utf-8?B?MlBmcVpFSHFUYmVLWXNVZjcvMW90NTBiMlRiZThBRS82cEhmRlhGUzBPR1I0?=
 =?utf-8?B?blhSOHkyY1dHTXp1TGJBVHFPVE1xQVh4L1EvSTBUbnY1YVNiMDlGMWc1UThD?=
 =?utf-8?B?YVBpd0JQNVF1Q284SnZjVnkrczlUUlN1eWVVTTJCdEcvTlc0dFZzY1cyb0ZS?=
 =?utf-8?B?eko1dWdsYVNPY0MwSUpMSmw1bFdRUW5TT0hKN3ZFS0ExM1pKM002WFBpd1Nt?=
 =?utf-8?Q?NicfqZ/LlWgyajY8MsrwTe3oBBu5i5ct?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZYZlgxMGl2MDRUaXpITXpRb1lHQ1FOUTVHdTY5U0tiM3owNUpYNU1lRWRa?=
 =?utf-8?B?QjJoa2tqR0R4NEdIZVN3OTFHT2srTGRIOUZRYkFNa3V0SGIzUlI2bzc4cVhM?=
 =?utf-8?B?NTM2SmkrQ3Qyb1VLaTk3aG9KOCttQmdmU0pmRnhMTVozMG56UE1BdDNQL2RV?=
 =?utf-8?B?cVFrNXp3alZpNUtwTXg0bnZ3K1pxVjVnL2lBam9zRmoyc2xkaVk0Q2xMNjA1?=
 =?utf-8?B?bDViajk1SzlFdFFXZTBXaTZZYkU5S01NcFVTV29LeFFodkdxaE50cDQzRFlS?=
 =?utf-8?B?dmh5bm92TGpyVWZJYzRaT0pvNG81Z21CZ0VSUHQzUEJlMlVYVXdoYnBzOXh1?=
 =?utf-8?B?cW1oSUtaL2NHa1l2ZkE1ZFBKNjh5cGVqMkU2N243RUY4UFArb0xzNU4yblBo?=
 =?utf-8?B?T1dCSTJKb2VXYlFKRDk5bmVpVUY5U3F3QUVzR09xVCtnbGVTS013RW1VeTdV?=
 =?utf-8?B?R29VYzVRRjZYUmUrZiswenhwbmEwUWNsTTI1ZGN4blRkMVFBalc5c3ovMnlQ?=
 =?utf-8?B?WXFXcllsUEdGZDRRTStMMjM3U0RtMlpueFcveVdYMndUOGRRSXlLclViZm01?=
 =?utf-8?B?L201V3hHdjVBb2lldGt0Z2FLR0htSFhrS3E3Zk0zL3dZZkRmM0o3cTFnYmYw?=
 =?utf-8?B?cHQvcnpPZUY3b2lsZG12bEQ3TXExWEVXSlJjN3pscnV3U1ZwQXRaKzdkUzMv?=
 =?utf-8?B?UGlWSGFiQ2Z0Z09CQ0FVSkZ5MTFFYi9nL1dLN1ZYbE9jN2VkbVpHdHZZNEhV?=
 =?utf-8?B?cW1saFhMRStkaUEvdXYyekhTSVhBWkRueVVlZmxkSWVVSUlUMFgrM0t0Qm0v?=
 =?utf-8?B?OFVzWUp3NnR0OVJFSjRoTUdnVEZaQ3hsd1VldStZQkRmVWJKeG4rL0pTd014?=
 =?utf-8?B?Qms1dFpnWUdQOW13SCsvazBwcnh3NkFjb0hnRzV2aFVHYU5WVlNNSFBjY09L?=
 =?utf-8?B?RG9oN21tWTZqMGpEakQ5ZEhXaFFneEpOWjgrNThreUhDd3FxNWx4L05FOVBD?=
 =?utf-8?B?VUY3SXRmZHo0SUZ4NStpWktDSFVqSzA5TFFDMU0xbWdtTmZhZGlMamh0ek1K?=
 =?utf-8?B?amFVNkE2aVpUaFB1cDBJVjlJZTJkZ05CMkFEVFpRbGo0TjloZ2U1ZVp4bUN6?=
 =?utf-8?B?c2NHWE5qTUJNTDVyOUV2R3gycG4xVllQRUNvbWZFdEZZc3hIQmNhR21IcHZw?=
 =?utf-8?B?ekhRNTI1cElRREZORjNGdmdLMm0reVNDOFV6MlNUbDhXV2hWNm9RNEhQMEV6?=
 =?utf-8?B?c2R6anp5OUc5NTdnUHZ5a2ZhY2hzTHVIUmpHck5zbTRRWmE3ZVAxSVdaLzFV?=
 =?utf-8?B?MTBhaGhUZkl0ajRlam56SXRGN2ZhZ3hJZXBIYXVCT210RTRpQnEydzQ0clUx?=
 =?utf-8?B?a1dpVHBRcHM1dGwzTjYzNUpNUzg3cHpJa1JTWDdZQUVxczQ3ZGFPajIrbFdE?=
 =?utf-8?B?RFBFeU9pVGhtS2t6L3Vrc2dNSnVBdnBzb3NPTldCSFVRQ29BK3poK0NvTGZC?=
 =?utf-8?B?em95N0ZoY2pqNUxCVGh3MkR0YjBlNHBnWnJQVCtycExsY1pFcndYY25vV3JZ?=
 =?utf-8?B?bHQ5U3VhM3VEenN0dHpkbUsraHltMTl2dkdjWXFjS2hwNlN6bVB4Qm5odU5i?=
 =?utf-8?B?L2xCOTNoTnRKcXBaSDJWaVhUanF3SW5zNC9PNkYybllTSDJJOEI3NFcyQW1r?=
 =?utf-8?B?VU1nTk0vSEVmM01aaUFVMWtuV2NsRnhhdnpSa245K2V3NVR4Z1BqcGJPM014?=
 =?utf-8?B?RDJNWitaYzJLNXBObEVVQmx0Y2RwaHZId3ZSbVpGWjlRbUxVYTY4amtYWEU2?=
 =?utf-8?B?Qkp5bUJVN1JOWDJmWm96Sk9SZ0M3N3JSaW9yaS85Q2xRRUJwS2Z1TUs1bXU5?=
 =?utf-8?B?aHlpQ2l5RFpibC9TRUNROTBJaXBPMWlXSDFsUE5BU3o5N3dkdXU1NVlYTnpJ?=
 =?utf-8?B?Vjc1NXBaRzZ5SDc4SEVtVFZtR0M1Zk02NWxEOTdDQk5ZbG5lNVg4MHVvaEx2?=
 =?utf-8?B?WWpPQlJMQkEzRFlPZ2hkVnh4ZUN1MGlXVE5MUnNPMllBU05vbmZrUEhFZS9N?=
 =?utf-8?B?c014UnBYTCsydDVPM09OdGYvN2RhMjUwL1l6aW1mZUVYRTBvZEVCZlVXS0tG?=
 =?utf-8?B?c1UxVDhZbS9KZEtoSjI4NjM3UUI3REdFcUl0aVhNc25LQzRXSE9MTkZiN1Vl?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f7d09e-7d9d-4c95-4662-08de3971b25b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:29:22.3028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epnchJ+WsPgh0bfKJR9LG7XcmZAJ8java72J+cHfL4kGyuhO1kB2QiyMi2KnK7Gnw2O6MUBm+g9h6DAyfXWL9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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


On 10-12-2025 16:14, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from debugfs - dgfx_pcie_link_residencies
> to verify this.
>
> v2:
>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>   - Read residency counter as unsigned long long int instead of
>     unsigned long int.
>   - Print residency counter before sleep also.
>   - Don't assert if sysfs not corresponding to aspm_link_state
>     is not present. (Badal)
>   - Run workload before validation of aspm link residency. (Anshuman)
>
> v3:
>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>   - Move reading of residency to separate function. (Badal)
>
> v4:
>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>   - Resolve compilation warnings about using variable as format string
>     to sscanf.
>
> v5:
>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>     of igt_device_get_pci_usp().
>
> v6:
>   - Move save and restore of link states to separate functions. (Badal)
>   - Refactor and enhance readability. (Badal)
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 178 ++++++++++++++++++++++++++++++++++
>   1 file changed, 178 insertions(+)
>   mode change 100644 => 100755 tests/intel/xe_pm_residency.c
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> old mode 100644
> new mode 100755
> index d33a87b13..95feb6eb0
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs [] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +85,10 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   	munmap(done, 4096);
>   }
>   
> +static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
> +{
> +	unsigned long *done;
> +
> +	igt_info("Running on %s:%d\n",
> +		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
> +	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	igt_assert(done != MAP_FAILED);
> +	memset(done, 0, 4096);
> +
> +	igt_fork(child, 1)
> +		exec_load(fd, hwe, done);
> +
> +	*done = 1;
> +	igt_waitchildren();
> +	munmap(done, 4096);
> +}
> +
>   static void measure_power(struct igt_power *gpu, double *power)
>   {
>   	struct power_sample power_sample[2];
> @@ -370,6 +413,127 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
> +{
> +	int fd_debugfs_dir = 0;
> +	int ret = 0;
> +	char *ptr = NULL;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies" , buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read link residency file\n");
> +	ptr = strstr(buf, parse_str);
> +	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", parse_str);
> +	if (ptr != NULL) {
> +		sprintf(path, "%s%%llu", parse_str);
> +		igt_debug("searching for-%s\n", parse_str);
> +		sscanf(ptr + strlen(parse_str), "%lu", &residency);
> +		igt_info("Link residency %"PRIu64"\n", residency);
> +	}
> +	close(fd_debugfs_dir);
> +	return residency;
> +}
> +
> +static void save_and_disable_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_debug("%s not present to save\n", path);
> +			continue;
> +		}
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		igt_assert_lt(0, ret);
> +	}
> +}
> +
> +static void restore_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	/* Restore saved states of L1 sysfs entries. */
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
> +			igt_debug("%s not present to restore\n", path);
> +			continue;
> +		}
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
> +	}
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +	char path[256] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev != NULL, "Couldn't get pci device of upstream port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	/* Check if ASPM sysfs is present. */
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
> +
> +	/* Save current state of all available link sysfs entries and disable all link states. */
> +	save_and_disable_link_states(fd_pci_usp);
> +
> +	/* Enable only the ASPM link state needed for test. */
> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
> +
> +	/* Read link state residencies before and after idle wait time. */
> +	residency_pre = get_link_state_residency(fd_xe, link_state_sysfs[aspm_link_state].parse_str);
> +	igt_info("Waiting for link to enter idle....\n");
> +	sleep(5);
> +	residency_post = get_link_state_residency(fd_xe, link_state_sysfs[aspm_link_state].parse_str);
> +
> +	/* Restore saved link states. */
> +	restore_link_states(fd_pci_usp);
> +
> +	igt_restore_runtime_pm();
> +	close(fd_pci_usp);
> +	close(fd_xe);
> +
> +	igt_assert_f(residency_post > residency_pre, "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n",
> +		     residency_pre, residency_post);
> +}
>   int igt_main()
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +608,20 @@ int igt_main()
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +						      xe_engine_class_string(hwe->engine_class))
> +						do_exec(fd, hwe);
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>   	igt_fixture() {
>   		close(fd);
>   	}
