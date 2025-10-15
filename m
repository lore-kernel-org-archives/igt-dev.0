Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8A3CCD18E
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:03:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B4210E771;
	Wed, 15 Oct 2025 10:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAj6eHRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92B10E771
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522612; x=1792058612;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wifdvm4IeC5bkUSWNV7gOMWUE2+tk69m2ykPHGZFNk0=;
 b=aAj6eHRHNPypSjNcg62RZx6gBdK+mQfyfv1iMEuAS6aRnQP+yLDR2vfa
 ww2ya3Mw+UeFY3T1hBUGuH9fNsGy9aQQr9/dMvm6lJ8HYsOiZ546qVh5h
 fAOnmbxuluZrCN7X+yZog62v/Eu/Rp0rP3C6kBXfMxTG5ZrZTDKMqZRp2
 bMVq04EWT0jEpHg6Hv1j84oNwhnd31znkPk2njF3JJ/5WcXStPxR5MIbx
 /MUYtNL8uaSr1jbxaGRwKlpu/j9m+b1+xlpLBE34nQbysI66HuWqzgB0G
 KefrtBHpDbRBshy3yIll9jZhdc0xVbg6ie88yp3BaGMO+zaqRKmzbaBW9 Q==;
X-CSE-ConnectionGUID: bACD0+uYQW270tsr/dgbGw==
X-CSE-MsgGUID: /GzWv323T+GBpoENeVAcKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73294720"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="73294720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:03:32 -0700
X-CSE-ConnectionGUID: uHLxcLwDRT2hRrHkJb+D7A==
X-CSE-MsgGUID: pF6L+3UjT6OqdpfcGVynkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182546590"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:03:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 03:03:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 03:03:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 03:03:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+OlmFpKuuImGVwX3pKEc/lRdUJDBGp96Drfnuo3KhsgPF51cX/GbcnouJVZL1AUAXQkceuRyHm/8/mhEbow+vF1mCe0NfwiQ8sBqUxa6excKwX3jC14pUNKRsFcZhCXXBR7NW6UFSP2RsgHqwknNk4OZ9ZU1BZe6pvoaDJknNIDyq3zrw2g1cyg2OUPy3P69KtaPhJ2XB2r6HRkfLThJlIEtf8Oq1cY6RamLuZkaqt82U2KGmifbMTLv5WDg3kR/3OSLRr7diZtyudCZBd1Bb8DxiLLyVLjodbSZeamX/wXsFaSEEgfEas9vnbDFJrBlB1y4RoGNbu6wcF9urg0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoRE89jeabbroRQOOqTOL2fDwdm8gunZB/l6Uwis4wg=;
 b=Wqs+3qd+/TG8z+eqU1vIXDnd8QgAq7IaC+G6nk0UYrp1A49W1Msdgq4TAU/GEDCx/LPwEYiG9LCKYlBrJTf0c3A8jLpXymprWY7HA9VEeylU5YjdvCRhopf8T7vDC6wnr1DZ+SOGKVarlf7L3AmITHi9g6+jA+eganrEGI6zfzk85hKU9KCfFOrCnUeAcDNllzmnFCXHntV5jdQvpVopfKNrh+w5bZ/hk0y4N+VeH+QiVJInPS4OFttDoWPwHVOaf4bpEAulCa+e0MNp9S+ufCDXGc03alZBbt3pj682UmvSG4K7gx68cwIy+MJrVW14QfXbb2XybnDBV3K/Gefx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 10:03:27 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 10:03:27 +0000
Message-ID: <14003b74-c817-4d78-a6f9-920134880739@intel.com>
Date: Wed, 15 Oct 2025 15:33:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v5,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20250929175230.753899-5-sk.anirban@intel.com>
 <20250929175230.753899-7-sk.anirban@intel.com>
 <a8469a45-072e-40a3-94e2-45a8525a7826@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <a8469a45-072e-40a3-94e2-45a8525a7826@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To SN7PR11MB8262.namprd11.prod.outlook.com
 (2603:10b6:806:26e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|BL4PR11MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 727bd3db-3f5e-496c-930e-08de0bd21562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnhDWFNCNjBLNXRqaUt5TzJIRmFnZVJtRVdyY0hiVDZlZ2orRFlWOU82TUZy?=
 =?utf-8?B?TEIyd1pIT205ZG9abnd0QjNTOTR4eEFJR2pqbjBpOVVmMGpzMXBrNEYvNzBF?=
 =?utf-8?B?WkVPU0VuUEp3eGptU20zWHZ2OVJDN1N5cm9WTytod1I0ZStBeTRIL3k0SmtF?=
 =?utf-8?B?WVVyQnBTNmJvY09Fc0ptWmk0VkVpN1JNU3hEZWNFelJCN0lqU3JCTjRwWFE1?=
 =?utf-8?B?NnppaEMvN1NpdG5oUkpqTVBseWx5d2dseTFpSFZQNjNEL3ZpckM3OHJaQ0Zr?=
 =?utf-8?B?d1B0SGVpOHM4bnJORGU4MlhXMG5vNlVvbEwrQkRIUjdXR3BmR21ETFF1QWUy?=
 =?utf-8?B?SWhjVjNMcnZsT0IrZUVDdVk0aElpamdWWUU1bXVRR1k2SWpzMGprdVdMdjh3?=
 =?utf-8?B?Y2Q0NmhkQUlvVU1BRndnaGJpK2E1c1FQNm1STlhTcWpIeDAxenFoTmY0alg4?=
 =?utf-8?B?UFF5UDVTdGkzTVRHMnV1MDkydDI1azFDZEtIOFlOYlNNdWg0TlkweG5TU29k?=
 =?utf-8?B?MExJeUV4TEpaMG1RM05aSUcwNXovaGtBWmJFQTRjQkZuQWtacW81Y1dpVGdT?=
 =?utf-8?B?TEUrbzVjSGM0TkJkY25HQUZZZVNtcldlU1N4OVdCcElWVHB0U3FZZzBzMERa?=
 =?utf-8?B?bDJueUZRTzdKbDZnMXhhZkttWU92bFM4Yk5IMEMyam5qMjZUV21FU2ZzYlZI?=
 =?utf-8?B?ZkFuQ0ViSkVaZ1kvWW5rNHFpMXk3UkVCbm5YRDhIdmRiYjJMZHFyQjQ5OXp0?=
 =?utf-8?B?OWtNWmNZKzduNlBBYWlxSFk4OE05djd4Nnp4SHZrVnpLMzBJNnF3M08yRWxr?=
 =?utf-8?B?VEpRK2pkaXBaNDZFRGNMdXo4dlI2a3Y2TFowYzZsMzdweVFKRG9HRmNIK01u?=
 =?utf-8?B?Y0tGeW5zd09FNXE1dFRMYnV4YTRweSs3QW9xYVNUU3RtYWJSQ3EydXJISmdK?=
 =?utf-8?B?QlBSRHdaaUw3aDU1eWxOalZhcWtScVFCWmRJcHA0Y0dPOWpuVHRNNGl1UjQ4?=
 =?utf-8?B?RUc4MWRtRnV3RDNqSm12VnYxWjRGcDZsOXBuY3BadXQwME94V1k0YnBOQ290?=
 =?utf-8?B?c2pydmJhRmdlLzI1NkVjYTRlMVdlcEFVMVNHR0srdXRKdHlLNkxpbHZEeEJG?=
 =?utf-8?B?RTYzSHg3YTI5RG9OQXEvcFJnVmh5M1FnYlBrREJRNmowdFVLQlVLSnU5ZHF0?=
 =?utf-8?B?TmpwUXhiRDdZd3J5cUJrVHRHdkRVUmh3Z0I5N0RPM1NETkVRM01Vazc2MFR6?=
 =?utf-8?B?cURaMW8yWm1NUk1zSm1ZNE5UTDRTeWlOV1IrUm5IUzk5dlRMM0lWUkZ1ZmpB?=
 =?utf-8?B?bStFUk9yM2hnczZCVVFRKzhnQ2hZWHgxT2RORVNmUWhab2lQMUJoR0tud2dL?=
 =?utf-8?B?UVoxWkhJTGFuSXU5eDF5cTVmS1FISnNKeGtIS3N1MUV1MEpJZGRLNnRsRTJW?=
 =?utf-8?B?WlA3TTV5ZUlRMGxEbTZjcmdkcFI4K3FNV2F0b0xBQzZPMllGbThrdDRnc3Bt?=
 =?utf-8?B?TWxMNEJTMWN2dGQxTk11NC9QdmZYK290NVpUdXhmUXpKMU0wYnNyeHZJbVlN?=
 =?utf-8?B?WldzNlpqbHlyMVZkK1BOTS9XTlhCQkt1Z0tOZU5yTW9vR2hxUWJ1QThPT2gy?=
 =?utf-8?B?TVNLeHZjUmhvTmJCdlpUR1dvUVduSGlUSVZpZ2p1NWh5V2NlWmRZV3JYWHMz?=
 =?utf-8?B?S2lVbzJvNWhsRDFtaXVrRUtYVFpEOGdhQVRpQ3gzTjRpaVVQNmg3RnErclA3?=
 =?utf-8?B?MHdHZWxyOEdtL1B1T2JydEdsRXNmWUdCSDhrMTFwQ1haN3BwSWZtVzdiQjNC?=
 =?utf-8?B?WERpSTZSeXlnMkNuR2todDc5b1VTdGdnbzZRQ0RkWWttcU4zdmxweXI1RnR1?=
 =?utf-8?B?VXpHTzVJdEFnVHRtam5oZ25rYWtKVzZBZm1LUTZUNmJaYzYzbkludlF2VGpX?=
 =?utf-8?Q?TtaqXhaRWUvhpUwgnSv6sw9kXF14RLqo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlF2bk5adE9HK3ZScENRWS9sMEJ2T2hDTENOTXV5R2grWDhmVWFMcldsNXVm?=
 =?utf-8?B?am1mUkk4eUs0czdad3g1cFFyUHdrOXJSNHZFSWxJSG9CTmNOUzVMbmxsc0tt?=
 =?utf-8?B?ZG9Kb25HT1hTV29LbHloc0hKNlFzUW15MVV6a0g3UEszYXdlWUJScGZscE0y?=
 =?utf-8?B?eHlEN01OWXQ0SkFQZ1hGYUxybnA3ZW5ES2M3ckpUUXNFRjQzV1dJM1hTMnYx?=
 =?utf-8?B?ZnhBWEJhS0h6dlVwSXlqN0E3dlZSNldaaS9DSEJFUXpEMDdXM3V4NHpwRGR6?=
 =?utf-8?B?S1c3Z21nR2J4OVNVMWpnL2hBQy9Ia2hvYXBFOGwwZmZqT2cyN242OG1iVDdV?=
 =?utf-8?B?NEtYeDM3dlhxVWdCVkFDOUYzRk9lZzVVUiswZm1yZlUvWkRSdmpWK29qem95?=
 =?utf-8?B?Ri91RHlZNFV5OUx3aTJYaUF0Nlh0OWY3bVV4NGxaeDU0WVV1akpNV216b0Jp?=
 =?utf-8?B?NlJuWThLRCtqYWJEL3UwVmlyNjJMWWdVcnVUMkFmcmtlZTJXNEZHZGxjSEZz?=
 =?utf-8?B?V0ZmT2Jzc09HSm1qQnNFK2hPbTFBak1ORE12cmVEZFRZVW5Lam1xRTBSV2pp?=
 =?utf-8?B?dE56dVJYK3dvMXRHUFJlNE9MUVNUZ1JvemxUdmREUFY0Zm9EWFluUnZMK1d0?=
 =?utf-8?B?TmkvbXR4S1dQK3hhdkVaeXBNdlJSa0xjWXIyY3N1ckdMaER0eVFHWWNaZThl?=
 =?utf-8?B?aXRZMFRqT3JvRVVrdndFMkhiZlNmY3RLNmxOQ2dEVllEVjRQbDVZR0NsTHlv?=
 =?utf-8?B?azRBQTJSVHNUWVZSbmhwQTFyQWtGOW10Z3lsLzhZMWxDSk5mWkRtcFlrNGJX?=
 =?utf-8?B?RFVCZ284L1NXdHhZNXVwVzB2Q2NOWlVsb1J5REVMaFlZbHk5M1JJbEdQWnRV?=
 =?utf-8?B?RVhtU0UvbjcvT0J6MEIrbUlhYndLSzc2OEpnaTNJOFhBZC90d3piQTdqWlBr?=
 =?utf-8?B?YUIrUGJTdGdRRm1rVUpobThvOGlLRC9kTkNVQ3pTSDFOSzAwdUVYUkxyM2pj?=
 =?utf-8?B?cmJ4RHc3K3BBUlZORWsxSkVGZGVzaFRUKy9zOCtXVm53QkVNM2lUR0JhdVZq?=
 =?utf-8?B?eTFJL0JvQ1gyRjhoUk1aUyttVHRtUlBxeXlSeUlMU2wzY2tyQkkxM2VMTlJw?=
 =?utf-8?B?N1BmNWk5TSszSUlHZ1dvM3ZtTFNtcWYvSWtkV3V0ZmVqQkxGSldMTVpsZjdO?=
 =?utf-8?B?ZkswR1hnTndvbGlPSXVWT2J1ZnNWbHdlNjNZaG1kU29ZMEJVSlUrYjFKUFEx?=
 =?utf-8?B?dVhyYkQzN1gycmU4elpFTi9OekQyNzRDcGJDbGF1Z1dqZW51RXU1aGVxU2Vq?=
 =?utf-8?B?dG0wOHFYbTFSZVNpVWJVMmVYWTIvYXVxSkIzZmx3UHppRU9wMVFOZHE1cUNh?=
 =?utf-8?B?VzBJOWRhK0FBQmpHdGpkRnVYb1d1cW5TQlp5MVRzMHplWGoxWHRVd0VPS3pI?=
 =?utf-8?B?QkVVZmdwRFI4cDB6U3k4Y2U0dDlxT3kyS3dRdU5uTjZ0Z2k5UmJBejdOMzA1?=
 =?utf-8?B?RzllazVjRHhiOEtZOWFPNk9xbVZ4YzQvYkNVNHhROVBpS0FaOEVrcTFOQVRn?=
 =?utf-8?B?Wm5MRnoyR2tZR3hpRWplZFk2UjBKYzZCMSszbk1aRkREbWlWTVdETnFQQ0tD?=
 =?utf-8?B?Ky9EWTUySmdXRUlvV3N1dDFEV1V0SXArR21ROG5tZFJxamJoTVNRSi8wYXZK?=
 =?utf-8?B?SHUxN0hVRlFIQ0RZbTYrcnhCOTN4aXVrNnpEM3JlSnh1SmNBdWR5NVZXOTdo?=
 =?utf-8?B?eTJEaVovR1kxaXd3NUwzeFhMc2xncjh1eDFVWjVlZlJUVmJseWM0VFpJTVU1?=
 =?utf-8?B?Q2RIYXdjM21sZnRZSUc1QkY3dzhYNWFRa3ljV1c5YllKQ05nSlYwMTlzRXh3?=
 =?utf-8?B?S3hIdnJlVmhldEVDdUt6YTJyQURyMko3NnlxTHozMVBVYjMyVVFESC9YVkh0?=
 =?utf-8?B?YXl3NjBxbVNRcUV2Vk9RSnBrVEhQNDF4UWtHSHRLUFFZRDk2SEFBb1JzcUds?=
 =?utf-8?B?YloyS0xZNUkzWmo5R0xhOVE2ZVhTTnpRbHlNb2JNbVcwUjc4K3MxYkVma3JM?=
 =?utf-8?B?RUh0dXh2bjFEVWlUZzJPTTJieEp1c1F0UDA1alFVcmhBanBDdUM4Z20vSzFJ?=
 =?utf-8?Q?0Ltsxz5XTwXylLTBc+lu6muuf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 727bd3db-3f5e-496c-930e-08de0bd21562
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 10:03:27.1484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GGL7grYZhoTKOhcRZmQ5GFk9NBo4EZemH/5UGjERu6VU5wvNO8v2onCQ3Zmq7wkkScncpBkT4xyQDJjLs/SnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
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


Hi,
On 13-10-2025 13:48, Riana Tauro wrote:
> Hi Anirban
>
> On 9/29/2025 11:22 PM, Sk Anirban wrote:
>> Inject a CSC error through uevent to cause the Xe device to enter a 
>> wedged
>
> Inject CSC error using debugfs to test vendor-specific device wedged 
> state and runtime survivability mode.
>
>> state. To return the device to a normal state, reload the driver, as
>> the wedged state can only be resolved by rebinding/reprobing the driver.
>>
>> Check survivability mode to validate that CSC error injection correctly
>> triggers the survivability state transition.
>>
>> v3: Update commit message (Riana)
>>      Modify the uevents interrupt handling (Riana)
>> v4: Move test to xe_survivability (Riana)
>> v5: Use separate function for sysfs (Riana)
>>      Cosmetic changes (Riana)
>>      Use basic spinner (Riana)
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_survivability.c | 93 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/tests/intel/xe_survivability.c 
>> b/tests/intel/xe_survivability.c
>> index 3ce62657e..dab70e3d8 100644
>> --- a/tests/intel/xe_survivability.c
>> +++ b/tests/intel/xe_survivability.c
>> @@ -4,6 +4,7 @@
>>    */
>>   #include <dirent.h>
>>   #include <fcntl.h>
>> +#include <libudev.h>
>>   #include <limits.h>
>>     #include "igt.h"
>> @@ -11,8 +12,13 @@
>>   #include "igt_device.h"
>>   #include "igt_fs.h"
>>   #include "igt_kmod.h"
>> +#include "igt_sriov_device.h"
>>   #include "igt_sysfs.h"
>> +#include "intel_allocator.h"
>> +#include "xe/xe_gt.h"
>> +#include "xe/xe_ioctl.h"
>>   #include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>>     /**
>>    * TEST: Comprehensive survivability mode testing
>> @@ -25,10 +31,24 @@
>>    *
>>    * SUBTEST: i2c-functionality
>>    * Description: Validate i2c adapter functionality in survivability 
>> mode
>> + *
>> + * SUBTEST: runtime-survivability
>> + * Description: Force Xe device wedged after injecting a failure in CSC
>> + * to test runtime survivability mode
>>    */
>>     static char bus_addr[NAME_MAX];
>>   +static void ignore_wedged_in_dmesg(void)
>> +{
>> +    /* this is needed for igt_runner so it will ignore it */
>> +    igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device 
>> [0-9A-Fa-f:.]* as wedged"
>> +                    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
>> +                    "|GT[0-9A-Fa-f]*: Failed to submit"
>> +                    "|Modules linked in:"
>> +                    "|__pfx___drm_");
>> +}
>> +
>>   static bool check_survivability_mode_sysfs(void)
>>   {
>>       char path[PATH_MAX];
>> @@ -41,6 +61,36 @@ static bool check_survivability_mode_sysfs(void)
>>       return true;
>>   }
>>   +static void check_survivability_and_uevents(int fd, struct 
>> udev_monitor *mon)
>> +{
>> +    struct udev_device *device;
>> +    const char *dev_path;
>> +    const char *wedged;
>> +
>> +    check_survivability_mode_sysfs();
>> +    device = udev_monitor_receive_device(mon);
>> +    dev_path = udev_device_get_property_value(device, "DEVPATH");
>> +    wedged = udev_device_get_property_value(device, "WEDGED");
>> +    igt_cleanup_uevents(mon);
>> +
>> +    igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
>> +             "Expected WEDGED property to be 'vendor-specific', got 
>> '%s'",
>> +             wedged);
>> +
>> +    igt_assert_f(dev_path && strstr(dev_path, bus_addr),
>> +             "Expected bus address '%s' to be part of DEVPATH '%s'",
>> +             bus_addr, dev_path);
>> +}
>> +
>> +static void force_wedged_csc_error(int fd)
>> +{
>> +    igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
>> +    igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
>> +
>> +    xe_force_gt_reset_sync(fd, 0);
>> +    sleep(1);
>> +}
>> +
>>   static int find_i2c_adapter(struct pci_device *pci_xe)
>>   {
>>       char device_path[PATH_MAX];
>> @@ -125,18 +175,35 @@ static void set_bus_addr(int fd)
>>            pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>>   }
>>   +static void test_spinner_after_recovery(int fd)
>> +{
>> +    uint64_t ahnd;
>> +    igt_spin_t *spin;
>> +
>> +    ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>> +    spin = igt_spin_new(fd, .ahnd = ahnd);
>> +
>> +    igt_spin_free(fd, spin);
>> +    put_ahnd(ahnd);
>> +}
>> +
>>   igt_main
>>   {
>>       int fd, configfs_fd, configfs_device_fd;
>>       struct pci_device *pci_xe;
>> +    char pci_slot[NAME_MAX];
>> +    bool vf_device;
>>         igt_fixture {
>>           fd = drm_open_driver(DRIVER_XE);
>>           igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>> +        vf_device = intel_is_vf_device(fd);
>> +        igt_require_f(!vf_device, "survivability mode not supported 
>> in VF\n");
>
> Move this to first test
>>           pci_xe = igt_device_get_pci_device(fd);
>>           set_bus_addr(fd);
>
> you can use igt_device_get_pci_slot_name itself here
> Thanks for finding that call
>
>>           configfs_fd = igt_configfs_open("xe");
>>           igt_require(configfs_fd != -1);
>> +        igt_device_get_pci_slot_name(fd, pci_slot);
>>           configfs_device_fd = 
>> create_device_configfs_group(configfs_fd);
>>           igt_install_exit_handler(restore);
>>       }
>> @@ -146,7 +213,33 @@ igt_main
>>           test_i2c_functionality(configfs_device_fd, pci_xe);
>>       }
>>
>
> Add igt_describe for tests
fixed is available in the latest revision.
>
>> +    igt_subtest("runtime-survivability") {
>> +        struct udev_monitor *mon;
>> +
>> +        igt_require(igt_debugfs_exists(fd, 
>> "inject_csc_hw_error/probability",
>> +                           O_RDWR));
>> +
>> +        igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
>> +
>> +        ignore_wedged_in_dmesg();
>> +        mon = igt_watch_uevents();
>> +        force_wedged_csc_error(fd);
>> +
>> +        check_survivability_and_uevents(fd, mon);
>> +
>> +        drm_close_driver(fd);
>> +        igt_kmod_rebind("xe", pci_slot);
>> +        fd = drm_open_driver(DRIVER_XE);
>> +
>> +        test_spinner_after_recovery(fd);
>> +    }
>> +
>>       igt_fixture {
>> +        if (igt_debugfs_exists(fd, 
>> "inject_csc_hw_error/probability", O_RDWR)) {
>> +            igt_debugfs_write(fd, "inject_csc_hw_error/probability", 
>> "0");
>> +            igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
>
> Why 1? Can you check the default value and set it to that.
>
> Thanks
> Riana
I re-checked & the def value is 1.

Thanks,
Anirban
>
>> +        }
>> +
>>           igt_fs_remove_dir(configfs_fd, bus_addr);
>>           close(configfs_device_fd);
>>           close(configfs_fd);
>

