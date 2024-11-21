Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCAAD743CA
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4E810EA0E;
	Thu, 21 Nov 2024 17:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuFnlfyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ED810EA0E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732210949; x=1763746949;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ks+ypnq7oCiR5DFZ93rfUcoGRb5B7zCAoSCDJK1Sreo=;
 b=AuFnlfyksumimFEMmYgxIW1MiYZ+DqH9JAHXPuSDM4ZpJcr/ymrMfD89
 cND5sTz7UrGZ/CNE2TjEoGdEmUav8bOu30u1jy+ALr3aaSuAE/L3CvfkA
 Xn+e/tHq6TJbtsJ6obMVGlSlBBLB2Cp+dNbEp0lSk01ncNFvF5TanB7Ag
 8uyaWEmWbjcDMaCkgjQkZgDq0W/T8MB1R4vcYBIECH8athU8SFR+OcutV
 WbUqD0Ho7UgOV3N1u5XDuyTBHgBkonZPcYJUY9hcWFIu2s0dheTTNMeDh
 zCkOX8Po6bzoMze/zzcXEWaMXK6VHZQ7tj7VlenPnmocwgZyYE4JQBZN/ A==;
X-CSE-ConnectionGUID: v26w2ttBSryfm2x1PViiOg==
X-CSE-MsgGUID: X0Weuc8SRKmjgd7JXySwYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54849305"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54849305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:42:28 -0800
X-CSE-ConnectionGUID: jKXxwiOcTHO+0mzun/xtMA==
X-CSE-MsgGUID: n9UFejHqR7GMr3apZOY3FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94764479"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:42:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:42:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:42:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:42:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XopUjmx6Qyx+2ySgxkKJUju4m2jLXMO3l/x4tKS1aTWzKMr1oeei1NnCaAZ1Z7AijqrklU3U0KLPutGQDle0+MaP20l/1FhC7Hx6ChdJ52PmxfyHlrQ51YgvwgRBQp7/D0HhinLj3mieuYOGsOfsJ218HJFmpQhAlezlSKNvX1X6NCeXkpq0ejqAlQccTTzNyYIBrXUbgfXVjtsBcyaLbyacGDLDC7O2sxWo/QsUjF3FwZEC9DGGR8scaS2q2WEdeuBGWuE0otua/M5YEUfbD2BdUku0RxIzX6corRosZ/gjhC0UjXF/MFI10W81VdwrB7KkIJUGkYKimH4J1TxPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGGt4oZF6RUp68xhz6eE52Tq4PVfqBvU3Myx22LeNqQ=;
 b=L3WSTB5KOP2HggviXfAwRULP891g5sa3m5eePGQlnYavPssTF9moyMqdm0DLwWf33RseyUv7QCPsE6jFpuPionx2Nm51JQJVtrqEspZApPLZnYyEQOeuEyrAn4wb0GMIkBS00EYPu4KXfqERPFtVk2DTaqYwAUDEVevfChewr8mBmORYOdWUXzSD95r1RcYqevoWWrF2mxzVCJRXY9P95kjM75CLHucLtelNE1HZxYAq4rQN19pFJ25rOue1xM+zU+G2kbIInO1OLzUNeGYASO1LbhTDTGMjZ0yEYp974SFN9odafLHoJR6pP8ndhHBhueAyMiFyotIns5VRhBJgZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 17:42:23 +0000
Received: from DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9]) by DM4PR11MB8177.namprd11.prod.outlook.com
 ([fe80::41ea:1e29:8372:c1c9%7]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 17:42:22 +0000
Message-ID: <d64943c3-53ce-4ca8-af1f-18d7c88ae609@intel.com>
Date: Thu, 21 Nov 2024 12:42:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tests/intel/xe_exec_capture: Add xe_exec_capture test
To: <igt-dev@lists.freedesktop.org>
References: <20241120233215.1637981-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241120233215.1637981-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:a03:255::17) To DM4PR11MB8177.namprd11.prod.outlook.com
 (2603:10b6:8:17e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8177:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 48158434-d065-489c-1ebd-08dd0a53dac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmpGeVNzSGNEL2N5K2twRWZtMUJ1dkVVbzdYbkppb05HSjgyVXlHM05MdTBn?=
 =?utf-8?B?YkJ3Mysyb2pTRXBobXoxcTg2Y3Q3V1FwYlpWVzhyWitxQmhaVHUxMHZ6cFJ1?=
 =?utf-8?B?UElJa1IzSVJjYno4UEJRMDZrU1cyVElVV0J0VHFZVWxPYm9iZmVLWUhHb3lD?=
 =?utf-8?B?Qk9kS3Q5SU1lSVY0OHVNcUNsclk4bVZ5d1pWbFk0blByYStDV2I5VEFxd1Jo?=
 =?utf-8?B?Tlg4MVFCeEJvbXZIQ01oa3NQWVlCc1JpU0R4cTRqejNqOGdPdko2SWFsSUpB?=
 =?utf-8?B?L0VhdXh2bml3bVEvaEdUdFJuZjBDcnA5VmlrNGE2UXY3TGIrUVFIQzJITkRr?=
 =?utf-8?B?emJBZ2ZaTjg1WmdaaTRXRWdOK3VWRjk2VGlDWG9SMEphb1FqS0FrTVdwTWd0?=
 =?utf-8?B?WlVCNG1PR3U1UmNWbjJ6QVBKVGk0bjhKS3VHVU9wajBpekltazVOdUo0VG9O?=
 =?utf-8?B?dC95NUY3WmppTDBaVjlxYnlGVFJQT0t2ZTF5VVQ0MUZHRTlGMVVUcFBjWTM0?=
 =?utf-8?B?aGR3em5rRmtwLzZGcmkrbWJYanZleG9ub3ZvM1pwYm1FT0xEalVNeVlieHdO?=
 =?utf-8?B?ODRxaUZERHF6cSs4TnlCc0Z2dzlRWkt1SzhvZ2NJMW5ZdjVyclpTRVY3czFi?=
 =?utf-8?B?NDFxdVBDWkdBc1h6d1Q5YzA5N1VEaUU5bG5YL1dnQWVoL3J6VXF0NTFrTGtD?=
 =?utf-8?B?K0hYVUxVdXRwUkdPODhqd0pJMytkOExMZHBPcTlUUVJ5eU9BTzNFa3V2NUlD?=
 =?utf-8?B?MzFWQzhGVkJOWkxRZ3dWVU1iT0JWY2JOQ3ZvSTRlcXR1dlRoZ1BLU0xXVDBY?=
 =?utf-8?B?cUZCVGZwTEZpVUhEMnNTYUZlT1FCeEJ6RGhiL2pnU3VEMnI3bjNPWmJxbFhZ?=
 =?utf-8?B?eUZCOGpKdUVjMGxVT0l2WjllNm40UTlPVU5RTzVyeUYyOFF0SWQxVSs4Mkgw?=
 =?utf-8?B?OWNVcUtRTWhqSHB3eXR4c0JkVzdlUlFSb3pZZC9XVXpIeXhad2lqUEJOMlNC?=
 =?utf-8?B?bDFjUWd4RXFLQitzeTZ5bXdGRlUrd0JaMnZ1eWVNUCtXYnJlTnA3bmV5YlhP?=
 =?utf-8?B?bVdMcFl5QTl1MWJQTW9nN0ZsYlFiTzBQK0pRdlhFOTZLV3dCR0VtNlN4MTla?=
 =?utf-8?B?cEFLeGs5WCszZGhPajQxZHVLT05xODJFYjVnbWM0YVBRYm5LMm1GeDJiMUVp?=
 =?utf-8?B?amxvZVZjc2ZzcE1jVXdzaXc5WlY1Ukl5VkNFZlI3ZkRZTXAwQXVzZDRXK0tR?=
 =?utf-8?B?aU1rN0RZZHdXTjZUN1pzTEt1U0FZNHo4TjViYzlYMTlqTm9ZVGlrUUVrYU5o?=
 =?utf-8?B?U1RVUG1VS2tNVU9PSU9KeEFoeXJhRkdzb0Evd0IzbkZpdkRRM3I0cC8vaHZI?=
 =?utf-8?B?NVdCZjRGME5SbHRBUkJ4VVlCS2xTMlpnQTlORTl3QnJtRW03VlVzTUc4VmhX?=
 =?utf-8?B?Nk16ejRIUyttTmJCQ0lCNGdQaFQ5QmE5UElreCtjRE1xZDRZMGRIbHJtYzls?=
 =?utf-8?B?bUE4aEFLVXdSYkk1blRJeURWNFQxa1F3cFlORmNGQjBNQVdZSEsvL1U5NGpa?=
 =?utf-8?B?V1lrUjZnampLZ0NqY2FYZ05Va2JmclpUUFRVcStpTzQwMVpkcHZjbUpPYVJB?=
 =?utf-8?B?bHZWMjZiTXhiUFN5aUpTbG5TN092Tk5rYjRwSERrVENNS0dXdEVlMUJ2cDBr?=
 =?utf-8?B?WDRTWFFIc2I3M2JGMmJKMitkdWNjdjdPdllJSkZYYWcyQ0ZkcFFOOXQzSUpZ?=
 =?utf-8?Q?O2TAIbUbK7yiC/S3FOn74jdGRTaFVjWiS1pQjX+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGpKMisvdmVUWG1GYWhYSkFJdURyRzVkbFgxeVovM1VhSzlVRkhQbHR1WkIz?=
 =?utf-8?B?cFZvRG00cS9ZSmZXeXkwTUNjTm54ZVlwVkw3WlcrYmZWdkhBZkoxZ0xOS0Jl?=
 =?utf-8?B?YUMrVFJMb1p1cTBTdTIzRDdaTE5DeW9KQ1l2UEc1OUw3WEtzejFiZXlMV3Vs?=
 =?utf-8?B?REpsSkQ4SUpYMXlVbmJlVHBGVlAvR0kwUTI4OUZhSG0xdSthTlpJVTgrVm1N?=
 =?utf-8?B?enFOVWZJREx4UmRyL0ZPempUUTkzWDhJTGN2cmtqTFoxZHg5WTlydHNFTG9s?=
 =?utf-8?B?U0NXVlhuV0IzRXRrODdEelVTQUgxclk2ZlkyTFBodVB2bXBtTkU3UG04RWNG?=
 =?utf-8?B?YjJ5Wnhkb2ZreDR0dFQ4LzZxK1J1TThBV0oyVWRzcG5neERHd3JiM3hLcW1I?=
 =?utf-8?B?ai8wVUp6Y0s1SzU3Vjl0USt5SnRsQTFQbEFtTHlubkNVbU5LVXFSMUxZQlZC?=
 =?utf-8?B?djVBOGpUblhmT04zNHBjMU0wYjkrZmk2SFVCVEFiTmZlNng4NSs4VFNkSmR2?=
 =?utf-8?B?N2EzazA2Rk5IQjcyMlMyRjZqaXVLenllbmROZ3hybDdpL1pEOVJUL1NHcjJR?=
 =?utf-8?B?YmNXVS9ic3cyM2VSaTVtRGdNRE1JNjZBbmxtalBLUDI5a1lCU0pRaUJtbWZR?=
 =?utf-8?B?d2RFMm5wSUQ1ZlkwM3pVN2xPT1REcXVVQ0pCWk44Tkt5SE5GWExVNmxsM2JF?=
 =?utf-8?B?d1k0NzZiSi92aEppSGpVMStaQnpCeERXcWhLVEo4Sm1vVlNFWWJPVVNSV28w?=
 =?utf-8?B?RG9pcWhScXhlbGtHTWxzTWdGT3RBV1E2ZEMxV091bUFEeHpsaEw0a0ZJLzNn?=
 =?utf-8?B?RXFJbEg3ZkJkekpJcUZSbGxOZ0F2blBhR0V6MzdLWHgwUjBHeGdnL0w3a1JF?=
 =?utf-8?B?Y0dsdDdGSjJkb2cyUEtZSXhhbWZBckFjNnVWY0xMY3Y3NWRSazViYjg0TVha?=
 =?utf-8?B?OFJ0Nm9kZ3pHQkRlcGlBZWUxaitlcjlyRjd3RjdyeWYwL1p5YlkrY1VUdXM1?=
 =?utf-8?B?dU0yL0F5TnhFSnNKcWpMSklzazZFS0lTSk1vNGw4SUdydVBCUys1T0V6eVp6?=
 =?utf-8?B?THovdUZoWkVJQ2t5MGpSbEtjRmN3QmFxaVRrclhhOTlCTTFEd1RBVW81UUg3?=
 =?utf-8?B?S2RjYjZVMHgyeHZXUU9GZnJ4OWdIaHdVVG1VNVBXa0JyVExlTEJjeFRlY2NQ?=
 =?utf-8?B?dmkxemJQTTdudFVQKytMTHdtcnR0WC8vQXZHVEhONDBuYklnYlNPVVczUERU?=
 =?utf-8?B?UUhGTk54MmhhOGdRU01aUFY0YllTSjlrMVpHSGU5Y2xEOXFlNDVPRmR5U1li?=
 =?utf-8?B?RkNKaVBqQVN0NGNiNXBRR1ZaUGhmUFUzMHlJck5zQUpiQ01TQ0U4Rk9hQlFN?=
 =?utf-8?B?Z3lnTUJ1NDZiVzhidXRkdzN6aWFJZUlTWEgvOThScnBoNTUwVGNaaUE1VlFE?=
 =?utf-8?B?OWExWlZIZHhLMERMRXFkckJ1VTAwQzJwdFRPR0dFRkFGK0pYRmh2anZzbHgy?=
 =?utf-8?B?UXUxSVJCVnBnQmJZV2MxUVJSRHVlaFZySUtDT3hpQldhTytVN0tlNUR5TCtS?=
 =?utf-8?B?VkYyYXYvd1I5dkVydFNnSGxjdE9yT2l5WXMwb0FDN0dBajZDbFNhd2o2c1lG?=
 =?utf-8?B?NkNaNFFRUnBDNDNWQVF1S3k3QVU1azRsM0hSbnpqdWpaT2toUHdiS3ltWVZ4?=
 =?utf-8?B?aytxU1NweDhIWHZLREtPNjRrMUJoU1NlSDNtMWJoL1hxeU53UUpHT0hMamRs?=
 =?utf-8?B?Wm00dUxpaHBxaDZuWnNlU2xjaDd6c0lrSlFUR0pMbEJ1OGp3L0paUWM2YmJB?=
 =?utf-8?B?K3dLeE5mNmdZbENHRlFtSEVDdHZ3SkZHeWlpeXJBenE5bjZXNi9jRS93Nlhu?=
 =?utf-8?B?VW54aEJoN05YejFrZk5jZXNNL1FpdW9ITUlnTXpNSUpoNE5YblZTTWVwL0lE?=
 =?utf-8?B?RFVuYzlNaEhuWWk3YWQ0a0x3V2JMTjQxK0xQVXg5NTV2ekw3T1NMd0RaQllX?=
 =?utf-8?B?ekRZQWsyTTRWNXFneWNFd1lCd0RJSEo3TEVpc0JQSHVQenMyZ3BvWWFVWmNF?=
 =?utf-8?B?OUNEcWhXZzhPWkp6Uk9vUlZ0b2ZURGxqUUVwZjY3TGtyVTArTTJjRUVGSVVy?=
 =?utf-8?Q?cdfCKARat5lBx5Os1H2gYbVRM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48158434-d065-489c-1ebd-08dd0a53dac0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:42:22.7253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gjyp7ZC+L89RP87Evr6xjMNcI8OdQK5jkTXCDbA07/vrYxjZ70IrmbckgVBzxNViEG6Rp0WO3wFrQaLJYfKF2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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



On 2024-11-20 6:32 p.m., Zhanjun Dong wrote:
> Submit cmds to the GPU that result in a GuC engine reset and check that
> devcoredump register dump is generated, by the GuC, and includes the
> full register range.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Changes from prior revs:
>   v5:-  Detect devcoredump matches the testing engine
>         Engine will run with random cid
>   v4:-  Support runs on multiple GPU
>         Load all devcoredump content to buffer
>         Alloc line buffer dynamic vs static global memory
>         Changed to igt_assert_f to provide more info if failed
>   v3:-  Remove call to bash and awk
>         Add regular express parse
>         Detect devcoredump through card index
>         Add devcoredump removal check
>   v2:-  Fix CI.build error
>         Add multiple GPU card support
> ---
>   tests/intel/xe_exec_capture.c | 462 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   1 +
>   2 files changed, 463 insertions(+)
>   create mode 100644 tests/intel/xe_exec_capture.c
> 
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> new file mode 100644
> index 000000000..33b92bb71
...
> +
> +static void
> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
> +		 unsigned int flags, u64 addr)
> +{
> +	u32 vm;
> +	struct drm_xe_sync sync[2] = {
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	u32 exec_queues[MAX_N_EXECQUEUES];
> +	u32 syncobjs[MAX_N_EXECQUEUES];
> +	size_t bo_size;
> +	u32 bo = 0;
> +	struct {
> +		struct xe_spin spin;
> +		u32 batch[BATCH_DW_COUNT];
> +		u64 pad;
> +		u32 data;
> +	} *data;
> +	struct xe_spin_opts spin_opts = { .preempt = false };
> +	int i, b;
> +
> +	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> +
> +	vm = xe_vm_create(fd, 0, 0);
> +	bo_size = sizeof(*data) * n_execs;
> +	bo_size = xe_bb_size(fd, bo_size);
> +
> +	bo = xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	data = xe_bo_map(fd, bo, bo_size);
> +
> +	for (i = 0; i < n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		syncobjs[i] = syncobj_create(fd, 0);
> +	};
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +
> +	for (i = 0; i < n_execs; i++) {
> +		u64 base_addr = addr;
> +		u64 batch_offset = (char *)&data[i].batch - (char *)data;
> +		u64 batch_addr = base_addr + batch_offset;
> +		u64 spin_offset = (char *)&data[i].spin - (char *)data;
> +		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> +		u64 sdi_addr = base_addr + sdi_offset;
> +		u64 exec_addr;
> +		int e = i % n_exec_queues;
> +
> +		if (!i) {
> +			spin_opts.addr = base_addr + spin_offset;
> +			xe_spin_init(&data[i].spin, &spin_opts);
> +			exec_addr = spin_opts.addr;
> +		} else {
> +			b = 0;
> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +			data[i].batch[b++] = sdi_addr;
> +			data[i].batch[b++] = sdi_addr >> 32;
> +			data[i].batch[b++] = 0xc0ffee;
> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +			exec_addr = batch_addr;
> +		}
> +
> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].handle = syncobjs[e];
> +
> +		exec.exec_queue_id = exec_queues[e];
> +		exec.address = exec_addr;
> +		if (e != i)
> +			syncobj_reset(fd, &syncobjs[e], 1);
> +		xe_exec(fd, &exec);
> +	}
> +
> +	for (i = 0; i < n_exec_queues && n_execs; i++)
> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> +					NULL));
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	for (i = 0; i < n_exec_queues; i++) {
> +		syncobj_destroy(fd, syncobjs[i]);
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +	}
> +
> +	munmap(data, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
Alan raised concerns about this function:
1. Put it into igt lib as this function appears in xe_exec_reset and 
xe_exec_thread.
2. This test runs with fixed value for parameter: n_exec_queues, n_execs 
and flags, may be the code could be optimized.

For #1, the function body in other 2 files is different, for this test, 
I also add addr as parameter, which is another different as well, so 
further review might be needed in the future when put into igt lib. That 
could be the next step.
For #2, if it is possible to move to igt lib, is it worth to do the 
optimization? Shall we get the test landing 1st?
As 2 concerns not addressed and looks not so clear, I will leave it as 
is for now.

Regards,
Zhanjun Dong
...
