Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2983C61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 10:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2E410F336;
	Fri, 28 Aug 2026 10:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOADoYuT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6B810F333
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911547; x=1819447547;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bBkj/v+Uzw+fUlqdExFH+uA56DkEcha1jUn08XJ6vCQ=;
 b=SOADoYuTql6EjzJhB5xwqcB7hb0oADHcDt2rJ877R7l5wP3ZSU6by3di
 mQSypXrTnVg0QxzKK9dn3ArQXvANIID5WlXSAFmf3Y5hNoI7IFw2tyUl8
 rz6kB9QnEBYtZxhG/eIiZI2B22sSxjbuznJPV2k+8eYYjcTE3BWSRI9/3
 OVoN8FvFpvo0BFlUFBDw/Npt7ZW9Pk58PPxquVuXGbbQnpPedROIiC1d/
 e1HiPHw05JXt2N9JNf89eN5ssIGUYVgqFHiiNC09VdkTsI+rTrRqHLrot
 wlrsAH+QFs47pEtImZE13mt1VvqOJLgsLAGv8xVtXiR+iN+yKM68d+3Ql w==;
X-CSE-ConnectionGUID: 3P8IwkyWSDGRVNG0Jr2myQ==
X-CSE-MsgGUID: /53qk6LyRXGA2UmxQTdwZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105791912"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="105791912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:05:46 -0700
X-CSE-ConnectionGUID: 9+4YQxF9S2+jyPo9sSa+TQ==
X-CSE-MsgGUID: UF88I+dNS4Coj2cl4VS/tQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:05:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:05:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 03:05:45 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjG0PbccwAKDhgnBVVlRjHWfHhjgQ73ZwZPLZQfGQtZCmYkbjHbvoHyFBvmINsbQMLThHdnwpL+n9XqE4yuIZk+qiNe9m7p+x1ALZCb7nOK/EZfSUPE8uhLI1h6LMtCMg5O1X/8C8w2BrLQSuc0doiSpNhmCZm7GK9U0tG5haKk9GItQp9MyxucurBRsy4GdDLuvoUtSu/Y9IogSBvVsZecxoI6ku9c2OYNQ6GQsKcK8CA1zpvdheDAor5nEEEK8bjjigz5sBLWNyqBpD1SVsiWUHPPgYtYy/5ykt5/PbxVDUili4F1MbVm82V0tY6mRIfEoTe+5IL6gq9A+VYfk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71GB89mrqtSJrCo1UXiTKqxELvp50iFLrt5RR93enkE=;
 b=dlwBtPqD0wPgb3i9IV7BsTVNY23tUEonn93fCco5ssqmfED1tCIXG47HcPIMPROq+qFuOdlzfXEvL+Xv1H1SfhzF+68KMfj+HsscRcQEO8wFdxlPDO7a8WiVrCTOUofdf8MB84zzFIfhA4E7JiOgY7SyVU6Ga+X30ozGxLYzMKYbxgdQxlOr3US7RncR/y9zLxE5g2sidU4KvRlIwaDk5SN4Z4cT554ES3FsKQQ0WcvovbplPZTAvFtNTViDfbjGoY9dbvT5uncyNYYLAsRn7olNBWjojQ94wVIw6pK36tYY1Xe4gUENJ8sFFATdMyToHsQH05yr+KXjS9URznQZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 10:05:37 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:05:37 +0000
Message-ID: <a3be5162-3fd0-41ad-bd2b-dbc14a4e2860@intel.com>
Date: Fri, 28 Aug 2026 15:35:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <20260827153627.cn5ou4ornidks227@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260827153627.cn5ou4ornidks227@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0210.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 72722e3b-cb60-4ff6-6756-08df04ebe84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 74/TQIAARboYIxG72ETJdUbCa/ynEUXDG0V9EucJ7NwF7pgR6zZt1kacufAs3463vz0eiWFi/6Mht3cdlxFR/FBf7JuFSeLQP/YJfofE71wNhvGsZ3gpVwW1XoyCJHfRapeml++j4zS2b0A+w3LGjh9y0dL4SFVdueiUYfx2x5Pd+fUgnm0AsC1NnU1XuIlYQ7190q3Jb6CT6etHZzduJ8vxXmZ+1OvhaRzdVObtbRIQ/6bnIe9Gn6tTa8rA34nkgqN+6SHDlpYXqa4akGbFtYroL5sTeYx75o/WS4dMgYzQVYU/eghdHjqSSoUIiB1a5k1oRF+NkEFilA3sIpbkyPnkg754VqFPs1YuQgZhNWWk4iAslG1w9QB9OzQtoIc75mqqdP36Xkw/n+e0il3izHwobm+gFeMTKzj3CgaHE7xseQ8RQzMXtarfDXBPTbNFPVOtB33ownJjG1MLiLoXsT3leJGzxO92su1vDMG2gLdGrED7QTRaa5ibR0GpsdpZQIgXX/SVI794PB/P1vHm7EFrO5l2BHhmfi0vDdLFLfqJm7Texl/viT9ZTtJAr2Z5PdETSiNMGUk/4C3F3IjqDR8b4VXhOMG1tAwbWZgBy1q+HRVCbPNX6wdO3ax9Sop9LKEphLhuHigDOSNaIwQ9TDNlk5nf41q1C3tEyBw7SYE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empqalZUUmNZNGtXNTJNRUZZQnJJckR0TE0zL0ozdTh5YTd2T3VIY0djTWt3?=
 =?utf-8?B?Zkh3Q1RDbGpZeDE0QUd3cm81S0NBTkRvbUNKTHc2MEFyVi9yelBjSXVqNklU?=
 =?utf-8?B?UUtMNmFMQ2dYd2xlMktaNXNkUlpaRDdFdVlYM2xnc2JQdkc2MW9YUHBZbnVV?=
 =?utf-8?B?U3A3aDNTZXZVbU1ab0IzVW9JcWRyNUtna1FuQ1BuQ3lFbGhIaWxrYzN2YmV1?=
 =?utf-8?B?MG5UbitOb2VTbWNSYmRYR3hSZUthd3VSQWpMNityM0Z4WHZJNnRaaERVK1Ix?=
 =?utf-8?B?eDA0dFhNUmM0eUhYSWZNSTM2OGpRb3B1RkdhQUZxUmN6Y2lzZWVPN3FzenJC?=
 =?utf-8?B?RFh4cHdsTE15emxzY0VOcm14cC93dk16RmRtMmpQbE1oWnh1OUZxZmQvV3d4?=
 =?utf-8?B?SVpKUUNjSjY3UWJvVW1GRmxCbTFaUVlKMmFvdzRSRE5jWXo2QnNtM29VMWpw?=
 =?utf-8?B?Q1ZMME8xajh0M240UFBuNnVOMTVYaHhSY3dKWGFaV0V4MWZxTHAwK2ZzWEh6?=
 =?utf-8?B?Q3NzWnFqaC9oa25SZU13TXlNNkxXYWhNcEx5bEpZcXRWcUZReWxOVzZpa2k0?=
 =?utf-8?B?V1RnUHhYeTNyYitjalBEaVREVHRMWXhKTkFDd1ZtN1R1SnYxUWlxMFJjZnlC?=
 =?utf-8?B?TDVGOWlObDdUc3VRMG5majBhL1dwUkIwTkEya3dYaHN4RVdyZTdCRW5WWnVu?=
 =?utf-8?B?NGNXQ3llckZYV045bkt5N2hPUU1HSDBic1BINlloS3RhZk5KVlRjcndkMHVD?=
 =?utf-8?B?NHhBOFgxaEEzN3M5TitsSEw5VHhsYnZWNjBobE9LaHJINWdoc3V6K3RyejJr?=
 =?utf-8?B?am1QTFhBMkVSdDBYQ1lHUUJDTmMrZGJiSFQ4R2MzQSttRytNZ2lZd1JaT0xj?=
 =?utf-8?B?Yk1wWDZzTzFtclZlMG1neDdUYXNOd3QvS2g5VUIvQVJURTlGSkZLN2N1bnJ2?=
 =?utf-8?B?Wjd4ekFhaHpnNzNlaXhDTHZ0Tlg5UlFVemttV2N2NHhWVERmeUZwcXR4NlRT?=
 =?utf-8?B?SDdFdGwvRDhJanJLOG52eG40dTd4N1ZmMUxaeUVVc2VMS1htSFRTSUpkL1FD?=
 =?utf-8?B?aVNOKzY2OExHNVJmVDVHMUlLNThKYjliU0RGTm9OaXVEU3NSZlgyd21qdlQ2?=
 =?utf-8?B?ZHovU3lvM0JzV1E1NEw5TldXcVppSlJreXk3Vy9HMEpCMEs3TmR6MFRXUWRn?=
 =?utf-8?B?VWo4V3p0OUUzUjEyV0VpOFIzcVZPSFEzYnkrU09UWU1LZGpkTUJURlJpZTNI?=
 =?utf-8?B?RXdvSUVuenBjZHN3dmtCbkw2Z2RLZ3NIQTVXZmlkY1lXZ1pSaFJlUTV5Z1hD?=
 =?utf-8?B?cTQyVXp1SW1teG5IVzVhNVNDaFFYbVJzc1E1aWFJUmFtRnE5S2p1ZWtMY0E4?=
 =?utf-8?B?MlNOemN0Ujh0QzRrT0xhbUJ0eGNDU2lRQk5VNUdOb0hIbTZxWmNNTDhBcXdk?=
 =?utf-8?B?WS9ONlFPWUxVUU8ydVZRYnpTUTZ3YjNrSitvNkV3VnM4bWpkWDQ4YUhiRGMy?=
 =?utf-8?B?bzVDSHN3WnpJV1hsSWxaUjZqZXByaUc3ZmFZdkRqVFB1dnZmQjFYNkxIODky?=
 =?utf-8?B?VGxMYzYzeGo3N0ppWWhDSHl3SitTbGFmbXIzUWxIaWFMclNBWUlaMi9UMEVy?=
 =?utf-8?B?NW9FRy92d0pTWDJyV0ZWcGg1M1ZyUTBzMFV5a3QvcDQxNUExU0VLU3FTamhY?=
 =?utf-8?B?M254SHNTQ0JGQmx2WUVwR2c3K3A3RWVJQ0ZYR21NOWNFVURWdlNENWh3Z1VU?=
 =?utf-8?B?SXJEdnV2cEJSZlRuc096cnNlNEJQNW9wSmRLdGU2MmdNQzg0QVJkaDU3cFJD?=
 =?utf-8?B?VW12MXphMXJnU3ZNTS9KMzNJaHl1dXhweW5lMUQ2aUxkemRjZHFaMnlnTlVz?=
 =?utf-8?B?RGdQOUF0cExpKzAwSDYvOUR6RDR6enVUWVYzNkFlQXFuR2R2VGlkanJBS1dU?=
 =?utf-8?B?b2xMbjZLNXNZRHUzcG1KbThFYzNEbkk1MzYxZFQ3SmgrZzV0L096VG9qYlpu?=
 =?utf-8?B?Wm1JNWFSRWFRamtyZ1NBTlM2MGducmJLeURLQWdiYUNHM2taZUZCMFBUa3BS?=
 =?utf-8?B?RjRKZVlTKzUxZktTdm5ubkFtaXkwMnNLTnZURlY2bms0NjlaYXpKVU1XWS9F?=
 =?utf-8?B?MmJOTGU3TzlYQW1WOWF5SFNXL3dvUmpUYkVrdTlrajR4blZRcmkzVnJVeUNa?=
 =?utf-8?B?VTNNMkpHbVljVjI0WlRqY2t0MzRRc3Zaa1ZSNHZkMnR3c1d3T3pkdnduS2h5?=
 =?utf-8?B?L2NGOVluNStYUFkwcXliZ25PRlNRQ29mc0tINCs0bEppSUE5YzdvTUQzYWdE?=
 =?utf-8?B?dnpZcEM5aklLT1dJZG1Ud1R0Qk1PcHUyTlo4UTRMbWdTeW5ZNXNsKzgvV0tq?=
 =?utf-8?Q?OJKFxvG7u+liPrC4=3D?=
X-Exchange-RoutingPolicyChecked: rGpB/1O6vXAcDMlvxRENMmjQPDgnXzqWPvisUSQqB2lK+UYqE1MzYGjky6jT9asJxQ5Y/qNT1DQNcm7+1eBMhGOTCFdPPULzEPEF6xcs0VcDrwbR3NAMxJovgRWQWf/xAoUUZyaIce/DKUyhVPCGvD0vf4i1sw9PFTVZteNYpbmhBDVKaSEW4GGokngJpkfbFdTYdlUY7AqB6IEv0OlGMXSeLADG6uGjnVN/PKUXC7rq1rf9T9Cmyjw21WSpWLDP+q3K8GfzRKF34sXpAe+IPd5XSY4HTAfiuh18oR7oUUr7+78TiiGkLkOiYNWvP6Abmgxn0fpqfUOeoJ7+H11LjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72722e3b-cb60-4ff6-6756-08df04ebe84c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:05:37.4497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fM3yQuTBak8wsvmE2pdYk95qbj09PiklZLSe2Wj9RgCExZx+8qznjZd80Z9HF9EDe4rNo2DpB702h84zOQqoZmf3KyRbUPQy8lafvrIqnCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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

Hi Kamil,

On 8/27/2026 9:06 PM, Kamil Konieczny wrote:
> Hi Chaitanya,
> On 2026-08-03 at 13:33:40 +0530, Chaitanya Kumar Borah wrote:
> 
> small nit about subject, please do not use "C code to english",
> rather describe what you try to achive, here better:
> 
> [i-g-t] tests/kms_colorop: Get cap color pipeline only once
> 

Noted.

Swati, we can perhaps change this while merging if there are no further 
changes needed.

==
Chaitanya

> Regards,
> Kamil
> 
>> Following the pattern in kms_color_pipeline, set
>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
>> local variable, then propagate it to display->has_plane_color_pipeline
>> after the final igt_display_require() (which reinitializes the display
>> state). This avoids calling drmSetClientCap() twice.
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_colorop.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>> index 16db0b8ad..d573d2ceb 100644
>> --- a/tests/kms_colorop.c
>> +++ b/tests/kms_colorop.c
>> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>>   
>>   	igt_display_t display;
>>   	int i, j, ret;
>> +	int has_plane_color_pipeline = 0;
>>   
>>   	igt_fixture() {
>>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>>   
>>   		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>   
>> -		igt_display_require(&display, display.drm_fd);
>>   		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> -			display.has_plane_color_pipeline = 1;
>> +			has_plane_color_pipeline = 1;
>> +
>> +		igt_display_require(&display, display.drm_fd);
>>   
>>   		kmstest_set_vt_graphics_mode();
>>   
>>   		igt_display_require(&display, display.drm_fd);
>> -		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>> -			display.has_plane_color_pipeline = 1;
>> +		display.has_plane_color_pipeline = has_plane_color_pipeline;
>>   
>>   		igt_require(display.is_atomic);
>>   	}
>> -- 
>> 2.50.1
>>

