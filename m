Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814C2C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 23:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEE910E321;
	Mon, 14 Apr 2025 23:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeiRbq7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C6310E321
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744672597; x=1776208597;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Nh13JxTZ652a2xyJMS9lQPxJRX7a2DAofKJ4UpV3aAQ=;
 b=WeiRbq7ORzZxjDq0bpx74zaHkMk0wUK4X/IMFCwP6gwezrkZFINV7I4o
 LKpUbznkB1sIWhMHmJIU/FyakqvotqbHQdjOLwoVIZ43QG0BFR7vrn7rj
 IZFQ1u5ZygTddwOwWxbIbfB5A6a7Wqzpk99vt76Ww6y1w/YTndcGAhkTe
 ebOW5sPZXE2QCTV/LAoSO5ONU12eQOUPtfnme2pM8gVvqNWdesXx5EZVJ
 jd166iociMc9knItEvraNB8Rv9YIGIPu+YH3RQHqyrH8ZUrliXsaogvH0
 MZc3L5pJKgTx/pISMmSauyO8dAI4WMKee+H34aWt4dOmsIZrhhxJ2F2DI w==;
X-CSE-ConnectionGUID: QCLc1zARTVCqI/e6M4DiDQ==
X-CSE-MsgGUID: f9fSVU0lTIiIATd731xRlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49991867"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="49991867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 16:16:36 -0700
X-CSE-ConnectionGUID: a1/nuAO7RXCwBaKkWVSA1Q==
X-CSE-MsgGUID: ISI682zQTz2pa01Na0Fn1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129795329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 16:16:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 16:16:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 16:16:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 16:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcfhisoSP5t9HzCwb3LvdYSaa6r/TQPFto7PLqy41B2gwyh/MwJvaeDDt2Fi1alc+NEI+BthtaCG5NSeisfW133+7AotjgGNK5ERbfT5l5kx8dwWK5LF+2d1cYiZGejMwrw2/+NyiLiFNm4IUQQtcSeCRTRyxQ+i+Wec3eyA5O/Tu/YExHdfLKk2zRJuiWqSovVhy8YW0xs25mp2Q87yf2U4R6z+RUnx1M41KVEtWLpUzXSIaIFzL16e0FzgrSpGWN7UfBFCgEygWynDONHUt72Ppf4M48kuGFe7ajsjZJqiJAQ77dMzKyPKchlVtTDWXyifNQkJGwr/irwD2CVIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMPRD0ku1sA6M+Wc0vrV6+RrZ7IRltNFPkEsap9JKeU=;
 b=shT8rhLxPysnlF9fY7RcJTb8Ko536bdjuFzOnPjbzjlE3toWXhCCHerd51g2XRp9x0QxsyWvgOfy5QNxUwnH4N8H00BMmmk4vDdagcMSK6zL1iOuOnYFhILVsrH6lQrS4tSpo+vG3nw6UZqFZoBqBeoQ29MHBE++v1VEPVR8trKb7izAYVTo0HEVC91FgvQrUiaw6flTCRV7Kq7BVn763sroiGgV/bpifvgYBWDYhUIgpIxBbDfhjP3wlFch/1XliLhkws1QsMUCsqGVm5AiXqCAflkqQEuGnUHUB7QX793pIEMedJW5TH6mQU5XXAWMwll4XGnfsyUCuIsz/Rm4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 23:16:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 23:16:32 +0000
Date: Mon, 14 Apr 2025 16:16:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/6] tests/intel/xe_oa: Sanity check PEC report
 data for TestOa metric set
Message-ID: <Z_2XPsn5Up9KGb6T@unerlige-desk.amr.corp.intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
 <20250408181210.1052760-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408181210.1052760-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:303:16d::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 72322f6c-2bad-4f37-4db4-08dd7baa64b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEVwZzJINlRqcUl2M3lRUmxZaG45NEp4M2dRb1F3RFVhblpvcWhjM3ZEUC9x?=
 =?utf-8?B?Nm9vSkN0blhtZkgwMklPcDdSL3FTb0I1S3ZnM1lmT0NnSVM5KzFQT2NhOCtZ?=
 =?utf-8?B?ZGZaWW02YXVkRXllQTFOL3JaSzVyaVlmdGhtYW0rd1JOcjJnbmdRRWgyTVVJ?=
 =?utf-8?B?SStvNS9QVEFwMzRSM1JHUWVHWjQrUEFreDJLUCtIQTkzcHZWQVJ6UXJVL21s?=
 =?utf-8?B?djUyZG5xMjZyc3B4WXozOW9VQVJwOGhxdUxjT2dCa1dsNnBLTU5GM01VMEFj?=
 =?utf-8?B?d3B1bWZXeHQ1TDJ3UE5Db1gydzFyTjJQa3BaNnFrUTBnQVlSSis0MysrdUlM?=
 =?utf-8?B?WE45Z2QrVmhiSUlXNzhHaFFROGdxMDNCeTlDUU90emdteVFWTUNEbGZ4UG1U?=
 =?utf-8?B?R0xFd2czcWR3TmRKWWp4NkFCbjU4ck1xd3VWYWROaVhqdTNjTzBoN1VOa3Rh?=
 =?utf-8?B?eHpUcnZrYXJXYk1iWEQ0eU1SMU9kN0lsd3JWaFAzZnIvTTRMbmRYTDV1eXJE?=
 =?utf-8?B?VG1RVFhDdHNDRlgya0pCMy82NGFWNFM0L1h5ZDNoZGRXMGcxdnk3dFcwQ2s5?=
 =?utf-8?B?eEg3azB3QUNuUU0yc0xoaFRodHlwZHR1Qmwyemc2UldRZjNNTlFTRDJQOU53?=
 =?utf-8?B?YmRxVGRLMzBlS0tFOHkxNUZvV01HRjFTbWlNT3Uvd0ZRYXQ2a1A2U3I1ZjUy?=
 =?utf-8?B?NTZGQkNpT2R1YjBxYnlXTWs4S3BFbDdVbkdQOHdlVGFOb1dvdG4vSUEwTzJ0?=
 =?utf-8?B?dlJYbnJiVkFQSnlPWVFobzljK1JSWXNJSC9xUmVPQks1MnhTZkg4UDVsUmJh?=
 =?utf-8?B?R2dtcmxmSkRzSmUxdlJLZkhwTG9ZbUthU2U0TzAyRVNWN3pWb3VYaU5hMTNo?=
 =?utf-8?B?cWdRTnpIQndrd0NUUEZHNkZVRzgrTTN3VjUrbEt3VStDcUFGSXVCSzhuc3Zy?=
 =?utf-8?B?WGVqeFNVbjF5ZkVEdXhVWXZ5MXM1Y21DanNzM3IwblU4a2hIc2p3c05mN05y?=
 =?utf-8?B?aGZKSkNoK3d2U1JWUHFoZFN4TUZINnZ4VFNUbWI0ZXBiTlMzMFRXZnIvV29M?=
 =?utf-8?B?eG1YV2NLdzkrQ29iRTd3TTNqSk43YU0wdVRpK1lIdkUvZEFwUEVNbDZ1dEVO?=
 =?utf-8?B?U2ZHb1VrYmsyVlpsWU5nWWhsR0xiT1FucnJDczlreWxnbkhOeVhMbWVySjU2?=
 =?utf-8?B?V2RoRW9RZVdtK0RDWnlZT210WURRNEJQcmNBdlJoZXc2UFk0MlVRdGhPRWVM?=
 =?utf-8?B?V2ZKdnp1aWE5NnA0c1lRVjV2Q0FIWE9mdXJkSFFLQ0RsZUNUeVBFRWdtQWI3?=
 =?utf-8?B?d2pSU3pQNjlmd1J0SUhZSU9jOXl4d2UyYzE3S0hqWUlIaHBmUlB1UEJ1ZG82?=
 =?utf-8?B?MURVc2VGbWR4bFVjRDRJdk9YY0VUa2RnNHBiTHhoOVJHWWhBVEdaWFM0QzEv?=
 =?utf-8?B?YW9tdUpNR1lJQThBNFRuN2VuVTBPWU1LNXE4bDZXMG40RDBPUktIRUp1MzZk?=
 =?utf-8?B?MkxBOVpTUWMweGVVV2FEc2NOZGNFeGxXaC8vZisvMGF4RzZWTTVFUmRzL24w?=
 =?utf-8?B?UTJFM05iRk5sQ2g2SkNldlhZUnJ1UVl1NWZpZFV6cWZrKzVJa1pGK1dzaDV5?=
 =?utf-8?B?Ui8wSDJ2S0x0bFRGRmRtUVVhcC9Zbk9HRkJFd0FoRFdVNWlLbkliV1RudGl5?=
 =?utf-8?B?aW9XM1c3NGJHa3NUMzlxb25OS245dlo3S1hlZ2N4V21OMlNFNEpsbDBMdzJS?=
 =?utf-8?B?YUR4WGhERkVSRStOMERCYS9QTGczU3A3WTBkdDJlbkJ3NU1xL0JZTzlxSEF0?=
 =?utf-8?B?M2NBT1gwUys1eWpnK0hRL1oyRUJRSVVuZXZxbmwrVXJHR1hEU3k4aW81a3dH?=
 =?utf-8?B?Y0krRlVIeHpLSWJPSjYvSGhxYlhzQW1SVEZOSTBPWkFzS0FLWWczNlpXZVUw?=
 =?utf-8?Q?tQHpQQ7tMSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVB5ZmxLeDN4QTV4M3U3am9UdklLZnhJdjQwdVdRVHdxcEkvRGJkZEY2UHZG?=
 =?utf-8?B?ZzJsMnh6cmwvc1pSbHNDaXFiaEltTENKMHdGVVUrbTNWN2hNUFJGTjNjQ3JH?=
 =?utf-8?B?bUpHRU0wNVhtcUViWW9vSWsvSEhxNFFTVEF5N1I0TElmUVl5dE9Mb085Mk4w?=
 =?utf-8?B?dk1mNk42Ky9pOGp3T1pFN2tQYlhUYUNJRHpOUzc0ZHhRVGRqVTJsb3ZaUGJR?=
 =?utf-8?B?S0hSM2tPNlppdnNqejVDcGlCenRqT1dEREQ5eEJnR001dm1sUVFzUXZrQmVr?=
 =?utf-8?B?K1BzRGtnUm9OK2dzVGxCaDZzdnplNUNMT1dTcEdiNW9pTHQ0L1JaNUpVRmxD?=
 =?utf-8?B?anJVeWVGaTZFTjJrYmE5anJDSmF0MWtYeVpFdW1ZcDc0TlhhKzNzbCt4dm5m?=
 =?utf-8?B?TktoL3YxRGpveGlLalVoNWgxZCs0Y0hxMkZZUkR4YWE5VURMZFNaSjZmbDdC?=
 =?utf-8?B?VEk2alFUZnYrZ1RveUk3MDhjU245ZUFOY2wzekdyczZCUFpQUTZCUldtb0ZN?=
 =?utf-8?B?eVRWWk5RZ2NGSisvdzBReU5OTDZrcXZ4NUFSL0FBYmRta3hjc2srTU5RUnpv?=
 =?utf-8?B?b2VlMmF4ZS90bXRSbHd1RHlkRDNlMWFOMTFCd2d6R3U4QWIydG9DYzdYQnJR?=
 =?utf-8?B?emlZTUdWUTdOL2Q2NTJwRktEbHgrejJCVTlraUljZFFZZUl0cWFUYVFsSm1h?=
 =?utf-8?B?WTFsMUhGYitIMnJyd3d1UFF6TE5LUW1jN2xBcEZqYjY0WERXblJEM0dTOC8z?=
 =?utf-8?B?dHdPNlVUdElLcUR3SWwrTVI5dWQ4NnhzeUFmK1U3aFZvdGwyM3BwK0VMbjNJ?=
 =?utf-8?B?ZkR4ZnJRcjFTU2pLeUtUa2ROMWpWbHZTZWZiVTBEYmxWeGc4eTlJSFd5NGtE?=
 =?utf-8?B?V1MxcEtNdnBYU3ZQWWIzWTR2Q29tYkhCbHUyRjFSR005S0UrOE5pZlc5bEtD?=
 =?utf-8?B?akNrZGtlM3MxRk1MQVk2TmZZcjQ3TUZMd00xMnlEUzJSSkE3ZzlsYnlQUXkr?=
 =?utf-8?B?TVp1NHZGbWsrWU9PMW1Pb25xVDhaS0NheHVVcnUyNmpNcXp4WTRDWnBtME9Q?=
 =?utf-8?B?ckE5MHJoNSs2MzBYMVVXUE1FeE1BV25KL2lrSXFKMVVKQXVlZzVXN0FnNzJi?=
 =?utf-8?B?R2pLOHFYdFJSdUZWVkUyK3dXeTZJTGxMcHR3VUVtQitsVGFCL1BZSUUrVkdi?=
 =?utf-8?B?YUgvdFpWTnM4YjZzdjhCSzNmaXNReFZ3WUFxMWp5WVJLZ3hLUWoyRFdsVVIz?=
 =?utf-8?B?UXRramRnbUUrN01ZQ2UvbERUdnZHUTMxcTU5bnM5bmN3T1U0bzVYY3luQUxG?=
 =?utf-8?B?aE1FRmF2bTJzT3M2dDVuWXZjKzZxYVRpbzRRUjQ3SEhPVkwvZTdzTE5EeVJX?=
 =?utf-8?B?WloySGlHd3JrMHF2a09DejVNSURhZ3h2Y2tnRWVwUFRSdVdXVElnamd4aWxM?=
 =?utf-8?B?V2M3R0dCazJwS2NJSmVaK0ZlNW55NVJTamtndUhRcXJqb244MFlGeklocDZx?=
 =?utf-8?B?ZzlNK3RuaWFVQmNGRENVT1owdVpkeUsvaVF4UDR4bjMwdWhyS0lIellaOVVp?=
 =?utf-8?B?OWZDS2J2SCtQbkdLQ1A4VTJ5dXAxQTBNMVpKeW5hc2VHWVpHa2JZSStYNE1K?=
 =?utf-8?B?aDZoNDRDdUd2MEtNNWdDRFVzYjcwSjlvdDhBM2RhMUg1Z2IybU5GMzlra0Jq?=
 =?utf-8?B?c3NVL093c1R1NTFianNQRDRITzhtWU5YUFJkc0lNeWlTT2o1YkE0OGdZQXJm?=
 =?utf-8?B?UXhiQkVxYTRITVYxVVpiSmxxRWFpeTViRGVraFZFL2VFRXZJd3hIMCtsYXc5?=
 =?utf-8?B?WExidit6K3M3N0dEc0JoVFFYRDZPL0tyQ3Bmakp2UzIzVU45TDkxVk1pS2R6?=
 =?utf-8?B?U2NMck1jdHgyc1VpcW1rSU9FeFNWVFRrRjVvOWtSQk9qNmJ6T1JuOXZtL2Jt?=
 =?utf-8?B?czhUekovQS9vR0Y2eVpBeVhRdVhzWHdIODF1MDNpY2tlclFpYkcvNFRsdXJK?=
 =?utf-8?B?YU8wTWpsSDd0MlJvUlNxNHg2WXphaGFTMUlWcEVNdWRJTHJoaVZ1YUIrQkg0?=
 =?utf-8?B?dUpwZkFNZkhWZ0J4dDZXdHhKVTJGQTB5SFltUVRrazMwVFUzcGROZG9yR3FJ?=
 =?utf-8?B?bitxTTNpb1RVR1ljSFFkREpmeW1WM0Z0Yi9iR01ueXg3Q2JVRGxlZEJEaFNo?=
 =?utf-8?Q?zdGuksnS0lbTURpIpDeQ504=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72322f6c-2bad-4f37-4db4-08dd7baa64b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 23:16:32.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VJlqXGScwmHYPanlQHRjgvY+dWJAH0KW5+ZPFcbXVOOi4nLVoODOG6ktSRX7lowudTOkkp8iy8FzOdOW2uRkVf1Ni7QzHkbnv5LXWstt+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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

On Tue, Apr 08, 2025 at 11:12:07AM -0700, Ashutosh Dixit wrote:
>Implement sanity checking for Xe2 PEC OA reports. Previously there was
>sanity checking only for Xe1 OA reports, but no sanity checking for Xe2 PEC
>OA reports.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 121 +++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 119 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 2440101900..eaf97ae0df 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -966,6 +966,115 @@ accumulator_print(struct accumulator *accumulator, const char *title)
> 		igt_debug("\tC%u = %"PRIu64"\n", i, deltas[idx++]);
> }
>
>+
>+/*
>+ * pec_sanity_check_reports() uses the following properties of the TestOa
>+ * metric set with the "576B_PEC64LL" or XE_OA_FORMAT_PEC64u64 format. See
>+ * e.g. lib/xe/oa-configs/oa-lnl.xml.
>+ *
>+ * If pec[] is the array of pec qwords following the report header (Bspec
>+ * 60942) then we have:
>+ *
>+ *	pec[2]  : test_event1_cycles
>+ *	pec[3]  : test_event1_cycles_xecore0
>+ *	pec[4]  : test_event1_cycles_xecore1
>+ *	pec[5]  : test_event1_cycles_xecore2
>+ *	pec[6]  : test_event1_cycles_xecore3
>+ *	pec[21] : test_event1_cycles_xecore4
>+ *	pec[22] : test_event1_cycles_xecore5
>+ *	pec[23] : test_event1_cycles_xecore6
>+ *	pec[24] : test_event1_cycles_xecore7
>+ *
>+ * test_event1_cycles_xecore* increment with every clock, so they increment
>+ * the same as gpu_ticks in report headers in successive reports. And
>+ * test_event1_cycles increment by 'gpu_ticks * num_xecores'.
>+ *
>+ * These equations are not exact due to fluctuations, but are precise when
>+ * averaged over long periods.
>+ */
>+static void pec_sanity_check_one(const u32 *report)
>+{
>+	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>+	u64 first, *pec = (u64 *)(report + 8);
>+
>+	igt_debug("\ttest_event1_cycles: %#lx\n", pec[2]);
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++)
>+		igt_debug("\ttest_event1_cycles_xecore %d: %#lx\n", i, pec[xecore_idx[i]]);
>+
>+	/* Compare against the first non-zero test_event1_cycles_xecore* */
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>+		first = pec[xecore_idx[i]];
>+		if (first)
>+			break;
>+	}
>+
>+	/* test_event1_cycles_xecore* should be within an epsilon of each other */
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
>+		igt_debug("n %d: pec[n] %#lx, first %#lx\n",
>+			  xecore_idx[i], pec[xecore_idx[i]], first);
>+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>+		if (pec[xecore_idx[i]])
>+			assert_within_epsilon(pec[xecore_idx[i]], first, 
>0.1);
>+	}
>+
>+	igt_debug("first * num_xecores: %#lx, pec[2] %#lx\n",
>+		  first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2]);
>+	/* test_event1_cycles should be close to (test_event1_cycles_xecore* * num_xecores) */
>+	assert_within_epsilon(first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2], 0.1);
>+}
>+
>+static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
>+				 struct intel_xe_perf_metric_set *set)

I would just s/pec_sanity_check_two/pec_sanity_check/ to validate 2 
reports and drop the "pec_sanity_check_one" altogether. We only care 
about delta between 2 counters.

>+{
>+	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
>+	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
>+	u64 *pec0 = (u64 *)(report0 + 8);
>+	u64 *pec1 = (u64 *)(report1 + 8);
>+
>+	igt_debug("tick delta = %#lx\n", tick_delta);
>+
>+	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
>+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {

Maybe, within the loop you can have,

n = xecore_idx[i];

and that can be used in the below code, for ex:

		igt_debug("pec1[%d] - pec0[%d] %#lx, tick delta %#lx\n", n, pec1[n] - pec0[n], tick_delta);

>+		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
>+			  xecore_idx[i], pec1[xecore_idx[i]] - pec0[xecore_idx[i]], tick_delta);


>+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
>+		if (pec1[xecore_idx[i]] && pec0[xecore_idx[i]])
>+			assert_within_epsilon(pec1[xecore_idx[i]] - pec0[xecore_idx[i]],
>+					      tick_delta, 0.1);
>+		/* Same test_event1_cycles_xecore* should be present in all reports */
>+		if (pec1[xecore_idx[i]])
>+			igt_assert(pec0[xecore_idx[i]]);
>+	}
>+
>+	igt_debug("pec1[2] - pec0[2] %#lx, tick_delta * num_xecores: %#lx\n",
>+		  pec1[2] - pec0[2], tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices);
>+	/* Difference in test_event1_cycles should be close to (tick_delta * num_xecores) */
>+	assert_within_epsilon(pec1[2] - pec0[2],
>+			      tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices, 0.1);
>+}

Thanks,
Umesh

