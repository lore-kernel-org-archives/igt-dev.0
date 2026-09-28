Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F21CA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 11:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B806C10E0AA;
	Mon, 28 Sep 2026 11:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QatN8BzK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B8F10E0AA
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790593314; x=1822129314;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Dd0jTt0YGMeucdVgOw4Ltq/rAcFMq99g8kURTO7JZTk=;
 b=QatN8BzKqpIycHJTyZqEsijjA42FDO8eSzcqRk31bboFw2pNX/h4kExd
 GKj5wZj7GHV6n9lsSFK3L9K6j0SsbdolOPGcLB7ZmJXN1qh10Nw25vRwJ
 /spkyNepl7O1x1p0OR48mLM06Cye1X3qyd2AdrtxG5+XqwBkXkaatXbS7
 /TqpiPf1V7s0V1grPYIFD2KmhEt8LVCBQt9qHCEs5KNlMtCMVxpHQmqRu
 BLKWJE7ikZjElXKzVjKd+UFcsJGJwdQOFJ9HRa6opbNSJE2QJbyLC+AMa
 snI31xO2D0vJJ1+j8uI0RF1/4BCm8LvFFA/xOCfOVZkdak1FoENc0QKe6 w==;
X-CSE-ConnectionGUID: 8pmbKsS0T1yZ4EXadNWnGA==
X-CSE-MsgGUID: JQglr4V4QJmZ/Uc11zQ7+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="93778315"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="93778315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 04:01:53 -0700
X-CSE-ConnectionGUID: hwP26HykSse/at+aQy8DMA==
X-CSE-MsgGUID: 8O0kDfBRRUGdwN/9jnG/ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="279751275"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 04:01:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 04:01:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 04:01:52 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 04:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lptJAwd4ygOLS8UfJDcF3a7MdGQ8X1nVGNaqhOJhrmZo7gco3zWwrEwLNnMbfkeFW6bjXXoNWpeRo3qqYVj2XvRUiAOg73yxd3xDdQyfueLx7y9tCRt2Wif0FmSZ68VF5vDSrLlrJAi/PTVACVFb6V9X+LYAFtUkOpLWfxDr7/PWom2sNcnEldGEXu90inK1AjweJwtRN1G3i/kzfhWXMG/NQVQ8UMM14tzfolhbmgN3VuiBRLyYETnnMvvcRO5PHa13uwVOc6WSmcOZ7zf0qaEUZMLvAdeIMPdfjYTMXytHgVn9+L/xg04inHb7Ru4AUB2H5OIJt1IZ0X4cV2oJWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLIOSWYuK5vhUGdZ/s6hU2zkH5vH80vNE0yzVycuK7M=;
 b=KbsNLPrO89l8RZmyDyEXwVfsXfngJqcC3/2hECDFa/0qT6Yh6xL4YWDgZNB+8v4ngefvggk9Mzfk+cmgboaPxkG4xRFS5QS5JrwDpzx8OLUau+1CnnLeO3J9lBUWLL/btT/puWGU1QYtyk6n9ilH20yyXk6c2aU81EP2CcZpA+XyJlHRYDwEiMvh+K2bumJ2VNyjvvJ2HOxiEm0EF0y1sxf4UayXbY7VgT5AhpDYXQG5fzQ3U6h4S4oTGYyKyIiekAdeC3pe70vGAxjsxhPJSd8XMb7uEqt7oAjwc00u0s2IYuAfHzp68WyXPug6JDrlPs+soXOyw2SKXh7RXxqzTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS4PR11MB570107.namprd11.prod.outlook.com (2603:10b6:8:4f0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:01:50 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:01:50 +0000
Date: Mon, 28 Sep 2026 11:01:39 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 4/8] tools/gputop/i915_gputop: add i915 PMU engine
 monitoring
Message-ID: <2wlmpoiinqrdba6skfdwswlvce7fh64zawqfb4cx7kp7dfjjfp@mrocbsbiys5e>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84e6c1f62a64cd5f6a9ebe549ce32b123d623f42.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS4PR11MB570107:EE_
X-MS-Office365-Filtering-Correlation-Id: 978bc3c2-69c6-4dd0-3e65-08df1d4fe59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|5023799004|11063799006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: Z/7Ownkd51zEioatCBydyBA42iQ2N/t1lCGqZzL3Cpp2fauEbfpUes1qYOEFcLVkbNwb+NeNn/+UAE/pHzgrU8LhhgYMIbN4bJ+ol0wPxcJdxF3mqmZtAAD9gcAYG7QaNssqf5EeovijPbO9TETbgVJ3uzhVpF53vR9ABCsA4Xw/m+PrS672/bNTFl01tyqjP2+Stibf6jXyrEpNsH8AOxzKyQ3w4druWTr/AeDfSbwJL4d4y8z3VHFuzxrThpqi8RbS33AefFRq5lfxVTW5OWbrYXsATUFfB8kYOMymwvtX0UyRAAZLccUm4E3Lih6qz9suFl4G618sWXQw5kO9HRx2oek9c2a+dnB2q2d6dzKYhbRHJb/yhBdYVIO3ZhITbJuxS9e0L3jT+NCZTMA+4hNJCETAuUhUm2qJkwyXeh1Tlqq5doV8G0CfA1ypVoeZazzT+gGT2dTUaGDsaj/O9YP32iCb1TF5UzZa/VHA23lSjlRI9yr2T6ZK0Tn3kosFn+nQTsZwFwKchQON2m99ebx3b6NOE3R+i7ToeLqL7x8NUMrI0PZaa2lb+pNpZdTmmJZsOJ2UndIoOFct2T6fVwl2xt4wPnTkqdUVhC1LOFC0E33s5e2OR4WILzSARlCONdsDEix5sDQu7rUzSuVN/anv3U7f2Ftg20MqVCQLm0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERndGd3S0VxSkh1VWxDR2NNTHA3TnpZTFY4NmdPNHBhZWNpOTQ2YUlBbFNH?=
 =?utf-8?B?eUhEV3VzZ1AzYXF5Tm52M0Z6bXBIemRrRXY3Rk40MjdWTSs1VWEvOS9MNnB1?=
 =?utf-8?B?dnR3NXlNN1daMTNGb21sdGVadkU1YWx3dUs1OHdQd2hobXpaUzJHSGt4aE1T?=
 =?utf-8?B?eEh1b0djbU9hKzdpMTZjMzlKc1l2S3JibGhVNmVRbEZ6Y29LUGo5djBaVVVu?=
 =?utf-8?B?M1JQems0eXk2aTIxdTFia0JZbEZmZ2xWK0lRWFM2dURVdHc0eW5sY3dTMUNv?=
 =?utf-8?B?dkFwN3o3S2hlRnlqWEF4VmtMU1Q4Zm8ya2lyaGRWWURibVVDS01xcUpLSGJN?=
 =?utf-8?B?cVdFMFJTS0NpWkpmM0sveFRJWmZCRnZTWENwNzQ1U01PT0FGSWNINXFNSE1N?=
 =?utf-8?B?dmhIWXQzSGNXSHd2bUNYc3pjVEFKaVlYM3NxWVJlME5MWS9sbFNDcld4Q0VY?=
 =?utf-8?B?NzBTNy9CMnN6TlcyN0sxajN0eXQrcklWUDJKbzh2bjl1UFlBOVU3MHI2Szlm?=
 =?utf-8?B?QlA2MzlYSmYrOWFrczg3aDNnTldIK2ZNaDZQcUZVQjF1T20rWEdCUjhKRXYv?=
 =?utf-8?B?NGswSHYwR2s2d0ExbG9zeXpqVTB6UnRlaXV4U3NSVEcvTzZkUXArdFZxSHJ6?=
 =?utf-8?B?VzdNTWR4LzUwUndUSTFicHp4T1RXdjlUbzBDT0p5RU9YcnQ1SEw5U0ZOeTAr?=
 =?utf-8?B?a2RPSnMzclhlaitvcUU3ZUFmQ3lUNjRFbVhMeDBDZW1sS0FRNWExT2JTQXhh?=
 =?utf-8?B?TTV2cjV6ckFBMjBUdDRKSTZaV3U4bzBNbHNaclVrR2tTQzJucGwzK0dMWkpr?=
 =?utf-8?B?cVFNSHlsZ3ZNeHpMeU9jRmNVYjBCMklyeHFKTlR6WTFsWHIzbysvWjdSRzlt?=
 =?utf-8?B?aGw4aU44SFhldGxDRkpMbktMVW9VOFJOTnJRK0dwYlBLYTBBeDJ3NWdhNGsv?=
 =?utf-8?B?eXpCN0xUWHBvZytyRThPemNsNzZEV2x1WlhRYk53ZHh2a2JUYmFnMWZKY3B3?=
 =?utf-8?B?VUpKaGlvL0pDVFdxeWlPeXNqbDlIWWd4Qk9LN0Y5MHF4ZmtCWnpySFQzeG9n?=
 =?utf-8?B?bnNmS0ErRi9lSTA0WTQvRXlYbjB4SHdjVjFxUmhJRmw4K0sraEJsbEJoUGZN?=
 =?utf-8?B?RWtOZkNnOUFHOHRPMEpSazByekZKZmRpeFFNUHJtREtiVHpzZ2N2TC9rT3VO?=
 =?utf-8?B?TC81RDErdy9NL21IZ1U5b01hbUtNMW5JVVIzS0JBajBvaVhGTnFzNzhmdzh5?=
 =?utf-8?B?alp1QjJ0VTdLZUt0UnV1Y284R1pZZGlES1cwSU9HWkthUFJNemFhUkdoeVBY?=
 =?utf-8?B?UGxEbWhyWWdUdzA0ZXhzUDBialduemhuODRsL3NzTkthUmc1VEZrZVJIbTF1?=
 =?utf-8?B?alZNTm5EckYwbWJjdmlZMmc3MkMyeHQxSGg1ZG1iVVJNaGJiSWhOUXh3bko2?=
 =?utf-8?B?K1hDK2wwbU9HV3QwcjV2Q2xzbDE3REpIUEs5VmxvSERSajVka0ZlaHVoY3Fq?=
 =?utf-8?B?MkI0Yzl5L0luVVBaQlFycnk0RGwrMzhOWVFpRHZycEdGeFhGck02cllDa2dH?=
 =?utf-8?B?eDIyaG5sOFJidFcvNDZSMU1Rd2JKMFY3bHVBQ3VQcWlqNUN0QWJtcE1JV2Zh?=
 =?utf-8?B?dDdpTTg2ZUJseXhBQWpNbTVPRGM4WDdzL2tJa3ZGcERGa0FMNnFhZWgzdFYv?=
 =?utf-8?B?VE8vWkRNaWJJaTRWckxEN2h2bmtmQllleGg1Tmllb0tUSUhmakkwZE1DL1Bh?=
 =?utf-8?B?S24rWWxxelQ2NVI0QUFkL0M4VVNSekpFMHlacW1XbW1sSVc1NjJ4Yk1USmx6?=
 =?utf-8?B?YW53Y1lrY1podDR1NWJtL1RGWlhQZDhwZmFqTjl4VTRBWEFJOVlPYjc0Ky9k?=
 =?utf-8?B?SGoxMHJlb0RTTDVrTWZnNlV5S2dIbUlvK3ZIUkJ2aUF1U1NpK1N4YitYSExY?=
 =?utf-8?B?WjFIaXpyMXVVcWQrZE9DVnRiN0ZJZjRGTTFSRkhLR2x0M0tYRU1ITGhOd1Az?=
 =?utf-8?B?eUlrSUVQbUMrNkE2amlILzhpU2dLdUpKME8vV1haa24zQnVPYXNlY21GQWEv?=
 =?utf-8?B?ck1qMzFBR3M2U1RTdzUvRFA2Um5PWWwyUHo4VEtIYUQvbnJsQmlnTmFMOFB0?=
 =?utf-8?B?UzdMQWR0dFRqUDVEazhKMk1JL0pvL3NNNnpTTm9LSGZWU0tVVTBtMi9MRmpi?=
 =?utf-8?B?cjlOTUg2QlNwQ2xPRVA4T285blR6eGJnM2hxNlNFTUIrdWYzK3VaQ0crMkl0?=
 =?utf-8?B?S2xldW5sZmt6dXBKcmduL05sUmtUbXZZbDNyekIwWk16U2pMQ2xIb2dNeG5B?=
 =?utf-8?B?ZlFsWGJZZi92ekhjQ3VHcytHUzN6eTh6anJSSnZ6ekpBYkR4Nkt6elA4TTlN?=
 =?utf-8?Q?f/ImNExG8ZYt4nm8=3D?=
X-Exchange-RoutingPolicyChecked: N2QNUFD10f/sCpNnyjQ4OAj8r2qBUBYU4P9zJbudIPMyB9ZfMnihD/7Yux8X7q34xH12bR16Dg4wAm/suhMFZ44eaBG08xo1xR2AMpQETN06RFmf3jdZ1HC0NlRPFD+mH2jB5ATqMWrhrEKKO+IM9NIxGQbfSbuopfQ/wxCGZC4v4l5IuojMJ0lDtDeGxL6s/T6QXobfu5S3rZpNWFjvs15oJrFHvmJuM3T27Pu4ylliDIwS/B81t0Ly7CE5VmOaGqARKtOm6Fu7x5jyhK4odJAuZw0Yt53yn8E600EG71g/OaXf0jM7jhASrwBOWbWnyL+2so9L+4n+W6EuUzpQ3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 978bc3c2-69c6-4dd0-3e65-08df1d4fe59a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:01:50.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1S0b/QRWJZo5cggBX+fLvVchl9tzyUIq2tUehHkur+3VmuSXlle2DfJYhiuEU92y1oCoyhBmGI50EuOzqGGQitGY/0V2MM/+sUtomhvZzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB570107
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

The implementaion looks OK, I am wondering about the duplicated
bits and whether it is worth it to make funcitons forcibly stand
out from the Xe implementation, e.g. sometimes you have tiny bit
of difference in formatting, or there is one more helper
variable in one implementation, but not the other, etc.

I'd say it would be worth considering extracting common parts
into a shared file, but not necessarily in this patch series.

For now:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

I have one suggestion, see below.

On 2026-09-25 at 12:57:44 +0200, Sebastian Brzezinka wrote:
> Add an i915 backend for gputop's PMU-based engine monitoring,
> implementing the device_operations interface from utils.h.
> 
> i915_populate_engines() opens the render node (no DRM master needed),
> scans /sys/bus/event_source/devices/<dev>/events/ for "*-busy" entries,
> and decodes engine class/instance from the PMU config value.
> 
> i915_pmu_init() opens a perf event group via igt_perf_open_group()
> (requires CAP_PERFMON or root) and cleans up FDs on partial failure.
> 
> i915_pmu_sample() reads all counters atomically from the group leader
> fd into a heap-allocated buffer, and tracks read success explicitly
> so a failed/short read leaves counters and timestamps unchanged
> instead of using garbage.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/gputop/i915_gputop.c | 473 +++++++++++++++++++++++++++++++++++++
>  tools/gputop/i915_gputop.h |  56 +++++
>  2 files changed, 529 insertions(+)
>  create mode 100644 tools/gputop/i915_gputop.c
>  create mode 100644 tools/gputop/i915_gputop.h
> 
> diff --git a/tools/gputop/i915_gputop.c b/tools/gputop/i915_gputop.c
> new file mode 100644
> index 000000000..de33bb3fd
> --- /dev/null
> +++ b/tools/gputop/i915_gputop.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <inttypes.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "drm-uapi/i915_drm.h"
> +#include "i915_gputop.h"
> +
> +/* Minimum chars before the "-busy" suffix (e.g. "rcs0") */
> +#define MIN_ENGINE_PREFIX_LEN 4
> +
> +#define engine_ptr(pmu_device, n) (&(pmu_device)->engine[(n)])
> +
> +static void __update_sample(struct i915_pmu_counter *counter, uint64_t val)
> +{
> +	counter->val.prev = counter->val.cur;
> +	counter->val.cur = val;
> +}
> +
> +static void update_sample(struct i915_pmu_counter *counter, uint64_t *val)
> +{
> +	if (counter->present)
> +		__update_sample(counter, val[counter->idx]);
> +}
> +
> +static const char *class_display_name(unsigned int class)
> +{
> +	switch (class) {
> +	case I915_ENGINE_CLASS_RENDER:
> +		return "Render/3D";
> +	case I915_ENGINE_CLASS_COPY:
> +		return "Blitter";
> +	case I915_ENGINE_CLASS_VIDEO:
> +		return "Video";
> +	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return "VideoEnhance";
> +	case I915_ENGINE_CLASS_COMPUTE:
> +		return "Compute";
> +	default:
> +		return "[unknown]";
> +	}
> +}
> +
> +static int engine_cmp(const void *__a, const void *__b)
> +{
> +	const struct i915_engine *a = (const struct i915_engine *)__a;
> +	const struct i915_engine *b = (const struct i915_engine *)__b;
> +
> +	if (a->class != b->class)
> +		return a->class - b->class;
> +	return a->instance - b->instance;
> +}
> +
> +void i915_gputop_init(void *ptr, int index, struct igt_device_card *card)
> +{
> +	struct i915_gputop *obj = ((struct i915_gputop *)ptr) + index;
> +
> +	obj->card = card;
> +}
> +
> +/*
> + * Read a single uint64 value from a sysfs file relative to a directory fd.
> + * Returns the value on success, or (uint64_t)-1 on failure.
> + */
> +static uint64_t read_sysfs_u64(int dirfd, const char *name)
> +{
> +	char buf[64];
> +	uint64_t val;
> +	ssize_t n;
> +	int fd;
> +
> +	fd = openat(dirfd, name, O_RDONLY);
> +	if (fd < 0)
> +		return (uint64_t)-1;
> +
> +	n = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (n <= 0)
> +		return (uint64_t)-1;
> +
> +	buf[n] = '\0';
> +
> +	/* i915 PMU event files contain e.g. "config=0x1000" */
> +	if (sscanf(buf, "config=0x%" SCNx64, &val) != 1 &&
> +	    sscanf(buf, "event=0x%" SCNx64, &val) != 1 &&
> +	    sscanf(buf, "0x%" SCNx64, &val) != 1 &&
> +	    sscanf(buf, "%" SCNu64, &val) != 1)
> +		return (uint64_t)-1;
> +
> +	return val;
> +}
> +
> +void *i915_populate_engines(const void *obj, int index)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct igt_device_card *card = ptr->card;
> +	struct i915_pmu_device *engines = NULL;
> +	char sysfs_path[PATH_MAX];
> +	char device[80];
> +	struct dirent *dent;
> +	DIR *d;
> +	int render_fd = -1;
> +	int ret = 0;
> +
> +	if (!card || (!strlen(card->render) && !strlen(card->card)))
> +		return NULL;
> +
> +	/*
> +	 * Open render node to determine i915 PMU device name.
> +	 * Render nodes do not require DRM master privileges.
> +	 */
> +	if (strlen(card->render))
> +		render_fd = igt_open_render(card);
> +	else
> +		render_fd = igt_open_card(card);
> +
> +	if (render_fd < 0) {
> +		fprintf(stderr, "i915: Failed to open device: %s\n",
> +			strerror(errno));
> +		return NULL;
> +	}
> +
> +	i915_perf_device(render_fd, device, sizeof(device));
> +	close(render_fd);
> +
> +	snprintf(sysfs_path, sizeof(sysfs_path),
> +		 "/sys/bus/event_source/devices/%s/events", device);
> +
> +	d = opendir(sysfs_path);
> +	if (!d) {
> +		fprintf(stderr, "i915: Cannot open %s: %s\n",
> +			sysfs_path, strerror(errno));
> +		return NULL;
> +	}
> +
> +	engines = malloc(sizeof(struct i915_pmu_device));
> +	if (!engines) {
> +		closedir(d);
> +		return NULL;
> +	}
> +	memset(engines, 0, sizeof(*engines));
> +	engines->device = strdup(device);
> +	engines->fd = -1;
> +
> +	/* Scan for engine-busy events: entries named like "rcs0-busy" */
> +	while ((dent = readdir(d)) != NULL) {
> +		const char *endswith = "-busy";
> +		const size_t endlen = strlen(endswith);
> +		struct i915_pmu_device *engines_tmp;
> +		struct i915_engine *engine;
> +		uint64_t config;
> +		char namebuf[256];
> +		size_t namelen;
> +
> +		if (dent->d_type != DT_REG && dent->d_type != DT_UNKNOWN)
> +			continue;
> +
> +		namelen = strlen(dent->d_name);
> +		if (namelen < endlen + MIN_ENGINE_PREFIX_LEN)
> +			continue;
> +		if (strcmp(&dent->d_name[namelen - endlen], endswith))
> +			continue;
> +
> +		if (strstr(dent->d_name, ".scale") ||
> +		    strstr(dent->d_name, ".unit"))
> +			continue;
> +
> +		config = read_sysfs_u64(dirfd(d), dent->d_name);
> +		if (config == (uint64_t)-1)
> +			continue;
> +
> +		/* Only accept engine (non-other) configs */
> +		if (config >= __I915_PMU_OTHER(0))
> +			continue;
> +
> +		engines_tmp = realloc(engines,
> +				      sizeof(struct i915_pmu_device) +
> +				      (engines->num_engines + 1) *
> +				      sizeof(struct i915_engine));
> +		if (!engines_tmp) {
> +			ret = errno;
> +			break;
> +		}
> +		engines = engines_tmp;
> +
> +		engine = engine_ptr(engines, engines->num_engines);
> +		memset(engine, 0, sizeof(*engine));
> +
> +		/* Strip "-busy" suffix to get engine name */
> +		strncpy(namebuf, dent->d_name, namelen - endlen);
> +		namebuf[namelen - endlen] = '\0';
> +		engine->name = strdup(namebuf);
> +		if (!engine->name) {
> +			ret = errno;
> +			break;
> +		}
> +
> +		engine->busy.config = config;
> +		engine->class = (config & (__I915_PMU_OTHER(0) - 1)) >>
> +				I915_PMU_CLASS_SHIFT;
> +		engine->instance = (config >> I915_PMU_SAMPLE_BITS) &
> +				   ((1 << I915_PMU_SAMPLE_INSTANCE_BITS) - 1);
> +
> +		ret = asprintf(&engine->display_name, "%s/%u",
> +			       class_display_name(engine->class),
> +			       engine->instance);
> +		if (ret <= 0) {
> +			ret = errno;
> +			free((void *)engine->name);
> +			break;
> +		}
> +		ret = 0;
> +
> +		engines->num_engines++;
> +	}
> +
> +	closedir(d);
> +
> +	if (ret) {
> +		errno = ret;
> +		goto err;
> +	}
> +
> +	if (!engines->num_engines) {
> +		fprintf(stderr, "i915: No engines found for device '%s'\n",
> +			device);
> +		goto err;
> +	}
> +
> +	qsort(engine_ptr(engines, 0), engines->num_engines,
> +	      sizeof(struct i915_engine), engine_cmp);
> +
> +	ptr->pmu_device_obj = engines;
> +	return engines;
> +
> +err:
> +	for (unsigned int i = 0; i < engines->num_engines; i++) {
> +		struct i915_engine *engine = engine_ptr(engines, i);
> +
> +		free((void *)engine->name);
> +		free(engine->display_name);
> +	}
> +	free(engines->device);
> +	free(engines);
> +	return NULL;
> +}
> +
> +static int _open_pmu(uint64_t type, unsigned int *cnt,
> +		     struct i915_pmu_counter *pmu, int *fd)
> +{
> +	int fd__ = igt_perf_open_group(type, pmu->config, *fd);
> +
> +	if (fd__ >= 0) {
> +		if (*fd == -1)
> +			*fd = fd__;
> +		pmu->present = true;
> +		pmu->idx = (*cnt)++;
> +		pmu->fd = fd__;
> +	}
> +
> +	return fd__;
> +}
> +
> +int i915_pmu_init(const void *obj, int index)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct i915_pmu_device *engines = ptr->pmu_device_obj;
> +	uint64_t type;
> +	engines->fd = -1;
> +	engines->num_counters = 0;
> +
> +	for (unsigned int i = 0; i < engines->num_engines; i++) {
> +		struct i915_engine *engine = engine_ptr(engines, i);
> +
> +		if (_open_pmu(type, &engines->num_counters, &engine->busy,
> +			      &engines->fd) < 0) {
> +			/* Close FDs opened in earlier iterations */
> +			for (unsigned int j = 0; j < i; j++) {
> +				struct i915_engine *prev = engine_ptr(engines, j);
> +
> +				if (prev->busy.present) {
> +					close(prev->busy.fd);
> +					prev->busy.present = false;
> +				}
> +			}
> +			engines->fd = -1;
> +			engines->num_counters = 0;
> +			return -1;
> +		}
> +
> +		engine->num_counters++;
> +	}
> +
> +	return 0;
> +}
> +
> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
> +{
> +	const size_t buf_size = (2 + num) * sizeof(uint64_t);
> +	uint64_t *buf;
> +	uint64_t ts = 0;
> +	ssize_t len;
> +
> +	buf = malloc(buf_size);
> +	if (!buf)
> +		return 0;
> +
> +	memset(buf, 0, buf_size);
> +	len = read(fd, buf, buf_size);
> +	if (len != (ssize_t)buf_size) {
> +		fprintf(stderr, "i915: PMU read error: expected %zu bytes, got %zd\n",
> +			buf_size, len);
I see now what you did with "xe:" prefix in the fixup patch at
the beginning. You could either keep it removed or add the
xe prefix to the other stderr message as well.

> +		free(buf);
> +		return 0;
> +	}
> +
> +	for (unsigned int i = 0; i < num; i++)
> +		val[i] = buf[2 + i];
> +
> +	ts = buf[1];
> +	free(buf);
> +	return ts;
> +}
> +
> +void i915_pmu_sample(const void *obj, int index)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct i915_pmu_device *engines = ptr->pmu_device_obj;
> +	const unsigned int num_val = engines->num_counters;
> +	uint64_t *val;
> +
> +	val = calloc(num_val, sizeof(*val));
> +	if (!val)
> +		return;
> +
> +	engines->ts.prev = engines->ts.cur;
> +	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
> +
> +	for (unsigned int i = 0; i < engines->num_engines; i++) {
> +		struct i915_engine *engine = engine_ptr(engines, i);
> +
> +		update_sample(&engine->busy, val);
> +	}
> +
> +	free(val);
> +}
> +
> +void i915_clean_up(void *obj, int len)
> +{
> +	struct i915_gputop *gputop_dev = (struct i915_gputop *)obj;
> +
> +	for (int i = 0; i < len; i++) {
> +		if (gputop_dev[i].card)
> +			free(gputop_dev[i].card);
> +
> +		if (!gputop_dev[i].pmu_device_obj)
> +			continue;
> +
> +		for (unsigned int j = 0;
> +		     j < gputop_dev[i].pmu_device_obj->num_engines; j++) {
> +			struct i915_engine *eng =
> +				engine_ptr(gputop_dev[i].pmu_device_obj, j);
> +
> +			free((void *)eng->name);
> +			free(eng->display_name);
> +
> +			if (eng->busy.present)
> +				close(eng->busy.fd);
> +		}
> +
> +		free(gputop_dev[i].pmu_device_obj->device);
> +		free(gputop_dev[i].pmu_device_obj);
> +	}
> +}
> +
> +static double pmu_busy_percentage(struct i915_engine *engine,
> +				  uint64_t elapsed_ns)
> +{
> +	double busy_ns;
> +	double percentage;
> +
> +	if (!elapsed_ns)
> +		return 0.0;
> +
> +	busy_ns = engine->busy.val.cur - engine->busy.val.prev;
> +	percentage = busy_ns * 100.0 / elapsed_ns;
> +
> +	return CLAMP(percentage, 0., 100.);
> +}
> +
> +static int
> +print_device_description(const void *obj, int lines, int w, int h)
> +{
> +	const struct i915_gputop *gputop = (const struct i915_gputop *)obj;
> +	char *desc;
> +	int len;
> +
> +	len = asprintf(&desc, "DRIVER: %s || BDF: %s",
> +		       gputop->card->driver,
> +		       gputop->card->pci_slot_name);
> +
> +	printf(ANSI_HEADER "%s%*s" ANSI_RESET "\n",
> +	       desc, (int)(w - len), " ");
> +	free(desc);
> +
> +	return ++lines;
> +}
> +
> +static int
> +print_engines_header(struct i915_pmu_device *engines, int lines,
> +		     int con_w, int con_h)
> +{
> +	const char *a;
> +
> +	for (unsigned int i = 0;
> +	     i < engines->num_engines && lines < con_h;
> +	     i++) {
> +		if (!engine_ptr(engines, i)->num_counters)
> +			continue;
> +
> +		a = "            ENGINES   ACTIVITY  ";
> +		printf(ANSI_HEADER "%s%*s" ANSI_RESET "\n",
> +		       a, (int)(con_w - (int)strlen(a)), " ");
> +		lines++;
> +		break;
> +	}
> +
> +	return lines;
> +}
> +
> +static int
> +print_engine(struct i915_pmu_device *engines, unsigned int i,
> +	     uint64_t elapsed_ns, int lines, int con_w, int con_h)
> +{
> +	struct i915_engine *engine = engine_ptr(engines, i);
> +	double percentage = pmu_busy_percentage(engine, elapsed_ns);
> +
> +	printf("%*s", (int)strlen("            ENGINES"), engine->display_name);
> +	print_percentage_bar(percentage,
> +			     con_w - (int)strlen("            ENGINES"));
> +	printf("\n");
> +
> +	return ++lines;
> +}
> +
> +int i915_print_engines(const void *obj, int index, int lines, int w, int h)
> +{
> +	struct i915_gputop *ptr = ((struct i915_gputop *)obj) + index;
> +	struct i915_pmu_device *show = ptr->pmu_device_obj;
> +	uint64_t elapsed_ns = show->ts.cur - show->ts.prev;
> +
> +	lines = print_device_description(ptr, lines, w, h);
> +	lines = print_engines_header(show, lines, w, h);
> +
> +	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
> +		lines = print_engine(show, i, elapsed_ns, lines, w, h);
> +
> +	lines = print_engines_footer(lines, w, h);
> +
> +	return lines;
> +}
> diff --git a/tools/gputop/i915_gputop.h b/tools/gputop/i915_gputop.h
> new file mode 100644
> index 000000000..65684f040
> --- /dev/null
> +++ b/tools/gputop/i915_gputop.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef __I915_GPUTOP_H__
> +#define __I915_GPUTOP_H__
> +
> +#include "igt_device_scan.h"
> +#include "igt_perf.h"
> +#include "utils.h"
> +
> +struct i915_pmu_pair {
> +	uint64_t cur;
> +	uint64_t prev;
> +};
> +
> +struct i915_pmu_counter {
> +	uint64_t config;
> +	unsigned int idx;
> +	struct i915_pmu_pair val;
> +	int fd;
> +	bool present;
> +};
> +
> +struct i915_engine {
> +	const char *name;
> +	char *display_name;
> +	unsigned int class;
> +	unsigned int instance;
> +	unsigned int num_counters;
> +	struct i915_pmu_counter busy;
> +};
> +
> +struct i915_pmu_device {
> +	unsigned int num_engines;
> +	unsigned int num_counters;
> +	int fd;
> +	char *device;
> +	struct i915_pmu_pair ts; /* group timestamps from pmu_read_multi */
> +	struct i915_engine engine[]; /* grown via realloc */
> +};
> +
> +struct i915_gputop {
> +	struct igt_device_card *card;
> +	struct i915_pmu_device *pmu_device_obj;
> +};
> +
> +void i915_gputop_init(void *ptr, int index, struct igt_device_card *card);
> +void *i915_populate_engines(const void *obj, int index);
> +int i915_pmu_init(const void *obj, int index);
> +void i915_pmu_sample(const void *obj, int index);
> +int i915_print_engines(const void *obj, int index, int lines, int w, int h);
> +void i915_clean_up(void *obj, int len);
> +
> +#endif /* __I915_GPUTOP_H__ */
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
