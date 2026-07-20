Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359BAC44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 23:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9C010E218;
	Mon, 20 Jul 2026 23:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by2IlCTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A3010E21A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784588384; x=1816124384;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NkpYuiEEX3Gw+IIC3lDSBppGfdrE6aAAlRKTHva2XDM=;
 b=by2IlCTF0hNLWvc4IJ3A3n7YAfpAPbKobx2ehmEML1hIEUggR283s6M9
 MBk9N//uHhcyL21EzN9RCQaiGxqGEM4x+4AyGFNhCpbPSQgkN6F2uXLln
 vRtU021mVFHZMfBnzus8pXVKq8DCBJdPy6IYkxu+4TX5XtPMC+O5ORKNe
 TJWBFbAoRiwW+r3/GkVg9g7qQ6FfCwwyjaEpUwV/C/ucfyy6SmUceFLC5
 wcxWZSDJeFFhDYH8zPRxbcwXK/BnyDTprPavZqf4Psgfs4sLvV28VWiYu
 m/QX2zyIne/sajMNRaLeET+gBxS6rdU5mYfbltPGI/eZjwd6ZKEVPe4Az w==;
X-CSE-ConnectionGUID: 6sqnMNm2QB2lCW2B7gYjwQ==
X-CSE-MsgGUID: k7aSZ1d6TXeSeYLTKvzrNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="110732327"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="110732327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:59:43 -0700
X-CSE-ConnectionGUID: L6Ft5hWeSlOeCjXVNezMlw==
X-CSE-MsgGUID: zYsplruWQL+FpasX4lBUxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="253663188"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:59:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 15:59:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 15:59:42 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 15:59:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqL0YHDbaZEVSW/Ky5ZB6nWkSlber3w6HXtSDDOQdjyX7MVQAmizWef8z0zQmlO5L71ah9mG5+tkAS19znwyhYWfz2/JllwBmIPS2k8ScX90n7IcTPD3y83rGfSkapXcJK1eK6fQYxWcnaZQLj+VSN/5NBiWz09Fr5yFEUEfsNMBDvhRRMBw7516p6pLQYAyiStwsZqD79Yd4v5vCTeAroiDQp1J6/9+Dt9eZL7dijvFIEZSTF9ZBRBqH+nlhhEtgPedoS02lefcbjgJLHsgZOiTKQdrwQ6kTbNVYRJyM0HxhMPKdrhEg9maG2805FtV1LsYz9h90n9HnoV7e1D7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyZrltGsPrUZjBvi6EzSKfV50BKpPRKFw9mWk2ji4F4=;
 b=LaGqSygb/Gkx+SZnosDGpxPYXbPX5W6ry57ON3G/7ArHRLxOE7TRawaKQkeBVvu3jNxhQ34pVTOOrDjHQZZ8que8l5TUaaFb/zieq8/USIfJHsJP/BRjRUrke0EEqIwwTfDMBbZwRoMFj8cVrTqi9NcZikfONLEdwx+BNBuUmDj3PXx9DcY8HpDl6gw3IWeqax0Ns5tSx9puxwaymYx0JXIj8f+YigGXPY/MLRQBumG7Go1Pbs5MKnygWaKVwMDlV+USOwBqDmXk8fg/7XxesIZVGy2PT5gfnOaDrZVT7bnL9FnpFrBcL628KxDh3y0lbB2IHd8Hh5XpmReHXeN6kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 22:59:34 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 22:59:34 +0000
Message-ID: <f0fe86b1-b650-4db7-9df1-1b2513f53bf5@intel.com>
Date: Mon, 20 Jul 2026 15:59:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pxp: Require output for display tests
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <alex.zuo@intel.com>, <ville.syrjala@linux.intel.com>
References: <20260720224635.1963815-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260720224635.1963815-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:332::28) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|PH7PR11MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: fd77fb9e-4870-4f95-fc0e-08dee6b290c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: zW2AKtiDYrIEpL8LBuAqHqXf8nw83cu6+xNlNl3TmBhQfsx2Tf+FFieM4iw5wovkFexvxPpK+GGbUl6di+Nt9tTr1I1R7YAslhPqUFx2xr3vvfoF08Wl7ltvJL/XEVOG5s+R+TiGRetgy+YC45MLB6EFKOudaEQfwbhkGHVPZcvuxWLrBMhXHFBlBpP1ToalS2UFLTMqjrleISAqqaRkj0Vk7sfQztzwULoORebWpZ6/RQoRNk5u4RqlunWjdhzJSbUHW99WKOyL6Vhm9mqfwKl6y4PMcBR018OEkSWUokr8r3KrddZGLyoKsdTdeNBK4SN8VadhSaU7uWKKAHoBLJBVqZyVrqAnMywAfP9BEjHp1IlSO8gn4tGIJKj8icnQJ4kYaKau4SbLLi9Ft3ndCNGgR+yuCbHTK+bNAuBt5wBreuaz+4GYkr4Wf/EMzz3Tw484HcerFooP5y80wHDVxBkaoJMavU3BFLDKJQB8iUSkQokDQKEW+BpxVhNuka7Jgp8LfCU4Jb8NpWSQumu2zLf9kwHVqqZMdJprSitWXiFZOv+RBJPPPWBMn1XXJLdqUf4cScYmsDGEpPW4HPnqs/buIef+CvJUTGHo1IqZwXqTP68G77viHOwKjTmG69oLVfoDj3OMkP9NvuHMaep0QFBXQ46jvsvNmbuFCaSe4xM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09KNHhBYVVzYVJua3VFblIrVnhucnFrNWhlR0ZTZmk3aVIwSlRRUE5POElO?=
 =?utf-8?B?ejVsV0pjVENLSmV1RnpkOC9sNUN0S29UQVZhWHpTdTUwUS8vS1V0TlNPQXI3?=
 =?utf-8?B?dmRTS2krSDllUkhhVmI1MXNHcHIzYzhwYUtIeGdLYm04RktKMGM5cDBIczha?=
 =?utf-8?B?cnNFQ0hEZUVPdVo5VjRpSjY0NVZibVBSZVlnRjd4aXYzRThZV1kzOXZyT0Ny?=
 =?utf-8?B?SzExOHZHTUpPTWorTGQ1N3g2R3dGdmVoVyt5QzVPTVlYUU4rMTNjVzkzaXpJ?=
 =?utf-8?B?MmY1amNHTEp4NDI5VS9ZUHZKVWhQZmgyc3R1WUlRdHpmUmtFVE1ucDRCZm1Z?=
 =?utf-8?B?L2ZCMnArNUZ3dktSSjJDRWU5K2VaL3g5TUMwWDJ0Uml4a3dtZE1xOG45aEdU?=
 =?utf-8?B?a3Y2YWhCNWFtdkowYXUvRGRvNmZTa3Y1c3hQbVRaVFN1OTkwcU50OVNJVnVP?=
 =?utf-8?B?ZTZnaTVzT09MclhsTG5ENG1NZU9KV2Y3d0N5Tlc4YWdZZ0g5QnhwT3VsdGZh?=
 =?utf-8?B?VUF6K0FnQnhreW1hb2hwWmt1Q29XRlgwRjljTWxEU2kzK2F3RHFlcE8xcjVm?=
 =?utf-8?B?T014OUdHci93YTl1ZGpnNXptRnVST05CbmJvb0crWVRkMEVWVW13MlByUEUw?=
 =?utf-8?B?U2NpbUZVUCs4ZU10VEd1ckx1ejhoYjQ5dm4xNnlNdS9hSUI2djJla0VIdjVO?=
 =?utf-8?B?a09mSExRMXZlYnhYeTY0c0xDMWx2SmdvZHZYYllJbFhRUFZGbEZJZ2VOaXkz?=
 =?utf-8?B?cHozUlBWRk8xSTcvMytFRHVibzVrQk52R0hjTS9uUm1pbkRISDFiS2Y0S1Js?=
 =?utf-8?B?aXBoaFBTZ0NJWkkvU3UrdlpqS3RORDRVSDV6TTFjV2t5WUpKcHFpTG9OSldr?=
 =?utf-8?B?NlFKWWhXYmxBa29rUGtWWjNtanRrR0lEZTFSYUd3QWdlVGlXeGEvTXVJY0t4?=
 =?utf-8?B?NUhyVUhJa0RWRUM0Y0lnSkk0ZFB1WXJ1Z0FsYkF3WDIxQ2piYmFvTFl0eUxv?=
 =?utf-8?B?ODY3b0xvWGVYYWEzNmgrVnpoT0huNVdnZmZtb004MXhvSW96U1NBdXZNcVdp?=
 =?utf-8?B?UmFQT3JQQ3BFcllkaTIrZk5USnN6NmlDd1R1a2ltSFoyZ0VPMmMyOWRoM0JE?=
 =?utf-8?B?V2d1NDZveER5NXJpOFZzS0Rqa0l3cEVDYmpkUjBuQldLcGhybFo0Q2tFZzda?=
 =?utf-8?B?ZzdGeGlqRjB3cVF3aTQzTlo4a05ZZCtXeUZEOU9lOXdTZXNabmtINGZlQy9K?=
 =?utf-8?B?R3VxZzR1R0hHWVdVaEJ3MDRBemxWVU9CMFd6SHBJeDNXemxncVhvamhFM0FK?=
 =?utf-8?B?ZkJvcEQ0ejVpYXljY3Y0UjAvNWt3TXFwWk5LUWtlZzIrU2oyN1ZWckpxdkx2?=
 =?utf-8?B?VGxHM2tQclFkOVF3YzJQWDMrWktoTjRkT0pzRXJTQ1Q0S0s2MFVkUFg1Qkdz?=
 =?utf-8?B?YVhDQlhJWGVlcDhWcXNNcjN2KzQ2bEhMcllkbjJ0RjIwTUFTRWZXV1F3dFl0?=
 =?utf-8?B?TG1IVEV1aklVZjE3SU50cklIclYxU2FISmV1cmFkNEpkWFV0ck9vcG5NZXBt?=
 =?utf-8?B?M2FiNlJobTZXV1FmcEN5OTZHY0IrWnE5eEVlSURDa25FVWF3SGwvdlo1bThk?=
 =?utf-8?B?ckpzUDB4N1lhdzhvZHJDRWxXdHV3YW1tS2ZNeWxMVW9VaUs2QjErT25PT2pw?=
 =?utf-8?B?RTdQUmltZ0F6ejhCdms2WUF6R3Q1c0hyOVM3MVRnczVBRG0vWFVpVWlLOUg3?=
 =?utf-8?B?NXVhZlVrNm82ZHo2UVJoeFIwcVU1OWphS0tLRnFHcndCNW1XTHoyU0FhdXBI?=
 =?utf-8?B?aXBlODZ3LzZVSklGcHlseTBQdlBJTWxKSnE2c3A0djZZQWNES1Ntek5Ec3hM?=
 =?utf-8?B?NHdoNXJxbHkxOXNudVNEU05Pb051OTdaR3RaOUNMOFhoay9vZzVpRUgrRFZW?=
 =?utf-8?B?OElrQ3hTWGdJL3I5blIycXhpUU92cTI5dWNDTlZpYTlSaWpMUmY0SVc5aVEz?=
 =?utf-8?B?dzlDSm5jc0tjL05wSXh1ZjNrenJITDVPNERyS1pMWVdacjlROCtteHI5QSsy?=
 =?utf-8?B?eVBzS29vUUtIK0cvWEgrcHB4czl4K3p3VnNUTCtDUnhmZVIwenl1SDJzRWNB?=
 =?utf-8?B?ZlVWSDVMenphWDY5R1RXc0o2b1FGZzBOWm5rOWhNS21zMDBkZkV1Y3lFV1M3?=
 =?utf-8?B?NXY3MndiNHlZQVZRSVdOVXFZdHB6Sk5kTjdxVW1UT3FwTTBaTEIvaGFJSmZE?=
 =?utf-8?B?TTk4MWdQSHpHb25vVFZ5a29ySW5sa0tlM0V6OEFieGhKS0xHaHRLSDl4cld6?=
 =?utf-8?B?NTJ4NVIvTmViWCtkNkVQWEpVQWoyalRIVGJOVUF6ZTlDSHlyZTFHdWtEZE1L?=
 =?utf-8?Q?uZQYxy/PhpdthMu4=3D?=
X-Exchange-RoutingPolicyChecked: R3ZZhuZIXX4LdUS5S4+4Nuy8gsijGy8YDZpk5612c/uKJ9KznvRsbBUTOdaIbG+V+j6GxrTnX7bS2GUNa6mpR8D9yXm3sa00XjU1BaCtiQntS8Ae3r8It4tYKgxqjbGJFWzvyxHCOkjZjFMi+Z2nji8pUvzSaC82OOEwokWK4sLDpSTLmEqd5y1U/Lnx+EfQHVZju+tf07qUJbDqHYr6RPOQ1mw054lNB7DCV+NrpCR/TObNXR5fUIHOnVNwqvhf/6DV1CrT3qJ3gJTBhM1n4u39FAC1tqgaJH0tAaNIA2YyFs77YD9KBhaYbXJmQQlYpOMM8o/tG8y8XlFRxPd9Qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd77fb9e-4870-4f95-fc0e-08dee6b290c8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 22:59:34.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xo8x6X5Em8+DIq7VL4oHmFvN2dXcrFo8/OgKu4teV9nmI/fbfTPUv5h2TFX1NpfdvTpjdYFc5DgCj1ISXv4Dv+GKZL2CUl/JurdG+CEiNAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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



On 7/20/2026 3:46 PM, Jonathan Cavitt wrote:
> The subtests display-pxp-fb and display-black-pxp-fb both call the
> function igt_create_color_fb with a width and height value generated by
> getting outputs from for_each_connected_output and selecting the maximum
> width and height among all available connected outputs.  If there are no
> such outputs, then the resulting values will be zero, which is an invalid
> input for the DRM_XE_CREATE_DUMB ioctl.
>
> Skip these tests if there are no connected outputs.
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/xe_pxp.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
> index 9320078733..080dc9519e 100644
> --- a/tests/intel/xe_pxp.c
> +++ b/tests/intel/xe_pxp.c
> @@ -868,6 +868,18 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
>   	}
>   }
>   
> +static void require_connected_output(igt_display_t *display)
> +{
> +	igt_output_t *output;
> +	bool connected_output = false;
> +
> +	for_each_connected_output(display, output) {
> +		connected_output = true;
> +		break;
> +	}
> +	igt_require_f(connected_output, "Display has no connected outputs\n");
> +}

We already have igt_display_require_output, any reason not to use that?

> +
>   /**
>    * SUBTEST: display-pxp-fb
>    * Description: Test that an encrypted fb is displayed correctly by comparing
> @@ -1165,12 +1177,14 @@ int igt_main()
>   		igt_subtest("display-pxp-fb") {
>   			require_display(xe_fd, &display);
>   			require_pxp_render(xe_fd, pxp_supported);
> +			require_connected_output(&display);

This should be called from inside require_display()

Daniele

>   			test_display_pxp_fb(xe_fd, &display);
>   		}
>   
>   		igt_subtest("display-black-pxp-fb") {
>   			require_display(xe_fd, &display);
>   			require_pxp_render(xe_fd, pxp_supported);
> +			require_connected_output(&display);
>   			test_display_black_pxp_fb(xe_fd, &display);
>   		}
>   	}

