Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB56C103E2E7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 21:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA4810E3F5;
	Wed, 11 Mar 2026 21:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEyY9aJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BD810E3F5
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773265700; x=1804801700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4NeDS/kvaReYF74oBFaYq33dIZT4/RMdcpjzlW0jlnI=;
 b=HEyY9aJ1fP2wt422duVBcdIN6TfzurY+WIZJTGN8HkRGsw7q3Wucg5IA
 vl3TNQIoNSmdge/xJDWEG2vyE1FtZs0WFUhDGuppIiT7hJw6ds4S9ZRVH
 2icfxC8fqcTeXgU5ewnVZruAV8YW0BvonhXqEjWFrdByYI1Lc4rch8/5j
 U0zpA4JWam4m0/bjS/P3JHSmkLaeMMG5U7TTdlN3kErx0OUoU0LbHGIBY
 ps/j7x+rvEpgiMJIQ/wXyZGmsY14E8aLGeg8SuI6iUfb6VgC51VcjGeWi
 yZ9lcR6PhMP3oxK/VdUEKMfwUTD06BPmV/4jgFOoUQSlmUyCsAyxY0WTe g==;
X-CSE-ConnectionGUID: wTmMNB8hRQ+WN1sT9uWFQQ==
X-CSE-MsgGUID: RjIJoPyhRY2UmOJmHZ2cCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74539933"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74539933"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 14:48:18 -0700
X-CSE-ConnectionGUID: FBGzgkFLTNaOEG7oKIrz9Q==
X-CSE-MsgGUID: 8y9fJSphRGCMXE3aDn8hoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="258509952"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 14:48:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 14:48:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 14:48:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 14:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+I+ZKbFiy6nApRMCGxO7/3UDbl9r5DiZo9KlAGoAHiVhroTnPjGXJnWSDyp5J1ejTJs1lBIFfJeB4LPt/6AMvlFE9SN0yTl2DtnsiewgrdbSd/WWRX+THC7WptqvRtF6OLpe8HVMAqvtZdvgaEtcqQBosSJQgA9F0NeiDMQ9G+xjBjuQP//u1CvifEcRCmN7CzlGVagjqNWKqasVMvebHoipTBj5ATzLIxP+bqNbOC4EXab9CJFPzDa3QqJt/YFe1OfNc0As3dyXeF1+Nvk1kDJRwpUC0dpnbVi8W4Af0oGBzoIjiTbK2Rtx/Kq68TQ/wmwl/PVVxo4N5cOF/cvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIoMoFrUDErMPG4A5ztC+V6Cr8O+wZGzz4/+nJgGkt8=;
 b=mZ9QbFYHGkhpYD0ioQnGEOZs1EvIqJY3FwOatVGuBoLO7T84bdMdvmltOkc6y+gjWMk/aeQeSinHemqiZEthTRz2KRaVzp0qQVhTpDStNH6BYvYVt+I2DYLZsZlx49bONsUsYGrT/HqO99sUvqY6Ksi31p4t+Aue5fPBhAmzLJXHNsj7+RMFc2lVYkmSVOGps6v7b8VAwEyJAdNvUBo8Evxwf0pQb9Tf6s6ktMgIhNmFLeoXQtBQR4Nmy9t5gmjwvAQ54uagxVGB00PR+iDcuB8K7uDgBq/yN866O4v0thB0RiS8odiuFlR2BG1kT8raw6kTRR9x+bRnA2mOsLcYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6192.namprd11.prod.outlook.com (2603:10b6:8:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 21:48:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 21:48:14 +0000
Date: Wed, 11 Mar 2026 14:48:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <himanshu.girotra@intel.com>
CC: <ramadevi.gandi@intel.com>, <aditya.chauhan@intel.com>,
 <shekhar.chauhan@intel.com>, <kamil.konieczny@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib: Add NVL-P (Novalake-P) device IDs
Message-ID: <20260311214811.GB4694@mdroper-desk1.amr.corp.intel.com>
References: <20260310101335.8995-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260310101335.8995-1-himanshu.girotra@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: b710ab7d-498d-4c5e-9376-08de7fb7e588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: EB99hJK1iAobo3kKpgjvsggmAzrXyrL6Hk9XO3IO3Kdq5VUqmUXF0IBXIa0ZdtQu134j8mMzRcSWOoh08xeqRZ44RgF3bFHHl+nFJfXNiqBZaFnvgs6wkrZKixe5kkBV8OkvUYhHvAebUfKMh4JMIzjMQ/YTU80Q/OTiQm69zEITZtj++5sxT/d1irraGOr542E1K1ni7e1tWq4clpA4vGY85RRNyWihnQO9FJTKva2FCHeAqDpICZU6CdQJi9DWH+cGtJ0B0+XmI4wYbhQm7ZgQWyJS0ZhceGsZswzK+NEJLsouqjxJA2K3pyqt08pdet/C1C8kbhQLwueH1B0oPJV9gBrSiDXilpa9b5WvTT2dZ0yrEKnNMFK1RZCMWsX2isXFvaczvWGIH+PZaW5X99BLcxRRZlG2xJjpfnvcpdJKXkf1lpqwQ0Sukfd8RjtT8Wn4tEYMGOkqBQ92gCzfxi0+XuIR3FuPNJjA9Yq8+ynlJOKN2HdFjtNygZmGMLBFHOOwE/uL8x/n5lPcZyDFKS2d/Gh7iFmuyAwKGVG5fA5/rm33a1HyGc0cgFV2XB1E9BLBrR+n5hOk2hhUBLMmcW89z1Wkf3eLuHd9jO1NBKWf34tbONUgmo3btXpXPKnGzYWnFlSTs69onR6aC36sN0ELV1ThHAIjNfpQELhC9Y8JXEdsN05DSWUP0Y208zgH2znHBxMdHdbJ7AzQYB1uO2nYs5/IXnfM+LiVXMesqu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qnbBug1T+PsEp+L+PumXW2JaPNw4oBhPTnYWq8zwIAEmpFvN85Npx1DQvND1?=
 =?us-ascii?Q?RSyXNahl/cmujKRfs7LIW6xpFQzOPtHQcZ5wAn9MofWIRNMlou0chJL0dZun?=
 =?us-ascii?Q?/RhOipYGRpS0xq4d4H0U4FEQmdWwJmyYeRY3mnHtcGCmJTE9hLBpq1WutiQg?=
 =?us-ascii?Q?JUTAX9YGNPwgrQEETBGANk21rM64y+SL7Bhecu//Ppzij53gP2dYC2kr4/MI?=
 =?us-ascii?Q?KfPpcHrGKAmxXEQctFRSHlLSLuGRP0biuob4LCKJZV+k7LMTnD8uJDXEKF5l?=
 =?us-ascii?Q?LvhxQJ3wMUXj3Xw97+3k/Pjy+bF2Cq7fA4eLc/i2OJjA0xT5Rhz6UQeAx60n?=
 =?us-ascii?Q?zLsskCBlRx1monmaKkNr4sMKNygsNcslSNTzQqYEM7HlxUXRuBjK4z48iXxX?=
 =?us-ascii?Q?40484sC6mL9l/shkTXtfWKe4SUOb+k0z2oi0FenWhmkmdz0LhILC6/xjoyNc?=
 =?us-ascii?Q?tSHIMcsrtWj3ZVYFc1R9lKZSNzHBnRxMBC3j8mSkOtN3QBw8VyauRY6GMVlA?=
 =?us-ascii?Q?l5hGnAkViuEJsx1bTQpmSMiML5czLVz+q6LjLiA++MSgBswudYzTOOweaBuf?=
 =?us-ascii?Q?WQWS4eBjtrxs4lZU52O2n1wW2PYCORlsYYY9VT+kRBZ1KysgvE0vaYiSknk/?=
 =?us-ascii?Q?r2N1to+vZv6vHy3EhV5yqlqpzxsy4R3otwxAhulg8+kEsY5HqAdngh740vtX?=
 =?us-ascii?Q?t046cu7wVkcHGLx3Paym1WB4adAfPcMXVZbzEd453YvLxAUdwpanacaY0lVZ?=
 =?us-ascii?Q?ZjxTG/t31ivwK/kar/gUYRF0Ok684472SHw7Q3q4OSW5zHQ0iukY7mRdYN2d?=
 =?us-ascii?Q?pWjLKXgJEW8lyulZB6X/+eDkcB7e680aBbsdxGWo8QDO/Nans6PVuTd9jYlg?=
 =?us-ascii?Q?qRpnwZ+Ojh1I3YFtcDKyQMmwvmFPy4+8VX9RgCyLFmlRl+h0+PbJe7Xkl8Tu?=
 =?us-ascii?Q?ZJtaI0+BWwB01/N7RORV251kojVF4SddDNXEYJcmhChzz2gBUEAlJK/B8Vv1?=
 =?us-ascii?Q?5dS4MzXO5hwNEUbYfguuF6aaNFADFaUEamEGpN9flx0YqVpteZojZFDBTACo?=
 =?us-ascii?Q?CtM5VVb5DHw3FrPpneRHAtU3c9WjTKSCsyM/5DC8qSp+TpUy1MiKkrpneByS?=
 =?us-ascii?Q?rqeefkUqsoLYGwRqMeSC1gSf+Q0Q6mUTP9Z39PvFLAJqtJjGyuX4y82iMdtR?=
 =?us-ascii?Q?NftYJldmubxGhWnw+IYxGxxXteWiANjCj8WFUt9aEoy0C5UM8hrXd39MpUre?=
 =?us-ascii?Q?LUyJqAFroomHwuLwsoiU04cdi3BUAoCR2vsi4k5IteCJCdSVVTiNsvz7ZYI6?=
 =?us-ascii?Q?83+jqKDxKkEurfqOk+nXs4uh9PQVVFrDfmO1njuhQsxjy2C/gZHVKmcj6J/z?=
 =?us-ascii?Q?SUpLSjF8/SQwnCfr3zXS8OQxBaOFisjw2Sx6csg88YilsdCQFZ+aUXbhRxYN?=
 =?us-ascii?Q?frC+Mis/I208mjHetzQGZ4yC2/HGm89HsvnAlz84n0VdvPsuOntnRAoqavcG?=
 =?us-ascii?Q?w1XPDOHbwdnSUNuUOaT6+hAVa+/GZntKecdew+U1zbr+dny1D7mRQwqmABNI?=
 =?us-ascii?Q?f8oarbFRpXYBUofGIHAq//5PU3vAb2Oy7RthGC9dtAndG8rBcDi6a67th0Ux?=
 =?us-ascii?Q?eiGU83PPn9qJF0igCPgbBKW2mHXoWIQRSue7WXbXevBiEVkLFWVNnEGtMnGt?=
 =?us-ascii?Q?LRuXI16/ZkD2HPMP3cvSt1F4MKMR0gAxG05XfNuUh3XKBGepki4Fwwlf+eUT?=
 =?us-ascii?Q?uMqC5cXvnvkLupPNH1w+vq6RBXXEnCM=3D?=
X-Exchange-RoutingPolicyChecked: S2WXGkfcc6bTwhb/JFC2G4ZGaRm+ab/otBUgM/sbRXmmsafRPNen3sEucKzHabWrMz3bWo05SkCXpEorZjp98qRPSyxJtiQxYAN+RVEXE/+ktZf2wP5dtvDOTNvyEKL4J2011hRNL3Jbwy5CETw0b2OZO4X42SOnfEEyNDZZsLX8KYnI7zaVnIZ5XTxjCTfJtko3IZz2keb6qNymdchYhYuRwolV/YA7GOC/BrafEf1bO/ynp3rmRqyhRYd0qotb8Z1KEy1+19gnG9iIes5YjTnvhdSSVbEBuspDBz5d37au5li5OIAGnxzTAmpyncnLzSClWC1FLi5VLMgOGDtiXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b710ab7d-498d-4c5e-9376-08de7fb7e588
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 21:48:14.1435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TXUb6AdLgsIlFcB3ysKeSEDfnhsevympXCiLJE03/mP5J0qHHAzguuBHlvW1Wd9D8snauabqovqTPQZYrfwsf9NV7SPI7hgZBMBa/3IImc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6192
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

On Tue, Mar 10, 2026 at 03:43:35PM +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Add NVL-P device info and PCI IDs, syncing pciids.h with kernel
> commit be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition").
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 14 ++++++++++++++
>  lib/pciids.h            | 12 ++++++++++++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index cc2225110..5df7349df 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -94,6 +94,7 @@ struct intel_device_info {
>  	bool is_battlemage : 1;
>  	bool is_pantherlake : 1;
>  	bool is_novalake_s: 1;
> +	bool is_novalake_p : 1;
>  	bool is_crescentisland: 1;
>  
>  	const struct intel_cmds_info *cmds_info;
> @@ -213,6 +214,7 @@ void intel_check_pch(void);
>  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>  #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
>  #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
> +#define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)->is_novalake_p)
>  #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
>  
>  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 89fa6788f..b44b24223 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -551,6 +551,18 @@ static const struct intel_device_info intel_novalake_s_info = {
>  	.cmds_info = &xe2_cmds_info,
>  };
>  
> +static const struct intel_device_info intel_novalake_p_info = {
> +	.graphics_ver = 35,
> +	.graphics_rel = 10,
> +	.display_ver = 35,
> +	.has_4tile = true,
> +	.has_oam = true,
> +	.has_flatccs = true,
> +	.is_novalake_p = true,
> +	.codename = "novalake_p",
> +	.cmds_info = &xe2_cmds_info,
> +};
> +
>  static const struct intel_device_info intel_crescentisland_info = {
>  	.graphics_ver = 35,
>  	.graphics_rel = 11,
> @@ -681,6 +693,8 @@ static const struct pci_id_match intel_device_match[] = {
>  
>  	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
>  
> +	INTEL_NVLP_IDS(INTEL_PCI_ID_INIT, &intel_novalake_p_info),
> +
>  	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
>  
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 6e53fb4cd..d4a09ca12 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h

The commit message says that this synced against commit be07d8f707e4
("drm/xe/nvlp: Add NVL-P platform definition"), but that doesn't seem to
be the case.  When properly synchronized, a diff between the kernel
version of the file and the IGT version of the file should be empty.
But in this case I see deltas related to BMG and WCL, and even the NVL-P
definition isn't in the same spot.


Matt

> @@ -893,6 +893,18 @@
>  	MACRO__(0xD744, ## __VA_ARGS__), \
>  	MACRO__(0xD745, ## __VA_ARGS__)
>  
> +/* NVL-P */
> +#define INTEL_NVLP_IDS(MACRO__, ...) \
> +	MACRO__(0xD750, ## __VA_ARGS__), \
> +	MACRO__(0xD751, ## __VA_ARGS__), \
> +	MACRO__(0xD752, ## __VA_ARGS__), \
> +	MACRO__(0xD753, ## __VA_ARGS__), \
> +	MACRO__(0xD754, ## __VA_ARGS__), \
> +	MACRO__(0xD755, ## __VA_ARGS__), \
> +	MACRO__(0xD756, ## __VA_ARGS__), \
> +	MACRO__(0xD757, ## __VA_ARGS__), \
> +	MACRO__(0xD75F, ## __VA_ARGS__)
> +
>  /* CRI */
>  #define INTEL_CRI_IDS(MACRO__, ...) \
>  	MACRO__(0x674C, ## __VA_ARGS__)
> -- 
> 2.50.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
