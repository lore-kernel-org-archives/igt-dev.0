Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EBAC9832F
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 09:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7910E840;
	Mon, 28 Sep 2026 09:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzHxWCHP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F73710E840
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 09:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790586757; x=1822122757;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/0yzglXRjn1CBEQDIt5wncaiDZfgHvvTTX8VbqHfu1k=;
 b=XzHxWCHPxZS8W5f+Dccu8cpzH7Tgcev+WlIMMPpnNH68V4UN/dkXgcDE
 dIaBciJ3AexFBm8fw4ZWyxmDWFpeYkigCp0zVQfkhHpHO7fjWJ+GPQSdC
 OhNRLztyg7QiEkEtjspP2b42oXDI8KGnYU4nsmpyvoQWm/+ARMDBPdo2O
 sW0j+TsA6Z7dcviUg6xhmt/aUyNzrGoRmmHioMBnxR03ESTCs6HD5JZGf
 LXBWUKQMP617F8rhVnnnO8CIgKoxUMnd8K0D45mhLDTL/k5hy4eVjT15a
 ok8XQKwSyjNxoIgeoxdYzSsCgtPoL49+rDIySIYaNhqfz3ALy0QYM0Nv6 g==;
X-CSE-ConnectionGUID: bWu6fPSrRYexvTao0pFPAw==
X-CSE-MsgGUID: cVl0v7V2RDytuwNMQf7u6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="107658956"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="107658956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:12:36 -0700
X-CSE-ConnectionGUID: lFHF67yDTHi2E+hfGVVAMw==
X-CSE-MsgGUID: Tzkct/ufQBiZvJQR6wFCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="312914185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:12:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:12:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 02:12:35 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 02:12:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn9GztbduXnXV7nElZu1f2MuU7pCxx497TXu4X524WfZpwvtkmUMpIemc6wiT5phEeHbqUPzpTLGhjJf0ssZSHCS/wQYKCtoq42z0bdmtPYIchEwthskybwPEDONeGvilQ850cx2n+lin76+OhFmj6Z0hBV5XqB8aoxL9KufXVe9xMMEWwwERaI0Fuwh/2lcFOpf7hglslQ7fd+uQPnBS1ki5yJqsXQfrU6DAIhuMzfKY8m4QPA+UBi06PzcDA3pQViIPRxWEILTJ90YtEBRsrEQXZN2CTXiQLc7d64id9gVFH7I3RJzWpOUPP20eaS7x7gf/SAVAc1trwTTKvSDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQZ+vR45NyWLnkRnqY8DUHcuN02jQONcv94DYGH9KEs=;
 b=b+VaG3UYbco24KS5JNs5DUsCEdJH/hq8zeKY8KTJzaQ8CAtY7LnuZSlfmQg7lcBUzs1B3OwGMjW6mrLq7qeOCVAywQ5Qn6kwYf+KZMAHN/G14qisT0SPqVvo6ezLnFnch4wObUcjocPta8/PGFPvfXu8jL/eXTwAu9Z1qVM5l9ZjWNHAWDfReREa2lZOAPIAuWK6Nv2EIuUT2zCUoYI3bankFZMySHzMoUDva0pVEq65MmKIaz6zxSPL1po+j4r7+Lv8vSF65mg8Wb6o67vBaLNJBYuAeldlOpeTTdmOrKSshQFm/JsjcNxEI+bWbnGRVAvBTQnhegBzsmPGXxT7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:12:31 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:12:30 +0000
Date: Mon, 28 Sep 2026 09:12:20 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 3/8] tools/gputop/xe_gputop: fix return logic,
 cleanup and div by zero bugs
Message-ID: <h4og7r6izup3fbr7cyfxtizawu6crz4os46a6c4gz7uyl2ylqf@6twvywqon6qm>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <ed0f4ad6da7e29e003e6264fa2737cf088c5b2e8.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ed0f4ad6da7e29e003e6264fa2737cf088c5b2e8.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: VI1PR09CA0120.eurprd09.prod.outlook.com
 (2603:10a6:803:78::43) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6b041a-8858-489b-a208-08df1d409fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|5023799004|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: j4T6i0GC594Wpz+w6H5sBQ8TaRH2MnURozD0pT4HTdegzCE1RSOEnZAppVjFUhDDPAXvu/BQMCPvGjSryLzoU7RH9tvLEOCO+qToL40lxJrB5K6YuuhxUNGexexscxYtMpRidqiggnJVL3WbQqr8fCNDHApAFtrsbPW0AdbefQh0n2f/nhpufPQrMAgmZ4iY8VSFpwbH3rgIsI63L3vaVVLmZ4PvGpf6evsc2LVJ/t1lvH6g1CJv9gcoGNkxvubONgdD+EhzbC0OLpB85E/dghNmaSkOJ90gXpUjXOD50NvDDGBGl8utuTjCCVKABes74bArTGangj9Npxps45ykCFcaJBUquMi09uBYlCfgBCdiYKPsmutehhTNVtvpeX9lk5Tv6rRuZHWejWh/JHeRZpZY9C1/Cubki1ljClrc9Jfju6Lgs7SzmvuMEJ10sCGa2b6CWulSJXcM7MIfJgj295T6uAhlwm2zqwLJRJqJEVsDTX6KvL2TlLoKjvp21fdqRMrohb2PowwzKblaahAprNlEPakZHd9Bud65xjaLVVfbzm+tvf3CysLDzjUyuTHbTrt4K56/MzK3oiayrluAQvbLuYCqmktqzsbRCXcDDGxCpMY6VvsZdWXcb+aOvu0FDC73yae1SSRTlwV9b5QI5H4BxFqKcxpo/RNXTm4ujZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRIYVF1bnhHNWpYUGNndEw2c00veGswa3NYUU00eFpKUlBmN1k1Njh1em5h?=
 =?utf-8?B?N3dpUytWcVpYR3ozNm5pVXB5enFqS0o3dVVzaGd5YTIvU1hSMWJJU0NMTzM0?=
 =?utf-8?B?QnhwT3ZEazBuWk4xNndqVWJ4dUxqNW1OMWZ3WkE5RWhQR1ljOXBZYTRBUHpI?=
 =?utf-8?B?TDR1YmJLNnREL2lHcE9zcTlOK0hUdGR4VGwyNUdwc3Y3eDZxcExIN2tOUHA5?=
 =?utf-8?B?ZGNJeGw1U2RkSXFzMFpiZjlZY285c2xjalNVU3NEOUptWllaa2JGUjVkbEpT?=
 =?utf-8?B?YVdxWXpnRzZlMjI1a1ZDa1BzVnRmdUkrd09FNDN6VlFjVFlya2IxQnNNNDdC?=
 =?utf-8?B?Y0xNQXM5RmRGVkV1K1VGbnM1a3F6V3ZBQWF5aHpPWEhnQnplT2VBRXp6S0Jm?=
 =?utf-8?B?ZjNLZDVIbndtU2x6QVFQNldRdWNCMUszclFWVEFRMTRkM0RONVBYaC9vRGRU?=
 =?utf-8?B?V3pEdXRRb25RdVZleEJwSWpLdnFrdEZHTXMrUTl5aEMyTFJMb1R4RzVNQlhn?=
 =?utf-8?B?Smc1Yk9jeVhpdlRRT1duODREcnZBOEdiNktrQUVELy9XSlU2Q2JxUmltdm8y?=
 =?utf-8?B?YVZSaXlvTFlQMmFYcFBBTlVzOG0wczNBaVYycWp0dll5cWVyb2tYK0h1MlI2?=
 =?utf-8?B?TUY4QUV6b1krKzd1dW5VSWRYY0RweGJwMnZSRWZjcW43OVZQNlVIQ3o3ejBr?=
 =?utf-8?B?MVNzRW10d1IwRmdScEtNdXRjS3I5TXVDY0RHa1ZWY1Rpc1JpMXFjZ2g1cGpH?=
 =?utf-8?B?L2RBY0pkTHRkOE5KQVlNWm9TUWJ3STZ4eG5IakdGeURYNnk5N1BiN0RLbFpy?=
 =?utf-8?B?UUp6ZWhjVnBZR3lZZVZVNnNmMnRha1ZzUmFDcGdXZGxoKzlCNisxakx4QkQ1?=
 =?utf-8?B?ZDFrZ1AzTzN2TGtZMHVwQWZaL1EvekdXYzBCRlp0LzBrSXNKWGcwTTlTWWp5?=
 =?utf-8?B?QkVES2hPV1ZUQVQvdWNKZHZCdzh4MklxVTF3WlAxOVBqVmxIL1c4NW8zVmRt?=
 =?utf-8?B?QkRKZDJsaTBMT0lFQ05CMm01VVFTT0VxREJqUjh4VTdyOGMxY21jZDJkdFNR?=
 =?utf-8?B?alh5MENoSWlEZ2RzdEtzeGduaFBQSmV1OUhzSUtKUkZkeGc4cktVTnFYUTZs?=
 =?utf-8?B?dkVnYldmYjhqUWdsZFZHR0liaXBneGZwSHpyQUo2RGk2eEVYL2hFREVOUUFW?=
 =?utf-8?B?UEJEZFh4WWEyV1dKSkJpU2hveXZsdC81NExISlVoMyt4VCs5S1hQWGFQV1h0?=
 =?utf-8?B?OVpXdVI4dUljbWZRT3dKeWtFSzVwdmtROVdwNHFWWFVyckNsVzFvdHh5WkIz?=
 =?utf-8?B?cFU3STJQekJLNDJKTVg5RHg2OFh1Z2dRWFlKY1hwVzFPNmtmL2NNRjUxeXRm?=
 =?utf-8?B?T3pzWTJ4dEdzRnRqZThKVit4VVQvQi9OazFyQVNnOEhPeHIyN1g4K0d4eVZI?=
 =?utf-8?B?VVN6eml3L0k3ZWJFQ0Q1QlBzRXZHY1Nrd0M3dEVIUks2cVRzQS9DMUZaTFhW?=
 =?utf-8?B?b0hReFpDaCtkMk4vRklNb2lLd1VMQ0JqSWlUK2RvVllVT3d1QjFTalp4VDZm?=
 =?utf-8?B?N2JwTmRiNGFuakpJZGhaSHluZ0hVM243WWFWUnd3MTVsNGhrdE9yNEVZSDEv?=
 =?utf-8?B?RFMvUWtVTU1EcEpVaThYRjNrcVdjUW9jNnNBS08zZEJjU1poUnhFSUVFWnFp?=
 =?utf-8?B?NUVGVUxJdk90VjIzSGY5USttZm9FWlhoOG9YR3BJdm53OU1vMEtTVHJrNk1B?=
 =?utf-8?B?WGdWOGlLVEE5R0dmTWw3R0JaNVNEU1Y1dXY0K0VidGc2UmMwV2ZlSGhPNXBG?=
 =?utf-8?B?d01QMEZyN1NzTXd5emE1VGJ5UWtacHdJQTEyN1FRbmtyNVZBZTJ3cHh2RXVp?=
 =?utf-8?B?Mm94VCtIaHNUbWFwOXBYQXpydnBrdzNpRVZPR2F0elprcDdaak5VVTFFM20r?=
 =?utf-8?B?S3Z6Q2VDdWRwV3Z0czFUQ2s2ZTJjbXQ1aDBpY3o0UXVSNXRFL0c0SXN4K2dw?=
 =?utf-8?B?ekp5QUlNSCtkV3o2UkJ4UW9XSWd0RkdCeERua1MyZVFPR3FYU1dVNTVoZEJP?=
 =?utf-8?B?Vi90eWI3Z3pMSXEwSXlSQUdJUUd3SC9yeVQrdHRkZzJCNngwcEsrbk5GZWpT?=
 =?utf-8?B?N28xSUFJUlBCc1hEeGczZEJDQUVzb1AyaFVseUFpRFh6djRDa0F2WDgxT2cy?=
 =?utf-8?B?ZW12bCtwelJzMG1lWUhjQ3ZrbnpIVVpDNUJpZ0lHNk9qdGRST2dySGFlenpE?=
 =?utf-8?B?ZGI4L1FKanJJTEh3SlJzejZ0YUwwREN5NGRlVVBCL0llNFczQUh2NU1CbEFz?=
 =?utf-8?B?eHVyNi9nWWJvN3M1QWs3RUpHcTVqN1UxOWpzNGdXRC9PQSs5WEUybTNvSTV4?=
 =?utf-8?Q?F7PDwt9LB+DyaosI=3D?=
X-Exchange-RoutingPolicyChecked: YLyEbhwkdlIxD7bzqmHm+mLz4Ky9F1g3V/hbJqhQ4IAoJ0Qg2VsZVAK+JGXLk62w7+U+0hUAN4zMFRA2w/KLe8lNjv9Uq66bL98lu9UHswy0hVRqSP7qnwyGGLzgUALlW83hdsTTR9YGMrmqxrOBnIIHosrLV3dOASpVlo7O6qDmo3RvArcX2vR7TF29vTZlqEIbrVuD6+T3p0m30puWdu3yPC7MVPDJiWmUTeWYUy929iT4BU7nlbjCAnEOLzLWWdz9NCIiLI0oSlMHVVpzEfqMzWHwk17dJp7xCd98TsN+7xOMw6iFce7sypiWKYfl3sbnu7rC91Qaohn4zQvZxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6b041a-8858-489b-a208-08df1d409fa3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:12:30.5676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1YmqNNGO4R9CRQKIsmcw08nr+xuje+j3Mgg7eVA7tTcZ4FVKHAUkzGy3fH8mXGS/fA5BcN8B2Z4yGriOKfA6iOEcst5bgYYWxlYWqxrgoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
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

Hi Sebastian,

just a few nits, include if you'd send another version.

On 2026-09-25 at 12:57:43 +0200, Sebastian Brzezinka wrote:
> xe_populate_engines() used the leftover asprintf() length in 'ret'
> to detect failure, but that value is also positive on success, so real
> errors (bad PMU config, asprintf failure) were silently ignored. Track
> failure with an explicit flag instead.
> 
> xe_clean_up() freed gputop_dev->pmu_device_obj (always device 0) instead
> of gputop_dev[i].pmu_device_obj, corrupting or leaking memory when more
> than one xe device is present.
Since you included how you addressed the first problem, you
could do the same here to be consistent, e.g. "Free the full
range of the array of devices"...
> 
> pmu_active_percentage() divided by pmu_total_ticks without checking
> for zero.
...and here: "Exit early if that would be the case."

> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/xe_gputop.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index f643fe33e..193c9caa2 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -66,7 +66,7 @@ void xe_clean_up(void *obj, int len)
>  			}
>  			if (gputop_dev[i].pmu_device_obj->device)
>  				free(gputop_dev[i].pmu_device_obj->device);
> -			free(gputop_dev->pmu_device_obj);
> +			free(gputop_dev[i].pmu_device_obj);
>  		}
>  	}
>  }
> @@ -133,6 +133,7 @@ void *xe_populate_engines(const void *obj, int index)
>  	char device[30];
>  	int ret = 0;
>  	int card_fd;
> +	bool failed = false;
>  
>  	if (!card || !strlen(card->card) || !strlen(card->render))
>  		return NULL;
> @@ -182,6 +183,7 @@ void *xe_populate_engines(const void *obj, int index)
>  		if (engine->engine_active_ticks.config == -1 ||
>  		    engine->engine_total_ticks.config == -1) {
>  			ret = ENOENT;
> +			failed = true;
>  			break;
>  		}
>  
> @@ -192,14 +194,15 @@ void *xe_populate_engines(const void *obj, int index)
>  
>  		if (ret <= 0) {
>  			ret = errno;
> +			failed = true;
>  			break;
>  		}
>  
>  		engines->num_engines++;
>  	}
>  
> -	if (!ret) {
> -		errno = ret;
> +	if (failed || !engines->num_engines) {
> +		errno = failed ? ret : ENODEV;
>  		return NULL;
>  	}
>  
> @@ -299,6 +302,9 @@ static double pmu_active_percentage(struct xe_engine *engine)
>  				 engine->engine_total_ticks.val.prev;
>  	double percentage;
>  
> +	if (!pmu_total_ticks)
> +		return 0.0;
> +
>  	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
>  
>  	return CLAMP(percentage, 0., 100.);
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
