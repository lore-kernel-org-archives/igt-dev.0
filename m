Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56CDD3B7E2
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 13:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AB810E158;
	Mon,  8 Dec 2025 13:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THRUywSD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587A110E158
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765201829; x=1796737829;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sUY2Waft/MVIjnn6oNuPz12aiVgNkACwMLnCo6hLYdM=;
 b=THRUywSDFEs6Gn2zgcaxnYzEZLTyg2iD1tW40bNmRaLMxtBcChbQyPxT
 pn2ibLGjVrKhqvoXLuaDEUW638gjSmjYj2K0QnfNCWQ/yiAVXi3psMlhm
 nmWYAdWO4z4MqbhkK+tlxx05RL9roQC8xYVvl/5IHLOjYLrW02mZz8tln
 qzte/M7umnBH2bO+ALvj8/511664Hb6srdpnqcPN/Dw+rg+2xM7hd/EhG
 NfN3N7wBcfa+2P/ceccccRYz/r08e/VR9R+Ze7sZPll4nu6P/y4pHhp4j
 2/D85EeNCHmvLYCJifwc5yNm4yDRGdNORKplNIdNvfC1nrP4PMrxrV4co w==;
X-CSE-ConnectionGUID: yqEJComxQI6teEAxuhGfjA==
X-CSE-MsgGUID: kpAqPsMJSQCK/nyZMPohtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="69733732"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="69733732"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:50:29 -0800
X-CSE-ConnectionGUID: b8MqjQJ9TMmT5bLWpTvugA==
X-CSE-MsgGUID: Jj27mNWZRVG+pi3YooITIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195739426"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:50:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:50:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 05:50:26 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:50:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ge9FWrcFvWu/VySompp8J053JawO6rcO5AB2woixlS+tQDz5V1BRJbyW+q4bBkIPWgw/UafKM5QQ66BAFUCJaFY9jTAyBPFBnrWGHCcls5HIIoP+A0JunCiYcU2UndGABwSUKogVISaqedkoaF8F+plQjqc6XsZx8BjGOlt5P10/9XBP7WlvgIy7Qe3exzpKJUjrt117PgWcKI5jsZM6ZsGogLnq4pMAb5IgvWf2WTrF6L80K8DDwi2fAiCC3ET1Te/hfIJkgiwOPg0T3hh4P5ccr5PpID1zDRtK0FblBii6QpTqKbiFf04WhcTggHvFjBfbflF3gW92+mmJT7poPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QEwB+2oLcgpT33qHNNncBd+Z4DzCDsNvePY+5z1TDs=;
 b=HmyEX9UNtJsav01abKt7gHGbnLTXwKt7ChNn8RrGUompMWkTkXVfBLfiunzKyO9zwkcd+/0ubvOtSzzbXyJVagjLyVB0Mo3o4xklEi2HPxsfxxKvJJLiXB2yLxuQKkyr4jZz5w1RpK4HLWPO5mz3IjzD6T0NpTO1Lahz8KWQkF/q8V5x0nCHmPE8+vDHnim6kO9B7zh+QKaHDJzdoibOYXvUGO8VIsn82nIy9Eewsh0x4i34IBiB8TdE2i57wpyvaFJ+BeWqF60g3UbCTaDVJM0Uoz6QuF/iLesw1Ry3gQqP03/Mo3RoTFSt8fxyYL/umY2G/MT3UWlY5uvV25I56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS4PPFA08475C7D.namprd11.prod.outlook.com (2603:10b6:f:fc02::3f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:50:24 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:50:24 +0000
Message-ID: <2d74cf32-90ed-42c3-8ea6-b068b648ffad@intel.com>
Date: Mon, 8 Dec 2025 19:20:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 11/13] tests/kms_colorop_helper: Skip custom 1D
 LUT fill on Intel devices
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.hung@amd.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
 <20251205195312.1234330-12-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251205195312.1234330-12-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0259.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::18) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS4PPFA08475C7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e78b1c-942c-418d-1629-08de3660bc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WENqU1VqQXhXM3FvZTNvR3UraU9RQnZyaGN5YXpSWUEyYldmRTc5SHRqLzN2?=
 =?utf-8?B?SXhqb3lJZkZNL2h1ak5mYnhtM2QvVE1Ia3hpazB0VlMzUUVyYlNWWDdiU2JC?=
 =?utf-8?B?ckVueFV4MktNT05qZy9MUmlzbys2cUZtaUVyOURBc0FJazhQaUVnU0cwT1lo?=
 =?utf-8?B?TnZqTUp0YUo4Zk5kdWhJbC9QY09ibE5sVG5vY3BNZ01MNWRnVmxGRXArRHRC?=
 =?utf-8?B?WEc4RzZVNGVPVG0veUlGNzdIVmYvSXR4aUZPWmRqZ2F5MGdtMVJOWUVoVGZH?=
 =?utf-8?B?cUlnSWlnWkg4M0tIdytHSk5xSFlUT2NEYTdudWU1T245Z1B6aXZnMWM4RDNv?=
 =?utf-8?B?VGRFVlcxbjE3WGo0WDc5WGMvbmo0VWxYMVBwdXFhQ1hkMEhRVEZkcEp5YzdT?=
 =?utf-8?B?QjVwRmRmUlE4TnVmSXNhS0kzcTV3YmU3Sk1kSjBZS2ZlK2ZraEtCZ0loVG5B?=
 =?utf-8?B?THI4akdsYnVZaFJJL2w4eFIveHlha1hIQjcwODd2ZURxZEpjOFVOTjlzTzdy?=
 =?utf-8?B?ZnY5ZlV3RnN0dThERkJyanBRdmVZUStuTzJOYkxnemZuM1lmcWR3WGl3c0th?=
 =?utf-8?B?WkhRWk5aSlp5aGxLbkxiYlRWU3Q5NGU5MnJVS2lHNkVUZ3Q3RnNkSUdtQ0o2?=
 =?utf-8?B?N1RvU2x3bEVRWXFLTDZYYVFEMkY4Vk5uaTdXY2dEKy9Sd2pnanhmWnFUclhM?=
 =?utf-8?B?dzZpVFdub2JOMWZpNTFMdDRsL0pCU1pSaUhxWnlRQjZOdmJrb2taWEQreDQr?=
 =?utf-8?B?eXAxUWxKL2NkNm5Va2JiR2UxN2hOdHc1WjJ5SStoL2NJSlhxUXFidWJQM1JE?=
 =?utf-8?B?aFd0UTVLM0JJTU5zK3kzZ3pzUnZ6dHNYM3UrY1VGUlRJUVY5ZURhODB2cDds?=
 =?utf-8?B?dkR5LzJYMkJJWm55ODNtdy8rZGMzK2ZjQUYyWjVZVzRkYVh2S2tHSlhCdk93?=
 =?utf-8?B?M3A1ck5WTTdiUHVsK29zdG1zb1RlNXZFZm5UcThvT2krelArcnExWDhuSkcw?=
 =?utf-8?B?LzNXbWhrejV2d2dYZTJDek10ZnVXMlR1bnN3Q3JwMWkySHFYcW1ZZGZMOFR2?=
 =?utf-8?B?L2pDMmh2SkdKcGZwUlZOTjhucUNPYlVqdmJBb0prNmhFSkJOSEhVVlJOZ0tS?=
 =?utf-8?B?VHlrKzhxVUdmZE4rVkhNQ0FQVTgrMW5VMlcvN2pwalhZUC9YVThtQmorVVh6?=
 =?utf-8?B?ZUlsWndvRDdsNGFkbXp5OGsvNk85UU1XNVRtcExrTkpYemV4UElOK3FackxO?=
 =?utf-8?B?NXFFeG5UQXFtS0c1dElzZ2grSVMxTzhrU0s4V2YvN0NyRHR6Yk1RSW5kNXl1?=
 =?utf-8?B?Z3VkVEpLYzlLZkhXTXRqeTdGVVBDOEZHV0pyMXFKTnZILzUvR1Q2ZmdZQjNF?=
 =?utf-8?B?YVNOaWVVS05mQnZJaW5FdXZNb0JhMVp1OHJLVUNsdmFOVkcyQkNsbk9YTW9J?=
 =?utf-8?B?bVNKN2JtamJ2dTNFMGpwYzZHaGoxUU1zZVU2K3RkSVlWc1VOSUo4VjlnWUlL?=
 =?utf-8?B?K2d4QWk0M0VvM3gyNlZOUzZhMVR6TkpGV0trWmpyTnd6RUdBbTl2dFJDNVV4?=
 =?utf-8?B?OGpWK0srRjZzRHF4czg4YjVSelJBSDFEaFRJUitvZGlrUWFoMk5Sb2dqcEt5?=
 =?utf-8?B?S2JFRkcxb0ltMmNJSTQ4S3JoREhUSHExUVpNZTd6MVpvdlVJYWRDVllXMFBr?=
 =?utf-8?B?SEduVFY0cTVSSE9OK3gzNHpsL1hWQmIwSXRWcmo1OXl6WlhLL3ljTHVyUnUv?=
 =?utf-8?B?OFpzM1F4RDM3dlVKVW54aVc1Y1ZwUVdKTGplNnpmTkEyK1FWOTkxRTlrT1Nv?=
 =?utf-8?B?SFJZVWtkRm9vVHlRaEpmTU9TU25uR0YwaDg2dmVXMVM2V21mQVZTbXdvZDZM?=
 =?utf-8?B?LzkvdzF0OWRiMk14TFlEcFJrcHBNeXdHVG9CMFdhMVdxODZ2UW9YYU1FRkRY?=
 =?utf-8?Q?FGXTu9Ji7B/UZoo7zGO/KN0MnjY+8I+d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTg3V2FDYUNCeFZkclFhSmp0VjFvam9wM2JOQm1uMkRoTXNaWmFuNG1RNkdG?=
 =?utf-8?B?Skl1c2VQYWg4SWk5ajZ2dlk0SDJmMks4QjN3WWZSeWppcUhaQXpVelRwTmFU?=
 =?utf-8?B?TWNoemVxMmJvMlRSdFUwU25MTjVxM3ZmeUpxODFTRm5TdGgzVTBicGE1anVJ?=
 =?utf-8?B?Ky9VYmRaaGhpM3dRR0lPWUpYTGxWbWFhNjZwUXFSVGduNVRwSVZxUzJUcTBY?=
 =?utf-8?B?c2xtY0lTSnVCVURLeWp4blJQbDdMNHlRVW9uR1kzakZlckRwVGZJbUJoR280?=
 =?utf-8?B?ZUVlOHVvQWYrZE1xVDNsWmEzZDlPZFJjSEk2d0pWbDE3WlZBWm1Ibms0RWNI?=
 =?utf-8?B?eXJPazFOMmVDSzcvYjZLUDFEYjA1Mnk5V3VqVVl5cUFZWVRaM0tpaHNRMDFJ?=
 =?utf-8?B?MC9SWWFTaUNnRXRJRUNkSm1ybnpHRkE4bnRHamFuMFlZOFJSM0FuUGRkS1Mw?=
 =?utf-8?B?RXpnQ1ovek45MDM3WWF0Y1RYeGNndmpNc1RkUnp5UzFXUkR2cXZnUlY4YUtS?=
 =?utf-8?B?Z3llcXhkVVhBaDZ6a1ljVDlyYXpOajkrWmpzNURPOWRxYVF5dko3ZGtWbis0?=
 =?utf-8?B?dTNhejFSa2tuYVU1Y2hvbkxPelg4UlQrQ0E1MjRQbWxjVE85Z2xQM3lFQjBO?=
 =?utf-8?B?dS9WRWtSbUpHd25XVXI5ZitKbTYycnVlY080dVdaWkFSSUpLRDZFTllSWmtD?=
 =?utf-8?B?UVptU1pUb1NxRmpjOCtlZG1HY3pnU1l0M2dKOUVTRk1RVTVhV0M3dHJhYVNk?=
 =?utf-8?B?b1cyK1ZpTTh2VjNKdWRQblJSM1lJdlNuT0N6eHVBdW9RWitKZ2RIR01HSUh3?=
 =?utf-8?B?TTI4d01LeWlHVGxDKys4MUVjRTQzMTdNNVB1SVhZRzVJNkg0bjFHbHdqNEFB?=
 =?utf-8?B?ME1aOGQ2dXY3dll4VHd6YWJmWEhEUGVLQTU5dGMzdlIxaFdUMjZhT1A5OVlX?=
 =?utf-8?B?YUoycC9QZmE1VWpQNmJ4WVlpaFdaQ2s4YnpNK1ByRmEvUFB5LzNCZzgxS2tE?=
 =?utf-8?B?MS83Z3VRWmF0SXU4N2lmM1VsbzZnKzF5SFZmVnhKZDc4REh2cFhwMXJrbE9p?=
 =?utf-8?B?VEFYOVNzbncwc3ZuTEl2bEh1aDlOODNWU1YvV0U1WTJqek1rY1IzZHl5K3R3?=
 =?utf-8?B?eitwYUtFK1JOOSt6VkZuT1hjeFU0YlNzTWkvUTBEeUdGb082K3BwZGNtOGxR?=
 =?utf-8?B?ZnFLSUtMaHZlOEFPRmkzMlJNQXRORVFMSGVhY3hxMmhLci9KQnhlcXc1YUpF?=
 =?utf-8?B?M0tyWEs5OFp6NFMxU2RLaHAxUWxwdDdwSnpsWFUyUEZ2bURBT21vc2xsL2kx?=
 =?utf-8?B?NnY2Nk5mamM4cGFQbkQzZnVobVpsRnlKbHJZSFFHbFlYQTdTVjJCVXZSQzVh?=
 =?utf-8?B?ekJOZlByRElEdUNqUUN0OERGdWhVWDlmMEN3NmQ2U09PYXdYaHUra1cwcm9S?=
 =?utf-8?B?REpLRVRCWURZeGUzUklzcCtwTmNnL0NzZVBkNzhxNk9udWs2WmlGdUNqVldq?=
 =?utf-8?B?OTc3YUNieWhLS0dJeFRmOGZ0enZVTWhmWG82SDVQZmNZdlZpSUJtSmtWd0dF?=
 =?utf-8?B?cnJDM1JOQjRhYkF3Z1VSVmNpMHJVdE53ZURKSjJkRDJ0eHJuT3M1SFBFWHRC?=
 =?utf-8?B?c1F5L2hYbC9GYjRiWDBMeENockphdFJNT1dpZGY4Z1dPZW5YWEtJSFd4elNN?=
 =?utf-8?B?aVBKbTdJSk92ZjcrRTBlTFBNZVl2aWNpMXpPRzUrVlBaMFA2YkIyRHhPNFpW?=
 =?utf-8?B?SmVZbjh6Vlg1SFNPZk1GQVRaampObWJoUGNMdVk1cC9rQ2FtYzZRNFh3NFdu?=
 =?utf-8?B?TGt2TTdpb1dxN2Zham8xZk93WFBjWGl3ZytsREVLUVROUXhFRmJpajdtVHZk?=
 =?utf-8?B?eVhQazc3aE1pZ2JiMlVSY0Z1NnlUNTJEUmFRTzAxWTFUTzdtUVFSNEhvc01I?=
 =?utf-8?B?NldYbVhpcXBKU3duUkZobkRRejZFYUYxWHhTQVc2cjgzb0VpT0ZpOFpON2NQ?=
 =?utf-8?B?UGpRUWFiL0JzNWJzVlQ4eDAvdUxJZG9xU3VzM0dJUmRzQlZKdENtOGZ3MVln?=
 =?utf-8?B?NWNSZW8vNVNTUURYRFdhRUxoelNqVGpVb3NaR1haZkUrb1NTRUs1KytBOUNo?=
 =?utf-8?B?eDVFeVRXTDNtODZNMmZROUhoRUQrQXJsRG93aG9va0RpZ0FaeXBWRGpBbWxZ?=
 =?utf-8?Q?CKTYPYyDgtyYlayHWFi+b8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e78b1c-942c-418d-1629-08de3660bc60
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:50:24.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRCrCBzgalxwrkODUqRXHorZnlyW9f5MhaukzXvfN6T7KpGMGCyGFnQCbEoCoAyrubKITNhGPy2Y+24uNvA2OcWCrVOoInI+9H2P5oL/VEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA08475C7D
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



On 12/6/2025 1:23 AM, Swati Sharma wrote:
> Avoid calling fill_custom_1dlut() for Intel devices, as the LUT setup is
> handled differently in the Intel color pipeline.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_colorop_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index b5951cfc1..f62f8e5d7 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -345,7 +345,8 @@ void set_colorop(igt_display_t *display,
>   		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
>   		break;
>   	case KMS_COLOROP_CUSTOM_LUT1D:
> -		fill_custom_1dlut(display, colorop);
> +		if (!is_intel_device(display->drm_fd))
> +			fill_custom_1dlut(display, colorop);

Looking at the code flow of

fill_custom_1dlut()
	colorop->transform()
		igt_color_tf()
			igt_color_tf_eval()

We can actually re-use this frame work by defining igt_color_tf for 
linear and max like so (totally unverified)

const struct igt_color_tf linear_tf = {
         1.0f,   // g
         0.0f,   // a
         1.0f,   // b
         1.0f,   // c
         1.0f,   // d
         0.0f,   // e
         0.0f    // f
};

const struct igt_color_tf max_tf = {
         1.0f,   // g
         0.0f,   // a
         1.0f,   // b
         0.0f,   // c
         1.0f,   // d
         0.0f,   // e
         1.0f    // f
};

That way we can let go of all the kms_color helpers that we had to come 
up with.

==
Chaitanya

>   		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
>   		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
>   		break;

