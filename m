Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F4606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 19:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbQ7Gp52
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB8B10F0F6;
	Mon, 26 Oct 2026 19:39:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3264B10F0F6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793043494; x=1824579494;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aoD+2kuZqwjZpALnI6ceSyUnmzUD+h6PHwpwb1pb1Lw=;
 b=kbQ7Gp52sw5YW0kDB2rCXcGvf4cHMX4ccnmUpshSAAxkT41b+LZJDUo5
 ZCimQ7/OpfoSdEn4p13OT4foOB0bywDNviMEMlvGyKF0+Ua98eujLEheG
 H2JaSynZMDK8aQ2/xg8esdIUuuakInR764kOMEuF5b5R/9qKm8cCQfRjs
 IIJ4hFUGNj0c14aGgxuAvQzOZEZjet2dVt5CSmMMLC8xpkpYCLgpilEqY
 /rYDALbXElbiuV8NHmhHZ2n4CZLhx3oTvc+lbmRbRBnOVGaGgW3dfe4xY
 kNIVB5j0KpfxBivpKN/YpS9RBbbu4PZZ3MDwUooYoY5T5pBCRXFKb5F51 Q==;
X-CSE-ConnectionGUID: c1oBbpflR/GyLMHNWMPR8g==
X-CSE-MsgGUID: MB1rgtBISF+iAlMZ7fIf4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1620997"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1620997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:38:13 -0700
X-CSE-ConnectionGUID: BSrdGZdRQ02SXdZqKCsBNw==
X-CSE-MsgGUID: 4sHu9Qr7Tu2wr7cB3zRYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4496000"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 12:38:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:38:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 12:38:12 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 12:38:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzZ15sUIlOc63qfZhkTZ0Rv4+Nw8vmFz5+ZAAZDkLgv+W7Yxrwxnu2A0uGfjGjMGumwzPHZ1nYRKO8AS1e6WPh8hFGsxRWhyBISLDqbuSnkt0AdD9bODGAt6vJBZt/7fSRwsJo/DCDoyUW7WSf5iSBTMFwI9+VjPnX8pou1QEGvhZaAoerjd2i3Vvb3fhVP4lSjvVwWWmGopxjneZKDOqRVYsjtQ5dgdK09QrBoqUph2OYhnD8P2KZCBJvyc1wXyT4T/+nswZL2mPvtgTuYcckn+y4qQ876R6aIaFrT937hyvA+JtTqLsHhU/xRXkeGoKnsje11jPG3036OfQPiN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4TCzFn4Wgs2BsaMmi6Lez940Y6WAO+8FlBPZhkHWPw=;
 b=xHo9/Ai/orp6iS7apyrLt/42xyBUH2fZYEvV6ac+SXzyrlLhqnjZvQ5yMiZeWqopBKTUcNTRKDQOlb5ZSEXUlOiub16kqWDHIe/eiHMtH4Aqb6Zuhzhad+C7ghslO6yMCHBtSHfdCX6NGO2jQjU60V9oHqy3+G2qwBCM0IHe5iUxrVA3ySs/etrzTEMlEd7bs5C6Fbp5K//8wYrOaTj5f31n7DnLsmkO1VONs6MevwGj1qkpprvOI7iqxqVp7d5XiGIvRdpECizOkk4pruTA6eFjFQYjHCH5+eChJloorU148K8Lwe0mDQjevQrK7YFQj11z79j1RoPlzxQjMgQQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 19:38:10 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 19:38:10 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] runner/executor: Build test command line
 before fork
In-Reply-To: <20261026141702.44811-2-kamil.konieczny@linux.intel.com>
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
 <20261026141702.44811-2-kamil.konieczny@linux.intel.com>
Date: Mon, 26 Oct 2026 16:38:05 -0300
Message-ID: <871p9cb6ci.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 5465b215-655b-4c42-e487-08df3398aa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261026121527099003|11063799006|4143699003|5023799004|56012099006|261022075727099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|261026140227099003|3023799007;
X-Microsoft-Antispam-Message-Info: BBdeM0xVbc1tj894H0FYWMVjNb2l77ogDioPGrLX9PFhm5wNm3cmXprEw88M/v1SgdS/BD00X7K8QSgWcH5DMZ7jzI1HG1b9A9Fh/LbAm+oMPYDdBME9erXPlLPsrgBIA9ONcRXw50my+mm/vFMmio7NJ8JDH+L4ibj1ybYA1oX5yW+XTH20i7Hf8k+YbfQ1bEiNxJvFD0B8G+5KrD8tBigfIArcZyn/vVPzccBOEju4EBgqCR9sAS/EZqfMA5gvrIRXat/lSRKh2lOq51XDCqXXajEexDxLrMWrpJ2+LFoEWEbfBotMCtKaw2aaXLPlOO418gwWYdm/hxtTS4/DLRYfpZgbquR3GCR3CIMWK2TtcvYlb5ectj8pUle7CPULqEYoCSCBo5CRprVHkICRx7TrR64kpBL56EMBaHXWcPrQzV3HPJIvxaee+XVyWCooJUn1v+BK3aWh7PijbMtQbsmYM0ZqIyhiBccAYZvtPGgQn/M0r0n7qsGWnWiXA5g12lpqjNqu/xEfUtLu5OU5RMEBIrgFiIRktNcGJgSnXCR5Cnq+6zC5VpTp4Pl0El8VLHpnF0EnYD4btsKlb1pyx/MIG7JY5oW89IxljGOXNJzbh52FpfutCvuvnkf4w4081bIPpn0ogw0XjpnQPeFwf2rgv58VBUudIkGmUrOh1e8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261026121527099003)(11063799006)(4143699003)(5023799004)(56012099006)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261026140227099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ml2eTU00+HmRCRPmyrW9oknDfPiLHRx7xlAJWDKeopWXYSx1Gz5eTZAhyAKu?=
 =?us-ascii?Q?NMlj9eXE+vi5kAa6sPdGgQYTjfv0Y1bcJWHh3pAmhh5wc3+6djl9mofDYMCt?=
 =?us-ascii?Q?PFxz6NS4p6YEcLU79qEr/Hf3CVBrT1l6WUb4sCc8lyAMexC4sYUMlJVGh0VZ?=
 =?us-ascii?Q?clgNETlYPMEqd3DkSLeV+vB09DgcDyhxxMetHfm1DZjyDXbr1cvRSexUwNsf?=
 =?us-ascii?Q?zLcIE1s6mXzkIudamFN7LmHDJ7fqj2gSgAJWJeQTs3vvVOAtRfRA0TBfKo83?=
 =?us-ascii?Q?gdXVX37Y2vc4xSXztk/Cl7PyJ0ftU5Degxpuq8Qa514Jxd7gLAVIxf32f1kt?=
 =?us-ascii?Q?ZETtq7MoAlQuIVfO4nd409tV/6cIBPRKQYR6hqQaUWPVs5L9kN+ezTrnY2VB?=
 =?us-ascii?Q?CMu0Zes9SIk/H2DsewY1/GSPQszVsRqB9lSuw3/hrrrNpSm3uOEbLmROYGZO?=
 =?us-ascii?Q?4010OfC1S7nIpXLqnaHkyWbQHh9TkCFCsZNa7ilYSZC52q3lXyiG9vpRT+jm?=
 =?us-ascii?Q?M7eCtiqApfmpued4x748/42TvHTe6gntBscJFFEh5w9Ph+/19BPYX5Zcvg68?=
 =?us-ascii?Q?ICBg341b13Ktvnu8Vo12kplcMe/+miHQiVzonJO9PPNIg+kVEESGz98+uGXD?=
 =?us-ascii?Q?CSKEjD6dJr55cLft+4dU2y89XMbon/VK8Z3WSuBLDIITAeLUAwASPfw3Sh0L?=
 =?us-ascii?Q?Dv19ZkY7ZXbMZPkR6VcTIz62EuIzZK0gotC4DTGertB3hBu0YnUqjGbf3UTt?=
 =?us-ascii?Q?62BKQGy8rEoozrD3kRmXunkJg7l9PW6zrxokWD+pBz6ljWIa+2XU+Z7nowbR?=
 =?us-ascii?Q?vDojr+FKKtuM+SG1HUF/MuDR/nr0sO6bogSdiPPl+WyRbdXuHYVg15mX4sMJ?=
 =?us-ascii?Q?7iFaFLxWx0w8kJnHbnN0iH0dYwOYglAiQFZprdHJ/FgQJWyIOW7kcSk+sSmx?=
 =?us-ascii?Q?ePFm/Tm6wYxiJguWrvhQN++Mevg5NcaAaADakTsCrbkfBAowPKwIxO/2zbQX?=
 =?us-ascii?Q?aQ8N5RI+pf4HN6/stB8QNNuVr0QA8TbglZ11HQYEeO1PJs1lAf+U6HMfe9YR?=
 =?us-ascii?Q?SNYeqXnpNC/sZ0WfHIhPCe9Yvo+gkFjt/f3IW/h2wuX9P6L/NIa6b/nEkgpj?=
 =?us-ascii?Q?KECUN09eA1FL6df5vzhCv2hkkKw5p7A1wH0lnrYGUEkoAk05C5SsO7LdtKcP?=
 =?us-ascii?Q?zJUFqjoUNwyOmmpKnjgq1LJTilDmkaHtpeb3EJf+jJrxQKTLrCVEO+Io+fig?=
 =?us-ascii?Q?QxfNFUuGBZkqbfA5860QFtXK0PX3ffWpeKaQDkiuwEyV8iQq4lrELwX2qsko?=
 =?us-ascii?Q?JHDoQkvC+5QNrAW9PPawMZPFB9vx67cySr80C0HR6BgnYvgwp11zHYmJyxYD?=
 =?us-ascii?Q?8Z7xQ/fqQ+UdAhjequ4ghkE7Chsn3dsIDSvgkTUkX/KVRV1iEW1JNiitEyeM?=
 =?us-ascii?Q?aSfF4b+jTCFAjSeNrd0s9SS2vyJQDt5dP3+S4PEyd2sHJ9/yITiMkmN/j1i5?=
 =?us-ascii?Q?NuAWZKayrJk4irzVwvoNOP0TTiou02OOR7wrRevBvSHD8bbFfuwIqCyc2PUs?=
 =?us-ascii?Q?ueYRpR967U9Zf+21EBuw3FEsxx3imYj+JMj+BzYvFNseN+lkR3/d147xVbxk?=
 =?us-ascii?Q?I1yPY5oIod7ko4E3ZKq0AzQVbjyid+UxU4uodhadpWQivNQ5Vqe8RXaNFkVl?=
 =?us-ascii?Q?Nlzi8EK5J2886U28ujrXk1eAO66xABTCrWxtBdxUFGHQZF8OTP/JgWhGEVJ7?=
 =?us-ascii?Q?nmyfBdp7Tg=3D=3D?=
X-Exchange-RoutingPolicyChecked: GH9N8tI2AEjB0aZViMrZyAch5OO72P3ZMoMThYNpzP9wHgGjjvCQ36+m1iuKwACAdkrtVeAcqXKS8ArJ6kixZVIF6PxaqJvVevoPkTnsGtTIHqAaV3M1wgqHeAk4pljq25/+GxfPM89XldydDw3fu04PgeqjejNPRmPF1Y0q7pPYIJsqyJZndoHxi4xtb2LiwKgcHlxwtaIX5DLQgBdaEP2hhpvO982t33bqsmTg8NYIrLDBgkwAGYQvoZ/C385vzPjClFfEEKvZL9qi9D07Ojn7/qXenAvrJGF1Xn+55AYjLDkbsgeyvzQkQQLVanwmaWWTK0+5iv2moLsTYvGCmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5465b215-655b-4c42-e487-08df3398aa51
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 19:38:10.0077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjgT4CC2oyN1dGo3OoNRxiCXdELoHrxb1DFROlSfkqi8CFDX5cuXBauvBJEOXJGqKQ/ZX8Nx0s1tzMG3kAJyww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> Create a separate test command line building in main runner
> process before forking, so it could be later processed for other
> purposes like reporting.
>
> v2: free cmd line before closing fd, rename label (Gustavo)
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> ---
>  runner/executor.c | 68 ++++++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 25 deletions(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index 8103c2a52..5bd95b929 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1618,28 +1618,29 @@ static int monitor_output(pid_t child,
>  	return killed;
>  }
>  
> -static void __attribute__((noreturn))
> -execute_test_process(int outfd, int errfd, int socketfd,
> -		     struct settings *settings,
> -		     struct job_list_entry *entry)
> +static void free_test_command(struct igt_vec *arg_vec)
>  {
> -	struct igt_vec arg_vec;
> -	char *arg;
> -	size_t rootlen;
> +	for (size_t i = 0; i < igt_vec_length(arg_vec); i++)
> +		free(*((char **)igt_vec_elem(arg_vec, i)));
>  
> -	dup2(outfd, STDOUT_FILENO);
> -	dup2(errfd, STDERR_FILENO);
> +	igt_vec_fini(arg_vec);
> +}
>  
> -	setpgid(0, 0);
> +static void build_test_command(struct settings *settings,
> +			       struct job_list_entry *entry,
> +			       struct igt_vec *arg_vec)
> +{
> +	size_t rootlen;
> +	char *arg;
>  
> -	igt_vec_init(&arg_vec, sizeof(char *));
> +	igt_vec_init(arg_vec, sizeof(char *));
>  
>  	rootlen = strlen(settings->test_root);
>  	arg = malloc(rootlen + strlen(entry->binary) + 2);
>  	strcpy(arg, settings->test_root);
>  	arg[rootlen] = '/';
>  	strcpy(arg + rootlen + 1, entry->binary);
> -	igt_vec_push(&arg_vec, &arg);
> +	igt_vec_push(arg_vec, &arg);
>  
>  	if (entry->subtest_count) {
>  		size_t argsize;
> @@ -1647,7 +1648,7 @@ execute_test_process(int outfd, int errfd, int socketfd,
>  		size_t i;
>  
>  		arg = strdup("--run-subtest");
> -		igt_vec_push(&arg_vec, &arg);
> +		igt_vec_push(arg_vec, &arg);
>  
>  		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
>  			argsize = dynbegin - entry->subtests[0];
> @@ -1670,35 +1671,49 @@ execute_test_process(int outfd, int errfd, int socketfd,
>  			argsize += sublen + 1;
>  		}
>  
> -		igt_vec_push(&arg_vec, &arg);
> +		igt_vec_push(arg_vec, &arg);
>  
>  		if (dynbegin) {
>  			arg = strdup("--dynamic-subtest");
> -			igt_vec_push(&arg_vec, &arg);
> +			igt_vec_push(arg_vec, &arg);
>  			arg = strdup(dynbegin + 1);
> -			igt_vec_push(&arg_vec, &arg);
> +			igt_vec_push(arg_vec, &arg);
>  		}
>  	}
>  
>  	for (size_t i = 0; i < igt_vec_length(&settings->hook_strs); i++) {
>  		arg = strdup("--hook");
> -		igt_vec_push(&arg_vec, &arg);
> +		igt_vec_push(arg_vec, &arg);
>  		arg = strdup(*((char **)igt_vec_elem(&settings->hook_strs, i)));
> -		igt_vec_push(&arg_vec, &arg);
> +		igt_vec_push(arg_vec, &arg);
>  	}
>  
>  	arg = NULL;
> -	igt_vec_push(&arg_vec, &arg);
> +	igt_vec_push(arg_vec, &arg);
> +}
> +
> +static void __attribute__((noreturn))
> +execute_test_process(int outfd, int errfd, int socketfd,
> +		     struct settings *settings,
> +		     struct job_list_entry *entry,
> +		     struct igt_vec *arg_vec)
> +{
> +	char *arg;
> +
> +	dup2(outfd, STDOUT_FILENO);
> +	dup2(errfd, STDERR_FILENO);
> +
> +	setpgid(0, 0);
>  
>  	if (socketfd >= 0) {
>  		struct runnerpacket *packet;
>  
> -		packet = runnerpacket_exec(arg_vec.elems);
> +		packet = runnerpacket_exec(arg_vec->elems);
>  		write(socketfd, packet, packet->size);
>  	}
>  
> -	arg = *((char **)igt_vec_elem(&arg_vec, 0));
> -	execv(arg, arg_vec.elems);
> +	arg = *((char **)igt_vec_elem(arg_vec, 0));
> +	execv(arg, arg_vec->elems);
>  	fprintf(stderr, "Cannot execute %s\n", arg);
>  	exit(IGT_EXIT_INVALID);
>  }
> @@ -1776,6 +1791,7 @@ static int execute_next_entry(struct execute_state *state,
>  			      bool *abort_already_written)
>  {
>  	int idirfd;
> +	struct igt_vec arg_vec;
>  	int outputs[_F_LAST];
>  	int kmsgfd;
>  	int outpipe[2] = { -1, -1 };
> @@ -1829,6 +1845,7 @@ static int execute_next_entry(struct execute_state *state,
>  		lseek(kmsgfd, 0, SEEK_END);
>  	}
>  
> +	build_test_command(settings, entry, &arg_vec);
>  
>  	if (settings->log_level >= LOG_LEVEL_NORMAL) {
>  		char buf[100];
> @@ -1860,7 +1877,7 @@ static int execute_next_entry(struct execute_state *state,
>  	if (child < 0) {
>  		errf("Failed to fork: %m\n");
>  		result = -1;
> -		goto out_kmsgfd;
> +		goto out_fork_failed;
>  	} else if (child == 0) {
>  		char envstring[16];
>  
> @@ -1880,7 +1897,7 @@ static int execute_next_entry(struct execute_state *state,
>  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
>  		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
>  
> -		execute_test_process(outfd, errfd, socketfd, settings, entry);
> +		execute_test_process(outfd, errfd, socketfd, settings, entry, &arg_vec);
>  		/* unreachable */
>  	}
>  
> @@ -1897,7 +1914,8 @@ static int execute_next_entry(struct execute_state *state,
>  				outputs, time_spent, settings,
>  				abortreason, abort_already_written);
>  
> -out_kmsgfd:
> +out_fork_failed:
> +	free_test_command(&arg_vec);
>  	close(kmsgfd);
>  out_pipe:
>  	close(outpipe[0]);
> -- 
> 2.55.0
