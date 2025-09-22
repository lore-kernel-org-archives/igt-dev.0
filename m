Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D5CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 13:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F1410E460;
	Mon, 22 Sep 2025 13:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jqr06sDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31B310E460
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758548394; x=1790084394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=impcAmLP4kJzAk0abfnMpvGppvxIdBC34e7qJjtdaU4=;
 b=Jqr06sDq3xbYsZqtqv47IsdWK2w0OVRnhMUWe5nW98ntbZGKFyKHuG9Q
 TDdrmpUWcyh202L9ijaFaApi+eyVwiaifT+Hre+XYj0qvWyQ7Jj8Nerz6
 zKTAaGc3T1hjYpnWDrmB0zs3hnpQunGlMSSWp5/UUjpOA2HzZbmJk6bv0
 bojWoIHlT6ngGobrRx4W1qzqALAAGK0hLzuFVR43fzg1gSZC0Y5XBiHmZ
 U8p/vksEjR7kHzPmG1v0bDc7g/AdpfuIOJRqW1+VLlFrJ0tEbekicFYBY
 B4aWoijVWEtnysS7mc1iEKon86/ZVBma+K4MbT6bL9enyIto8swq/suwl Q==;
X-CSE-ConnectionGUID: xbarxPE+Sv2KP3TKd5xUDQ==
X-CSE-MsgGUID: M39BbDX7RbKcDGIvPJjdQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64632442"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="64632442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 06:39:53 -0700
X-CSE-ConnectionGUID: ujxBWRSKTuqQF1AeVT8G4w==
X-CSE-MsgGUID: hqbcwJprTNO5OkX+ogwU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="176862087"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 06:39:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 06:39:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 06:39:53 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 06:39:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1p9l+BjiBN9hrYMG3MAF/PIsmRVpa0yGojYsfHVNvsBXtR/6GcfbFL0kbkCZJHNezf5vlzbFhrQBovSH6dlAbNczKC5ZBVxNjvpx1d4UHHx+uKm1GsNMlkkuYNq+TzZpNb8igq3ea9oiYrG7Ht9zhzo1ZZdYLGWBMi8LByMMlH53eWR2F+4310Qt34XgP9X1I45tgtKL98qQkEKwj4G9VDHWPIL82MOPq955IaXcmY0asGv0fpjC0egZm9gp5nSPn7wEImofY/pGNEorMQrm6ZMiuwVbbbhaBAeX6vuguIUgvu3qAAaLqZJnKfG2U1WWLUFfbgvLvO/hMsZeKz3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lWWPVug0miYOZPAxCl/BFaK+5bERqEFwrOzZBOdmIo=;
 b=NtfQEyg3JjqnMMbMCwzi6S8HfOAoz8yHxGV+dCEQM5tKBpmIyxZOLR3FhNlaA23I9iADUtiyGC7ktw0g90T8RbtzEHZCX3fPTRBefZJiZw3hOcssMfLtSm1lr7PEwvaVMtEWJ8Sx0uaVFz9zwvwpo0S5zsz4RsZRmGT0ZDBJiauvupQt9Hy7CkSMw/ek0cGO/+/DIegLNWIh3nUsynT16Z3fy8rLOOy0GRGBOd8r9h3uUBgJxvTmHa6dlGuxJZ0HuIPOncCVBmaa7oa+Pu4AbNb5AFdB1dQkmFg1Q+n1qpbA2doZti5IogmsdcNROqLjrjK3oCqVNuA8WtGBhqkBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9015.namprd11.prod.outlook.com (2603:10b6:208:57e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:39:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:39:48 +0000
Date: Mon, 22 Sep 2025 09:39:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_configfs: Save pci_device
Message-ID: <aNFRoRZwsVrkMwsU@intel.com>
References: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
 <20250918-configfs-ctx-restore-v2-1-5df035e27e42@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918-configfs-ctx-restore-v2-1-5df035e27e42@intel.com>
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db23750-0d8d-4676-5d11-08ddf9dd7fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1It5//PWJw/cLBHcavLK5c9gq7OEvD+eVMQWwyrqiESB+94j5PunpE4Rb5PP?=
 =?us-ascii?Q?QO587OcpC3pWsptCkxWI53i7G2JVRGm0XEnnxG0u75eP+VtJqGFzUZxfnL7I?=
 =?us-ascii?Q?EQO0fU4XuR0XTIIT0Pufe/CbkugeGg3dxlaibn/NJ9qklqGglWIvs8BZwBpd?=
 =?us-ascii?Q?qyhewPIAPaW0PscFM3UyG+3JTeiqq9h773Y2QJ9YqtNlk9Tx0ybMNfRBrL3o?=
 =?us-ascii?Q?ZyWgRV3N8VVYwz7RIgkekNBLeT6rougx5Nc9I3JzfjxvLGBABFou0BkQ2ajq?=
 =?us-ascii?Q?sHrY4Dsasc7Y8latvWTsfxFQ9CVqU+ykeNgglQjENLDBeEjMTMV2bK4iPDpD?=
 =?us-ascii?Q?4hVPwcRsrEf6TSI/3fnNAds2SMjkci13v16R5Te+QLKmvKaGspxPxMRRiE5u?=
 =?us-ascii?Q?QoRduW8ANhGr//Jb1emoLR4lk0qdX4DBQqn6+rplDc+y6HD7lsH6/F3Ilaxk?=
 =?us-ascii?Q?jRtXH3tCYpwKWR9fd7ciSdHsXq4n5PusxWioSSDxk9kLOrH6UqTEL0ofZ3ay?=
 =?us-ascii?Q?Da9KJSIQAgg72fUMbPIzpiF25gj3PA9WZ40Nt4CFCd05oHKODZJGq+tZO99j?=
 =?us-ascii?Q?25FFeRW3Y6SxnMGZ7BwOtXvZgXt43YJxKjvraHem8zgtI1bW5gfxPCUAJvEv?=
 =?us-ascii?Q?Ise65LBdLBDs+Yd3sxb81GIZ5bEWSq4xG5/FvbSJg02q/tha4HTBDRdjrAxo?=
 =?us-ascii?Q?aK9Bz4pOUnjf5ex49DqKtjekEASEsZx4X2TTZtGJpUIbdTPZf8QWmVmNqiKB?=
 =?us-ascii?Q?GelLnnsxRlFYXAbOZEelIPC3+syccCUrI1NrPIQXL+OU2l7ecEtUdlwA0OBc?=
 =?us-ascii?Q?41a5WLKlRfTC9Rvf27cRKmCaS8bwJSrcyCoXTPt+MmGnYBdzBJKlnCfLsv4W?=
 =?us-ascii?Q?jPCmp+1ifUmds47NSvTfjzt32N558Sk8viJBGTEaOc81oHw0PA5MMV5bacIL?=
 =?us-ascii?Q?DCjoKuYdtICkqfK5+9mw7HEKigpTmstubrFUJ4+EHscF+t/KDBPzntE5VTqk?=
 =?us-ascii?Q?kazBGW5PulvF/oBKEMpfKko8Il4oCQSrLDwR+IpF62HpleyZcKsljMOYZ/zd?=
 =?us-ascii?Q?6Aelc3hbvGSYun7RCcNzO9Qx/SPZ22DGTuKKxbBLi7AKWoYrL+fnuhvxMqWK?=
 =?us-ascii?Q?Vo+Bgj9Eq5FXeRtCYoQmTV2u1VgmyZ7uHTi0clHEwv5ZdlrqY52vzbCu0x8n?=
 =?us-ascii?Q?axlFtSZehtvGCIgcSal35rd06xVhEPVIF9W8TPAa9i5/LppazXVnusotKxMz?=
 =?us-ascii?Q?ctRDD1YwO7YRsUx4U5zUcKCoDxbRwDpsr2qUNxHH3qX0VaVjkH4js62wZ08v?=
 =?us-ascii?Q?Ca3cxp0ChbO5xYC9VXoXs88XKPEfWvkdTUtb82VQBtogiW+ODWzkSZaqjFhp?=
 =?us-ascii?Q?DOjRWowDYlFVPm877cZ9rpWdXvSVnujvop+T5iSfckfeQDYW64DYsgoqse8s?=
 =?us-ascii?Q?Yeui1edXTO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YvpQa56f/QZ+iijtMEsxZqK3j9e3Ydld4T0qq0zzl92gVPlgqQMRYHTQ38kS?=
 =?us-ascii?Q?QtYOTE3Mc+vADvLMmmT5g8aAcMhXVKmTnzSyHiWyR4759uV4T1Jk1ZdP8q/3?=
 =?us-ascii?Q?O/re+KHaid6Umo6JZMNHi7+3bBghL8LZyuc1Sg8T3PaAZoNL7oUXT/9w2FJg?=
 =?us-ascii?Q?zWfJYT9gVn7M0XuE96AfNDx9Gg8y3fcKQ1ttVoQL+Mi73Is1umoCq7KTZF4n?=
 =?us-ascii?Q?rhLPTUuiAUBBKV2PexoD9mhhtfJUdY5C0O2CoNL3vh5AiFlmimCFiCiB1/dV?=
 =?us-ascii?Q?dGZ7KqCTd3b7+rchse2xCN2SDHyBGAta/msmIjcOYhVOaI1NCymxMH7pyPBE?=
 =?us-ascii?Q?+zfMww00QvqOnidpj/pAzkcm4vrkBw9KEbxO3RsLwKVb/tMTgpBVtjIUlWBp?=
 =?us-ascii?Q?CrkHrSJqIff0o+0T3JoM0R2/AmT85ueGv+uJ6CI4tGZyyMV0QFHMD5zSa8bm?=
 =?us-ascii?Q?BODGYPFfl8alkTBh5OT6F55eMTtbH/7DhCN9DPwdkDdtBz1YH0FvszGz4OBY?=
 =?us-ascii?Q?uE5ZxzfoB5ASf7oNehHa71jGb4mokyFhrJo5qrGHEufzHEydh36EIJSwkdmW?=
 =?us-ascii?Q?avgowfSU8WxfUgzEvsx/AEaLwY903B+x3EacvpiHJ993f+rqTXOAb/F60xSL?=
 =?us-ascii?Q?cYoEs0ZQKd51+EUzFP7We1Q8FI2JjBmbtXIUXFZxflEt1kd2O5+EAGf+st94?=
 =?us-ascii?Q?yYgezaG8NVhpvFdlIV9hSu422dOAzpe4LkHQOMfwn28Ng+T2tAIiK8m6LEb0?=
 =?us-ascii?Q?SX2qp5sAL9x28n/F9/fWaDok8/2V7C8ADiL61/ttd9LCQHXdZ+OG6ndM6dxY?=
 =?us-ascii?Q?yHeOa8Yvbtiy4GvckMQaZFex+/krj4EXPXpICRMEPiSfS+gte41ESAGVswzL?=
 =?us-ascii?Q?QpYmkh6KE11MhACep4PR+bSOIhvn1M8DKUY8uyX15VK5tMf0iSF+mfipgioz?=
 =?us-ascii?Q?7BB6nk99U+jagvN2uVolO6gyYeext5w+ncmA2+D0TovH0vASXeKn4aRKdUfD?=
 =?us-ascii?Q?RkB9kehQWH3CfWIYt0oR0cPt1UAcwyMKAhJVilb4hvdsxrdNrJ34wEikyAKw?=
 =?us-ascii?Q?jNRAAVlV4rUr3e3gsFcDV+vpK0NnPC+9kc5UvS0saSYwNCxlgNs0tygIXMU3?=
 =?us-ascii?Q?TWdZZCNL1W6W0fB8zZYOFsCWDmcD82RNBVn9O+tk3ZE8XbAiORN7sjJk8SIQ?=
 =?us-ascii?Q?1Klq0JU6byK6CcpTW3CakUXsSa577kfzYWeAXvnfvy1ar9dSTv6r5hSJr6wR?=
 =?us-ascii?Q?iXnOBf9KlFyf4n7w8aiQjUOpicXQY1e3ZiOd/64CCV229MsRU0XKZ0G+d9do?=
 =?us-ascii?Q?D09Y/exTW5jHvlsRBHKzCaI/hRGzstugGMZDbqQRZbGOCX2IoxaFdc3uNQUy?=
 =?us-ascii?Q?Q1PLhhnQCmi9c3+CJd1JHv0ZOnEtItHK6RF8nslRFNWwKq5nR4yGQMkcqVjO?=
 =?us-ascii?Q?PgrOS68yIhCrg8LcANlg4r24k0x/6HPczlUqMtHN77diPkM2LFeP9q19GaXr?=
 =?us-ascii?Q?07IMVE9RX6v5b9kzY29UzNy2Nvqpf85pyFXZ/hR6fnJerQ9nllDJprNvsaom?=
 =?us-ascii?Q?g9V/a4Fna76CuXKqnx3x3tWtDm64ZPTy8QgH65Q/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db23750-0d8d-4676-5d11-08ddf9dd7fa8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:39:48.5354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1imtSyqqW5p9wnCw5kbVosUKQ5r+mbonsIE9EQzXmYqTBKt4MRIWwID7ok6OJttkI1K+paGL3e2l7TvhQIDPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9015
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

On Thu, Sep 18, 2025 at 09:50:20PM -0700, Lucas De Marchi wrote:
> Just like the address, some new users will be interested in having the
> pci_device cached. Stash it for using later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_configfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 27426b52a..794c76132 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -24,6 +24,7 @@
>   */
>  
>  static char bus_addr[NAME_MAX];
> +static struct pci_device *pci_dev;
>  
>  static void restore(int sig)
>  {
> @@ -125,8 +126,6 @@ static void test_engines_allowed(int configfs_device_fd)
>  
>  static void set_bus_addr(int fd)
>  {
> -	struct pci_device *pci_dev;
> -
>  	pci_dev = igt_device_get_pci_device(fd);
>  	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>  		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> 
> -- 
> 2.50.1
> 
