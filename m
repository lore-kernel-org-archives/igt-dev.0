Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4474C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 07:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B8D10E70D;
	Thu, 16 Jul 2026 07:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIg049AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E5510E2F7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784186986; x=1815722986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AybzapqOLNyg/2xeENjkWeOU8a+HUg5BgOWEiBILa90=;
 b=eIg049AHRbLD69sNRB6wwzvfw+bvm5wBXThdA5DFjsOUxfEGyQAPJqZi
 KYxi03+IIWWuF9/UxFyeA2GV8y5pSiYHD2z+ytlKwbyRqD5NhvGiVrxx5
 Ef6sn9ladhOo3C1artYrwt+w7osEl4DrRlDkaS2+36djxMSPLkYE5ShZ/
 6mmaDJWaTfYrc2n+WpCck6V97ScQQOIGGJriT1OQHuvxGWvV5z2Y8wDIE
 +Wv9bstMxcnXC/5OH/uowbFKeiSWWB0MALD7XdmJs0QGxNEMhLzZBeUct
 kQIm1jJTEJ3vs1/EQAJyccDf431XCorUuH7FkKDIbhGju2ei+XhvkaN+b A==;
X-CSE-ConnectionGUID: ggG4KqtQRyeAxweqO2JPSg==
X-CSE-MsgGUID: 9MkyPJaMRcmRTNbQZcFiRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88663244"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="88663244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:29:34 -0700
X-CSE-ConnectionGUID: Vjp+eXVgR9So5cHS8Lo+yg==
X-CSE-MsgGUID: IrhmLFADTwiLw6B8UoAGNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253789597"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:29:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:29:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 00:29:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 00:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzhadgsdyFQbI6/npBIJwPPuS2VjmKkF3BuCIoNVKIJCm4nGrDG4lzT9xy3vPpryrO61uOKNZQC82BHGldW89qXt3brG5icTEYjbDU43/Fmff9vwdZEqk/bxFYufB4RSr5GqoJ64BcwgXKwv/MSzwddKcdu4Xb61UzpZRTlqHQ4xWiNs84MF0l7gtxxSR4FVrXs5t0hgKJYsAdL8Y85Y8wU2LDlJjMxDN/IvM5fFsv1QH+xiVKsiwsBKW7abZmmi8ZtFYcNLUwWNdIK7iyRkmGOPC172MJSzy9xDASlLvm9Tn89+EhOlzmAwJLYvMx9/xY3wiNCJlQRXUdhUsR8fnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjkVx9xMXHRRuhhzu7ThrNkIDqrvy4WoC51wQ4iZrOo=;
 b=SoHlnDoubMjZtL4K06bz5sqTXB9KNxgniSE5hHi1gMLYiym4oZzgMiIqMsgKUs8eTFbLOLQ+NgM11lv5a60rNIIQcBYVqr38MsdSAhkPDAE+ze9SAwJXah1d17Y+Zaqlooi9eAh7+2VIfbSDaUycLQGGx5mlTThhTaxu4C+J/vXQS7eXfBNy4KZogb2nGdLX3Dux8o7gRrzrP5/O+9EwyBXAsc6YxHBrizyiJTJiA/ixBmyvVCYhioUrqyNhr/xtexGcn8xTZVoEdy3mJjLCzDK6SaTdTUepxBf4dYW78ArW3VKcbCRtr2XSWjLKdT3IiQEtB9NPhkXl2FrNXgRURQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 07:29:27 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 07:29:27 +0000
Date: Thu, 16 Jul 2026 07:29:16 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 04/31] tools/intel_firmware_decode: link with
 minimal sub-libraries
Message-ID: <jdarriq5j7uijbpbes2z5kyi4frilmedemq7tuqgrjpibt7a7a@asjcyyy4c2aw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <a9e2bd71b05ba0b323cfaed16cda18b8ecfc6fc1.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <a9e2bd71b05ba0b323cfaed16cda18b8ecfc6fc1.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9154aa8d-87bd-43ce-80b5-08dee30bf787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: GZ1sqLuMmVAOOW5RMR1/N+wv9GF+xAUC779J51rZ8nz9pL51GO6HKEPPubfbhX6WkDB9TSdDX+UBNZL9DjOJFOq2JO+/R/n0amFKVIcuxd2V9IreA2oaSMmLfXNyV7ELUTlwUDYbRlUQX6gRkTupckrXsler4gPM2/d9XAPRQqHS9rGuKx84OoKb/cmdGTaqJzKcCv5vZgpmlyULW+xdgz51iNxcdnFga1YSbkdWV7onoJ9cggdnGSStwuz3y1PrgdcIKo7Yjq8G9aQlvuCmEQxWqK+Sa+wrckxfWKpi00hJfqv4y0RBw7fEegC84CIgfgIohXh9AltxaIEEovcbeaoO8Pm35b+09Uq0D7ExsBSvuRNbV6jmUCIOal6kwDCFmcuFUPfDXUyf3HxHiNjMDw/URZldi8QcIkHUTWlMgTBqgoXaYk+UzODWf3HGcTdXDaU24WOZO5d/VAyVxSbZ9AlucnoeaVMO5deUlfv6jVc84tYctvLRZwJWHvX0Hi6Tlup7G8eKtrRSQWlL64S7GHrbAX8P87Dd9nPClK1HjCZ6dvFx7GfT6J8vuY5s6Lxf7lAtRz0mEndCBybh3/+utxJHRqPgIZ+c0pQeSkHDrGcriWPBCcN1v+24ewO8CmJZwvm7krx9RL+fhKF0oYai63NIWn/yotHGblJoirQHhPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG82TVZYN2IvWk5KS0h4Rmt3WE9RTm9GM3o0dXp6d3dMaDBFTXpoMFQ2RjFN?=
 =?utf-8?B?NDNvSGR6SElKRTdKOU80Z29wZzRVNzdKUHVPRk1yT3JLM1VnMExrVU44cjg4?=
 =?utf-8?B?WDRtRGlmUXFKS011SjBRa2ZFSFNKNTVlcXRmamJIYnp4K3ErZzNGYWZwNlFW?=
 =?utf-8?B?V0lBVnF0NTlyR0tRSVEwUDllZExOTHZWUVRHUERxYUpMZW8xTjZVTzNLamoy?=
 =?utf-8?B?dDRKUk9kQzNQMXBTYTVFdGFjTzMzWGRjM2JtRDJqbE5uL1FSR1hzT25YRkZT?=
 =?utf-8?B?WU5sQUtWa21uVXp5RWJJWC9yTzB5K1kva011VVFuSUw2SEF5end6NWo4amJX?=
 =?utf-8?B?NEJRSXJsOE9MTnIxWTlmbzJSUzg3TFRzTWtmcVM4ZUpRWWZGYm95ODdYYlJp?=
 =?utf-8?B?NDRzVXRXTjNQNjRvclhUNlRMREZzbkQxZEc5VUtwcHlDVDgwaTllbGU3UXkx?=
 =?utf-8?B?UUxsdzFVQ0JiTktJM0lJR2FCVTRxcDVSU3hEWkRHZitTWEhTRjMrWncvUzhI?=
 =?utf-8?B?T2Z4UVBSTGhsenpoQWZndy95SDBTV0hNN0lFVjg0eXMyQ2s5MXREY3JvTjRx?=
 =?utf-8?B?QlJSeml0S1BRU1dEaVg5OUdQNVVaTDc5amIzTGIvS1Q4c3ZqQUlQZEMvUkpS?=
 =?utf-8?B?SXF5S29XR244OTlmeVBKZXB1VWJqMW1nb1lkVUcrdW1ySEExVHAzT01RRjB3?=
 =?utf-8?B?bi9rVk8xMHptWENiRjNZWHZsMnF1MHo3WjNoRU5CMlI1eVV3MEprQUNHeFlM?=
 =?utf-8?B?S2NHMElBYWx6Qjc5UE0xMGpLa3haR1FFdFdqQmFoRC8yZWJ0N2N5MmpmaGpz?=
 =?utf-8?B?UU9QY2ZwOElIcGQrZDh6b1RJeGVRSEIzb1ptMWxRWnN2NEdaVDNpV2FHU28r?=
 =?utf-8?B?ZFVPWkVBaityeXV0TG04NVpwNmE0a0ZCRkRLdzNyYkFVTjU0V1FTQ2IwbmVM?=
 =?utf-8?B?VWcyeUlyV3pHdzRPZWRFUHdJMjgwR0FUT1hDZm5pdHVoS25UQWdLMzdvdmVx?=
 =?utf-8?B?MCs3ZnJsTnNQaWo2bnJEMFl6andpcVpEamU5TVNmazd4eGcxeGRSL1VNQkVx?=
 =?utf-8?B?UHpma1lCd2VCWUFsakw5ZTVuUDhNeXl3eU9JUGlHWGxBa29sYmpzUzZUcTVV?=
 =?utf-8?B?R08rVFR6YWZFeXN3MUtIQVRpWEV5YzNGNjBSd0pVejhJRjFBOWpyZXhtcXRI?=
 =?utf-8?B?aXVPbjV6VFBxalVqVnV6bTM3Uml1aUgxL05iRmlPMjEvOERzdmwzM1hkRW01?=
 =?utf-8?B?eE5qRE1UTkJ1MFBxdG1XS0o3VDhFcDc5bFBhcGxTSWlXdlNMMXBPL3paRXRR?=
 =?utf-8?B?bmRLQUV2N255Qnc0YlNFTGR0RXcxRWJGRFIyWHlDYUtPZnpybERCdWFoK2lO?=
 =?utf-8?B?bVZoUVBtZnJZWWV2anl0ejdKQnVxVElpSlRFU29kenhtcUYxbmZvdGVKcHhu?=
 =?utf-8?B?cU1sd2RxSnNQRDBjZWo4ejlRcG5ncDQ0Zy9sZlJ2dENaS1lSOG5oWDBqTG9w?=
 =?utf-8?B?YWZRcGVpbXNJQmJpRDVSUmNiTkVpMVJUT1U1SkV5N1ViNzEwOTUzSWhhTjNS?=
 =?utf-8?B?MHRMdlZrdnBxZi8rLzNWQ0s2V0pWYWxPeTI4ajUza09tek9TQWRyWEt6aThJ?=
 =?utf-8?B?U2p4eFdSREtOU3cwNTNrb29qb2pOS0lGL3VKL1RwS25sNTFCbnVteTBhOTBz?=
 =?utf-8?B?cXRucFc4TVpQci9PN01IeGtaWnhMaFBVZ0RmTEQ3Rm9VT0hua0lqSTFZdE12?=
 =?utf-8?B?bTR3Qldsd3RpYkY0YStzc0FZaHA4YThOVldZWCtjMnMxaStBcjNjM3ZrK0s2?=
 =?utf-8?B?Z3VRSTAzWE92a3dvZkh2ZGJBaFdqMlgvRVhSM09UQ2lNcTl1Zis5cDhqV3J1?=
 =?utf-8?B?cFlPVlhnV09yWXZ5NGk5bTVQOWxrK1BTcDlrMFFlVFNZUkh4d05sNXdrV1ZD?=
 =?utf-8?B?SDJwbE95cGhlamdyRTArRlEzVmpOMnUrallRU1NxalVnMW84QlFLNDFrVkNF?=
 =?utf-8?B?cm1mRDJRRXIwMWJMWmoxZlZJNkpGc3V4MUNHcUNzWWJUMERXcTlXM0NaV0ti?=
 =?utf-8?B?ellXRHRvRWlsUC9YU0R5a0p5MVZJUkdaU1RkVUplSExrekZaYVRaMisyTnpB?=
 =?utf-8?B?eHRCWVQrc3dxTGlhSjdXNy9oK25OL2xlN095NWRTdzZyWit3bGR4NU90UEhR?=
 =?utf-8?B?akVxWkovMTZqL1I2TkdDSmd2T0I5bmprdS91eW0rNEltR1A3NGU5bGhxeDdN?=
 =?utf-8?B?djVKNGdaY0hOMFhaU0ZRdkJmSnprYS9WSTE4Y0dtQUZkZ0twV1VUY29SVnNS?=
 =?utf-8?B?bUVsQnFtSnF2UEhNSjg5WlBSRldCaDJBZHp3S2x5M090M1llcVliQmp2TnNW?=
 =?utf-8?Q?y14NhzvBwJMw0LFg=3D?=
X-Exchange-RoutingPolicyChecked: VtbbEJtWExuRXZuWlmaqOGDm0C0eeFrr80sUVvSaVBZ4nGJq2aXZeV47rqcjvFcUFepKHKXYiRaIrzrryezCE6StMkB1gX2LqrTVoIMzcYAD+U9T6jR1VHLbtGCuKYYxhJjbZylt8JR8OC5EMp8Zjpezf+VzR1/LPvcMOMWSBXghzrlNIgyK62sZ4PzlSiLQpmHCRH7vOwes9LEZ7P+cgyBgggrMr8k8fOI3U8llVVQ6KxFtnkNMXYp9zXa2ypp4SO09Wv96S8r1Vn1uv8khYD6+LXAn/NRDyhSdZdK3EE1q0qg5BJ2UxLWb8qIAf49VVZoIRxmGSEfft/j+lCOy9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9154aa8d-87bd-43ce-80b5-08dee30bf787
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 07:29:27.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf1e7tJtkjs8Wc3dnieAo4tBInKQNkO5n5hQTYXkGMR++bDK50eNdceKGtpWatYtx5fg+d+zByByPVQmTrM4lHOChUnRtC9hzC2Z42R0Tjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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

Hi,

On 2026-07-15 at 14:15:14 +0200, Sebastian Brzezinka wrote:
> intel_firmware_decode only needs the lightweight assert stub used by
> igt_assert(), so the full libigt.so stack is unnecessary.
> 
> Switch to linking against lib_igt_tools_stub only.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3   (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 286a718c8..4c67dde4f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -24,7 +24,6 @@ tools_progs = [
>  	'intel_error_decode',
>  	'intel_forcewaked',
>  	'intel_gpu_frequency',
> -	'intel_firmware_decode',
>  	'intel_framebuffer_dump',
>  	'intel_gpu_time',
>  	'intel_gtt',
> @@ -62,6 +61,11 @@ executable('igt_stats', 'igt_stats.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_firmware_decode', 'intel_firmware_decode.c',
> +	   dependencies : [lib_igt_tools_stub],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

On patches 1-4:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
