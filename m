Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D16C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 11:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F366C10F532;
	Thu,  9 Jul 2026 11:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3bWkCnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C0610E6BA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783597865; x=1815133865;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8JbWkSNs614XCJnS/qzG8n88+GDelNNwy4Ma6yawuF4=;
 b=D3bWkCnBXpUFmK6D4BnLIF5mrpDlet6ZLpWFllLriY7KN4iPIdTSsVnn
 mBM6pWmWQen2KanrMLoGED/2wQyF+Hwg2HN1e2tmWPY3ol9nnm7YmTC7Q
 kN4B76vSgr7/g7bUI0q8bzYqowmudCAlFb4ZK1WKAa97szx2xcjhh2QHm
 o10CnG69/yNx9jO3NiqMnK6gz4AK31bw2PbnpThM0JoWJxy1wMfqXb+wm
 iifJTCcBWAtUHCBg3PdJB1AELjNXgvWWhjOghqrpbl3GgBztoLObZ5Q4n
 hxo68By0h8u1DUTmU50Z9XbpRifBFK8jEMub1eYVBHWoKQiSGJq4Edcib g==;
X-CSE-ConnectionGUID: g2jsotRwTVW/TWMy8lan4A==
X-CSE-MsgGUID: RNilr/fTRoOYzBdd7fIbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94882052"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="94882052"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 04:51:05 -0700
X-CSE-ConnectionGUID: BcQ9pJ31RMStxfEm3rLBhQ==
X-CSE-MsgGUID: zq+jzaxASnCMNBKFef2NsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="258430971"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 04:51:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 04:51:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 04:51:04 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 04:51:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO4cFCXcd4C61Rn+QAzU8aE7aUE/V7O+3QoqDnS9OF4gMKqsujh4euqu8/dHsyqn7WE+nqL4MxtSD8w1WLvTB4nAsV30ZpYMaZIxcNKKG0/OhQbIIEYLuUSSUpN2472vLJZMf26P631WTg1IaenWiJ3D78ab74V9vxrB0YFcwEkWNpvufwPyzBCcCFlVlK4SQi9GwHHungZbL4nvBDWizwI8dx2ZM8QD0yjlYqiEgp2vLQsHlc1IlTihz9AcebzLq+E8jRJswOVjdYD7K9MLK6jKKp9Clk8D1MmgAKFRPm+AdHsZM71g23RTaCSv5vTwc+rwqbngjlcPd0DnneTfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVMNVcqQD48JJCk2eNUZnwsVvKI10dm5hfPd+mOp/1I=;
 b=tXeXzna7r0lDmZMcHsUS4F5H3+ZhJbNIlHNSdk+2WjjLdqGfm9U5y8lX4ISo8cE9E/YggAoSj50+ODnkwKQhQUnN7CboUtW+xaGotaW52OrFQwlqvl9mULxMXKhQfqIob6MNxoVDivWksJFy80lBDrQPGG+223+Gk25exrIOVjcWSjN5EtQCCm6DVMmpIXgCCURNyCxYFjjGDScp3IBh76IR8Ru/y7TfKSiKf/Gtrs7bfzQHTUlg6np3dU654pOlazKFl+ZE6F84VyRNKBABEIphGznernNpMN2Y1JL7mJ6+7AAQXwOGCeGR5o+Vy7Zlz1/Lux7GIHZEgVUO5NQ8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 11:50:57 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 11:50:56 +0000
Date: Thu, 9 Jul 2026 11:50:45 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 4/6] lib/igt_core: Enable automatic platform filtering in
 subtest execution
Message-ID: <qzva4lxonskphbnvdkqqkdamfei2bfrlshfl3et4xd7au3ndcn@diwefepq7iwe>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
 <20260706235130.157557-4-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706235130.157557-4-vitaly.prosyak@amd.com>
X-ClientProxiedBy: DU2PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::14) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CO1PR11MB4787:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c768c1-d449-4ba3-281d-08deddb055e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: znp6ex1BlJmAajQ8EjqW+ytGo8Qc/+d6ie3dESNLzuZcs7qbNFfaKmQeZYcvDZhez3+FzRUJsqqcEhNQlY73AzkobwEN5hzO9mGB4U52bcPdcjZPzWIGPDu0R4agzqXX54ERliMD+Ff3wVHNTuoTeAJsDjU9aj6FFsVAXe4k43Iq679ZGqOzAwi+IUxUsVrcu8hFZRAsKmLSmdZWL1cDceeQ1WxSXqr97Iz61N3qkG9DeRwbCmcjJT1u/nPLUwZbOqfQfaFzEokyTkiF3kM3+fzTYs1VC+xe8jPvQ3vCnc1ca5AusagDpyz41j87t3QC4wUbFeO0zsDoRjrle6q4kChS6aVT9AS2F7mnOq94cSOe1h2H5OO2JC+CY2v2EFnULeNr5AJzhdpfIxJKheyi7lQ4k/o7MQT/cdCrDOm4gV6+lPHbr5bGyRwMKUSDkn5wIh5jXvqLr6HYM/soXa1vf2wob9h4y2siqYEs5gw3ejaFhzQ3X3TDCd700xPvkBMlSTzR0QzQiXiMwiDJjQhF/UKHlZ6TYWQs8q62WC1og862Qm6HZmElO9OmWKllUbTreoFsUdfDxMJiI7VTVhMtOBDLhkifu+Lh6ZCeeNeEg7/FHINvBuP5qIrBHcqFqsRqLOWGB6Vk3zMpS/8XRTLWOGypPVSul9vUydZU9DtzbB4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXdBdmE5Wk5vdWkyeGxYakxOV2lPUUY0TDJvMFMvdEFZY29XWFNLbEhIcGRE?=
 =?utf-8?B?cGNQZkpvSldXN2M4aWVwU0pmWWNHR2N5dFFCbjZjUG1ZaUphYTUzSVc5ekIx?=
 =?utf-8?B?RzA0eE5hem9rVEtOZlBJUkF0ZXFoRkIyeGkzT0lhWDdoNUhFVVRHNHJ1U3k3?=
 =?utf-8?B?T1ZjRmhEM3lpZ241TTZDdnA1RVh0cVk0N0ExdHEvOGdBVDRsYWp2clJQaUMr?=
 =?utf-8?B?V3dxcVA1bEMwdFNFQWZUdTF3cFh2WkhEdmJwaWpTSGsyb2s0WDBHcHpQam5q?=
 =?utf-8?B?Uk9CM1JOQ3lqNzJTb2tPSXd4a1hUVW9rc3ZJL1drbVB1WGxBZGZNVEdvMnlk?=
 =?utf-8?B?MFcrUjA4WXg2UUVJS2kxTzVCdHVIN1BqOGhMV0lVNmlLeDBjbzZlRHV4NlRC?=
 =?utf-8?B?d1dyTEpvelp2eC80Z2JFajdra2dLZmNlbVVqLzlJYXpwVnhNeThlWGFvN1pL?=
 =?utf-8?B?Nk9KaUs5enQ5UnZoYlMvTUdTeU9FSHcxNUdhanRKVzFOK3Z3QnpQZ3QwTXky?=
 =?utf-8?B?QStmWnozWFg3b3d0ak8wVm1GWHlaeEZPK2FneE5iRXlVK002NDhXQmFTUDFE?=
 =?utf-8?B?VU1VV2huT213K0g3YlFsRklyZDZ1bzNhTFNzWTZQbFZvRitVSVhIRnRDZURP?=
 =?utf-8?B?MDBEaHVkTkxNQk5YbjJVYWF5UlRpc2I3QjRXczZ4YkJqbERnMnVuZlR0a1ZK?=
 =?utf-8?B?RUlaWFAyb2dJd3ZxZ3RxeVE1OFdTUWxFVnVvQ1dWY2xyRmNOQkRlQzVYdnJV?=
 =?utf-8?B?U2VzaHpUbFMzTHR3TXk2NUZtVHVwS01UV25PVGs0U0lkQjZOOXlBNUhjN1ov?=
 =?utf-8?B?Tnh3bTFZTGJFTGxDZy9jeUNiaDJHZHJ5bTlMRjVVUFVaWXhXWngxMjZJaUJS?=
 =?utf-8?B?a2tQQWQ0ajFld25oc1kwbHdNNEU3TGVQR21RNS9CWFdBUk9GWWRYaVA3blRT?=
 =?utf-8?B?RElEcCtkb1ovUWlZOVRMbCtycEVCVDJkcEQwK3BKcXRLa2JyTk51cTBtc0pj?=
 =?utf-8?B?TFNmL1pxTG50OUlETkNRQjhrTVAwYzBqbTcrdjhDM1JLY1ZXdWNubGtseFY2?=
 =?utf-8?B?WENmTVBhb0UvaXJwVVI5b29zWEVGd1FsbFRMeEs5SFdYTmlDR3lUMGpTcTdk?=
 =?utf-8?B?N0k3M3hkVW1KenNSNXVwU0tSNDcyV2ZHL1JhcDBRZkQ0RXRwWGRCN0J6NVV5?=
 =?utf-8?B?OVNjb2tsaFJSRm8xT2xIVzBGQ1R2NWVOUEd2cEhSMkUxS0haRS8yekl2NkV4?=
 =?utf-8?B?eHpiWTdaSC9wZG5heHJEdXhDSVoySnZtblVFR0puQ2todTlKNHlHcGJ1RmVN?=
 =?utf-8?B?MU1xbTRLSlo5TkpsditWRElwZ1RMZnlobWJoZlRwMGo0aHFZYkNablR3Znhv?=
 =?utf-8?B?VDRxRTdDY0RCKzNMNUplSGFTZG1yL05aaWdISi9XTW1tUU9LZFY4allMOHdX?=
 =?utf-8?B?SGY0MjJXblpFUGNVK2F5OTdYdmlzaHpWRzJEUTdwRXZjcFBrM3ZzT0tQaVpD?=
 =?utf-8?B?K3ErOFZPNHVScnlBV1JQY1FDTXZlVXNSMzAzN25hNEN5ekdnd0t3Y0x4Z04x?=
 =?utf-8?B?b01RcUFzWTZzL2ZDNnhuVGJ4UXhFQjNHTVhjMjYyQlRxUTYrRUUrbTExcW5P?=
 =?utf-8?B?dnVvbzhEY1NHcGJkTjlZeUpROUNCK09GQTQzZm9uTGFCSnlGVTZxK3J5dUFE?=
 =?utf-8?B?OGpaSTlFUis2bk81VjZnamlnS1o2amVJSWg1Z0VlVjNDNmRSOUhCaWhMUnNR?=
 =?utf-8?B?TzdpdWMrK1B0aTV5eHVHbklCcHVIajN6ZXFJcCsreVlkRjFGVXdlOUIzemMz?=
 =?utf-8?B?STg3ZlYxRTZ0Rmg4ckJBRUIxd1RyU1dUMjFnT1BteXgxUDNJOTdScVE5L1pL?=
 =?utf-8?B?cUJ3TWZhZnd6dHhrcGlwZUU1K0FCa0ZJSk5sVzNuQjJBREtMNkRMUlF2SlIy?=
 =?utf-8?B?U0ZsVDBibHU3b2thYU9UMTJzMkF1MkRGWThDaE5XblhROTZINzVJSGtEQ0s4?=
 =?utf-8?B?Q2pEdWJFT1ZDMFJSZkZZMk9halZmdzVIc0VZTlFPMkRmUHBNMFF5VDZpVEhw?=
 =?utf-8?B?cUgwUHk0SG9hTEV2d0xsa0swc2tyS3ZaT0hkRzRrUVN5a2FNRklmRGRWM1Qx?=
 =?utf-8?B?YmFKelI4WkRmUnVOM3JKTXNQK0hGTCsxTCtXcVFCSHM4YTZ1bEpaU1VxYkx4?=
 =?utf-8?B?RFhUQllSMnpCOFNSVVJoZUhoaFZEd09hUHVOaXFrNllabnFKMytkTVBWK042?=
 =?utf-8?B?N0ozc0pISEg5clpGZXhleG5WMmhVRlZyUExWK3NlckQrenRsRVRuWThvSm1M?=
 =?utf-8?B?QXljTWh4NUd3cVp2WWhqNHl6ejltTkM0WTFDc2VKcmhMZ3BCV2pRbEtJbEVB?=
 =?utf-8?Q?8e7Vn414XfNoieiU=3D?=
X-Exchange-RoutingPolicyChecked: YGxiHhMafPnLwmZmK8s52WmzycYWx2bPQ8Txrqcqf6coGU1jm7PZjfv1HpIKgTwMxjQOplnLNA0LDt3jCWuBuRKurLomrvelZJ2baolU4X//41lhVMlzPbKnsbnkD2bq+brgUu2mwZ+PDi2SgT3tt0iknTkaLVhziQ8+2iRdhqDVMDDOf+QLFD1VFPq5X51PFRMLGEPGO874wT1e7TxHp/5fpOkFxc8QE5rFEcFuSWRt24pV5GhKHSu8bZn780U4WW2ganmdNkUDllGiOPy51wKPP6VrDnHMalTL1SSw/sUgl49RJ7Ofe0z0M4bKJCcGZunhVmNzWRqoeK8B4PZJ0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c768c1-d449-4ba3-281d-08deddb055e8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 11:50:56.5464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io0fErIYrLCuwvqoBDCGmqqYzcHIQEIYYQVLVBZkKU0pGvYI6rzvB+GQG5iSvr9nU9gQymaIkWkt4TAJclo62kjiWI6uThLjgUA7HDfrDS4=
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

On 2026-07-06 at 19:50:16 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Hook platform filtering into __igt_run_subtest() so tests automatically
> skip subtests based on platform rules without requiring manual
> igt_platform_require() calls in each subtest.
> 
> This means tests only need to call platform_filter_init() once in their
> igt_fixture, and all subtests are automatically checked against the
> platform filtering rules before execution.
> 
> Example test code:
>   igt_fixture {
>       amd_platform_filter_init(&gpu_info);
>   }
> 
>   igt_subtest(my-test) {
>       // Automatic skip if platform rules match - no manual call needed!
>       test_code();
>   }
> 
> v3 changes:
>  - This is now patch 4/6 (was 5/7 in v2) due to squashing of patches 1+2
>    per Kamil Konieczny's review feedback
>  - No code changes from v2
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: I2a3b4c5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t
> ---
>  lib/igt_core.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index a7c097d9e..d2a6d79f5 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -80,6 +80,7 @@
>  #include "igt_rc.h"
>  #include "igt_list.h"
>  #include "igt_map.h"
> +#include "igt_platform_filter.h"
>  #include "igt_device_scan.h"
>  #include "igt_thread.h"
>  #include "igt_vec.h"
> @@ -1580,6 +1581,23 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>  		return false;
>  	}
>  
> +
Extra newline.
Apart from that:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

> +	/* Automatic platform filtering - if initialized, check if subtest should be skipped */
> +	if (igt_platform_filter_is_initialized()) {
> +		enum skip_source source;
> +		const char *reason;
> +
> +		if (igt_platform_should_skip(igt_test_name(), subtest_name,
> +					      &source, &reason)) {
> +			_subtest_result_message(_SUBTEST_TYPE_NORMAL, subtest_name,
> +						"SKIP", 0.0);
> +			igt_info("Platform filtering (%s): %s\n",
> +				 source == SKIP_SOURCE_BUILTIN ? "built-in" :
> +				 source == SKIP_SOURCE_CONFIG ? "config" : "env",
> +				 reason);
> +			return false;
> +		}
> +	}
>  	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
>  		 command_str, subtest_name);
>  	igt_trace("%s: starting subtest %s\n", command_str, subtest_name);
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
