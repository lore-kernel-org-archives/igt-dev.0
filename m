Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02151C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6A410E870;
	Thu, 20 Jun 2024 23:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FG7nzpE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46310E870
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718927142; x=1750463142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b2N8TwFLJM0PlZXxrGd4Trg2z5URoCstUb/ZOTGvEtg=;
 b=FG7nzpE8wf1niilX8hDsrm/bNVQ/uf19OFv/IbDXiwjotuBPUP4la7/6
 5iEDXREs92hmvvwWXH/N0zmalsftLTxuLyGgQBGBuc/r+Tsrg0k3UYLeH
 KGraLTFkUUsMQgvlJ2ku8q5p8778YPRmPtMcAR+HLN/SqyaL1/Q0NFRqj
 XNd2KeZM//cx4F3QiSnToqziUFsxqxFw7BHOifSRKfPMiHaPDmAq8cYif
 SGaxA8pCk3dbY5sOFPCed8NMc34FQ90PIJV09wEoUcx+Zn2SWNR01RepO
 7MOBwMxi93MNssx64C36GwGMIWCtF5t1VzPwzuTDJ8d+Z9o4DceRGbgKG Q==;
X-CSE-ConnectionGUID: stn9hqCARMqDT6WXajtZRg==
X-CSE-MsgGUID: Xxp/umbhQlyuOkoTW0VRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15774807"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15774807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:45:42 -0700
X-CSE-ConnectionGUID: 0vM229oXS1yzbfF8Voq3IQ==
X-CSE-MsgGUID: +EAfnQspQUG57+2fPQKyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42311969"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:45:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:45:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:45:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:45:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:45:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqzUfI81bfNiEVkByPPbCyzlG84DXTj4ygxW2MlqV/4qOFRrQ1DyJP8uhA2IHwPwZYvSTPk0jBFYzCQWjVjBR/wH7s7MMZ2oOjoiGrWIuRcL6CGgY5JG0bgDdd2GvwVQdhZhUv5XlgLc/S0saWq+Pv/sSmbiTAZ8BuAm4oZOXHYFUe10+Exsisdxc2MWrZkabffBicC/3K2uB7SkapxE+I7jGp9lmozrs119HCzk0icxSbfi9HTW6uI1E1zBfvV6rQ2pQEs5VWzBaOmsItH8Dr87t3xyKuCj4iW2f1zuMS5goy1PScBO8+iOyCXkpH3oyjHOoRYfTTnzc/0ytiiK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FDu22m88Xn2wQd5D3ak+5Iyrxu/clSTiixOhE8W4PQ=;
 b=fB1k23c3VKr5ZtO3F8ye31mbWhr12Ur5JbmG6W/t4lBJsZm6bFlYStR97e89xL6dYq+A3ANzNHuUyC7hENNBuC3EhocFfkqSI5H20AgMVB2BJlziMdUp2hJybK6050HhYbN4CUgd1hDxDnBlrpqRIhL8PfbrB3Nl9uzXIqQ+LDOYkkYDdW9U9NQVk84+pNwgXX8+d9/TUXGhnShi5kfBDNIT+Z6KMb0U+g71TQfSDvgAT/ZlHPPF+1a8z9jQo0SZ6xcc2BwpwQxoJX6wKVVvavAjCGCsfLUZs7kxyJAL75Ncu9cpH0ok7JHCrlZWtv3j4CyNi+kg6rmAl2WCZ7MNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Thu, 20 Jun
 2024 23:45:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:45:32 +0000
Date: Thu, 20 Jun 2024 16:45:30 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 28/28] HAX: Add Xe OA tests to
 xe-fast-feedback.testlist
Message-ID: <ZnS/GocWYczKtbwX@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-29-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-29-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f40b692-9bd0-4b35-981d-08dc91831321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTh3Q29ITmNKNWhERWRuRGhRUkw0TnhvclV0N0U0cVpmQVNTMUlQYWlFdXk5?=
 =?utf-8?B?UVZtV1o1bW10cHZJN25GMjU3QnFKbWxERkpmeEh2WWkwZUZJVVZHQm91MnB5?=
 =?utf-8?B?UVNVMXQ2OVA5VTJpTUs5MTA5bmorWWc0S2xhZ3R5MS9JRjUxNFZxVlN2blFH?=
 =?utf-8?B?MHN4cXc5c2FXbnVKcE11Q0QyUDdCa1FRelJXanBOR2FQcTFQelJkUU5ZR05Y?=
 =?utf-8?B?aG5kbjdCZXNjc3VOSlR5bVdwcEhQVG5TK3UrMDlmbkJNYXEvejJCNHVsSVpr?=
 =?utf-8?B?WURRaVNJam1sMWJoRUJ4RkpaenRXK1dIeXFNeFJtL2dMQUpIZzBOUFpGWEgr?=
 =?utf-8?B?TUVDQ1FXMCtSeFJOSHIrY2pMcHUrQzVXLzV0dUIwSHdEQmFvMll1N0FoUFB0?=
 =?utf-8?B?TnY0UHFHQlZQNjNKc2k4TzdIcFlJeEliU1VsZ3gyNEQwRXJtZjdaL1dxSlZM?=
 =?utf-8?B?MUk5TDJKRHY2Z0pEMUtwYjZ4ZkFOT3pxUmN5OVQ0Q3Y1bUkwaEhYVU16S3Mz?=
 =?utf-8?B?WlhJdGdlVWV1S2pwcTEzeUpRdHNieUxCNVlKR3RIM2dUNk5vV0I4U05UMHNX?=
 =?utf-8?B?MHM1MXp2bW9QNVJ5TWh5T3o5dzhNV1c4dCtxbWg3Znh1dW5NRlNGdVp4ZjdK?=
 =?utf-8?B?Z21yUjIvMzI2a3hQOTUxRWpRTkh2c3pEMjdJNTVrZkhVeUdiZGxXSE01cW5S?=
 =?utf-8?B?VW5iUWVnS1ZpZ3liNGNDWGNyMXRXVUduckdyNzQveDN4WFRuQjhPR2p2RnZX?=
 =?utf-8?B?WEJEcy9laGVMVEVQTW05c3ZhYWVxL3JwTExsMHEzcERsMDJVcmI3R2psMHJQ?=
 =?utf-8?B?TzdScE9xN0VieDlqaVFUMEdmUFZOV1I2aGJ4b1p6ZTBnaExBcmttWWlrcUFK?=
 =?utf-8?B?MlE0SkVvTE0rUzBDdDFYSm8xTWo4TTBwNjJOYWZWclA2Qk9xZ3gyNEZFRFdG?=
 =?utf-8?B?bWh3VkNlZWhEWVBtL3lxbTZTdkMyNzkzbEFZZG80Zjl0R2RTNE9CUjlkZGdw?=
 =?utf-8?B?TWZuM2tpOGV2K1N5TmRTZmlGcVdDcnlnaHlTMldielF5dWdUWXRHYWw3NHQ1?=
 =?utf-8?B?V2xIUWpFeGNnMHlPQWE5UUlOTTRDbWM1dTNseUhGYU90bTUwMDV5Z21YM2V5?=
 =?utf-8?B?TVM4M25TK2hhSUFXYmVBOUtRVEU2NndzZ2ZnZDBTdUtvZ2wzeFBEZ0RPZEVG?=
 =?utf-8?B?a0JZc1pLdDhCNHRZQkZwMlo1dHFUWUpEUHNBSUVOamNURGttYWdjOFNCbzRO?=
 =?utf-8?B?MXZsNnZFRUZCNXBma3RieTBOQXZjMHh1bXhJOE1EY0lhSk80eHdJZU9XT3Bt?=
 =?utf-8?B?aE9oekluVVpLakJZK1YyWVpqcEpoVm9sZDlESWQ2NTc4QUk4cnRRSGNjQTQ3?=
 =?utf-8?B?RTM0TnJuSERWTi9nQVNqWnIxUVkzcE56bDVyZmFlTGY3RHNzSzJYRkUxWkJk?=
 =?utf-8?B?VjByczFnaUtXUXJGQmlGTlA2S3JWODB2L2VXWmx6Lyt3eWlCSmlNMnBGUXgz?=
 =?utf-8?B?SE9aZGlwUjd1Yi9YaGZCdlRlSldvaGs0RDBjeU1QcUV1V1E2Ym1WcTF0c2Zs?=
 =?utf-8?B?eS9LZk9ieXRZUFJKa2dHYWswY1A4UE4vdFRvalBkMEMrRnJBTjhSNXNDZW5N?=
 =?utf-8?B?a3FKRC9FSU5ZcERBSUYrMGIvU0pQdE0yVzVUbzZxTHVEZXpKUUtBcWxVN2hB?=
 =?utf-8?B?eEZxMG9wdzM0TXBnSVUrYkJGMnBaek9jWWNVU0Uvc0ptU3FMQ2NzTmVpMW9W?=
 =?utf-8?Q?GLOiEH8tSuoYX/TEap+QA1MK2AWWZznranCugvT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmE0clAzNW1sR0ZkaW11MjVjdml3MHBvZHhsTmZleXFSRmJWeTBPU1N5UE80?=
 =?utf-8?B?QXBDZGJuRXcxUFdVSkVSN1ZLcjVrNGlOQmhBREVlN1JwcmsyYVZ3TU9oVXdU?=
 =?utf-8?B?NDBTOFdrT21sZjFBVklKRTF6SHk1bUpzUGsrSEpDWDBJN2pZN0c0ZHl4THFr?=
 =?utf-8?B?R1M0Zzdjd3p2clR0UUF0M1h4TU9DMjlaeFZKT1cydUN0S29zUFlRQWgvN1FW?=
 =?utf-8?B?eEpCbnhvVUlwa092aURTQ1Z2SytjUVczcWZxZGNXNjFpSmpMakJ4azVKbVZV?=
 =?utf-8?B?SWkrUmJxZStBclVPZm9FMGRnQXBhK29lWUVscnpTd1pLSmgwaXNvWnNyRkp2?=
 =?utf-8?B?cEx5NFlDaCtYaEVhSW9HZHViT2NpSnZXQmw2eUxGbEcrL3ZDWlFGSnp2TzZh?=
 =?utf-8?B?My9LRGRERC84MGRxaFcrSjNWbXRyV3Q1M0ZOL2dVOS9vTm1NQlh0V2VGOFhV?=
 =?utf-8?B?Z25FMHZhUUZRYyszTzczUXY4OU1JVmJMK1ZLdjgvcGdudm5ZeDNZSi9RU29l?=
 =?utf-8?B?cCsyRUFkRmZVZXBQTURzNkovN1BNRTJPTEVDQkZGOWUrTFF0Y0RIRlF5OUNT?=
 =?utf-8?B?ZjFmWWN4UXpWMVpKVDNiSFhUWUI3aHRGaTJ2Ly9iR0hIR0RVN290azBPd2pU?=
 =?utf-8?B?ZUxLN2NnTWV6SHN2anNBY0UwMEtNZmRSdXJIUkNBLzkzc0Q1NlNqbnpNaTJh?=
 =?utf-8?B?Q04xMk16eW52TGJ3WjIwNWlsbXI4ckN5WWFvQVZvZzJLZ0o5bm90T0pRQ1J1?=
 =?utf-8?B?MnBwYk9yTkNkd3R5b3Btd1RxMVBVTzZxT2xxcCtLYmtTYko5RC9hNWZRY2RQ?=
 =?utf-8?B?NW42QU5td0lJeTJuVTdUTzlOYVkzQUhlbVZjaUUyUGpRSzBDWWlKeGJaNk5I?=
 =?utf-8?B?bUdPekVSZVg5TVFWL3VTT1BwZ2NlcWNQeThnQkhmT3YxQjlvQnpzNDBzaU5C?=
 =?utf-8?B?ZWIrL1MrS2NHZG5oTHR0SHdGbnhwK2JNOXdYN2VyZmo3Q3luRVFycnJkUDVZ?=
 =?utf-8?B?TG5GYUNYRUQ5ZGhLajVFUkVTdFQ4RmZLQjRNWDF4OVQwd2lKQmZHMDBYdVhI?=
 =?utf-8?B?N082MUZlSzZaR1R3Vm9Dc1UxMTVxZEt3SFVtOUhRSzRmSEtXdXQyb1pFc295?=
 =?utf-8?B?aiswNjYvNnhNZkZMazN5a2htcXZQTHB3ZWJjcU5CeDExVU1xcVVVSG1Vdjkw?=
 =?utf-8?B?dzlrcVpScGdYWHNpS0pPYisvbkpDbmN0blkwb3BQcW1zNlJIajA1citTMWR4?=
 =?utf-8?B?Z3pCQXl5Wkozb3FvSXo0ZFhiMFV1dVpjQ2docWRzckU3amNOaXpleVRDUUYx?=
 =?utf-8?B?VWNhUGxXT1lOVlZrNGcyYlJzK3ppdnJpRi90MGV5V3lEd2Jhc2pPd29ic0NC?=
 =?utf-8?B?VnQ0WDZCdVRnbTV3VmtSWjJ0emtITEFaTklQL3gyRDZPWGFNTXdHU2hKdVNN?=
 =?utf-8?B?Nmlud0JRQzQ5YUFrOXRickNPNlcyVnVva0dNR3Vxa2xjd2dHVkFqbUxEL2E3?=
 =?utf-8?B?bThsc1RJcTFmQjltckhkVnFyY0hBTVVSOWx4ZUt3cC9BV2JSbjBoZlBxY1Nt?=
 =?utf-8?B?UXNqWG14SzJMV0I1Mkw2TlhuaGZCR0dwUWxCUGlWRVR0bFU3bytrVXluRmZU?=
 =?utf-8?B?NGlkc1hneEI3dnpzUWN6SXJ1aHhTekVDTlN2M0Y5NXJueUljVGN5ZHdpWFdu?=
 =?utf-8?B?M3ZaNkp6Q0YwLzJWYm1GOTIwUjNZdDRVcHdIYTcxU2htU2daamNpMzBSMGdz?=
 =?utf-8?B?cFl4QklnSmRaVjZ4NFkvSzkwS0pNODd2Q2tzbEwrZ01ad052b240MDVaeDhR?=
 =?utf-8?B?L2s1RUZjQXZBbEM5eGE5RElDUnhaRFJMbk50dnNpaW5rMm9TOWl4a0JHQngy?=
 =?utf-8?B?UVdoTG91M2xBdXpoaWdHRHpwS0JPb1NQM3BxYkVvdXdOTU9xWXQ0cFcxRHlT?=
 =?utf-8?B?ajYwVDVlYVRzcTdSM0lmdTRtdklFMlRla2taZExOdU1JKzdhVE5xdE5zT2la?=
 =?utf-8?B?Mk4vR0pRM3J1Y1hNaGZMQ0xsYW8vbGNBTjRpeGZ2YU1JdmtMUm9YQ3FvcU43?=
 =?utf-8?B?UStTc0dnNEk1Z01jRW1lL0drN29KRjFaMjlFSm4vSmRWV0MvOXB1WndHTllu?=
 =?utf-8?B?dzJsYTJaVUxoYk0yTHRlYXZwV1gwTm1Ma21aam5zS3RHWGtaU21KdUFkTDhB?=
 =?utf-8?Q?r46F7lwth6lXKez6/Cda46A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f40b692-9bd0-4b35-981d-08dc91831321
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:45:32.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbChahuad5hsFOWQtnU1orkpgX0v5T9QTRkjfmk0x/HbCSqrLalVM5gRYbgboE1SimwdkwAWGuqmXi4cIKqARRMp2S1QG9OHYTZJDYdyf/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Thu, Jun 20, 2024 at 01:00:53PM -0700, Ashutosh Dixit wrote:
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel-ci/xe-fast-feedback.testlist | 41 ++++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>index aa98b37e64..a577452179 100644
>--- a/tests/intel-ci/xe-fast-feedback.testlist
>+++ b/tests/intel-ci/xe-fast-feedback.testlist
>@@ -65,6 +65,47 @@ igt@kms_prop_blob@basic
> igt@kms_psr@psr-primary-page-flip
> igt@kms_psr@psr-cursor-plane-move
> igt@kms_psr@psr-sprite-plane-onoff

Does this mean they will run with BAT?

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>+
>+# oa tests
>+igt@xe_oa@xe-ref-count
>+igt@xe_oa@sysctl-defaults
>+igt@xe_oa@non-system-wide-paranoid
>+igt@xe_oa@invalid-oa-metric-set-id
>+igt@xe_oa@invalid-oa-format-id
>+igt@xe_oa@missing-sample-flags
>+igt@xe_oa@oa-formats
>+igt@xe_oa@invalid-oa-exponent
>+igt@xe_oa@oa-exponents
>+igt@xe_oa@buffer-fill
>+igt@xe_oa@non-zero-reason
>+igt@xe_oa@disabled-read-error
>+igt@xe_oa@non-sampling-read-error
>+igt@xe_oa@enable-disable
>+igt@xe_oa@blocking
>+igt@xe_oa@polling
>+igt@xe_oa@polling-small-buf
>+igt@xe_oa@short-reads
>+igt@xe_oa@mi-rpc
>+igt@xe_oa@oa-tlb-invalidate
>+igt@xe_oa@unprivileged-single-ctx-counters
>+igt@xe_oa@oa-unit-exclusive-stream-sample-oa
>+igt@xe_oa@oa-unit-exclusive-stream-exec-q
>+igt@xe_oa@oa-unit-concurrent-oa-buffer-read
>+igt@xe_oa@rc6-disable
>+igt@xe_oa@stress-open-close
>+igt@xe_oa@invalid-create-userspace-config
>+igt@xe_oa@invalid-remove-userspace-config
>+igt@xe_oa@create-destroy-userspace-config
>+igt@xe_oa@whitelisted-registers-userspace-config
>+igt@xe_oa@map-oa-buffer
>+igt@xe_oa@invalid-map-oa-buffer
>+igt@xe_oa@non-privileged-map-oa-buffer
>+igt@xe_oa@non-privileged-access-vaddr
>+igt@xe_oa@privileged-forked-access-vaddr
>+igt@xe_oa@closed-fd-and-unmapped-access
>+igt@xe_oa@oa-regs-whitelisted
>+igt@xe_oa@mmio-triggered-reports
>+
> igt@xe_compute@compute-square
> igt@xe_create@create-execqueues-noleak
> igt@xe_create@create-execqueues-leak
>-- 
>2.41.0
>
