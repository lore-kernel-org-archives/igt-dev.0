Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857E1105D993
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 02:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E610E514;
	Wed,  8 Apr 2026 02:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUMEM1tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C08610E514
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 02:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775614545; x=1807150545;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qbNFy0cIcXjnml4Yia+d3hvOw1+mO/q6gO7oiAtfzOw=;
 b=UUMEM1tr1dgbz+q/YJEGZl1HsTL9R4u3yeTTE1owd9gI11RU+dMyqjM+
 ihKqmm7jdR/nyMLravoOGzY7dItNPk0zvxbdWrBi0nDi1jClrnEEnKlBj
 BtKjYJBWY3ouhRITaHX4eZwpGtg8rKYuiAoFcsfvMwTkqnPNEPoNATP2z
 w3pTYAVfA2/LgxWnGLC71LtPYrnxUoXQI4v/oEfkn+/959TSoZsE6wu30
 yNBHZ70S+uuBAkxUa6BWV+fWTjkxl3/z+amHmXLinu762DtBiTQWQIlzB
 w8TigsoOVBP+ngV/urcU7DwinLWFGZCtnVOJqErW3Zo6LBCmMNpfxHrqp Q==;
X-CSE-ConnectionGUID: TkZT6JGWS3CkKhrNClTvDw==
X-CSE-MsgGUID: h0d5udDKSVW4mbGwyzgLLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76776143"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76776143"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 19:15:44 -0700
X-CSE-ConnectionGUID: f9DCPpN9RCe5OaAMCS3C4w==
X-CSE-MsgGUID: cIFdmnCYQQCymrKFYUjCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="228273909"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 19:15:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 19:15:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 19:15:42 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 19:15:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWdz/PaEQ8gMHqSh36ghaRrfId6KWkHTfDmivKell9XwLlGvIvPRN8USnVcSf3OlEGWfJu3svV+uPoHSKLlRtgwtic5NqwoGP03LYYM+tWqXFTn4qzqYJzejj1tM896e36on2OzxlpXIwXGS/Na7iwt+LVV100l6SPa7cZ3OsqbODi54uh4/msTmH1Cnok5JI3gug6QH5+riBBHQ798FvzD9A5wsMJhK2gxFj/z0UYEltw26JXqAhXpg+UDdXQOCwoTrt4ANK8W9GU6Np046Bz1rBqukdhO9K9pATZ95LbKvTrmY7+NmuJFr9qyUOQ4Bk2a40OaOJzp+OffyKGwUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsS851CaLneE9OJiEu+TgPH8WCpBQMXFrQtQC4nAFU4=;
 b=UXV8QAPdYzR0VqYLv+1zKGRl2oTggEu8fWDY67XpX4WNWT6Ek1AIYsZYCIJ5hDd2fWQ/6tx2t2GEWphVAEWQgApkc4XDBXCbttot2e6Z2p7QjaTJywZ38O6tBCHiuyRpFBWvu+X8t6tbDNjUwmAxOV8gbT6/A4HPAevPIsJ1pA902pU32E+9myh0o/obf+v95sW6YL0Y2iVTTZ+/BrxU/+MYxBCD2fpgtb+Gqt5I4+AzIao3dWCir3Hivj+ucP4dz5LCbAzMveuHLA2dD/k1mtBi5JTqU11FVJlvQQg41YfoXxywmQZHD7407HIpCWRyAVYwmmFdyXZoJ4GVbRVWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 02:15:38 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 02:15:38 +0000
Message-ID: <35b8b310-3319-4919-a140-52afe460364e@intel.com>
Date: Tue, 7 Apr 2026 19:15:36 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi94ZTog?=
 =?UTF-8?Q?query_engine_class_capabilities_from_debugfs_info_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260403071322.366766-1-x.wang@intel.com>
 <177525930083.431931.10667650489703215079@a3b018990fe9>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <177525930083.431931.10667650489703215079@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SA0PR11MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c2a717-6c3e-4802-1de6-08de9514b9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|56012099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: J5HwpMowtM+HymmcjAWkHsM+H+29Y9woTzYtkNnxn30pF4VfNHj25Om2pwT9Vkjx8PCGp9aK8e7T2G46cnKCPeOagdvfXhe044Twp+5mQTvRIYPyowHVbvAKqtirSF9LBy9Zcv2mDg2ALwVfaOnjBGBlkCe+dstkAA+XqoJh4EPFPG4RwYP04sdI6uuwlM7LqYroWzNXUyb+9USOoh54boTX86ttPNWt8qMmomTeVmGnHUq6a5PWfI+rB4Vj7lI0kY15XPaOCcF+MrAMA8XYj5OOko+ox3ORwZaqp7A7boUpcYujLFECKMCr+ZGxRW4eKChACJ93KbPeknjSwbyYRXW4nvjs2C1ujvEqnFP2bFdrrwqgMiKQGH4xWzvbYTEXA4MaQ3z16N+dxutgXkt+Dqj3rhOrxGg3BXyq4pTjNcoxchPKcVLC9bgxtUBMr7qDoddmgUDhX/W3SZhP5G6vvECiUmR8nlHUaky3H6hncuuZrZSH0ctVT6c5Uc4j1ETdHm9QQ9dJm8UFOm7PS6cne2MYhoKP7dUz+9+C92w2tsnbkLTxBtiV17fjBKZ2XrQ4l/HDOH794A9Nqe53Zhmhe6Iql9FcolxOwnQg8SmrX64Dc45P3wUkExf/o5bo3W+PxA7YVVb2GSFoiozl+YuEm89VvUrjH+gowULt4RRTiNjh8qsiMiv5c49MT79A/hyc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(56012099003)(13003099007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFNDMHV1anJRTW40N296TGtzRHJsRzVYNEJHQ0FBKzNWNUcyMk9BbmFBZ0sr?=
 =?utf-8?B?OHBQb1gweFJKeTlVNEpqMC9Ba01sSE15djM1bjJvL3FMSERsdHhTekk2bEVn?=
 =?utf-8?B?SWNvSWlvN3hXV296YVUrbXYvNUVldW9EUzU5RmhtNnVEL2ZueGcyRlJHeitB?=
 =?utf-8?B?NjM1RHBQeDVqVnNMMksxcDRYMkRwamhUL3dLcVJoUEdDd1d6NS9OU29QNjdF?=
 =?utf-8?B?dGN5a3c3T0NvbHRsckpBT1Yyd3Y5UmZXaTA1bHJHa1JWNFhFZVprek81Zjkr?=
 =?utf-8?B?UUV6QnFHTTZOUzBBaXVLb1lCbis2ZFovUW80a1hKazEzTUF1ZlkzLzVDa01a?=
 =?utf-8?B?MkNLekhMNnEwSVZlZXZLY1AvRkpESExFdFVsMWwyc3dYZ21uRThRNFZHN2NI?=
 =?utf-8?B?T0s4MG5rWUZUYklvbjY2OWJZRjRBbUw1a014Ly9uaWgwOHBGR0c3Uk9tQk5R?=
 =?utf-8?B?WWgrQ2QrNm1pUUZsVVgwNXVmeUU4S3UzNmNiNkl3OUJFOEIyL2tuTTN0TmxX?=
 =?utf-8?B?Q3dYTVlJa2RBU2R2VUpKZVVUZDl2dDY1Vjd2SXd3Q3BGYUJ1LzZ0aWtocnlE?=
 =?utf-8?B?Y2psYnpqYXVWNDNhbW0rRHhUR1VsQ1BrcGRGUTFjUGtOakJldVh5NDJLaS9p?=
 =?utf-8?B?Zm9TckJOcVpINk03R09VZnVoT3YrSnVGNjF1Q1dWaE9WMW83dVM5ZkloeEhC?=
 =?utf-8?B?dklwdzNIWmRaMDRwNGRsakRLeGlQQXBlZmtxVk5UcDJuMVdwS1ZPeisxMjJC?=
 =?utf-8?B?NzVlaHlVYlA5TGViZjdIRFB2NktPcUo3ZXZuejY0bWVINWlLd0xLb3kwK1Bw?=
 =?utf-8?B?MmRWNDRDWk1EazVlcEJQNFJRaG1FSU94OEtGVUJUajJlSXZmQkFUVGlMZzJv?=
 =?utf-8?B?UkgyQ3gyM1Q2cDFndStDamtDRmoxaFpFUjJWczVzUXNvRkZtY1NYbmkwbE44?=
 =?utf-8?B?N0kvVmhnVmJqSURIR0wrN0NLdVRJbWNJdkV3RUlDYnh6cHZCaTh5eTJmZHl1?=
 =?utf-8?B?NEp2cUl0TjU4T29iajdVaFNLYzBrNlQzZWFjSHVoS0c5T1RZeTVqdWFobUVu?=
 =?utf-8?B?K0kvMS9oaEphcXdSSExBanQ3UnJnSGZrdkM4OVVBWXkxUytyUVl0NGNBVWcy?=
 =?utf-8?B?SHZjaHd4RmpGbDBOZUR6ZVd0YURhaXJZc1Y4ZmVBUCs4Y0xGMUZ6WHVuTGQz?=
 =?utf-8?B?V21yc2I1Rk14Z0VlVEg4SytrSWxIeUVscXdaT0JoTFdlY3I3NG93NlgvOStm?=
 =?utf-8?B?c0hnZjZlay9OcnJuRk1sc01ZU1VWTVc0VXVCaFgvSDhROGM5K3dWaDJwY29p?=
 =?utf-8?B?SG1zNytGK3orUVFRVWhpdUFsL1dYdm1CTDJCcTFmTUZvajdvZXlKRnpHWFVw?=
 =?utf-8?B?NVA5TXhpbHg5WUVUeGxlQzNvV2RJNy8rcGNPN25VMHNPckVZS3B4elNBSkJW?=
 =?utf-8?B?clRDNmJzbCs1MjJhaTByTEpjWUdVNnE4Y3J2NzR4amNoRGJiaGxtNXRHU0Nu?=
 =?utf-8?B?Wkx2aEpWQzJubDRiSGxSNGxJOHRVaUhjcTc0V3M5TFhtQmE1NW5tWHQrZDh1?=
 =?utf-8?B?L2N6V1kvT3UzRFl6K2VzRFJYUkYxWmJJTG9JYlQwdmxocEhuYTViODhjS255?=
 =?utf-8?B?ZzhSVzd2U0ZhMEE5bmtGcVFDMGFBRzdnOXFyU09CNFhrQTZaME83bmFyRndo?=
 =?utf-8?B?WHJCdzJudVNPamxQR1QrVjc1d1grazhkK2owc2N2bVN5SjZuYzJoRDZVeFJQ?=
 =?utf-8?B?WDlwa3htWHpRb1IwYWtINmV1Z084MG9SaDIrcnI4UURaT3pSYUJwZ3VUc1lS?=
 =?utf-8?B?a2NuZ0VNTnhKZTN6ajNVaU5YWkxjMlo2K1dTaHh5bjdFVnpHdENDckpZbW55?=
 =?utf-8?B?YU5ueUFwOU5nTzFFTERqTUIrMGE5Qml6T3NxRFpKQml4aCt2NzJnN3Y2V1hG?=
 =?utf-8?B?a1NHS2QyaWNPajZlR1hKOXB0bTh6eWNnVUtHM3p6eXhkR3BuZU9qSkJRVXJB?=
 =?utf-8?B?MVhtaVFMdHp0RHlOUEdqVlNlV0pDQ3MxeU00a3ZocjNSUDl6L0pGWmNkTzB1?=
 =?utf-8?B?OTY3S3pyd0dhbnVCaTZoVk43dTQvTklwLzhCdGp6NGJ2alM5UzBFVTlrdHYw?=
 =?utf-8?B?LzNoOGIrazdmM25FWDA3KzVsY1RQYU9DYlZ6akN0SEEvbWJUa0tvV0d1NFNu?=
 =?utf-8?B?T3FPd2sxUDAzUDNkdVhjd3lobzJqbVZvbmduNzlObjBtS2ZTQ3dCenN0T1ls?=
 =?utf-8?B?Z3dIeXh2aGZSdjkrMjVOTXZwL0hoUzB5bEZXRWZ4UHRnN0lZRzVzL0NnTzJm?=
 =?utf-8?B?a1pGM2hGNmkvZDdOYitKUmQrTzRSZUNkUU90ckJhSWhKTVB4SDk1dz09?=
X-Exchange-RoutingPolicyChecked: E+ySHYEYkQuUJ5gwygQowU2/xGEQRMOX9xSB5VQpewgl2Y+VSe+nrvMBZ3f6l9zkcjuWmgVDVLUJ8YZmkIpiCQ7myJ8EFy+6s6DbiuIaE9eTFprR5DLaA+HrIKj7S6XnBRj56aR88pY/Bv3y7laspbn2x59wfqqj20Lep2jbbn4r14eD8Fm4MsYR7jWhyR0BqDWPCFAGCSisSoOZuHxgMGVVv1tb3KtMZO9znzTQRVlLQJvS+BtbFJRToYagoN41WGvQPz8ilx7Ed9Xs5f5XBZKLzMTwPUWcNRCzzJKNRlAOP6qj8RaINmZahCd8bLbbuRZ2/8ED+PoaeUz6owErRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c2a717-6c3e-4802-1de6-08de9514b9b1
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:15:38.3612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdJvPqv7jXgYiiDjIvO16vLW9Hwo0yRzBMJnhZ1D6D/Le2TDGy+Nne3nRX711RbnGxtl15AYQBNFbWz0NHbjpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
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

On 4/3/2026 16:35, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/xe: query engine class capabilities from debugfs info 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/164327/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/index.html
>
>
>   CI Bug Log - changes from CI_DRM_18273_full -> IGTPW_14925_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_14925_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14925_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/index.html
>
>
>     Participating hosts (10 -> 10)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_14925_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@gem_exec_fence@basic-await@ccs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-mtlp-8/igt@gem_exec_fence@basic-await@ccs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-3/igt@gem_exec_fence@basic-await@ccs0.html>
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-19/igt@kms_force_connector_basic@force-connector-state.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@kms_force_connector_basic@force-connector-state.html>
>
My change is in the Xe specific test. This isn't related.

Thanks

Xin

>
>     New tests
>
> New tests have been introduced between CI_DRM_18273_full and 
> IGTPW_14925_full:
>
>
>       New IGT tests (5)
>
>  *
>
>     igt@perf_pmu@fbc-2p-primscrn-cur-indfb-draw-render:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@perf_pmu@invalid-default-ctx:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@perf_pmu@sol-reset-invalid:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@perf_pmu@system-suspend-modeset:
>
>       o Statuses :
>       o Exec time: [None] s
>  *
>
>     igt@perf_pmu@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o Statuses :
>       o Exec time: [None] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_14925_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@unbind-rebind:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-mtlp-6/igt@core_hotunplug@unbind-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-6/igt@core_hotunplug@unbind-rebind.html>
>         (i915#15498
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15498>)
>  *
>
>     igt@drm_buddy@drm_buddy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@drm_buddy@drm_buddy.html>
>         (i915#15678
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678>)
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@gem_ccs@block-copy-compressed.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-5/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_ctx_sseu@mmap-args:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@gem_ctx_sseu@mmap-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@gem_ctx_sseu@mmap-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@gem_ctx_sseu@mmap-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_balancer@parallel-keep-in-fence:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-in-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@gem_exec_big@single.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@gem_exec_big@single.html>
>         (i915#15478
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15478>)
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-tglu-8/igt@gem_exec_big@single.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-3/igt@gem_exec_big@single.html>
>         (i915#15478
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15478>)
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk9/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-7/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_fence@basic-await:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-mtlp-8/igt@gem_exec_fence@basic-await.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-3/igt@gem_exec_fence@basic-await.html>
>         (i915#15263
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15263>)
>  *
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>  *
>
>     igt@gem_exec_flush@basic-wb-ro-before-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-before-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_flush@basic-wb-set-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-17/igt@gem_exec_flush@basic-wb-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>  *
>
>     igt@gem_exec_reloc@basic-cpu-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-read-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-cpu-wc-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@gem_exec_reloc@basic-write-read.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +10 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-noreloc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-6/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-10/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_suspend@basic-s3:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-1/igt@gem_exec_suspend@basic-s3.html>
>         (i915#15131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131>)
>         +1 other test abort
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +3 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#12193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html>
>         (i915#4565
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-engines:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-odd:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@gem_mmap_wc@copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-6/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +1 other test skip
>  *
>
>     igt@gem_pread@self:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@gem_pread@self.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@gem_pread@self.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_pread@snoop.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_readwrite@beyond-eob:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@gem_readwrite@beyond-eob.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@reads:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +3 other tests skip
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@gem_userptr_blits@coherency-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@relocations:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-10/igt@gem_userptr_blits@relocations.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@gem_userptr_blits@relocations.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@gem_userptr_blits@relocations.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-9/igt@gem_userptr_blits@unsync-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_workarounds@suspend-resume:
>
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk11/igt@gem_workarounds@suspend-resume.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#14586
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586>)
>  *
>
>     igt@gem_workarounds@suspend-resume-context:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@gem_workarounds@suspend-resume-context.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_workarounds@suspend-resume-context.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk5/igt@gem_workarounds@suspend-resume-fd.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#14586
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586>)
>  *
>
>     igt@gen7_exec_parse@basic-offset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@gen7_exec_parse@basic-offset.html>
>         +6 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-2/igt@gen7_exec_parse@basic-offset.html>
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>  *
>
>     igt@gen9_exec_parse@bb-start-param:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-8/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +6 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-12/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-10/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-8/igt@gen9_exec_parse@valid-registers.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>  *
>
>     igt@i915_drm_fdinfo@busy-hang@vcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-3/igt@i915_drm_fdinfo@busy-hang@vcs0.html>
>         (i915#14073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073>)
>         +7 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-17/igt@i915_drm_fdinfo@busy-hang@vcs0.html>
>         (i915#14073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073>)
>         +5 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@virtual-busy-hang-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-3/igt@i915_drm_fdinfo@virtual-busy-hang-all.html>
>         (i915#14118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118>)
>         +1 other test skip
>  *
>
>     igt@i915_module_load@fault-injection:
>
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@i915_module_load@fault-injection.html>
>         (i915#11815
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815>
>         / i915#15481
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481>)
>         +1 other test abort
>  *
>
>     igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
>
>       o shard-dg1: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html>
>         (i915#15481
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481>)
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         (i915#6590
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>         +1 other test skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-idle.html>
>         (i915#14498
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498>)
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-19/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>  *
>
>     igt@i915_pm_rps@basic-api:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@i915_pm_rps@basic-api.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-10/igt@i915_pm_rps@basic-api.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>
>         / i915#6621
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@i915_query@hwconfig_table.html>
>         (i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>  *
>
>     igt@i915_selftest@live:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-13/igt@i915_selftest@live.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@i915_selftest@live.html>
>         (i915#15560
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15560>)
>  *
>
>     igt@i915_selftest@live@gem_contexts:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-13/igt@i915_selftest@live@gem_contexts.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@i915_selftest@live@gem_contexts.html>
>         (i915#15433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15433>)
>  *
>
>     igt@i915_suspend@forcewake:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk5/igt@i915_suspend@forcewake.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         +1 other test incomplete
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@intel_hwmon@hwmon-read.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-12/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +4 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-19/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         +16 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +202 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
>
>       o shard-glk11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html>
>         +56 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +40 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +9 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +45 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +19 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html>
>         (i915#15582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582>)
>         +1 other test incomplete
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +54 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +61 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +84 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#10434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +2 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-10/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +9 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_color@deep-color.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9979
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_content_protection@atomic-dpms.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_content_protection@content-type-change.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-7/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>  *
>
>     igt@kms_content_protection@legacy-hdcp14:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_content_protection@legacy-hdcp14.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-3:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-10/igt@kms_content_protection@lic-type-0@pipe-a-dp-3.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_content_protection@mei-interface.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-snb5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         +27 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-19/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9067
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_aux_dev@basic:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_dp_aux_dev@basic.html>
>         (i915#1257
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-mst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-8/igt@kms_fbcon_fbt@fbc-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#9878
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878>)
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_fbcon_fbt@psr.html>
>         (i915#3469
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-3/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_feature_discovery@psr1.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-6/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +9 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@kms_flip@2x-nonexisting-fb.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (i915#12314
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314>
>         / i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html>
>         (i915#12314
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314>
>         / i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-19/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +11 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (i915#10056
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html>
>         +162 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +10 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html>
>         +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +31 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html>
>         +38 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_joiner@basic-max-non-joiner.html>
>         (i915#13688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html>
>         (i915#13688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@kms_joiner@basic-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +2 other tests skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-7.html>
>         (i915#15608
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-1/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +3 other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (i915#12343
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_pm_backlight@fade.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_pm_backlight@fade.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-14/igt@kms_pm_backlight@fade.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#9340
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>
>         / i915#6805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805>)
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-1/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         (i915#12316
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-snb4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-glk11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-12/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@fbc-pr-sprite-render:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-dpms@edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-2/igt@kms_psr@fbc-psr-dpms@edp-1.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk3/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html>
>         +388 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_psr@fbc-psr2-sprite-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +25 other tests skip
>  *
>
>     igt@kms_psr@pr-primary-mmap-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@kms_psr@pr-primary-mmap-gtt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +8 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_psr@psr-cursor-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +1 other test skip
>  *
>
>     igt@kms_psr@psr-cursor-plane-onoff:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-9/igt@kms_psr@psr-cursor-plane-onoff.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +17 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html>
>         (i915#15500
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500>)
>  *
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html>
>         (i915#15492
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492>)
>  *
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-16/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>         +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-none:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-5/igt@kms_scaling_modes@scaling-mode-none.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-17/igt@kms_scaling_modes@scaling-mode-none.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk6/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#10959
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk10/igt@kms_vblank@ts-continuation-suspend.html>
>         (i915#12276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276>)
>         +1 other test incomplete
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_vrr@flip-basic-fastset.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@kms_vrr@flip-dpms.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-8/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@perf_pmu@busy-accuracy-2:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-14/igt@perf_pmu@busy-accuracy-2.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@perf_pmu@busy-accuracy-2.html>
>         (i915#13562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562>)
>         +1 other test abort
>  *
>
>     igt@perf_pmu@busy-accuracy-2@bcs0:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-14/igt@perf_pmu@busy-accuracy-2@bcs0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-18/igt@perf_pmu@busy-accuracy-2@bcs0.html>
>         (i915#13562
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562>)
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk3/igt@perf_pmu@module-unload.html>
>         (i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@basic-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@prime_vgem@basic-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@prime_vgem@fence-read-hang:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@prime_vgem@fence-read-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>         +1 other test skip
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-9/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>         +9 other tests fail
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-19/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_mmap_offset@clear-via-pagefault:
>
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html>
>         (i915#15478
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15478>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html>
>         +1 other test pass
>  *
>
>     igt@i915_module_load@reload-no-display:
>
>       o shard-tglu: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-tglu-10/igt@i915_module_load@reload-no-display.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#14545
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-2/igt@i915_module_load@reload-no-display.html>
>  *
>
>     igt@i915_pm_rc6_residency@rc6-fence:
>
>       o shard-tglu: WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-fence.html>
>         (i915#13790
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790>
>         / i915#2681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html>
>         +1 other test pass
>  *
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html>
>         (i915#15131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html>
>  *
>
>     igt@i915_suspend@fence-restore-untiled:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html>
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-glk8/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-glk6/igt@i915_suspend@fence-restore-untiled.html>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#15662
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         +1 other test pass
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-mtlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#15733
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733>
>         / i915#5138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>
>       o shard-tglu: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html>
>         (i915#15652
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15652>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-tglu-6/igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a1.html>
>         (i915#10826
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-tglu-6/igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a1.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_hdr@invalid-metadata-sizes.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html>
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         +1 other test skip
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@api_intel_bb@crc32.html>
>         (i915#6230
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@api_intel_bb@crc32.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6230
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@drm_buddy@drm_buddy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@drm_buddy@drm_buddy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15678
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@drm_buddy@drm_buddy.html>
>         (i915#15678
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678>)
>  *
>
>     igt@gem_ccs@block-multicopy-inplace:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_exec_params@secure-non-master:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gem_exec_params@secure-non-master.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@gem_exec_params@secure-non-master.html>
>         +4 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +4 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-range-active:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gem_exec_reloc@basic-range-active.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@gem_exec_reloc@basic-range-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@massive-random:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@gem_lmem_swapping@massive-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_lmem_swapping@massive-random.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@gem_partial_pwrite_pread@writes-after-reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_userptr_blits@coherency-unsync:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@gem_userptr_blits@coherency-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@readonly-pwrite-unsync:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@gen9_exec_parse@allowed-all.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@gen9_exec_parse@allowed-all.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@gen9_exec_parse@bb-secure:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@gen9_exec_parse@bb-secure.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@gen9_exec_parse@bb-secure.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>  *
>
>     igt@i915_module_load@fault-injection@__uc_init:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@i915_module_load@fault-injection@__uc_init.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15479
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@i915_module_load@fault-injection@__uc_init.html>
>         (i915#15479
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479>)
>         +4 other tests skip
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-8/igt@i915_module_load@resize-bar.html>
>         (i915#6412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@i915_module_load@resize-bar.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@i915_pm_sseu@full-enable.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +7 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +6 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-4/igt@kms_content_protection@lic-type-0.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-10/igt@kms_content_protection@lic-type-0.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-15/igt@kms_content_protection@mei-interface.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-13/igt@kms_content_protection@mei-interface.html>
>         (i915#9433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>
>         / i915#3359
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +10 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_dsc@dsc-basic.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_dsc@dsc-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-3/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +2 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_hdr@invalid-hdr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_hdr@invalid-hdr.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_multiple@tiling-4:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@kms_plane_multiple@tiling-4.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_pm_rpm@package-g7.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-4/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@psr-sprite-plane-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@kms_psr@psr-sprite-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_psr@psr2-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-4/igt@kms_psr@psr2-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +4 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-2/igt@kms_setmode@invalid-clone-single-crtc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-7/igt@kms_vrr@flipline.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@kms_vrr@flipline.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-8/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>  *
>
>     igt@perf@per-context-mode-unprivileged:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html>
>         (i915#2435
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2435
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435>)
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg2-6/igt@perf_pmu@module-unload.html>
>         (i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg2-6/igt@perf_pmu@module-unload.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-dg1-19/igt@perf_pmu@module-unload.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-dg1-15/igt@perf_pmu@module-unload.html>
>         (i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18273/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14925/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8846 -> IGTPW_14925
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_18273: 76f07a8a9c761686987cba92056f78c1d3cd1c62 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14925: dd22dc1b6b6beb5d821fa8b9aa3f9bdad194d94d @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8846: 8846
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
