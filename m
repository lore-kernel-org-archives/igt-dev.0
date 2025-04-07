Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF05C36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 14:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEAA10E406;
	Mon,  7 Apr 2025 14:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTnxDAB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C18110E406
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744034699; x=1775570699;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=5lcMxSnsPQw0vSGHfh1YLwAvRvMqTN+JXOTpU6zrzm4=;
 b=aTnxDAB+qVvfpbyG2iZgAg/BE/cVs09z4iklCnkQH39u87XT6txQ7LOh
 C+B2EkJo+0AZbygLgGRt5kyUhPtb9xxbW/PQHKwFiMpQgX/T0rkJFw7v1
 +clw/4LuWOS4vt6fbRs8u55InlKM6/JZNOgCRpH+TJsq0M1nTVh40+bWA
 lDbZHKn6vXc0+Qm+uzJzL6fAmdfIvjy6ogEdrqKVbxyrhF7te1geShUf7
 Lfygcv722D4z+twLQ0xPsaG0ddUvns1NvoOiH7jliZvjUVJ4xRjsTbMKI
 XFFcgoz1zNI5etuaXvW3xT/uKzMcEPQW5oNe+yiQ4TyUt9yYhXnLb5cYB Q==;
X-CSE-ConnectionGUID: vT+83XP1TjWerC77P6o5pw==
X-CSE-MsgGUID: 8Iqll5bnS82Zuq+2QJJ2sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44668776"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="44668776"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:04:58 -0700
X-CSE-ConnectionGUID: q21/0oq2QaaxE3AQLh4ZFw==
X-CSE-MsgGUID: ZX0H1nbfRW+kFuIukpAanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127971374"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:04:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 07:04:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 07:04:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 07:04:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6F2/GlPi3rzFth2zi2v32i+f1HtUdOwIf07KvsmwacuiTRm40xS7um8bxBgBvI68eH3ydo95EMGiKZNAPCP71JhFwW0cuDM5UOWlQ2XejD423j2D+ux4Hmavt8lAh4UUKhN4CwQHygloZnJHA7/M7skr++gkU5Q3mdCNbgmdnDG+RAh9eU8I0h8bdLw/Bi5tRgtkP3y1Lxci1GaHhRDT7/5nZh2+NvTwhXhCeNeEG0qoi4GgqnM+/6mVSMFLtpj0xFXD7FulG8k9qC7b832/89cgFkA43dpYefKZEfxL99DWtyuN46Pt+Ezo241Z4T2KXzCMZc7WxgGnakjmEjIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQbsdNIhDlmQI1NZ58bqSFDKSbi10qYzQeyd15YLk+U=;
 b=nk3CqKP7nT1PzjnPqE+xK9LS/byc+KONA3RA0bmZZz9O9eZPiXZpISvmTjhoTZTeW6CvrSzG41BDO11rwyJ3HiiT4b0PQDlvUU++tKKMKUJB7vvFgTyakVtZDE3+A4XxLN2V8QkBV0arF8CFxAEOWSMRLmrqzZD+6BDBcmbUMk5t4m4zPyrr06qKhR9cuXeuwHuUjRxcLqRZzvi7jZZh7jRWOj98covKHc/PSzAuUQxCQk6IX8xT0R2Qy0EMiB+QYe3OBVI0O/6BWTdZp4OQc6E+YhB8vWWjuqOLoYqZUUnIxDXR9xK76QabfVGfgCGTrT3lmltQhp7o9iFHDt6fbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 14:04:55 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 14:04:55 +0000
Date: Mon, 7 Apr 2025 17:04:58 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4] tests/intel/kms_pm_dc: Remove PKGC10 dependency
 to validate DC6
Message-ID: <Z_PbimkZoBkaKDCN@ideak-desk.fi.intel.com>
References: <20250217170809.175276-1-mohammed.thasleem@intel.com>
 <20250406181509.80310-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250406181509.80310-1-mohammed.thasleem@intel.com>
X-ClientProxiedBy: DBBPR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c810bb-6415-4b05-19d7-08dd75dd2c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZKQvuP1/o6Ba/UQ0Mw8vzRnZnh9On+hDb+JDoBbmmCGUeh/vmKW5BfhOtgam?=
 =?us-ascii?Q?B2WbDjOypjoh7YhD/RCvJIb8FpKAGpLeNBbvKQW16B/nn8zB/raMrWHdLUu/?=
 =?us-ascii?Q?IYu8Sl+uR50xAiP9fAOkIjTDG/c2etQ2exFPKoVbLXyR8b3GDkJZiJSR+joG?=
 =?us-ascii?Q?Z2Xfn3x8luAmcP7Z998iMTXCc7xT+JCEzxjzjCE/cwtqXtXjJFfBxcBwFcoc?=
 =?us-ascii?Q?9D+5UHMFWNr6tbYVRsRd8JPjK+NXZFZd3r48/c5kyZnqBnhTQH7CdjlIolw1?=
 =?us-ascii?Q?mcEsrmbnesLdqdn+8j81JdwW6qFFqXBxYjhRj+8zIxCoz8Td9cMXhV00YLUt?=
 =?us-ascii?Q?fupsw0phnqKLXxxQjaW4qceEUdA7wIGlyl6vEzjmzYd4HJVCqXdVV8E37feb?=
 =?us-ascii?Q?STUPW9fLtAhWErXS/nx1ZwySlYymFGFWODwJ2bZLr1rPtLjtvlBOFEYWmi64?=
 =?us-ascii?Q?keu77NCBkWwD8m/HUstmuVhqmTRjVvZB+owqJbmzjDXJUxFMzlLtY9WBLw1W?=
 =?us-ascii?Q?7bY6wBRfzEtepuMR16XuQ1aUhguAFIjN5vkWtO0aqigDIIg0dn3zeKJXNxzQ?=
 =?us-ascii?Q?MsGgknpSBCmK9t/UJlx9mIRdXTfshBrr4v2Tgg0ig1FHDG0Yc3M7fhxVNHx8?=
 =?us-ascii?Q?eosel1rMPR4JexrnoK4mdpfIYwIyT79k1HWIbQVk6koZGWrGrV5PsBdvSs7o?=
 =?us-ascii?Q?kiRe2CcpNaH+pDfrpao7gD8/nX9zABw+uMIc+lsxUk3v9g+aSn0UDoZ/Ohup?=
 =?us-ascii?Q?xSd/aPdXsecZQvjt5BaJ5fhfhg8LkgtlICt52VnO8DdLsV54mtgcpR+iyPv3?=
 =?us-ascii?Q?3RyE3XkqkELFDMtBHFMvuZ6VJmvp0qlwjdJo0qIL9eq+ZxhWjGVvFTtAiqI2?=
 =?us-ascii?Q?HEmsXpC09KQDjNRYBrseyWFFtPwBNOqzH7mPf/1FktpY12eFOlL3hj8K1lAh?=
 =?us-ascii?Q?HCvNPrSVxKrmxUvmq9VPailgzS1Vxwy+2c4TmE6I3AFQSuz8JCaeU+67zXCw?=
 =?us-ascii?Q?w2hF1YH8Z/II1pMqvmDIPu6LoX9yu6bgOPCkbt/Lvcv7X7GVLa3uorkbf+Fu?=
 =?us-ascii?Q?QNdNm5TCUrhr3XAqnDzZgq6/uZFfB6wHUQraOmCZB/ubyD9iYe2W+mupud8E?=
 =?us-ascii?Q?BDoio4+g6Q260U0UFbIum0W/El4Lq6zphGzNHJC+gYTnO7YV3U2WAfiYzcgE?=
 =?us-ascii?Q?BYAdlngJbSWqGIfGLFpKcU9v2T+YDjNPXK55W1LHY7iJb6Y9qrP9XywLo+H9?=
 =?us-ascii?Q?aWLQyqDFYOVybYladPb3lHqIe8Tb3GtX+ZI4FgLuOHGYz8B93/X0K8FcPyG7?=
 =?us-ascii?Q?AeXO1LZQTWAUJZ3yqW0mAbO3ZKfwvaIPOeUTMZxEbddHcppn4jRiLOuIoXed?=
 =?us-ascii?Q?X+1iIp3IBS3vHqNCZqcbMKB1Y4TL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ve3zwmaRfF8WfHGsLKwoFBLlI71yu5wfiMLHA/LKZ1GUBd+V2+CpN/Olc09?=
 =?us-ascii?Q?lbEYkgxeFMAWUjOJkP+fbeVau7Iu3Wsq50PooaEkwJE0H33KgbOISWltS5dU?=
 =?us-ascii?Q?UqpiXLwZlkSmAxHIYo0ZqSNVmUeKYcW1rdUgHC/u5VrfDDfypXTN8arfkNGV?=
 =?us-ascii?Q?wPBtefeF6VZHIEsQffeGuf/EUVuNgHiiMU+edDShMhe36++2gSnD5BnlABxv?=
 =?us-ascii?Q?PgeuAsHeyTCXmS5CK+O/nyPRSQK1mgj2iaVGoLJUxvzdyhFlKqs17ghowqcd?=
 =?us-ascii?Q?WdpuMWhLzq/WNWM4d1iRVnqKdEBUBUTfldOKOrulF2uh4UaJ5XJ42idcDRnm?=
 =?us-ascii?Q?+nIlMiqxrJm6PZQ0m0tPgsHyZOD0vyIAoTdWP29YxkdPP1pnTvddA81jiouT?=
 =?us-ascii?Q?bRIuEX6IF1BqrwC2twFnzTvCYEUoIjRC7PTl0reVAfr5NItD1mbWWy2oo6U5?=
 =?us-ascii?Q?6CCLY8lb8svVAEJZnFA6lhsMWoImb3nZMreLyZnxoY3zz5MfB24fQr+NALO8?=
 =?us-ascii?Q?e5yPWbXaTmCbzfy4y3m+MK97hfhIRUUAtIhk1okjVFHJnHmCPYoYOvhOa54h?=
 =?us-ascii?Q?YOWPmFxe4temFYF1m2as9AqWC3LXpCx9zMTpbCbFbb1fZfu/1Kff0R2kuVZO?=
 =?us-ascii?Q?GXItaTofa12rI28ljNGmS1uafopl0OgPBum8Y6p/cjuPR7m4YH7OJiU3iOmP?=
 =?us-ascii?Q?pnBBG1OdGID3DekxHTgOqFuAKZBFsMDDXe2SyE5kw6JK1ZT2u6Pk04oj8ljp?=
 =?us-ascii?Q?34qMfzCGtQGsppWPIPCeY4DuWtPRFLC/wuMhynjY6o2avE9HeRBLkl9L6t9K?=
 =?us-ascii?Q?Zrz1zTObxg/x7/zWmPKGf7/tvxWbfFjTsWj1gjgBDdLfWoZlqfEQXz91aKzn?=
 =?us-ascii?Q?Samswkfa/+UoHh0RHKucBolaA0fuY49PnZ2VvPRRmWOHkO+yyIVQ+cUc52J3?=
 =?us-ascii?Q?oN/I4VFwpDxP2uqW5UNqnfQtAHXPsvL0ett/QMzVM5TduQ4DUdV5F3aLisca?=
 =?us-ascii?Q?o22orkegMJEbcLEPP2s4OOMPQYNDsf8t6AA2480YnfnV5/0R8RNTp/vaKRyw?=
 =?us-ascii?Q?mdVcIbCIjOhKCJKhcn13mlscbhgof5PKzJKqTc9ReGn/ce6EeSxeHJFd9Hby?=
 =?us-ascii?Q?+ffqY5QfuhaZXqFMSeqryNOaQrfAqdaRImsW6ZHrBsaFWlNmgbiaufG75GNZ?=
 =?us-ascii?Q?di/gnEr2pmhR6md7pJyOpGPHZ3kGkrdeuKXM9nbQ6O+/YLOFg1HYQe8bqOpG?=
 =?us-ascii?Q?DJRd8nrqW+tIywFzTEXUpmEzTzVWldMx7n5XILaIOJC3e+n02YAugjcWBnK7?=
 =?us-ascii?Q?3UfVrNFlabzBkkKcZXHvrPcGnE3jFCBiWXpmZdkZLWZo7luuTZ5xo92OAieG?=
 =?us-ascii?Q?oocQ/XlqiCdVO6eDfwhLX5TTP6lyYvSplFEwpyTXOzg7qx0li0XrknNb2X2T?=
 =?us-ascii?Q?yOUvWbMO5ViK8mbDlHCc7v0GyVEzsMUG4icXCZ0ZiZVqyZKY85+vzafFRX1E?=
 =?us-ascii?Q?IXKrrXCubgDFsk+tdrVojh9eip7gpkg4nPizeIzYzJ29csBMS0fM+KLUOZs7?=
 =?us-ascii?Q?mMeID25rPEB65ajzIMYP3kv4cdZRgMmJnNXqct8V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c810bb-6415-4b05-19d7-08dd75dd2c5a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:04:54.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TiCeIpIspfo8OB98ZQmFgHAgSzt8YVfoVvZXLlcsvFfcldAj9UwI5un7d7WfRD0KIMxXzm9g9Of78X+pUaigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

On Sun, Apr 06, 2025 at 11:45:09PM +0530, Mohammed Thasleem wrote:
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
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 74 ++++++++---------------------------------
>  1 file changed, 14 insertions(+), 60 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 2491cd1f8..29f1903e1 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -273,6 +273,13 @@ static uint32_t get_dc_counter(char *dc_data)
>  	return ret;
>  }
>  
> +static char *find_counter(char *buf, const char *primary_count,
> +			  const char *allowed_count)
> +{
> +	char *str = strstr(buf, primary_count);
> +	return str ? str : (allowed_count ? strstr(buf, allowed_count) : NULL);

It's not used elsewhere, so no point in passing in the primary_count and
allowed_count strings. I meant moving what you had inline before to this
function, i.e. stg like:

	str = strstr(buf, "DC5 -> DC6 count");
	if (!str)
		str = strstr(buf, "DC5 -> DC6 allowed count");

	igt_assert_f(str, ...);

	return str;

> +}
> +
>  static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  {
>  	char buf[4096];
> @@ -284,8 +291,8 @@ static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag)
>  		str = strstr(buf, "DC3 -> DC5 count");
>  		igt_assert_f(str, "DC5 counter is not available\n");
>  	} else if (dc_flag & CHECK_DC6) {
> -		str = strstr(buf, "DC5 -> DC6 count");
> -		igt_assert_f(str, "DC6 counter is not available\n");
> +		str = find_counter(buf, "DC5 -> DC6 count", "DC5 -> DC6 allowed count");
> +		igt_assert_f(str, "No DC6 counter available\n");
>  	} else if (dc_flag & CHECK_DC3CO) {
>  		str = strstr(buf, "DC3CO count");
>  		igt_assert_f(str, "DC3CO counter is not available\n");
> @@ -376,6 +383,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>  
>  static void require_dc_counter(int debugfs_fd, int dc_flag)
>  {
> +	char *str;
>  	char buf[4096];
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> @@ -391,8 +399,8 @@ static void require_dc_counter(int debugfs_fd, int dc_flag)
>  			      "DC5 counter is not available\n");
>  		break;
>  	case CHECK_DC6:
> -		igt_skip_on_f(!strstr(buf, "DC5 -> DC6 count"),
> -			      "DC6 counter is not available\n");
> +		str = find_counter(buf, "DC5 -> DC6 count", "DC5 -> DC6 allowed count");
> +		igt_skip_on_f(!str, "No DC6 counter available\n");
>  		break;
>  	default:
>  		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> @@ -417,20 +425,6 @@ static void test_dc3co_vpb_simulation(data_t *data)
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
> @@ -721,40 +715,6 @@ static void test_deep_pkgc_state(data_t *data)
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
> @@ -818,10 +778,7 @@ igt_main
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
> @@ -866,10 +823,7 @@ igt_main
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
