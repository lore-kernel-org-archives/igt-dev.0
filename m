Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE011C0219C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 15:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F46A10EB3A;
	Fri,  7 Feb 2025 15:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJrhARWD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE0D10E1B4
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738940764; x=1770476764;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o8o/R5fmyOO8T6EgW3jWrLjDbXXJTPO9HvLvGuAaXd4=;
 b=eJrhARWD3aU/wGxR7rwfw55VTIjxuiyXgLuhEt146m8HEFjhUlXMwiHe
 BSHeXgo6gIGqvnjnOuq0iAQEB0eHVowCggmWxNYLMpVF5SaZ84Ez0550M
 iF2R/1d6y8e+s0Xd0jQ7rdSV2fBa7WGBQiY/Zf8FKyVpYdpPVvCVV+583
 Nd8YTyfYEVoXTFQCPg6UH7YCNDrs/3yNfb824PVzxSIrsL9Bg3SNV8MYs
 dGh6c+Fhl4aVgT2Q6cSmRywuBfZ+jVA+/kIvLhPXvJWZ0grE/uaK4Ej04
 dd3DeeQ3nmo+nujjOlKWjAprhp1Dfk191OG8+3U0UW8VPixDkH5gFvvmD Q==;
X-CSE-ConnectionGUID: YXLU/BVhRmicJ91QVWwnKg==
X-CSE-MsgGUID: 1OSbz9W+SIS6+fCT6yrLyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39477137"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39477137"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 07:06:03 -0800
X-CSE-ConnectionGUID: i2j6K+6FT7K0vvPweS4HpA==
X-CSE-MsgGUID: jvcCWldNSrS+uLxVmfViAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111373732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 07:06:03 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 07:06:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 07:06:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 07:05:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKOcIU7D/fIM5pa3N1+Nkjw+ya9c5F8+qdqz+cANY6f6Svyj3Mvv3pOAuN+rxljFxXZ8pItK5twqKOLfFrXmElqANgn4NO6qm+G/v2qGPiyYEmRMIncdQp9//Pb833+rV65Nhkw4iCGgAZOsLnjPWFENAslfktcrjKqg1nD118W0tZcNmFEObs9olXOuYiB4odu+shFeH04mrv4oSWPTedtdlXZtipO+a1YZRTbcHgFBWNO1f2STfiU52xiCoAPjrIKDmKlLKvPwKfwVJALUTQG1ViBQRuwQ7nddEWoRzvVDBZMhxE8iJomPmTrOeJnFbMKDK9qsxA+q/bbugYgDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXJe0cbkb5uDpet81Mtj4KbLMtdH3O5g4kToqkoFlv0=;
 b=Z+sF2Zq5ryTt8iF3OCwxxCjIQxGHIcYym7gfN/AhFUWrOoUakky3hTNNf3lKF1dIXppoy9VXYZsPL4X7ghF4IA2vTK/WCMTFm20LQCTQqgTD1tlwr3gsSUvfm0+f7TLb0t20q3G1yoQfpnjNmJ8j3ODMHnOjQkvJvUDYQTxMGTE6M8voBA14ADtVhTOIeqt8Uiq5dKqHF7QXaDvVu2FXudsSd8FGQMeVPKxgOS2smwiA4QZViSrJtEsu7VRIE3mFySKLjy/QLGmfoq5Zv8iTcdTf33oYPtDGJWrw0RvcJa2d9v/JqFDOhVXr/U2lwBPC+IUOKGexcmSKAkENyjUgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA0PR11MB7744.namprd11.prod.outlook.com (2603:10b6:208:409::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 15:05:44 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 15:05:44 +0000
Message-ID: <c8facc8d-f2e5-4789-81a8-7ae9a3fbeca7@intel.com>
Date: Fri, 7 Feb 2025 10:05:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_capture: Enhance test to check with
 DUMPABLE flag
To: pravalika gurram <pravalika.gurram@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250205184143.233197-1-pravalika.gurram@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250205184143.233197-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA0PR11MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 72da9309-7f88-4c29-5b87-08dd4788e546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWpOVjR1WWlDbFpwNEVFU3dwOFRJTElIRDJOcDNGZm1oQU9iVFVKaWNFcEk3?=
 =?utf-8?B?TEdKdGllL3V6LzFwdTVRRHlaT3BNUCt2N1VEb2p4OEQrT0VWdlBWZWllclhp?=
 =?utf-8?B?TUszV0JYUjlleDZoSTFmN01IbGg1aytteXBSY0ZzRnY3M0ZzL0VsVnJIYkNO?=
 =?utf-8?B?WnR1ckdma29jK2F6Si9XbU9VUlZQVC9OSkVwcktqc1lmU1NHOXl2NTUwV01W?=
 =?utf-8?B?ZzZDTzFBNUFSS1FaMlpobTNnZmdHQm82UVl6U1VoQWNrNFBZUk1SSGlIQllT?=
 =?utf-8?B?SmVaekp4eXBDbmRIQTdKeHc3VzJIaUtTaWJ6dXQvV24rWDV6ZWN3VEdoYTZB?=
 =?utf-8?B?VHpOQTRRcFZWQmJ3TE1hWDl6b0dPTmRTblMwTVJZdXFJWU91Y2FiM0s0ZSth?=
 =?utf-8?B?YXUvWlUzekJTazhZUjVMeG1lSGt2WE5hVm1NWjNZZUhmeVEyeG5Qc2N4QU5v?=
 =?utf-8?B?amc5a2JvYjNlMXVvNEE0cWdkRWpWWmt5MFFNbloxVVdnbEVDeSthTUF1ajNk?=
 =?utf-8?B?R1VQVStZeFMwRkVoUm5pZ1dwbzdyR2tJbHkrY2ZhaDVGbGFRcDlrNTFBUmdy?=
 =?utf-8?B?UWIyUFdSVEEreWhxbUUwMk1PQkJCQVg1ZXlWY29mdWtLSmY5bXRLcmpKVGY1?=
 =?utf-8?B?UXRpQWUrTUhnWDlPb3daVmNZbGJRSzc5Qzd0Y0Nna2pOZEszNHZ0azFCRWVq?=
 =?utf-8?B?NC9peVNYZk8wWkhXdmJXMTNDOXNaV3Y4S0RDajFFL2dLOURDSDQvbnNyd1Z5?=
 =?utf-8?B?d1JHWXNydWRFQjB3RGUySmlaS3B4SHorNE41Rm5FVjVqa0tJNmFiaTN5NEU3?=
 =?utf-8?B?WHl5RW9IM3ZocTUvdmlvT0Z6S2NXbDE5dXRlcjNaMWNXZ1hMcE1UQTFmckdr?=
 =?utf-8?B?ZjNzT2NKVGQ1RXZ5M0dQSzRtRUNVa3ZVaEdycnFBRmU2YnBCbnd5b3ZGNDE5?=
 =?utf-8?B?TVltOWI0MzYvZ3k2WDgzc2gwa2xvQ3dHYlFYQVNva1hvUUdwZktyT09FSmU1?=
 =?utf-8?B?ZEZsOXdpdU9lQmZKK29aK1E3V3ptYks0YmxsNzFrdkFaK3NwVU9nZUF4Qktl?=
 =?utf-8?B?WVlrOU5pYnpHSnRQRElKbTFwWmluZVZnaDNaS2lsZG12WmhIWUo4bTZGaWwz?=
 =?utf-8?B?VEt1R1ZiOWZiYll6QnRCbHl2TDlTekU5c2xOVFY2RWNRWHhTYmZsS2JRM21z?=
 =?utf-8?B?QU1TNnFUOUlZcHc5eXdRV21RRDBZd3d3blMxSGFob0U0S3E1bUZhSEp3Q0xh?=
 =?utf-8?B?L0l6WEwybW5KTHBDVGxLclRKcm1GMHA4b0FOTlJTVUwwRHFWMkRrL2ZKUWRX?=
 =?utf-8?B?cndVYmNyLzhubnp4WU1sWjFUblJnL0FqRUtGODVJdTg0Vkk5UnkvdmNsYTZY?=
 =?utf-8?B?bkFhT0tTYm1ZYWNrekFGOTJhcjFUTkttdVpyd3F0NHR2cnFFUm1ZbGZGNnht?=
 =?utf-8?B?eHo4T1ZTM01SdFQyejJlSWJ5eHgzaEtQLzNIQ1FYa2pvZXIyY2k2VU5JK0Nx?=
 =?utf-8?B?dUV4THVnN1JRNmNsQjF4Y1RHU1lpUllhWjVtdklScmE3QWxZdTRRd3FzTXNQ?=
 =?utf-8?B?aEJDVVJZc1ZuMDlvcThZdkQ5SVFxeDd4Q1Z2Q08ydURyUjZ1WGFuRjZwMXNY?=
 =?utf-8?B?cDJURCtudEpEWDE0RzRwZFIvV0xGNmZqMjB5WmhtVHVyZXhHSlNCVVNYL1lY?=
 =?utf-8?B?R3hmT0VqSGNOYzJBYVB5cUNQL3RkOGpaZ256NFJxSVdWQmRtK29KbVd4K2gw?=
 =?utf-8?B?Q1NueHR5YnRTMnJPTVVBb2IyM2ZwYWNjd1U3dG9SQklQb0U2anZNQzJpQmRv?=
 =?utf-8?B?bXloQUxWWWZxR3hKRDY5ZExqRytyOWRFbW1zdUJ0cXRmL3JmekdMRk91aEVs?=
 =?utf-8?Q?vxAwVADUDR0EV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWZVOTc2TG4yeVZLR1p0S1Iza0VscC9EViszTHpDMDVrd28yVVRGakc4bmQr?=
 =?utf-8?B?cDVPRjZVZFh3cGNtcTVGa2xKbGozMGxxdy9GUnFVbVpoUmlWcytTSkdFVTJZ?=
 =?utf-8?B?a3AzRzB1RkVSSU1xbVNJY2tWaXJ4cmcvV2J2NUYzc3NTQVZNTnVYbm5XVFJD?=
 =?utf-8?B?eG9lSVB4UE1yQTJ5UGlLTWJCRlc2V3puOXpTbThzVS9IYkhkaDVwOWxwVENY?=
 =?utf-8?B?Q0V0TCtETG13VXlSempadDdvQ3IzT3FLRzdnVjkvdzNwaU44VzRHVG5yT1BL?=
 =?utf-8?B?ZnRxSWFKVzU5OTdqbkN3ZlI0WnJ1SHd3NExoL1Rtblh1bVM3YWJ1dS96eEVv?=
 =?utf-8?B?dENxb1RmNFBZMzRYV2MzeTRDbEhVNE1kcEV6OEk5NEtvRi95V1JCT2RXd0xG?=
 =?utf-8?B?MmJyb0poV1BaVEtLMnM5MThkejdjVmdpWkRYMnlTRlJlU3pWa0c0V2pFUmN4?=
 =?utf-8?B?OVZKWVpUM0lPNnJGK3VUeFZTUnd6Nm5ha3VuazIwMkVjRHhaNVdTOHVGTHJQ?=
 =?utf-8?B?d1FLOWR6OXlpZENLbllGZTVRNk5oKzc5Sit1RE9vcEJocEttNXZUZzVrM3JQ?=
 =?utf-8?B?OGd0OHZEUVdLdnZ2dnVjK0M1M2VRQ2lyNFd2azc3bjZuT0tZejUxaUtwNlRT?=
 =?utf-8?B?NzFST3pLVUVvZzQyNmEranVHQVozVGJNWTJwbkxZMC9oZGhEN0JxTUhmOVl5?=
 =?utf-8?B?QjZWZmJsK04rSmpwVzEyb0FxRk1tUDh1azA0REFqSXRVR0NzYi9FZDE1RUll?=
 =?utf-8?B?NG5randNQXNhdG9nVnlHSGZoNk51WXVSZnhqbU0rMTMxUWpPOEU0ZEtTTGp3?=
 =?utf-8?B?Z2NRbEk4cVlFS2lvZGdTVnJvY0gveVd1ZlZ1NTN2ZXZBck9xdVphSVJGdHFT?=
 =?utf-8?B?cmJycmFDUWlidHFiTHoxemJxa2NjTHFSK0M5WDZ4Sk1zbGhkTEhSYVAzY1VW?=
 =?utf-8?B?T1AyOEVCS1d5dkFiMnk0ZDFubmdUT1VPZ1IrcHBuMVBPNkRUZ2UwTllFNTla?=
 =?utf-8?B?ZVlXWnYyU3ZlU2N3bEpSK2VpNERFYzdaei85YndhUEtpM3E2VldxUXE5Z05Q?=
 =?utf-8?B?TUVIVzMrQUR1MjJ3QlNBdGU1bVZ4MHZtSEo4ei9aa3pVN0ZVaE5KOXduejht?=
 =?utf-8?B?M1AwMTUyMUIwUXJRZkZWRGV6Y0lUN1VDa2Jmcmx1elUxTVdaYWFGdm5XUCsz?=
 =?utf-8?B?anE2NXVEVDNLQ1UzdlN2RFdySTZvL2dSTDg0aE55Yjk2anJTcDlUSHU2R1Av?=
 =?utf-8?B?d2VVRUtSNXltQkM4V0c4TE10YWo0ci9iOEErUTZYNml5ODE4V2VnanVrTWI5?=
 =?utf-8?B?eVVrQlF0MUNPZ2dpUkc0TG56M1ZLVnFZdm1LRUVrZVR4SnJaOFdMZkI2aDJa?=
 =?utf-8?B?cUpBSUxCam9QUmhBejFCUFNPTWk5ekFYUmVJcklzY3ROL0U2aXdndEF4SUl4?=
 =?utf-8?B?Mk1zL3E2NnVHM2ZvajRlcGQwcDNTNDdVVzVFc3c4L2lFRzhkdktqaFM0dEtn?=
 =?utf-8?B?N2JVc01haHcxQW9uRDVwYmNzeEhINEUwcWlWLzdFdENKbUp0UWp5L1FMakhO?=
 =?utf-8?B?ZUROOUdFd1pNNWEwVmdHT2lqTWZkMUdqVTRHMm9RWmEwT0kzNlgxc0kwU0xv?=
 =?utf-8?B?V1hKWmtSQmlla0E3QWR6bEdraEd2Ym1CeVpweG1pSEFRbnhneXBIK1djUE81?=
 =?utf-8?B?QUNIeWlWU1MvSk5QL2J2QlJ2Uis3TlNMa3RXa3N1eVFNR0dqRjFkaTNCMHBi?=
 =?utf-8?B?RVNVc1ZWRTlwN1k2ajV6VCs4RFQ4OUZ2WnF2UXJhcWJDb0hvTmIwUjRDY0NW?=
 =?utf-8?B?TVdwZ3ozbzJPTU9lTHhUSUQwbExNQVlCVnlzNlV0WUJwd0UxQTdPYUZGeHBI?=
 =?utf-8?B?eWdBdjFEQVh1U2FNc2c4RjUxNEFzdDVLZDNYWGJObmt6T1cwK2F5aU9naVlo?=
 =?utf-8?B?WXBLODhrem95Snlqc3JZS0xWZEJaS0ZRNU13cFhiU2t4UEovcjhBN2ZhNlNo?=
 =?utf-8?B?eC9WaEtJaG1FSTF4djF5L1g5cjRmSUdKNks3R0t6YjdzWmVvZmg1RUNjRjhr?=
 =?utf-8?B?YUlOdVY5UFNpU2xUNStSdnN3ZmlOQURZWlNERTRURHYvOW50Vzh0Vm9mOTBx?=
 =?utf-8?B?SzJmQndEL3V4VDhzWWtqenRyRS8zaDJqNzVIM015MnArMUlyZlZPdnpJVXh5?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72da9309-7f88-4c29-5b87-08dd4788e546
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:05:44.6084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYzn+eyTg1stcfSU465MhnzqwvjnzDl7W357IgUAbhO3YeZuLvdzb0T29uxYOh8kk1+NepkJgbRSf6t16Wumpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7744
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



On 2025-02-05 1:41 p.m., pravalika gurram wrote:
> check if the VM is there when DRM_XE_VM_BIND_FLAG_DUMPABLE is set
> in the generated devcoredump.
> check VM address within the range
> 
> Signed-off-by: pravalika gurram <pravalika.gurram@intel.com>
> ---
>   tests/intel/xe_exec_capture.c | 64 +++++++++++++++++++++++++----------
>   1 file changed, 46 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
> index 55ec3d4bd..4eaa3f4d1 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -53,16 +53,15 @@
>   
>   #define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
>   #define START_TAG			"**** Job ****"
> -#define END_TAG				"**** VM state ****"
>   
>   /* Optional Space */
> -#define SPC_O				"[ \t]*"
> +#define SPC_O				"[ \t\\.]*"
>   /* Required Space */
> -#define SPC				"[ \t]+"
> +#define SPC				"[ \t\\.]+"
>   /* Optional Non-Space */
> -#define NSPC_O				"([^ \t]*)"
> +#define NSPC_O				"([^ \t\\.]*)"
>   /* Required Non-Space */
> -#define NSPC				"([^ \t]+)"
> +#define NSPC				"([^ \t\\.]+)"
Add "." as delimiter, that's fine.

>   #define BEG				"^" SPC_O
>   #define REQ_FIELD			NSPC SPC
>   #define REQ_FIELD_LAST			NSPC SPC_O
> @@ -77,6 +76,8 @@
>   #define INDEX_ENGINE_PHYSICAL		2
>   #define INDEX_ENGINE_NAME		1
>   #define INDEX_ENGINE_INSTANCE		4
> +#define INDEX_VM_LENGTH			2
> +#define INDEX_VM_SIZE			3
>   
>   static u64
>   xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
> @@ -177,7 +178,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_qu
>   	};
>   
>   	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> +	__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
> +				DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>   
>   	for (i = 0; i < n_execs; i++) {
>   		u64 base_addr = addr;
> @@ -287,10 +289,6 @@ static int load_all(FILE *fd, char **lines, char *buf)
>   
>   		/* Only save up to MAX_LINE_LEN to buffer */
>   		safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
> -
> -		/* Stop on END_TAG */
> -		if (!strncmp(END_TAG, buf, strlen(END_TAG)))
> -			break;
The target line located after END_TAG and is at the end of dump, that's 
why this search is removed. But could put comment in comment message 
about this? Remove search for something need some description, we don't 
want it to be removed silently.
>   	}
>   	return start_line;
>   }
> @@ -351,7 +349,6 @@ static char
>   				value = &line[match[target_index].rm_so];
>   				line[match[target_index].rm_eo] = '\0';
>   			}
> -
>   			if (key && value && strcmp(tag, key) == 0)
>   				return value;
>   			/* if key != tag,  keep searching and loop to next line */
> @@ -361,16 +358,44 @@ static char
>   	return NULL;
>   }
>   
> +static uint64_t
> +compare_hex_value(const char *output)
> +{
> +	char result[64];
> +	uint64_t ret_val;
> +	char *src = (char *)output, *dst = result;
> +
> +	if (src[0] == '0' && (src[1] == 'x' || src[1] == 'X'))
> +		src += 2;
	this is works with "0x123" case, to skip the leading "0x"
	how about "[0x123]" case?
> +
> +	while (*src) {
> +		if (*src == '[' || *src == ']') {
> +			src++;
> +			continue;
> +		}
> +
> +		*dst = toupper((unsigned char)*src);
> +		dst++;
> +		src++;
> +	}
> +	*dst = '\0';
> +	ret_val = strtoull(result, NULL, 16);
> +	return ret_val;
> +}
> +
>   static void
> -check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo,
> +	      u64 addr_hi, int tag_index, int target_index)
>   {
>   	u64 result;
>   	char *output;
>   
> -	igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VALUE)),
> +	igt_assert_f((output = get_coredump_item(regex, lines, tag, tag_index, target_index)),
>   		     "Target not found:%s\n", tag);
> -	result = strtoul(output, NULL, 16);
> -	igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
> +
> +	result = compare_hex_value(output);
> +	igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag, output,
> +		addr_lo, addr_hi, result);
>   	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>   		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
>   }
> @@ -435,7 +460,7 @@ static void test_card(int fd)
>   		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>   			  hwe->engine_instance);
>   
> -		test_legacy_mode(fd, hwe, 1, 1, 0, addr);
> +		test_legacy_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, addr);
>   		/* Wait 1 sec for devcoredump complete */
>   		sleep(1);
>   
> @@ -451,10 +476,13 @@ static void test_card(int fd)
>   
>   		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
>   			       "GuC", false);
> +
>   		check_item_u64(&regex, lines, "ACTHD:", addr,
> -			       addr + BATCH_DW_COUNT * sizeof(u32));
> +			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
>   		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
> -			       addr + BATCH_DW_COUNT * sizeof(u32));
> +			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, INDEX_VALUE);
> +		check_item_u64(&regex, lines, "length:", addr,
> +			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
>   
>   		/* clear devcoredump */
>   		rm_devcoredump(path);

