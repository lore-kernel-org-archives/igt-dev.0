Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8342C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 05:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE73E10E00E;
	Tue,  8 Apr 2025 05:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4XJ68nH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC9B10E00E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 05:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744090950; x=1775626950;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3bV56S8D6gsKUzTvC0eLNqSvIq2fJUIz14liSHi4P7g=;
 b=f4XJ68nHFep4zY8I4MjCGpiQIFsMJLVJv+LqmkcyagvoVJJ5q7gWgnsz
 BNUgU13u+OmpUeMXyhfAw9XvTq5KlEQiXqNLLVt6jxcagSCxaUob8seGZ
 M90vPM3ofpvtliMt15tif/PSoxXw+Pwp84StRvf/0HZMsldZIVJWQwyhi
 8+2dyXcxVFAhZDw0UsUWyIElYDxPGmcxGVQTPrDGItrGD8NxHw6mlG18M
 vS02NLg+24R6ZOeRBXcM8/Xnw2Gc/c/25ozPi8lYhVOMAiJWXDfYI+mNT
 V6wRpbl1ZWB1O0SkvNRX6h2lbIkX8Y9fIkY9MMXcMpMYnBUYzYMv6IEy5 w==;
X-CSE-ConnectionGUID: K0+gekBSTPOO1PF4WEfoHQ==
X-CSE-MsgGUID: 91OzpuORR0OUvGIv1pYR5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45638608"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="45638608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:42:28 -0700
X-CSE-ConnectionGUID: 79Fth8DMTaiQuvd6NOmB6Q==
X-CSE-MsgGUID: 7wEDuG2kT9yh9ZRUU93Ikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128034006"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:42:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 22:42:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 22:42:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 22:42:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozMrc20lneeoU1Oxk0vH0BzVsfiMh5um9M9ZDrrFZ6ofZdmS7FiDwPn7ggSv+9RO18MmYpN5ts/t2mUP4Zo9OB/y/VyHBqbcjMm0EtsSA/aZ2CCTEqC8B1yg28hlVaDAourUryOuLiuhfbivGRIUvganwZgHGg1pCMD9pFnb8ClyIW3ZQKuxlC2vKDkRtgSGLuV7Z2cr0z3689zp/LRWy2JTEzgJM2/cTWcQv31Bi0QOR74RAmMEpRaHVfIuPpSXZMQa5ZDjH7T+6LfkFtiEbEuvzoKR9eirQpt1jDlo7zelgZ5xiqsgfVtlQKh9eIWYtSo04F4AyG45UymP2/LdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEsUMw2jcY7YN7YG/tTudKwAhqr9qQNxr9xiokL3ZrM=;
 b=COdGjwyUUI+se2tK1V2zEnJ9a/SMRHoukxc0Kbnrwnwd0Ht5/cbZC814lz47unaePUnDrw5j0s9NlptU4Z61ohR77O3T8CvBISFfjnVW7G03KFBcf8PBKy4TPKg+UDxjfAxtPAA/4VCp7rk6lVMHgLh70CWbT8Z/0LiOtTvVveeWmynve3Zb0T2xypEoF+PNcHd9JN1BgjgQgsSXdWVCxdkg6dw1R02HK5QFE5vhGpeXF6iIMyd8T6HDb8O8SF/K+g0J+Jdit/T3k0C7VfKGDciTsOTgtapvjadfm5bcV6/rhiiZaoEXqh9APBE1qwAFvWUN62xzz3RwIQCjTX+Dkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA3PR11MB9399.namprd11.prod.outlook.com (2603:10b6:208:577::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 05:42:24 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 05:42:23 +0000
Message-ID: <2840052c-5312-4965-8703-5a2f0dd99112@intel.com>
Date: Tue, 8 Apr 2025 11:12:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_plane_cursor: check for display
 before cursor size
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
 <20250407144504.2907700-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250407144504.2907700-2-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA3PR11MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 206f3a2b-403b-498b-6ec6-08dd7660230c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm43ZHN6M0x2cDV4U0R5azVKcEZoUjBhOXVCeC9aNkVtNXdzQm5OQ1VoM1Nr?=
 =?utf-8?B?bmgvM1E1TnhyaXo3UThCZzBVdXpqamk1VGtnNmtYcGk2QzJZY1djNWtHSThG?=
 =?utf-8?B?ZkQ3blNKTGQrWlNzK2VYYjllbkFXcWRXckJJTXpUdzUyazNrR0k5R0hoUElz?=
 =?utf-8?B?SjNNTjdTdWZUcmowNG1sUHZKYWxDcU9CTzdVZHBnSUV0ZGppVnNyQUc3QjJr?=
 =?utf-8?B?RlhQaEk2MG5sWjZjckdVdjd3ZWlITkpFNHpJa0ZaalBYdjZRWmNIVkh5bDVU?=
 =?utf-8?B?d21hb082SDQ5N0tNaU1HZXhBNmkxOWIzNEhnSElJMG1JMVZ4dWJtdVdlWEFK?=
 =?utf-8?B?cXNsMEQwanZmSURhc1lJckVYNUFuTUkwUVdtOTVmdndsbTNjUm51VnhEL0JF?=
 =?utf-8?B?ZUEyWVJGN2ZIN01CREppeThPV0tDM0s5OERxMGxDd3dHczFFNVBWSmp1N3FS?=
 =?utf-8?B?dDNLanRlbmZWbGtZSGlMeFE0YjJlNUZQODdEcWJlY3hYZkNmSUZ6QitiTnhj?=
 =?utf-8?B?Z3QrYWE4QlhSSVRtYU5jY0ZLZG9KV0k2Zk5leS80ekU0anVpb1FpL0xjcGp4?=
 =?utf-8?B?azJvQnlQN3VHVG1sdlhFNXYxUTVzWTZYVkloNWhnczF6Q243K3RxWHQ4TWxp?=
 =?utf-8?B?dDlDZFRKcWhxM0ZqOTdqeTlVRzk0eFRFWjA5NU1xeHZTNk5GRHpWNlYyN2R4?=
 =?utf-8?B?RzBYSm5YaGluQ1dBVjJwNXpzMkVkeHpNN0orcnl5MUtwdkVCVlh4TTZjd2Q3?=
 =?utf-8?B?SEU2MFBnZkpHeFZtaC9FSy85UTBQbXBZNHpCRnFENjEwTmRBVmRVWm11dUxM?=
 =?utf-8?B?MlRtL3ZqUjh0WFdodUZQaE5iby9GU2dQaVpjeE4zT1pOUjM3eVZkakZPaVBu?=
 =?utf-8?B?UFRGTlIxblUxaFR2MFNtU0kvRHBwZTduR3YyRlJTNHVxb0VmOG9KNkZEd1NM?=
 =?utf-8?B?NTVRbW5xZ3Z2MlJXNmt4RFFmR0Ira1ZPY1I1TzdjeVRzVU8zMHgvRDc3c2xq?=
 =?utf-8?B?UWZOK1dWQTZYMDliSytJc1VrcEhyRUdoZFlLREZhR2szWFEvRThzSjdESVYr?=
 =?utf-8?B?aGFkNG96MVQ2Q01tbkVocm14elFhemh1eFhCcmVJUUZCZXBoR3o2WGkzRllW?=
 =?utf-8?B?bzI3clpuVSs5TytDSmVGeWh1cGpFOWEvMFlUNngrT1RpUitXUzFMWkZ4ck1O?=
 =?utf-8?B?bGx3Z3ZrMzMvYjhNTWUremtlQ0Fld1Zad0RqSlg5S0FIZk5RNnB2Z291bTdq?=
 =?utf-8?B?WG1BMDQ1ek9ZS3BTTllVVk5FOE45MFRTa3pCeW9sRmdYa1kvZWYyMWhxSXFV?=
 =?utf-8?B?UkZSY0R5RlU4ajhYRXQ1NGtTNWZMRDh4L0JUTkJidTdkNUNueCt2bFhPcVJv?=
 =?utf-8?B?R1BKc2V6cTA5MkFwMUMyeW1FS0xyMlB5d09kZU9ES3orQVBWOW9od3BRMHhR?=
 =?utf-8?B?NnZiZys4ODBURnB5cC83ZXN0c2FNWTc1RElEQVVCc0NQaFkxYVYrYVh4OWFz?=
 =?utf-8?B?am53aUtQajJOeGJrWkxIWk9NSUszUHpqUWd4VUt5L21KYlJZejZqUlZwaEdl?=
 =?utf-8?B?ODRZZXVnOGhmMmZOM05wWjNQd0pCZXYvVHhGa1dzU0NVMis4R2ZDYXloZmhJ?=
 =?utf-8?B?amNrcmNjdXNncUFCQjZlNmJzUlJreUptVEVDd3hDZlpaOVZHVWpVTnJKZ241?=
 =?utf-8?B?NThzZFdLMXRwRGxUOG95K09jcUxTNTFMc1pKdGpTV2RNNWc4djcwTkU1OVp5?=
 =?utf-8?B?TnIwZ1orMGNpbmhhM2hJZFpzMnlHTE5OUnY3YU9tYnNRUks2ZnJqSSsycEtL?=
 =?utf-8?B?b08yQUZHTVFESmxGYWt1NUUrMWxMa0RCRTBtYnk4elYrR1RPZjluSmpIRmlL?=
 =?utf-8?Q?HdBTcsdDzE9Lc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlJKY1pHY0hJY2RFcEludG41YW8rV3Bzd3JkNG9udTZVVjlBRkVjYlc3SmlB?=
 =?utf-8?B?WjFpMlFtTW05MGpad3dycEVsL2ptRnZBQU5wZkNZM1doenZIYjBNUXlGZTQ3?=
 =?utf-8?B?SjdzWW9kOUg0d0d2c1VwQ0JhMzVqUFovcXV0blRDSW85QzVoWlNYMzJudUNM?=
 =?utf-8?B?aW1NVjB3RUEyRVh1WnlpZFlPM3cxNGdvNlJEZEVZdTVsTzBZNDliR1pMalhV?=
 =?utf-8?B?VUdpbWdIMkFKN1V4Q1FWb0dFYUdSWjdsVGJFYlc4YjFiRVR6WnBkUHNUQXlJ?=
 =?utf-8?B?Z3NkdEtxWnNRZ0pUeW9xMUdMWGVZNEJiMHZONjdTekN3RVd0c3hwejlTQ2lE?=
 =?utf-8?B?ZTdQQ1E1bU16TFpwQmlCMXlZNVhSc2dGNS9GbndmSUlZM2hzNHlvWEF4MCtk?=
 =?utf-8?B?VVFVUkFvWUJRMG9IUGdPS2RkdEs2VldBQmhPTHRaYmVXT2NVVmJYelNFbHVr?=
 =?utf-8?B?YXg0bmFDMnlRMUlBSFlCYTdtM3dNRUVWZDMyVFhlcVpybUJrT1VaSWlRdENz?=
 =?utf-8?B?K29zQ3AxVC8vYi9MRGRrbnAvYlJBSHkvZ3lNMno1RDU2eC9UaHRzL0lKdXB1?=
 =?utf-8?B?OGpxb2ZSOHM5cUFrUTR0WmxXdFZyUHV2V2xGekliOEJWenRSV0s0L09obWh4?=
 =?utf-8?B?T3pqdzVuUlk1Qm9LaFh1NlFJSFliWTZscWlRczZDUE5XMEZxU3RaSVRLSEFN?=
 =?utf-8?B?UER4bkNyMFZ0YW9jYWYvRWd4dDZDNjVyVFJmdVF5SmZhTzBVRVRQd09YUUtD?=
 =?utf-8?B?a3MyeDdxOEUySktnemlkNVJlbm1tY3gyeld3KzF5SmF2ZFcwVVVCRTFEZjY5?=
 =?utf-8?B?OTdLcUY2V2FvYWtjSi9GOHpsM2N3cmRPZzVKbWRPbm5UdWZVQUVkNmlVNERG?=
 =?utf-8?B?N0x5cGdUQzdOR1h4OEMzZzM2dEFSWkR0eFVOaHAzd0c0UE9hekdLQjY1Vmp4?=
 =?utf-8?B?N0pGb0o0cnhxVGh0eFlSYWVQQlJDQWtNOEVxTlNFYzVhbFU3MVdnM2o4YThl?=
 =?utf-8?B?ZEF1MEV4Vk1UYmErbUZBSHJHNkR2MTdiOWpjL0JTVjdLVnF3dW56MWJHQXlo?=
 =?utf-8?B?LzhTRDZjVndYblJKMWV4MXh1RU4vcEtZN09ISFBFSEIyYWxKdVVaMkgxQzZU?=
 =?utf-8?B?UXk0VS8vVE10TFovL2k1b1U2dlduNFhlL01IUlJUS1U0ak93OHQvb0RxNFJw?=
 =?utf-8?B?dlo4Tks0N2JqaWszRlVTVEpDU1lQT0ErMzFhVDZXYkNXVm5jOWhTK3lMMGtU?=
 =?utf-8?B?V3dpRXpCTTFqZUpFUEI2MVB0bG9SY1JJUGdGdHBpWllnRzdNdE5lQU9qMTlu?=
 =?utf-8?B?M0RtK3VNbnNZVzVVYmZjaXRXREdNNmZzUkpVMFhuVTJQNTRMZ0NacXBtOHRP?=
 =?utf-8?B?N09LZU05blpKQ0lEak9GWkFSbi9Nd0l0bnZVbDNWc09VbkZmTmM5aERjRmh1?=
 =?utf-8?B?MVQ2dUxCTEY5dDdYMGg5Q2FRYkd0V09pcVRERlRva0ZzdnNEbXRnL1VJSTl0?=
 =?utf-8?B?cHVsdDlzSXFpQWVJZnNkaXE0UkhNZUR6aVJVMEp1RlRSWHUyM0xJaDBRTHhC?=
 =?utf-8?B?cjZOSVZMc2I4Z1drOEFiME45Qy9WWmg3V09UZG1hNndVcldWODIwTlM2cmM0?=
 =?utf-8?B?ZnVtTXZiUkdWcU45NFlwYjM3NmFwVXU5K1pNNURrYmU3M1kydkcwejlrTXBT?=
 =?utf-8?B?L3NZK1J4c2pJUmZOV3ZrUzBSMUVScVNqZ2FtKzdtaDQvRDBYQ1J1NXhoemta?=
 =?utf-8?B?MHpENzdqQTg5dnphbUYvUFl1ZnNGdGlzR1BGamtxcFRCWENETGt6d2F4UE1L?=
 =?utf-8?B?MUNnYzFZdHJjTlY3QWF0Vis1RDRxRG9sMzNPUjQzWjVtdDU3SmNJdzZZaDJ3?=
 =?utf-8?B?Yk9GeEdTdHU4Z0xmMlN5VGtsQjZWZFY5NzhPTVlZYTh6Tytham96U3F0SkhP?=
 =?utf-8?B?aEpXK1BFUVJXSWN1UktCRlQ2OCtHakd1b0lUdmM0RWxHbjRWVWpFQmNkR09j?=
 =?utf-8?B?RkNUaytrMHhMWDN6b2YvdG00S0JTZ3hmTTU3TElzQTh5a2g2OE0zT1ExcTZ3?=
 =?utf-8?B?WkF2aUJvbWF2eElicUhHc3YraU5QSTFMUmlvSGpRZyt4dEZsNm5Bc2FXblcx?=
 =?utf-8?B?OXpkV2VxUkpJT29TMjgyV09GWXgveS84YjM3ZDZVTXNGc3N2U3VZZ2pqRDdr?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 206f3a2b-403b-498b-6ec6-08dd7660230c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 05:42:23.7574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1ZSw+vhFGYmQVJ4xcWZf6Fz7RDQBI6UlVwMDAd4sveXLye7x+agPl3zp8IjEqxEhtwTYhpxgZKDC8UTFLp4GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9399
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

Hi Jakub,

Patch LGTM.
Please add "Closes" tag for the gitlab issue.

On 07-04-2025 08:15 pm, Jakub Kolakowski wrote:
> Currently igt_display_require() and igt_display_require_output() is
> called after trying to get cursor width and height which leads to
> fails on configurations that do not have display enabled.
> Move igt_display_require() and igt_display_require_output() before
> getting cursor width and height so instead test will skip on
> configurations without display.
>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/kms_plane_cursor.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index fd9e00085..1b72515f7 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -307,17 +307,17 @@ igt_main
>   
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +		display = &data.display;
> +
>   		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
>   		igt_assert(ret == 0 || errno == EINVAL);
>   		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &data.max_curh);
>   		igt_assert(ret == 0 || errno == EINVAL);
>   
>   		kmstest_set_vt_graphics_mode();
> -
> -		igt_display_require(&data.display, data.drm_fd);
> -		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
> -		display = &data.display;
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tests); i++) {

