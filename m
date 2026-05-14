Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA4CCD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 06:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCD110E138;
	Thu, 14 May 2026 06:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwGMFERm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5183C10E138
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 06:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778738782; x=1810274782;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ypsMeetsKKZLv4cMrjehsugjlxPLTYnZTXz2ruMYVKo=;
 b=AwGMFERmkNoUeR54AmqEN8fUtsfEKxP0ydY/FudmTd90NqS+txu8PCGR
 j5FaOmJ/UP28pFgfYvgi2pGXjaxBKrBWrDlgiKM9u9WI4/6kpKjUcGIkH
 LTdexGqon4Waukt2XEi1jq+NMlWpOoMouZXwAh1cirpItpNY5gWEXDl3z
 vhFhhJRJWnSpTl8x4FTq5I4lFHYGrfVml4w4cpcoqLzFsoz600nQIvyjU
 GAkHCnwkKRrFGlKKSok+sxSpqlZ7ooHKo4hzAZcRu7+B120PFIxHA3Cu9
 7Fd3A/OstkRXtPstYWfPqb2fDWjfF2dHCVtqfYQjUTlBn6KXkuK9tvclS w==;
X-CSE-ConnectionGUID: L6eSOSnFSsSG7SMidC5HGg==
X-CSE-MsgGUID: v7UJofXaQme79DxfFqR4ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78698864"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="78698864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:05:56 -0700
X-CSE-ConnectionGUID: 1xCtGxW2Sq2g6C6JDEhBlw==
X-CSE-MsgGUID: qtCa0FOmQImGr58AiS8kPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="235645847"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:05:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 23:05:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 23:05:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 23:05:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gtjy12VednfJO6ifcpfVp7oI2srGgb0A9uyTM5g6S/b6NOwES+AeH8glkLAX65LUH4VufaitvVfVzDXgpdvmKT7bDmY4q56dVaOAatRizAdKNAwtboFygPZi2Y84hcVrUYYzzvJoVvCPxXSf5z4RkH471U3FS7fmo7vA8HFddwDdubu00u0INkCDxvNlZA+z1z4YM3vctIOdBJGboPT5x6+KHRJJs7uqQFIo+eS2r/XdDPRV6W5ugAWN+re5/j5M0Nk76asfrWkTRI3KTfSWrsVST1rwYLOywPJBZZwL9OaathtyARsw1Rz4vnjsGf3RK5e5SmgrWHwTuIfx0TcbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRfhwL8aSIrN8s9Z4x0xOkUzvR0GlZQOYYoHktCnkTQ=;
 b=EggrJyOFb60TF5XWnrRE70/1x9nxmPQOR5Hwa411m4m3mcAla8PkFtDeJO71+DA7G6XWQ9TvkMUH2uFGakK4Q/LWnrUuQvqrjALPwYntoUleSnIqUCOOhpfyqDD3xtHDKQSh938e2dqeHmLaVXeEV7AySO5XmUU/1W6o8tEtScWu2bOvK1nJqbgqmqeDe4PY6oUiy+XJUZjxoRt8tzXOb6idaRak0LcpLlR5wRhY2GJ+ZhFgu0aISpYZXDyZGZACTBjb37fmnrGB2r+76J/jAI7u6+b82ccoTXxSh4g9/okSJyodDtEF1BONLCHPKXr6nqW5mU7212QwaJmYOrmxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 06:05:48 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 06:05:48 +0000
Date: Thu, 14 May 2026 06:05:38 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>, S Sebinraj
 <s.sebinraj@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
 vblank wait
Message-ID: <h5mztj3fvrf3rjiikxq5uzk2xojmpwnbhwcgmzxznhwbpbejgi@hahdvd2v3g7u>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260511081117.2315474-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260511081117.2315474-1-karthik.b.s@intel.com>
X-ClientProxiedBy: VIYP296CA0003.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::9) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 6281bc3d-d390-4a3d-6841-08deb17ed7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Giqh4sh/8bBvADESCbO/B4mUBOHDK5Xr3uuoWx0kTGYr2F9tIULvAdLbBjbdYHadlORKxMk/AHlZR/ow1ahd6cbRAcv8rWsp5SraaawLVqVLkarxdba4Q8BHsRViklZy2fCaBQ2thiiB+/hSuL5T/jnbHDmcB/QJpeDbGsxtFrX0EL1wdo9qFmvTuw8VJHbWlaHnCzMlMDDcMSrrr9/VBtF0U6Hrkw2n04xsWc21LifcSCEIl/Vzx6Ej/X/73A6zLIodTue0Ld0pBphDh3gMeyVzepyWh4CKwVLjdri13CdkxQP2T6wNpFrjZzVCkSzXonEpxDM5MP99Xj5v//DQdg0XcLPuP47thh7+M1Zh78jrLRB6wBtc4RuLs3GxXCHLKwqPAOTcpsPZlF3NjtED9LyB5iEfOzsWWTQLjDrues5WLPr4nOz5B6nkBef9OlPy/7SJXTYAQzYurbpjBOz0D8Fxlpcqr61kBzgYnHRW0b2w2ZfAsIneImulKlzpmhutDMEReKO2uu1FogTmmHNpKjMtKVD6F4cfm0sEKHOdl1Or0jL+I3AQ0Xxic5QGvpTUswYSBhLmHc9eyngaaMf0PDlvH0KNa3JV1VNUTP8gQK+H0hGACbjougDFAob/gh/hy9UTUETRyIGy9IpLxnl7kNcC6fSbLcTtM84QprPHL76xCOuOWcJLIGsEAKp3Kw+a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhEMTZ6U0xVSkQ3SmRiaTR6SWwxakNwSDVPREZld001VWE3OEJEcHVoOUNl?=
 =?utf-8?B?UUIydjdCc0tkeDE5a0hiS1VtOGVsWmFVZFczVEh6bDNNVERMMThiUGxySTcr?=
 =?utf-8?B?ckxodGRJRFpGYTRKbWZPa20yTWZOWFRjOWdNazY0L0QwRXdEUko4MXU4SFBC?=
 =?utf-8?B?ZXpWdlhoSE4wT2tZM0NnQjhpSUZGTXRaN0ZIWmZKdUx6NmhzK2dDNkJSaHBJ?=
 =?utf-8?B?U2k2QkFsUi93WVRnTTJvN0JuS1FYWWhQeWZtMG5EeFRqYVgxRjFHY2hlMlZN?=
 =?utf-8?B?b1o0ZkZwbk50UVNpLzM1bzZQTzRDRmt0UWdBT3NTdENjL1ZOOEVaSjhQMUNX?=
 =?utf-8?B?Z21JYjNMdWY4WWFubmdoQUZuekl1bEFuSmVqeCt3L243N1B5dFovd1QrK2ht?=
 =?utf-8?B?Z0JrMExvRENDajA5NXVlZEVNNDhuaTB0UGMzMUhxaFBGdkhvUmtYVDRuandL?=
 =?utf-8?B?bTNRZWkzUCtCUy9LRS9QQ3drSHR2Y0p5UFdNK2J3Wi9rdGFhSjNpd3lXcGY4?=
 =?utf-8?B?aEZLVHExN2xNd2xzcTR3YUZMUm5SM1V3MHgrOElxNjZ3K2ZmRXZYaEgvOGsv?=
 =?utf-8?B?TnIzVkhjaS9VLzFBcDY0aEpMRTBhWkN4eGRmSUR2by94aVViVVBBdzZVcDZa?=
 =?utf-8?B?VkZVZVVnWGtCd3Y4N21OeG1FbVhhbFRhSlkrb1ZWMmlCc3I5ME1XaEJ3Rmg2?=
 =?utf-8?B?RnkwdjgyaEFSY1cwU3g0eGFjRDQzZTRsYVhoTno1VHJHUkttaC9OWG1kOFUy?=
 =?utf-8?B?MXA1bHJIalpFcjNyeVJXbUJhS1d1SHI1dkM3OHRkNVMzN09xZFd4b3hzcEVt?=
 =?utf-8?B?eVJaK0JXbVFnNGtWYmJaNUdqbUE0a2F3em8zMUZ4Smk0R1Uyb3JraDBUdG4x?=
 =?utf-8?B?N2x4NjdaUVRJdXVqdXl0cXdDbFFlM1dKNjVuYlRLVXFEVHFybmFxTCsvNCtV?=
 =?utf-8?B?bnRmUGV3cUljRXU2bWVlMWtUZVFHaWhaSXRqV3JCSHhPYzluT2JxaHoxTWFn?=
 =?utf-8?B?UCtFM1lBL01rWURZNHVZeGEwRUFVQk83VXlNR2dpbGpUZ1IyYjErcy9IaWlP?=
 =?utf-8?B?TDJlOUdoTk1KQ3ZrR2xoR1ZkTXBFdUpNSXJvMU9JNEZPb3hodTR5cERud05o?=
 =?utf-8?B?MWR3d2MvbDlGZFJNSmFDZ1l6dGc0azB6ZGdOa0NMdktCS3NXOC9Tbkx5Zzhi?=
 =?utf-8?B?Z2lhRWIxclhuWEdhRExPZ20xSytsSUlvSFF0MGlSbGhTeEwzbTFyWmVkZHcv?=
 =?utf-8?B?VHdLYmVnTzR0OFNJeGRNc0x6bFVvSzcreFU1cE5RQ2N3TkJXV0ZpTjh2cndV?=
 =?utf-8?B?MGtMK2VCVUh6ZGd6b2VpdlUrNGRZc1VmOXNDWEszcXM5aldLWklkZHJLOVM4?=
 =?utf-8?B?RGhXSXE2U3UxSlpqZlRMK1ltS29jbnRlNDRNYkpoYzZvVGRud3plaFhpcUx4?=
 =?utf-8?B?VG1INXZxMTlYMllLbS9FK3EwWTJTbVhpOFJhSHBueTd6bUNJTGFVWUVRTW9S?=
 =?utf-8?B?TW50NkxSYjZYajNFc3k5OGJNVklDby9zZldsMVA0Zm80bkZiTEdrb0FLektK?=
 =?utf-8?B?MEJUUUdSNWI2QWcyMjQrYVBTeVI2bTZ0RXlvTXVqRWNWdDVRVGNBNmJhVW1t?=
 =?utf-8?B?Z1lQcGYrZ2JQaG9HNS8xaXFUR3lIeWd3VXVhdGoyc08rZnVhenQzZkJHM2Jp?=
 =?utf-8?B?TXR2T1h6SjJFck9QaDUzbkkyT0JxRFlWVzNLMDNUYW9LQjVSTGpySytEU3NV?=
 =?utf-8?B?Z0lEQUtnTCsyNmtaQjlzTFliU0RjN2xBK0tadzJTQWlxWmt1K01uTWdveEZ6?=
 =?utf-8?B?V3lWVnFtZTN1UHBlOXVtL1BiOU1UaTlxTGgrRitYb3dhUkVwdGhwVms5YUFY?=
 =?utf-8?B?Wk95SS9pZGVjNUFIakl1ZmhyQnpPOFVjcEs3d2Uxc1haWmlibFZsVDlJUnZt?=
 =?utf-8?B?d0FydEFJRXpHRkpaM2RGWGxXZ0JRUEVuVzdOcXY0enNKYXlDQlRrMmdWdTl3?=
 =?utf-8?B?ZW93MEJETXl4eWxGT0lxUmtFYldlcGdQNlVkbTFBeGQza0QzaDZXR2o3c2lH?=
 =?utf-8?B?VUhZOW82YmFpL2V4VTR4eWJyUEV4S2Y1RTNnYnZEdnQ1dVpCLyttRkRYM0o3?=
 =?utf-8?B?THNUdVBhanc4a1BOZ1lESTBTa3dIdWFrM3ljZC9zMXVYTGYxdkk0RTNGK28v?=
 =?utf-8?B?RW5tNlIzc01MbTdndkp5aFJxVTJvemVFdm5aOUZHaGgwQ3dlZVIvVlNtbU90?=
 =?utf-8?B?cTZDZzJ6TkJPaEJRaVVMek54R3kzZ0ZCc1ZOT0hKeTIrVmp2b2tncEhBSWFr?=
 =?utf-8?B?MVdvMG1vU2Z3YWxqWndCNjZ3MjQvNmFHUTlGak9MQnlVYnZoSmJhMkY5UGwx?=
 =?utf-8?Q?0ym5L98zRLYT8qCg=3D?=
X-Exchange-RoutingPolicyChecked: eE9zfL34k5DE6iZNhVsmmYS1MTub2QRvEYhbBdvj7VcUXxSE6PybtchJyo6B7Cnrx6s813sieXAO8Hif6QPdy4UEPpbLheEySP/buHLH4EoKq1iaivByAD7hrysUakNu+UoxllZDfpfIdmzL/NlqupiFdUJPeaCIEez4lqtq7lupTXsyWgG3u7NafDrjAj0qeuWuDTj9RQLHSuCW3fzlsX74sf6SLXSogJwvoXe7K/yHEa+vQKpSSUU0Uu4Lv2Eqbb1b9fmlL8LAMQccd7EGXw9BMI0zjP8TDy4R1uLXV6WAB5vuxvREvLtFZ+hGJzoHkb+QmEnYcRVRTRKTzXexgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6281bc3d-d390-4a3d-6841-08deb17ed7f3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 06:05:48.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvpsYJskK+nF/n3WSNiLXmB/7b/9Z/5Oz0Yn78qRVZM/njJbUkjBkdfzMY8Kfg79dZDb1CUkI9BIVqJKdfhzQEa/QuZQaIfBzhHPHDLry3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

Hi Karthik,

> The premature-update detection window between the NONBLOCK atomic
> commit and the CRC sample used a fixed 100ms sleep. On
> high-refresh-rate panels this 100ms wait covers many vblank
> intervals (~24 at 240 Hz vs ~6 at 60 Hz) and is long enough to let
> the display engine enter PSR/DC5. A subsequent CRC read then comes
> back as 0xffffffff (read from a powered-down well), causing the
> test to fail spuriously on these panels.
> 
> Replace the fixed sleep with 2-vblank wait:
> 
>  - It is the minimum wait that guarantees one full vblank boundary
>    has elapsed past the commit, so a same-vblank-latch bug in the
>    driver still has a deterministic window to manifest before the
>    CRC is sampled.
>  - It scales with the panel refresh rate, keeping the wait short
>    on high-refresh panels (~8 ms at 240 Hz, ~33 ms at 60 Hz).
> 
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---

How did you find this issue? Should there be a "Closes" tag
somewhere if that was reported by CI or community?

-- 
Best Regards,
Krzysztof
