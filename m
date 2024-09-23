Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D8DCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDD410E49A;
	Mon, 23 Sep 2024 20:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaFnYq5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB17610E49A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727125062; x=1758661062;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=upMzwNa4yZSPOkDdPhlBrVMINOorYAJkkspmG6jCvSU=;
 b=KaFnYq5LpUnNTd3P8vW7fa6eJEFfTs+fFWbM0bjxRUi+OtKuqw2J1dxK
 1sX7xQN8H9ZB3nDWW0jz5jaZrPeoKw3YctncDECJdaWtLjdg1yAydZun9
 3raVZWGWRe58y2vlsgrnxKgoD18HVpQkUJC//2l/An5JS9sSfO/W46lsP
 svaASB5ootEKuA5XegZYYQ8o1qL5Geoexk1TohSGu4znepU7GccUxWcHv
 UYQWNNPBJZKOVv2Ka5K0yowgJlF7RN4sCS5heyMp/9thgDBZwKw8BQ0Tk
 jXProe4jE0/Bt/q41aDMl6zDVFy3U9GmiQn3XfJ/qo8u+OWW7hr/EdUeL A==;
X-CSE-ConnectionGUID: T8CaZCwqRTKr4KFW+1sX4A==
X-CSE-MsgGUID: T4BGlRbETmmQsE/j9Yu44Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29979653"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="29979653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:57:41 -0700
X-CSE-ConnectionGUID: TKAGmgJYSDKqosfmCABBZw==
X-CSE-MsgGUID: C8Gq9KumTLGOrSfHFE7PBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71230670"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 13:57:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 13:57:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 13:57:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 13:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcGI12I6UWR+MdeWE7F6CNB8SKgUjxoD/c9zYTX0u7Sr9ZqKc/3VZ/gV55zwjFjI0GQ9X6EGsfkyLRUnuvAVM8q7TDC3eVxNDwRrln2L45Q1g+5skddubWRA3Fkqd/GYDYunT61ppMpO3aLUYqzoqSLWAj5KugF+hPLY5/TBtTCTqPcmP0DIAu0qXMgmU29nroYfzortKy2b4VbM39sztWM8LKqqLKdxNrmSdx9hIsH+Hw6LdjN6iX8FLMUKN9g2N2NA9E87tHUEVA6JhpuUi6AXI1noIbbQhVaKINFt4WOODsJNwQxhG+Sq1J9XPZgocGOAXNf/ihQhrwW2J/NjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArBFYVYuFiTtsFMeVHesB0akAawYkkn44cCfmi43WLs=;
 b=l2Iv14elSmVHz7SChivcnh8FRMwx5iWwJoqmyAQW0FuHx/HEpML5AMD7+N1M06T5UovRAsJ+sgS6gZINkkQS2fp/rxtohjD7N7ASjlPDMOROdH7JsihPCgtu4sS/ONZ4TG+SkUP4Pldsl5dzXirUirnh6y4clKZnQ2cWUbwDoTgt8uZLAytbKOkXsyhC7m3NvOA3e2pQr34lvziL5OCzGk4TsQZxbDHhrTbZoPzPfGvkh9+r5rdYcL/uFtFgCopTGJqNx30m7uB05Ca2BiArBfQ4DZw/KL5rHT6KIqAFm9rvr2juQ5iYb3q7fyo5tmw2HlfNy0vfRdOxJ6FITPwmyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 20:57:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 20:57:38 +0000
Date: Mon, 23 Sep 2024 15:57:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/6] tests/gem_ctx_engines: Fix gen6+ check
Message-ID: <4uqfzmmxtcdxhoxxbc3me25gaqajdiix2yvf65irkldnvg4dnv@kcbcf6mxa6h7>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923204557.32123-2-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:303:b5::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 512710f5-a994-4b72-8fd2-08dcdc125b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sgi3hKhcF6PEKAamS/C1RuWnnbKvXtdIfOGUDLIvugaRpRmuekvPzpMFfe?=
 =?iso-8859-1?Q?kb8al0YOS4Vzt4bJ87DVVRYzgiVQSdLPeVOvsogdpFxclMMesHVCq9Unc2?=
 =?iso-8859-1?Q?bydfE+f2BVVnrPerH/r3FAp0l6cNeHF5AOYBAcoxtBSGb5aWgUgWPjay/V?=
 =?iso-8859-1?Q?BIvj57dx8nQ9OzesBCG2e55bH3R483CkMNIU5l54tq8ScNcR7wreC50TLW?=
 =?iso-8859-1?Q?F1KWYZiHRBtxMZjWZ05uzNT9U59FW0CdIik3Cul6FcH7VYVs0qNqbHi90B?=
 =?iso-8859-1?Q?AyV1V36C8Tcj8QCp7gs5C/Wvl5TuZCLATNkN7Bp03ri9T9bHXRJJ46s59/?=
 =?iso-8859-1?Q?BE12Pj6MENU0HokMgJeg5ibnM1xw7cctxADj7OlGZ5R1Un8m168CG656Gy?=
 =?iso-8859-1?Q?Hw3x+EonvyrBSYVPJ52mL3xefekL+ca/1CoRZfkpLSe7koS4pl53RIziN8?=
 =?iso-8859-1?Q?os+DVqBcdtKftg62lu8L9FM2NX/zoaGbis6fFqKg4RVaxfBUNTJAcSsAs1?=
 =?iso-8859-1?Q?XVtUemdlWd4CwIxVsKD03TJPzTpxjfSQQjoqiK/QAF0Y2VJnXvhaGcdRKS?=
 =?iso-8859-1?Q?WE9Azl+IlFWBmfF+1AmZqU9h44+fJGC14FJ9ERyMSZ2rZ3uSHm6dN8vNN4?=
 =?iso-8859-1?Q?f+A0MHH+sDuDWKGURsCFr1Bc+uKpBKCQ/oUZN8lxwz/ZsBJtC2gguTnDRJ?=
 =?iso-8859-1?Q?o/AUsfujhKmer9PBBBK+ZnbhUcjhTPY2ySgMROiNqE1flm/iCIjCXoMvea?=
 =?iso-8859-1?Q?KzFt0eWfjCMzYWCSJS87MhBzeDYo4niKfOHB0fCuYTfQRnyRgDTGLdHC+w?=
 =?iso-8859-1?Q?WMBkQQUZPaYScQdjIeiPhwrSGcTamKdzVbXn7MiJK7V7MLFWOgsi7MepAl?=
 =?iso-8859-1?Q?kQr15DIq0koRkthO7SKwO9Xd7L4tXB0BP3F4yKLPeHlH1JEIGi3Yehaucc?=
 =?iso-8859-1?Q?Cy92z7PBSyNzZVdwsUmqG0dWBExfZOC6lTB8X7jpgqJapMKJAZ3ln+oKrJ?=
 =?iso-8859-1?Q?3kErzVZtQWlBrKrSdyh1JGLZVaimZuBLHKhR9l5MkMVKUBuF0I55VPY2mk?=
 =?iso-8859-1?Q?u14kScuqy0PcDQv5vsRj4sKpDOsoSyf4+4v7nfVX5ArblwzoQJX5699euj?=
 =?iso-8859-1?Q?o7GSN4JEjO5vCG+B7xFN40fv2IyVqC75e5Od+OxuyvvCdYLOcluI5qf0Uh?=
 =?iso-8859-1?Q?v1uwMSt2IH1z1YLWDtd5WJYo6XkqJfHqJG1+jtz3rt1LqVVa7QiAmyl1Xh?=
 =?iso-8859-1?Q?7+HQ4ZnlCcuNincUiqvpfkbqvAAQaOH97J5+42+wXeM5154caBJAprM1Je?=
 =?iso-8859-1?Q?7sdJJsmm6ZDlb4lXAKpVVjKFUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+KZ8iRvZ6K+s0p/bsmUROJCA9gTc7qQ9mrxJaNQvv/s64rW5vC6Eo2o+bO?=
 =?iso-8859-1?Q?2GPkxcZca4e2+hUaY/VH9DBQk81zB0c7YfROR6KQwQzno0ayt6YJh6vKE3?=
 =?iso-8859-1?Q?3dNQjuk/HIKZEo40D6jpv+MTcdPmKakFxEpdBj/Ku6Ayy/CJpHqIbPtYN9?=
 =?iso-8859-1?Q?nLKtbn3QMYZZ1yNP5TW1CWeK9jx+tXBfhUpebHBbBtRH0yQXuwYLnYkrTG?=
 =?iso-8859-1?Q?rOAjkpgmWzFDv+4LWpzsV0jfB4MqEZC7CH4yK1mVFsl1alLS86G/wxXN0J?=
 =?iso-8859-1?Q?h/PiVaIbCAwxweWI9cp37v+RxtEpOyxeqoo0Kcy2SC4JpIb0XCygJMIto6?=
 =?iso-8859-1?Q?YEQeV8nRVjTcEccTt/STNS8GnveKf0Xb586PQFN5ExpOhsFjReYA+TjYBa?=
 =?iso-8859-1?Q?znnOYEb+X6h8jg4FWeTLKlvIMTt4Rx364Ojw0lwvCICj7JdZYCWmVCKzH/?=
 =?iso-8859-1?Q?/VigWhtXQrZ2Zh5bQpQVJQfhEZwMSBc2YWNTqxjytWjM9dyjCFg5+8c96E?=
 =?iso-8859-1?Q?y/HQNmLmq3r8IBpsS+DGwE+Aq7NyioLsfUWcU6pqhdJeMKAK3fvKxF8zuz?=
 =?iso-8859-1?Q?vwmKwACX55pazHlPYZouu3wlQfLYA4uhmMFG9BcZxmpc4Rucj7bNjpagJv?=
 =?iso-8859-1?Q?h1dvPI9JzYtBv+LUnoeSlKdWNX9IY2a2i+b5Wl702/v7ID+23XxphWW6gj?=
 =?iso-8859-1?Q?d8HvfyuwWfkjfmI1Zg55X/xCQDIAKLWuSGjsm82ICO663S85JWLZs8DnrT?=
 =?iso-8859-1?Q?hCL/KSdyvSgTwT7fzDc7g7tTv5YyymnC8IXVKFRn2DMfIP2NSZlANFcH5R?=
 =?iso-8859-1?Q?5fTUIbWCZYUe0mMheHm1anJjoF2WH07uFMfycz/esroYufj9MIOcpXFSw/?=
 =?iso-8859-1?Q?fQObQ/AU7PkcuVzLCZjTENVQwO4av6En8tmefdEYl6i198gNBDPE11T8ui?=
 =?iso-8859-1?Q?ILwuM1irZqWFwIRk2uoay1BVStKMOx/3ADcZf34w5eAIgxA6QEr961wBcg?=
 =?iso-8859-1?Q?iO1JZIXU5E6civK+0/7tyRpiz2Bc4CYaF3Fdm3N2T5yXqkfMDE7iREn/30?=
 =?iso-8859-1?Q?FLrd/fK8CVuTfLiOP5WjS+wUGGdYIih97nExQlxKmFFCTm43WsMGtiP5py?=
 =?iso-8859-1?Q?3vYeFLExyp4T1WvAVlEPICSHICCFz6QSxUvYM75JYVR3DaF5cjqm8pUmf+?=
 =?iso-8859-1?Q?P27tTqIaqOYt4M+hEY7zETPzeKNoNlpbibBWeDndiwk4NUTMY8kjGyEyeZ?=
 =?iso-8859-1?Q?sHjGUGPWzXBIvb1TwTwANsBuY/+OwFvpn2l7nr09jmott8A2vGftkDde2F?=
 =?iso-8859-1?Q?RyxPrOWxpoFs9jbcX+YISfvKozlcjENryV42nmmUiKnAJC/jyrkZLnwZzb?=
 =?iso-8859-1?Q?JyGuRGFIMktHZBmO5bqFOnAmb5tnDRiLiQlRUiI3L4Tg6GtjKYV18LEcN0?=
 =?iso-8859-1?Q?y/CASa39VTX8uNDiO4g3I1DFyOu9t+gG1vuQDmOmQeMAWmRWYSgFE3CUT9?=
 =?iso-8859-1?Q?bzNLJ0Fc8Kd+vXWjyH3yhVr9jXT5cNU7znA7rUYCVGkThKTpvF3HMdovIe?=
 =?iso-8859-1?Q?12MUO0PMKGuLez7WKPkKNjUbdVhqpirWSt/mdCMUxPtkgs6u+6oThjbY01?=
 =?iso-8859-1?Q?EUCwnntJgivxWay7lTnh/ChaK/sdg0wGqLqh47CdzQ3oYodNSahjcwuQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 512710f5-a994-4b72-8fd2-08dcdc125b6e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 20:57:38.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6ibjHM83nOowXzE8uWAaTprRxK94pHm51/IM3r4cjksJJkcMzQ9dLSVOwVb+HJtc/50ZyooF2kh2+3hqaTM5YP5NZpeq2ng8yjb3Ib//G8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
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

On Mon, Sep 23, 2024 at 11:45:52PM GMT, Ville Syrjälä wrote:
>From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>Put the parens in the correct spot so that we are actually
>checking for gen6+ instead of 'intel_gen() != 0' (which is
>always true btw since intel_gen() returns -1 when it doesn't
>detect a valid device).
>
>Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> tests/intel/gem_ctx_engines.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
>index 94a47ecc3079..24240df66062 100644
>--- a/tests/intel/gem_ctx_engines.c
>+++ b/tests/intel/gem_ctx_engines.c
>@@ -643,7 +643,7 @@ igt_main
> 		const intel_ctx_t *ctx;
>
> 		igt_require(gem_scheduler_enabled(i915));
>-		igt_require(intel_gen(intel_get_drm_devid(i915) >= 6));
>+		igt_require(intel_gen(intel_get_drm_devid(i915)) >= 6);
>
> 		ctx = intel_ctx_create_all_physical(i915);
> 		for_each_ctx_engine(i915, ctx, e) {
>-- 
>2.44.2
>
