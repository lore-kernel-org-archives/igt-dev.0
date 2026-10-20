Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D7606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ocbat69a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BBB10E0F3;
	Tue, 20 Oct 2026 21:35:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E9B10E0F3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 21:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792532064; x=1824068064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b5ehotiOVdF/BCaBPXybKLzV6WsyVQ9MfpNtV/5r8mo=;
 b=Ocbat69aMYiCiRBvbt/u9yGdin4jx1ABy2Z7YgWElFZR1ASYiUsWUDsj
 W/9KMnvVdS+lSJnOMp5wACMavlIwVqrduhYliQFQej96pperpG+Wn7JBf
 A1ai5EDrd5+Ps9i+rRsUseNDfXfUQeX1TbvKDuUz9XJrITSrZfr+Yttwe
 HpzJZ5YCaVfZCwf6B5DIQGUJ3YEkXHM2AfUy9txZjOSv60KJ93BCRvMgA
 H3qP7Nq0OAC4TdOhttqkYs+QetOZN1X+8ec83JrfWH0qe/1DXfqWPRZQg
 rjzoY4kCzRjQvAqK9vDH3RybV9Iu1biQ5Y6tfhlJuBtU6Ps1cCfWPc69i Q==;
X-CSE-ConnectionGUID: LkncdQdLRc+mU4eczYHNKA==
X-CSE-MsgGUID: jY+abh08QKCmkzvUq8ZUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1263433"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1263433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:34:23 -0700
X-CSE-ConnectionGUID: nR74rlssTvya9u5uEBdNKQ==
X-CSE-MsgGUID: dolM/lfORxGYpcYTgjUNNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2806230"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:34:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:34:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 14:34:23 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:34:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knxkI3QYMCDzjSEz5FRZFfnp6ZHsF8LgqMSvABgrnsyQiGJ9gLZa/D/tZpWp8wLlQTUGcQslHshwVMuyUutpf82c1F7GMfGbK9S/B5OX6yM/SCkFxDeNFLBaizSz9VYT1EeOULvnkso0A+NcO7Aj0xoO4AGmpBeUqC69cbsGAhAmv2YqfHymQKU62fJe2dSwR0ohqScfWt8zYEcu7+KPv91lVsDb5TIkic0wprmLJ/ta51H5+HLx6wX1BGcY7oEdWM15YINGuqsQZSLO4yjApnTD11utfzqgRm9YZnsP2E+8wFHXMuMN+u3erVvTuXzCRoOu+MqBBIw+K6T8l2wxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxTE7U9gxALstTo47t2gaWwbfSs2w/i1xyFpKgtV2T8=;
 b=KWJjl0rYTDwNqgHd0VXFTrES/QATKL9sxTe1pNj3eWpT6hxQyo1N+a8K2agQyDHJoF6C/XlXgLImOjlIHy3U0RwG1NZ7wNU3zOGCB3yv8H/+xBV6Kkas3OL5HS23Dd5dzhw1cK3Lq/uV/VBsP4Ccz+s3gtZmJ4UUz0175In7psbD254k2NELbrBDCpxl9vUSuOPP/aWWbXKx5G549cdfVWiLqTL6C1FP+JjHMGLY+1rcnSlrc0Nd3xB//LPBurvmQbxpWsB9gJ/pebkXTOl1EzkJYpDw+fv1s7ExZUSYzAVTcNQuIcmX6ZPk7V7ADij1r8qB92H3jsG/LROR8VP5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA4PR11MB333279.namprd11.prod.outlook.com
 (2603:10b6:207:14a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:33:18 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 21:33:18 +0000
Date: Tue, 20 Oct 2026 14:33:15 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 06/11] lib/xe: Assert that cache is available
 for xe_wa()
Message-ID: <20261020213315.GE180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-6-528b575299d2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260923-wa_14026539277-v2-6-528b575299d2@intel.com>
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA4PR11MB333279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4511296d-0b48-413b-d505-08df2ef1c186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10070799003|6133799003|10067099003|18002099003|22082099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 5mYTfgUExvatidS+mUG37mOjerOECeJMesFPn/Vc+tpAFyhMmCoi6tHV9DgFGslcWBJag+m++YA7O1fraR2pI/K5dZEd4YqIgcYqUdLVLjnN3g3NJsHxZLcPI/e8DSuIRPPZtnlsyebHf0tew4tT/jIsUFyo0NloXvNy1G3OYAc9TUyuWRp5q8gW8GZz0pAUHtPOPTYUjEDEqX+MWNIiBhWPpnsH3529CkB0dm26Q6G9Rl+M9kjHguHkY+LwD7r7fDsDd9xUqFGTtLdAV8rqgoWaCr9TmsrNw6nhagUW87o6y52jFPMW8Zo4rStA3Ead/O8REmaOf4IgSOvsZMolg6oYqj2dpSCKcMxzNPWKLPU0F5B1Lm0TbSLuXu1Bg+oEZqSc6PR4s53IzXBOfHbe79w6pugX9T73tdR9bZMRHlh6nhKpzzhjHZ27TiD5cRrCny9OcwUWuQefMtjQFNSryqd31vPoGBXc3+8I3GFMudDQxqR+mGeCa+e4FggqpteNSKEbxbNZS1uYQVZFm9mQ2uUFWL0AKY3eJQIikhh1DwBCdW9vnm0e4bGHkucc0GGOMeKHJJ1tFz2o8SSmTVZjSri48cacmNAg6HFHXsDoHiZSeNv0N9SsejcV8Uk175WyfSYVacjVhTX+BB3lgQJehm9AzMTuZI/v2k3vpsPc8xU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10070799003)(6133799003)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GyMykA42Frxa4+jurngFwGbRNdicLLchC6vACKSc8HKq8Hu8yjUdK7P1Jz6l?=
 =?us-ascii?Q?O+Te9R17x3Nw1R4YxUpzysYJ2tJ4R35qa6Bk1j02iYm8pt7oD93x1viplzv4?=
 =?us-ascii?Q?Wgxg0Omo5DykEYdnHBs9ioS7jWBOMUXYA6o51/cM1LiSsmZGljC8kQzjzngM?=
 =?us-ascii?Q?l8P0W+81eIAExoSTsZAuIMSi+d4rD8cMLhGirMHMh8cCnKIrjnXphsUPys3v?=
 =?us-ascii?Q?KltgRzRzGK5JKP7EGTW4CqfNiapddABFX5v73Xk4h9aJAFnWkc8eBp6slyne?=
 =?us-ascii?Q?Zr6136MG46RyEffResVl1xwdJ0IfETvX/hd8+g1XQDBcyn7zk/4g5O3VZMbO?=
 =?us-ascii?Q?5MkIB5WKvRz5GTnta2zXMttJqGy9xFmIOGAIOQAOR84yApC/5SW42tYlfKpq?=
 =?us-ascii?Q?onj/Wp7ZhOf7IViA7+zms4HiMSsqlYyrbLf8kZHl1eH6TXpdoMWCcxlOyBgR?=
 =?us-ascii?Q?PJsKLjsw2Tg6yBy9vNRjGHVe4oWOCMXhlyKYjb2asvZRRGdvYvtpt6KcS4G/?=
 =?us-ascii?Q?uBQNFE5IFYF8EnLrZ5Ql2pbEL2Y3vN6zay5cR559fpcRO15HrwFRfdqbEOfl?=
 =?us-ascii?Q?c5u9MUTYHiJB5sJIbG8vfw+pzNh7LKgstBEB5gXgnNzays3Y6eDEARcVecHa?=
 =?us-ascii?Q?XOY9dE78e3JqwUtR3K12DeKGQY37X6cfijuzV9gsszjjlfLQBS+0mCHWLv95?=
 =?us-ascii?Q?NeuUjL8J8i5o/cx6Ww7sOHAdnDqlE/wsduhOpxpVzqmAG+QNj2/kPoh1ugfV?=
 =?us-ascii?Q?htKw6XJ+tm4TGwwWQDMiIV4kw9EGAvu4ELupavzzv2iYGUc/fDPI0cpLFuf5?=
 =?us-ascii?Q?8cVDcf+ickyrx65gJrUWOGS9rAEOU55v8l3s9yQTYdvnJD1UBt4fNFtvAXNL?=
 =?us-ascii?Q?K5syJNS9cFyWZ9ZR0hfef8otXwnfVrcJzJwKwxcZ91XOv3Ty/V4416toPJy8?=
 =?us-ascii?Q?aPq65xW2/ZTkB5IAawgbkX5OzISS6UHahJIwTfx4I6T/U5blckq54W/6YW9O?=
 =?us-ascii?Q?RqT1U57A4X7gg1OJTmT5hoKvwLUtdIcZ7cJ+DqImvzXgPf491N7sUcyim8VW?=
 =?us-ascii?Q?c4v1F1xIpP0yZOL835yFPdIfM2CCwnrFNMX51ttZAM5QAZr3PBO5vDhAWkUQ?=
 =?us-ascii?Q?hGvRvVNbbnWtNWMZuDu8tAdBunb/T9wom91c7WBg6/wjF9IeyYC+iPg0aI5K?=
 =?us-ascii?Q?waBHjYYsV2Fi6Gl3ZAkXpBdQ4kqYdnq5sS6yWLcP/8LzEl2om4cnlCl1929d?=
 =?us-ascii?Q?Tff18oAiGsRAcm0Fh2Tl/u7lvgMMY1ldNH2fS9Q+W6giNEPyUsxfgHSbVivB?=
 =?us-ascii?Q?8USA1b1XGALGuSEWVrxdv+m2Zgi3wzDrgKOilBmimLbYQ9JdmenaL/DwpnfY?=
 =?us-ascii?Q?JEJbvZn9Y1Qye1ZGaIfGbLDI9MzUF6wx4XLaODuStcHEwHr8oYFyjISdHBxp?=
 =?us-ascii?Q?/vtki0detCoX3Wl3xEOfI8IcSCePR8UhMIuLR1z7akq2sPzZi5F2m4Rb0sBP?=
 =?us-ascii?Q?aBANeGIUjV1LhnFs7/hHEjVgBFslH/zLS/L7X73n+k7L+FBOSicX1FUlSfmK?=
 =?us-ascii?Q?HSbf057k6kt8MjzPDVLPvJyHoKTzz7rgF2sYyiIbfbkEH0SDURxBC7IqRgeJ?=
 =?us-ascii?Q?gMNL0wtQqtpEyuA7xBl4CsnDjTRaNZlsymEt4PhA7pNHsPQI3dtl8Al9ndGh?=
 =?us-ascii?Q?j8wg+ECIfohAfN6MQgWzYpSnHinIvLVAe0wbOg1EupUkV/XopZ4ocJ2C/sRb?=
 =?us-ascii?Q?UBPuVpElW5dpY1TQaAuGZtoKIimaiZIQqjxybHogNJab+hhTOaMeAWB8dwms?=
X-MS-Exchange-AntiSpam-MessageData-1: tVaERUdo8BjRGO1TKAffuGnolPgZaqesrF4=
X-Exchange-RoutingPolicyChecked: H+U4HypbHPJoi372foU86BN/DBHWSPzG+wtBe7zPfFkJbeEDB3F7JrE/eskXzaX/uqteLAIRlHwNfFjEwb+jwpKmenWrTpj5HjZrTHTi44eOz0EjqEE4R8INhu7PScyWCMRWOWQO/bL5R5cLhq5eDM3GVaoMvEzZXDudYaHyu4MlMYxQfP4PQlu4y6+c7SGjkJBCCWm5ujOO/l1drSaMZ8Xv8fSLsZfV5lcfT45O3KEeDdxoLENj93QcxIH502CvMKmUoiiKHyM0hYihxatmfo9fK9oVE0OuPbw8ws/5ebpJ1LKaxkVgbQZXt5FY2bxDypiQ9GkQkihAcxg2He/+Ng==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4511296d-0b48-413b-d505-08df2ef1c186
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:33:18.1119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrDL1kDu66PCkn1WSOw6Mk+ORLDcUlni7kF6+asxIvrOSJiZh9oTKfAcWJsZcoiIldRftL0A4x7o0ZsXQ2hYEElZJPFFxnHrHxWoB/W57fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB333279
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Sep 23, 2026 at 06:41:13PM -0300, Gustavo Sousa wrote:
> While we do print a warning if xe_wa() is called without the necessary
> data cached in xe_device, it would make any test that relies on it to
> be unreliable in that scenario.
> 
> Make sure that we cause the test to fail instead by adding an
> igt_assert() to check that the wa_cache is not NULL.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  lib/xe/xe_wa.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index 05af64151e7c..5f09efd2373a 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -178,14 +178,12 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
>   * @wa: Name of the workaround to be checked.
>   *
>   * Return a boolean indicating whether the workaround is enabled.
> - * On error, returns false and a warning is printed.
>   */
>  bool xe_wa(int fd, const char *wa)
>  {
>  	struct xe_wa_cache *wa_cache = xe_device_get(fd)->wa_cache;
>  
> -	if (igt_warn_on(!wa_cache))
> -		return false;
> +	igt_assert(wa_cache);
>  
>  	for (int i = 0; i < wa_cache->num_dumps; i++)
>  		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa))
> 
> -- 
> 2.55.0
> 
