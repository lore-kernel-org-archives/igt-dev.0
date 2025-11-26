Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9ECBD10F21
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFD710E5A5;
	Wed, 26 Nov 2025 10:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKnhfIJW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C09610E5A4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152922; x=1795688922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vyqqkYAwjRF+HXP4+aX7C4A/6odanaCfx1CcRegtF9w=;
 b=PKnhfIJWzKKyXVdle28e7J1jmW24pcQAg/4QPLXPwXngaFyrxkktqdLy
 rJ+rOVWnquFN0NH5Suwx5KvR5USLylb7y04cx1TbO0S8R5qWGDOJrHnox
 piuMP9F/EFg12Fbs4nIJ2eVcipfpRv2GVy8uftquTdXrKzEmvDDlcL2lA
 6C0OKrRkIPL//0z4OuRLF6Epu1kqnYULwH/0N9OV6e+Vy2dNEm55jWyNr
 O2GYMpXkGTKuIf2NRhRZSy5YwY9bbtFRovJfqaKxF+UBDRv2KRz6dgAJg
 ruJDB0j4jkM9LaxJuXGNVsCa8D9A5luybkUcfAdCwaN5cE9dlxZidBI6j A==;
X-CSE-ConnectionGUID: 25vVjOWDTPuw5rGyco4qLg==
X-CSE-MsgGUID: dpuPQRVbRXWh7lGdbMvUiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="91673468"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="91673468"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:42 -0800
X-CSE-ConnectionGUID: oGpjJxv3S46jLxpGqQtibw==
X-CSE-MsgGUID: bM51bvIOQLKYRoxfWSfB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192695952"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:28:41 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzKP6utkPh6wwA1EkLUCe7t/EcfW7yNjCDprt9DrToiMT03F3+Qyl++AgC5oZ7/Tr01u6/3qHLcUfOsXdbf/cP/mglJ06tBn4rWBJm/2IZTcyt+XmM5nbkir6BUltwvMhfAoCoil4NHpkbUGSqn6sHJHOzT0e/k2BN+k9CKDua0eEibw9IH9IKX9inc4W4Yv1i7Eok4ybgR4BX1gTVHZg1F/O456TNvRAQEHfRhAjNEuMGeEyYCjAqqSeHibm4WFaiCRYyRzMKsrKElHXaqP9XT1nZ83pIFeC6CPMecdmLCRz1Y+TRecqdVpbG+OVRYtLRHiDel+wJ3sAdwhTENguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf9rtJ+uUbg4WYYfTVeUSijIKaUlKU5YLgyrgZMUu8k=;
 b=fbPUEQbTtyPsG/Ig1tLWGcY7maW1LMn5R+98qi1izk6j12RDw94Wd5nB2Za614wnohErIUfDlUOUmDwG3s5bksEvqoUL7h/pKjIu1OG2Yef4BSd0E4URjSdKy1HEOX8oHWC+rBzotjnZ/LVcfJyVpz9CsZpFnvEh8sVQ+sk+c4aFVaY9tCcrSAqZl8i1u0DFlipDGcT72frSE+KQRJAdtcbCmbGXJySrSVnURT+jWQKYVDu8klLHCu0pOQ3Gj1l7WTkCBIcLQno13Eyb1nwX55ffQBoTZ/RLtJXXw7bNTtjtZSd7QZUuCpgU19plfqNUbs8/FBcBRqznPzCdlMb8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:28:39 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:28:38 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 1/5] lib/igt_dir: Allow scanning only the current directory
Date: Wed, 26 Nov 2025 11:28:23 +0100
Message-ID: <20251126102827.47844-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102827.47844-1-piotr.piorkowski@intel.com>
References: <20251126102827.47844-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0359.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b41d790-4c36-47a4-82d3-08de2cd6903c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1UrSXNnRytWZE5uTmdnb3Z2ZGluQ2YvRmpWdGVZWVF3SmFFSzlUdXo1bDFK?=
 =?utf-8?B?aW41aWcyTmlZZ2VvRWQvYUdyMXM1SHltdTk3YUFLeXM2cGFVL3lsQnJVVnZD?=
 =?utf-8?B?d2pnQWZzaXpDdTRVZ29zc1AxVndqbVFUWUhScWNtTTZuY3BPeGZyREtrZDBU?=
 =?utf-8?B?UlFxTjNYQys4V3RldzlzeVpTbmgrd2tQSVdDS2xsNSt6bGswcmdPM0drSnFG?=
 =?utf-8?B?ZWFhN05lUnNLdFpaS3JWdHNMV0dTaUM0L1pKMDVnSlQ5TmFhLzRFMDBFaC9j?=
 =?utf-8?B?VVhianhyUVI4cGptWXVSNTR0ZjRsbWRBNEM4cjN4WVBkUDVCNlFnd1BxTmxk?=
 =?utf-8?B?eHFPd2RGdDREK3Z3UHZMcW4xTXYxL1VsRHNNSFRiRzl2ZFhPUnhvenV1VVRJ?=
 =?utf-8?B?RGV2d0dvb0VBOU1kZDZHTXFLa0sxc2YxeE11blhkbTloNG83QjVDMmt2YUc3?=
 =?utf-8?B?alZ0WXU0UlhOczRoQW5iVVpORWQzM1MrM0thZWxzQ3Yvcis2VVR3N01jSWxG?=
 =?utf-8?B?ZjFxSWhiTXZ1QWRyam51RHhENDNFaXgwSEdHK3FZaVpqeHNIYzNSYmxNZ1NT?=
 =?utf-8?B?REdYKzZVYmYvTjN5RGZwNU5Rd3ZvbDU4SGZlVlJsa3lGQy9JdjJUOGtXN3hL?=
 =?utf-8?B?M2FlWFAzclkvQTBScFN2V1NPOGdSYUg1VVMwUVFFQ0M5djhqN09zT1pQQzRu?=
 =?utf-8?B?bTg1WlBMcENjV1ZjNGJPMlZ2V0ZJZVFNMk5KOWhPeTZTT0lpbVlNMWpSRVQw?=
 =?utf-8?B?b1dFZGdFQ21pUW9DZG1QMGpCSFZjUEVyb0NhbFpVK1FOTXlzWnlwajVrMCta?=
 =?utf-8?B?UEVFVmczN3VVV3krVEhRNkg1OTRkOEh1SEhNa3VJUDgyVVhnSVpqQ0l4eEFV?=
 =?utf-8?B?NlpIZklyUEZZcFdRR2JrbnE1RkNydlJpaXQ0QTZqNURxZ0ZJbGF6OXVra3FY?=
 =?utf-8?B?Z04zaDhPMUlXN09WT2VGTm0yYUhyTWd0RTBPdjVhVDVFbmNMajZUYlI3enBC?=
 =?utf-8?B?Y3B3dVo4VjVOMnUzVy9idUthMGUveDRGM0dTQW1hVnVsU2lKQk53SE1PV2Q3?=
 =?utf-8?B?eEJQendjc0xMU3QvSGVxeC9rZElLdFFydi9oTDJWeXIyMHhIYXgrcERuSmFH?=
 =?utf-8?B?b2ZzMjlkRkU4eXF0bjIzbUJBMmpKNFNPWGxFY3hwdjVjbGhXYllNT1d2aUc3?=
 =?utf-8?B?elVVM25ITzB2M2xLS3hvUE93NkJ3MThreFpvYy9BVWJ1VXdETy9GTWV0RU9s?=
 =?utf-8?B?eU9QQTlzUWd4aXBaenZDS2dBL000Vm52a2lYQjlzakRoWEpSWUZnTlczc3FS?=
 =?utf-8?B?dm4rVTZncXlLR2tCMkxRYktvdngrb3hjVmhEUHhWNG5hQ0tVaEJ0WGdqN1R4?=
 =?utf-8?B?VEZnZVo4Wm93YXBDalpIQ2dYeFZBZVRPczMyRnZMQXpzNWRCREk5NXVVUHRp?=
 =?utf-8?B?NitkUlpuTnZzTkxiSGJPY0ZSM0tTNU5ySm5JTEhiQis2T0ozQnpiWFFGQ3Uv?=
 =?utf-8?B?eGxlbjVOTjFvVUt6ellPeFRDSXFQd1RLZWk5SnhyVXZMQmptUmkyQ0hZYkdW?=
 =?utf-8?B?N25Bc3p0N0xHcGRPOWZQMTZ5SzdmSGR1eTZZb0pHODcxWkU2eThHSEpqbzhh?=
 =?utf-8?B?WDRZMk1TMkVWM3ZxWStLR3MwY0RWODhEVHR4MXJjTTdaYU5mdXlqUm82cUVS?=
 =?utf-8?B?dzh3Mk9GaFNjUEZFSlpaVzExMGltTzFLU0QrallURDZqK2RzT2laVlJVN2Z4?=
 =?utf-8?B?Mk5OWndGa3VpTEI4UUdmeTZTTURqNUgyYlhlWVZQbkNOY1VlRHMwa2lKenRk?=
 =?utf-8?B?NUdPdllGR3FBWk9PTkF4MWhWTXJxWFJpUnExZEo4OC9jVDc0bFBMVGVHbkQv?=
 =?utf-8?B?UTB0dUtreU9yNC83QmJKL0RJL1QvNG1jWDBIR2NHZi9DUkZ3dHh4NlIxWlRP?=
 =?utf-8?Q?IbuDyVnphffqavELMV7OdvOsKdsZejKl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHRRZ2NmNDBHT1BrNE9oZ2RBVWlKTDdzbXFocUMxamVURDNkSW9ac0x4TlBh?=
 =?utf-8?B?akoybzdPaExTOVcvZlFvL0hsZUpyOFpiaXRNN0RyTTcxVUVmVWpuY3hwVFRv?=
 =?utf-8?B?bWtabW5WQ0w1UitzR29aL0FUNngwTVBwaElyTU8vaU5ZREVkdUczMVI1aWRD?=
 =?utf-8?B?SWcraFM1VExsY2FMN0ZqSmZsb05UYUU2NVFHenBrSjI4bXZVY3Azd2VhVGQ5?=
 =?utf-8?B?T2dJUGtXNERnOXJuZHEwRnJ4QmRUWlJhVk5RRnBNV1RLalN0dVZ2c3JTdjRC?=
 =?utf-8?B?ZCtEVnhyNWlVUTc4S2RPNHFYZ0wydk94QW1ZVjJ5aG5GWWVsQk4rOUp3K1Vh?=
 =?utf-8?B?bjNuUFA4Yjh3c3MzVHVmREJuR0U0ajVwRnV4QzB3b0QwNEZQSmZ2TTRjYUR5?=
 =?utf-8?B?Q2dKTmpoMzZ0ZjlqMGtBNkZBVG9yMzA3cEtMT0FsWHhGN3JlWEtQT055ZDZV?=
 =?utf-8?B?eW1mR3ZucE1JY0VIUFNGekhMRFdYaUl2VHBxRnJzOEhXRlZuVGdES3FGQXNN?=
 =?utf-8?B?Z1B6SDhXbVh1bWpPc1RjVmZYYk5DeVovVmF1R3ZmR1hyaGI3RE9aRSsvUHFK?=
 =?utf-8?B?b0VGMUxpQ1JnbXI1ZFZVZGE1VWNxNmJ2ZUptclNnMDIyalZ5ZTRXQzYxMFNu?=
 =?utf-8?B?T2xXb2l2WVFPb1lnN1I5V0JPUnVRa0VFdjVwbGNzajBQSGRRUldXNFc4aU5Z?=
 =?utf-8?B?NFU2UFgvMkZlaVZDZjJmM0lXNXZ0UlZnYXJrcHR6U0RRSzJzdWt3VStqN0JK?=
 =?utf-8?B?RW1aTUNkaTdaUzkyM21KblRuU1VvUFdwQmNLeDc3NjhkSDFLSi9pMzA2U285?=
 =?utf-8?B?bEhSbVA5bmlTQXZ3U29MN1NEM2wvSGF0TkVkRGZvY1QycWlPSE9kYTd1bzln?=
 =?utf-8?B?My9NOVg4R2s0Q2F5VUREem91MnJFdU1RWllGRlFBV0hIN2oyWjhhQWNwcE9M?=
 =?utf-8?B?cHpGYVQzaUUwUGRya1M3SEJqVkhkMEZUeFVGRDh4QXVYU3c2bU5JTVM4SWxy?=
 =?utf-8?B?NDFORmtKdXZ0SlJHQm1FVFBtWFNGajU3RnBjb0pwa04zeE43MlZQYVRsT093?=
 =?utf-8?B?VDFiaDNYMUx4SUxYSElsUXp3UnYzNjJkeVN5OFYyV05qZWdjeEY0aVVGRHk3?=
 =?utf-8?B?RGE4VmtlWnJqUy9JMU5QWUl0VWluUGVuMnk3VUUvTVlIclVIaXp0Z3liM2lj?=
 =?utf-8?B?eU02dTZ5ckp1VEpuTWNXdUEwUXZRVzdxRjZ4RU5BaUhvSVl6dDA3dkVONU1i?=
 =?utf-8?B?MlI2WlNQcTF4YllVYyt0SG1nUi9DVlVDcWxVWHd6Yk1VUjh1QUU0NlZtMU5u?=
 =?utf-8?B?RmhYbHI1VkVVTmpxdGxCSlh3bVZCZXJNMi9Kb1BQZlkwQ3FyeFYyV2lZTXl0?=
 =?utf-8?B?WEdmV1lDdm5XRGdyL2JCUFg5WUZjR3hQM0RnZ2U5Q2Y0MmY2Nkk4TW9qeXRI?=
 =?utf-8?B?R0NpaDdpYisrck5QYlFkc0lpUzM0S1B4YWR4M21JcmVVT2ZNNndoQ3I5NklK?=
 =?utf-8?B?clB4czdCbnU0MkFLU2ZDaFhYVzhWWlRhVVJVcDZGd3lFUnoySGRFengzRlpB?=
 =?utf-8?B?L093OFg3dWNPMTU3QTFzUnFrdWxKMG1HaGJyT0xNSFVsR2VOQ2VPZ3NRU3ht?=
 =?utf-8?B?QTdUMWNqWExvb2lpeXFOeVcxU2dyem9lWTJYZ281VHJqNFo0Zzc2WXN6bllH?=
 =?utf-8?B?MlRWZ2NLMk5ROThpUEZyelA0eEJ2NndTbGROTURZQjZ1L2pnbHZyRTJpRWRh?=
 =?utf-8?B?NGllV2ZBOEJ0M1ZJaVVESGVKS3p5K3c4b1R0NXJXZU9nbTRnR0pnWERBT09w?=
 =?utf-8?B?UUNETE1wL1pRUmYwTjIxUUUyNkVRTUNJeS9NT3lySFk3Tm9LN1BLSE5sYkcz?=
 =?utf-8?B?WFFzTmNaSE5vdS9rclRGMDRMaldrcUJEenMvTFJmV1pQQ09SQ3JCS3lCRG1o?=
 =?utf-8?B?bGQ5MDJNVkNpVEJHelRlMGtqVHo5ZlR6NXFsQWNFM3pNendrQ0E3S2wrcWtR?=
 =?utf-8?B?MGxWMGhDNVFCNkw0bUdWNWVaOVJhMHEwT24xVnltOThobTZSOGRPZmZJb2Jo?=
 =?utf-8?B?eGNUZ3RkbE5zYm9OaGVncGNKTkFwMFlRVnF6QmN5N0tublNTNUZjaDZTL1RO?=
 =?utf-8?B?ZUliaWRoUGY4VnRJR3VGKzRMV1VTanRNYWRwMC9VREsvY05hS3RTdFpkTDJE?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b41d790-4c36-47a4-82d3-08de2cd6903c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:28:38.9337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3nUSlpxM08DYCVuX0H98Jo29pLy6YCJfJsXMqWiSMm7pyCQGF+THsgwwRIdEL9PDq4+4YijO/O9oxcmo7Nuf4crlsZTVkNNkUXAGBNjWxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The check rejecting scan_maxdepth == 0 prevented callers from
scanning only the current directory without descending into subdirectories.
Let's remov this restriction to enable using scan_maxdepth = 0 as a valid
mode to list entries in the top-level directory only.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/igt_dir.c b/lib/igt_dir.c
index e232dbda9c..6ef8e859a4 100644
--- a/lib/igt_dir.c
+++ b/lib/igt_dir.c
@@ -241,7 +241,6 @@ int igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth)
 	igt_require(config->root_path);
 	igt_require(config->dirfd >= 0);
 	igt_require(scan_maxdepth >= -1);
-	igt_require(scan_maxdepth != 0);
 
 	/* If the linked list is not empty, clean it first */
 	if (!igt_list_empty(&config->file_list_head)) {
-- 
2.34.1

