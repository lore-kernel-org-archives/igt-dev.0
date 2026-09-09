Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06C5C79FB6
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 14:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1518710F1A1;
	Wed,  9 Sep 2026 14:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABbYlpPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7850610E1B1
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788962855; x=1820498855;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v4g4AJZmykOVp7MBn4eSd7KCdAxM0PXEAfdYfbRyfdM=;
 b=ABbYlpPvZLbp85+s60lSjAYWSl9MShJyFlcJBORfybjSIXsf9DWc2mEK
 xvBGq8IZ8nL1TUdWZf09/i+nfZIyHhr10Jz+dPopZDvr6+MOMsAdowqZP
 eMN0ZJ5IxlzYlniU9WID0sFXYaKpuP7K9nqaSG3jnW+OyoheGx5wauThH
 YwAYNbjbRwayJe5lmCMxrNlKxyCyHTioYxlplkGpybO4bu+HqH3BrIn6N
 Zhj31NHYNncyfHQy2vbg2hQIpiTX1sQ1PNrKQ+ItnA87SNpG3a2tCByhF
 sHhWgnzdlVw/mu/jlbOf7BZT6JKR3OJ8rpgvXWBqbpEM7J7rBKx2l95M/ w==;
X-CSE-ConnectionGUID: iPXNKMWbSJGtAsz77x/eFA==
X-CSE-MsgGUID: G3C6QlaqQ8aDjA/3bZGRzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89420499"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89420499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:07:34 -0700
X-CSE-ConnectionGUID: 6CNeJPlbR7WiYTNhi9bNkQ==
X-CSE-MsgGUID: KGeDm0hCR/ewTSqzPGimhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273305862"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 07:07:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:07:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 07:07:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 07:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6jK2sppWcbNtwkKz1M/kRMSscE2nhLZHjaQ0ady7CV9MWD5oAJoYAbfkD0tlhk9wyDYqA4b3YiZEChNJ/kXNd5+LA811ZiTY+Iu25SyuW/aN+mqOoBfYn4wRyJTuM7uoPTZlZlCq2TBXjBkFA5YCx9p/6PMAyBpCaw5kYAF0pVkUS7oD8e0HJPiBcA/xcfpkgnpdnK71QNtUhbB8klQwWROABUMR8/ozM+aorQNJWthLi+E/LMwbVKzzufQ1pi62cJhOdYZgotniUML7EGQiwwgS3b4yDEUCtBRb8R60ZmCzSnMMb7bMgCBwexSR+wC26dbH+7uKgKb2n4tJp3OQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtjiZf4ck3lPvZ0KLI5d4hQegkCOkSjJ8IDttJohX1o=;
 b=F1m9iydRJxvEX6vToWPqrC7EM7X4t47YlNsYm2f6t5DinN61nS4l2SeyHmDYfFUY6nULpHUpWexuWVFsDA1dFNrCcMBnYx2DZIjp1oGUS8/px5eXDZ6maD3tBHIJpIuwu0CMnM2iyBuYIOiV1aExMNnvxztac+besGHJzbkRvvPoqlTQZTelVWZsb6mTmTpfeocF9ZIcBYUUH0WvLJM0hoacFsn95Yj5FXnnSN0n1yjMfett3k6x7PoIHiXdeVUlQ6lZ3ONMeaM6o0isCz9kJws19sIuBmXpmhzRChDlwWoQNpM+/pVdrLtk9jgQi9Z2Lx7x2DORP+/5J51l3EzAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) by
 CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 14:07:26 +0000
Received: from DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd]) by DM4PR11MB7256.namprd11.prod.outlook.com
 ([fe80::86bc:2f46:443f:51dd%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 14:07:26 +0000
Date: Wed, 9 Sep 2026 16:07:21 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v5 5/7] tools/vbt_decode: parse & dump VS/PE-O
 tables for Snps
Message-ID: <5xrpodn5bkkxmvtwo4fal7rwot6uzjliprgk3gpmycqzftabyz@7c7omgh2dsai>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
 <20260702182619.3973788-6-michal.grzelak@intel.com>
 <PH7PR11MB605316ED569717BF415F02C1E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB605316ED569717BF415F02C1E7A82@PH7PR11MB6053.namprd11.prod.outlook.com>
X-ClientProxiedBy: VIVP296CA0137.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:359::7) To DM4PR11MB7256.namprd11.prod.outlook.com
 (2603:10b6:8:10c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7256:EE_|CY8PR11MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bd7938-f4f5-469c-3583-08df0e7bad51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ErRUVJwWw5Ri4mXNBhYO9Y5jPdIMJWl9hWOnOnzZUf1F5yYJyP7MSi71yd9XAYLxijj7/QsOdvAsPEpVuFFDcQLMzKU+xYux6mbF7bin3k9XJ+B+Ek1oDyAP7j28W1RNn7tXBu/jbWy6xPhVGFVlWydj+Fb4LwRiuIjYkJm8OKV1ZgSnU5i6f5LGyIJFVwZ2mlx4Lb29O62DARbO263kyFuUnFw/owMvMcLwOwyEisHWWGP2pn5uf9DeKZHG0qGljkiRxGCLy9I8UO7IuKK2LeNMdq+iO2RZLo8tCgKR4LzrnlshqldZE9pJl60Odx5cfMOWupTI3hFx4yyXzKH8C4phcj9wDUR/DA7z3CvJo6g63dsoL+nc9MGisLT9H5WGIzWUfOuSaoSWRxzgOB6cwoKGPV3s2NH30b9nGpf5XYFofN+G8ttlE+qYmU69LJDAxlyXI15s4tTws15Z/LDiuecjBOuvBc7UeVpGP2ERSbtVMRk+cz3hRFGZFpigfY7xk05CTmcep04aGGt7Yv3XA0/WmI1O3QLe+M3ORx/Is8U3VURN2yvYpbbCWy5YfHazSAJ/xBTabZ8xXItaBkfTZ8wXyjgYSh+dr+VCAQisdf3JAkH6l051scy4RWgAQgVkOjYMxGzeUUy6sb9ytZHINtMk9xiqT1CMAYUEBY+0HqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7256.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUZaZkFNdExla3BZUEg5RmVlcE1lZ1g4Qm9hZFNGM2Y0WHdpejZtNEtoMTRT?=
 =?utf-8?B?ZE9IemtZQU1oWXpqMXRUMlJrY1pqTFNYWmt5V0FmTE1hT1BjQVA3SGx4dFRi?=
 =?utf-8?B?SzAzd1dFVzViSkZidWd6TFh3ZnJ0bVhlRWRrcUl6S1MxeDJvbUttL3EwMkIw?=
 =?utf-8?B?cDV4T0owc1pyNnFXd3NVUkFxV0g5UDNsYmJjZFdjV0p0WEV3NHVEUEttZVVp?=
 =?utf-8?B?UkgwYkllUW5oZnlPalN4VnJsOEU5ak5ZeW9HSnhYemdsRVZ2Qjh5QU1zRjNs?=
 =?utf-8?B?Z3RuTVAvTzNIWjNrcm1aVUhFVWlLdjlVdElGQWJia0p0WFk3QUo3S0N2cFRY?=
 =?utf-8?B?MXo5VWtTRXZrSWl0RVBlSFAyMFp4ZnpnNFIvRlJGQ25NZzB4MXBBWkEvR0Fv?=
 =?utf-8?B?Z29zUmhaVnc1MFRQdmVqSGpzT2JMOE5GdDBaKzBWVkN4RXlsWFJXUjJiL2pY?=
 =?utf-8?B?WjBUdUhuVUxDZmFybFhITGx2WitvcFhaWlUwaU1hYTdpQnQwNTdFcWM3Tkh4?=
 =?utf-8?B?RmtFdklVTFdJV1YyTEs1Wk9BclpjMmlrQXRrOVZlN0NrcXFuZWozcG5aNXVw?=
 =?utf-8?B?eXdtN0lYeHR5V2ZuSTMvTG12aStzVll2U1puRHZ2MkQyM01xSDN0TFlQT1JB?=
 =?utf-8?B?aUJJSklnNUI0eXJBazA0N2ZCRnJMZitnQ0hCaFJ2a0RWQ3p3bVFsNmlhQlU1?=
 =?utf-8?B?YmhMdXJ5STlqZjYrVzJPVUJBRk5zK2gwZGIrM2IxWlNOZGF6Z01Ua3p6MDJi?=
 =?utf-8?B?UU8yd2I0bHI5TWVuVkh4VDRqUHFNZzQxMHFMUWtiM2Iycnc1UXUwWnVCbzFN?=
 =?utf-8?B?OXNqVlZwSktsbmRSR1NnSVJqN1lMKzdxLytsOXg2em0rejQxcDYyY2luWDIw?=
 =?utf-8?B?VkQ3NFVXQjlvZWdqWjhubGptMmpjL3c5Y0Fvd0xJMnorV2E1M3hNM3Brbkph?=
 =?utf-8?B?MThIU2wrNHczbG1sWWI2UWp5dGtHeHFjNEJHU2NaRzJZWkwwd1RiWjdjMC85?=
 =?utf-8?B?UXo4eStoaEVhZUtlYU44aHREcGdpeStVSXdXTG8xeGF3SHMra082bEJwMFNZ?=
 =?utf-8?B?c0NFYVMrOE1TSElVRjA4bE5VK3M2OUhyWmdrMmlPSit5TWxmSUdyNm9FU2o4?=
 =?utf-8?B?TGdHemtFRW5idVdwRlFmdEw5MXBqbTU5Uml3ekpRdnNzNkhUMThRK3YyL1k4?=
 =?utf-8?B?SjlVejRtOTArUmlHY1IxbGJXVlZnU3dyeitpSWEzQ01ISFpmY1hrM2doUitv?=
 =?utf-8?B?NTV2aUxNOUc1MU5sZXF3OGJENWc2SC93YUNaZ3hmcThqUnhKWUROU3ZJNllY?=
 =?utf-8?B?aExyWTVHeVdndGRTYy9PNlkzSkRELzNaeFM0Z3FmTzVDUzBYaXhvdi9YbjY5?=
 =?utf-8?B?YkJKck1yWHlTWWx3S3FsQ2N4UWJzc0RnNEkrdlRxTFBsNlFmOG9xUm1oRlRX?=
 =?utf-8?B?MXlqcXNkOUJwcHA2NS9xdnAwVGFuM3JWN1BXUFhnUVNlOEpSUVY2cE1uNnZz?=
 =?utf-8?B?TVcrVmI1WFBHTVBoNWxaVFZYZ1lTWVFBNEtJODZETXN5VCt2K0tyR0orWHRH?=
 =?utf-8?B?RThoN0FLL1VGZ2ZLai96VDg0bmVJQWhGd3Flbld2QUpDUkxaQlBobE9lZ3RS?=
 =?utf-8?B?Q213MlI1ajNqcHliV2ZmN0s3YWZJaklCRGR2SWEvdXdWNExYdkxjSEg1UmFh?=
 =?utf-8?B?cWxOaDdhNytSOFpBL2tPWUhQRkpZcmY1cC9taitKQ2hDZ05PVTFPTkVQZTlr?=
 =?utf-8?B?UzV0QXZIaTJ5cm9LcDZYYjJtTDQzR2drdWxGdUJJeDRtTUxOYkg4SVJqRm9k?=
 =?utf-8?B?T2tpMzNnMGxpR0pNQjhlMGxhZWNsdkdNUldCN01JQnBqNWExNGx5WFVlT25n?=
 =?utf-8?B?TUtGSm1ZS2l2M2hjMzViczMxenh4bXA0V3BERXh5MDJjOVpmRm4yLytWWGN5?=
 =?utf-8?B?SEtDeDBhYy9wVEVHbUlUYkZDRGxvZHlLSVB4b2hPVHFFMGVvSVVwWGx1YmVV?=
 =?utf-8?B?QnBQdjB0TWJiVS8vbWxrRmgydTZFNTFuRjMrWFU3Tm9HK1hHTXNjQ0hJUmwy?=
 =?utf-8?B?U0w2cUZjSmxkV3Y4U0Z5NUJYWnBmQW1HSWJ5WUxCa0J2QVJZZ1VGNjIxU2ww?=
 =?utf-8?B?ZUdWWmVIS3E3VkZkL0N0YkplN1dGR0dQVG11SW1HWmdqYXUzcER3VjF5K2Yx?=
 =?utf-8?B?U0dQUk9iSXFtb3NrclQ5R0dVcFFSTjJMZDV6M240NGV6djAreDJRVUcvbXhq?=
 =?utf-8?B?WlNPMi9abkRINkFwRXI4VTBpcFY2WWtyNS9Wd0ExVlh3MTRUeSttSzdrQ0Y4?=
 =?utf-8?B?NTlhZ0VzTGF2ck45MDJHdVJTUmxKRm4zOERpSFV5SStkdjBpWG1OL3Q5YTEz?=
 =?utf-8?Q?7hHNy4dnOLuiqEPU=3D?=
X-Exchange-RoutingPolicyChecked: XhvWgQOR+KQgUqxREStQvdbRBL1/e7WbFYkotvSX9Py0skqi7WMFowKhAzV7HQBj+pCMbsv9FOC2W9IyvWiz/wxKehtSAaapwdFttUI9QpXYQIZmXutF1al501CsiN14QipS6hfPi8btmHDPDmY9AJDW4IwRfwpoZDFLTJsoXophYyaZZY6zIxj1/w0qcyf+SwXelt1G884989w7zuQ9aj2mDaQGp+HhFoumv2avnRF9Vg61BOs4A8PVU7rj7OVj/r5woiDgJYiSNPKHaXNt1ICfD40PZJ/R76HmHEyMGDyPyecQVKGt6Cx08DFXXlJzR4UVOtv1gf6zqCAbaWAZVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bd7938-f4f5-469c-3583-08df0e7bad51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:07:26.3018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFC1wjp/lfo7ZFS/oqDFxs7huCmerqd3IIjKx4IwinFFSKRnNPQYyV9nY7iBuYYlMMBN6HfCInyDHhmjdBnnSVwo3Mi0MDJH+hUipXfIz6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
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

On Tue, Sep 01, 2026 at 09:51:34AM GMT, Samala, Pranay wrote:
> Hi Michal,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Michał
> > Grzelak
> > Sent: Thursday, July 2, 2026 11:56 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>
> > Subject: [PATCH i-g-t v5 5/7] tools/vbt_decode: parse & dump VS/PE-O tables
> > for Snps
> > 
> > Dump VBT #57 tables for Snps. Add a table of strings to store each table
> > purpose. Show the affected modes on dumping.
> > 
> > v2->v3
> > - use Cx0 for Snps
> > 
> > v1->v2
> > - check platform basing on devid not VBT signature (Jani)
> > 
> > Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> 
> This looks reasonable for a Cx0-specific decode, but can you please confirm the row count and 
> field mapping against the actual Cx0 VBT layout or hardware docs?

Here is the dump from custom-made PTL's VBT#57 decoded by the tool:

Block 57 min size 2 less than block size 1154
BDB block 57 (1154 bytes, min 2 bytes) - Vswing Preemph:
        Number of vswing tables: 6
        Number of columns: 3
        Number of rows: 16
        PHY type: Cx0
        Vswing Table #1 (C10: DP 1.4 RBR/HBR; C20: UNUSED):
                Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #2 (C10: DP 1.4 HBR2/HBR3; C20: UNUSED):
                Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #3 (C10: eDP non-HBR3; C20: UNUSED):
                Preset #01: vswing: 0x0000001a, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000021, pre-cursor: 0x00000000, post-cursor: 0x00000006
                Preset #03: vswing: 0x00000026, pre-cursor: 0x00000000, post-cursor: 0x0000000b
                Preset #04: vswing: 0x0000002b, pre-cursor: 0x00000000, post-cursor: 0x00000013
                Preset #05: vswing: 0x00000027, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x0000002d, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #07: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x0000000d
                Preset #08: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000037, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #10: vswing: 0x0000003e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #4 (C10: eDP HBR3; C20: UNUSED):
                Preset #01: vswing: 0x0000001a, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000021, pre-cursor: 0x00000000, post-cursor: 0x00000006
                Preset #03: vswing: 0x00000026, pre-cursor: 0x00000000, post-cursor: 0x0000000b
                Preset #04: vswing: 0x0000002b, pre-cursor: 0x00000000, post-cursor: 0x00000013
                Preset #05: vswing: 0x00000027, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x0000002d, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #07: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x0000000d
                Preset #08: vswing: 0x0000002e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000037, pre-cursor: 0x00000000, post-cursor: 0x00000007
                Preset #10: vswing: 0x0000003e, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #5 (C10: UNUSED; C20: DP 1.4):
                Preset #01: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #03: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #04: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #05: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #06: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #07: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #08: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #09: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #10: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #11: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #13: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #14: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #15: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #16: vswing: 0x00000000, pre-cursor: 0x00000000, post-cursor: 0x00000000
        Vswing Table #6 (C10: UNUSED; C20: DP 2.X):
                Preset #01: vswing: 0x00000030, pre-cursor: 0x00000000, post-cursor: 0x00000000
                Preset #02: vswing: 0x0000002b, pre-cursor: 0x00000000, post-cursor: 0x00000005
                Preset #03: vswing: 0x00000028, pre-cursor: 0x00000000, post-cursor: 0x00000008
                Preset #04: vswing: 0x00000025, pre-cursor: 0x00000000, post-cursor: 0x0000000b
                Preset #05: vswing: 0x00000021, pre-cursor: 0x00000000, post-cursor: 0x0000000f
                Preset #06: vswing: 0x0000002e, pre-cursor: 0x00000002, post-cursor: 0x00000000
                Preset #07: vswing: 0x0000002a, pre-cursor: 0x00000002, post-cursor: 0x00000004
                Preset #08: vswing: 0x00000026, pre-cursor: 0x00000002, post-cursor: 0x00000008
                Preset #09: vswing: 0x00000023, pre-cursor: 0x00000002, post-cursor: 0x0000000b
                Preset #10: vswing: 0x00000021, pre-cursor: 0x00000002, post-cursor: 0x0000000d
                Preset #11: vswing: 0x0000002c, pre-cursor: 0x00000004, post-cursor: 0x00000000
                Preset #12: vswing: 0x00000028, pre-cursor: 0x00000004, post-cursor: 0x00000004
                Preset #13: vswing: 0x00000025, pre-cursor: 0x00000004, post-cursor: 0x00000007
                Preset #14: vswing: 0x00000021, pre-cursor: 0x00000004, post-cursor: 0x0000000b
                Preset #15: vswing: 0x00000028, pre-cursor: 0x00000008, post-cursor: 0x00000000
                Preset #16: vswing: 0x0000001e, pre-cursor: 0x00000002, post-cursor: 0x00000002

Coincides with default tables for PTL.

BR,
Michał

> 
> Regards,
> Pranay
> 
> > ---
> >  tools/intel_vbt_decode.c | 42
> > ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> > 
> > diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c index
> > 2f3f720573..8d54b113ad 100644
> > --- a/tools/intel_vbt_decode.c
> > +++ b/tools/intel_vbt_decode.c
> > @@ -3474,6 +3474,15 @@ static const char * const vspeo_lt_tables[6] = {
> >  	"DP 2.1",
> >  };
> > 
> > +static const char * const vspeo_cx0_tables[6] = {
> > +	"C10: DP 1.4 RBR/HBR; C20: UNUSED",
> > +	"C10: DP 1.4 HBR2/HBR3; C20: UNUSED",
> > +	"C10: eDP non-HBR3; C20: UNUSED",
> > +	"C10: eDP HBR3; C20: UNUSED",
> > +	"C10: UNUSED; C20: DP 1.4",
> > +	"C10: UNUSED; C20: DP 2.X",
> > +};
> > +
> >  static void dump_lt_vspeo(const struct bdb_vswing_preemph *vspeo,
> >  			  int num_rows)
> >  {
> > @@ -3503,6 +3512,34 @@ static void dump_lt_vspeo(const struct
> > bdb_vswing_preemph *vspeo,
> >  	}
> >  }
> > 
> > +static void dump_cx0_vspeo(const struct bdb_vswing_preemph *vspeo,
> > +			   int num_rows)
> > +{
> > +	const unsigned int *tables = vspeo->tables;
> > +	size_t offset = 0;
> > +
> > +	printf("\tNumber of vswing tables: %d\n", vspeo->num_tables);
> > +	printf("\tNumber of columns: %d\n", vspeo->num_columns);
> > +	printf("\tNumber of rows: %d\n", num_rows);
> > +
> > +	printf("\tPHY type: Cx0\n");
> > +	for (int idx = 0; idx < vspeo->num_tables; idx++) {
> > +		printf("\tVswing Table #%d (%s):\n", idx+1,
> > vspeo_cx0_tables[idx]);
> > +		for (int row = 0; row < num_rows; row++) {
> > +			int vswing = tables[offset];
> > +			int pre_cursor = tables[offset + 1];
> > +			int post_cursor = tables[offset + 2];
> > +
> > +			printf("\t\tPreset #%02d: ", row+1);
> > +			printf("vswing: 0x%08x, ", vswing);
> > +			printf("pre-cursor: 0x%08x, ", pre_cursor);
> > +			printf("post-cursor: 0x%08x\n", post_cursor);
> > +
> > +			offset += vspeo->num_columns;
> > +		}
> > +	}
> > +}
> > +
> >  static int
> >  vswing_preemph_num_rows(int devid)
> >  {
> > @@ -3525,6 +3562,11 @@ static void dump_vswing_preemphasis(struct
> > context *context,
> > 
> >  	if (IS_NOVALAKE_P(devid) || IS_NOVALAKE_S(devid)) {
> >  		dump_lt_vspeo(vspeo, num_rows);
> > +	} else if (IS_PANTHERLAKE(devid) ||
> > +		   IS_BATTLEMAGE(devid) ||
> > +		   IS_LUNARLAKE(devid) ||
> > +		   IS_METEORLAKE(devid)) {
> > +		dump_cx0_vspeo(vspeo, num_rows);
> >  	} else {
> >  		printf("Warning: deparsing VS/PE-O from devid %x not
> > supported\n", devid);
> >  	}
> > --
> > 2.45.2
> 
