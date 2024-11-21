Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0586CE64007
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 19:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8E910E0AD;
	Thu, 21 Nov 2024 19:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBE7EOIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ECC10E0AD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 19:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732217253; x=1763753253;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=triAnL+qNrOsP1USp4WXcQXbXMotZt3IlnDICT2N6lE=;
 b=YBE7EOIQgdTv601b3+GRVgNfWYoliqeX9KdioThbZ3wrEa7tOMbsb6zC
 8Y3NqQ+42yJRZ5hcpXRC954r7QhsrgBfXuVRsh1ST6nhyMA7Ww9O6VF40
 m7sPfc9YZFTVCsnd9MllijGbDJ1P3WB7x0FSY2eVHmh3cmzB1K7CP7WyW
 F6J2oZSGXR/Q8GjXjKkyjqgGxMZrWX3PXINxT3jIbQKhdPpsUEG+n9rBh
 IvRpDhq3HRuC/DTdYQKzKSGEOiH08H/IRhFRHL4kdWDOgm2HVJFL/rBTO
 beIO33UvAbb4QHFBXCTQCLEToEDa963yZxaV/HBNArjpJzTKC0gMC52/t A==;
X-CSE-ConnectionGUID: KzkV4JALQ76CyUTc8eZyCw==
X-CSE-MsgGUID: ZGmvInmURDiPzXvkjlIbXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32499107"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32499107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:27:32 -0800
X-CSE-ConnectionGUID: baoNfVhnQtG1qlcEKdi7AQ==
X-CSE-MsgGUID: EL2kEz+CSAaWiHHVLxLKTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="127870325"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 11:27:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 11:27:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 11:27:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 11:27:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhqvKjdHVI7hTpOxV72oe28nbYfr7nXhw1gSuJ2uNhWrcfv5r+Xh5dbC9547/5LppEEpjJMJT4tQcI1gsA8k+IPvd5D1Y6tzpTmL8rQ9RxenkV80qXOh/SZL1mGilLh80L3MOAfChOczW6y/pMhZDaVfCyNd91xkFKNOQ4nYkwl1IHzh2k39pnkkiEOvAE1OdPxytgyw0QLnavWbJHUcrms8wggg2+jx92LPfEDwtoqA9RJU/TauyP3Zdearl+JOADCFwvcEa3VI8FJA8l2U1rRs6zmIg0tFWINQzXT02Oa6+5U3GPhDZX1AqfFThGvzqfsA9tqkIrnnaRhAgROotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijYvJbJTVq+JSZpWKUKp1aP7j2ML2OYmLORdI+bUkWw=;
 b=g9DhZU2D6M50ucaKJ6vQ68jbSCJ5X/zHtrP1+Flfc6LVo/6acB22R+2BJPdyAk+tz5S+bht+lYu2B+i4YepHj6O3+mC6ZMSC+CzXV7Y5yeWIL084SCZjalrzE6G1UpVj2ibNJEJEH2MdMrrkQlpTYHNrfcUIP2hVtSuGotZtsodoD9tEB8AAeeop3j3M5972KTfYU6lL6h/bjldftT74lvDhzxWGCF+k3mKS5V/n3bocXJQ06g/+VVkV0Nb0P7iOMKra4dGavux96sV/xC9hPJGSz34rTHkA81Ok+leVNm3VZT70gD0nfztOQHs587ks2i10373IFI196qVCnYCIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 19:27:29 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 19:27:29 +0000
Message-ID: <868e62f6-426b-4b26-9e56-eb596fd50409@intel.com>
Date: Fri, 22 Nov 2024 00:57:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 1/3] tests/intel/kms_fbt: Drop invalid tests
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
 <20241120104940.2147075-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241120104940.2147075-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 707fb297-3aca-4be7-fba1-08dd0a6289c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1g2WkF2MkR3a0xzU2tZY3ZDVnkyV3dHYldJc3ZOV2RGU3BSMVJWMlV6MlBu?=
 =?utf-8?B?SWVOZzE4RGdlSXNPc1FCeTdHRE5ZMTN1b0duR0VVU045dkptVjhUREN5STZY?=
 =?utf-8?B?ZWlzNGVYYUcwQTJzSTY5ZWdWREtPT3NnTDY0Qk53dVk1NjZsOHlZMU9YQmtZ?=
 =?utf-8?B?WmdQYzBnSVB5aFExcjE1TXZ1VzFmZ0cycTBSTWNiaDR4NG9jWEpXclpHRkp4?=
 =?utf-8?B?QWQ3d1ZGVmJMRWJXWmcyVDFxWWRiWXRsYi9SY2gxMVBDZDUxbUdSbzJFdi8w?=
 =?utf-8?B?U244Rnh6aDhXNzY0ekRpMXlJL1Q3akh3L3RRdEt1aCtJamh3TDZTVXZBRUM0?=
 =?utf-8?B?czI4YTZYMW9EdERXNmlEMHBmdnZHR2lkUWNxbDNSNkR0Y3prVGYwK3hqb3JL?=
 =?utf-8?B?ejQxMXFCdjQzdmkwRVMwWXFyV1FQUzhIZXMrMzBSV1o4NjM0V3R6RVFoTnhX?=
 =?utf-8?B?ajFSK3o5YnJjR1UzUUoyMjM2WjF1V21Zd3BPV0IrSjhCaWU0V2dIVHBaNGhB?=
 =?utf-8?B?MW42M2dFa05Tb3FiSDVzMkpDbmEzaVRmcEZxc2xCVDJhcjVjdHhTWnRMbHNM?=
 =?utf-8?B?TkpLNDFxM0VUbWlndjhHZmJPS25wM1JSMHdNUG9HekRxMEZMMU1ZTVRZbURF?=
 =?utf-8?B?UklsbFpmbE1iTnV3MjZxVVNjWW44NDBwVEY4a2t4QkpKQkk3cWdHQWlma3Bo?=
 =?utf-8?B?LzY4Y0ZEZ1hlOGtqOURPQXdyRGU4cnQvckk1WTZSOHNYaE5LTDZpYk5RTko3?=
 =?utf-8?B?dnQ3aEh4aXdvaXFoTnJvdnZBSGxJQnRWNTJlbjB2UWJFYTA3dmFQRGVmM2pK?=
 =?utf-8?B?TjNmNnNXaGdIWVBnYWx0QVkrYXNKRDdobEJCTXMwb0VBVnpPMXhyeGhNQzZs?=
 =?utf-8?B?QUdQQVhFYTEzRjBJd1FOSTI4bkpVaVlwejVJQW03QWRYbTRiY0hVK0lsZmRy?=
 =?utf-8?B?K3ViWi94SzRhc3BKSHlQUzA1VzRXMFdqNGN5OGFnaktYQ0RScXB6cXY2UUxw?=
 =?utf-8?B?WlRKblpJc24yeW1HSVRZRTJ5d2YrVjY5MG5aYTNCTjl4T0x0OHR2T0J3c3hw?=
 =?utf-8?B?VHlMUmV3eUVIWmNIS1JwZ3pPZ0RNTzhxMXNSUk1tSXM3eGxDKzVSd3hkUGgx?=
 =?utf-8?B?dzI4d2l1THUwZnUzTlpTZHBNMVpWQUhCbE5yRUpXOTdwcTdWaHpzTG5ENU5E?=
 =?utf-8?B?cVRjKzczZEY4VjhmUmIzc00yRmN6RGNFNDljVHRlVmluS1pEaDZnMTZhZUVP?=
 =?utf-8?B?ZDVyZ2pXWUJkOGJRei80RnpXYVFOK0lZSHpJNmJMeXJEdmdaUnB1ejlJNVMv?=
 =?utf-8?B?aVl2QTU3dVlPUnpiYWxWWEFtc3MraktVZE01TjFzSGNwa25yb1ZpVHlVSkds?=
 =?utf-8?B?dFB0NlVxdXlEZ0pqemI3R0ovQU8zZDFwTzI0VEJxR1pRaCtCMGZCelY1N1ZI?=
 =?utf-8?B?NUlURnlUY2tMWWtxdjBQbk1LMmNEc2l4YmhXWG1BVGdSOFNrVktpeWs4eENr?=
 =?utf-8?B?STlMUWpMRVhucVlNMUE3YU9aRUR3TkdKQVhQK2c4TVpSYzY1VHNkeWl0YmRB?=
 =?utf-8?B?T2xGa0x4dXZTL1NDZ1VkeUZBSTVjR0hEOGJsRURaUUJHWlkzNnYvckVIVmVS?=
 =?utf-8?B?cCtxcmlVek5VSVRJT1BLVGJQNWpjYURmWEJoMEhBSDl5K1kxdTlNb3hpbTBv?=
 =?utf-8?B?cm5wOTNMT24ycnlwbC9hSnVkdmpqbldFVmNFUVllRFhUclNiZTZVdksvN2kv?=
 =?utf-8?Q?6LINdNien11u9ob0nGH7oYo1j1SCBaXZ8e1tJo5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHo0cVNZUi9ZVHdRRm5lNDBvVXJWYTdra2tRMEh4SHp5NVFDOXhEU0dvRWRU?=
 =?utf-8?B?enlPcExCWXNiMjdyM0ZxdmV5WE5mVnJJa3IzNWJONTMxYjB4NW9wakZNc0tx?=
 =?utf-8?B?V0ViS0U4OFpmWUI0WnJQcDJ5OHpQQ1NYb2MrUHQwUTk4eklZNmNSaW1OVE5Y?=
 =?utf-8?B?Q0plUjFMd1c4a2ZuOVpWZTZIbkU1WU9vaVN2SE55NE53UTBaQmxvN3MyNHhU?=
 =?utf-8?B?b0pRVlUvcE8xRGw5U0VSVGVzUGhIbGdPRmszK0pIMVQzSEZXWXFKTUFqcWph?=
 =?utf-8?B?UGVxMDdYM1Z6WEhxbG9yOTN5dmZXeldUbWNCYUlEQms2bFZnWWdGYmppcTRD?=
 =?utf-8?B?R0NkTEFXenhaY2NKTjFVUGo5UVUvalkwbnZpVzNmUVB6MGd4QjMwNndBK1Bv?=
 =?utf-8?B?Nm1KcG00NCtzZmlWeDJqcG5hbGFaMXFKUDhDYVdPTlg1Um13TmxSRlF1QVFj?=
 =?utf-8?B?WWNoQVg2SmNycUNJeGRyZ0o5aVBLbTlYS1I0UW1UcVNJcWRRNEtLaFRrK0tp?=
 =?utf-8?B?bXlUZzlSTzBwQVJVbXF6SkRHMENXYmRuYjBkaFU0MUxCeDVXc2FOODMvNFVk?=
 =?utf-8?B?M1crbkNvbmJ1WkNRSzNpSm1Gc3E1NU1DQUdFOXpYQnhYelFwSUdSeTVhK2NM?=
 =?utf-8?B?TlhPVDkrd3I5cjIrMjNMT3ZRMHorUHJoWEVBZmNyL2lFZHE3ZXJFaGlZb0p0?=
 =?utf-8?B?eHRad1BMa1RhczFiYTErbmpnaEhlNUJ0UFYzSkl3cXBHeG0xa3ZwTkRyVS9O?=
 =?utf-8?B?WTBoUUMvV1hCYkJqL1F1RlJoNkwzMUUzZkErSlBDQ1hzTG9LSDRwUGExSmdj?=
 =?utf-8?B?dEdtalpqUG0wK1N0aFNGK1laZjY2WDdaMVdlNGN4cGx2Q29VRndhN3RhUFJv?=
 =?utf-8?B?T200a3RBZ1U5b2VuNE82U2xKWTJOZUVTdjloWXM3UXd2aG50YWpvL05VOHFl?=
 =?utf-8?B?STFtaThNWWFaamFpcldpM1Vjemo5U0JqRVJYR2dMQ1EwRW9sSkhDT0NjaWFj?=
 =?utf-8?B?cXV0SkF5TmswKzFYZHZtM3NTK1ZBSEttdGZPdlV0b3Q4SS91SXMvVzlrRHBq?=
 =?utf-8?B?UXF0VXV0WmNFOG43VHU3NXZhYzlLMDduaUxCeW96SkNDRjVBWmJ3RnNtSGdo?=
 =?utf-8?B?Nzl5cFk1VGdqS3llVmVram8zaHpTNG9ZSVlWR0ZHalJaclh0YkdpcmhxYkd3?=
 =?utf-8?B?VHloeWRKUjE2cVM3eW1vY3g2RTBjNUpNV3Vzb2lYUjNCS082TXRuQkpibVMv?=
 =?utf-8?B?amtZRGY3Y09wK3VkZk02aEFSYzVWTVFwNEFVTmFGaUdWMTFRT1kvZnh5ZGxt?=
 =?utf-8?B?QlllQXJXd0t2aEpFNmxQdzN1b21BbE5rLzVKMi91LzZ0ZFA1VVprNkNxY013?=
 =?utf-8?B?RlpKM084UFZsVk5DNSt4d2k2ZmFISGpYRDNkaVdFUTRXQlJsZDh0aDhrUFdJ?=
 =?utf-8?B?SFhkanp6MWpDeUM2YThQN29WTTJQV3B6elNLRTY2UWEwOWdyV1AreEE1SXFS?=
 =?utf-8?B?S0R3ZnRaN213Q0xTVm16MjROdS9RVnlwMDlTS2pJOGhKd0Ywenl3N2xIczlM?=
 =?utf-8?B?MUk5c2xzaXozeVJkem9sNCtiSlJMeU9hdEE3V2xOL2ViSmd4cVBVQnlxWnBJ?=
 =?utf-8?B?cDI3dWxkM3YwWlJGZjF3VjQzWjJUanNsRkl4T3puMnZSSzlYa1lDZ3VWTm8v?=
 =?utf-8?B?QUdhWHVQN2NLT1l4dkg3UjlYYkZqNWFZNkg3MFUyQ3hMekhhNlpROW1UTENP?=
 =?utf-8?B?L3JlSm02dU9jeHpXdGExVFdSYjgyQTl4WTg0Q3FONWVQUmc2eG9SMGdtWmcx?=
 =?utf-8?B?bW9ySHoxS08xdE5ZbnlqRjZ6OHlOaGJkbFM3cGI2K0FVdXd1UHdoT281NldL?=
 =?utf-8?B?VWNkeXAwY3VUUDVUNEhjRFJnUTBSR1ZpeTN6MEplM1hpbTFuYWk3UUEvNEZh?=
 =?utf-8?B?NHVtY2VrWWJNS2twNGpCcHhMS0RtZGk5U3BJRjFsQVNYZUFRM3paQW9jVGpu?=
 =?utf-8?B?SENZdzhDNjVZV3NWRW4wUUtSQzZ2RE1XU3JKTTI3NjhMU0wxbUpHc0JuQnBP?=
 =?utf-8?B?ZDlFbXlrcWZMcUlWdHpIZjV1TU5uOVZCY1JlS1pEaWNWQ2RMV3lsTXNGR21H?=
 =?utf-8?B?MURyRk1Sc3NZZWtSOFJzREh0MmJYMFZWVDJYVS9DalhFbnMwR3NIN1ZTekMx?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 707fb297-3aca-4be7-fba1-08dd0a6289c4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:27:29.2522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz0dJDG7AKv33e9s7Btrccw8j8ZFfLZ0bYQ+oyER2ypPACkU0xGRVK4v6XWlsFd4LRGXKr3T2pENzL+RCWblvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-11-2024 04:19 pm, Bhanuprakash Modem wrote:
> As we can't test PSR & DRRS together, drop the tests those
> are with this invalid combo. Also, no need to maintain
> blocklists to keep the CI smooth.
>
> This patch will simply drops below tests:
>   - igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 255 +------------------------
>   1 file changed, 7 insertions(+), 248 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index f149be3da..e41ee0a80 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -81,14 +81,6 @@
>    * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-rte
> - * Description: Sanity test to enable PSR & DRRS with %arg[1] panels.
> - * Functionality: fbt, drrs, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-rte
> - * Description: Sanity test to enable FBC, PSR & DRRS with %arg[1] panels.
> - * Functionality: fbc, fbt, drrs, psr1
> - *
>    * arg[1].values:   1, 2
>    */
>   
> @@ -113,14 +105,6 @@
>    * Description: Draw a set of rectangles on the screen using the provided method
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @indfb:          Individual fb
> @@ -159,16 +143,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-1p-offscren-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @indfb:          Individual fb
> @@ -207,16 +181,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -253,14 +217,6 @@
>    * Description: Draw a set of rectangles on the screen using the provided method
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -297,14 +253,6 @@
>    * Description: Draw a set of rectangles on the screen using the provided method
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -340,16 +288,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -380,14 +318,6 @@
>    * Description: Draw a set of rectangles on the screen using the provided method
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @cur:            Cursor plane
> @@ -427,16 +357,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @cur:            Cursor plane
> @@ -471,14 +391,6 @@
>    * Description: Draw a set of rectangles on the screen using the provided method
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @blt:            Blitter
> @@ -512,16 +424,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @mmap-cpu:       MMAP-CPU
> @@ -550,14 +452,6 @@
>    * Description: Draw a set of rectangles on the screen using alternated drawing methods
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    */
>   
> @@ -582,14 +476,6 @@
>    * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @rgb101010:      FORMAT_RGB101010
> @@ -628,16 +514,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @rgb101010:      FORMAT_RGB101010
> @@ -666,14 +542,6 @@
>    * SUBTEST: fbcpsr-slowdraw
>    * Description: Sleep a little bit between drawing operations with FBC & PSR
>    * Functionality: fbc, fbt, kms_core, psr1
> - *
> - * SUBTEST: psrdrrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR & DRRS
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC, PSR & DRRS
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
>    */
>   
>   /**
> @@ -697,14 +565,6 @@
>    * Description: Just exercise page flips with the patterns we have
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -740,14 +600,6 @@
>    * Description: Just exercise page flips with the patterns we have
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1]:
>    *
>    * @indfb:          Individual fb
> @@ -776,11 +628,6 @@
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
>    *
> - * SUBTEST: fbcpsrdrrs-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -810,14 +657,6 @@
>    * Description: Just move the %arg[2] around
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Functionality: drrs, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - * Functionality: drrs, fbc, fbt, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -847,14 +686,6 @@
>    * Description: Just move the %arg[1] around
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Functionality: drrs, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - * Functionality: drrs, fbc, fbt, psr1
> - *
>    * arg[1]:
>    *
>    * @spr:            Sprite plane
> @@ -882,14 +713,6 @@
>    * Description: Just enable and disable the %arg[2] a few times
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Functionality: drrs, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - * Functionality: drrs, fbc, fbt, psr1
> - *
>    * arg[1].values:   1, 2
>    *
>    * arg[2]:
> @@ -919,14 +742,6 @@
>    * Description: Just enable and disable the %arg[1] a few times
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Functionality: drrs, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - * Functionality: drrs, fbc, fbt, psr1
> - *
>    * arg[1]:
>    *
>    * @spr:            Sprite plane
> @@ -954,14 +769,6 @@
>    * Description: Put a fullscreen plane covering the whole screen
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Functionality: drrs, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Functionality: drrs, fbc, fbt, psr1
> - *
>    * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
>    * Description: Put a fullscreen plane covering the whole screen
>    * Functionality: drrs, fbt
> @@ -982,14 +789,6 @@
>    * Description: Put a fullscreen plane covering the whole screen
>    * Functionality: fbc, fbt, psr1
>    *
> - * SUBTEST: psrdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Functionality: drrs, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - * Functionality: drrs, fbc, fbt, psr1
> - *
>    * arg[1].values:   1, 2
>    */
>   
> @@ -1014,14 +813,6 @@
>    * Description: Try different primary plane scaling strategies
>    * Functionality: fbc, fbt, psr1, scaling
>    *
> - * SUBTEST: psrdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Functionality: drrs, fbt, psr1, scaling
> - *
> - * SUBTEST: fbcpsrdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - * Functionality: drrs, fbc, fbt, psr1, scaling
> - *
>    * arg[1]:
>    *
>    * @indfb:          Individual fb
> @@ -1048,14 +839,6 @@
>    * SUBTEST: fbcpsr-modesetfrombusy
>    * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
>    * Functionality: fbc, fbt, psr1, scaling
> - *
> - * SUBTEST: psrdrrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with PSR & DRRS
> - * Functionality: drrs, fbt, psr1, scaling
> - *
> - * SUBTEST: fbcpsrdrrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & DRRS
> - * Functionality: drrs, fbc, fbt, psr1, scaling
>    */
>   
>   /**
> @@ -1078,14 +861,6 @@
>    * SUBTEST: fbcpsr-suspend
>    * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
>    * Functionality: fbc, fbt, psr1, suspend
> - *
> - * SUBTEST: psrdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of PSR & DRRS
> - * Functionality: drrs, fbt, psr1, suspend
> - *
> - * SUBTEST: fbcpsrdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC, PSR & DRRS
> - * Functionality: drrs, fbc, fbt, psr1, suspend
>    */
>   
>   /**
> @@ -1113,16 +888,6 @@
>    * Description: Test drawing as far from the fence start as possible
>    * Driver requirement: i915
>    * Functionality: fbc, fbt, kms_core, psr1
> - *
> - * SUBTEST: psrdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: drrs, fbt, kms_core, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - * Functionality: drrs, fbc, fbt, kms_core, psr1
>    */
>   
>   /**
> @@ -1137,10 +902,6 @@
>    * SUBTEST: fbcpsr-stridechange
>    * Description: Change the frontbuffer stride by doing a modeset
>    * Functionality: fbc, fbt, psr1
> - *
> - * SUBTEST: fbcpsrdrrs-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - * Functionality: drrs, fbc, fbt, psr1
>    */
>   
>   /**
> @@ -1159,11 +920,6 @@
>    *              basic drawing test, else set the mode & test if FBC is disabled
>    * Functionality: fbc, fbt, psr1, tiling
>    *
> - * SUBTEST: fbcpsrdrrs-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - * Functionality: drrs, fbc, fbt, psr1, tiling
> - *
>    * arg[1]:
>    *
>    * @4:              4 tiling
> @@ -4369,10 +4125,6 @@ static const char *feature_str(int feature)
>   		return "drrs";
>   	case FEATURE_FBC | FEATURE_DRRS:
>   		return "fbcdrrs";
> -	case FEATURE_PSR | FEATURE_DRRS:
> -		return "psrdrrs";
> -	case FEATURE_FBC | FEATURE_PSR | FEATURE_DRRS:
> -		return "fbcpsrdrrs";
>   	default:
>   		igt_assert(false);
>   	}
> @@ -4441,6 +4193,8 @@ static const char *tiling_str(enum tiling_type tiling)
>   			continue;					   \
>   		if (!opt.show_hidden && t.feature == FEATURE_NONE)	   \
>   			continue;					   \
> +		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))\
> +			continue;					   \
>   		if (!opt.show_hidden && t.fbs == FBS_SHARED &&		   \
>   		    (t.plane == PLANE_CUR || t.plane == PLANE_SPR))	   \
>   			continue;
> @@ -4480,6 +4234,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
>   		if (!opt.show_hidden && t.feature == FEATURE_NONE)
>   			continue;
> +
> +		/* PSR + DRRS is not a valid combo. */
> +		if ((t.feature & FEATURE_PSR) && (t.feature & FEATURE_DRRS))
> +			continue;
> +
>   		for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
>   			t.screen = SCREEN_PRIM;
>   			t.plane = PLANE_PRI;
