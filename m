Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0688CCDD1CE
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 17:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A144E10E1C9;
	Fri, 27 Sep 2024 17:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxVxmwny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACFD10E1C9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727458391; x=1758994391;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/ANUqjL1Y+rg+ZtIDvT3SACq3NAlNUg38RjMT9UFOoA=;
 b=GxVxmwnyGK5PWLBLxbp9uhuzlC6E7iKQ0T44vSeDNVcCNOGjSQ0Evpnj
 6Vq+eJN3gC3jTKVma9koQt61sRooy1is0GF8qCd2LeTw2c72beCx69Yys
 RIQz1LAO+GC1/2B1vmAuNNQgUXYhLimNau2LwS/SKr9VHMuluLIw8zwaL
 UkaTMQmP+rMaFI9Aj8fyWOnD7hWFBL1vrwRPh6ur7G9i9zVHIMwLZVPL4
 yUeWU2lW08z6/OygyHc0U1jNHwNFJBzCF8OC5jvS2xefgpF64hLMfm9OM
 2qMirPhue3UAFBq57P++L3C9O+m6FK6wUvLjlFcOhS4K/SO2/luxgkHpf Q==;
X-CSE-ConnectionGUID: H3t+sMReQqiulPU27dqZQg==
X-CSE-MsgGUID: E0dTbJ0LQxCB63KWN98FCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37193860"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="37193860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 10:33:11 -0700
X-CSE-ConnectionGUID: zQc8VoqRSPaYSOTvZyLABg==
X-CSE-MsgGUID: 5HawJfJRTJ+Z4Rb2Yaj8pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="103409521"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 10:31:40 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:31:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:31:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:31:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 10:31:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 10:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy3qht62WxVVgC2BcaE7Dvm4YIOxyUh+QEe73NrjXoNyPdNateNJuz2tS3+A1AU3AhKOvvoVC1eb6kMeT8Hobb9+MBGrop96Qsu9eBj/8ZgtJ1U9l5c86TXKgftRZSow/aBCmTLcD29Kxf0NQCa7jpVZ4bin1gwzOhWPEVZ6uPV6rKYsTdpUFWLa6wzjt3JKzHuV1niYnQCrBsGV9uD/Y+IpKLqxZBeS4H+iyBcgbBWmcp0mossXLKn5Vba03NdLKoOZHoORW+C53RFsrMfdoOrDXE57IYkruXzKMcUpwWipaedXp5CoufBQJfBMoHrxMJcT1xLGqmpsDCc5cwSmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDrh4y0BqbWO1WrNHulD3Ry2cpCVbH0bJF91dTnccoI=;
 b=y1OSN5a8G5KW4k+FkQIlDT5RV/GVa9slpFd6q5KMOm2HdrZisOe4gF5ZJ1B4Q045cZ/4QBNP8tCTSFDYvYiE5ekvIdP6pGtxSQADgIfevhy1fOT9Zyx1OXbxGKPPi0ZUNkqQuj4ISFS6GlAfQ3n/wKNMWSqHiEmvKn7ilN6tf0yxPgfXq/0XFXV5ynB+MYBIoL+T9JWiWKSxo5emE8QT1ga7/VnmfsvP8VRP9ZMvi9L+XqWE1oqkVBLtRqgpK0CpPFdr69uSDMqqdDNIMNjCmSOKiS/uXqjjf8q5xXSGgA5Ly5pSiyQwFBFVZcMzTvwP+gbt+HXs9OU4APrVSmnO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 17:31:34 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d%6]) with mapi id 15.20.7982.016; Fri, 27 Sep 2024
 17:31:34 +0000
Date: Fri, 27 Sep 2024 13:31:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t PATCH V2] tests/intel/xe_pm: one suspend/resume cycle for
 all xe engines
Message-ID: <Zvbr84hnp1dBnfGg@intel.com>
References: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
 <573a9807-9687-4918-a234-e22dde568bbf@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <573a9807-9687-4918-a234-e22dde568bbf@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b834038-5d53-42fa-70fc-08dcdf1a3b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dH0rgiK2XkDdLeBkhUWrSKoic1EBkTMELgIKA31ltNvZ5f+L6uAncnXpogGJ?=
 =?us-ascii?Q?TqzLNCAKUUQFRbfwY6pwo4OslRy6zQG3KC6vP9KDmIlSA52z7uHrzLCI9h/C?=
 =?us-ascii?Q?RtFlsbZ6VZumthpD8gJFwPRS21zbYdqU+cHEMepabrhZ9oItOtNt64lDlUEY?=
 =?us-ascii?Q?629FxTkGIrgKgbkUJJB1ov4hLYteWzQvaimTcymj1pA5HJBGIlAuBXW5EtXI?=
 =?us-ascii?Q?sA1RGuGjecYeHdb5mdQmqDTS45lh4L1AS0UoKBTfXgUUIibUo4yStE3NemcF?=
 =?us-ascii?Q?ovAxybKyfmfIfOeYil04dE6mLexu7IPH7nNXPS0U5UgUXdVI3wqwfKtDRrFm?=
 =?us-ascii?Q?rJoOAKb2XR6L0HcCbOBnmEQ6t85NR1tFV1lG+wRqwR0CAbU4Kb+lBLGGO0Rx?=
 =?us-ascii?Q?MjLJXITxxyUuKh45IxbdOWZw0n69mbFtCnH64XYPiJuEJeYzDPdX8TdQLd3W?=
 =?us-ascii?Q?sTpRPCDxp2YZ+sm2164xeDg7LBDfFOWFpkfewVElcS9ud/GHr3gCIA5tbvki?=
 =?us-ascii?Q?k1tbZTza1m1E9FAPSpL7krsgKSh5+sFagiN1qtNrRlG+mGuQdvlX15lDCDlq?=
 =?us-ascii?Q?JWbgzyUHHSBda5Wug4AEzx2j2dIQ56loahYHAT98xblMpFYSzzhgU2RwKr3W?=
 =?us-ascii?Q?6CHZIWY4jOGsbEXmqFtn0erd+uqM/glVQh+jaiAugW07IRqVrGsEN+8jO4rR?=
 =?us-ascii?Q?Lu6+5ep5f8sw5+tzSJ3LJdCwtNDMv6ybyiYC4PYcyf54XuijlNGFz3QoApr5?=
 =?us-ascii?Q?N84ViGAAm9yXS2MwwXfUU2kuMdJ0X8oZO8bQrV1mh73qpCozCFo4lU4AWfMR?=
 =?us-ascii?Q?LJ4BCVmNXezhfb54an6jqz21MUbRVUt9k/cpMZpV6IwIK/ut90VyFOhyPwr+?=
 =?us-ascii?Q?I0R8iSCK7OWjTcHTnf8tNs/L9bImY++kz/wE8GBIcicqOCDE4uTlOHG/4Btw?=
 =?us-ascii?Q?Ow97Vr1k3UjoqQaUsMNrr/1GOoVBqT+EyFru3xtM+cgzGH+3sfKRWu+5oAGR?=
 =?us-ascii?Q?gjxJPymLKpqNPwaAEVp3ALcIYslDoFgWj8J6dFbkkIFQT9WmXt1xDhQptoY3?=
 =?us-ascii?Q?S8/oT4GChzVMoQ3yst2gj8d/58Py1xjjl4vHsoWub12/apLVnmwUJaK1GDpU?=
 =?us-ascii?Q?FEkB7mbkJQWuGxSmqTch54m1qI3qCaqsaBAlu5YxAC22B/DsossuQRhfQQmi?=
 =?us-ascii?Q?Dr2fIfA+mK/lWEq9jrDtf3c6XKwMbDwU5HgIsjWgP2g1ZCIzSVvfJc23BLt2?=
 =?us-ascii?Q?zdpqtg6qTt3QPxUT9d9+yGIsmWVI9plae/tc3Z/6+YFWhG0JI0I7zPX89N3D?=
 =?us-ascii?Q?wiTTHLkUXpZiAi99RdQMhoxD8SQqfi8RJpyhLFx9AUcItw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DtGuTj5tMXxSmCDCXZqaEXcMZBAqdXPi+Xq4F0928EQ5VnfSlpxFV//XrnyN?=
 =?us-ascii?Q?SVh1SkIeud0PgjquhAp7OeYAolGnoa1k09mkhQygx3gW1BeqXUbCimnA8ID6?=
 =?us-ascii?Q?kivt398TxzX5PCqG/dES96McCMdXZGXkYwjFM8WvwuIxHi07ix0UE2Qlk/P3?=
 =?us-ascii?Q?XDTXzUDMyMWCp0cc3ypb9f85nH3kC3zQIQ4SUsOeRl+avCr+QGeZu0tkEx79?=
 =?us-ascii?Q?bU7iJLHqC+kQKaAWxp+Z5EQvswmBJG9iK44ndvCoQbqQ9gMfc/w7sXTMf3w+?=
 =?us-ascii?Q?rRzmzRCcrGVe3WtA43TozcvN+nD8nON3WDPACAQsbqpEGVLt3OSJPNnbowmA?=
 =?us-ascii?Q?74oPw3JDrkxZ89eNoUn+IMckszHNxILBRI2rT3dHbm/9B28stLxe6BnrdjX/?=
 =?us-ascii?Q?Ao1V7Rmlb0EWSIidJ2cs5eqzjHKCIYqWeVT4P1C2i6F1FfW3EE44NgjRDQBW?=
 =?us-ascii?Q?E4SiEbkhvy0TXdfbqEck2wzIfckj9NU4OJ6gHAGz/Sy1u/o9u1z/FpxCbDPa?=
 =?us-ascii?Q?eySLMhsiv5rpK09iMJkyC40+Dju3Q2e1oxNfbDyPG1gYc9rkLX+YYAlbgh9/?=
 =?us-ascii?Q?0st0VbSThPJR2WBwwTReltysszrNgybqpJCiCRfZGb0Z548DRaYdkXQsvlTu?=
 =?us-ascii?Q?9m3+YgXEau4P341tHYkFbQOs1ySmhNsiiGaIYXsSl86wqwEG2T9kCNlJVrD5?=
 =?us-ascii?Q?LxdwokxwuUs6xpTh3IUJ5I2XyvKRxVLlB1BjcnjFpATrofyE/kozxWvPidgH?=
 =?us-ascii?Q?R9kMtXRkkiFtZJgLc6Jnv9SoKZeXfv4Njf0f4W84SyECPUBf0CTgfQz2noJP?=
 =?us-ascii?Q?O9nBdjmTc+NwLcol1+uvsBiax9Xwdr2vVItifb0sGGbt/7Eg+XQAD1t9e9By?=
 =?us-ascii?Q?4l/iymjLX299VVkWEtEL+B65TMn7qaFGCRvsqvI0TJuyqD3gmLgMO/C2aiyS?=
 =?us-ascii?Q?/WUHYy3hfmsSaHLLsfERhqj/D17oMLjOp0fJndZgGVe0zxXRfxP5O1nbQFpm?=
 =?us-ascii?Q?EiUftF/t0eWLiIlRvgROU6cMeQwUakaerKwLmBnh82DLbkB0o4+IBTXupoPF?=
 =?us-ascii?Q?/Zqj/jhcGPO4ocmp0P+IkhccebbBVBEGi5gFNE/GBJDWDrXl7REi4fhBMkX6?=
 =?us-ascii?Q?3uubMpGWo7srJeNKvwjnj0AMolEccnEdSOekiBBpMVWT/ul4snFLPm213dY+?=
 =?us-ascii?Q?57OFilFRf5IJGUYm+KHBp4EK2+5go9c09naV1xkD1J6y+OWdX0wKM2W7rhTV?=
 =?us-ascii?Q?wSQCsZv/iK2fye29EjjOBY1la3BRHdW8V0Ew/zPAGMs9CNHQvDRMkWQ46M1J?=
 =?us-ascii?Q?Dh+BytDRGuAOcWm1lqQR/wnSp+Z7I3A+hJZbrnNYRLiowZEabU+h7255FgxN?=
 =?us-ascii?Q?SdTeoS4ee9u5JQK6toBPqjmhHErIAHQGRgfgqwiA6VOL72wAkVjO3Jawvc6z?=
 =?us-ascii?Q?XvS6UWablZYPke6enIM/PJVb6cbqPxpihYe5EnOccy3MxjG0hb8/CnwAyrX8?=
 =?us-ascii?Q?U/0MRtwv4mzBcA5PU6XlH7yTBry/OLAXtccLAc98WnNk7f2KxKbn9zWaogNW?=
 =?us-ascii?Q?RT9ddtbZaPuIfIv6lPEMbcCnkwJZN0a+vIUog6NfkO1Zzk+r5BU2DZYQ9n1Z?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b834038-5d53-42fa-70fc-08dcdf1a3b9c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 17:31:34.5115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6RdQFz3X3tF1DO9qjaWCXqqJQYGDZqLTcI+fgCA0vpTtfBf8MVN7C4nPajKEK6UZ36d4eJ67bTAU4zlfaIWrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

On Fri, Sep 27, 2024 at 01:38:14PM +0200, Peter Senna Tschudin wrote:
> Changes the behavior from running one suspend/resume cycle for each
> xe engine to running a single suspend and resume cycle for all engines
> considerably reducing the xe_pm run time.

\o/

Thanks a lot for that.

I'm wondering if the thread is not an overkill, but I don't have
cleaner suggestions...

> 
> V2: Fix race condition around child_ready and fix subject line
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/xe_pm.c | 139 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 110 insertions(+), 29 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index eee89428c..066c5ddf4 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -54,6 +54,22 @@ typedef struct {
>  uint64_t orig_threshold;
>  int fw_handle = -1;
>  
> +static pthread_mutex_t suspend_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t suspend_cond = PTHREAD_COND_INITIALIZER;
> +static pthread_mutex_t child_ready_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t child_ready_cond = PTHREAD_COND_INITIALIZER;
> +static bool child_ready = false;
> +
> +typedef struct {
> +	device_t device;
> +	struct drm_xe_engine_class_instance *eci;
> +	int n_exec_queues;
> +	int n_execs;
> +	enum igt_suspend_state s_state;
> +	enum igt_acpi_d_state d_state;
> +	unsigned int flags;
> +} test_exec_args;

s/test_exec_args/thread_exec_args

> +
>  static void dpms_on_off(device_t device, int mode)
>  {
>  	int i;
> @@ -273,6 +289,7 @@ static void close_fw_handle(int sig)
>   * @prefetch:	prefetch
>   * @unbind-all:	unbind-all
>   */

keep these comments block near the main test function

But I would keep the test_exec as the name of the main function.

> +
>  static void
>  test_exec(device_t device, struct drm_xe_engine_class_instance *eci,

then name this function thread_child_exec or something like that.

>  	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
> @@ -396,10 +413,16 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>  
>  		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
> -			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
> -				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -
> -			igt_system_suspend_autoresume(s_state, test);
> +			/* Tell the parent that we are ready for a suspend and resume */
> +			pthread_mutex_lock(&child_ready_lock);
> +			child_ready = true;
> +			pthread_cond_signal(&child_ready_cond);
> +			pthread_mutex_unlock(&child_ready_lock);
> +
> +			/* Wait for the suspend and resume to finish */
> +			pthread_mutex_lock(&suspend_lock);
> +			pthread_cond_wait(&suspend_cond, &suspend_lock);
> +			pthread_mutex_unlock(&suspend_lock);
>  		}
>  	}
>  
> @@ -440,6 +463,81 @@ NULL));
>  			   active_time);
>  		igt_assert(in_d3(device, d_state));
>  	}
> +
> +	/* Tell the parent that we are ready. This should run only when the code
> +	 * is not supposed to suspend.
> +	 */
> +	if (n_execs <= 1 || s_state == NO_SUSPEND)  {
> +		pthread_mutex_lock(&child_ready_lock);
> +		child_ready = true;
> +		pthread_cond_signal(&child_ready_cond);
> +		pthread_mutex_unlock(&child_ready_lock);
> +	}
> +}
> +
> +/* Wrap test_exec() function arguments in a struct for pthread_create */
> +static void*
> +test_exec_wrapper(void *args)

this probably deserves a better name...

> +{
> +	test_exec_args *exec_args = (test_exec_args *)args;
> +
> +	test_exec(exec_args->device, exec_args->eci, exec_args->n_exec_queues,
> +		exec_args->n_execs, exec_args->s_state, exec_args->d_state,
> +		exec_args->flags);
> +
> +	return NULL;
> +}
> +
> +/* Do one suspend and resume cycle for all xe engines.
> + *  - For each xe engine: Create a thread for test_exec
> + *  - Pause the thread where it expects to suspend and resume
> + *  - Wait for all threads to reach the pause
> + *  - Run one suspend and resume cycle
> + *  - Wake up all threads
> + *  - Wait the threads to complete

looks a correct flow for the system suspend... something strange for the runtime pm,
although d3hot and d3cold works for me here in my DG2...

I mean, during the thread child execution we are checking if the device is in d3...
But with multiple threads executing that, we cannot guarantee that anymore that we are
in d3.... That flow is broken....

I believe it just works because in_d3 also has some sleeps and waits so all
the threads are executing and waiting... but we shouldn't rely on that.

Perhaps we should split the regular suspend and runtime_suspend tests entirely?
trying to encapsulate and reuse the exec functions...

> + */
> +static void
> +threaded_test_exec(

as I told above keep test_exec as the main function name.

> device_t device, struct drm_xe_engine_class_instance *eci,

do not declare the engine instance as argument. You are not receiving this
anymore since the xe_for_each_engine is here below.

> +	  int n_exec_queues, int n_execs, enum igt_suspend_state s_state,
> +	  enum igt_acpi_d_state d_state, unsigned int flags)
> +{
> +	enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ? SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> +	int active_threads = 0;
> +	pthread_t threads[65]; /* MAX_ENGINES + 1 */
> +	test_exec_args args;
> +
> +	xe_for_each_engine(device.fd_xe, eci) {
> +		args.device = device;
> +		args.eci = eci;
> +		args.n_exec_queues = n_exec_queues;
> +		args.n_execs = n_execs;
> +		args.s_state = s_state;
> +		args.d_state = d_state;
> +		args.flags = flags;
> +
> +		pthread_create(&threads[active_threads], NULL, test_exec_wrapper, &args);
> +		active_threads++;
> +
> +		pthread_mutex_lock(&child_ready_lock);
> +		while(!child_ready)
> +			pthread_cond_wait(&child_ready_cond, &child_ready_lock);
> +		child_ready = false;
> +		pthread_mutex_unlock(&child_ready_lock);
> +	}
> +
> +	if (n_execs > 1 && s_state != NO_SUSPEND) {
> +		igt_system_suspend_autoresume(s_state, test);
> +
> +		sleep(2);

why?

> +		pthread_mutex_lock(&suspend_lock);
> +		pthread_cond_broadcast(&suspend_cond);
> +		pthread_mutex_unlock(&suspend_lock);
> +
> +		for (int i = 0; i < active_threads; i++)
> +			pthread_join(threads[i], NULL);
> +
> +		active_threads = 0;
> +	}
>  }
>  
>  /**
> @@ -718,8 +816,7 @@ igt_main
>  		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
>  
>  		/* Always perform initial once-basic exec checking for health */
> -		xe_for_each_engine(device.fd_xe, hwe)
> -			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
> +		threaded_test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM, 0);
>  
>  		igt_pm_get_d3cold_allowed(device.pci_slot_name, &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
> @@ -731,14 +828,11 @@ igt_main
>  		igt_subtest_f("%s-basic", s->name) {
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
> -
>  			igt_system_suspend_autoresume(s->state, test);
>  		}
>  
>  		igt_subtest_f("%s-basic-exec", s->name) {
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 1, 2, s->state,
> -					  NO_RPM, 0);
> +			threaded_test_exec(device, hwe, 1, 2, s->state, NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-exec-after", s->name) {
> @@ -746,31 +840,23 @@ igt_main
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  
>  			igt_system_suspend_autoresume(s->state, test);
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> -					  NO_RPM, 0);
> +			threaded_test_exec(device, hwe, 1, 2, NO_SUSPEND, NO_RPM, 0);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", s->name) {
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 16, 32, s->state,
> -					  NO_RPM, 0);
> +			threaded_test_exec(device, hwe, 16, 32, s->state, NO_RPM, 0);
>  		}
>  
>  		for (const struct vm_op *op = vm_op; op->name; op++) {
>  			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
> -				xe_for_each_engine(device.fd_xe, hwe)
> -					test_exec(device, hwe, 16, 32, s->state,
> -						  NO_RPM, op->flags);
> +				threaded_test_exec(device, hwe, 16, 32, s->state, NO_RPM, op->flags);
>  			}
>  		}
>  
>  		for (const struct d_state *d = d_states; d->name; d++) {
>  			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
>  				igt_assert(setup_d3(device, d->state));
> -				xe_for_each_engine(device.fd_xe, hwe)
> -					test_exec(device, hwe, 1, 2, s->state,
> -						  NO_RPM, 0);
> +				threaded_test_exec(device, hwe, 1, 2, s->state, NO_RPM, 0);
>  				cleanup_d3(device);
>  			}
>  		}
> @@ -792,17 +878,13 @@ igt_main
>  
>  		igt_subtest_f("%s-basic-exec", d->name) {
>  			igt_assert(setup_d3(device, d->state));
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 1, 1,
> -					  NO_SUSPEND, d->state, 0);
> +			threaded_test_exec(device, hwe, 1, 1, NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  
>  		igt_subtest_f("%s-multiple-execs", d->name) {
>  			igt_assert(setup_d3(device, d->state));
> -			xe_for_each_engine(device.fd_xe, hwe)
> -				test_exec(device, hwe, 16, 32,
> -					  NO_SUSPEND, d->state, 0);
> +			threaded_test_exec(device, hwe, 16, 32, NO_SUSPEND, d->state, 0);
>  			cleanup_d3(device);
>  		}
>  
> @@ -842,7 +924,6 @@ igt_main
>  			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
>  			cleanup_d3(device);
>  		}
> -
>  	}
>  
>  	igt_describe("Validate whether card is limited to d3hot,"
> -- 
> 2.34.1
> 
