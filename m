Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3671CC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 12:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDE110E132;
	Mon,  7 Jul 2025 12:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERTx6hbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AC210E132
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751889817; x=1783425817;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KFJAm1Kaay4oN4lWB625AojYclVTb5pGPBhXT/kJYII=;
 b=ERTx6hbQPKMUWRQvMolD/db2JDlB4lJ88hzdDfNkAMV2a64r4lqbL5kf
 DqGBQxguk7MlvtZ/WBAgxlkU/oIAZyX+cvyfYMX2KqE6W5m+li2b4Tdxv
 /IfnSVtbxrxFE0ItY8hAKRnKmGiJccMsnqURtylUH37I+Fgbiuffa0rbG
 LM3uN819mX/zyJabvnZr+8pEbNA2fjIUS23MehK2Msd1a2ZLG6bhYwLb6
 H751YqgbbdlftxR+XRM+2jJyM3LcSghBux07O+ROvGBjqdeR01zedqjfs
 5ZvXSZJ/NUdiNcp8ZkUzNRtMUMOgzoMXBDG8lmcBZz4LCsXdGnSAublNR g==;
X-CSE-ConnectionGUID: Aqoqf2riTy6fv9ium0bN6g==
X-CSE-MsgGUID: UIAMogFkSGSNkbMbYm+uTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65172537"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="65172537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:03:34 -0700
X-CSE-ConnectionGUID: 4jSugV5dQjGUGPiV/JcyHw==
X-CSE-MsgGUID: JBvoPxVgTzmcPQnf4t1I3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155553933"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:03:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:03:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 05:03:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yin/w6ZhL5zLmTpCSWQTynW+JInUXy4UT98xM8aWHn/fel0jyrqLEdUP7vcS7HfQnGHq0VGcxNsSOwEeN7P1hAQSk0pA3P+acKR0D2F/EE65lFIKzC6I6S+lH+mnV/AaZZEUAvSZKytDmd50CsPuaHciUeVlvWd+mXSWf9kK7XCjNl2UnRuM9/Kck6jWsnPu77ZCx9IJ3Ii/WL9oJZj6UNBKKYTak7PiuxMCyAaLwYScZhzHSF2L2Jj4lQCD5XL7TEAqghvZ9Dp/Pr7u3E7Lhv06zKqg1rQ5gZegTom5/hHB9x3QJ6amznhonN8oKJb5W/x9BjSh6u5l2WLDxHVMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K98Wq4UDRSDcSZ3/8atBMBVb1wS8r2u7kNusgBpJNOc=;
 b=o8ZJ+8jRDmcx/GtVwTEVd9O/hNIGVEFDtoYjuHRnzGLJ+5cFDnzYsT+b4gcAS6f92ee28vmMhedYDuaJRayAlBs4qwl6IT2MMO4z+Qrg0KkFex/SSo5HPNMnMWVxvX7yv3vWniCZBlA70ezxDvx9VnG+85mc0iqXjveuHlOM4YofnyIwltBqbhTtyQN0GqQirv8SDKPXRdIJ/a2SZOImaSKbtjpWxYuQAqSmtABYamFz7vJEcwVpytJLYdLGmr9mGwTzIxU3PbSUnhp9Sp0QYzmMOMgiA37jEhEjBn2rmJl0SNUEEFaQijM6NmiMpDjhAPPeat9kINcAJMjqR4bPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW3PR11MB4746.namprd11.prod.outlook.com (2603:10b6:303:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 12:03:15 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:03:15 +0000
Message-ID: <014ed240-96fb-4af2-a998-48bf944665b4@intel.com>
Date: Mon, 7 Jul 2025 17:33:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip scalar2 downscale
 tests on Intel Gen14+ with specific conditions
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250703060353.74819-1-ramanaidu.naladala@intel.com>
 <20250703142606.108897-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250703142606.108897-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::32) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW3PR11MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 857dce65-5d5a-4e90-3369-08ddbd4e410c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YngvR1pMb0tDOW14cWpoS3NXUlc1akhXbm53dmxiQ1dldjhDRG5XSWptYjhw?=
 =?utf-8?B?NE1DUWRhWTdCdVdkeEdQNGYxR2pFWXJTbXhNYU5rSEpId2Exa2c2QlM4dmtt?=
 =?utf-8?B?aktjdlhGdjFhUUR1c3hndThpc0F2cmhaTm5vUjVQVlRhRjBuc2VCdGI0Tyty?=
 =?utf-8?B?aXoybmtiVkRBNTVscWJIQ1RlNlFha0VCdXVxcjJ1eTJva0FucnU0UEYxU25s?=
 =?utf-8?B?QVJlaU1rVDVtWFk3MTJNZW5UMUw3S3Q2ejNxZ3l2bWtudWU0UGlZWU9IaElS?=
 =?utf-8?B?Sk1WbTcrMm85K1NDZE43TGpOMnNJVDdCZjJ5N3U2L2dEb2tHR1ZLcDl5SnBS?=
 =?utf-8?B?eUpjWnJTVXJuR2NRUGNHSFVhdnZUOE5XbVlDV3RWa2twNGhORmdiUVZ5SDIv?=
 =?utf-8?B?VEFoblZhQm5GNmtIaFVFU3d4SHc4MVZ0YmNKbDI5c3hjRkx2OUxNaXJvVzBu?=
 =?utf-8?B?OE1IYWVOVUZRSHp0WjA0Ti9hOSsvTG1qZUJIUVpsblRCbGlnUHIyL25qSko1?=
 =?utf-8?B?Y0ZXbHFNUW93RTA5clBMc25sNzEvNlk5ZmlXNk83NDdsRFYwcjFRallyWDM0?=
 =?utf-8?B?SXdqaHlLSFl2S0dMYTRwQndkbGdNZW50SWJUa1JvV3h4ditrQ2Nwdmx2Vnhi?=
 =?utf-8?B?UXdwWnpsS0FVQWh4VUlYbzM5SVNiTWpkdUJjZ0pHTmR3MWI3WXNHNlN3RzBy?=
 =?utf-8?B?NGxkbGFWNklUQWRXb2dkRitMMi83RUgvOXJkOE13UVZDYlRZR2RDdEp0TFRP?=
 =?utf-8?B?MWgrbHdFMDRhR0dwd2FaN0p6R1ZNcW53bStoelVScW5hUDhJUCtoNjEvVndm?=
 =?utf-8?B?SnpSYUYwMlpUUjVyRzU1K1c0NDEyM0JGeDkwUlJsRm13MTNRMUwvM2JkSUs0?=
 =?utf-8?B?VEhxWDUrUzdwYk5NaG9JRHVIU1pHZW1oa0NjODNIdFJ5RThEbEh0Qk51WnR6?=
 =?utf-8?B?REZtN2JTS21YRUFPdU91dGs2NnBkZmlzNXRIdHUzdk5IQzB6cHpPVE80TERH?=
 =?utf-8?B?NDlqN0NzaEc2eGkrYnMrQ0RZUlMraEJpa0FQTUVRb2ZrM0daWDZDQ0U5WG1o?=
 =?utf-8?B?d1VRMG1odWJPZzQ3YnRDRXFVZFkwaFhmSE5UUitHZXAwQWhYZzdJVlViRVpN?=
 =?utf-8?B?dSszRUg3cXpIMFZJTFMreE5RQVhtcTBGRnpXVElKUG4rd3BTRHE2VnNqczVr?=
 =?utf-8?B?RzFGOENSOVc2QS9VaG56d1lFL3dVL1NpdldOYU4zWFZGZHZqTmw4WFlLYytr?=
 =?utf-8?B?NTgybzdpUW5TR1BKYWRIa1ozUDA1UnVBR0kvQWVxNnJDWVptcmxxZlN3NGwy?=
 =?utf-8?B?cW5BRUxwMlVyajZ4NUJOTTk2S2ZsRE9GSkhiT0pNblEzVlpjbmZiZFBUYlFT?=
 =?utf-8?B?YnFWd01UU2ZlbEptTElpd3lHQTFKaysvSGI5RitVV0FpbURBNWdvTzhBL0lB?=
 =?utf-8?B?WjQzMDVyb1hYcnUxNUNBb3dCS0hmcmRaakJwbXVQT3ozaCsvV1c2MFNGbkxD?=
 =?utf-8?B?a0toaFd3dHJ6d25UVTh1VC9ITExEMGZXdGZVTnd4MHcyQ3VNTHpiUkZFVHpB?=
 =?utf-8?B?QUlJeFhkNE1lZHR0QkhRcjZSQ2FvRld4YVkzek9aaEVsM29SRWxwVjFoSzBx?=
 =?utf-8?B?SkJuTVdReDY5b0dnbkFEU2daNEFnVEVQaDlvK0NsU0xjQmtsbEl0SGFLOEVl?=
 =?utf-8?B?b1JJMXV6cmNDcm1JOXVBcjFEYi82aE05Yi9QOXdHOFdHcWFHSWdNTnJvUjAx?=
 =?utf-8?B?YTBIMDZEVlRjQlVONlhiSG82K29YVHhzV0wzV1ljeHlucGprT3VqSE9PdFps?=
 =?utf-8?B?TmlibUpUWU01YlJqRDRibWxkcW9vRGVXYjZoV04rYldFVFNSM3BVZzUrTGRZ?=
 =?utf-8?B?cldLUDliczNuRFpjS1BuOVIzeDdVaWJycUt6RlBxK0NFVE9WMHRkS2JDcW9o?=
 =?utf-8?Q?sWTJxJA3IVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVV2MDEzN2lZdC9BOGsrM3hQYllITEdEb0RoOEg5eldEOHo4RFM4b2Q3amRH?=
 =?utf-8?B?UEZNT05adXRURTZZZVJEZ0Zuc2JKWmVjU1lBRjNTeFNCdDlZWENGMVhUMlZx?=
 =?utf-8?B?b053LzBLN0RnQW5HNjJTdHZMVVRjMFZBYm9qUFR1TVVCRlIzWS8ySkNLd0Uw?=
 =?utf-8?B?V3pYLytBZ1pJSkZsaytsd1ZlVGlnbHBzZkh3RUw4SFpvTnVwYWNsc3l0eS80?=
 =?utf-8?B?ZTI2UitkVlBiUVZsWVJrY1U0U1hTejc0T3Jzb3d6VDMwaDVyTEdVQ1hCMVFu?=
 =?utf-8?B?dDQ5WWg0cVlvTFJFTnd5eERLQ05NcGZGemUrMU1sVkpRbEthK3JyUVZNZmky?=
 =?utf-8?B?UG4zWkorQkJteE4zM3BJRWxXakdmTi9nU1JyRUUwdnY0QzlCVjA5WTFqbjcy?=
 =?utf-8?B?Skoxc2drZTE4eFdoWDM2QjZLWCtMZ01ObllkS2NKYlVwTEh6em1uQkZlcStr?=
 =?utf-8?B?TzB0RmVmTTl6NzBvV1lxQjloWEZCVUh6RlB3MEFRT1MyaitsM21kWGRVOUlh?=
 =?utf-8?B?SmxwOGtkTUFlTVlTeGNSUVZLWklrR05PQlZSUC9wL3hJbTBoWTlDU0dFcjdG?=
 =?utf-8?B?eXI2LzErL2gzbzNCTFkwOVVKTVo1bmpHNkRzZndvZTVEYWhqWE04UDRYVmdM?=
 =?utf-8?B?NGYxZ2pTazgrVUtVV0VHNEN2WjcybmYyNmdIa2k2cSs2RWV2ZTBDNUpIWVZB?=
 =?utf-8?B?YmhEa2ZnSDlLWVBINlJCWE5YT1V4Vy9QZXZBci9PdnhUanVCa1pnMnRkbUZ5?=
 =?utf-8?B?cmp3cTI5Sy9uN0ZBU3YwWFFZaXU1Ni9nMnp5SDUzWnRJeWhlQlRoNHNWajVV?=
 =?utf-8?B?cC9MZGJ2aVBZeEgyNlloczh2V0cwamRWYWhRQitzeHIxTmlMa0pHYlBCSmNr?=
 =?utf-8?B?MFZEMlh1YStYSEJmQWhnVFIrU0xpQ3dDSFVkQjFpSXZ4anVBTzJlWXF5TUxu?=
 =?utf-8?B?a2UxNUoxdnh4UUEzZldYMFBabE4zeUI3YzErZ0tpd2xEMm5HeUNrVi9iTEp6?=
 =?utf-8?B?K3hUTzhpY2xIWDNOVHd1YW9ETDBnNkh4VTFWVXY5TG4xcmdsZkRhSXhORFMr?=
 =?utf-8?B?NHFSb2xwNFJoSTVhZFEvTC90MUlsTVpXQTNDaVVMSi9Wa2lNT2cxMWI5ckpY?=
 =?utf-8?B?bDVzVzBsM2hOb2tCTUVlOEw0WjUrOGVnTWZ4UnNYaWVEWTVGWlBxMnRmT3B0?=
 =?utf-8?B?aDlyN1dMVmNrcUFvQS92UVhoNGhKeGpmR2JhS0pNdHlVbmNWajZFZS84MWFS?=
 =?utf-8?B?emxPZkRhU2FveGhNOW9IaDJLY0hEMzJFT1FOdm8yWEs3WEM2Tm53Z0pEQnpN?=
 =?utf-8?B?bEJZM09zWjFLYmtjWnA5NXZLU3VwVC9xS0IvRFJ4UUIwcnNOdkdyaXhoUGFJ?=
 =?utf-8?B?WUxtNlo1bWJZTG9UaHBMZlp5Sk1xWVpjbVRGbnMyWUtzZUQxOXUwUHd5ZFVC?=
 =?utf-8?B?NEZIU1IwY1VyU1lIYnZUV05CMUZ2bTVDUUJMYXRNTmJmcER5TkJJZUJKdUEy?=
 =?utf-8?B?eFRMd0xBQVVWV05PVmRZTWJVZ1RHTE9XR09QTWdSdWZVWWFYZDhNeW51cFBv?=
 =?utf-8?B?ZDlNd1NFZVZEaTZ6cllMbmVwNjBLN1Q0SmxCVnkrRDBlVXRTSUR0LzU0eDVE?=
 =?utf-8?B?NXRGbGxrMTI0U01tTHJBdGNTV1hTWUtxMlMrSG5iRE5xdVN6TVFCUVVGWTlY?=
 =?utf-8?B?T3RkaE5oMlZISGVWNkZUalZUZ3pubmZoUUJwbHUveW4rNFcwOGVDTy9LdWZO?=
 =?utf-8?B?bk5NWGMvUFJmc1ZtWnU3bkNqM3paQXQ5MDE1emZGMlJ4dlJwN2NuS09SdCtW?=
 =?utf-8?B?L0RYbHE1eFphRTRnMjF4KzJsOEU4Y1QyMWtjT0p5cklIeXliRjd0alp6TW02?=
 =?utf-8?B?Q25iM0tFYVdvY0xOMzJRN2p1andmRThFU3FVT1owcElrTVlYMlNMK2tqNWZC?=
 =?utf-8?B?MnpmNHJvV1JoRk1ZTjNIOFdINjN5cTdEaXBLWnBzOFAxWDQrdDVmWm4vRG5m?=
 =?utf-8?B?d0JTRTdTc3duNFovMEc1dmtqU3ZwVE5YTldsVXJGRXZzNmNkRWFFbkZqaFF2?=
 =?utf-8?B?SnVKVzdzOWYvZm1lSmJqeklyWlJzZ0NySWZDN2MvUGxKMEJBckhsTy9LVnZK?=
 =?utf-8?B?WFluVUlER3NBcHhJSnVlK3BRc1IxdklsL3hXeXk3anJ2aThmS2hlajI0NTlO?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 857dce65-5d5a-4e90-3369-08ddbd4e410c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:03:15.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o01IpGGbsGSPLGC/0nZ7wQRqdUgHFbv4fqKSyKFnaIKvFrTCpufqV1ZLfm8dwbSEI17tygVPs15K4E/VrMuXOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4746
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

Hi Ramanaidu,

Please find my comments inline.

On 03-07-2025 07:56 pm, Naladala Ramanaidu wrote:
> Add a conditional check to skip tests involving scalar2 downscale
Typo %s/scalar2/scaler2. Please fix subject aswell.
> operations on Intel devices. This avoids running unsupported
> scenarios and helps prevent potential test failures.
>
> v2: Use break for scalar2 downscale.
>
> Bspec: 69901
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 63d35d76b..46a65fc5b 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1536,6 +1536,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   			igt_describe(scaler_with_2_planes_tests[index].describe);
>   			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
>   				for_each_pipe(&data.display, pipe) {
> +					if (is_intel_device(data.drm_fd) &&
Create a separate function for this condition.
> +					    (intel_display_ver(data.devid) >= 14) &&
> +					    ((scaler_with_2_planes_tests[index].test_type ==
> +					      TEST_PLANES_DOWNSCALE) ||
> +					    (scaler_with_2_planes_tests[index].test_type ==
> +					     TEST_PLANES_UPSCALE_DOWNSCALE)) &&
> +					    (scaler_with_2_planes_tests[index]. sf_plane1 != 1)) {
For consistency use 1.0
For this condition add comment,
plane1 : unity scaling plane2: ds => scaler1 is free, so ds can be done 
using scaler1.
> +						igt_info("Scalar2 does not support downscale operation\n");
Fix typo here as well.
Add a comment here something like
/* On Intel display version 14+, Scaler2 does not support downscaling. */
> +						break;
> +					}
>   					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   						for_each_valid_output_on_pipe(&data.display, pipe, output) {
>   							igt_info("Trying on %s\n",

