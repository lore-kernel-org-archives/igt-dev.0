Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE335C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 07:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D9510E1F2;
	Fri, 23 May 2025 07:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/DuDBoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B13310E7F2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747926483; x=1779462483;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=IIh707NmaSdhxtlmCjP1llMzEsWS6mzXvg69F39rhO8=;
 b=X/DuDBoHQ1LGyGGPURtYj2Gxg2PQZC8IGFPGd4Pnoj92rTnCMuH1Gqj0
 NUUX+5KViyrbKJ/WUXkRWDX0sUuKLuiX1zCSvGtHOM5XPeKAZOdPn8Aoa
 xmjbBbkAQgwrOo7V6Y6OG6VtLx+25HQynQnasO0De755d36MNK+L5PQUK
 aKUverF7tzo2hV8ZajyHIwb+JjCF3mX1FmAMIobg/XFpDobNVhQrM20n3
 Hvlc/HuYVJba9w1rRG69xuRmCjob9wpAF7t9QizobF3lFgCBgvJHwMOec
 bjMGmOv38iH6TCB+Ndj9OsfQKL+BkiNAbg8BY89PwQ2vqEbO3MZAraSjf A==;
X-CSE-ConnectionGUID: opJ0HN2NQq65U1AtVhFN1Q==
X-CSE-MsgGUID: HkxP6a+FQYu5Xd004aaFcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61364186"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208,217";a="61364186"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:07:25 -0700
X-CSE-ConnectionGUID: 59rE38vjRpak+v/y2FNduQ==
X-CSE-MsgGUID: ZQtowHEPSaKztRYSJt3ksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
 d="scan'208,217";a="140519193"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:07:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 08:07:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 08:07:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 08:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKUceoRgOIhW5fphHhcvpYcxggMHxR09KMOpiAz+hPTiyN3sq1Boy6Dyd8RGFn53KuEUCBlwc8HGK3+EjK7+IkP3+sHJBH4IwpAvnujoKDiASd9JLahqDr1bKvIvXW0SiPydpsDkjPw/8mm8RoqmTCNRvAZgP1raOUl8hjnePHNVteTyWPShvywE+rWb94+FNrms+LqvZc/GckCWEKOhoa8hvNNa0ZQEXDj2Gw/s/DTvzwCvdbJdDj5R/rMmlpXOUCLeN6t6uwuRY9tY4faAe3xOy9CQBnl7SGCCiuyy0VW4LAMUBEn787CP0WPe3AcLqCgGCOSYw3eU9PW7IszO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upa5+O+rg2gpmIqb3MPiX8+AdtWikg2bar4jB3K+Ywg=;
 b=pJK6glWaIUHLQaSqMBY0FNZ013E3iEg6mlurt7FOaN7KE52DUDPNOfbq5OqcD8dBLJEt6PsTuFzK0HS/mDTRr/c3/FmKj7J2spJ9dw2k3FIjP6lNYhMSIdwgeLFJQPzGGKl6jbOPf1wEZuUqlnN/2TI92x2+zN6i2cow9XZ3l/7dYavx7QrksTMD2izY1mB7aCLLpQUgmOWECjSGlU+K8IzHhR2ouYUh++iJpvgKlfyteLrBKvhHHaVCpHgkl+D/0hXVsNy84S87wB5DS/ygzzvuPDmzeLBUcDQ9nl52d/0uJpoU2ZOWv/26dwKSBntqYXRIpV8guQU64b4tmIzJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by IA4PR11MB9202.namprd11.prod.outlook.com (2603:10b6:208:56e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 15:07:06 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 15:07:06 +0000
Content-Type: multipart/alternative;
 boundary="------------z05cdfyufU69BukhYto95Sn1"
Message-ID: <a1f298cf-c9c9-4b77-8200-2ce82da28410@intel.com>
Date: Thu, 22 May 2025 20:36:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Ensure consistent GPU frequency comparison
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>
References: <20250520171641.2421623-1-sk.anirban@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20250520171641.2421623-1-sk.anirban@intel.com>
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|IA4PR11MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6a9862-e775-49c9-a395-08dd994250fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVBRM2pmUFpoWC92MTR5UkFlK0gzazgzRFFFZXh4bUU3K09qLzlVYkxObUJx?=
 =?utf-8?B?UFEwM3VzNEN4czh3QmJ5aHVHdXJ5N0pzUkZla1dLWndXdkJzaEx4Nm9OeUEw?=
 =?utf-8?B?dDE1T3QvUHc1TGp4K1hsLzdudUZ6OWZYNDRjenoxbFFtUTRPVFlHUm1maFM4?=
 =?utf-8?B?MkpYVHIrTTQ1ZisyZHRPNFgwTkxrOVcxNG1YZGtFYitGYW43bGxKc1BZVmdl?=
 =?utf-8?B?MkZGbTBYR2tmYmEwN0J0RVBaT0gzeitoSjZaL2wrVTNXZkRyM2VxL0NMUWtX?=
 =?utf-8?B?NG8wdGZteG4zL00yQWFnNVFqb2kzaEp2OUdCRG05dm9wbHFYQSt4Y1czRG1V?=
 =?utf-8?B?MGdEd0ducTQ4bzJNdlJiVE50YytTVk53dDV0Z3BEdi9wWjBjOWpLMFg0dUo2?=
 =?utf-8?B?K2FlTkRhOWM4QUg1dVdrVHIvS0RKWXdRRUlJa1l3WDZOUkUybVpMZFA0RGNL?=
 =?utf-8?B?aStyekJ2WndWTVZMYkpsRTQ3RVhTMGhoTG9YNGJEOEs3Q2NVQ1FYTnROZXk3?=
 =?utf-8?B?RERDUG16bkV0UjhxTTVuRDcyZnBmNXM2aWoxQ1IrdU9JTjcvT2djMGtBbkhL?=
 =?utf-8?B?Z1BqbFdjTkJveE1FNW14a0xjS2I3dVBGd1VJVFBPUjdYeHBlYis1a0dCZDJP?=
 =?utf-8?B?VjFmZ1BhbDBVeE51WVlReXRDUkFwbmVpd0RQd0NReVFxWTQ2OUVaeWIvOE9a?=
 =?utf-8?B?N1daa3BxZ2NxYXRER1hzMktJSjhvN1Q3dks1WVJ2T1ppM2d2ZndNWXR5dzBI?=
 =?utf-8?B?RG9La0I2dTd4ay8vb1ZPeER4U1FTbnRFZHp3NjJDN2FETDNYQU5zbGVNV3Ir?=
 =?utf-8?B?UXBUS1drSy96WlhjUHVVaUlCNGp0ZXVVM0lTQ3IzaHBJdHB5NUtPaGZsQXdN?=
 =?utf-8?B?UGpsbGxSVGsvYjZ4YkFRMmp2OHBTMVRVTE9tMUJxajdVbC9kMkp4TXozeU5a?=
 =?utf-8?B?bCtRUDQxRHNHejBnZXFoZk5jVXcyZ3FUVVdyUm1PVWNHeXpzZWZHYW5pVzBJ?=
 =?utf-8?B?ZXNyZUdVVlJGUklaQUptVitZOHYvaHpjWlBHSm9zUlFZRWxjR09Gd0hBWXlw?=
 =?utf-8?B?TWx0YWhYWjE5YmJxcnd3SFFiNEVuZDdLRDhEb0E1NGFnOEFzbzM2SUh2RUxK?=
 =?utf-8?B?RW9vZVFJWksvS3BaTUFXQ05yN3JWMDNRdm8xWHJONEoyNGVqeXV2QXhOZ0tl?=
 =?utf-8?B?ZW90U1JsbFJJaHJpNUNjSGh2Sjh6Y2dITFFsejBxWWNsYWJ3ME1GdDZRaVcx?=
 =?utf-8?B?MGUxRFRqek9ySFZ6QUM5dWUwaWZ3YzA4NUE3bVlkL2tXRHNJZGdyY21zdXhw?=
 =?utf-8?B?OHdnR2RZM0xPcmxKZXpOUjBjbXdkTGJXRWJXamhsZlNRYVBHMFRVUW1SSU5C?=
 =?utf-8?B?SVRXQlpDVThEUzVVeCtHVVBHNXA3d3BXTEMyMnp4NjVkdFVjYytMNmY2T2FB?=
 =?utf-8?B?ajlqMWlQOFozWG42djA1K0RPak9rVFZ0Z2tGQ0EzNjdyLzJjR2dDMElhbzF6?=
 =?utf-8?B?T24weDFCQWhxYVFCc0FLNkdyTllLWGsrazNJVUN0Q2w1V2ZmdUNZMHFvY2pX?=
 =?utf-8?B?Tmc0TWZnMXMvRXJmcFBPV0lyZDZwb1RvcVdtc01FR1JDRDVxb1NNeERKNktT?=
 =?utf-8?B?SzFsWGwzeHVHbzUzSiszMHNtRGh6Rk9iZGhJSWRFdFJxRXNyRTZoUlZZVlUx?=
 =?utf-8?B?dmFmZUNFMEpFZ1ZDWkRSZmJJSDIyQnY0Qkg3TDlhUm1DSW5XSllLcmxsalZQ?=
 =?utf-8?B?SHp3cGlHTjM2eWdyeXhXck9pRkZuMjhEellHVjZhQndvY3FKV1A5Sy96aGI5?=
 =?utf-8?B?NTBqYWtiZ3hEMkcvMVBqMnowZ2QvaFFIMWhvazh1aU8rblcvQSs5MHQ1MGNC?=
 =?utf-8?B?RkQzNUpuRWlGQkJOR0F3K2tCVFhQNElzbWdQYmtnY1BDckp1NENSa2dRcTJm?=
 =?utf-8?Q?QyAUSbcVK0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eml1bE0xSHZsVUwwVjNSMnVFRFBKR0VLZHZ6bGZ0eld0bGVqT0hzNUpCbWpY?=
 =?utf-8?B?WXo4NWRBOXdXcTE3VURnbGRPbkhMQVl2dG9CQVhSNHVEN3pYeUdlTkRkcXda?=
 =?utf-8?B?T0xEUm9HYnJITFNoMDV6Kyt3eXNieUl5WEp6aU9UcCtUR1FTYTIzREhUbUJw?=
 =?utf-8?B?dUdaeFhJcmN2UHFKSUs1YjdkSmVjWnhSbWU3bVlucHlpOWRnM240all3N0Va?=
 =?utf-8?B?YWlVOHN3aTVhWkRUWStzTVd3ZWQvUnVjbXBXSzZrZXBFMVJIRzhvNU1uWnkz?=
 =?utf-8?B?RHE3WXUySkQyUTRhb05SaW9tdFhuSGtwWTdYaVMwQjM4SFFPOUZzR050WWV4?=
 =?utf-8?B?MWdkb2x2bTN4Q1M1VnRpUXE1NXdiM3QvK01TV3FnY3R6UGhTTUhiTGYzQW9h?=
 =?utf-8?B?T2tENGVsNWVBZmRmVHVIWUc2OGRUWFhONFd5aWl5RENtdkQvaWEzcFVma0Zz?=
 =?utf-8?B?ZHE2SHBEMUs4SnhTWVJDdi9CSDJma3pUQ0ZFUU1kOUZoUkNkc3VRb0hkMjVG?=
 =?utf-8?B?MGgrZDZCeUFIVm1IcWRsUnNiS1E0ZlRpcklaQkc0ZGYwUHF4K0VGbUdTQVVv?=
 =?utf-8?B?cS9nZlBFQy9NVDVCVkhBWDk5eTNOYzZHYm9uYjZsQjN3a0Q0Wi9xcHFjYmIv?=
 =?utf-8?B?SzBRd1dBWmtna282dFVlVTFlWEVpMTlDbmdQeWgzZ09vWThYY3lCa0twU3Np?=
 =?utf-8?B?SDVaS0dVYTFtRHlrTUM0QWJNcGlnM2pORWRYcXVIN2ZWY1N3NVI5ck90YXpk?=
 =?utf-8?B?enhCN1FPdXd5eUEySzdHbTlNV2ZIeVl0MTVpRjZpNkpBWmFxSHFFVkRuU3dE?=
 =?utf-8?B?ZWgrb29SRW5XbWZCbzRFMGt6MmlMMk54d0RiL0JodktVMGZKZGRUTnBySURi?=
 =?utf-8?B?VjJpQ3pweG15YzhTNDdSNWpRaTVJRUxmQUpPMW84eldOM2FLSWM2RnYyWVRw?=
 =?utf-8?B?cE5xOVRyVnIwdmNuU2YwUFN4NnN3L2E0amNUZkltaW1vYXdyUnpJMktRenBH?=
 =?utf-8?B?VjMveXV6Y3A5K3l3TTlUdjJiUHowcVR1KytDVzU3Q1lhaXNTQWlXMS8rVkFV?=
 =?utf-8?B?S2NuamxyTytnZlpMbFNVUVdkZkM4OXBUNWs3bmxtUHNIWko3cWdRQUovN2tw?=
 =?utf-8?B?VkJ6SUU0d1JOd09DdmFMZHZ1M0FPM2tNakQ2NEREZndpTXZxaEUra2k0eE5j?=
 =?utf-8?B?UnI2OExOMmlVc3FaL082c0pqdVhIOWZUSWU5VlpQS2JScC9lVGtMeU1LSmpV?=
 =?utf-8?B?NFdRdzFSM2Rva2RzYjNZTVpkcUVXSloyakFrTGo2d0tHNWZISlIxQUtBZ1BD?=
 =?utf-8?B?N0d1UGRlWWVvYTAxKzloa3kyT0t0dklWa0R3S1A5Mk54NnkzVlhkb3FwZlJC?=
 =?utf-8?B?c0c5YnRNRzZsb0JOOUVmUks5Y3hlRlU5NkdLTHdlL2w3QmZjd2dxQitwZFZG?=
 =?utf-8?B?c1FDZFlKWUsvc3FPcFVSbEZoaTFLS1cvdm9WWHpnNUMyVWdLbmMvSlBjaEJu?=
 =?utf-8?B?TmszeTJsajZ4N3B1dG05MG5Ucjg4VmJwbFRsN0xGMnJYcFcvZ3pKOEpoTEFF?=
 =?utf-8?B?ZTFBQk9LeHg3VitVYksrYXEvSXJnWVVLeXBBQklOWk42K044YlBjTnJNNFRL?=
 =?utf-8?B?MVJ6UU9vaVRwRFpZdHZTRzllZU9hK21HWU8wY3ZMTHV6QXdoN1V1TVZ5TlhK?=
 =?utf-8?B?ZUVINHV3RVdzby9vSG5rYll1Z1FwSDJ3WTNxTmJlaTRnN0ZWMEgvbFRrdVN6?=
 =?utf-8?B?ZWNrdDA1Ry9sandTTFY2aHV4WmRlUS9UZ1Q1aVA2UXpXVEVtcERqSzlCWnN3?=
 =?utf-8?B?V2NhYjZMQnQ3ZmpRZzFoSGZPcG1vUHZXeTVWaHdxN01nNmJQNWh6VHZRR2pZ?=
 =?utf-8?B?SHBEVXdIbmp5dWoxT3RWRHQyMEVxNlVaekxsMTRaZTcwZFY0aVVmSThoQnht?=
 =?utf-8?B?a2JSSTc1NHJpdE1FbkdWV3RRM3hEZmNGRDNSOEZ3cjBDVWNiWHlvL0hmQ29H?=
 =?utf-8?B?eGkxSFAyV21qcytFOVlkTkFEQW10bDZnRTUzS0VaQjRiZGM1WktiKzFiQmZu?=
 =?utf-8?B?TnE1djd3aEdDdEFnbDdWVDJ6alBvS3JaNXpqQWtYTmZCVmhuU3ZrNlJDZFdD?=
 =?utf-8?B?ZWQ5emkxSjAvVmcyR1ZLRDBCQ2pLMUhLRDdXNG1zVzU3cHJ0S1FFQkhKa0x4?=
 =?utf-8?Q?0ARqlTBHn0Zbum4lj3qcsrs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6a9862-e775-49c9-a395-08dd994250fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:07:06.7080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sd7tUSmFreX8WJSfdyPw69BXdR+CyNP0Pqr50P/X2NIL/BmEjMkukbvXbIIX4Fxytm+Y1uZow5lAseajzJIOuwC4J5D2Paz1q5RvIuKW0OtXqwt1RmgE/WFc+UH4/G0Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9202
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 23 May 2025 07:14:42 +0000
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

--------------z05cdfyufU69BukhYto95Sn1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20-05-2025 22:46, sk.anirban@intel.com wrote:
> From: Sk Anirban<sk.anirban@intel.com>
>
> Fetch the minimum frequency only once during GPU frequency restoration.
> This avoids inconsistencies caused by potential changes in the minimum
> frequency between multiple fetches.
>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pmu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index c49cceff5..f830c5de8 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	uint32_t gt = eci->gt_id;
>   	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
>   	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
> +	uint32_t current_min;
>   	uint32_t orig_rpe;
>   	uint32_t vm;
>   	int pmu_fd[2];
> @@ -440,8 +441,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
>   	 */
>   	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
>   	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
> -	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min ||
> -		   xe_gt_get_freq(fd, gt, "min") == orig_rpe);
> +	current_min = xe_gt_get_freq(fd, gt, "min");
> +	igt_assert(current_min == orig_min || current_min == orig_rpe);
>   
>   	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
>   		 min[0], min[1]);

It looks good to me.

Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

--------------z05cdfyufU69BukhYto95Sn1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 20-05-2025 22:46,
      <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250520171641.2421623-1-sk.anirban@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>

Fetch the minimum frequency only once during GPU frequency restoration.
This avoids inconsistencies caused by potential changes in the minimum
frequency between multiple fetches.

Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index c49cceff5..f830c5de8 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -390,6 +390,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	uint32_t gt = eci-&gt;gt_id;
 	uint32_t orig_min = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;min&quot;);
 	uint32_t orig_max = xe_gt_get_freq(fd, eci-&gt;gt_id, &quot;max&quot;);
+	uint32_t current_min;
 	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
@@ -440,8 +441,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, &quot;min&quot;, orig_min) &gt; 0);
 	orig_rpe = xe_gt_get_freq(fd, gt, &quot;rpe&quot;);
-	igt_assert(xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_min ||
-		   xe_gt_get_freq(fd, gt, &quot;min&quot;) == orig_rpe);
+	current_min = xe_gt_get_freq(fd, gt, &quot;min&quot;);
+	igt_assert(current_min == orig_min || current_min == orig_rpe);
 
 	igt_info(&quot;Minimum frequency: requested %.1f, actual %.1f\n&quot;,
 		 min[0], min[1]);</pre>
    </blockquote>
    <p>It looks good to me.</p>
    <p><span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span><span style="white-space: pre-wrap">

</span></p>
  </body>
</html>

--------------z05cdfyufU69BukhYto95Sn1--
