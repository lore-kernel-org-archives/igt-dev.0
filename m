Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D1BC2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 06:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E2510EA22;
	Thu, 27 Jun 2024 06:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjAyWt1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334CC10EA22
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719470122; x=1751006122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fpPH+rbQmbZ+5DysQ4pJmvCgVt05EUdLRvZ+n+Mfigo=;
 b=BjAyWt1FyUk7CfwtoPTK5nb+ETPNUdsG02X9Kn16HK57BkphDZWuxuGX
 Meoxr5s2NLkVG4j8y9vfx+06SnxdO9P4oK12ZGGBlDNt+pWl0+4SDMpZD
 wZ3iZX6NcljxvfxzMw8Nl3DJ9iQtRWUS7vWwWJReooi2neZFCn/3LjPwR
 RFZEw1OtgLiEUZj1rPu0JTxp2pjyLxw7RriKo3D6OKd/JFf4wBPLrc0ns
 O27cjaSsPmC8/UrHNra8fB4pcp++jHDvX64mnj2lLeR2xGFw0U1Jj7kCy
 Ctwh4yXPOz7WUlcH/EcjtSUq7QlgmRMeF8SULhMUyLv9vj8nXrGqutOOt Q==;
X-CSE-ConnectionGUID: cwU3SMUBT7Gukz/7zZEoNA==
X-CSE-MsgGUID: NjH1QCJCSRGmtufPgepZiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27264218"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="27264218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:35:22 -0700
X-CSE-ConnectionGUID: f48hHjCoSlugY/cDpdP4jw==
X-CSE-MsgGUID: NU7BHQncR8GEIyfnZFpErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44396883"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:35:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:35:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:35:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:35:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cg85LmxPINSIyZBSrOEcwdufhfhEtck3Uqwb5hJc1XS7wowIf9l2WpB3y58rPhObE9u8TGbC8dflIwtZzFF+e1CIx5jG9+zEth1w0KozeBQqLwseG5yHECD/2BYHgtsC4+D3oRDik/RlCGfW0inzvsOvv+vNq8wXDDlXIUPS0tEuasrFOeN/WrvhryakoHg1kyyCNaBIEl3LutTf4x/fIhI6SSFHs5PYi2CDhIyY+KhFpTYsRkoWdxl9h3sU/iG5y7MCLwC1BWHFqsrI7UQy71VymC9SSsmhVq/PrXLHm24CVBOHiGfSc2D2+LDy1H7gfUPLuLW8rZKnXNpsvi1eEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSbHOUguNQcSRMNaHJekF5dazJn/43NuNsx9Irq2BOE=;
 b=SpcCNyp7iel/417qgmiRILwKGuWU+OJ2bNNYTaAj4fO0NWwDRYJWaiYlS/AyX3DssgzF/LNAuKbfKAODVlK5+HKNUHB96F78ZnPE/f29jykVn0buOBrYWhXAyi6Yin4+bsKevMIVcJCjcdA127fE0DPrQciOtOVsgWpH8tbOHPTYY9lCqLi6svqSoLNez4f3vD5seVIhAXEYVl5VWLARtLtw9qWT0SCt/PjAPmHGxD1Nq37qwGov6MpaL8ydledKyL8Ehvo4J4wHf45TggGHzZoPeulwHkXqOUN2y1She3Rnsl8kxL3tCgXr+7TTvR75x3QAOrfIvFPNcdDOHQKjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 06:35:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:35:17 +0000
Date: Thu, 27 Jun 2024 06:34:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_evict: Reduce the "large" bo
 size for threaded eviction
Message-ID: <Zn0H/D/DXVoEdSX0@DUT025-TGLU.fm.intel.com>
References: <20240626123833.3164-1-thomas.hellstrom@linux.intel.com>
 <20240626123833.3164-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626123833.3164-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: b74c6897-f5c5-49c4-fd3f-08dc96734f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AzFOujdepHhHDgQAqwnEEn90S9s6Zv7/RoFvZHqbhf/E4O4n+o5+4TEdq4?=
 =?iso-8859-1?Q?DDMudvjCCEZ6QGMcny8VON/x8PdsqdbDB4/+MOAjYS22zsmbBrwv91ssGF?=
 =?iso-8859-1?Q?GwNa/KlKGSbMqUE1sZyehb653psgb5wOFpmxwrPRxYkawkKcaB1z9seBBo?=
 =?iso-8859-1?Q?6v9OPr1E6wLgqgOZUDxPabLha0Amv2j7pSzr0ttgi4HI+nC+qA3+7m5l/o?=
 =?iso-8859-1?Q?kv6tz20loEPvM8bMH3eDVV0EXJNRYGPoKWd0pB7Q5EWPTbH44YBjQaPERi?=
 =?iso-8859-1?Q?y2UkmQSSSjFrLXeuy1vDvjInwY65uFm4YS2aI5sS5VMiDqlpXUHvkY2Evp?=
 =?iso-8859-1?Q?BbGq0Mz/PJ6Xek63Wylz3n6axezmEWIAPNCaFXPuK8NFLnlqo48+1HruT0?=
 =?iso-8859-1?Q?IOL+D8U38NVddmmcvIK52uyHna/V3az6rmk1vqS6hisJOt0bM/J39zq8MH?=
 =?iso-8859-1?Q?gTPepXz4jEKhvTqaMZTw/be1DCR36I1Kkj8S0FbT92AzCYYJMlcVa7kLLa?=
 =?iso-8859-1?Q?rR6UVrS6JRFQBZWRfuKu2F3LASZ9L8UHSOmlP1gauvKw/5ryOHDFfT19/N?=
 =?iso-8859-1?Q?3kJxk0pbT678F1aYJ6lzhFOzn906Y4AGXTekZ6uV1/uMp36f9neozEGnQf?=
 =?iso-8859-1?Q?mkTB+4hPUn2iU9s4kQ+kTLiWZ3Y3mXOGvkH30NdWi5Kdq5P5WH8oqMXNe6?=
 =?iso-8859-1?Q?rc61/0EtdHQEOYpbfoVVJ/LaAXjw9CWVx0ysTqG4qp0lQNazoPI3ukjbVR?=
 =?iso-8859-1?Q?GUEhMeBKRZAj86htoMPSOfp7jC9ZNOylScgUovy0G8Z/WQAfZJZRzfKDoG?=
 =?iso-8859-1?Q?4q0mkJTYEoaQnE449TF0at6OJrA4Mjpm6B2FD6RKcyw8omEdqHJV/P3Dll?=
 =?iso-8859-1?Q?ag0ZiMJBUS57oNyeAmUGnIuMwDCuu5b+mZNRhI9WPEJW1jnj/7Z7TU6ZsP?=
 =?iso-8859-1?Q?fVIx7YT+mz4Eg5Txtv0tzehdUo3LC2SmLero8HY/fLJUh3KNHI+IcMyJPv?=
 =?iso-8859-1?Q?A/whpSXt/Ct9Ag0MkSnwrDBPffX4Q+oK/0kS5Cy7TizC3bLN3Js7qiYfzA?=
 =?iso-8859-1?Q?QzncIt4/l1Wo5H/EZCIrrag6Y4aNEqnt9JWH6lsiMTlT35qIgr/2rVAtPu?=
 =?iso-8859-1?Q?ETBkVhMj8HTSSI5AG3tq25G+NjzScqjYZx4t9rp+iWyWFDvgDdoMjRuWnk?=
 =?iso-8859-1?Q?vtsLXqEmbSlJjMwPg3VEZvOoaYFukuVwPPbvHh4li2cPwV8YVLFeEy6pUD?=
 =?iso-8859-1?Q?wtVIIPtLiPMxRCuF5dPA0/9hm31VcZRd3/6vEyJjEXWknHdTT2YkELf5Tc?=
 =?iso-8859-1?Q?e0hqOrcfOY7XkO774GBCbHxPYRPK2iSK8QhjyJmNh1Jq2XUrpzV++3giAo?=
 =?iso-8859-1?Q?oI1bR6bO+3SC5FF7dcHWh+4jmZrajnNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?B3GGPb1o4LgsYUtbNBCZ9UJ4rsRwrIavz8qvlQRuMOGpe7LC3GUG6B9nK0?=
 =?iso-8859-1?Q?HVdRfg6Sc71wDHveMN3Ne7kPEJ7wdpKfG3AmN3NWaVzQ/LlZ5lGvxBdSMN?=
 =?iso-8859-1?Q?Z5hTbUIl5n6jJ3nc2y7uhpwwDMtczaYdPO/HpkrcraKAbiX3DOfTGY4hIS?=
 =?iso-8859-1?Q?OMrygsXUVBvucpPS77JFiuUeTtqIjPMNmuq2OyLJqvBnwIJD1K6FIgOt5M?=
 =?iso-8859-1?Q?4vxUfR9KtramwNWxS9flEWu4sSaMLLUTv8Oaa8TxFbr0lZwCEVxjpvXJAU?=
 =?iso-8859-1?Q?tCWCggewwVgHpHhPE4oUXAXqYRzX7NBcxjyWniyaThEOckmeYOx5igidO8?=
 =?iso-8859-1?Q?pR88T4p10phizumUzyx0PKVDr9sKThuKUnQEBPPPUCCIXh/kksy3Vap+IP?=
 =?iso-8859-1?Q?6Bd1qEXOAMzBG+/kUCycNgUnuUy88Je42QVrNFnhqWGS0X9iyrZ6Bq+rRm?=
 =?iso-8859-1?Q?RrwUtIPNrOwNKCVPCb/JNpOR4Xc9eeZpPoOUqn2st9MBCHgesjrK/Z192U?=
 =?iso-8859-1?Q?yCsb3bSIAoM3ryCtqWRqe+Pxm/5H2mFTUfY97rRgwlpWdd8SD/Wlm/0FSW?=
 =?iso-8859-1?Q?12kw24SU//YuvTxaA/EYp4xfgo3MwHNMq+1vhcggHuLLYXtnR9Sn93nrcH?=
 =?iso-8859-1?Q?KjxKWYGING7OnMVUls5sGH+Hj7BMMcdAvaPHBrBH2Jz4PssZmmJ23cTcDM?=
 =?iso-8859-1?Q?kAbHOLSa49r+frSIfWEITHaDFfCDF0iMHpm/d9/BzQH8hFe4OxX9k11ScP?=
 =?iso-8859-1?Q?DaR1eo6xCrq9/Y1PI++Axt9knhPLk2LBHWqY1FZFzLV2gFBP8JuLC8PRlY?=
 =?iso-8859-1?Q?fbS7Sr+5rl5QN+3ZFUHt2KcSMwZ70WQQKvVogxbuP3f4PXH5x6bxW5GkQB?=
 =?iso-8859-1?Q?E1VU5SsKnw2w0G+vKAQmuVeCV4MbrsUoRBE7+/WjezLVNqPlez7gUpZpsS?=
 =?iso-8859-1?Q?aSnYVPWdYG/c2Z2Ynid4LM2IX25RGcmhf3Z53Q22LkHaVgI6Q8mRN6/QA8?=
 =?iso-8859-1?Q?xWQ4oCP0hVKil6bZMO/neCmFzUxgaf+mCP7dCFtfCSa7lUrr3wdiM6CLLz?=
 =?iso-8859-1?Q?o6uMmyoKo0wzaNwqyBz+LJpvBz5aOkxnas8Vo6EzT2f29nZV+ebV2yo8zn?=
 =?iso-8859-1?Q?ZjtIq8YrY4xInCXYU1RdBzr0ZzvE7Z48kPool7p5vBu6dbwWNcpyhsU6l1?=
 =?iso-8859-1?Q?4lVmVQHouypQkT6r/ze+Lqvo5jPPoR1gxw4h2u+sSujmQx0cEqjkeN3YMM?=
 =?iso-8859-1?Q?bssQD5SwgqUjZnUz+hh7LmKRZE/0VXpnFGC7LxqW26cBnNbYBEktibL3Af?=
 =?iso-8859-1?Q?bmDJVGP+l78FoL8GcuJNpsPq+A0btXqFazHYC7oElV+MQreRmLLb8Ozfmw?=
 =?iso-8859-1?Q?Bl1pdMVNraAwk6Tsm1AnA+DeGQafpU5o3GZXlwJwmyKuW8uHAvJRp1cqzh?=
 =?iso-8859-1?Q?OzfUVXs92oV8veDAbIKsNL+9D2UUUkn2mi9iBcWF9exgsRPgEQN4HiQxS2?=
 =?iso-8859-1?Q?vMGtbRycgercUB6SmhSIDInQW/9nGCknM/5PI/D0gAQqJ1MJieFvn1bwb+?=
 =?iso-8859-1?Q?C3XmYMLKRZ1SEbM3D7FMMpcJ5tUBCMquDgm9+tstnJkQsVn962lW8XBonB?=
 =?iso-8859-1?Q?6n4QZ6PaexGYx3B9U8XV6py2194p6RU+syewwt8gACcqw8ND70Kqcg3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b74c6897-f5c5-49c4-fd3f-08dc96734f0d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:35:17.2233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rhxkh0Torx0tQEGX5wz+8voOGuX+oxtPt6Wq/eF9EALGinCOp3uwkcmFTCzyxwcGD64slJH8YC5Zi58SJntheg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

On Wed, Jun 26, 2024 at 02:38:33PM +0200, Thomas Hellström wrote:
> When calculating the number of bos that simultaneously fits in
> VRAM + system memory, account for eviction pipelining by subtracting
> one bo for ongoing pipelined evictions per thread.
> 
> With large bos this may lead to us not being able to use a working
> set of 2 bos, which is the minimum, so reduce the large bo size for
> threaded evictions, and instead increase the default number of bos.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  tests/intel/xe_evict.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 5691ad021..13e90d317 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -484,10 +484,16 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
>  	if (flags & MULTI_VM)
>  		set_size *= 2;
>  
> -	/* All bos must fit in memory, assuming no swapping */
> -	total_size = ((vram_size - 1) / bo_size + system_size / bo_size) /
> +	/*
> +	 * All bos must fit in memory, assuming no swapping. Subtract one bo per
> +	 * thread for an active eviction.
> +	 */
> +	total_size = ((vram_size - 1) / bo_size + (system_size - 1) / bo_size - 1) /

Had a comment in previous patch about 'system_size / bo_size' too.

Why change this to (system_size - 1) here?

I get the '- 1' at the end.

Matt

>  		num_threads;
>  
> +	igt_debug("num_threads: %d bo_size : %lu total_size : %lu \n", num_threads,
> +		  bo_size, total_size);
> +
>  	if (set_size > total_size)
>  		set_size = total_size;
>  
> @@ -741,13 +747,13 @@ igt_main
>  			MIXED_THREADS | THREADED },
>  		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
>  			THREADED },
> -		{ "threads-large", 2, 2, 4, 3, 8,
> +		{ "threads-large", 2, 2, 16, 3, 32,
>  			THREADED },
> -		{ "cm-threads-large", 2, 2, 4, 3, 8,
> +		{ "cm-threads-large", 2, 2, 16, 3, 32,
>  			COMPUTE_THREAD | THREADED },
> -		{ "mixed-threads-large", 2, 2, 4, 3, 8,
> +		{ "mixed-threads-large", 2, 2, 16, 3, 32,
>  			MIXED_THREADS | THREADED },
> -		{ "mixed-many-threads-large", 3, 2, 4, 3, 8,
> +		{ "mixed-many-threads-large", 3, 2, 16, 3, 32,
>  			THREADED },
>  		{ "threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MULTI_VM | THREADED },
> @@ -755,11 +761,11 @@ igt_main
>  			COMPUTE_THREAD | MULTI_VM | THREADED },
>  		{ "mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MIXED_THREADS | MULTI_VM | THREADED },
> -		{ "threads-large-multi-vm", 2, 2, 4, 3, 8,
> +		{ "threads-large-multi-vm", 2, 2, 16, 3, 32,
>  			MULTI_VM | THREADED },
> -		{ "cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
> +		{ "cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
>  			COMPUTE_THREAD | MULTI_VM | THREADED },
> -		{ "mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
> +		{ "mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
>  			MIXED_THREADS | MULTI_VM | THREADED },
>  		{ "beng-threads-small", 2, 16, 128, 1, 128,
>  			THREADED | BIND_EXEC_QUEUE },
> @@ -769,13 +775,13 @@ igt_main
>  			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
>  		{ "beng-mixed-many-threads-small", 3, 16, 128, 1, 128,
>  			THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-threads-large", 2, 2, 4, 3, 8,
> +		{ "beng-threads-large", 2, 2, 16, 3, 32,
>  			THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-cm-threads-large", 2, 2, 4, 3, 8,
> +		{ "beng-cm-threads-large", 2, 2, 16, 3, 32,
>  			COMPUTE_THREAD | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-mixed-threads-large", 2, 2, 4, 3, 8,
> +		{ "beng-mixed-threads-large", 2, 2, 16, 3, 32,
>  			MIXED_THREADS | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-mixed-many-threads-large", 3, 2, 4, 3, 8,
> +		{ "beng-mixed-many-threads-large", 3, 2, 16, 3, 32,
>  			THREADED | BIND_EXEC_QUEUE },
>  		{ "beng-threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> @@ -783,11 +789,11 @@ igt_main
>  			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
>  		{ "beng-mixed-threads-small-multi-vm", 2, 16, 128, 1, 128,
>  			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-threads-large-multi-vm", 2, 2, 4, 3, 8,
> +		{ "beng-threads-large-multi-vm", 2, 2, 16, 3, 32,
>  			MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-cm-threads-large-multi-vm", 2, 2, 4, 3, 8,
> +		{ "beng-cm-threads-large-multi-vm", 2, 2, 16, 3, 32,
>  			COMPUTE_THREAD | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
> -		{ "beng-mixed-threads-large-multi-vm", 2, 2, 4, 3, 8,
> +		{ "beng-mixed-threads-large-multi-vm", 2, 2, 16, 3, 32,
>  			MIXED_THREADS | MULTI_VM | THREADED | BIND_EXEC_QUEUE },
>  		{ NULL },
>  	};
> @@ -823,6 +829,7 @@ igt_main
>  					     1, s->flags);
>  
>  			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
> +			igt_skip_on_f(!ws, "System memory size is too small.\n");
>  			test_evict(fd, hwe, s->n_exec_queues,
>  				   min(ws, s->n_execs), bo_size,
>  				   s->flags, NULL);
> @@ -836,6 +843,7 @@ igt_main
>  					     1, s->flags);
>  
>  			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
> +			igt_skip_on_f(!ws, "System memory size is too small.\n");
>  			test_evict_cm(fd, hwe, s->n_exec_queues,
>  				      min(ws, s->n_execs), bo_size,
>  				      s->flags, NULL);
> @@ -849,6 +857,7 @@ igt_main
>  					     s->n_threads, s->flags);
>  
>  			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
> +			igt_skip_on_f(!ws, "System memory size is too small.\n");
>  			threads(fd, hwe, s->n_threads, s->n_exec_queues,
>  				min(ws, s->n_execs), bo_size, s->flags);
>  		}
> -- 
> 2.44.0
> 
