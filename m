Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AD7C36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 09:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09610E3D7;
	Mon, 28 Apr 2025 09:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKsLT/Lx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053B010E185
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745818957; x=1777354957;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=B4UU5xxwHCq2LNvW8YNsHzJxHh5wgI2VxOahoJujgLA=;
 b=oKsLT/LxoykomY/IEx2R6/lDY6F3g6jpbUSFPmNYjHTF/2kw+wmmsNAl
 chvonJnkvbQcmZArGHF4jkrbAd0g7kWVDoV/AgZ7wF5I0OriBLJd0WGEw
 IS4BXiBtWFbej5JGCxhemD4X+Ts63BFKLxmh13Zs1bi2ZucW/PZaqaHKd
 JpwT8t8YEO3YXO/xlSnWEFnmTRogRKHVNYxXjYz+hWWVswdzQjvC43Ygi
 w5rGpIf/mMieLJrppQFLyaHeFf5r3INkw3tRXfparupWf5iN7pSxMIYsL
 mUliSerHXjSaR8dCZ+onp5D8e8+nyzp8ZNl5roniP5GreQDFt61c0A4ll w==;
X-CSE-ConnectionGUID: oWrUkdTaSl2r6NqtLOZt0g==
X-CSE-MsgGUID: JEIqwRFmTVa/8frYIFoTFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="46627866"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208,217";a="46627866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 22:42:36 -0700
X-CSE-ConnectionGUID: 8qtuWyMXQBKqYyLSmWUqYg==
X-CSE-MsgGUID: Ur+31oqET8yfsmMB61fj9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
 d="scan'208,217";a="156639901"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 22:42:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 22:42:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 22:42:35 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 22:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbT/hQNFUPq4oFnELk/hTrqQbsgvF7pJf61q3GVc7UTR6YDUVqFFjg7SoNsB/ihEUcUV+NFwYRiypEPXp5NnZDMzFklm1b01lvz5cVnHGfzQTSH4dUr2Zo0hii5kH/gMjLA5SiJ6maq60U8qUdLG8JK92qZhn55jH6dCchKjl9al2T0NXpzdATQxnIGpYoe1S/Et/rjP6Ik2AV2urCP8wTM9P4pMjtCvpWNvgFVNdDHMFIjBusby2MBQ3TxulfGs2PfUMuz/T5eLhAfELQLRi7xPMDNySXkarHP1KatIMqb9RCWvJGffpRRB8u96U5ab5zssqIrwx37Y8dyCy3XzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fk+Stojp6qWHfKoTJCDDbKzKSeCsWusYwZ24NT0k4Pc=;
 b=q43fKITn+FBtSm+BpMo/hNqnTsY24VaXaWAb1+HJ6wawY9rMseqO7EzMWnIXtIvj8aikeyrdVigq6BdCxiqc5J84rSHM12f0LUjV46BbpeRESnIbqsPr/606Lp+eKE4kNWpQ9xMdrAHBf+UNRAn8+HwUn/w+QA1YnQ3Orr4Rl9pD7+Wa3/AKhgI7Pz+N24VnKI4HLYDftJCl/2+sAPdV3RrZ+i/+7v5Ur76zpD+QbMLgXFCPsELFoWY+EqF6l7KF9uPFriOsX/LBGSvj7YxcT8mEFrZpUV+SJL1E/DmQGqc1XCvzORaLlXk4+oVC14Wud5pzDV6Hg0ib/MS4roRRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 28 Apr
 2025 05:42:18 +0000
Received: from DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2]) by DS0PR11MB7766.namprd11.prod.outlook.com
 ([fe80::2dae:96bb:6d35:f9a2%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 05:42:18 +0000
Content-Type: multipart/alternative;
 boundary="------------KNLQ3glqimwIzOLToxsP9Xm2"
Message-ID: <15c13750-e1d6-41b0-80de-dd9512b24534@intel.com>
Date: Mon, 28 Apr 2025 11:12:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_pmu: Fix frequency stashing issue
To: "Anirban, Sk" <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250425180658.2533825-1-sk.anirban@intel.com>
 <3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com>
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To DS0PR11MB7766.namprd11.prod.outlook.com
 (2603:10b6:8:138::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7766:EE_|PH0PR11MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff03f73-8b01-4ed9-41f0-08dd86177015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2N4NzRTSGRvN3Y0bVZtSlM3YlhwY0ZzRHpHbzRKQ3ZHM3Nhd0VkWGZvN1Nl?=
 =?utf-8?B?OXRxU3FTRlBxRnBoTGoyZHNkMFJ1VFFUallxZUlIOCt1cDB0eFArbWhKOG9M?=
 =?utf-8?B?ZmhpZjU4bHFKM2VzWFk4L2UrZWQ0ODRINlRGYnFtU1ZRbk9nM1NpdmZ5ZkVt?=
 =?utf-8?B?bEZweENUcmFPb25Ud3JvZWw0Y2hMenZwOUlIMHhGL0x4ZWFTSlViNDZkc2ox?=
 =?utf-8?B?RUZGTDY0b1BIQ2V0REsvTS94Z0Zta1hTNTR1S2xrUDd0R0c2Uzl2cis3S2Ri?=
 =?utf-8?B?Snp6SmV2TmpyOGk3a0dudkVVNWt3UWVmWElhRFpQL2ZYRVFoa1lmRnNFbDFJ?=
 =?utf-8?B?bFordUw5Q2NkMGduVU1uRG9PVWNTZEFuSXQrTWY2VHlLS3R3Mk1OSWllNDNU?=
 =?utf-8?B?MzdWWXV4Unc5RWc3cW13TUczUXUxMXRuRFY3VDU2QUR2N0ZRNXdCUDgyZFo3?=
 =?utf-8?B?eG4ySXNQVjAxN2ZPT2szbjYyS3VSM1QyMVNpTTZ3Wjl0dnFzNEo2eTFibXlV?=
 =?utf-8?B?Zk5LekZEM0FjckQrM2JUaUNGdlNYTmx5SmdkSmRvSW1hYXcxTVRaWGZhQWFS?=
 =?utf-8?B?Y0VNUmhlaFR4VzhQL3VHMndJNlB4WFVrdzR2Um1ielFqUlFacnVUTFZXUFJw?=
 =?utf-8?B?WnlKaWVwbFI4N2FOYjhRYkFvN2pGblV0MDVjelRCcUVRRHNPWFV1TThWcWUr?=
 =?utf-8?B?WnUxSEVkQklLckJEdGVGakoyOWJ0ekN0eTMxSHN0cS8zRzlXekl5cVhJU0RU?=
 =?utf-8?B?RTNXS211VVZRS2x6MzZMQjVYcnpkd05aelVFRUJnTFZvSU0xaFMwbTZYSk9t?=
 =?utf-8?B?SmRDVm13NlhIanJWZjl3N3hUZGIxSENOeGxoMGc4eHVMeGNrelJwODJpakJ3?=
 =?utf-8?B?T2JtNkdEVWxSWjBJNzM3ZER3RGtLRitzOXVqV2VvdTJWSmxtd3pydmpsaC8v?=
 =?utf-8?B?c1dPaW45WWZlNTZRajY4OEQ3YlEwdUNHcGVrMEJhWmhkZ25MMDZHRU4vdjdu?=
 =?utf-8?B?TVdhMWJ6aTJDUE9XRlBiZ2NDWmk2Qlc5Vm5xQTJWM2N0VEJiSUhKK3BuUW9O?=
 =?utf-8?B?b1NDMlJUTjF3KzNVVjEvS1FyWFNadkJLVHZQc3JmT3NsYnRaUzNnTnFKRDYr?=
 =?utf-8?B?WWZVdWdPQUxkZGtFenNsbW5MYmNKVHhDNE1heStIZkdmRVVjWjMwdFJET3h1?=
 =?utf-8?B?MnlHdkFlaWFrWXRpWDBzMlNwWE1SNllac2w1STZOTGhITzVXRXdnZWszOWY5?=
 =?utf-8?B?VG5LTm5lTFNLYjN2SzZlSUd6Nmo5TEx4RTNDUEhtNUdWVzFxRjVCUUtKcGVH?=
 =?utf-8?B?WFFhWUFnTG1hRXI4NXhWdU11aUZWTG0wRFN2VnBsZWM5c2FMRCtxMU5VSWVi?=
 =?utf-8?B?ZzRKQ0duUGthOFhlZlJLb2pxSkxHeEh5ODZlWEM4VDRlb2ZPdkVhaTdmSmNJ?=
 =?utf-8?B?WCs0cjFucUc2R3I4VkYzZkJEODNJU29STmtwWXFJdDhRTE9td2lFdGxMdDFN?=
 =?utf-8?B?NURiMHlUZGpVa09vSFhLdk9qWW5XaGZrTFF4OVIrSzBReWZCYnBEbzl3djJw?=
 =?utf-8?B?MjdXQ0pyQzEzZEk0QWpvWUdqbEpjVVRJTnlQU2VtNEhrSkNDNzlldXJQbGM4?=
 =?utf-8?B?OUhIQkcvRzg5WDdINVJnbERCMzdIL24rcjJGT092R1pDQnVFY21LM1dLdFoy?=
 =?utf-8?B?Nit6djhlcXhCRlFid0dsNERUL1MxaWxOdCtDMy84K2xQcTBqSHZRN0tZZmNO?=
 =?utf-8?B?U3ZabFBEWnRaSlErTlAzbEZpNkJtaXdUSDJXSUdPUUNlTDQyQUxrVTE0UnJ4?=
 =?utf-8?B?UzFPYy85ZGtwYWhpQitzNmljdy9XMFRhUS9JU2drSWVORFRqcXQ2cTlEL2xt?=
 =?utf-8?B?Y09KcDFyUjlNNGNiQ1BYQjRsemFYRUxFS0JtWmt0RzRlQk10bVhLenQ1eEFy?=
 =?utf-8?Q?2+N6KiAqLV0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTcvbnhuZFM0RkJubFNtVDZ1bkY3bEtJSEFleDhHaFkrT25qK2tDNW1VYllC?=
 =?utf-8?B?UGt2d01rWWVhZWNvREtwdUE5c2l1b0JicEsrcTdHS1EwRWhjR1k0KzNlOFo3?=
 =?utf-8?B?VEFsSXpJWUxSRWRvWFVRdFFROW54NGpxTCtuSmhqQzVkZitOdEhqMmRkS2pE?=
 =?utf-8?B?MS9GNXV6T3dZY1pMSmpNclcyTEdEeDUwT25Bby9YeEV4OFhCVDAwZmlUSlRi?=
 =?utf-8?B?UGVNUmpKUHY4dldva1Z0dmswNDc2NkxQWGhPMmJOWlJpb0YvdVBRU0VndTdO?=
 =?utf-8?B?N2toZEgyL2E5U2NjdWQ1TWVVZXRST29rWks4aGUzN1cyWEJaOXpwZ2FWWUlo?=
 =?utf-8?B?VnBaY2pMVllZYkRudGtwWFc0ald3ZmdxMnlWY1NtS0V5dWlnZTF4RlkwVnVZ?=
 =?utf-8?B?YmNSK05Bd1dpSGgxRzZvNW5uQVVkU0Q1U0pGU2hSQithelJCL3RyT00zUDNN?=
 =?utf-8?B?eU1PRyt4SXcwbUM3cTRJczB5SllvTVZZcmpHODFZQkEwYzdyUkJTQnJ3MDRs?=
 =?utf-8?B?cTVndzh4NWFiUmwxR25NY2hwQzRQSWFMSXFiMjdaclg0MnRGT20vcWZuek9U?=
 =?utf-8?B?S3hoMllWdG5mK2U4SnpRWW95VXN4YWpxeWhSM3JLcUE2L2U5ekpQOVpIUXd5?=
 =?utf-8?B?VWNnekJtME5aVlI1T2pzMUltKzk5eDV3YVNBTG93SHZmK0sycFJEZEFNOWNx?=
 =?utf-8?B?SGsrT2dHclJXR0hJR0piUTJONm5udU01eHdRcGY4THd0eEVNWjZmZjNaaGRh?=
 =?utf-8?B?dW1jUnM1c2hyQlVVd3N6MHRWbU0wRmg5cU1JVW9OeVV3QUU2Q1JtK1VabEhZ?=
 =?utf-8?B?K28yQWw2cDFEbnpKM0R4UVRlWHk1aUJmTVJQSnUrOUtvSWljbUpGYW5RTkl3?=
 =?utf-8?B?RStLUDQzQTMwOG1ObFdMQ251SmVucmc4RGFjcTJURit4bW5kWGtPYklvRm0v?=
 =?utf-8?B?cmdpOWIrM2JmNWRNNTVDMlAwS2F1UUljYnNORm9mZW0xMkhWUU9kMHhDOFBG?=
 =?utf-8?B?YW5WZElzL2FJTzVCbk14c21xVlhHMm51MU9MSHNnMnpXSFlQbml1SkdsU1Fj?=
 =?utf-8?B?RzhZVlpjWWlOdlZCK3VaUnpiSnpTRXJWb09hUHdzaWVoS3NlQTlTYXVKa0x0?=
 =?utf-8?B?TVhLUkZTSDY2VmZRekY2VCtoamNYdEVNM3ZQUFNyeDJjem8vaVZxWWhFMzRp?=
 =?utf-8?B?ajdaemoxMUJKQ1MzT2UzL3l3YWVTT1JKU2pBNFBQVU12Qi9zaTBZUjZjTVov?=
 =?utf-8?B?MHR4UTY1dHlrdWI0OUg0cEx3eWpEMVFZc0NwZ294MURNVm5BNDZoWnZVL21S?=
 =?utf-8?B?cGo5Njl5OUFuRk1kVi9MazhQYkozeUJGa2VoZHJCS2RaVGZHbGNsWk1XQ3dm?=
 =?utf-8?B?YU1uemhmRUx0VHJ6Q1JFVlJuNnZqMytKTzNEcW8zSjY5WjFsc3pFeXQvNHBB?=
 =?utf-8?B?T3E3YnFCR0tybGsxQzduQStnTEluYTRBQjVZYUVoQjVaU3AwcUNHQ0tEaXgw?=
 =?utf-8?B?VThHclc0VVcrUU5NcUpmUEZUSmxiMVhnbVo0Qkd3NUFjYmFnL0JHbG5LT2ZZ?=
 =?utf-8?B?MG5odnVJejVheURUdDk5QnhsN2VuS2h0N3VVbmhGZEpaSGtLZEUvWnZzd1dB?=
 =?utf-8?B?MlhId1UzM2J2ekR3cFhUajFDU1A3QkpYWTQxZDJ2RzJEVXFZRE1ieUMyM3Ja?=
 =?utf-8?B?bU9hajFEcVd0azd5Vys5SU1ST0FtU09TTE8vTDFiNTRXQU1PYWN4NU5tMG5F?=
 =?utf-8?B?Q0ZiZDY0clRHQVBFbE56Q2VYeUdLRm9jbHhmbjNhNFdvc1IvUVFIU09hbURU?=
 =?utf-8?B?dzhQUkhWOTR1eUl0NTZzS00wcTF5MmZ6MkZGWUJiQ2ZkZUZFa2p0QytVZlUx?=
 =?utf-8?B?cTBPa1dWVGk1aUt6WU84UW1xcUxxcXE1Z0JYdEdpOCt6cVkxWWRMTFQwMS9z?=
 =?utf-8?B?a2lMcDk5RmIrUTF6Q285eTNDM0tsSU1SQXFDK1lrNTlyd3YrRE94TGM5dU4z?=
 =?utf-8?B?dXBrdFhuTVIwYnRDT05YUnUrd3ZwcktUN3ovSjRyYWpoWnd0WkhjaHlocmM0?=
 =?utf-8?B?UllJc2puNjhOb0JqaXJrN3liUW03NENXQnRxdDltYWpUL1dEbStKTDRzVUlw?=
 =?utf-8?B?YU9JVmlFTlpWN1pER0phNzlDVVQ1MWQ0ZlV5blhiNFRBRkR6ZXNYNHlyYmd6?=
 =?utf-8?Q?eHrZ4FYuef84epWVjXKFshQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff03f73-8b01-4ed9-41f0-08dd86177015
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 05:42:18.2846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaJZqRGZkwvJkYs4NL0dQeeoZa3oo2pwFERHjk321K1anFVTh3hg7I9uUTa0rZqvHzzEjgMc3zKB45vPd0zuNZd6BPBkO/WLr0u/82HbQqQ7CmIi5vQquM5b+c9cBOs5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 28 Apr 2025 09:28:04 +0000
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

--------------KNLQ3glqimwIzOLToxsP9Xm2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28-04-2025 11:06, Anirban, Sk wrote:
>
>
> On 25-04-2025 23:36, sk.anirban@intel.com wrote:
>> From: Sk Anirban <sk.anirban@intel.com>
>>
>> Resolved the frequency stashing problem by accurately
>> dereferencing the pointers, ensuring the minimum and
>> maximum frequencies are correctly restored.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 589c7cbde..094dc0c6c 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -527,8 +527,8 @@ static void stash_gt_freq(int fd, uint32_t 
>> **stash_min, uint32_t **stash_max)
>>       igt_skip_on(*stash_min == NULL || *stash_max == NULL);
>>         xe_for_each_gt(fd, gt) {
>> -        *stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
>> -        *stash_max[gt] = xe_gt_get_freq(fd, gt, "max");
>> +        (*stash_min)[gt] = xe_gt_get_freq(fd, gt, "min");
>> +        (*stash_max)[gt] = xe_gt_get_freq(fd, gt, "max");
>>       }
>>   }
>
It looks good to me.
Reviewed-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
--------------KNLQ3glqimwIzOLToxsP9Xm2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <div class="moz-cite-prefix">On 28-04-2025 11:06, Anirban, Sk wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3f88eb7e-f2e9-4b45-8b6d-61156db5b2e4@intel.com">
      <br>
      <br>
      On 25-04-2025 23:36, <a class="moz-txt-link-abbreviated" href="mailto:sk.anirban@intel.com">sk.anirban@intel.com</a> wrote:
      <br>
      <blockquote type="cite">From: Sk Anirban
        <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
        <br>
        <br>
        Resolved the frequency stashing problem by accurately
        <br>
        dereferencing the pointers, ensuring the minimum and
        <br>
        maximum frequencies are correctly restored.
        <br>
        <br>
        Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; tests/intel/xe_pmu.c | 4 ++--
        <br>
        &nbsp; 1 file changed, 2 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
        <br>
        index 589c7cbde..094dc0c6c 100644
        <br>
        --- a/tests/intel/xe_pmu.c
        <br>
        +++ b/tests/intel/xe_pmu.c
        <br>
        @@ -527,8 +527,8 @@ static void stash_gt_freq(int fd, uint32_t
        **stash_min, uint32_t **stash_max)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_skip_on(*stash_min == NULL || *stash_max == NULL);
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_for_each_gt(fd, gt) {
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *stash_min[gt] = xe_gt_get_freq(fd, gt, &quot;min&quot;);
        <br>
        -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *stash_max[gt] = xe_gt_get_freq(fd, gt, &quot;max&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*stash_min)[gt] = xe_gt_get_freq(fd, gt, &quot;min&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*stash_max)[gt] = xe_gt_get_freq(fd, gt, &quot;max&quot;);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; </blockquote>
      <br>
    </blockquote>
    It looks good to me.<br>
    <span style="color: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-monospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a></span>
  </body>
</html>

--------------KNLQ3glqimwIzOLToxsP9Xm2--
