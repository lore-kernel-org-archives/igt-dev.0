Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D9CCF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 18:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B0110E44B;
	Mon, 23 Sep 2024 18:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ieqd94G5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2500410E44B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 18:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727115003; x=1758651003;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VggQo1yOI6FmTdweQzz6YowSTCqM1rCKX4iI0FSFxEg=;
 b=Ieqd94G54sc3CAKmx5xSnuOH/kjsf4wvSvxmyZtVtI7Butlzw4RNI1C7
 FzJftAd9BM+1NjWfDmS0tU1ySHqvXlWCJltdZel8kQVLOT9qvC+S7yWvK
 we2SS0uKuFJcj9hUXAbD/ZJkqElHrMoZqZN7pbLT1Lb9F7DMKTlTaL4Ng
 6zeVQhjkR6i4HUxHvk5jIoIlmU51etFi0c6TtUe/fRM83Kk04MEfKCYT2
 s4uHn6x/4syyAYGD49rcMTQDDu1uUSS2fGA3Ck/aK2WsuVQuDjqREJAyp
 RI2VH1adQSTvpWkIFt61Tm308vafcD5R8D+ccyAWhsNGTAjGE/7rEvdAt A==;
X-CSE-ConnectionGUID: DAM1b6QxTyKGGtWczl9ibQ==
X-CSE-MsgGUID: 9CPPic6BTnO+8/XvyvOK3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="13709815"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="13709815"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 11:10:03 -0700
X-CSE-ConnectionGUID: MbuM2F6AQkCig0pGEnaBpQ==
X-CSE-MsgGUID: tCH+1JzsQyCcJvAgNVCyzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="75915664"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 11:10:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 11:10:01 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 11:10:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 11:10:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 11:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxrYMQzK9WVzTuBCA3UeezMS9n9qezIFAcnrfBpD+BeYbJBlUOCb6LrC/nf7pmlDKb+bMsLfWCqoKADNQiw3UmRrWHiPLJV6xsoJSwWeWVLtmE4sRIevas3WtG8JlvatDF/bFZ5O3Msy/2i4qXaYy19L2SPN3uD6yxfL8K7+iQz6WB8Rxobc/u2qTrrqsg4mpNwHc5ITpw1xlgeoPdwQ28BF6xtGnQHA2eu6DgqR+BJDkpnmNhncOe9mJT4CmLmqew6C0afWVfjpe+f2OpDlt8H8bu80urfmZgjTqBvOsQ1Mh5raO5we2wStKzyFBMO3tv/q/mZzUfr74rVjwlPSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCYbnEh8faqWNJDW/sGtl5BR98k+hKWr/0EiD/6Y9os=;
 b=id0L4fzKj3dlWDeoe4rpVj/6zOHUN8nkE76DB4+36qk7PEFLpy0QVjGfd5nq/TpZt6wR+QjxLpofjOi+Wrrz5iQk9ZUeWyYjeyL7TBaWebmEWbX/FqKaFp3VVnA5wGX27HCu8xMBEpbp/1uM/8+zA9+oQa9aiiNQmM9bGgA7GDp19DeCX0aINXSt4k5kAvIoNvJXcX8BAUw6fMpbwhjy70YP2/eaYf3OtwKljGOBe9zT5bFMcJEcKWNVNk8dzbQKAU1W3sNjbi0NzO9f9ZKAAeZm8FCw35G8dyyrEJYpMKth1jRNwFp0BTeLekv89+YUTa2tdNH4Ue0Eh10B4d4LNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 18:09:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 18:09:57 +0000
Date: Mon, 23 Sep 2024 14:09:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Add new test for
 fault injection
Message-ID: <ZvGu8qdBeuP6XeUk@intel.com>
References: <20240920131913.3368381-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240920131913.3368381-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0167.namprd04.prod.outlook.com
 (2603:10b6:303:85::22) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: ba76618a-4900-4708-5c56-08dcdbfaeee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?un3uYNveV2FA0JC6l5EB1T3fRWGXzTj37IU+2Ol5/FjhWg1+2aCD9CZR35?=
 =?iso-8859-1?Q?iAwRLy75h0CI7/FqUDJovfIE6QDWXxSrqAAFFyyY/vgg8ZXdhJSWfCvEfD?=
 =?iso-8859-1?Q?ZdQddciuS/VpgN1fFjGPYPw496r938+AKcHiIQDAEz35HsdzZVyiGGo654?=
 =?iso-8859-1?Q?Q8XNTyEbwiCFoh86JmaQ/r9X2hMd+zb3Vl4eNv2/ACLL/jxApz+ru4kgfi?=
 =?iso-8859-1?Q?AZ0Ihpc57wpyt6anFrW9rUfd+P3qhHHIgbHUpywztmLtyLbvmgyCTLP4hn?=
 =?iso-8859-1?Q?plFyngqX3Jfb5nxYehAIGulX4Tu2GhlLcnr4gSC4Pknqi2u0kVA9Eq7TYM?=
 =?iso-8859-1?Q?/6C6CAXG80nkDtsH02TuZi5/NyKHVuju0CWX6YIbD2A4V9SbNpr1WA4CtO?=
 =?iso-8859-1?Q?5+HrKXl8kC2pmAJoTKPnuQYeQDyfGZaYoGqFH/Mn5VS9QAW2OMn+stc1QG?=
 =?iso-8859-1?Q?zayl5DkSsFL08kwcmZOmq/A0OMbBBs0aWrR3zd2x8yjUy797O8k/aBxc1w?=
 =?iso-8859-1?Q?gvt69LuJzTAzibEaMXWXLWj7n958P+eStOl0nS5mWaSiwhLpdD7pa8MTuF?=
 =?iso-8859-1?Q?2HiDt4q+exC0rUBRSomwr7aPcDArvj+/C9jArIZGi4Z0FWDL4vC1cKxxrF?=
 =?iso-8859-1?Q?PBASCLDVl0EjJh1DM4ZSvsClvr45pFJziL9q08g6bagv8MmCJoajZxGkUq?=
 =?iso-8859-1?Q?xmUWQLvVcvWS7JaWkdS3EAZ5j12C6v3bypLrjFQy+l541+A6U98O3peMtq?=
 =?iso-8859-1?Q?gPMfQGpsnOKL+yTUV8uke16ohz5FgVoccMUzmJlDLbEtuDDMYralsqdkhx?=
 =?iso-8859-1?Q?jsUD7tjENIz78Ju1eR4PwQsI03T8mPDYcAkGBm3LbHhcAB//30FtEHdG4f?=
 =?iso-8859-1?Q?YpyHYqgLHHDGJ2cg03Gn5EYV+Dzf5BZgXtO3zTt9xrcmZ5ZD35bWxwpd+T?=
 =?iso-8859-1?Q?AqhBxKrUJ6n6AbyNT7wj/ryJ+z3kOO8FQfGxogLtJoavj2imbvKTVm6l3N?=
 =?iso-8859-1?Q?y1PQ9HH1CMy6Xz4dSldK4+TH0KtHdEYPiBqa/msriUrcYHmos7xQB206Nd?=
 =?iso-8859-1?Q?+iAPktV8DjoznEO2lDvIITnuuTYHYkCCkz5xMmhVzzdVgxIoqLPURMmuD7?=
 =?iso-8859-1?Q?8/C4lT4/aTq78oDInZDBcbfnHvDauA4hDK8C57OfGT9f+3s6Jur6rBUfrJ?=
 =?iso-8859-1?Q?hN0o3LVjZRpUUnOHdXfwVRGuCedHeztK/IhLpCADIdWF6bgByKPdtHs6dG?=
 =?iso-8859-1?Q?xnaWebE1DUxLxi+UhBA5DuXqsvtxIVqc8LVoXFeUMLVOjlqWr/pWD5KyPk?=
 =?iso-8859-1?Q?FkyDJWIIh8dri6+VrT2c3yC095TR2kl6YGePgY8ux2fF/XeMxUjsl4YxIA?=
 =?iso-8859-1?Q?WKgWikfCaOycUQmagf/bZkW3WjeuphhzqqzNZWqBTJG4ysniXnEVs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cQuVSaNsFJoTO2DMvqRfQ1ZT3rpQVvW+U7I1fUrxGPJIAz4p1mawI1ZPsU?=
 =?iso-8859-1?Q?zVbkSvyGSdcA2PMjLfKZCnUuX+CKBXf+msMeAFeCCvlHM+rf+Ve3MUNSbV?=
 =?iso-8859-1?Q?2ZlstAGA4NTBeym5JV2E6eUE9O8JG85pirLP+SKNjqYvDr3F69d3+ieGLg?=
 =?iso-8859-1?Q?C28RIcoqGslQhBkD37kffszHT65V9PJ/FFeEgcrASqx7fZBh05+eumMtVp?=
 =?iso-8859-1?Q?kCoa7F1bP8+ntjffvGZ9BtL51aSMsQDa3QfFJQImPY85++rfIC28q76DkP?=
 =?iso-8859-1?Q?ZlBbll0HldZJmXk5b0v++NWdXrd1/2WqwQDT4pDd+y4S8qZkHWDEsY8eJx?=
 =?iso-8859-1?Q?xsUyUk2iUL0gLLukys3MqmLZNTL1vjsz88/RVPmnHwDvkmG1W55J3F+Jpq?=
 =?iso-8859-1?Q?cQVIXhoxfG7Hhkc21YAjFibc1LrjkFMhXgocpp+1Lfy3zClX7nKIoNxfnT?=
 =?iso-8859-1?Q?qOSl1Ayt02U0P33saotCvD9qAm+IEnoZNLtINdKP+2pNXFkHCUk0CkbNXv?=
 =?iso-8859-1?Q?vkQaagwW8DeOK1BYiR2+LmcklluciCHKd5qGIggNLIs3uIDUflItDeYRkS?=
 =?iso-8859-1?Q?qzs2E+TU5HZJMwg+NNxZvtgm8xP9ZfGLwGZGR/VQk3CN89pqlj/xsPJfTI?=
 =?iso-8859-1?Q?gY/XuYEpfOGYuFhQYf/gC7NOglo3CcbdssJGo9U5pm8v14Ut5lS9DpNRuZ?=
 =?iso-8859-1?Q?FfqjS1nMh6sjVUwShiL5rTgxcdQFPvorstDPAwuhhZIYfrDWVPJtM5VkAe?=
 =?iso-8859-1?Q?4g4Xx/SCH01Rcec4gnjiO6t+l7rvHM9j3HSNOu9PwCMmrRWpB9TTm3okAv?=
 =?iso-8859-1?Q?uAtxlgEXpbgPYu4BPfCOwanm4QQkSG1SQhCbxPGxp4fTGUNNFueJR6Uu3Q?=
 =?iso-8859-1?Q?sH2FLY7JsC0VCPomFJwjf4pIlvsFRgxKoZObjsTbtHI05CNYz8FoXyts2g?=
 =?iso-8859-1?Q?s5qjRHhOwPVUEZ2mOuA40xhT0P6VqWyFRJv9naw8VxMiPBq+irKTh5LITt?=
 =?iso-8859-1?Q?NlM2ktnnSK4Mfs045NaTIJM+seTVGSn5j6aIo8rud8Mw8kj1XMkHo2VOiN?=
 =?iso-8859-1?Q?DqaXuHbRFQ6wD7uUqCegCKkfYLkz4io78pM2G1umm1CcspmIBqq77RHBjE?=
 =?iso-8859-1?Q?704ePTxbwk7LQ10MzTv7KzjMnInzd8JJsqkYpfCR7xTj2dJQTeSNx/+XOh?=
 =?iso-8859-1?Q?T3RkZ1tLVlyDKSG1dXNjrTv6KXCAokr1UBz81HUA8d5BhOS5X04Qul/xuF?=
 =?iso-8859-1?Q?ph8+BtrkaMsgAl6sBsLqwOs1eYDvvXTzUn2cwGy8H09wZvQgad/MlTJKBY?=
 =?iso-8859-1?Q?hthmsFQ05L3IF/gFzQhAfBwJs6B4BNNWbS21dXczEIUHLMSukZWoRFlnJI?=
 =?iso-8859-1?Q?JYZjeo2RRhQvE8dA6RxuOkCMD9mB7qM55xjEmfmeb9tPcTcDH9LGgg1sIy?=
 =?iso-8859-1?Q?BstUMgdSE9SX568+NiVGvEb/X1jFTY10YnGkj3nsv9h02jLDLNl4AXjroZ?=
 =?iso-8859-1?Q?wqCEMCOEtOith05c7W1u95ZydvyxjIc56pUJulaOkIJNaiGd5guJqCtEWu?=
 =?iso-8859-1?Q?qPg1ImJcEvaUSGU9P6hmmPSm1PCsbNMuwkrYccWyQuiU9nq1MG7y98wNQs?=
 =?iso-8859-1?Q?9CkNlBMUwtCTYX+i/jVSvdOrEsFwQwMdyFx3l0PcT7+14rCXHrESDqNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba76618a-4900-4708-5c56-08dcdbfaeee7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 18:09:57.8291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD4wQmQ5hiws1YQd+dA3Fh68gv0c0sJEmlOA7T2OszZCDR3J/V0wGU8nFXj8ZIk1mxh9fcr075jAipO/nnKU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
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

On Fri, Sep 20, 2024 at 03:19:13PM +0200, Francois Dugast wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at probe time.
> 
> Add the following test:
>     * "function-fault-injection"
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 229 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 230 insertions(+)
>  create mode 100644 tests/intel/xe_fault_injection.c
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> new file mode 100644
> index 000000000..86fb6029d
> --- /dev/null
> +++ b/tests/intel/xe_fault_injection.c

perhaps we should name this xe_probe_faults.c ?

> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check fault injection
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: driver
> + * Test category: fault injection
> + */
> +
> +#include <regex.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +#define MAX_LINE_SIZE			1024
> +#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
> +#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
> +#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
> +#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
> +#define INJECT_ERRNO			-ENOMEM
> +
> +enum sysfs_action {
> +	SYSFS_BIND,
> +	SYSFS_UNBIND,
> +};
> +
> +enum injection_list_action {
> +	INJECTION_LIST_ADD,
> +	INJECTION_LIST_REMOVE,
> +};
> +
> +/*
> + * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
> + */
> +static bool function_error_injection_enabled(void)
> +{
> +	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
> +
> +	if (file) {
> +		fclose(file);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int sysfs_do(enum sysfs_action action, const char pci_slot[])
> +{
> +	int sysfs;
> +	int ret;
> +
> +	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> +	igt_assert(sysfs);
> +
> +	switch(action) {
> +	case SYSFS_BIND:
> +		ret = igt_sysfs_set(sysfs, "bind", pci_slot);
> +		break;
> +	case SYSFS_UNBIND:
> +		ret = igt_sysfs_set(sysfs, "unbind", pci_slot);
> +		break;

cool and clean fn, but we should probably add it to a library place.
And then reused in common places like xe_wedge...

> +	default:
> +		igt_assert(!"missing");
> +	}
> +
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +static void injection_list_do(enum injection_list_action action, char function_name[])
> +{
> +	FILE *file_inject;
> +
> +	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
> +	igt_assert(file_inject);
> +
> +	switch(action) {
> +	case INJECTION_LIST_ADD:
> +		fprintf(file_inject, "%s", function_name);
> +		break;
> +	case INJECTION_LIST_REMOVE:
> +		fprintf(file_inject, "!%s", function_name);
> +		break;
> +	default:
> +		igt_assert(!"missing");
> +	}
> +
> +	fclose(file_inject);
> +}
> +
> +/*
> + * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
> + */
> +static void setup_injection_fault(void)
> +{
> +	FILE *file;
> +
> +	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
> +	igt_assert(file);
> +	fprintf(file, "N");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
> +	igt_assert(file);
> +	fprintf(file, "100");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
> +	igt_assert(file);
> +	fprintf(file, "0");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/times", "w");
> +	igt_assert(file);
> +	fprintf(file, "-1");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/space", "w");
> +	igt_assert(file);
> +	fprintf(file, "0");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
> +	igt_assert(file);
> +	fprintf(file, "1");
> +	fclose(file);
> +}
> +
> +static void cleanup_injection_fault(void)
> +{
> +	FILE *file;
> +
> +	file = fopen(PATH_FUNCTIONS_INJECT, "w");
> +	igt_assert(file);
> +	fprintf(file, "\n");
> +	fclose(file);
> +}
> +
> +static void set_retval(char function_name[], long long retval)
> +{
> +	FILE *file_retval;
> +	char file_path[MAX_LINE_SIZE];
> +
> +	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
> +
> +	file_retval = fopen(file_path, "w");
> +	igt_assert(file_retval);
> +
> +	fprintf(file_retval, "%#016llx", retval);
> +	fclose(file_retval);
> +}
> +
> +static void inject_fault_try_bind(char pci_slot[], char function_name[])
> +{
> +	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> +		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> +
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	sysfs_do(SYSFS_BIND, pci_slot);
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +}
> +
> +/**
> + * SUBTEST: function-fault-injection-during-probe
> + * Description: inject an error in each injectable function then reprobe driver
> + */
> +static void
> +function_fault_injection_during_probe(void)
> +{
> +	FILE *file_injectable;
> +	char line[MAX_LINE_SIZE];
> +	char function_name[MAX_LINE_SIZE];
> +	regex_t regex;
> +	regmatch_t pmatch[2];
> +	char pci_slot[MAX_LINE_SIZE];
> +	int fd;
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +	drm_close_driver(fd);
> +
> +	igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
> +
> +	file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
> +	igt_assert(file_injectable);
> +
> +	sysfs_do(SYSFS_UNBIND, pci_slot);
> +
> +	/*
> +	 * Iterate over each error injectable function of the xe module
> +	 */
> +	while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
> +		if (regexec(&regex, line, 2, pmatch, 0) == 0) {
> +			strcpy(function_name, line);
> +			function_name[pmatch[1].rm_eo - 1] = '\0';
> +			inject_fault_try_bind(pci_slot, function_name);
> +		}

hmmm... will this really work 100% of the cases? what about reset and
wedged cases? will they get listed and attempt the rebind?

But well, the good part of this is that any kernel addition doesn't
require a change in igt...  then perhaps the name of this test case
file is right indeed...

> +	}
> +
> +	fclose(file_injectable);
> +	regfree(&regex);
> +}
> +
> +igt_main
> +{
> +	igt_fixture {
> +		igt_require(function_error_injection_enabled());
> +		setup_injection_fault();
> +	}
> +
> +	igt_subtest("function-fault-injection") {
> +		function_fault_injection_during_probe();
> +	}
> +
> +	igt_fixture {
> +		cleanup_injection_fault();
> +		igt_xe_driver_unload();
> +		igt_xe_driver_load(NULL);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 00556c9d6..cf0d4486e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -293,6 +293,7 @@ intel_xe_progs = [
>  	'xe_exec_store',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
> +	'xe_fault_injection',
>  	'xe_gpgpu_fill',
>  	'xe_gt_freq',
>  	'xe_huc_copy',
> -- 
> 2.43.0
> 
