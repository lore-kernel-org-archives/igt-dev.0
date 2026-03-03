Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A45EA4E18
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 04:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D5E10E623;
	Tue,  3 Mar 2026 04:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+vPcJck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E784A10E623
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 04:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772510510; x=1804046510;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=MtrWYgSwhXzzokdBtowbnafT1iM3qjESNtwUz0wCLgU=;
 b=F+vPcJcksmLu/HCFYGpurfiLFrz/hPhFnLFLxLRKZ1R+PREkZHZQurjj
 y5zapuuXEtd/szqykRq5io2K+qRzHJKA1oer3Usx3jpfZFbnRMAAi5Tqm
 mrcmFXWh/Y5FITmwpZf0+klsjKOt3vWTZOQUJpojDPA3N9As9gKVCTjOe
 nCgjePjzDMo7eE1gMOLfNtdlBcxQ8Fsav9doWZc1o9d/aKuNYzyklgHN6
 ynIg9kNOgYjULQkpMIzel4b18uG0frC8jQijgWZ9R5/H7Fz39XLUfhlCR
 u2SGRyTs3orLctsnnWNr8E2IRVTByZN5bo7xa8V4GtYWkiDw2c2zsQyRX Q==;
X-CSE-ConnectionGUID: zKnTLbCgQv+5+e64skKF4Q==
X-CSE-MsgGUID: Azivf+zBTvuFfi/PhTuF6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73440961"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208,217";a="73440961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 20:01:49 -0800
X-CSE-ConnectionGUID: dupvNlsFSouD1wAL2wneMQ==
X-CSE-MsgGUID: 3lMIfkN8TbWGBaiDy+bo4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
 d="scan'208,217";a="217777697"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 20:01:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 20:01:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 20:01:49 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 20:01:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMuBvddZOr88PZaqHgd5a0s+fXEKV1sBXN85ZZ/W58muwQUIMTfCyRe211/wV29Ggmixl+g1NIvpTlvrbrCbJi0b4t2IQIIFKXPA8yKFA0j9lXlATk+PfeAxOMP6dCuj9EZa+dLvi7qhtmikAfvqr35Iq0ZQo+zb/2RBLJS1BwC1ig1Ijcfejv1mtfOD6E7LFNOtbspUC5ybTO07OfCfWCSELQFgbE2OjQ/aGq47gX7lNbMQTpdjRlXVXwDaGpl1yDkpLcrjeSG7Ot3Ume3/vMkuBTQ/kzd8aZFPYjjkkMsySX/7zBEsCXwls6yZPSqlM+m2/USXMHwaWDMZTEEtmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDh3CUAJf4QNO/uUQuOF64asKQOsescKyCp60xrK42s=;
 b=In1ZcpfuTtFYF/FGhARs5ys52DqWyINf1Wg4RwMLfXakW2MngFH64DJ/PbmHSjft7eKPRG1xtaokBq+6AIb6vD85DoQJMOHl9AXjREqiU2zRMG8rjjVKqMPP3YEmN58DXjCXu+vHb0tk3M+5JkaCh4d8IX8NcBrx/9CqOyZ+irX+v11S0NzAdskGIw2U1dGvwvLYWsXi6xCSxohFX9DodMIwbfJkzb6CS6Xvjpc0L2+x4Z61tk0b/96GY1wWceDcaDHB8NCQsjZgCvMiK16PJdlYVcFUo9Jb6mIXLbHJR6jkUFz0ZHtAqYcnPAXLgbtmNtGKDgCCjEdGH+vOI93zyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 04:01:46 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9654.014; Tue, 3 Mar 2026
 04:01:46 +0000
Content-Type: multipart/alternative;
 boundary="------------80URtNttLecHY1lOUG7ZRzhe"
Message-ID: <cc8c4f98-fc54-4a90-9002-253994a22b1a@intel.com>
Date: Tue, 3 Mar 2026 09:31:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/2] drm-uapi/xe: Add support for No Overcommit
 flag
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>,
 <thomas.hellstrom@intel.com>
References: <20260302140010.1009564-1-sobin.thomas@intel.com>
 <20260302140010.1009564-2-sobin.thomas@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260302140010.1009564-2-sobin.thomas@intel.com>
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 10901680-24f1-4e1c-0594-08de78d99697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: Sut+xuONWmJAT7I9ACQJrjpx4z5BdgmNn2qNBPkof3KU2k96FctImpXNusL832tFgx+mjmkr7yhJZ3uShYxWFN9lRIBrBiXDSaca91tjBhZfolrFI2rpb4D4fXLuDO1r/jxjHzUUQxKa/93Ap4aTRk0qGdxOV3y2ExGy1PO576HKDJBgaX+Ckbj/i12XMiu1HP8Mpf5Dr5mHDOhzqBmY/SHcglU9+haOzLKgXTBFD/2jTM6Qo53GqfL18jN9rEqei3+KKB9qL6Uv9yu8rDo7ltD+ofHaR7yn8ONERG7YkUac28uybnZmczDzW6MwPId4e+YAkRSTs+Z8CPmOhyaHZ+YPFqNBJ9l1eKng32iB0RRUdtdSMOiVZGfNLjD76WTy4VrRE0SuzcKpqoiT9vKssceATaucPhjZ/chbii28cruy3osqr0gsSeRkCXUWkYUVMbFO9lEImx9jvK502GlEgih/IsgPgftNZX2q7dSY0mC5Db6du2cUdqeq6yhlocc7jT5XdspJ9DYmirDQe15hgVjl5BiAUvNFEGyHSWtO3rpStaObXJSV4XDAvRVHkQKepJhSe0V9KHhGETnfapxpQIBZQjXEwDeRG3OjfRh4/Qy7/JkJ5bdmJCG4W4qfr9JBK3ZCvomrGOWLMi3g6qXFqY5j9TIKzhoM2xRLoQJft88upvR37HqhyFvJTX4qTTxPvg5l3/bdNzFFMy7SlRT9oVxmwr2tWZTsf2BlWH+Fnv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm95RENLLytPZkovaFMrdXM2UkI2dFc4YjZRSUVHRkVTY0psUEtNMVRBaWRC?=
 =?utf-8?B?NmFlMWhSaytQV01EVDNQeHQrcEthNWFad0pFRm8wUFJ6UUl2d003M3BsL0tD?=
 =?utf-8?B?WFNmOE9teUV3NU1VOWpJeVB6RVVpdlN4ZW1rOXpRbjl5bHY3MmNsdzdDQWdj?=
 =?utf-8?B?ZFlNTU5RaUlrZmxpdUdFRXRKVHZsRWxmRUFneXpBRTFpbzlscEtiYTkyU3RO?=
 =?utf-8?B?MmcwUTdZMDNXdDVJM1dkOXRLS05jdmtTM21wd2lCc21ueTZaekNsNVlIOFpk?=
 =?utf-8?B?K3hINjIyNTRWRS9qaGptMUZzVVlkbC90MnovN2lJLytMb0gvak8zdWtTQjlY?=
 =?utf-8?B?RFdPU2lvRmNqcTgrV0sxMGQ2dHlGdXdtZGpjOEhwTFliMm5Qblg4eldPMWU3?=
 =?utf-8?B?T080Uk5hZmtpdUxzejZvcGdkakFOVi9DR050Q0VMSlNVejFteDJLSWZTNnVo?=
 =?utf-8?B?azY5NExldkJCdkVsTm9pdzVkbnJoZ1hKUFBlZjlNcW5NdW9rN2pORWVwczd4?=
 =?utf-8?B?VjRhVXlCbTA4ZS9IcFR4RU95UXI4dVY2b3MvcUJjcHkyZ3hmV1cxUFh2S1pl?=
 =?utf-8?B?RFNjU1l6L0hBTmQwbG81Ymd3SklmNDM0ZGNNZVFhVEZkT3BzQnpIMWhLU3p0?=
 =?utf-8?B?TGNWS1FKSkttWFFHUzZuS0h2ekU2SFdDU3ZPblNyeUtBWHlFdGVDNVBVUzc3?=
 =?utf-8?B?cG5hOHFhd2l4VGJsNDhCUDYzakhqUVZRWjRwRE9qeHdJUkpzcnVhcWxZR3NX?=
 =?utf-8?B?YlBDck5HbE5PSm9rMXl2dVFoM1VEWDluUmwvQWhuNXB3Z0UvbVFQTk9GTUJ0?=
 =?utf-8?B?aXVjdnBzTWNubStKVkt0M2pLWHpjUUhaSnVBSHJPRENRb0Q4T244Sk1BdEg3?=
 =?utf-8?B?N2R6RWFDN2hJNzdyNENPWC9xaC84TVZ1cHd4bzlPcFNnWnUzalhTak9jSHk5?=
 =?utf-8?B?T3FVL2k4SUdOYjhxZlU3aVM1Q09UQXdRL3Q3UENaeUlyV0FsRjR0aHBxZy9T?=
 =?utf-8?B?cGQrRkV4eHVtSVlud2lVNkJWblY2SVVjdWtDTThIVGVPTGVwdW5Va0hqa0dR?=
 =?utf-8?B?bS9QUWxwczVNbS9lN3FGOHNjeGI0ZkxMcEtiMmo2Z3BqdzF4N2RCR2lzZ0ZZ?=
 =?utf-8?B?d2FyVDE0Z2JUN1pLUWk2UURRMnh3dUcvUEZXaklYN0RCcmI4RXdKaW5uTEpv?=
 =?utf-8?B?NzJuNjFGOWdKSFc4aWpYQVBlRlEzcDdnMGwzU3ROWDJMYWpJNEMyV0RMaHd0?=
 =?utf-8?B?QnJHQXN1ZTdLZnlSdjRsWnBzUnBIdzhHakZsRFdIWjYzUVE2RWZNUUVId2M3?=
 =?utf-8?B?TXFiWTFRK2xEWnNMRGFEK3ZTVFhib243S3lOWENHVDFIM3g0TWVOZ0t0NHVO?=
 =?utf-8?B?VzdCb1ZyYmVKVlJBYWkrckpRWFBWOGMyVW5tRUp4bnpLNWp1Rjh5VXJNMFp4?=
 =?utf-8?B?ZlAvTzI0d0tvUVBVd1ErNW5FMEJXUDdXbVdUSy9RYlpQTzQwU2l5THdxNXJp?=
 =?utf-8?B?djQrTUJQVWtVenVLT3VGamZDUUgwaXNZYlZnVno3TS83cUxMVFN6SU1nVnhN?=
 =?utf-8?B?SnFqK0lwQXlVbFRVRklTSkJ0NVJZNjM1YnFLdzFlWVdpS0Y1ZXgvOXFqb2VH?=
 =?utf-8?B?WWk0eUtVTDFPMThMNWhEUTBQWkl5LzJpeTZjY2VucGVCUks3b2VGYXd2bmIy?=
 =?utf-8?B?ZFQ1Wld2eisya01Ld3VJZnZvSTFrcU0yUk9Od1RQVE1uN2NubUN5R0RGU1ZK?=
 =?utf-8?B?RlhCOGU0UmtEb0VkSmRlcmYxSjBrSWZCY0xNOHc0dmFIcGl3VFNpaFNwN3ow?=
 =?utf-8?B?dU9xYkxKcGFHYXRHMkJleG5TL1pFaTBXMlVaL3l3NWxaVUFRZ05mY1B5RUVm?=
 =?utf-8?B?cUljcTM0VCtXKzE2eHZJK3RNcjBzU1JTRG5EMXlaV1IyVU5ydkZXYmZ6Ujl0?=
 =?utf-8?B?Nm5UKzZGdGllWlM0UWNub2kyODlXYlhkM2FBRVdRMjQ5NVhaQ0ErOVpQWWYx?=
 =?utf-8?B?R1hzOGtoa3VPSUFQT0MwWElJbVd2di9sS1pUQjlidmN4WHpMRFMvWGJJdVVy?=
 =?utf-8?B?Zkt5Ry81L3A2MkIwWlpESWFHUjFZODZ4ekdxUFVXWWt0MnZHZ1U4WHpIYm1p?=
 =?utf-8?B?WTJNbGlkaWJla2w5bUJLSFlGcmduam9ibVVSUE9XRVlid2FBUVlkSGttRDVM?=
 =?utf-8?B?YUJhWGVKMFkzcHNEUWJvTHRxWUIwaHNtWFY3bWQ4UE5SSUgrMmVoSVRsclk0?=
 =?utf-8?B?cm5kSEJOQ1EwdWh2YjdaZnZCMGFQay9mQy95bkU5cEN1REgweDVwWFV2dWc1?=
 =?utf-8?B?c05PN0xNcDlOT2o5V1NnQTJwYnlzRTQvbWxrMFVYMjVvZXBWelN1UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10901680-24f1-4e1c-0594-08de78d99697
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 04:01:46.6370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6LzuQEOsyfvdZfEXxbsX8AvWV8/+jVqMQMJaZaaWYEtGebNZmPk1x/mx9D5wks9zimzsaggBq45wuNBJc8wvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

--------------80URtNttLecHY1lOUG7ZRzhe
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 3/2/2026 7:30 PM, Sobin Thomas wrote:
> Align with kernel commit 369cc8804985 ("drm/xe/uapi: Introduce a flag to
> disallow VM overcommit in fault mode"). This adds support for the No
> Overcommit flag in IGT to match the kernel UAPI behavior.
>
> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 077e66a68..12a9da045 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -983,6 +983,8 @@ struct drm_xe_vm_create {
>   #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
>   #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
>   #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> +#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
> +
>   	/** @flags: Flags */
>   	__u32 flags;
>   Hi

You need to use kernel header *include/drm-uapi/xe_drm.h* in your IGT. 
Using that you don't need to add any Macro or struct explicitly in that. 
Align with <commit-id> means KMD header used in IGT

to have proper alignment with KMD. Macro 
DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT already available in xe_drm.h

--------------80URtNttLecHY1lOUG7ZRzhe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/2/2026 7:30 PM, Sobin Thomas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260302140010.1009564-2-sobin.thomas@intel.com">
      <pre wrap="" class="moz-quote-pre">Align with kernel commit 369cc8804985 (&quot;drm/xe/uapi: Introduce a flag to
disallow VM overcommit in fault mode&quot;). This adds support for the No
Overcommit flag in IGT to match the kernel UAPI behavior.

Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
---
 include/drm-uapi/xe_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..12a9da045 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -983,6 +983,8 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 &lt;&lt; 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 &lt;&lt; 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 &lt;&lt; 2)
+#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 &lt;&lt; 3)
+
 	/** @flags: Flags */
 	__u32 flags;
 Hi</pre>
    </blockquote>
    <p>You need to use kernel header <b>include/drm-uapi/xe_drm.h</b>&nbsp;in
      your IGT. Using that you don't need to add any Macro or struct
      explicitly in that. Align with &lt;commit-id&gt; means KMD header
      used in IGT</p>
    <p>to have proper alignment with KMD. Macro&nbsp;<span style="white-space: pre-wrap">DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT already available in xe_drm.h</span></p>
    &nbsp;
  </body>
</html>

--------------80URtNttLecHY1lOUG7ZRzhe--
