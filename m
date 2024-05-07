Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A823C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 12:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF0710F51F;
	Tue,  7 May 2024 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxjHvO5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A044210F160
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715085738; x=1746621738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yey9rA7XyZI8bWKBrN3U3qNy5yDzyCUrUQE/iLDIPR8=;
 b=DxjHvO5VH2hUxyIBALWQDyu0DA8HVep7YrfUY6zdMYLbjNbyc0yFdN5V
 NMuPLz3j3a+DlU0vPpxuo0DqO8/wtiiRCwzR6gkoCBHLPIGt5heWHol64
 AfZkr91hTOZEf0RggWu5Kq4hGQzPHCNewD63SyWfswfr2CHp2BkP2GLsj
 6eaQbs4rxGDvQYb/YLHPEOyuc+McE4//l0lFaGp/RHtGtsHQ2UTumXDeY
 eQmY+yaRaUaTdZHoWozWz7+EPJMCT7QZgBpqXVDcK+dXS7BSAcPn9fsLK
 nOSNezjDKMFrMjHTO3Pi3nCK45FLJ0r8A9C5FFUtOhFkx4AD6089YsQZX g==;
X-CSE-ConnectionGUID: unMvNOi2Qt2IZiPDNBbC7Q==
X-CSE-MsgGUID: GLsETu0zT/qTk5TihSyGRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="36258393"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="36258393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:42:16 -0700
X-CSE-ConnectionGUID: wtko3nnXTpGg6kSnx1CzkQ==
X-CSE-MsgGUID: RNqK3sviSX+qt9b4cUBBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="28589762"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 05:42:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:42:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:42:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 05:42:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 05:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kna0j541Xmu5Uu8I3cRvGTzSCLyS7v9hTUqaF0pjDkmxZmhdLlBX54oTuInFfiD1SdmCFRzjSZXes8o1PUBXtavaKV+UAzr1P8vvt1ypV2CjK3Pl+6jBO7oVTGJYO9mtYuOqG68+RChzoYLuBXHDESonmQWNmtX+9Ws6aQ3P0U7+Izw6r5fF8Vkpl2P3uYALmRwCU+CP061bxwr50gpsOCW7osxIbHhllLglhe8RDRS1ywaarSfY/dArg8AGHAQT9Akh05Euv2hLmLtYWCW80wtjg/T6NRuvtOI1Sq2j2wd0DaAvtZHZgGChGDj6MsURCe3S7kn7QJpjETvASXQuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB7sOo2KC90GXHPc1oNF64g6/YbZ5b2VtkhRU4gPDPA=;
 b=OBfkT8htQIAo6pceHzbLVOyZP4lWXFmCmA8jpXwFGmV2zrS0Z6zIUbplioqd9C7quawDF5b5SWUMiUE1PQVVazfTYInvmv7iioMNhojiXE7+YqbF+JCz6+omje7SqZ8TDWk0Mt4m8vZojyvto2buzRH4dGaQ4FEoyZUH00b/SgB3A4Rq/7N0gQ+H2l3LGBfrbbdqYeTFTj44vcxCdBX8xm78UGv3LREHj75riUFRYcJ9FRCIFw69vBnA8IqrfX6mH8WgAvEKZ7AL7G+g3iReR1ObQtv0VZZgwdp52DjVRZ2j6mmNXOlaQrCW9gsQAsHlIWjUIcCKXKtsqLkmC5bDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Tue, 7 May
 2024 12:42:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:42:13 +0000
Date: Tue, 7 May 2024 08:42:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <janga.rahul.kumar@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <matthew.d.roper@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pm: Add mocs S2-idle/S3/S4
 suspend resume test
Message-ID: <ZjohoMCbkpB7CfVE@intel.com>
References: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
 <20240504130458.2102132-4-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240504130458.2102132-4-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 983d455c-8f1c-4985-c03d-08dc6e931e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RPGzOHZ3++fUZb/EH013L841QSkI8V42vwZNCFfuYNFy4HrI1adxKG36d7EP?=
 =?us-ascii?Q?PWtpD4svtpCTn4BxBKf7E8W4LeyrWYi0uB3cABinuTivyCPkKxSFwt80b2cG?=
 =?us-ascii?Q?0FC6J9o4vyXFP0f2WqcBES3VfoCo6nhEa/bS5ZDHDKpVXSq8m+kBOQmy+l6y?=
 =?us-ascii?Q?o1HAOMx7IvccviT/mgyVIy7WftumG06LvKd/sk+5Af8qUCFRISGeFvdmN5Xh?=
 =?us-ascii?Q?Ora0O/RRDW3H+EfsGT4WMQ9t7ZfGkux9gznlBFCCk8Ay0WhHhpsk/kyMSX3e?=
 =?us-ascii?Q?MUoXx3AAUxVdfjWgB4EfGxucttEWv22b4OmE7BfvhglBvVfpbEOoNh4iHCcm?=
 =?us-ascii?Q?wJvbyW3xQmCsSgmSwT18IYtGK/wn80jX4293MvaNIXYH18fQSkxSonEj2mas?=
 =?us-ascii?Q?Q0Gi3dAP64mJmNPq7qGn1Lri8hxBYiY9B/k3hIxUaLQzHzsuZIATAdU8uDW4?=
 =?us-ascii?Q?U4DglQLNk581uyVz5w66NbkmiQrAmOj0QPyjkgCEAh+cMEdWr8QfpfRhv+Ha?=
 =?us-ascii?Q?HUsgSciJWmKpAuKC1wK4R0PFvbUjYfshiGCCTUOFO9mDqIrEocrqEZ673Fa0?=
 =?us-ascii?Q?9Gl3RnvokKHc0fHVneLCIZbZHWP9w993192wvbJ5U/zvG12P9yVmH+LMlkup?=
 =?us-ascii?Q?e31o9exFfkEWR9uI50ppQVs23WLktSgx5RmwS4XVMK6r1e9A7cG6n5ubofJs?=
 =?us-ascii?Q?9op/ugoheWfQNIa4mzPib6w8R3TbzsnlMNKf3EqogJ9wFPyZRPqlsfkEurlQ?=
 =?us-ascii?Q?mLpRTFhwqi/g+K5ngwNnzKpi4zDigCBdLxoY+XCsgIwSlizbCIXCLNzTdDXv?=
 =?us-ascii?Q?+GcKw1qjf8AD7+wzUzixJjQ78zxpS9DS8fzzGG8+LaHemVbnpg5L2AW4fJK7?=
 =?us-ascii?Q?ySaLQaFeobcav25+VMbq4T/R+uPKzNdygCrtTrsUkrdKLTW2jUm1HMqrpbr3?=
 =?us-ascii?Q?w5t+Cdy/sEPzgMT0bshG4xWT760CKQsP4FGDNmOO5LvBBRGLeoiiQ5+Ebz1Q?=
 =?us-ascii?Q?oGUdC+Hv/fUrS3ZqlbTmz1c8rlAeaLzH5qvUfyxAA85YrdDxMGsVp994xNSp?=
 =?us-ascii?Q?P8uIvq9nMnFiDKIrvzV1u81tU/icF3jOL4qR1uHux3HKriVpI9St0Z80GG4C?=
 =?us-ascii?Q?RLQghOhEUgv0NZQdTw4HV6wEx/jNJZbIGvP8WE2u27WUvhKQmVC02CGKy0kN?=
 =?us-ascii?Q?v0erkdU1fd48hxiydOTnsC/ZbQ7UXeMe5iss8Hsh08UTkPXqU5Y5z78wbZLk?=
 =?us-ascii?Q?oaAEu1o91utHP0ELqlLKX+6UGo6dkQzX7HdojJ60vw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZGr0rWsLLz++Xcx7P7PNxkhIwaWp7f0Myv8nJVqsnInXaLm1XhV2QdU3b4Y?=
 =?us-ascii?Q?lGd2pMfbWIGKaoFAYHz2918UxxfDyDOurxdbnyfM/hKaa/xF+O0dm57a72fL?=
 =?us-ascii?Q?KgAV1tyab/vY2XdJEZJzan3ZsIKC5DwjcPR5vLdHO0BGpz3/i03LGa1HIPz8?=
 =?us-ascii?Q?u9TrfVGtt/+r9LdNCQsbG2UQRGGOb5RPKy2jhN847ky8l+MKAIrEnhbiwKo8?=
 =?us-ascii?Q?MyQicUogMFWeIvDHPF8lCIL5+iqwbPTJomwqSX4+rU7BPiGAvumcuppL0ai0?=
 =?us-ascii?Q?7C3JqmAU9/8YSWFJ1HcfpoMs307HjafdN8L7A7u5FEZxoqBTfKqF0zjEJ1yo?=
 =?us-ascii?Q?s+/rRNSP1VD1bkBAD866a0W2BXXyXsBVwXDPnzG3rRfLqKbSlCVrwwykfqKY?=
 =?us-ascii?Q?h1/66ULEEMCnEBXsff8fvw9yR8kdpcLLlBExSQA9lwKlSo4mcKECvQOMjZuG?=
 =?us-ascii?Q?vrXAHsMMbEW6hKrnAKSMk0Ba5ASIZ1BOPe1VZuKQj7D5AsHuJA0JIgKXwV02?=
 =?us-ascii?Q?D54LYwfA7d74oUhkqfCiBTdR2COWrhEDpi1Kjl842RfmHAO7HckjgGX2rY/b?=
 =?us-ascii?Q?Kzf498vsOCEOsX4VgqGtRpbXfISmXmnt2FfHcBOodP4dGo5U3kcKHAq381F2?=
 =?us-ascii?Q?IF0e73LwfEGS1PCwHJuf/IIQAkaZOrsYijcAGMME8rj2ZKBTIFJ3BRvwJxda?=
 =?us-ascii?Q?bVHhjpxgaBNzaWMBtEpgfi8gTMlpouyhQUfwpyQemYPw2WrLtsde4ZfR/+4a?=
 =?us-ascii?Q?kh2FhY2t9lHzudKfYPSQ3k7vaodlOrDASrarIl3MtXUeJcdwRQZ0Dkn8RII0?=
 =?us-ascii?Q?0CrGyA5OqXgK1uEMNrRZQ+lAQ5YE64f2tDVjiiF5iRKuW10H2Q3IADCWbuzE?=
 =?us-ascii?Q?MYm8cEx6AUOQaAaPpH3DtuayoXXMyFyAo9nR0Ik2ZME0+S141SuwmeCz+Yg6?=
 =?us-ascii?Q?o7Gj2ywkSgBRRGDAdYY3iglFswdAprUTZ69/+nEyZ3iE88Tzytf32A+PmZrv?=
 =?us-ascii?Q?y++c9zXFPLVMfSY+Bq0aURErqktgEHmstbMvG2OqDOJ2h5/UlM9m9JyWTgAR?=
 =?us-ascii?Q?spEMvBeSAntljEhjgXfp5L8rWqq31TRKCRDZE+U8cewVxaiZJODa6spGZO7b?=
 =?us-ascii?Q?ZnWCeGzP2Gzu5rjFxOa7qBFGiZaDLgrB9LEPEPi6fh3pCMV3/9VAMFgjm0JR?=
 =?us-ascii?Q?bCRQMWDlmsRK6uwrTZa9JKHtOX1hGX7xQ5R0bpeJZ4DFRpKN6Yn0ZFOedaQf?=
 =?us-ascii?Q?nfVOeaKKMPiG4g7qkr13cgV7QcelfsbhWRXkIbvXAQpFgXqfXYCiGr411sOy?=
 =?us-ascii?Q?cFQkwz+pLWi7evpUarUSIqunVPZim/nEreIsTNh1qaEj2aMvbqXdsdr4X988?=
 =?us-ascii?Q?P8kD7oFFAS7X7HeYJM0N1P5tz20MrMGJLgyNL0GecifGupxVV2+K39XxOUtp?=
 =?us-ascii?Q?ffpAuQ7WLyoWP1yQ40ztOBy9YVShK+IUDIMGeLlYnmf/F3FP4dy8PR8Fo2NJ?=
 =?us-ascii?Q?Ry99ZoAurtl9J0kP0yYWmAlJD+lwAh5fln4wynTtCjRvQO/NWvzaedccNTus?=
 =?us-ascii?Q?MxDn2PYKt+hYYlY4p4JSCkRsj4UQJn48CMgt8od5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 983d455c-8f1c-4985-c03d-08dc6e931e44
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:42:12.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXgKbUF1SNRqCW6vczGR4j3MY9Ca+WI0ujYfrboQEQSEZOCqvEaYogjt2KZ/69Vfga/HxT3kvgZqnd15r6RnsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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

On Sat, May 04, 2024 at 06:34:58PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test to check mocs values are retained over S2-idle/S3/S4
> suspend resume states.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_pm.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 73fd57636..fe77512fb 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -251,6 +251,10 @@ static void close_fw_handle(int sig)
>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>   * Functionality: pm - %arg[1]
>   *
> + * SUBTEST: %s-mocs
> + * Description: test checks for mocs state before and after %arg[1] state
> + * Functionality: pm - %arg[1]
> + *
>   * arg[1]:
>   *
>   * @s2idle:	s2idle
> @@ -617,7 +621,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>   * Functionality: mocs
>   * Run type: FULL
>   */
> -static void test_mocs_suspend_resume(device_t device)
> +static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
>  {
>  	int gt;
>  
> @@ -632,14 +636,17 @@ static void test_mocs_suspend_resume(device_t device)
>  		igt_debugfs_dump(device.fd_xe, path);
>  		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>  
> -		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> -		igt_assert(fw_handle >= 0);
> -		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> -
> -		/* Runtime suspend  */
> -		close(fw_handle);
> -		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +		if (runtime_sr) {
> +			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +			igt_assert(fw_handle >= 0);
> +			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
>  
> +			/* Runtime suspend  */
> +			close(fw_handle);
> +			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +		} else {
> +			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);

please notice that Lucas had recently changed the S4 case in the test_exec function.
We should follow that, or this will break in CI again.

> +		}
>  		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>  		igt_debugfs_dump(device.fd_xe, path);
>  		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
> @@ -742,6 +749,9 @@ igt_main
>  				cleanup_d3(device);
>  			}
>  		}
> +
> +		igt_subtest_f("%s-mocs", s->name)
> +			test_mocs_suspend_resume(device, 0, s->state);
>  	}
>  
>  	for (const struct d_state *d = d_states; d->name; d++) {
> @@ -808,8 +818,7 @@ igt_main
>  		}
>  
>  		igt_subtest("mocs_suspend_resume")
> -			test_mocs_suspend_resume(device);
> -
> +			test_mocs_suspend_resume(device, 1, 0);
>  	}
>  
>  	igt_fixture {
> -- 
> 2.25.1
> 
