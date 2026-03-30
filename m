Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8030F3D5E7
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 547B010E1E9;
	Mon, 30 Mar 2026 08:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzrLO7ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEE410E1E9
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774858705; x=1806394705;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+bvu6m2qqI5FW1cQwVe2jbtAlq+glD4rzJgH0o6j2XU=;
 b=NzrLO7rojM4gd8BemSqCt5la4EV6U8QnHKvadbDeK42s/2HTwMbiV25S
 co/rGtCyyv+kVPhespzWY6h7srErppPxfecRRg8cxG3wLmnUqOTYaqmpb
 zTbQCdMhzsKIZ5GOnGg1ijI1YE8CDAOrRV9OYcGgDVCtRFPoRnUmzrerx
 vMFw76oEErURco86mFkxNKjy8h74wiBnWHqH2A4uOn0ba77Zjs7FZS5TL
 FsBX89L5S8R6/cDxH6l2BS3dwzTQHWH3bwdVbNMSQScbYGXNjsGl9iPBe
 Y4oTODbfxsfJ7DcqCivs0YaMQ7ZEYv52D17sMbvGrfNhd2j9XHVXrSq5G Q==;
X-CSE-ConnectionGUID: /jzXxZ8jT0a61J4zQJ8CNQ==
X-CSE-MsgGUID: mLKhDgeERxm2VAend/hERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="93425240"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="93425240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:18:24 -0700
X-CSE-ConnectionGUID: +gwGLZUnT/6y2kzQOJ/53g==
X-CSE-MsgGUID: knE5cxNRR3ijmrAH0N4g2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="226241564"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:18:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:18:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 01:18:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 01:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRUlZ6c9/W/+coleUOqrhyehU7krdAoc79CA0quBbIFn6+JMDGiNnoX2EexuQSU8zdLt7Y10dXnqwL37FDERSHCcMOEfyqqahSDkoEIqG1rWwo2aFNsMPEgkGt3PdFuBTR0YeaY44Y1hNrbbj661890Rq85VVcM2TboxCFG5GejnkzXbUSPiUc+/b0VUnb5eBoRYE+31G3faXamYF/Ol21oKpvrgF+jV3rc++UqIvp1ffna2Gg1RD++kOfy5174mN6tFuFPTfD2KF8p3fvUmmLxJshKHezFbtftRhnqytGDi4un2mEIci0MbDIG6yb7LfVYUZy6gS2HpT6iJniZ/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4F67W0t7MGbiAYbBhJwISmQ1ed0wuT5X2qnIL9ZAs4=;
 b=NZ3lKLYYQxBI2H16ETtofOXyQlinwrsTqpo3zbxo4Pe0sxe2dwdoatPIzLbTH8IRZzYEQvI4v9hrPVUrKng0y7efj/55/kAlu1MIfj6SjODyiGJS1FKdTo9gpX58BqZy1f96P32p/+VkPHQHTokph2tMBYTM3nvsBKlUBK0alco7rlEMT+IPA4DxN/4Dk4vhfO83w+l6ItazhKuakl8wIYJ797z9OsViy6htWTgXcYjClOArs/WAWD8me442XnTpD3XfA7VdOCkRH5TBp4B+chMyKjOVMuhbR7CPhslOUnNbBwHX0++0kUDyjCCY6G0TXjTYDLWTjiVCtCqSpseUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 08:18:20 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 08:18:19 +0000
Message-ID: <a6806141-d32a-4b2f-9e51-c14d18a9307c@intel.com>
Date: Mon, 30 Mar 2026 10:18:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/4] tests/intel/xe_sriov_vfio: Add VFIO module
 load/unload subtest
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
 <20260327140627.64574-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260327140627.64574-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::27) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fcf2daf-c512-4264-7122-08de8e34e6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: T4vVnCgHvkFJmD5eRsaxZ7LyWlLiiSW9n7O3qNNu0LxFEloTmCiWtq+jIxQMJUy66leZtRyLKv1yZJvV6nRNkMm8WVWrd2w+yoIFHHAhpFpkWZJzUkf+MuZUyeXmWLitXu1ipIT5qDHa/kEvTV+pArFAqOp0rCIGrTyr2m21qBkEq4ckNNCDYkCeDeSss2z2mmbK7jKBo7eLzAk/ROXC51bRXK/QM7ydczIKeqe2UAxbv4TxQ7deSHS9zhNZrPwv0/70BUFE8ojvRviAz0sWldtP5EnFhelqOfIH4rI5kUpqSeJ+Ar+35G5K3nts6QaaCMoOL7rNfmMOkLe6UJKLrig8KbgX3x7iPCtpS8PXsIvzbm9bNHf2Y63q8JzhcV4FRq7W8A7L8E99wIni6n7BePFs41c4M+dPVKCg1D8QXv6bmNNID/K/Q8RVdYE688RxPnTcQzRtl3IGtsfmS70TWcN3kkmPbMHeHvSFUI9jN+GsS1pnu76o0TE8oRjdmz7MhVqhv8Vu0f1fM7t+gDqg09wS0mnYxL+UwGDqHUmutw+h0ZAFO/cByei4ucYsHuBganidFsxxtSfz38lROjBVFgZI0ykuIy4/WOAEkBYeY0i+8Z6ZF+eSIuMmzd1X6yjQnfucl2EUVUjF9SZgabPu488va3+s4OyCneg6oDANiOHhz670nK8wDSoIgx36S5zfMnu6lqFe6yaZACFhmkzhSqYbtuvcoHnm4Ciz6WQsWXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0p0MzJYRjdGR3Q4ZTlJdzVybDloU2t3S1B5ZTRNcEQ5V0hBY3psaSt3cXcv?=
 =?utf-8?B?a1A2NGR3djRsUHYxMVI3N1lTOFJ0Zy9kanlTUzlIcUEwb2YzZXRYNEV3ZW1Z?=
 =?utf-8?B?ZGJxRTBhNHlXcU9qZldvRHVZU3d4VmdQcHVJV1hDWkRaTi93c2k5azhNK3hO?=
 =?utf-8?B?bkdqSXZweHJoWTRPY29YYWc1OFQ2dEtUcm5Md1NnVDN0U1hTbWxMN1RnUHNM?=
 =?utf-8?B?UTYvUkZwUWc3dWgyb1dZQWh4RTgwTlVVc1BBSHZEbkJFamdzK005Y09vRGxk?=
 =?utf-8?B?bTZTTTNPLzZrSHhXT0REZmF4bnczWFczZko4dGpwcFN3b3hJMllHSGxJTDNh?=
 =?utf-8?B?bGszYngyNVdBdDFkK2FSWDRDbXRpK0I5ZC9iSGwzcWxFMk01RHpKTzVKMDlV?=
 =?utf-8?B?YUY3REszN0s0ZjBaUldOb3Evb3pKMkNvNVBpNm1VcWRjeWdIWk5lQUJsNGJH?=
 =?utf-8?B?Nnh5Nk5adTRieUI3dWhHWVJ0NjBlWVY5aVBrT01rc1Jyb2w1YjR0TGdqQnBt?=
 =?utf-8?B?eXp4QlA1aVZSSkxpT3NmZld2cmtQTnhpd1dDcTNyZnZpUSt6SmpDOS9UZ21o?=
 =?utf-8?B?R3BOd2FrSkdqSG5ocXArVG9pdXk0VTd3cUZKMjFtL25BamZkMmN0MlkrRktz?=
 =?utf-8?B?NTd2U1Z4Ujg2TWFJbkgvTmQ4WENlbHJuNzRWclBKeWN3R0cwbW1UaTJpNzVH?=
 =?utf-8?B?N3M4bFpzVFEvcVVhaGxJU0NMOFk2SThpZEFiNDBESjVmaW1yOUxxc2llTkNL?=
 =?utf-8?B?dHJOT1dlSG01eEZCaUpmOC9PKzNuNWxsVk9Tb3pHSUFNb0Vpeks3MWVuN281?=
 =?utf-8?B?VWI0bFBUb3pSU1R2TkhRTzAyWnNVbWd5TVdaeXJhMm5XdGFSSkluMm1PZUta?=
 =?utf-8?B?NUU5dyszVWoxdy9EbzdjeWxpR2syM0hGUHJoSnFjdVR3bG5ZM0p4VWpoMU5v?=
 =?utf-8?B?N0pTdkdJM3Fna204SE8rTU5yRElIWlFOZXRHTDg3NEpTOUtIUFk4V1pzWDhZ?=
 =?utf-8?B?SURnakNwTDBYeCsyWFdRd2RjUnBDaXQxZkJMbTNRb0t4djl2RGF3c0NtNWdU?=
 =?utf-8?B?enU0Y3p2SlN0eVdkL24rZjFOWWdIQkJteUhtc3BVSS9wWHVTMzJKVkptdGNw?=
 =?utf-8?B?V1dVd2w4R0ZZUkdVZTJWNFkrS2xTVXdTWE55T25WSnh1NUZVandaWUlKS3VB?=
 =?utf-8?B?WGlXK0xTTzNqWkVMWVhUMi95Zm1EWi9hVTYySUlIdzZHRUVpK2lxRWdvdm5i?=
 =?utf-8?B?QzBJbndpSGd3TEJ1ZGhtYTV4QUNlMlBrZDNLOVJheVVzTEEvbHQrelRXYnFL?=
 =?utf-8?B?ZHMxVnZvQ214WXJKYzZ4TDNFUXdjSUVQOHZGcExtdjRmSk5mSm02MWs2RER3?=
 =?utf-8?B?NysxV0cxUjRuVnk3VUZiZmJOYTRiVVA5Y0tlY2tyYW5ac252MTRxMVNsdVRM?=
 =?utf-8?B?aFJMTkZoZlFnQWRpcTBUN3kzUklvQS91cytUb3ZydGxSeFR3RHFtNGFyWVEy?=
 =?utf-8?B?azg1UFd1TEJkT3V5blVaZEd4c2trbFFGSUhXVWFIWHdyUW5mQzNPb2lCVUZR?=
 =?utf-8?B?clJieGFFSDRQOUhPZlJMTXN3SjZXNjNjVDRCUXFtMm1qb3J3YWRYY2JaRFNB?=
 =?utf-8?B?aFFDbkQzZHVuOFFLa21MMHR3R05YMGJqbUpEWkxVazZHazVHUllCdnBKY2VS?=
 =?utf-8?B?WVgyV1lnZXFaY1A5aDlyaDh2WnNwZ3RsSm9YMFlEb1NlVXp5UnZ1Z3dweVNu?=
 =?utf-8?B?eVdHUXRWUUtvV054QmZzRWdqbTZleGFSeXhnR2NiMHkvTUU0T1VSZEZGN0li?=
 =?utf-8?B?ZEpwTytWc292bTBiaHRCeUFZVktubmtiTnpZYnJuN081UjFEYy83TzFjWmdG?=
 =?utf-8?B?V1dFamdxcit2dTBpeUZtTnRZaTRYMk8zMUszRkI2TWtBVDBLY2FwNFNYdC8y?=
 =?utf-8?B?MDAzVElacW5ZcjZwc2VDb0N4SEFJV09VZ0oxQ1dFTEcwZElYK3hhUk5XYmh4?=
 =?utf-8?B?RUZHbjRYMjRhcm5VZ3U0cE1pRjE2UDYxUDZSZVhnay8vS29xcFExdDBGaWoy?=
 =?utf-8?B?ZUx3VXV0VW02UnVNTm1ZR1JlOXJ5WnU2Y2J0RkFnZGRCT0xyaU51MHN1T2Qx?=
 =?utf-8?B?WXNjcTNGWlk1aE10cHRqbUhDOTBkMVBURDdHcVJDY2RUb0MweEI3bTR4c1Vn?=
 =?utf-8?B?bExRRm9ydjJOWjMxdXB2NDVWbTdUTjgwLzFGZnRYTjBqeUNWV3NLUDR6UG5I?=
 =?utf-8?B?MGFMYlVZeElvbTNRMG0vUEZQYml3YkFaYnlIb1dOam1UMVdBZGgyNDg2RVpm?=
 =?utf-8?B?RC9ZNWFxN0VwTXdybXExTXg4UjdFOVlUelMwZEVFM28yL0xmK1BqQT09?=
X-Exchange-RoutingPolicyChecked: KjzKTw8PY2u3XOHhl6YqaYoSNFnFOJFbkWirV3ZRxUNWrTXnkiCdX9Z17nh9T+dMv94Zb0kJ0Ob9Q4HtFs36GfdAWOVMsvlVbVE1bPY5l1MTiM2IbVBl9a8dKL+8GyMC7JjSZuGlghdr8+mty9oFBQT27Xd/O4zplYTYPq9682B0TaD165uVDjhp171wcG6550EY+L3mq8mmIW5SZ+VJqY+t6c4Rw+I1GqRZjRAJaASXPjAVTUyraM7NQEw+UuWrHOotVqLx4pJlf9kXo/FZrMBN+4v+9JAfKPZ45qwNTp7cMOlPACUKN2kcKo1ICant7JPCf6cm1H+ocAvKvMH3vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcf2daf-c512-4264-7122-08de8e34e6a5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 08:18:19.5567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cd1Zk1H3WjEreaXn0J7APuYOCYstAJEZDHpap65Jt6j+n8Sf9OU65dapKstAoiQdo5nMMfG4dH+aC4zDyvWy5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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


On 3/27/2026 15:06, Marcin Bernatowicz wrote:
> Introduce the load-unload-xe-vfio-pci subtest to verify that the
> xe_vfio_pci module can be loaded and unloaded. Skip the test when the
> module is already loaded.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v2:
> - Merge load/unload into a single subtest (Lukasz)
> - Simplify restore_xe_vfio_module  (Lukasz)
> ---
>   tests/intel/xe_sriov_vfio.c | 75 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build           |  1 +
>   2 files changed, 76 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_vfio.c
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> new file mode 100644
> index 000000000..ef92fb233
> --- /dev/null
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2026 Intel Corporation. All rights reserved.
> + */
> +
> +#include "igt_core.h"
> +#include "igt_kmod.h"
> +
> +/**
> + * TEST: xe_sriov_vfio
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: SR-IOV VFIO
> + * Functionality: VFIO module
> + * Description: Verify basic xe-vfio-pci module operations.
> + *
> + * SUBTEST: load-unload-xe-vfio-pci
> + * Description: Attempt to load xe_vfio_pci module and then unload it.
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
> +
> +static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
> +
> +static bool xe_vfio_loaded_initially;
> +
> +static void restore_xe_vfio_module(void)
> +{
> +	bool loaded;
> +	int ret;
> +
> +	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
> +
> +	if (loaded != xe_vfio_loaded_initially) {
> +		ret = xe_vfio_loaded_initially ?
> +			igt_kmod_load(XE_VFIO_PCI_MOD, NULL) :
> +			igt_kmod_unload(XE_VFIO_PCI_MOD);
> +		igt_abort_on_f(ret,
> +			       "Failed to %s %s during cleanup\n",
> +			       xe_vfio_loaded_initially ? "load" : "unload",
> +			       XE_VFIO_PCI_MOD);
> +		loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
> +	}
> +
> +	igt_abort_on_f(loaded != xe_vfio_loaded_initially,
> +		       "%s should be %s after cleanup\n",
> +		       XE_VFIO_PCI_MOD,
> +		       xe_vfio_loaded_initially ? "loaded" : "unloaded");
> +}
> +
> +int igt_main()
> +{
> +	igt_fixture() {
> +		xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
> +	}
> +
> +	igt_describe("Attempt to load xe_vfio_pci module and then unload it.");
> +	igt_subtest("load-unload-xe-vfio-pci") {
> +		int ret;
> +
> +		igt_skip_on(xe_vfio_loaded_initially);
> +
> +		ret = igt_kmod_load(XE_VFIO_PCI_MOD, NULL);
> +		igt_assert_f(ret == 0, "Failed to load %s (%d)\n", XE_VFIO_PCI_MOD, ret);
> +		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD));
> +
> +		ret = igt_kmod_unload(XE_VFIO_PCI_MOD);
> +		igt_assert_f(ret == 0, "Failed to unload %s (%d)\n", XE_VFIO_PCI_MOD, ret);
> +		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD) == false);
> +	}
> +
> +	igt_fixture() {
> +		restore_xe_vfio_module();
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index cecb4a8ae..26d9345ec 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -337,6 +337,7 @@ intel_xe_progs = [
>   	'xe_sriov_admin',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
> +	'xe_sriov_vfio',
>   	'xe_sriov_scheduling',
>           'xe_survivability',
>   	'xe_sriov_vram',
