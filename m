Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238DDFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E7E10EA69;
	Fri, 27 Feb 2026 08:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2jEUP/r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624ED10EA69
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772182707; x=1803718707;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gCx7gMC+HKSDMH7E0tuXp+xA0ZSZGY6+FYjXhW4k6TY=;
 b=I2jEUP/rq4XGf/QI4NyqgVp/8F1yiTiz40BDqyPVE6gug2LFDvg8Q6oM
 Vtb9zaHPo87HmGwhwuyJMyWTXrbzI6xPUyptVfrE2Z/Bi+svuZrVYxGym
 AJ5hmsg6cpIULzndliShHtbrIsE+KBJf3M1GpEmHcqgqmRsW+GOLHeS3J
 YvQLshkLZtGWcLuch+0bInowsljFDYRiTrVO3fAX7Ly/7GwQS0X5K3uje
 rJB5LiVnAqcspovER0te1JJbOBS4PsEu+WHpfIzx4GHY/mVEd8KrYWqk3
 NNNdOA/PI936nOYqTzeL4tOmXiERYpgNZu0jg4YLiOw8TP8vD0Whn07IZ w==;
X-CSE-ConnectionGUID: Y/YVVU7PTOyjo3RO7HlW3A==
X-CSE-MsgGUID: CrvHgJIBR5CHEGH/O5hlkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83969084"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83969084"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:58:22 -0800
X-CSE-ConnectionGUID: teNOdcF2SX6roBVw7EuyAg==
X-CSE-MsgGUID: Ntq1UoATQCyRqCh4HAsLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="214285042"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:58:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:58:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 00:58:15 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:58:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERJHblzkhERcZxCo9wDo9iII5b1D/QJ3ONYV40ozhLD+OQU/E9juUrBgZEmHokXuwdPp3I3YvMcxmtTR6pFWJzjZ4f+LaNsucw0cNf+ZhhOjhocJiA7P/FxFIAYxIZ4X05OXLfGz3LIRApToga/zw9fg1U4fzvjXGvXj2zCxzbegPugfycJP7uo3h8qZpiziXpecTZvuqj3vstjPQXKsDSFgVSp5HALC1gjrkCcB90+hf3gH8XtkhRqSl3XZVte4P+JP/ntHxsMDOX3f2N8m2mrt2pM8KT/vtXD/9MvGrssavxJQZZlLwylBCnLoQOrmYQCbADRRtKGrjRMX/DHgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfgCbzHi8Ot+F82wMBIRUU4yHl/P4+wz2KLeJljw7G8=;
 b=rit5wTQPBiV3JMhnIbo3XoME/0ETy++3hwmgM7UrYdsyqdp1vewBg59yJxPAYvj33iKavL4vfkrXAuni7rDios8D86Eire5jNOYZJwkXnnid4BmcGyVnLdyXCkVpXbK9eICihzC8O5OFbxdI60o+/gaHAAu6hV4YqwNgEoLy+MOtzzvjyGybl7hBFWKfsJueJmO55/YfMOHr0QUa8Z7sC6m747yePr/Y6W/f+2kpgb2xinkHDd4pQIsgPqYP3/ST1Sp1RzgNsdWfimumVuwcDUUiyKfsFvvQSzgYH+ToBsDezGFbFi4i6I4vl2A25xlknprE14brvendxEDBCncURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 08:58:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 08:58:12 +0000
Date: Fri, 27 Feb 2026 09:58:09 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_sriov_flr: Add reset-only FLR
 subtest
Message-ID: <20260227085809.dehznq3jz735x3rm@intel.com>
References: <20260226173137.3221419-1-marcin.bernatowicz@linux.intel.com>
 <20260226173137.3221419-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226173137.3221419-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ae0c30-33fd-4651-599a-08de75de567e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: ftWCoLIJvN8LpdRxlNjDjhGjv+TmVC5lDY3O2MmsQcBl2iYzeR0w2QbCXKJyrRcy8Pfh/1MN1vpwVeH3Al3dZuSs1UkyrGSlVuTD75u1zYnCB24h03MdfoGZhiqjMsE3Tt86+t+JOyhCoXKOgMVo1YhZBkVOMUWrmK9AfP7N84aB/2KhRPrHs8nATzKCqTM0P7PrYBhT+FVOz8MYpplM4aEbq1wdlIIuMP4Rhtvz2bh3GHTnaPonhv5+Zr7cPPuRDwr4YxpN1+1cJg0V02dHFUUYBxOTtlGuQYqvI7ZvmZDxT7wovrUwCeifQQ6rqlgZxM9T/fAvmjP69aee2NAwB62rufvcuqTFxSNeK7/CZZpov0Fy/fT0ljNm2RSejhHvitPdyHLLgUq3qjZxUa4ioCvZKLlZAypLST22RPjImE0lDd+PrsfCAcYU8JT6aOQIdUPP4yNKpmaO0MFJMuWSfOKUS5WybnTMRBTtsvT3f9jRxcmU0HpRuuzD/LbfYJoPUuiiDN94vplUs9nQ5beVJfpgArZRmN5MQRRyV2CpGyrhgD/XJz4V16doVR+MJvZOryZzstgMlIl9WGSbb16brLq3S2mBTMYtWAnESgUDItdTDAXmI/xvkmqoyf38hCw9gPledsgcKnJYdTjD06+lppyDpMIfuXI7pqz9buSI3gzHc1oy9a4HgYYLHl3qadrgylduRGUuZNd0F6EGiPY+pqNfo5oYr96A2ZipGB0fU7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHBkTHJ6WFV2YUZraDRGeTJkR3BLeGpDQldwK0YvZlh1bTRlcTgxa2sxbWRz?=
 =?utf-8?B?ZFM2Tk1xQWpZMEcyeXM0Tk55QmdQZy9Hb09Wd24xb3F4cGU1STlUSGo0aGpk?=
 =?utf-8?B?TzI4Tm5kd0wraDRZaVRFc3puSUdOWXY5MXVhUzI0c25qYVQvd01sL080c29p?=
 =?utf-8?B?NHQzbDdJNEhCdjVaRkpGem8yVmN0RSt5OHh4aDRGekFvSmY2VHlTcTNoVUQv?=
 =?utf-8?B?VDJtOE4vVjRCa1REdUxGbm5yc1N0QXB6L2hsTkhwY2pjRWhyQ2Q2R0VxZE1p?=
 =?utf-8?B?T1pVTmEzaVZrbTIxWC9xTkI3M1BnSUZnWURBTVU2U29iNGhFQm01Z3U2NFFU?=
 =?utf-8?B?WEJlUkxVNEQ2U1NqUWw2S2VUS2RObzJobWRqK0JVWlRkT056ZnJ2SGpEQ0Vr?=
 =?utf-8?B?WTBMKzZmRjRBbTMzd3hoN0FzcTZKeUEveUFuSmNaT3BKRkxMVmhXeFJBR1ZB?=
 =?utf-8?B?NXE4eDlDdk9Idnh0U1dEbi80RGI3NzVPZ0pOMlNWRWpmTjhyd0ZIT2pNcm02?=
 =?utf-8?B?dVBHSEVwZUNCMU04RmtjMjRVUzZ6M0dpTDJDbnY0eHlMb2pzcUc2bFBtaEJs?=
 =?utf-8?B?MUtNRWhEeHd1czE5aDNLVzVNVVpaRFYvQWRwbmhraFRsN1psMnVySkZHQU5t?=
 =?utf-8?B?bGdkTkEzZXRPbG1iejBQUU5nOWhldHJWRGJxcHZ6cWw1d3hVV0FXNkRsc0lL?=
 =?utf-8?B?aERjdGZVVm5CUnlVSEtyUkJOR3lCZkFPY3FXSFh2bTFIZ0JBU2REN09OWDZ5?=
 =?utf-8?B?Mk1veEFyRTlQZW9hckFVSll4Z21Oa3NmYWNQQWlSZXhCeG82eWRVTjdBbFRh?=
 =?utf-8?B?QTVBdGcySWVYZThFd3ZYT3hIcG1JWVRMRWZWbEUyOHJJdVU0dkt2UE1OVmNH?=
 =?utf-8?B?THpXOGVhNm8wMm9KRUR4ZzZ2eVVJUHFMQkwyVTZzRHNIZDBiV280cW93Z0NS?=
 =?utf-8?B?b20rSjl0a3VLOGlSblBoNVp4Z2xEZyt5ckdYRVg3ZFdtM2owYlJYK3ZVWW5X?=
 =?utf-8?B?SDVDR3VnNHVSdGg5cjVRMnBPeWFSUGxPOGRSWERPT2M2ZlI4QnMwNVJYSThG?=
 =?utf-8?B?MlpsWG5PYlpZR21wcWVUbTIrMzlSTkxva3JTWHJsY1A3NjdJb3FPc1pyaWVo?=
 =?utf-8?B?Ny9WRE1EVlFtS1puNCt1alBQQzhvRnM0YlBVWGlseHZqMnhqeThrK09VZjJm?=
 =?utf-8?B?L1dTaURxMWNxQ0FiU2t4NENYNW1pdHVJMEFkNHJTenlPUlFoOXBzMXZ5NXhJ?=
 =?utf-8?B?MS9jRHYzc1hUNnRBMzFRUXh4NE1LL3hiNTgwUGtwc2V6bE05dXpNUks2Rkdx?=
 =?utf-8?B?SXRWbi9ZeEg3WWwzMVJSSndxNWZlUDVGdXljaTByUEpBQVZzcVZYVUY2a1Y3?=
 =?utf-8?B?VWswbDdhRlhMSlZOZWZNbEl0ZFkrZXpSeDVQSXB0MStXaEZ2VGtXY3dpRml1?=
 =?utf-8?B?b0RMcUU1ZlJTSk9kdVhYUG9FVzU4RWNubXZGSFBNWDhiblVsai9hSHQzc29s?=
 =?utf-8?B?amJwY2xSVmFFN3BseVlsbHhNelp5bk1HWTViY3M0ZEc4bmVNbTk1a3RVTnJZ?=
 =?utf-8?B?SVFPYXB2TmpaeXEvQWZOcGF3TEdMeEtiVldScEJoWHFuWE03a1hLTjBLL2NN?=
 =?utf-8?B?emptTVRmcWZwSDlROUswQU9rd0lBcDVDbFlTb290Y0NnSWhvVENOU0E2b2g1?=
 =?utf-8?B?ZmJIOExnbVlrUy8zRCtyOFNwamJPbmZVZjk3bld4ZEZvWUkydTRvWjBvU21x?=
 =?utf-8?B?RkliY3I0L1EwT0VLai9tMWRtUmRpcWpNSTN2cWF2Q3BMTmRwVjdyVmVtN2F3?=
 =?utf-8?B?R3dBQ2xNRTgydUs0OGVuUmQzYVlRR3JXWEFaQVh5SldsSmxlZkZzREpoSzls?=
 =?utf-8?B?ZVE2U0w5aGQ5RHdJWGZmNzlabUNpZDg2NFRUUWJOWmYxK1dFQ2tKb1JjdEF5?=
 =?utf-8?B?Q0F4SG1VRFBQbTJNWmtWWU5WNnFDbEhCSVQ1elRoODBaS0dOaDVSMkRxd1ht?=
 =?utf-8?B?RjYycTgwSk1seTlwdVI2SjhOM1FHdGNzQWYxK0l0M2NTRXUvMkYwd2RER1ZV?=
 =?utf-8?B?QkVvODRvV1ZDOHBsbVZ6dlpWK05MY2tVczIxNU5sY1RkVlRTY3N3cEhPd0Vv?=
 =?utf-8?B?cS9nYnFKQU5kYVoyNlBnbGVRMzJGekFYdDlhaFNsNFpoK2ZjazNSUms0b1F4?=
 =?utf-8?B?dnZUYm5Qd3NKd2NYTGUxRzJxQTU1eUVPM0s1SHdGOCtadkM1WGw2VU9MOTZu?=
 =?utf-8?B?anR0VjRsQlA3Ump0QTVra3Q2a0dZckgxQ2creDZMK0cxOERwSFQ1R1hWcmdD?=
 =?utf-8?B?V2R4a0pNV096cmE5bk1nMUI0R2VNMDJvSk03U05tT3liRzB6ZXVPVVBCRlZa?=
 =?utf-8?Q?v987NdLTnLGZQNRw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ae0c30-33fd-4651-599a-08de75de567e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 08:58:12.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KsYTc7YZFj0hO5x2agR9u8x672GNJnjOquqDx9O7pZsfKyZzzJsStSBlGtHm/OOgNzyTodPVcBllu0yK25kaCDjtH/gJSPE5MOrZxcdcJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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

Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com> wrote on czw [2026-lut-26 18:31:36 +0100]:
> Add flr-reset-only subtest intended as a minimal smoke test
> for the VF reset sysfs write path while still using the xe-vfio-pci
> based synchronization: the test skips if xe-vfio-pci binding is disabled,
> if the xe_vfio_pci module is not loaded, or if any VF under test is
> not bound to xe-vfio-pci.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  tests/intel/xe_sriov_flr.c | 65 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index b73727787..846731697 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -29,6 +29,12 @@
>   * Functionality: FLR
>   * Description: Examine behavior of SR-IOV VF FLR
>   *
> + * SUBTEST: flr-reset-only

Or maybe just flr-basic?

> + * Run type: BAT
> + * Description:
> + *   Initiates FLR without any additional state checks.
> + *   Useful as a basic smoke test of the reset sysfs write path.
> + *
>   * SUBTEST: flr-vf1-clear
>   * Run type: BAT
>   * Description:
> @@ -1016,6 +1022,60 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
>  {
>  }
>  
> +static void reset_only_subcheck_init(struct subcheck_data *data)
> +{
> +	if (!g_use_xe_vfio_pci) {
> +		set_skip_reason(data, "xe-vfio-pci binding is disabled\n");
> +		return;
> +	}
> +
> +	if (!igt_kmod_is_loaded("xe_vfio_pci"))

Sometimes it is xe_vfio_pci, sometimes xe-vfio-pci
What is the reason for this difference? Shouldn't we keep it somewhere as a constant?
Or have helpers to handle this module at all?

> +		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
> +}
> +
> +static void reset_only_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +{
> +	char *slot = igt_sriov_get_vf_pci_slot_alloc(data->pf_fd, vf_id);
> +	char bound[64];
> +	int bound_ret;
> +
> +	igt_assert(slot);
> +
> +	bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
> +	if (bound_ret <= 0 || strcmp(bound, "xe-vfio-pci") != 0)
> +		set_skip_reason(data, "VF%u not bound to xe-vfio-pci\n", vf_id);
> +
> +	free(slot);
> +}
> +
> +static void noop_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +{
> +}
> +
> +static void noop_subcheck_cleanup(struct subcheck_data *data)
> +{
> +}
> +
> +static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
> +{
> +	struct subcheck_data base = {
> +		.pf_fd = pf_fd,
> +		.num_vfs = num_vfs,
> +		.tile = 0,
> +		.stop_reason = NULL,
> +	};
> +	struct subcheck check = {
> +		.data = &base,
> +		.name = "reset-only",
> +		.init = reset_only_subcheck_init,
> +		.prepare_vf = reset_only_subcheck_prepare_vf,
> +		.verify_vf = noop_subcheck_verify_vf,
> +		.cleanup = noop_subcheck_cleanup,
> +	};
> +
> +	verify_flr(pf_fd, num_vfs, &check, 1, exec_strategy);
> +}
> +
>  static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
>  {
>  	const uint8_t num_tiles = xe_tiles_count(pf_fd);
> @@ -1141,6 +1201,11 @@ int igt_main_args("vw:", long_options, help_str, opt_handler, NULL)
>  		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>  	}
>  
> +	igt_describe("Initiate FLR without any additional state checks.");
> +	igt_subtest("flr-reset-only") {
> +		reset_only_test(pf_fd, 1, execute_sequential_flr);

In this case, shouldn't we have dynamic subtests regarding the number of VFs?
I know that this will be expanded in the next patch, but maybe it should be the default.
Because if someone wants to run tests on only one Vf's, they can still use
the dynamic subtets filter.

Thanks,
Piotr

> +	}
> +
>  	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
>  	igt_subtest("flr-vf1-clear") {
>  		clear_tests(pf_fd, 1, execute_sequential_flr);
> -- 
> 2.43.0
> 

-- 
