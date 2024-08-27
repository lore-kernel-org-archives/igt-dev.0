Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CBDC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 15:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E62510E0CB;
	Tue, 27 Aug 2024 15:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0aoXtv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588FB10E0CB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724771379; x=1756307379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wx2fu7NSfcjAW3RfIAJYSdso48o0w8cH1jdihKdbtLU=;
 b=N0aoXtv+t7fE+4qq94RzW3+Sq18zFoPeLhYWrTk5/EVfSP072Q8+zkfB
 1od4HwM+wvgtw4JvjTDiHdAYGfHzfukS8YR6F2McLZ00jiyMsbivw+i41
 lW5iVIQjq26am8CuxAp+N1iXAOEOSzsJeh15WguIIT9FoAsTc4h/1S4gT
 5gs6pXsHmaTCs0ydjiXPj4yajXL6NO+ZEJe7erMo6qvglMEAWvnKt1oHB
 Qof5GF4VRG6fdd9vqyIsDIdnGBQbsiULh30QRhb5rYi/yDYGDJ1qmfsu9
 v5Fev8dFNkjhpm8F1TdV1cxg68D4Ic0ZMArFOIOYGRzTyIM1mYcuxxuVJ g==;
X-CSE-ConnectionGUID: WLNBw8A1TXW0+Mrz9pgMfQ==
X-CSE-MsgGUID: eYO6Dj5aT7K+jSDVoF15BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45772969"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45772969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 08:09:39 -0700
X-CSE-ConnectionGUID: /mkr/bmuSDC7damVDp9JkQ==
X-CSE-MsgGUID: +nNTKdzhRhej+yiBgldrHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62734119"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 08:09:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 08:09:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 08:09:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 08:09:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgVVAvd4xPlUn37lo5rT8I4pGr5yvAgg5GM9FaoR3zGT4SnIQyZmmzJl/koyXWYbzqVhuuiAXGRmCNQ0BRQS/q9gvUJml5sQRCflC5YzT2rnj41JRF60JW+mgVhWPcgdvu6/401v2yZj6AqnfisN5KN9YW9kwDhoMcPaGmLSbxvxps5p3XVeuV9GzmNta93gRFezRwTWNUPOdiYbuAhaEn/7CZ07tuQ9pIyZ1fO4Gcr8mOAo0V5mEHOMvNjpyogMTKjIIQMPH0XYj7dLkgrWXIcUalW/mKI1oeFoar4+92XISVgKxNIFoIBpN3oGbX70yGmSaALVAqE6h80HX5wGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HEhSptol36842bhFTWZ2uvQ//8PTklVvctfCt7fJBc=;
 b=R/sm8NcL63mz+4ARx8ggBrFyTUC/4qn5qq04JMmrFSsGkICuvkF74ppQf4cmfREnPs9zcpatuizqKWiI2vRn+2Hl94yr0bd3pjaeeyLm6oQEKwGnLaXUvRZCea5T5KtlyJrfGMlVarnuDgapdLu5/0N+HsJt1Y7iv//oJ6eJqLqPczAw4rg1QKAyBaxjh9Eg/mQgsJ8lpMaeg1gFiwzs+3xQHbNNf99I30Wv5HijxWbshr7hYaSP7zZ3L9SU2u9KMvigBnxqJU1kVod9rMJasmojbNN6s0MbWdHpdZu5/802YHSteX7wCG6uwITcWUWQomZnki+wzKjuSbRNvuXkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Tue, 27 Aug
 2024 15:09:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 15:09:36 +0000
Date: Tue, 27 Aug 2024 10:09:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Be strict on
 == 0 comparison
Message-ID: <ypzxsnmynbv3chjxvg2r7z24v5pjpgb5egtifvpyhiqkzffuow@zjdhakuxouvr>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
 <20240827055129.1671873-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240827055129.1671873-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0310.namprd03.prod.outlook.com
 (2603:10b6:303:dd::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d55406c-2f8c-43c1-0da9-08dcc6aa43c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MtHRwlitEaCPi3uVoxZWM5sBNUacWONyGOyQXhqHe6Eq/UgGkjeFCyaFVG/y?=
 =?us-ascii?Q?Z6/5lPSUsvq7J7OgKtpZ7SetWT2RJnJmxjVhKOJ8K7fAF3NsdTIsyiuAF7kO?=
 =?us-ascii?Q?FRY7lyVz9sHBk2zmah4O+F7WzLK8uWOYD/yDh5yMuy0vJPy2SfbYaKxLAgia?=
 =?us-ascii?Q?AlhJJnhIzFie2iiR9YPirB7cj8Hs28vXfhNp6qZbXEi5/91Hv4SzLNKCiAHg?=
 =?us-ascii?Q?9NvvqV5Nn8fzrmTFhm/lTZj/TSJ2ogA8R8RhLONGE6NndpZuvhX9ZSKxWpeN?=
 =?us-ascii?Q?VenWmNc1gowznBuIdFtAwQpeF90naxWqYmx2nslGmS6gHxBW4Zv4/sZ5PFbu?=
 =?us-ascii?Q?w5yj/K5AcvCZPNWRBa6CdC4hKmmLTT63/hM7R98xzWExidm/9hIdz2/1AbVc?=
 =?us-ascii?Q?8gLzq/lhMmouEkqkl+C6EGdDp652gIxALS2TGHmQI3DNvG47Iz2N7menb2qQ?=
 =?us-ascii?Q?fYdXiRdMDdCbmu6anQoYXLKqYR8Im1c66bbkwKAfCrs6n4bwd4jM7Wc+9th3?=
 =?us-ascii?Q?TWKO7gBYXiL5MY3HPZ3ggSqL36KTcmGHreu8RS0maVGp34+jXI4rA/fmKL/k?=
 =?us-ascii?Q?iW3WYWum17TlyfQJNty9Uj0Q73/ODKuscPxIHtBU8GOhcaEBv/0TV/xnAnij?=
 =?us-ascii?Q?AL5QuXfNRRLnz0kLVS+NC5AEAdFBZwyDbgsRqGEKZwPB+TOOWEEv5HjRs2FY?=
 =?us-ascii?Q?mDsvhkZzBJOnreQ8q52NSWt03p3iV2aG3INqkHtwlfUMg9eiEbOnl24jeUIm?=
 =?us-ascii?Q?MXWbcvwG3R0QIG9NiDoBndP7AYAGkLSGAzHsQUrUb7wJb27M46eIxeoV607O?=
 =?us-ascii?Q?bN/fTCEAhBm6G42EWKVxz5nzk19+QaqsP0u9iTjBPtW+BIEdNgSswpzub4Ac?=
 =?us-ascii?Q?qdIhj8MUrqagsJ+USapNJyV88qcwOD2vOXWgAJ4q0grXNZLMVppOc5Cz+XhF?=
 =?us-ascii?Q?+FwMgwE2auGNQURUNjSX6ut9Gvagbq26NW/JoNUGJGksUCtG3+7aZIo8TZt9?=
 =?us-ascii?Q?uQO7k6/lxAq1F6ZqRbbmIBdQ5//AvhjUK6WRIc/kSZYpnjoyjfeiMlbezJjO?=
 =?us-ascii?Q?/K4p2rw1G/im7w+wKY/Wz5CcFPsqcF6Ehn8/pSz6D92tJTAA5NZoU+3Dg4G0?=
 =?us-ascii?Q?KgZgDy7JqoeVkqdNksM63gvBdZaJ92pM032o5hdc9xbYjq1w3UTAHkPQ4s9k?=
 =?us-ascii?Q?ZoClMgSSMC8OQumaFPQo9Zde0EeUkALv19mwHR2FER7+QR5QkmqM0/n08BXf?=
 =?us-ascii?Q?oq7nnTkhrM0o9YTUVfgdpkcMV2VnrmmF43V7H1DDU/vsajH87aJOhuSzPwrR?=
 =?us-ascii?Q?5YTxiyvSm8cacNixSexKESuMRvkXMCjpdGlgLSHUqqNnAqtx+aOHuHDb0FPF?=
 =?us-ascii?Q?8c3PQ6UrrLzuVViCrRAtfOf6/cTQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FOCZipP6614IBYZhrDT9dLjGg1xJgSUMrAGeIW97J5ZjPOlflNNG5MG92/V6?=
 =?us-ascii?Q?HxU7Wv8lmbd20tkUprzk1Us7R8nCE8Z8+jrBEAAMkZyXU1r5j098nrOY0pmN?=
 =?us-ascii?Q?TWkZJeDGD9d8O2KYdpSm0QoSOOf/hb+NAhLRHbBDXG3u4RWifxTyZ7edNUhb?=
 =?us-ascii?Q?QQGFR+UEbydGnngOExuky/7sH+wkMhS+3B90s8PJPnUYXC8+Zr4cOSb9FAv/?=
 =?us-ascii?Q?HVx0hEJ47yCJ0qUIrI0YXH10Ek4Qw/u4wP619onivmzCOhIAZWBBmmc1jcSh?=
 =?us-ascii?Q?zOJoaNBG/izGQSTSCzPijHtTt6ADsUcgIj3YpDQN60sL8KsCc48hxGnYgHvx?=
 =?us-ascii?Q?xPBkXM8eFGvCGBuDctyNU6wNSPso0i4yboFE1oVvt4P7uRb2C8WKd9rArC3f?=
 =?us-ascii?Q?uZyAwqKvX/Ph7LkfAYI18Zml2Gj65VIGkeEFX/pkZzAz4WKA8fQJdnFufnw/?=
 =?us-ascii?Q?CuLRu3McfznoNeYRwcHVz7LCJUctPWiSr3wyeexuFTUmVmD5oxf0wsb1Ay4b?=
 =?us-ascii?Q?Zyaqh9Oyyf3g6TYUJR1IBXcAE1Hhci9/ppceLZ7XeYUbotto4/0CXQC+4tO2?=
 =?us-ascii?Q?9shjd0Cawfdd/z8XCBfcwyaUpUDXlCZguMLlo+JvUGVA5GvFwKsEWgaHD/aD?=
 =?us-ascii?Q?OD6fobgIHQXzSxdPYsP0Y1hVeefq595IRkPp8PG11dTeGcTum1NPqH2auRO8?=
 =?us-ascii?Q?zC8BLcXEMxN0tCB2C9HR9+tq0V8JXlKdaofN9IOm6CZ8E6D4RpAvwsdjiV3l?=
 =?us-ascii?Q?q7lgUY+Lan/PHlMQfjxzr8Oew+2rdNsDldETE4qla2QQghOWvGo2bNnn+RZ5?=
 =?us-ascii?Q?cDnH/vAG8JkHTgA36k8QXT+vKSr+Zec9zn7CNsVFeB5KaB1n2ICAEjbM8yzO?=
 =?us-ascii?Q?2hOTBjtFzuOcn540VODTeld7m61KJlCiTzSb/bcB0z+czaBJIQT6pvsPvp/o?=
 =?us-ascii?Q?8W8a6GPTT+YY2McMaMVJ/uzvJILOZ8zQkVZS1HMxYf9fmAZlBmsOFay6awvz?=
 =?us-ascii?Q?YYZlTvcAxfpBPZTu/XJVwixcUVMr14VQ7pZ7RQSWosh1Cgrl+k3HWLQlCHPx?=
 =?us-ascii?Q?Nxo//Yc+2fm5qvNG+6cAjOFpJlA+tmbvaRkYW3+8kwNVVIehB9Ih+S/cDBMG?=
 =?us-ascii?Q?IUg3Dttji8IkjkbQYwRw36Dc5lq/1mNR9q+Oa//lxpn1OW48vU8afGgWCO+6?=
 =?us-ascii?Q?i4Ev2iluHGc5Mh6nVGEM3hiZS/rY+JGJsMPu5L+iRziGW8/L48I9h9uld+HZ?=
 =?us-ascii?Q?i0tNEFmCirlJj16scrlmh8JdnEwikCup4aEv4cyNewEowBiRYUzNwm75paut?=
 =?us-ascii?Q?n0efxG2+mX1rSPXOuJmtXCN9u+xcMA4hzGlgEfSTEjC7a1+XIV1xJUEYRGYk?=
 =?us-ascii?Q?C9hXqs6vnuJ4SWBbVOIPaHCh1idTEKQk7Oxkv3Xkfaqna43tCxYwiPut9Pv3?=
 =?us-ascii?Q?iCh93yZYwzey+vo5K66h+g+d8PAfve4Or4X/1qNo+MOe3t4D8xo3y7gNF6ax?=
 =?us-ascii?Q?ccSSInt2cCKE7Cq2TRUJZlj1q/Fxkbg+NGMin22YCoWEgvuvcZN1+KncHoGq?=
 =?us-ascii?Q?wcA2GtI7jukIYKz+ppo2rakOOCl5sAnHzHsFgK2j83aRTtyaNJOpYUw/97Hh?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d55406c-2f8c-43c1-0da9-08dcc6aa43c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 15:09:36.4696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BegubD9T1H4Xp1CwFeli4jTGJftAzuf+VstIX6d3iLkiYLq6plJNWOP8tRciYnQPPacdqvmRHkYP+cG/9KhCXrYA7B3K4SkLy5fN0byBO20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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

On Mon, Aug 26, 2024 at 10:51:24PM GMT, Lucas De Marchi wrote:
>Do not compare the percent to 0, just make sure there's not a single
>tick in those cycles.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 1b5980752..ad563aa20 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -489,7 +489,8 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> 		igt_assert_lt_double(95.0, percent);
> 		igt_assert_lt_double(percent, 105.0);
> 	} else {
>-		igt_assert(!percent);
>+		igt_assert(!s2[class].cycles);
>+		igt_assert(!s1[class].cycles);

oops, that is wrong. should have been something like

	igt_assert_eq(s2[class].cycles - s1[class].cycles);

or even adding a `u64 num; u64 den;` to help in the calculation above.

> 	}
> }
>
>-- 
>2.43.0
>
