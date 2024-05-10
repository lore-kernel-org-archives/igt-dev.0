Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A038C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 20:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C91C10E123;
	Fri, 10 May 2024 20:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJt6zL6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAABE10E123
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 20:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715372767; x=1746908767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tpahU6Joyv5uAOYz8Vg+HklzAMLPYfNrJ5xZxskdfoo=;
 b=eJt6zL6zrMgZLyzzIevMrkPFqymckS9lV6o/xBgJ/BUUCgLO9q9F5BGt
 E3BRvE6+mjul++Q/7HUOKgvrK7ElamSKYki/FSDPxJHQUeQEu0a+b6ZcA
 qXyaESgfaBKC2N0uZTSVSKOOua6/ZBZx4gV3THXsSNFGl3NTIVH4wnE8K
 lFnKefJAaPnAU9xze7kdVGqLlSBLU88v8ut98DYPlnsOB4e0pooSlnWiQ
 1NyfgbtYxCAiAM4QUhhrpYjoPvO9w+PlihMTAgGFgIgmlgcYulJMFnJee
 rVp7uioU6WwU3Y/aC08B4+yeohBIsKukLCRttPWKLKY9+7zKph/sK4QTo w==;
X-CSE-ConnectionGUID: fV888xAvQym2YNs3Ej2FGw==
X-CSE-MsgGUID: mS/oKylBTb65cAGrGmidKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11207877"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11207877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:26:06 -0700
X-CSE-ConnectionGUID: s6/n7u1oSc+uRUVydCGQQg==
X-CSE-MsgGUID: WdZmOk8WSOCy8wRQekpRyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29832041"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 13:26:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 13:26:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 13:26:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 13:26:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 13:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqwhJthUmqxvMO7rjRGFCrJzQ8dkn0kO5Mct5IxU1utjhL77gH7qJp9kbdMgzTd0b/nykQNRlgbWhBTU/sAUr4m7WGm7M5q6GYAOGMWas/h0qOGGfaLACk7z2URADCmzl47dR3GjaC3Me9QjvfZ34pcG7SFX86XOn2V9jJGs8c3jT26/SrT3wJgFfL77oa9HNOjMRc+rC2pv+YY4ZZ5B1SKX0Q9WOUltHj7uWvWlAErbD8D/lzvYJ+t/18XTuUMhXTfpvXyy7W41Uypv8+d5EL1lQ/QSGT5X13FD+SP+9rNOaQyvxM8MtkpZ9OhGO1dIAnK8Jc+MlmJnlzGxWVpxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84RiGBeKZQpOSg66E/GPulwTnzez9GwjAT/XP+KOHOo=;
 b=RB1MvBfWqD4nsU5RUYI1uZCXEmBCwuQ2G4RXet53jW2Eay3f4uAqjz4fyQlB2OnEfhLXdBZ3L+FvNj3CjEZ8a8hiCMM+Rhbp0bsI4IBaoRWPluygEK/FjpAilbQIk9+bZeTYatLDPjjsC4v7+Hbm+bNnXm9SKI0cOJb4tq4KKpoAyxs7vQS9ioYv9HdACj7wC03AA8/mqu6qKCTMAoqfi1cCPnHGa2AvjJX7NRPDKuBzYDckbzHLpzEfkCh3y2c2by+RIKoxE9k39l7B7SwLyGPJLmh9patH8kqv77QMjC3AvqMCAFDzhyok7DQ+4yig9j0GZ2uG81IoLN99CF3wtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.49; Fri, 10 May 2024 20:25:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 20:25:58 +0000
Date: Fri, 10 May 2024 13:25:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/i915/perf: Accumulate clocks for MPEC format too
Message-ID: <Zj6C1CDO0O4yjAuA@orsosgc001>
References: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 7879aca5-f91d-4e37-1468-08dc712f66c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWRXRUtIWU9rRGxSR01vYkl3WmE4SGs5TkhOZkUvMUdIY3BvQWJLU2t0NVhY?=
 =?utf-8?B?TUpvL2hPMG9lN2d1UEFsVnBYa2lraVRkYTI5blBPeVVIUkd0RkpHYjhzamVO?=
 =?utf-8?B?UWtFMGRQUGZhYW1US0wzUm5RaGs1NFZQY0dmQ0VBRENLRE50VmkvRzNYREk5?=
 =?utf-8?B?M29zME5YTzEydEdMR3VOczRaVnRjMS9FTWJmQlY1cDNobVgwbmhFTUlyK2VK?=
 =?utf-8?B?MzNaMEU1WVBHSzRSZ0l6VHBISHJXQ2tVdVk0WTJXanRCWnpjNnRubGVyTXFI?=
 =?utf-8?B?ODQ1NGVVMm9SZVBWU2tVTDkzRnJ5a0N6SmgvZVNWcjd6WkJqM0Y3ZXo3L0px?=
 =?utf-8?B?RGF0MlM4bS9ublBzNzdELzc2bTdYbjUyQ1FpdG5iVUdVMDB5bDA3aFRGVFlD?=
 =?utf-8?B?NmViVjBENWk5R2tCWkZIWENMM21GWTVLd2JsQWY1SWVYNlRuQVVDYUpZV2Js?=
 =?utf-8?B?V3ErdlZmQnhMaXVoR3hEWjdzSlo2YnZrM09kMEFLN2lhWWpUY09OSEJnWDc2?=
 =?utf-8?B?K1BOUGNlb1NYS2hyM0E0TEQ0MDQya1l1Z1c0R1MrK0ZmWVpzbjA1dy9Fak1P?=
 =?utf-8?B?TEIvSFpaaC9nay9IdW9vMmc4WTR1SXJoUzlXZGFVbW5IZ0FVdjNxZjBhZG9s?=
 =?utf-8?B?MzFMVTI0TllhN1RJSXdpRFJ2RVN6WGk1cFZlRHlyUWFNMFl1aXg2SmE0VXRU?=
 =?utf-8?B?ZXAwMHlFZ2VLcnNlQ1QrWUxrazU3RlE0OXk1bDE3Y0hYZVRaSjB6VEsraXUx?=
 =?utf-8?B?Ym4zNGZuWmMxaUc0L0RaS3RYaHhVUmUvaHRVR2hRQmx6M016QWdTVktjSEly?=
 =?utf-8?B?aHN2b3dtSWJsTVFQdWxnejFwc2tDeWxTNGdSeVcrUVQvWEZQNnJoMWI0dnlE?=
 =?utf-8?B?amJSd0JZejBnSnZvajhvWEJadTQ2dWc2dUE3NTlUNVU3UWNSSGlCSDd3S0g2?=
 =?utf-8?B?VXI0aHhja1gzUDE4WUlnMjFJYkpDaTJJV3RJRU9TTUxJU3oxUUNKeWNidWh3?=
 =?utf-8?B?SlB5eERqSHU5TGYyWnM4REppZ3V0cXJVY1VLYkxXZzhEOXhtdGZaQTFLYktn?=
 =?utf-8?B?SXJrR2hzNFpMb2JYT1pERjBNRmppRnBTTFgyVjRScFFzVXlvMWt6ekRjbXV2?=
 =?utf-8?B?UEhkTjJISE9Nd3o0TWVIQ0FYaituR05FdGJVQXhzMG83UlgzN0h0TWxVUmc2?=
 =?utf-8?B?OU9PbGJHUDVuU0wvNFBXelFKd2Mvb2p0YURPdzY0R3Zsbjh2R1FkZWkxZTZo?=
 =?utf-8?B?dXVMTkF6ZGd6YWNoNTR1ZUZGT2RRZU1ZZnFPSDZUU3NrK0JrOTVEZFpMSWxN?=
 =?utf-8?B?MEQzUmF5b1Voc2p3Y3FvYk0xZi9IZi95ZklpV0FOT24xMzdKUnZZRGU1NnRG?=
 =?utf-8?B?RXJMblo1djlRMEFMbDM4UkllZmV3Vy9EcDVUaGg3eHhjeXFNNThhUzQ3L0hs?=
 =?utf-8?B?bCt0YklwYSsyRU10N0dNVFV2dTV3ZitlSnFSYTRBYlJ5bE1kcXNzRVhzRzRx?=
 =?utf-8?B?cmg3aGVRSGU0OVZ5MndnSUF5N2c5dVJhR0c0MWhuNWRCeFp6ZWRveVNwa2h0?=
 =?utf-8?B?MEtsWWxSNGt6UmRYUENmWTVFbFFyUm1uUVhYWml1WDlReWhiVkJoZUdpeERL?=
 =?utf-8?B?WjhqYXhtRVh5M0N2cUF6MHNSZ3ZBd1RRaVI2MytWR21ab3BlMXcwMzlmOEk5?=
 =?utf-8?B?SG5vWHNqd0tNbzBUazVoZ0czNjVKRGJQUk8rUU0yM2l1S240TUJpWnJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9DSUFpUHlqZHpuSjFPMy8rLzdtNzkxOUgyUFdaa1N3WjIycngya2gxVXZ0?=
 =?utf-8?B?YWJ5OXB3aUtGYUgrbHJ3dFlVTXhCRFFUckhhTzRFTGZzTjZpOEpBZHBHUDdL?=
 =?utf-8?B?SUUrbW5kN2hKenVZY1V2UGdSamNucDhqWkxxNWVKalA2MmtOdnNaTlByYW5a?=
 =?utf-8?B?RUVsczhuNzFWdmFGc1RjS0ZycEhYNFlQcjdScVdVMTYrY0d3cnNVVy8zSEVz?=
 =?utf-8?B?NVBmaGZzbnhMWm4zTlNRQmFDenF5M3o2NXN2OVpjeWplZHJpSjlPLzllV2V6?=
 =?utf-8?B?b3JSL3NrVzZ5YXE2V1h6OG51YkF5amNrUnZkZ0V0K0JRK040eE43MzAwdlBR?=
 =?utf-8?B?TkRNVXlEbmwrKzBnSS9ndndGSmtVRG1oa3c1ajV3TlFqbC9zdlVvUHoxTmsw?=
 =?utf-8?B?dm5BM3Y4N2dJTy9OUCtiUGxPN091dXY3MmhNRkF0QVFsb2Q4eWZsLzBHS3Jh?=
 =?utf-8?B?RlFoN3FnUlVmMmN5cTBpaGtnV293RG10b3NNS2pCaGhEdkNMZStVSktvRjJT?=
 =?utf-8?B?aWFWbExhWklsend2TmhYWlNwZFozSlZycEx6eUZNNkRiUUtpNWhaTnlnQkEx?=
 =?utf-8?B?RXE5WVJWNG1sK2JEM2FuakQwT3BUVDBrUWtBN0pON2l0c1hLei9raXkycGxV?=
 =?utf-8?B?OVJ3Q3A5L0VQTS9hWVpGdXdPTmdiUSt6blQrWnVIODBwZVBmNzRZYUlKMTFi?=
 =?utf-8?B?ZllUYmJCaFNCbzF0R3NqT1A0bVh0ZmtYSHpKb0ZJblFvcy9hQlNPb0VNYjZk?=
 =?utf-8?B?WVZCcXc4c3FXQW9tQmVOV0k1VWdHamw0NnArR1hNTTdLTko1bE5pV3Z3M3VC?=
 =?utf-8?B?SlNxa1dzbk1hWStlTVgvTzNLbHBmMGRONk9MM1lUYUczRkFTSCtjdnBoNnh5?=
 =?utf-8?B?OXRUY3R1SDRaazQ1bTE3dlZmWmlSSFFZaGsyMC9HMHFhc1VzQ2VsWlJBN0l1?=
 =?utf-8?B?SUl2d1plUkJZRDE2V1ZhbnI4U2lhWU1KdkZKUUdSR21uOGRIRXk5cE4wWE1N?=
 =?utf-8?B?bUNMem1Jenl2c0FjN2lqVmVjQmJveWFITi93c0JKaUxCUDRZaVoveUlRV2pF?=
 =?utf-8?B?dE9HOThEejhuYlBLVytkZVlGVVgzMFlVelJmbFVCTjdLeWprczlZaG0rUFJI?=
 =?utf-8?B?bkFDbGxsL0VRSE5rWkdqdWExdXNodkJlektPd25RV2lqK092R09RYmNXc0JE?=
 =?utf-8?B?K3ZGRnBZSUphWGIzNm0vZGQ3eUxHTHFSWFRkdklGYTQrQVRZRklDWnRiSExS?=
 =?utf-8?B?ZklCTGtCRENvRnpLTVkxMXlFTi9IRDBuLytCSlVGSno5d0Jja3VrRGFYZjNh?=
 =?utf-8?B?dnBtWDBjQmNWZ3ppL2M3MDJldHRWQmZibjhNSElQbVAxWXdrYUw0eE11cmxG?=
 =?utf-8?B?WlpzNWhEWDI1NXpwdzJJc0FhNGtIR3I0STRuMnVOQlM4cWdranFReFFyWTBN?=
 =?utf-8?B?STZzQVEzUHNkSUJFRTNLWlcvV3NSTDJaOFI4M0RDQmRTenoxY0VNL3VLeDNF?=
 =?utf-8?B?emQ2ZWdyZFFyaVYza1JwV0VNYU1zeEZIaUgrK3Z5ZC9jc0J4WmN5R0JzdTgz?=
 =?utf-8?B?dTNnNTJIVm1MR2dTS0NmakhSeVNOVVRtajV5VUJvU3RtYld6RTBwblFQRjYy?=
 =?utf-8?B?dFFJdm9QempvdXVjRFd2VG54YXJhQTE0QXR2Umc0bWJCZE9YWVN0cGVNMEcx?=
 =?utf-8?B?eTdIMEJTVUx4bE9ndUJRSDNQV2Mwd2RqMFZqdDVOcnZPaTJxRTYrVFBrZmlp?=
 =?utf-8?B?eEluUEY2MWdORXpiSXlrSHlVUEN5aXU1THEyS1lBZUZjazNpdGlMc1JEK1dk?=
 =?utf-8?B?UHUrcUVIQzE2cEl1WWNmQXdaNDY5UjJvbkNHVXZLYWVObkc2NEt3RkNlUklr?=
 =?utf-8?B?ZmxLL2RsTEZNeHY1VFZDR0dVUnJwZEdoY0xRUEk2akNlV3BUaXpyK3AzSXBk?=
 =?utf-8?B?WU1tUjhVTzVDTEQ1VTI3MkRYejduQmx0YjRhK2dTR2ZEODhXb1FGdHpkYmdG?=
 =?utf-8?B?TmRJOUpKa1hTd1ZHb2luZHBVRmRpZm5EZmEybHMvalVZVlFTTmwwVDhJYm1s?=
 =?utf-8?B?Y0RTMVF1VnJCVGdJaTlrN2kycWJqZGlKZG13QTIrMUpETGd6NTRIUktwa2JG?=
 =?utf-8?B?Y0ZyRkZZNlpKN2xmbjJrSEZqS0UzeU0yTmozWjh6YzFhUDQ2MEZleTJJZmdD?=
 =?utf-8?Q?1JyzyIp4nFXwViX2W5fNhYg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7879aca5-f91d-4e37-1468-08dc712f66c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 20:25:58.2508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5yaWyy6v2LNKTk2KFj/x9/Bknh+3wx1xo2ROqRZ4+pgYxY/TNEgWmW56GRgVKciowxh7qWq1tT7zTHtxDyySBGRhO/4xIP1X4d8K/5fNec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
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

On Fri, May 10, 2024 at 10:04:50AM -0700, Ashutosh Dixit wrote:
>Clocks/gpu_ticks should also be accumulated in intel_perf_accumulate_reports.
>
>Fixes: cbe11c2939f8 ("lib/i915/perf: Add support for select MPEC formats")
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks for catching and fixing this,
Umesh
>---
> lib/i915/perf.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>index bbfa360607..9333edfebb 100644
>--- a/lib/i915/perf.c
>+++ b/lib/i915/perf.c
>@@ -928,7 +928,7 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
> 			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
>
> 		/* 64 bit clock */
>-		deltas[idx++] = end64[3] - start64[3];
>+		deltas[idx++] += end64[3] - start64[3];
>
> 		/* 8x 32bit MPEC counters */
> 		for (i = 0; i < 8; i++)
>-- 
>2.41.0
>
