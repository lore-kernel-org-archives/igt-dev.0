Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10EEC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 21:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236A910E034;
	Wed, 19 Aug 2026 21:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0Zn9+0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAD410E034
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 21:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787175611; x=1818711611;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=82x2K6n+di8AqgHGU4eAhEjfLEESY0ukUhXnON8k4Gc=;
 b=m0Zn9+0BIwF+Wz/nCQIg21Q6VWeH160lwsMmfN8dokgUzmYpvq14yRQA
 P3ycVBSwZJQRsBSAFkf5cQk0biSv00W4MzjKlenYUgVLghFNFrNLm4RNb
 UyA2yqvNVznTlkhQrGN+3AE+OSj9tmxvSnGwM7O5D8BIiolRDY67vfbb0
 /Bf65NsxR0RkK4F7+1bM0w68PeK2jOjctUB53xEK/r3ry456YhABdXr71
 X2Ch9hREeqkWxhjpVZDnuJo6rk+9SOfr2nWjSY3NYvhcQcLW0zPMccgse
 P6vESajyBi7KoDC/FfSzTYhOokbqmpWZBhQfIpVHzVjL1Nyxg0NHjo5ra w==;
X-CSE-ConnectionGUID: O0VNV267RjS54u5XQo8vmg==
X-CSE-MsgGUID: /mjK4TTqSM+DLSO0B29Zrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98038859"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="98038859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 14:40:10 -0700
X-CSE-ConnectionGUID: i/lLZz8cT32zVZ9MaNvGHg==
X-CSE-MsgGUID: nhiiUDLNRx2yv63bH6ryzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208";a="261450300"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 14:40:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 14:40:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 14:40:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 14:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaWiGCyOuVR9wou6tVRSdxTKEECZFRRQxsyIFVxDhE+77LqdQJmjXIbd5B1u0ISNL7VMSUrHtDrA9VJEuNiA2CQRR9lnDkPD5jiQ/+lzovH3jXD5g+jc+sAfIIMNsvpfh2pLx+dGSimdufVSbVBTGIZ8/VWOz892fVqz79NqfIIxfLNU0W9WBzkavU1wBXYhFjBThdq2b6mM2/nlc0keik65Ea2oiMytYzlMxy9OCwY39Tsl6YpYodEpBovx9LOZ7LaukUCSJ7iH5Gy4Qm7Tp5ilFcvfIOZQQ2GEPS22C1OUvWx1DHQnRfQOd/R/0FcyGeLu+GWIUtj+AskWeIovfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gFNmwGYeBkwDl8pIUoqqS+qVK9T2PuOdVOHTZotb2c=;
 b=lsG3CW6EaYthOwmgg/8aVTPVnIEhxDKMq7nTqdMRuwo3qJMLtXE4Pn/6DZQ2fwjfIip9RZwLOAIrQuDg8u7Tx+9pfsso+1z5TudReBDI2RKZH//UeQeXvJpbe8f50mkOnfhrnLpjXY25rTVQF9f2HU3/OtCAoj+VD7Nah3tyQbuZbgFoJatF4ZP9/BqN1BgSKxaYo4s45Yojs6du9b/B6MxFH9XR6tov9udKO5oj81ChUSqhcimEX10P04jqQI1AJzae14mT02T76p5zdy/qVunhEcqW9lTxSSRRzoBDxzfppSw1o/zfk9GwXBJjqh7chBpknoMHqKFCEyfW7l9k/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 21:40:03 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0292.024; Wed, 19 Aug 2026
 21:40:03 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 05/10] lib/xe: Return boolean from xe_wa()
In-Reply-To: <20260819205000.GQ8279@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-5-0c147eeefefa@intel.com>
 <20260729221424.GE7790@mdroper-desk1.amr.corp.intel.com>
 <87tsorb8t9.fsf@intel.com>
 <20260819205000.GQ8279@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 19 Aug 2026 18:40:00 -0300
Message-ID: <871pbtbxhr.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:a03:331::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea9c96e-a32c-4305-2911-08defe3a6d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: D6VVSTPQbz92lVNvy7Tlum3JQk+XoJ7YlF68013Q7z9Ey9/Gg/x54qO/EqTKWj3FOR8yQnktdb4ViNAnGUtXKVKcg1BocNWgQkl+dYr8A5aCCOgUs0itTQxJjVH9wGxRfik9xocYurPBaAn/akcOTeyz0K2i5XC+sx7syGKS76vV/GDEJiR9SNIhHHtWt5Nm+fnlo2IBhsVPVvwU5Xvemu4gYcKOWuoAr56Njg7NVUrmw1e1GVK3sjh+47LkW4NiPlpC4LlouRxnY1cnoErnAYxthh46yVUUO1efpqviC2igZRySitTYIVH6cF5gje7DoBG4SWoLOufhvlqM7vc3+G6nF9gJtcjl7TXn0A7cxTdo86AUot2iD8RNM4EZ672sufWHPxaifWeyoiludb8+YvZG7pvLvJ35GxaBfIxrra0OWDpRPRyBbYKO7fH49ccymYGvweybHF5yVuYKaH/8ujOS2D0j14YjH1CDCdVlEU48P/8k2K+4xjTYZHkSw0SuFDnS8ii+ZvyH/UT7feKhkEHw6T5PbbjiRqVOUOyKvIPzslyv449UefPzMRfW9Wq3pFOxHIMUPnIBRwxgGcltUjSwDFgczoyoB737BXU8pgra+mkweE2VThxqSZQ3tEwkGxGSICTbAfOc9O6LcKUmoLDMFRhwUQgaUrJK7d5WMA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lo4lJD5cGAEcThOp9YCsr9II1AwutPS8iTj2ZCbPJ0QbAAPHh2zdmEBXm6tc?=
 =?us-ascii?Q?oLDBrWC1fMtvvElNtoQU+Trvn5Ja4k6hh/PxKy+WZBRjCcXm56eeGYJYw15A?=
 =?us-ascii?Q?bkvVfGSVV9Dv7+GCV+3IznIMHq8sGvtv78gnHVO1FdwMn0Oq0a5mugJVxOqn?=
 =?us-ascii?Q?GTPr3X/X/PozpTyEusnQbxS2jwSjIpiH+X27FltHFEuTzg0GQhdAhzYv9z8Q?=
 =?us-ascii?Q?nVs/pQZgopiCGZYGx4LK9G/666kKatNWLbPees6c6jCTmWsaISl0fihixLkO?=
 =?us-ascii?Q?ZBUGoQMJF2TV+hwWlYzrTeN/M68Ool3/Osx9kL4WT2tw0JTno2+jxnbU7Ccr?=
 =?us-ascii?Q?+bvVr8X8PfWu+fZSbK+glN3sarBkF3v44uALbXZHnU6SQ4O+iciNSP8M6MFC?=
 =?us-ascii?Q?zM9OYuTZlVAsDdpLpo7KlSVYTb/0jOy+xcOGkI4fcwIbk1dVKtndLGF9dSWZ?=
 =?us-ascii?Q?pAPHxy2S+Mx7hylTFxwhI9Cpta/7sUx+idBlea7ctrBtTIUqXSLjl9rkCuvt?=
 =?us-ascii?Q?Bm012FWD1AK9UPLBlwAsePA8LVJtjsLQHTf5auYNBxbjPyTh4dqsQg7wQHL0?=
 =?us-ascii?Q?ks1IJzGNJoGX0QFyWWEZrF5kYFOlOfT+oX0EQ9DiORph6W873o7YbuReUOKP?=
 =?us-ascii?Q?NnLIfE0a9YRM/koAfqIOwuZFKrC86xUbTmpskqAgcZ2rst76LDI7BBmfK2Bm?=
 =?us-ascii?Q?TqsUbvC1JsDb4Gwa8OCsC7Mj8Mx/maqKpdkCDljgPmgg+KqeqKEGS8r2tuxq?=
 =?us-ascii?Q?1wR2SKZ6ARkMeWff6cxGyBDvm+Nsl1AWfhfS/Jd0KEUjeUzlhQiTiRKsW6mW?=
 =?us-ascii?Q?rCMETAuq4B6bMSyC57WZ58iQO203tl+/rrzgXk4oBVa0G6UHEmbdcuWvGU2y?=
 =?us-ascii?Q?DuMLwPDPIHtJFc3x6+6NfSqNsJkW4QwMd9zfRO1qvzB9JH6sXmh4Cd1cNJuR?=
 =?us-ascii?Q?my6eutFZUugF6Yf9i/gQOHuh4FDQZ5RmGuxRg54rTaJkXtabx3nCom7cYLqk?=
 =?us-ascii?Q?o8LY1GthKCTa8R/c/Sdv793jSXZTlVQoxH/2AiBzxqJiez0NqrNh5wpTUpr1?=
 =?us-ascii?Q?Nn/4UCKD7bCHWw+fWAPjKzCYwYrTCkY1tJ37RWp7TsDcK1zlGht9pWtQpsri?=
 =?us-ascii?Q?WafVOwC91KIG7VmKvMkrkZ6Q0AL+p1TllkT03ThzjskjvTyJUpstjrp2s7b5?=
 =?us-ascii?Q?hHBr/IUzJUPFd6svQks78QHwWnTI6E+LlAzZzRez9u6U+oMeCPVFUlgIVzhk?=
 =?us-ascii?Q?gvt2ApMwidALaDHQcCAjnIhb9/4ORBdfXrXxMhXnFYUsm0cZhiW70dOKaRGO?=
 =?us-ascii?Q?/Y7rMHhA262xYb3r7vqEYWCBGYuzEOBK5GDGK2cQrImmqU8mblvGO9k9MYFK?=
 =?us-ascii?Q?jAQchOhxnxapHOpPKmljQ7fc06V+mu9n04X8Dgo9fr7W9Ns1VYLhnR6B8/Oh?=
 =?us-ascii?Q?RTVQXzr1J4BMWxKZK9eY8kKk9y4ETQpvXYqvOJvtcuWV0gqeVajgHyiiUsR9?=
 =?us-ascii?Q?FuESw/ojRT+kOKACOQpXeqt/M65HifMRUW3kmGrNZt515flnsuUN1HReNDAd?=
 =?us-ascii?Q?rY3yJ+03UanIgpVPS+OQ2f4DqDNuCChOiVHPk9Kw8ILGZ1mg02rv2W9At+Lq?=
 =?us-ascii?Q?gNye9t5Gp3mQDbepqXEWBDuuCMiLPNHPWfX7RfRGpeWH5fpUS4Yhl6vZpZJN?=
 =?us-ascii?Q?HCbNCSIQb6Qdq2cxy4u5fWovgq9bs2gaCLxg9o+jS/c4Qb5M+SSsfT6stY7/?=
 =?us-ascii?Q?4oS1B3v7Tg=3D=3D?=
X-Exchange-RoutingPolicyChecked: M8IpI3EHs67SpksZ+nnxmEBbgqtpC8+pvchAOxeSN42uXvGTjnfKW2Z+2PL31ZedYt5No/HwawjdYPXRe+wHPahkGRzR2KriqQ7wd4+OP1cKdfyvzfH3S6makrnEVnSnFv46rgYJ5A8sz4GHaHmgKR+B2ntppgNDQjItJBoNSjh8KuzaLlrrYNP5U3M+Ux5g0SVe6ivtLbxHPEo4rfw4OlplhXfeFEHPhnv+BH1sQYtlsj/YTOE3cxQjcd4bwxwpeH8SUx62qmVrZauIJTrQTZHERxfbdlyqk0H0Px/XS7Fdfg4PKRSQov6RqEfj0UZ+FuNp8EFDu3WVgZ/cMHC9Pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea9c96e-a32c-4305-2911-08defe3a6d49
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 21:40:03.1288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cc4mCLNYUr/PLLC9M6JEj7D8VFiIgPyDa7Tr8dveTLGxjV60AjxghXK/SyjBnswiRM5HASGGnIyytdjVK7VpHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Aug 18, 2026 at 03:08:34PM -0300, Gustavo Sousa wrote:
>> Matt Roper <matthew.d.roper@intel.com> writes:
>> 
>> > On Tue, Jul 21, 2026 at 03:59:58PM -0300, Gustavo Sousa wrote:
>> >> The function xe_wa() will cause a warning to be printed when an error
>> >> condition is found.  Since the current users of xe_wa() do not check
>> >> for errors, let's just convert the function to return a boolean.
>> >> 
>> >> Checking for xe_wa(...) instead of xe_wa(...) > 0 feels more natural.
>> >> 
>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> ---
>> >>  lib/xe/xe_wa.c      | 11 ++++++-----
>> >>  lib/xe/xe_wa.h      |  4 +++-
>> >>  tests/intel/xe_oa.c |  2 +-
>> >>  3 files changed, 10 insertions(+), 7 deletions(-)
>> >> 
>> >> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> >> index 0f4d2edc0795..8c8f7156c21f 100644
>> >> --- a/lib/xe/xe_wa.c
>> >> +++ b/lib/xe/xe_wa.c
>> >> @@ -108,20 +108,21 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>> >>   * @fd: A drm file descriptor.
>> >>   * @wa: Name of the workaround to be checked.
>> >>   *
>> >> - * Returns 1 if enabled, 0 if disabled, -1 on error.
>> >> + * Return a boolean indicating whether the workaround is enabled.
>> >> + * On error, returns false and a warning is printed.
>> >>   */
>> >> -int xe_wa(int fd, const char *wa)
>> >> +bool xe_wa(int fd, const char *wa)
>> >>  {
>> >>  	char **dumps = xe_device_get(fd)->wa_cache;
>> >>  
>> >>  	if (igt_warn_on(!dumps))
>> >> -		return -1;
>> >> +		return false;
>> >
>> > Should we use an igt_assert() so that failures here get propagated up as
>> > test failures?
>> 
>> I'm not sure.  In the past I advocated for stuff under lib/ to avoid
>> causing asserts and leave that for real test code...
>> 
>> Cc'ing Ashutosh here, since he was involved in that discussion.
>> 
>> Do we have strong reasons to do an igt_assert() here?
>> 
>> A workaround like Wa_14026539277 will be checked in many tests and the
>> assert failure will cause disruptions on many unrelated platforms.
>
> If we're not able to accurately determine the workaround list, then any
> test which is calling xe_wa() to check workarounds has effectively
> become unreliable and we can't trust that it's giving accurate results
> anymore.  That would mean we have general IGT infrastructure breakage
> that needs to be resolved before we can trust the results of those
> tests.

Fair.  I'll change this to use igt_assert() in the next
iteration.

>
> It would be nice if there was a cleaner way to differentiate IGT's
> library-internal assertions from regular test result failures, but from
> grep'ing the current codebase, the use of igt_assert in lib/ seems to be
> the common way to handle this.

What differentiation did you have in mind? Making library-internal
assertions non-fatal? Or just how we report them?

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> >
>> > Matt
>> >
>> >>  
>> >>  	for (char **dump = dumps; *dump; dump++)
>> >>  		if (debugfs_dump_has_wa(*dump, wa))
>> >> -			return 1;
>> >> +			return true;
>> >>  
>> >> -	return 0;
>> >> +	return false;
>> >>  }
>> >>  
>> >>  /**
>> >> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
>> >> index f0a826553df8..aa1c50c0f9c9 100644
>> >> --- a/lib/xe/xe_wa.h
>> >> +++ b/lib/xe/xe_wa.h
>> >> @@ -6,9 +6,11 @@
>> >>  #ifndef XE_WA_H
>> >>  #define XE_WA_H
>> >>  
>> >> +#include <stdbool.h>
>> >> +
>> >>  struct xe_device;
>> >>  
>> >> -int xe_wa(int fd, const char *wa);
>> >> +bool xe_wa(int fd, const char *wa);
>> >>  
>> >>  void xe_wa_build_cache(struct xe_device *xe_dev);
>> >>  void xe_wa_free_cache(struct xe_device *xe_dev);
>> >> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> >> index fcf1d71a167f..bdaa7141004b 100644
>> >> --- a/tests/intel/xe_oa.c
>> >> +++ b/tests/intel/xe_oa.c
>> >> @@ -2678,7 +2678,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
>> >>  	 * can result in buffer overflows.
>> >>  	 */
>> >>  	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
>> >> -	    xe_wa(drm_fd, "14026633728") > 0) {
>> >> +	    xe_wa(drm_fd, "14026633728")) {
>> >>  		oa_exponent = max(oa_exponent, 8);
>> >>  		properties[9] = oa_exponent;
>> >>  	}
>> >> 
>> >> -- 
>> >> 2.55.0
>> >> 
>> >
>> > -- 
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
