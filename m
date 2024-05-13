Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CDC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 17:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1AA10E8A9;
	Mon, 13 May 2024 17:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jI69zM7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFC910E8A9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715620982; x=1747156982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ODA7PQTiPWkK0lqWILCbMPnX0IZR/Ji/HHNYnLECyXs=;
 b=jI69zM7pjJHa+YVMyJZ2HpyG2sXgfurceKL/9JyU3Sb6rVvnDjeZNa7P
 Bwpb+OfD1o7/9i9Z1pD2wFCdyUxUUx02ximYUZSihhRmds22BEpSIKjN9
 uDV+t2j6lhd1M/I9FHGwKVUUmx2HZm3Uhr6PD9uKD/v1wCY3UbMNWT148
 m04BI6FRbIQ9QPQTZ4qd5QKGE/OJh5Do+fZLLz7yJzN3SuesUOF3TyWDC
 oB37sAdT9KJNX+70qgI3QdWdD5aIvpZBRuJd3W0BI6JfWEoG94n71f9s0
 mBo7Hj75mI0NuHyQqpM06oEaikwRs9JDuGstRynfur2mP7jCxLoIaTE7I Q==;
X-CSE-ConnectionGUID: fLpRZLZJQNuycpg2He9a1A==
X-CSE-MsgGUID: PxuQhPBGRvil/ElhOOkQpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11401112"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11401112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 10:23:01 -0700
X-CSE-ConnectionGUID: 3MFsfMFYTG+rZQg+4m9nWg==
X-CSE-MsgGUID: kbkzA/ZVQc2UPPHnozP6LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30445212"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 10:22:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:22:48 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 10:22:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 10:22:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 10:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4FodCsviw6rKaEuRrv7+rgRQzNlF2WcuWWPve3zsBJqO4uzv+7ggS9Ymp6jWKx8LtaYxUPSh5MyZ61Ic8R1Ex75wPGUOlHGc8Qixx3tJWTB4G7IIlNRTVNuqM1mgQgEHuK4/NuvTKefoelioMCk70CmVrYs/ccim+lTF7/9zwlmJdaEBL0m0p+sxtAv2DRY2KPFK/KJxxOsjIm+Bbz03Zg48ij67dekVM36DlIIq+eEfXr9/DC09Iuf9M9ibR6mCvZmcxOWm9q5V+0e1f7cpWzkvZKwOkz4M9RBsVnSVsCK1AQc7SrCMbrTrR5gH9UsYmU9D2n9dMBAXfGMDvT0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWfEIHOxtAa0tHhdCbxahbx6AjNN57W8H9IPei+2ubQ=;
 b=EHVJsB4vPfjDRuEvLwRejTVU4eTl8bnuw6vIRm1524zLD9YCmqcdPFxvqB6Y886A8/b8VSfRsGpmowgSjN5VeLC5NSA5hO0wv5lbb/SdkQ+2pikUQ375OypY80h5uyWQsKlgTSeWWrtcYr6Lyn5nHwLJQ1O4X7YEKC6ej0hDAmXbZlkUBTBgVUmoTT/tsISziIMWmNa/BqPzdn25eR9+VhCZgXzQ56LA+sAQdbPdEmGi6YWQyT2nikkBeWAD4O+NR5nirUq03fFCy3SOVwx8W/V2z2QRzPdNFOQi0JV58SrDmjiNpzNI90A48BLaDoLQz5Y83EChbocQWeQxLcCJsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 17:22:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 17:22:46 +0000
Date: Mon, 13 May 2024 13:22:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: Fix S4 testing
Message-ID: <ZkJMYRB8asukxrbK@intel.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
 <20240513162435.952578-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513162435.952578-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:303:83::31) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f02dc52-b460-42da-d142-08dc73714e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?57qAsjWhvth2SlET6zLOLdVM5G4id298IOiPX6Ts0GZC33c6P2nii99CG1M6?=
 =?us-ascii?Q?WrHkxRyYWv9gOl5ccfzlxUuVf/beyuQy6Ja5ofJPJ50Hd0bF5Sdh9atJM8WH?=
 =?us-ascii?Q?UeulkiwCG5Jw+vwoGZ9QQgtzC6z9yDbaXvxQuyEAEqgHALnkIO/3hUNG3Bn+?=
 =?us-ascii?Q?OaCPABzbKOhZOMEFLxC9q5ab8NpZ1n5iZrtDuvtMTh1nXasNhF9fjA2bxyWN?=
 =?us-ascii?Q?zJMShyqFzn2WofzCduPHVHjJ1TZFSeQBlqlvb7YlBHe6vr4G9rxwr9SCc57/?=
 =?us-ascii?Q?V9XdnLxAi+C6SCNntjxQ8BuLYy0u4Pq2KsxCg2sWVtW1EBYmn1MXfMFAFYLb?=
 =?us-ascii?Q?E9g2QGs/HvB4lSIIx4XMSlLNgTF2wGCojo8FYnYwPRNSh2Cz7vzTBIaY2gzD?=
 =?us-ascii?Q?uCS2Qy5SCAqwAF4sToyTKu0EzbO8D4YtYAPtrXLkkXOYZPqDHWgs0J8a2HnK?=
 =?us-ascii?Q?EGBIYhLhNRAqm+OVjRuA0g7cu256OpR9HS0fi8+hxOWZypKh9SnTz389ubBR?=
 =?us-ascii?Q?iUkn8nnSGoq6vnd40Nycqx9OjzDsvldDaJZU+LrF94lYcCCn8rjQdyoNq7Pz?=
 =?us-ascii?Q?tLbpQ1YKfhSGi15z/DtfenU5a6+TEeMeLoU1VDjvpoUJLhq/6qAoU5LroN6Z?=
 =?us-ascii?Q?FK0kD5s4mOsZG8bZ30u3u1sawAH0AypICUgQbQBlhjjH1dbX0P9olVaHmA3b?=
 =?us-ascii?Q?tsuVFqtCMBrR1Z/QnAi0i70YWUw65ueK/4UB9r4oOjApndVCeZKrN8s/dVLQ?=
 =?us-ascii?Q?ARXfQFrQCK4Hup+61NI65nkRPJHeAPLhukBgGhj3m5bzSWzs+YqWLVZ+Tydh?=
 =?us-ascii?Q?plhYlqIVNQwMZG5tJUZLT6C9OwwOvWjSb4TS+3TotWFbZv2qODsvEb7yb/M6?=
 =?us-ascii?Q?P9HSryWNut2QIL7N1Rn9pjVz2Gg45hnGH5IMFrs2RgD/UNzL5icU8FTX1U7S?=
 =?us-ascii?Q?TLMhn7dkBOpZ2NB5zMVilyvTSu22KFKd5SLi9v0XZXJAXD3RXmP8YT2PQvr9?=
 =?us-ascii?Q?WLnh1zwqqQDoB6C9eeFXcac6b1mc/oASNwDC99h71b21ATWicsGZuybUDR8S?=
 =?us-ascii?Q?y1IzezxfPzoMi3V8skCzGnEyuPUYzJuEj2Jncc99Oxdr1OrP8A/NS9jLHI33?=
 =?us-ascii?Q?yA8MBnIb3nQp/ask9NTC/4H0QF7rPaZLssSdcpkOuys3BwS7UXGBa65dWQ/n?=
 =?us-ascii?Q?8fBddR8K8n6ALmUn0nSNsan4RYjfklNrlqSqXoq1tZm6bEmG4nnCz5sC0Tjk?=
 =?us-ascii?Q?/IU0EnPEKtXJ3fl8XVgNdiMz4a91ITpT407omTgwrQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IWcsAjxV+4JYwxBCcVtB/lZj1L9IQZ5RxeYbfLmHJGzVdSQBJAX0wHcumVmv?=
 =?us-ascii?Q?83QvL+XwhRS7a81QtqNlZRQ2ghLXPWyIRrSBCl+zKZ1SXTl9cexJPM3LUn/2?=
 =?us-ascii?Q?YwEEI1yskFUcm0/6CDBDbhCYD3K5ZQPt9KpE+7eA38y96StgCR+7jesX0GzE?=
 =?us-ascii?Q?hp6ImH33pGnh0QODyu7sGdKJr/gwlg21iKIbrBgAFpp51cfUyXYqikjAFIMR?=
 =?us-ascii?Q?sE+Doo9pZEu0EK9ke6m1h49gXEf8mwxDck6s3jOK2urayOivKYqbivNDhhsA?=
 =?us-ascii?Q?z1o0t1gwuHXAkjlvyx0wjhURaWLaS1AsIm5X3ugTlh9939qpacyMm/KgyCvC?=
 =?us-ascii?Q?ACJ0zjuv5+rgCrfGSykHnieT0qX6S0s9+L4+HZdL2UbJHCQe3i6c/L/9dy7e?=
 =?us-ascii?Q?FEGhAHeLdzc9StLQfZnkfjFnkWeUgFns/rj+sfxtvF+cQiqCshhfEpor08ZI?=
 =?us-ascii?Q?WTt6CdsvX1S7FBM1TBf6ltbm5E8R9wQ40rZq3hSDVqFvewaGb6yRcvPNGRHF?=
 =?us-ascii?Q?iyoq6ZcnbkUJZLTbt4wkRaSEJvQiG6aQcPVI6UsVGN8U7LBm5j8Ojoc5a+u8?=
 =?us-ascii?Q?6SctPXGJJFijP77NHhZreBX8BkYT0yGtQd6RsG+kdYAOIy94jf+WTNarUCjC?=
 =?us-ascii?Q?Bs5gBOTBSg4KZyRMQM+pWMCNoOpgomBxoNE02yg4laP1ZUMQxYxjNszzKE1x?=
 =?us-ascii?Q?Cf6WZ2NA7XMKBiBOP2WZLmgyjQuHfPXeKeLpAujJskr1IN2k/IrDIxAAIiQt?=
 =?us-ascii?Q?zjpVVZqdpBe4dO8nijNYAYyrCBgWURWsB/7rpTu/zCQW+1zTNnE/qfgEhjZR?=
 =?us-ascii?Q?mCpsq2S4HyNIguzedGawN4Z1RsTVIIJzsVVw3yuhlKi2a4BO7240P1YAM8fY?=
 =?us-ascii?Q?/MSISa//yB02Vj96yN1Bx2AYXyTdrtfYD5Z89bzlspcOvvnprsmC6Ti29Jb+?=
 =?us-ascii?Q?9ECDEFzirTsjhMTKrsWNOLv1zEEGY1UK983pKtLnWPdlcXBDN+dIb57NZn6G?=
 =?us-ascii?Q?h/W1dG7AIWhUHbWTL+P/CH++yNKB0Ayz9N8LADAxx6iQJD18UvlFRV8YsCgm?=
 =?us-ascii?Q?4tj6kcvqCHrGFIQWu/cZhn+8bIZ20aJpG07kx3dMOCzdZAv268h1lspzXOhf?=
 =?us-ascii?Q?wLjqVKsYndYnSS5Qzh344bMYPfXBIaiKCkEOZKNgrAsypAgGYlNNeqXZdtIm?=
 =?us-ascii?Q?RW48DJJ9d/umwfKymtje6hmjDNeRr2kK8ZCH7FJeB7+b5xmFjj05k8YENvMu?=
 =?us-ascii?Q?7Y7ALpsbu1Iirpfd8pdEPXC9JRtHQQzKZS1yQ5BieCUSX3nUEYsz/NtQwq1r?=
 =?us-ascii?Q?BsEOjHVYvhsSf3o5ozIReZ1plnQa5N9V5XijfBTkrjqC9huTI7XuYteU3OaO?=
 =?us-ascii?Q?0X8v/VofNTIyR9ufLUd7U99qGhuWJoRze7Qle1UVoexfAR/58w3JDuFM7s0T?=
 =?us-ascii?Q?hcPfdbgQvYBYFPmJg4avf2KdF2Jhxe7iuxh5Iz7ArR6xQSgYu0Mx+1hRgckI?=
 =?us-ascii?Q?fDKdGEcG8GQeDfW6wDYufC93zvZVJ9UG88kmvSBaTPoUes8aCwekxIb/WzRy?=
 =?us-ascii?Q?l90OJpioZw4AbVOjwn6Jg/Z2FFWdnIhlnGOIkPIl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f02dc52-b460-42da-d142-08dc73714e09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 17:22:45.9872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXjguDrDUtEZXn9RNWE87yl1mZYtaPEjZ4CUUaD4aC8V679Xr6ZNS1znTGTg7cvNytKfjkNKm6jvMtQJ+vKCcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
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

On Mon, May 13, 2024 at 09:24:34AM -0700, Lucas De Marchi wrote:
> The additional s4-mocs implementation crossed with the change of how S4
> is tested in commit 4b767566bbc6 ("tests/intel/xe_pm: S4 to go up to
> devices only").  Apply the same logic as in other tests.
> 
> Fixes: 1a77ac56d453 ("tests/intel/xe_pm: Add mocs S2-idle/S3/S4 suspend resume test")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 584cb8548..3cbdb6a96 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -655,7 +655,10 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
>  			close(fw_handle);
>  			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
>  		} else {
> -			igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
> +			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> +				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +
> +			igt_system_suspend_autoresume(s_state, test);
>  		}
>  		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>  		igt_debugfs_dump(device.fd_xe, path);
> -- 
> 2.43.0
> 
