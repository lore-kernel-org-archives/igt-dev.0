Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBDAC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 11:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E4110F54C;
	Thu,  9 Jul 2026 11:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbEJKbiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B76D10F538
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783597921; x=1815133921;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6DDzBQmjtKLOYMXGkSDakQAF1cV86Hw6fJNi4GNWV70=;
 b=MbEJKbiWIOYuEPT8DxFlRSeS6nQ/zMxNYCnYoKUgvCWrDu7WcS6bYW4L
 gu3yHqnvVnHCwzNxjFhm4iikzAckC2dLAOfq3OWzDxHzrQOiTW6Z0sKPI
 nB/5/rSnkaAnWHbHrHuwu+Ty7MnynM4Okrl+ULoCzJiBc4GcFbMzuRvqG
 IWDxNjjL/8E5bYvYle0al0NPqWt4UM11M4BRSSm78GrbS0bTqVZ1zswj8
 swkuixzMe2VXVsq++LIYCY3erpunVsyA+2I5IXJjUSKt7fPjGeIwHeq/U
 iTDZoTdvAWrWvwKnAHRClJ2jrbGxZN0NJfCJ1qYhrebSngx5rwQe9cL36 g==;
X-CSE-ConnectionGUID: dTRU5D9fRg6ykzW5jvayMA==
X-CSE-MsgGUID: YhBcrIoWSSSgglT6rnKuwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71795718"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="71795718"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 04:52:01 -0700
X-CSE-ConnectionGUID: gVQYWRYLTDSYNpcA2ZNEyw==
X-CSE-MsgGUID: 95CeKdMZRHGv9oSDNeMuhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="250166880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 04:52:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 04:52:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 04:52:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 04:52:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKEAcZ7Aekg5KUGlRfxrnQihFPe4VqMkmVuLE26xYm27tkE4Q9+UIwrGgEAUZWG2h7PseRRTRAQpHcLb/mrw+DZQYPN4rvze1gaGX5ftjXR6RUriSyzw7osV7/ZcYq1O9EDoytcStxQmSEzK+Y5j7HyMCt45bdtRikxH90hISWScmds6fdAJW6RzUiPOfan0FD2wYQVTNdr5ww/8XcsmeFMppUPzTd4CQMS76WjyNuJx/nTVKbmqh+D8bJNEaFSSiaQvOeqVnRSEjVkUx+W7Jpun1vwoGi7OY4Sxa2P0tNq6DLOwiswUd33qZJeOX29JmKIPmyHmHqBsRUb21BfcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzjIlgaZRiemt9XTarn4qxX23wh0x6s3tamLcejTf3I=;
 b=rLdpkj0g5jf6tVuN+h1BppbdwH4kGwkO5jE/Jbf54fLTZPdZKHItC6AiQV9haxtSEpE+N1w+N4TOuxfxD/AdLuXA5FT+nwYhx/UbK2T0kfA5dcXwVw2CUOo4GXwCm7Dkm7RYjTya/8CsbjHJg5u1VnOAXNLkkr53L854x5ecElZfSa6ps1qAAAqOmp1XUdqWukJOoaJ92Qr24PmGO3Gac7tJXkrZTX4dc4rxTidOx0MVRsP45kYLOjiNTc/HvwczFR5mcXJa1i0+g+v/0UgYI5ZlKAox+IJOW1c6UvcF0Hs3wzviit3siWEcWpN9lzy0YHASGn4scPab7NmjZZA7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 11:51:52 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 11:51:52 +0000
Date: Thu, 9 Jul 2026 11:51:43 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 3/6] lib: Add platform filter initialization check for
 automatic filtering
Message-ID: <4izs3vagznu3hnrjztoih4ovmytec5wsdgxjkrfhpxxlrjcdlt@eo536zl6jmpb>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
 <20260706235130.157557-3-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706235130.157557-3-vitaly.prosyak@amd.com>
X-ClientProxiedBy: DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CO1PR11MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7dbaa7-353b-4bc1-f87c-08deddb07795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: ZZq+ONccvJcG1Qwfh0ZXuWuJEE1H4Af/9fH5POcVVahdaytkzbu5UbUZQjycVzrITiWxghAvifiQCbPGkLP3hA24dSx55LlXVDm5xHSm8PodzAYBxTfLXkp76MGPoIR+T2SoIxfB1uQTR8fDkFo/+T+ST0k28N6ZJhvH8P7mTdCgbZxnpkTZ/F2grMO+yKIJWEY88d/lT0AWE9Wd/QPfGk8gtkzQ3KB1Vo2bAz9S4LjGAikOzQ1oZhbsZmT/CJtsE6EJF13Rr/sUMwAhnquLna60qYuUfzubTlyLZXt/yVaxmShkhI+OV02Dv+JxtNGZcn9pU+12A4zVSzUSCYqS8r0LJ0ILBJpzGi+dZruycCyGkpFQAWfMS5aV449fYzSx8aLo2jS+CUz2WbGtvoDE/eWMSO+CWXp9LHsEdHtY5WdXdzeUgX0jCEBwhXmpNPwmByVvZ4hY9z1xqRxtN3saxKbXQcM1uHIuHCQv0hKwPMawockMJJVJdfllJHBGIK5dct1rHo8Xts84bfwnuN3cqKNoRLbXiSJCKFspcdzRTZ0PxnTSnUPBJKtl0nFH9joXRHN77sX/043Io7Oy8ZFADV2BQ6lwszfaf89kduH5p63GaS6NOCNhFJCVVE6zJXXHmes1/F74ixh0daVYrAh+iXf4JFtsnzKMBqU/ECHHxTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpGeTc4eVk0cXFxajgvY2s0Z29PeUNoQWdTWjJsNWVNMXl5V29XUFV3Y1Bi?=
 =?utf-8?B?T25Gejh6TjIxUEF1dkwrTEYxUkV1ZDJ4anJoaDVrSWw3M0ZXa2g4bDFEM0hT?=
 =?utf-8?B?dmZJNXRjS0ZpeXJBMlh2NFVCelM2NGd2bGF4SXhoK29YaHlXcTYzUWI4NmpY?=
 =?utf-8?B?dk1JSnJGNzMrcURNenhmQ1NqN29aOVFETXVJSHpIem5TdEdtYWxHbitrOVpq?=
 =?utf-8?B?LzZBOWRWLytZa1JTNkgyVC9xejl5Q1FXa0RRRlJUY3RhdG1Ba0F2U2RYTjVu?=
 =?utf-8?B?THhZakpaKzJ1Z0FMTHVONzM3MitlSDlTNDUwNG5PSlYyejRYd0U1dG0zYk0r?=
 =?utf-8?B?dklFSTB5Zm9nMjZDcE1VaTVaQmlPODJ3YnYrMjJxOVZJbnFUZUNrcGw0U1dM?=
 =?utf-8?B?dmNsS01yb3AvY1hmZGYrQWlPV1RHM01VZ1NPcUJ3Z3hlWWNJUWZVY0RQemJT?=
 =?utf-8?B?SFFxRGtvejBlTWpweStDeVQ3UlE2UXg2d2t3VitzMjhvcWs5T0ZobXFNRVB6?=
 =?utf-8?B?bEtwMCtTcXBvOUpTVkgxd1B0a0MzY0VOYnNGK2E0Y2JTOE4wNEhYZEhWN3Zz?=
 =?utf-8?B?QVNuQ3JtMUdzbWVhbHFmcUFRakx1ZkVRYXFpakkvdHZTcEdoU2NkRis2cGNm?=
 =?utf-8?B?Snk4ZUFkUldxTDhId0UxQ2FMOXpjN2JaWG9aRUkxbkVIQUVRZXFmT2pyeVhV?=
 =?utf-8?B?amFneFgwa1pYRlc4LzM0K1NxalEyaFRZZ3pyaVZ6N3RNT3VjTksyTFFQdkl3?=
 =?utf-8?B?R3hmQ2N1TmtRc3hjVE9vRWlMa2l6aWtPODVqWGlTdlNHQUxCUkRnQ2tHdW5k?=
 =?utf-8?B?M1BkeHd6aHMvd284VGlxUFRPNGhTLzZFbnFwcnl6UThNVVNTUHZZc0t4NDJH?=
 =?utf-8?B?Mml4dmJrQmNQRWlwUzNkWXdLQ0labUhJT285dk1zNDh2bzRVZkNuUWUwU3Rr?=
 =?utf-8?B?WXJ2czhJTVRJNWVnV3NaOFZXa29Lc0VmdmlIaUlGL0h2eWhVWVNGUTVQd2pv?=
 =?utf-8?B?KzdZN1UybTlTdHdMNmFuOTZGdkpLR08yZjBJM0xlbVEzNEY1VWVDeDBCRUM0?=
 =?utf-8?B?LzhHZXZ5dDBWTUd3TldDYTJuMHVkS0VmcFdzNHdoeld2Vi9qWGRmMHJqZXlR?=
 =?utf-8?B?cnR0dlM5WW9MU2Q0cEtob2xtQndTVFdueHJ1dDNpVWlpYTZUSmpEREFJWGxS?=
 =?utf-8?B?b2JSZ2RPWHdpTlZsUWJFcVFLUHU5ZWc1TXByc0s2Sk5YZTBuNDQ3eEdUckZt?=
 =?utf-8?B?cCtpalAxcndhU0JUYlNZNVV3OWpGd0lkMmI4QTN4MHBtV1JtV3p0enpBZnNh?=
 =?utf-8?B?dlArT1U3eFp4ZDNpSXlCK3UwanMvbDJoZFUyNzBDUE41UUNiMXVJa2VnbmdS?=
 =?utf-8?B?Zk1STVlHUTVBOGI5dXV5WUh0SEt5dGRBNlR0UW8vWEVWKzAwL1NIUUR2dnQw?=
 =?utf-8?B?Sk12dEJQbHFVRFMrTURWQkhkVU1HemZBcHNnMHpLNG5yZ2dNMWJJejE0KzVR?=
 =?utf-8?B?MUdVZy96ei9GWlN1QmlpZEdKazhCN3FsVzV3QzI5b01IWVh0dXQzdWhORGth?=
 =?utf-8?B?MFdlYVdWdldqRStrV1JKNytTNkFCMjJnN282Zjl4a3hJZHJueTZHTVpwTUFJ?=
 =?utf-8?B?ckF2bGk4WTNKeVhTSyt2Z0E2QUxEeWdhWG9La2dXaUZwMCtlUCtXODNpRmRh?=
 =?utf-8?B?amVHMmlYcU1qcmJyQ201M21LRU95WDA5NmEyNzdwRnBMS2trSjJjTi9jQVpo?=
 =?utf-8?B?YmVjRTVmamZEWEVUK1RsYUVwb3ErSlhveTNqU1cyaFpKMFZ5UTN0TVJFOWRl?=
 =?utf-8?B?VXllbWhjVGVnaUp6VkhNQmVKVit6SzNzdVcrU0xUQW9jZkx0alNRWjZhOVM3?=
 =?utf-8?B?eDhKdHpXMkFuNUN4SHliNDZsbkhWaktGZHcvY0ZuZllGSitZNTBvOFBKcHR2?=
 =?utf-8?B?TzNkRndqODUxQUFVNFJnUUM2eHBZQjk1TE9iTkdXRjU2Q08wTDBXRzN0RG51?=
 =?utf-8?B?MVdHVUxhMXZBbGZRU2lidEErcjBON3dDVC9CN1Z1cVpnVUVBTFhacU50VzhX?=
 =?utf-8?B?UEVyaHRRaUtpUFB2TVI3UkQxUlhMMlExYVpvU0Z0TFZkWGdpR2NReU05cklD?=
 =?utf-8?B?cEoxME5Rdzh2Nm11UlFLQjh0YTUxU1AyM1ZVOWRzY2RVQlRLdWliNVViSDZl?=
 =?utf-8?B?aFloNTZoaVNiRHIwWlZIU294c2Q2MTJZVUxYWGZ3WTVuc09pS09QNGEzQWx6?=
 =?utf-8?B?OUxaMzRGRklGWnVoRGxzdTVYZmtORW55dEVIampScDU5WEdHY2wwTWsvWDd4?=
 =?utf-8?B?RHVlVFo2NEw0OU9vaU5JdGdseHY4UjNjcFVEY3VCTDVHOEM1NnBrTFJOZlNw?=
 =?utf-8?Q?HnOj6cyp9Mi6Hy8k=3D?=
X-Exchange-RoutingPolicyChecked: sdzStX4Onu/ba1lUpU5isOijiWGc/vcRjA377Ixg+Tv16vYX+PNVM0aun3DdVEsV8FBeDkY6DYArNIVycvGx7hzSvmi4nx+4UCwv30oUCPITFnvAod9IQtuF+aoOnMmdA6llxq/wzD0gPFU5UJ6JGPbk0At5MLiA0Td7Bxcs5+Ap2HKbQOq0RTc6MAEs7QebBazMelTk5m4KIylM9Ez7vjNJi6WPicP6BmtF44cA8mwfHK9ajRWNWjcmRLQHWOtbcHvgA1SToWifu10ueNGe9TrpzU9A1Srqbi1piL4j9L1ZLJawbKMpSSTiiCDgcHB4RIllx95/jDQWkOJkIJ1IYg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7dbaa7-353b-4bc1-f87c-08deddb07795
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:51:52.5549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCNQwD1iqyidH9GN18MrqZpLtSpJKNzgFwq959kgwm2XVy5EI8CxiOH+fKjErmDzihgjaDlwoEUbqDwgMAPJuRbGogG/OOCEGNWCSpmyTng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4787
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

Hi Vitaly,

On 2026-07-06 at 19:50:15 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Provide igt_platform_filter_is_initialized() helper function to allow
> the IGT core to check if platform filtering has been enabled for the
> current test before attempting automatic filtering.
> 
> This enables the __igt_run_subtest() hook (in next commit) to
> conditionally apply platform filtering only when tests have opted in
> via platform_filter_init().
> 
> Without this check, tests that haven't called platform_filter_init()
> would fail when the framework tries to call igt_platform_should_skip().
> 
> v3 changes:
>  - This is now patch 3/6 (was 4/7 in v2) due to squashing of patches 1+2
>    per Kamil Konieczny's review feedback
>  - No code changes from v2
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I1f8d7c1b76d8a2e3d5f6c4b9e0a7d8e9f0a1b2c3
> ---
>  lib/igt_platform_filter.c | 13 +++++++++++++
>  lib/igt_platform_filter.h |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> index 5e2e7c744..7ebdeb419 100644
> --- a/lib/igt_platform_filter.c
> +++ b/lib/igt_platform_filter.c
> @@ -577,3 +577,16 @@ int igt_platform_filter_dump_to_file(const char *filename)
>  
>  	return 0;
>  }
> +
> +/**
> + * igt_platform_filter_is_initialized:
> + *
> + * Check if platform filtering has been initialized.
> + *
> + * Returns: true if initialized, false otherwise
> + */
> +bool igt_platform_filter_is_initialized(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	return ctx && ctx->initialized;
> +}
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> index d64450489..b4639e610 100644
> --- a/lib/igt_platform_filter.h
> +++ b/lib/igt_platform_filter.h
> @@ -119,4 +119,6 @@ void igt_platform_filter_dump(void);
>  
>  int igt_platform_filter_dump_to_file(const char *filename);
>  
> +bool igt_platform_filter_is_initialized(void);
> +
>  #endif /* IGT_PLATFORM_FILTER_H */
> -- 
> 2.54.0
> 
LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
