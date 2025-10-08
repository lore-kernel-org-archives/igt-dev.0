Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6E8CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 23:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5285010E104;
	Wed,  8 Oct 2025 23:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVclZMqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C3510E104
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 23:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759966296; x=1791502296;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BrpUQYj0FFaf7GAbP0PXxG0bI3gYYPoO3ORI9WTm3ec=;
 b=mVclZMqsWuC3ngIEJgZt6eDpe3NUV5f0b2JBxJ+dY94OGo07m864FL/9
 Iidjqn+1ccAstI9iB4zREXzbuRA5iG1B7U0MtsKsi0ZZE85I36uXw4FTX
 AWwSkYDNrDcerm+n3pMfdfBt50+X8BGI+nzzaKbd2y+MjVJpSNjemMZwk
 /9L2VHy06ZKixITqpc5SmPH+RJd3nZHHqZfoWtv6ErwElsH/jdieY0m66
 0SvXmf7tOmtnP2h8P0uGNOtnjbjo05Mj2yd9S9pdswfZMzm2l5VCHY2bp
 3QEmmnIff8JfXDlR6BTHS7RtUA7NY/AdfZYQfUQpS2aQlsvaUc8bkjzzO w==;
X-CSE-ConnectionGUID: tFplCrbRQMifampWFe4G6Q==
X-CSE-MsgGUID: gDY1CydNSOOu/xNj6cdXKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61376269"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61376269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 16:31:36 -0700
X-CSE-ConnectionGUID: aofhwX6ISaCVHa35lWkttQ==
X-CSE-MsgGUID: TFAUJwlKTjyRf1ynOsTUnA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 16:31:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 16:31:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 16:31:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 16:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWNDqnxrvoDPIuct0q0RyLSW4KTX6Yp7ueRoEgXrjg/BoaLvLfyNAPqG1ImGyThB+wz5DmFIHoBArD8O590byG1fLvjrwOGkcVxt+t0u92qcTk/S6owr5lMNQeefrHETqOL2vO0AG/bF3R9Baa8fqPbOctR/XHwd5lvpr+TQ4+lNS86ttQHWwvLfcAP3nL1SwTVuzFYU6vjMfbu9Uem4uS1DYbfV9YrBhdgQlR5MUe3tJcHJHKTU9+bKgJ1R/6JJHeYp+QYwsiOW47nJjDR8yZ1CsfBmVY8XgIZl1/VOPPDSM6SM9DtNJewAFeJR0p/NllXmgyP6yLlU+ngwXCCwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6ezzyaIOc4XOvgEVjhvEokJcAc1iW9wGhvmcBNieIc=;
 b=Lqh0Kf3S0xkxko43P1lOp8ixznB7Xv0EbWWHKuibwRMxpFpAnnLhvzZ1MxJ/4aKji7ZkmtP990Q/PkPoIzSyvlIubg+iBT2F0v9yUPZEGv/sIDc08wEGyQ5cpesKXORj5UpuuAOi/FIJwFOsxDaO0z3stfcR0O06vqKlEJfJrcG4nLnOI2fgw9Z40WLbwGD5MN4gWW4Kx+jPPPVmdidkVBeUhLomIfeQ2SSfVjLivyjqisDPF18VWA2YNNWnKaDZHsLxdqqhpvt++DbXmRqUO08hozr50a50GMptoI/611Lznc3Gq4K8vsmzOOIMo7xgWeO6/IFs7C2YXlX7Pn1GuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Wed, 8 Oct
 2025 23:31:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 23:31:28 +0000
Date: Wed, 8 Oct 2025 16:31:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/18] tests/intel/xe_oa: Add for_each_oa_unit
Message-ID: <aOb0S1irIDU44xj6@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-7-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0315.namprd04.prod.outlook.com
 (2603:10b6:303:82::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f5e8db-1ca0-44be-3835-08de06c2cdf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDBQRFZTTi9Mc0dNa3E5QzJwaDdWQkEyRU5GL2Z1dCtaM1plMnNkdFlkeHNi?=
 =?utf-8?B?ditLdlhkRGw3YjI0ZTVDYzdIK2hKOE4xNlFmZFp1L1FXdVhmRjErN2lsbEFk?=
 =?utf-8?B?K2tWN3daTXVkWEN6SUh5WTh0ODFlR3BlVGhXZDFqZzNCeGREQ2tFY0NFUlg0?=
 =?utf-8?B?Y0RRWDZacmJsNkZWK0dvNGV6SGhEWEhGdzlOb2pCTVcxWmYzVFlLNEtObWJL?=
 =?utf-8?B?T3JlWGg4WGVET0g2NkdVVzVDdVZwcTlhbVR0MGxTQkhZL3NRck96Y2hiajFq?=
 =?utf-8?B?RlkwTnM5RnhDSUpHeXVvWjM2bTNFM2IrYXRRN05MaHFKbGZ3WGNXZEpSNy9y?=
 =?utf-8?B?eWlyOURuM0FxU1lVa2p5cFpPWDJIWXVvRzYvcHFWdHljVjVoNkg4K2lNcTJL?=
 =?utf-8?B?N2paVVpZT3dBaXJRdmVUTUdVTWorUFIxeEhLZ0w4WDlrYmt1MnNZb2o2bWtZ?=
 =?utf-8?B?amp3WDkxYzFRbzdRTjZObkxXME90dVBTQjV3ekRWckQ0ckZvcUZrNXd1UVk5?=
 =?utf-8?B?bWZKeVRuMk1lVnRxeE9wRmFYMndaK3FabUpLdEtkaWY4U1FoMWZ4aURKMFYw?=
 =?utf-8?B?MWsxNTRMZGZnd0crZGVwaDVZdER3bWw2SDNPWW1KcnFDZlBNTnMxc2RQVkhq?=
 =?utf-8?B?eEhHSThTOGpZTC9vdEhZTFRsNWJSZFQ3bUNoRjVsY3E2Tk1XaVVIMWRHWmJV?=
 =?utf-8?B?K1V3WXVpcWhHQmRiYTdJeFpIc0ticDJwTEZiY1pGUm8wYU1QMnBxVWU2NERV?=
 =?utf-8?B?TDk1MkdYaXp1VERIRkVHdjdCWVdpNUVER1pKOXZkeW9nZlZ5cEN5eitWVG4z?=
 =?utf-8?B?bE5uNjZmUnN6VXZxQ0EzWEhsWnVscGRvNEQzcWw4V1BFVVNVNzdicCt1eEFW?=
 =?utf-8?B?U0lTSVpVbktHYXJBNU5xTnlJRzV0UGlGU3cwV2U1S3JtWC9UbkxSQ2xucFRM?=
 =?utf-8?B?a0V0TWN6eXhXQ1JxZDF5QTQwL3dVaU9BTm5GMVRCRDh3Zi82UG1DZjdzNnJB?=
 =?utf-8?B?bnVUZldhQ1VKbU5VamxhL0E1MWtCdTNSTkt5SUN4b0JQWkN6c3I4L1UyS1pN?=
 =?utf-8?B?RmNRMlBXVHNjMlhFVDhRMXcrNFBmeTgxaW1QdGRKSlJXR1h6STZLaVBrWC90?=
 =?utf-8?B?eWVoR0hNaUpIdkJvajJxaVR0WEtNaUNaY293MThXZC9VZXN5Rlc2Rm1hUVZh?=
 =?utf-8?B?YmZQQmd6VklJWFlTUzdNblhGUXhQR1ZaZXZTWnJ2VmcvVGF2Z1dhQkdVcm1m?=
 =?utf-8?B?RHFjVVJ4Z3FqYmpZTXhnemxoM2xOeVVrMFROZW43dnYxTnczSUlBeW12YjhK?=
 =?utf-8?B?cFREclBURlBSVFpaajgrcTdoYmpLQmhQRFlQcmoyM1lqdDJrSmtlUW16cFlP?=
 =?utf-8?B?T2x4ME8vNWF4YlBvYUd5b1RsbHJpUUJjTmdXZytNWlFoZkpFQnh3R0hGWmJw?=
 =?utf-8?B?VVVHNVZDVmtpU3gzK2dLL2hVTTlUVTNoYTNrcytEOW8yZ0lmQmF0cmlJVytn?=
 =?utf-8?B?NmtaaVIwWlpwOWVLU2dtSTMzZitiLytPRnE4Z3JGbS9pbzV6MkQwWjVEY3B6?=
 =?utf-8?B?MEIzR24yVnlzZ1dnaW5MLy9obVhXV25wQVlXSVhWd2Q5amhWZk9rTlZwUWVH?=
 =?utf-8?B?L215NTRqcThBV2dqdnFGbUhHdU41Rm1MTXRWWXFGS1J0N1VGUXAxUzljVzNP?=
 =?utf-8?B?Smdac1YzV0pCK1BPTWNVZlBtK00xdVlBc1hLY3Rpb3JNMHQzVHFsNWxVSU1L?=
 =?utf-8?B?cXVDaERzOU9uOEtqSXlrYTN5ODNEeG5IbTh4SmV0NnlrVkNWa0RZVDVzT3Za?=
 =?utf-8?B?MW9pajNrUWdXZ1VHWlp0Q091Vi9vblE4S004anE5eGN6VUFLQW5RZzM0V1J6?=
 =?utf-8?B?aGR1SkJRZXZlNXBSbXRVRTY2a0ZLdVhZK201aXkyTmI1YVBXUXdwLzNTWkY5?=
 =?utf-8?Q?Tt7v0BYzvTHU8o5KI2izAr+fdIORc8tD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXN4MHZjVFZ0b3NyRlFhWGtaQzYxNTg1a1JKbVpENE4vUG5TYU91MlU0NHUy?=
 =?utf-8?B?WTVCM1FGOTZnYWdpcjFXd1RudDFLbzZnbk5BRUZWSmdwdE1EemFjWXJqOWs2?=
 =?utf-8?B?OXp1eHpxVVVPK0tYT2pvTkhnZjVhTWhhSmVPbWcyaThSKzBhMzNoT2M3UUJm?=
 =?utf-8?B?TmI1eURDV1dPUHZNYkF1K3ArOU13dnV1RDFIZ2xvZ3duVzRxaFc4cTZ4eWhX?=
 =?utf-8?B?NGRodzVwNWFGcEdGKzF5Rk5nOE9PSVBpYWlmQ0xFQkxvOHJGalRjTWs3eHJq?=
 =?utf-8?B?dlFXdU1zVWtJanZOSUs3VHZiTG91eElaZ2pYTldiSjhibVM3a3MrR1Eyam5S?=
 =?utf-8?B?c1I4TUtpVm5jT3g0VFl4cE5xL0ZyQlUyQmhpTnIxM3pWZENNQUU3RmsxVG9K?=
 =?utf-8?B?L0t1YmZ5cklxOThiTUZlaEhYNXdsNVZLYjc0QVNqblYxVmtiYlZSczJkTExl?=
 =?utf-8?B?eTMwY3IwVDg5UE9CUkZ3VExPRUxTZ3BoMzdYVHlqemNoUlUyVGY0UlBrM1dE?=
 =?utf-8?B?cG9qeHNSN3NIeUtOWDY2WUsySEJrNS9iKzZsL1huZ2gxNW5qZER6Q2VHZ3o3?=
 =?utf-8?B?M2Y5Z3VOUDluNG9aZ0tqMTdtK1hMdWpkbXYyYVlFNWNleEt2NzhTSjJQWlNq?=
 =?utf-8?B?QlhlcFJlSW1yS0o0b3dLem1wQzdtUzhqUlg4S0FYTXQvKzI0aUNDN3gwL093?=
 =?utf-8?B?U05lZHdLWnI0MnFrYjM5U0xXWVNCRTQyNDR0em8vY041RmFleEhJbU9YNFht?=
 =?utf-8?B?eXZqZDhhUmhUdWNmcW5mRUlKOGhJU3dVOGVob2tRNVAwb21BZzYxUVNSM1c2?=
 =?utf-8?B?T0NPQjBaSVJidWc0emF4QUFTL2tyN3U4b1JsMVo4Kzg5UGNVUDlPaHpDMmpx?=
 =?utf-8?B?M054U3ZsUW9pR3hxSFFYQzh5b2dCOG1ISzB4RlQ3eVVCU2hDN0J4QlAvcjM2?=
 =?utf-8?B?SVNsTzRITUp0V2pxV0VSNUVuTWppU1UrclplajBkNVVWT1UyQytsS0FGUWJN?=
 =?utf-8?B?dmpVRFdHdnhNQksvQ3R0Z0RzNVIyaGpzWGF6WGZiVyttc05JTnE2M2Zhc3d6?=
 =?utf-8?B?Q2hKeFZrR2NGUkZRQ0ppT0JHbVB5M3JOM2xBbjltU1VLRVRzZjVwVm00WUI0?=
 =?utf-8?B?UHZqUkdUN05Ia0JIbnRBeXFjUzdXR2NpaEpNRXBVaXhxVXlHTDhCckZVRVJE?=
 =?utf-8?B?V1Q0MFBYLzJUamNnOVpFRm1kS3I3b0g0M1dxMFNPSy9uQ1l4ZStGbHE0REdM?=
 =?utf-8?B?UU04RG0zSVFDQ1hhRjJnNGxDU0tybVR0ZGJrdDl2eUNkdTVSYXhWNDZrQWhn?=
 =?utf-8?B?WjZpYklKSHZiQ0ZxS213UG1LWFZCcVlaVC9nNk1QVVpqb3V5bVBqYU04UGd3?=
 =?utf-8?B?WkIvZmV0RDNkZ1BkN1h6ZkdWM3dVV2NuWS9KRnQ0U0xXSjdVVXJFbDM3UFJE?=
 =?utf-8?B?bHE0MTFDT1JoV2ZDYk5GR25oanlBcEV2UjkvNk1leUtSQkZxOCtSOExRdXpP?=
 =?utf-8?B?OVVSZ2JZdjdFWVl6Q3U5STFhTUN0S21GMU1OY3kwcmJvMEoyYjVUZUR0QTY2?=
 =?utf-8?B?Z01JcUtaNkxBb2N1d0hkTjNKTDRkcFU2c2pUQnZqWjZxQU4ya1Q0T0c4Rklo?=
 =?utf-8?B?K2UyWVNFSENvZEhJUWMyeXVHQjVhS2JFNXh5RmtFUkV6N0hwZkt5cjZBTG9R?=
 =?utf-8?B?eUhFMGhmbzN2TWkxbzBNNmNuOUQxWDBHTnhuSWlHVnl5eHR3Lzk0RjBXaEEx?=
 =?utf-8?B?UnJpMit5VkQ1U0t2YjViNVhpdmJQdHRMSDU4RE9sOEx0VU9FUkVDNWFQSmRn?=
 =?utf-8?B?QzZtZG1qWGUrRHBXWXoyT0M5c01mVXk2eTU4ZnJ6VkxLV0RvQnk0U2NYbnZp?=
 =?utf-8?B?aXNQOTdCUThiVysyMW56SURRYm9qQWxrYjlsSFVWV1dVSGVkajZJUDJTTWxM?=
 =?utf-8?B?NTdUTmJvaXhNYlJHM084THV3ZU5DWUE0Z2ZHamNoZ1NyOXFhQ2plUTI2c2xP?=
 =?utf-8?B?dmR4enhOZHdRL1BYMGcveDdsL1VzbTVDSjUvdU5VN04raUllcHVQYmh2U0pJ?=
 =?utf-8?B?U05wUGluRml1K1VDUFBtc1FkSDdwdFBPSy9GY3F2Z1hiS2prNEhJOGNnZ2xJ?=
 =?utf-8?B?MFVxUUZqUWRFOTh6cUJJTDBOY0p2VzU1WlNmc01xNVhtZnFacmhSWEswQWhL?=
 =?utf-8?Q?EQuMluP03uxZYAb1wQsVAV0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f5e8db-1ca0-44be-3835-08de06c2cdf9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 23:31:28.5188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkWtXEg/MNEWUwVJX91t3UzU4kh00JrbTLIO1/TrqvCii/grvVdeYOP6XkQQA92AamN7qVNlq3z5jUxt5r/N5vQp2+HXZxUBEi1ZVCpAktE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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

On Wed, Oct 08, 2025 at 02:17:53PM -0700, Ashutosh Dixit wrote:
>Add a for_each_oa_unit iterator, which eliminates code duplication when
>iterating over OA units obtained from OA unit query.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> tests/intel/xe_oa.c | 21 +++++++++++----------
> 1 file changed, 11 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 012f5929ce..bc71bfcd30 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -477,18 +477,21 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit
> 	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
> }
>
>+#define for_each_oa_unit(qoa, oau, poau, i) \
>+	for (i = 0, qoa = xe_oa_units(drm_fd), poau = (u8 *)&qoa->oa_units[0]; \
>+	     oau = (struct drm_xe_oa_unit *)poau, i < qoa->num_oa_units; \
>+	     poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]), i++)
>+
> static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
> {
>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_query_oa_units *qoa;
> 	struct drm_xe_oa_unit *oau;
> 	u8 *poau;
>+	int i;
>
>-	poau = (u8 *)&qoa->oa_units[0];
>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>-		oau = (struct drm_xe_oa_unit *)poau;
>+	for_each_oa_unit(qoa, oau, poau, i) {
> 		if (oau->oa_unit_id == n)
> 			return oau;
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>
> 	return NULL;
>@@ -496,16 +499,14 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
>
> static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
> {
>-	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
>+	struct drm_xe_query_oa_units *qoa;
> 	struct drm_xe_oa_unit *oau;
> 	u8 *poau;
>+	int i;
>
>-	poau = (u8 *)&qoa->oa_units[0];
>-	for (int i = 0; i < qoa->num_oa_units; i++) {
>-		oau = (struct drm_xe_oa_unit *)poau;
>+	for_each_oa_unit(qoa, oau, poau, i) {
> 		if (oau->oa_unit_type == t)
> 			return oau;
>-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
> 	}
>
> 	return NULL;

If it's possible to keep the interface for iterators simple, I would go 
for that. i, poau can be hidden from the caller. Something like this:

// NOTE: not compiled/tested

static u32 xe_oa_first_unit(int fd, struct drm_xe_oa_unit **oau)
{
         struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
         *oau = &qoa->oa_units[0];

         return qoa->num_oa_units;
}

static void xe_oa_next_unit(struct drm_xe_oa_unit **oau)
{
	struct drm_xe_oa_unit *poau = *oau;

         return (u8 *)poau + sizeof(*poau) + poau->num_engines * sizeof(poau->eci[0]);
}

#define for_each_oa_unit(fd, oau) \
         for (u32 i = 0, num = xe_oa_first_unit(fd, &oau); \
              oau && i < num; \
              i++, xe_oa_next_unit(&oau))

static const struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
{
         struct drm_xe_oa_unit *oau;

         for_each_oa_unit(fd, oau) {
                 if (oau->oa_unit_id == n)
                         return oau;
         }

         return NULL;
}

static const struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
{
         struct drm_xe_oa_unit *oau;

         for_each_oa_unit(fd, oau) {
                 if (oau->oa_unit_type == t)
                         return oau;
         }

         return NULL;
}

Thanks,
Umesh



>-- 
>2.48.1
>
