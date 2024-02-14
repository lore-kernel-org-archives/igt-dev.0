Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27B4C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 12:07:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF1A10E10F;
	Wed, 14 Feb 2024 12:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djnEMuiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BED10E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707912440; x=1739448440;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EoRyAsaj65ykMx4VUBCwIqLkru/twi9FnpQ1yb/KvR8=;
 b=djnEMuiBFHk6uLRC9g5Bl7RS1YcnqOe9Rd83EQTUA0wDykBioxmgXX4o
 +ZbxNI9sLmiFg+gaW7X70Mw7bcTKbKIeHGujtrYjgzxnw/FhzLmrG2JZ0
 bfuEC2Xb581fVy8zXaywmcVPvrLWPkUIfam8sM4z0wu5KQ86nmV+Yhb83
 fkaeExadnKKsECHWTLZGRLJdNyGbVX9TnFMN2ygmWO0NhPe8kQy026Pc6
 Ju6bSo7qVozRA2LdO6WyekMNTrSOuuR+h7PAk+eI6fPFYAxz2u8ewo+QD
 Winbz/I4BsmWgMgEI+JxIoqAfI4sN1SwkcMb2QtPgbZb/CDtHFwJr+XZr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2075358"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2075358"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 04:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="40654913"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 04:07:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 04:07:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 04:07:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 04:06:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg/N8b0tukYOR5fZbSUpyWq7V9zbg40hWJahhZiFivcIiDVCS7rny7uoVJTaevy66URpX87xKIccUNKsc01HQSNjG0r5UeyWDho2hxEppo9xhw9GqWMmMDrcc3D8m9CGrKdMqptMx3PccTH+/q4ehvahgFoXJNxdhLlm44ZMgbUywRw4OgoGFdVvbYQ2LgSEcpidRZQVgmMutSnqccN0P2pUo2zruwCjwjFhNAadpnimIv3oCoCEDrbna6KCOe1yJ7NoBIS7UCZxsGNyJlCeZPRzAv7rq/pIrNGuK8dTmi5kpXOumeT8zxm0pzqTiB3zBqVae+UGyNj5M0smPB+M9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW379ZJ2FmNVDZqqD4QJw1SudAZ45kKmjIaDnhY/B14=;
 b=T7iko0iARra0TSnnsfpX8JwOu5s+Pc7u/A4RIQEYWs5XNWN80Hbjys2dhUjFMORh9adRpPPpQpgLpwKnjo+1CZQXLKK28zBUk3W960aMpTspn8KCdtFYfNgv2gu51TrZXXrxjpJ85YyeNQB9qa3tnRfJnjwnXrTCkrUZ/SsjKin9CiUgg8K/T+wKJfRXkCn7pSaeTSDV+pht1mCbLkN5r9AhJeIsuuHsL5U6GwJz5FLCERXOg0yY15+HUS0epJfyX5q0Krng7OhBTZAzvyUOOA/4cf9SZvnP+vYWsJrdkxp2VkhmnBI0NRjf7Aq9bBYyWxzJlE/QKMj2QuB67tdaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8336.namprd11.prod.outlook.com (2603:10b6:208:490::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Wed, 14 Feb
 2024 12:06:31 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::3f57:7e0d:60df:27dd]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::3f57:7e0d:60df:27dd%5]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 12:06:31 +0000
Message-ID: <64d98060-97cc-48a7-9cce-6a230e4dc4e3@intel.com>
Date: Wed, 14 Feb 2024 17:36:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: Add Xe2 ccs crc tests
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ded2049-e04b-46cc-13a8-08dc2d55616e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 586pVBrD84GY7FfASzWS6+YaV1edzzjkjshmSuySpLrCiUwS2vz2D/v30j8FXVC/C3P+KTtCuTN0e7MnG4h8o5aawjmOHrct+mb6wGTH9RpqSGh/dc+ewA8zf90bZgCu+ak7UP71K2AT1LC33qvDTtN8BPEzkzeeKQG1CM5GojE9AjPRKc3MRe3o3KHy/iT4hOm6uHbTnR6XyM6c/diHMqGREYOLNCcZ66B2l8sASC6DcYkIdU4khDuWeX7DbKVxEaN0Djboj5PffR7QiCBI5o6rq9nfxAYp/SHq/hLDhMTMVBok35ctCt8wE/J/ntpn760LWoxuHxaLfA427Xp1pm/20SgBIp9uaquEs4bJ1gMjPIvoxBe+mndubA72szn+HJD87h6pLC1DR3CZOPPVmG+1GvInSHQHHr997WOF2dz405VFasKlPlOgjex6Y0pFHiufvOgcw8oHT1IKYSfWglQWQ59qsDrWJQ6zAcK/FsCWT+m2YKjsfuVwQwOccuOwj7d00UYvCo9BrtfplMRT0inAOYUuxkqHwMQ8dfcosTnBGpNERxB486tcrfxU5SnH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(86362001)(31696002)(31686004)(8936002)(8676002)(5660300002)(66946007)(66556008)(66476007)(55236004)(478600001)(6486002)(6506007)(2906002)(6512007)(83380400001)(82960400001)(26005)(2616005)(41300700001)(38100700002)(36756003)(316002)(6666004)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUY0R1lFWlV4dW43VXVRc080SmVCOE5QOVJxSTZyMDRSL0VIY0poUU5uWldS?=
 =?utf-8?B?QitNYVB5ZGhXU3hNcy95MTNSVUJBd3JyNk5sUXFYYWVSeGxqNWhSQlgvb0dP?=
 =?utf-8?B?Q2lSY0xwMjNoOHJaYVRGU0FUNm1nTEE5d2RtQVJpQTRCQVZUdkJvMTBmK09n?=
 =?utf-8?B?RTl2WnpFSlNJdFVJQ3d1cDdGa2FTSk5xeVdwOUI3SmRxM1ptRE5ZeDNsemFF?=
 =?utf-8?B?dWZVYVZuSDJWalNjdWRacGdYSnZpR3ovM0VrYU8vWXFSdzZnL0k1OTc2RXZm?=
 =?utf-8?B?SUUxSlk5eFVVbkZGMFlCUHB5NnV2byt5U1hYN2hLS2Y4S0licTJTMGhxYWxE?=
 =?utf-8?B?LzNrb2g3cXhBMk83UmNuekRrTGM4MU5CY0RNbURNZjc1SlBMd1c3MDVqajYy?=
 =?utf-8?B?U1lySG5aWktGUWJCVERKWWF6U3hQNTk1YTRSWlk3bmt5cjE5aE4wbDBMcHA0?=
 =?utf-8?B?VVFrMklyWmhpUzRldGh4aG9BVWFwdENUbkRpZlEySlN4NmsxRklPdFBDVXR6?=
 =?utf-8?B?UVd5WHNkd1lTNG10Z3g5aGFvNFlsaGtvMStiV0FHZ04rTFo3dzhUUFhwcUNS?=
 =?utf-8?B?aEtWZHVyYTRhdm1HWFcxa0VIeEV1UFZTZkhGRzlsSFkvUHI0a3pLVUFLSXBq?=
 =?utf-8?B?ZTJvdW84Q2R2YmlQZ2M1N3NaMEdCQzNPNTJxS01QL0V3bUhDcnROR0dWUXdO?=
 =?utf-8?B?L1FqNTR6RkpIUUg2dVlOUksrbkU4T0QxWXpJcUpkQW82MVF3Nm5Ndmd2YXZN?=
 =?utf-8?B?dWRubG53dTlSVHJvbm9pRWMzVVhVS1luMlN3VmJpVEoyb2E4Z09YdHBHUXRj?=
 =?utf-8?B?TkMrb2EycXNNVHVuQm5JVjJqYktMODZNQzNjSk5DeXREeU1qcFpZSDF0NXly?=
 =?utf-8?B?NDBWSGlXT0s1bGI1WktKR0ZKMzZ4d0d6RXlVaWdoRDhrTlp0NEU0cmNwR1I0?=
 =?utf-8?B?bjNndlJ4NmtaZUZRdkY4RmFNRVBZRHcvVjVCMHhPUmVLVXBBbG9jYmowVjcy?=
 =?utf-8?B?R1RpOGMyYjZXaU5Da09lL0MvZ1hiUHlsd1QxMjJQZEFPa29yNzdNdVQ3Y3Bk?=
 =?utf-8?B?M3cwM2xmSDZyS2pUQk02UXNKVjRWL3Z5RzJTRjUxSlpEY0N0SzJDYWE3SnJB?=
 =?utf-8?B?ckxNL1ZoL01lamI0bFBIQnNXemxNRFNjVVM4M0NScklSMU9LZnZXWmg1MjhN?=
 =?utf-8?B?VTlpZEwyUzEySGo3WW5jQjJTS3pJTlExZzZCM0swTVR1Z2ovYXBUQzNyeDZy?=
 =?utf-8?B?ZHV3eHMxOGZjc3FGV0hzWXZjOW9lcG53K3pvV3diWk9rbDlVUlVwK1YzSy9F?=
 =?utf-8?B?eGpTZ1hkTUFseWFnVkw1S2ZKUkRiSzRGL2VMaVpCV0ZlOGRWc1ovTStZUlhU?=
 =?utf-8?B?K1M2OVpVNGVRVEdKN0dpUzg1K2dWb0x2RnpDOXNxZHVCK005R3lhanFTVTB1?=
 =?utf-8?B?b3AvbVlWN1ovOWJFaWhGOGhuUE5tRXY4YXptRU9lOVgrY1Z5Y0I0UDB0UzlN?=
 =?utf-8?B?U2x3eEU1dmsxLytNU2dnZkZ1VnFZcjZLNjc3aUdseU9qdms2bmZ1U2E5Q01I?=
 =?utf-8?B?QUpIbGpiU3NZQXE2N2NBOVZvYmdsVXJaL0xLbTRaSlZCZGJ0cTJvQ3cwYmIx?=
 =?utf-8?B?ZTQxOUJQT3lOZDlDL1VPNzdabWdMcE1pNE1sVmdrNjdKMndnMysrRmI3aWJM?=
 =?utf-8?B?ZllLNE5wdk9Gd2xBM0p5bytKYmMvLzdRK1RiVUZLWHN5cGl1M01WNFZFS3pZ?=
 =?utf-8?B?c2Qra3VSUkxId01xVjd4NE5YOEJRUjVvRGc4WDFtbDFzeUJpY3h5WFdkSWhx?=
 =?utf-8?B?T0xWNkUySFhyWVMrQlNlcU4wUTliUG14N2VyR2JjZUl4Q1V3b3J1K2xNV3Vh?=
 =?utf-8?B?K3AzOTdTK0dYT2lKcjh1Wk9NaUlBZjIyMCtBWnRHZWwvQXdBU1JvTVpSYkg5?=
 =?utf-8?B?QWtSUlB4c0x3STR1SzRPTHNxQ2VwSjZmcGZYNHRtOGdSemZOVjFLYStzSWpj?=
 =?utf-8?B?QlhMN1BLZENrVm56alhzVG00c0hXcTdBVzU1YkZXSkZBNDhTaWI2a3hJeFVW?=
 =?utf-8?B?NnI1VThrZGZsak9sTVdNbUl3YjBRSWJZV0ZCdjVZMVd2akg3SHBtc3gvc0FN?=
 =?utf-8?Q?cPWo7tMYPt6PztIhxel2IJFs+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ded2049-e04b-46cc-13a8-08dc2d55616e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 12:06:31.3208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSd6r+L4rAQiniQ6tgLhPTHiLkrnzy8N88GXMBOWplE2on+DWj9ge2I3qf9OcVXA8eQkc8WIQx+fvOL/S69DAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
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


On 2/9/2024 3:38 PM, Juha-Pekka Heikkila wrote:
> Add Xe2 pat index type ccs tests for testing
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/intel/kms_ccs.c | 239 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 229 insertions(+), 10 deletions(-)
>
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 74bc78477..82714af93 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -37,6 +37,9 @@
>   #include "igt.h"
>   
>   #include "i915/gem_create.h"
> +#include "intel_pat.h"
> +#include "intel_blt.h"
> +#include "intel_mocs.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   
> @@ -107,12 +110,54 @@
>    * arg[2]:
>    *
>    * @bad-pixel-format:            Bad pixel format
> + *
> + * arg[3]:
> + *
> + * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
> + * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
> + * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> + * @4-tiled-mtl-mc-ccs:        4 tiled mtl mc ccs
> + * @4-tiled-mtl-rc-ccs:        4 tiled mtl rc ccs
> + * @4-tiled-mtl-rc-ccs-cc:     4 tiled mtl rc ccs cc
> + * @y-tiled-ccs:               Y tiled ccs
> + * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
> + * @y-tiled-gen12-rc-ccs:      Y tiled gen12 rc ccs
> + * @y-tiled-gen12-rc-ccs-cc:   Y tiled gen12 rc ccs cc
> + * @yf-tiled-ccs:              YF tiled ccs
> + */
> +
> +/**
> + * SUBTEST: %s-%s-%s
> + * Description: Test %arg[2] with %arg[3] modifier
> + *
> + * arg[1]:
> + *
> + * @pipe-A:                      Pipe A
> + * @pipe-B:                      Pipe B
> + * @pipe-C:                      Pipe C
> + * @pipe-D:                      Pipe D
> + * @pipe-E:                      Pipe E
> + * @pipe-F:                      Pipe F
> + * @pipe-G:                      Pipe G
> + * @pipe-H:                      Pipe H
> + * @pipe-I:                      Pipe I
> + * @pipe-J:                      Pipe J
> + * @pipe-K:                      Pipe K
> + * @pipe-L:                      Pipe L
> + * @pipe-M:                      Pipe M
> + * @pipe-N:                      Pipe N
> + * @pipe-O:                      Pipe O
> + * @pipe-P:                      Pipe P
> + *
> + * arg[2]:
> + *
>    * @crc-primary-basic:           Primary plane CRC compatibility
>    * @crc-sprite-planes-basic:     Sprite plane CRC compatability
>    * @random-ccs-data:             Random CCS data
>    *
>    * arg[3]:
>    *
> + * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>    * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
>    * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> @@ -157,6 +202,7 @@
>    *
>    * arg[3]:
>    *
> + * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>    * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
>    * @4-tiled-dg2-rc-ccs-cc:     4 tiled dg2 rc ccs cc
> @@ -248,6 +294,7 @@ static const struct {
>   	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
>   	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
>   	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-rc-ccs-cc"},
> +	{I915_FORMAT_MOD_4_TILED, "4-tiled-xe2-ccs"},
>   };
>   
>   static bool check_ccs_planes;
> @@ -534,6 +581,143 @@ static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
>   	buf_ops_destroy(bops);
>   }
>   
> +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> +					   uint32_t plane, uint32_t memregion,
> +					   uint8_t pat_index)
> +{
> +	uint32_t name, handle;
> +	struct blt_copy_object *blt;
> +	uint64_t stride;
> +
> +	blt = malloc(sizeof(*blt));
> +	igt_assert(blt);
> +
> +	name = gem_flink(fb->fd, fb->gem_handle);
> +	handle = gem_open(fb->fd, name);
> +
> +	stride = fb->strides[plane] / 4;
> +
> +	blt_set_object(blt, handle, fb->size, memregion,
> +		       intel_get_uc_mocs_index(fb->fd),
> +		       pat_index,
> +		       T_TILE4,
> +		       COMPRESSION_DISABLED,
> +		       COMPRESSION_TYPE_3D);
> +
> +	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
> +	blt->plane_offset = fb->offsets[plane];
> +	blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
> +				  PROT_READ | PROT_WRITE);
> +	return blt;
> +}
> +
> +static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
> +{
> +	switch (fb->plane_bpp[0]) {
> +	case 8:
> +		return CD_8bit;
> +	case 16:
> +		return CD_16bit;
> +	case 32:
> +		return CD_32bit;
> +	case 64:
> +		return CD_64bit;
> +	case 96:
> +		return CD_96bit;
> +	case 128:
> +		return CD_128bit;
> +	default:
> +		igt_assert(0);
> +	}
> +}
> +
> +static uint32_t blt_compression_format(struct blt_copy_data *blt,
> +				       const struct igt_fb *fb)
> +{
> +	switch (fb->drm_format) {
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +	case DRM_FORMAT_YUYV:
> +		return 8;
> +	case DRM_FORMAT_XYUV8888:
> +	case DRM_FORMAT_NV12:
> +		return 9;
> +	default:
> +		igt_assert_f(0, "Unknown format\n");
> +	}
> +}
> +
> +static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb)
> +{
> +	uint64_t ahnd = 0;
> +
> +	struct blt_copy_data blt = {};
> +	struct blt_copy_object *src, *dst;
> +	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
> +	uint32_t mem_region;
> +	intel_ctx_t *xe_ctx;
> +	uint32_t vm, exec_queue;
> +	uint32_t xe_bb;
> +	uint64_t bb_size = 4096;
> +	struct igt_fb *dst_fb = fb, *src_fb = temp_fb;
> +
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +
> +	vm = xe_vm_create(src_fb->fd, 0, 0);
> +
> +	exec_queue = xe_exec_queue_create(src_fb->fd, vm, &inst, 0);
> +	xe_ctx = intel_ctx_xe(src_fb->fd, vm, exec_queue, 0, 0, 0);
> +	mem_region = vram_if_possible(src_fb->fd, 0);
> +
> +	ahnd = intel_allocator_open_full(src_fb->fd, xe_ctx->vm, 0, 0,
> +						INTEL_ALLOCATOR_SIMPLE,
> +						ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +
> +	bb_size = ALIGN(bb_size + xe_cs_prefetch_size(src_fb->fd),
> +			xe_get_default_alignment(src_fb->fd));
> +	xe_bb = xe_bo_create(src_fb->fd, 0, bb_size,
> +			     vram_if_possible(dst_fb->fd, 0), 0);
> +
> +	for (int i = 0; i < dst_fb->num_planes; i++) {
> +		src = blt_fb_init(src_fb, i, mem_region, intel_get_pat_idx_uc(src_fb->fd));
> +		dst = blt_fb_init(dst_fb, i, mem_region, intel_get_pat_idx_wt(dst_fb->fd));
> +
> +		blt_copy_init(src_fb->fd, &blt);
> +		blt.color_depth = blt_get_bpp(src_fb);
> +		blt_set_copy_object(&blt.src, src);
> +		blt_set_copy_object(&blt.dst, dst);
> +
> +		blt_set_object_ext(&ext.src,
> +				blt_compression_format(&blt, src_fb),
> +				src_fb->width, src_fb->height,
> +				SURFACE_TYPE_2D);
> +
> +		blt_set_object_ext(&ext.dst,
> +				blt_compression_format(&blt, dst_fb),
> +				dst_fb->width, dst_fb->height,
> +				SURFACE_TYPE_2D);
> +
> +		pext = &ext;
> +
> +		blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
> +
> +		blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
> +
> +		blt_destroy_object(src_fb->fd, src);
> +		blt_destroy_object(dst_fb->fd, dst);
> +	}
> +
> +	put_ahnd(ahnd);
> +	gem_close(dst_fb->fd, xe_bb);
> +	xe_exec_queue_destroy(dst_fb->fd, exec_queue);
> +	xe_vm_destroy(dst_fb->fd, vm);
> +	free(xe_ctx);
> +}
> +
>   static void generate_fb(data_t *data, struct igt_fb *fb,
>   			int width, int height,
>   			enum test_fb_flags fb_flags)
> @@ -572,15 +756,37 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
>   			fast_clear_fb(data->drm_fd, fb, cc_color);
>   		} else {
> -			cr = igt_get_cairo_ctx(data->drm_fd, fb);
> +			if (modifier == I915_FORMAT_MOD_4_TILED) {
> +				struct igt_fb temp_fb;
> +				/* tile4 is used as ccs modifier
> +				 * on Xe2 where compression is handled
> +				 * through PAT indexes.
> +				 */
> +
> +				// non compressed temporary pattern image
> +				if (do_solid_fill)
> +					igt_create_color_fb(data->drm_fd, width, height,
> +						fb->drm_format, I915_FORMAT_MOD_4_TILED,
> +						colors[c].r, colors[c].g, colors[c].b,
> +						&temp_fb);
> +				else
> +					igt_create_pattern_fb(data->drm_fd, width, height,
> +							fb->drm_format, I915_FORMAT_MOD_4_TILED,
> +							&temp_fb);
> +
> +				xe2_ccs_blit(data, fb, &temp_fb);
> +				igt_remove_fb(data->drm_fd, &temp_fb);
> +			} else {
> +				cr = igt_get_cairo_ctx(data->drm_fd, fb);
>   
> -			if (do_solid_fill)
> -				igt_paint_color(cr, 0, 0, width, height,
> -						colors[c].r, colors[c].g, colors[c].b);
> -			else
> -				igt_paint_test_pattern(cr, width, height);
> +				if (do_solid_fill)
> +					igt_paint_color(cr, 0, 0, width, height,
> +							colors[c].r, colors[c].g, colors[c].b);
> +				else
> +					igt_paint_test_pattern(cr, width, height);
>   
> -			igt_put_cairo_ctx(cr);
> +				igt_put_cairo_ctx(cr);
> +			}
>   		}
>   	}
>   
> @@ -748,8 +954,11 @@ static int test_ccs(data_t *data)
>   
>   static void test_output(data_t *data, const int testnum)
>   {
> +	uint16_t dev_id;
> +
>   	igt_fixture {
>   		bool found = false;
> +		dev_id = intel_get_drm_devid(data->drm_fd);
>   
>   		data->flags = tests[testnum].flags;
>   
> @@ -767,11 +976,13 @@ static void test_output(data_t *data, const int testnum)
>   	}
>   
>   	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
> -		if ((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
> +		if (((ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
>   		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
>   		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC) &&
> -		    tests[testnum].flags & TEST_BAD_CCS_PLANE)
> -		    continue;
> +		    tests[testnum].flags & TEST_BAD_CCS_PLANE) ||
> +		    (tests[testnum].flags & TEST_FAIL_ON_ADDFB2 &&
> +		    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED))
> +			continue;
>   
>   		data->ccs_modifier = ccs_modifiers[i].modifier;
>   
> @@ -780,6 +991,14 @@ static void test_output(data_t *data, const int testnum)
>   			      tests[testnum].testname, ccs_modifiers[i].str) {
>   			int valid_tests = 0;
>   
> +			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED) {
> +				igt_require_f(AT_LEAST_GEN(dev_id, 20),
> +					      "Xe2 platform needed.\n");
> +			} else {
> +				igt_require_f(intel_get_device_info(dev_id)->graphics_ver < 20,
> +					      "Older than Xe2 platform needed.\n");
> +			}
> +
>   			if (data->flags == TEST_RANDOM)
>   				igt_info("Testing with seed %d\n", data->seed);
>   
