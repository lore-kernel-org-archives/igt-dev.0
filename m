Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E81CE8D52
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 07:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EF310E68C;
	Thu, 19 Sep 2024 07:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtQ8/jQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64A110E68D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726729657; x=1758265657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AKaDxcrEqSAUREVS7b5pYYLumOScEvSR4pI7tSUvtJM=;
 b=AtQ8/jQXklCOShJOKPuUdyD5WZLGF4wNjX/MXg4jCiw6+QxBSEbA/vz+
 knI+4YRaO4A4ESnIj23lbiUH6A83nO+G2lao/Ta/6cX/LhhPFEnL0R3rb
 WUkuxLYr2xOhhQsvpHH2kysrGBGpfWwLDJMiZxwnU//4f2kJST7uO4FUh
 bn8tgY8/tyq3O9AmTmGJQrsSNH8nUi16E93gNBW6F+6hIgSA3HDHSW01L
 YCpBsgslFLgpUJYLp5PM8yDS9okJPgx+mWprj9p8elRhF+lH+nSJV0ndI
 PcHrkrNzXt5wfTJNKgXoWJ1W/E7ves2s2XjRu1pIQesx1bD8A7YJ6UWIO A==;
X-CSE-ConnectionGUID: Uff4Tk+NQI6iQQcXbHUeKg==
X-CSE-MsgGUID: v27xFnYHSnGtXE/P3qIRIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43191739"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="43191739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:07:35 -0700
X-CSE-ConnectionGUID: pdNi/dUHRhS/RSWpKK+uJw==
X-CSE-MsgGUID: PY8aSKXQShq5N8EyIyoicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70132913"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 00:07:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 00:07:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 00:07:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 00:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYffCSHRcH4ZSBjdDIm9IKvFCsL5rYIGfjuAku41UI0samBXVTIkb9cO4Xrf86SI/AsEGgW+/mFZzBJpteV59aVw1qEn5v9upxUvE8sERnIWUkL5KCaqElv7tWJIEx+ylUhJN46OxdKHrkVhawmTkI2Iq8JFGLfg8+PUEOKW7kTeQFhZYvtNOmfVdjF9x9aGj+mDthedof5r/iqvx6tfGLaZy8kZ51z9fVfkM57OW2Rg5ctBgZoSUREIhUUODIGO0RLjWCyJUyWpI5Jxf9NrGRyaTgHPeVvB7fFiB0tnfDFA+vZloJx5RpkKtt1YI3UsiAi2dGxWB5DO09sq9tJ+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It5aIvetJMbDiTyZU09F+ZhdmJXuOZfl6T6uWYoJgs4=;
 b=GbI1lPk9WoNdqUUI0DT6F1ZAzP3u4ZkKy01H9KZm1lIai3D4Edt97H2h9aNGHoBmFNm+C7GphV3G7puK7lxq1Auy5+icwCPOUCrP9n6cv78oKJbkNf76YrkuV/v1oOt+LbjRpUH25Id9JOq1KK4vfzwtR/cVWNIoXh/jJNX8qAH/Monma+E87O2yOXevvD7cWdNDY07lSQ1uuXtik4vzeTwfVsWaAtSn+RXoiVqtypLc8/x1HnMzE8mjQi9UyBsIqIFEruRbKZ+gj5z6qdDTP7hCyvAG5mRqP8tTmuwSGumg0wU5lH1i4hilGpfip7UXZfFIZtTTdscydZC6lVjg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.17; Thu, 19 Sep 2024 07:07:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 07:07:28 +0000
Message-ID: <6374b703-48ee-45eb-9529-f2bf04622ff8@intel.com>
Date: Thu, 19 Sep 2024 12:37:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and
 sleep times
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20240919063352.1607048-1-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240919063352.1607048-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 94aab721-aca4-4702-bf7d-08dcd879b8cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW05V2dVbUJlMVV3WHNwU2hDSEkzU2RwMCt6VDl0SWVNY2FSRDFpWXg4bUhH?=
 =?utf-8?B?OWZmSkpZd3M4U1JnU2RuVEhRSUZQUVFYWTB4RDB5U1EwbGNETTh6L0xqOEVY?=
 =?utf-8?B?UjVlaTN4N1JocEprakF1SWJCS3VhTFBVd2IwRG5SOHNjaEpCUkQrUTh3Wm85?=
 =?utf-8?B?T1Q1OGFaMER5cVRpeEhyTW05T2dmbDJPMWcyaFhhR2lRczByZkViRCtOQlFX?=
 =?utf-8?B?VHJYQmtpR2FEYmJLNVBscUpvbzdQNEcyZTdRS1R5UjhOVzdrdWVCYy9UVFAv?=
 =?utf-8?B?aFNCN1RHbkVkdzZ0UThIYldiREtrN3J6N1dRZWpHMDVGQW8yOGRGQW1QcHdC?=
 =?utf-8?B?cFI1RkU3dDQvK0pja2ZBaElJUUxvYUFmK1d4QURDbXgyMDFBay9YeVVDVjQv?=
 =?utf-8?B?ZGN1bjZ2bmNaUUdDL3AvV2MzSmpXU3Q1MnpnVGw0aVAzS0VyRWp0OXUzOGdK?=
 =?utf-8?B?M2krRjRXQyt4WkllZHZtS01BYUF6Y0czTjdLZ3JmWi9ZUGJOc0ZCRExGb3lZ?=
 =?utf-8?B?UHRWWkpVNDlWSVBZYU96QWhUdng5bHliWGQxbUs5VEMzendSRDNaTzlaeVoz?=
 =?utf-8?B?WDlYelZtWnZtSEhpeXdGNVJUb1FTTXNXdGRNVkkxYUR6aHFMOWZKWlh6VTdw?=
 =?utf-8?B?K3BPN0ErREdBRnJQQ25RZWR1bG9PaHpaVENDSC91QnVIQ25IUVdtdFVXdSt5?=
 =?utf-8?B?RklLY2tCaDVkN0pnZThlZUhIcWJyQTNPNHpRSmd0dklocFkra2JMQUxpVUl1?=
 =?utf-8?B?YnJtYnhiWFUwb3BVbmtYbTBReEpUdGFPWWdnckkvS2RLUDRDVEkvQXVVWXd5?=
 =?utf-8?B?TDdIR3lpeVEzUlFUWFpVOG1YQXBXamJLM29YdVpLa3BnZitXZFl2ejJVdjNY?=
 =?utf-8?B?d1BPaWVudWQ4d3hJVkd1cy9mV28vZEw1czUxV2k2MVpWaUF0TC9SbHhNRnJu?=
 =?utf-8?B?b2lPT3NBWm9Tc3FmMzFqZlhxbXdQa2ZMOGsvbTVYcHd6K00rTUl1MkdOekxM?=
 =?utf-8?B?bkxuNVJmdFRPOFhMS3Z4bVl1amxiV3RLZlJ1N0pnUmMxUXV0ZllFYlNYckZv?=
 =?utf-8?B?TGtnQXlTWTUrUlV3b1FoUXRGZjJYcU51enZvM2loRzZySlJOM0EySEluVUhD?=
 =?utf-8?B?dk9IeVI3SUE5QUwrcU5wT0oxbTlEOTBtTVFUNzNiOTFJdnRvOTNGRStGNm9O?=
 =?utf-8?B?a0pxU0dGM1k2N2VzczVnQ3hpdFZ4VHp3c3lNdU1WSzQ5elFweURKOWhBWTl1?=
 =?utf-8?B?d0Nla2RpVEdIWFpucjFnZHFSVlFvNEZUNXhublcrUWM3S1lPcjdEdnZNQloy?=
 =?utf-8?B?ZnBFRkt4ZDhBaGtHWjNCQUorUmtkeEFvMzVxaVZnMncyRUgyMjhXL2U3NnIx?=
 =?utf-8?B?UDJoQjF3OGd1Mkd0eHgzVjNnSmV1TXczY1VQQUtEcEpUc3d2OUMzSWxSQW5a?=
 =?utf-8?B?aVN5aFI0Smg3R2dlYklCRHBoYWY2U0ZLaTNqS1NwMlVyb2VDOW85blRwamRU?=
 =?utf-8?B?S1BDbWV6d3IrSW1mdVQrTHlqaWlFVis4Nm0rZkZGOVFiZG1CUlEyaWU4aTB2?=
 =?utf-8?B?Y2s1U0luVjJvVGxKZ2ZuYTlaUDVzOVc5Vk9ZeWlBbFhhd1pEbGlUSDZVVGU5?=
 =?utf-8?B?WHo1VVFiaUtEWHFVRForT1diVXlyV1lYWENOYzdvalpEMU5paEQvUFVGTUsr?=
 =?utf-8?B?RC81U0tVNUpoclI2MWc5WEpsZXdmeUFNZm50MmI1MW1WRHBQaENHWVVFajBS?=
 =?utf-8?B?c3hEelM5dGhEVGdOdC96N1FKU0hMQzNsUjJEaFR1S0xMWmdxeVo2RU1uL3E2?=
 =?utf-8?B?b0tGemVobFRYdEhOVFVQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzYrTFZhRDlFRlFIcGFablhLZXp4b0VXQ2NReFR3NXZtVVdBOHVGTnJsUVpL?=
 =?utf-8?B?Q2k5dVJ6RDhGMnlJZlRTdU9IZ0xCR0UrMXR6L0NseHpPdHpFakExM0Y5b1dJ?=
 =?utf-8?B?Z1hLS2lXdjY5NXVlWjVnZXBLcjFCbGVBVC9TTlVDemgreHVvdG5od2tGVlZi?=
 =?utf-8?B?MUZrNmRvY3FBQ280bUxJb0p3RkVBTG5KUFFvWlN2S0htMG5CWitjWWptVVh5?=
 =?utf-8?B?elpEN0NnaU04Q0ZiQ21XRmY2ckhSVXZOSmJvUGY0NVdEY0NWZ0tpMGRjcEdy?=
 =?utf-8?B?ZHZRcmRENlhRZVZEdTFNM1NFSVZsVm01R2gzS3VhK2tFeUEzbzFYU0hBUnZk?=
 =?utf-8?B?OVgyZ051RldwemFYUnFHaXE4NDhaU1RBbUNGYnYrMVFIYmMzTnMzbHVIRlpv?=
 =?utf-8?B?Y2tJWFlWNHQzejFoQlkveVV6QkczVjJrSms1MjVlQkFJT3J5cVI0cWtvdlJp?=
 =?utf-8?B?VmpxNS94Y2t2UWV0ZXJZTGIzRGZzQlpZeldzV2lNcWJieVIrUkVYbXZuNjd3?=
 =?utf-8?B?c0JWZ1J0RXVidmxWUWpmNGxiaG5yWjJLUkQzejRTai9UalZLMDlOS09WcS9M?=
 =?utf-8?B?bEV2eGQwV3VCQ0NyYXU3TmY0Z0VVbm5rR1hGYytNNUtnbDA3SVF6UVJYZlRm?=
 =?utf-8?B?ZjV1SWRpTVVkWi9hSXZaZWlQNHFabURkRzRtNWI2bTVFWjJ2Q0hnemMyUzUx?=
 =?utf-8?B?NHo0bGNTcG9TWDJBb3ZIdWh0NTdWaE9uYzRLVHVvQ29LcldhYklFRFYrdDhj?=
 =?utf-8?B?TnArWWJCeTI0VnhyUGJPeGcwSnc5bUtTaU1wSGZqWG1FVzVrRUtCT01hblgv?=
 =?utf-8?B?WG1xOCtkZWxqR2x0WE9tbUVnUUJYNFhRa2NyOUZzY3RFZDEybFJWaHFHTm1Q?=
 =?utf-8?B?ZEtvZWRTUGNTdklMTDlsNzQrYWk3ZTN0N25YNERQaHFXSjBoWDJDbWRvTzQ2?=
 =?utf-8?B?cnVZQURSNmNsdDU0MzQ2ckJMcG15SXY3ZHZDTCtWd1ZNSE5TZG93eC95NEl4?=
 =?utf-8?B?N2ViMGpjZyswTXk4L2tqU1VldDd1R1ZGNzNOMXZqVTJ1RHVjVms0TFZzejlF?=
 =?utf-8?B?R1cyK1ExTG1NUEZkZTZQS0NDVmovWnlGZTlmQWdJV0RNWEtYNzJ1TjFpUi84?=
 =?utf-8?B?MG5ucG9mMXl4OE5vejRqY3prY2NSS2UxcVppbjNzOVkwNGk3OFF2NmpWdlg2?=
 =?utf-8?B?TGg5MmFvcVJ1ZkUvRnRBUTBkckFGMzBvdEdOdWowa08ydWZ6V2NCL3JEUnBx?=
 =?utf-8?B?RFUrQ1EzbS9KUDlRRnBhdXFvWTErTnVoeG11NlhsZ1NHYy9lYlJxNE9SY3Uv?=
 =?utf-8?B?c2EveEgzK1FmYTEyYmUzODJ5djRMVWtCdlQ5SFlFa0EzdG85bmNVNUdPem5x?=
 =?utf-8?B?VStQR0NUa1hkZUJ3ZXJ3MGE2RUpBU1V2VlZuZlJxcmgxOGlwWWJjYWRnK0xp?=
 =?utf-8?B?ZytpbFNxbjBKdmRobml2U09uVkZod0pYQkRONmhxWnlPZCsyQStIVmJxVHN3?=
 =?utf-8?B?c2lhS0FrZkJaemlDQTJwNXZhbzEzNTNxNnNZWU10L2dySEhDNWQzSExjQWd0?=
 =?utf-8?B?K1ducUg4VDk0MWNlRzNjbTZoUkhpbXdxYkRlN0FmTms0RXJpMElRblBRaU9u?=
 =?utf-8?B?QklSaFJGKzFZUU1pNWZLZ2MwTjcwbTJJNmNHV1NRUFM3SVUwdGpoeUZzN1BQ?=
 =?utf-8?B?SGVuVEZTMXRCS0Fnd1g2cUJCdVlCM0h0alVmYzVabkRFaGJDUURrL2FVbzFk?=
 =?utf-8?B?aFlMYXozeDV5YjJxS2dQVE9NRksrZWkvMzM0dWxyMXEzZ2lXSUFzc1pzUmlx?=
 =?utf-8?B?WUc3NWViVmRCbk4zTHkrVFZYMGg0bndVS3BBMUpjeFZGYWFPT084TVdjK3Vu?=
 =?utf-8?B?L09qeVBmVDJjVWxoNkNlVm95TVluWVQyQlR6SXZBTXd0bCtpaFd0Wk1hVUNp?=
 =?utf-8?B?cFlYU1dHY1FzSTdKR3VZbEc0R0EvdnVYbGNQSXpnM0VpdzFVc3BmSXg5bUs5?=
 =?utf-8?B?RE56amQyZ0REN25DREordXBmT1B4UVI2YkVGNVRaR1R3bFBTK0ttLzlxclA5?=
 =?utf-8?B?bUx1ZTNpWHUxVEhWbWhJYzEvZ1VJU1UzVnRVbi9YQnhIckllb3RSMzJJeGl3?=
 =?utf-8?Q?ZT/7eeLMP0xxTmvHyPwyRs28j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94aab721-aca4-4702-bf7d-08dcd879b8cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 07:07:28.6375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnnU2H61IA1VlBNe/Jn7d0HME6Gq2Ubdeot7vr0Bj1UdDSQ3hcy/UzORkU6jy04yt57iVbry7JwZfNolTyowlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

Hi Karthik

you had sent a patch with assert prior to this. Don't we need
that?

Thanks,
Riana

On 9/19/2024 12:03 PM, Karthik Poosa wrote:
> Print the workload execution and sleep times of the test to help diagnose
> timeouts.
> This will show how long the workload ran and how long the test slept.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 0e687558b..3c3b33ab1 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -139,7 +139,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>   		elapsed = igt_nsec_elapsed(&tv);
>   		igt_assert_eq(data->data, done[1]);
>   
> -		igt_debug("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
> +		igt_info("Execution took %.3fms (submit %.1fus, wait %.1fus)\n",
>   			  1e-6 * elapsed,
>   			  1e-3 * submit,
>   			  1e-3 * (elapsed - submit));
> @@ -150,6 +150,8 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>   		 * Execute the above workload for ~1% of the elapsed time and sleep for
>   		 * the rest of the time (~99%)
>   		 */
> +		igt_info("Sleeping for %ld ms\n", ((elapsed / 10)/1000));
> +
>   		usleep(elapsed / 10);
>   	} while (!READ_ONCE(*done));
>   
