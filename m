Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37240606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M+66PFpq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0161125BE;
	Thu, 22 Oct 2026 12:36:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BFD1125B0
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672517; x=1824208517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jlc6+0kbIryRAV8513ccivok9cTtmUCqAyGAk3dheqc=;
 b=M+66PFpqS+3q2EZ1W8W2DM5V1C5fQSKcxLsyvc02vB9n3JLCEIs5iUOs
 NfcDdPvJn8AgZQzmP1NLm28bmlZwi/67Zvawd8m600uMyYszUAJ8+i+vW
 P2II1UyGXYsgTks2m0C5lSksgqdK7otLe7l2fB9OswnshWb0PdF4m4bIz
 9l5ZL1MciCKAhQbqbPpUo7rViqzvIJOXTvQ3LkhpjyScPJcQ6n2q0wwpR
 QESsecQjNwBL8DnV1u9mZOpzdPHcqpWnpnoXT1vNvA1oUm52sRTbtDdoB
 ZIEKdwDcv0vyLYjuotzwtyILWND/z7Vna89Eky8F/qLsgpKt/hCtC1Dyz Q==;
X-CSE-ConnectionGUID: Vz3lj4AfRFuAaeR418tqJQ==
X-CSE-MsgGUID: mFvCVOOEQ+GkO1Zd+BKxRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1309547"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1309547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:35:17 -0700
X-CSE-ConnectionGUID: eVSv9E2ISJij5pRbnLrPxw==
X-CSE-MsgGUID: aL97lSTYT+yDgKf/xOBrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3714563"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:35:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:35:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:35:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:35:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTVMlfgkjQX5OfGcLhEGbQNXBfHJ2Y7x/cqKVeKee4I2kkO283DsKir6Ftm29X2K/tkwMKNzaARIb81H6NGGAXF/JPiY870VbSfd8dqkXm/YtzJZ3ZYJaN/X0KI68ZnNZZ2wakY920GG6SfkSpjt29Lndpvx7f9B7ucpgdb6FMCdk1Cvh/9WSYj1Sr+fkTfqAf5VsjJ4CrhXXmGNbnVWh5NxyAq0EwmYe76djPUiAjpwuk0EZdbggKPKjPz+Uex1k56JUv7O8HMniW1lHS+UPB2m9FXLE3bM7URYE5MVJRS5pKzuFjQVgWq2VQf0vYnntARR0VHyDh4BTKNVAk8sjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqoXqqFAIwu8/upv4/psrLNkWefYJifeDeMsNsPtgQo=;
 b=AWpISHp2cfnrVhcb6X6oWXubhe07jwX/XbwH1EF0CN8O5F/VgNG1w6rv6FsOCkr1nKSpX4/srsPOn8iQwiaz/b7ykump7i0Jvmv132ly7NXHzh7tScwEkMdQrnupVR9SonJ/ixchW7pxTz52VGfHy2a71zXZ4gVHArWH375ieyCBwPrUX3y9Uuc678EjcMIw/5vdV3MR2szJ5+IWqrvwEkyrDYV2If5tysC3KusOb19h3n+Ug5vwI+OJe5Q2dRbgqEBhXHrQq57yQ5Z7j4MDyDDIMB9Gz0sk350OhwItY/3RBI4DrQRkljIVB5G5yfsRNet6gcrFHHUVAxaY0fUR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 12:35:08 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 12:35:08 +0000
Date: Thu, 22 Oct 2026 08:35:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <frank.scarbrough@intel.com>,
 <david.e.box@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] test/intel/xe_pmt: Support CRI PMT
Message-ID: <atoC91YzB2Y9aXt1@intel.com>
References: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
 <20261014160516.3542311-6-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014160516.3542311-6-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 373e1fb0-05ce-4fad-92e7-08df3038e7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|10067099003|261021121427099003|261021123027099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: /IjYzsbaU6hb12lFyvPMtpoIjYZmzzaF+wLt7/j0Sa88IylRuNkqYWnKMzlFXIwMx25kVb7O+Oo4cGjJ340MJ5aPFmFk1wU4MPLhFYiI0Jo5+flHVI4YZ1jHbqPQ4jfWIsgaTLprcCegwjA4MtzzdLfzb34Bkn557JSTNyVFcTIjlb2QUikpDTIt30wkhzwh9IrYo41TtMQZF05Of+KlU3KaY5dN1ziO5BNok+KF/YSH0+WtjOySs2BHGOd3kcsSjv3iqaQwt71k5y4eYmlwqKUUC2iYsFIATkV9MA9zr6dUtsYr+5FA6x3tVltq0pwK8fln02iLfjWQ2efFnjrAnvcny9Jn/OWU2dcLifgF8DYw1FHzQU4yq44apOzox1DNVDMixMR+BdpmldzEv8BRzxyhUiTwY8WXgaEbKBHvRV3Pfs/LtiC2R2M0OXpgvwG9X+O4BaDV0yqUuuBIj6KN2/KS5QXKQBqBLqofiR2YEnJlJOSaWY+B4f9+iGLdn8KyMWl8Q4OpI9xM4oChVO7MJTq6GLuSsh3NLYN8CnUl/gQtjZFn+62PeUJW0I5nGbX8XtZegVDyQQu7WmIz25+f5N87lF2fZ3TegXNiORmLGYCq4cwqiXWzKO6Lj+uiazRLj60CKtgfy+0suSu4Zecw0aectgBYAfGLIHzivseoi9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ektsljJYRa1uwJstDS31qhv1/avOOkvkn2LQbsSzUx9EbprbYqHZz5tt53IC?=
 =?us-ascii?Q?aMTw9Qhmm5BsN1SD28LnXOSjbcOVFgQ29KuJQdlwmu61HihGuCjEDDCA391C?=
 =?us-ascii?Q?egn1WWKtjswM7NlAn4WkikvNGFUlLGwTkZVL03SGKRD9mgYSdrFR3QQbheBK?=
 =?us-ascii?Q?tPKqD5BirXSCWCEvKGmLUVRUQaVJ3U0EFbkbEP1fnaBjQKWyuwb1/QjTcW0p?=
 =?us-ascii?Q?Z7RwQQxOB4ruzwAPWLCECeJRddiKKMHE67lj++fUwnr7CLZ2N4hL8EN3gI3o?=
 =?us-ascii?Q?GRNa35YC8unLbwhS/yXhuWEl6ktij2E9dNZ5CZyN23R1FXz2n4dwcCMkMDmK?=
 =?us-ascii?Q?9krpz8znCQSQ1CorhrSsMoglq7KvTDrRqK+Ad2zhKRVyicF5OTPCpHAnEDtt?=
 =?us-ascii?Q?JFPHgRmfQ9Fyx8DnsCqzFvd1IskPzSCpIB6adinnI4Zyiiloa0ri98bap5IO?=
 =?us-ascii?Q?S/JuEFv/ZfSTda2EPE1p9cCgQJk5nf5w7fFfISJiQGhEeJ9ryIwPXtiUg6uI?=
 =?us-ascii?Q?VQv9MLW4jxc0RZWKvVc1vo7qx7untt2k1hqylj7vICpE/kXld7cT59K46T9e?=
 =?us-ascii?Q?cevWsMyzoLA14nFTodZFHXzNuXsPnAmeYzT6gpBUtllEy2ERegAX+Ndre6mq?=
 =?us-ascii?Q?df1nCieojC1hbKKOLR0zSYuj+wSFzvUnaxkqKHUPUEcewDxjgZ28cKB1JCOm?=
 =?us-ascii?Q?A+BiHLa0y02sDhvHbKjf9rGkki/ZhX0YlqFqzb62cA3tEXHyTvcEzdrCdQ9L?=
 =?us-ascii?Q?/K9G8hpyR3MAJbi/kKJpXhFoaRl1paJxSp5I1CiTiCCZnns6qap7DIXIcqpm?=
 =?us-ascii?Q?rcTOGObV9xZwdQMNkFRy1maP5sfWYm/KmcC/OpKkKmL64V2uadN0DF4HC4ja?=
 =?us-ascii?Q?vo74omIYwfOvNMrOlSFGU6/uR+7Ewxds3LUhz5Ue8FASMt+HY+p66rk0w57y?=
 =?us-ascii?Q?/FJqjyR6tP7ASg7gU7q5jrc2z3xxEY3f8eOV4nUJxQcAuJI73n5qbXtXJzXp?=
 =?us-ascii?Q?cgSL883me0Hu64GkxeIS8LtNwfTtFkO/L7nO7SUmLvzkEib0OzRU9bAidtvn?=
 =?us-ascii?Q?TCPp9Rp5omw+oLoQo64qoBfp9xs5Vw8fB/rWsWY0IFYEL3h+kHtnU8ftmWr9?=
 =?us-ascii?Q?2qA82IpihcWany/GF0qdxqQu7eyzeRo2qg6HcIoSP/IZH0ZSKA5ZukvAUtA2?=
 =?us-ascii?Q?e+S8qT9MS9Nfpa2FHweFp8gVedIjGLhk0eteLncxmB5ICP/02envpszjK+oD?=
 =?us-ascii?Q?AglX2cLpXuXroJJ1hVO29X38Xb8FNxfsxY22Nv/tK8MWZUjBA7Tns+SbOWMZ?=
 =?us-ascii?Q?CwA3+C6vwXfuoVsvkQNfMrRAhiNhh9VNp0pt2qRDze75l9dmCfjZCv9NWGTq?=
 =?us-ascii?Q?Ziprzhgch8q2pWQg33M33IGUqfA+YVUVAFu5DQF2RnZaWga3ijUwSw3atNrJ?=
 =?us-ascii?Q?Y18OFHJ3NlWM+chaQrG2V5rjvYvGrlC61LFCnYym2Dzci/iPzLMJkcBEAxsc?=
 =?us-ascii?Q?P94b8EUnOr1jns4uBSpSgS7dm19ryJofkfeFQbaHQZsNLjPHWgddxG4EsizR?=
 =?us-ascii?Q?WDPaqzUIWTdENR4Ao5iXTWLj/E7lZVNaflGsS4nv6CQs/y1EcSkmIL6oE0fs?=
 =?us-ascii?Q?nZtcQ8rTm0SFLcMBnGtl4kKhO11LbcEyGAdswRwPlMJUQ2+W18I8300e+AId?=
 =?us-ascii?Q?xEH9HRPJBDg5tj2beF6UNgWQtTd1sUozkX1MiwwMRbNtz6PfFHOfrX1NlyKt?=
 =?us-ascii?Q?RsryeUKlkQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: nwN590LzQ029Mr7QSrPka32THPhM/ee8HbxOq6K8+GmdSFB+MWLLxbH1dCP2guhQlrrLtBIfx43XFqbkx2kDJaYQKQRb9in76vW7vsn/uZtt+KONa1m60UEGslIPKrHxTZaX7+zIsGbfiJPbOB0OI5O8HnBC8LnbIf0Coqq4YACkoRXEPdyVlw8jY7doTGFojozjYlyVnn83CDy9qKb+eLqH2pmIdxGMCztDAMsNclZ1ciP7uxM7oa0yg5cojDq2a//qrR1ydZU47tV8wkRWLeKGUgzkja+4KSQLTKUICMajXTHI2TAWysc4cJj4/fxqpPbceTOm3DIBUse2xsyaxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 373e1fb0-05ce-4fad-92e7-08df3038e7ec
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 12:35:08.0064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZWD5hK4UunzVZK5Qkbkuz1+LsZCuqB93OVT+9rYaEUBoh7CMcZrWDNNCLaw7oytILe2TMA+ALo/ef0koUvR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 09:05:17AM -0700, Michael J. Ruhl wrote:
> Crescent Island (CRI) devices have the Platform Monitoring
> Technology (PMT) support for the telemetry and crashlog
> (type 1/version2) functions.
> 
> Add test support for the device.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 393 ++++++++++++++++++++++++++++---------------
>  1 file changed, 262 insertions(+), 131 deletions(-)
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> index 35b285d8b..ebd3fe3f6 100644
> --- a/tests/intel/xe_pmt.c
> +++ b/tests/intel/xe_pmt.c
> @@ -8,6 +8,7 @@
>  #include <fcntl.h>
>  #include <limits.h>
>  #include <string.h>
> +#include <linux/limits.h>
>  
>  #include "igt.h"
>  #include "igt_sysfs.h"
> @@ -25,9 +26,9 @@
>   * Description: Verify that the available PMT files (crashlog and telemetry)
>   *   are created, are accessable, and respond as per design.
>   *
> - * SUBTEST: pmt-bmg-all
> + * SUBTEST: pmt-api
>   * Description:
> - *   Exercise the BMG PMT feature
> + *   Verify that the correct PMT sysfs file exist and verify access
>   *
>   */
>  
> @@ -40,16 +41,34 @@ IGT_TEST_DESCRIPTION("Verify Platform Monitoring Technology (PMT) files operatio
>  #define TELEMETRY_DIR "telem"
>  
>  /* itemize the available instances for the specific device */
> -enum bmg_crashlog_instances {
> -	bmg_crashlog_punit = 0,
> -	bmg_crashlog_oobmsm,
> -	bmg_crashlog_max
> +enum pmt_device {
> +	PMT_DEVICE_BMG,
> +	PMT_DEVICE_CRI,
>  };
>  
> -enum bmg_telemety_instances {
> -	bmg_telemetry_punit = 0,
> -	bmg_telemetry_oobmsm,
> -	bmg_telemetry_max
> +struct pmt_device_info {
> +	uint32_t max_crashlog;
> +	uint32_t max_telem;
> +};
> +
> +#define BMG_CRASHLOG_MAX	(2)
> +#define BMG_TELEM_MAX		(2)
> +
> +#define CRI_CRASHLOG_MAX	(2)
> +#define CRI_TELEM_MAX		(3)
> +
> +#define CRASHLOG_MAX		CRI_CRASHLOG_MAX
> +#define TELEM_MAX		CRI_TELEM_MAX
> +
> +struct pmt_device_info device_info[] = {
> +	[PMT_DEVICE_BMG] = {
> +		.max_crashlog = BMG_CRASHLOG_MAX,
> +		.max_telem = BMG_TELEM_MAX,
> +	},
> +	[PMT_DEVICE_CRI] = {
> +		.max_crashlog = CRI_CRASHLOG_MAX,
> +		.max_telem = CRI_TELEM_MAX,
> +	},
>  };
>  
>  static char dev_path[PATH_MAX];
> @@ -59,13 +78,18 @@ static char work_path[PATH_MAX * 2];
>   * In most case there should be a single instance of the crashlog and telemetry
>   * directories. If DVSEC entries are not contiguous the structure will be different,
>   * and the code will need to reflect the structure.
> + * vsec directory string size is sizeof(xxx_DIR) + idx.  For instance:
> + *    intel_vsec.crashlog.3
> + *    intel_vsec.telemetry.23
>   */
> -static char crashlog_vsec_dir[32];
> -static char telemetry_vsec_dir[32];
> +#define MAX_VSEC_DIR (32)
> +
> +static char crashlog_vsec_dir[MAX_VSEC_DIR];
> +static char telemetry_vsec_dir[MAX_VSEC_DIR];
>  
>  /* This needs to be specific for each supported device */
> -static char crashlog_dir[bmg_crashlog_max][32];
> -static char telemetry_dir[bmg_telemetry_max][32];
> +static char crashlog_dir[CRASHLOG_MAX][MAX_VSEC_DIR];
> +static char telemetry_dir[TELEM_MAX][MAX_VSEC_DIR];
>  
>  /* telemetry file names */
>  static const char *telem = "telem";
> @@ -90,7 +114,7 @@ struct crashlog_v2_info {
>  	int rearm_fd;
>  	int trigger_fd;
>  	u_int32_t guid;
> -} bmg_info[bmg_crashlog_max];
> +} crashlog_info[CRASHLOG_MAX];
>  
>  #define DEV_PATH_LEN 80
>  
> @@ -121,17 +145,22 @@ static char *device_sysfs_path(int fd, char *path)
>  /*
>   * Verify the PMT directory structure
>   *
> - * BMG PMT directory structure:
> + * BMG/CRI PMT directory structure:
>   *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>   *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>   *
>   * Note: different platforms could have a different pattern
>   */
> -static void test_pmt_directories(int dev_fd)
> +static void test_pmt_directories(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	struct dirent *ent;
> -	int index;
> +	uint32_t index;
>  	DIR *dir;
> +	uint32_t max_crashlog;
> +	uint32_t max_telem;
> +
> +	max_crashlog = device_info[pmt_dev].max_crashlog;
> +	max_telem = device_info[pmt_dev].max_telem;
>  
>  	igt_assert(device_sysfs_path(dev_fd, dev_path));
>  
> @@ -161,7 +190,7 @@ static void test_pmt_directories(int dev_fd)
>  	/* find the crashlog<x> directory instances */
>  	while ((ent = readdir(dir)) != NULL) {
>  		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> -			if (index < bmg_crashlog_max)
> +			if (index < max_crashlog)
>  				strcpy(crashlog_dir[index], ent->d_name);
>  			index++;
>  		}
> @@ -169,8 +198,9 @@ static void test_pmt_directories(int dev_fd)
>  
>  	closedir(dir);
>  
> -	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> -	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +	igt_assert_f(index == max_crashlog, "unexpected crashlog entries: %d  vs expected: %d\n",
> +		     index, max_crashlog);
> +	for (int i = 0; i < max_crashlog && i < ARRAY_SIZE(crashlog_dir); i++)
>  		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
>  
>  	/* verify telemetry directory structure */
> @@ -182,7 +212,7 @@ static void test_pmt_directories(int dev_fd)
>  	index = 0;
>  	while ((ent = readdir(dir)) != NULL) {
>  		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> -			if (index < bmg_telemetry_max)
> +			if (index < max_telem)
>  				strcpy(telemetry_dir[index], ent->d_name);
>  			index++;
>  		}
> @@ -190,8 +220,9 @@ static void test_pmt_directories(int dev_fd)
>  
>  	closedir(dir);
>  
> -	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> -	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +	igt_assert_f(index == max_telem, "unexpected telemetry entries: %d  vs expected: %d\n",
> +		     index, max_telem);
> +	for (int i = 0; i < max_telem && i < ARRAY_SIZE(telemetry_dir); i++)
>  		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
>  
>  }
> @@ -227,43 +258,80 @@ static void open_pmt_file(const char *path, const char *file, int *fd, int flags
>  /*
>   * verify that the expected telemetry file(s) are in place
>   */
> -static void test_pmt_telemetry_files(int dev_fd)
> +static void test_pmt_telemetry_files(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	int i;
>  
> -	for (i = 0; i < bmg_telemetry_max; i++) {
> +	for (i = 0; i < device_info[pmt_dev].max_telem; i++) {
>  		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
>  			"intel_pmt", telemetry_dir[i]);
>  		find_pmt_file(work_path, telem);
>  	}
>  }
>  
> +/*
> + * verify that a read will be successful
> + */
> +static void test_pmt_telemetry_read_data(int dev_fd, enum pmt_device pmt_dev)
> +{
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	u_int32_t guid;
> +	int telem_fd;
> +	int guid_fd;
> +	int ret;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < device_info[pmt_dev].max_telem; i++) {
> +		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
> +			"intel_pmt", telemetry_dir[i]);
> +		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &guid_fd, O_RDONLY);
> +
> +		ret = pread(guid_fd, buf, sizeof(buf), 0);
> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> +		guid = strtol(buf, NULL, 16);
> +		igt_assert_f(guid > 0, "failed to get guid for device %d\n", i);
> +
> +		len = read(telem_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read telemetry data\n", guid);
> +
> +		val = (u_int32_t *)buf;
> +		igt_assert_f(*val != 0xffffffff, "0x%x: invalid telemetry data value: : 0x%x\n",
> +			     guid, *val);
> +
> +		close(telem_fd);
> +		close(guid_fd);
> +	}
> +}
> +
>  /*
>   * verify that the expected crashlog files are in place
>   */
> -static void test_pmt_crashlog_files(int dev_fd)
> +static void test_pmt_crashlog_files(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	char buf[64] = {};
>  	int ret;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
>  		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
>  			crashlog_dir[i]);
>  
> -		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> -		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> -		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> -		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> -		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> -		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> -		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> -		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +		open_pmt_file(work_path, clear, &crashlog_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &crashlog_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &crashlog_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &crashlog_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &crashlog_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &crashlog_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &crashlog_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &crashlog_info[i].trigger_fd, O_RDWR);
>  
> -		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		ret = pread(crashlog_info[i].guid_fd, buf, sizeof(buf), 0);
>  		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> -		bmg_info[i].guid = strtol(buf, NULL, 16);
> -		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +		crashlog_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(crashlog_info[i].guid > 0, "failed to set guid for device %d\n", i);
>  	}
>  }
>  
> @@ -299,15 +367,15 @@ static bool verify_msg(int fd, const char *msg, const char *file) {
>  /*
>   * Set enable enable/disable bit and verify usage
>   */
> -static void test_pmt_crashlog_enable(int dev_fd)
> +static void test_pmt_crashlog_enable(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	u_int32_t guid;
>  	int fd;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		fd = bmg_info[i].enable_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		fd = crashlog_info[i].enable_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* force enable so we are in a known state */
>  		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> @@ -325,188 +393,251 @@ static void test_pmt_crashlog_enable(int dev_fd)
>  }
>  
>  /*
> - * Test the clear crashlog bit. After setting the crashlog data buffer should be
> - * set to 0xdeadbeef.
> - * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
> - * file is the "standard" usage, so test that usage.
> - * This bit cannot be cleared by software (i.e. reboot required).
> + * The error bit is set when a crashlog fails in HW.  It is read only so only
> + * need to verify that it is "0".
> + */
> +static void test_pmt_crashlog_error(int dev_fd, enum pmt_device pmt_dev)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		guid = crashlog_info[i].guid;
> +		igt_assert_f(verify_msg(crashlog_info[i].error_fd, DISABLE_MSG, error),
> +			     "0x%x: error clear\n", guid);
> +	}
> +}
> +
> +/*
> + * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> + * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
>   */
> -static void test_pmt_crashlog_clear(int dev_fd)
> +static void test_pmt_crashlog_rearm(int dev_fd, size_t pmt_dev)
> +{
> +	uint32_t guid;
> +	int i;
> +
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		guid = crashlog_info[i].guid;
> +		igt_assert_f(verify_msg(crashlog_info[i].rearm_fd, ENABLE_MSG, rearm),
> +			     "0x%x: rearm set\n", guid);
> +	}
> +}
> +
> +/*
> + * Verify the crashlog data is in the initialized state
> + * 0xdeadbeef BMG PUINT/OOBMSM default, CRI PUNIT default
> + * 0xba0b6afe CRI OOBMSM default
> + */
> +static void test_pmt_crashlog_inited(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	char buf[64] = {};
>  	u_int32_t guid;
>  	int crashlog_fd;
> -	int trigger_fd;
>  	int clear_fd;
>  	int *val;
>  	int len;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		clear_fd = bmg_info[i].clear_fd;
> -		crashlog_fd = bmg_info[i].crashlog_fd;
> -		trigger_fd = bmg_info[i].trigger_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		clear_fd = crashlog_info[i].clear_fd;
> +		crashlog_fd = crashlog_info[i].crashlog_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* make sure the bit is clear */
>  		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
>  
> -		/* set the clear bit (0 -> trigger)*/
> -		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
> -
> -		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> -		sleep(1);
> -		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
> -
>  		len = read(crashlog_fd, buf, sizeof(buf));
>  		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
>  
>  		val = (int *)buf;
> -		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +		igt_assert_f(*val == 0xdeadbeef || *val == 0xba0b6afe,
> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>  	}
>  }
>  
> +//#define PMT_CRASHLOG_TRIGGER_ENABLE 1
> +#if PMT_CRASHLOG_TRIGGER_ENABLE

oh, I just noticed you remove it here... but perhaps we can do something more
interactive here...

and also, let's move this part here to the first patch to make it bisectable...

>  /*
> - * After a crashlog has been "consumed" (read), setting this bit can be done.
> - * Verify that it is set correctly.
> + * Triggering a Crashlog requires a power cycle to return the device to a usable
> + * state.
> + * This is very disruptive and doesn't necessarily verify much more than the
> + * current set of tests.
> + * Commentting out the trigger, consumed, clear path for "normal" testing.
> + * Compile flag so these tests can be done expclity.
>   */
> -static void test_pmt_crashlog_consumed(int dev_fd)
> +
> +/*
> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + */
> +static void test_pmt_crashlog_trigger(int dev_fd, size_t pmt_dev)
>  {
> -	uint32_t guid;
> -	int fd;
> +	char buf[64] = {};
> +	u_int32_t *val;
> +	int crashlog_fd;
> +	int trigger_fd;
> +	u_int32_t guid;
> +	int len;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		fd = bmg_info[i].consumed_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		crashlog_fd = crashlog_info[i].crashlog_fd;
> +		trigger_fd = crashlog_info[i].trigger_fd;
> +		guid = crashlog_info[i].guid;
>  
> -		/* check, set, verify */
> -		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> -		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> -		/* sleep(1) to allow HW to set the bit */
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> +			     guid);
> +		/* set the trigger bit (1 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +
> +		/* sleep to let the HW do its thing */
>  		sleep(1);
> -		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
> -	}
> -}
>  
> -/*
> - * The error bit is set when a crashlog fails in HW.  It is read only so only
> - * need to verify that it is "0".
> - */
> -static void test_pmt_crashlog_error(int dev_fd)
> -{
> -	uint32_t guid;
> -	int i;
> +		/* make sure the bit is set */
> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> +			     guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		guid = bmg_info[i].guid;
> -		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
> +		val = (u_int32_t *)buf;
> +
> +		igt_assert_f(*val != 0xdeadbeef && *val != 0xba0b6afe,
> +			     "0x%x: invalid trigger value: : 0x%x\n", guid, *val);
>  	}
>  }
>  
>  /*
> - * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
> - * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
> + * After a crashlog has been "consumed" (read), setting this bit can be done.
> + * Verify that it is set correctly.
>   */
> -static void test_pmt_crashlog_rearm(int dev_fd)
> +static void test_pmt_crashlog_consumed(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	uint32_t guid;
> +	int fd;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		guid = bmg_info[i].guid;
> -		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		fd = crashlog_info[i].consumed_fd;
> +		guid = crashlog_info[i].guid;
> +
> +		/* check, set, verify */
> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
> +		/* sleep(1) to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
>  	}
>  }
>  
>  /*
> - * Set the manual trigger bit and make sure the data is not 0xdeadbeef
> + * Test the clear crashlog bit. After setting the crashlog data buffer should be
> + * set to 0xdeadbeef or 0xba0b6afe.
> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
> + * file is the "standard" usage, so test that usage.
> + * This bit cannot be cleared by software (i.e. reboot required).
>   */
> -static void test_pmt_crashlog_trigger(int dev_fd)
> +static void test_pmt_crashlog_clear(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	char buf[64] = {};
> -	u_int32_t *val;
> +	u_int32_t guid;
>  	int crashlog_fd;
>  	int trigger_fd;
> -	u_int32_t guid;
> +	int clear_fd;
> +	int *val;
>  	int len;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		crashlog_fd = bmg_info[i].crashlog_fd;
> -		trigger_fd = bmg_info[i].trigger_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		clear_fd = crashlog_info[i].clear_fd;
> +		crashlog_fd = crashlog_info[i].crashlog_fd;
> +		trigger_fd = crashlog_info[i].trigger_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* make sure the bit is clear */
> -		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> -			     guid);
> -		/* set the trigger bit (1 -> trigger)*/
> -		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
>  
> -		/* sleep to let the HW do its thing */
> -		sleep(1);
> +		/* set the clear bit (0 -> trigger)*/
> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
>  
> -		/* make sure the bit is set */
> -		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
> -			     guid);
> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
> +		sleep(1);
> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
>  
>  		len = read(crashlog_fd, buf, sizeof(buf));
>  		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
>  
> -		val = (u_int32_t *)buf;
> -
> -		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +		val = (int *)buf;
> +		igt_assert_f(*val == 0xdeadbeef || *val == 0xba0b6afe,
> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>  	}
>  }
> +#endif
>  
>  /**
> - * SUBTEST: pmt-bmg-all
> + * SUBTEST: pmt-api
>   * Description:
>   *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
>   *   individually unless you understand the underlying HW behavior.  Because of this behavior,
> - *   all of the test will be done in order in one step.
> + *   all of the test will be done in order in one sub-test.
> + *
> + *   Crashlog will cause the GPU to be in an un-useful state.  Reseting to recover
> + *   is not yet fully defined.
>   *   NOTE:
> + *     o PMT file info is accumulated from successful tests and is used in sequence
>   *     o Testing MUST be done after a cold reset
>   *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
>   *
>   *  Test category: functionality test
>   */
> -static void test_pmt_bmg(int fd)
> +static void test_pmt_api(int fd, enum pmt_device pmt_dev)
>  {
> -	test_pmt_directories(fd);
> -	test_pmt_telemetry_files(fd);
> -	test_pmt_crashlog_files(fd);
> -	test_pmt_crashlog_error(fd);
> -	test_pmt_crashlog_enable(fd);
> -	test_pmt_crashlog_rearm(fd);
> -	test_pmt_crashlog_trigger(fd);
> -	test_pmt_crashlog_consumed(fd);
> -	test_pmt_crashlog_clear(fd);
> +	test_pmt_directories(fd, pmt_dev);
> +
> +	test_pmt_telemetry_files(fd, pmt_dev);
> +	test_pmt_telemetry_read_data(fd, pmt_dev);
> +
> +	test_pmt_crashlog_files(fd, pmt_dev);
> +	test_pmt_crashlog_error(fd, pmt_dev);
> +	test_pmt_crashlog_enable(fd, pmt_dev);
> +	test_pmt_crashlog_rearm(fd, pmt_dev);
> +	test_pmt_crashlog_inited(fd, pmt_dev);
> +
> +#if PMT_CRASHLOG_TRIGGER_ENABLE
> +	test_pmt_crashlog_trigger(fd, pmt_dev);
> +	test_pmt_crashlog_consumed(fd, pmt_dev);
> +	test_pmt_crashlog_clear(fd, pmt_dev);
> +#endif
>  }
>  
>  int igt_main()
>  {
>  	const struct {
>  		const char *name;
> -		void (*func)(int);
> +		void (*func)(int, enum pmt_device);
>  	} funcs[] = {
> -		{ "pmt-bmg-all", test_pmt_bmg },
> +		{ "pmt-api", test_pmt_api },
>  		{ }
>  	}, *f;
>  	int dev_fd;
> +	enum pmt_device pmt_dev;
>  
>  	igt_fixture() {
>  		uint16_t dev_id;
>  
>  		dev_fd = drm_open_driver(DRIVER_XE);
>  		dev_id = intel_get_drm_devid(dev_fd);
> -		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
> +		igt_require_f(IS_BATTLEMAGE(dev_id) || IS_CRESCENTISLAND(dev_id),
> +			      "PMT supported on BMG or CRI GPUs\n");
> +
> +		pmt_dev = IS_BATTLEMAGE(dev_id) ? PMT_DEVICE_BMG : PMT_DEVICE_CRI;
>  	}
>  
>  	igt_describe("PMT access and API testing");
>  	for (f = funcs; f->name; f++) {
>  		igt_subtest_f("%s", f->name)
> -			f->func(dev_fd);
> +			f->func(dev_fd, pmt_dev);
>  	}
>  
>  	igt_fixture()
> -- 
> 2.43.0
> 
