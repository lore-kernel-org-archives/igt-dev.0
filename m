Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06624D58D78
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 18:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFD210E6F0;
	Mon, 25 Nov 2024 18:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8ah4V+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA9E10E0A3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732558854; x=1764094854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=enlqAZ5IjrfPTAaXzn4DNByHfb9Cr66YdEvYfqKXCFk=;
 b=F8ah4V+cLcEK9fjNFw55uSmZ3eMlVXq1LPt/Ac9TgiJnI6arMLhWIpba
 rZ6NE4bCDOKxJ1MxIoDZy/g/TAv3qGP3MrQuSpdEzLKmzKHMc5MHgb+1F
 c2loxUc8NlaNmbLXJSPCFPOjvRIfotNJgsgyF7+X/lOl4D0KAc6d5EqSx
 7EROnx0Zt33CkGqISFCnfWEAorRcb9y3WyZm2lR0n6CLs2sl5dBEVOBhu
 AaZzCgf/rBwEKiwbJm4wUkHOl+vDKV/dmX1WgQXysb5XPkpS6RZBX1GJh
 VndFO3mEN6vl+YdJ4WsS5NjTtaIbqEXFM6d+Wf0M51OyagdW+rHm5ZffO Q==;
X-CSE-ConnectionGUID: jtK9B1JAShai+n9G4GHxTQ==
X-CSE-MsgGUID: JXbA2PyAQvqVxy+29XYEVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55187632"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="55187632"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 10:20:54 -0800
X-CSE-ConnectionGUID: CgPCCFChSxmPGM21eB0SXg==
X-CSE-MsgGUID: j88OCt/uQXqrnMBbh7eO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="114614363"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 10:20:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 10:20:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 10:20:52 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 10:20:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxoDX2Jy5xJ4Ss/+b9t9VoQfLpGPO6grRzCpQRRORFvA+8NY8nKtmCUV2SyZ6AX9yOiLy97fuINtvrN9uNLibQym69gquHpaEj5HZPubDlcnSnEFi1whA94VV9wGnMkhIWEMWAzYXE5G/iRAUlD2/txCCpwdRHsgDHydgjSgXfscAuIHLakTqM6afTs0O7oeUPjsROZ6IoY9f40BgcesdwhLOFLD0mnTcqLyM/WDFZAHPEB7MCcTi+7xY9mnYpQtKmnuegJKspJ5jJz1Gvx/685zKIqSuIujkZHwsBWYWnyhTsHa89FWecrvZuImno8L9NfIfrOyPVXqhk3/cPgd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyurGR3vF7xAkvSk7nJqSxXb852gugXggnoNPc+pVbY=;
 b=r+VjJGQ/JPkhTETmwetSp3TeuQV+iyzsBnbx7Yhaa7u84rs2aOlKimP9FoDSFQLS+Q9mSS9HE6lgOa8H50dLWi7ee9CSwaANOX/Vw8HlScSIVkeMj3flecl3vpQc1yHErExRT4fc4P//87B4p8tng2axRKEoQq4hj2eqZY9enpKXm5HkN7/cD0rEp3BDQGBZ3RN2Up60VA9ge0N+8gtSPPV3jR3qesO65SAKKtEookX5Tg6GJfBUyV9p5Ym+8mEmOiMtNAErUNzmtOv1j0x01mHh3u7+I7osgOGd1qhA+gDHJ793W7eNoDT68txh2w3pgv66+zrbKBafF+7ABz4L7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 18:20:49 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Mon, 25 Nov 2024
 18:20:49 +0000
Date: Mon, 25 Nov 2024 13:20:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
Message-ID: <Z0S_9YaQta79ooeQ@intel.com>
References: <20241125161958.296816-1-juhapekka.heikkila@gmail.com>
 <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241125161958.296816-2-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MW4PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:303:b6::25) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 6261441b-a7b2-457c-532e-08dd0d7de290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U2rchIYS9ODY7Muw8udX6iN0ulkJVZ34kVptB2hevTald8W9/7h+URGRI6hd?=
 =?us-ascii?Q?w12QypX9RBNxj3Z54nVKTA3L7VCQ8aZLHaRepb82LYKQWusYhOSz9fmUNPsR?=
 =?us-ascii?Q?w2kciG6kRHbSZMtwtPKUWtRTyOvaH0BvBFsY4yYbULCTDuqrl2oDJ7euF1dt?=
 =?us-ascii?Q?sS1wWsxy9DVnc429sdSXMlwq5wA4qCkpO62Ig7Yo0+tfVzXMs41obCVxCc9g?=
 =?us-ascii?Q?VJkbMqSEVLwkNzc32lSWu3BWwt1OtIBN1N8/uIF23rcEdcJjEulCjJJqw/jQ?=
 =?us-ascii?Q?6CI64R57ykMU04avvcKKFuomESzcekeECLD4LrTMh9RX2HtbaxeCeT0xPIiR?=
 =?us-ascii?Q?D9FtTgaxngpUKGliKxkL5sQHL5WpSKg9I5yAG21nAR2QLB6te7l20cND4tUv?=
 =?us-ascii?Q?5LNGr9pMALmLqiOO6nHAu+vhaJ0BxrcaAVxde3c1ZxTrdzRbxL2sRdJpVn+E?=
 =?us-ascii?Q?4/nWpATLYCJX0Uz1N3AKyUYhv1f3g4jz/2LPQsab+Zj7icvIrLThiXou8suZ?=
 =?us-ascii?Q?oqmelBiH1G343YQr/qfF4EBCcF0j+dawcEzkqxEBc3Vk7WSZ8649a1gLltdg?=
 =?us-ascii?Q?x561XjEPRmB8ODTd67C17OTN471XUWcaELBiVo8MEUgrDhlnjOgHaVtkBgwp?=
 =?us-ascii?Q?uGIuS8XZUGgS7twqVp5sTdB6f8kAoWUkDGX7AryOt2StKFTY+jQPMW5uMvWP?=
 =?us-ascii?Q?g5UmzfS4cHLRoHfbT/ibygaU2GG5wmjsHx9xsEQtjID2Wa+IgrXsoeRi484U?=
 =?us-ascii?Q?7PLk0WaF/rPTtOYgB2/tMT6aOerO9E1j6yhgk1moOEd27osMgqy6Za3dfHWB?=
 =?us-ascii?Q?fKwdSJbKNb25/idmPGsxtbQ8eQccdJmkSeIsONYS/79UUwIsYuN1/ypK/xn2?=
 =?us-ascii?Q?xB3sATeQMTE3A5pEw0lfgPMEQUM8F0IAVyXe6Ao/MKzNUhkhPbkm5flb2vlM?=
 =?us-ascii?Q?j2drKM6OL/CCiZ5sAQ5OrO9QrfUCPBlgB86eoVQikhJAe3ItvcPSYQ7gqgdO?=
 =?us-ascii?Q?EjAgjP6i4xA0is+YXIITvCjSDbUToZNwKCSLH7m59/r1xSR0sgzMwCgcZwqH?=
 =?us-ascii?Q?sG7ApRTI+7h4NTpL4TfM7H+HCtylQrhKSWQxmF8/d6GpmnWDb8zu2mSQfF5a?=
 =?us-ascii?Q?M9yECorlx2zwQO07Rf+A75v1cRzXSmIdaYo1ru8lq16VrFU2bXGsZupe8h5K?=
 =?us-ascii?Q?WQULqWk+ApswrG8GTYF5FupENi9PZtCctAV5IXTgTqv11PHPRwklxwkn4KBk?=
 =?us-ascii?Q?5jPtae5ABLaY46TTYTxAt5UizHQ4pZx9tHzHCTv4X2ULhVQs/0diTdpVfhLX?=
 =?us-ascii?Q?1Z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzNDeC0LR5otXXIfK+3z/6FwyQckSMhLI+ea6HLkmhM1e8fHCZMWnLPS9qHQ?=
 =?us-ascii?Q?Sw7mMsXaYgVD7kkzCcGgGDdr5yU0kFcccr7ZvHGQ/tejtXdUYe8luPzcCjeF?=
 =?us-ascii?Q?JSPkvXnLU41sLex01tO1uzyr8dokMsXiowVKTCkp6fwjY1fOrW5RnPIMltkD?=
 =?us-ascii?Q?yUOeEzFpCWnvd4DKCsnvcfyQEOYyhl/ObDt8Laoc0xArqbXt9LxjXAEn15cp?=
 =?us-ascii?Q?4blpJlM1tsz5RTBnsTIjxQ+g7mb9Mc8lGWI83iEUh1/sDgJg2xt26fnEH3BL?=
 =?us-ascii?Q?ooSR44hEuzWho/RhbWP0FALysySAoCD/UowP7IQCSW3yPKIG+UwGyqQQU7iY?=
 =?us-ascii?Q?ZgeHqCCnXhehuoB1nMvZFs1qjGAUbjIWZyYGcKS3smzTZO/w54TxJFQkFyDd?=
 =?us-ascii?Q?SbHNpsR3oOZw2hL7+9BtMhrNSX1mPwshvzaE7h7aNGlVKJ/K1VIU0bLIHyuK?=
 =?us-ascii?Q?6qd69RaYqdhiYDgfjdE4+hunFv0gDPAOUg26L7IM1gxQtdJNfrT+VN3kIt+5?=
 =?us-ascii?Q?9LKhmxJLpcR7pz/RM85eFSqTh+Y/p3EoLPqoec3WxgTMvfm6qhqu0Vmz2BvI?=
 =?us-ascii?Q?jm9Ytnv9FHUVbbJ3Mv4PhNAfqMS4WT/BIxaa2fnMpzmeQsr9m52vu6SnHOPr?=
 =?us-ascii?Q?FPFRLVz5P0RVyPTaggIH8MdR17+Ta11WNGKdsDG0Ami6pk3Qhvsp0AeJCxrT?=
 =?us-ascii?Q?dKwfuiNHDL9UDb8UZG654/OB/qZDGnfXTLMIR3NvU6NNY2rhbWQGnFearIoE?=
 =?us-ascii?Q?g+axRoRdm+xIjUH48LdsAkDJa/DLN//Gkp84yooKA0SAnI3U5TeOSVqLSMzB?=
 =?us-ascii?Q?zZYGaE+erDkdr12y8Q0cLBqRRSFOWIP/iILurB4KWI8RJzOLLaWDIm5UCGh3?=
 =?us-ascii?Q?Yyq2q/d13GHcJkTqQDzaXsRi1NENgYx/VW0WyzJxhx9L/Ot1BlHrH4ttYWC3?=
 =?us-ascii?Q?yxQ84yoxBQGmEmFaIWTvH5YfET7gBRhZ6hsbsroohziHiX58+usa/vfBHdqw?=
 =?us-ascii?Q?45neOI+UoSRP5wQEcLLN8YxmRyyh1QYETGQBlm535YZkMo06V9Kcyh20UpPi?=
 =?us-ascii?Q?xptm2ftR7fM1Q7H/5NYmUPLM5ZsLM2ihLXpRpu1P+L2k4ly+QaI13O1n0dTk?=
 =?us-ascii?Q?D/a4FZeYO6TbQ0izbcq3bOEunOAn/MqVd/dALGU1k95Bxol3Yxml0HgS+H+G?=
 =?us-ascii?Q?tu9cA6PbyfdLf6JL4qMV2TyBY+rjvdWqGenhd7JQ93I8jOF6SRrpbA7bj1Xy?=
 =?us-ascii?Q?RqIKX7MYm32+I1etj6+uVkaHWSqqyY3jX2y7PKpquwZuC9U/xo7+YQJjK10g?=
 =?us-ascii?Q?heHV7e/k/rxLB4ix8ZE0AWc7u0dIW6NDow7eDrecTCsW+kxFXTWqT/UK3mOk?=
 =?us-ascii?Q?mGPhYoAjULyUl/kV2jKkel6rTuQWKnBzcU7htOS+51zElwTZGscSVh/W9UWq?=
 =?us-ascii?Q?20gpMxeEfzdoUiDeno3/4SKVNgsKzsWLrknHiZ1Zd27072AFKKYba9kYhrwk?=
 =?us-ascii?Q?lvUtCTeenNtKoXeYLHVU+0oitGRmF0QOshloCLRtxx+3OIm18OvOkeqpENtY?=
 =?us-ascii?Q?Vms+zHtIDwzywp6du2di3CZaLBY3OAfAmdopje0fXc/ORRNpqngapypF8SQc?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6261441b-a7b2-457c-532e-08dd0d7de290
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:20:49.5595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fJkxvBmipuzTc7hGSKDoeusqKsD1MlqZfxxFH3LO1tAIox9Bb3X93L1eZIdXx92ZWRxr8r19JAFnjdM3Bb6cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
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

On Mon, Nov 25, 2024 at 06:19:58PM +0200, Juha-Pekka Heikkila wrote:
> Add hibernate test which bring entire system down for short
> hibernate. This mode is added to suspend tests to be run
> manually with '-r' flag because this is not ci friendly test,
> on hibernate ci would lose connection to the hibernated box.

I know that nowadays it is a beast to get hibernate to work in the distros,
but afaik our CI is prepared for that, otherwise we wouldn't be able to
get these:

https://intel-gfx-ci.01.org/tree/intel-xe/index.html?testfilter=s4

> 
> For this test to work kernel resume point need to be set using swapfile, from
> kernel command line is checked if there is found something along the lines of
> "resume=/dev/nvme0n1p2 resume_offset=73527296" or so to verify hibernate
> will be successfull.

Indeed painful nowadays... I can't even believe this gap came from user
report... is anyone really still using hibernation nowadays?! :)

> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/kms_ccs.c | 162 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 3e9a57863..fd2fe9d3d 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -190,6 +190,7 @@ typedef struct {
>  	bool user_seed;
>  	enum igt_commit_style commit;
>  	int fb_list_length;
> +	bool do_hibernate;
>  	struct {
>  		struct igt_fb fb;
>  		int width, height;
> @@ -271,6 +272,154 @@ static const struct {
>   */
>  #define MAX_SPRITE_PLANE_WIDTH 2000
>  
> +/* constants for hibenate test */
> +#define RTC_WAKE_CMD "rtcwake -m no -s %d"

Why are you calling rtcwake directly instead of using
igt_system_suspend_autoresume(SUSPEND_STATE_DISK...) ?!

Please check lib/igt_aux lib/igt_pm and tests/xe/xe_pm

> +#define PROC_CMDLINE "/proc/cmdline"
> +#define SYS_POWER_STATE "/sys/power/state"
> +#define GRUB_CFG_PATH "/boot/grub/grub.cfg"
> +
> +static void check_hibernation_support(void)
> +{
> +	int fd;
> +	char buffer[2048];
> +	ssize_t bytes_read;
> +	FILE *cmdline;
> +
> +	/* Check if hibernation is supported in /sys/power/state */
> +	fd = open(SYS_POWER_STATE, O_RDONLY);
> +	igt_require_f(fd > 0, "Failed to open /sys/power/state");
> +	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> +	close(fd);
> +
> +	igt_require_f(bytes_read > 0, "Failed to read /sys/power/state");
> +
> +	buffer[bytes_read] = '\0';
> +	igt_require_f(strstr(buffer, "disk") != NULL,
> +		      "Hibernation (suspend to disk) is not supported on this system.\n");
> +
> +	/* Check if resume is configured in kernel command line */
> +	cmdline = fopen(PROC_CMDLINE, "r");
> +	igt_require_f(cmdline, "Failed to open /proc/cmdline");
> +	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> +	fclose(cmdline);
> +
> +	igt_require_f(strstr(buffer, "resume="),
> +		      "Kernel does not have 'resume' parameter configured for hibernation.\n");
> +}

we should probably have this in the igt_pm lib to be used in other places
like xe_pm. I remember we had discussions when s4 started failing in CI,
but apparently the solution was to make CI to work with it instead of
protecting our s4 tests...

> +
> +static void set_rtc_wake_timer(int seconds)
> +{
> +	char command[256];
> +
> +	snprintf(command, sizeof(command), RTC_WAKE_CMD, seconds);
> +
> +	igt_require_f(system(command) == 0,
> +		      "Failed to set RTC wake timer.\n");
> +}
> +
> +static void hibernate_system(void)
> +{
> +	int fd;
> +
> +	fd = open(SYS_POWER_STATE, O_WRONLY);
> +	igt_require_f(fd > 0, "Failed to open /sys/power/state");
> +
> +	if (write(fd, "disk", 4) != 4) {
> +		close(fd);
> +		igt_require_f(0, "Failed to write 'disk' to /sys/power/state");
> +	}
> +	close(fd);
> +}
> +
> +static void ensure_grub_boots_same_kernel(void)

I don't believe that this should be to the test case to ensure.
This should be ensured by the infra to support these s4 testcases.

> +{
> +	char cmdline[1024];
> +	char current_kernel[256];
> +	char last_menuentry[512] = "";
> +	char grub_entry[512];
> +	char command[1024];
> +	FILE *cmdline_file, *grub_cfg;
> +	char line[1024];
> +	bool kernel_found = false;
> +	char *kernel_arg;
> +	char *kernel_end;
> +
> +	/* Read /proc/cmdline to get the current kernel image */
> +	cmdline_file = fopen(PROC_CMDLINE, "r");
> +	igt_require_f(cmdline_file, "Failed to open /proc/cmdline");
> +
> +	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> +		fclose(cmdline_file);
> +		igt_require_f(0, "Failed to read /proc/cmdline");
> +	}
> +	fclose(cmdline_file);
> +
> +	/* Parse the kernel image from cmdline */
> +	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> +	igt_require_f(kernel_arg, "BOOT_IMAGE= not found in /proc/cmdline\n");
> +
> +	kernel_arg += strlen("BOOT_IMAGE=");
> +	kernel_end = strchr(kernel_arg, ' ');
> +
> +	if (!kernel_end)
> +		kernel_end = kernel_arg + strlen(kernel_arg);
> +
> +	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> +		 (int)(kernel_end - kernel_arg), kernel_arg);
> +	igt_debug("Current kernel image: %s\n", current_kernel);
> +
> +	/* Open GRUB config file to find matching entry */
> +	grub_cfg = fopen(GRUB_CFG_PATH, "r");
> +	igt_require_f(grub_cfg, "Failed to open GRUB configuration file");
> +
> +
> +	while (fgets(line, sizeof(line), grub_cfg)) {
> +		/* Check if the line contains a menuentry */
> +		if (strstr(line, "menuentry")) {
> +		/* Store the menuentry line */
> +			char *start = strchr(line, '\'');
> +			char *end = start ? strchr(start + 1, '\'') : NULL;
> +
> +			if (start && end) {
> +				snprintf(last_menuentry,
> +					 sizeof(last_menuentry),
> +					 "%.*s", (int)(end - start - 1),
> +					 start + 1);
> +			}
> +		}
> +
> +		/* Check if the current line contains the kernel */
> +		if (strstr(line, current_kernel)) {
> +			/* Use the last seen menuentry as the match */
> +			snprintf(grub_entry, sizeof(grub_entry), "%s",
> +				 last_menuentry);
> +			kernel_found = true;
> +			break;
> +		}
> +	}
> +
> +	fclose(grub_cfg);
> +
> +	igt_require_f(kernel_found, "Failed to find matching GRUB entry for kernel: %s\n",
> +		      current_kernel);
> +
> +	/* Set the GRUB boot target using grub-reboot */
> +	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> +	igt_require_f(system(command) == 0, "Failed to set GRUB boot target to: %s\n",
> +		      grub_entry);
> +
> +	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> +		  current_kernel, grub_entry);
> +}
> +
> +static void hibernate_autoresume(int resume_delay)
> +{
> +	check_hibernation_support();
> +	set_rtc_wake_timer(resume_delay);
> +	ensure_grub_boots_same_kernel();
> +	hibernate_system();
> +}
> +
>  static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
>  {
>  	int i;
> @@ -839,8 +988,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>  
>  	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
>  		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
> -			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -						      SUSPEND_TEST_NONE);
> +			if (data->do_hibernate)
> +				hibernate_autoresume(30);
> +			else
> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +							      SUSPEND_TEST_NONE);
>  
>  			/* on resume check flat ccs is still compressed */
>  			if (is_xe_device(data->drm_fd) &&
> @@ -1044,6 +1196,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>  		data->user_seed = true;
>  		data->seed = strtoul(optarg, NULL, 0);
>  		break;
> +	case 'r':
> +		data->do_hibernate = true;
> +		break;
>  	default:
>  		return IGT_OPT_HANDLER_ERROR;
>  	}
> @@ -1056,9 +1211,10 @@ static data_t data;
>  static const char *help_str =
>  "  -c\t\tCheck the presence of compression meta-data\n"
>  "  -s <seed>\tSeed for random number generator\n"
> +"  -r\t\tOn suspend test do full hibernate with reboot\n"
>  ;
>  
> -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
>  {
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> -- 
> 2.45.2
> 
