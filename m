Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04DDCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F83F10E8A5;
	Thu,  6 Nov 2025 12:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnDtIjcs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6893010E8A5
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762430648; x=1793966648;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZS2wDmS3MZge92B3lVkBlGtfLxTlkrVmjJLozMEP8z8=;
 b=QnDtIjcsH+Kj+3p5kPUNE+AnC5BiQw6DpYg6C6CGZg1Y1S4XTNlTVEQq
 X3vcgrqJuS0yeDXvuEd8B35t66Zpr4mvZOMSIudXl9OIuobUnuZmWvho9
 q2TeNREKZHp6cTUHfPlxO5k//hPTSw9EHdwCzmh3inu4H8XTyrToeHMUB
 ujQZxTp+C2LFrLpaeqSStCdvufusqc/bXTsYXkWXmMFnbdSB5E580OjVz
 kt1zevMLLyfrYWa8++zswETnnvFQpUfEZkHPNUnvgK9Vv96MLkqpo7Us9
 P1wFHV4dgkiRc1g5wxZnx0WyJYvCL02qPGc/5m1k75E47FdUUQbko2qf2 Q==;
X-CSE-ConnectionGUID: /IHptvMWSBqrtvOHO97Vag==
X-CSE-MsgGUID: IiFLzDMOQpejF90AbY8v3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63575566"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="63575566"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:04:07 -0800
X-CSE-ConnectionGUID: QSXl2ObaSBGmIwiwKyYBWg==
X-CSE-MsgGUID: L6Frr96SQAu3NCCjJYWWTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187455893"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:04:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 04:04:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 04:04:06 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 04:04:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT23GB06rWrEOgEVN4Vt3qSYPtWjfthkgUAuXKEppXEVLRv/UX/38sGAfktCMU67P/bKTEj6xYLqYsr8a63TpC917Gd4pnVZBf9sl2kUCfDYxC4A/jfssgGbN8SINSQRha84hO51hL+reA7HdVhDhraWw/fGGpPVnNkLzYcfrVTYQqGUVSkBePg4oSiuOA1B4OtLP8kvp0St4ykBvWSb/6fymYVQFGxiKySYD08Iew6qIy3gvjiLBPhaOBxkzNA4EiqcLGKn3EyNL5yXAsqPSjVlwBCO8N47mSp1rjHuXW0g2aZUJ4JdFSWLvO3a0S3yrlcM59dkR9YQdhL5s1aJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBklRyge0kAfKttCkTYSvfl9NVh52NTllMRL6ukMMJw=;
 b=ieJr8VEjCEwe9NtHtcI7+2UnEQgwJJ/cKUFFROpBRcmzJzwdjjGjjEfcGPTFHI5HdFJiGKgOot7gnfMiij0VSLJPYa46tbECmGlPBLp3DenA8heXkvAnGEOkAf3xhza/R0+5FsbN9uaY4eTWSY9AEQWCi+gqf2LHx2kgqKCOz56NM6KUS1nNK2zLOCh1RCQElIvVW3Wr2x2hAs6DxBfwXD3EeltrcfoDx/OQLRT6iJwT98nrhSCepYBJpfHFqLVJM44WU3pFM4q9ZJAMYUZ0ePXWLBFDZ1+lqBK4Oa4/N/vpFHxiQ5raCkJA290QlcuAJ5AuMawkKJs5fIY4POEM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 12:04:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 12:04:03 +0000
Date: Thu, 6 Nov 2025 13:03:59 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lukasz.laguna@intel.com>,
 <jakub1.kolakowski@intel.com>
Subject: Re: [PATCH i-g-t 5/6] tests/intel/xe_sriov_flr: Use global MMIO
 context initialized in verify_flr
Message-ID: <20251106120359.lsujdlwqgkcmp7cw@intel.com>
References: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
 <20251031125633.1374273-6-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031125633.1374273-6-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB5283:EE_
X-MS-Office365-Filtering-Correlation-Id: db3d07af-bf92-4b49-e9ae-08de1d2c93a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmtRRFBvSm50WUdVa25HMnF2SjNpbUo0cUZvREdHUUllUHUvZUlweEVoT3lE?=
 =?utf-8?B?TW1LM3J0djcvWUNDYlU0US9vTEdjU1lJZEVDckRqcVN2T2E1RXZVM1FBK1JH?=
 =?utf-8?B?RVVOc1E2WjlsdkR6MHZFaFhmNm0xU2lyTmJBK3RkekJ0MFNlU3F5Y2MzbjF2?=
 =?utf-8?B?YmVsM2poWjNmdkMxdVlTNzRFeUpyM2t5MXJUZHovYzRwMWwvVzRpR3NMOGMz?=
 =?utf-8?B?M2RoTVNyZnczMURPdks1NG55NWI1SGFTMlR6Y1RxQ21SRjNmdlJjQTdvT1JI?=
 =?utf-8?B?L05veFA4dkhBN0JuSlVmUEJNeUF4TkJnSTNPak9YeG13SHBYU0g0VkRtdWw0?=
 =?utf-8?B?K3V5RkRDOFFycjFVRnVpcDZiNFZIOEZFTm1pYjNWdWo3ZWczSGVBZFFIZkRB?=
 =?utf-8?B?NVNGVU4yZFRhOTNIZGhOYUpZWjBJV1ZxKzNOWU03amRTZE0rR29rMlplUzFP?=
 =?utf-8?B?WVlMZGNJMHF2RVZ3dVRBSjh2MlA0R05yRUdoVG96V2hJd0l5QTVOci9xOGlB?=
 =?utf-8?B?QllDNThtMmxwUjhWU0hiblFpU2N0MTY3cW1GZ21FaEs5U3pPTEk4M3pQM2VS?=
 =?utf-8?B?VkJWeCt1K0VUUnM3NE81NGpJZmxsd1doNVM4azZYQnZPMmRWb3cvZDFJUDdj?=
 =?utf-8?B?MGErd21hVTQxdENSUG5HdEhjSWszdjN3WUdHTDJadm0zNmJnMkt2MUZkWTFV?=
 =?utf-8?B?WW84b2ZQMXVpR0gyRlpNakMrM0JDczBIZ1B5QmpVWDZMb1lDTkViSWdYQVEy?=
 =?utf-8?B?OEVXOUZQTzdIaFkzS1M2MXRpaDJoa25QTThrOEIzTVJmQlZIS21IVHNsYWR0?=
 =?utf-8?B?U1NWL2o3NG02aGtsekwwZ21RVzRKRmJ6MGgydCt0WEtzcjZNakR4WjZmOXho?=
 =?utf-8?B?MnlUd042ZlBpQjF0RnFyU3FvdmNZQXNGMHpzSHloUVdBV3hOR2VBTUxwRk1G?=
 =?utf-8?B?S1U1VWx4a1owY2liaUdPeEN4MzFwSWx1SzFhd01sZ2xPQUorZkE3MFJ2MUg5?=
 =?utf-8?B?SmJCdDE0VmJnd2V2V1plMGpQZTVYNW1WckMxY1Q5UDE3VmM2T2NsOXoxbXJK?=
 =?utf-8?B?Nm81L2JWMmNpRzRDakRxL0tNTkpRV2FaUHFzZ3p5UURjUkxwY3lObEZMb3k2?=
 =?utf-8?B?YlRpK25hK2xDamdWNEFuTXE0ZmcxS3lBa3FMTERQcjFudnVIMFBDbFp3Rjhj?=
 =?utf-8?B?cTg5Zy80NnZWQmREN0tRY1BZVnNqQWxzR1B3c1BVK09VUGV6azJnWGdNY3Bs?=
 =?utf-8?B?U1BxZE5pU0UwdTR0Qm1udHV0TkNUMzd2aXYvNkMxNEhOUTU4cHJPTzVhZS9E?=
 =?utf-8?B?NUV1QjB4dmFqcTV0S2VtL2F0QmRmWitpR3ZUTlhKRFpzdzRkNEFxQ3oyeTJL?=
 =?utf-8?B?VjlSbXYxc1lCWDUyU2o2ZWEza2x0SUI1V1hTTkFZNWRUVkkwYnR0SlRKU3FI?=
 =?utf-8?B?WEtybUpmaWkyRW5MblNVU1UzNVlESW16bDZqTkh1aFVZUEYxMStpeUdydWlX?=
 =?utf-8?B?aXZaNFJZc0Y2Yi8xenVnS0M3WFN0MDFGU1BheHAwbFhtN2xQZFRVbXZIREY5?=
 =?utf-8?B?MzRXa1NnVEJneG1jcEMxd21mRDNlSlNCYmtPOUY1ZUhmTzRFbVFPdmVlVkxD?=
 =?utf-8?B?MVBzdTZQWm1wZzhaaVNDSFJ0bTNndzJFWVI4T1Y0S1JuR0gyTWNFdGo0Ritu?=
 =?utf-8?B?QUZUSkdrdEZEdExTaE5IckN4cHlGTUVXdDJxT0tWUDNiWFMwK0ljMUcwMjUr?=
 =?utf-8?B?K3Z2VkZyMG8xVEM2eGxxSnBPS1Y1eWh4R1MrTmxpNHhXMWN6NnQxQ3VsMHdJ?=
 =?utf-8?B?cW1GQXE4WnE2MGhHNkpFZitzZnBMOEE0WWZpSVl4NkpSOFcrMkJpVHBzOW56?=
 =?utf-8?B?UlNsVVZnUFpOWVIwb3ZTTGNCYU1DbzY0aVI5MnNmR2YxSnMybE1QK1JBNS84?=
 =?utf-8?Q?H416yU69lwrm4Xl0uoHguMevTNATHIpt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2Z6dzZTZzdYZ3Z5QlhtVjh4L3ZEUUJtMkVkR2ZLSzgrU3ByR2taL3o0ZDQ0?=
 =?utf-8?B?WFRrOUVncm5jNTFSWTJoS2EzVjlxS2ZjZ1VLY2JHMXgrMmhHTWloOVI3NzR6?=
 =?utf-8?B?QXZjdDh3NU5kQ3FVN0Y1cTBsQzk3UEJtQVhHcXNqMnEzaWwxTExTTTVlVXZz?=
 =?utf-8?B?eTI2a3F1MlBEV1NEd0pTTC81NU5VdkI5U1ozVXFLQjFBb0V2RGZUZ0hTalVX?=
 =?utf-8?B?TUVOUHU4Q3l6dFFuMFEvbXVrdWppODA1c1o3M2h4VENGcjkxa1dZS3dlZE41?=
 =?utf-8?B?ZG84RThXQ2R0cm1MbXFSNkY1RzZxS1FzSFd3ZnFUSkhDR0VDN2FxeDJ2NEdn?=
 =?utf-8?B?MXRwTGk1ZmFnVTFUTXBjZWVHaEpyS3BYVkxYcVVENFkzc3VhaHVHNlhuOEdo?=
 =?utf-8?B?WGJiSnhOUTl0K3JRa2ZhemdrR2d0WXVZbExjSE9jSTJSSitwZnRnOXhIaG1J?=
 =?utf-8?B?N2lUbndoeEZYSzlYcWt3ZDBBUk5LNWowTnY0RFVMVFZVVHVXVS9qaE04RDd4?=
 =?utf-8?B?SEVITDEvLzVjbTUyNVkzVGJKWkhOWS9wc3AybTJCR2p6QXR5SUJtU214elBy?=
 =?utf-8?B?QlZDeXNjNjM4dFRWMkZPN1kvZTJiOUlRR1FMK1JLcFNIU2J1STB6SnN4bTNi?=
 =?utf-8?B?NGNxcnZsMkd0ZXlwN0NqRlJ4ZlUrYkY3TU1qMEJrRG1RM1NGR1ZKRVZlOUkr?=
 =?utf-8?B?MGhYWnVvKzJtMDlPWkJsQzdacFlMRllLS2FDRjdIZnhWcDFkRE1zaHZtekFU?=
 =?utf-8?B?QW83MERraklTbHhQTS9nclJNSFk1VENCTTFNSGdxUWMwQmN2a0JaS2psMnpr?=
 =?utf-8?B?eXExWk9qejd2dGpaRWlvS0NablZXK1V6bFQxeEY4cFpBNTU4SkNCYW8yTDhW?=
 =?utf-8?B?L2pieDJ1OW1rOTlTb29sRlhmKzIyN2twRDZDTXVING1JVDhnVlZPempYSC9J?=
 =?utf-8?B?S1dJbTFHZGpzSWNJaE9FblNDTDF1T0o1aWZMOVdNL0ZuNno1cGlBa1h4c3Rk?=
 =?utf-8?B?SmtWOTd6OWRuVWZTYlIrUDZZOTBoa0VRL2QrSFgralltS0FHMVVaR2pYZkFK?=
 =?utf-8?B?M1pDUURDNCt6aFJJMUVJRGhDNENYQXJLNUhxYnMxbHR3RU95M2xXZXJaTGky?=
 =?utf-8?B?K3AvK2poQUQ5dWpHYkg0cHBRbm5aQ0FJMElDSHdUTXEyYnJEcXc0ZW5BUDl5?=
 =?utf-8?B?QmI0NU5scjhpNW1Fc1kzRitKc040TEFsVkJrUksvVzRCQ2gwTDVkdGI5RVdG?=
 =?utf-8?B?NUoxdnBhaEpPNm51VUc4aU9OTjlHaWFGY29RZXU3VzZlRjZQTC9ieEFRb1Uw?=
 =?utf-8?B?MTlTWGIzWnlYTFU0S1hvTlNnWlZyZnZ1WkRobVBLZ0hWbk5DbnErRExkc1Zk?=
 =?utf-8?B?UUMzTDRkNU0rRmZhSjNzVlZSeXdMdjZHbzEvbUlyaHJ2dVlkdm5LT3NMTDZu?=
 =?utf-8?B?aTI2VzJieXppZzFPdjF2RFBBNU1HMzgzRVJERmhtTVJySDR2cFoxNFZSL04w?=
 =?utf-8?B?Z1JOc2J6R3NmWnlxTWRwVjUyMGd1RU5DMGN6NE8rRnZzZmVHSS92dmtDYml2?=
 =?utf-8?B?c3Y5VzFXM0lkbi80cFRGWGFxd21meUV0MTE1MTNHNVcyUG0veHFkOHBrclMw?=
 =?utf-8?B?ZGJBdWg1L0VHME1Fdlc5MkVjMWpvQUdzUkFnMTdKYTRQZ3crUXlHOVB0Wkky?=
 =?utf-8?B?YXA4V2RZTlpYc3U3MkNmUXYxWnJ6Y1MvVTJxUnJjUUY4U3h3MWhFNG9DV3ZF?=
 =?utf-8?B?djl1Tmd2SG9KMWQ4RmFIQlNQRFJQdjBCd0RkMHB0dHRnZURUUlQ4bGNhT3Nx?=
 =?utf-8?B?aGZMRmNYeVA1VzEzaUlSbll6T1F1bXdlWFh5NElRK1d2S1FiYUdYV0REUUh6?=
 =?utf-8?B?MTBMSTRlZDlFczNDTVpuTzJiOVJFbWZ2VFhmYlFBSHJya25xb0g5amh5NmJk?=
 =?utf-8?B?bVA1TnZyTHpnWHFUT3hJM3lVb3djNktCZTJHOUlXVERFVWdDWENibHpLTWV2?=
 =?utf-8?B?VUxqNnlCL2NxdDJuTTVxb2NTeWNlWHpaMmcwYlYyODdHYnpZTmdJa0lJS1E0?=
 =?utf-8?B?NFBaeXhtNE1aT2p5UERvT0pmZDcyMlZNUEtpbVVxWlRYUU5wbnBFU1ZCMml3?=
 =?utf-8?B?cHlFRGl3QmVpdm11bE1LUmQ3d2VRV1Q3ZzZPczZPNGxTZldrbHdsSkk4Si91?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db3d07af-bf92-4b49-e9ae-08de1d2c93a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 12:04:02.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93iiQchIYmpFbgBzq5HlVVa9YgPrehfgrdqpnzxgsm/JraJTY2ZZ7cHewFjVqTtPdJRTgo46UHNecgm0HwqJgqlhyInxLRKflfVkdSqIprc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
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

Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on pią [2025-paź-31 13:56:32 +0100]:
> Move MMIO initialization to verify_flr() after VF enable and PCI reinit.
> Replace per-subcheck MMIO pointers with a global context accessed via
> xe_mmio_for_vf() to simplify resource management.
> 
> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_sriov_flr.c | 90 ++++++++++++++++++++++++--------------
>  1 file changed, 57 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 38b303391..a42090744 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -55,6 +55,44 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
>  
>  const char *SKIP_REASON = "SKIP";
>  
> +static struct g_mmio {
> +	struct xe_mmio *mmio;
> +	int num_vfs;

NIT: I don't understand why you insist on using int for num_vfs.
You don't need negative values, and as far as I know, GGTT limits us to 1023 VFs anyway.

> +} g_mmio;
> +
> +static inline struct xe_mmio *xe_mmio_for_vf(unsigned int vf)
> +{
> +	igt_assert_f(g_mmio.mmio, "MMIO not initialized\n");
> +	igt_assert_f(vf <= g_mmio.num_vfs, "VF%u out of range (<= %u)\n", vf,
> +		     g_mmio.num_vfs);
> +	return &g_mmio.mmio[vf];
> +}
> +
> +static void init_mmio(int pf_fd, unsigned int num_vfs)
> +{
> +	igt_assert_f(!g_mmio.mmio, "MMIO already initialized\n");
> +	g_mmio.mmio = calloc(num_vfs + 1, sizeof(*g_mmio.mmio));
> +	igt_assert(g_mmio.mmio);
> +
> +	for (unsigned int i = 0; i <= num_vfs; ++i)
> +		xe_mmio_vf_access_init(pf_fd, i, &g_mmio.mmio[i]);
> +
> +	g_mmio.num_vfs = num_vfs;
> +}
> +
> +static void cleanup_mmio(void)
> +{
> +	if (!g_mmio.mmio)
> +		return;
> +
> +	for (size_t i = 0; i <= g_mmio.num_vfs; ++i)
> +		if (xe_mmio_is_initialized(&g_mmio.mmio[i]))
> +			xe_mmio_access_fini(&g_mmio.mmio[i]);
> +	free(g_mmio.mmio);
> +	g_mmio.mmio = NULL;
> +	g_mmio.num_vfs = 0;
> +}
> +
>  /**
>   * struct subcheck_data - Base structure for subcheck data.
>   *
> @@ -285,6 +323,8 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
>  	if (igt_warn_on(igt_pci_system_reinit()))
>  		goto disable_vfs;
>  
> +	init_mmio(pf_fd, num_vfs);
> +
>  	for (i = 0; i < num_checks; ++i)
>  		checks[i].init(checks[i].data);
>  
> @@ -303,6 +343,8 @@ cleanup:
>  	for (i = 0; i < num_checks; ++i)
>  		checks[i].cleanup(checks[i].data);
>  
> +	cleanup_mmio();
> +
>  disable_vfs:
>  	igt_sriov_disable_vfs(pf_fd);
>  
> @@ -489,7 +531,6 @@ struct ggtt_provisioned_offset_range {
>  struct ggtt_data {
>  	struct subcheck_data base;
>  	struct ggtt_provisioned_offset_range *pte_offsets;
> -	struct xe_mmio *mmio;
>  	struct ggtt_ops ggtt;
>  };
>  
> @@ -544,11 +585,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>  	struct xe_sriov_provisioned_range *ranges;
>  	uint8_t tile = gdata->base.tile;
>  	unsigned int nr_ranges;
> +	struct xe_mmio *mmio = xe_mmio_for_vf(0);
>  
>  	gdata->pte_offsets = calloc(num_vfs + 1, sizeof(*gdata->pte_offsets));
>  	igt_assert(gdata->pte_offsets);
>  
> -	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, gdata->mmio,
> +	ret = xe_sriov_find_ggtt_provisioned_pte_offsets(pf_fd, tile, mmio,
>  							 &ranges, &nr_ranges);
>  	if (ret) {
>  		set_skip_reason(&gdata->base, "Failed to scan GGTT PTE offset ranges (%d)\n",
> @@ -603,19 +645,15 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>  	else
>  		gdata->ggtt.set_pte = intel_set_pte;
>  
> -	if (gdata->mmio) {
> -		if (!xe_mmio_is_initialized(&gdata->mmio[0]))
> -			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
> -
> -		populate_ggtt_pte_offsets(gdata);
> -	} else {
> -		set_skip_reason(data, "xe_mmio is NULL\n");
> -	}
> +	if (populate_ggtt_pte_offsets(gdata))
> +		/* skip reason set in populate_ggtt_pte_offsets */
> +		return;
>  }
>  
>  static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  {
>  	struct ggtt_data *gdata = (struct ggtt_data *)data;
> +	struct xe_mmio *mmio = xe_mmio_for_vf(0);
>  	xe_ggtt_pte_t pte;
>  	uint32_t pte_offset;
>  
> @@ -628,7 +666,7 @@ static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  		  gdata->pte_offsets[vf_id].end);
>  
>  	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
> -		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
> +		if (!set_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
>  				 (uint8_t)vf_id, &pte)) {
>  			set_skip_reason(data,
>  					"Prepare VF%u failed, unexpected gpa: Read PTE: %#" PRIx64 " at offset: %#x\n",
> @@ -642,6 +680,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  {
>  	struct ggtt_data *gdata = (struct ggtt_data *)data;
>  	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> +	struct xe_mmio *mmio = xe_mmio_for_vf(0);
>  	xe_ggtt_pte_t pte;
>  	uint32_t pte_offset;
>  
> @@ -649,7 +688,7 @@ static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  		return;
>  
>  	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id]) {
> -		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->tile, pte_offset,
> +		if (!check_pte_gpa(&gdata->ggtt, mmio, data->tile, pte_offset,
>  				   expected, &pte)) {
>  			set_fail_reason(data,
>  					"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#" PRIx64 " at offset: %#x\n",
> @@ -828,7 +867,6 @@ static void lmem_subcheck_cleanup(struct subcheck_data *data)
>  
>  struct regs_data {
>  	struct subcheck_data base;
> -	struct xe_mmio *mmio;
>  	uint32_t reg_addr;
>  	int reg_count;
>  };
> @@ -846,6 +884,7 @@ static void regs_subcheck_init(struct subcheck_data *data)
>  static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  {
>  	struct regs_data *rdata = (struct regs_data *)data;
> +	struct xe_mmio *mmio = xe_mmio_for_vf(vf_id);
>  	uint8_t tile = data->tile;
>  	uint32_t reg;
>  	int i;
> @@ -853,14 +892,11 @@ static void regs_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
>  	if (data->stop_reason)
>  		return;
>  
> -	if (!xe_mmio_is_initialized(&rdata->mmio[vf_id]))
> -		xe_mmio_vf_access_init(data->pf_fd, vf_id, &rdata->mmio[vf_id]);
> -
>  	for (i = 0; i < rdata->reg_count; i++) {
>  		reg = rdata->reg_addr + i * 4;
>  
> -		xe_mmio_tile_write32(&rdata->mmio[vf_id], tile, reg, vf_id);
> -		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], tile, reg) != vf_id) {
> +		xe_mmio_tile_write32(mmio, tile, reg, vf_id);
> +		if (xe_mmio_tile_read32(mmio, tile, reg) != vf_id) {
>  			set_skip_reason(data, "Registers write/read check failed on VF%u\n", vf_id);
>  			return;
>  		}
> @@ -871,6 +907,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  {
>  	struct regs_data *rdata = (struct regs_data *)data;
>  	uint32_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> +	struct xe_mmio *mmio = xe_mmio_for_vf(vf_id);
>  	uint32_t reg;
>  	int i;
>  
> @@ -880,7 +917,7 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  	for (i = 0; i < rdata->reg_count; i++) {
>  		reg = rdata->reg_addr + i * 4;
>  
> -		if (xe_mmio_tile_read32(&rdata->mmio[vf_id], data->tile, reg) != expected) {
> +		if (xe_mmio_tile_read32(mmio, data->tile, reg) != expected) {
>  			set_fail_reason(data,
>  					"Registers check after VF%u FLR failed on VF%u\n",
>  					flr_vf_id, vf_id);
> @@ -889,18 +926,12 @@ static void regs_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_da
>  	}
>  }
>  
> -static void regs_subcheck_cleanup(struct subcheck_data *data) { }
> -
> -static void cleanup_mmio(struct xe_mmio *mmio, int num_vfs)
> +static void regs_subcheck_cleanup(struct subcheck_data *data)
>  {
> -	for (int i = 0; i <= num_vfs; ++i)
> -		if (xe_mmio_is_initialized(&mmio[i]))
> -			xe_mmio_access_fini(&mmio[i]);
>  }
>  
>  static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  {
> -	struct xe_mmio mmio[num_vfs + 1];
>  	const uint8_t num_tiles = xe_tiles_count(pf_fd);
>  	struct subcheck_data base;
>  	struct ggtt_data gdata[num_tiles];
> @@ -912,8 +943,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  	struct subcheck checks[num_checks];
>  	unsigned int i = 0, t;
>  
> -	memset(mmio, 0, sizeof(mmio));
> -
>  	xe_for_each_tile(pf_fd, t) {
>  		igt_assert_lt(i, num_tiles);
>  		base = (struct subcheck_data){ .pf_fd = pf_fd,
> @@ -922,7 +951,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  
>  		gdata[i] = (struct ggtt_data){
>  			.base = base,
> -			.mmio = mmio,
>  		};
>  		checks[i * subcheck_count + 0] = (struct subcheck){
>  			.data = (struct subcheck_data *)&gdata[i],
> @@ -947,7 +975,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  
>  		scratch_data[i] = (struct regs_data){
>  			.base = base,
> -			.mmio = mmio,
>  			.reg_addr = SCRATCH_REG,
>  			.reg_count = SCRATCH_REG_COUNT,
>  		};
> @@ -962,7 +989,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  
>  		media_scratch_data[i] = (struct regs_data){
>  			.base = base,
> -			.mmio = mmio,
>  			.reg_addr = MED_SCRATCH_REG,
>  			.reg_count = MED_SCRATCH_REG_COUNT,
>  		};
> @@ -980,8 +1006,6 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  	igt_assert_eq(i * subcheck_count, num_checks);
>  
>  	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
> -
> -	cleanup_mmio(mmio, num_vfs);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  
>  igt_main
> -- 
> 2.43.0
> 

-- 
