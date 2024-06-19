Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A53C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 19:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4875710ED97;
	Wed, 19 Jun 2024 19:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZqQ1gt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A996110ED96
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718824085; x=1750360085;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Mg6YrIz3ubIvIKy/xMTm383rP6Pg2GizPVpZUeFfPV8=;
 b=eZqQ1gt5wOYjpS3rKAS4Oc1T9+ZpWF7IIBTt7/y5qg2rVVf7Nm+vs8DQ
 UJpR7DFqR1nj5RC3XoJOUlTtovqooWVn974VnLOTTwAF63/NnQsP0/GFr
 HV6FvxiARDu73XtED+bWtm0oINwCSM8f3IRmWmynSJDriQQoQsVSp79w+
 hJH5UmnzCKfBLRt25Dd2pWlPpHzEwSwjpfg1JmHKHikB4FRxA0O8mc5A+
 YV9MR2Hgkp4IFcWVgUwV1dt1qE1axaNvg/pj2egxhdvaJkyjSBmBzvs7J
 eof/5rHdcTvolc4zD5VA0Y5k4Hz5KeKhEfZmVU2+brIbl8iwAxqdfb74A A==;
X-CSE-ConnectionGUID: cWGO0+6XQzq5cME6cToPSw==
X-CSE-MsgGUID: EaPqasMGRUmLSOI0QIYjIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12152626"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="12152626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 12:08:04 -0700
X-CSE-ConnectionGUID: 9TRoATZWR6ejDr3qO4nCdg==
X-CSE-MsgGUID: l1LjOzaaQgKdJKJuA/W/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46529520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 12:08:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 12:08:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 12:08:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 12:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpDM8P6JdoXtFGLvxyQVaCug7T+wmNl15CzZiDng0vDgqK5AsGOP7aezkn8SM7Pd6+r/xpZqBiloahbM2T7kZTchGvNSh/O8Fs78Gr7oOC26FOqA7QHvjK5K0ucPtNVB/dHNR0uw+cX3DQafHySfK66EAKn/Fbxz0rd0aitmcg2iMtHdCtExJO6jqkAK795XU5oqm788TPXYgdfzbaehT1hBxfQOCzVRlqf5jIGETENy5chlW4YLNfJDd+AEfGRzPl+Puu33UKXxHZpeRprzt3n3UaldY0y+rqeohH+bmgXK4OFeq0KFWK69kyRvec+tnE1tihqT9cYHZM1gzd1IdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ig6zMBxpGiYk9FMLXeeovR53NTstGvenLDHyl11lTRo=;
 b=dJcedewJnOjrXYY+EKYOiaeHFz6mAbpNoJsjh58jrIbtW5r7LQWg7UzF9ANTY9YxVN7h5rUIQiGeGNUzNRXQR80uAJLrrSwC7dPvMVM21A81dyZc2h6jjXl0rsY/eYMNB8vQI8JYW5Y0lWbVkCh7w0rYYaT5EfcmlNKpjN1zFnY1STsa2r2ZDXSQ3efjYgunvcyQvgni3M/w4SvQ53mSeLPmt1/5z+5It+pNOU/dAMbs8mxpV7vtcK+yC+LIwqVd6L3eXPawl5L0XYVouKvnSL1COdHJQhRCG2y3KTFNxQ/bQfwAh7o1CcHNOr/0hyTsdgLVuOvSV8Dugng7rzhhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 19:08:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 19:08:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <r6557pxajmamz4k4elosqjsybgscx2kwfqfrj3kls33uxplanz@tytnenwdychb>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <171527122310.2038581.2879457245695725102@8e613ede5ea5>
 <171527425512.5772.1654105508452706087@gjsousa-mobl2>
 <r6557pxajmamz4k4elosqjsybgscx2kwfqfrj3kls33uxplanz@tytnenwdychb>
Subject: Re: =?utf-8?b?4pyX?= GitLab.Pipeline: warning for Add support for
 hook script
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Patchwork <patchwork@emeril.freedesktop.org>,
 <igt-dev@lists.freedesktop.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 19 Jun 2024 16:07:54 -0300
Message-ID: <171882407497.2358.12753379832373376535@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BY5PR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::36) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d5ab28-9b29-4713-8a94-08dc90932386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WC83b0N4UW9QS2xvRUdsOWIxMDVNeDIzcFlyVjNrdUNtUVl3SitMbnhIMzRP?=
 =?utf-8?B?Mlg0ZjJETXVCcmhocEY1UWw4T1d3TndvMnZxUU81cHpxQWFjR0YxQ2xac09N?=
 =?utf-8?B?amI1cUZTUVBMN0puWG5XMUtmQlNqTXpIWTMyRlIwbkZGckFZekIxeTRtbVlr?=
 =?utf-8?B?Tm8wTkV2R2MwU01JSnRUTVVFSWhuV2lWVTRTMFdQSkNEMXBpOSszUUlOV1cw?=
 =?utf-8?B?NDA2bzduZ3dtQkN4OVhqRGhNaWcrUVVRTEs5U0pVQ1pyVmoxcTV2VmlmS2I2?=
 =?utf-8?B?aFVkUEgzUjM1cS9RdFRjaEgzNUo4M0hsVmtSS3paOE5xckQvS3p1VCt0Q1U3?=
 =?utf-8?B?TU8zRXVHaGhXbG9lYUJkOTRVdUdJMHI0bWEzVkptcW9kZnhpb3orc2V3Y3l1?=
 =?utf-8?B?a2RiNjN2ejBjTGFFakxGdzNwNkllT055VUd2LzZZRXpidExyRGdOQ0Y5SHMv?=
 =?utf-8?B?SXE1NHBhK01kbWlnUHBFaGRGdXB3RGR4WDlmQlNOVUVSZis1NFdQS1dKbXpy?=
 =?utf-8?B?KzNUbU5qaVhFYTdZZUJUSmQ3QThKcTk1RW5rWG5MSElsMStNVlV2ZVR1VW8x?=
 =?utf-8?B?TzZoRDJpRnZXakRrc3JCL1JiUTJBNFk3WmoxT0ZJS3kwZk10TFYyR3JKckk1?=
 =?utf-8?B?MkVJeGViVkZsSEFkSThFQURLaVN5SDVQN00xUzJFNVlyWUppK2J5MEZnbUxU?=
 =?utf-8?B?cHNXTDdaZFJOdWFHcVlKU0RlemlxVlB6Z1VkK0NrN1hkY0hiTjQ3R1ZrOU1G?=
 =?utf-8?B?YUVWTWs2RklFQVFGY09ReVN2RHFzTnh6QkFERHVtVUw1dWVzM2l6bkdKNS80?=
 =?utf-8?B?REhHMHUrQlFUQ2I3QmdIUWVDUGVqbUc5M3RhL3JJOGpiQWRaYWtNM1Y5ajBI?=
 =?utf-8?B?Rmo2b2NzdDZHRFRGLzlGbmlRS0pLUTJQbVNhL3hoelhRR1RjZVY2YVZFNk5H?=
 =?utf-8?B?Zmpmc3loZ3JrMG0rb01kN2RxWGRBNk9xZTg4dVJROWJjdXBCMUdCcGNPa3A3?=
 =?utf-8?B?NFNVemFra1VoOE1kUUhSVTZJZlhxZ1dtUHdyczJzck8wTEIzTC9lK3k3T0Zs?=
 =?utf-8?B?SHU4Y2RudXh0K1pOUkwxb3hiQldQVnpBZDNldnJUaDd0RzQwVUM3bGJmZHpu?=
 =?utf-8?B?YmNDaFBSSnk4Ylkxa3ROVFo5aEF6Mk01eFhWRUUxTzBIYkRjd1JHSjBQNHRj?=
 =?utf-8?B?bzVsYUtWQVBhSFNHbHlleVdEaXVkbEE2VTZQNGRNZEpFOEVjTG5FWUVnUDBL?=
 =?utf-8?B?VURLRDQyV1IvZC9NdXdTRmZyQTd6NWU5aSt4eEFlaDZjNzk3ZWlqdVZXM0VV?=
 =?utf-8?B?RUVscmszRkRkUjFlMm5iSThKcHlaOFRHeDJ2Sk42dS9UMDVyT2I1SEw1Mkdr?=
 =?utf-8?B?ekZOa3MyUldKZUoxSEdRT0tKK1E3cUlzZHdkbDNVb0gwcUlaMWcxN3pvVEp5?=
 =?utf-8?B?MGQySG9YZEFnNWl3U3NLNCtpS0Q2VzFCTlBZMk4rc3E2WTNBNDJRQVRhRTNQ?=
 =?utf-8?B?bVlrS0tMQzk0VlF1MVhrQmo5SndXRXVLbDlHbko3RnpTYStZMXdzSzF3dnBN?=
 =?utf-8?B?NGdxanZRa082YjdPcFNVeWJkRGtjcVl2RitqT0lmOHlRTkFKUFBmWDhndkVk?=
 =?utf-8?B?bTh4ckhjWFRXNWVFRVhBU2VIeXdHYUNEN1pIRVhrOStmcVFmTXpIVGtBZUhM?=
 =?utf-8?B?WnpmTk04SFF1U3E4Smo2TnByRnBEa2QxVE5KOGx5Z1NYa0FaeEJlRDd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkhTL2k2NFoyY2thREJ2eEhJTThycUNzblQ1SUFnMlJhTW1FQ09iUGtCdDYx?=
 =?utf-8?B?K3NSS3FnaldkK01pK25pREhBZHQ2YTlKNjMzRXdJemgwalJNSnhXL0psZnEr?=
 =?utf-8?B?Z3VoM3lscnViZ3RVYUxVS1B1L1ZCUU1OdVFYR2tmY01hVzZ6cU1FTW5STXV0?=
 =?utf-8?B?MzRMUGZSbEp3MEU4c1dvQjQvOXZVM20wVGZFVUxXWlRIK0wwS1ZEZHNyd0t2?=
 =?utf-8?B?WHhuZ0FzUitNYmlaU09rUXJxMFRaWGpmMW0rYTJRaVlyK0hRaFUwaHduZE12?=
 =?utf-8?B?MXJIS2ZqQjlHTDQ2NnlaV1ZkNFJLM1BqREcyYUJOcEVCWTRYSEQxaGt1UzVo?=
 =?utf-8?B?WHJsTmEzdTdNemg2disxWVZ4N0J5SXpPTFBUTDhFcXlCQzJDMGRSYnlDVXUz?=
 =?utf-8?B?WjFUOGUzU1hQRjE1eEpwWVU3RDVEVlJRM21FeHFFZmVlVm9XQ3RlOVJma0cv?=
 =?utf-8?B?RUpKRmc1Qm9qLzdBUGp4RGdWTVFkY3ZOWGFMWGYvVDA4ZXB2YzhjN3pRNW5Q?=
 =?utf-8?B?VUlRWTNna0huL3ZFZ24vU1VnSUxLYXdtUVV4cGFkc0FIYUdvK1hKait6NzIy?=
 =?utf-8?B?dEh3cEEvMHZmVWdlc2tlaFNlSHo0cWI1Y0VDWnBUZUtaUHBVZ2Q5QW9udWl3?=
 =?utf-8?B?a2ZseHdzV25WK0VaVzVBQVVqNFpoODBSYkxaRWdhcklaYnlGdEVFemk1WW1i?=
 =?utf-8?B?YUxZVXhOclNZUCtyYjlzblRCTjdtMk5CWUtXNkZLWnZYL2tmaWJjL0FCV1U1?=
 =?utf-8?B?QVdNeXphNUE0OHc5QVNFTHVDaGlRSGlWbzNmakRyS0NKUjR4YnFFaWVJbnlV?=
 =?utf-8?B?UStRMTFLdmtsekkrKzFNWGttdUJYSlRMRTBILzNHamlDM3VWci94S0p1NjlS?=
 =?utf-8?B?NmVWS0FHTDY4L0xuQUhWeXRaT3lwWW5IaDllbHE5R3MzS3RlaXRZeW9ub2Zi?=
 =?utf-8?B?bGVxeTg1VUxJNDk2UjlhR3VId3V2K2JXaDA5QytYVFhqOEVQZjc2cW1OdHUw?=
 =?utf-8?B?SW8wcGhxaW1HeDRCWHpEd2dPd0NUdkhxZDljWnJVUWdJRnRWUHBtQXI4aS83?=
 =?utf-8?B?dHl0dmNyT2U4U3lBMU1YeVB2KytwZEpNRHA2dWcvMVR2S1pwbDVlZFhpdytJ?=
 =?utf-8?B?YkZxM2dNOGkycVVxbkhSait2WHpMS21IcUR1UUJWejc4REptSnR1WFpxWEdj?=
 =?utf-8?B?MDVPSFpCcW91SXp3aVdTb1RKTmlJN0RyQjl5djlsZGs1aDZvSUhaSHNEeEFE?=
 =?utf-8?B?cUlnVXJ1dUQ2VGlKOGxYTlF0SlVUb3JibnNzak5SaW1aQzZHTmJ3QnVqOXgv?=
 =?utf-8?B?S3RnRHMvSWxWNUJKamxwbUc1WDkrZ0k2L1hTK2VXdUxBZFlnVmVlMVBKN0dV?=
 =?utf-8?B?UUV2Y2wvV1QwZlV1bEhKYTZHQ1hUblhtV1FyS2pHZksybVhvaE1WTEZCLy9n?=
 =?utf-8?B?cys2cnZaZmx6VWV0T0xHcGVOY0w2WVlMQXFMQmxObldESWxzQ2FJVmNydlFR?=
 =?utf-8?B?YXVHZzZpamVGWTRTbkQvT2QxQWlIeFZ0K2srOGUwNGJxeG5RdTd4ekg5eEpK?=
 =?utf-8?B?UG5kTDV6QXhzRXFMRXpFVG1VaVNrMmVwZjE1cVVBUW1MaXFGYk93RGUycVZp?=
 =?utf-8?B?TTYya0o2M3U3NlBnVWJoa2dhTC9TUzBuSVRQdy9ZalIwVnFYY1JlZWhKd01T?=
 =?utf-8?B?R2VDeDVYR0R4WXBwZkx4eGFFdmROMmhubmJxQVR1YnJEN3Q1VU80K0NPZEov?=
 =?utf-8?B?T0lnOThQZ3lmbUxPd1IrZ25XK3dEb0N1MGZXNGgvZVVUM0d4Q1BuNi9NWnlC?=
 =?utf-8?B?ejJMU0FJVUdUdGdNcERBSmJYMVRLVndMSmh6ZjZtTDVESGFuaWV0MFFEaEU3?=
 =?utf-8?B?TTlkVCtLWXE2UjFadUJqWG8vaSt0U0dZaHNlbU1aZG5CVXZJM2Nwc3Z5ZTRh?=
 =?utf-8?B?UkJQOGpKN2xpeThXWUtKMEdLMnhXQkdtOVk5SzY5VVVTU2RBZ3dRNlEyWEg0?=
 =?utf-8?B?UjRycmxrN1FRSlFGNG5tWWlHU1I0K3hsZWZVV3A4VzFVQjVpbUZZdWNGWklD?=
 =?utf-8?B?dTc4bFM4NHJzQ2tDM1J2aytRaHo2cnk1RnBYR2h6NHdKdzEzbTE4c2J2UUNw?=
 =?utf-8?B?cnhuLzVuUUpxUVpXSktJUWFvd0JTbG1pOWVVR3QxVGdNWndpTDh1NEhWUkNF?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d5ab28-9b29-4713-8a94-08dc90932386
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 19:08:01.3114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnB4UmXzFRBTWPdJeatITH1dSXrgu6kr+PLbpPNv9AjyZlo4MXnnMiJWjSnnAcbrwPKScOtrEnpJkuoFp6zWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
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

Quoting Lucas De Marchi (2024-05-20 16:44:15-03:00)
>On Thu, May 09, 2024 at 02:04:15PM GMT, Gustavo Sousa wrote:
>>Quoting Patchwork (2024-05-09 13:13:43-03:00)
>>>=3D=3D Series Details =3D=3D
>>>
>>>Series: Add support for hook script
>>>URL   : https://patchwork.freedesktop.org/series/133391/
>>>State : warning
>>>
>>>=3D=3D Summary =3D=3D
>>>
>>>Pipeline status: FAILED.
>>>
>>>see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/117373=
8 for the overview.
>>>
>>>test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/58540606):
>>>  26/30 lib i915_perf_data_alignment            OK       0.42 s
>>>  27/30 lib bad_subtest_type                    EXPECTEDFAIL 0.37 s
>>>  28/30 lib igt_no_subtest                      EXPECTEDFAIL 0.42 s
>>>  29/30 lib igt_simple_test_subtests            EXPECTEDFAIL 0.27 s
>>>  30/30 lib igt_timeout                         EXPECTEDFAIL 1.32 s
>>>
>>>  Ok:                   25
>>>  Expected Fail:         4
>>>  Fail:                  1
>>>  Unexpected Pass:       0
>>>  Skipped:               0
>>>  Timeout:               0
>>>
>>>  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlo=
g.txt
>>>  section_end:1715270916:step_script
>>>  section_start:1715270916:cleanup_file_variables
>>>  Cleaning up project directory and file based variables
>>>  section_end:1715270917:cleanup_file_variables
>>>  ERROR: Job failed: exit code 1
>>>
>>>=3D=3D Logs =3D=3D
>>>
>>>For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/=
-/pipelines/1173738
>>
>>Looking at the output on the page linked above, I see that the test I
>>introduced (igt_hook_integration) is failing but I passes locally for
>>me.
>>
>>Is there any way I get more details on the failure to investigate? The
>>job output says:
>>
>>    "Full log written to
>>    /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt"
>>
>>, but I'm not sure if that is available somewhere for me to check.
>
>GitLab.Pipeline is the one executed in fdo infra, not in the intel
>infra. You use the container it's using to repro it locally:
>
>https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606
>
>        Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a=
2225132246af9cf5cc6c4e5b
>        for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minim=
al:commit-c21f9e2242955d29c7bb2fd9703230bd9799eb8c
>        with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debi=
an-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a3=
28d477a ...
>
>Note that this is the "test" phase. You should also reproduce the build
>phase. From the logs:
>
>        Downloading artifacts for build:tests-debian-minimal (58540184)...
>
>which points to: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/=
58540184
>
>The builder and test container are the same, so you can use to fetch:
>
>        $ c=3Dregistry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-min=
imal:commit-c21f9e2242955d29c7bb2fd9703230bd9799eb8c
>        $ podman pull $c
>
>and to run (first line I conveniently alias to "pod" locally):
>
>        $ podman run --rm -v $(pwd):/src --net host -w /src -it $c /bin/ba=
sh
>
>        /src # meson -Dtests=3Ddisabled -Dlibdrm_drivers=3D"" build
>        /src # ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build =
-j 1
>        /src # meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
>        ninja: Entering directory `/src/build'
>        [2/2] Generating intel-ci-tests with a custom command.
>        ...
>        13/30 lib igt_hook_integration                FAIL     0.12 s (kil=
led by signal 11 SIGSEGV)
>        ...
>        Full log written to /src/build/meson-logs/testlog.txt
>
>
>I see a bunch of lines like
>
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>        Unexpected envline from hook:
>
>until it's eventually killed and line is truncated:
>
>        Unexpected envli
>
>
>Given the fact it passed in some distros, I think that debian minimal
>installation doesn't like something in
>
>                 "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; echo -en --=
-\\\\x00 >&%2$d",

Thanks, Lucas, for the help in reproducing it!

I was able to download the container image and reproduce the issue
locally. Looks like the "echo" built-in in that image's default shell
does not support "-en", which ends up spilled directly to the output.

Replacing that echo command with "printf -- ---\\\\00" fixes the issue.
The next version of this series will contain that fix. From my tests,
looks like that printf form is compatible with both sh and bash.

Thanks a lot!

--
Gustavo Sousa

>
>
>Lucas De Marchi
>
>>
>>--
>>Gustavo
