Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77318D70E16
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 03:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD9410E4A1;
	Fri, 29 Nov 2024 03:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3dqtm7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7398710E4A1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732852018; x=1764388018;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iJadgAXAM5Ec7sQz/jRCdlLzCh8rwUvVFe/UqXe+K5Y=;
 b=h3dqtm7wW3niUb5OBT1LowWGdRBzVUVtEJGPeE7FySCZuwodnREYKfi2
 AdoeIbjFqm02woNjuXUyD4Sf3ttNMiZioGmWoFBxnmGl59uMPZsXZvUOh
 8WPjSkwVKg++6pnKK6ZgRNFmdR2lkNqtE7Yf3PBIG69qd5+q+iZf44yFB
 7W/d+FrF/oi6zyrrr/sAHcEBt2vrn/L9zFvHFKBS36h36Z7NZOuwTcQJQ
 UThdDyAT7IxzIgUe6Lg5kpyZKu5czpHC6efFSzT5H/ySZRSKI9ZjVL+QF
 4Ny1HQErhfh+BOyCB+yCVCYSDXEmnd+mfda040P5ld79t3NvQOsHyNNDO g==;
X-CSE-ConnectionGUID: 9wbeKHxfTMif2FXtJfnKdg==
X-CSE-MsgGUID: zLTAdV+RTxai6B0Zsi3xLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33236273"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="33236273"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 19:46:57 -0800
X-CSE-ConnectionGUID: FnOxh9zMQLS7w+zDNsIdqA==
X-CSE-MsgGUID: SJhKe40bSS6bHtejfd7nIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="93227793"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2024 19:46:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 28 Nov 2024 19:46:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 28 Nov 2024 19:46:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 28 Nov 2024 19:46:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9H49r6YKcI5I/xh86vFjT/POXpT6BTA9ZMej06e2eOYjaCEZqL5gg/1OtaSIso1mrdhrFKjg/76awyiWeP70pKeiV2Jqb99xQbM3MqyyPj51tfJkl44Hj+Fk9JLxNTPvP8tcxWLqyBADrQr9eb3/CM1xI7PdT5Ky1mNbTOrhqw0uB1FP8A6icN2J3H/zrpBA/5WfVi9VmLkvFjvRDUIEqB4MDpvZe+3Eupa1bJUmbq73gyscTWXPBPuTC+9am7GiCiKheFz40gHM8InotH/j14mpWfgZSX+nFmY8iAQlIrgxOe6TbrPtsKeJGqmSTNBM1PXY8+dmOSZuqaC4UxznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWrXwJ7jvPCe/WLY9WAoopLnkuNW84dGS/S4ysEDras=;
 b=wYOfWNlDikKtLTWo9nUxxSXKg6ZU7TgUEqvTBrMWxm1Koe0QkNZnoaOoRQ/qcvQ1Er+LrZLEKOTfCeBgqX8b74dTQakA0dtxSOUSfXa81H+ecUUvUYXShxVlFys2Vc/EDyGvbUJXog5n5CWqZsOvwv22nEZtHFUpPolJYi+naKrroBOIyxGZ3KMWA3eqgWWzBUcySwu3qKsNQFCP0f79AWCRO3hJTOOAMdDf4SFNF/0QR8qt7qe8j0GZaZ2MDBKxDCvB3CmUbjRsMKa9czbXGV8dgMncpw066Wh04n1wFzCfwFy9X/SvJCeBlKrYY4HQx7EYZ6UyAhvS7u6pRJo50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 03:46:52 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 03:46:51 +0000
Message-ID: <26b601a6-9998-4047-98ef-1c3b49720588@intel.com>
Date: Fri, 29 Nov 2024 09:16:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_invalid_mode: Attempt divide-by-zero
 in drm_mode_vrefresh()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241127110012.13349-1-ville.syrjala@linux.intel.com>
 <20241128190927.26033-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241128190927.26033-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: db6cc790-5c84-43a9-6a09-08dd102875c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEtkLzBhWlBZeXhMVmxGMm4wL3BCQXZVQlBGSy9jVDl6bTgwdGpXbVV4Nk9U?=
 =?utf-8?B?cGJ5aDVwQy8xS21nU3dwUkFJYkw4MEJCUjRyMU5TVVR5UFdmMmhRNkwza0xD?=
 =?utf-8?B?M3hNV0VOMTVTbVRtcG9mTEx0eGl6STZYZmlVbmRTakJxSU5jbVV5eVozL0U1?=
 =?utf-8?B?eE1zeVM4aWtzNm4wL1B0R0l3ODhrVEtsalRKNzdJNHZIanMvbENtcTd4YStS?=
 =?utf-8?B?SWhjN1Z2VHpsQ0Vac3RWdHNMZmNBbHVoU1JublpwREloNzVLaHU1MkROSmJq?=
 =?utf-8?B?NWhDTFoxV2p3M2JhU25QYjZxaWQyUkgvU1MzY05SNGxyOXNEanFOWTJtOXJS?=
 =?utf-8?B?aFBhcFRzVWJjaGdiTkppTGhaY0RhL2RFSGlWeUYvV1pRcFhNZ1BuL1VSbEo3?=
 =?utf-8?B?OE5oRnZySE0xZ2owRGdOcjgreFpjOEFIQklLbUtqMjE0Q2U1K25EOU9Cdnd1?=
 =?utf-8?B?d1A5U1ZDS0JZdE4wdzFjcTBBZ1FwNjUzT1E0OXdsb1ZCcVp5MUpTeHBvMEJs?=
 =?utf-8?B?NUFNSlpQenVwMUFJR0h4M3RwTm4xTDJZT3VMWVVhTFo1UFR2KzRrUlNOblEv?=
 =?utf-8?B?aWowWGppalp1ZnM3Yk52VVJXajlob1hSeHY0V0Z3RFNrYkVuUHhuNVpWK3ov?=
 =?utf-8?B?L3VaR1c1MmM3cU4ybzFzNno1M24yR0xYVERCWlZsY2JMeUNKdloxaTdtMk5G?=
 =?utf-8?B?cDB3YzVVNWNXekVKeDNweGtRK3FmQjFWV0hhL25Kc2dKdDcxRHBESG9ldUtR?=
 =?utf-8?B?K1IyQWpvSGQyNy8wU1VlcG5IQ0k0SVVxcmd4RCtKM25VQ3FpSzJGajFwRVRK?=
 =?utf-8?B?OWNDSmpob2J2R1JobFdVOEpieXVwMUNWVkdOSHNJb2JKL3Z3d3V6UjlmZk9k?=
 =?utf-8?B?N3hhdzg3SHNKcUxqeS9lT0VJbDRSc1lpVEFmcllVYTF0RVY4cjkybEEwNm0y?=
 =?utf-8?B?b3JZRzE0Z2srVmJ5MzMyUXhYcVRyakFidVRKUm9RTzQzS2RTMHE2VXZNNXBZ?=
 =?utf-8?B?L2c5VTVGRmZqVWFOVm03MzVDL2tqQ1laVmFXWXlYNDNMdXRBaGNmZWxUdjBm?=
 =?utf-8?B?SXpsVU9yUm8xcHY2aDFNaEVkb2xad2RuUStQa3FCYUtKZFIxRWlhSXZ0clJp?=
 =?utf-8?B?VWEyOHR2VDEvcjRLWDl3RGZxR0ZJQm1DNEFYR3ozRmRna0ZHazdmZDd2ZGQ0?=
 =?utf-8?B?VGgyMGUyaHJ2RHRtbUZjcklhY05uVG1ONllIZEQzMWZIdmZQclMyYTVMVmow?=
 =?utf-8?B?T2hqY29OdXBhekMxWmk2TWlLOXN1MnU2bGgyczZmWlRsbkk4WmQ0SkJJZHMx?=
 =?utf-8?B?UzZBZ0hKelA3VGNqSXdSaTBOU3UxN1hMTS8rY0p6SUNmUkdmVWV2UEcxQzIy?=
 =?utf-8?B?WHRHSkdCbm5PTldLVThwNmR2aXByN3FaY0VLcnZnc2lrUE9Xa3RHblNmNkZO?=
 =?utf-8?B?d292VlFOQ0dnR0JFLzRvQXNXZ1Avd21HZGVIZDJBOGF5aVRuQkN3OUxHUnoz?=
 =?utf-8?B?WG1MT0pheERxSHAwZVllNUxtWTFpNUMxcTRUL0plcm9DNTNQRC96eVhyMERa?=
 =?utf-8?B?Z3A5cFVnUDNkN0RTSVIrcmhSOWVZNkg4ci9EWU1ZRk9lZ1dRTGtKZGZWdWxP?=
 =?utf-8?B?VVZuQXE2STVIQzRHdGV5NUorOW9wYXVnWTJqZ2ZZVUV5WU95ZDVkNFlXMkdp?=
 =?utf-8?B?aW9HNmsyWGhIcSs2cDRrbHNPY1Q4VjlnY0F0Uk1aWFR1V29wQ3d6VHpVLzcv?=
 =?utf-8?Q?isHZqM9E470aIfCIFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aENNUmdPN2grMmJ0OHEyYmpyVkphZVlJaGJqZzYxTExMQzJZU2UvQUtEQ0dD?=
 =?utf-8?B?WjRuVG1jZlJYV0p1TENUTmlyTWdKSTdTYVBnSzJlR0NtS1FGb3JrK1FYSnVU?=
 =?utf-8?B?SUs5QWFaVytaejBGV21WNEkzSHF0VTR0aWQrY3JPelUwVEhSK0IvbzRiendS?=
 =?utf-8?B?K3RhK3ZEd285VnV4Ymh3Si9wQzk0alhSdGRiVlREbVhUcDFpVFFsSUVzVjhC?=
 =?utf-8?B?MStQLzdsRWhKU2F5cEg5T29xUXZwa1VhMHNVOTdWQW9LWGNyL285bG9pSFpa?=
 =?utf-8?B?RzM0aXJhTVR0L3h1VnRyTFlSd1JDVGk5RUJ5M1dHRWZtNXZmVk5HWEpyamww?=
 =?utf-8?B?ZEM0SDNKMWpBUE91cEFZZFFSY2JwQmlwYSs0Z3U5ZHh0UHkwcGMydkcvQ3Bz?=
 =?utf-8?B?aVd5VGFlaTExRUVJT1ZaY2EyVWIvRCtxUHZSK2cyL2RsNzlzSjhzZ1AxZ3Zt?=
 =?utf-8?B?azVXMElHUmJ1NnRCU1RjdUVYWVBDN3B0UmtoL05xZzk2UFQzakk0L2NUcC9F?=
 =?utf-8?B?bDFXU2pjWit2cHA3aWJDVkNFYmNPVjgyZHdLWUFWS1E1aWNoeTEyKzRBYnJ1?=
 =?utf-8?B?clBiRHk3Z0xhdkR0OTl4RkErVHluTGNzZEJ5QkJhTS9lL283ZGdDako3eXlH?=
 =?utf-8?B?bml1MnIxSmFaWExEeTRXWnppUkJVVHNOYXlFN0EwSm1KdER2cTdTVmdrMFNL?=
 =?utf-8?B?VXV3T05Da3FTakYrcGNBU3AzSGdMMEsvTjlxZTR6RXJ6NzNKU3oySVdVeHY4?=
 =?utf-8?B?eE9mN0Nmay95UndJc1RhMkx3SklVMEYrY0NTNkkvR1RxTFlCa2YvZnMyM3pK?=
 =?utf-8?B?MUoxUC8xazVaR25HRlZWS0dzWkdMWndmbk40T2FJNHlYVVYyUXIvWVNnUDhq?=
 =?utf-8?B?bWs2YnBoV3BGZ01DcnNnUmZac2tNT00zTlpMWkJzbGNxeHhoZ1lPTHlQWHps?=
 =?utf-8?B?ZnNGaUt4N2NKSHR5Nk8rWVJHR3RoWnRReFA0Mm9QS0R4NkcybUJXcGRaRk1K?=
 =?utf-8?B?NXlPNUtsUEJTcVBlWStQVTQxWXExSXBMdzhmQzF6WGlnQUNaOG9rcG1vY00x?=
 =?utf-8?B?NE8zb29pMmErNHF0NjRsUG56M0F6SjVycUhYVjBEaG9qVGhnTWZ1dTk0anNY?=
 =?utf-8?B?RFB1UkZkSWVwdzhxTmtCdjZaQnV4ampVc2Z2SGNFd1hwOHNHQXpuZXJpWUk4?=
 =?utf-8?B?NDRBdHI0ZFIzRUhldnlHb3NMTURFU2toRUFObWVWaUdlcWdSNG44d29WdnM2?=
 =?utf-8?B?dVFEMkFEVDNZbUVJMDRQUW5vZE1OUzUySDdKVFRZbDVrMHFSRjFpUXBQcnEw?=
 =?utf-8?B?OWVpckM3SEYzN3l0eVQ3VDRMWmVrUTA2aVg2R05kNWFadEZXMklUMEE3YlNu?=
 =?utf-8?B?SWQvaGt0TC9YNFdRS3NJSGVGb3VaTUlYblN6dEx3OWIzTGUyKzd2OUVqQVZM?=
 =?utf-8?B?YkU4eHM0TnF2NTZtdlJTOHlHL1R3VUhGTnlFMmNZK2VuVGIyWVovMHJlOVhW?=
 =?utf-8?B?WWtXaTdSZ0tIM0t5QnptVEFIb1RMMk0yZTQwdk94MytsMFZJV0JuazdNUlQ2?=
 =?utf-8?B?U3o3QWJaWDJDN1UxUVhwSEFFUFNhNnoza2oxSnNQcWFHMVBZaTNRMnBwcjQw?=
 =?utf-8?B?VmxXN24vTnRqeEhSVThzb2dCbEovR0RiZnlUeDFraUxSd0Iza1RKMGNoOTRH?=
 =?utf-8?B?VTZQQUM2ZHpleFpsc2xBVzRQcGkwOU5mVVdDTlBvck1rcmZXVXJBNE9ZaG5K?=
 =?utf-8?B?Q3FsdmJUdVpZQ3ZsUmd2emw5b0Nqcm9IekMvZ3Y1dnlZckxJNTlzQ1o3Y3dN?=
 =?utf-8?B?eTAzcTI4U1VrOVY1cGtoU1UwK3NZZjlzSlp4Wml2SE51SFVueHF5ODNRa1Fv?=
 =?utf-8?B?eDMrdG11MWNWQnEySVF2cytSVWszVmtRZklGdG0vMW0zK0UvNm1sejVoTk9Q?=
 =?utf-8?B?SU5ESHRXMnVuNXp6eWlTYy9GSjdVTHp1N05vTnFwaGU0cUk2NHhVd29RUERC?=
 =?utf-8?B?cUVxbWtuZHZaQW91R1pTZ0VHTURCdk9RTS9iek5nUlAveFpDMHBGRXB1UUVY?=
 =?utf-8?B?eFhTTnA3cENyU1NWYzZBL0xwMTh1MTRCUTVwQnFsRmFaVFAyZW01NVhKbkVM?=
 =?utf-8?B?aWFFZDJGWVA1MzhXWGEwRjlWaUVLNFI3SUlBQm9ia1RrMzQwWFFDUEVvUVFI?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db6cc790-5c84-43a9-6a09-08dd102875c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 03:46:51.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baRDzuMCnDsZ4a1oYLLxurreKvffHIbQQzc0RGwyIK2NhwhQLeCXwayVrJ2teGxMM/Zf3kCsX/hR/1Zp6ARHEtHcHjvYd2LwXeYKMs42b3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
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


On 11/29/2024 12:39 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a new subtest which attempts to invoke a div-by-zero via
> an overflow in drm_mode_vrefresh() (found by syzbot).
>
> v2: Fix the docs
>
> Link: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


Catching the issue nicely: 
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12217/shard-mtlp-5/igt@kms_invalid_mode@overflow-vrefresh.html#dmesg-warnings177 



LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/kms_invalid_mode.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 4fd644594ef9..1ebce4df3616 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -56,6 +56,7 @@
>    * @zero-clock:       Clock as zero
>    * @zero-hdisplay:    hdisplay as zero
>    * @zero-vdisplay:    vdisplay as zero
> + * @overflow-vrefresh: vrefresh calculation overflow
>    */
>   
>   IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
> @@ -210,6 +211,20 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
>   	return true;
>   }
>   
> +static bool
> +adjust_mode_overflow_vrefresh(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	/*
> +	 * htotal * vtotal * vscan == 2^32
> +	 * overflow during vrefresh calculation
> +	 */
> +	mode->htotal = 32768;
> +	mode->vtotal = 32768;
> +	mode->vscan = 4;
> +
> +	return true;
> +}
> +
>   static void
>   test_output(data_t *data)
>   {
> @@ -285,6 +300,9 @@ static const struct {
>   	{ .name = "bad-vtotal",
>   	  .adjust_mode = adjust_mode_bad_vtotal,
>   	},
> +	{ .name = "overflow-vrefresh",
> +	  .adjust_mode = adjust_mode_overflow_vrefresh,
> +	},
>   };
>   
>   static data_t data;
