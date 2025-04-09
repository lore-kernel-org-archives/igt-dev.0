Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FCC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 16:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8D610E040;
	Wed,  9 Apr 2025 16:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MS+Y4ChU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274F110E040
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 16:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744214545; x=1775750545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Sgen1Y3Ffxge6aqGabT5NqSGF9/69rhy0Eph0xMDE4=;
 b=MS+Y4ChU4q1MpO+wPFym+5B+wpUQuv94WjPScK7MnfyStFXp7cZB3pJZ
 sIAmw/SLmoGnCXmI5OXrTS5OfG9sNCRTGAlXLedArDQHafE7qF+OhJ6BM
 E9M2VabQn6Vg38sWta7Mv5gcqQeXgoY2BBZ+5dNkPAt7fZvuVR2mTdSn9
 IF3d0cL3EIqAS3ngGhWsuptUoaXThtKEPDmAlYnq+HcaKjzR8H8YxDUnN
 pGXxK/+cqfBDKBjXNldAC545lQ+5iw3G9MCocmD2LEJ1/Fu8NT58b5fcb
 LU2M1Diy1gIhtMTBJBKc4ojPL5spKuaujiQ6GeKi1a9+bPAzYOjMxSMJJ g==;
X-CSE-ConnectionGUID: 4/P6zU+9QAaN3Hd6LqtX+w==
X-CSE-MsgGUID: m5AxzN4qTraDHxdKKDq5LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68178089"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="68178089"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:02:19 -0700
X-CSE-ConnectionGUID: S+A2tVyBRvCmCT66IEIK/w==
X-CSE-MsgGUID: /yhgBlA/QAiKZAhqIwqfng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="129590756"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 09:02:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 09:02:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 09:02:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 09:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCAo+p9K4ysNmuWco7gdF1uel4AHU8yXN0HiZYmbEzHF8xFPj/iuk+8uZx1cVkgYN4KNLXj5l1RN0WbmHLqMjdyVdP8ZBynunWspwfSrYNu76wnsqZvDg2xjccsryzcnoVMFW549nJC+0Iefku2CP33TXl3NR3w0U+v8KVUAbTWFi71vHngm+G0v04TX15d125ob31yOgC247ZGivgz8nh0FckvyLs5XywuUgQSb+MIo+iUGjdQ8OMiR27ETC+L0TUoXPeo/Ul3hHEPE3dcvQ//5SasI3PI2fK/3Vj0MJ8azJR7WN+fKhbb9SecAvBZ/SK3ACj7HxsPOhLL5k8z/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDk+g72mJZmTThRY1vOSoWnWnEKeV6ORBjojHYd/sP8=;
 b=gnZVrtaI9We+noJt9LLCAtHdStPl/sAKj28sCLrwN6WhPYV4+4kuf2vYL5tLaKX7T4QgyJ0TCtCS1BEvdfYYlKis0omfz1SYKIB1yiA8D/arcejByGlgTnARHRWPn1vUVzH1dg6MBmo7BH69x/X2oCCXnOfGUyfJ98qUg15ZI/9Kmdyu2Gi+7H0LO9+OEZHseHTpgDlyx4Vtr7wSm5Mx+zV00dFc5P2uB6ARxQ6hOZUlqmyTWpNQRvqZejlfZsmehIFgk74BUk3nkIJRG16WlsZYEBXYybgwOewUqblespy+JRmvMmkaDoeoKL4rO5uoPRWhlnLXOY2QuPmZ+kE5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 16:02:09 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%3]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 16:02:09 +0000
Date: Wed, 9 Apr 2025 16:02:00 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v6 1/5] lib/igt_device_scan: Add support for the
 device filter
Message-ID: <c7etefnkdppkdkklkwmtyvviiibtw4mo3a5726fpxkd47mb4vg@k7b5urxbuqfh>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250404132421.1920451-1-soham.purkait@intel.com>
 <20250404132421.1920451-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250404132421.1920451-2-soham.purkait@intel.com>
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f4a27ff-401f-48f8-07cd-08dd777fe1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEkzd29tTi9VcFQ2dnVZbTd2ZkVNQ3FoVzdZbkxLaTFOZkVZMXROdE41RkZo?=
 =?utf-8?B?Y0NORVhtT1BtUCsxRlFaZndOY2lVQURBaDJzcjZiSllwK2R0bVZUWGJmbVJ1?=
 =?utf-8?B?eFJkNitGdlNTOXAySjZyRERXMlJnZnJNRnVjZGtDdEpzUFZsUldTZFVPZGlz?=
 =?utf-8?B?WEh4RC9MSWlkbE4rWXd6aExIRzZhVEZnVjRORVhRRXNFdXYxTDhNTWxrNncv?=
 =?utf-8?B?K2xhQ1hnOTUvTDFLZjZ5aWhIOU9lMkhDRURBYklueEtNZGhTOS9JMVZkWkMz?=
 =?utf-8?B?TytjUjlHQkpuQUV3RTJibjRDMkJkVkNNeW9zNFd6UGpjdzUwMXBSL01pK2c2?=
 =?utf-8?B?QzJ5VkwyWGZ3MjZnNWN2WjFueGo3RCtoQklPeVczbWFLMVI5MC9oNHoyUGxq?=
 =?utf-8?B?QjVmeTZzcU5jb2pIS1NhekgzbHlPaDJDUWEvRVpEVFZ1ZlhqVnlTdzRKL1k4?=
 =?utf-8?B?Wi81N3hleVBiNVR6WUJaU0dLRGIxMkt4UEVwMzZJQUtQYzdmOTEva3FFdFFj?=
 =?utf-8?B?eXNDdlJGbnZvMTdXUHppcEpvRWY4ZDlINzc0RmJvUFF1T1oySmpyNzBxWTRM?=
 =?utf-8?B?TEJ6cGlzSE1pTjBFQTVHY0NBOVdYdys0YytOUXhDUE1oZGlYNGNwS0JrNGYx?=
 =?utf-8?B?dUUrdjExZkRMalRsWEIwVGhNUVF6TkIrdzhCK0VBdUJ4VGRweW13blZTMDZr?=
 =?utf-8?B?eGdEYzlSSGsrWXYvS2V4aU91OFU2bHNESUtWTTIwK09LY0dkY054anFJbUdz?=
 =?utf-8?B?ZDE1eTh6dW92aUpqTk9GNkluUDdwbHY4c0tGb1RhSTY1ZzlmVzRCSHdtb1JS?=
 =?utf-8?B?WUxpRG5GMkF5bERTK3JCOEd0WitVT05vNklZdkRKR2hvL3ZkSVdqVlNUQTJF?=
 =?utf-8?B?cVV5K2wrV2FRN3djbHpKL2lSdFVNd3JCd0h2bERTeTFFNDZQQy9qYmdiWllw?=
 =?utf-8?B?di9JaUFBMU1aWUhtcHlkWmpyUDFHank5eC9kY3hPTXh5Z0J1clg5cFRsTjZO?=
 =?utf-8?B?YnRJMHhmVGM0cGNXZGhaM09NR2hwV3REdm1lRXlUWTMvS1FyUUd2VW5DRHI0?=
 =?utf-8?B?VU1ubFFrVytLSkR4MW5WcDFiaVJ4SnJrMnhHZnRjZ203akhLQndtcHQ1dzRB?=
 =?utf-8?B?aGpBUnA4SlE5OXg1S2NKQjdlYlVMVldncWpmWUVGYi9URXJnNjNDQ3NrMU52?=
 =?utf-8?B?S08xSVQxc3l1QVRCL0NFNGo1REFJOTkzbVFFcHB1YkgyRlE3aGt6bXFYcEFp?=
 =?utf-8?B?R0xZV2UyUmlRVDdCZ0YvYnM3bDgwL01DQ21ubWttVXUvR0pnSzNLcVVlNXJT?=
 =?utf-8?B?aFd0MWZ6LzlONERXQk8zSWFmdDBSY1gyaEc1THFtcndjTkpDRCtVU1BDeFpy?=
 =?utf-8?B?U1Z1M3ZBbXQ4NlRaakJSSDdkVU9CSkhwWjVFbU80dkxXUjdhR2ZRQ0hEUlRO?=
 =?utf-8?B?NEVpNEsrbGREd2hOQ1FmWEVUM0VkWmVKNTBIVVdqdzV3TmN3QW9wWUE0TjR4?=
 =?utf-8?B?ZWI4MksreWdwM1lhMVhQUDZBN2IwWmZXd05weWwvbnN2UjBaMWJ1UHU0NHEy?=
 =?utf-8?B?aWl5OHJjRERUNmxrZmhCMnJwQ292bktYUFBJNnNvZk92Tmg3Y0FFT2U5cUl3?=
 =?utf-8?B?aTM0NWJjNy9GbmZpN3BGeG1ZNktRaUtsWkdJOGhLQUV3WGpPSFMxc0FCdkZz?=
 =?utf-8?B?dDVlTWZWelZRWjRsU3V3bVZMaXZ0V3gyQkUyb3U3Z1lXK1BpKzY2cXIxSEpM?=
 =?utf-8?B?QWpteEtLOWFNZ2sxU3BUREdDYUJDVjVJZjQxR1FqZkJDM0tYN0tFZDFBelNN?=
 =?utf-8?B?Y3BqVjZqaDN5dWN2L3l2b2hmQml3UzBsSzJvUG9lbko5NlFPK0hlcHF2TTVq?=
 =?utf-8?B?SmRoT00ycDZ3K0lSWlo4T0oyYUZVUU5DQktrUVJQcnZQaFZqMXRiZUlTUExj?=
 =?utf-8?Q?OiJnrYgrf94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25lelZZN2VHc2lvM0ZXcStIWThHWjRvYksrb0pvTjRnYzFpRE9rcjM3MjJD?=
 =?utf-8?B?S21OcHh2K0Nya0VsTDVzOThwOEg2UEp4Sm5ZZ3BuMmh2MmlkaE1WdWJsNVBI?=
 =?utf-8?B?eEZKcmVUVC92KzdrSmQ2Y3J6YTFwZCsyTFdvanNWRzVPQThEaFl4QytoNXFI?=
 =?utf-8?B?aTF4WnIwRlQ5RkkwUEZPeFRJdmJHVVU4YmlxSnhsTkVPUGo1d0lGbk5mWWZh?=
 =?utf-8?B?TFVBNnByaDhSRGIzYjdNWFhCd21jRXlmNWt2WmVMcDR0UDJGOTJKc29uQm95?=
 =?utf-8?B?MDJXNlEvc2tndjVSQXlBWlBCODMrRGovejhUdVVjQU1EVmJrUytOK3p5ejVH?=
 =?utf-8?B?RXdwZ2sydGx1NHU0U0ZSVnhBTXRyanU1R2hjRDAwOWg3ZnNWS055VThnRGhT?=
 =?utf-8?B?NFJ2eG9BZjhuNlZVNXNmUkp6YzIyZDhpZVB5aDFhSW5veTZKb1lQZnk2TFpP?=
 =?utf-8?B?dmllQzBNeHJyQkdtTzZ3bGlaZENQVW5HZUNOYVp0ZGZZZnBwQ0FHMXJqZTFF?=
 =?utf-8?B?ZnllV2dpZHp6QmRNcDFIalR0bVY4RkMyclpKaGNrUmc4L2Fnclpwdm03NDFr?=
 =?utf-8?B?a2Zyc2JTQm9JSml2THg0WUtGSFo3U3RNQVJqeVp3dE9MSzVUN1UxZzFORU5o?=
 =?utf-8?B?YXA5bWRaWUdDWlY4WUFJeVdJOUZMZkVUbkNpVGM5QVJSb3R3bnJGdzBtUUxK?=
 =?utf-8?B?QS91bzMzSWJqd0lTSnhvU0xmdmJVNlpLd3ZYUUhUK0dxY3lseEJEU3Jvd2xz?=
 =?utf-8?B?VUJnbGhobENVaVJWL1BjbEJXZXh5NFFLRmZnc1Z5Q1NjVkl2SlM3NUM2YldW?=
 =?utf-8?B?M0t0MmtnR3RPNHNudmxUYXg4QktoT1JCeXN2cTN1Nmx0ZGVNMU9pOXdtVmNO?=
 =?utf-8?B?dTdOZFU5UlhxK0pRczBkWmNlQ1JldjVmaGlFY1NaNVpzQ21obUFTbnIwU1Vn?=
 =?utf-8?B?S3VseE1CeTN4MVpTTm9XemEwRWlUUld4OXpmb3JENmZyTmQ0L2haSzdXazlJ?=
 =?utf-8?B?VG1aQXVCZy8wa0xjNC9VemlwWGNhQ3gwMEF6LzF5a2FORVlkR0dVMVRKOGtQ?=
 =?utf-8?B?UHpDTk41aENIOFJxVTRBSExzSm1rZW1vbGE0WUdLNVgzSGMxaUJ5LzAzd0Mw?=
 =?utf-8?B?Yng5YjhTQ3hUSkFFTmF1OGJZVXhiS2o2c01Dc2VxMkVEVWRRL1VtUWVQbmdU?=
 =?utf-8?B?dEpydG03ZTg3UnRuUzZYOVR6SVBrdnRFZklKL1NvMThPNkprMk40UytNaTJo?=
 =?utf-8?B?V1U3ZnFCS0JlSm1uQlFVNFUyUXd4VVRXck9ubkpKSXY5M1ZHMk9ZUncyNE9i?=
 =?utf-8?B?a3hzSHhCcXZwZ1lwOHdyQlF3cUtrSUZhc1d4VWFMUm5qMEZmTVBZNHRoOFIz?=
 =?utf-8?B?MDdjekJGNjhkV2dHakUxR0lqWWpoNDRhOTBFbGVlLytad00wb1JGcDJCUnZE?=
 =?utf-8?B?Mk42aFlKaWp1RkZZR3M5YVZjYWRqQnpEaWxWU2szNTh5cXNNdHIzZWpleTFv?=
 =?utf-8?B?eTRuR09RbkRoeFNPcXh2R3ROSzluTTBGRVprbFpWQS85eEU0RkpmSWNPMDF1?=
 =?utf-8?B?RG0wWitmVmN1REhIb0d0dm14RS81Z0ZKdStFQzh6ZXFEUXZFR3VwQVY4MzVD?=
 =?utf-8?B?dXNrdVhCNEk3LzFWNkhZZFMybHlNVlNvejEzVTlqNHJWTlJUQWFQNW9wSXNN?=
 =?utf-8?B?cU5VVXlJWEFVTENyZkpBbUQ0UVhvcmExMi9FbVcwSExpeVcvRXpvWUNadVE1?=
 =?utf-8?B?aXZRNjdBWGNlMVdqQzhnSFo4T0YwZFl3blI0c3dDWlB5TzBPVE84cTJHRVpC?=
 =?utf-8?B?a3U2QjNibTNuZ3piVHpVOVdvMENVOC94L1hwWTBsTUlZZDZQdE1KUjBRZHEx?=
 =?utf-8?B?dUNGenVIUTl2Nm5CV3RYS0xvb2ZiYUp3NjRQNzFCZVg1M28vQVBVY09xRC83?=
 =?utf-8?B?ZHowbWJxSnRYMmlVV2RVWW5rdmVWN0hzU2JPeWZ2MjlmZW9tZUpEYXNpY3Mv?=
 =?utf-8?B?UUFjZVM5ZW4xM3BKVVR1bXVzbE50cUljQTdpeWtBSUJLMUxaWDBuNC9Ta0V4?=
 =?utf-8?B?ckpKdWxZVWU0V2VyYlZiZEFOMk1BQStCdkhuelA4Y2dyUkpacVhiK2dKeDk3?=
 =?utf-8?B?VFkxakR5YTFaK2doUUdVRW5vVVpvV1pQc2Nzc243akZnUHNZOUpxWDkxNFFC?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4a27ff-401f-48f8-07cd-08dd777fe1fc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 16:02:09.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALBRDOD4cei38HTSrQ3GG4LDITa3tBWMtLft7eikx4NSQ1i9Ky4eAj77uinsqN0Sp9iOWLrKY1ELmmi4rIhH93kIB/VbdNCCYeQ4qF43Ncc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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

Hi Soham,

>      Add support for the device filter based on
> driver string, device type (integrated or discrete)
> and card number.
> 
> v5 : Add device filter to filter out
>      matching devices.           (Zbigniew)
> 
> v6 : Move device filter with Separate 
>      commit.                     (Zbigniew)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>

The patch looks good:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
