Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5F9CE7B11
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 20:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D130C10E0D1;
	Fri,  6 Sep 2024 20:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGeiE5Ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD5310E0D1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725654891; x=1757190891;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q7vZaFNARjTnAQ8J3oYU6aQRB/562nWvmgoilKCu29s=;
 b=iGeiE5UrxEIqOSxm3FRXW2kKeYLvOdmVU0YP9XlnHieGqwfRRE1ddAoI
 qC3SDtEpM20rJ4ntxCwTSqpx+KFs5QoOAIQDKIjFEtDgAUxc0pGbYfJdp
 0dsqQuIS13Oj8tu7PV04c5YunEfO3lU/KWfeeuPFq6BOmPiWx2gBuAKHB
 ayBOfw4o/bUWPTvN+KT+whRE+trz4D4gfJ3PkOnAAX+Nk96RLq6CI5rKX
 q2/I+E5n1CRl9U8fb5S6/eoUdgvamagVFr3InmHPI0pbgaeuGTvW1VnHW
 2nffnccy91tB66sS6ZyV9ZRGoQCqT6Bmqtj3+UyltAs1J5tCPXrAGEdLs Q==;
X-CSE-ConnectionGUID: qMjjMoFhQHeYuCQbTRvsbQ==
X-CSE-MsgGUID: 21qpcB6YTwqKbGKIP9tzKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="46952451"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="46952451"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 13:34:50 -0700
X-CSE-ConnectionGUID: ZUzraW9xTZ27aFItzwBULg==
X-CSE-MsgGUID: X42WBwQxT1Cu9a90oLnwZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="103524413"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 13:34:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 13:34:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 13:34:48 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 13:34:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipVG+Le1lygl/UMHo0MlcpxK9FGKN5mw79+87yZ/j5VzAr2QlWV0TMBWig5ix2bdjxOgNGM8jf8fhSqNJStlDa+RKsaAoF/KTXetcO0+vx4VFrIWCY+B96OUxDLiyZhr7zAdw2ef5lH1zRjSmH51ubN9K03OoZiqEL/cP5XO+dQNgYnl5Y1+5uPJdTDiqKi03jt3N1YiuW8C0hB6dj+svHRzRoLGFUzmeBJ5h2QvMklvKcYIdjLNmsHcSChaxaQOVpoweyQqUrJW0g6cJnTvcqB4PaSu1rSzzfF7o0y9PmMgixWOBPWiGFof7ytdmZtfw58lvweGkr25+2R5xvEY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8N8P7qWSj9flgeGhTabf5HsApfXzYiZrDR/Ey4oJ1o=;
 b=BXXMvjlTaiw6iLm2bR5n+xoCKVWJcj1ZwrX7c+jrmHPEnpLjWqdyxihOweJBbCpfurLKaNUzn6c45a8wmxu8CpWmA9SHV2kB+lUfaZnI4COB8d1S9EbldWt+dTaUBtEdRPZznzf1GiaBbstcj6TOUGfkOeSMB+QwP6rppY+8GciQ872xUvr2VezdNNsWNYjvDbrjA5DHMdktLI/08mBvBktzj+rVYIRtkwPzZsGID93lTnR0sCsU/9Yj3CIvv60WRYXCSq7zq7iLv3WP0y0vkTuNpbb5yvc7E5QpVIowo0es2eX8hUmyj9a50vO/RvuFmX5+70pftMIm0c5f/la1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 20:34:45 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 20:34:45 +0000
Message-ID: <6b195d7c-caaf-4dcc-b179-f0de7d7b2562@intel.com>
Date: Sat, 7 Sep 2024 02:04:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/kms_psr2_sf: Modify kms_psr2_sf
 test
To: <igt-dev@lists.freedesktop.org>
References: <20240905134259.1155164-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240905134259.1155164-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|IA1PR11MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c24166e-ad88-4a8e-6770-08dcceb35808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3p6WEZVVWpmS0h2RjFpZnlwUFRBcmliN1JlOGhEak9PM1RFZ0lPRVE0VVNv?=
 =?utf-8?B?VU9IWlBROWpZcXNuREdRUHNOaC9MaXczY0ZHWHpYQ28vcktqN1h6bjEvOG9r?=
 =?utf-8?B?d1ppWnIweHJQL2tObzNYSVZLdjRoaUd3VWFPUUVGVkVMTGdjV1BoNXRCRy9q?=
 =?utf-8?B?WHJtaG4zblJIUUJBcTA5bFVZQktGWkgyTlNUcFRMakw2WVk4TnpNWkR2NE84?=
 =?utf-8?B?U2lhaHF0T1VmTUtnbUF0WGlBR1ZGYW9YSmY0VDZHU3F4NytvZU05bFV0Wm9w?=
 =?utf-8?B?QytyNW12aTg0aEN5VFRnUGhHY2xwbkcwbnlIamUzV3l6VlVTUXA3ekxHN1hU?=
 =?utf-8?B?c292RVdIYVBJb3k2V3FVeVJFMWpTT0I1ZnVqT2FnOFJFUFhmM1hEbGFGNUlm?=
 =?utf-8?B?WHMxajVua004ZU8ydXYybjFTcnJyd2RzNk9QMkI3SXBncjl0bXhxTnBXaGt5?=
 =?utf-8?B?QytvY0dzandWcS8wcE5rV3ZRSTlRekQzNzZFMXVBYmVydnpwTktiWE12UzJp?=
 =?utf-8?B?TENzb2ttek9aLzZYTGZOYTgyNHc2eFhZN3NrUDVrL1MvM2tKbHB3UEdFYjVj?=
 =?utf-8?B?eUx6dW4zSGk1UmhOajJsbEQyeEVVQjVobEZXYnJJcWVQd1JwVStscGFESS9q?=
 =?utf-8?B?RHZVVE5PTFRnZFdwai9ueUk3ZkxFdXVwdktRcC9tYUVuSlJYMnk1SjA4SFQx?=
 =?utf-8?B?bFNEZ29ZTWYzMEViWVRzenpYMVlpY2dRUFVweTFxb2p5TzFyTXF3TmZFWDNF?=
 =?utf-8?B?ZmNETFlpUS8zT2FjM1BPZWlXaGJSNHVUNWVUWkZ6azRFcEszN2dQSEJMaDFr?=
 =?utf-8?B?M254ZHczN3l2V0J3Z3Nud0Z3ZUkrZ0cwUkdSK0JBbXpmUnlITkMwM0tBNzNW?=
 =?utf-8?B?aW1wK003aHR2b29MQXh0Ry9McEhkc25TcXpmVG1MWVFROHk0RVBheWN0R1M2?=
 =?utf-8?B?YnFtOVF3VS9qYWRVcEZQZFZKYVNPb25jQ3g4ZGRjcWI0dmw3SDYvSGF2MHNU?=
 =?utf-8?B?dlNTcUxHNmx2ZWlCSVJXUWtRYk9lenkzdDlzNERrSmNYbkw5WkNneUo1Q0h5?=
 =?utf-8?B?VmhIZmxaNmZZaFd6YUdrTXQreTJGUGRwWWJPVjI2YkhURXNJbFBuUkM4U3B6?=
 =?utf-8?B?RFVIajU2VmZvSnNMS3FIMndSaUJVTVRrcms4UTlOdVE2S1NLTlJMdENNUVNM?=
 =?utf-8?B?bm01c2UvUlo0RkZEajRDRVdHYU1UQTFmVFZnZ0x6YUE0WGEyN0VoelB1eGtx?=
 =?utf-8?B?V3FKcXIyanlpOTRKcmZ4cjNnOC91dGV1TCtsZktHc1U2SzlISEdKdjd5dnBK?=
 =?utf-8?B?ei9BV3F4dEFvUm1jeW1WT2pFUWJuSHpEcW5mSUhZZ1lZbE5DRGtMcDY4NDVJ?=
 =?utf-8?B?NlRjMVd3Sk92bEhNTGdxaCtCa2oyc21hNEVjeFJJU1E3NEg1b2dGTnNGbXpW?=
 =?utf-8?B?OXFWRVlpbDRvb1hUTTdtRnNKeFNNdmNPRWxkWHdoVHJXbG1Memh5dE04WW05?=
 =?utf-8?B?b3FwSUlmOEtQVjBhYjNyQytnNlBlWXJqT3hlSDBTVi9DK0ZiOUV6WEJJYUNo?=
 =?utf-8?B?SWE3YWpBUitkR1J0R2U2VnVMWTI0cXFVS3BwZHFJbml1bnQ2WWhWQ0JoekJn?=
 =?utf-8?B?Yk5PdWEwT0VsL0ViUkZ5OThDb2tycWZoTVJMZi82c0c2bUloZVhKUVRLRmtE?=
 =?utf-8?B?VFptU0VEbXFUSmlkeWh3UWJ1anFKTUczbXZkTjJXQkZOSU01VHpZTTZYSjdY?=
 =?utf-8?B?NXdoL0lJUXhtLy9pYyszTVlwaEo0bFo1QUVKYVVkRm1YRzBCcHJwWlBZcndH?=
 =?utf-8?B?UXNlTnU4ZkJoNXp6TlhBZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWxBZ3gzdjRmWFFiT0RQejR2ZHFTaVFYZWwzMERnUUdWSjRwUFN6T250UzJ6?=
 =?utf-8?B?eklNamlSUG5KeTZEbzd5SU5nL3BCT0VobE02aERVZjZCK2NmamM5TnZqR3hY?=
 =?utf-8?B?V1NpZDBFd1dVbXV2aUpreFg3MllRT1JwRThwUzUwS0RUSWFVamtyb0Vhb1R4?=
 =?utf-8?B?eDRLM1pFNnp6dlhJTjdENHdKdzZkVW9CM0ZYdnA5Z1o1MnRqT1QvV0M0bTQy?=
 =?utf-8?B?L0NRR01xUVk5anRFTVJOWWhyRnVMbUdQVjZPQ0d1MFJmQmUwMWVRN2xuVWZJ?=
 =?utf-8?B?bERCMG9WdUpRRkZjdVRvZGllbkplMDFFNW9WMzRSbkx3MVNXT2YwNlhMN3B0?=
 =?utf-8?B?NnNwS0VoaXRBSzVrcW5rSTBrYnRTMVdLVXhURXN2RmsrRCtrSWZTZm5yamFv?=
 =?utf-8?B?ZWI2RWtxOHhnT2FJN1BCdUxQSnhoRTR0WmZuYlZqdWVQNG05ZXlGYVJHUDdZ?=
 =?utf-8?B?VG1JWUpkMW9SNjV4Q0RkRlNzM29EY1NnT0ZISHVnYnlYMHpNYTJ2Q28zeUIv?=
 =?utf-8?B?YzRpeG12Tk5iSDZBeUdJM0REUm5ZeGpDalZjY2FVRzdNTlNTNUpWdEtWTzNn?=
 =?utf-8?B?VDZTenVoK05zYTFaWDVzYU4vemd4akh0TE9KN1BIcWxkRjB5aEV0RU9PTEYv?=
 =?utf-8?B?NEpZMVJRTmJTTlpPOE1yUzVjcjBqM2V3cWM2Rk15OFFsajc5V2t0N0VTVzcw?=
 =?utf-8?B?Sno3TlVEZXY0NEh1Nm5XWmlENzZldllxWFBkWllabE56TU0vbWsxMXpocmFn?=
 =?utf-8?B?U0pwbDI3Um91SThTdUFmdjVRc2xYSHJEeG5CdlFjdUxGRUQxcml1ZTIrYzQy?=
 =?utf-8?B?enVOVUdIT016c3kxcjVkd3lrU0ozRk94UDJxdVg0QzN1VDhJQ1NGSnAxNVpH?=
 =?utf-8?B?N1dnSkhkMVJUbEp0MHNmZzhnREN3RHA1NTl6SjhlazVVWmhqUFdVRDk3b1lq?=
 =?utf-8?B?ZEJFRC9vL1RoWXk1SXFmOEZvS3RlUE41aWpJWlNVM1kwNXlJbmhhZDM2TDJW?=
 =?utf-8?B?b3A5NmxZYmlOWmVENG13eFV4bThGUVc2VzF5UldpY3RsYVRsNFJmTlRtRU41?=
 =?utf-8?B?dTZhcEF4aUpaU2g2bUlGZUlkOWV6ZWpSeEk5ZnlPdEx5eUl1TWMybldJMXRT?=
 =?utf-8?B?bGo3ZjVUNXZ2UmRLbkZ5TUkzVktGSE5iNUhKenNpYnM0bTYvSEFOaTZCYmtU?=
 =?utf-8?B?b1JxUFgxelRUQlZQQ3BBVStUODREZzkrQkhic2xxbHZzeWUwV3JvenJ2b3Jr?=
 =?utf-8?B?VmFpUktQYTRLSWV0cThWR1kzeVNFUWVkUlllK3phWHdUUzh0NWsxLzRhWkc2?=
 =?utf-8?B?NzhoQnpHVUNxUmd1enJZVlVxQUVrN1lNV2lvZG44V0ltZWdYZ1FQS3MxRkZi?=
 =?utf-8?B?YVlOMVBib1V4UEgrWjBkdnhMN1IvbnJudUVOL1lkOWpOTyt5T1ZNUUw3WlEx?=
 =?utf-8?B?MjVxMTR1Qi9reHNWRTZIaG9uSUc1dDl3QTJTaWx1OENZQy9ZcEttV3RvS0FR?=
 =?utf-8?B?MUlKdW1WYTRKYUgvdFZZa0hrSi9XSmtjcWhGcXAvYUNnTTMzRWFTcFNmdFJN?=
 =?utf-8?B?MXM3R1dGcFdpQ0REcWNEVlFGdng0Qi9JcVNpbElzSmk1MHhEOGNHTDRNOUZW?=
 =?utf-8?B?Sjd4bE14Qld0cWFPdnhFc1ZuNHMvWWtjYjJUZWZqVGk2eVRFK3NTSFhDbEtj?=
 =?utf-8?B?Mml0LzZjWC96bFNGV0J4T1BXSC9JZ3dMQ000Y0djamhUcG1zemNTVWZNN3d2?=
 =?utf-8?B?YnVlMm5PNmVFM3ZvdXlxcG9KM0piRkpDSlF6bFAwQ0d4MlNyd2U2MCtxbUMr?=
 =?utf-8?B?a0ZESHNkc25Gd0Z3UjNiWDZhV1U0cEpDVktmMFVjakNXSXFIUUZVUVoyZ2Vm?=
 =?utf-8?B?cGkwN3pzaS9UaTY1cGdoenZQOVhMRVJtQXI5cUU5dmw1TnNVRjdTUHVJbkRp?=
 =?utf-8?B?MjVwdFE5ZWJnbi9jQjl1S0RXRTNrS2ZmMzFBY3FlTkkydHZ3S21ZVllSL3hn?=
 =?utf-8?B?bTlkblFJVUk3T082M21JTlFaamdSZTZNMHF1VkdkSXpXWDhXbkY2K3pRNFBI?=
 =?utf-8?B?ZWtwUG1QNU14eGt1eHNwUXozWHNRUHp5TjRSMGJyWEh2UCsyaFVlMjlnTzBC?=
 =?utf-8?B?aDFNWDlFTWd1K1RlaUFJanBaMW1SN29WamYrRWh5ZGt6YzFoTHFwVW1pc3Ix?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c24166e-ad88-4a8e-6770-08dcceb35808
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 20:34:45.4484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTeflT6YAXCXrC6dvLjP2+2rHlPHh6IVziqia7jlO4MFghlhqbIkj7WI/Vv7JXJsJ0du0oNwybnTG+C6YS7JRxOhcan787tGdGNPLUMf/hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
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



On 9/5/2024 7:12 PM, Pranay Samala wrote:
> In the current kms_psr2_sf tests, we identify PSR/PR/PR-SF at
> dynamic subtest level.
> This patch converts the test structure to execute on PSR/PR/PR-SF
> at subtest level for easy identification of tests.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 809 +++++++++++++++++++-------------------
>   1 file changed, 407 insertions(+), 402 deletions(-)
> 
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 03ff1cddb..3fd814281 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -44,11 +44,20 @@
>   #include <string.h>
>   
>   /**
> - * SUBTEST: %s-plane-move-continuous-%s
> + * SUBTEST: psr2-%s-plane-move-continuous-%s
>    * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
>    *              visible area (no update)
>    *
> - * SUBTEST: fbc-%s-plane-move-continuous-%s
> + * SUBTEST: pr-%s-plane-move-continuous-%s
> + * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
> + *              visible area (no update)
> + *
> + * SUBTEST: fbc-psr2-%s-plane-move-continuous-%s
> + * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
> + *              visible area (no update)
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: fbc-pr-%s-plane-move-continuous-%s
>    * Description: Test that fbc with selective fetch works on moving %arg[1] plane %arg[2]
>    *              visible area (no update)
>    * Functionality: plane, psr2, selective_fetch, fbc
> @@ -66,51 +75,98 @@
>    */
>   
>   /**
> - * SUBTEST: cursor-plane-update-sf
> + * SUBTEST: psr2-cursor-plane-update-sf
>    * Description: Test that selective fetch works on cursor plane
>    *
> - * SUBTEST: fbc-cursor-plane-update-sf
> + * SUBTEST: pr-cursor-plane-update-sf
> + * Description: Test that selective fetch works on cursor plane
> + *
> + * SUBTEST: fbc-psr2-cursor-plane-update-sf
> + * Description: Test that fbc with selective fetch works on cursor plane
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: fbc-pr-cursor-plane-update-sf
>    * Description: Test that fbc with selective fetch works on cursor plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
> - * SUBTEST: overlay-plane-update-continuous-sf
> + * SUBTEST: psr2-overlay-plane-update-continuous-sf
>    * Description: Test that selective fetch works on overlay plane
>    *
> - * SUBTEST: fbc-overlay-plane-update-sf-dmg-area
> + * SUBTEST: pr-overlay-plane-update-continuous-sf
> + * Description: Test that selective fetch works on overlay plane
> + *
> + * SUBTEST: fbc-psr2-overlay-plane-update-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: fbc-pr-overlay-plane-update-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on overlay plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
> - * SUBTEST: overlay-plane-update-sf-dmg-area
> + * SUBTEST: psr2-overlay-plane-update-sf-dmg-area
> + * Description: Test that selective fetch works on overlay plane
> + *
> + * SUBTEST: pr-overlay-plane-update-sf-dmg-area
>    * Description: Test that selective fetch works on overlay plane
>    *
> - * SUBTEST: fbc-overlay-plane-update-continuous-sf
> + * SUBTEST: fbc-psr2-overlay-plane-update-continuous-sf
>    * Description: Test that fbc with selective fetch works on overlay plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
> - * SUBTEST: overlay-primary-update-sf-dmg-area
> + * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
> + * Description: Test that fbc with selective fetch works on overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: psr2-overlay-primary-update-sf-dmg-area
> + * Description: Test that selective fetch works on primary plane with blended
> + *              overlay plane
> + *
> + * SUBTEST: pr-overlay-primary-update-sf-dmg-area
>    * Description: Test that selective fetch works on primary plane with blended
>    *              overlay plane
>    *
> - * SUBTEST: fbc-overlay-primary-update-sf-dmg-area
> + * SUBTEST: fbc-psr2-overlay-primary-update-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on primary plane with blended
>    *              overlay plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
> - * SUBTEST: plane-move-sf-dmg-area
> + * SUBTEST: fbc-pr-overlay-primary-update-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on primary plane with blended
> + *              overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: psr2-plane-move-sf-dmg-area
>    * Description: Test that selective fetch works on moving overlay plane
>    *
> - * SUBTEST: fbc-plane-move-sf-dmg-area
> + * SUBTEST: pr-plane-move-sf-dmg-area
> + * Description: Test that selective fetch works on moving overlay plane
> + *
> + * SUBTEST: fbc-psr2-plane-move-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on moving overlay plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
> - * SUBTEST: primary-plane-update-sf-dmg-area
> + * SUBTEST: fbc-pr-plane-move-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on moving overlay plane
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: psr2-primary-plane-update-sf-dmg-area
> + * Description: Test that selective fetch works on primary plane
> + *
> + * SUBTEST: pr-primary-plane-update-sf-dmg-area
>    * Description: Test that selective fetch works on primary plane
>    *
> - * SUBTEST: fbc-primary-plane-update-sf-dmg-area
> + * SUBTEST: fbc-psr2-primary-plane-update-sf-dmg-area
>    * Description: Test that fbc with selective fetch works on primary plane
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
> - * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
> + * SUBTEST: fbc-pr-primary-plane-update-sf-dmg-area
> + * Description: Test that fbc with selective fetch works on primary plane
> + * Functionality: plane, psr2, selective_fetch, fbc
> + *
> + * SUBTEST: psr2-primary-plane-update-sf-dmg-area-big-fb
> + * Description: Test that selective fetch works on primary plane with big fb
> + *
> + * SUBTEST: pr-primary-plane-update-sf-dmg-area-big-fb
>    * Description: Test that selective fetch works on primary plane with big fb
>    */
>   
> @@ -216,23 +272,6 @@ static bool set_sel_fetch_mode_for_output(data_t *data)
>   	return supported;
>   }
>   
> -static const char *get_psr_mode_str_for_output(data_t *data)
> -{
> -	static const char *psr_mode;
> -
> -	switch (data->psr_mode) {
> -	case PSR_MODE_2:
> -		psr_mode = "psr2";
> -		break;
> -	case PR_MODE_SEL_FETCH:
> -		psr_mode = "pr";
> -		break;
> -	default:
> -		psr_mode = "";
> -	}
> -	return psr_mode;
> -}
> -
>   static const char *op_str(enum operations op)
>   {
>   	static const char * const name[] = {
> @@ -1045,13 +1084,95 @@ pipe_output_combo_valid(igt_display_t *display,
>   	return ret;
>   }
>   
> +static bool check_psr_mode_supported(data_t *data, int psr_stat)
> +{
> +	if (data->psr_mode == psr_stat)
> +		return true;
> +	else
> +		return false;
> +}
> +
> +static void run_dynamic_test_damage_areas(data_t data, int i, int coexist_features[])
> +{
> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			continue;
> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
> +			      igt_output_name(data.output), coexist_feature_str(j)) {
> +			data.coexist_feature = j;
> +			for (int k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> +				data.damage_area_count = k;
> +				prepare(&data);
> +				run(&data);
> +				cleanup(&data);
> +			}
> +		}
> +	}
> +}
imho you should split all new functions into different patches.
> +
> +static void run_dynamic_test(data_t data, int i, int coexist_features[])
> +{
> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			continue;
> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
> +			      igt_output_name(data.output), coexist_feature_str(j)) {
> +			data.coexist_feature = j;
> +			prepare(&data);
> +			run(&data);
> +			cleanup(&data);
> +		}
> +	}
> +}
> +
> +static void run_plane_move(data_t data, int i, int coexist_features[])
> +{
> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			continue;
> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
> +			      igt_output_name(data.output), coexist_feature_str(j)) {
> +			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +			data.coexist_feature = j;
> +			for (int k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT; k++) {
> +				data.pos = k;
> +				prepare(&data);
> +				run(&data);
> +				cleanup(&data);
> +			}
> +		}
> +	}
> +}
> +
> +static void run_plane_update_continuous(data_t data, int i, int coexist_features[])
> +{
> +	for (int j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> +		if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			continue;
> +		igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data.pipe),
> +			      igt_output_name(data.output), coexist_feature_str(j)) {
> +			data.damage_area_count = 1;
> +			if (data.op_fbc_mode == FBC_ENABLED)
> +				data.primary_format = DRM_FORMAT_XRGB8888;
> +			else
> +				data.primary_format = DRM_FORMAT_NV12;
> +
> +			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +			data.coexist_feature = j;
> +			prepare(&data);
> +			run(&data);
> +			cleanup(&data);
> +		}
> +	}
> +}
I did not find much difference between run_plane_update_continuous and 
run_dynamic_test. I think the continuous update function loop is missing.
> +
>   igt_main
>   {
>   	bool output_supports_pr_psr2_sel_fetch = false;
>   	bool pr_psr2_sel_fetch_supported = false;
>   	data_t data = {};
>   	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
> -	int i, j, k, y;
> +	int i, y, z;
>   	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
>   	int n_pipes = 0;
>   	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
> @@ -1061,6 +1182,12 @@ igt_main
>   	};
>   	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
>   
> +	const char *append_psr_subtest[2] = {
> +		"psr2-",
> +		"pr-"
> +	};
> +	int psr_status[] = {PSR_MODE_2, PR_MODE_SEL_FETCH};
> +
>   	igt_fixture {
>   		drmModeResPtr res;
>   
> @@ -1103,430 +1230,308 @@ igt_main
>   	}
>   
>   	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
> -		data.op = PLANE_UPDATE;
> -		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -		data.primary_format = DRM_FORMAT_XRGB8888;
> -		data.big_fb_test = 0;
> -
> -		data.op_fbc_mode = fbc_status[y];
> -		/* Verify primary plane selective fetch */
> -		igt_describe("Test that selective fetch works on primary plane");
> -		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +		for (z = 0; z < ARRAY_SIZE(psr_status); z++) {
> +			data.op = PLANE_UPDATE;
> +			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +			data.primary_format = DRM_FORMAT_XRGB8888;
> +			data.big_fb_test = 0;
> +
> +			data.op_fbc_mode = fbc_status[y];
> +			data.psr_mode = psr_status[z];
> +
> +			/* Verify primary plane selective fetch */
> +			igt_describe("Test that selective fetch works on primary plane");
> +			igt_subtest_with_dynamic_f("%s%sprimary-%s-sf-dmg-area",
> +						   append_fbc_subtest[y],
> +						   append_psr_subtest[z],
> +						   op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i], outputs[i]))
> +						continue;
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +					run_dynamic_test_damage_areas(data, i, coexist_features);
> +				}
> +			}
> +
> +			/* Verify primary plane selective fetch with big fb */
> +			if (data.op_fbc_mode == FBC_DISABLED) {
> +				data.big_fb_test = 1;
> +				igt_describe("Test that selective fetch works on primary plane "
> +					     "with big fb");
> +				igt_subtest_with_dynamic_f("%s%sprimary-%s-sf-dmg-area-big-fb",
> +							   append_fbc_subtest[y],
> +							   append_psr_subtest[z],
> +							   op_str(data.op)) {
> +					for (i = 0; i < n_pipes; i++) {
> +						if (!pipe_output_combo_valid(&data.display,
> +									     pipes[i], outputs[i]))
> +							continue;
> +						data.pipe = pipes[i];
> +						data.output = outputs[i];
> +						igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +							     "Selective fetch is not supported\n");
> +						if (!check_psr_mode_supported(&data, psr_status[z]))
> +							continue;
> +
>   						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -						data.coexist_feature = j;
> -						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -							data.damage_area_count = k;
> -							prepare(&data);
> -							run(&data);
> -							cleanup(&data);
> -						}
> +						run_dynamic_test_damage_areas(data, i,
> +									      coexist_features);
>   					}
>   				}
>   			}
> -		}
>   
> -		/* Verify primary plane selective fetch with big fb */
> -		if (data.op_fbc_mode == FBC_DISABLED) {
> -			data.big_fb_test = 1;
> -			igt_describe("Test that selective fetch works on primary plane with "
> -				     "big fb");
> -			igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area-big-fb",
> -						   append_fbc_subtest[y], op_str(data.op)) {
> +			data.big_fb_test = 0;
> +			/* Verify overlay plane selective fetch */
> +			igt_describe("Test that selective fetch works on overlay plane");
> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf-dmg-area",
> +						   append_fbc_subtest[y],
> +						   append_psr_subtest[z],
> +						   op_str(data.op)) {
>   				for (i = 0; i < n_pipes; i++) {
> -					if (!pipe_output_combo_valid(&data.display, pipes[i],
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
>   								     outputs[i]))
>   						continue;
>   					data.pipe = pipes[i];
>   					data.output = outputs[i];
>   					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -								 "Selective fetch is not supported\n");
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
>   
> -					for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -						if (j != FEATURE_NONE && !(coexist_features[i] & j))
> -							continue;
> -						igt_dynamic_f("%s-pipe-%s-%s%s",
> -								  get_psr_mode_str_for_output(&data),
> -							      kmstest_pipe_name(pipes[i]),
> -							      igt_output_name(outputs[i]),
> -							      coexist_feature_str(j)) {
> -							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -							data.coexist_feature = j;
> -
> -							for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -								data.damage_area_count = k;
> -								prepare(&data);
> -								run(&data);
> -								cleanup(&data);
> -							}
> -						}
> -					}
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +					run_dynamic_test_damage_areas(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.big_fb_test = 0;
> -		/* Verify overlay plane selective fetch */
> -		igt_describe("Test that selective fetch works on overlay plane");
> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf-dmg-area", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.damage_area_count = 1;
> +			/* Verify cursor plane selective fetch */
> +			igt_describe("Test that selective fetch works on cursor plane");
> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -						data.coexist_feature = j;
> -
> -						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -							data.damage_area_count = k;
> -							prepare(&data);
> -							run(&data);
> -							cleanup(&data);
> -						}
> -					}
> -				}
> -			}
> -		}
> -
> -		data.damage_area_count = 1;
> -		/* Verify cursor plane selective fetch */
> -		igt_describe("Test that selective fetch works on cursor plane");
> -		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -						data.coexist_feature = j;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.op = PLANE_MOVE_CONTINUOUS;
> -		igt_describe("Test that selective fetch works on moving cursor plane (no update)");
> -		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.op = PLANE_MOVE_CONTINUOUS;
> +			igt_describe("Test that selective fetch works on "
> +				     "moving cursor plane (no update)");
> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -						data.coexist_feature = j;
> -
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> -		igt_describe("Test that selective fetch works on moving cursor plane exceeding "
> -			     "partially visible area (no update)");
> -		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> +			igt_describe("Test that selective fetch works on moving cursor "
> +				     "plane exceeding partially visible area (no update)");
> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -						data.coexist_feature = j;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> -		igt_describe("Test that selective fetch works on moving cursor plane exceeding "
> -			     "fully visible area (no update)");
> -		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> +			igt_describe("Test that selective fetch works on moving cursor plane "
> +				     "exceeding fully visible area (no update)");
> +			igt_subtest_with_dynamic_f("%s%scursor-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> -						data.coexist_feature = j;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		/* Only for overlay plane */
> -		data.op = PLANE_MOVE;
> -		/* Verify overlay plane move selective fetch */
> -		igt_describe("Test that selective fetch works on moving overlay plane");
> -		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			/* Only for overlay plane */
> +			data.op = PLANE_MOVE;
> +			/* Verify overlay plane move selective fetch */
> +			igt_describe("Test that selective fetch works on moving overlay plane");
> +			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s",
> -							  get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -						data.coexist_feature = j;
> -						for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
> -							data.pos = k;
> -							prepare(&data);
> -							run(&data);
> -							cleanup(&data);
> -						}
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					run_plane_move(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.op = PLANE_MOVE_CONTINUOUS;
> -		igt_describe("Test that selective fetch works on moving overlay plane (no update)");
> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.op = PLANE_MOVE_CONTINUOUS;
> +			igt_describe("Test that selective fetch works on moving overlay "
> +				     "plane (no update)");
> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
>   					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -					data.coexist_feature = j;
> -					prepare(&data);
> -					run(&data);
> -					cleanup(&data);
> -					}
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> -		igt_describe("Test that selective fetch works on moving overlay plane partially "
> -			     "exceeding visible area (no update)");
> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
> +			igt_describe("Test that selective fetch works on moving overlay "
> +				     "plane partially exceeding visible area (no update)");
> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -						data.coexist_feature = j;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> -		igt_describe("Test that selective fetch works on moving overlay plane fully "
> -			     "exceeding visible area (no update)");
> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
> +			igt_describe("Test that selective fetch works on moving overlay plane "
> +				     "fully exceeding visible area (no update)");
> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display, pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -						data.coexist_feature = j;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> +					run_dynamic_test(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		/* Verify primary plane selective fetch with overplay plane blended */
> -		data.op = OVERLAY_PRIM_UPDATE;
> -		igt_describe("Test that selective fetch works on primary plane "
> -			     "with blended overlay plane");
> -		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			/* Verify primary plane selective fetch with overplay plane blended */
> +			data.op = OVERLAY_PRIM_UPDATE;
> +			igt_describe("Test that selective fetch works on primary plane "
> +				     "with blended overlay plane");
> +			igt_subtest_with_dynamic_f("%s%s%s-sf-dmg-area", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
> -							  get_psr_mode_str_for_output(&data),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
> -							data.damage_area_count = k;
> -							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> -							data.coexist_feature = j;
> -
> -							prepare(&data);
> -							run(&data);
> -							cleanup(&data);
> -						}
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
> +					run_dynamic_test_damage_areas(data, i, coexist_features);
>   				}
>   			}
> -		}
>   
> -		/*
> -		 * Verify overlay plane selective fetch using NV12 primary
> -		 * plane and continuous updates.
> -		 */
> -		data.op = PLANE_UPDATE_CONTINUOUS;
> -		igt_describe("Test that selective fetch works on overlay plane");
> -		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y],
> -					   op_str(data.op)) {
> -			for (i = 0; i < n_pipes; i++) {
> -				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
> -					continue;
> -				data.pipe = pipes[i];
> -				data.output = outputs[i];
> -				igt_assert_f(set_sel_fetch_mode_for_output(&data),
> -							 "Selective fetch is not supported\n");
> -
> -				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
> -					if (j != FEATURE_NONE && !(coexist_features[i] & j))
> +			/*
> +			 * Verify overlay plane selective fetch using NV12 primary
> +			 * plane and continuous updates.
> +			 */
> +			data.op = PLANE_UPDATE_CONTINUOUS;
> +			igt_describe("Test that selective fetch works on overlay plane");
> +			igt_subtest_with_dynamic_f("%s%soverlay-%s-sf", append_fbc_subtest[y],
> +						   append_psr_subtest[z], op_str(data.op)) {
> +				for (i = 0; i < n_pipes; i++) {
> +					if (!pipe_output_combo_valid(&data.display,
> +								     pipes[i],
> +								     outputs[i]))
>   						continue;
> -					igt_dynamic_f("%s-pipe-%s-%s%s", get_psr_mode_str_for_output(&data),
> -							  kmstest_pipe_name(pipes[i]),
> -						      igt_output_name(outputs[i]),
> -						      coexist_feature_str(j)) {
> -						data.damage_area_count = 1;
> -						if (data.op_fbc_mode == FBC_ENABLED)
> -							data.primary_format = DRM_FORMAT_XRGB8888;
> -						else
> -							data.primary_format = DRM_FORMAT_NV12;
> -						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
> -						data.coexist_feature = j;
> -						prepare(&data);
> -						run(&data);
> -						cleanup(&data);
> -					}
> +					data.pipe = pipes[i];
> +					data.output = outputs[i];
> +					igt_assert_f(set_sel_fetch_mode_for_output(&data),
> +						     "Selective fetch is not supported\n");
> +					if (!check_psr_mode_supported(&data, psr_status[z]))
> +						continue;
> +
> +					run_plane_update_continuous(data, i, coexist_features);
>   				}
>   			}
>   		}

