Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B9FC3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 10:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A6010E90B;
	Thu, 10 Apr 2025 10:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LssDL+gR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBFE10E90B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 10:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744281354; x=1775817354;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=L3ks54dtML5De3WUhU9gQUlBZEPtp/CSDzh2YeE0rOU=;
 b=LssDL+gRVVh5IrSMfAeri25bDdGX+X2iPhe5grRAqp3lBQfnygh0yA1T
 hyiOl7UiawEM5NlIf55MraVbG3HiOdg5XegwMvJ0sb/L76VTWqWl6i7tz
 JaJKljG2NA9BHl+b3/37FHrshCHzB6QlgRzG3JIGK7gDCQ+CliCD/Yqmf
 eHnTVCOPwLPoqKCAcOFyDm4EMBYHJboekuNKwe1kK/a6/BgR5wzVq6Cb/
 owxSp8se2tpxELOQP6lIEtFVtNUW0qXnjDRh0StdwsEmsk9ZJXY5WARxT
 vFB/F1oeSBhsvzJBt9jocKmvOh0SQRSunWN6mJNgAzH5nr4HZ/WRcI46r w==;
X-CSE-ConnectionGUID: BHsK3gVESMezfBro7vjGfg==
X-CSE-MsgGUID: AZ3MhcozT0qMMwak9ckmsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45929556"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45929556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:35:51 -0700
X-CSE-ConnectionGUID: 2/mO52hGQO62M4BYc9q+/w==
X-CSE-MsgGUID: K2w0DC/IRDKp+DxO3nICjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="128819798"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 03:35:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 03:35:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 03:35:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 03:35:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh4JtowAy/YDO22BUAsf3TpAQwdLwvkTcz/Kj3hb5TTeR0A3GfjTBaOwBXe+tAxIPJyQYn+29bVAH/itXvfK1hjyIOwG3q9guGq/XFmHxMCephKJXCVU2R9B90AifuTkc1R9iFwoIMkl7my1X0RQ+Lchy7+47l43PYrwHJmMbek5PQt9SnZoq8zlW1rnPFneDpyQAuFlfgEKAJoocSSE21OjYLGtYHGVwMxqlVibqgUYfAYTTmdVw/XvN4+2evb39Cu+nNG33QMC2XXZN7w/ebjfg9Y1WEIZvb0GeFs27qB4bmsmjrB9r/3VPVgA9xTtSm4W77X7IIaIzhFTrT3Mbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5I1KFyScbAXPKTO7sxuhdGx75q7p0I71gfWEth9NNw=;
 b=nvum/Jg1rvG6uEfSXmEBoafCT/xo0JjeuT4QbvsKOAlM+orWregArq94g3f6mwOintZkUhsZY8k0AIGdOROmEn1gYIudUquFjjvsZuCmcuIyUwZVFM0hs7cNo32lg1BzhiwBbT37n2fc9jtapxSWgyObbYSUgZA2daqM/zULf7sGFyDOKFsGLvrNQzJSHlYKauErri0XIuzkGGy/nyO4kR1HWXb4PWCHkUDgkEK5eL4OQVQrGEJhC5IwJlGrfgmRxrGlTmACVx62Q17i6rHuUH4WuHkWe6WkyLAEKs1XXBHuz2r2ZXIBm6AdsF67b5cCLFzB2V6Pzh6FDlH8krYrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 10:35:47 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 10:35:47 +0000
Date: Thu, 10 Apr 2025 13:35:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5] tests/intel/kms_pm_dc: Remove PKGC10 dependency
 to validate DC6
Message-ID: <Z_efBsxpWJCDviZu@ideak-desk.fi.intel.com>
References: <20250217170809.175276-1-mohammed.thasleem@intel.com>
 <20250408214544.39289-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408214544.39289-1-mohammed.thasleem@intel.com>
X-ClientProxiedBy: DU6P191CA0055.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::26) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CO1PR11MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1d6629-114a-4652-b861-08dd781b7484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vgD6Isa2DPTAQrB7w7SRD2gfmeFUNS2+uAvO+NNEeVTDnuYELN0AyRH1DG1r?=
 =?us-ascii?Q?2uwcA/P53vgTGLgb0whR89oMkKGrZqZ50x7onIG404O0DNDVYZGPHDe3E8jD?=
 =?us-ascii?Q?CMdNH41IC2Fj3Mgg8jYBnKQF0PhRuYHtID8iQ39MMl0me0kfvY4IGVSiEUl0?=
 =?us-ascii?Q?XCHazTqLPB+/XrNp4y7DNOQvZ+XKf7ScLZ0WK5j9U8/zKQ/a6Tp5uMHRrs5x?=
 =?us-ascii?Q?tQAVXXhiFKq01lWU0uuFDuPcWZYv8bOl1sTCiXSijDliYcDRnW81gEHbXYVt?=
 =?us-ascii?Q?18cSdlzPFdcqLqSzfkJGlKk3S4D2btYfkCETBoR84sdS51xCvr2oqkUro6Mt?=
 =?us-ascii?Q?dq3v3z17SOAhub3QdFRFw6QuHCbG6PIrH690Jrc8QXiGyYwYTdVerl+K/bBH?=
 =?us-ascii?Q?afkRMUf3xsoc8UM3jEt1sr2xIfXL8fI5cOzmPZNTgUk6cCRXc5j9eW5XSZ2c?=
 =?us-ascii?Q?u32piQb2yOxAI0DQyC7tXMDBtnLoTQ4ahA1Zt4xn3enpdPOXsDRpLccXxe1k?=
 =?us-ascii?Q?RrnthWRTWXEZkYPqKgKAaSyhx8Ru4nO8d48bwlnZyH0/fs06LJZDsJruV/84?=
 =?us-ascii?Q?T+sze+LY1Ms3uDruIe+ZWQ+vvpPLN8MZV9ZV7wHXlQsR6MsQXki35st3SsCg?=
 =?us-ascii?Q?fcYR84Orj5OvCcMfmxeuM6/GFSGkWptq19Egn6pW34i/3oULvkHzyKu8ivFn?=
 =?us-ascii?Q?54mqvPgm37F/tna99MGyQHbwBkgmeNhKvk+NCGZ2QVceu+ts6zhQqg4j6j/I?=
 =?us-ascii?Q?JrWQ95buuUCiyMG9/M4G4NUsHN/tgVUR9cqkKBQfRGtDUxi+XYDFurvd7gME?=
 =?us-ascii?Q?Wg8UAUKavzClEkjxFnQZ02ql4MvYivc6p6KFbQ+r6ftK4jajoQpTDRv3oes6?=
 =?us-ascii?Q?q6z5W7OYQJbyppCEXnaGUEVsQp28we/h4y4A0SAKMYblfvBqf03GgemE8UFX?=
 =?us-ascii?Q?X8LjgJIVR8bcakXQJZt4eksNQBYBzQPXF8MOi6SyGhQEPCyfmTtb3WpxCTQ+?=
 =?us-ascii?Q?VicTbPCH1ii96CPB7zeDrm+w4TgYOoMOwjPnC1N51Fk0kKPxJbYPZN9dRomO?=
 =?us-ascii?Q?60KFenI7CnNNjPm4eKqCGa496vS/JviAXLhURDkaw4bz3D1RHNNzFujSZqPF?=
 =?us-ascii?Q?X/pVQqVjKWe81bgTZ5/SuSefLjm/WoHDT00apYOZgBe8Lkup3NZF1qWW1Z94?=
 =?us-ascii?Q?ZIvsKloERxz9GdX9ZgBFST1h9UU0PCuIhOtW+UTeIDssZs2TsDJpGQY8KOwT?=
 =?us-ascii?Q?ER5qDgkoUMXNqvWzrb9ZVOfPkXGXuStDevvIkzsE81cLs0oh1YRw97kIeQ/2?=
 =?us-ascii?Q?zoMzsPxxpg7ajtqnFdxH9w2hrpJbTLCvTqNX4EB8rPCpbyUOKf3KdOgAx5Vn?=
 =?us-ascii?Q?ojbtnZvOdcyXzPzAjNNDukLjOYUadjOMaOhzsxasJSQ+Rm3s8uhhG5gvzwyp?=
 =?us-ascii?Q?zpKfWA6GdBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5h2sEm69tqvtcKBLRsYsnSvdB7gYy3VYFV6CldA34FYB9Tddw2LiLgKiQJ0k?=
 =?us-ascii?Q?BQxh6GT11GnF0YJRpvUfWTOBLO9zsz54GQk2sPKBhUKUiuZGAgQC/+NXrzYR?=
 =?us-ascii?Q?tg49u8l2TaNOq1adwhjPr5HERwn3dbQu4NHoJgtEgMl0yhov6PMoKx2cHwKV?=
 =?us-ascii?Q?S56kUtsiANj/shOHLk7OBAxfhTJgWeYtdLW3KuRl3OVY9q9tTZo8jVPl/GW9?=
 =?us-ascii?Q?sdS5T9Ae1Gore+M7RDettBm1iv6D7TukQs1HhZNL5fR+FEeb9qBqigpC8SiO?=
 =?us-ascii?Q?34YgfzEXN9IE9hg7nXHDOL2K4MHtJOd0w9XIheKRseBArepPFly7JDyXMdOe?=
 =?us-ascii?Q?9hheKDmenXoaYQHOYf2MooV6gD7IG3w+K/oSbYSshf2SDZ4gKl48kZxPI/ii?=
 =?us-ascii?Q?CC7qIxEs2PzkwAHZ6ebYBLhiAOXmyKT8ABfCuVxwlXjHwnKMa6iG6WcAJsH6?=
 =?us-ascii?Q?oiZo3hg4rCxLyk7Z6Zsud9U0j2Iwto875XOquySta42OkVXUvIJNsFAytVaW?=
 =?us-ascii?Q?tFBlsNVEDihQVWsCGNKj5LxKu4TvJecSCT0vVohRczGsZrl0hsT0BDT9UUCO?=
 =?us-ascii?Q?gh3RLt04Y3XalWlQYs6OmrUDDtomJ6UvJUzNzQLSfgZB/hoUZjIaiD6i1PwM?=
 =?us-ascii?Q?ATlQWWhPrQqElVXtthY548tZ18PFArYuKRa9oSlpHQ6k9BUW5omWOklyvAkH?=
 =?us-ascii?Q?P+/32Pn0rr4dZ4dIOXiDJspE3FymWsSl13/kknixFU/0mzlonWJG6gDZ7QOu?=
 =?us-ascii?Q?ZE5QhOWHQLWyX5xck/Yhz3DMS25ib0kx/q5e0upa6HeWkBb/PDdr+9GMlUu9?=
 =?us-ascii?Q?EY1qfbsrVMRdPC+hUnP2gp9KcTdwkZMM/pek2aRFQG5dQDXWqU1K898DwQyM?=
 =?us-ascii?Q?IuhqO4VA8dLVf8WRccjDlew8RPgx0/1qc5Vz+VjX32X8sn0tXrjGxpdqumWQ?=
 =?us-ascii?Q?6fu+IpYODiaQDQ6VI+oNy/BmgWICO39NR+0F2hyfmbpdwUEoDE0TtA3azuE+?=
 =?us-ascii?Q?0BVV6tvAz/SxOmaALga/84bv1hAxzOqsZN/OBzbuqlH2gyZLWseCzI38U5b7?=
 =?us-ascii?Q?GuZREyUnPfA/PA8z4BmsfYFWiTtSkd57yX7MkDAeWCUn1j6feU1gc1UOoCE3?=
 =?us-ascii?Q?NZupzBOlv+t42nuu5TSz1Kws9HcB2BDSJqtSUkhHbsBbTd/3/Eqc3osxMiMt?=
 =?us-ascii?Q?1ReatlKMwSWNKUsetkXAos8620F6raySpQEGbmQ0TFfa7xd/B6gsRtv9JtbV?=
 =?us-ascii?Q?qlcIGWex/X3qEPFxrf5eEmpqP9/lKZdU0UgUfTV8hSDrvEX5CVLuZvbfrYyE?=
 =?us-ascii?Q?GEYpQW11Atc6ubHr94H4VrrLr/d1C5mMQLQY+drtNGUNegJirfsvc0F/TE3o?=
 =?us-ascii?Q?xjo752zt6HBk8AglE8pt+CnvfvTcpJsT2pnzOcc1K49+Jj1i4D2YukK7SV5I?=
 =?us-ascii?Q?kA7zNJWI6I/alRURr+mOPuFo8Fi6FGeuRa4msMRFoE0x7tdNQmgyCtqk0db7?=
 =?us-ascii?Q?7UIuKr5vybx3qJmRa8psA4Q58D+3SWdQKKKBSExZVb8LqsuAi+HiMi8eAAla?=
 =?us-ascii?Q?DcTWvmf73/goroRAEpeeQ/X4xseHGZXkbdzC6K43?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1d6629-114a-4652-b861-08dd781b7484
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 10:35:47.2889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXx9Jhtc4MPI/Pr1oUj+pDAbnIcqiyHfUUXdlRZ4j4cQcbFoHZkuJglkOQ6tv//7x8FpZLcMMxzr1tSp13onfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Apr 09, 2025 at 03:15:44AM +0530, Mohammed Thasleem wrote:
> DC6 counter was removed MTL onwards, so pkc10 counter is used
> to validated DC6 tests but with the new approach of kmd changes
> created DC6 debugfs entry counter to validated DC6 tests and
> removeing the existing PKGC10 code.
> 
> v2: Update debugfs message.
> v3: Remove display version check. (Imre)
>     Update commit subject and description.
> v4: Add find_counter() helper for dc6 counter value parsing. (Imre)
>     Remove redundant code and update assert string. (Imre)
> v5: Rename find_counter with get_dc6_counter. (Imre)
>     Send buffer instead of sending separate strings. (Imre)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  tests/intel/kms_pm_dc.c | 78 ++++++++++-------------------------------
>  1 file changed, 18 insertions(+), 60 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 2491cd1f8..8cdf312f6 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -273,6 +273,17 @@ static uint32_t get_dc_counter(char *dc_data)
>  	return ret;
>  }
>  
> +static char *get_dc6_counter(const char *buf)
> +{
> +	char *str;
> +
> +	str = strstr(buf, "DC5 -> DC6 count");
> +	if (!str)
> +		str = strstr(buf, "DC5 -> DC6 allowed count");
> +
> +	return str;
> +}
> +
>  static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  {
>  	char buf[4096];
> @@ -284,8 +295,8 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  		str = strstr(buf, "DC3 -> DC5 count");
>  		igt_assert_f(str, "DC5 counter is not available\n");
>  	} else if (dc_flag & CHECK_DC6) {
> -		str = strstr(buf, "DC5 -> DC6 count");
> -		igt_assert_f(str, "DC6 counter is not available\n");
> +		str = get_dc6_counter(buf);
> +		igt_assert_f(str, "No DC6 counter available\n");
>  	} else if (dc_flag & CHECK_DC3CO) {
>  		str = strstr(buf, "DC3CO count");
>  		igt_assert_f(str, "DC3CO counter is not available\n");
> @@ -376,6 +387,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>  
>  static void require_dc_counter(int debugfs_fd, int dc_flag)
>  {
> +	char *str;
>  	char buf[4096];
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> @@ -391,8 +403,8 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
>  			      "DC5 counter is not available\n");
>  		break;
>  	case CHECK_DC6:
> -		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
> -			      "DC6 counter is not available\n");
> +		str = get_dc6_counter(buf);
> +		igt_skip_on_f(!str, "No DC6 counter available\n");
>  		break;
>  	default:
>  		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> @@ -417,20 +429,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
>  	cleanup_dc3co_fbs(data);
>  }
>  
> -static void psr_dpms(data_t *data, int mode)
> -{
> -	igt_output_t *output;
> -
> -	for_each_connected_output(&data->display, output) {
> -		drmModeConnectorPtr connector = output->config.connector;
> -
> -		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			continue;
> -
> -		kmstest_set_connector_dpms(data->drm_fd, connector, mode);
> -	}
> -}
> -
>  static void test_dc5_retention_flops(data_t *data, int dc_flag)
>  {
>  	uint32_t dc_counter_before_psr;
> @@ -721,40 +719,6 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
>  }
>  
> -static void test_pkgc_state_dpms(data_t *data)
> -{
> -	unsigned int timeout_sec = 6;
> -	unsigned int prev_value = 0, cur_value = 0;
> -
> -	prev_value = read_pkgc_counter(data->debugfs_root_fd);
> -	setup_dc_dpms(data);
> -	dpms_off(data);
> -	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
> -		  timeout_sec * 1000, 100);
> -	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> -	dpms_on(data);
> -	cleanup_dc_dpms(data);
> -}
> -
> -static void test_pkgc_state_psr(data_t *data)
> -{
> -	unsigned int timeout_sec = 6;
> -	unsigned int prev_value = 0, cur_value = 0;
> -
> -	prev_value = read_pkgc_counter(data->debugfs_root_fd);
> -	setup_output(data);
> -	setup_primary(data);
> -	igt_require(!psr_disabled_check(data->debugfs_fd));
> -	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
> -	psr_dpms(data, DRM_MODE_DPMS_OFF);
> -	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
> -		  timeout_sec * 1000, 100);
> -	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> -	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
> -	psr_dpms(data, DRM_MODE_DPMS_ON);
> -	cleanup_dc_psr(data);
> -}
> -
>  static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
> @@ -818,10 +782,7 @@ igt_main
>  		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		if (intel_display_ver(data.devid) >= 14)
> -			test_pkgc_state_psr(&data);
> -		else
> -			test_dc_state_psr(&data, CHECK_DC6);
> +		test_dc_state_psr(&data, CHECK_DC6);
>  	}
>  
>  	igt_describe("This test validates display engine entry to PKGC10 state "
> @@ -866,10 +827,7 @@ igt_main
>  	igt_subtest("dc6-dpms") {
>  		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>  			      "PC8+ residencies not supported\n");
> -		if (intel_display_ver(data.devid) >= 14)
> -			test_pkgc_state_dpms(&data);
> -		else
> -			test_dc_state_dpms(&data, CHECK_DC6);
> +		test_dc_state_dpms(&data, CHECK_DC6);
>  
>  	}
>  
> -- 
> 2.43.0
> 
