Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8190C3065A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 18:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7EB10E08B;
	Mon,  1 Jul 2024 18:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9q1up7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC9310E08B
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719858665; x=1751394665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SKT/KGhzIUIlGYbowiC4yyoGaJAAvkPtLrbI67wGKPs=;
 b=C9q1up7phyl4oOSwqvhidcwva/r6jYDS0gGNeSA4YCMRG14nA+oJhCd1
 3qZ+FJnqm0JFPPelvRbb2pGFHtE35Vjs00w+G5WCz4uvvgiCIxzr704v1
 YkF2N3q4XUeL9ic5DcdMfeEyg+vk1/FcG8kpFzi6Nbp5MlgUfY7fkD+5O
 juBPwv0VQhK3SXo7yxedIZJ8SW43kPpWe/pEYAZCFg9++cg2LcqBdv+WI
 H0W7IOsal0qCUeNsG2MwRLh4ek6o03HIlGNdrAXO49SvNcngBKNfnXYyS
 1FWCcYW4MovyObYpUVZ3577OA2aZ5F/Qa6j+08OKGt62DfMGoXdBD0RCK g==;
X-CSE-ConnectionGUID: 7qCF4KSgTd6HoHx5uRLTZA==
X-CSE-MsgGUID: hFNOwPWgSquxy9O2RbxpGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="17135768"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="17135768"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 11:31:04 -0700
X-CSE-ConnectionGUID: lm+5PoROQciYvuplalp8GA==
X-CSE-MsgGUID: VIx9z2VZQEGvZe2fGrvyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="50063047"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 11:31:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 11:31:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 11:31:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 11:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0ayT+CxkkTY4rBCnQk2QoQLPlAHLLpWezFH+7uLjpFbaDllOkV0JGBLQYvfhz9P9ufsH/60hAqpC8ei++0npwqFic0KCVgqr07AqMnTGoUZHiHDdHeXYZHz4bMejyCVuT3/bvnODICDEzM0LD71UFnlo1umXKhF1kyLxmlEpO4N0+6tmInY631GDdImDYpLnZWpFseFQ3GmRqXWFnG6mtWOsZce6OdOn/BZKzjHRgD/iEUEEHosx/Lir9BeFbr4hk5RECaLX/iftl6KNnkHYxUMvlE7l6Rz452sv/6rFTUGmbW+Oop3VLzqKuff6l4XAFnjWgTkrz79Zq+ov0ltjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQqR/1mYYCDA2qEK9/juanwyDs71l9I6gkciO0S48k8=;
 b=YSrguUqZNVA1vj3dTGcNzoF1EKLRkRAuy6IiDBYHBAwjC3tXNmO9wVqVxOz2yUUrbFYxLAoDeAzKOCaKD0v9RxInaarNATWo5X6yOwRjpE6tzdjza0TRshKKAp6WQ4lLmYsk7LedmjiKnQoKWKoO1T3hqu3FiXDx2JVj7hVzkVcvZhJpELyvpLK1HieZL58l/JvDq06t1YSme3YuSxLa7gjXQAzk04HcsIiJSKhpt5LvBe5NKlypEWP4P0gJQgAHLO/yMg9T7nB3QX8xInRanVwdSDDj4mo0/fTelvEsUXfacHmS93/a4Z4u+QAdh/lBv8CW7PU29mwEeF3FKqxcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 18:31:00 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 18:31:00 +0000
Date: Mon, 1 Jul 2024 11:30:58 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Update basic test
 to include client utilization
Message-ID: <ZoL14kjBXD8Y3s9/@orsosgc001>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-2-umesh.nerlige.ramappa@intel.com>
 <55599ec5-7be8-4568-91a3-f5c8d782e3e1@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <55599ec5-7be8-4568-91a3-f5c8d782e3e1@intel.com>
X-ClientProxiedBy: MW4PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:303:b7::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 841b1354-fa77-40ea-fa42-08dc99fbf4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTYwNEJlRHM2SnVYT2MrbEJVR25wdzVFL2dlKytrbzNpckR6N0Y0NmtDZVRQ?=
 =?utf-8?B?RzFpZS9YV2w2czN6YlBPeXdUWWFRdWNaUGtuTWxYNG5XVDdYWFUvaVZ3dmV3?=
 =?utf-8?B?S3NhYlZ6VmtNbFgwMEZvR0xicm44SU82SVlIMG43RVdhVzh5dzZFTXFqQ0JM?=
 =?utf-8?B?ZzAvbEZSKzkrZ21FMXFGMlRIYmZSbnFncllRZWg4em1uOGFFbWdiRzVoUk1j?=
 =?utf-8?B?VTVJd3pGSlpQMk9mb2E0bUkxbkYwZjU5NXF2bVVMMTUyUnU1MFUzdWlIckJj?=
 =?utf-8?B?OWxJYXc1UzgrbXNVRTA3WXRwS1RhQmtwTnc0b1MwSUE1MERsbzZMUWRtWm9x?=
 =?utf-8?B?SEFPb3psVGJGSXhjSzNpQ0dqeVVLbXJ2QzJyRnZQM2MrSUUrV1VKOW5WMDdW?=
 =?utf-8?B?UmJaS21MMERWQnU2WE1oSUZjOFdTdUtyMVlEQjVDVlZ5c1hTUHl4RkhBaFBW?=
 =?utf-8?B?SGJVMGU1cWxoVnR5aEpIQStiUFNPUXY1eGhYWlhYWGdVRlkvTktxR05TYmUw?=
 =?utf-8?B?V1VmUncrN1FTa3YwRGEyVDlhNU1uZjR6SFh3aC9WbGdWNGYzaGtaazMxMFF1?=
 =?utf-8?B?aTFHcG5VZzYxMHBNZ1VrZVo5cWdZeGNJeHJvK1BDY0NXTVIrODZpVkZVZ2oy?=
 =?utf-8?B?dHFhaVJ6WFVsdWdLWWY5c2kyOU1hS3o1OVp5M3VZWWtjNzhPVWwxV3dXeG4x?=
 =?utf-8?B?amFTR1dBWFJHZTcwbS9OM1NYY3hzb1FkbitncjYxSTVtR25TVXNleHhDd0Jl?=
 =?utf-8?B?K2RGSTJaYTZUT3N2bFFrSVp5c2RkN0lZdWtWQVl0RnVaZU8rbEVxa0pEaWRw?=
 =?utf-8?B?V2ZNTUxzbTVDRzlJMk1wNmtpU1g5akhKQ2NqWE0zTjVDL3pqZlNqY0RMcDMx?=
 =?utf-8?B?VTNSSXdDY0VMa3pkNHo2bXJiSE93bHU0MUo3cE5WSndvSVFFTHh1MDhXZmlr?=
 =?utf-8?B?UTRQeWpVeE96d1JiMEpEcVhEWUFaTktiN0duT01iVC81NVk4QjhTTVhqME9F?=
 =?utf-8?B?Q2NGeG1vN0hrdnBJMnVnZlE0UjNFajRNOE5ZL1hpMjJzaDJ4cUJKTmtZT2V4?=
 =?utf-8?B?cWpvVGtjQ01va24rLzJnZWJxcHQ4MVdUaGI4ODZVbWVTR1NsOTJXSE9keFRi?=
 =?utf-8?B?MXdFaUFXeEJIZUdvTTRvTzNYSHkzZXFieWpZdGlQQmtUM25CelIxdTNnT3Ur?=
 =?utf-8?B?KytZbGhMN0QzdDY0OXFrVlhhdFFpcVJEMnNNVjk3V25GTkhhVDZ2QXVZQVNT?=
 =?utf-8?B?S1FvcWxiVGwxbGk4cUlGN1dvT1pGOWZ5U1ZudlorNmNtRUJXdG9IU1pua3Zv?=
 =?utf-8?B?bzJuVnkyVmRyR3E1by9EWTRrWDdhaWNETWhHU0RHRWhOWEl2QmIrb3hlQlU3?=
 =?utf-8?B?cU1FTWRqS1FBZStUY1NvMktiUVdIdnZKUXVBRHV1MnljRW9TZEd5VWt0V2p3?=
 =?utf-8?B?WEpMWktaZjZOT3QzL2N1dGFXcDJUQW1jaGcvTW5INmc5ZW1wUzNXOTc5ZGpq?=
 =?utf-8?B?bXNEeUt5dzlMSjBpdm0wUEU0WkRjeE55Z2NEaGpTRy80U1lHSEhDa0lCQnhz?=
 =?utf-8?B?c1B4UzByV2N6a3hmb21udnZTMXNUaGtENklENklWZDN6T1RaVmNub0poUWty?=
 =?utf-8?B?RGRQM3hObEpNOFA1RXVYeHI5OWJxUXRyTHNkem5veEdlSnRMc2dKSy9pMzJv?=
 =?utf-8?B?UEt0UWVSb2RMQmR5QlVVdWdIV3B6amxNOXZEN3FJTSs3aDRYRmh6b0cwd2tF?=
 =?utf-8?B?WktLQ3VPZDUrMVV3QjQ4SE93azRUZUJGNmc0ckRCaEtoMEVOWFV0V1NlUEVz?=
 =?utf-8?B?Mnl4YlhPclhCMjV2aGszUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNLMGt5WWJ3dUNWRWhWY2Y2eERRU2VnUFpkeDlYOCtPTlV4SVVtaEtjcjly?=
 =?utf-8?B?clMrRXdjVmtGTWZDUWpMT205RFJmYmZXUWNOZ1lJRlFTRGhrUXJUN2RtY2Vt?=
 =?utf-8?B?M2Y0SnVnY2V1dUpxYVNraXJEK29vaUtXY21PZ3lmV3lTNDk5TzNNVWpNYUtP?=
 =?utf-8?B?ai9oay9EVkVjTmVUd3B4M0pIdFYrdXM4dlQ5TmdabjhXZmQ4Qnk2TTQwZ1V0?=
 =?utf-8?B?VW9vU1pUWEtSaFo0bGhyZWFIUmErL3MyazZOemEyTVJJcU5YbUZPMW16WmdS?=
 =?utf-8?B?Zy9Wb2tmaGdXcmdtbTR2OUNSL1VmdDJvSU1BM3ZlYlU3UDVQamwrbVFLc0I2?=
 =?utf-8?B?QWdhbDZDNHZHQk1PSXp3UW1NeStabG1ScGhCNzhvZXFEaG9laHN1VVh5bWZG?=
 =?utf-8?B?U2s2ZDVrcFgwcHFlMDV4ckk0Z09zWTFIR251WmdXTE1FQTlXdEJOdnpHUDFF?=
 =?utf-8?B?UTZKT2lFRTRGdldvbmNJSHQ4ZW9oS01hTFZwZDMrdHpZdllIN1BFaW1TOCtO?=
 =?utf-8?B?RERIWTNIczdPT3h4TnVqMGNodGFSOFhWY2lad2h3bStmVFJVUFBrdTk0M3Q4?=
 =?utf-8?B?endHRzBNaW93NW5SUTBQVXRMTW5WWG9lQlk4N3l6Y08xN3JMWGdOUXVGSW1o?=
 =?utf-8?B?dnFzMjBlRU5jYit5LzJFQmsrYy9LMElsbUdsMWtad1dkblZNWjc2K3ZvZ0xo?=
 =?utf-8?B?R0JuVnArS00wUDYwM3ZyM0dvSXk2eGNsZnIyQjlQeDRyMDQ0cGFtWWVob0g0?=
 =?utf-8?B?Yk9tOGFPMTJxMndpZzcwYjZpQVhtL3lJOUtBYloxbk1wdDIrMkxQeGhLYWIw?=
 =?utf-8?B?enY0eVBvSnBUVXJMOUxNTmtTM2lIbEJXbXdvUWVuQ0NyZmRzOTgvancySmQz?=
 =?utf-8?B?Sm11TUpZM3psakxtV3ZKMTVMYUxXdjFweGpXQnZyTGltV01hMmVKRk5DZ1NM?=
 =?utf-8?B?RW44TjJ0MzJzQ2dPNWhGS1lEZXg3RzRIeGUwUmpqYzNGS0FOTTJ6T2hTZVI3?=
 =?utf-8?B?OGE1ZWNWZmVETXVKYVRINDVxWTQyOVZTZE5kaVB6UXkwR3ZpaDVpdFlpckJ1?=
 =?utf-8?B?S2ZtQy9oeHE1L1RwK3hDdlpuZEFad0lnWWNONXEvdU9KejRoT3luVW41U2J1?=
 =?utf-8?B?OGx6aXNnQWVjQW0wODZSaUUzeGx3SStBZTA3Qi9QaGk3M3dZempEbHp5K2xY?=
 =?utf-8?B?eTFIc0ZqZXZkUHhJRUt2V25DZlFLRnNaKyt6cjhwdS80VE1UTFd4MkRUbGVs?=
 =?utf-8?B?bjQxUmpRdnVLVmFVcllmekFWbU1OQ3dscHl0MTRYVitBQmVtRDVDSUpKZ1U0?=
 =?utf-8?B?bzAyWVo0RU00NFl6UmtndzFKbkl3QVZKdjloRTJMdzlKVmJHblZPYitzZlhM?=
 =?utf-8?B?Z2lFaU5Od2dYZzJ6eTVqSDFWbUdjSlpkd01sazFGenU3aWhtbXJxMDRTazBL?=
 =?utf-8?B?M1RFOTgrbWxuci9TeWpUUm1SZlZPUm1sUlF1TVNMMVA5d0hpaXJST2Q2NW9o?=
 =?utf-8?B?MW5hS214bW9qQkVvNHZKOWFranFBTU84ZzNyY0FvZFRlMkJONU0rRGh5NXJ1?=
 =?utf-8?B?bjkrcFNBQlBWck9YYi94UEIyT0JuR00zUFBhSDh5NnNTQ3hGM2JrMHVPZitO?=
 =?utf-8?B?eG9VL2lGMGV1NldWbVlibGFydFNnbTB2WU9Hb1hCS2M1alVMRHF4SklsdDNJ?=
 =?utf-8?B?NjZOZE1WaExZWWtkL2lNK0lKcnBNM2U1Ui93TTk3RHNzYUlkemJTNENobC9w?=
 =?utf-8?B?RDdXNytWVjlLYi95Y1NSdVhsbmdjY0toUFJzTUhPdCtqQUNndWYxbXFlNGpT?=
 =?utf-8?B?UEV5Snl2SnFRUXdYdnJMbGZqU3VvNStiR0prOUFKNnFJR1NFVFVHLzAza0Yx?=
 =?utf-8?B?clgybnNRaXlzSkJadkFHRjliT1JMVkFMc3BDUTltNVBHanp4U2c3RzNac2ZD?=
 =?utf-8?B?Mnp4aEpkZDFjT0w2T1Y4SmlES0lsRG5YdS9pMWVTNzZIOHNzVFFza05ZQzA4?=
 =?utf-8?B?RkdDZHdTNmhNKy8rNHFYWDZPUXFaSUpFUmptVGJBbzY0dktPYWNLYTZBaVp5?=
 =?utf-8?B?am8vWmVka0oydUR0Zmh2bGtmMlV0TDZsQktseFhVaEFYUUQ4ekVOMU1vYTFk?=
 =?utf-8?B?WkRsb3VqMGQxbFJxZUp6bXBsenQxRCtPU3FUekt0amZYa090ZTI3SnJOalVt?=
 =?utf-8?Q?pGqA2BuNwt8hjXHlH8rcxZQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 841b1354-fa77-40ea-fa42-08dc99fbf4c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 18:31:00.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rA65QvoCQLeJ3WQneK6/wU5RdlAjkmE0C/d9codNaKAQ7cPgvFZvIxd70Ot8wCBRYOanjRhpwAfsb2sdL89PHw1/QZrKuUC8Cm6g1s+FFvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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

On Mon, Jul 01, 2024 at 09:57:36PM +0530, Riana Tauro wrote:
>Hi Umesh
>
>On 6/22/2024 4:30 AM, Umesh Nerlige Ramappa wrote:
>>Add per client utilization related checks to basic test.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  tests/intel/xe_drm_fdinfo.c | 40 +++++++++++++++++++++++++++++++------
>>  1 file changed, 34 insertions(+), 6 deletions(-)
>>
>>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>>index 2ceafba24..e624029b8 100644
>>--- a/tests/intel/xe_drm_fdinfo.c
>>+++ b/tests/intel/xe_drm_fdinfo.c
>>@@ -14,11 +14,11 @@
>>  #include "xe/xe_spin.h"
>>  /**
>>   * TEST: xe drm fdinfo
>>- * Description: Read and verify drm client memory consumption using fdinfo
>>+ * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
>>   * Category: Core
>>   * Mega feature: General Core features
>>   * Sub-category: driver
>>- * Functionality: Per client memory statistics
>>+ * Functionality: Per client memory and engine utilization statistics
>>   * Feature: SMI, core
>>   * Test category: SysMan
>>   *
>>@@ -35,10 +35,17 @@
>>   * Description: Create and compare active memory consumption by client
>>   */
>>-IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
>>+IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine utilization using fdinfo");
>>  #define BO_SIZE (65536)
>>+static const char *engine_map[] = {
>>+	"rcs",
>>+	"bcs",
>>+	"vcs",
>>+	"vecs",
>>+	"ccs",
>>+};
>>  /* Subtests */
>>  static void test_active(int fd, struct drm_xe_engine *engine)
>>  {
>>@@ -259,18 +266,21 @@ static void test_total_resident(int xe)
>>  	xe_vm_destroy(xe, vm);
>>  }
>>-static void basic(int xe)
>>+static void basic(int xe, unsigned int num_classes)
>>  {
>>  	struct drm_xe_mem_region *memregion;
>>  	uint64_t memreg = all_memory_regions(xe), region;
>>  	struct drm_client_fdinfo info = { };
>>  	unsigned int ret;
>>-	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
>>+	ret = igt_parse_drm_fdinfo(xe, &info, engine_map,
>>+				   ARRAY_SIZE(engine_map), NULL, 0);
>>  	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>>  	igt_assert(!strcmp(info.driver, "xe"));
>>+	igt_assert_eq(info.num_engines, num_classes);
>>+
>>  	xe_for_each_mem_region(xe, memreg, region) {
>>  		memregion = xe_mem_region(xe, region);
>>  		igt_assert(info.region_mem[memregion->instance + 1].total >=
>>@@ -289,19 +299,37 @@ static void basic(int xe)
>>  igt_main
>>  {
>>+	struct drm_xe_engine_class_instance *hwe;
>>+	unsigned int num_engines = 0, num_classes = 0;
>s/num_classes/num_engine_classes
>>+	unsigned int classes[16] = { };
>s/16/DRM_CLIENT_FDINFO_MAX_ENGINES
>
>>  	int xe;
>>  	igt_fixture {
>>  		struct drm_client_fdinfo info = { };
>>+		unsigned int i;
>>  		xe = drm_open_driver(DRIVER_XE);
>>  		igt_require_xe(xe);
>>  		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
>>+		igt_require(info.num_engines);
>>+
>>+		xe_for_each_engine(xe, hwe) {
>>+			num_engines++;
>num_engines is not used anywhere in the series. Can be removed

Will include in next revision,

>
>With the above changes
>Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks,
Umesh
>
>
>>+			igt_assert(hwe->engine_class < ARRAY_SIZE(classes));
>>+			classes[hwe->engine_class]++;
>>+		}
>>+		igt_require(num_engines);
>>+
>>+		for (i = 0; i < ARRAY_SIZE(classes); i++) {
>>+			if (classes[i])
>>+				num_classes++;
>>+		}
>>+		igt_assert(num_classes);
>>  	}
>>  	igt_describe("Check if basic fdinfo content is present");
>>  	igt_subtest("basic")
>>-		basic(xe);
>>+		basic(xe, num_classes);
>>  	igt_describe("Create and compare total and resident memory consumption by client");
>>  	igt_subtest("drm-total-resident")
