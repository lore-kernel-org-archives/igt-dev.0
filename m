Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6FCC36002
	for <igt-dev@archiver.kernel.org>; Sun,  6 Apr 2025 17:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9349910E059;
	Sun,  6 Apr 2025 17:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4RgBO1I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79C10E059
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Apr 2025 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743960963; x=1775496963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A833D/Cb76Mhk3c541PY4e1NAC8L0VyVYR+V86YfxCA=;
 b=e4RgBO1Isxumhzx2mBXANEdBvxG9t4LxNBc0VJBU17HQclAr4wvEUpJP
 E7bcE0NLueQ5Kc8B/au1tZEhbL4prJTBIdfJRWcIA/IIVRLdpMh7lzVrq
 frhP93nF98kdU4rDEitIxXiRfRUdEotVybh9vqOCVs79q/nEv+Gf0u12G
 Bq1Z5G481z8+6IN346pZTl6NiA/ELUV1a3bAQCrF4QjU1z88yi8LAEKOW
 kPW4/oLoAF/Xja5ntCeXT17u53hgfToaGja14PzOTHXzRZLulhTc23wyM
 pCUonfmalHIFjGZUEThtN+K+Y4tFtT1OxnOHFCwKGqVGFFhDBBeS1xKdL g==;
X-CSE-ConnectionGUID: gcR3G6szSm+pAwrmBU9MFw==
X-CSE-MsgGUID: B6eoQ8aDQ/iP+sMgjCAMfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="62740970"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="62740970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 10:36:02 -0700
X-CSE-ConnectionGUID: whzPxjLvTxiqjfUu9dT8FA==
X-CSE-MsgGUID: eOm7tcIGTaWBc6FihLnYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="158724137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 10:36:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 10:36:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 6 Apr 2025 10:36:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 10:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8yCiXi84rFF3iug/4AvkXmNDAhORbXhSbVvOf0yPm5Cp8HzpH7lCGXsiY1pZrkdx0+eRFOFzcUSBM/Iy0bkfFTQjlADHR+JBsTAgU6imbGbWrTBP+wbHXAoo5FueqpJ5CRzVLAkz1KMKMX7AhvR8UoSurdE+AL9dE3CrFOaOlUS9AUZauheBcJf0lRLTZ5XP5zCWKdQqjn6vWSk9DpBsQHDyV9p9I7dE45mZHc+ySAKeeQu6dFt/OESHUrahBZJTgsBFyEgpdLB1lg3z3v6bZdH8Ih98DTWhdjFj5OzDL4FgbjY41wyO2BnAe2b6DCzadxti0kL7iNCNyrHUO+c+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB1MyedhZQFZ0KCWfe28YwXxldYXAOY7t8a0+T5/AE0=;
 b=sMtrcGf2pd4VCta3Hi0ByLxZX6kDB+86eyLqgUjF8aknmj+T3N+hQ4DzlVWP05NLUhBw4HtA0TdKJgLtQppcGBQo2meSopEWw4ZPIUFun7MfR2dZmMcVT2PhkIuqDE6pr5jlnHoSooar1eXQTeMQKqBel24I78ZcofT4LRsfS1ymfRZEGWtydGpLwmwqAgKLS8k0P/gEEMMX2MoWlxXR4KOzXQItIxUgoCJh1dZlPjM8i0VV7W5Zo/lvYWfcpvgo5pC0SoXJY/9PR7L5UEWAljHjPb4pmILF0hhyfXjlWK0Y0EoatyHq00WZ5NP1cSkjbIgKgsLSJMhuBmuDBqTIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6482.namprd11.prod.outlook.com (2603:10b6:208:3bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Sun, 6 Apr
 2025 17:35:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8606.027; Sun, 6 Apr 2025
 17:35:57 +0000
Date: Sun, 6 Apr 2025 13:35:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himanshu.girotra@intel.com>,
 <aditya.chauhan@intel.com>, <pravalika.gurram@intel.com>,
 <sai.gowtham.ch@intel.com>, <ramadevi.gandi@intel.com>,
 <lucas.demarchi@intel.com>, <kamil.konieczny@linux.intel.com>,
 <katarzyna.piecielska@intel.com>, "Grabski, Mateusz"
 <mateusz.grabski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel: Remove debugfs_test and xe_debugfs
Message-ID: <Z_K7eSF32ROmLgyQ@intel.com>
References: <20250403102313.181408-1-peter.senna@linux.intel.com>
 <d08ec4ba-ae15-43e5-bd70-c805afed4b4e@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d08ec4ba-ae15-43e5-bd70-c805afed4b4e@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0274.namprd04.prod.outlook.com
 (2603:10b6:303:89::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 05068ffd-5cd5-44f2-282a-08dd75317d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TO/8eqao8DkOw34QCqu2rLTGgGQqNE/Di90ifurAMCKoLVU542B3Doxzjl?=
 =?iso-8859-1?Q?6BAHTFifwIhSeB3P/JM5IixrkjG6ruFPci4xkOIcYrYLR5Gw0W1M1KKQHJ?=
 =?iso-8859-1?Q?Bxu77r15JBS+pgAhgE4DTB6wje3IG30wttugq5XPDZHZsLoSewKcGeAuBl?=
 =?iso-8859-1?Q?ZxDgxk4iz5nPrRUoMMxqc9JqcUz+wyKZp22tKvfyXqSxZnvExj5baPScRb?=
 =?iso-8859-1?Q?5m6rr446IjMJQbU9mfIW0hjXNJqCJleWECnD50KxQs/oFIbUpFqGGz3Sme?=
 =?iso-8859-1?Q?Wa7J5G+XS23HOoz4OWkmoF5p5ZEizEOtgW5TVZ0wRzmfwyvWkuqbJ9d3d1?=
 =?iso-8859-1?Q?HSII4fClnv2xhj9eUt993qQQAYfiAV9fP+bFyZIcnjKelebY54S3Be2HVv?=
 =?iso-8859-1?Q?72q8S1hI98sUSxlB/7YSHZSnAtQPCJHUYN6kg84XOyE8dy8EnOk8Hd0o2e?=
 =?iso-8859-1?Q?RgJ/6dZ+wiTtrImIJjnKpzFAeUhvU8gy65J4eSNSVIxt3u9jLMDAqaGk9h?=
 =?iso-8859-1?Q?EG+8AqPCFhtU3LgW3YvgdTTSXHtRe3hJyNiCG7vzXV4F9Y1nXPZzD5GKB7?=
 =?iso-8859-1?Q?I+FmUXOefonR6eXtJ2rswzyuDckPDe/c4Yt29IdxndYsvWM9y2IT7DG8ms?=
 =?iso-8859-1?Q?dEP5L6qMyK5EJKGUhLSR6CqcGG8fjZIMpkoHA/9yY/x8VaKzIsDKombpd8?=
 =?iso-8859-1?Q?7fKAatqn4fUjkr5hQaaSiA/GPH3uL9t/xUZlgD9WLAq2Zw8I2kMJyGrEwi?=
 =?iso-8859-1?Q?nvntSC8tBb9ym6zQtINvrl6eHs2rod2k4DQ8yajxmRo5j+OFWYDt3z9RWi?=
 =?iso-8859-1?Q?MTmufp9E41XSCKGdEgltlrKklKf0R19Mxy5iD6/uVhh1PEeugC8u/dXnev?=
 =?iso-8859-1?Q?OyCBEpfli34npwY30muXPgad8q9jfW/GLWf9jqxg36qVUee6IZnZ0ZpCJl?=
 =?iso-8859-1?Q?rsLqx1wvKBhHtK8WsrjA61CexrfAVMQcJeI1BaR3yjn/em5eoVCq+56WG0?=
 =?iso-8859-1?Q?4gs492wWFhovMipWkWXXzN1tu0JdVnb7nAZzHzkrajizXbSbf4URHxbbST?=
 =?iso-8859-1?Q?q9D1UcLHGHr2OpiLD5dsBOag71xTDZDktsd09ph5FKLTCxphDF51XaFeMV?=
 =?iso-8859-1?Q?NNpR8vZH8TjiXO5dlv0DkSPUHMH5RyFOYb4pEc1n9uBtOkHlVmsJ9WydOE?=
 =?iso-8859-1?Q?zY8dy6M31L9uwPmMXQxam6I+0ZarqjOv0WFgSFiAd6za0AI6o1j8MsIcPw?=
 =?iso-8859-1?Q?QU8j4Ci1WUp7FWFjNLPqsz8LQ0ob/X9MLJm1OZrZbzku0DzTLviuAujOlo?=
 =?iso-8859-1?Q?PW4vegxzvVreLzT2VjFJAGqP8BClFIElVQvobi8xIzMe0RJzQuSQfchLre?=
 =?iso-8859-1?Q?MDvFzL6lObzky/eg5LuL0KWldHLkJsWPpkSQ2OzIKy14d4BCma97Xmjz22?=
 =?iso-8859-1?Q?cnMPTKMno6o6HImA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0CLozLeTUwjCN2K0jByAeuTs4llZDfnv3m5ljUlHYQP/14NWk7W8AgCagu?=
 =?iso-8859-1?Q?O+iZNqGvxWjYGcyNcKm3ynLye/7GxdwQ9N97I9R/dMQ0dZISk1OCa2PLw2?=
 =?iso-8859-1?Q?YhF7UfmesP9RExqeriS9bdaB7Imwi3RuTyXzlwOvpJauhrpGJ3G/n+zON/?=
 =?iso-8859-1?Q?whoLv6lNceZskkUwvrlc4oII0vNCgofC8Sw9ZOvQANrp6WV4+2ETkPbiLp?=
 =?iso-8859-1?Q?QEi8KNO9k+id8ht/wkRmnZlS1akHLuqD6+vlle/BwnBO8Z4bOuhvNAhjm0?=
 =?iso-8859-1?Q?7QyrpWbEiJgQHnlgEk2DrzSAuaD2lFauWP9rdr0Ht96oc42TOECK8ByU2/?=
 =?iso-8859-1?Q?rHQ8M43pxFES0yq8CpSLrf3K/iuUUV4CGrJ7+/GjEvIzLGznNAj4WP3/dl?=
 =?iso-8859-1?Q?SKrFKn79N1zN/54BmUi7XJ6F75oDqjwb8vbv2/zpFVDsHBA+CL7QXpA2HM?=
 =?iso-8859-1?Q?upgNODUD1pDXVdGnB/OqYSlOvHOaYAhOWYLvwgG6ecRn7Ip1322oRKINZv?=
 =?iso-8859-1?Q?iEubkf3de5cMvdQT6iZTmvb8MmbkR5hj1fFm9Evc/m25nBSnrMRYAtN6GI?=
 =?iso-8859-1?Q?Jsnze1YoSjnw/XippcDStcUUqPEV36n7oOX1wgwDKYNFNHcSbtDCHEv4yp?=
 =?iso-8859-1?Q?Xk8cMbOlO4og+opM/uiZlrwYSnjpjE6jRl7exq/5mMs/lT25GL8oXh3TuF?=
 =?iso-8859-1?Q?i4GZaoXmF7EzzKWpnJcwulSXcVhv4jD4VsKxwScx4TcVnc6TODKOJouIbA?=
 =?iso-8859-1?Q?ynLDM3r8ttarBSafsgv42QZmx4epLAPiJBj5GOWcedOsbAE89m1GsFF1yF?=
 =?iso-8859-1?Q?n1ojyYkfnBUbeZfy9QF3WQpsyVrSfTE/SQSHNS0AGCN4pdrXD2caArmSME?=
 =?iso-8859-1?Q?6sH11QSlHfzSjFHdDW1Lfw3dg2OkQTYjdSdT5EEX88sQ1UPykLG7vbwNGC?=
 =?iso-8859-1?Q?QwB+MjbjyqgGMy/ltCPI/sylhu5CKG45y70uzdOpw8hp7jje7u7LxsIGXt?=
 =?iso-8859-1?Q?Rh2tFQXPLFF5evcTXRbQQslFXMVs/8g+D3E17Tt1lgAZvz9HMf1mi2aPpT?=
 =?iso-8859-1?Q?tgHe8oA3l1uWUhHQPes7pzQ0vXmRSeQShXNntOYoCAPiwxOGHzDB5c/ZH7?=
 =?iso-8859-1?Q?3/GwGZ/IZ2E4L+vXsTn61KjrE5qICTeCawuufNPs5+Fwwz3GqlTJT9a8XQ?=
 =?iso-8859-1?Q?wPTZn8r49Y2VHDFLMCMfA07O/v4RHJRkqiMLj65gkb2Ng1ZnN+FYMcl59T?=
 =?iso-8859-1?Q?+hT2ujhRTGumxxumP+t6HfkDtJuWLi8IeBcLLraYa/WQ86TA64T51F1UX9?=
 =?iso-8859-1?Q?USuphKNycMmhdZf0b4tiDvTkvoluVwUZkWD3lK9ouk7/HiCj0j/DVpwDNe?=
 =?iso-8859-1?Q?MQHLrKn947PIxhM6h4lK9bIvpolETCwvyuOEOQIbH5BqhDbBhon37tKOAq?=
 =?iso-8859-1?Q?+VzbpTJmLfMRvNShqOE/CdncnGhdedQqad4/cSuBiGlqORSZbHWz/6kQOL?=
 =?iso-8859-1?Q?d0vSVCzznmx9+j5fSW0JsS9VZlRK7Z42Gfdl8som8j9QlSWw/yER510kXT?=
 =?iso-8859-1?Q?tRjGygUWVaKWwjBB9cKb51cbYzT/jqGbhn1VXRwkONllG/RZXiDkSEGZUI?=
 =?iso-8859-1?Q?Rfi5WSA4ZTM/ffIBSG+l+lUCTJgeVwOk8Zl90VPnY9NP3ExUm+AU4MKQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05068ffd-5cd5-44f2-282a-08dd75317d47
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 17:35:57.6119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9rhPO9upY5W2Nd/z6C6hkXSPHCyZR071UQefkda6GWLR9KbCPW3GaYLwIgV9QD/nvQkNUqtXzQ7tuHw/kNE3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6482
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

On Fri, Apr 04, 2025 at 10:44:15AM +0200, Peter Senna Tschudin wrote:
> 
> 
> On 4/3/2025 12:23 PM, Peter Senna Tschudin wrote:
> > With the introduction of intel_sysfs_debugfs both debugfs_test and
> > xe_debugfs became redundant. It is also important to notice that
> > igt@debugfs_test@basic-hwmon was already redundant because intel_hwmon
> > covers both i915 and Xe. So:
> >  - remove debugfs_test
> >  - remove xe_debugfs
> >  - update meson.build
> >  - update code_coverage.md and code_cov_selftest.sh to use
> >    igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries
> >  - update fast-feedback.testlist to use intel_sysfs_debugfs and
> >    intel_hwmon
> >  - update xe-fast-feedback.testlist to use intel_sysfs_debugfs and
> >    include xe-debugfs-read-all-entries and xe-sysfs-read-all-entries
> >  - update xe-sriov-vf.blocklist.txt to use intel_sysfs_debugfs
> >  - remove reference to debugfs_test.c from i915_test_config.json
> > 
> > Cc: himanshu.girotra@intel.com
> > Cc: aditya.chauhan@intel.com
> > Cc: pravalika.gurram@intel.com
> > Cc: sai.gowtham.ch@intel.com
> > Cc: ramadevi.gandi@intel.com
> > Cc: lucas.demarchi@intel.com
> > Cc: rodrigo.vivi@intel.com
> > Cc: kamil.konieczny@linux.intel.com
> > Cc: katarzyna.piecielska@intel.com
> Cc: mateusz.grabski@intel.com
> 
> @Grabski, Mateusz I am passing along that I shared with CI the
> pontential that this patch has to break things, and that you are
> ok with this change as it does not seem to break anything in an
> obvious way.
> 
> > Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > ---
> >  docs/code_coverage.md                    |  18 +-
> >  scripts/code_cov_selftest.sh             |   2 +-
> >  tests/intel-ci/fast-feedback.testlist    |   6 +-
> >  tests/intel-ci/xe-fast-feedback.testlist |   8 +-
> >  tests/intel-ci/xe-sriov-vf.blocklist.txt |   2 +-
> >  tests/intel/debugfs_test.c               | 244 ---------------------
> >  tests/intel/i915_test_config.json        |   2 +-
> >  tests/intel/xe_debugfs.c                 | 268 -----------------------
> >  tests/meson.build                        |   2 -
> >  9 files changed, 20 insertions(+), 532 deletions(-)
> >  delete mode 100644 tests/intel/debugfs_test.c
> >  delete mode 100644 tests/intel/xe_debugfs.c
> > 
> > diff --git a/docs/code_coverage.md b/docs/code_coverage.md
> > index 915e800ed..031611e69 100644
> > --- a/docs/code_coverage.md
> > +++ b/docs/code_coverage.md
> > @@ -162,23 +162,23 @@ For each script, the igt_runner passes just one parameter: the results
> >  directory + the test name.
> >  
> >  For instance, if it is needed to run a test called
> > -`debugfs_test (read_all_entries)` using `code_cov_capture`
> > +`intel_sysfs_debugfs (i915-debugfs-read-all-entries)` using `code_cov_capture`
> >  parameter, e. g.:


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

but let's wait some confirmation and ack from CI folks to avoid major regression

> >  
> >  ```
> > -$ echo "igt@debugfs_test@read_all_entries" > my.testlist
> > +$ echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > my.testlist
> >  $ ./scripts/run-tests.sh -T my.testlist -k ~/linux -c code_cov_capture -P
> >  Found test list: "/basedir/igt/build/tests/test-list.txt"
> > -[31410.499969] [1/1] debugfs_test (read_all_entries)
> > +[31410.499969] [1/1] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
> >  [31411.060446] Storing code coverage results...
> > -[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/debugfs_test_read_all_entries.info
> > +[31418.01]     Code coverage wrote to /basedir/igt/results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
> >  Done.
> >  ```
> >  
> >  The script will be called as:
> >  
> >  ```
> > -code_cov_capture results/code_cov/debugfs_test_read_all_entries
> > +code_cov_capture results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries
> >  ```
> >  
> >  Please notice that any character that it is not a number nor a letter at the
> > @@ -376,7 +376,7 @@ OUT_DIR="${HOME}/results"
> >  
> >  mkdir -p $OUT_DIR/html
> >  
> > -echo "igt@debugfs_test@read_all_entries" > $TESTLIST
> > +echo "igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries" > $TESTLIST
> >  echo "igt@core_auth@basic-auth" >> $TESTLIST
> >  echo "igt@gem_exec_basic@basic" >> $TESTLIST
> >  
> > @@ -401,8 +401,8 @@ genhtml -q -s --legend --branch-coverage $OUT_DIR/results.info
> >  Running such script produces the following output:
> >  
> >  ```
> > -[3622.993304] [1/3] debugfs_test (read_all_entries)
> > -[3631.95]     Code coverage wrote to results/code_cov/debugfs_test_read_all_entries.info
> > +[3622.993304] [1/3] intel_sysfs_debugfs (i915-debugfs-read-all-entries)
> > +[3631.95]     Code coverage wrote to results/code_cov/intel_sysfs_debugfs_i915_debugfs_read_all_entries.info
> >  [3626.217016] Storing code coverage results...
> >  [3631.957998] [2/3] core_auth (basic-auth)
> >  [3638.03]     Code coverage wrote to results/code_cov/core_auth_basic_auth.info
> > @@ -419,7 +419,7 @@ core_auth_basic_auth.info:
> >  Ignored......: non-drm headers and source files where none of its code ran.
> >  Source files.: 23.27% (165 of 709 total), 29.57% (165 of 558 filtered)
> >  
> > -debugfs_test_read_all_entries.info:
> > +intel_sysfs_debugfs_i915_debugfs_read_all_entries.info:
> >    lines......: 19.3% (20266 of 104802 lines)
> >    functions..: 17.5% (1922 of 10971 functions)
> >    branches...: 12.7% (9462 of 74555 branches)
> > diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
> > index c834fb5a7..bc5ef7458 100755
> > --- a/scripts/code_cov_selftest.sh
> > +++ b/scripts/code_cov_selftest.sh
> > @@ -13,7 +13,7 @@ if [ -z "$IGT_KERNEL_TREE" ] ; then
> >          exit 1
> >  fi
> >  
> > -TEST="igt@debugfs_test@read_all_entries"
> > +TEST="igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries"
> >  
> >  TESTLIST="my_tests.testlist"
> >  GATHER="scripts/code_cov_gather_on_test.py"
> > diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> > index be0965110..82395e7ea 100644
> > --- a/tests/intel-ci/fast-feedback.testlist
> > +++ b/tests/intel-ci/fast-feedback.testlist
> > @@ -3,9 +3,6 @@ igt@i915_module_load@load
> >  
> >  # Keep alphabetically sorted by default
> >  igt@core_auth@basic-auth
> > -igt@debugfs_test@read_all_entries
> > -igt@debugfs_test@basic-hwmon
> > -igt@debugfs_test@sysfs
> >  igt@fbdev@eof
> >  igt@fbdev@info
> >  igt@fbdev@nullptr
> > @@ -55,6 +52,9 @@ igt@i915_getparams_basic@basic-eu-total
> >  igt@i915_getparams_basic@basic-subslice-total
> >  igt@i915_hangman@error-state-basic
> >  igt@i915_pciid
> > +igt@intel_hwmon
> > +igt@intel_sysfs_debugfs@i915-debugfs-read-all-entries
> > +igt@intel_sysfs_debugfs@i915-sysfs-read-all-entries
> >  igt@kms_addfb_basic@addfb25-4-tiled
> >  igt@kms_addfb_basic@addfb25-bad-modifier
> >  igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
> > diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> > index 0234d3e72..adc0c1b21 100644
> > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > @@ -7,6 +7,11 @@ igt@fbdev@nullptr
> >  igt@fbdev@read
> >  igt@fbdev@write
> >  
> > +igt@intel_sysfs_debugfs@xe-base
> > +igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries
> > +igt@intel_sysfs_debugfs@xe-forcewake
> > +igt@intel_sysfs_debugfs@xe-gt
> > +igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries
> >  igt@kms_addfb_basic@addfb25-4-tiled
> >  igt@kms_addfb_basic@addfb25-bad-modifier
> >  igt@kms_addfb_basic@addfb25-modifier-no-flag
> > @@ -72,9 +77,6 @@ igt@xe_create@create-execqueues-noleak
> >  igt@xe_create@create-execqueues-leak
> >  igt@xe_create@create-invalid-mbz
> >  igt@xe_create@create-massive-size
> > -igt@xe_debugfs@base
> > -igt@xe_debugfs@gt
> > -igt@xe_debugfs@forcewake
> >  igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
> >  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
> >  igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
> > diff --git a/tests/intel-ci/xe-sriov-vf.blocklist.txt b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> > index 0c5bc631a..3ee71bd83 100644
> > --- a/tests/intel-ci/xe-sriov-vf.blocklist.txt
> > +++ b/tests/intel-ci/xe-sriov-vf.blocklist.txt
> > @@ -8,4 +8,4 @@ igt@xe_module_load
> >  #
> >  # Blocked because of abort
> >  #
> > -igt@xe_debugfs@gt
> > +igt@intel_sysfs_debugfs@xe-gt
> > diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
> > deleted file mode 100644
> > index f2b6fb334..000000000
> > --- a/tests/intel/debugfs_test.c
> > +++ /dev/null
> > @@ -1,244 +0,0 @@
> > -/*
> > - * Copyright © 2017 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a
> > - * copy of this software and associated documentation files (the "Software"),
> > - * to deal in the Software without restriction, including without limitation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> > - * and/or sell copies of the Software, and to permit persons to whom the
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including the next
> > - * paragraph) shall be included in all copies or substantial portions of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> > - * IN THE SOFTWARE.
> > - */
> > -#include "config.h"
> > -
> > -#include "i915/gem.h"
> > -#include "igt.h"
> > -#include "igt_hwmon.h"
> > -#include "igt_sysfs.h"
> > -#include <fcntl.h>
> > -#include <sys/types.h>
> > -#include <dirent.h>
> > -/**
> > - * TEST: debugfs test
> > - * Description: Read entries from debugfs, hwmon and sysfs paths.
> > - * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: uapi
> > - * Functionality: debugfs
> > - * Feature: core
> > - * Test category: uapi
> > - *
> > - * SUBTEST: basic-hwmon
> > - * Description: Read all entries from hwmon path validating debugfs entries
> > - *
> > - * SUBTEST: read_all_entries
> > - * Description: Read all entries from debugfs path validating debugfs entries
> > - *
> > - * SUBTEST: read_all_entries_display_off
> > - * Description: Read all debugfs entries with display on/off.
> > - *
> > - * SUBTEST: read_all_entries_display_on
> > - * Description: Read all debugfs entries with display on/off.
> > - *
> > - * SUBTEST: sysfs
> > - * Description: Read all entries from sysfs path validating debugfs entries
> > - *
> > - */
> > -
> > -IGT_TEST_DESCRIPTION("Read entries from debugfs, hwmon and sysfs paths.");
> > -
> > -static void read_and_discard_sysfs_entries(int path_fd, int indent)
> > -{
> > -	struct dirent *dirent;
> > -	DIR *dir;
> > -	char tabs[8];
> > -	int i;
> > -
> > -	igt_assert(indent < sizeof(tabs) - 1);
> > -
> > -	for (i = 0; i < indent; i++)
> > -		tabs[i] = '\t';
> > -	tabs[i] = '\0';
> > -
> > -	dir = fdopendir(path_fd);
> > -	if (!dir)
> > -		return;
> > -
> > -	while ((dirent = readdir(dir))) {
> > -		if (!strcmp(dirent->d_name, ".") ||
> > -		    !strcmp(dirent->d_name, ".."))
> > -			continue;
> > -
> > -		if (dirent->d_type == DT_DIR) {
> > -			int sub_fd;
> > -
> > -			sub_fd = openat(path_fd, dirent->d_name,
> > -					O_RDONLY | O_DIRECTORY);
> > -			if (sub_fd < 0)
> > -				continue;
> > -
> > -			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
> > -			read_and_discard_sysfs_entries(sub_fd, indent + 1);
> > -			close(sub_fd);
> > -		} else if (dirent->d_type == DT_REG) {
> > -			char buf[512];
> > -			int sub_fd;
> > -			ssize_t ret;
> > -
> > -			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
> > -			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
> > -			igt_set_timeout(5, "reading sysfs entry");
> > -
> > -			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
> > -			if (sub_fd == -1) {
> > -				igt_debug("%sCould not open file \"%s\" with error: %m\n",
> > -					  tabs, dirent->d_name);
> > -				continue;
> > -			}
> > -
> > -			do {
> > -				ret = read(sub_fd, buf, sizeof(buf));
> > -			} while (ret == sizeof(buf));
> > -
> > -			if (ret == -1)
> > -				igt_debug("%sCould not read file \"%s\" with error: %m\n",
> > -					  tabs, dirent->d_name);
> > -
> > -			igt_reset_timeout();
> > -			close(sub_fd);
> > -		}
> > -	}
> > -	closedir(dir);
> > -}
> > -
> > -static void kms_tests(int fd, int debugfs)
> > -{
> > -	igt_display_t display;
> > -	struct igt_fb fb[IGT_MAX_PIPES];
> > -	enum pipe pipe;
> > -	int ret;
> > -
> > -	igt_fixture
> > -		igt_display_require(&display, fd);
> > -
> > -	igt_subtest("read_all_entries_display_on") {
> > -		/* try to light all pipes */
> > -retry:
> > -		for_each_pipe(&display, pipe) {
> > -			igt_output_t *output;
> > -
> > -			for_each_valid_output_on_pipe(&display, pipe, output) {
> > -				igt_plane_t *primary;
> > -				drmModeModeInfo *mode;
> > -
> > -				if (output->pending_pipe != PIPE_NONE)
> > -					continue;
> > -
> > -				igt_output_set_pipe(output, pipe);
> > -				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > -				mode = igt_output_get_mode(output);
> > -				igt_create_pattern_fb(display.drm_fd,
> > -						      mode->hdisplay, mode->vdisplay,
> > -						      DRM_FORMAT_XRGB8888,
> > -						      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
> > -
> > -				/* Set a valid fb as some debugfs like to inspect it on a active pipe */
> > -				igt_plane_set_fb(primary, &fb[pipe]);
> > -				break;
> > -			}
> > -		}
> > -
> > -		if (display.is_atomic)
> > -			ret = igt_display_try_commit_atomic(&display,
> > -					DRM_MODE_ATOMIC_TEST_ONLY |
> > -					DRM_MODE_ATOMIC_ALLOW_MODESET,
> > -					NULL);
> > -		else
> > -			ret = igt_display_try_commit2(&display, COMMIT_LEGACY);
> > -
> > -		if (ret) {
> > -			igt_output_t *output;
> > -			bool found = igt_override_all_active_output_modes_to_fit_bw(&display);
> > -			igt_require_f(found, "No valid mode combo found.\n");
> > -
> > -			for_each_connected_output(&display, output)
> > -				igt_output_set_pipe(output, PIPE_NONE);
> > -
> > -			goto retry;
> > -		}
> > -
> > -		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> > -
> > -		read_and_discard_sysfs_entries(debugfs, 0);
> > -	}
> > -
> > -	igt_subtest("read_all_entries_display_off") {
> > -		igt_output_t *output;
> > -		igt_plane_t *plane;
> > -
> > -		for_each_connected_output(&display, output)
> > -			igt_output_set_pipe(output, PIPE_NONE);
> > -
> > -		for_each_pipe(&display, pipe)
> > -			for_each_plane_on_pipe(&display, pipe, plane)
> > -				igt_plane_set_fb(plane, NULL);
> > -
> > -		igt_display_commit2(&display, display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> > -
> > -		read_and_discard_sysfs_entries(debugfs, 0);
> > -	}
> > -
> > -	igt_fixture
> > -		igt_display_fini(&display);
> > -}
> > -
> > -igt_main
> > -{
> > -	int fd = -1, debugfs, sysfs, hwmon_fd;
> > -
> > -	igt_fixture {
> > -		fd = drm_open_driver_master(DRIVER_INTEL);
> > -		igt_require_gem(fd);
> > -		debugfs = igt_debugfs_dir(fd);
> > -		sysfs = igt_sysfs_open(fd);
> > -
> > -		kmstest_set_vt_graphics_mode();
> > -	}
> > -
> > -	igt_describe("Read all entries from sysfs path.");
> > -	igt_subtest("sysfs")
> > -		read_and_discard_sysfs_entries(sysfs, 0);
> > -	igt_describe("Read all entries from debugfs path.");
> > -	igt_subtest("read_all_entries")
> > -		read_and_discard_sysfs_entries(debugfs, 0);
> > -
> > -	igt_describe("Read all entries from hwmon path");
> > -	igt_subtest("basic-hwmon") {
> > -		igt_require_f(gem_has_lmem(fd), "Test applicable only for dgfx\n");
> > -		hwmon_fd = igt_hwmon_open(fd);
> > -		igt_assert(hwmon_fd >= 0);
> > -		read_and_discard_sysfs_entries(hwmon_fd, 0);
> > -		close(hwmon_fd);
> > -	}
> > -
> > -	igt_describe("Read all debugfs entries with display on/off.");
> > -	igt_subtest_group
> > -		kms_tests(fd, debugfs);
> > -
> > -	igt_fixture {
> > -		close(sysfs);
> > -		close(debugfs);
> > -		drm_close_driver(fd);
> > -	}
> > -}
> > diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> > index 1a1c1aafa..04bf1fa68 100644
> > --- a/tests/intel/i915_test_config.json
> > +++ b/tests/intel/i915_test_config.json
> > @@ -5,7 +5,7 @@
> >      "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
> >                 "../core_getstats.c", "../core_getversion.c",
> >                 "../core_hotunplug.c", "../core_setmaster.c",
> > -               "../core_setmaster_vs_auth.c", "../debugfs_test.c",
> > +               "../core_setmaster_vs_auth.c",
> >                 "../device_reset.c", "../dmabuf.c",
> >                 "../drm_import_export.c", "../drm_mm.c",
> >                 "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",
> > diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> > deleted file mode 100644
> > index ec8b0d0b5..000000000
> > --- a/tests/intel/xe_debugfs.c
> > +++ /dev/null
> > @@ -1,268 +0,0 @@
> > -// SPDX-License-Identifier: MIT
> > -/*
> > - * Copyright © 2023 Intel Corporation
> > - */
> > -
> > -/**
> > - * TEST: Check debugfs userspace API
> > - * Category: Core
> > - * Mega feature: General Core features
> > - * Sub-category: uapi
> > - * Functionality: debugfs
> > - * Description: Validate debugfs entries
> > - * Test category: functionality test
> > - */
> > -
> > -#include <fcntl.h>
> > -#include <dirent.h>
> > -#include <limits.h>
> > -#include <string.h>
> > -#include <sys/types.h>
> > -
> > -#include "igt.h"
> > -#include "igt_sysfs.h"
> > -#include "xe_drm.h"
> > -#include "xe/xe_ioctl.h"
> > -#include "xe/xe_query.h"
> > -
> > -struct {
> > -	bool warn_on_not_hit;
> > -} opt = { 0 };
> > -
> > -static int validate_entries(int fd, const char *add_path, const char * const str_val[], int str_cnt)
> > -{
> > -	int i;
> > -	int hit;
> > -	int found = 0;
> > -	int not_found = 0;
> > -	DIR *dir;
> > -	struct dirent *de;
> > -	char path[PATH_MAX];
> > -
> > -	if (!igt_debugfs_path(fd, path, sizeof(path)))
> > -		return -1;
> > -
> > -	strcat(path, add_path);
> > -	dir = opendir(path);
> > -	if (!dir)
> > -		return -1;
> > -
> > -	while ((de = readdir(dir))) {
> > -		if (de->d_name[0] == '.')
> > -			continue;
> > -		hit = 0;
> > -		for (i = 0; i < str_cnt; i++) {
> > -			if (!strcmp(str_val[i], de->d_name)) {
> > -				hit = 1;
> > -				break;
> > -			}
> > -		}
> > -		if (hit) {
> > -			found++;
> > -		} else if (opt.warn_on_not_hit) {
> > -			not_found++;
> > -			igt_warn("no test for: %s/%s\n", path, de->d_name);
> > -		}
> > -	}
> > -	closedir(dir);
> > -	return 0;
> > -}
> > -
> > -/**
> > - * SUBTEST: base
> > - * Description: Check if various debugfs devnodes exist and test reading them.
> > - */
> > -static void
> > -test_base(int fd, struct drm_xe_query_config *config)
> > -{
> > -	uint16_t devid = intel_get_drm_devid(fd);
> > -	static const char * const expected_files[] = {
> > -		"gt0",
> > -		"gt1",
> > -		"stolen_mm",
> > -		"gtt_mm",
> > -		"vram0_mm",
> > -		"forcewake_all",
> > -		"info",
> > -		"gem_names",
> > -		"clients",
> > -		"name"
> > -	};
> > -	char reference[4096];
> > -	int val = 0;
> > -
> > -	igt_assert(config);
> > -	sprintf(reference, "devid 0x%llx",
> > -			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
> > -	igt_assert(igt_debugfs_search(fd, "info", reference));
> > -
> > -	sprintf(reference, "revid %lld",
> > -			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
> > -	igt_assert(igt_debugfs_search(fd, "info", reference));
> > -
> > -	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
> > -		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
> > -
> > -	igt_assert(igt_debugfs_search(fd, "info", reference));
> > -
> > -	if (intel_gen(devid) < 20) {
> > -		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
> > -		case 48:
> > -			val = 3;
> > -			break;
> > -		case 57:
> > -			val = 4;
> > -			break;
> > -		}
> > -
> > -		sprintf(reference, "vm_max_level %d", val);
> > -		igt_assert(igt_debugfs_search(fd, "info", reference));
> > -	}
> > -
> > -	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
> > -	igt_assert(igt_debugfs_search(fd, "info", reference));
> > -
> > -	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
> > -
> > -	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
> > -	igt_debugfs_dump(fd, "gtt_mm");
> > -
> > -	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
> > -		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
> > -		igt_debugfs_dump(fd, "vram0_mm");
> > -	}
> > -
> > -	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
> > -		igt_debugfs_dump(fd, "stolen_mm");
> > -
> > -	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
> > -	igt_debugfs_dump(fd, "clients");
> > -
> > -	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
> > -	igt_debugfs_dump(fd, "gem_names");
> > -
> > -	validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
> > -}
> > -
> > -/**
> > - * SUBTEST: gt
> > - * Description: Check all gt debugfs devnodes
> > - * TODO: add support for ``force_reset`` entries
> > - */
> > -static void
> > -test_gt(int fd, int gt_id)
> > -{
> > -	char name[256];
> > -	static const char * const expected_files[] = {
> > -		"uc",
> > -		"steering",
> > -		"topology",
> > -		"sa_info",
> > -		"hw_engines",
> > -		"pat",
> > -		"mocs",
> > -//		"force_reset"
> > -		"ggtt",
> > -		"register-save-restore",
> > -		"workarounds",
> > -		"default_lrc_rcs",
> > -		"default_lrc_ccs",
> > -		"default_lrc_bcs",
> > -		"default_lrc_vcs",
> > -		"default_lrc_vecs",
> > -		"hwconfig"
> > -
> > -	};
> > -	static const char * const expected_files_uc[] = {
> > -		"huc_info",
> > -		"guc_log",
> > -		"guc_info",
> > -//		"guc_ct_selftest"
> > -	};
> > -
> > -	for (int i = 0; i < ARRAY_SIZE(expected_files); i++) {
> > -		sprintf(name, "gt%d/%s", gt_id, expected_files[i]);
> > -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -		if (igt_debugfs_is_dir(fd, expected_files[i], gt_id))
> > -			continue;
> > -		igt_debugfs_dump(fd, name);
> > -	}
> > -
> > -	for (int i = 0; i < ARRAY_SIZE(expected_files_uc); i++) {
> > -		sprintf(name, "gt%d/uc/%s", gt_id, expected_files_uc[i]);
> > -		igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > -		igt_debugfs_dump(fd, name);
> > -	}
> > -
> > -	sprintf(name, "/gt%d", gt_id);
> > -	validate_entries(fd, name, expected_files, ARRAY_SIZE(expected_files));
> > -
> > -	sprintf(name, "/gt%d/uc", gt_id);
> > -	validate_entries(fd, name, expected_files_uc, ARRAY_SIZE(expected_files_uc));
> > -}
> > -
> > -/**
> > - * SUBTEST: forcewake
> > - * Description: check forcewake debugfs devnode
> > - */
> > -static void
> > -test_forcewake(int fd)
> > -{
> > -	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
> > -
> > -	igt_assert_neq(handle, -1);
> > -	close(handle);
> > -}
> > -
> > -const char *help_str =
> > -	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
> > -
> > -struct option long_options[] = {
> > -	{ "--warn-not-hit", no_argument, NULL, 'w'},
> > -	{ 0, 0, 0, 0 }
> > -};
> > -
> > -static int opt_handler(int option, int option_index, void *input)
> > -{
> > -	switch (option) {
> > -	case 'w':
> > -		opt.warn_on_not_hit = true;
> > -		break;
> > -	default:
> > -		return IGT_OPT_HANDLER_ERROR;
> > -	}
> > -
> > -	return IGT_OPT_HANDLER_SUCCESS;
> > -}
> > -
> > -igt_main_args("", long_options, help_str, opt_handler, NULL)
> > -{
> > -	char devnode[PATH_MAX];
> > -	int fd;
> > -	int gt;
> > -
> > -	igt_fixture {
> > -		fd = drm_open_driver(DRIVER_XE);
> > -		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
> > -	}
> > -
> > -	igt_subtest("base") {
> > -		test_base(fd, xe_config(fd));
> > -	}
> > -
> > -
> > -	igt_subtest("gt") {
> > -		xe_for_each_gt(fd, gt) {
> > -			snprintf(devnode, sizeof(devnode), "gt%d", gt);
> > -			igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
> > -			test_gt(fd, gt);
> > -		}
> > -	}
> > -
> > -	igt_subtest("forcewake") {
> > -		test_forcewake(fd);
> > -	}
> > -
> > -	igt_fixture
> > -		drm_close_driver(fd);
> > -}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 5eaa072fd..2c9c5736d 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -88,7 +88,6 @@ intel_i915_xe_progs = [
> >  
> >  intel_i915_progs = [
> >  	'api_intel_bb',
> > -	'debugfs_test',
> >  	'drm_fdinfo',
> >  	'gen3_mixed_blits',
> >  	'gen3_render_linear_blits',
> > @@ -281,7 +280,6 @@ intel_xe_progs = [
> >  	'xe_compute_preempt',
> >  	'xe_copy_basic',
> >  	'xe_dma_buf_sync',
> > -	'xe_debugfs',
> >  	'xe_drm_fdinfo',
> >  	'xe_eu_stall',
> >  	'xe_evict',
> 
