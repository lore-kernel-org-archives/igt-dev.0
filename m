Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300D606A32E
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OR7PRERN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OK4CvbuZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F14910E008;
	Thu, 26 Nov 2026 05:56:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127310E089
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 05:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795672538; x=1827208538;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J2y1HXw4PSsOrgUKai4w/x/krmt2c2ulAMw1NqJGZW8=;
 b=OR7PRERNRjLrKBpG2mIoC9iy8mqR6wl5OlOTpOjjAQkvx0/RrQV0k4HQ
 1tpzEKzJjRTIwPgbdeT79jgP/HjqdY0BtCHT3HBxU/arHxGsth0DkKR/K
 Y9THvoiR4zg7JIbg0vlY0vViCRoNwYSv7Id6f8RDdzlGL1NVAEa+rYFEJ
 6iGrWIi3BcbR5JYFkF4viLEFGnVGEj8RJUmBId/l0cI/mEBsw/p0M+A7k
 fC4bWTNebRWfTrtoM4FJwNCLqop6eAron/qlvWxNnKqvnAu7cRoWv6vYe
 D1ecRjXbCPAA433B/AmuySnLic6ZFgghDs45LugLuv/KYxWnh0RLnBoKp A==;
X-CSE-ConnectionGUID: eho04PknTcuMZ9vIGlioAA==
X-CSE-MsgGUID: KK/EmqLpR1Wj+prpI7cu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4479448"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4479448"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:55:37 -0800
X-CSE-ConnectionGUID: 1imoxwbGRqeJjDpDbB2rOg==
X-CSE-MsgGUID: oIDwayUMRda35ZULrn0l3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="13764033"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 21:55:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 21:55:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 21:55:37 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 21:55:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyGEN8lzeVTL+JYTgFgJIaD7d+2xdMQ4TStg8CjHS3ROeaUuWBs3yqtH2rk20xCv5D0AWl/lkD0dmHbUTQtpbLnjDzSJ5T2x3rfl9sRO5Q/SntauHDbit4iMgLlULsyped8BB9nMXXVJ3RPD+z66WNWrwl+4yL941yUFmtGs0vYCCBOkKkbLKFvLh3sEztREnDyfLh45G+3JQGT47xLQ9ATAEQfXU8/CIRHbgFJmpKq2PtE9pdVJPiLpVky/MBsPSDx6+Ue3GWYcjEt7HPOi8oqTNGt5SqFwNfgtT0v9XuA3XS+v9fnZtlUNbi/I5FmsIUvI3odPLbShJvvNbPSFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gntwrhyCtKCgGdX5O2Z3eClQLNjPOg2P/UinUIm5xY=;
 b=n5PKpRpO2Scxau9qiull9nm2oOsJ87xRkGqWujoRh5npbeoSz2Yyx7IZpoVcWvdFbxMJYwQOUOEQik/Blga45uyCqzHbozk1xmvunhTmHLHYyrIUCaM0Z2OjOdwm5Vq0t16FOVDAgeJF9qVjhVjjHgkePzFqePb/H7OY/pEtqIxRArqbUfMhLS3/uljhcoRmNOWFcNrTUXPmRSShkSKN/SwjRRQxnansq0o7p8YxrwZTdhUyoKivBkFrYcdhc4DbPwWmYxwfShYi1dsyqxA/HVN8VG2Dk/e+4ybHd81Pt4nRgrV+/918jlpXvJw9BN6TMJKePDfLMELccKCEgmrfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gntwrhyCtKCgGdX5O2Z3eClQLNjPOg2P/UinUIm5xY=;
 b=OK4CvbuZHtJpTC5yi1EM6nc+7HoZJLWxz3z5biCoFe0frUt7LhcePIXV8kmaZ5MV0VN7zBPNJ7p9i4PG6hD1y0uBFKnD6sR2nPqubD4CgB5By56bPx2D6ETxWRB55/704fig76IJApXIGytFRKBU+77sxuzOm8vDSpBEjRpbOEM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by DM4PR11MB6041.namprd11.prod.outlook.com (2603:10b6:8:60::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 05:55:29 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 05:55:28 +0000
Message-ID: <a1b6e4de-b536-476b-bd15-bbadb6f3960b@intel.com>
Date: Thu, 26 Nov 2026 11:25:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] tests/intel/xe_oa: Check vm_ops->access on OA
 buffer mmaps across unbind
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <harish.chegondi@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
 <20261104005505.3232485-15-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261104005505.3232485-15-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|DM4PR11MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1ec25e-54e9-49e8-2a37-08df4b81dfa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|4143699003|261026140227099003|11063799006|10067099003|261026121527099003|261021121427099003|261022105027099003|261102123227099003|261022113327099003|261021123027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: 11p4pOJjyD1ZcfJT9hLco2PnvWp/PiRjMMJaqKT6kPBSwqQu1WlzcWcUYM5ThfoPmHezkOOJE0XbS0Tb4x458jZC2hra79BEY9JMf0DozEPksfNpuMTJ75WnKuUdQC4GlzAtEf+9g/L92Y2BCp1UAcMa6vFuKCqM9/W/oW5WUza4vV5xru0zzJjD0r0X+D0IR9hlhWlRHMJZOQG1h013kJBJc9vfkSebVa2PbYacYNdBOFkcyqHremYjL+pmpLVXo6FqlJxV2G9aj/62jHrYGO1cqk4b1bLXAVj7sxZEtzgDQIZSYUsQHmj8y3UrnpewETuJyhihANXeRiRfc1BnP2U5uj/X3Ixv2Hc+ZnA6mcUDkMP0Q2n2kaW3wuQ7clbEHFgyjBshPdn0NuyvX5J4SpBicYZBLySgD0NpnN6Yd/SxqXMxhxNWliodAh3JTBzjZk78CBfb+y5ay9SqLkDvIm7u/DKUQyEmQ6U93w6b/O9QlPhV2Ek7dTxnd1epyaVUkO4pBTizndy3QbngE3a/2M1xLyi97pcQSiN4uyfCaukbPq/sOk3NW6TIfqXdeZpRHdSct71FI1je8Chjph34RYeXSri3ws3sPj7UJx48QZNqykqoaYb4crfYO0OdhKaRODd8Y27EVTK79/bKNz38Bfc6DWnpiow26zzVqSJ7lhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(4143699003)(261026140227099003)(11063799006)(10067099003)(261026121527099003)(261021121427099003)(261022105027099003)(261102123227099003)(261022113327099003)(261021123027099003)(261022075727099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3AyMlUzN1gwRFBQOHA0eW9lQmhzd0R1SXh1eVNaVy9iODc1UzhGb0swQnNj?=
 =?utf-8?B?SUEyaUZQaXhaR3hPQ2ZCWkRzRmtwMldCa3NMdEozKzZYM01sUWxOcVZLSDRN?=
 =?utf-8?B?MnYxYTdkUHJOV0RQSmI1bjZNdmk1ZkhiRHBhYW5NNnhNUXpuYVZHTjdISDd6?=
 =?utf-8?B?eXhJcG9uNmozM0FKTEwraGNYUmR4c2VERzU1Vm9uOTVWNElZck4xRnA1aG9J?=
 =?utf-8?B?RFlYOWF4WkpDZ1FoNW0vWkQwb2tMaGs1bmNQOGQzdkw4NW1XMGFNbjFRV0o4?=
 =?utf-8?B?Y1VaVVI3S0ttbVB5ZUdzSlJsdENHcjBrajZGSGUwMUdvZVMyd3ptTUYydDg0?=
 =?utf-8?B?SmZyM0JQV3gyNGNVZTMzeFQ1ZmdCbW1FQWwxUWhzcXAvamIvY2M2SDZzZk1r?=
 =?utf-8?B?U2tLSDNiMXppSWprVHlKZkd4bGxnZG9ScXNnQ2ViT2JjY1lQekVVZFhFcHZT?=
 =?utf-8?B?L1dVNW16WEtXM3VRVDJLWmhsdHBrZ1owMVNPZDNwMDcrY081cGxsTndjaFll?=
 =?utf-8?B?RlY4UEswQWZZL3RmcStncFdxbjZ6Z2R6bGFBRkh4SXd1a2dScVBuQ1h1VnNN?=
 =?utf-8?B?b0FMejNDQU9DZFhMZWxZd1dIcW92cTI4TTEvNnloZ2x4WWd2VjNqTmFzUlR0?=
 =?utf-8?B?ZzdoTzl4TzJmL0ZCYVlIZHUxMnVZbzNmSS9xSnFpSnc3MWFmVnpMSU5yTmdS?=
 =?utf-8?B?ZnBWRHZ6Y214enUza3FySnJyNnRmbk5HMXc5ZGVKSlZid3NQTGtPdnc1Wlg3?=
 =?utf-8?B?QnlhVHNLY3REVlE2ckhNK1ZxVkJ3a1UvQXc5Q2krMzlVSWgyN0hQeTVzUzRO?=
 =?utf-8?B?c0RzMEhLTzNiQ1hHV0QyWm1BSUF6amU2ZU1EOGtZWGlZSUloNzcrbHBOMy9v?=
 =?utf-8?B?VGdFRm9ZRDZKMURsRy9BM1F0WjZIN29EcC9hak9KSmZnalFPWDJaN3FrbDNG?=
 =?utf-8?B?SGxuMG1kRThRRTU3V3J5QVpuUFQwYy9jMDdUVFBHaFI0amttTldLNGZJOW9C?=
 =?utf-8?B?eGNWU0RwaHN0TDdoQW5GREZIM09iSkpnRlk0ZzdZaHJwMG11VlBNdW9INWNa?=
 =?utf-8?B?RjlDRTRWUzJNQkF3aVpSNjFXUVBZMklpNUhVOVo0VmVUMmJNUEVidFBXc3Ja?=
 =?utf-8?B?b1FtVnlOcWE0TFdxNTlYeTJKVTBEZERyOGpxeHhrQnkrcEdMUWlKOUs2c0tn?=
 =?utf-8?B?aUxHREtXN1o5a0tmalpnY29pV1ZVemt2UFNNWGJZZUt5QzlySG8zbytNcVda?=
 =?utf-8?B?STU2TVlVcXF5YUtzOEltMlJwcTRZUVVKbXlHNWxkcGx6MHBNNFhVWk9KN2Yz?=
 =?utf-8?B?ckhWWEtkSitGVU9FYis4U0ZCamx4bVFkclFRZzdXVWVvcGtrb3RiZE5mdU0x?=
 =?utf-8?B?MWh2NWNVMVlwT0h4VXEwbThNNk9CSVVFNTQ5R21YVGpBeWV4NUFyUy82OTJL?=
 =?utf-8?B?a0t3SDBoUm90M1dZVnBjL3M4UFl5dlZVKzF3cFVRN1M5MFFsSHJzWDRncGZH?=
 =?utf-8?B?SGpQODE3ZnA3OTBqeUFVVXJUbkxVQUFqd1JHSGhLdDI2Wm9uTWt3MWVkZ05U?=
 =?utf-8?B?WUpmUlY4eVM1Sm1WMzNVQkdJb0haQVY0RmY5dVJkeklTRTByYlJjalIzb2k4?=
 =?utf-8?B?MCs3RkJmRVNlY1Z1RUxjb0s4RjdaVmE1c1RZOURQNm9uWlpqbytnZ21Sai9n?=
 =?utf-8?B?Z2M5b1l4MFJNQ2N5dExwRDFJLzZreElPOENWK085RktVZElTellXc3EwL3pB?=
 =?utf-8?B?TFRaMThkd0pPcHlVSWRUditmaWNFbTlwcEtZR3FJNEJJaWM1UWt5QWxGQ0hr?=
 =?utf-8?B?SzFydWh4S3RPd1ROZHRFUHVlejNscHRMVjkycm1Ob2ZwRW50SGdNN3lKU292?=
 =?utf-8?B?NDF0OVVLclM4eW9DWXNOdTFDWHcvMUI4ZFQ3VklMVmtubkVGWVE5bHJBYVZL?=
 =?utf-8?B?U213YTRiZFVKUjB3SW9VUnpJSWtnZnZ2NmRITkNXUm5PRVJFSEtDbjlhVWpi?=
 =?utf-8?B?KzFZV2s0amk2Wk1LZHpNU2pQYmtxWkJndEoxREMydXd1NGRaN0U1U0JKMUs3?=
 =?utf-8?B?SUR0WVJmQjFlV1BHR2tXL0ZMb0ozbHRCSjg4OW0rWHVtWXdvMngxZjdBNGEz?=
 =?utf-8?B?ZGZhTmgxV3F6dHlJOEVZZHpNSk9FTkgxWlZtZHQwalcybHZ3akdBQllhV0FF?=
 =?utf-8?B?RytXWnVnMzRkV3ZIaHU2UDhuc285NnhMZDdZZ3NUUWhxU1lzYlVGWTR0SDkw?=
 =?utf-8?B?ZE5EbkhNMWRQZnZpdnB1KzdJaCs5TzlzalcyeEdDTDFLd2h2a2tPZWkxODRZ?=
 =?utf-8?B?Sk1LS25yRFIrbXRueVBGaDlaL3lvR1FPQVZGN2dqWU0yZnVORWFkbUVrM3Mx?=
 =?utf-8?Q?B3NrfkSQ+7xHmNlE=3D?=
X-Exchange-RoutingPolicyChecked: nJt3Y+6+tnTR3KjMeRcV66c4Bk6YDSAyy91sliuoqEDkvoTuk68jh/qLDOPkhqTxdE2zzDtiUmHqXtJWPC9JcciZiqJrwjjJgGF57UBzGHAr4h4SPaWKNeqCzZs9K+d2RPIPDk3YtI9mhj0OrrT57QZVcDR4grOBnwnuMBqB3/QIwxg1WvvfJxtYwfqxdOp6WwH6slug3oFuYim2bNkKLL7Y77oP3uvDddXUZxEhh2JBIMwJZS5PG94MeCUy0OTUX9BQXBy+nzaG8u/X5dJCmP5ttbQu9u1xadZKjHcH5Zk1NACqiU7ZcHO3HyVQglOmG12x4J+04j5zU0nKV7wdPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1ec25e-54e9-49e8-2a37-08df4b81dfa3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 05:55:28.8314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rneOpQwPaz/DtTxsANu0dZeIpCnULpsIvFjQ5l3ULBlgiBQvfLrQ+ksxzJegkoj0MXX/dqfEubzmVqVNcwRQ/7YpSLS13HHXgGk/6VprW88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6041
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/4/2026 6:25, Umesh Nerlige Ramappa wrote:
> The OA buffer mapping is VM_PFNMAP, so reading it through
> /proc/self/mem goes through the vm_ops->access() of the mapping. Check
> that this works before unbind and fails with EIO after, since access is
> refused once the device is unplugged.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_oa.c | 38 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 36 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index e4b63c982200..8474d506612b 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2831,6 +2831,26 @@ static void probe_stream_after_removal(int fd, const char *when)
>   	igt_assert_eq(err, ENODEV);
>   }
>   
> +/*
> + * Read through /proc/self/mem. The OA buffer mapping is VM_PFNMAP, so this goes through
> + * the vm_ops->access() of the mapping rather than through its page tables.
> + */
> +static ssize_t read_proc_self_mem(const void *vaddr, void *buf, size_t len)
> +{
> +	ssize_t ret;
> +	int fd, err;
> +
> +	fd = open("/proc/self/mem", O_RDONLY);
> +	igt_assert_lte(0, fd);
> +
> +	ret = pread(fd, buf, len, (off_t)(uintptr_t)vaddr);
> +	err = errno;
> +	close(fd);
> +	errno = err;
> +
> +	return ret;
> +}
> +
>   static bool mem_is_zero(const void *vaddr, size_t len)
>   {
>   	const uint8_t *p = vaddr;
> @@ -2868,6 +2888,7 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
>   	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>   	uint64_t fmt = test_set->perf_oa_format;
>   	struct drm_xe_oa_stream_info info = {};
> +	uint32_t val;
>   	int n = 0;
>   
>   	s->oa_unit_id = oau->oa_unit_id;
> @@ -2899,6 +2920,9 @@ static void unbind_stream_open(struct unbind_stream *s, const struct drm_xe_oa_u
>   
>   	/* Fault in the mapping while the device is still bound */
>   	(void)READ_ONCE(*(const volatile uint32_t *)s->vaddr);
> +
> +	/* vm_ops->access() works on the mapping while the device is bound */
> +	igt_assert_eq(read_proc_self_mem(s->vaddr, &val, sizeof(val)), sizeof(val));
>   }
>   
>   static void unbind_stream_close(struct unbind_stream *s)
> @@ -2931,6 +2955,8 @@ static void unbind_stream_check_live(struct unbind_stream *s)
>   static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
>   {
>   	size_t page_size = sysconf(_SC_PAGESIZE);
> +	uint32_t val;
> +	ssize_t ret;
>   	void *vaddr;
>   
>   	igt_debug("[%s] checking stream on oa unit %d\n", when, s->oa_unit_id);
> @@ -2944,6 +2970,13 @@ static void unbind_stream_check_dead(struct unbind_stream *s, const char *when)
>   	igt_assert(mem_is_zero(s->vaddr, page_size));
>   	igt_assert(mem_is_zero((uint8_t *)s->vaddr + s->size - page_size, page_size));
>   
> +	/* vm_ops->access() on the mapping is refused once the device is gone */
> +	ret = read_proc_self_mem(s->vaddr, &val, sizeof(val));
> +	igt_debug("[%s] /proc/self/mem read: ret=%zd errno=%s\n", when, ret,
> +		  ret < 0 ? strerror(errno) : "-");

In patch 2, and even in this patch (at the top), we're always saving 
errno.  Can we do the same here?  Like, err = errno?

-shekhar

> +	igt_assert_eq(ret, -1);
> +	igt_assert_eq(errno, EIO);
> +
>   	/* New mappings are refused */
>   	vaddr = mmap(NULL, s->size, PROT_READ, MAP_PRIVATE, s->fd, 0);
>   	igt_assert(vaddr == MAP_FAILED);
> @@ -2986,8 +3019,9 @@ static void unbind_rebind_recover(void)
>   /**
>    * SUBTEST: unbind-rebind-stream
>    * Description: Open OA streams with mmapped OA buffers and test the effects of unbind
> - *		and rebind: streams die, mmaps read a zeroed dummy page, no new streams can
> - *		be opened on the removed device and the device works after rebind.
> + *		and rebind: streams die, mmaps read a zeroed dummy page and refuse access
> + *		through /proc/self/mem, no new streams can be opened on the removed device
> + *		and the device works after rebind.
>    */
>   static void test_unbind_rebind(const struct drm_xe_oa_unit *oau0, unsigned int flags)
>   {

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

