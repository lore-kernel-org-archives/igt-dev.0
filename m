Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81917C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 21:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218FD10E1B9;
	Tue, 21 Jul 2026 21:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JysGbsUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83F310E1B9
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 21:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784668990; x=1816204990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2R4HCTN9AgwykIOZwtCbVtWDNZTRyTGABAv+yNi+sog=;
 b=JysGbsUH4qOsavAhZcHsF3jLC+ef8KNYfI8bkTC3Erpdo+XqRiGO32V6
 hcVMvY/rJT8fkivmU6F3o+MlSRri1ula+MfYvbzyeU40wCYJUpw6uybUs
 5+cn7OtbhlZO5TphW3cvGpmW1PrWqAsYrmx9qL1pPzqNksQK3SHN8dbVj
 OCngc+SOFZuGiPBr31j93Zy4XLsXlJmcn0PScPfLDYInisYv4MysvvKUt
 gUjgu1vbaKgassbVRrhkkj3pv+0EnAHOPnLw1KCyRDQbNhU7N7BmqSwo7
 n50YQ3ZZj9dTB2ooCBejzAkwMyjKEgRugk8T3C7dwOsQgi6GuKV6hb1FM w==;
X-CSE-ConnectionGUID: bbZyRSHHQLGBxPZ0wfP9ow==
X-CSE-MsgGUID: G+64YBWES5uKexg3/vbKWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96653964"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="96653964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 14:23:09 -0700
X-CSE-ConnectionGUID: tLrwFjwhTTaR99/5cduI8Q==
X-CSE-MsgGUID: iykDGqaoSTeL5nQzNXW/zw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 14:23:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 14:23:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 14:23:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.55)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 14:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofLpwWdeWMOHUMLlVstFCO1zt7bTzEse4b5fZB7ALOO90UocOaa78nO47xupHq0jxSyCIawQxdI1boPWqPXw2R2pKLTB7o1cVnJu0cPxMAV0nY5091QJpW8i6rmQLkVZdVZU+vGnIcUkIB9O2pqZ6rRtGSYl0hXQk59sb+WYFSjSl+P7S+Rzxh/AWodzMToZofdYTFgVv9vKvblch4eDNtPebRTKyqrzSldYvy82afj7k+CTQkkwTBRhpZa3DqdqWgTgwDuHGZRtpwFrj+NfSYGr23bBI/FDsr+CheoH8dgKYVB1mq1gUsWZxNb6aEjT5zWYYORKPKmS85oby0KDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCfMhWMlNUc/xa3ICrSgFBOGdwYwdHsnamPqD/iPdDk=;
 b=MItWq8sNaCWIoXPw3Am3SBLusqIn3K0weZNX3YzuXN0cyja9GSD59/+5EFI63OjaZJP0/UVRI7StyxjNeg0hSl4SXR//Ydz5kAx0RebR6zZDmo/34fbnlOr69z9t22EswyPAngWVQh2ozXGdtNW9ksoDpls5kQjtKg0kg2ZJHioPae8JNdlrIEjnr5JKpU2XUwtcgixmxVFHSaO1zZlpdCSJPXGC2ztnm9ICgCvp+ZQ0MKkouCkmpbmjs56VjQ4Cdjn2C9kzJ6H0WJlMA/vHAQpGLdwGc0pMltYXM9OQz3Wum2JlMUoyZH4bjkTrPOmWi4nAmjS/43fHEGT01QZYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 21:23:02 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 21:23:02 +0000
Message-ID: <c2bc0795-a919-41ff-bd83-33567294873b@intel.com>
Date: Tue, 21 Jul 2026 14:23:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pxp: Require output for display
 tests
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <alex.zuo@intel.com>, <ville.syrjala@linux.intel.com>
References: <20260721153123.1972825-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260721153123.1972825-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::14) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: ec673a65-3b3f-4a6d-be9e-08dee76e3ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|3023799007|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: KlTxmQQi2/kGzHlRQK5/p66SYNJZKSmdKzHj4McO/JWnxxBLV94yjbRUYGVE6HRcI2Xksk5Km3SzwosxsM7iZzMEl2z9N23fiIgQK1mKXi30W/ljIKr6ygU38cPyDpoXc3a0M28nXveNpLJqqPnBc0WLBWRhOniizIjyRzvUfu2YMIqlo0bd4WZCahaONukPDWG0mLiIjIYp6HzstreK0z8FI5f8da9qBfqkKIvVDl2468os+7KriZun3tyjm29ASg7rBMzI0qH2pQ9LRrZB1emPmkdEpgL1/HSw3yXcUbwloul2a9ES6UUyczk7UAWTfKjln4AfCt1qD6JlOd66Queoos0vSi+raFukMB/8ONPnkHlGq/KeGJ7ziC1bMhmJaAygAOo0tIgV0F7yGt3SdniFUuI+wA1iMDQz7cmiZdOzf+VH9ACVma9hGoJxoT3QTC+czpWPUq8SbPZ9FJG7GwBldCrWxGN5bn1aYMt1uVOSqRs+UMOETaJSzg2qq5b3mqRC2FZG6Di6MaFwC3SUYByGtbqZRh+XdcFgdgA1ictjYFw934msGMXCoZVG1PdrjlfpnQhmuhZF286PoYqMhnb0gInvZJ/8AecE+gxb8wTHP5vfRsOceyK1VGXAEReA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxScEwyQzJEdFFNclNSQ0hjdVY4K3R0OXpqMjRlUElSTms0SE9tUzhzTlJo?=
 =?utf-8?B?b283Kzdkbm0wa3A0ZDlGUzNDd29VSENvSjg2ZVY3NzFJT2xGYkprUnBZbzht?=
 =?utf-8?B?blVzYkFxRUk5aysxWnFOYUxiemdkblZ5V3BSYUdMNWhUTnRXNmNobTRJZG9i?=
 =?utf-8?B?c01TdFVpeUVPU092b2JMTFh1Z0lJdkxKeUFxQmZiM3dkN245RXVsaFN0VmI0?=
 =?utf-8?B?REpnNkM2ZXlWRUxKQXN5NmlwUFdUMGVxYjkzQXR6SVBtRWkxYng3NU5lL0R3?=
 =?utf-8?B?Y1pTVGUyR1Vmdmk0RGkyTzA5aTZuYTF4ZVNRZTBxS1R4UzZiazNNd0FmMy9D?=
 =?utf-8?B?VVhUalBRY0lrWnU0Nko5RWlEeFpBcDNBTmZ6dlZySCs1MG45T1FxN3Y5Uk4r?=
 =?utf-8?B?ajR0YVdMRC9pYzUwb2xkekFTeTNOTHB3aE9IR2FyOTMxNkF5S0xXeWtMd2Y2?=
 =?utf-8?B?U2ViMjBWZ2M2RFFjc1ptT1piSlVCd0NoaWJQbmFjdlBkbjFCTGdPNEpUNUNx?=
 =?utf-8?B?V2w5ZGRXY0xhNXA4RkdzUFJyeFFOVTBtSEFOaGlJRmtxRUhiQ2RZRjJIdnBy?=
 =?utf-8?B?ejVnRG9naGJWbER1c0taaks5STNGWXlFU3RwK0FoZmpsWEQ5T2NVRWtUVkI1?=
 =?utf-8?B?QWN3bWw3ckxvSW4zTzZDZzRmUGs0cGVVWVdzQlpWSUhMOTg2L09Sb2JPT2dn?=
 =?utf-8?B?eU1hVU1IVEl1VWljNkZkWHpMTzJXMTlCSFRKNVJPSmthSXV1aFlDRkZIOHVz?=
 =?utf-8?B?L2lyekNTOEVoSSszamJSU1UyaUhkcHBsMEloK1FJSk9ZQm1mOWVDL0tQSDVm?=
 =?utf-8?B?YWV1WnlUQ21hYlovVVdqdmVvMzFjRnlRM1ZNN2RNQWMyQ2ZmUEE4aG5FZm4v?=
 =?utf-8?B?RXR3dFk1OEkrVk5FRGIySjgyQ1BmNm9uUHNXYkRkQ3hxdURMdGkxa1NLaVNH?=
 =?utf-8?B?ZTRLdWcyZHJLQk5tNlpHYTlHdGNRY3J1NDV2YU1YcU9sRC9nQ3NHZDZZcDd4?=
 =?utf-8?B?TDNSVHdwNU02c0YzcTh5SDZDRmJPSjByR2o1RkZweEFhTURqWTZEci9kdmxO?=
 =?utf-8?B?TEgrbzRaNk16R3FrZUw5K2NVQTZXRkxzU0VrMitObnpYWll3eWVKRTRmcmVS?=
 =?utf-8?B?N2t5VXVtaE52MzlBVU9mVkNuR1hqQzRpL1h6QmtjamJVNTZILy9GSHZpVC9U?=
 =?utf-8?B?eExXM05senozaUlPRXRpWEJiWlR6VnhZSVdVUEhYNWNrYlA4MUQ1Nm93Tkxa?=
 =?utf-8?B?OEdVUE03V1NFWDBaTWNGUTRnUW1ZdW5RV1VRVG9nN002ZjRRWlk1ODd0TVI2?=
 =?utf-8?B?bVg4bjJLeVBmbEVLRFNkVUhaTFFtdFUwblhUNEdBY0VIdjFrVEZEV3Fic2My?=
 =?utf-8?B?MHk5RU43YzYrV1Q0ZTYzQnVEaXBiNFVRd1J6aUlnczlKbVNqYWVRbUZyZ2NB?=
 =?utf-8?B?Vi8rditzWWpxWWFDdUJhTENhSDFEb0lEcGdxOFZCRzlnREZhbUxFbS9qenk2?=
 =?utf-8?B?YUxNODVoS01uY0hqU0VYOHhYTkNWa0JVWndWVm5Ra1VDTDdPSTVsckdoY1Vk?=
 =?utf-8?B?ajFUYUhoQzdqRkNIQ3BzUVZxTkt4b0tiaEQyNDNGSzlGcmtYZ2IwODJHUWI3?=
 =?utf-8?B?L1JmaHlaQmNIVHV4ZVN6Q1hLZ1l4aHlEVm96dXJTR0lLZDE5RTUyOGFiYU9q?=
 =?utf-8?B?TkExZ3RETWFJWUFRa2ptSGFBRnpsK1J0Mkhza3ZQUWRtMlRLUHNGaHRjeDRh?=
 =?utf-8?B?cTF4OWxVNHJMWlFBMFo3RTJndGRIUENaZnZlNDRUUFM1OG94a3RDZm9rR2hn?=
 =?utf-8?B?UkVBbFl4WnhPMHlhZk1ZL1hCUi9kdE52b01peGVVTTRTbGUzTlU5Uk12L0JF?=
 =?utf-8?B?RzhDdXA0ZG5hZUVjTzFvZFJ5THdBK1hHRzFFc0kxL1NCR2FBb3doV1BWaE5t?=
 =?utf-8?B?cFFIa0JGSHkzNG03eHZEYkhiOEk3R1R2Yk5rN2dNY1BwTHowSkh5OEtTcTVm?=
 =?utf-8?B?UnZmVE42cnptZXNsQ1JHUURyMjduSklwZ0w5Y0wxc1puVE96VzFtaWtSRnVY?=
 =?utf-8?B?aHVrWDJYendHeXgvYi9LeDRhamxtK0VieU9oUEZFT1RCOEdWcHlYOE9KNytB?=
 =?utf-8?B?a3AwWS9COGxnVWUzOFc3QS9wNHhic3g3NGp6V25MVU01WVAvRllSejNOMWpM?=
 =?utf-8?B?Lyt5Z1N2Tmt2cWpqVkY4TjJXTWIrTkpoeTdNNlR0SjNZdXRJa3dMYllhM0Z5?=
 =?utf-8?B?NlNRcTVxU25CNUlLcUdWM1haT2paK29GQXA3Q2lTK1RyQkhkdmllbFFvOGFx?=
 =?utf-8?B?enhIZ3N5RzUyTUZZbzgxc2ZVZExTbmQxalU3ZytvZHZZcmVYZk9zUzJkSGN5?=
 =?utf-8?Q?3d03HvhfQsxbKqgM=3D?=
X-Exchange-RoutingPolicyChecked: IrZLc1ZXXV86SIubHdtjqCDT6JbBF36Cb/BGM7zNWGFNyO2SbZuE9nIM6G7owbNqtvgU+EsrU398TXNP3OXuy1QY+DV+kFaXFwjAqpsP9rNBKBpN6ERV+1AF5qDlLmnSPuov4kZZbk/jBzC8TBmFhKB8YRQ+3g1mjsLgsFAAP1nVDGxExUAyRSnGV0qKE6v7vvAGGa8tK2ypX2nTvK2OLRnRXjBvzPdTy2CKuVOE0T7Ar8yY5P0sxBbvyo+eEKCYMep7mYk4sXfn/BcrpwlaJq62nyUpue/7+sjb0yiu9M79t1tnZJlacbyzrm8QwzkMoht+IrR7h+x0Ia1NUB806g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec673a65-3b3f-4a6d-be9e-08dee76e3ec3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 21:23:02.0541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iI/9zMZE5TyqBWE/CQQ1KTBdZc+OV7oxHJmhhaHaInk2/mAVaruoHE+kB7QpOKqereezagHYdD8qpNehkg5i1a9d4K0CDLnD6drEV3C4G7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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



On 7/21/2026 8:31 AM, Jonathan Cavitt wrote:
> The subtests display-pxp-fb and display-black-pxp-fb both call the
> function igt_create_color_fb with a width and height value generated by
> getting outputs from for_each_connected_output and selecting the maximum
> width and height among all available connected outputs.  If there are no
> such outputs, then the resulting values will be zero, which is an invalid
> input for the DRM_IOCLT_MODE_CREATE_DUMB ioctl.
>
> Skip these tests if there are no connected outputs.
>
> v2:
> - Use correct ioctl name (jcavitt)
> - Add missing closes tag (jcavitt)
> - Use igt_display_require_output in require_display instead (Daniele)
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7738
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   tests/intel/xe_pxp.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 9320078733..5460bf6db1 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -1002,6 +1002,7 @@ static void require_display(int xe_fd, igt_display_t *display)
>   {
>   	igt_require_pipe_crc(xe_fd);
>   	igt_display_require(display, xe_fd);
> +	igt_display_require_output(display);
>   }
>   
>   static void dpms_on_off(int fd, drmModeResPtr res, int mode)

