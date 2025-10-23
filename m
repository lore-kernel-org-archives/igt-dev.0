Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCA7CCD193
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 09:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924B110E8F5;
	Thu, 23 Oct 2025 09:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DD8vHygR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709AA10E8F5
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210045; x=1792746045;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a0ACPIH47QxiHRDK+yFwjKxgSFgMyXxrLfb7aGziLEg=;
 b=DD8vHygRAwhZKyxh3hiQb4i7by47g8g/rmYXIMuAVOhCfxJlx/Thn668
 EDXsJ6jgyTKNE8vERWB+31ElZ6UpilzYGuqpBSEKsdI9uy5sWcTQhl8Yw
 727f6x74f8i2uZnJFLxPkhqHDoXDzrdKPhIYw/VVeRN97REXNtbTo4u3l
 /NYxkQ+CMESzGrWc4TyW9LC/+0cD3XsiXtTjCa6JnmzPMrbfFAK9UQCjH
 mVsenk7g7P7PeTobVnigE09qYr5letyOHmJPX9NIvZNrkaYFcU/nfO4zK
 l+b2EpbpXSYyzLp7mDgQwlFBkbFLI4Crav46yJEjrdjtxHU2gtc5YbJx0 Q==;
X-CSE-ConnectionGUID: E+73qE5RSH2ByJO665+EtQ==
X-CSE-MsgGUID: +yVMNXDPQrasEnURaDBmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50953791"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="50953791"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:00:44 -0700
X-CSE-ConnectionGUID: 6xZqcNYXRVae7ogssO83bw==
X-CSE-MsgGUID: 8YsAQbKgQxq3DcmhiEqmFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="215033546"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:00:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 02:00:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 02:00:44 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 02:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiZY6xWz1z05zrMhO67Dk7yrffkL0xHZakPt2a7oT+2XMLPki5KBmOgpSDndBvT7/yaZ/Mcm1dpVAH4wT6DRTINlFHqFvzTpNCa1kDLuczwNIZXB8B8r0CVAW+WdzhQtKO/t2ykWIVA0t8ATBDRTIQ1kfohK+8KglpiJrToj8s6fX4dfLOmQEq0LzbmPPIXnDsNjyFeKy0rVN1Dbt6odzowuk1hiYB1qp2gTBYWqcnlVQAQasb8ROAjx0mYtSd8zOV/zyTfbMGg9nFjkVXB2LW0aTHZx1MAekl0K8PjgnDCoEm99WoaUne6mBp71CBQI30ZJ6gPM0gYNwbQpm8U+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9OldL8usR3ko1zLZ9CNVB4oWG7G182dgGuvLsqpB+4=;
 b=whXdAEedG86juU0jt+POhE5gqZWCswdJWBrn0N9Ut99X8AL7hpRKeZtywTKXJ5UHgWlhTOcecFJMpUSJSWG3Y9Wn5r+FqA2D9IvzRGMBRnDyjRaFi8NSd0SqZue2soM0gWFQubsL3ifTHN0W36dElzda+RZz0trsSF+CQkDUlc7EheO+fyqrCck8KGN5YeIRaNZKfrCRKRjAKoRreFtWnek74TD0/hjd6EB07LUC5Hcod3cAvb3CnYwSZlBMJXmWoj9/qMZM0nNniu1VbMnGaWkMa5tyYyOyLUjDdvrWOu5R9eWLZUTrKcYsWUIIv08C7J2VnenQ8+jvUtKKun61yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB8119.namprd11.prod.outlook.com (2603:10b6:806:2f2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.13; Thu, 23 Oct 2025 09:00:35 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:00:35 +0000
Message-ID: <3c3fe449-4e2f-4d43-a4a4-fd7cbad4e130@intel.com>
Date: Thu, 23 Oct 2025 14:30:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v6,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251013194910.1065392-5-sk.anirban@intel.com>
 <20251013194910.1065392-7-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20251013194910.1065392-7-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b850d4-4865-4829-2255-08de1212a094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1lHUGRPSmVNTzVOaElla1NxU3NjQ3pLMGlTdXorUFdEKzFtOThUaE5naWs0?=
 =?utf-8?B?OTZZN1ZYM1Z4YTBsb21tV1RSMElZblpkbUhKNFBGeHdKSVRXaTh5YnBIVVJv?=
 =?utf-8?B?dVpNQ0ZuYXJiZUppejFKRHJXK01KVVdRYlZoWTZ3Vy9abGVqSGorcUJXZk9i?=
 =?utf-8?B?L0lBbVE1U3JXT2FpZVJyaDYzdExTY2VESlNQRm5DVWxMZkcwakZ5M1JPV1pP?=
 =?utf-8?B?Q0ExMGNaQXdxQW5OWm5vemlsTTNTbEVMUGE0OHFZNTIvSjdOeGJyN0lxUm5m?=
 =?utf-8?B?MjVGcDdxQVB1Y0E5bDNsOEV5TDZrT3IwazYrTTVBK0ZRTmorL3V6bjZ5czNE?=
 =?utf-8?B?TFc0SjRwR3k1c3E0ZWJWc3VVUjNTYkt6SXZJR2l1RUx5Znk5cXhnSVlhYXR0?=
 =?utf-8?B?UUFGRmdDOWtaK21qODlMczZhS0RIb05Id1B3U0w2SWZuNUFMQysrc05rREUw?=
 =?utf-8?B?d2Y1SWdiVHBYVUlnYVFUY2hZSjZCc2g1TWQ0UzlWRjZCUFU0MzU0a0xuZEx2?=
 =?utf-8?B?cWMwRTl0aFZpSUxuU0gxc1pMSld2eWtZOGNwbDNMaEVuWVpNTHd2YW9kdlJU?=
 =?utf-8?B?Mkd1NjJ4eEVEWkRmcmFMTVF2My96WXVJN0UvaXU4WXlWVG5PbGJNK2U4YXBB?=
 =?utf-8?B?T3VCK3R1LzJGK0NXSTloOEd3SDBTS2FsZ05rc1VEUDRkSXZFcUl6SHY3ZmRy?=
 =?utf-8?B?MEoxNDRGN21Odm9TdEg0Y1U4UDhQdVRjYitweGV5YXp4NFI2bVh3RlhiWGlV?=
 =?utf-8?B?VUtiWjdYWVdmUThDVVJxaVFuTEVQbE1tNWNPTy8rMmpUSkI2SzVMS3VXcDJm?=
 =?utf-8?B?Zmw1aWlVVE9RUHk5cjdlbnFFVWFOaW8vWVNqWGhPRFlJTHcrMUl5MFhTeW9i?=
 =?utf-8?B?Nnd2UTArUWRna0xnaEpCZ3ZJOXl0ckZlaVlxVjlSanBnc3ZsaS9YZzNScXNq?=
 =?utf-8?B?MGFZQk1rSXZMLzVKdEZvY1lHN0ZoYUZvOHRxSVg0QTV4dVdvMEhZdmV2Q3FQ?=
 =?utf-8?B?ZzZHZy9tYzZrTFFlbW9EWm53N3hkUzY5SDUwVW5uRlBFSmg3QVdGNzIzUjEy?=
 =?utf-8?B?dCtqazRCdU5qWkxNMEtYWFhXMkJOMU1jYlh4emJUT0xBTmRWNStoUTZDWFJY?=
 =?utf-8?B?a1lkaHpuWFVmUWN0L2hJYnV6Zk5uZW9tdmVzS2RiS2VMSlpJVnhob25LM3Q0?=
 =?utf-8?B?WTFpK0FiRCs4dmxrWWUxdFJ0bHozelQydHB4YzRFWUI4aXRIakIycWRkQTlJ?=
 =?utf-8?B?b2FBL1BIUEhsRyt4ejFhdHlJZ0NtVUdveDg1TnR0ZzJ2ek1qbkhON09mbkV3?=
 =?utf-8?B?L2dKUGw0OW9WdjJ1QitIc09zcE9PemloSmZyenJiU1BGYklEOGhaWDhMNE5P?=
 =?utf-8?B?ZWIzblY0MUd3ek9OdS9XMXF1VU9zVUdIZlFTd0VBYk4xZHBvZ2NRd3ZjTGtN?=
 =?utf-8?B?MTU5SDAzbVhLbE1KSjg1WE55VVVwdnN3V2FTK2p2WnYxQmdsZkEvKzVINXNW?=
 =?utf-8?B?VVR3TjBQYnExWEtLUGxpRG9xSkJmOFdoKzc3WHM0enNZRUxlSS9XSHJOZitj?=
 =?utf-8?B?R3JiZ2UyVCs1NTRUYUZLcElwWVlWRHI1emF2ZHRNcG0yZXBXdkRVeEluallM?=
 =?utf-8?B?Z3puTXR6a1J4TEtCVHIvSjdUWkFibzVoQlkrTkFXVFpZUzdkS1BZRjdqazRw?=
 =?utf-8?B?N21PUnV3SDBtOC92bnArNm51ZCtiei9vdWdpRGdPMFEvdHF4ZXJXOHRSOXk4?=
 =?utf-8?B?MWxrMVZJeStaMzNBV3NBYTUzVnlFSW1pbFJhQlo0SkFiMXBsKzRTNXIxYjVq?=
 =?utf-8?B?KzdpQUMyUVVuMGg3ZVVKRjRxWnc0SWF2dnhGZjRQSXBLaUZDbGdJVEtkSHFS?=
 =?utf-8?B?R1pRWmNOdkdrdktoSCs5dCt3T0xuS0l6dWtCem1RaU1Xc2JzbTB5cUFKN3Zk?=
 =?utf-8?Q?wOsxrSmWvgZfSAnW0ZAtTByFWCTqQlL6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU91MGVLZ0tYY2lOdzJ3b1dSYWZwbFc2RHpVRTJGb0ZxcHBSanVjT3BYRmlr?=
 =?utf-8?B?bXNWVTBHT2ZPLzBhcEgzLzJwbllyVHJodnVkMmxuenovdDd2MW9kcmlYQ2lu?=
 =?utf-8?B?YlVGOGJkUGRaM3ROYjhsR2tmU1pWajBkQmdkQnRtVzQzV3NmcU5nTDhxU3R2?=
 =?utf-8?B?UmtxUThLMGlQOHg4S2NBOEZzTTFhODllbndZVjh0VUhvVU5KQU0rdGpCSDlS?=
 =?utf-8?B?N2xWajc4WUdudk12SDdpbkZhRHNPMVk3R2N0NTVuMDFLZ2o1bEUxR3pVeVYw?=
 =?utf-8?B?LzFrdkZFQ1IrdmhRUWZMVnk2NTJONDJOQi9sMG9ob29PMGZmdy94V3dFNDND?=
 =?utf-8?B?Vmh5TG5YUlVUMEN1Z2RINEFYeWdLcnRMMER0UWwzUUxMN1VkNEt0RjFDWXk4?=
 =?utf-8?B?N0UrRGVtL09FTnNzbFhwSjZqQ0FHdmRCQXVMdFNWemdjbXN2dDhqYUtuWU9G?=
 =?utf-8?B?NEJCa0hERXNKbGFHbERVQ2dTZUtTUnhTemFScHdMazRFbFhXYVdmRklIaTl2?=
 =?utf-8?B?bU5SUTZQdkY0dDV5dmZaWG00bXR2ckRnRzAzOUVSUzhHaHc2YityK1RpU3g0?=
 =?utf-8?B?U2NhSVUwRmc2VGxRS0lOazI5RzQxdDZFVk5xa0xNOFBJWjl4YU95QjY3WHMr?=
 =?utf-8?B?S2M2MjlWU3htb1BvWEdEaERkT1VDclNPVEtTQTR0V1htd1lyTmt6Q1dIdVdi?=
 =?utf-8?B?SVJrK3VjL3g0eFV4K2d4SGN5eUptQU1YbHZydFZMYzNvRjVod3hTbndRdUNN?=
 =?utf-8?B?d2VTa3NyTXZxSGZtYTV2Y2NJaW1DemxTZ21lVnBUWTdXWlZEb0RNTk9icStF?=
 =?utf-8?B?Q2dJSTBxN2VOZXlCajFTVklGZTV2Q004cEJxMG5MdzBHZ1hIWVRnRWhYeWMy?=
 =?utf-8?B?cXAwM2tVUWIxSFM2YWx3SkcwT1ZpRExiazloMGtHeXRrcTdsQkdMTG4yaVBJ?=
 =?utf-8?B?bkUwTlEwbERZSkcxam9Xei9pM3BJVXdaTVpOSXJaanF3aW1kaE1kdzM2cHI5?=
 =?utf-8?B?K1A2Y1o1K0F6cXY2NG9GcDBrT3hDd3VaVkxQenI2WDVHc1Z4M0pjVjJoRWs5?=
 =?utf-8?B?b0ZCM0lRek40V1ZISFVCalpzeXFZdXpYakQ4RHFEL3VHQ1BNRlcxZWRjdjRB?=
 =?utf-8?B?QzdJN1FqTjRVUDlMZnVmZVhHWXFLcmhoNmZaT0t2T2NtTEJmK0RJVnFNWlVX?=
 =?utf-8?B?MnFxUm5uUSs0ZEM5MmRLSGYrNkhkMXBFMUxhVlZoWDBXUkF2T3EwMkl4YXpi?=
 =?utf-8?B?SSs1N2d1WEhNa3R1UHhKbTA2OUNESE91TTVmZ0h6cjVLZGtKWGF3TnRTeDM3?=
 =?utf-8?B?V2QxeGMyVHFjSXRoRUEwdGxRTDBPRFBNZUVQK29FMUR1OC9lQ24vSEl2eElR?=
 =?utf-8?B?WHg2Y0d3VGdMYzlyQU8zaHRac0dNT29iSnFKRzZoVmtLemQ1K3NIZ0NXb3M4?=
 =?utf-8?B?S09zUEJEU05oYm45TkZZcStFMm5OWmVUM3l0U2hpWlVjaHVLUlducmhKdzJn?=
 =?utf-8?B?eXpSaXNpY3BORkVZMDJIaDNVdkNOWnVvUmJaTjZrL3MyMXFKZmVGdDVzeTM1?=
 =?utf-8?B?REdEVkVpeXhJcUM5M1ZuTnU2ZnRDQXF6RTJzNTJrcUd5aktiaHYwMk1uY1c2?=
 =?utf-8?B?WU1WY3QwcGUyekppWElpdXNlQ3o3QjZnWGN0SEl5ZUZEbHVvbDdEckVEMEQ3?=
 =?utf-8?B?bmtqck4ycVRqR2VMNWZQRFBKbU56dlJVbzdjTXR2eVpyZUdRaHFNV0pUb01s?=
 =?utf-8?B?YmltZjlsVWFGLzB4OVpxaFI4a0dlNGJyMnFHK1lxL0d1SXNxeU9pd01CLzIy?=
 =?utf-8?B?THJyVEtyMVZKQlY5eFhWdmVQNHJGbVFEWHdSZG9tdzV3Q1pPVGlEd0VRNmdv?=
 =?utf-8?B?WGxEOFZsYklXSzJrRWFuZDVDYWE1dDYxUklkcFZJd2EvVzBkNHpHT2puejUz?=
 =?utf-8?B?R2tuVnAxR0c1YmZHaUtHVlpHU20wWEZhTkJDSk52UFhlaHBXZ3ZPQW1SdHdx?=
 =?utf-8?B?THZJaDRGUW1VWG5LWDNPVkVibFFPbW1tdnF6MmIvUFJJWWdOYkFacHB3SjdG?=
 =?utf-8?B?c3BWelNrRTdUMUFrb1hvNlVGNVRuVGFqdjlBbTVCU1FrK3ZHZ2lnT24yNHU0?=
 =?utf-8?Q?XZw2gmJBC8BagwIQoee4EKVgG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b850d4-4865-4829-2255-08de1212a094
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:00:35.4913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9qWLrup5zHg6IqsJZ1ET3KgMtyK1Uc/x1kF0fZK/1u05FgfQXnx90FwX7JBvsL+xJDZFlgyTekBg37/4jFPaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8119
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

Hi Anirban

On 10/14/2025 1:19 AM, Sk Anirban wrote:
> Inject CSC error using debugfs to test vendor-specific device wedged
> state and runtime survivability mode.
> To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> v3: Update commit message (Riana)
>      Modify the uevents interrupt handling (Riana)
> v4: Move test to xe_survivability (Riana)
> v5: Use separate function for sysfs (Riana)
>      Cosmetic changes (Riana)
>      Use basic spinner (Riana)
> v6: Move VF check (Riana)
>      Modify commit message (Riana)
>      Add test description (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist |  2 +
>   tests/intel/xe_survivability.c           | 88 ++++++++++++++++++++++++
>   2 files changed, 90 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 017e3ba2a..5f27baafb 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -185,6 +185,8 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
>   igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
>   igt@xe_sysfs_scheduler@job_timeout_ms-invalid
>   igt@xe_sysfs_scheduler@job_timeout_ms-min-max
> +igt@xe_survivability@i2c-functionality
> +igt@xe_survivability@runtime-survivability
>   #igt@xe_vm@bind-once
>   #igt@xe_vm@scratch
>   igt@xe_vm@shared-pte-page
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index e4418361d..05ae4a75c 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -4,6 +4,7 @@
>    */
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <libudev.h>
>   #include <limits.h>
>   
>   #include "igt.h"
> @@ -13,7 +14,11 @@
>   #include "igt_kmod.h"
>   #include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
> +#include "intel_allocator.h"
> +#include "xe/xe_gt.h"
> +#include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>   
>   /**
>    * TEST: Comprehensive survivability mode testing
> @@ -26,10 +31,24 @@
>    *
>    * SUBTEST: i2c-functionality
>    * Description: Validate i2c adapter functionality in survivability mode
> + *
> + * SUBTEST: runtime-survivability
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + * to test runtime survivability mode
>    */
>   
>   static char bus_addr[NAME_MAX];
>   
> +static void ignore_wedged_in_dmesg(void)
> +{
> +	/* this is needed for igt_runner so it will ignore it */
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_");
> +}
> +
>   static bool check_survivability_mode_sysfs(void)
>   {
>   	char path[PATH_MAX];
> @@ -42,6 +61,36 @@ static bool check_survivability_mode_sysfs(void)
>   	return true;
>   }
>   
> +static void check_survivability_and_uevents(int fd, struct udev_monitor *mon)
> +{
> +	struct udev_device *device;
> +	const char *dev_path;
> +	const char *wedged;
> +
> +	check_survivability_mode_sysfs();
> +	device = udev_monitor_receive_device(mon);
> +	dev_path = udev_device_get_property_value(device, "DEVPATH");
> +	wedged = udev_device_get_property_value(device, "WEDGED");
> +	igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
> +		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
> +		     wedged);
> +
> +	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +		     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +		     bus_addr, dev_path);
> +}
> +
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
>   static int find_i2c_adapter(struct pci_device *pci_xe)
>   {
>   	char device_path[PATH_MAX];
> @@ -119,6 +168,18 @@ static int create_device_configfs_group(int configfs_fd)
>   	return configfs_device_fd;
>   }
>   
> +static void test_spinner_after_recovery(int fd)
> +{
> +	uint64_t ahnd;
> +	igt_spin_t *spin;
> +
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd);
> +
> +	igt_spin_free(fd, spin);
> +	put_ahnd(ahnd);
> +}
> +
>   igt_main
>   {
>   	int fd, configfs_fd, configfs_device_fd;
> @@ -145,7 +206,34 @@ igt_main
>   		fd = drm_open_driver(DRIVER_XE);
>   	}
>   
> +	igt_describe("Inject CSC error to test vendor-specific device wedged state & runtime survivability mode");
> +	igt_subtest("runtime-survivability") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +		force_wedged_csc_error(fd);
> +
> +		check_survivability_and_uevents(fd, mon);
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", bus_addr);
> +		fd = drm_open_driver(DRIVER_XE);
> +
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture {
> +		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +		}

This is applicable to only runtime survivability, Can move it under the test

With that
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> +
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);
>   		close(configfs_fd);

