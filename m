Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007D0E77160
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 23:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FC110E0B9;
	Tue,  3 Dec 2024 23:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JadiJawM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594F410E0B9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 23:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733267837; x=1764803837;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wiJbZCvSZYEnav4CzoNxEMnMEgP8bFtQg7bHR2RDaW0=;
 b=JadiJawM12XPT2vbNCLz2hWO9dvLW4KMq+5dCS8CucR4wC1ac8SwehF8
 EVm6YFdRsX6YXhhAamxiTVUz3QbJco2xf5l1eIRkuD4sK4CMRUrDBQYnv
 gnQy/JSoMb+eb6MZpc3PC/VGx9qhahhhKveW/Jw5r1DsU3kQSWWqawkMK
 bcxpxGywmyJhTgl0fxS/vzaQlKOOwy71O0PZ0AnmBrw5hQlS+C5rT5SQ3
 WG499rbgASZZXosr1nCs6wI8CC2W1A0eMBX2YeyKmDbtMdKEf7aKJlZSR
 E6tyyfO5yrOOUI1mkTET0OKBd/cL+hi0VczucWtBBkQ86QRHSB12mhgyE g==;
X-CSE-ConnectionGUID: Dfq7ot1STb69zCnX/aajuw==
X-CSE-MsgGUID: q/X2VczKToqoDX61QwGs/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="43989411"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="43989411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 15:17:16 -0800
X-CSE-ConnectionGUID: 5cjYaePiQhSnqQt2T6hD9g==
X-CSE-MsgGUID: b+i8FWofTLWNNjTX+ClO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; d="scan'208";a="98013890"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 15:17:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 15:17:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 15:17:15 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 15:17:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cizv8xNuSTtCb8VeH69Ddv9FbObQBrUbZsLgFmPhNDx5ZR7GtgQ4UALWy4s4rt8bu/VLMnHdZAI4U8/cMAHLdAgaX7moKOf/O14wpGJbrZhwMdOfwkcDuXIt2YHXnKIzS217ZJSoecpQNdYb4Xom+2dzo+ldM7G8cTQrR/sSWWAghgB5OApaKOZfJY2uymSPIVBTe9FHobxsSrqukEhaIZl/0wexuJLk4KEfPicVMbJqG2Qu6EwZpKFBDUlUSFERV+juOsmNohWnBa+FcfKUYSbmddNMbTcEEgaEDmdmNAKMUJYyKMkp/rvtKzw7UUlfEXiiEAp7rZ2PauGX7ov5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55ClPGbgDexsxGhxdt4Hz9jTPNf9UCcNmcj/vUsXEp0=;
 b=XT5pbH6oWxN4P6XAeSorsmXaYE9GuRoEsbwf7VTqM0DsiR87zD+OGdQpIl1g9lc39RnPO2o9qormIEzP9b8wFD7+LlCQbbGHHTli0nhRRznu7AMVGufXPUwedfiUH9w9S30k5KtdHEvkodK/egeoyQ6p8jDms+oCgyW9AhgT0sB4oFcW5izlGltAWboDuBrjZ9MvQHW7ldpOS2+JBY/6Ap2jbyKySQXmTORDumockbqNr/XwCP861849jLyxIgMjy2z71LCi+EM29ulEdHKQz5hfxw76JGTfLnCb34/qxlMWhTxwG55Rcz0cxdym3xmZOC2f0El8nodZR876j2skuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 23:17:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 23:17:07 +0000
Date: Tue, 3 Dec 2024 15:17:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e_for_serie?=
 =?utf-8?Q?s?= starting with [CI,
 1/9] lib/igt_kmod: Remove unused module_ref
Message-ID: <20241203231704.GM4891@mdroper-desk1.amr.corp.intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
 <173203520559.373309.724792645696617234@b555e5b46a47>
 <jv5wepyykcudndxiszdjnumqlfmtxzvq57nw4kggydhrlhige2@rufphvdmtsu2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jv5wepyykcudndxiszdjnumqlfmtxzvq57nw4kggydhrlhige2@rufphvdmtsu2>
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d48f4c-3c05-428c-ec4a-08dd13f09ad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8oTtsO/pMW7Ci/Cc5dIHbmCT05Xm15+GkLfEjzstKD5bpRZsDHQL6Fpd7hNB?=
 =?us-ascii?Q?bnZGNd4b68E4Bquk8OCTUxmlD97Mf9eYNui6W520xi+WR5UnMXQwHwTvCHC8?=
 =?us-ascii?Q?K1WkXs0Tq+/VBrLlJS7kNazt9+EDg8eTLzGd3q/xVZqTKEadUvUhDndRGNF3?=
 =?us-ascii?Q?XUct+Udt/UG5CSnEDIhI6o1ZlJDvRdQoukmxNaMKXC7dkrAvVAswGnqIzo2H?=
 =?us-ascii?Q?JZJw2gDuVw5ATL1qaOUxeyGpnduoFNsizHTPIPbNijfUEUU372eAJKTyinR6?=
 =?us-ascii?Q?t+hMHFOF8viTD1GMDeoWdU69LxkIjXJvnG9Ay6b1suHsqmX6rwKlePUdCQ7Q?=
 =?us-ascii?Q?nvGYUIuZZZ/tqLX+g6+ZE6DNxnoSSQHdRJNMsPj1/x9x9VNz65zcVtpIybTF?=
 =?us-ascii?Q?ptm2lGto1exdk3A24+N1v9j23mRdcUVokuVk5xvUZ6sw8tiMe6DbQHbesv1D?=
 =?us-ascii?Q?5GxClVeAXyIuiQvHG54ZyjaARbMZdqUDxxTTZoziVG13gxp7C/UYZq10cMPy?=
 =?us-ascii?Q?yJnKaSpHLw4uXYQTakiEoPP9GesjAk7x2LUgOzCfS7v6wkjwc864AYghaHCZ?=
 =?us-ascii?Q?9IcHXWQQ8834Mik+jZqkrug6Ki4CsUdGTtbfMLs8lCJWKRkHwa5oOZG5wuU3?=
 =?us-ascii?Q?uCQjCwilDuzsUmVCym6B7NkEWUXvX4h6AWq13VGgerRMo5s86ZYfj40Af7Kz?=
 =?us-ascii?Q?KU6Xmz9ThdoYFwNeMKdqKAnWuErzrF8FFfgFoANcZbtOzM4ySNLGNVgJNQi3?=
 =?us-ascii?Q?33Z56iCoV+XPltitac4RNo2xsqSyC5ASOhzi5z3fb3Yerk8TavpTnsiE5rqi?=
 =?us-ascii?Q?OBUN4F3LZOtSnP9E/1vXm001x93ijGaXOfzWqpngJBZl6dlT0JpSrD3tuQvV?=
 =?us-ascii?Q?ccY/z2k7ghPIr9Hi0W25Bpkg256E17M/tTOXHfpB7ABSnR8wIaK0fsWZVQoj?=
 =?us-ascii?Q?cPiMKsnZUS+iJeUFBP/6QiOEiOdzfvl0wdrKbua/re0Y4u4Zzrjmwmd/k/3I?=
 =?us-ascii?Q?IqmOdgnI8HSRGH9qhiNFEUblt3bGbXip3IkOn4+5Io6Iof3KAKrfYhvFAdXe?=
 =?us-ascii?Q?cRy8n48hg5fG7vDcWXbb8wiRwdogKcN6IwntzLgVMMM0sRa+0ykTWOaMcMs1?=
 =?us-ascii?Q?mSmonaNVotY5ZvOqW/H2oe97fn8/iBWcOxGRqU/sb4vOle+F9vQ6tYEl5Lmq?=
 =?us-ascii?Q?UaYxGZj0Z2NokOY3dBYZnzQuudaMJrNC4GfCa3JxYFbzJU0D/iF07yqg4Lmw?=
 =?us-ascii?Q?d9NQ3Na6JQta4aVnSESovkTKG+x/JGW8hSl6wLSjZ0Kat33GTVYdqx8CYNbV?=
 =?us-ascii?Q?wMzTj4pXkg5BWbGuzd0oLKRU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RaxjNQRTZGZ44dbytxfdv0wsqE/nORguC1uy34F7EvVVA5w7ezQeHwtYMWJB?=
 =?us-ascii?Q?J+6eQ/ZJhAl4K318Mv/2xdSw1fVP6xgtRN/lmbM9ZUeEoA9O0SdnzlbyX06W?=
 =?us-ascii?Q?jTX+FdA+wUhB3jPbJE0IhIvDFx3YApZgnah/Rl6iePikhi7zPKhfEOOac0vf?=
 =?us-ascii?Q?FWmrTZANuAXApwL3l0z/fyzyoErQFkPsYrES5Z0GsXxqxMuDzqbmxqEf77Zs?=
 =?us-ascii?Q?jm6umn+0hzj7oLNWd7AbqTr0Rh7fwFSFSUxs8LIvslCQk1GVfCxa117CPrWr?=
 =?us-ascii?Q?BQyw3cVdLRjhmq19biso4L80+UpfM6Uc2sqm48nCN5aMxak6fgqi1JiUcIOr?=
 =?us-ascii?Q?a0ft6IqsXapOK2bfUj8+upD1X5sAY/XOYnrYWBV6AmPvetqNi9MrnzYaGybg?=
 =?us-ascii?Q?JTxeYC0UU1fwdzxguoXG3rnXkJJ/AgUP5TcWmR1Ndq1GPn9ysMwfgtj3krWo?=
 =?us-ascii?Q?mueeN5nk07U/qbYU9nWoNp1SRak+jvjbVIzT7/qa3d1qhDbA5rMJTwfPfELO?=
 =?us-ascii?Q?fCoMZ2EoicRjrHpQFXz4sJSY8TuYfVSA6tKlEWrYRofUitP19zNhPjbzWgtb?=
 =?us-ascii?Q?gcNCvC+ZsVY0wLr8yPjTDkewpGK4AwQOMNUOj57SOhk79CxBnyhtEifQ43pc?=
 =?us-ascii?Q?VEPlaMugHHM+1GaF3zLZfelRjUw83HXfv2QnOcyA9b9iAgIqrgwVCPQ/5Bxn?=
 =?us-ascii?Q?DMovbLKNSRckTdPvMRzsgsbtYl1GH+NiR+JVyS5lhpJIj+o9/WxvkvXo8SCe?=
 =?us-ascii?Q?5bX5hKCRSc/FdxGdWHNJyOrK6U+CbDhbQIoNegMZICkBeMIoZPo+jjjWHUsD?=
 =?us-ascii?Q?86NLJMyaxpU+9TAqOjvcn6CKvAW0CSyo5rdf36ZNaC+DCcUlsl1k9k5iF/I0?=
 =?us-ascii?Q?6lDjgXkLSMxqoslolkxhEQ8E5VamOzh6SWUbX9+6/RcGEi8cBvOb9fdX1NoD?=
 =?us-ascii?Q?Qh6tq+JAGE+ijp7lbUAaADKkRf/chRtfYFsQG4IAal2Gkja7yN/v2DtLnX3u?=
 =?us-ascii?Q?EkH0P7I1ktfP57vlACLaA1qW4ogclQs4BqQQfi1dXGIZ/t7ZdP1MHbcFhJbF?=
 =?us-ascii?Q?3PmONVkycbAbKqok7AiKosojmP7bNY2h2DhSfFUwoUD1lWtESpTeyWPmIxJU?=
 =?us-ascii?Q?51l35ZIC3YAH7T7INSHva/Xpn1UwSOYe8f0P3kV0RXsbipzpJDbmNUmWRhCf?=
 =?us-ascii?Q?Ii+nKY72xBpdnqUvwM2HtJz6NH/kAv0AnGiRjsEZMD0QAGLjdJ1EpueEQIik?=
 =?us-ascii?Q?suZGvqDEvjYnv1B2DBFVB/IA+b2x7q23uUYhq2FDRwHDOIcjYTOm8TSE9X/5?=
 =?us-ascii?Q?vKq/kElt8fR4erQ6kBV0CjM1yRjf95t+aI0w31cyQNC782cmTmuQN+MqFi0l?=
 =?us-ascii?Q?q54jfgEsYcTXr6fA7Ul14yDA6jMv5PvYd8KT9fBk89w4WTghnyuTjiZ6fliC?=
 =?us-ascii?Q?Hv+sPoEk8JpNR88Njytw6MfUlxHzGpsjv85CE7S/rGY92LwIcQ6Ft4Eog0a7?=
 =?us-ascii?Q?I6kKrlQTZ27Po3Zfh0EQKZIGQUebIYUj6fi6E+ouJG/PpKBqkbc6p76Jhkk/?=
 =?us-ascii?Q?tDJW1L07fhM4HtJkXpm65S42QIzNxWcVJJlmVk7CDwz2lL03qEpIUSQ2H/kl?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d48f4c-3c05-428c-ec4a-08dd13f09ad6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 23:17:06.9320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90g1lqtdoyXxah6Flq/BF4a5VSPlty/ONu3Kylr/scPEKaMnv2BcHQn7/ueXf0u8+4/bhoCCPK864AhWBJxWy793sT5w1qclR88tElxIpU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
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

On Thu, Nov 21, 2024 at 04:02:16PM -0600, Lucas De Marchi wrote:
> On Tue, Nov 19, 2024 at 04:53:25PM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: series starting with [CI,1/9] lib/igt_kmod: Remove unused module_ref
> > URL   : https://patchwork.freedesktop.org/series/141532/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from IGT_8118 -> IGTPW_12135
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >  **FAILURE**
> > 
> >  Serious unknown changes coming with IGTPW_12135 absolutely need to be
> >  verified manually.
> > 
> >  If you think the reported changes have nothing to do with the changes
> >  introduced in IGTPW_12135, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >  to document this new failure mode, which will reduce false positives in CI.
> > 
> >  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html
> > 
> > Participating hosts (46 -> 44)
> > ------------------------------
> > 
> >  Missing    (2): bat-mtlp-9 fi-snb-2520m
> > 
> > Possible new issues
> > -------------------
> > 
> >  Here are the unknown changes that may have been introduced in IGTPW_12135:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >  * igt@core_hotunplug@unbind-rebind:
> 
> oh well... CI is definitely not happy with this series, hitting this:
> 
> <3> [152.880835] i915 0000:00:02.0: [drm] *ERROR* audio power refcount 1 after unbind
> 
> Need to check what's going on

I think that's

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3467

which we're now exposed to more widely by intentionally not unloading
the audio driver.


Matt

> 
> Lucas De Marchi
> 
> >    - fi-cfl-guc:         [PASS][1] -> [ABORT][2]
> >   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> >   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
> >    - bat-dg2-9:          [PASS][3] -> [ABORT][4]
> >   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
> >   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
> >    - bat-dg2-11:         [PASS][5] -> [ABORT][6]
> >   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
> >   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
> >    - bat-dg2-14:         [PASS][7] -> [ABORT][8]
> >   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
> >   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
> >    - bat-dg2-8:          [PASS][9] -> [ABORT][10]
> >   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
> >   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
> >    - bat-adls-6:         [PASS][11] -> [ABORT][12]
> >   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
> >   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
> >    - fi-rkl-11600:       [PASS][13] -> [ABORT][14]
> >   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
> >   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
> >    - bat-dg1-7:          [PASS][15] -> [ABORT][16]
> >   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
> >   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
> >    - bat-rpls-4:         [PASS][17] -> [ABORT][18]
> >   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> >   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
> >    - fi-cfl-8109u:       [PASS][19] -> [ABORT][20]
> >   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> >   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
> >    - fi-kbl-7567u:       [PASS][21] -> [ABORT][22]
> >   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> >   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
> >    - bat-apl-1:          [PASS][23] -> [ABORT][24]
> >   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
> >   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
> >    - fi-tgl-1115g4:      [PASS][25] -> [ABORT][26]
> >   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> >   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
> > 
> >  * igt@i915_pm_rpm@module-reload:
> >    - bat-adlp-6:         [PASS][27] -> [ABORT][28]
> >   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> >   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
> >    - bat-adlp-9:         [PASS][29] -> [ABORT][30]
> >   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
> >   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
> >    - bat-arls-5:         [PASS][31] -> [ABORT][32]
> >   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> >   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-5/igt@i915_pm_rpm@module-reload.html
> > 
> > 
> > #### Suppressed ####
> > 
> >  The following results come from untrusted machines, tests, or statuses.
> >  They do not affect the overall result.
> > 
> >  * igt@i915_pm_rpm@module-reload:
> >    - {bat-arls-6}:       [PASS][33] -> [ABORT][34]
> >   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-6/igt@i915_pm_rpm@module-reload.html
> >   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-6/igt@i915_pm_rpm@module-reload.html
> > 
> > 
> > Known issues
> > ------------
> > 
> >  Here are the changes found in IGTPW_12135 that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >  * igt@dmabuf@all-tests@dma_fence_chain:
> >    - fi-bsw-nick:        [PASS][35] -> [INCOMPLETE][36] ([i915#12904]) +1 other test incomplete
> >   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> >   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
> > 
> >  * igt@i915_selftest@live:
> >    - bat-arlh-3:         [PASS][37] -> [ABORT][38] ([i915#12829])
> >   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live.html
> >   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live.html
> > 
> >  * igt@i915_selftest@live@workarounds:
> >    - bat-arlh-3:         [PASS][39] -> [ABORT][40] ([i915#12061])
> >   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> >   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> > 
> > 
> > #### Possible fixes ####
> > 
> >  * igt@i915_module_load@load:
> >    - bat-twl-2:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
> >   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
> >   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_module_load@load.html
> > 
> >  * igt@i915_selftest@live:
> >    - bat-mtlp-8:         [ABORT][43] ([i915#12829]) -> [PASS][44]
> >   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
> >   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live.html
> > 
> >  * igt@i915_selftest@live@gt_mocs:
> >    - bat-twl-2:          [ABORT][45] ([i915#12919]) -> [PASS][46] +1 other test pass
> >   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
> >   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
> > 
> >  * igt@i915_selftest@live@workarounds:
> >    - bat-mtlp-8:         [ABORT][47] -> [PASS][48]
> >   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> >   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
> > 
> >  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> >    - bat-apl-1:          [DMESG-WARN][49] -> [PASS][50] +2 other tests pass
> >   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> >   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> > 
> >  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
> >    - bat-dg2-11:         [SKIP][51] ([i915#9197]) -> [PASS][52]
> >   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> >   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> > 
> > 
> >  {name}: This element is suppressed. This means it is ignored when computing
> >          the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> >  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> >  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
> >  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> >  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
> >  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
> >  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
> > 
> > 
> > Build changes
> > -------------
> > 
> >  * CI: CI-20190529 -> None
> >  * IGT: IGT_8118 -> IGTPW_12135
> > 
> >  CI-20190529: 20190529
> >  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
> >  IGTPW_12135: 12135
> >  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
