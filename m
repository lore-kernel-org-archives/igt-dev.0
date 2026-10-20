Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77529606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 21:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E75NjyRr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E8910E4CD;
	Tue, 20 Oct 2026 21:16:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE210E4CD
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792530961; x=1824066961;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qCDEl8Ob0dok/Yn0rD+L/pSSFWgFd6ONEgwAGMSR93c=;
 b=E75NjyRrqDlQxAQ1iwcWVvflKjCTFM/MNfU0bwJwFuYT3rifhd54NWWc
 dZMXujao3TSSKTr7j7j831lqluEXNAoSjBuU4jWzMRCuhztm5LTi85cvG
 n9YLdT8KEOyiiXgD6k/ZL+do60y46BTkGHg8N3CA1LAQ1Uz9VC5QgTFIS
 7OceBxDktRgEufg/D4hjZDxq0o5A0KezCN7A9tA0PNwAS1kLS/AxowYi6
 iwLspq0FVJ5aeV9SBjAxH4u2iH1xW6rbKi0n+8Ona933qbPUn/cSCK+KQ
 jm7w1hGUx0P4G19kQa4aXp1sZP3biAxCMYc1HnexGYpfWCaKylph3RJqz Q==;
X-CSE-ConnectionGUID: EkLAcsy6QOOkdqleGwNoZA==
X-CSE-MsgGUID: RnB6ZtVIQ/iAS6LHrq3y0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1248027"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1248027"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:16:01 -0700
X-CSE-ConnectionGUID: gdyHsuiiRFqtAqVqW1m7wg==
X-CSE-MsgGUID: vIkoCXVPT+Czd6nsuqmrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2973147"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 14:16:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:15:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 14:15:59 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 14:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwX1dtjBQFWHU+K3E3EOPAGSUB4mQer4gwtJ4ALLz1hEQ5gf4QTyQm0qJc6DGZg3jee9uPiLzGfI52LoX9RzkHGRT5qvcByuMWnLd2tZnt+rsDGTkgI9Zu0abpwt2EBAUrDrEXKM6ze3708Kvu08mrpVdrGSEhtZutNSnw6brW8noLV8LWIj+b6PlgOGtNm7D1a9uWtxYnMl6UlGBE2uhU7mOpdnvxD311xBxh4Y1i2T/2HkPBMQajv5SFYuR6q6ZlDKEchhNmnE26JehOvFshulNdpdptu03YzGWdCjGfi3a5kkSSc3ADq6LZs4gzaQ1W0oz+vCkzPAB30jTol/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9lzBlQV6RcKuXNnLbv+519U97GPGcUhxVx+VJMpZmg=;
 b=WImCVk3I9qkRTTrxR57YSsoZiobb2yjPdoiWU4ZF2PDDBv6P8nw3Z+2TZCgHjzWYB2z/vEwdX8BndjdZMdvDBqTy2xYD8/ZJ6/ri01Jh8OlrPLDQPh3RDSCNALTqnfYz5Y2sIZe4a+MMCLU7FFksT2UcDTBiXR9e1wv4PYIesF7SdT0QBzSY7lVqz52MXMySBwvmIJNH6rnvmQQlphPwfYW5XziSbwMszofy16L7fVpDr3AoDhoqfkaVzFwhUNKhvG8bl0uYHWSBuA6SVIawe8oMbDTd3pef77rsvGPts3hpUq/2UTR0BizzArhZ7utNakB9PzM/+1Q7izCGhKGvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SA1PR11MB9683.namprd11.prod.outlook.com
 (2603:10b6:806:4df::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 21:15:58 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::387e:6187:3626:ee07%2]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 21:15:57 +0000
Date: Tue, 20 Oct 2026 14:15:55 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 02/11] lib/xe: Make debugfs_file_has_wa() aware
 of the debugfs file layout
Message-ID: <20261020211555.GA180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-2-528b575299d2@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923-wa_14026539277-v2-2-528b575299d2@intel.com>
X-ClientProxiedBy: SJ0PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::6) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SA1PR11MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d15be4a-4189-4e36-34aa-08df2eef558d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|10070799003|376014|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: LyfjusxjV2JBQKedOChc8blmY0CEV7guRxNAMIUgbhwvXLORYi5Rml1xyOxSh1cDJZhssuBYbv1P/icfQyr+0Xy7lFFQ8hYp+jDNH6AKXoQSwoOKJ1x2tJ1oGAAVE/mBsauG4l3/bkZ94qzObWcnL8PNRr+/AS62q8ibM00BsY3Xm0E2uV02O1/KpbIt7c/nluyLTAozVR2JHSmK7zTEvGcNvplV/to6DjAGSoneIq+BsyJKHK+h778Mzy5i0QnY7v54MsQyEG+bbRwEqhJ4r9SvfmiPHBa/REvq+qaO3c3gsKB1q9819sSG1H/KXLO56yJybmzDnVOYiZxvs6wr1hprkKD8GYKqh3ctYSvs7JOeC6DVzwVlTI1qCk3dkp/KOlnH1YXsvAYJFs0IhX/447biG+MZmp9kQhU1g+Ifv7s0RWdVnf4mBRBggJwRZ/bMu/x+JEikbs8TXDCVrAo/iTQ91B55CgJdMYubcmsSEcaHDNwATXqLMo5zrHl5TmFAlu4N+7rCiZ5/csuW8X7SWoZu2qLHIE0RO5POapKxeBNSpUAApnbrkR0AILo+QTqF69yOzmJyH3+DfwoYPz5Pr8/b8giXl6OX7icgfnStBrgVaHovg4JHczVtPnPWUgTwolE7MSLc/w1DExSBJFi3izkzX40xGGlUsulxr0yjWoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fm8Qy8S//3PF5N91JJ525Vk5RIApfEAeh/Qc6o7fb2qkURguOoAZHWEa72?=
 =?iso-8859-1?Q?7ydfV2/K2dAxEdTic9QdK0PoycJ8oDgOREbNz0V6JMFJHOK6ZvkfMnlU+i?=
 =?iso-8859-1?Q?MVtmsjs+7dL0afnpBpVg7pvdhEZrgMGZe57ba/LTPiQZ/FIbLNoPg6odqJ?=
 =?iso-8859-1?Q?b1I/7zqy8O4P2nRtoQuYvv7dy7DRBZvjNOSUR+U1i7nO9xhL0d+xVWS7Z3?=
 =?iso-8859-1?Q?oQQrNvYc7NtPeyxiCc4ucURHvU6IzbQtYvIhjMagX6VDIeLpjhBQMDQ7NO?=
 =?iso-8859-1?Q?8q2RZHhGt0Wo/Nci3RD44glBLGb/HAIel9d9GCqlXoAeVioLZjoW7Ogg/j?=
 =?iso-8859-1?Q?AH6z4BkAnitZmaxFK2SZSUadoyN9o29TpKF54rDq7mtqXS6B/NG27ioLaw?=
 =?iso-8859-1?Q?QyzGuZKK72sHpI9JdAbBsXKV57nB3T+Mp074M8rlHT2eu6wfuokboQnFtt?=
 =?iso-8859-1?Q?o+sJVkCwoqhYsv1kVu6zk5I6taTFL6wQf+Gm4r9eHjNjYZBPIrO6EtzzcR?=
 =?iso-8859-1?Q?sixNMi++FMqyiSUMHyc3AdFdt91JJ4iNSBzmjongxnIt7q0eqLzyL4/GO3?=
 =?iso-8859-1?Q?rd0drWxemvEnVoHAU1I8RZqgc3VdONLRJg1SD8pQKRUcpf0ZpDSCq9fR4E?=
 =?iso-8859-1?Q?wayWB6vMq2LJbYUWw52z5jIOOvBKJ84/cCKo6drxEAHtdTXUGU0JTiT/sW?=
 =?iso-8859-1?Q?bR30VQvTQFqJ3NoGIC7QVMz2iUyZtsNGzhaQBk/SU2jfbmSYo/5A1/l3H2?=
 =?iso-8859-1?Q?706QTlLh4gP49RBXhkcHBxMK5qqgRWk+TzNq2jz7xBNqKG7XzZIIs8vKpL?=
 =?iso-8859-1?Q?S1suihgIhqp2Ma/fftT3tZnwY2yGhJqP9hej+gzOxJywr9JLZ4vYviSuAL?=
 =?iso-8859-1?Q?ztEkZld4zYdJ0dbRl1xh389wSFtEhPrl+VxqZZGHd8II1jaRI2CsEOwxNG?=
 =?iso-8859-1?Q?48OvJ96BGOelf5jucsdpvovs8SYyknGNfV21zFA7YRcWxNYaovD/hDUAhr?=
 =?iso-8859-1?Q?FeYSNr7mkBJnibt/RnBAa8ypNQoq4bQRxFqZLutEWDxKb0TP+IFlwBTMuj?=
 =?iso-8859-1?Q?mO1t8nDOu1HrM+zj6SaePNGO1t6qqjZ3YDBEhQS0qnBzR8fq1Pvje+G8Ok?=
 =?iso-8859-1?Q?KyAnoTAuSrxnTpBkcip2qx5pciBUqki+AWU99y8lArQ8vAlIUhBim/M+AW?=
 =?iso-8859-1?Q?dj7GSjzYRfT+pZ8dNvNqtjyyXb7Z5AJoGFFnIkQQaklhGZuR9H9f9RcOfN?=
 =?iso-8859-1?Q?8fSG0okWyYBtpV93K2QM6/0J+UU1BZgOQQ0Ydq8TN3UK7L+EqB/ocsjCZk?=
 =?iso-8859-1?Q?ptc6epAbqJh1kBkcyl2s9Li1MkpHbb0W//aKzq1Z4RQiQHq8tqrMGM8gHu?=
 =?iso-8859-1?Q?75o9LPcdHGCDIuHj8mqqkwYDF4MDeSky5dBskIDnJh8PjvWpCp8coUp85A?=
 =?iso-8859-1?Q?sZoyXUL7zaa9w8nimfnab0ivqzoIU/cUkXuqXYUL0o4sxYjhHuEl/UNU3y?=
 =?iso-8859-1?Q?CVDCLJL5b5Pt+3eBXjMacEE5aN15QU3/yEOTXRg8T++sLt3W98vtCXe/Cm?=
 =?iso-8859-1?Q?LtgifTqVgy4nNs8tCDNHPu21Qla3gMMrvLBIxYqKOkCZKHiY45u96fDEk4?=
 =?iso-8859-1?Q?daxS6Sc7wrCxnf/JbFaYDDWNOsGEKn/KyWo2zJYr9WgtN+f9SWJXmZShjv?=
 =?iso-8859-1?Q?bZcKPp22rRarBlcgOdXJJi/5LmWPnLrAoJqyZW/VSB+SZWCWqEZSKOVyWt?=
 =?iso-8859-1?Q?GrWpS2duiWXW1xEd1xw9F5VBdXAwGkJpjw6emwffLbTB5UVkek4DY5M+vv?=
 =?iso-8859-1?Q?rwhuz/ISXFQsib9iMnUAZjECI4l1NdBqHQBIt1yoAtM3ct0Jiv9eLAgpzi?=
 =?iso-8859-1?Q?HU?=
X-MS-Exchange-AntiSpam-MessageData-1: usaGcaZ9u860YORx1W8wWzbJyIYeDlo9Yco=
X-Exchange-RoutingPolicyChecked: WL7EPlBh3ZMwZF8QNxgZSJbaxkbmi3iE3dnehb5DJ1ssedxubKIi0n075p4X8VVexwF5ZQ9tUG9oyErYxYx1yw+Wy0DNX043Z2AmNuii/tEnHDz9SQWrVVbw6xZzskbp80NF/PMcNY+JZD1SpxPbQvn3Ag0U6T+zQccwn0ympeDvbRluaxOUnu5lxZsUzmuIHeA48pHKV1R8J+SdNXGEP75a4TLYDcpCmmJ1E1ZSlVEUQNdqnJfhQj7KckwjogzJ0U+h6v65GhovnLJEXrxctPiqASZH/qC0ytF//5iH/dRqtAgwXSwzRCNHZHgsq7KQaqCgt7Ghuk9oSzpIYThnsg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d15be4a-4189-4e36-34aa-08df2eef558d
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:15:57.8928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5uPE6YYt/Cvhr4b7FWxfC/Ic0/z/yXRT4su3OhN/bK0lpEHIzVafow6qQ+C84dFEcL+9xKLdZBBmaGUJLMslumQhHxVsZWT221uhAGXjZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9683
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

On Wed, Sep 23, 2026 at 06:41:09PM -0300, Gustavo Sousa wrote:
> Currently debugfs_file_has_wa() uses strstr() to check if a workaround
> name is present in the debugfs dump.  That's a bit fragile because
> that solution isn't aware of the layout of a workaround debugfs dump.
> The strstr() call could match a substring of a workaround or even a
> "section line" of the file.
> 
> Make workaround matching more robust by adding a proper parser for the
> debugfs dump.
> 
> While at it, let's make sure that we have a lib test to validate the
> new logic.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  lib/tests/meson.build |  1 +
>  lib/tests/xe_wa.c     | 42 +++++++++++++++++++++++++++++++
>  lib/tests/xe_wa.h     | 12 +++++++++
>  lib/xe/xe_wa.c        | 69 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  4 files changed, 121 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index f1db66d07c28..aa8cb37c2252 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -28,6 +28,7 @@ lib_tests = [
>  	'igt_thread',
>  	'igt_types',
>  	'i915_perf_data_alignment',
> +	'xe_wa',
>  ]
>  
>  lib_fail_tests = [
> diff --git a/lib/tests/xe_wa.c b/lib/tests/xe_wa.c
> new file mode 100644
> index 000000000000..d03d3f4e2ca0
> --- /dev/null
> +++ b/lib/tests/xe_wa.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include "igt_core.h"
> +
> +#include "tests/xe_wa.h"
> +
> +static char fake_dump[] =
> +	"Some workarounds\n"
> +	"	wa_a\n"
> +	"	wa_b\n"
> +	"Another set of workarounds\n"
> +	"	wa_c\n"
> +	"	wa_d\n"
> +	"Yet another, but empty section\n"
> +	"A final section\n"
> +	"	wa_x, wa_y, wa_z\n"
> +	"	wa_abcd\n";
> +
> +int igt_simple_main()
> +{
> +	/* Match workaround that is the single occurrence in the line. */
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_c"), 1);
> +
> +	/* Match workarounds that are listed with others in the same line. */
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_x"), 1);
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_y"), 1);
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_z"), 1);
> +
> +	/* Do not match non-existing workarounds. */
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "non-existing"), 0);
> +
> +	/* Match full workaround name and not substrings. */
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_abc"), 0);
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "wa_abcd"), 1);
> +
> +	/* Don't match section titles. */
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "Some workarounds"), 0);
> +	igt_assert_eq(xe_wa_test_debugfs_dump_has_wa(fake_dump, "Another set of workarounds"), 0);
> +}
> diff --git a/lib/tests/xe_wa.h b/lib/tests/xe_wa.h
> new file mode 100644
> index 000000000000..3ca2a553fe68
> --- /dev/null
> +++ b/lib/tests/xe_wa.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef LIB_TESTS_XE_WA_H
> +#define LIB_TESTS_XE_WA_H
> +
> +int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa);
> +
> +#endif /* LIB_TESTS_XE_WA_H */
> +
> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
> index 7b8e54b2ad27..c0c97e244564 100644
> --- a/lib/xe/xe_wa.c
> +++ b/lib/xe/xe_wa.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <fcntl.h>
> +#include <regex.h>
>  #include <stdint.h>
>  #include <stdio.h>
>  
> @@ -13,6 +14,68 @@
>  #include "xe/xe_query.h"
>  #include "xe/xe_wa.h"
>  
> +#include "tests/xe_wa.h"
> +
> +static int debugfs_dump_has_wa(char *dump, const char *wa)
> +{
> +	size_t wa_len;
> +	regex_t regex;
> +	regmatch_t match[2];
> +	int ret;
> +
> +	if (regcomp(&regex, "[ \t,]*([^ \t,]+)", REG_EXTENDED | REG_NEWLINE)) {
> +		igt_critical("Failed to compile regex, workaround %s will not be checked.\n",
> +			     wa);
> +
> +		return -1;
> +	}
> +
> +	wa_len = strlen(wa);
> +	ret = 0;
> +
> +	while (*dump) {
> +		/*
> +		 * Each workaround name is indented by one tab
> +		 * character; unindented lines are used as "section
> +		 * names" identifying the type of workarounds that
> +		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
> +		 * etc) and should be ignored.
> +		 */
> +		if (*dump != '\t')
> +			goto next_line;
> +
> +		while (*dump && regexec(&regex, dump, 2, match, 0) == 0) {
> +			char *other_wa = dump + match[1].rm_so;
> +			size_t other_wa_len = match[1].rm_eo - match[1].rm_so;
> +
> +			dump += match[0].rm_eo;
> +
> +			if (wa_len == other_wa_len && !strncmp(wa, other_wa, wa_len)) {
> +				ret = 1;
> +
> +				goto done;
> +			}
> +		}
> +
> +	next_line:
> +		while (*dump && *dump != '\n')
> +			dump++;
> +
> +		if (*dump)
> +			dump++;
> +	}
> +
> +done:
> +	regfree(&regex);
> +
> +	return ret;
> +}
> +
> +int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
> +{
> +	return debugfs_dump_has_wa(dump, wa);
> +}
> +
>  static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  			       const char *debugfs_name, const char *wa)
>  {
> @@ -23,12 +86,12 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>  
>  	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>  	if (debugfs_dump) {
> -		char *has_wa = strstr(debugfs_dump, wa);
> +		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
>  
>  		free(debugfs_dump);
>  
> -		if (has_wa)
> -			return 1;
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return 0;
> 
> -- 
> 2.55.0
> 
