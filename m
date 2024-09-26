Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A01CDE032
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 18:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEA910E089;
	Thu, 26 Sep 2024 18:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvcHdROJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E77110E089
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727376438; x=1758912438;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UIKbaCp+i++ReckWZKrTVoi1eaQrE4S8Tw19I4xthYo=;
 b=kvcHdROJP7w4spxxMGO1Zh5VwLBw/kmyFdNfiKr1n4q9kIhvvB3Z6ZOw
 sNo2mELuKxQa6hXFEpOJ48v7a30zZftO9do5jn4Zc4ykbteixsJ3HOnxs
 5HeFjrLVpF0bs6a0y2G2auGtx36MFcYqQgBJvCCHYZ+UrPJX9ZHbsSgiD
 w9Lu7li+l3nL//9X/xyUGeilB7b5knXUkN3w4mKVzTR7nIM62dkMBnQe0
 ARgTLWr7etRd5ufMjB2cme5F9uIkU3IMp/0B6PiRHFU5YrHXxKfOVmBAK
 Ve/vJHWXyEuHybpBfYVxweh316pVZJp9vaZrn9aXwwS8465I1IWYS+KOR w==;
X-CSE-ConnectionGUID: s5cFTfehTl6z99v+tEUifw==
X-CSE-MsgGUID: fEczG8yfQnW25/DQfnVUPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37859721"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="37859721"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:47:18 -0700
X-CSE-ConnectionGUID: aJZSnPcIR96vEmt1tzIf5Q==
X-CSE-MsgGUID: 9yxCzayoRMqARfX43cVb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72697348"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 11:47:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:47:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 11:47:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 11:47:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 11:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDpESmsiAKgqKs8ixxlnHL+NGb/te7VIsZmfwZN097If5g5kzwrix4LJnq+3rMEpS4AkT8avi+ncD6gL5FrZf9PH4+kde1LL0g5tm/ZXuDtKmZyNvPIyUYg7YGsUlyv4tiKKXaMttvISdR7VJInKUlUzWqY8Sf1UeUW92//XLyYIRn4LDkXW1acKG5uMLDjzcY+6RvTG0wXmWnEQ8uzqHxYBodq6+87n+myWJHYXcBSOM5SsMwWUVMV1KAdnHGk/+/V8ncq0XuST6SkUpAHOV4fHPvbKttHF8HMcaRo4/A/DNSVFI+hKCMLlp0sHW/8oy36mx1q1s4dz/kFlhipKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcL9+2yoe9BqAAX3yIaWRttyNY3z6p/+3Kyva3cY4Rs=;
 b=TeGnCGvtdqxi+qaRvfvLlu8yENkRM9haxGBkBdouT7wC40DWEs1fy/pCpXN3eGN353Sg2VqVP6X+6elPnhru4VHPlNTR5ozlL2tYnD7qML9Hzld68lvURkc9YNWxUbUFMOGXrXVFZShfS4K07sdJLIEvfMaPm8U8Cfu8w1GsZyqRUtkuHDqc81fre76g44pIoDmlvjpvVejVoPFLNSfAI9k0QpzAFe6DaLfkM5vZ/I12LSI8i7kd687Z+KierccojoC/ZWKPtNoVwpnjAz1nGT739lZ/tZ9uEr0kSsExPVR5ix+t1BG5D9V6onqH6oXees87PwQiLcdGIRLYz1olAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.21; Thu, 26 Sep 2024 18:47:09 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Thu, 26 Sep 2024
 18:47:09 +0000
Date: Thu, 26 Sep 2024 14:47:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t,v3 1/2] lib/igt_sysfs: Promote driver rebind function
Message-ID: <ZvWsKlsojLHsKJh2@intel.com>
References: <20240924195754.102650-1-francois.dugast@intel.com>
 <20240924195754.102650-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240924195754.102650-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0314.namprd04.prod.outlook.com
 (2603:10b6:303:82::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e4f1a8-0c69-4f29-69aa-08dcde5ba067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WXeWzjiH3FVdn5BLgvElvltJjQeY7BwUKrGw9gKVSgKhPA6lXjVGvvehznwU?=
 =?us-ascii?Q?OBrmq47VNJckUfQOUVUcbxluMfzzUAvXc7ykKUaXMFHvfuQ4pCmsDOwwcFI2?=
 =?us-ascii?Q?XiMQIYPF4Otfr6AX3ba16wkDgtSdFcayORVhFN7qREbPXhDJAfS62CwF7Jpl?=
 =?us-ascii?Q?Ak4G0yBN/dymEjq85YUkKouzXlhFxkxSAOsphgW7K2qUJJnE81q+1vFWSJSf?=
 =?us-ascii?Q?gymXHIVHSUryqcosxfQKkEYUu+QFV1jCQs8hyn2LSJmmYx/0P2rRp9zBiWz6?=
 =?us-ascii?Q?EyM9iuGPD1paN59Eb5k1TqOXhsa4IOp/RqtnJpqLYg1P+OftGWu31NOvPBNt?=
 =?us-ascii?Q?3MvcOS34e2Eu9tkv1bQ1b6cJG4eQrhSstEHBZaTUXhCZGgSonkdXt8sXhSsA?=
 =?us-ascii?Q?8GUSqyiftt39EkYWBJITl6dbz8UbC9LmA4oG+XNI4nfqWNAjPPvbnESl4ZyT?=
 =?us-ascii?Q?nplZ8KO+G/4I0V4wLcSxgnsgrX8dBLwcS/V4/yeUaMP+kaTG+FbAvSK00o1n?=
 =?us-ascii?Q?OPHCZa7l/DWPLsvjdLRcUIOmBcP1Elcl10OLsqdwv54o9Br/X4B7etsjNuQZ?=
 =?us-ascii?Q?mVwl9s4DwWms8F4aNPATQE8RM699j7FMbqiXU7B63wrhZZEP0rgVoJXoKSPA?=
 =?us-ascii?Q?xrEaExlK36K4rwW7ng2A8IlZ0e0qNjldZJ7RmbzGiyMmthj8ieMbiDrWMqSo?=
 =?us-ascii?Q?v/1PDovmYDb+LwySJLUkhP3K84UnB//qBfoFtR1C9FyjeiDSBUJHzJ4AmqL4?=
 =?us-ascii?Q?kZUowxsHWK2AZxdBgz/sdHXzzERatTPMLE1+XPbf4xPk7YS7a9Zs6/PcoASI?=
 =?us-ascii?Q?OGvUF9MLbSdDwD2DDO1bldD64PKq/JPpUeU9lvV6I/QV3SRQ5yFw9vuTagcA?=
 =?us-ascii?Q?nKv4fTO36uctid934197Vt6J4buVEm+8QwJHc0RrmD3zlh7ALVDMverwjDGY?=
 =?us-ascii?Q?lRlyCtHFaYBmWr3R9ovdBkD/WRYHVKoF83xIYTXNQjUb+rb/Nv1x+gWIbhX7?=
 =?us-ascii?Q?sWUyvr2qqyxHUU/XzSikyVMoDcUOiSqDuG3cDS4/IErbrVIIb7zQucZ3fpd0?=
 =?us-ascii?Q?z4pFB/kEs9rIkIhYkPi8iKvq8DU7oZq/0mop/iMm5VD+heh4nmBy3e22opGn?=
 =?us-ascii?Q?fSl614Me3YnG99r/LdSLdJOvtE5c0syR2bSXJJ53ogh/UKS+SEhYkZWgDBeD?=
 =?us-ascii?Q?YSg3WgN9w1BcEkKgALHbk/IIV+AuR745lGXIuAja0nGc1kKS7iOscRh1AJU9?=
 =?us-ascii?Q?Mt2mZusveDHBeBdVSDW22TGSKoHJrdsuuC5GBZrIA1ZQ6wP5sd9da8AVW2Iw?=
 =?us-ascii?Q?LivKz9SfNQIJw5D19IFHlDA/1bCNmdjvoJ7qe9RiIYGbFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TiP0cBF23w5yJvxyEn+9UQyK6KsUmNRAdJyrFh9TjUJrr09Odh2No3ioIQrk?=
 =?us-ascii?Q?Cfg3MDjhwWAiPsYt4nd/tTDRStpn8wdfvUL3VjoKYFgSOS7EVMRZ3Wja6sma?=
 =?us-ascii?Q?28QWorIH1Nph5uPT8TyZ66uRHL6s382aJZQaEP1/TQW71KG1zitEiCWmlhPS?=
 =?us-ascii?Q?Pu3YnAcXseNR5WBP6TsyxwlID+Foc/4TLounCgP/Wi4LWLXEYm7VAObOk0z3?=
 =?us-ascii?Q?iDNuRYEAgSzaQthYv2FLatNM2X9YFD0e714iVMo/CRRsUjcv0T7jMB97Qj8f?=
 =?us-ascii?Q?kyuIwryUlH0Gsjqe2Fj5MGPGJVkVvzGpDX6cS2nlb1viUieTu0VH9b4MN4Jw?=
 =?us-ascii?Q?VhsIx3du0lvsG8lJaWjgiMaq4U+/4uAop0BJjIAI8a5teH19O8j7fHcSbEIh?=
 =?us-ascii?Q?+UA0N9AkQkWQdT/axrJCG+2SpH4gH0kZRCJX7ij8xaqYAsttb6lR6sz712Hw?=
 =?us-ascii?Q?KSX/S75yraZlZJuxEPO5i3Qo3kqPffl0j2P+3ObF0K7Qw37uS7JRjRjO2Nsw?=
 =?us-ascii?Q?FKOESZH9dzLAV7y7d4w3EqrO/obG6UGt1ceQAnu9gyrn56KYiLUlzgiHF1+X?=
 =?us-ascii?Q?bkJZGKUzyWlCHyMxxjbNcM4b/9CHr8YfXqcr44FxUfCNQ6eQIbJs1kXeWwmf?=
 =?us-ascii?Q?l1PEhCG+FcUH0U6/+wXGCm6C6/g6TNcpTfsLJt4Q3B9yT/IBBNLLjrrF4Zqp?=
 =?us-ascii?Q?fCp/311x7G8kqyRtXiRqMm/HNLAM2wtZRA5xI7LMK6KeuzFdGO6Sy48uPt8W?=
 =?us-ascii?Q?AKuqko6upPn+un3SWTNcZVbqJUrZU9AILzpz2sWwmwnb2Ur3e0T0Ha321lDG?=
 =?us-ascii?Q?HRu7TaQdlo41OorT3HWa8bUVqmj4P6DeW8Ni7xJIfl4s8hQ0wW5dLoZOvVnL?=
 =?us-ascii?Q?B6hSen1i8hkoLuvZGY51zosi3Dmn1r/ib1MUMDZ8xTX1ycZTre7wcfe0ChrW?=
 =?us-ascii?Q?6yflk74cWwYkmUVi0zRNuX8k3VsknK3aF68QMiWtYsLS9CppvzYgN4uGEewc?=
 =?us-ascii?Q?/Gd3UieOMHBmYsmTMmTX3J+Lojm+NF9i+gMayZUOSwUk+0IsHXY+4RAu0S7I?=
 =?us-ascii?Q?1b7gibCZwImRRrHLR57Mg0Sx+IX66pclckUb7Q/HgdPui2+yNBTLmur9ol4k?=
 =?us-ascii?Q?xYxkjgIQlXDhcQhTThRuDT8h2s1zmgPsLSPRCWt2GliNTzlPYQ7c5id+DlOW?=
 =?us-ascii?Q?2wz89drSKw4+xv3dDwHMvWBtqrowFCuDDwNCZ9Gz84lZsdDJ/5eYuD2amLvN?=
 =?us-ascii?Q?qSpVKniSIOuRRWpg5cUNZk4lfIMrzBsdAG1KZ4xz24do5Mk4bhU8AIPczGWq?=
 =?us-ascii?Q?fjlLy2ymXimgG1jmNGXptACRqVHyDKt2culih3kkxQekJIudVpNzg82TQExh?=
 =?us-ascii?Q?9kIMktFnEu/6cmpCoEYIkaG+Mzc76CoXPhFjqW6R4kseFsBSJpQC4aLdAxX+?=
 =?us-ascii?Q?0uOshSaazfzpfTDNJqMMRgzYfA12KrWpgaq6t/0KATo+ejpQ9OK/VVvTCbQX?=
 =?us-ascii?Q?Eg30N+DbvFe/oJ33A8eRMLocKgU59efPjvzHYv106DJ9tgdnpJidoLCfwtiv?=
 =?us-ascii?Q?9Zq4FS22bLuTjSbSEl54PgUew7F7/DQ240wlfpwaSkHlhJmYppsM2G3qOAy6?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e4f1a8-0c69-4f29-69aa-08dcde5ba067
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 18:47:09.8765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2hdT85zjVw4yBCBdHUYMRWOzKwMrxBGgNZukPt4hS/THyZ4l5hzCIl/aEAeMz/PStRVp9S1Bk2HrNviC7fPYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

On Tue, Sep 24, 2024 at 09:54:57PM +0200, Francois Dugast wrote:
> Move the rebind function to the library so that it can be used in other
> tests without code duplication. Also extend it to support simple bind
> and unbind.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/igt_sysfs.c         | 54 +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h         |  9 +++++++
>  tests/intel/xe_wedged.c | 36 ++++-----------------------
>  3 files changed, 68 insertions(+), 31 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index aec0bb53d..f8e634f8f 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1360,3 +1360,57 @@ int xe_sysfs_get_num_tiles(int xe_device)
>  
>  	return num_tiles;
>  }
> +
> +/**
> + * xe_sysfs_driver_do:
> + * @xe_device: fd of the device
> + * @pci_slot: PCI slot of the device
> + * @action: the action to perform through sysfs on the driver
> + *
> + * Use sysfs to perform an action on the driver.
> + *
> + * Returns: fd of the device, which renewed if needed
> + */
> +int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action)
> +{
> +	int sysfs;
> +
> +	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> +	igt_assert(sysfs);
> +
> +	switch(action) {
> +	case XE_SYSFS_DRIVER_BIND:
> +		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> +		close(sysfs);
> +		break;
> +	case XE_SYSFS_DRIVER_TRY_BIND:
> +		igt_sysfs_set(sysfs, "bind", pci_slot);

Perhaps we should avoid the assert here inside and leave it for the
caller so we don't need to duplicate this?

But up to you,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		close(sysfs);
> +		break;
> +	case XE_SYSFS_DRIVER_UNBIND:
> +		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> +		close(sysfs);
> +		break;
> +	case XE_SYSFS_DRIVER_REBIND:
> +		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> +
> +		/*
> +		 * We need to close the client for a proper release, before
> +		 * binding back again.
> +		 */
> +		close(xe_device);
> +
> +		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> +		close(sysfs);
> +
> +		/* Renew the client connection */
> +		xe_device = drm_open_driver(DRIVER_XE);
> +		igt_assert(xe_device);
> +
> +		break;
> +	default:
> +		igt_assert(!"missing");
> +	}
> +
> +	return xe_device;
> +}
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 2a1e3b1bf..0ee253826 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -175,4 +175,13 @@ int xe_sysfs_get_num_tiles(int xe_device);
>  char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
>  int xe_sysfs_engine_open(int xe_device, int gt, int class);
>  
> +enum xe_sysfs_driver_action {
> +	XE_SYSFS_DRIVER_BIND,
> +	XE_SYSFS_DRIVER_TRY_BIND,
> +	XE_SYSFS_DRIVER_UNBIND,
> +	XE_SYSFS_DRIVER_REBIND,
> +};
> +
> +int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action);
> +
>  #endif /* __IGT_SYSFS_H__ */
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index a3f7a697f..ba790aa8d 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -41,34 +41,6 @@ static void force_wedged(int fd)
>  	sleep(1);
>  }
>  
> -static int rebind_xe(int fd)
> -{
> -	char pci_slot[NAME_MAX];
> -	int sysfs;
> -
> -	igt_device_get_pci_slot_name(fd, pci_slot);
> -
> -	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> -	igt_assert(sysfs);
> -
> -        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> -
> -	/*
> -	 * We need to close the client for a proper release, before
> -	 * binding back again.
> -	 */
> -	close(fd);
> -
> -        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> -	close(sysfs);
> -
> -	/* Renew the client connection */
> -	fd = drm_open_driver(DRIVER_XE);
> -	igt_assert(fd);
> -
> -	return fd;
> -}
> -
>  static int simple_ioctl(int fd)
>  {
>  	int ret;
> @@ -231,9 +203,11 @@ igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
> +	char pci_slot[NAME_MAX];
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> +		igt_device_get_pci_slot_name(fd, pci_slot);
>  	}
>  
>  	igt_subtest("basic-wedged") {
> @@ -245,7 +219,7 @@ igt_main
>  
>  		force_wedged(fd);
>  		igt_assert_neq(simple_ioctl(fd), 0);
> -		fd = rebind_xe(fd);
> +		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		xe_for_each_engine(fd, hwe)
>  			simple_exec(fd, hwe);
> @@ -265,7 +239,7 @@ igt_main
>  		 */
>  		sleep(1);
>  		igt_assert_neq(simple_ioctl(fd), 0);
> -		fd = rebind_xe(fd);
> +		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
>  		igt_assert_eq(simple_ioctl(fd), 0);
>  		xe_for_each_engine(fd, hwe)
>  			simple_exec(fd, hwe);
> @@ -289,7 +263,7 @@ igt_main
>  		}
>  
>  		/* Tests might have failed, force a rebind before exiting */
> -		fd = rebind_xe(fd);
> +		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
>  
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.43.0
> 
