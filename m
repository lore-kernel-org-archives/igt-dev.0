Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BB3CAC582
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 07:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FC810E033;
	Fri, 12 Sep 2025 07:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MySnmvzB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831BE10E033
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757661977; x=1789197977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SVaub4ZRnrPhrsZjQ5rIonuaiYQp1nO8iTshO/P7QrU=;
 b=MySnmvzBNbV++hHwCwuiymfwF2ccuPwkzh7oXITtgf+DwvMYRlUNFgTN
 tuecG61F+n6SHf/TI7hTup4I+My+Y866VVN+SACO6PoPajFQIVwCcDZjW
 c3aWDOjvebAXdWZieNXrduyqof5Qya60iM1OxwxBN5BIDnIWLD+bWib6n
 LwwfpMSWMFW2x2s2P6Fk074QG50NBtQ2IxCB7NAGVfvPUa8iXCsOvcY31
 RFTtg5ULzqpecf1Vq90l4cdFTyENqX/vceQlE18wZ8HWfpFkWXZnEu/VL
 IGqI7ZZTAWuu0uo+qdnQ4ngs6Yuo2AKBy3o2XaAEmUjiDOssqcnZ88WQ0 A==;
X-CSE-ConnectionGUID: vQ/4+v/STg2kGcq1Gp7JSw==
X-CSE-MsgGUID: hNaZugmLSQejJLsPnKJE6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="77460248"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="77460248"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 00:26:15 -0700
X-CSE-ConnectionGUID: 1a/AimwRROODdT+UrLOZsw==
X-CSE-MsgGUID: dD7Oh0QfR6e/PhAR49N9Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173465214"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 00:26:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 00:26:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 00:26:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 00:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrCaPVQocLLE2VouZJkVk3Hbh8xDzmc1AiCqUGKshQ/Jq4nqrp61FRFoEhZw8QI9Kf7P5iDjQerYS2Ws4wqxtln2Spv0rvWu3ZW66cQYmSLfGHGL77naY+HrGdjAGg/3FOOSU5oJsVl78Bzxjlha9lsBS0S7L3o75k3MEO5BxfXbiymq9fnVmxa7ASLf96A3/7q6vFDc1bMXUv4l6oM46iMnnOLSEHECkIvTmMB+ZD5vk5Dz4FSyb+kOulXPsqsoB0hY6PCfswdg33cA4CrF/2rKv+RCqIDvPZXSwxdAxDdi7k8rNqx05vvB17MOQhMWYfoio/DWsAnuVBvDTzvq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWnSucwXI8gFGmTVy+9/qVAn5YWdLD5pYApp5eucNMs=;
 b=W9W8l/BHdOn0ybdJqAcUHwlLKcFYy+2FS2tojduNQ2W5QE4TlAUoskM2Zy75LzR5eDQbh20xZzqubdsAuMMVXP4M1Ooqxm459iU7mQ9oga2/BYAmPPghvbAdyLHAvpzLKUofRNyZsp9+UY4eF3dYI6Gl6ca4W/RGCgU2X0BJMT4rpyr/okAQjCWNmSEsOVRbfv7Kn0ag/7MDNEkD34UHCIHvRJsg1XUocc4j6/sTSHTWVR+hCJriqzHwLEzxZESlfELi8J5bpRvFxxd1TmyaAAyLnTUXoBEE105Mek7QpCiLcvfISbRlvq7HLxqFFKbRfXGR8jtBqHR7+fJTCGw7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Fri, 12 Sep 2025 07:26:12 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 07:26:12 +0000
Message-ID: <4dec0fee-89c2-4695-a7da-b6036b575c8f@intel.com>
Date: Fri, 12 Sep 2025 12:56:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Block unsupported test on chamelium v1
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Karthik B S
 <karthik.b.s@intel.com>
References: <20250901082130.1787813-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250901082130.1787813-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 17e0e3b6-c612-402d-a780-08ddf1cda664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG9vSUc2UzhHdlVMbW1QWW9xWk9MQXZNQnl1aGF4eFh1dEpZWk9JTG1FRkhz?=
 =?utf-8?B?UDU5REN5T2V4TjNZcG5CQ0RVcERWR0xWeUE3Y0RiSjIxMDJmOVFEVWxmR2tU?=
 =?utf-8?B?Tm4xdm40VmIxVE0yOHpFTUVYbzhhL0Z1TEx0ZTFKdW1oSXBrZmVwTnEzQW1E?=
 =?utf-8?B?c2ZtNUpHajk4aDJUN2pIbEdJMmJrSVpiZUlmeFI2RVY0dEpMNWRpVlQ0UDRI?=
 =?utf-8?B?UzN2em9KdHhVTVovVzZROXhabnZpdHVIdllPWmEvR1FNYi9xRVdodUtrYWZN?=
 =?utf-8?B?Z2dyNTJDMEpEQUVteGV6N1E4M2tmdlBlTndaWXJFOVpVamxuTUp2L0xCcGN5?=
 =?utf-8?B?cmg4THdkMmh1dmxJZ2p1a3dVRUVJVUIyTkgyUmVqdENvdGFEVTdvditpWVg5?=
 =?utf-8?B?OHNzRHBWYnNjRmFFbjRrTnlnWVBWRHlFaWlFRGxKYzBoSjNObnNqQmw3MWk1?=
 =?utf-8?B?ak9DT0tPbGhyMzlyc3JMTUVoTEhCbjdKb3hUSEJWM1dLZ1ZpWVQ2SkJORzMx?=
 =?utf-8?B?dytwVllzSTdsaTNWQXNnUk9TUGZEdGdzeGZ1R25neElpaC9vRkZIYjZmMW1Z?=
 =?utf-8?B?US9hTzBxaVpNT0pmb2R4Vk5rRHEyeXBJVEpYQlpKWUJJMmpmdmlwVURWOXVO?=
 =?utf-8?B?MXVReitRcG9TV3hxVFNucTN1azRDb1NaRDZFelJ6RnZ0Sld4bGdmTXp0c3pl?=
 =?utf-8?B?NEVLM2dNaHppYWRUKzBjNENQMWpJdVVtQktCaEJ4c0tpTDNOSVcraGhaOVhD?=
 =?utf-8?B?R3pHRWhwaklaTk1jMHgxa005TmhWUnNtN0dVNHJTdkVKTUIrZWVrUnYzWGZs?=
 =?utf-8?B?dmdGMXNsaWNQYkxjWEU0YUgzbjBHa1pYZmdwekt2UkpEREtjTzh5bXVGZjJo?=
 =?utf-8?B?NGFoU3l3eGJUb3ZSNG1PZy9aMFFWZXAwc3NUdGM5Q3Bob1JndW5WWitXS01L?=
 =?utf-8?B?TjVtK2swUFB3VlRwV3l2ekd6emtLY0E4ck1xMzljbzNLRHJORlM1US8wWWtj?=
 =?utf-8?B?VWxiNDNXTm5oa3E5a2FXZ1pVOFQ3UERsbXFhMlN6Zm5WZnVyZTNiamphOW5q?=
 =?utf-8?B?MUhsWmVBYVFvcTFDTjY4M2JoOWs2dXNpVGVzbDVwb2FnMlc5dnE4MXcvSHAr?=
 =?utf-8?B?VEZqZnVveXJrSVNUNHZJdmpVbWhzZmNGWWxCbEwrMzJML1dnaFNDTXdVaGFT?=
 =?utf-8?B?WWU1UzRiS3dKWHdGRk96VlBJMG1yclZ4eU5TZ3hIZUwxbnkxZE1rK0IrNzJH?=
 =?utf-8?B?MWJqY1hhaDJXSUVIbkhJOUxraEhIbnVjNmxnbVhPb2lGR2Rac3EwdllsWXBD?=
 =?utf-8?B?aVliaUdER1dlU2FBNVJiNlRQL25EU0ovMDlnV3doWHVZMUFJV0Fta1hUNHUr?=
 =?utf-8?B?SGhONWJQQ2tVblN5QmJtcUY5cnFVcGJqdkRCODdiK1R3SEdNSUUwLytHejhV?=
 =?utf-8?B?Z2tYdkV0TTdRMkwrRDBYaXpEUHUvTDF3VFQ3bndhMW8wWmdtMjFnY1VjbjhO?=
 =?utf-8?B?QUxta0ZnSDRDWHEvUFM5cFlvd2t4Um1LekZNTGhWQzZsRFlRSHdZQ3dYN3o0?=
 =?utf-8?B?Q2lzeWY2bWMwTm9DcVdTU29QaDQ0TFVOazNUMzQvazU5VWdsQ0NwaFluWWp0?=
 =?utf-8?B?UGJBTUhQcXRlemFLODd4ZUlHMEdUTGhQSGJabFRtMVQxdFFuRE85WmIxeW1u?=
 =?utf-8?B?eWZaVjBYSnMvSU44VWFvK21BSmR3OEpMSmFTM2w4a25HVWZUTTlNb1FFQnAw?=
 =?utf-8?B?WEF6T2lMSXpTOTBlSXNEdmFEN0FLMEJMa3pTWTJXMmFySkVIRmZDeGVVQUI3?=
 =?utf-8?B?Y0FpOVQvQWxsdkNlRzZTcWlicnR0WlBYWFB3L1pBcnRvOXB1ZVBkK005YTAr?=
 =?utf-8?B?WFRDd2FSUUlwT1VvcW5pYndocUorc1M0YUpKTDdYeHZpb3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2c2dzlyNVJiZG9NWVlUb2VZYVBZaHM4aDZScDRQZVVFR0lnUEdPY0ZMdVIy?=
 =?utf-8?B?VEd4UW53VWlwbmVKenVTeWZlR3RtdDBiOVFCUG94bkFpSG44ZmNPZWhQMHpP?=
 =?utf-8?B?YVh6eFBZTmF6YVBIQ0tJT3g4M3NneXcyZS9rQ1hrbUxFNTJZSStIblJxRTA4?=
 =?utf-8?B?NHoxTnZCYUZTTk54UlhsQVI1LzhiOXB6NDdXeGRwejlRd2VudjNDT0dFQ2Z1?=
 =?utf-8?B?R0o4dkNtS01iRXdXQTdPejQwaHhkQzY5SUtFL3BRa1dsNUtFZmxtREVIaHJJ?=
 =?utf-8?B?YTF1aE9vMk1ySkJYZmI4NldNVHFKbFUvQzZ1WjRPOFVLOG16eDBzZ2dtU2Mw?=
 =?utf-8?B?a2VLZkk5TkhQZG0zM3RKeGZkMWNtem0wVllWdEs0UElBS0lMOG5UK1VwYUx3?=
 =?utf-8?B?RGRrRVJyRHhZSjhXUVlkcmVveWk5b2J4RXBZTXVoWXErc2UybzhMV3BERERL?=
 =?utf-8?B?aEIwM1pjVzRTVlhEMDYwRld4aytOZkhPdndCYlh3TDZZUDJ6VnpQYWE4bWhO?=
 =?utf-8?B?ZmZ1WlVVNmdCZ3ZiQ2lhbk8xai9xTnFtbHBUd0xXQjBpMlNXYmZ4cGtSaHBi?=
 =?utf-8?B?ZXlRNnNNeVJ1UTVEWlEwWDhFd0xiRDBpZjdTRTRtVmpWenRYM21VNzZ1NGVq?=
 =?utf-8?B?SmdHR0Q3aDVjTHJOU2NWQUNYTXVLNlhRUUkyd2FCSFBGMlhEcGhLYlRxU1Iw?=
 =?utf-8?B?NnBUSFZDcTk0MnRmb2xQc3d6S0pISmFxQzhhTjFrYXBFME4wNE1iUWdQdG9M?=
 =?utf-8?B?YTRwQUpMUmFCc0Z1dXhDU1BKbXVjZy9MSDl2Y2hwYTc1T3FhODZmNFpncFdV?=
 =?utf-8?B?SEZGcTRjRXI2a3MyV3NjekhBK0FnTkxMOUdKNW41Z0hCQmVpMUlZaXJTczg0?=
 =?utf-8?B?WWZwSjlSM0pYZ1o0Mk9WbzYya3lhUUNvTkZyUmVpK2todFpEVXlaZHhySDFq?=
 =?utf-8?B?ejhCNmpjdEUxRDNaSUxnZHVGMUxZZHA0NUNmZUhQbVpFRWNMTy9remlpbmEy?=
 =?utf-8?B?ak1WVDV1T2JQWFVYZzhKVDhTRExSN20rYlNaTHVIV0VPbzlQT3BNazhqWW9r?=
 =?utf-8?B?d3ZoUmpvOHd2SHVwcFE1REV0QzlyTUNFalNYM21ncXZJYXBpdlhxOHNicFVO?=
 =?utf-8?B?UVdGeUZnY1NKMGlkUmk3Wlp1Yzk1VktSQkRKdXRpOTREaXdzTXlGN3dobzdQ?=
 =?utf-8?B?d2pneEtoekdydDhISER5ZkxZa1hJZnlXaGRvYmo1QzR0OW0xbWVkSk5ORXRt?=
 =?utf-8?B?SjkrSXhnVUdBRjRYdGtUeVZYa1VwSmFvTWVaUy9vem01VXZuRmVLUEJRSEdK?=
 =?utf-8?B?UWN1Q1dZODBoNld1anpWR1RpUEZKd1RoaFljcnVvZGF2ODVNdkYvdnVWTi9F?=
 =?utf-8?B?RDVRR0JtY0MxcTRMeU1hRldYUW9YSnYraGpkL2p6ckVyQnA5WUxwOGtBb3R4?=
 =?utf-8?B?aHVjejFMcGdObFY4K1ppLzJRazhQb2FmaGtWRVRGK21LYlUxWlUrdlpiNzhz?=
 =?utf-8?B?ODhzS3dJYnIvMUQ2K2hBTWptNVViUTlpZjZBSHVyTE5KVHloOS80MFlVdzZo?=
 =?utf-8?B?KzVlK1pFZEttbDVsL1kvTDRhZ2JUMDJPV21uS3RrYXNtbi91MFZHbUpKays0?=
 =?utf-8?B?bU94b1pQcU5maktBYmJhT25DZG5RaWpGVWVYUU9iTHJYY3liUlBYUlBockZP?=
 =?utf-8?B?a3dPRHk4YzNrTWxHMVJmTkI2L3pvTlRYVW5xY0wzNzlLRmExTEtyS1N6cXZV?=
 =?utf-8?B?bkhPdXkvWjc4bGZZc0d1ZlRRRE9XV1Vxcm9EdTNYaVFrWlFuK1JDYzc3amgw?=
 =?utf-8?B?eURjdiswY1F0VXlNU0pXV1ZHQnVueHQyeG9EV3pzTXlpeWtrdGtJQWVsendD?=
 =?utf-8?B?SDRMaTJOK3FjQXBPSm9OOTNMbThGVEhNeFlSa3lsSUVFOVZBOXFvSVYvTzBD?=
 =?utf-8?B?YnJzbHc2OWpUNnc4OVJKRVJkY3U1dVMzT0sxMnpEMERwdzVBcWIwS3JVcXRC?=
 =?utf-8?B?OENNUjVvbU1vbnN0UGw1UnNGOEgzRFlSMDhYdnpaV1QvVGFhR0FYVGkxdm1N?=
 =?utf-8?B?eldRd2doTXZIM2NQeHhFYXg4bjI4ZHI5U0I0UW1PWjVmNjVvd3owaHZhS2t2?=
 =?utf-8?B?R3BkV3JVa3Zsa2s4Mkxxb3VQQ0VnVVZSditJQ1UyYTduc1BLck9HRzdDd2pm?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e0e3b6-c612-402d-a780-08ddf1cda664
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 07:26:12.1465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQ8YowMKk0Mj9/KLj/I8Wheqvk8C/Wy/ki87mgKOT0rgYH8CRBJeQGB9yddffLPAay4CAhkCMGYHb08bV5ttxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 01-09-2025 01:51 pm, Kunal Joshi wrote:
> Chamelium V1 HDMI reciever can support max 4k@30
> Test forces EDID with 4k@60 which isn't supported
> Blocklist test untill we have newer V3 boards
>
> v2: Fix typo and rephrase (Swati)
>      Fix commit subject (Kamil/Swati)
>      Block i915 as well (Kamil)
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt | 8 ++++++++
>   tests/intel-ci/xe.blocklist.txt   | 7 +++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index ac9bb2f0b..b36015b53 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -178,3 +178,11 @@ igt@kms_fbc_dirty_rect.*
>   # platforms connected to different displays.
>   ###############################################
>   igt@kms_sysfs_edid_timing
> +##################################################################
> +# Chamelium V1 HDMI receiver supports a maximum resolution
> +# of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
> +# which exceeds the capabilities of V1 hardware and results
> +# in failures. Temporarily blocklist this test until V3 Chamelium
> +# boards (which support 4K @ 60Hz) are available in the test environment.
> +##################################################################
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 14e0b9482..2e1ebf299 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -117,3 +117,10 @@ igt@xe_evict@.*-multi-vm-cm.*
>   igt@xe_evict@.*-threads-.*
>   # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
>   ##################################################################
> +# Chamelium V1 HDMI receiver supports a maximum resolution
> +# of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
> +# which exceeds the capabilities of V1 hardware and results
> +# in failures. Temporarily blocklist this test until V3 Chamelium
> +# boards (which support 4K @ 60Hz) are available in the test environment.
> +##################################################################
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k

