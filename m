Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E3FC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 16:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4407310E05C;
	Fri,  4 Apr 2025 16:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQCGM+7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346710E1DF
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743783350; x=1775319350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2I6vHpyoH/EB6BFKjCNKspaZFt+B7eEbbaR+ihZ4BBU=;
 b=TQCGM+7EfP6jvEjjWxhKAfl4wjezGUOPYVE8dpTNCnamnt5n6fQNxLco
 Hig8TeTC92RJMCyxDjsgTAEyhMSHfihr8v8bVi1/eEi/wDyUb6x3SKeex
 6dwRWGKRV2OYqdaAWP4EI3/hyrhx62iB32Wy3WeWY355H4qusx1/Ncs4F
 sDM7VsyzjXVg/4HPLj0IdZ4yTInPIQz4cEwgZ/DI9M4Nj+uwu5WrQGROE
 /KPvIXaTrmMqksv4Goxqsb/8MMj7nUSKMSkI1hHFH5wpgDq3wmdmrh6p/
 ZuLDzD4VjXAgaSCadfM1UqFYY6Ft/eVFEA3e9PnjvzLxoU6dN8eXhImyX Q==;
X-CSE-ConnectionGUID: 7Fdz8EFYQKSuPwW3D30Gfg==
X-CSE-MsgGUID: USjbuHBDSNGU/qFMl2PI+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="47940947"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="47940947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 09:15:50 -0700
X-CSE-ConnectionGUID: 6ZVlF8D0QKKu2cwSn2HEbA==
X-CSE-MsgGUID: b4mOvRR6RMKDHARbTT/XVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="131484878"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 09:15:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 09:15:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 09:15:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 09:15:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWdxhk5GxCDsuPHeiEDj1pBbubeQ79Nk7VEHt6DjBoNtFJLw0hWxsSDLl/Z6y6vm0YJCdxz4453o3imZR7XlEdqdSgjr9k8FNo7860gtXgwa3Sq9qNuKbrN6s/ubBXp9XpN++UpStBHh0wv10q7sU8IO2xWVzX15HAe21aLfdT5mduKvoDop/dRBembABajwpLgLWkrKhORG7K6gVPYcYCjtBlvuo1SfSMBa8C+dfPTPXt7JDivl67agiGBbwXEcJjz5dH6wjtByqYjbWQFztqvlVMOlhFHU2U9H0vBxD5dUKVCWz3M/3ZhKliS5rMLoA9rdhFONuiwJyiZ5x0WLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXkAVMQ37zmGHppp/i1/iMclpSFQODPtCTeckVM5Q+M=;
 b=CybOYrpkLQPTk7bF50yd+WxuGgaRoh6bCfE0fgFQA295/Yd7yd0lZDudFDLT7D8uyoFQmAUFVa1tycERPk14kaGcAi2N8U/l7EIbdHpS1dsPl8GWIYDJeFpcA4E9sn727ODnTGcDFS5yDd+M9zt8p8kOijp/Vi0v2Me1wOymRK1Cp6IPZSn+BZW1ur75m8uAV8N7aUABLjlkMWP7FWgZqbMPtzLehrNkyfN6SMSg5WUdXvSyzZv5fMN78ihtdQN8jbQC+GVu7FhACIJslbsfh1QNOgbx9JV3NlJBDdoTZVtHrqMRMsC99qysMajmG0iM5VzQfc6oEl4J+5V71c4w2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 4 Apr
 2025 16:15:47 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 16:15:47 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Thread-Topic: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Thread-Index: AQHbpISGDPLZHsVxJEOmD8F/Lzp94bOTsAxw
Date: Fri, 4 Apr 2025 16:15:47 +0000
Message-ID: <PH0PR11MB48067B377A605C11266AA8F7E4A92@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250403105335.2034060-1-jeevan.b@intel.com>
In-Reply-To: <20250403105335.2034060-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|DM4PR11MB7256:EE_
x-ms-office365-filtering-correlation-id: 170734c8-39c0-4c52-7002-08dd7393f580
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bLKXv5n/QoopTmYFXvFbtYGkmTo9s/ljMevknS1nXiUuPiriYpySiA8ISrjy?=
 =?us-ascii?Q?t8yCnDaIkftve7DuBeHMQaGv7PrtnwOAsIxGUxG4HURP3A2bOjftbt86z/3l?=
 =?us-ascii?Q?3/i8VZyUwYwgX2kTRNwV8QGelGmZFnA0Z3f9U/A7m5oMfL5uL9TannpdvrAR?=
 =?us-ascii?Q?qZO1Mr5zl2fGbfI95kq0yST+4zxlzC7L/kUWO6JyihVfsbbNnJoCJBz4kbzT?=
 =?us-ascii?Q?PkuQe8GgDAwwgsnO4/GZhugbnPBEtygDLL14DBGK/FQfiRMN1sDcfewvPbXd?=
 =?us-ascii?Q?7fkAW/RxHlGyPWqIn21lRHx3ua4gju7TunVT2raVsjVQ1DoHHUisWbOSs9rS?=
 =?us-ascii?Q?zb0+1HKElyJ+aKvgHEb63lbpVgpP/K3h0iLzX1lokkCHPDUui7egCnXZuExU?=
 =?us-ascii?Q?T1roXX1fOpt+/QrUPykmt+SbfXR5EyEAIrkh6JBYOgYwb4y/ao6U7RkVEvII?=
 =?us-ascii?Q?004Dg1SONI/gRm7QcHH26XyYg3EYkDgDnYbQ9ZnnqLvSI4j/wJ0myD4q0VbY?=
 =?us-ascii?Q?MWiPIYOhXQLZbCh8+QlXMafYWKYxLLZgHUSaXIUGA+4cZL1ULciovhyeG8Bf?=
 =?us-ascii?Q?yS2+OVVzbJUr4ewcIr9B1+o/hFzJtMvrpXhnXeGXtekDVyyh3pc2lzmGoj7v?=
 =?us-ascii?Q?h0uvKk113mt2LaethTkZ1SvPw9jESU3UB3KQiWXm8nhjyL2CxAk3iCY9mA5S?=
 =?us-ascii?Q?dG03i7UA4EDR6w6av6qDsGJ0DOgZ2weHbaBwSvscJENiP8lRpwAVUzluWZJ7?=
 =?us-ascii?Q?y1obI4nUfzT0GjE+iJqpoCxDArUpJW8YLICHQmg3HlwAa5q6zPfEpCLqTn7g?=
 =?us-ascii?Q?w8Xgo2GNI6LE4kS+vNXrmtUxI3hm/w/+Og120Az0wnKKQ5DzotA4gU09fiz+?=
 =?us-ascii?Q?9H10cUEGgwfCwbBXPhsHPSnJv+ssGT6BQPRHm4RxWDp22xLzJ4AtwIN/wi0k?=
 =?us-ascii?Q?RcQ0HFZx4ogezbC/njk4YUoy4XnbWX1g81Oflv1h8MTLHOXFX2OnnjOxVnbc?=
 =?us-ascii?Q?1noynoPiIyJtwPLocwziN6NmOsFno4rSXWYL3AeOIjDFkIiRy9WOX9XExfzH?=
 =?us-ascii?Q?3zopwXcL//Uk34Dlh4jUZCSWw76DJg4vWyrRlbynhu8C8fRpj69sJbluqnDE?=
 =?us-ascii?Q?Qa4BeDuMUv1VXlMpXT2nl8qNOMLvmRX/Nw9hVf/M8W4557/rfQ/VJpuMQNQB?=
 =?us-ascii?Q?JhV4y/tizml8KBIK2OCVTq9+cEHqnpQwW3Pga59BqrHZxyTdSV8Yj9TSVD3S?=
 =?us-ascii?Q?J6wwK7ZKjo9AyQ699K2z9gf/KoKWc4GE6KCNVPw5Fh1S08RzThOC6MobwT9D?=
 =?us-ascii?Q?BSGnHANh8LrKuEOJlPTStzeSO7x6ck806h8oF5rusixkwILsty+mPL2JFQN1?=
 =?us-ascii?Q?Iz5EnoHe9iMAJXECsMStbMsNF6sU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JBg5KgCp344t6hOAZwQ2Szt4T45IHXViPDb3PXOW43YRVP677V405gOFwJid?=
 =?us-ascii?Q?PdLwlvJVGzPeMvBFYhrpqqzY9Tased5CJAoPws++oPWfZsw8U5EnzC9bWPBj?=
 =?us-ascii?Q?EYezK4h1XWsktgZwujwSQGX10OEPjM0pnXVIjPF48drtISTp6IKsMCa7G5q7?=
 =?us-ascii?Q?fdHSsa2jp+w4HIQ9nDGtUkRi2tGlVozsdiU2R0jypgq9ZMAMmx9k4HE0cwdm?=
 =?us-ascii?Q?psJ9Z6GL35pS6lNsy49JfMYV0ZTsn/DzN39SXEb1+aVpw2ZC9TRxyPgj/p5B?=
 =?us-ascii?Q?ci9SN/f/RGf8E/sZV2dUvdl78AidUjXy3nOddkUNzF9zdU7J1PE4oPMt9Yxu?=
 =?us-ascii?Q?+ExuUAMEsf9H9el6D0Kkc//fWigYNZBqlukoPqP5BXLaN56euRiU6jeVMW8J?=
 =?us-ascii?Q?01if+UANwOTMFmNvZjfLjul0VKyeREKXhoN1LYu72IDLDw+VC82J92PriOde?=
 =?us-ascii?Q?4MuVFnsCCSb931Qe97WH/7/g2QGWrRIbdqTmP+8oWO8XQ2vMSj3WF4Pjjgkw?=
 =?us-ascii?Q?KSc8jIjUcFQHOv/1Y9iH/92xMzSPBXB+Z4KP7jDV+DM6mX3p9jbXu522RHse?=
 =?us-ascii?Q?AP0UHDII0F+n2Fonl5gDR7/t0pMPyyRbfh7XoVRIclkamJwPYNUpJpFxGiab?=
 =?us-ascii?Q?njB1tJDFY6G6BMcXTv6YsLnag6LVYJuVZRw6+CXaIr43od3a0cf2ojRcTNq2?=
 =?us-ascii?Q?zC+FzaFwDT4v8GH7LnqVqptVYdZigxH6dxomj6az8Bdt1mtBzY3uAo4ZWHBu?=
 =?us-ascii?Q?UKQ4Z9LjMRhaNzJMlm0rqONQTXvh46h8f0QiNHelUV7fm76+h526OpcChaja?=
 =?us-ascii?Q?xFPlcaw769qZZKAmaUGZAJU8lB1jGtozfMt/zO2ymIBV3iuecDT8gGoCwtN/?=
 =?us-ascii?Q?EwSPY+t59zTpDcX3dZedz2MYPZu3znhhTSFj56Eest3ytYUBf2CzwMjWm83S?=
 =?us-ascii?Q?5nat1drSaeRU+etNxNdOQyPf++vkArrw5RCBySdncqtONQ0FvNqxeo0+S7Xm?=
 =?us-ascii?Q?T8AbVaRJisWkosLp8QQTNbwtv9HZ0o66TpCml9mReYHRzYVK1ujBPi/fb6vz?=
 =?us-ascii?Q?o7x8aSIxesM6sngK4Ap+VuI78RlMaocnlH4GAMeheNjHzdvllg8Xjqbo/Jos?=
 =?us-ascii?Q?U710GCdw9LFYra+D/x356DwDbI1lkuUM84my7qtFNjGrH6UiQ3i2eJIT6D+b?=
 =?us-ascii?Q?5NDECwf3nAC51BSAHaL64je7n/ZHVqwUB5HJ/Ebk7hbDRdrPE93t9NSXMqJH?=
 =?us-ascii?Q?gwy4t2SXP+vQdw99hF/GAB8rgByhqfR5laRV8Z8GjUtxu3SlgtfrZZUdVVl3?=
 =?us-ascii?Q?LLHKYidmkPYRrd327Mpa4QE2U/MRwBZ4KlK/i5zoFrRg/47ZC/GVNpnACy3J?=
 =?us-ascii?Q?QaLn0rQM5zvcJJoIB+f3QYIerku+GMiDBrCpPHm4QGrFZSYaXfd5SznmwRh3?=
 =?us-ascii?Q?smCEXX4YiBuaiZ/po+IdEF3ryf5wN4juiq0jSttMo+ujd4Nr5j5e8HdL9uoD?=
 =?us-ascii?Q?KAkjfDyZOAFUsufemcwS8izCNjP83c+3Rvxom3Wil9mCWLHA08DWo/CbtSMj?=
 =?us-ascii?Q?NEA62K+pWlPANjc/8J40ibUPGYnfEZrO8JJ2IBxZnYfgthEOjVRAtDfvmqG0?=
 =?us-ascii?Q?9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170734c8-39c0-4c52-7002-08dd7393f580
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 16:15:47.2254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uD/gdrE6LJlyGmYIHWVVE348jQJTmf0pKtIAO9OvREvxIyKs0Vp5UPWJR6k7R4Ex0p7fG6Hth+vVwW15V76xzBH3YvefN/CeOTJ4XJHRkx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7256
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



-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: Thursday, April 3, 2025 4:24 PM
To: igt-dev@lists.freedesktop.org
Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com=
>
Subject: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST bandwi=
dth constraints

Instead of checking only the current modes, find a combination of modes in =
the MST topology that can be accommodated within the available link bandwid=
th.

v2: move fit_modes_in_bw to lib/igt_kms
v3: update tag from fixes to closes

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c                           | 24 ++++++++++++++++++++++++
 lib/igt_kms.h                           |  1 +
 tests/intel/kms_dp_link_training.c      | 24 +-----------------------
 tests/intel/kms_dp_linktrain_fallback.c | 18 +-----------------
 tests/kms_display_modes.c               |  4 ++++
 5 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99c8707c7..f8274f49a 10064=
4
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5046,6 +5046,30 @@ bool igt_override_all_active_output_modes_to_fit_bw(=
igt_display_t *display)
 	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_o=
utputs, 0);  }
=20
+/*
+ * fit_modes_in_bw :
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Tries atomic TEST_ONLY commit; if it fails, overrides
+ * output modes to fit bandwidth.
+ */
+bool fit_modes_in_bw(igt_display_t *display) {
	-->have igt_ extension for the function name..
+	bool found;
+	int ret;
+
+	ret =3D igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (ret !=3D 0) {
+		found =3D igt_override_all_active_output_modes_to_fit_bw(display);
+		igt_require_f(found,
+			      "No valid mode combo found for modeset\n");
+	}
+
+	return true;
+}
+
 /**
  * igt_pipe_refresh:
  * @display: a pointer to an #igt_display_t structure diff --git a/lib/igt=
_kms.h b/lib/igt_kms.h index 0381c82ad..fe01eaf3f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,  void i=
gt_dump_connectors_fd(int drmfd);  void igt_dump_crtcs_fd(int drmfd);  bool=
 igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool fit_modes_in_bw(igt_display_t *display);
 bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);  unsig=
ned int igt_get_output_max_bpc(int drmfd, char *connector_name);  unsigned =
int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe); diff --git a/tests=
/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 9e9b1e6db..9b6248c6f 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_=
t *outs[],
 	}
 }
=20
-/*
- * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
- * output modes to fit bandwidth.
- */
-static bool fit_modes_in_bw(data_t *data) -{
-	int ret;
-
-	ret =3D igt_display_try_commit_atomic(&data->display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET,
-					    NULL);
-	if (ret !=3D 0) {
-		bool found;
-
-		found =3D igt_override_all_active_output_modes_to_fit_bw(&data->display)=
;
-		igt_require_f(found, "No valid mode combo found for modeset\n");
-	}
-
-	return true;
-}
-
 static void do_modeset(data_t *data, bool mst)  {
 	uint32_t master_pipes_mask =3D 0;
@@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
 						  "Unable to assign pipes for outputs\n");
=20
 	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
-	fit_modes_in_bw(data);
+	fit_modes_in_bw(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
=20
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_l=
inktrain_fallback.c
index 6a872efd2..64f21ec6f 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *dat=
a, igt_output_t *outputs[]
 							  DRM_MODE_LINK_STATUS_GOOD);
 }
=20
-static bool fit_modes_in_bw(data_t *data) -{
-	bool found;
-	int ret;
-
-	ret =3D igt_display_try_commit_atomic(&data->display,
-					    DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (ret !=3D 0) {
-		found =3D igt_override_all_active_output_modes_to_fit_bw(&data->display)=
;
-		igt_require_f(found,
-			      "No valid mode combo found for modeset\n");
-	}
-	return true;
-}
-
 static bool validate_modeset_for_outputs(data_t *data,
 					igt_output_t *outputs[],
 					int *output_count,
@@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data, =
 {
 	igt_require_f(*output_count > 0, "Require at least 1 output\n");
 	setup_pipe_on_outputs(data, outputs, output_count);
-	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
+	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes in=20
+bw\n");
 	setup_modeset_on_outputs(data, outputs,
 				 output_count,
 				 mode, fb, primary);
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index 58=
8820170..f2bbfafe2 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
 	mode[0] =3D igt_output_get_mode(output1);
 	mode[1] =3D igt_output_get_mode(output2);
=20
+	igt_assert(fit_modes_in_bw(display));
+
 	pipe_crc[0] =3D igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE=
_AUTO);
 	pipe_crc[1] =3D igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE=
_AUTO);
=20
@@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
=20
+	igt_assert(fit_modes_in_bw(display));
 	igt_display_commit2(display, COMMIT_ATOMIC);
=20
 	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]); @@ -158,6 +161,7 @@ stati=
c void run_extendedmode_basic(data_t *data,
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
 	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_assert(fit_modes_in_bw(display));
 	igt_display_commit2(display, COMMIT_ATOMIC);
=20
 	/*Compare CRC*/
--
2.25.1

