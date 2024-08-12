Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AADC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 13:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B1610E219;
	Mon, 12 Aug 2024 13:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liN13rzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66A210E219
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723470766; x=1755006766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l6fEVunyQOaYEvoKavbkEXmN8iZUHo6wq4XdOnqp/i8=;
 b=liN13rzxJpvSz375ZEUNrFKfZj4PIa22osaSpOp8FcVGlnWUPiAT378A
 qS54StJzZ3ZYU7fWMu1RdLJw0Sy43yf+c9JX/PWr8QihHI/XVXSZy53U3
 qLgl20vWvzPQxLP4O2f0GeKD2IMBuJasDhMeLAUalXKAgCZPwJMp0LslD
 kkZZweDYFw2ZtZRIGfMOxJH2OElDMNiEoBePqhboi4K6id32KLk9JdkgM
 ZytC97csYKukvR3AA3B2AlpxiVBiY4x9BJr3Yf9hBptPdLvuQF4BAIn5q
 IsJs1eYoLHceF6DEHI4Nlkux/HlvIoH8L5ND5mHOArh9GjOnoRlq/53y1 Q==;
X-CSE-ConnectionGUID: zhFvHz73SWuKVL0sVskdFQ==
X-CSE-MsgGUID: fM+MlN4BQ5y5Fe3gTgHrlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="24488667"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="24488667"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:52:46 -0700
X-CSE-ConnectionGUID: iuuUCJQETcio+ku+GeOn4g==
X-CSE-MsgGUID: SYNwsHp6QL+ovkwG76GgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58213222"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 06:52:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:52:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 06:52:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 06:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEp/LNqt9DuhSqIo6PFvMRtSC/NhDnbZ/JokibTJhfP58x0/WG8AAI39Pmn+aDOn9Gxwu9qrU/njaVOOu42QbgUMVPSbPgoLG2fBv2e+e+OfVgr8QR5ajvzPKJilB38hKGr0Hi0djSz9tgsRNKA5nJQ4mGUz/zeliA++kxhU7IqvTSIzP5WHX44E3ixqxhnobjHCy+PGcLB2SI/dE2UDYFTDoojvVXBVaYnsPAaqyD9GdPgVx6i3Vj34aKE5Pp4VMWDQPazZAfi/AIX5iiEJwqdFtoTQjqfC+Gs+b5EhOj+W10SSP1DTRUtLZoK3CbETZlIAvsFgN//C18wHutkrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWMldYRUpl1zKQvZUBNO/KGUIQd8ZstugqdsH0V4nVY=;
 b=CSCJj8jnDJhRlp8Dy1P5ZZFKS+DXtMLUAPDbPajHpfh6y//aXCdvet3OVklnlfEDi3agAgNjM7LgWhv8BApjpzJ42Rl/nlkY6FnjHPcYNH+qLXv5U3Pg0965YCGrjZt7AG2zzJEYUR2mly9Mcfs6UPVmW/k7fPxNqm3pPgXeNvziRIruu+FD8HS0LW6BpsYuMx5ANEakHZdRdBhkbgxDH91JSospYn7EnK1zYmRQ2Enmzu6+EgvAPk0F6VbAfLZJgseYvgamX9hiarOmr6gTNwtl2Tn7AVTCCWcvk8KXFbLZP3Zy52TuucrQHYGcnyz7LkZxNQeFXCT6tyt23d+FKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4892.namprd11.prod.outlook.com (2603:10b6:806:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Mon, 12 Aug
 2024 13:52:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 13:52:36 +0000
Date: Mon, 12 Aug 2024 08:52:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 1/6] igt_hook: Add feature
Message-ID: <4zaetrfjm5aj2vibja4nd3hu4j7dscycmvhlyoybjeyp5f32rj@lucyyrvnhljm>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
 <20240725142028.51735-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725142028.51735-2-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: defd302d-e41b-4772-b54f-08dcbad6060b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HgKCjeV3UaOPQvRf46CQq8U34BiTOOwRO0vZRWb399ahZeBUz94POnv92j5J?=
 =?us-ascii?Q?7dfR41uW6JRHNQ2M6KWwyxtSdAAnAFlIBNxzLmgOLSLm0j1MXye7W3E8eihN?=
 =?us-ascii?Q?xL5lPq4sDgo03/VWaOd/O7T6qDXo9fM7tZANwP/zM/k1kdcGQrxoN/oNO09B?=
 =?us-ascii?Q?f47aSOYQpk/DGTmY9BfeNCl1FZ10SntJAgxqc2IvLR8tqLPuZI5KWygLHFRj?=
 =?us-ascii?Q?KtrSFtOV0GaCRu6pZZl6jOXYm2aZjy3wpll7QOvVLs2exJMl6ZB2KZRIaHxF?=
 =?us-ascii?Q?aBjV9q1Oxvt99Qc0FxhLesJoSLI5RjWLz7Ri3HHtWmsHsKleWy5l4DX8B0JA?=
 =?us-ascii?Q?TBgTrlHdYHaxKH8Vuce7DVSplwKg8npYEgxpr96z/oAGkIYSaf06i12nLu6g?=
 =?us-ascii?Q?gqCBXJ/s+na0sOIxtUBOTWg8JA87zWfV1Ljugsfaw9Scp2xMF/zctOQLCJ0n?=
 =?us-ascii?Q?9apH4iQllUbJeCoaiAZbliCGL0cwHKryeJvzqhEtL59JstU8A1/nTzgO+wzV?=
 =?us-ascii?Q?O480bO6S03XJpc2RCagDqz6V5Jq6xy1snMVgV8wh5qgD6r9AQB4qHpyydfE4?=
 =?us-ascii?Q?suMmxFq28M10Y7Ktcu0OrNDgiySVcFxy3qOugSFriihE7THG8Ek1LxIR5nDm?=
 =?us-ascii?Q?bzZ2O44BdYBpp4OCxSNiXlAmQju7Kvvjn21fA9qM8VR0u9zd8OR6mY6j+lYP?=
 =?us-ascii?Q?qzaOUUmhMAMPl+jMOhxe26Z5bVs/9NP6Nrn1LOERdsExGJgzxS3Bpg7F//re?=
 =?us-ascii?Q?UoU6hT60b57ZhFDGHH53yHPihE8ZNbvhIwXCq6F2aOMdodPn90iSZ4uZMyBH?=
 =?us-ascii?Q?gO9K2tpvhSiQ68W8z530yuphGJRkrjQPETmgdHmV0M3AtkywLMc5yIlcvjUP?=
 =?us-ascii?Q?HAnJkhRJZTLeBd96mJ29pd3u7pFzW4++xF0oeAzr0nL4OrvyLCj5uSecdnAK?=
 =?us-ascii?Q?WgesAtAyk/fWTyLZE4aJTBJLV06OP68DxfeklW4jj0e3IyCT5FCKLDd1Odly?=
 =?us-ascii?Q?LgVrlNxItTbBs7aERojt65soO7IZ3ZeIugiqHYYP47FJeWJy4KLjH9i+1if2?=
 =?us-ascii?Q?/qrqHfTJiwiTy+Jia40eEOWOqYwvh4D5RGEJNnbIqvx2pfLktssAQ9t2rgOv?=
 =?us-ascii?Q?GCCI+3VghdoAFxT5oDwwsAwGh70enawbvhWAF7Na9dsF7/AIjzX9emxjNh0M?=
 =?us-ascii?Q?vOAGTkOJaVeUU6tB148o+nwS/UFNC/qlTV10khISlerdpet0qNiadntxRxGc?=
 =?us-ascii?Q?oyrYc9FlRMFrbKTU0j/Vwb4Dh2i51CqhsYte24s7BHccKbIVlXtVc1scVJju?=
 =?us-ascii?Q?zuk0norMzMOyIQLk517PKJ+/Aixk5f8N/BTtNCG0TpS/nw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?imvYABC2B6sKQDkySzD769cW++/xdO13LUzA7fNTUNTwwgvir47ZrYwWuaJp?=
 =?us-ascii?Q?JMnV6zrG0/ojk7AKyfsh22NrQaPhZoZaoIV0xrVDG4vpdS3MGi9DEzUoi3d8?=
 =?us-ascii?Q?mSi5P+42ZyDA0x2D80UEVixR6I0cjmsFRD7wNBg0oN+wtmp2M3BBafjc1Y0n?=
 =?us-ascii?Q?a0cIRYzTIL90LF+lqEkLl6OYVpwaUVVOWvCOuzWRVjuljeT6geEG8v6FM7CL?=
 =?us-ascii?Q?v3U8Y5Zbcwxvn2oFgsgUgvTnTwAdmkQNO6SGWSs4SSG+rQpxyyYVwu9N4K6r?=
 =?us-ascii?Q?EvudwdbwYFMM7tnHWN/N42gQ0/6GJON1293iTk7uzUGT400DgN81npx+DiS7?=
 =?us-ascii?Q?Xr3s/mIQPU1TjVCbLcu08UGaHjkCs9jSlf4wQFaFQfTT32f/PMCGUXI9qmqw?=
 =?us-ascii?Q?N1GBGojrVci8VbQFQAbkczsgLiY44kUNNu/pOe4GtHq0oNAmmhYLnYyAu7F7?=
 =?us-ascii?Q?C7qB1NjCc/cARDlFpDe0wBjszIbqmDm3FC7JqT8ohtWem02HZusGEGHyk3FC?=
 =?us-ascii?Q?++LahZYJtliUs75NW80h6jUyIWAN3LUIGSoaOGUViU3X64R8Ddg8/9vgHYEg?=
 =?us-ascii?Q?p40iJ+I9Msq4IkIBJlkGuYm55snG+Op4BDXEAlcv3xSm8iLql846slNB2jFg?=
 =?us-ascii?Q?pARDmgOBPh5ad9Wz6u8UPBD+x+P1CUw2urmCRhPMSGLUTGRk8RaQO5FP9xga?=
 =?us-ascii?Q?YMfOIuMl4GRr7+t+aWeTGHYeVIbRbhMT5pCWIC4dE2kjvV9d5M+cYzCoLLw5?=
 =?us-ascii?Q?l3co3Oj7rvOu5VQIPZQ8aqFXvFski0OMjA4a6TPb7m1HLuZMQx+ZJe1zVsvb?=
 =?us-ascii?Q?wNCC4Ru1lYkND8Uie8tkKJvlqf+MQYTspAr9DAQ+ZT76oj/4aQJfOOV0Xh0U?=
 =?us-ascii?Q?fYOE3zRjOt7e+I8u2pggBjjGMyDZoX7oqY7uzFE4CduCCwXs1/qQCXdzzugx?=
 =?us-ascii?Q?kYcQXnSxsWN0rhEv6sdzCY4bmeBrWiZgnl+gMn/vXvz559GMBNtHjwIg7qnX?=
 =?us-ascii?Q?R1pE25HI7fJtHv2Wpi693kEj694RxuwMr1Stcqr2Shn4QPLonnTftObxyNEM?=
 =?us-ascii?Q?hwkVGXW86AnFjP2D8Bt+zN79Ll55uj3t/VSGDUpHFicNRpxSN/I6jX4evjfQ?=
 =?us-ascii?Q?PHcM50cTo/9kIVUDBZwq+IbnSLg/GkdNJbC9A4kVIyOsCX9qaFq/tFdSnpeR?=
 =?us-ascii?Q?/k10F9jozTccLIPAZTiBJ8XqAhMu1qkHQji0ve0QTyyD3g4PAmUkYIZGKKKF?=
 =?us-ascii?Q?hka6kVP/6k3iJJ7rNCG8mhN4mVCwNmTGx6ZNNJY6PLJc4lJ5ttDikqoqNE+L?=
 =?us-ascii?Q?T05lEaZdjHO4L+GQlexUSUH1vtjz5EhSe31kUiS48K0XjoQmmpahxyGbSdjF?=
 =?us-ascii?Q?vvNuQRtUHHtnR1dJwwVGpuQrrVH5GPvB44caOGcoBN3y4L4514n96TxXH5K8?=
 =?us-ascii?Q?NH+xROh5/bC7jPQqBZJ4zummd2oJXCRRKzrhJCXSnJhyO0UeBdZWPkLC5TwL?=
 =?us-ascii?Q?LVic7WPCFBn0DdK0+r+k/mbn8iQl2kKCaQZ1pPwFR3huzFQpn0Z7kvCQ7625?=
 =?us-ascii?Q?p9AmuRs+gEtzayaP43f4RQ+tsJhXRzMZQw9kmQukv4mUSje+DOEd8myGKIto?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: defd302d-e41b-4772-b54f-08dcbad6060b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 13:52:36.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GbyxJe4GZNzJwSB7MRao8AiZy5N43IcAnZ8UNieAgXez6lqcW5EtLzYdRjMhU2Mb2IbheKJW1ej0jERmGAtk88p6aBaJ2thHaIUDodca7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4892
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

On Thu, Jul 25, 2024 at 11:19:34AM GMT, Gustavo Sousa wrote:
>For development purposes, sometimes it is useful to have a way of
>running custom scripts at certain points of test executions. A
>real-world example I bumped into recently is to collect information from
>sysfs before and after running each entry of a testlist.
>
>While it is possible for the user to handcraft a script that calls each
>test with the correct actions before and after execution, we can provide
>a better experience by adding built-in support for running hooks during
>test execution.
>
>That would be even better when adding the same kind of support for
>igt_runner (which is done in an upcoming change), since the user can
>also nicely resume with igt_resume with the hook already setup in case a
>crash happens during execution of the test list.
>
>As such provide implement support for hooks, integrate it into
>igt_core and expose the functionality via --hook CLI option on test
>executables.
>
>v2:
>  - s/igt_hook_init/igt_hook_create/ (Lucas)
>  - Use SPDX License Identifier instead of license text. (Lucas)
>  - Do not rely on hard-coded length 3 when generating full test name.
>    (Lucas)
>  - Do not pollute current environment variables when running hooks.
>    (Lucas)
>  - Change hook string in run_tests_and_match_env() to use "printf"
>    instead of "echo" to be compatible with CI environment.
>
>v3:
>  - igt_hook_create() only errors out for invalid input.
>  - Use igt_hook_free() instead of simply free() in the error path for
>    common_init().
>  - Go back to the simpler logic for calling hooks instead of using
>    fork: setenv() calls followed by system().
>  - Change igt_hook_create() to return error number and receive
>    reference to destination pointer instead of the opposite. (Lucas)
>  - Remove checks for non-existing negative return of igt_hook_create().
>    (Lucas)
>  - s/igt_hook_push_evt/igt_hook_event_notify/. (Lucas)
>  - Simplify call sites for igt_hook_event_notify() by allowing argument
>    to igt_hook to be NULL and using compount literals for the event
>    struct. (Lucas)
>  - Fix style for igt_hook_calc_test_fullname_size(). (Lucas)
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


just 2 nits below

>+void igt_hook_event_notify(struct igt_hook *igt_hook, struct igt_hook_evt *evt)
>+{
>+	evt_mask_t evt_bit;
>+
>+	if (!igt_hook)
>+		return;
>+
>+	evt_bit = (1 << evt->evt_type);

no need for parenthesis

>+	igt_hook_update_test_name_pre_call(igt_hook, evt);
>+
>+	if ((evt_bit & igt_hook->evt_mask)) {

same here

Lucas De Marchi
