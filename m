Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA926C54FCD
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 22:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D3E10E07A;
	Wed, 29 Jul 2026 22:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akx4N9Lk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263DE10E07A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785363394; x=1816899394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VwsVUXou7Y86eDKBuxke/WgX7erzBXW47J1VkDBXE24=;
 b=akx4N9LkWZgsc7SiOhDS+U5FZ9k8IVWb+E8Z8u+gIL2ThRnJcGIkjKKf
 szjkOISKsDA0Ey/iuqOvUi9sO+7mLA0VCrfqHB+nbsOc/zlcibZqXGMUf
 TYKDOv7Easl4/sS7fV9DuBGZIj4wKzzPgDmCsC62MMiQhVykfd9LnmDzp
 gVdWidCdIi2EZwWDQQzMgEYXFC8gGYEefIdjJqSwj/NY0hz9UnVjz+OAk
 qTxCB5561Qkl0bOKW4rFJoaEse2o+L9xvdQuKTlkGy4OHdsO14BA2gIOw
 3zxgbksNlZDEYBY0okMyfBhdxjYYYrF023WUVsWqyMHjREyzU83jS+Nj0 g==;
X-CSE-ConnectionGUID: 6CZkwVgxRqC5lDdKvNZatg==
X-CSE-MsgGUID: VvWIl0YAT96FEDVXb1jujg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86058576"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="86058576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:16:33 -0700
X-CSE-ConnectionGUID: HHbFmVK1Qe+tnukBwsVGGw==
X-CSE-MsgGUID: OiAyizfsR12xujo6jeGDiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="259547092"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 15:16:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:16:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 15:16:32 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 15:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbflZsLDjcWTdP4Zb2GgGcRQunZpHkkAPclRgO5j/oVFvo4sUAQ850bvicGWYYYC4C5Je/B3lbfJ8qilzhwzVB4OVnNRH/cDOg5sRYrl4iQnku0BZorSQ8ZLQjU9+0ozh+xdNmgSR4eK1A8diH3tUC7MAT+gzYpwXgnlDKUZj3oXuePY2IbfDLY6s21sKT7+KP+ovNPuueYmMTUhdtn9son8QETHpnmhsBEXFMDNRoEqZ0KKBaOXmGXSwhSoXvWe+FpFTXpWj8gbEtj1vycV2C8HCNeV6Z5JXIsEpjr1qUdCVnfSTSPU3Ayc9JI0Z96Gc3SrVJD0RT5wI+foW7gbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pz/DIiacnQ+KKZpbqkhwni9li22tqm72PA0SVuGmmMM=;
 b=ccUYavE/xzK5UgDDGqGmArOq0k3DEpSJCc5XPnlhhR/k8wzfoBEGL88OyBFT5RvQ5aX7nJexpIicy8JP4qx2DTNV/71pETvvYMyiJkoRaVTmZisCh/oAqsp7SPK8bRAraAxppuYGT1Q8bD7gozmCBMOuLdlE7LQxTAN4afITu6CLKDt5ZRkyMAiKngSONBCi6PLlyBWFIZ4FfNkE92gCyTojJ5b8rU3UJYqXJrJGDeSHNh9X6qvNV5Ik9KJKns3Myl9z9ir4hsO22G24EhZDqdGxqnN17MXohP+7QRP6cC1Hfym+1UXAtLws2KiV6JTDlKTuT3DY9Lt4i5Qcx/0LOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8416.namprd11.prod.outlook.com (2603:10b6:610:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:16:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 22:16:29 +0000
Date: Wed, 29 Jul 2026 15:16:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/10] tests/intel/xe_pat: Adapt pat_entry_is_wb()
 to Xe3p
Message-ID: <20260729221626.GF7790@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-6-0c147eeefefa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260721-wa_14026539277-v1-6-0c147eeefefa@intel.com>
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fbc385-f18b-418d-e48c-08deedbf095f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: YF3yzz573xYjxzcj4FYsoaqC5uVkQxJCBKk9cMFYliLGX7L38hTvMWi674T4Z8s/uWhCV+WFYpwsk+ST4IcMcld6G4Vu5UCAXdmVne2JGCao0j9f9RIoHhSpPL7zTJ+bah0rZfTUyOJ/fmHRQds9hW4/rwlOp0LRBAq0obHVSIoYNHG9nEPu8+Vfr7q07CroZp7RsypUpu+Cy6o+JXIT3zNLz64iTBi9qvlKxDfq8on7r+afjLtStdrfP2XYaMqG00ICsu202WM34VAsglNHz3tEk/3pNO4DY+rBePNe3p6DA4eBThHC9yGGFkRw6b/5RybTnGbOLSgWIeLSJ9v/b6Qy0FPM6WlCSpzOGlWgTzx3ba2/RwKwBg++LcuCYx2fdzytsyyN/YhI+7DdEyDYoMqNN8SZJJLEF3/lIiabTR4vTNE4io+GWTBuEquCHYJVNhXef9sE5rqD9lzHOOd53JrXJkMTGazMyYeNlZTbusbptGtkmZJzdbA8tKeM2caffuO33Ej9GXLlxVVaOf1N2/eELObJrzu4VNImD+/AzzqPxrkjSOAtjMMTNPGFCQ121GUtkcbGxHQrMOlwSJ4BSgopPLkU7SlChmK2Cr94cBK/XLIyuGfJyqpgbrvogERaUCUvZuA2tWRaK8O/B3HT99A9xTjiZPRbNtMM58QcSIQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/hj/Q4tv4peGvKAnVGF0MHpokgkXR+DnsYjAJ9tT/gU6MW+5iSQ0b3EerH0T?=
 =?us-ascii?Q?cJwFP6XzdTaRnuh9rac4s2Ovqol5lAaWgzztZCSrZNEKEZ1USdSWSsnVerER?=
 =?us-ascii?Q?Qd5UwiziGKNN88BoGoeTSEc8U6p487LCK1vNzu38q5Wvh5QJk86qL+59u+U/?=
 =?us-ascii?Q?+wXeEex2UKLTRB+SLNQjF59zWuua/zIhwynUnKAtZ/5uMEewM92E2PF7RnUV?=
 =?us-ascii?Q?kI8TrVINA6JLi8iS6UbncpwLDAaZRJ2vfpmnj8gmnLR3eSp54VUnJwEochmD?=
 =?us-ascii?Q?CEdhy8aIaGy6AQjggVD+KmqXrZ1T8nutFuT1i34MZGOMLN3fOt6nOZ3tSbcl?=
 =?us-ascii?Q?LOreP3S5kGQyrjgfJfWM5xqhViUOtRZnHWgdZ/jJ69f17qH1ZW+gPe8mg42d?=
 =?us-ascii?Q?AEUQzlxT6R2tHMTtgg+oeqx1ZPufm/MeHjPttxnMbFQDAYMM2PUeQquDU3sb?=
 =?us-ascii?Q?rY6N1K9UbpKz9WtYFLhwwq56Syegajgf8flJrk4a7faB0hLaVhRSfLtZ+oCQ?=
 =?us-ascii?Q?gZi9KWDRmwsJluppWsf4pTz10S1Y3DCyTTkOg/fuG4nzJUls7dvycD/uPR9j?=
 =?us-ascii?Q?Rhg8FJoQqNuRru5Nw16y3qtSIKXrM5j7nisZWVrN77JuUeKD1oNL3Bv3/iMc?=
 =?us-ascii?Q?0ZaEKfOaJ689DwXvUYE8Ev/P6GyGO4u9jVi2wmV2H9SpQYJJe2ixtwIxWp1D?=
 =?us-ascii?Q?Gip68mz2MFXSn2LV/eBdXiHekUd+Z2LB6JNzhFkmshLnElqJ05PcAKtNYBd4?=
 =?us-ascii?Q?heTjGEgl8VSchHV781L11VAJji+WGTY9ftFFOLyGNgb23PlIJY3N1lEVq4rc?=
 =?us-ascii?Q?u9JAepPkEulDVvdxtkQ0sYbGWGiF5YDqEUVp129WFmAhJWe5M1nSCm3/yyUS?=
 =?us-ascii?Q?FHIPQP7ekRQzeQ9XdgTEv4HF5T70WbOGX7dj6ORJwOVI0xwnRLyUGNwuJrZi?=
 =?us-ascii?Q?pViFMFZiI54QAHdBN3LrDV3W6PE5ZnwI6OjbMM6ox1/YCDBQm4LsoUjxtG8l?=
 =?us-ascii?Q?cyYmrtP8bmFNpatudUP2tLrFUNVhGgdhQ8BSDJS/EZteHuGt/vFjYrP+u0p8?=
 =?us-ascii?Q?gNJ/z2cMKJZ2iYd5+Tf4P20iCO5y818eCW4o8OJtoPT+v+o5URH0rqAAgjhB?=
 =?us-ascii?Q?SsqKPJx9twxtwE01shLsF92vMp4DVRSRzqnWwsQzIifUaYAPqX4gh3ejvvRo?=
 =?us-ascii?Q?GiipIYb10TnnuVL+FhlOptHFpCZwMlyBQh3SS6ehSFjXpzYIJO4Bqdt66mHz?=
 =?us-ascii?Q?GDF6G5hvplt18QPt9fhIuNPq9ZgZKFboiyt3B5D6dvYMFSJtV/OQb1Jyit5V?=
 =?us-ascii?Q?xxG8pPG5/DAbnOlIZffuy8RiGZpOBIAone2QWCwZ2/JE4aLc9wMWFIKViTek?=
 =?us-ascii?Q?JAXg4BQlBh+XKhiC1VwiqM5OjumrK+V+VxTx4TpOt3Y4fzJlbv8ELU1jNCDM?=
 =?us-ascii?Q?I4ehI29xaVMv/sqOr79EeMFszATJWgWIGfy5anlCU73KDc10qFHmzr9d5jwy?=
 =?us-ascii?Q?onO2h4hrtPWzrOehJENVy/fbop+9V2LkLTKeCN6IwXGAvRRuZAmPAV3CZ+8T?=
 =?us-ascii?Q?GCBwglzaAHHDOu5DUOJq6qVBXb+Q0MefgrsiKzqTP5BaYs51CMk0ONrZr2nK?=
 =?us-ascii?Q?iDeHYYd7fFoYCWvzIQ4RaVaHTofnFYnQ1a8jvzci54tDmJSDLRAdof3q1VtB?=
 =?us-ascii?Q?cg4rT4k6OvjZAdJLQPk6exXJv0biz6I9rzpiJDcIa9Np/3iH/TT8/CbOxWom?=
 =?us-ascii?Q?t4hhXyLfzpxi6E9YtQp7CeLG5IbvarY=3D?=
X-Exchange-RoutingPolicyChecked: mev/eT1hahIZp+wep5QWX2cskBPPQ1UejtcJklZXW/sCdtbwpFTW/eQnyo9ZnxLgC5UX24yt1OWPFqEhJg27HtOxKp/zZ6m9bZ9ARd9ktzMwSc9z5chlN0dw+d353Zg3vcyXAggejSJijJT2Z5ahAzoO3x9Rctpf9V2qJKQwlEs4Rvpnnq4sFvc3aR/8h/LHM9xBZboh/sUhF6vpM/aVo3RYE+psSadbSly4AQ+iKdWwM8J6IdrY0+3y+14PG/IG3LcM+h5q/ifTW/vTMZrGWaR0z/VAMQmMOCRYsbFRFvZOB8/eFXab2toxVfhdhCY9cPb9cnD0jlZkovquVXWYRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fbc385-f18b-418d-e48c-08deedbf095f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:16:29.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVGdGMRGtu6/uRUwbzTht1Nm+rtYFLsxyRzt31lTCZ4fuK0cOaSV+HcpBY4OVsR4AHXI3uTWbqVjJtUy+hPwYe/d3cgoX4iLnHaoozhbJaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8416
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

On Tue, Jul 21, 2026 at 03:59:59PM -0300, Gustavo Sousa wrote:
> Xe3p introduces a new device-cache policy called XA, which has the
> longer name "WB Transient App".
> 
> Even though commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
> authoritative PAT source for Xe") already gives a clue that XA is a
> "write-back" cache policy type, pat_entry_is_wb() doesn't really
> incorporate that information.  Add the necessary logic to
> pat_entry_is_wb() so that it also considers XA starting with Xe3p.
> 
> Bspec: 71582
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  tests/intel/xe_pat.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 9dd4ffb69d11..bb2975b545e6 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -142,6 +142,13 @@ static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
>  
>  static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
>  {
> +	if (gfx_ver >= IP_VER(35, 0)) {
> +		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
> +
> +		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD ||
> +		       l3 == L3_CACHE_POLICY_XA;
> +	}
> +
>  	if (gfx_ver >= IP_VER(20, 0)) {
>  		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
>  
> 
> -- 
> 2.55.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
