Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607ABFF886D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 17:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BFF10E336;
	Tue, 28 Apr 2026 17:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fc6aqEk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2B010E336
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777397858; x=1808933858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cu9XvEd5GezwjxbSmJGuzznQa3IfqQNv8/lbO9H6sVs=;
 b=fc6aqEk0Y+E2YX0s4oMN507oIKDuoMPJYz3dpyVuoDRrnxDCl9M6GuHt
 B9RCIAJTfgsIj0UFlkothqrVYIVp7ol3WcFNctB7nFYvMSyoQ47Sgdfs1
 83Nih5nLsRYuy+xScQa1qu9cweBpF21kKjc9U1HKKKwKf+S40Js/9mv9T
 dQclbS7tbppkhVbTFgz+T4LNHifgRpnrWuPk1lJfYMajUcaBjXa2tesV0
 KChVULp6dzUk2497+AI5CAtea13RXxujaw9fE3hBdS2W1OdT2gTVMuX9W
 28RnHIQTsE4Or5oJV69lvtnsD3p1uvLASTD+5DVfpMpTTZXT9wka0WI6B w==;
X-CSE-ConnectionGUID: 2WY5nFZMRYK9FtTlGNT3xA==
X-CSE-MsgGUID: TpFXlSywQYyA3+ybqYpErg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78021849"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78021849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 10:37:37 -0700
X-CSE-ConnectionGUID: IfqTxXv3R7quld0RH6ueag==
X-CSE-MsgGUID: SZ3AiWW2Tq+Vy3sno91iKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="264402824"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 10:37:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 10:37:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 10:37:36 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 10:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDoQ8glI4DgWl92SvxK5fkxQwVv7VhVuWjOfS1/wkcHPzrGewIspcrCWUv0WzOEzarKwF/pr6PUfExPxaqLfwKBe/JeEeiI42Mh4Y9NcvjnfoGmNSone71QbZahK7weAmqWMwUvhN1jtC2KNvOJ9RmUFcTy+DmOUkR2dZe2Dyw5kVRyN7UaD0fwGY4AU1pyHYQrWtSy8Be+80JbX6TQBjfy3mkT/rL2wGp0Y+Cs+eafWFHJxqWDxnJnHYm+0PLmz/v35SAMLvBt+xjUB/rVzJbf4qX1OP5f101V3MZGuLqbLEwDpjOwQu9N8rI5bYC91/v/92BwOEEPPAah+1yRtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrFlj3NW4ouNjGE+YT7rFNPi6ahv6rJ1xYszNUZcjAc=;
 b=iHs0tj9NPK7Ts71TwOj5jmYMFW6Biw4LA4XVy9xDaBWQCS76cryDsN3itI3aOFzmaf1Hw7hromM1EFQMR8vTDnvLNAP5f87exdO3LabrBKUtOYd1sxrFWBSAc3eOhkhac5X5FKrptFoTXJHP72htnai6lXemFhvn++d48InCYMneoQ01xkXi393PudhjtOz8iBqmu6GOkK/j+JWtjZXhWetwi21yG7hGnVQKVTVX++uV2E4giYWItzYk3YWa5E2R6SBqpqa+0SIMdDH68tQsXvaOCf8yJGyCFd9fUIqCkd0IOe9WhT9fDDaLPU6862aFfnfwT3pgz0je4wI731Qn3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7460.namprd11.prod.outlook.com (2603:10b6:8:142::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 17:37:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 17:37:32 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <shekhar.chauhan@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] tests/intel/xe_oa: Wa_14026633728
In-Reply-To: <20260427050002.3391994-1-shekhar.chauhan@intel.com>
References: <20260427050002.3391994-1-shekhar.chauhan@intel.com>
Date: Tue, 28 Apr 2026 14:37:28 -0300
Message-ID: <877bproujr.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:a03:54::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: f1350e92-e1f6-481e-3c7d-08dea54cd404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: rm04cPUqaf+Jy926zZk7spZqjdk2jVyDU6YjGdjXKw9JiW+aawGwRHT2U/ZI4mHvHby69YRieLmpZhxNQ8ZkGJEb8+Z1OFbzHnwU6kSspdrJJrB3TR4Fv+zNkFzkM/Sol0LkRSk0mGvcYcTFLgvdqMZXRmQspPTcdnUr+r1OzuCGoMKFlxqtTKDq3y4UQgFmI+GO3TM9A/wKTxYLwYV8EuRy8eu3ZB3DubObni+qUvnst6VkQbOnoBqEHEli4WXwuAuQns8BvERloUegiluaWbipM6PKQTvXhFzIqEH5X2fSkuB9lBYqGkhlpW0ACZUDg8q8V8+ywmYKPF+PZROxyJUPJgVz/4supNSfdyVd2OXlnrRwCEWVG/5QqOwkl6Djp9CQOv0cTQ3IYeAKtHeIjnJ+edbQ8DR22C0Tcln66QNcEl2ntuCrx6AF2diuACmPRyQ3zjvEg7jwq5LB7L7/RIWG5sWRG458vwKpIKK814tQEW4SXnT1SrO23/vc02Zs+1p7wWLNfN9QPDwFX1N1omT3C1pD1ewZl0NUFfgsfbsYFsTgkAhIlFIx7LXObMQqm7hqhKb1mQtjs2fx9ozU7Aqn63S5JThLjTkx67rar6B3AGuWOuSCLEf0uOQTqq8l7i2KgKr2iLv0pXqXIn32q2IAOB/C6irdKlBtu57ZUVWK3G5hgdqpmlvKwHBVFGaVTuSkHwIR02Ju2nX5UhccenHoIivJ0NcO/M28KiLkq3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7aYrojFceQScrVyC8RzGnylxAZRwHRE28ESUZyA6EuHwVQZLuNMjjaYYfZif?=
 =?us-ascii?Q?nvPEE4EeF6eWyAbAvoPdmp6GOfZg0JalcrY9l5KJuIRhkiDQOm8tEPM7E1z2?=
 =?us-ascii?Q?+F+RLeppZKGzuun09oQ7sJjERifqQD/DX1y3NIUvpj5gvz/9xU/ahZ6J+oEq?=
 =?us-ascii?Q?4kPeZ+OslmXdcKUEgeRQahJdTtmJp179s5k94pgjl5a644BQy6af2aHJ1j2o?=
 =?us-ascii?Q?bNpJYh+pxElhF8kkTY+XQUAt+Ed6loj75k0dWSbC6CRG7ZTUDhY0lDzEk58X?=
 =?us-ascii?Q?yK+I5js5A5OUgJVGWTfO1lw/FajoTVZKevb8xMdZKUJMOqD20qTk2uPuaz89?=
 =?us-ascii?Q?5BtSDP0idQVS9w/z9wdG0lh0Yl9reI+geyFZo/Z7tMcvqegye+YPLGEbBiVf?=
 =?us-ascii?Q?OMDTS0DhbgNd0LD/cCSJd6EfGjKvGjUaY76lnQw0lWV3Hr+X0fapP3+HG4Qf?=
 =?us-ascii?Q?9eWpzCwS2IuJyZBnkik+GTlSqXw+31bkb8vKNPxkGtoJEvUOavITZeqWu2PC?=
 =?us-ascii?Q?ntgNfy4Du5g1T5AtQBdDtW+BxnfchjqmX4rgEa8AxJMxfVTgzRlfyaYSLgQV?=
 =?us-ascii?Q?FK7YOkgv4Rr3vSDfaS7L3PwwAdT+zp9bKkl8WNm1pHYjA1PHMIpAmCyhdDwb?=
 =?us-ascii?Q?upD3s+CRCS7VV20zEB5RkrjL4tdVEqrjJMFhJj3+A2/HtXcFBWsnJvQut8S1?=
 =?us-ascii?Q?IP3j9+FTusuGCRH8XxFFQIFDG/wEb7pNiM4D/en0+qyWqcp+7CN1atkgYnTi?=
 =?us-ascii?Q?DQq+Op/jOinOxjBNEf8ITykV4dYXSgghr98/kcB2L3rggIunXuNd/bjs9NK0?=
 =?us-ascii?Q?oV1EP/1CMX1FGbPJhoFcRJKGrmDgfN9ZS/VAkqVIhJ2K2qQaRqQ/+VjKk1uq?=
 =?us-ascii?Q?YlB/3Cesix6c9jMekh/rLqfhYH5oxO9XCza/0LrdSAGfAXgK2bRFYbZLVF9C?=
 =?us-ascii?Q?+SdwehNHJq9t2HJNMZYIufRQErJ92/S66JTw9lWm3zFY1R3pvI/twzzP8cRO?=
 =?us-ascii?Q?7Z7yyQLJdjCemm0crP2MlX9jIjgKYf4F1hhHmQ0E3pUuXRasXW5eHhewZpMp?=
 =?us-ascii?Q?zHdDNGbLphVs7zuRXuHrw0Xi3iYqurl+YDWHYGDsd5DJL8Bb4XM58PeiViDb?=
 =?us-ascii?Q?mGSEhdCMgyOP+TllSA8wXjZF0wGfZ2/rvZGOyc4qSjWJDUMgzxN8vKDBi7ev?=
 =?us-ascii?Q?klC3N7Mp8zE2MN4i7O8j5KKx/4JIMgpXma5tnymItk9xSakDSirYCiQgJyiP?=
 =?us-ascii?Q?7zqFKnaW3U2Gj6/YN9Qm7dXbkPgYyy5+AJavbXShakmOKhNc410bH8L7qFmN?=
 =?us-ascii?Q?Siw0+Dj0wuUqLxYdcwbLDUkdV/xWx1H1qDDgz1q3Qed2FSvaTgP/BdIoPH2L?=
 =?us-ascii?Q?l4uWqnrJmITWmZjJa/mc75quImleJFzKTvFWxGWkMQppmc2MyYT25XyiyTX1?=
 =?us-ascii?Q?JDw4vvbog3k9J48AcHBe90lvFutqNwgEDcLQgDTAyBglWpgS/gcFzIVH0vrs?=
 =?us-ascii?Q?D9tvdW7ke9MVgWvZzN3AeatFOmibjAoZplb3pXTIa+pzhXPMOk9Jh3hDxfY2?=
 =?us-ascii?Q?unqd/xvxpEroh/qh1eJB2kpYRUzJ+GdtqktK+PtYvnqis7zo+9IHYKGIsGuS?=
 =?us-ascii?Q?B9hRf3E1GgYgwKkmOeTLwqwlb7muCxPRJrzUUAKIxt+3HfPq8VzQJ/tH3Npx?=
 =?us-ascii?Q?7u8qMbqTcmE0oJCAgbtryzM/RuV4AR5NoWDJm7TMH3u11Zo3t/6fpq+/hb0i?=
 =?us-ascii?Q?D5UGsupZzA=3D=3D?=
X-Exchange-RoutingPolicyChecked: X8PKK+9Bn7dXjsM4scY1DZPFaURDgwJ1RAMFoYkWb5QCNA0lfNu3JH4Ab25GctM4tVSIcT3jqPPnSiJvOTpG47EbQ9FNWIIPryTT+HrHqvgZpZFZU7lNu3uufkhibuUVK1yOHxSzWJGWc/fHQHwUEnlThNZYcrC4SdXt/+X8i4nEmwuiGFw+M7HZa8o6rN6l2y0/CjmhTKKFwILrcJNy5Yvq8SJqZkT0NPngGVZV3W893l2DlcSioSLD5Y6oMALJHj04mbAXQVTFFv4jxHZ0w6ItXzcg7fQMoJ7pNwPYKX7xSM6iWHzXnTg8LEiYQ7P5XeTcBEiiLaSY6OggY5Pa4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1350e92-e1f6-481e-3c7d-08dea54cd404
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 17:37:32.7526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr8C7T6q886Pccd2TVclqw51Okw7ArxxAr3SAby5mLqU2YC47NQt7PrT8M+KsXJojYI82B6/Ob0y4ytPgfDDYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7460
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

Shekhar Chauhan <shekhar.chauhan@intel.com> writes:

> For MERTOA in CRI, oa buffer can be in device memory. Because of slower
> device mem access, OA exponent values lower than 8 can result in buffer
> overflows. Bump the OA exponent value.
>
> v2: Fix commit title, description and code description.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  tests/intel/xe_oa.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 988c46df6..cbc1e0d3e 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -2645,6 +2645,16 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>  {
>  	/* ~20 micro second period */
>  	int oa_exponent = max_oa_exponent_for_period_lte(20000);
> +
> +	/*
> +	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
> +	 * Because of slower device mem access, OA exponent values lower than 8 can
> +	 * result in buffer overflows.
> +	 */
> +
> +	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT && IS_CRESCENTISLAND(devid))
> +		oa_exponent = max(oa_exponent, 8);

We have a way of querying for workarounds via debugfs (intel_wa.h). It
is probably better to use that interface instead of replicating
workaround checks in IGT.

It currently only checks for GT workarounds, but can be easily extended
to also check for device workarounds.

--
Gustavo Sousa

> +
>  	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
>  	uint64_t fmt = test_set->perf_oa_format;
>  	size_t report_size = get_oa_format(fmt).size;
> -- 
> 2.53.0
