Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B522E7716E
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 21:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48210E18E;
	Thu,  5 Dec 2024 21:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="np0KXOkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C40C10E18E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733435411; x=1764971411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9fxU0Dj2/1iemFqvKKUVzLGF1VgtaJ7IjSBN3aZ/bEY=;
 b=np0KXOkzKf2yD9V60yyfD+7G5LefcUTaQ2VNjbLBAknATFxRCQ3ZC4Gs
 xudzMBpyDMz/SzuotPq2FdbSNHraIa6lu4ERinSNbHbaDGBSrkjmnyQRC
 iDYp5uIS2NOtYKrs38WJYBuQlRGAaG8PFeAV0evVvrS7J/OM0zcrxZMBz
 ylkkPiB5YDrUNCAZ3WWi5EgOqcJSWcKmA/lOBDQvyGeDs2lsh+WVbjggM
 tFFDsWXV2dcA91iQLn+4jMPr97Fyh/Rq/9li7KX4w32FSETIjfiKtUItP
 jzdlVsGh8Nb7nsmKuIeBoecq4SjP6RqHxwsW4JAEM0PQpF71fxCiCvDI4 g==;
X-CSE-ConnectionGUID: TmPoKFlXTUuI7PHZIiCLEA==
X-CSE-MsgGUID: xbuRChhgTq65RA7FVGgMsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33689745"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="33689745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 13:50:10 -0800
X-CSE-ConnectionGUID: 8an7UO7mRpuCx75RhOnIrg==
X-CSE-MsgGUID: vLV5WrHCSpaC324/cmy43g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="99041651"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 13:50:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 13:50:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 13:50:09 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 13:50:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMYlRllbqzNUnAJz43HG+5JCrRo0zlj234WakF0aLC7gQgpmGKdJeXr124nZAU1M4MM95MhdgLFKZ5yRYYIdtbDF+TqA4VoRaHjEwe8ipnDZEmQRcehFOXa+BQNbQP5rMEblNrw0xQ/VeR7RaczJVu4BcSwjgBUp6tcElvMNONd6dShxysggNi7Q/2XCdNAwUA1B7IZdK5/cL+lVgWTyHkFOc4iSkxCOYVCFNfZ3zRuBEhvpQLIPeb60q89TOlRaIAwSrVZCGrB5vax7H5cl6/LUQaXHUA5g+8kaOEti10Q/fVp/ZL36DJGFBWHHFB5Vb2sLLsEgTkjiVOH0uTZqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDpONRt5jE3Q3MMuwWg5LezWrwU6dTeUIxrgmXNaoNc=;
 b=tV2eBthyLmPlqhWHYucMF1o5e9gq3cvckWBLFc5YLygf247qUmZ+fINRbmugQp2/BJ2Jk4G3mMh20wcjQmvlHyXfxDHcCp34EGYDK84zoG87F74wtfgJxavpl59S6bc2gcQLTgupwcr3u5vflB/A1GyslCMqeAGRQOZ6kJjrAlv0ISNBxFL3f+3RWURBmmhPv/Y+/Mz2kTuLrmFPXT9yyCM1Ri2AZwyApEeTfFEvvZHgl5HYmxHbBcyy+serKoyVHxAsqxV541CLSSLYxgQvgF/4t0vtTF3LNZOr7ENgMHBEEP9Ey6EPI27PmSRiSSKiDjNISTxcqg1+CYELgYy9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 21:50:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 21:50:02 +0000
Date: Thu, 5 Dec 2024 16:49:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_pm: Add helpers for hibernating kernel
Message-ID: <Z1IgBqtKWdkMycN-@intel.com>
References: <20241203092418.3454357-1-juhapekka.heikkila@gmail.com>
 <20241203092418.3454357-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241203092418.3454357-2-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MW4PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:303:6a::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4d0bae-4175-45b0-b3b7-08dd1576c582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pColM3EH9hKW/wemwX23nsg8UePwnxp5VEVWNEbzNRDp7TTisLhA23i2e/L2?=
 =?us-ascii?Q?vRllLE/1Zq6z0k3gFSk1nhx6WiE/p8kLwno+YR57IViGHAfnsOkHXelSHYa2?=
 =?us-ascii?Q?T75Ezfwob9SjFxsOVQvfS+Kl4ieieA12TzK5xv39FJiA8M9tHNzNs7XPQVDU?=
 =?us-ascii?Q?LrD/0MFQGDpPVYZbeNjsVlWBM/ma0CRUyCS37JAF327jlWKECjN9LZOOxvGU?=
 =?us-ascii?Q?jV3lpFPkEvQPPO7uqdONAgzEPbRlbouoqcpFbI6kH1Q8G3rvIwooisHbHpGo?=
 =?us-ascii?Q?PHcktstH56UEi7pUh+F5NuPvM6It5LX+LODtx9WrRvuO2YpWB9T20nr6Nm28?=
 =?us-ascii?Q?DqcMRwAhtxPs+9cMq0GhE6VQ4uWi55MD3Y2nLOCmTAnn8sYHkIJxdITxz1bR?=
 =?us-ascii?Q?/bnFFIG1ucQaUKtGIFRW+A0NDBUN1yZ6LoVxvcMdtyPmkqReI4Ow5VPo8VjS?=
 =?us-ascii?Q?oAwj5gHfB0rP3K7TqlQHC6yW6s3ZaO9JOoRMBciFCtI4H9psI/gUxWU9iuOw?=
 =?us-ascii?Q?7hesqrRUL1CDBZOPh0HjxCh9/Nro4WmLD5iGwImoSZGWfecqy9kzAEdEYN2n?=
 =?us-ascii?Q?IQINYSehCQdxiqbOW5g2q4AP/JKR3D7UHktRAzil8VJ29irZSW+4lzPhdafc?=
 =?us-ascii?Q?Vw7JCRC/HDxofs69md7ZXmOwIPam663itdUfE18fkWaYONHjY7ZMmwON3rtV?=
 =?us-ascii?Q?w0+xsWCxqSm9j9INTHBrCUfQMCA3hL6ASBn/xdxZf6doWKgCJPc1cuS2Ct3j?=
 =?us-ascii?Q?agYsfqEG2rW7/462UMl+3+M3T3yKFeoMoijYPOp4+cG7FZDX9qrKO4sbmmEy?=
 =?us-ascii?Q?H9u5pmd+C6Ozp2/GDGXVvDJc5aeJRK20ItOB5n5vLVkvuAYpaOFEcrKB4vZw?=
 =?us-ascii?Q?jRwdFUY4OE9W0KGbIp3g4qocUZLVvV737KMpO613sQXXdElyNXcYibewUjFi?=
 =?us-ascii?Q?TbEVLpVw7AqI12Bh61v0hAJFlhzBW5aRTyMFcuavFkrlOXM3s/juosE/IQG5?=
 =?us-ascii?Q?KWJiKhAwdNIlMJ81XmkbSNmCMTghsLNN72lgmrRPLvitdAA8B3vIyXVilKju?=
 =?us-ascii?Q?JrgDg1HGu+g/gdX/DqgD68KmOaxGubOwkv8VupZPIJROxlOJ9DA5Oc/cgCBr?=
 =?us-ascii?Q?avC01lOagVC/p/+Q1tKnKtwGvX+Un6ztIjX7qKlLSpazsD5kyzVzywM8ZTga?=
 =?us-ascii?Q?FmRp87uI7XJP/CIePTHLwi9u9PU9wQkmPV8CIPNb3JAE13hmvEf24L1qkjEH?=
 =?us-ascii?Q?yk1EhM1qGXiUvadHEEJJ2DmkY6MA15FpTW8u5ob+R2d4wL5oH1nR6yxdVKmb?=
 =?us-ascii?Q?gCH/Uoi+qPBPodnFy/TvZaRCJvSyY5KbYjN2hwVX5u661g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jj6EGw0r7Ayk3/gacSjuAlpIt7tyPa/4pcFJW0pIu4Q9luuhcGMO7yX54omP?=
 =?us-ascii?Q?TDZBHL2H85a7CsJthn5QzcN9dKka0FiCRnc9FNOUBIVFF/jIaCOYbz4DSIpb?=
 =?us-ascii?Q?oa1mYVB/BONb/WCQelvR1MjW8y/sUAnI4UDUe4sqKnj+ReeAtYQwMamAqdmu?=
 =?us-ascii?Q?4eq4qtg/osh1tZkWfIE1tqOGDAk4inSsCxB3lxfBlt/7KrprqE4CBB8ggk+7?=
 =?us-ascii?Q?qH52Y32odEUxMjLCDKpDsYKzC93JrXzznDIHRPVarwl4mEc/7CtZPN5sdohB?=
 =?us-ascii?Q?dodRQtI6ZyY8NnNuaZtxVDXcudDrRmzAWs/NWVPU+hgFTfi5Awqzss2p7106?=
 =?us-ascii?Q?yFQK3CwOIDumA2GpJnLmLMAJkDGBYinMbONDnkf5Pe49qQuEDCXInlFb13HR?=
 =?us-ascii?Q?wTU8s2mv718XVnhRtZn12f00SBtL3z56FQxvvYUqahJz4+4f1NHhuAs67Biz?=
 =?us-ascii?Q?LsDY7pb3w8rsFQSJZY+Y1B1+pLU8WVOni5QrS0NEhiwoSwPukDrb1HNmOjGT?=
 =?us-ascii?Q?iJhFa1AL5N2i6whoc3XCgrLErfR5lnxvtg9TIjZAplFCWqYgmrgXoC3oLB2k?=
 =?us-ascii?Q?fT1/6koFWgDMB/Q1XfaMYZIrKWi1DesGYT6AZsFS92tlK2grUe2XgNN9NwIJ?=
 =?us-ascii?Q?+k8+iirvo378KcLuL6Jq9ioLI0DnQ1OAZIIWSdT5IRhVousyS1tzALVgCuxZ?=
 =?us-ascii?Q?PZ21WANdRpW75in9WNZ6FadYMxot+RtLubRbyrTYy3ZSCwTEXk4fLxceLD1j?=
 =?us-ascii?Q?XA2s5EwgmtiDCAqFp+QUCIIn/TQTw22Pyn2Bnh/AU96Cl2CbSNv2qHdWOuwK?=
 =?us-ascii?Q?OCeSPYMKa8+X1IBJyIoINL+5H1sUZZkVORNZJwgNwIGXHiAvfI+S7STSgU3M?=
 =?us-ascii?Q?ewRf8YcjRBLehaK3J4qdmBgyLFOwt1duFlV35jWXyqSJr0XAxnmWxa5RipbV?=
 =?us-ascii?Q?N+WAQaa/G1pZTFxl7GQ0V9yvik1LKmLmVOjq6ia09lAThCMsv0Lcht7MpwCm?=
 =?us-ascii?Q?DqYoP7FXWK3Eo/QmCGw5S6D6GkrEuoLzLbUDbNGCGVr710vt+tqo/z4VZIQc?=
 =?us-ascii?Q?8m/d/h/0sVM89tKfPHeimbTedT3RNUZLVXFmjgUIFsJgvMFc5OayawqvMKF9?=
 =?us-ascii?Q?m4hAIKQZPOrovGaTTzxVYIiY8IIBnTmhuZXZgiNJB7wtPx2FI3kbfDLdPCGJ?=
 =?us-ascii?Q?hvyqpcVMboEL8rOQLcAeQU0opaX6WpQXZSbawO/wxw0xBqcasW6BLcodNQcN?=
 =?us-ascii?Q?NVYdKmzisuIe5LDv1NQ6/IQGHwjvz6/IgyfCWDEL3ySqbVf+7AWtfbL6bOfL?=
 =?us-ascii?Q?GzR/hWBuwDbXHBssR8IzWszcSInruNxtRICO/hMZx+wQ2BD6zxJGMXzH5Hit?=
 =?us-ascii?Q?idUm/CA1ILk4jxFycsi9MI3Kg5EubeDeiTguXp9GD8yDRTzKUDC9tL7wdQZT?=
 =?us-ascii?Q?GXGeT5h1PJMT38OIgHH6AvCAKSaW7btek1bzOOqzX63P1kOrsGVnZjXCO5cq?=
 =?us-ascii?Q?MFAP/OSlJ9VU8/TmSgHG4qXG8VNVEGwvJQ/0IiWJMLMhpe+nWKsVnmubeANu?=
 =?us-ascii?Q?52wDEsXxwMuWKRbrSdbE5wK4Nl2WfowKeaNn4ZlJ4bYYO18cRmr5adct17ZQ?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4d0bae-4175-45b0-b3b7-08dd1576c582
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 21:50:02.3686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPUUmQzOPaIqqq8a+FRghCFCWexIqyk7q06amQqDxOFUSNfmOkZr7kjJUoajijRcpyH8twjvlLJkwMcL2hgW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

On Tue, Dec 03, 2024 at 11:24:17AM +0200, Juha-Pekka Heikkila wrote:
> Here added
> 
> igt_pm_check_hibernation_support()
> igt_pm_ensure_grub_boots_same_kernel()
> 
> to check if kernel is configured for resuming from hibernation
> and helper to set grub booting currently run kernel on next reboot.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_pm.c | 155 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h |   2 +
>  2 files changed, 157 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1a5d9c42b..2055996bc 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1470,3 +1470,158 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>  	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
>  	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
>  }
> +
> +/**
> + * igt_pm_check_hibernation_support:
> + *
> + * Return: True if kernel is configured with resume point for hibernate.
> + */
> +bool igt_pm_check_hibernation_support(void)
> +{
> +	int fd;
> +	char buffer[2048];
> +	ssize_t bytes_read;
> +	FILE *cmdline;
> +
> +	/* Check if hibernation is supported in /sys/power/state */
> +	fd = open("/sys/power/state", O_RDONLY);
> +
> +	if (fd <= 0) {
> +		igt_debug("Failed to open /sys/power/state\n");
> +		return false;
> +	}
> +
> +	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> +	close(fd);
> +
> +	if (bytes_read <= 0) {
> +		igt_debug("Failed to read /sys/power/state");
> +		return false;
> +	}
> +
> +	buffer[bytes_read] = '\0';
> +	if (strstr(buffer, "disk") == NULL) {
> +		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
> +		return false;
> +	}
> +
> +	/* Check if resume is configured in kernel command line */
> +	cmdline = fopen("/proc/cmdline", "r");
> +
> +	if (!cmdline) {
> +		igt_debug("Failed to open /proc/cmdline");
> +		return false;
> +	}
> +
> +	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> +	fclose(cmdline);
> +
> +	if (strstr(buffer, "resume=") == NULL) {
> +		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * igt_pm_ensure_grub_boots_same_kernel:
> + *
> + * Return: True if kernel was found and set for next reboot.
> + */
> +bool igt_pm_ensure_grub_boots_same_kernel(void)
> +{
> +	char cmdline[1024];
> +	char current_kernel[256];
> +	char last_menuentry[512] = "";
> +	char grub_entry[512];
> +	char command[1024];
> +	FILE *cmdline_file, *grub_cfg;
> +	char line[1024];
> +	bool kernel_found = false;
> +	char *kernel_arg;
> +	char *kernel_end;
> +
> +	/* Read /proc/cmdline to get the current kernel image */
> +	cmdline_file = fopen("/proc/cmdline", "r");
> +	if (!cmdline_file) {
> +		igt_debug("Failed to open /proc/cmdline");
> +		return false;
> +	}
> +
> +	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> +		fclose(cmdline_file);
> +		igt_debug("Failed to read /proc/cmdline");
> +		return false;
> +	}
> +	fclose(cmdline_file);
> +
> +	/* Parse the kernel image from cmdline */
> +	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> +	if (!kernel_arg) {
> +		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
> +		return false;
> +	}
> +
> +	kernel_arg += strlen("BOOT_IMAGE=");
> +	kernel_end = strchr(kernel_arg, ' ');
> +
> +	if (!kernel_end)
> +		kernel_end = kernel_arg + strlen(kernel_arg);
> +
> +	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> +		 (int)(kernel_end - kernel_arg), kernel_arg);
> +	igt_debug("Current kernel image: %s\n", current_kernel);
> +
> +	/* Open GRUB config file to find matching entry */
> +	grub_cfg = fopen("/boot/grub/grub.cfg", "r");

The problem is that this depends on distro and with or without EFI...

in my Fedora here:

$ cat /boot/grub/grub.cfg
cat: /boot/grub/grub.cfg: No such file or directory


> +	if (!grub_cfg) {
> +		igt_debug("Failed to open GRUB configuration file");
> +		return false;
> +	}
> +
> +	while (fgets(line, sizeof(line), grub_cfg)) {
> +		/* Check if the line contains a menuentry */
> +		if (strstr(line, "menuentry")) {

Also I believe this can change from distro to distro...
It should be better to have a generic way using other tools that
could give us the default or next boot...

> +		/* Store the menuentry line */
> +			char *start = strchr(line, '\'');
> +			char *end = start ? strchr(start + 1, '\'') : NULL;
> +
> +			if (start && end) {
> +				snprintf(last_menuentry,
> +					 sizeof(last_menuentry),
> +					 "%.*s", (int)(end - start - 1),
> +					 start + 1);
> +			}
> +		}
> +
> +		/* Check if the current line contains the kernel */
> +		if (strstr(line, current_kernel)) {
> +			/* Use the last seen menuentry as the match */
> +			snprintf(grub_entry, sizeof(grub_entry), "%s",
> +				 last_menuentry);
> +			kernel_found = true;
> +			break;
> +		}
> +	}
> +
> +	fclose(grub_cfg);
> +
> +	if (!kernel_found) {
> +		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
> +			  current_kernel);
> +		return false;
> +	}
> +
> +	/* Set the GRUB boot target using grub-reboot */
> +	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> +	if (system(command) != 0) {
> +		igt_debug("Failed to set GRUB boot target to: %s\n",
> +			  grub_entry);
> +		return false;
> +	}
> +
> +	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> +		  current_kernel, grub_entry);
> +	return true;
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 6b428f53e..7cc774e85 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -97,5 +97,7 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
>  uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> +bool igt_pm_check_hibernation_support(void);
> +bool igt_pm_ensure_grub_boots_same_kernel(void);
>  
>  #endif /* IGT_PM_H */
> -- 
> 2.45.2
> 
