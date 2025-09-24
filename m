Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF85CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 13:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732A710E239;
	Wed, 24 Sep 2025 13:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gENsbWWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C610E239
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758719488; x=1790255488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mC/6ijzJJnSHZPh3AVaUrRzS74MTeFD3PCc60FsTd1c=;
 b=gENsbWWWg4n2B7tj65oxEd8eOj2/KjZIyQPh65RtBdQkLGe1EEhJRpjT
 NG+7PWUxypCo4n8O4UK+cZGwwwwYmLqYodBdggrCKvwpM/Zdv5DEC2GDj
 ZIzfUk+sFKI0UoRCKGcsBtZWMziLuJLH/Wk8Qg5Mlq4e4UHtubzMyCSF1
 umS/WzFOZKZ4NeUIS+aRGPHxlo8ozentKta8po1oaBRuFHHvBJuV3wFyn
 cVgWfVUuch/ONJxxprIwDu/WhLU7qfkOo8zOoZIM7jCQaMN3TB4kHE1ft
 7U3oPbVnVZFJsmzmIoUkp3lKUrAe5zS0i3Jof375qC54XtKzqk8n+TiB0 A==;
X-CSE-ConnectionGUID: ukX0/Fr5Qcys/HxZa9AV5A==
X-CSE-MsgGUID: KKr0LuCQQqmwYnmgi4exNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64652149"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="64652149"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:11:27 -0700
X-CSE-ConnectionGUID: nbGNr9lhT6ydB0ilq0hOBw==
X-CSE-MsgGUID: P06PEQWSQ9uBJ/PQsRZtgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181320123"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:11:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 06:11:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 06:11:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 06:11:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJRSPHF+fzAOhQRGUki72p1O5QtG5d0w53d8EwU4Olp0WD8zifmRgZFFIQlhO3Ces193u/IgkZPCXHLUwCQs+bRqfDaZWd3AxFqYqy2oo3tmw1bV8YQIbGU4RDhfeSNGkD3HX1ZyRFCR7XKYI8dvk1P2hdLW/zeWn1HDpiPwUFIEk0vqiNRnrpWpTzpToqBfLB2LESWswmiuwAGcbGbIUbgWIEqYkUZK4rAXaTeJmvsvGw6kyNmiKhaLqmLNzrjycQCVFi1t5QldEET6ebWYWjyPV1Tv8Os2EbQYtXDWHrdxLG+ZLDBLoqSziif+HqubG5gTVsvXLa6OlG3rvBJYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCUkOlT3CYGjACuoio5yKIyD23sSv5P/HacXaFg1dFY=;
 b=ZyIhAAeMF0ijtJTgTm5GJOvTG+kFo6r09gcrw/wh05Ha/Y8XbgPzfCo/P8E2aAAi5z61mCOJVa+RA0eHKVbDak1ojVMJnThY2qJRJTyWu5KkAfHl2t91u0TRVOf/DcBQqTVwx2Q5LlQ6TeOBl925GV06R/o2SdSKjruU0Y2Kh6IstopHU0WJZYu3lBDBaj4ks5NdjxSEleu52UcdLcl/H/J/PuszNGW/4aCGEkrXRNMY2K5xRpK8JEUYhk3BusTwFkwY3QgL7laV1NFDmWb/bChHTjr09kq1H5J4hveX/SYTgG9Cp0EOvkLZuAu1nRmdxmdzSea/6zD3HpfIfSklZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 13:11:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 13:11:19 +0000
Date: Wed, 24 Sep 2025 08:11:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 0/3] tests/intel/xe_survivability: Add
 xe_survivability test
Message-ID: <qhzmf2spoo65ayc4glp4kk6srksepzxrlhmbnuswt36whwpdar@u5sm32424a2k>
References: <20250912122541.2238004-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250912122541.2238004-5-sk.anirban@intel.com>
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6613b621-4e94-4827-50d2-08ddfb6bd998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yZD0SYO0klUNP+rPdGfI1tebAD8mX0CtdFOpcVm0fXHyu+ha5U/hcaWP8TsJ?=
 =?us-ascii?Q?5oVMueU0fSx/dmpdog3VSDF28vN6BeyW/ZLzcgzUJP8hH8Xi1PW7rZ5YF6sB?=
 =?us-ascii?Q?Bmv839HXgteuymgi22Uh18I6+LELuobNCXFREKOntmqDjbbax0e1I4DzwCxK?=
 =?us-ascii?Q?kI3r/cvt3vgXRJQQbsZnZXMJJxcjJw5+ALGlemARGwXA1DqnlNc5X+UxuBAk?=
 =?us-ascii?Q?q994Ggcvlp0f8nsT5zKhtZVp1A3bo4U2K9cuZC0pdTN9MP8BCRim/TVJNG03?=
 =?us-ascii?Q?LiRLmMiy1ShDQXhJxs60AicBJJ7nY0vpSZn8eaP8PZOqtmKrCxvG1sMfPx3h?=
 =?us-ascii?Q?tf8Y8N7ojW8WlnI9woUqK440B6y6xQTLYRUS9Yt1dLSdPh0qQ1qzs2aJSs/l?=
 =?us-ascii?Q?wzO8YQq+DDveHcDlg4Gjp8nMeRs9Oo4PUGHUkVk2mib1HAs6qMbHVArjVgWC?=
 =?us-ascii?Q?oaWh6AgemlLEJqQ+dYAlOlSPNpHH8y2iG1ezzyUCCTIocYLCtdt9JoDh51+R?=
 =?us-ascii?Q?Doso2V4hE3JB787FPvRLcN8wFt911GkTdc16ZuRdK/MniDYUOVFHlsVYvW+Q?=
 =?us-ascii?Q?G/F3Ow3XvwThQUkyzSqHWyRcr40p03IiY2K7ds6blfi0nX89EHiJVhDyXgwg?=
 =?us-ascii?Q?XgydPjVpymtOtG678ZL5dfdSRuA8ZutkYQUZAdu+FHSsuT1Ju50c4QTiPJQU?=
 =?us-ascii?Q?39Mi6vC3TAsojy8MeCMA/uqgXblwU2gMx5pf2IcwEK6TUkoC/nY0QJ+g6lfe?=
 =?us-ascii?Q?0Qjei3MwhfcsZUhwe6O19GlMddqeepJR70KL/O9ynjsqGB59HZx141oOohY6?=
 =?us-ascii?Q?N3Ne9HgPA93JiarMzwxQi0/v0aKZnQst+1/HuVSOWe89IbHyLGfGU2gzSc7N?=
 =?us-ascii?Q?G7ay2auOEZsQuNcI6+W5PvwQeQD6MuxLJU77WJ1HPa9KuNqmKOSNDv3USxfJ?=
 =?us-ascii?Q?kXGtcTo46v3GiHXEM/K7sqhex2vXXwPQSvy483KShPlCN753/fUcpHhd+wWE?=
 =?us-ascii?Q?9WEf9vJ4R43jGLmWXfkx7AfWfuUnJquF8Ql0+2+BJUsMjEF8o8MxhfBt6s0x?=
 =?us-ascii?Q?+CNi4AkkHgCkMMyN+tiEV69y/aDpskT8grWuBLgDYIVZTc9WFs/CYJVl06XA?=
 =?us-ascii?Q?lqJeGO6QP1BahfcVUcvuECQILvaf2L6kZxT8lhY5PWtVyIJXNoOLY4KLgv1O?=
 =?us-ascii?Q?ODJQ90ACzTAp9GlxpylwMp5GqwqSF76pob5f/jlIWCWn3Hu/XjaNfveLHNml?=
 =?us-ascii?Q?EQXt+8fWV83HOYQmWiufKers6cPDM92NuTmuDOUxDCw/KbCOdsq5y4/y6V8K?=
 =?us-ascii?Q?iq9CJwjDT4nmYY3gYcfr3gJ2wt76F17mZxMViYjghX7gUH13wzvUAlzOPODz?=
 =?us-ascii?Q?fZwRuG+kCw1jAPQMWk9QRchtMR1HEnGrMhe6zl/j4a777DCOm3Ujp9V6nTez?=
 =?us-ascii?Q?3RanBu8cHNE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?utxkVlOMnrQnoyM1j5czLfo3qyG4G5VjszpQP5nNXSk7L67dwQ6Ju61yLhbz?=
 =?us-ascii?Q?YFuoBAATCXhCEHphEoK1sl3ruypIhSZ3lepHZ1+5pZe5cWrzJCeHhKAjwcJ2?=
 =?us-ascii?Q?X0lM3nbe0PlKEvFk2JpnWGS2317mvRygr63XdmoppW/1Yu3QJFiSVYtdtij3?=
 =?us-ascii?Q?s62DUNovNVaeiyk/JqsMVlgi5BPyB8ziwbUVi9CJvYFJHtrMpz+xqwlkAzk7?=
 =?us-ascii?Q?21/erXTuIHIzh/DXMnLtNfW0hruJaSM4jPvI7FH3zFf2tQyCL3m6MFwxAwaC?=
 =?us-ascii?Q?zuw8N44PoUWDZULGhzP48M5oeMEmQCgBcuosnNSnbHAkQnj+4d84oePqutwG?=
 =?us-ascii?Q?e22+s5K9QC1FmA8QpVkwiW/mXgm6qPf4jDyV0rWWlpzhHNSEBmLxcqPCteul?=
 =?us-ascii?Q?i3NheVi7cy22iunMW+u9DwA8Al8Y2YiU95FoP7NqqqFLm5ZMlhbzUZx1Yks1?=
 =?us-ascii?Q?4f7SbsUxtAsNt1xMMjUOOwPPqC3kPH9p4rJmoHgJ7bAPGsqVuCzCtv2q17ty?=
 =?us-ascii?Q?ou8KVCIvdh4vp5JXERFUNXfXLV8rB3SLh//Yelw4CKV7Zq6A+NAxqqLD107O?=
 =?us-ascii?Q?ECAyoRMprY33RNHe+Ulr5r8djsJJXmnhLohNk/HmfJZTeyJwWNLMbfC6iNiZ?=
 =?us-ascii?Q?3014XfMROSR2YGJCc4o11D1Pq8c0taQ8DqOAewTfflYcyuNef4AmlAP0Q8lp?=
 =?us-ascii?Q?m5M0ioycqzYwoJRrMhDwkFurCMGOlkC6/R3MrY/kqz4X6HZXsV2ReZiuOI4+?=
 =?us-ascii?Q?mauyH8kLn35zYZoZbb4aLUzXl2jh0Nvsa67JNxJ5u2f9yqd58jvXVawVcFJR?=
 =?us-ascii?Q?R306mlzOw7UT6AYsEn28eIUFFkJEvmtdlIzWKGh1IJZhNYRZNFEYH5FHJyXx?=
 =?us-ascii?Q?jYcWUmUS3x0sNIGWOXFG23JBFVHQGsRIyCxxenGP73PiApCfuNgcXnndC+xz?=
 =?us-ascii?Q?AFmBw898k9svPZN74rb6m683fWilGzvCdowvwUsKLCrusqFwSQ2TE84iOpxp?=
 =?us-ascii?Q?6Hflq1nDnfPTIIy3tnoWeeWWTpR3u7x1Ahvsd5z/N3DwyJuzu/nj0gRsTv9W?=
 =?us-ascii?Q?caut0t+5lKSvOn4MxtItEUzcThRBvQTK60wf/lsyFOQbtC0TGyC4VkkbwlS+?=
 =?us-ascii?Q?fpYvZJWcoxEo8J44gwfbGnaBYtooLm2TML5JKUL8A61v23TfUodKyMYbtvgP?=
 =?us-ascii?Q?mwyfgBhc44b5m4X+k0nZlnEZsEXkiB0i56EbE/wuTwcGupzfmuOXGUVdVnJV?=
 =?us-ascii?Q?4J58i5m43uK1drXeFMpl6O7wKSLcyD7jSrheGlAQMT3cTGaf/K6jd9XmNXGO?=
 =?us-ascii?Q?ZUgH/x3UWmp7QzvDk/nWOfdEs5vBP+hiJRAM7I1rSSv9pY+hkj7+2WJKZ+Kw?=
 =?us-ascii?Q?+6Hq62/VH2mGGBSPIJdHz4ZboYzCcWxJMq46wmCkFY2zHFqGfKbb68GvF5mb?=
 =?us-ascii?Q?Ls7YmRyzPkZOn8yFAlJmMISOhT4rhlSghbi+fkHMOmTtZiyhDXd47tHix9ra?=
 =?us-ascii?Q?gtyhi5HKC2MwFuB05RIZ43l7796MjYFZP+8kcazgCz5/3P20a+oee4Kwz9Ep?=
 =?us-ascii?Q?ryUIwxSDeEdsc7luFA6/AS8WAGFpswRR4o2OEES7J9bkETJVdN2QyrgZ/BSl?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6613b621-4e94-4827-50d2-08ddfb6bd998
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 13:11:18.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igpC91NfbvfkO/BUi2ldI+fFt4kHNAZr9cy1eIcM8nWIiXpDPewue7Uty4e9MmoNt7NqrNDyA5Y85E8Xg43ydBIJ0QEJwKwLeud+N0cwfoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
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

On Fri, Sep 12, 2025 at 05:55:39PM +0530, Sk Anirban wrote:
>This series creates a new xe_survivability.c test file with two subtests.
>i2c-functionality validates i2c adapter preservation in survivability
>mode for AMC firmware updates, and runtime-survivability tests CSC error
>injection, device wedged state recovery, and post-recovery GPU
>functionality validation.

one of my feedbacks when we've got a xe_configfs.c was: why is this a
xe_configfs rather than xe_survivability?  It looks like now we are
moving that way?

If this doesn't cover everything, let's move the survivability part from
xe_configfs -> xe_survivability... because we don't need part
implemented in one test and part in another.

One rule could be: "simple tests for a configfs can be bundled together
there. Once it grows, move it to its own test."

Lucas De Marchi
