Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEB8CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 09:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F3410F21B;
	Thu, 21 May 2026 09:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TusMmutT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BBD10E244
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 09:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779357570; x=1810893570;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iygzOt0somRZZpVN11GPPWGgLih6IhUXKXV2tw2L/8Y=;
 b=TusMmutT8sB5nGme88B2pyPv2lXwxmaqZFysbcWc35CmXWzJB4AdRpig
 UVvvT7Xibu3cpkcCMQkAWaBOqLWbWfNizNV0kKlRbIxCY9hs6OLFWZAI/
 Xep6/GrN031XqrHuw2553cvMhs8l7/u/kcNm1pShLqOaEEi72GQOX/tK/
 e9bgCO7NapGPGEjquo8huRGJ/7Yrw1M+DaxXrwnjiktIOr3JWjmIiOG5h
 ZE8YCtSkUyi6w87bItZOZFLWGrNRy4OkK85HuR0Oxw+Fdh3lBdIGDkjLz
 UtJ0SM8UfyO715crhsNMtZ0L78lQjQ9G//v8X3z8XQREhc7p8jyveDRGo A==;
X-CSE-ConnectionGUID: G3rAkQ2XS8WO9W9KA3UITQ==
X-CSE-MsgGUID: 04zTTcg7SFWT+or2ORH+Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79299965"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="79299965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 02:59:30 -0700
X-CSE-ConnectionGUID: 5WSCwja4TW+OGio6lkzZKA==
X-CSE-MsgGUID: 4CoBmtGDQMWI53PXk0Mz+w==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 02:59:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 02:59:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 02:59:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 02:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+6qnKWDeSuiH7uxjA4wZN3fJPsnIBMlEe/EKaztZuDqel6QWbrzIiThCoTujEie0z96Ou/PMpezxtJNN3Do0SXuZMGEY2beKAijO+kuURS5ivUMy1AMYSL+XyD9Xbn4/uWzLktxQ1l7m6vej7VQZsMN3XUB0UN7pv9BFI7Z0jQfVUcV5cC9F3HGmJIp7QY3VR1NlgNDOxGiSFCkkH+kkSZ6Tjv3yqTP35f0R4ljqFIwXZ5GLznvV6kAX3GSdi1qS265aKPlCTUWrh21PDEyE2l9VmVKblfcYfmWIxLACavyMlCMoQ0caXN7BrK+39hGLye7PKUjrBZKFW+ZMppPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woSDbkFax5GJlYsgL7XVIWBBj7W0t0lbeJRCwJRKZRA=;
 b=dPXGodTV2lG4FF85yYDh5ig+JLmnnsttrXJK0/OnS/Nc73/fnbZkNaTEw5KIIs9QpfTEdqz+GwL37aCmSN3xzJ+KTaVa/t2ZMbAmAaz0NVrN7/7Z2wjlp4tR4KtJ9vhdZbAQ+8mkqrtzwKBMGY/3BYchGuChfOWkL+MpCuSqBAfQ0rGDWfAfhjZpwTRR/MwjSp6wr+c6Ao72VvHTLndK0FWKSEp+EbyqnXMW3+vwiBbB372Yubgn4Z/CqWeLenmZkQ9fjxuLQOIxP2YAzx8DFBcX7Tx0R/9Y50+rY9fErZGJwSQnZmEhDu63lEZJLUV1XicFDTRPO4Rjtv29qZqrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB7249.namprd11.prod.outlook.com (2603:10b6:610:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 09:59:18 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 09:59:18 +0000
Date: Thu, 21 May 2026 11:59:11 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] lib/intel_compute: Improve executing
 large-buffer compute on pre-Xe
Message-ID: <ag7Xb6k0Kc5wh0hQ@fdugast-desk>
References: <20260521072536.796712-4-zbigniew.kempczynski@intel.com>
 <20260521072536.796712-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521072536.796712-6-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0be27b-0f73-4282-6451-08deb71f9f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3023799007|11063799006|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: w+jgxPBmEEQWgLB0joMicv/uAm1Gxp5FOukY5nk7lHQdqqlKhU/7RkDSFFhBZ5XLGyuO6lnnxSE0fwoHDR4TaEwCa/nR8n6F5uJ39EeZnuIYS+jc1/4wKpoYOj4Rf+auJdd3iWaacE6xj5T4ueWHcXH+v3ChDIxOHX5akmtjKT495FzEbX2Rdl6Z7DAgQ/K3NX8JAUuGgjdvNaGbfqkFWCx+Rx9IPp5lWA20KqmoQdttlO5CmuD5gJL4Un0s41ERhQqEHpKoY/tS+fCXXXjnxOjdtHT2cNaP2rfqcfWMXzf7gQXBUor/lVGnvQVC1n9fcARJ9Cb7B9M4tHC7MtaIc2L6PWZZMPMq0BevvLzQSulDABPmuekKEUMILlP7+/8CDo3Fwgtee0gCbRbrPEZAQZLxApKjo39OfOScOP6LE2SEdB8SmMpe8UZ8khkVQW68gkF6cOiMI0V7uvj9OHjlhagqVV0i0zU/Q1n3GdSwckZ/2c27bGjjgdKMO6401dz99D2WqDYIpEIiPF0Uj1KS49bR0P/mUOFngrApHqNnam3BYInYh6u7Emku+hAjNtYQCWikBonElqr2K4dDGDYj7eLFGX5tS3v9IYDaiWiM/KOs/zRgzmytDym/n4yYawz/VcHvkeS0a+xluJzUvxRfdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNhbU5VTEFBTlhHV0pLV1hJY1F5VHdqZHVwcTdQMUR4R2gzVkcrMGg3M1Na?=
 =?utf-8?B?bjRJdVliYWhBeElWSTF2UmFSNmlidVdBczBpWXYvWC9pVzlBWnE1VVZqdGNC?=
 =?utf-8?B?YVp5QTAwRW4vZ0dROUlXK0h1WGw5Wmo1MlBnTmp6c2F4OW1OYXdnZDVZNUgx?=
 =?utf-8?B?UkwyWTJZZEtPYTY5Qk5NN0VLWXFQdjhXSXRqcHVBcGxsaWU0MUVzUXdGQ2Vj?=
 =?utf-8?B?aG1rZDBOYmk3V2hvczc1NVArc3JsTUREbUlPUEJCTllMRXorQUlOcCtJaU9N?=
 =?utf-8?B?T0xsR21vZm9tMkpzaTlLMm9TekhONXo2QzROMUdOUzVvSGRJSWFsbHRHckJY?=
 =?utf-8?B?ZU52ZnFaaWlIUW9MWkZkYUJ5WldzT3RLUlppTExxSDhaT3ZIWVZrVlRDcUk5?=
 =?utf-8?B?U0hxT0ZRYW9ZNXpZRlNUazRkTkJlbTZRV2lWakpXWHQ5RE04Qy84MjhORUNp?=
 =?utf-8?B?ekUxMVU4d20wNmR5R3I3dEhLaUdLQ2hObnl0SDAzZ1dtaTBtb0Z4bGd4d3Nh?=
 =?utf-8?B?TVFUVlN3MThqWlNVRTY3QlBsQUxmY1RUdzBrK2N1dWZ2M1ZOM1pZTWxOTEhh?=
 =?utf-8?B?bU8rYWdYTlczZjVuV1FueXdDV2lhMXM5bGpPUHFPS1ozVllpZnpsTTVkcTZJ?=
 =?utf-8?B?anpOalRsRjdzdnVmaTZXWW9BSi8zMGxuaGZhcWhOUVJRa1BKZXlTRkhyNHRq?=
 =?utf-8?B?SHFiRHBzMnlOSlVQMEFEa2VSOE9pUjVhSFdZc0l0RmV6elhrWUE2bk1reito?=
 =?utf-8?B?L0l0aFRCLytkeTYrbjM1dER4QkN1eE1hbmx5ZW80L2J0NlpTWHdkUmhUTVJp?=
 =?utf-8?B?VWVlajRuRks5VTgzMWF1eDVLL1lnekJDUFVSZFgxdU5jUmUwWEMvNjA2UXFu?=
 =?utf-8?B?Z21mVWZ5SHVJY250MkVGRk5WelAyaVhUNXMza2w4YkhVY3hxeS9hTVhWcnZK?=
 =?utf-8?B?K09kM1Q2dlJ3RXlHQTE1ZjBpbjQ3WEdzdjV1UVMwUHFPWXJGMGU4VFJUQXBh?=
 =?utf-8?B?NGp2djlPWDNtZEUyd2RHcm5TbkhFeW9vU3R2b3Zyd2RXQXNNWnpJbzl5T0Uz?=
 =?utf-8?B?RThta3M4S2NUdmR1ZmJyT2R1S2psT1pjcFZTRkVuZEROMkxoV1FsMFJ2aCs1?=
 =?utf-8?B?ZjJRNDBOcitsNVJjbzFOTkRtWVJIUFVKajk2V1FJaEJJR25GOGVFaWRtMFBn?=
 =?utf-8?B?OG5zcHZhYTF2a09tV3pLd2hDZnpiUkFvdkRrLzF2NkN5WXZuWmg5UGFnQWd3?=
 =?utf-8?B?c0dUaDFOSys2VENsS1R0UDVoWmZCSFBBZytGWWFYNU93cDlZaUxXK3p4bjBF?=
 =?utf-8?B?VkIwWlZSaHh3SlgwQktXTDJxS1hhU21mbHBJVjJXcWRpOFd1NWIyWmhqVXhW?=
 =?utf-8?B?ZDZibEF1cDNTUzNKU3d5ZzJJcHhvbzUwc1VMZWpyaE5DYVgzdWplOWdERzVW?=
 =?utf-8?B?VnczOG5pZVJPMFhoUGgxQ0JtM1B6eVNybjYzUGxlRkhOMlQybWpFSVY2VDVt?=
 =?utf-8?B?QjFvUVdiQXp3YkhFUGZURkFGWmtGVndjdG1lQlV2Ym5ORGN2UWkwclY0Umdi?=
 =?utf-8?B?NWpkdUEzSktDMVJGSFJwMFp4akVhNzl2L2tYS21LRkJoR0FaMkhNMlRTWE1V?=
 =?utf-8?B?d3NZQ1kyWkt3Q2QrYTV5M2V3S3p2UlNxTG5INk1lVEtGTDlPSi9sMll1VTVP?=
 =?utf-8?B?ZU1SN3BTTHhmczUwSUgzVitFVnA0ZGEydmpHRXNxekdiQ2EyYzRaTHJwVE80?=
 =?utf-8?B?YmdrbUFCajVLSS9ST1VBRThkLzhvM1dDMzhiQnFlNDF0Y2ZLbGxuSVNXd2tB?=
 =?utf-8?B?MUhhNEJvOElVa0oxc1RScUVMMTVTbWYwRCtEU3VnVVlvWmFoYVI4UFBZRnda?=
 =?utf-8?B?NFI5YzV6WmhsWGEyMGV3TVJUeTk4MDBtS1ZWQ0dZbzM3N05OMEJBbElZQmFO?=
 =?utf-8?B?QUlpdjM4SE0xandMQUxvRWV1MHlUNzNSeDhBajcxYkdhbU1ZTjV1WTdZWU1j?=
 =?utf-8?B?dmhFZmhGUWVxUy9iRy9iS01DWjlUR2JkMkFPUFhjeXZBUDlNTzZxeG9GcEZq?=
 =?utf-8?B?UnYxTVo3dmYyd0RhUlhZUE5mNHdzTjJSc2k2SldVazZXYnA1aE8xMU9GeTVL?=
 =?utf-8?B?RE42V3lwMDhtYldsSmFjVWxpcmp4UUVuUlVNSWpKMG85REMyYmJOUU90RDBy?=
 =?utf-8?B?M2ZwdzlIclBYcndnSXloRkdVYnJySVN1V3NnampQTiszR1Z4T0NJalF6ckhZ?=
 =?utf-8?B?UWpmMHM0TmlBanY2V1FzZ3dTZVVFQWFXVmEyVHlCRUYwWDIxbVZ5djdNSnJu?=
 =?utf-8?B?eHBuMmNpMzJZdjBlU3VXL0xxa1B1WjNvQ21jYVlZenJpbXAyVXhSQ21GaWN2?=
 =?utf-8?Q?drlPrBi9JS95lJsA=3D?=
X-Exchange-RoutingPolicyChecked: hLrA3SodCC4ldOoWU+iINFZQgknVN4hpW5pqaVxip9IOdO+VsVtZgNI93EBVigoWcZX/nZeEXC1NkHH6UG8eERktPVe1SdkE+EvrJEWTdIRUu+6l9OZBUxh9L51tBjun/u/5A2zpL3gekRXoBwfag8fjbj49jIQ2Az0fYQ2+6J+8frmWHH0c4tubiWw1sFW2kcqYIeFaWCtyfqNLndqDB19JgbZV/KjS6raQXOla2BXNsTBn06TdT49RF5eZsshQ7nb36QPtLy0pJJ3A6bsLHv2HYpqRKc0/yxj7V7vROYOc8d3sEg8gRFvVxXauwb4jKk1gK9xvNjNWxZLxt1rHSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0be27b-0f73-4282-6451-08deb71f9f40
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:59:17.9375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avY9Jg5uyPANUoLNcn7SNx6xeYr7DQmaOMu1ZtD1ETo87CWFmoyI4e2og4NnL+nAV4NNXZf6HfK3hr8u/ZKSftWLvmoO6hDM4RMZwWcnzg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7249
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

On Thu, May 21, 2026 at 09:25:39AM +0200, Zbigniew Kempczyński wrote:
> Missing STATE_COMPUTE_MODE instruction in the pipeline causes undefined
> behavior which can be observed when input/output buffers size exceeds 2M.
> 
> Update pipeline, shader and data to reflect changes in arguments passing
> due to use latest version of ocloc compiler.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7768
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> 
> ---
> v2: drop unnecessary change in dg1 (Francois)
> ---
>  lib/intel_compute.c            | 68 +++++++++++++++++++++-------------
>  lib/intel_compute_krn_square.h | 36 +++++++-----------
>  2 files changed, 56 insertions(+), 48 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 680675982a..409799bc8a 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -61,6 +61,7 @@
>  #define THREADS_PER_GROUP		32
>  #define THREAD_GROUP_Y			1
>  #define THREAD_GROUP_Z			1
> +#define PREXE_ENQUEUED_LOCAL_SIZE_X	512
>  #define ENQUEUED_LOCAL_SIZE_X		1024
>  #define ENQUEUED_LOCAL_SIZE_Y		1
>  #define ENQUEUED_LOCAL_SIZE_Z		1
> @@ -513,6 +514,13 @@ static uint32_t size_thread_group_x(uint32_t work_size)
>  				   ENQUEUED_LOCAL_SIZE_Z));
>  }
>  
> +static uint32_t prexe_size_thread_group_x(uint32_t work_size)
> +{
> +	return MAX(1, work_size / (PREXE_ENQUEUED_LOCAL_SIZE_X *
> +				   ENQUEUED_LOCAL_SIZE_Y *
> +				   ENQUEUED_LOCAL_SIZE_Z));
> +}
> +
>  static size_t size_input(uint32_t work_size)
>  {
>  	return MAX(sizeof(float) * work_size, 0x10000);
> @@ -538,7 +546,6 @@ static size_t size_output(uint32_t work_size)
>  static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  				 uint64_t addr_input,
>  				 uint64_t addr_output,
> -				 uint32_t end_value,
>  				 unsigned int loop_count)
>  {
>  	uint32_t val = 0;
> @@ -547,11 +554,15 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = PREXE_ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = PREXE_ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
>  	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> @@ -564,11 +575,6 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -	addr_bo_buffer_batch[b++] = 0x00000200;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> -
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -579,7 +585,8 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	 * Then it lefts 32 dword gap filled with zeroes. Pattern looks the
>  	 * same for tgl and dg1 (apart of number of values).
>  	 */
> -	while (val < end_value) {
> +
> +	while (val < PREXE_ENQUEUED_LOCAL_SIZE_X) {
>  		addr_bo_buffer_batch[b++] = val | ((val + 1) << 16);
>  		val += 2;
>  		if (++curr % 16 == 0)
> @@ -597,8 +604,11 @@ static void create_indirect_data(uint32_t *addr_bo_buffer_batch,
>   */
>  static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  				 uint64_t addr_input,
> -				 uint64_t addr_output)
> +				 uint64_t addr_output,
> +				 uint32_t surf_size)
>  {
> +	uint32_t w = 0x80;
> +	uint32_t h = surf_size / w;
>  	int b = 0;
>  
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -617,10 +627,11 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x87FD4000;
>  	addr_bo_buffer_batch[b++] = 0x04000000;
> -	addr_bo_buffer_batch[b++] = 0x001F007F;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (h - 1) << 16 | (w - 1);
> +	addr_bo_buffer_batch[b++] = 0x00e00000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -633,10 +644,11 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x87FD4000;
>  	addr_bo_buffer_batch[b++] = 0x04000000;
> -	addr_bo_buffer_batch[b++] = 0x001F007F;
> -	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = (h - 1) << 16 | (w - 1);
> +	addr_bo_buffer_batch[b++] = 0x00e00000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -649,6 +661,7 @@ static void create_surface_state(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> +
>  	addr_bo_buffer_batch[b++] = 0x00000040;
>  	addr_bo_buffer_batch[b++] = 0x00000080;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -706,7 +719,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  				       uint64_t addr_surface_state_base,
>  				       uint64_t addr_dynamic_state_base,
>  				       uint64_t addr_indirect_object_base,
> -				       uint64_t offset_indirect_data_start)
> +				       uint64_t offset_indirect_data_start,
> +				       uint32_t work_size)
>  {
>  	int b = 0;
>  
> @@ -714,6 +728,8 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00002580;
>  	addr_bo_buffer_batch[b++] = 0x00060002;
>  	addr_bo_buffer_batch[b++] = PIPELINE_SELECT;
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE;
> +	addr_bo_buffer_batch[b++] = 0x00180010;
>  	addr_bo_buffer_batch[b++] = MI_LOAD_REGISTER_IMM(1);
>  	addr_bo_buffer_batch[b++] = 0x00007034;
>  	addr_bo_buffer_batch[b++] = 0x60000321;
> @@ -735,9 +751,9 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = MEDIA_VFE_STATE | (9 - 2);
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00A70100;
> +	addr_bo_buffer_batch[b++] = 0x02FF0100;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x07820000;
> +	addr_bo_buffer_batch[b++] = 0x04000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> @@ -747,7 +763,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | (16 - 2);
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS | 0x14;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00040000;
> @@ -756,7 +772,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = (addr_dynamic_state_base & 0xffffffff) | 0x1;
>  	addr_bo_buffer_batch[b++] = addr_dynamic_state_base >> 32;
>  	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x1;
> -	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32) | 0xffff0000;
> +	addr_bo_buffer_batch[b++] = (addr_indirect_object_base >> 32);
>  	addr_bo_buffer_batch[b++] = (addr_indirect_object_base & 0xffffffff) | 0x41;
>  	addr_bo_buffer_batch[b++] = addr_indirect_object_base >> 32;
>  	addr_bo_buffer_batch[b++] = 0xFFFFF001;
> @@ -794,7 +810,7 @@ static void tgllp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = 0x8000000f;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -	addr_bo_buffer_batch[b++] = 0x00000002;
> +	addr_bo_buffer_batch[b++] = prexe_size_thread_group_x(work_size);
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000001;
> @@ -962,9 +978,10 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  
>  	memcpy(bo_dict[0].data, kernel, size);
>  	create_dynamic_state(bo_dict[1].data, OFFSET_KERNEL);
> -	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr);
> +	create_surface_state(bo_dict[2].data, bind_input_addr, bind_output_addr,
> +			     execenv.array_size * sizeof(float));
>  	create_indirect_data(bo_dict[3].data, bind_input_addr, bind_output_addr,
> -			     IS_DG1(devid) ? 0x200 : 0x40, execenv.loop_count);
> +			     execenv.loop_count);
>  
>  	input_data = get_input_data(&execenv, bo_dict, entries);
>  	output_data = get_output_data(&execenv, bo_dict, entries);
> @@ -980,7 +997,8 @@ static void compute_exec(int fd, const unsigned char *kernel,
>  					   ADDR_SURFACE_STATE_BASE,
>  					   ADDR_DYNAMIC_STATE_BASE,
>  					   ADDR_INDIRECT_OBJECT_BASE,
> -					   OFFSET_INDIRECT_DATA_START);
> +					   OFFSET_INDIRECT_DATA_START,
> +					   execenv.array_size);
>  
>  	bo_execenv_exec(&execenv, ADDR_BATCH);
>  
> diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> index ad9f719762..9a368bdff9 100644
> --- a/lib/intel_compute_krn_square.h
> +++ b/lib/intel_compute_krn_square.h
> @@ -14,23 +14,23 @@ static const unsigned char tgllp_kernel_square_bin[] = {
>  	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
>  	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
>  	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> -	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> +	0x16, 0x08, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x08, 0x11, 0x03,
>  	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
>  	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
>  	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
>  	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
>  	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> -	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> -	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> -	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> +	0x04, 0x09, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> +	0x05, 0x0e, 0x46, 0x52, 0x04, 0x09, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> +	0x50, 0x0d, 0x04, 0x01, 0x05, 0x01, 0x05, 0x1d, 0x05, 0x01, 0x05, 0x01,
>  	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
>  	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
>  	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> -	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> +	0x12, 0x10, 0x10, 0x09, 0x40, 0x02, 0x16, 0xa6, 0x12, 0x12, 0x10, 0x09,
>  	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
>  	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
>  	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> -	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> +	0x2a, 0x10, 0x10, 0x09, 0x40, 0x00, 0x12, 0xa6, 0x2a, 0x12, 0x10, 0x09,
>  	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
>  	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
>  	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> @@ -41,24 +41,14 @@ static const unsigned char tgllp_kernel_square_bin[] = {
>  	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
>  	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
>  	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> +	0x31, 0x01, 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
>  	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x4a, 0x12, 0xe3,
> +	0x61, 0x00, 0x04, 0x80, 0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x2b, 0x54, 0x3c, 0x84, 0x61, 0x00, 0x04, 0x80, 0x20, 0x42, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0x20, 0x42, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
>  };
>  
>  static const unsigned char dg1_kernel_square_bin[] = {
> -- 
> 2.43.0
> 
