Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE027CD5BCF
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 06:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9E610E493;
	Tue, 26 May 2026 06:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp2k272X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356B310E493
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 06:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779775884; x=1811311884;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O3IB51lcuZlwsM2ERmQ5siig+aQWcFnrnbVZbhCSQqQ=;
 b=Sp2k272XtC1pmNJLZ9ch66fuHpqOLH3mN7hlcgW/5QE231OohPVyLt59
 nwWiz9uiPEeFamBzZT4jKrdFBx9Q87DU8MRaI+2SgK4UCpk+n8rpFVst/
 T0Vpk7pXj/qA804I4POjT6wnUDYcyB43PjRZ8R9VQb4HUqAXSJtfjb9LG
 DUjkMJELyzqx3LNE8fPVrgHbcW0Rz413rXID+6B6FlTQ2Isb8U0M/ESXJ
 VJqlP7oAsx8yvph+HDd3koR1QZNHlWsWS8uB3apsh+tZhaMYv0wEzTo0p
 Ys67mrnQhYm+oBRI7N7qAgCxLfQpAvgz5sTMdmna2cvF0/QuVEsPaTPqz w==;
X-CSE-ConnectionGUID: +wJ+MU+DQFWMRGcFj/ekuw==
X-CSE-MsgGUID: 68uBFIk7R721ipByYfw+sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106041189"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="106041189"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:11:23 -0700
X-CSE-ConnectionGUID: EkHXVUS1RAuXqmHpV2RamA==
X-CSE-MsgGUID: FFNN6n2aQrmWcIHaq8r31A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235464064"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:11:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 23:11:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 23:11:23 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 23:11:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx/mBJ7ztDAIWc/M88++U6b2dJ/K46+vUH0F94nJzSOgljiJWUDH1oYI0Wq5zLkRVj6eLvgDRZMxeFCxgQVGRsg3MPd+5SwX4TNPUIf8xcG2kUnn2Gfgb/3WjCDk2irPZl59SRoyJhbUeLo+btWLx4zyidosNRGnSLx7mqzNG/egEp9yZNy8pZZWcNQ8KvtJsa+TwWrOODwYJHwN2oMI8P3+o/eV3oXTDJrZ67bqYqYz6BPSDdO1eNkko6JUlJFb3KA341hV5BaFU7uJEqICvY7ozU84x9/M/UJXwW47+ZMDdE463YqtgKytvijBV4zCCdkvm3ymkC/Vkqv5InoO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZvlRJZ5ojPbjsE69x2HjEh4OvL6mL0jIAp3KALw6C8=;
 b=G3/kovyXGtvc6pp4RteFnOj7xPyJ2Sj9okMOhCNjwxwytKNvSRz/nbfhjQcJi8COqqGo+u8SCJDahpeaCL85gUHwyb81+56ngVsCY9GWJR6FZ4oQZPMEZiSRtltZIFrWq5/5IXyDtitZI+zla8ZCrI9WiqvnZ+91o0GNtK4kftEcM6yiUtc/I/aASC8x4eDyBkEJ+UgeNe1SSKe1dBOYPM6hyfSQcmJriTibLQaVM7E6N4jHRkg6PNCMlpnF2OQhNblN9WslNBcToq4q3bHjXHyxFC/pzhTKJARC7C90GIpyq2tcKAhlU/fm+bnWfceo+/YLvTJo6sZcTaYFMZbwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by LV3PR11MB8693.namprd11.prod.outlook.com
 (2603:10b6:408:215::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 06:11:20 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 06:11:20 +0000
Message-ID: <851fd86d-285a-4f15-a865-f5ce51e4c22d@intel.com>
Date: Tue, 26 May 2026 08:11:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] lib: s/GEN_VER/GFX_VER/ for Intel platform
To: <nakshtra.goyal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>, <zbigniew.kempczynski@intel.com>
References: <20260526055551.207137-1-nakshtra.goyal@intel.com>
 <20260526055551.207137-2-nakshtra.goyal@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260526055551.207137-2-nakshtra.goyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0102.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::43) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|LV3PR11MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 112904d8-827e-43cc-3c94-08debaed9aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|29003799003|25016099003|56012099003|3023799007|11063799006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Fhkn6cDSQnMElsaT+aDyF4EFBE3BN1zSEBTRz396l+qeCotgQDx56vyLftkBbgaBYa6bZOPMw8qPIQ0FCKQYdq+k3jU+LFOCODQAR1nT0XoXjQVImKNEPMfwfZ6AODPef9gnAVevMt2JbBsEEaJrkbTruQJH7kn9SlC/CxS996WqXLNd6wj9XMRv0dGM4hGbuZg0y1/xYPeRNSJqZQUtKLS5cjh6eQzjfC0D7xPRvJIzzPBygYyAGHjZhrg7FAamGzBGaJekIlU+IF4cbMPcCdTcU1KGTNPBShQ/P3e1UJBqY26P3Dr+adTYwFrn+9Hdsw1gl1n7ZbmOCP5Bgoy7iiRo+juSA7DeWVsF1BpdW9XurfHvA/f2t4lQ7V7XC4KAUwfNYCon4lDHRC9vN5Q9F3wuOTTuoQuwUSeIxbZAvZtUiub56O1gmvGrRlWxmeFjBUvtlugN5DOvQPPqrTJsYZO0vA6LtWfHXANHWqWpGtEi9HdubZdtYAYEPqGJvRsjHG529cB57RnhXC8o+pSuRn2LTXjDwUmtC4ubZQ5o3QBK2hwtL2/PYeZU+phdZHsY4Mwge/v9HjBnlxXe3F9EwHi294AXEt7nh8qngG75LbbYm5pH8giWRFT4R4Eh8uu2eNUjugp4Gw5SKKxsIsf1NzP4cCBAkL1NHt+belO163NL5IKEre2noe2No0YHtRiC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(29003799003)(25016099003)(56012099003)(3023799007)(11063799006)(4143699003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXFESS9kR0w5NmRUUmp3d0tHNEpKbzV1OTVIMEJweklkREJqRW41dVd6Y01t?=
 =?utf-8?B?WThObE8ydUdLYThiN2gxbE96dVAyYk9RTm8yaWVOdCsyOHJjQU9HRjFzYlhL?=
 =?utf-8?B?VHJkVnhxa2E2cCtON2NoK2wyR2F1YzVkRGNEZHkzY0lHRVBpdG00Z0lESnhi?=
 =?utf-8?B?bVpZNDh5MFF5TzlFNTBBMFkzQkFIb1o0V1hNV0M1Q1lRVnFMdmhCT3FiOEpQ?=
 =?utf-8?B?aldzdnhrSUkzSjRsQUp2cll1RmlwV0I4eEQzcnZmZlg1cC9VMVlwczJhR3Fk?=
 =?utf-8?B?TWs3c2orOElhSmtFMVhYcm5Tb2FMWjR5ZDkyeUQ3VWpRbUJzUllLaWJtNjhS?=
 =?utf-8?B?VmxNUkk2RkN1R09IQ2pnclByYzlsUDBYamh3ZDBJNnZ5Rk0waUpyRUpwS1Fa?=
 =?utf-8?B?cHE0RHB6ZGdlQTZWUkFTQmNzcmt3RW1PTnhVL2RieFYvakloWEg2YU9vMFRG?=
 =?utf-8?B?Z2h0cWNWU25uUHVaa29EQTZOWkp4SC9pSXI2T0dDNkFRU0FlcStUbjlWR24w?=
 =?utf-8?B?eWF0U0oyOHZURjg3SlBvcXN2S25KRHFrQmY0UVdLNWdNVCtXcGs3ZURrQTZF?=
 =?utf-8?B?VVpyL3N0dDlFM00vaVgyS3BaMTR0Q2ZlWUYvZHpVdWM1clBTYXhmU05iOSs1?=
 =?utf-8?B?WW1uaXQ3NlFybHg5RDArQWZ6c2JOMUxCSFdpMDhzRnU3UGQ3TEN4RXZ3c1ZH?=
 =?utf-8?B?Qzk4bVlDRUdrUVVmN09UT0lrRXAxd1pFT2p0Z0JVTk0xeVl1cCs1dndYaDAr?=
 =?utf-8?B?WGF5UGhwN1licVBGK2JMdFRYQjNVbENFTFpmd3RFY0pQZm5TdWZ0MnpaRThz?=
 =?utf-8?B?aDlzeEF2ZnJoUjlxWWc5Qi9LY3o0dm03aTFsSVlnZ2NtNmZ5c3ZvRFVpckUw?=
 =?utf-8?B?VElJc3VyV2lqczdoYnNzVTF5V0NlQ1NnRWxRa0lTNmg1eVdSZmZ2dy9xR3lZ?=
 =?utf-8?B?OWU2WGwzaHlSZXpvcFd2SEFwaS8zMk5lR1k5cSsrdlprR3ZTbkpNVi93Q3Z6?=
 =?utf-8?B?NWpoUGRJSUpINHMwOHc1aE5LKzlJWFp6Mi9XVXJKdDB2RVU2cVhycFVJa2Y1?=
 =?utf-8?B?QUJJVHFyWDMxdmpWUnhiWk1XM0pRbmtyUnhQSFZtVitaVUhaYllTcHp2Q1ZU?=
 =?utf-8?B?akFXUWRma0NLT3hyQWFVblBnbHpxUnNsaWxoNkdzM0FDYjRHU2w3cWU1R0c2?=
 =?utf-8?B?VWdjY2xJYkN2K2lGbDYzcmhWMlg3VElreVI0SHo1M3kvRzJ1dW9iUDh2Tmdn?=
 =?utf-8?B?bFYrMzR1cFI0RWNobVJuRTQ1Q2FvYkdiaytpL3BkYlVrWWoxSnJyNnY4b25v?=
 =?utf-8?B?eW1mL29JTjhkR2llemlOcFBsTU9hZ21yajY0SHR1TUhybXBtVVVHV0dOTlNI?=
 =?utf-8?B?cVY4OTQvMzBYTzczNzFNU1FmMVd1OGlPeThLbGNBWGtpM1ppTGVPbzQrYXJq?=
 =?utf-8?B?NjNoVTBMYi9BVkZ0Y0RVeVFGdi8zTVZkaFBMZEdYaHV3aHc4ZTZxS3FXMkZa?=
 =?utf-8?B?YjUweXkxcGs2aHRlN1hJTmY3MnByK21CZ0xGRmJMS3BCWTRzRVVIcjVnTzEy?=
 =?utf-8?B?OUpHbnJXbnpLMEd0U3M4UVI4cWgyQ0FHdDhBbjl5WHJyMEdFVWtLRXNyd284?=
 =?utf-8?B?aDhVaXVWbFphK2xpekp1WWg5Tk43K2p5U3F3Tm1KUStqR3B6MXUwcXc0RnZ4?=
 =?utf-8?B?a3ZocUEzaEtIaE9LZGhZTmJWa1ZxR1N0QnhnNmJtaUtXZTV2eTZZNis5VTBz?=
 =?utf-8?B?QklGR1AvbUZvQ3dQdXdqYnJZY2dEMGQ1aDNvQjVIaTUxYXNydGwrSnRZeUE3?=
 =?utf-8?B?N0VDbW5qdHJyOEdGNGdid2hZUHpFUjBEOGZ2THhiNmRTV0l5S0hWQ0hjM3pP?=
 =?utf-8?B?ZFdrM2NTVlp5UnZkL2FpcGZkcXNqUHlsUXlrZ3NSQ3pJVU9WcTRKVEl1RTJ3?=
 =?utf-8?B?THF5RGFEZzEzZEl3bmNCUUo5VnU0ajR0cnFXL1ozQ0l1bUNmSFdWc3RSelpN?=
 =?utf-8?B?T0x4K01KOWxIWmFEdm9nUk41U1ZuaXdyWWlUUGdKd0VhQVA0OSs5QnNMZWRj?=
 =?utf-8?B?VG9QQUZXaDU3bDlBWEpjWlBJYUd1NnB1a0wxZ28yeUtPOHhCc3Z4TVF6NkZ1?=
 =?utf-8?B?RHlOcUdUeXRUdnBVVWs1SkZRUk5vbGxheldQZ1pya3dNYkpGNlFVVFY0VjRE?=
 =?utf-8?B?c2toaFRIMXNHU2lTZXBzWjF6TjZYSWZDdE44bUlwZUFQdFIzMFZ2YUtnZXRH?=
 =?utf-8?B?dFkralpidXRLcCtjNlBnRVMvQVYwaUpVOGJPRDJVNFhaeTFLTDBqSTY0S0pH?=
 =?utf-8?B?Ty9jOXkxTHBCSEtVZ25wek13VUJwb0cxWno5SDdtcWlKMWFiNjJOQT09?=
X-Exchange-RoutingPolicyChecked: Lw8vD+XnTfbo/PK6hbvLTUczSdz1lbW0P33jdjCdY5RSs0mqA+sH/hSb30IBbOO/EDpIDN6fQFLcOImqTT83zFbpXATiFjdoSUhejKYEBtqPIasic5afNUh8+813JOsZlZ/xC6pOg48fHCZ/IByRHNXwQfP5FW90Fq4PlGgg/B6/IF9VyHdkp3rH3L06Etb/vfN5d3rtI1xTpjyFBxpI1k0AdUoGQOizmC8Ps4ks1G3zykUTQBXP/WyMJZ59SfhAP02h3S3zojow4QjAdRdtNQTZLY2v8RuJiwhkMyuSxbBa37Zky7H+v27ymu6a5J4rt8xVOmau8APIyPILxfpHhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 112904d8-827e-43cc-3c94-08debaed9aa4
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 06:11:20.0412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPt6sNlYvOMOmuiMDyuLvKUDIq5eA7uCtbSQnchhCjaV2xuEgkdXQOmZCCICksaKKN1AnKvx8tYcHw+WORhBDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8693
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

W dniu 26.05.2026 o 07:55, nakshtra.goyal@intel.com pisze:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> This patch series replaces all occurrences of GEN_VER/gen_ver
> with GFX_VER/gfx_ver across the IGA64 shader infrastructure
> and igt code base to align with IGT naming convention.
> 
> v2: Changing subject as per requirement and correcting
>      commit message (Kamil)
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>


Looking at the changes it seems you have not re-compiled shaders - sums 
have not changed.
Please do it, for atomicity, and more importantly for checking
if the changes are correct.
If you have your build dir in subdir of igt preferably use:
ninja -C build -t clean lib/libiga64_asms.a
FORCE_IGA64_REBUILD=1 ninja -C build
It should rebuild all asms.

Regards
Andrzej

> ---
>   lib/gpgpu_fill.c                              |   4 +-
>   lib/gpgpu_fill.c.gen.iga64_codes.c            |  14 +-
>   lib/gpgpu_shader.c                            |  30 +--
>   lib/gpgpu_shader.c.gen.iga64_codes.c          | 184 +++++++++---------
>   lib/gpgpu_shader.h                            |   4 +-
>   lib/iga64_macros.h                            |  10 +-
>   scripts/generate_iga64_codes                  |  16 +-
>   tests/intel/xe_eudebug_online.c               |   6 +-
>   .../xe_eudebug_online.c.gen.iga64_codes.c     |  14 +-
>   tests/intel/xe_prefetch_fault.c               |   2 +-
>   .../xe_prefetch_fault.c.gen.iga64_codes.c     |   4 +-
>   11 files changed, 144 insertions(+), 144 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index ed13f6eb5..2c47169d2 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -297,7 +297,7 @@ mov (1|M0)		r2.1<1>:ud	r0.6<0;1,0>:ud
>   mov (8|M0)		r4.0<1>:ud	0x0:ud
>   // fill up message payload with target colour
>   mov (16|M0)		r5.0<1>:ud	r1.0<0;1,0>:ud
> -#if GEN_VER < 2000
> +#if GFX_VER < 2000
>   // load block offsets into message header payload
>   mov (2|M0)		r4.0<1>:ud	r2.0<2;2,1>:ud
>   // load block width
> @@ -356,7 +356,7 @@ static struct gpgpu_shader *__xe3p_gpgpu_kernel(int xe)
>   #define XCURRENT	r3.4
>   #define TMP		r3.7
>   #define ADDR_LO		r4.0
> -#if GEN_VER >= 3500
> +#if GFX_VER >= 3500
>   (W)	add (1)		XEND<1>:ud	XPOS:ud		WIDTH:ud
>   (W)	mov (1)		OFFSET<1>:ud	0x0:ud
>   
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 7745a0ffe..3b780f9ea 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -6,7 +6,7 @@
>   #define MD5_SUM_IGA64_ASMS 3110292a24d751e5ae12a5bf30c8bf8b
>   
>   struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
> -	{ .gen_ver = 3500, .size = 144, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 144, .code = (const uint32_t []) {
>   		0x80000040, 0x03350220, 0x02000154, 0x00100134,
>   		0x80000061, 0x03054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x03158220, 0x02000014, 0x00000004,
> @@ -44,13 +44,13 @@ struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
>   
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 44, .code = (const uint32_t []) {
>   		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>   		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>   		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> @@ -63,7 +63,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 52, .code = (const uint32_t []) {
>   		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>   		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>   		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> @@ -78,7 +78,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 48, .code = (const uint32_t []) {
>   		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>   		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>   		0x00000061, 0x02150220, 0x00000064, 0x00000000,
> @@ -92,7 +92,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 52, .code = (const uint32_t []) {
>   		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>   		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>   		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> @@ -107,7 +107,7 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 48, .code = (const uint32_t []) {
>   		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>   		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>   		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 72b05959e..ea13fd3c7 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -22,7 +22,7 @@ struct label_entry {
>   #define IGA64_ARG0 0xc0ded000
>   #define IGA64_ARG_MASK 0xffffff00
>   
> -#define SUPPORTED_GEN_VER 1200 /* Support TGL and up */
> +#define SUPPORTED_GFX_VER 1200 /* Support TGL and up */
>   
>   #define PAGE_SIZE 4096
>   #define BATCH_STATE_SPLIT 2048
> @@ -46,10 +46,10 @@ __emit_iga64_code(struct gpgpu_shader *shdr, struct iga64_template const *tpls,
>   {
>   	uint32_t *ptr;
>   
> -	igt_require_f(shdr->gen_ver >= SUPPORTED_GEN_VER,
> +	igt_require_f(shdr->gfx_ver >= SUPPORTED_GFX_VER,
>   		      "No available shader templates for platforms older than XeLP\n");
>   
> -	while (shdr->gen_ver < tpls->gen_ver)
> +	while (shdr->gfx_ver < tpls->gfx_ver)
>   		tpls++;
>   
>   	while (shdr->max_size < shdr->size + tpls->size)
> @@ -196,7 +196,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   		emit_sip(ibb, sip_offset);
>   
>   	/* Inline data is at 31th/32th dword of COMPUTE_WALKER, BSpec: 67028 */
> -	inline_data = intel_bb_ptr(ibb) + 4 * (shdr->gen_ver < 2000 ? 31 : 32);
> +	inline_data = intel_bb_ptr(ibb) + 4 * (shdr->gfx_ver < 2000 ? 31 : 32);
>   	xehp_emit_compute_walk(ibb, 0, 0, x_dim * 16, y_dim, &idd, 0x0);
>   	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target, x_dim);
>   
> @@ -297,17 +297,17 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>   		       struct gpgpu_shader *sip,
>   		       uint64_t ring, bool explicit_engine)
>   {
> -	igt_require(shdr->gen_ver >= SUPPORTED_GEN_VER);
> +	igt_require(shdr->gfx_ver >= SUPPORTED_GFX_VER);
>   	igt_assert(ibb->size >= PAGE_SIZE);
>   	igt_assert(ibb->ptr == ibb->batch);
>   
>   	if (target->addr.offset == INTEL_BUF_INVALID_ADDRESS)
>   		gpgpu_alloc_gpu_addr(ibb, target);
>   
> -	if (shdr->gen_ver >= 3500)
> +	if (shdr->gfx_ver >= 3500)
>   		__xe3p_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
>   				      ring, explicit_engine);
> -	else if (shdr->gen_ver >= 1250)
> +	else if (shdr->gfx_ver >= 1250)
>   		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
>   				      ring, explicit_engine);
>   	else
> @@ -330,7 +330,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>   
>   	igt_assert(shdr);
>   	info = intel_get_device_info(intel_get_drm_devid(fd));
> -	shdr->gen_ver = 100 * info->graphics_ver + info->graphics_rel;
> +	shdr->gfx_ver = 100 * info->graphics_ver + info->graphics_rel;
>   	shdr->max_size = 16 * 4;
>   	shdr->code = malloc(4 * shdr->max_size);
>   	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> @@ -385,7 +385,7 @@ void gpgpu_shader_dump(struct gpgpu_shader *shdr)
>    */
>   void gpgpu_shader_set_vrt(struct gpgpu_shader *shdr, enum gpgpu_shader_vrt_modes vrt)
>   {
> -	igt_assert(vrt == VRT_DISABLED || shdr->gen_ver >= 3000);
> +	igt_assert(vrt == VRT_DISABLED || shdr->gfx_ver >= 3000);
>   	shdr->vrt = vrt;
>   }
>   
> @@ -500,11 +500,11 @@ uint32_t gpgpu_shader__get_max_threads_in_tg(struct gpgpu_shader *shdr)
>   	enum gpgpu_shader_vrt_modes register_size = shdr->vrt;
>   
>   	/* Not implemented for Xe platforms  */
> -	if (shdr->gen_ver < 2000)
> +	if (shdr->gfx_ver < 2000)
>   		return 1;
>   
>   	/* Xe2 platforms */
> -	if (shdr->gen_ver < 3000) {
> +	if (shdr->gfx_ver < 3000) {
>   		return compute_max_threads_in_tg_xe2(shdr->large_grf_mode,
>   						     shdr->simd_size,
>   						     shdr->hw_local_id_generation);
> @@ -586,10 +586,10 @@ void gpgpu_shader__eot(struct gpgpu_shader *shdr)
>   	else
>   		emit_iga64_code(shdr, eot, R"(
>   (W)	mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud
> -#if GEN_VER < 1250
> +#if GFX_VER < 1250
>   (W)	send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1}
>   
> -#elif GEN_VER <= 3000
> +#elif GFX_VER <= 3000
>   (W)	send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}
>   
>   #else
> @@ -948,7 +948,7 @@ void gpgpu_shader__write_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
>   	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
>   
>   	emit_iga64_code(shdr, write_a64_d32, R"(
> -#if GEN_VER >= 2000
> +#if GFX_VER >= 2000
>   // Unyped 2D Block Store
>   // Instruction_Store2DBlock
>   // bspec: 63981
> @@ -1037,7 +1037,7 @@ void gpgpu_shader__read_a64_d32(struct gpgpu_shader *shdr, uint64_t ppgtt_addr)
>   	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
>   
>   	emit_iga64_code(shdr, read_a64_d32, R"(
> -#if GEN_VER >= 2000
> +#if GFX_VER >= 2000
>   // Unyped 2D Block Array Load
>   // Instruction_Load2DBlockArray
>   // bspec: 63972
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index 0b116fc41..92d38dd16 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -6,7 +6,7 @@
>   #define MD5_SUM_IGA64_ASMS 16bafa89cc2fb5f6617e3dac61120f47
>   
>   struct iga64_template const iga64_code_read_a64_d32[] = {
> -	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {
>   		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> @@ -18,13 +18,13 @@ struct iga64_template const iga64_code_read_a64_d32[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
>   
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_write_a64_d32[] = {
> -	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 48, .code = (const uint32_t []) {
>   		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> @@ -38,13 +38,13 @@ struct iga64_template const iga64_code_write_a64_d32[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
>   
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
> -	{ .gen_ver = 3500, .size = 60, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 60, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
> @@ -61,7 +61,7 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 60, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 60, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000961, 0x1e050330, 0x00000104, 0x00000000,
> @@ -78,7 +78,7 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 48, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -92,7 +92,7 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 52, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -107,7 +107,7 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 48, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x800c0961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -121,7 +121,7 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 52, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80030961, 0x1e054220, 0x00000000, 0x00000000,
> @@ -136,7 +136,7 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 48, .code = (const uint32_t []) {
>   		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80030161, 0x1e054220, 0x00000000, 0x00000000,
> @@ -153,27 +153,27 @@ struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   };
>   
>   struct iga64_template const iga64_code_end_system_routine[] = {
> -	{ .gen_ver = 2000, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 12, .code = (const uint32_t []) {
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 12, .code = (const uint32_t []) {
>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 12, .code = (const uint32_t []) {
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 12, .code = (const uint32_t []) {
>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000965, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 12, .code = (const uint32_t []) {
>   		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000165, 0x80018220, 0x02008000, 0x7ffffffd,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> @@ -181,18 +181,18 @@ struct iga64_template const iga64_code_end_system_routine[] = {
>   };
>   
>   struct iga64_template const iga64_code_breakpoint_suppress[] = {
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000166, 0x80018220, 0x02008000, 0x00008000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_write_on_exception[] = {
> -	{ .gen_ver = 3500, .size = 64, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 64, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -210,7 +210,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 64, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 64, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -228,7 +228,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 52, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -243,7 +243,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 60, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 60, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -260,7 +260,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 56, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 56, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000014, 0x00000002,
> @@ -276,7 +276,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 60, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 60, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -293,7 +293,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 56, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 56, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded002,
>   		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -312,53 +312,53 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>   };
>   
>   struct iga64_template const iga64_code_set_exception[] = {
> -	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 8, .code = (const uint32_t []) {
>   		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 8, .code = (const uint32_t []) {
>   		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 8, .code = (const uint32_t []) {
>   		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000166, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_clear_exception[] = {
> -	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 8, .code = (const uint32_t []) {
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 8, .code = (const uint32_t []) {
>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 8, .code = (const uint32_t []) {
>   		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_media_block_write[] = {
> -	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 52, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -373,7 +373,7 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 52, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -388,7 +388,7 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -400,7 +400,7 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 48, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -414,7 +414,7 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 44, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x800c0061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000014, 0x00000002,
> @@ -427,7 +427,7 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 48, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -441,7 +441,7 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 44, .code = (const uint32_t []) {
>   		0x80000061, 0x05054220, 0x00000000, 0xc0ded001,
>   		0x80030061, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -457,30 +457,30 @@ struct iga64_template const iga64_code_media_block_write[] = {
>   };
>   
>   struct iga64_template const iga64_code_write_aip[] = {
> -	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 8, .code = (const uint32_t []) {
>   		0x80000940, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 8, .code = (const uint32_t []) {
>   		0x80000940, 0x80418220, 0x02008040, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 8, .code = (const uint32_t []) {
>   		0x80000940, 0x80218220, 0x02008020, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000940, 0x80418220, 0x02008040, 0xc0ded000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000140, 0x80418220, 0x02008040, 0xc0ded000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_media_block_write_aip[] = {
> -	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 52, .code = (const uint32_t []) {
>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>   		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -495,7 +495,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 52, .code = (const uint32_t []) {
>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>   		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -510,7 +510,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {
>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>   		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -522,7 +522,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 48, .code = (const uint32_t []) {
>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>   		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -536,7 +536,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 44, .code = (const uint32_t []) {
>   		0x80000961, 0x05050220, 0x00008020, 0x00000000,
>   		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000014, 0x00000002,
> @@ -549,7 +549,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 48, .code = (const uint32_t []) {
>   		0x80000961, 0x05050220, 0x00008040, 0x00000000,
>   		0x80030961, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -563,7 +563,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 44, .code = (const uint32_t []) {
>   		0x80000161, 0x05050220, 0x00008040, 0x00000000,
>   		0x80030161, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04058220, 0x02000024, 0x00000002,
> @@ -579,7 +579,7 @@ struct iga64_template const iga64_code_media_block_write_aip[] = {
>   };
>   
>   struct iga64_template const iga64_code_common_target_write[] = {
> -	{ .gen_ver = 3500, .size = 64, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 64, .code = (const uint32_t []) {
>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -597,7 +597,7 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 64, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 64, .code = (const uint32_t []) {
>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -615,7 +615,7 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 52, .code = (const uint32_t []) {
>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -630,7 +630,7 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 56, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 56, .code = (const uint32_t []) {
>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> @@ -646,7 +646,7 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 52, .code = (const uint32_t []) {
>   		0x80100061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f154220, 0x00000000, 0xc0ded002,
> @@ -661,7 +661,7 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 56, .code = (const uint32_t []) {
>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> @@ -677,7 +677,7 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 52, .code = (const uint32_t []) {
>   		0x80040061, 0x1f054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1f054220, 0x00000000, 0xc0ded001,
>   		0x80000061, 0x1f254220, 0x00000000, 0xc0ded002,
> @@ -695,35 +695,35 @@ struct iga64_template const iga64_code_common_target_write[] = {
>   };
>   
>   struct iga64_template const iga64_code_inc_r40_jump_neq[] = {
> -	{ .gen_ver = 2000, .size = 20, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 20, .code = (const uint32_t []) {
>   		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>   		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>   		0x84000020, 0x00004000, 0x00000000, 0xffffffd0,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 20, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 20, .code = (const uint32_t []) {
>   		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>   		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>   		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 20, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 20, .code = (const uint32_t []) {
>   		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>   		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>   		0x84000020, 0x00004000, 0x00000000, 0xffffffd0,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 20, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 20, .code = (const uint32_t []) {
>   		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>   		0x80001a70, 0x00018220, 0x22002804, 0xc0ded000,
>   		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 20, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 20, .code = (const uint32_t []) {
>   		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>   		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>   		0x80000270, 0x00018220, 0x22002804, 0xc0ded000,
> @@ -733,18 +733,18 @@ struct iga64_template const iga64_code_inc_r40_jump_neq[] = {
>   };
>   
>   struct iga64_template const iga64_code_clear_r40[] = {
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000061, 0x28054220, 0x00000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000061, 0x28054220, 0x00000000, 0x00000000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_jump_dw_neq[] = {
> -	{ .gen_ver = 3500, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 48, .code = (const uint32_t []) {
>   		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
>   		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> @@ -758,7 +758,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 48, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 48, .code = (const uint32_t []) {
>   		0x80000061, 0x1e050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x1e258220, 0x06000124, 0xffffffff,
>   		0x80000040, 0x1e358220, 0x06000134, 0xffffffff,
> @@ -772,7 +772,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   		0x84000020, 0x00004000, 0x00000000, 0xffffff60,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 36, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 36, .code = (const uint32_t []) {
>   		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e554220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e654220, 0x00000000, 0xc0ded000,
> @@ -783,7 +783,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 40, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 40, .code = (const uint32_t []) {
>   		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> @@ -795,7 +795,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 36, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 36, .code = (const uint32_t []) {
>   		0x800c0061, 0x1e054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e154220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x1e254220, 0x00000000, 0x00000003,
> @@ -806,7 +806,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   		0x84000020, 0x00004000, 0x00000000, 0xffffff90,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 40, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 40, .code = (const uint32_t []) {
>   		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> @@ -818,7 +818,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   		0x81000020, 0x00004000, 0x00000000, 0xffffff80,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 36, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 36, .code = (const uint32_t []) {
>   		0x80030061, 0x1e054220, 0x00000000, 0x00000000,
>   		0x80000061, 0x1e254220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x1e454220, 0x00000000, 0x00000003,
> @@ -832,87 +832,87 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>   };
>   
>   struct iga64_template const iga64_code_jump[] = {
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000020, 0x00004000, 0x00000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000020, 0x00004000, 0x00000000, 0x00000000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_eot[] = {
> -	{ .gen_ver = 3500, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 8, .code = (const uint32_t []) {
>   		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>   		0x8000c033, 0x00000001, 0x3000000c, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 8, .code = (const uint32_t []) {
>   		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>   		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 12, .code = (const uint32_t []) {
>   		0x80030061, 0x70050220, 0x00460005, 0x00000000,
>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>   		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 8, .code = (const uint32_t []) {
>   		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
>   		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 12, .code = (const uint32_t []) {
>   		0x80030061, 0x70050220, 0x00460005, 0x00000000,
>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>   		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80030061, 0x70050220, 0x00460005, 0x00000000,
>   		0x80049031, 0x00000004, 0x7020700c, 0x10000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_eot_vrt[] = {
> -	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 8, .code = (const uint32_t []) {
>   		0x800c0061, 0x50050220, 0x00460005, 0x00000000,
>   		0x800f2031, 0x00000004, 0x3000500c, 0x00000000,
>   	}},
> -	{ .gen_ver = 1270, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1270, .size = 12, .code = (const uint32_t []) {
>   		0x80030061, 0x50050220, 0x00460005, 0x00000000,
>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>   		0x80034031, 0x00000004, 0x3000500c, 0x00000000,
>   	}},
> -	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1260, .size = 8, .code = (const uint32_t []) {
>   		0x800c0061, 0x50050220, 0x00460005, 0x00000000,
>   		0x800f2031, 0x00000004, 0x3000500c, 0x00000000,
>   	}},
> -	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 12, .code = (const uint32_t []) {
>   		0x80030061, 0x50050220, 0x00460005, 0x00000000,
>   		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>   		0x80034031, 0x00000004, 0x3000500c, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80030061, 0x50050220, 0x00460005, 0x00000000,
>   		0x80039031, 0x00000004, 0x3000500c, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_nop[] = {
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x00000060, 0x00000000, 0x00000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x00000060, 0x00000000, 0x00000000, 0x00000000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_sync_host[] = {
> -	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 1250, .size = 8, .code = (const uint32_t []) {
>   		0x80000001, 0x00010000, 0xf0000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 8, .code = (const uint32_t []) {
>   		0x80000001, 0x00010000, 0xf0000000, 0x00000000,
>   		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>   	}}
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 7c10572bc..136d93b29 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -25,7 +25,7 @@ enum gpgpu_shader_vrt_modes {
>   };
>   
>   struct gpgpu_shader {
> -	uint32_t gen_ver;
> +	uint32_t gfx_ver;
>   	uint32_t size;
>   	uint32_t max_size;
>   	union {
> @@ -42,7 +42,7 @@ struct gpgpu_shader {
>   };
>   
>   struct iga64_template {
> -	uint32_t gen_ver;
> +	uint32_t gfx_ver;
>   	uint32_t size;
>   	const uint32_t *code;
>   };
> diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
> index 5b943bc27..26d41387a 100644
> --- a/lib/iga64_macros.h
> +++ b/lib/iga64_macros.h
> @@ -10,7 +10,7 @@
>   #define IGA64_MACROS_H
>   
>   /* send instruction for DG2+ requires 0 length in case src1 is null, BSpec: 47443 */
> -#if GEN_VER <= 1250
> +#if GFX_VER <= 1250
>   #define src1_null null
>   #else
>   #define src1_null null:0
> @@ -43,7 +43,7 @@
>   (W)	mov (1)		dst.2<1>:ud	(width - 1):ud		;\
>   (W)	mov (1)		dst.4<1>:ud	R0_FFTID
>   
> -#if GEN_VER < 3000
> +#if GFX_VER < 3000
>   #define SET_SURFACE_DESC(dst)			\
>   (W)	mov (8)		dst.0<1>:ud	0x0:ud
>   #else
> @@ -67,7 +67,7 @@
>   (W)	add (1)		dst.6<1>:ud	R0_TGIDY	y	;\
>   (W)	mov (1)		dst.7<1>:ud	(width - 1):ud		;\
>   
> -#if GEN_VER < 2000
> +#if GFX_VER < 2000
>   #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
>   #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
>   #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
> @@ -75,10 +75,10 @@
>   #else
>   #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
>   #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)
> -#if GEN_VER < 3000
> +#if GFX_VER < 3000
>   #define LOAD_SPACE_DW(dst, src) send.tgm (1)	dst	src	null:0	0x0	0x62100003
>   #define STORE_SPACE_DW(dst, src) send.tgm (1)	null	dst	null:0	0x0	0x64000007
> -#elif GEN_VER < 3500
> +#elif GFX_VER < 3500
>   #define LOAD_SPACE_DW(dst, src) send.ugm (1)	dst	src	null:0	0x0	0x2120003
>   #define STORE_SPACE_DW(dst, src) send.ugm (1)	null	dst	src:1	0x0	0x2020007
>   #else
> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
> index e3189d800..a5798bc59 100755
> --- a/scripts/generate_iga64_codes
> +++ b/scripts/generate_iga64_codes
> @@ -7,7 +7,7 @@
>   # to minimal GPU generation supported by platform multiplied by 100 and platform
>   # is one of platforms supported by -p switch of iga64.
>   # Must be in decreasing order, the last one must have gen100 equal 0.
> -GEN_VERSIONS="3500:3pxpc 3000:3 2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
> +GFX_VERSIONS="3500:3pxpc 3000:3 2000:2 1270:12p71 1260:12p72 1250:12p5 0:12p1"
>   
>   # Magic values to encode asm template args, must be the the same as in gpgpu_shader.c.
>   IGA64_ARG0=0xc0ded000
> @@ -63,7 +63,7 @@ mkdir -p $WD
>   
>   # check if all required platforms are supported
>   touch $WD/empty
> -for gen in $GEN_VERSIONS; do
> +for gen in $GFX_VERSIONS; do
>       gen_name="${gen#*:}"
>       iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
>           warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
> @@ -92,7 +92,7 @@ EOF
>   # Compiles assembly to binary representation sent to stdout.
>   compile_iga64() {
>       cmd="cpp -P - -o $WD/$asm_name.$gen_name.asm"
> -    cmd+=" -DGEN_VER=$gen_ver -D'ARG(n)=$IGA64_ARG0 + n' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
> +    cmd+=" -DGFX_VER=$gfx_ver -D'ARG(n)=$IGA64_ARG0 + n' -imacros $IGT_SRCDIR/lib/iga64_macros.h"
>       eval "$cmd" <<<"$asm_body" || die "cpp error for $asm_name.$gen_name\ncmd: $cmd"
>       cmd="iga64 -Xauto-deps -Wall -p=$gen_name"
>       cmd+=" $WD/$asm_name.$gen_name.asm"
> @@ -107,8 +107,8 @@ for asm in "${ASMS[@]}"; do
>       cur_code="NONE"
>       cur_ver=""
>       echo -e "\nstruct iga64_template const $asm_code[] = {" >>$OUTPUT
> -    for gen in $GEN_VERSIONS; do
> -        gen_ver="${gen%%:*}"
> +    for gen in $GFX_VERSIONS; do
> +        gfx_ver="${gen%%:*}"
>           gen_name="${gen#*:}"
>           # Verify generated code will not contain IGA64_ARGs.
>           for d in $(IGA64_ARG0=0 compile_iga64 | hexdump -v -e '1/4 "0x%08x\n"'); do
> @@ -119,12 +119,12 @@ for asm in "${ASMS[@]}"; do
>           code="$(hexdump -v -e '"\t\t" 4/4 "0x%08x, " "\n"' $WD/$asm_name.$gen_name.bin)"
>           [ "$cur_code" = "NONE" ] && cur_code="$code"
>           [ "$cur_code" != "$code" ] && {
> -            echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
> +            echo -e "\t{ .gfx_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}," >>$OUTPUT
>               cur_code="$code"
>           }
> -        cur_ver=$gen_ver
> +        cur_ver=$gfx_ver
>       done
> -    echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
> +    echo -e "\t{ .gfx_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
>   done
>   
>   cp -vp $OUTPUT $INPUT
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index f5f7594e1..6c8766a8e 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -217,7 +217,7 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
>   
>   	shader = gpgpu_shader_create(data->drm_fd);
>   
> -	if (shader->gen_ver == 3000)
> +	if (shader->gfx_ver == 3000)
>   		gpgpu_shader_set_vrt(shader, VRT_96);
>   
>   	shader->simd_size = SIMD_SIZE;
> @@ -260,7 +260,7 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
>   			gpgpu_shader__write_a64_d32(shader, BAD_OFFSET, BAD_CANARY);
>   		else if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY)
>   			emit_iga64_code(shader, pagefault_one_of_many, R"(
> -#if GEN_VER >= 2000
> +#if GFX_VER >= 2000
>   	// prepare load descriptor for page-faulting address
>   	mov (8) r30.0<1>:uq 0x0:uq
>   	mov (1) r30.0<1>:uq 0x12345678000:uq // PF address
> @@ -296,7 +296,7 @@ static struct gpgpu_shader *get_sip(struct online_debug_data *data)
>   		gpgpu_shader__write_aip(sip, 0);
>   	else
>   		emit_iga64_code(sip, store_sr0_0, R"(
> -#if GEN_VER >= 2000
> +#if GFX_VER >= 2000
>   	mov (1) r5.0<1>:ud sr0.0:ud
>   	SET_THREAD_SPACE_ADDR(r4, 0, 0:ud, 4)
>   	STORE_SPACE_DW(r4, r5)
> diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> index 333281a39..ac77928b5 100644
> --- a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
> @@ -6,7 +6,7 @@
>   #define MD5_SUM_IGA64_ASMS e184c9b1ac9287f33544ad0737b2831a
>   
>   struct iga64_template const iga64_code_store_sr0_0[] = {
> -	{ .gen_ver = 3500, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 52, .code = (const uint32_t []) {
>   		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>   		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -21,7 +21,7 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 3000, .size = 52, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3000, .size = 52, .code = (const uint32_t []) {
>   		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>   		0x80000961, 0x04050330, 0x00000104, 0x00000000,
>   		0x80000040, 0x04258220, 0x06000124, 0xffffffff,
> @@ -36,7 +36,7 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {
>   		0x00000961, 0x05050220, 0x00007000, 0x00000000,
>   		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
>   		0x80000069, 0x04558220, 0x02000014, 0x00000002,
> @@ -48,13 +48,13 @@ struct iga64_template const iga64_code_store_sr0_0[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
>   
>   	}}
>   };
>   
>   struct iga64_template const iga64_code_pagefault_one_of_many[] = {
> -	{ .gen_ver = 3500, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 44, .code = (const uint32_t []) {
>   		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>   		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
>   		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
> @@ -67,7 +67,7 @@ struct iga64_template const iga64_code_pagefault_one_of_many[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> +	{ .gfx_ver = 2000, .size = 44, .code = (const uint32_t []) {
>   		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
>   		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
>   		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
> @@ -80,7 +80,7 @@ struct iga64_template const iga64_code_pagefault_one_of_many[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
>   
>   	}}
>   };
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index 605d48946..d3b5aff47 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -51,7 +51,7 @@ static void gpgpu_shader__prefetch_fault(struct gpgpu_shader *shdr,
>   
>   	emit_iga64_code(shdr, xe_prefetch_fault_prefetch, R"(
>   #define IGA64_FLAGS ""
> -#if GEN_VER >= 3500
> +#if GFX_VER >= 3500
>   L0:
>   // Set base address with scalar register
>   (W)	mov (1)		s0.0<1>:ud		ARG(0):ud
> diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> index a95a09567..c7eabefdb 100644
> --- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> @@ -6,7 +6,7 @@
>   #define MD5_SUM_IGA64_ASMS 713349079409a65ca940d805eb29083b
>   
>   struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] = {
> -	{ .gen_ver = 3500, .size = 28, .code = (const uint32_t []) {
> +	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {
>   		0x80000061, 0x60014220, 0x00000000, 0xc0ded000,
>   		0x80000061, 0x60114220, 0x00000000, 0xc0ded001,
>   		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> @@ -15,7 +15,7 @@ struct iga64_template const iga64_code_xe_prefetch_fault_prefetch[] = {
>   		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>   		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>   	}},
> -	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +	{ .gfx_ver = 0, .size = 0, .code = (const uint32_t []) {
>   
>   	}}
>   };

