Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E002AD262AD
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 02:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C49810E678;
	Wed, 21 Jan 2026 02:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eg2KYSh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877AD10E678
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 02:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768962955; x=1800498955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eVh4MAUWBr67gj5barHdZ/AMAqNA25E4L35bcxnwQKc=;
 b=Eg2KYSh8dBAzUUA2+90JQsWev9SC5HWS+8bnPIZ+9whqRVjJTC2TiWyG
 PTwYKQehaB1g2UH7hgThUdKVKLEJP+GlRgDnRCrmHuAJWf4SGHZNU7R1A
 rzyo9l27k/OG48FrVK6F/6x8I5Isf2w3P23Z2WseBffXbV4Y+LcVFIUUO
 3IUIprvQsDlLTAwYvGe1K+zpTx5pNCQTxzbzzw5wkzGWPb5N7CzmytnKk
 fXbURfgtqgiduUVLHo4rnRjk9FQGI7BDRFVDm5gVhfZpFuuGpHhHNIlEl
 XSpzuEZOXTlputsVx6TQyqURENGS37OvivVOL7j/qQjRFKG0VUbbD2Tk+ Q==;
X-CSE-ConnectionGUID: 6aCv8xN1Q7e1A7MEVFn5BQ==
X-CSE-MsgGUID: NMOzemBJTo6Ko+3z6nk+DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70351656"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70351656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:35:55 -0800
X-CSE-ConnectionGUID: TJrfIvzwSdGpJAM9F9LCPw==
X-CSE-MsgGUID: b5wj5rYjSM6WdOS8dNNopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="211309880"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 18:35:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:35:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 18:35:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 18:35:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGuxyFqYc5QjwG1mKheyjJcQjSn4DUF1DcOmy16A3uwZFZ1Yfv9pRIFk1R/0lv9RT0BJC+2OChm59+FcMPAjDvDNBPs6pyTDpIMzM5Jrgr43v1/bwPQH7TOTpOU0Xwtmf7rzSI0uSCUyf9mkjvPrSYNKphAgLS+GV5Uvc7RrSyz0Epl4ILnNptrryOsMnVa85pBlLdavnwBHdfCfiflsEm/e7Z6/Wwr7rZ6EQWv5x7Gl0TEgh1iYt1R6/MxNCkwUDwVv7UbO29vDZ4CUCAmN+E9zSxNMuGyYXGYvh0KbIk8QrMEDSCuU8L3fVEUoRRd4mYKil9/sIL1yldMzcrKCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfN0Pc8PzSjeanoUvmbB/j2pfdMXiJ8h7GF7Jk+Gdr8=;
 b=nsogWJGOX6ujZtx1eWROV+6jYSpTkaQUgEVoLSOyoM+RuPjMMnqxRxDxvc1Aab6m1lI4JyxkuOp07ZazgzhJ0N7GHP59r2D+FpW/+F4ygw5re/agucOjeu6sxt3+5yiSWdbl6QjCj8kl8igXeMnyl2z3BsBLV6jEAu63M6VYzzYdz21I+8L8vQzjgWzY3mmtEftJ+yZzF1b2QdhvoCrR2AiRkaHUA7GsVI2H4EGFTEKURnTIkr+we9sx7K2AIjbK6EwrXyFqkGQQAoi+yNK6QMpJN33vUo6ACXMmFX1/nX2CgXvMEyvH2H0XBch1HOb1aJjpZlUMK9e0JYqn86s3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 02:35:50 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 02:35:50 +0000
Date: Tue, 20 Jan 2026 18:35:47 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <dwarakanath.ramadeva@intel.com>
Subject: Re: [PATCH i-g-t 7/9] tests/intel/xe_exec_reset: Add tests for
 engine-reset
Message-ID: <aXA7g5naXr6NFpAv@nvishwa1-desk>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
 <20260114065925.197958-8-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260114065925.197958-8-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH0PR11MB5029:EE_
X-MS-Office365-Filtering-Correlation-Id: abd8a78e-0065-4ca7-e6bb-08de5895ca5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I9Xhl+ewzWWghMbiDpJTcfsYKjynu/z54q03SmLMXUA2YY+aauAy30k8bNTA?=
 =?us-ascii?Q?zN9usAEc1zf/tdlF9pSAKvZukAjhhlexEmMaOvbOLCOkZsxm9g5Oc3EbwMz7?=
 =?us-ascii?Q?YrZf3+esmDS9Lzfz4NB0cju4tqD27twcWn0NEUBpQM2kja+Me9Q1Xa3AIgAB?=
 =?us-ascii?Q?KcxqESEAdiVr5I/Vcq8Dh5p3qrIEKIvZDR25pKAOu7/72pjWJZdaS0vSPyBg?=
 =?us-ascii?Q?OolZzVNektyASV8KwNij5aptMDZuhmB5MEjHi+Bw0mD80g3UFpWVmZOgpcm/?=
 =?us-ascii?Q?Ge6el8RkohurmOzAUgxgJs5IpNutzvFVqtVtWp+2WphBhU01IK0sLRPsPrbe?=
 =?us-ascii?Q?pUhjZernJjaJCEFlWPnbUOI8U3qxJmCoy6S9svz17B7yhxDatQ0Ll4MRcrsp?=
 =?us-ascii?Q?+TlchfEeYyvM2kc4be1qQgr75N3OrghFV+Jlw0+f4d6DwfNCUAlOWL+gOyxj?=
 =?us-ascii?Q?I6gDR2qq+oprIf7yl91xqKMr2Y+PqwNiXC1XtUtJT37elwi41SljhQcpneUe?=
 =?us-ascii?Q?1HCy6SSfJelHlt8p+tFX7a2Lh9YPC8qs1V+PGd3dyf1Nzxxzwg4fezPCExGL?=
 =?us-ascii?Q?p/uxHWYefz6qPDJKz2eB3OdnMuF5o80Gnv2eU2DHRnm5o/wU4tkFHAFNQC47?=
 =?us-ascii?Q?ADFA8PjLfranR1iWhb+2JxaJnGWc1NtWaWi60YOa3z497O8ioryYwcwR3Qcy?=
 =?us-ascii?Q?+Nu8moGKSaZp4INGIWiC5hT+Gz9TVxsV1EhGVSbE0hgb7KaG711Ao6R9lVYI?=
 =?us-ascii?Q?+EBUS6DwHe7aGOkPfTLfd6VVna8NQHHcmGl/XQ/7h3zmP8MeMhMdfY327/Oj?=
 =?us-ascii?Q?kIMmpyjcosZacaLZUKqsR+U81HkhNFttziPwK8AS6nQZfox5m8wxY2d58Ilo?=
 =?us-ascii?Q?1YiSDY7RZvr0sDNHMQhb/6WXZUv0fyNhBnTaJV6lALqIWzAUewYiFJ6TC8jK?=
 =?us-ascii?Q?4HKgcz0pP81govKMikfXrRZFp11GOyueVxdf5ldinSucSPezAcfcTVD3lslt?=
 =?us-ascii?Q?/tt9TFVicLMGzw1bhsP8CCJmmJaB8EXogdvG/0/nNt0tDYrf4WuZU/yDTAc9?=
 =?us-ascii?Q?WhPXEgPiK7AYvVqg020c4GtYfQVtNPCG1ACU9g2xG5e2POEsMVdbweT0AhPs?=
 =?us-ascii?Q?wuu8lqGC4mW7uiGq+eJuLM3tMaeKWfdMSjrBopOZ+JNsIIHL/PhxihJQX4Ou?=
 =?us-ascii?Q?VAc1A7k72UEwDcE2m2waTiQZTT+Y6be8kaMumZWb7wVWTxI3zHOwGCLLrxBJ?=
 =?us-ascii?Q?Ly1a+clgfcpQrQ9Q1huXkNhVYqx9HxAASI/PN5ihsDgbU/adrzBNiwSSlOtn?=
 =?us-ascii?Q?Mw/VSvwE9Ri+9IhSoCiqC6VZeP2MnTaEGzsZ8fvbpgPLM0DFfmfuPWH+mf5+?=
 =?us-ascii?Q?ghA+jg/HcWGtRt298EsnELKa8FM1mio8srO0TuiF3NzdGT/V+JZa2igLpK8+?=
 =?us-ascii?Q?/03W2yu6kWegZNct1IEAJvT6bZfA/djhci7FL694U8i4BAowW7A+2Yq1GrLP?=
 =?us-ascii?Q?zRZIfgH5jU6YhGrSgmP7WUm20M4sLwcuISUzhdrhqYHcfMFgvcWhlJsTpuu8?=
 =?us-ascii?Q?9ZzTOdKop6YxhwgeOIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jo9KU8W9Nbhiu92nkclNLKpX/4ryvCiIyj6Xm9VEL1cl7oLJCCoo4gnilQEf?=
 =?us-ascii?Q?OOKc92LHOVrakXVr1piWy577BBftV885RjFUZrE8WrarbhX/0slVKiYLrcLn?=
 =?us-ascii?Q?eJ4pBiBgHNhZWhlwwyXf37FwT8GGg4r3nlOGbtTZ/ylpP0elA8soeoUVSmw9?=
 =?us-ascii?Q?8j9QNlbrFdD9A2+ZVuhiJsUxwbA/H/D1U2bdcvnkE9AaziCERL/OQRZ61ExW?=
 =?us-ascii?Q?GoH5lAluQH86ncVB0xqA72xKEPRVQ3fSSLsq3DH72UfFz/fawLeaxli9KAbY?=
 =?us-ascii?Q?0ttUPrFdNhSW+tnOnm/GRsdaySQl2FM4gHIdaLs5RYbJohKWOzysIlUMDcBt?=
 =?us-ascii?Q?GTejdL+VT1O2+1UW0BIBcQsHusAXdgW9MKHgvZ9XGsaJMqp5Ki67mfI7xjbT?=
 =?us-ascii?Q?78fVfxVjUYnxcAzAJVGI2C27U9ZqMeCK2uG/VW3oGkls5ROXUo9dEsq0NFSp?=
 =?us-ascii?Q?q4WXGtbSxqAFIIHXhHp/WfaJtUIclId6+W4jg5F4+B+WAcwk71M0NjNiEpvF?=
 =?us-ascii?Q?SKpC85M6MDXsDkg4bPort213qGBVrTzgr9aMJ4UZVxPzb8Ieoiy1PKghhGJk?=
 =?us-ascii?Q?P/z2J3/puG00NkdTjYpGLhppxv+WUkU6Ktoa5o6ji3ExS4rAoksluhx9z3EX?=
 =?us-ascii?Q?m5rb0Hair+pWUAhtx67XbhPaHeWn7Bb04JFyP11Dxz3FpLwf1VkAboKkD1nK?=
 =?us-ascii?Q?o8CczwXg+Ww2WD3ioxjW3cbiNcfJqbHLp+O2nJ1O32X9jxvCqavT5GJoliy9?=
 =?us-ascii?Q?QPGVxrmjVSqIULE90WadB2+wgTpBkqq1GFFp3qIC+nvTak41EypdJW8iA1sc?=
 =?us-ascii?Q?jgApZxMS92WjIuHhiHQZLP3QCgsQfpc/gELreDQ4RZw7R21a9szAc3q9AV3B?=
 =?us-ascii?Q?Zcu1MlLU3kI8qTuRbii31W7IHNAI+E8wNA2zP9IFX4l6To7FNrXmawSdKiPZ?=
 =?us-ascii?Q?IOyMU+gWmgNp3Tus7Cp4ikybjFVYrQslyg5hyOXw9Y6xWc81aQU0hnX7EJdO?=
 =?us-ascii?Q?YzEkivrLIddWt1QgKKxaqGwSvHZzgLTYM8D+Ye5TE+Tp8m0qgb8pylHePaN3?=
 =?us-ascii?Q?uQ7g8TunjzBc/4moIX05aP9w6lvK6LNTSd4i6f23OL8jSPncHNaezMUlGFDb?=
 =?us-ascii?Q?D6JDKmajkwWjxvWNgwYepu0turgSOJ9GRbgMkZyXa3VxdiGLf61jdl21/xAL?=
 =?us-ascii?Q?SKhfE2yT5hvggPngoKC/HeXVGLZCUWUeLBrXWFXC5HAIWanUKDJ0mxu/ffbw?=
 =?us-ascii?Q?9nOWvsh1x3jsfItWLjLIBCKsTPq11t4k010CQENpBeLZlo94/jCkwerAamJ6?=
 =?us-ascii?Q?V5Y6KdAazYAlcnCEQLFYtA4jzO5Apmaoyvr/k8+BtF21WyxxGnXzC5D+A6Q2?=
 =?us-ascii?Q?ZP7gdo57mXH++/aN3+D4OOa3mAyUu2hHJ8DURudRLH9RbsATCm/DHbRqIrWq?=
 =?us-ascii?Q?6xqxK6iBs4YI+XWG0p7BZkRodDVT2v4k88AU7pyy+0hrsl2F1GZxZZHoHzwL?=
 =?us-ascii?Q?y59jjr4Q2Xst8SBgJgcRGT2INqlKeifApe0IJSqJelyRdM+DQIrMpRTXJXmp?=
 =?us-ascii?Q?llOpXIizFpV6zCi1JyOBC2tmw1cNQU1EkWTdIMacgIOAPqE6PHrMwSCS4EsU?=
 =?us-ascii?Q?fDkNytug/L3DejGDfwsu3SJGeB3DiKS1UdNe/ElhbAUd/XPfKFnhbhB4Lo+J?=
 =?us-ascii?Q?Hy/XuCHjoPsanZa5TCi7HJbO/cDUBYRVy87Ru3u2uzfU1okiju0QtsZ/Bv5j?=
 =?us-ascii?Q?TiGxONtIKvTp7HF6tXXuTVtdmOq6pGOlMh5E48IuWNfLf91IJCY4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abd8a78e-0065-4ca7-e6bb-08de5895ca5c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 02:35:50.3938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShCcCfn5Q7h0UQoWmJr76p6K8cho5/Q3XW1Tqym2LN2E30g3RXUxtEm2/O5WN7Fgp1Q304Hp7u0LFn0NwPcWXiaCr6xtdzCE8i7WutnNoCNEgPkMwwAv6zSdP7VOZh1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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

On Wed, Jan 14, 2026 at 12:29:23PM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add tests to validate engine-reset both in legacy and compute mode.
>

I took a deeper look at this and next 2 patches xe_exec_reset patches.
I think we need to re-think some of these to properly apply multi-queue
changes. Some issues I have are,
1. The 'cancel' test already seems to do the same thing as 'engine-reset'
    test.
2. The n_exec and n_queues must be same unless CLOSE_FD or PREEMPT flag
    is set.
3. Do we really need to skip data validity check for 'cat-error' tests
    in non-multi-queue case? If so, why is this being upstreamed only
    now and in the multi-queue patch series?
4. May be keep the current design of cat-error applies only on the
    spinner, thus for testing cat-error on secondary queue we make that
    queue as spinner.
5. The multi-queue case differs from non-multi-queue case by the fact
    that error on one queue can result in other queues in the group
    getting banned. So, we can expect error in ufence waits and data
    validity check might fail.

So, my suggestion is to remove xe_exec_reset test updates in this
series for now so that we can make progress on other patches and
have them merged while we re-look into this xe_exec_reset test
update.

Niranjana

>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> lib/xe/xe_legacy.c          |  9 ++++++---
> tests/intel/xe_exec_reset.c | 24 ++++++++++++++++++++----
> 2 files changed, 26 insertions(+), 7 deletions(-)
>
>diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>index 084445305..33237f01e 100644
>--- a/lib/xe/xe_legacy.c
>+++ b/lib/xe/xe_legacy.c
>@@ -25,6 +25,7 @@
> /* Batch buffer element count, in number of dwords(u32) */
> #define GT_RESET			(0x1 << 0)
> #define MAX_N_EXECQUEUES		16
>+#define ENGINE_RESET                    (0x1 << 21)
>
> /**
>  * xe_legacy_test_mode:
>@@ -69,7 +70,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		.ctx_ticks = flags & LONG_SPIN ?
> 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
> 	};
>-	int i, b;
>+	int i, b, hang_exec_queue = n_exec_queues / 2;
> 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
>
> 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>@@ -133,7 +134,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		u64 exec_addr;
> 		int e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL ||
>+		if ((flags & ENGINE_RESET && e == hang_exec_queue) ||
>+		    !i || flags & CANCEL ||
> 		    (flags & LONG_SPIN && i < n_exec_queues)) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
>@@ -224,7 +226,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>
>-	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
>+	if (!use_capture_mode &&
>+	    !(flags & (GT_RESET | ENGINE_RESET | CANCEL | COMPRESSION))) {
> 		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
> 		     i < n_execs + extra_execs; i++)
> 			igt_assert_eq(data[i].data, 0xc0ffee);
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 7aaee31dd..a71988a0b 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -124,6 +124,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> #define SYSTEM				(0x1 << 12)
> #define COMPRESSION			(0x1 << 13)
>+#define ENGINE_RESET                    (0x1 << 21)
>
> /**
>  * SUBTEST: %s-cat-error
>@@ -330,6 +331,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  * SUBTEST: gt-reset
>  * Description: Test GT reset
>  *
>+ * SUBTEST: engine-reset
>+ * Description: Test engine reset
>+ *
>  * SUBTEST: close-fd-no-exec
>  * Description: Test close fd no-exec
>  *
>@@ -345,6 +349,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  * SUBTEST: cm-gt-reset
>  * Description: Test compute mode GT reset
>  *
>+ * SUBTEST: cm-engine-reset
>+ * Description: Test compute mode engine reset
>+ *
>  * SUBTEST: cm-close-fd-no-exec
>  * Description: Test compute mode close fd no-exec
>  *
>@@ -383,7 +390,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		uint32_t data;
> 	} *data;
> 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
>-	int i, b;
>+	int i, b, hang_exec_queue = n_exec_queues / 2;
>
> 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>
>@@ -421,7 +428,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		uint64_t exec_addr;
> 		int e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL) {
>+		if ((flags & ENGINE_RESET && e == hang_exec_queue) || !i || flags & CANCEL) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
> 			exec_addr = spin_opts.addr;
>@@ -467,7 +474,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>
> 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> 				       exec_queues[i % n_exec_queues], &timeout);
>-		if (flags & GT_RESET || flags & CAT_ERROR)
>+		if (flags & GT_RESET || flags & CAT_ERROR || flags & ENGINE_RESET)
> 			/* exec races with reset: may return -EIO or complete */
> 			igt_assert(err == -EIO || !err);
> 		else
>@@ -478,7 +485,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
>
>-	if (!(flags & (GT_RESET | CANCEL))) {
>+	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET))) {
> 		for (i = 1; i < n_execs; i++)
> 			igt_assert_eq(data[i].data, 0xc0ffee);
> 	}
>@@ -901,6 +908,11 @@ int igt_main()
> 			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
> 					    LEGACY_MODE_ADDR, false);
>
>+	igt_subtest("engine-reset")
>+		xe_for_each_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 256, ENGINE_RESET,
>+					    LEGACY_MODE_ADDR, false);
>+
> 	igt_subtest("close-fd-no-exec")
> 		xe_for_each_engine(fd, hwe)
> 			xe_legacy_test_mode(-1, hwe, 16, 0, CLOSE_FD,
>@@ -925,6 +937,10 @@ int igt_main()
> 		xe_for_each_engine(fd, hwe)
> 			test_compute_mode(fd, hwe, 2, 2, GT_RESET);
>
>+	igt_subtest("cm-engine-reset")
>+		xe_for_each_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 256, ENGINE_RESET);
>+
> 	igt_subtest("cm-close-fd-no-exec")
> 		xe_for_each_engine(fd, hwe)
> 			test_compute_mode(-1, hwe, 16, 0, CLOSE_FD);
>-- 
>2.43.0
>
