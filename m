Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF37AC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 16:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511DE10F759;
	Fri, 19 Apr 2024 16:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHxVghg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC3810F780
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713543721; x=1745079721;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=34NZc5sHK8j/Qk8y5g/hCG58W/hB8mqsqF+ZXgQGPOU=;
 b=LHxVghg8yNmJ7fQwlV/sMtlPjQ6JsKRTTtse/wDQDI/gEog+gRTEmbpo
 UEmNi3pyBHVbiPA1S/Ppy57TcNcPNM++HRJZjXUmyiGNyBE20C51KaXbB
 t2g4swX5WJVz9kPBGQwyy3BcjIdA8CVdmhvtB5C30KBnKwlmchptaDNaK
 Xtri7fc1Ir9w6S1FZonsJGfZfiaRztp5286klvMCR6qtihmQYaoja/VqK
 5yNJmG+VF1pcpTEX5Lzr34ZdZbQknAvyyQfguEXz9SLVc7joKd1OHbbxJ
 Wur17dPEzLnKtpDZlqSkGfe2Xj6gJZUDtJ20oq4G/BSWlgPRag8AA+csZ w==;
X-CSE-ConnectionGUID: /fq9QZQETdSB7+IsK7PYsA==
X-CSE-MsgGUID: wMPEdAEqR3qfjngqQzL2Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9324349"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9324349"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:22:00 -0700
X-CSE-ConnectionGUID: 6zr5FSaETB24sytxvrsVVA==
X-CSE-MsgGUID: Vs63ndrhTtW/pLndTex/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23444102"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:22:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:21:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:21:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:21:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:21:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lorKpusB6W99Hth1j9NlBq7L+d1u+1HPdpk2zY0YBBI3z1pCpaCmCwL7uHKF7XGp/14GZeMYdWAeywayXKIykmwZ9xXlR7+ff396gDGKEAP1wKgbayWoVbcmQbWEKPTtJFeTEzb2rBUfGCh5Pu9i0ZX5hVjUlxewbvOQRxyGS6spzLEEAzsf38xiZ7UTjgZPdea1QoB0RKUqnua3URYeep18oDXgucUKlmUGqlhy2L3UHwVuFeglV7z7X9ZAqj2VGzA2lrJtNpJLcBfRtyl8Cz84KzWhQBUJ5IAS6UukbhYT55EAV+JYzmLgLAUd8Zjj1wWBhwh7a/a7lpQYyeobOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVV5Su4846gkWKoBKtpGFSoZgFck6cSrXNzQvkzZfY0=;
 b=IP++q6w70C81c9EDDc0mZsWVDEbL5hU5/Kwd7bH/7COBNgLnyi0jdtaPjvEebwvlaTbba3S/8IAWVj+Kwjo1mY+lOnQuw684Y0GrdLWO/mxA4OgpcrT0BxmOyR7uAv3iOpSvkK7NnXMCHn6L4FuaJku5FVXCmMZK0cMp7N0fZ8HAPReIOg+3Hx8/KEdKFSruvURfAVXvbUn1kjN8WvH+VQisspHmI2SnhHpqn4RbbSBxAmwdRMDZveK90xVfiJtYr4hCKNYX7idk29PrtlGxYA4FvspwWW7CkT8j9Znee97NstmYs1f1B2VrF0UPLGK4z4OA0xKA5V8rcOaFe69uqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Fri, 19 Apr
 2024 16:21:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 16:21:56 +0000
Date: Fri, 19 Apr 2024 11:21:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 07/12] lib/igt_drm_fdinfo: Parse unit for engine
 utilization
Message-ID: <y7fso2phqvfqlcuedtrpuni5tk6ztgfqa3gr6id2fnn2l4r27r@2lymyjdniuv2>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-8-lucas.demarchi@intel.com>
 <ZiGjOeB2CSO7a/wO@orsosgc001>
 <36580d4b-f9c7-40f9-8b4a-16ff3b625036@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36580d4b-f9c7-40f9-8b4a-16ff3b625036@ursulin.net>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe9367d-e8c3-4f1d-533d-08dc608cd49f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iekRnMIJqSvb00/i3oCbuKpLUMeWDsbXVot/aNf0uaYdmGre2b0SCCJNlU?=
 =?iso-8859-1?Q?QSt4fHJw3ZqpkkJ0o6kkRVZLXjRiJHbE+TAuUqJhBJYjxVyZ178nWIi1dz?=
 =?iso-8859-1?Q?h4fWCI8dreH6rDf3Xhh/hn/V54pcRqTeosw+Hx5AGjG7Fvg4eXTiUNnDZQ?=
 =?iso-8859-1?Q?/vKnUwQXcSZm//aZfTnp/UAkPasmTyS2AQoSZJoBvIJvTJWYJ1EzzSFBuC?=
 =?iso-8859-1?Q?m5gkwb42xxMv35D+J3771jUyDnrsArNxTbLkrwjUcmZWWoZUpb5W25O1X5?=
 =?iso-8859-1?Q?FJyjU++5hbV4oU+60jy+zNWk/sy0bXD4KCMidPwBo6uJ0hZVHdSDpS9ArX?=
 =?iso-8859-1?Q?IC4eNFWDjpMsWDzD05eyrZdoNhFqa0o8DJRM4A5vTROtfiK+a+Fy8Vz7tv?=
 =?iso-8859-1?Q?pdhvGVJ9Yrsrk/ZSa/xLu4VJkGzhW00x1+YMtz6F9cSc3oRMmVFz4ANiyW?=
 =?iso-8859-1?Q?4HwUdesieLmEzvnIreujBPp/2M05hex7ZVsMNb1MiNt59I959rPN74Y/JS?=
 =?iso-8859-1?Q?BdtNuvE2VtHiM0dc101IbT5XkvfRhOVgU0V0c1ArUqhMg+2GjKVKPMccb3?=
 =?iso-8859-1?Q?7tDXWtVwm/UtpX9bPUa9+JPcHTorbHsx6JhfYU+R2lpTdvPl7O5HoXGvjX?=
 =?iso-8859-1?Q?nM2Qj7q1qte1E/cJu1ugFGYRUYvti97Yv86U3q1JKxQwAeD/nA2PpPixpY?=
 =?iso-8859-1?Q?WzUn3hyGBujnrkz7TVrSsrZDVM+L1ssSGzPv3R1woE/pGVTweKCOWXSdj7?=
 =?iso-8859-1?Q?+rMpcWPRnwvIJd9IiEPar8c7innRPZKXCdI3buBzc1PGStqxkxpUMTnzdt?=
 =?iso-8859-1?Q?HgK0QSkhe6SyTnZb07w11UFIopvtd0dznSMobw8cboKSwdXbhx+xaLpt2r?=
 =?iso-8859-1?Q?EetwOh6fZZVtguMLYx6pEumuLvts+Pohoe0uIRBHoQ6R5aPZBz1jBzhDYg?=
 =?iso-8859-1?Q?74w7oWnn8+TXolqTXbruhUC0fN2W1+aEangOTiAcDWHBIguRHaWKnJ7SaY?=
 =?iso-8859-1?Q?FKx1G/vymbskpUUZ20aChAelbYOXfGxv6WANnL68jbkfQMnnZ2A5R9j+Ho?=
 =?iso-8859-1?Q?Xc5u9omxnKuXJIx5NdkVSlSQRWlHRaG5+MbkafYJcS4wsw2mtfz2A8fApk?=
 =?iso-8859-1?Q?kvNAPUQ6EgrXk7AoDs/+92VPTo+3fiP5aRAlnK9hQ0KjNzO80/j9oTJmCc?=
 =?iso-8859-1?Q?I/keBMgXtjZ75p5PfPQXHuiKyb8S5H6INGKfgJ7jBXko0v+pBgYXuSu+Hv?=
 =?iso-8859-1?Q?CFQjHhAX8eoSbav/Kn3Rnx1C0FmuiK997vDJP5Lxbi/X786z9GqB8RAfxa?=
 =?iso-8859-1?Q?BjSTi2vLE3Ek/7QjVfbDED1m/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/3fHcueE47VKZxs5ZfXtVRlaiewQfvZZ8FynCYgyDrcFY68zk9oG47B1cK?=
 =?iso-8859-1?Q?soJ8etWPU2XW/PQtIaLqgLJE5XMXmQqqi2ACGU68k8a46j4ppaCESCQbAO?=
 =?iso-8859-1?Q?F2pWEaiTCpR22aZbfP38+sfOokLNdWwQEADzfSflBSAEIRcggJ6OyFK313?=
 =?iso-8859-1?Q?Gkrn930oN5yO1ZmT3mBxbuV7N5SLeZ5B37outZVHCxxy2X++Nmw/zYuF8I?=
 =?iso-8859-1?Q?fDVwv/T0qmgKJbdfAbnk6WnSrScDgaYhXFl5nlVWPoi/moYZjeVLuHwiQN?=
 =?iso-8859-1?Q?dgbc/VOh48zbY825lQUOWBJsZYWsvuOBzJjOj+WbQcu1+qT0GEa7atvD+I?=
 =?iso-8859-1?Q?TBgW9NTH6whaQNEVtkMEW2zAsq5uBxZ+KCXatCMcnTqhB3wev19JYBrlqe?=
 =?iso-8859-1?Q?6z8D0jdt2dW5m0SoPftsRTL03wZ6+7EPS5OQhf3G2URsYM2241w28pdV3t?=
 =?iso-8859-1?Q?e6ka1hOKMwifI5T1SNJ4VjR5svjporXYPeThGiRrHbzgG9klKiM5Ogs3GY?=
 =?iso-8859-1?Q?3augTiaiG61zocMACEp8qg8wDMtx4Vu+WOLERw7d6+QWn8nLNmFf3/ycru?=
 =?iso-8859-1?Q?814pTzy05TzDGGMcAoWhcleR1B28M5BgVDFa7XRr+y+4JuYu0JloG3cXHF?=
 =?iso-8859-1?Q?6CmqLaVMEWgPwuzzcC4huUnWqdqUkXNavtgTYBGNwt0FwtRybccwLCK/K4?=
 =?iso-8859-1?Q?0c6vyt4Jo0IYomOI4DMhcD0VvZc3lot4oMs0ipfxiejDjMvVHj7KymomqX?=
 =?iso-8859-1?Q?KMzA0l++lK8xYKIWBHzi62dSr+roWufLgoaffINDv3bMPxNMSoPir/wLjX?=
 =?iso-8859-1?Q?rXDB32XqpiOmh5XxE9No7E8hbWDGy7Be755Nc7TmvUaDqs/7vfLj8HEraK?=
 =?iso-8859-1?Q?nCbHM65oVjiicDi4YzHIwLzV0kBEBPcMpP3xgXKnzSVaNWUwXB3hJq3Pre?=
 =?iso-8859-1?Q?HjQm7BN9w+sOnYObAMVRDJdFf5Nk3dbfwbcZUb7/I6KNsxDDA6ILCOP5RJ?=
 =?iso-8859-1?Q?3uZObUu397QVtvoN4ZLSmASUmtUflM7UpWbXc6zjtVqYvbhHw4E1lQGQG3?=
 =?iso-8859-1?Q?34aMnzEoI4eOwyKSE+4GISKifRlzTpzmJSfFE7GK2RcosfOs8H7mStLKRy?=
 =?iso-8859-1?Q?ND5kgVY6EAupPnQuCkvguWDsPb4HYI+FaV+B+CSW/AGSzv7aw45WrHrfM7?=
 =?iso-8859-1?Q?kG8zXuEZ7Cl5IvS4GEjKLJCAWZURAyvSP8l4c7UTeIDVkSx2gmh9yXz40u?=
 =?iso-8859-1?Q?RJ5A1KM7Ubyuc4ABFqv4htIidTlM4nD0KgRulWaC+iudonWccYohDuhSEg?=
 =?iso-8859-1?Q?v/W+KUuYzraDmoqNUfvZKlmQoqW0lp0/+d1vsaBDUTZ7IXaAVQSgJ1tDuz?=
 =?iso-8859-1?Q?r/jvVApJaPiC3/1fCDtnWTJBohJXfd3oyn01Nxfznm4IpneJNgWDVMks6s?=
 =?iso-8859-1?Q?ZiPDGIY4FWZEMc7ldPIkmfGWi6ZRM5Inm7yD78VdhwGXimAO39xct/Q6BN?=
 =?iso-8859-1?Q?JuRUClr5gl+7cXDXPrOg81bbpLgbfZzQzXoW9eOuxky/kT6sZTZot/y9aK?=
 =?iso-8859-1?Q?+/O/TiaAZGBhlg/op2uwP67dokQYRghYsxiICX9XqHjviBXYDZEISOF3I7?=
 =?iso-8859-1?Q?rKZFCI9DDz8IUWFxmkMq3W2K5l4/yFtp8nvmR964YCR2Bhsh4pZvnlfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe9367d-e8c3-4f1d-533d-08dc608cd49f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:21:56.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxsElDU3p95Isxzd8ivaFoU9ASfqH8D6pcQ0DKRmWsuWiV9Un4nkQpkh5ep+Lt5F+gvwF0hdv9c47OXwp7Tp9nBAzSA9Di7xEldVuSCv1Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
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

On Fri, Apr 19, 2024 at 08:58:25AM GMT, Tvrtko Ursulin wrote:
>
>On 18/04/2024 23:48, Umesh Nerlige Ramappa wrote:
>>On Fri, Apr 05, 2024 at 01:00:51AM -0500, Lucas De Marchi wrote:
>>>Kernel adds a " ns" at the end of engine utilization. Make sure we parse
>>>it so we don't fail if there's another suitable unit chosen by the
>>>driver or another format.
>>>
>>>This prepares the ground for xe driver which will use 2 timestamps
>>>rather than 1 with a different unit, to make sure it's compatible with
>>>SR-IOV so we don't have to handle the conversion between GPU and CPU
>>>clock domains.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>lib/igt_drm_fdinfo.c | 22 +++++++++++++++-------
>>>1 file changed, 15 insertions(+), 7 deletions(-)
>>>
>>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>>index 5f05f210e..1541a62c9 100644
>>>--- a/lib/igt_drm_fdinfo.c
>>>+++ b/lib/igt_drm_fdinfo.c
>>>@@ -63,9 +63,10 @@ static const char *ignore_space(const char *s)
>>>
>>>static int parse_engine(const char *name, struct drm_client_fdinfo *info,
>>>            const char **name_map, unsigned int map_entries,
>>>-            uint64_t *val)
>>>+            uint64_t *val, const char **unit)
>>>{
>>>    const char *p;
>>>+    char *end_ptr;
>>>    size_t name_len;
>>>    int found = -1;
>>>    unsigned int i;
>>>@@ -103,8 +104,15 @@ static int parse_engine(const char *name, 
>>>struct drm_client_fdinfo *info,
>>>        }
>>>    }
>>>
>>>-    if (found >= 0)
>>>-        *val = strtoull(p, NULL, 10);
>>>+    if (found < 0)
>>>+        return found;
>>>+
>>>+    *val = strtoull(p, &end_ptr, 10);
>>>+    if (p == end_ptr)
>>>+        return -1;
>>>+
>>>+    if (unit)
>>>+        *unit = end_ptr;
>>>
>>>    return found;
>>>}
>>>@@ -212,7 +220,7 @@ __igt_parse_drm_fdinfo(int dir, const char 
>>>*fd, struct drm_client_fdinfo *info,
>>>    while ((l = strtok_r(_buf, "\n", &ctx))) {
>>>        uint64_t val = 0;
>>>        size_t keylen;
>>>-        const char *v;
>>>+        const char *v, *unit;
>>>        char *end_ptr;
>>>        int idx;
>>>
>>>@@ -237,15 +245,15 @@ __igt_parse_drm_fdinfo(int dir, const char 
>>>*fd, struct drm_client_fdinfo *info,
>>>            strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>>>        } else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
>>>            idx = parse_engine(l + keylen, info,
>>>-                       name_map, map_entries, &val);
>>>+                       name_map, map_entries, &val, NULL);
>>>            if (idx >= 0) {
>>>                info->capacity[idx] = val;
>>>                num_capacity++;
>>>            }
>>>        } else if (strstartswith(l, "drm-engine-", &keylen)) {
>>>            idx = parse_engine(l + keylen, info,
>>>-                       name_map, map_entries, &val);
>>>-            if (idx >= 0) {
>>>+                       name_map, map_entries, &val, &unit);
>>
>>Should we ignore spaces in unit and then do a strcmp(unit, "ns")? OR 
>>are we sure that there is just one space prior to unit here?
>
>Any type and number of whitespace shouldbe handled.

I can change this in igt, but...

>
>I guess in drm-usage-stats.rst this needs to be improved:
>
>"""
>- Whitespace between the delimiter and first non-whitespace character 
>shall be
>  ignored when parsing.
>- Keys are not allowed to contain whitespace characters.
>- Numerical key value pairs can end with optional unit string.
>"""
>
>Perhaps append:
>
>- Whitespace between the value and the unit shall be ignored when parsing.

that would break userspace. Both nvtop and htop already do a strcmp
with " ns". nvtop seems to use it for specific platforms (so as long as
we don't change the existing one, it wouldn't break), but htop just
handles that as "GPUs in Linux".

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>
>>Either ways,
>>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>Umesh
>>
>>>+            if (idx >= 0 && !strcmp(unit, " ns")) {
>>>                if (!info->capacity[idx])
>>>                    info->capacity[idx] = 1;
>>>                info->busy[idx] = val;
>>>-- 
>>>2.44.0
>>>
