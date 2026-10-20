Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E47606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 22:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOh09iaF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C6410F809;
	Tue, 20 Oct 2026 22:50:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B7410F7F3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792536597; x=1824072597;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cPKdVqyFzeiIQL0UsFuCgdsYdd+tE843ve9znruNuW4=;
 b=ZOh09iaFOMqCG7/9DIsK3FxFb0W9zBTTFPWc1rU/1Do7d4C5DogJq83q
 VrV75iJnTrsy7hliUIJXCIHYoANex738VKvlJqk+kM2CDB+e2sg1d1HV7
 eZyqLZmH9jFC4CeLP1Ag2NdtmC1tc/WlzgEZpd0iqE1CeIORQt+OE/bVS
 v3JFWBFkgXqPOzhyqDbUpwTXI9O9W4rxXwya5l2OZydUkrq+vaLFOpsL9
 vFFKi+iVYJcoAfOQvtHQKq8pWN8qm+T1FIbbEvB7iacrGe1RLjHr2l3Z1
 fl2K0SK4Q0BvRo+7tVEVpqMJ+F9fJcti3SzdURN9rtfGZgP7vhAhjuDQc w==;
X-CSE-ConnectionGUID: 81J080OQQfqMS7sgxOsBnw==
X-CSE-MsgGUID: XTgIlTZAQxm3IYM79cSHPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1155403"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1155403"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 15:49:56 -0700
X-CSE-ConnectionGUID: q5fu98b/S7KAlRbsDpyXeg==
X-CSE-MsgGUID: vfgQeBl9QniUqrOFJYIcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3241960"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 15:49:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 15:49:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 15:49:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 15:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaMmgc1N8XksZhkfIT688HDP7ylxemUIyYMasRNDHFe9HDHXokaoMMs1n20mGYlpUwxtI8uap8K9VyYDUGqseL1zdZX8WloHHauOx8+r02qvxpU3LitUoTE2+SpHg8K89wfoKKfz/iJeS8ADEf9xblEfILkfx3AMZIVZZ+WlC6mfs9/uB1tYLmOuuRs5NQTwbylsZ9uEmG9w4nfkSrJ5js5XlJg/iF//UU30RWz4w8mmbDK6ZwQ0OAm2v9vjuhc/8AoYnuHnrunnZjwZkSFUnQY2XkAU/9QrjIA/u2cYaHvOUGLFelhdq0Tcxg981xhsfwYvXW7ue6pA4aed1jfaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FT4k2HcRs+mb80N3WWvuVqwDGf77vZIJnDQuFV4fO0w=;
 b=NEQ5cnXFuXBv6yuYjnq18+0aKaiIoaDWPrNjkAcc3trlQU7+JhV7LAGiuQlxqqs2DlpOL17CMjXrY9BmCX7gOHvbw8h00PuVTv+SC/x1VaOpPpkQWP9gMP3fjOFPuJr3KmsJaj9hs9W568gEGbkP/9EW9i6VaMM8jTfEJd3rcQE4hkwGagmzDg+vy8qZSpyEJP02wRLCV24wM1dkrukTZINQJUUJi2UueOA369TsA5geJI4p6QShYuarvAxaSgF59gC+CoDPhx66Wqy8N1EyuPH8JTKS0DMRNS0VBbs2VTZcvCsenvfFsFnUROjL1Ks4mgdZtcSQ1IoH1r9ytwg3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by DS0PR11MB889816.namprd11.prod.outlook.com (2603:10b6:8:3df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 22:49:53 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 22:49:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 03/11] lib/xe: Gather workarounds debugfs dumps
 in a cache struct
In-Reply-To: <20261020212422.GB180749@msatwood-mobl>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
 <20260923-wa_14026539277-v2-3-528b575299d2@intel.com>
 <20261020212422.GB180749@msatwood-mobl>
Date: Tue, 20 Oct 2026 19:49:48 -0300
Message-ID: <87qzhkgf77.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|DS0PR11MB889816:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc53ffa-4ed9-44d0-80b5-08df2efc7482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: a+2j4OJUBhdgOHDPXPFCQDTUPU8ogN3KwVPi3K2pjSxnt4Mf/f8KLeNorGibHXrATriLiaagoJRBqCrqXJyiq37kt5brm3uNHody71NQpToe1N4+341Fgi49wPTh5CyTtXhlmGAbP52u3xgCsokjsM1UpmsSqqx3UwbRUc7gp7InEnbCbjr4E9Rse2Luno9v2+BemPYAJZLPwQkkQ0+GIvOGCE5RAlkS/OjMfQICM/Gfcpcc51pN1LoLvKJ9rk4OCZD/ydGL247ZO9hNCh0PcGTahjIPcncfOLkm2COOeick1s5cTPdrONoW5ATqFvh1fV2P52Z1qpvQT7JCrUMbzb0F6cwpXLbBvVvuh46xy5E2iL+1tG8/oT0A1dIkACEfhnW3JSuSXxZSxLYFna1ZnM+ABNs0cplF8TCaLNNHaM129+5urqHV+aLF9ndWpRZ+a+aUggC0RVmg09vn9BG65EMmTUK7fRmM86hUKofGgJB9bmtGRqjEI3H42vhi1YH7sOZ2FdUzL2guLWJsppZqrYHB29eC62yH4rh8KEQrFBZSWP1rJL9aRs02K7bwbY5pshGLG43g5KM1VTrQ5Vcsm5aoNtuqW7POBFcii/B5shuoLYi0J9d2+AgNS/lTiO9XNrL/6GavNLFEerZRVMSWZ72L4Xqa4wWeVwdAZ8ueNtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EhSVet6eJDsGGnCGDldb2QIMbtrwYpt+c7yWivT2fUsOnD0/crAVvbfvylgU?=
 =?us-ascii?Q?J5SlBjG4BGZ1Boz1sQw53XZjM/CWXUSRcxc3ZwpDKOUD6eklfEoc2BNdQuBC?=
 =?us-ascii?Q?2LpOep3mE75wsZo9uOMStvdUKY2s+edCI097HBgXedSz7PjaVq9r12xosHWA?=
 =?us-ascii?Q?GVaH4yTZArH8yHPGRSoYnTkxOSF7lzulOcVrGPbVvNdgFt20kZlGwdnVrOgx?=
 =?us-ascii?Q?7vq20xrxI+imqCL0cDKITxzMZfMz6053FDqrapnyIVQyvSpA4Lrf6e9DQyPc?=
 =?us-ascii?Q?8h4y9SGnNru21+9P8Cnt1uiOCSgBqpC4CjjVdhnKD2W/5nNDEWhtJNdp5Oa8?=
 =?us-ascii?Q?h59h38Sh2Uy4kVl0BZGZtfAASOnvBaHbJ1/q68nvfEjHtjuyvGkv/7jlyohb?=
 =?us-ascii?Q?XnDm07hJkWZkOsx1r0yBD9Ma6tb0akCwPoTPxCaT6X4rlS0IzDq0KplPjDIZ?=
 =?us-ascii?Q?QlNrSrny/Qt9+aounbH1rNsPrNRdbDL66OPAmTIX1wcrZyxM+KdZOJyhW39p?=
 =?us-ascii?Q?vuXP1kZNxh6gr/zy5o75EOaHgJmzS9dwv73OYfCJZ8/Ms1u7eYaUwS/zFqsg?=
 =?us-ascii?Q?Vv586Q70r+FLRmZaq4JrOU04eMADX/MRzn8/9eYzhHxBc3MrC+93Sr9nycC4?=
 =?us-ascii?Q?YMPx97aBSm0bPIqRuYLMrpI6SA0qiA5c0Zew94ECXqGSIrzFj6iL5QK0RCSF?=
 =?us-ascii?Q?T2t6hH096X9nQ7LqrUjOYlK12BCno4/gRlk8zr8BhujKhVoHjdfJ8+EJ+jl9?=
 =?us-ascii?Q?yto/lmt1kDmi8UGPd5aKsIrY2FSNYYcKhhljgIiZva7oH1MDEG4PTHPTIJrj?=
 =?us-ascii?Q?2h/w+X1cqOTc4y8eCkWAp/vZwKGDZsVnguba3ovdXa9xR/GmuijzjTmchjjL?=
 =?us-ascii?Q?ElTZSi/rDFP/q2RI191Js8Q6Y4WI6W4YSU+nNPrC2609MOn3URvG7ZdgY2gF?=
 =?us-ascii?Q?zJzCfOOYyKHvJuMR76ZPE6pjwMnyk78YGvVBlGayCgKyQAPw9CHiOZsj2mhU?=
 =?us-ascii?Q?cXQQWrCpGLZFAZLyrkkd1iA6jhjAqJqqYvPsRbuPenjWF36cFZdyTU3oqMVn?=
 =?us-ascii?Q?VAgPQJJj1/zvLNnkbyIVVaXRHZyRCV1BK03WMTPJQUulVzyNJjNA8Rzla5ZK?=
 =?us-ascii?Q?r+txXKe8E3erJILEg+kmAyVWzM8PG/bq16JM9ykTXcOZlueTjPn2b8dn+Oud?=
 =?us-ascii?Q?M0+/m9hEBCePwM8MjohAtz57oiDJpwJIvWgdDjT0y4C5CiWu0tboLPxIy9ft?=
 =?us-ascii?Q?IaEWnghTJFtDILqXX06u44f+Ac7TosaorVMtTEIBUuAgSNp49gbs/pxiP97C?=
 =?us-ascii?Q?eacrWoIhOzayAIqs9gdYkN2FuDwiqrH7f7MNcFSi/c5DI0zSZXSPumLPx7eA?=
 =?us-ascii?Q?8jwXJV/LOIqtQdgjiby1725O8dkgt7m3E8xFLPV7Y7QdhleNhzxKt/f5o9Vx?=
 =?us-ascii?Q?p4RcP5qM/hOlmtSBHTb6NyfL7xk6tWZJqkhjprOaAm+eiwNPm2fbG9x5qyVO?=
 =?us-ascii?Q?hTVU+QQsByxEusLBVgv6qhEm+a6RPOOrRctaTZpEAyrf29xVThHWt2m4ISTs?=
 =?us-ascii?Q?6Vi+G+fnQ2p3j33VspeWQY9gdd4o2SVSerWvA1F6pcHtL1g98ANciyVzsWiZ?=
 =?us-ascii?Q?dK7Vqq3hOmK1tF/9Tz/9iXcxpTPRwIvbmHWworBVz/lDH6ZHa3pUpNmPhM4c?=
 =?us-ascii?Q?ki9fr1i19qHLQpB4ktYd7zBCjuSBOWIcqGyz5SCvSqTOVsjzYXUFqydURpVm?=
 =?us-ascii?Q?ET9GdCx6Ig=3D=3D?=
X-Exchange-RoutingPolicyChecked: E1Gap3n91Rb4gIL0w5QS8AvX2QEY7oBY5fOV9m7Lkw7Iu/yBdF8CmTKWaCV+tPNLfyAxEH3hfmVbvFD0c7Tl43UaI2T7CqhLHoofg4zbyOa9XIN55kidewuD7RtRVI1YzF5ovwx/kE9WbLJJTX2MdCjw9Z5qOx11fH4r8JVbG1TMmc0pXW9xRPC8P+E0eXhNP1v/dWZMCZfDIjESSSSCOB0wZ2Hrl8WK94pIrIMKyw20ggjQddzoueTR02M94scih84plcT7nqR+f7jdsPZtDERbVeAY5RsiOWFq6/frNKFtcDBN69+mSTqgve+aJd3tRJxfkDCBaJNgXN6e7RI5ZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc53ffa-4ed9-44d0-80b5-08df2efc7482
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 22:49:53.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrObruHz+8lF61HQOO3Jq1WCWJsmUlYxpp4k8iXgWQM84JeEgnNpcEUQEZLuFZUTfsuacSSdZkyYLZRppiZZ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB889816
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Matt Atwood <matthew.s.atwood@intel.com> writes:

> On Wed, Sep 23, 2026 at 06:41:10PM -0300, Gustavo Sousa wrote:
>> In an upcoming change, we will cache workaround information in struct
>> xe_device.  As a preparation for that, add the logic to gather the
>> dumps of workaround debugfs files into a cache struct.  Such a cache
>> will be kept attached to xe_device as a follow-up.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> looks like MattR's rb got dropped from series one

Yeah.  I should have called it out, sorry.

I intentionally dropped it because I changed the approach in v2 and I
would like a new review on this new version.

--
Gustavo Sousa

>> ---
>>  lib/xe/xe_wa.c | 140 +++++++++++++++++++++++++++++++++++++++++++--------------
>>  1 file changed, 106 insertions(+), 34 deletions(-)
>> 
>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>> index c0c97e244564..93b97c7c1476 100644
>> --- a/lib/xe/xe_wa.c
>> +++ b/lib/xe/xe_wa.c
>> @@ -8,6 +8,7 @@
>>  #include <stdint.h>
>>  #include <stdio.h>
>>  
>> +#include "igt_core.h"
>>  #include "igt_debugfs.h"
>>  #include "igt_sysfs.h"
>>  
>> @@ -16,6 +17,101 @@
>>  
>>  #include "tests/xe_wa.h"
>>  
>> +struct xe_wa_cache {
>> +	int num_dumps;
>> +	char *dumps[];
>> +};
>> +
>> +static void free_wa_debugfs_dumps(struct xe_wa_cache *wa_cache)
>> +{
>> +	for (int i = 0; i < wa_cache->num_dumps && wa_cache->dumps[i]; i++) {
>> +		free(wa_cache->dumps[i]);
>> +		wa_cache->dumps[i] = NULL;
>> +	}
>> +}
>> +
>> +static int get_wa_debugfs_count(int fd)
>> +{
>> +	int gt;
>> +	int count = 1; /* Device workarounds */
>> +
>> +	xe_for_each_gt(fd, gt)
>> +		count++;
>> +
>> +	return count;
>> +}
>> +
>> +static int get_wa_debugfs_dumps(int fd, struct xe_wa_cache *wa_cache)
>> +{
>> +	int gt;
>> +	int debugfs_fd;
>> +	int count;
>> +	int ret = 0;
>> +
>> +	debugfs_fd = igt_debugfs_dir(fd);
>> +	if (debugfs_fd == -1)
>> +		goto err;
>> +
>> +	count = 0;
>> +
>> +	if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
>> +		goto err;
>> +
>> +	xe_for_each_gt(fd, gt) {
>> +		char name[32];
>> +
>> +		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
>> +
>> +		if (!(wa_cache->dumps[count++] = igt_sysfs_get(debugfs_fd, name)))
>> +			goto err;
>> +	}
>> +
>> +	if (igt_warn_on(count != wa_cache->num_dumps))
>> +		goto err;
>> +
>> +	goto out;
>> +
>> +err:
>> +	free_wa_debugfs_dumps(wa_cache);
>> +	ret = 1;
>> +
>> +out:
>> +	close(debugfs_fd);
>> +
>> +	return ret;
>> +}
>> +
>> +static void free_cache(struct xe_wa_cache *wa_cache)
>> +{
>> +	if (!wa_cache)
>> +		return;
>> +
>> +	free_wa_debugfs_dumps(wa_cache);
>> +	free(wa_cache);
>> +}
>> +
>> +static struct xe_wa_cache *build_cache(int fd)
>> +{
>> +	struct xe_wa_cache *wa_cache;
>> +	int num_dumps;
>> +
>> +	num_dumps = get_wa_debugfs_count(fd);
>> +	wa_cache = calloc(1, sizeof(*wa_cache) + num_dumps * sizeof(wa_cache->dumps[0]));
>> +
>> +	if (igt_warn_on(!wa_cache))
>> +		return NULL;
>> +
>> +	wa_cache->num_dumps = num_dumps;
>> +
>> +	if (igt_warn_on(get_wa_debugfs_dumps(fd, wa_cache))) {
>> +		free_cache(wa_cache);
>> +
>> +		return NULL;
>> +	}
>> +
>> +	return wa_cache;
>> +}
>> +
>>  static int debugfs_dump_has_wa(char *dump, const char *wa)
>>  {
>>  	size_t wa_len;
>> @@ -76,27 +172,6 @@ int xe_wa_test_debugfs_dump_has_wa(char *dump, const char *wa)
>>  	return debugfs_dump_has_wa(dump, wa);
>>  }
>>  
>> -static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>> -			       const char *debugfs_name, const char *wa)
>> -{
>> -	char *debugfs_dump;
>> -
>> -	if (!igt_debugfs_exists(drm_fd, debugfs_name, O_RDONLY))
>> -		return -1;
>> -
>> -	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
>> -	if (debugfs_dump) {
>> -		int ret = debugfs_dump_has_wa(debugfs_dump, wa);
>> -
>> -		free(debugfs_dump);
>> -
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>  /**
>>   * xe_wa: Check if a workaround is enabled for the device.
>>   * @fd: A drm file descriptor.
>> @@ -106,25 +181,22 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
>>   */
>>  int xe_wa(int fd, const char *wa)
>>  {
>> -	int ret = 0;
>> -	int debugfs_fd;
>> -	unsigned int xe;
>> -	char name[256];
>> +	struct xe_wa_cache *wa_cache = build_cache(fd);
>> +	int ret;
>>  
>> -	debugfs_fd = igt_debugfs_dir(fd);
>> -	if (debugfs_fd == -1)
>> +	if (igt_warn_on(!wa_cache))
>>  		return -1;
>>  
>> -	xe_for_each_gt(fd, xe) {
>> -		sprintf(name, "gt%d/workarounds", xe);
>> -		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
>> -		if (ret)
>> +	ret = 0;
>> +
>> +	for (int i = 0; i < wa_cache->num_dumps; i++) {
>> +		if (debugfs_dump_has_wa(wa_cache->dumps[i], wa)) {
>> +			ret = 1;
>>  			break;
>> +		}
>>  	}
>>  
>> -	if (!ret)
>> -		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
>> +	free_cache(wa_cache);
>>  
>> -	close(debugfs_fd);
>>  	return ret;
>>  }
>> 
>> -- 
>> 2.55.0
>> 
