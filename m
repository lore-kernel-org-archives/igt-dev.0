Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C9460A383E
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VtuD5Vn5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D66410E5DD;
	Mon,  2 Nov 2026 10:42:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61DF10ECCC
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793616092; x=1825152092;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=58PNFNmqP4YjSgE4SBaa6KUqMjrSH1Jjt5pZ0BK7/FY=;
 b=VtuD5Vn5UgkV2DGXjPOOK/O+KyEDTDn8b8S1KPr9EPMIJnx0j0NE3cf4
 /aTJCkIqn+A40eFVKQq9pWvZIe/p/hpz8cqPIiGhQmjus6ULKgCHVKIaZ
 JET4vl8iGgdRPsXj68pPKvUC2Hlu8B+YG4KzvxnTTRb1uEePxxS0KR8dV
 xrvmU72/72HimdKl8kAiF7kElOPI46laZMXFCQMSxOM7yLzJ9/tqi39xd
 nOOmZC2oFoZyfzDPCvzYE6BvYZM6egxzzH8Z6uDedKkc/j/ou/+yrnFrk
 o8eaX4IUdTLbTUOm1IFGc/fl9NYHGM6uw5TwGMbAwyQKNaSrOGCVUWrYG Q==;
X-CSE-ConnectionGUID: dbsQLX/1Rr6k4r6cokUhLA==
X-CSE-MsgGUID: 99oleMSQQ1af9uI3F+OhbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2304305"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2304305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:41:32 -0800
X-CSE-ConnectionGUID: GaBcZCmXS5iw6Sf54dB/AQ==
X-CSE-MsgGUID: qpKT2RsnQ4KxqS1daH6/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6067179"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:41:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:41:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 02:41:31 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.16)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 02:41:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4uG2kLsT6++cuGnu15d/I9Mwk3v+5AaalrN8Op6SawFuzWKzO0mDippERYikDAm9jT6JXdm2laF0zyw0w8H1vjiWS682/HLQZp0jMQa7enCvp5MORuOQYKuDdQI0SvqBrG1fjVwfTc9G7mKYpyNaLGXfV46aN6ZZji1q06Ise9IxgCcRpriSwyeLHWOuX8hPa6bw5BZ4EpdtWIVOjgE3doLW5aqNSleK5wc1Ys4G4kCFdOaasNjm9hQR5zaxC1opQ8suhRlaDlmlhRA4B8nFE0UIMXFpBktMMmXtvfEgxdHuKAxn1eD0xTfqdiw2+3ZN7jX4OeiKmchj7keJeXxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTPca/D6YtCLT+4aVZ5xTBryUdTYt2TUKaRRbzBrtFw=;
 b=u2d5qPn/iilDoXKMD39RdGq7D04MMvNi3RmLtU9HYZaLKV/RZh/JTWyHVzXmJ/ly0YY1aUmZacEfBnAl1gtDO4c6nuNJ0oOXsiWeDCM/LwxNskEv2MitGGOMKjGzS/safQgonj0hyXMd5Ffnk9mxT3R+q5klxklgX0FcaG7DrHblaAUYGVl6DWD7OfqkY5komldETB4GPxmSQx8KIi3U1Uy6QqPMdhidTRdHJ8RrXhjv/Z39VgPVi7HGig1S8cth7tr4B5VwJJmkFC/Q8vJuX25iXL4VOG3j9sTrupihbYfo6pxhlKjhKV3KmaA2SfLnGbXfTe8O72GEettn11AwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA3PR11MB8076.namprd11.prod.outlook.com (2603:10b6:806:2f0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:41:29 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:41:28 +0000
Message-ID: <f45502e4-094c-465d-bc01-9af8aabd07ea@intel.com>
Date: Mon, 2 Nov 2026 16:11:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel/xe_configfs: reuse pre-existing configfs
 group
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20261030061440.2342301-2-sk.anirban@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261030061440.2342301-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0263.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA3PR11MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff20c01-9bb9-4a6d-2f30-08df38cdd99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|261021123027099003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kVWewTWt1MfymIT2R5VmYH+t1B7ElN+diV9Z4ZIedeRKyq0p0y3zk39wzYcXEy+NK2sCTRiK/Qc/Ar19GRnP6gkJ3zTLWqxxXyTyaMXMUnJa8MWg4nwbTO5EjIi/xYEoXS5L/M3RhsBP6NGboq7kvm+DNXcplHdDa3Vyv5JwASa5w44TKEdq4iTuxguARh4If+W3h2WcTUjgg1Fy21ao199hPQW58wcsl7zESt4jYHmBejBqxrLYQh228C7u2V2fqnzd1JMUno4NR75T/CXy/RclBuJo77TRqOJjxk/5HfpD5XvRoNNGemyZZORjOcAXl5B+mWKJsKvdVqn32E/tAldYx05m7O7hpbJFn5p9ZWuMRrOSlC460ZTsaZ4fFBEYZOYCJPpMivI709fWAM808U1NWyz2ze+XDpeRm3a6xEI1maGj58syV5DgnLczRBBiFwvd1U/H4nDerEDBqxhC0lOdPXtwjo66x9eNem3U3THj0bRXH8BeuNeMrReCndGVZrGqbWseRWvsrcHyuZZ/UPdFAQpFSt6ri04WzYPtaJT64isXkAiy8oZSxQrqP4f0m1Ee65UswHIMEG+1N8WopVuy2rcghDk9kGhCdC8IMtVkHUgaGQPRCMNgYEJT2ZICz+hi0Snv1xAMWwdMHT1g8Q3mdARscV8kCMsqG4TgIz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261021123027099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGdxRjRFMDNncS82c1k0SlBoNlpMZmZhcTlxL20yakRMOWF3UGVLME13ZE5i?=
 =?utf-8?B?aGN0ZjZDVkNhR240b1h0N01FSnJXaWo3SDdGeUR2S1NKVCtiK1MvRHVrOTdI?=
 =?utf-8?B?NDh0cDNGZ0s1bHR3VHYwREh5cThNM1ArZTdxcUV6bC9odXl4S2FNUlNsZjRz?=
 =?utf-8?B?a05nN1g5SHFSS01oWFZiU0F6NkkwSmNlWTR1YUF1OXNmZXZtTS80ZlhqK0tY?=
 =?utf-8?B?WE9WdHlkMHB3QnVmYmZZVnYzYk5NOHM3Q3ZpY2J2Y01SNk52S1R3eW55T0FP?=
 =?utf-8?B?NWVuTmtRbUJWcTU4ejhidWZFQkpSeWNEd1V5UmVNZDVHbkwzK0VQWU1MOXRR?=
 =?utf-8?B?eklveVRpMVZMVWNqTk5qMVdYOFdqaTl6eDJISUc4MlkvVlFaL0I2VkV5K09v?=
 =?utf-8?B?ZFZGSkhvVWFpZkR2N2tWVUZvaDNwZDNQMjYwTWMwWWh2a1dUY2c3VW01S2Vy?=
 =?utf-8?B?eXpuWmpYSWF2Z3o1QStOM1l1UkxDMmx4aUpZNThFbE5ROFprSEQ1Z3g2V3VI?=
 =?utf-8?B?R09qeEVvMGlDZjhpUnNTMWprQ2VlNjVLeEx3ZHFvSHBHQVQ2QzR2RzFuMlIw?=
 =?utf-8?B?M3RqKzl1NlVFTGhUTkpvWFJBZmZnMTdLdzYybXl6VjZpUytwWUc4REgxeTNv?=
 =?utf-8?B?amRNOHpIVnBsQTIwSzQyTzIwVWZEcDRJK29XbmkrcXNUc2V3Y2RoRlVkY25t?=
 =?utf-8?B?L283WGpoMW9wRTdFdkp2aGR0QUlaZ25Rb25hMDF3SS9HaERDVks1V3BiRHhw?=
 =?utf-8?B?QXFobzdMa1lTaEViaGV0VERZSlNsc09XMkdRVXFjNmZPOE94aldTUFI3Wnlq?=
 =?utf-8?B?SFZMOHE1eWRLZ1NkWmZSdnQ5eU1ZanZDaGpScW50U3hQazZBbmYySlN5N2tD?=
 =?utf-8?B?aFFMcnIrOTVIS20zWXc5V3dNSXg4YTVHMlR0R2xOcHdoR2VYd2svLzAzazFu?=
 =?utf-8?B?V0lyZnlPR1Z3NEhhUWZoekhlMVVtTXhJZVVZN3QzSHg3MHNBWTFmK1ZCbnZB?=
 =?utf-8?B?MmFLVUVmeUh2YVV5LzlQVEVxWXFQUThUa1ByYTdwTXc3Y3lzdVhCaGtvUGhT?=
 =?utf-8?B?cm5LTkZqdFJvbW9LRzE5TGg4SFB0K2N0dGRmOXVzT0NCQTd0bHpDSVZEUmpi?=
 =?utf-8?B?UWpoc2lnUHdpWG1HcUxGQzQwbTkxMy9uRVRWazlZZW9DbVVyeGpxeDhYN2p2?=
 =?utf-8?B?ck4xaXEzTi9uNnZ1aFNlNkR2SVREbGVwWmxHTFNkc1EyV1ZrdmtsUE1JNGg5?=
 =?utf-8?B?aDVDdml6RjZGT1RtVEF2TUgrN1FzV3NEbjhXVURGTy9mREdLa2VhdXFqWTdw?=
 =?utf-8?B?Vi8zVU1mRkxMODd4Smx5ZDRMOVVNZlBVK1pNU2NaMU9NV0JXVFh2NWVsTmpN?=
 =?utf-8?B?UEdJaGNoVUNHdUVVYmZtREtXemN6dWluSUxnNnJDeHBhT3JMWkVyaUwzMnIr?=
 =?utf-8?B?ZWFlUmVaUldPVllUbXlzNUlpdnkyNkdGdEpnT28rUGRRVnFPaEh4KzNtOWY4?=
 =?utf-8?B?WGJnc1VQWGxrdEFYaks3RXN3NFR3WGl5NFAxK1NuVk9Ycmd6MVRnOWZ4MDQw?=
 =?utf-8?B?emg2ZFpQd2x4RFZDYmh2WGpUaVlKN0owWEt1V0ZBWFUwTXQ4SjBrSCtKSTZI?=
 =?utf-8?B?dGxXNGNFODVBdWN1VjNnNGdpSExqeVgzVEF1VHE5ZW9WTTJqMHZvMEZmSThr?=
 =?utf-8?B?ZUh1K0tmd0EyRGxrVGp2dzZrdGRnbUpDMGZWNlJYMS8xUmU4bUlxYVhUWk5q?=
 =?utf-8?B?SDZ1WGg5eVV0cVVuVE5vN3dpOUJkMjFtdGFjS2lWZ3pNNXJsQ0djNEgzNUZN?=
 =?utf-8?B?R2dyVldjYmpoaFpiSk5GVVA0K0cyRzh5cVg4d1UxYktFZU9EYVliUDVxWVRi?=
 =?utf-8?B?WFJ2OHpDeENJR1J6YzhDaWZGWXZCczZKK3FoOVh2bTE0WnJxZkhJRXF6ckJR?=
 =?utf-8?B?ZGhWbTQ2c2EwaittZ1BHTWFISHRYRnd4YlhPWHdGQmhqWHVwZkUvaEJiTXNF?=
 =?utf-8?B?bVVlWFBBSFpZTFBGSnB0aitkQUxlL1lBMzBmWGFvOU0xRU4vTkc0SGZPMTlL?=
 =?utf-8?B?dFVJMGY5UUpXR2JGSlh5U0hLWTVBQ2xzdDQ0b2RlMzJoTTAvQjBHUFFqMjZo?=
 =?utf-8?B?Vk5OYmhhR3hCZTYzVkZpeVpKM1JteG5QMkNiamdjMHcwWThUWjU0QTZjdkM0?=
 =?utf-8?B?YmJYSjBVZmRSN3JVc2NWSzRnMGpweVFTYndGMEpxTHY1SWVEY0JoMHJ6SzhH?=
 =?utf-8?B?LzRJdGhHVzJaY1pQUDZxZWpLSUV0OElMR0dRU0dXOFJqU2lOd3dnQ0M2RzBF?=
 =?utf-8?B?YjJPRnJjZHRLeHhNM2RXb0pHUDJCczluT21wTjZEQ3RzUGlsWmt2Zz09?=
X-Exchange-RoutingPolicyChecked: coQJK7wAXvuM91wX7gpgYF8kDS5XMRAzhrnKs97nSKMxO5FSTsXGLuWloaKvQvUyhCttthXzFNc51TObdbhFXoTxpAgcQMRjgOfC+wHZEukz37fMawflNw9MjGIPqnxw2m8oq/IvMLMXW/A5bomfYeRqcBWUi9SQcG5mgXtR4ajHte6spw+cYIFu8HnndY5YP1OiUOfXEVDqcaomi5ohMCETVbEHCuWph+LP0CXEDCIMsYFUm3qnkG2fKBR5vXnGG9uY0EA6A5UCpBWHf9MKz8Js0N7il9nnCR9DquVbo01tYumOM7aUvXkZunG+p0jLeQBdJ3rgKpHnLE28Zz9fnw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff20c01-9bb9-4a6d-2f30-08df38cdd99d
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:41:28.3634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkMUt4zxFqUB1DPqhKAZtb9zvMbHtVGIVzCtBXTKZUCIWJEWbyi5U6i3t8vue5O/UUWEAWvKgeMfgG2Tc2Jg3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
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

Hi Anirban,

On 30-10-2026 11:44, Sk Anirban wrote:
> Handle a pre-existing configfs group by opening and reusing it, retain
> it across cleanup, and validate the fd so the test fails early with a
> clear message on any error.
>
> v2: Add a common function (Soham)
> v3: Close fd and handle failure (Soham)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   lib/igt_configfs.c             | 62 +++++++++++++++++++++++++
>   lib/igt_configfs.h             |  6 +++
>   tests/intel/xe_configfs.c      | 85 ++++++++++++++++++++--------------
>   tests/intel/xe_survivability.c | 22 +++------
>   4 files changed, 124 insertions(+), 51 deletions(-)
>
> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> index e0cba92a1..7bbeca746 100644
> --- a/lib/igt_configfs.c
> +++ b/lib/igt_configfs.c
> @@ -10,9 +10,12 @@
>   #include <fcntl.h>
>   #include <limits.h>
>   #include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
>   
>   #include "igt_aux.h"
>   #include "igt_configfs.h"
> +#include "igt_fs.h"
>   
>   /**
>    * SECTION:igt_configfs
> @@ -84,3 +87,62 @@ int igt_configfs_open(const char *name)
>   
>   	return open(path, O_DIRECTORY | O_RDONLY);
>   }
> +
> +/**
> + * igt_configfs_create_device_group: create or reuse a device's configfs group
> + * @configfs_fd: configfs directory fd
> + * @name: name of the device group
> + * @preexisting: set to true when @name already existed
> + *
> + * Creates the configfs group @name under @configfs_fd. If the group already
> + * exists, it is opened and reused instead.
> + *
> + * Returns:
> + * The group directory fd.
> + */
> +int igt_configfs_create_device_group(int configfs_fd, const char *name,
> +				     bool *preexisting)
> +{
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +	int device_fd;
> +
> +	device_fd = igt_fs_create_dir(configfs_fd, name, mode);
> +	if (device_fd == -EEXIST) {
> +		if (preexisting)
> +			*preexisting = true;
> +
> +		device_fd = openat(configfs_fd, name, O_DIRECTORY);
> +		if (device_fd < 0)
> +			device_fd = -errno;
> +	}
> +	igt_assert_f(device_fd >= 0,
> +		     "Failed to create/open configfs group for %s: %s\n",
> +		     name, strerror(-device_fd));
> +
> +	return device_fd;
> +}
> +
> +/**
> + * igt_configfs_close_device_group: close a device's configfs group
> + * @configfs_fd: configfs directory fd, as returned by igt_configfs_open()
> + * @name: name of the device group
> + * @device_fd: group directory fd
> + * @preexisting: whether the group already existed before it was created by
> + * igt_configfs_create_device_group()
> + *
> + * Closes @device_fd and removes the @name group, unless it was pre-existing.
> + */
> +void igt_configfs_close_device_group(int configfs_fd, const char *name,
> +				     int device_fd, bool preexisting)
> +{
> +	int ret;
> +
> +	close(device_fd);
> +
> +	if (!preexisting) {
> +		ret = igt_fs_remove_dir(configfs_fd, name);
> +		if (ret)
> +			igt_debug("Failed to remove configfs group %s: %s\n",
> +				  name, strerror(-ret));
> +	}
> +}
> diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
> index 91f95659b..0f4cfe5d3 100644
> --- a/lib/igt_configfs.h
> +++ b/lib/igt_configfs.h
> @@ -9,7 +9,13 @@
>   #ifndef __IGT_CONFIGFS_H__
>   #define __IGT_CONFIGFS_H__
>   
> +#include <stdbool.h>
> +
>   const char *igt_configfs_mount(void);
>   int igt_configfs_open(const char *name);
>   
> +int igt_configfs_create_device_group(int configfs_fd, const char *name, bool *preexisting);
> +void igt_configfs_close_device_group(int configfs_fd, const char *name, int device_fd,
> +				     bool preexisting);
> +
>   #endif /* __IGT_CONFIGFS_H__ */
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 450c0a119..68daed690 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,6 +26,8 @@
>   static char bus_addr[NAME_MAX];
>   static struct pci_device *pci_dev;
>   
> +static bool configfs_group_preexisting;
> +
>   static bool check_registers(const uint32_t reg[], const uint32_t val[],
>   			    size_t max)
>   {
> @@ -60,7 +62,7 @@ static void restore(int sig)
>   
>   	/* Drop all custom configfs settings from subtests */
>   	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0)
> +	if (configfs_fd >= 0 && !configfs_group_preexisting)
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   	close(configfs_fd);
>   
> @@ -70,10 +72,19 @@ static void restore(int sig)
>   
>   static void set_survivability_mode(int configfs_device_fd, bool value)
>   {
> +	int ret;
> +
>   	igt_audio_driver_unload(NULL);
> -	igt_kmod_unbind("xe", bus_addr);
> +
> +	ret = igt_kmod_unbind("xe", bus_addr);
> +	igt_assert_f(!ret, "Failed to unbind xe from %s: %s\n",
> +		     bus_addr, strerror(-ret));
> +
>   	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> -	igt_kmod_bind("xe", bus_addr);
> +
> +	ret = igt_kmod_bind("xe", bus_addr);
> +	igt_assert_f(!ret, "Failed to bind xe to %s: %s\n",
> +		     bus_addr, strerror(-ret));
>   }
>   
>   /**
> @@ -93,6 +104,9 @@ static void test_survivability_mode(int configfs_device_fd)
>   
>   	fd = open(path, O_RDONLY);
>   	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +
> +	set_survivability_mode(configfs_device_fd, false);
> +
>   	close(fd);
>   }
>   
> @@ -357,23 +371,6 @@ static void set_bus_addr(int fd)
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
>   
> -static int create_device_configfs_group(int configfs_fd)
> -{
> -	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> -	int configfs_device_fd;
> -
> -	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> -	igt_assert(configfs_device_fd);
> -
> -	return configfs_device_fd;
> -}
> -
> -static void close_configfs_group(int configfs_fd, int configfs_device_fd)
> -{
> -	close(configfs_device_fd);
> -	igt_fs_remove_dir(configfs_fd, bus_addr);
> -}
> -
>   int igt_main()
>   {
>   	int fd, configfs_fd, configfs_device_fd;
> @@ -412,62 +409,78 @@ int igt_main()
>   	igt_subtest("survivability-mode") {
>   		igt_require(has_survivability);
>   		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_survivability_mode(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate engines_allowed with invalid options");
>   	igt_subtest("engines-allowed-invalid") {
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_engines_allowed_invalid(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate engines_allowed");
>   	igt_subtest("engines-allowed") {
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_engines_allowed(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate gt_types_allowed");
>   	igt_subtest("gt-types-allowed") {
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_gt_types_allowed(configfs_device_fd);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_post_bb with invalid options");
>   	igt_subtest("ctx-restore-post-bb-invalid") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore_invalid(configfs_device_fd, "post");
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_post_bb");
>   	igt_subtest("ctx-restore-post-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore(configfs_device_fd, "post", engine);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_mid_bb with invalid options");
>   	igt_subtest("ctx-restore-mid-bb-invalid") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore_invalid(configfs_device_fd, "mid");
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_describe("Validate ctx_restore_mid_bb");
>   	igt_subtest("ctx-restore-mid-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		test_ctx_restore(configfs_device_fd, "mid", engine);
> -		close_configfs_group(configfs_fd, configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   	}
>   
>   	igt_fixture() {
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index bae9eca27..015b22051 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -40,6 +40,8 @@
>   
>   static char bus_addr[NAME_MAX];
>   
> +static bool configfs_group_preexisting;
> +
>   static void ignore_wedged_in_dmesg(void)
>   {
>   	/* this is needed for igt_runner so it will ignore it */
> @@ -162,7 +164,7 @@ static void restore(int sig)
>   	igt_kmod_unbind("xe", bus_addr);
>   
>   	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0)
> +	if (configfs_fd >= 0 && !configfs_group_preexisting)
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   	close(configfs_fd);
>   
> @@ -194,17 +196,6 @@ static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pc
>   	}
>   }
>   
> -static int create_device_configfs_group(int configfs_fd)
> -{
> -	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> -	int configfs_device_fd;
> -
> -	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> -	igt_assert(configfs_device_fd);
> -
> -	return configfs_device_fd;
> -}
> -
>   static void test_spinner_after_recovery(int fd)
>   {
>   	uint64_t ahnd;
> @@ -232,7 +223,8 @@ int igt_main()
>   		igt_device_get_pci_slot_name(fd, bus_addr);
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
> -		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +								      &configfs_group_preexisting);
>   		igt_install_exit_handler(restore);
>   	}
>   
> @@ -269,8 +261,8 @@ int igt_main()
>   	}
>   
>   	igt_fixture() {
> -		igt_fs_remove_dir(configfs_fd, bus_addr);
> -		close(configfs_device_fd);
> +		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> +						configfs_group_preexisting);
>   		close(configfs_fd);
>   		drm_close_driver(fd);
>   	}
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
