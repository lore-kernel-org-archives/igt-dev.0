Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6195C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 23:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A02A10E48E;
	Mon, 29 Jul 2024 23:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFYCGTPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA0810E47B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 23:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722295450; x=1753831450;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Z1qMuFoGI9O1fgfWUN18qTLqf52xBplXtvcn1TAnkNs=;
 b=VFYCGTPR1JfyrOpLVtDGdSjIJQfyaAf/8VLWTzlcVraN/Q7a249/UkQN
 yO23pZ8vp+5RqpxwGlp4U/KAUBD23e4SGdRKCTbolMDv2p3c3vm/o3RnL
 K764AuaNlm5wNIW0V7Oamvaw5YiQyI7rhru3p1Dssxg+rSdZL0JUN6TyI
 TdaIhfjzym2VxG6y10vfZxajsvtVrbsoFNwARONOqZJuCcGSnAuGEt7cv
 gNxzzoiMBGdljekMgZO1N7fzcygIzBFhG8kwz1IgNpAIpcOk7N6VAaYsd
 pId6/+JtHAHrMXS35tomhf4dFseu/cRZmmVBsSvlNnCll/f82USFA0aSX A==;
X-CSE-ConnectionGUID: WmbGaRdHSQibMkKwJU99vQ==
X-CSE-MsgGUID: 8vJ1Sn3ORmmftArvLklkrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20265674"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="20265674"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 16:24:09 -0700
X-CSE-ConnectionGUID: kWusKn7dRnm0sngUN5DDZw==
X-CSE-MsgGUID: +ZnzeUYURke7EiUb7HSjoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; d="scan'208";a="58925081"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 16:24:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 16:24:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 16:24:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 16:24:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 16:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d40LKL3J3vyKMc+aGdrjrmGDWgwzOV3NtQLG4fBJV22Y4TKo0UCfa0PLrqI3Rnd52gUI1inHBY4fyH6YQQz2EfzjmypBnrOSCnGjaambJsCX+qCu1v81ou9yZlQsAX3emttVcELvxzaqNS9GnC19emLapJGnwfXMpXS5czc0AOO9r00Clt5IMmL6GU1Nuo9zzujMNXVXunKUJgffH8tUqqpx8flgOsHzxWj8bgFpkNqsGmZI7PgVPZBgSfdoCw2nql5gXDRT9MwdljCBVx3Mrd3qqAcRs+GJrjvNRxx6golCU9/y6dGzCZUPWl+BwENkluVDLidjJjKu7v4prBaHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhzcREEB/3SkNXLhtvgbXlol7gfC9iczsCV2+rtpDJo=;
 b=EK2BnfkW+Z51ZYBlbMwcWfiIGqcly3OR6+dbBGwCqFeN8GgoQkLmjXnS0HCPE0/A5POFiq8Kh59kIB0MuJclHEgipcWFLRvz9usLCM+9QfEnbilU7fRjp1czMDRQdolRNCDqjlvxr2MG+FzV7nnUd30nB7lhKXak9dCdCJYPZJ9GwFlTwBpCHRzkRXUX5iOv2kN88r2NYGnQVd6TNaabeDddXrURXDKwfFFypN4jqXehktRzIT9qHnU6bKXvcFZnURJwegzMEKLciDczR0Iktid8y+22DtfDD4L8WGH4Zy7aYrh7Ug9u2L92skc0JTRgS5WSiBeObxwzSnvSBOUvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 23:24:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 23:24:05 +0000
Date: Mon, 29 Jul 2024 16:24:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_series_startin?= =?utf-8?Q?g?= with [i-g-t,1/2] lib: Add u32
 variants of igt_assert_{lt,lte}
Message-ID: <20240729232401.GC2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240729220251.3353533-1-matthew.d.roper@intel.com>
 <172229480377.426254.9461568099745536424@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172229480377.426254.9461568099745536424@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR04CA0034.namprd04.prod.outlook.com
 (2603:10b6:a03:40::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca15594-9522-404a-20cd-08dcb02589d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mgGktdS3SHxfbE2lRFVENBt6o3LaKArZUc0aB0JOt3n3VxaBqQWF2tQW02I9?=
 =?us-ascii?Q?kmPhdPf/ypFJ1kxpQSmba1jjAv7Nx0M/0WrZpbIU/QwrcDCL6VO8z/m7DGuU?=
 =?us-ascii?Q?z9lgziX7645AYKikuBeQZq0Jg7B2g/kWURMcoZcr945e1xBFXhtZUPSIDdWl?=
 =?us-ascii?Q?JSeV/P+dREg2nYiwhY3I/xW9tuYWGX151kAv8uU4xECuGjNhEgc0b97fk7k5?=
 =?us-ascii?Q?Rw3dourzH+hrShvZZ4opIu8yJ+lEbd5e3j0Cz05GhkNw0zrcXvvaQh+nox+C?=
 =?us-ascii?Q?ad6w1f8aiLVjjdicQAilfbHeEx1NRskcAFG/HUqmPFC7JuF2BBJUkVzu2dDi?=
 =?us-ascii?Q?l5g7Rep8sOmMfywPMkuF0sIIl3xRMiOE7XYy+RxckEJ5b0311SNwZbPU0yaM?=
 =?us-ascii?Q?YxCfb50sF2AVqLA/fGDHgBmZPimvjPuQRITeQ0halCWY/sWD5GMCgCB9jp5N?=
 =?us-ascii?Q?lv3HFitc6FW6m8sFzAK7L+o/k9wsmYf7CpcXhV8FlXDXLhCmsfxP9g1qmZSO?=
 =?us-ascii?Q?073armsp2lIiaQkEmVeve1HYl/BfAg1gM2HWvugCpl1Uto85MZzYxhPI6b6O?=
 =?us-ascii?Q?gHqOxCBNE3fZrjt6SCrTlIEEfa3gjGMXJ1ZK2aVdKPxUjSe2Srr46G2pharv?=
 =?us-ascii?Q?DS7+jXOKfk/K4s9BKvoUg6LdXtWnFGvH8qEI1465IzLO3z4PGwEf1j0Rdbd4?=
 =?us-ascii?Q?cnSj+4wLu82vLcDc8fhpKFXEBSaPKxSAAZzrzW15+NmxWxsERSSRw/GNCzzt?=
 =?us-ascii?Q?qzflhUiCAPtH5Om4Mp98Egul4z2wb0V1U/xlStb87+ltPTLOoU+aq/ehhEo5?=
 =?us-ascii?Q?epxDnIYqasI/9dM8UbNZKjBDOw0r2Aki2dqYMAx5jqdR+hQxw4Gio7/n/LLn?=
 =?us-ascii?Q?ETgqLon5lw5bq/JjqlVsga0NLfWe0BH/C28HLH7rTAflo4K9lPkpqNBr6X7X?=
 =?us-ascii?Q?cjIy0IaYgFQmpnF9wqQoakMlqCX5Zcxg3U+cFhDthjcBWAj3zcN87GFT0h6s?=
 =?us-ascii?Q?O1P5Hd5TuovUmxaS1lfKXUwuy9E4/zCERIsZqDJKkWx+1DPDdesTzLY19Jh/?=
 =?us-ascii?Q?DM8lSqUv1oBHTKM4E5i53yAL+lh0KZthcUCx+FbGS3UFFldFkHW+FmZCcMRl?=
 =?us-ascii?Q?8LqhAz0IkSbGF/QIeMNWlrCyxOhwEgco3xhWzp9IuuAblnF+gpPNOR384N49?=
 =?us-ascii?Q?pLWv22IFrkV0X1qbUuVqkxkoG6qqmszDhwUzkFIt0WsdVtcBBDlILu+sKGVV?=
 =?us-ascii?Q?H3TrtW7J/DbfhYt+C7CtZpoWnUA9/Y/Txney/CkHdyjO4IaTC0PEzRraze0Z?=
 =?us-ascii?Q?gUU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zs+vwQseZZHOz1K56sImLD7jF2G1w+2PjjwW40uraRvOybqZhDIywjA3Pq/U?=
 =?us-ascii?Q?Jqy3K+XR1xNV9LVB+f0w3hFbVldbBio6w+FMLr8Khw7/cj4Rn4O6cNqeIiEe?=
 =?us-ascii?Q?0Iw1iudYCzm2j0nUbGz13aZboZCxWpJc8lCLW1SHL/1JFb7YlwhTwWZ81Rr3?=
 =?us-ascii?Q?N9sz/fMsAoLIrMrEtGS82UbAEogrMPVJ/EgcI+a7y3D56K82FpHAUwvimzNf?=
 =?us-ascii?Q?3hoMmPputRj5Al3gMuo1MIE+VJg9kMXnu9kwMp2AzE99xFyXRiH8c66OwCqU?=
 =?us-ascii?Q?/4STn+6ltfH3inHB+BlDe+y35HHG9kKC4ROz3blpuEU6IO1ZxrIVL8ts3Z4Z?=
 =?us-ascii?Q?Bl4iZORaeT5709s2sLLlseG3PkaUFmKwGLlD5jfWfOJz/tKdQ+4KW44aLuRJ?=
 =?us-ascii?Q?tASWRo3EgqxMYgLmWo9mNvbtMNz5s+LYAv924ifuDO9O28XPbt1r3nN+/lHx?=
 =?us-ascii?Q?VBQwkhpGYuwpi75kWktc9Csn4SklHj+EM0iNGq9y7v0ftXumOg6QVQqzBD9A?=
 =?us-ascii?Q?KKE6H1RmMTnCMWpfhHwtl6ScarB/Kk8KhNbThL7kjDzzLy4Cz4TqzfhQBzvs?=
 =?us-ascii?Q?pXsgeIs84rj6SaBY409zXKGaTA1Mg25kgMagl55BVTPLFAI/iZvA1JKmx6UJ?=
 =?us-ascii?Q?JquTFFQOZMaU7uEr5Z0gNr37QgCh9napAU0uVla029c6h6kvktX9ernQDqQH?=
 =?us-ascii?Q?+fll7X/Uv3nGOusScbzT9e+l4WV2ml0UgY+KCivO1vcX8OGhf2ExvwSGsAAJ?=
 =?us-ascii?Q?x1Ar1qFuOJa7z75zuwMyr8XSxXQALcNMgVfU3CuTM6AzjKbOUxbfFuL9vBFG?=
 =?us-ascii?Q?U9jvobwME1vbJf+fstiB1Or0ytb2KLcf/1X6AhkGRCRcKcWnTR72KH07y1jv?=
 =?us-ascii?Q?E+/8Fz6rhoi15AgnoCvFUrU/Pvct0onACxP8W39unPtRbIAU70VGf3YU1JjC?=
 =?us-ascii?Q?gwyAmABVXcmoCENPP8l5fdkPgBtFVYUfLBrT6FGZ9KbBjmhas6GxoF8cqZWI?=
 =?us-ascii?Q?yrAErrrRaMQMd3mZf0sf5hYEVVh7zJxc0RU08qwJELVtNSldrDuMqvXRHwB4?=
 =?us-ascii?Q?OUZip8t9vzakoONpgBRAV9HT9vVQBsGxF34YONKCkifdgnDM745Ui1h3VQGh?=
 =?us-ascii?Q?GPd1V1rG+i3trqtn9K9S1YNAkP6ZjsehJPBThaoHHACcVd93oy6ZdNjkZHNe?=
 =?us-ascii?Q?rf6vcO5R/Pmx0QPmcjbBLDik5ycj7ynNcsIX492WD6LpFQcdW88I4t/9gi9H?=
 =?us-ascii?Q?hmlh/IWXBmyYZfts/mDcY20NRNpfd4kG9rrj3ervrFm8EmQg0AWjHhaSkNjN?=
 =?us-ascii?Q?yVVykqKd0oILNqWNGCSRjG6j5E/PtBqMNBgImJLF7ZTq1cXvY8HtBL1tOZWI?=
 =?us-ascii?Q?FR+e40GMhvofzRo3OnncdxMJmj9qExZrqP+p24zV8N6B8viqA8G7JJm40pq5?=
 =?us-ascii?Q?tilgyLk9wfUN/Yj0YRneot9xoM9ju9KYA0jl2Vxuq9Veauh2QbtUys4hjfsc?=
 =?us-ascii?Q?BjKkLGoQYy2aI78wUNTYtsR/saBTwvbkqf5pOaTgcFzYs80aYMTIjpz0n7hz?=
 =?us-ascii?Q?JiRVcvDSyEi7+HmfC/o7BiTYzTVPF+0hRQXeuE2eqKRj33u1qE9foWtuZ56t?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca15594-9522-404a-20cd-08dcb02589d6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 23:24:05.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEBNRxJ3eccd0h2568ymtQgSs1odFXRjl3dtq2Z97j+0mtGguH37B4Uj37WH3DAKDcfVA5W0rkVk5yEu1LTTve9w5x8T7HIjMFo+r38lqeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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

On Mon, Jul 29, 2024 at 11:13:23PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] lib: Add u32 variants of igt_assert_{lt,lte}
> URL   : https://patchwork.freedesktop.org/series/136636/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15151 -> IGTPW_11488
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11488 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11488, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11488/index.html
> 
> Participating hosts (41 -> 37)
> ------------------------------
> 
>   Additional (1): fi-tgl-1115g4 
>   Missing    (5): bat-arlh-3 fi-bsw-n3050 fi-snb-2520m bat-dg2-11 bat-mtlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11488:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - fi-tgl-1115g4:      NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11488/fi-tgl-1115g4/igt@runner@aborted.html

"WARNING: possible circular locking dependency detected"

while the system is loading.  Not caused by the graphics driver, and not
caused by the IGT changes here.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11488 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-dg2-14:         [PASS][2] -> [ABORT][3] ([i915#9500])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-dg2-14/igt@i915_selftest@live@hangcheck.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11488/bat-dg2-14/igt@i915_selftest@live@hangcheck.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-twl-2:          [INCOMPLETE][4] ([i915#9413]) -> [PASS][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15151/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11488/bat-twl-2/igt@i915_selftest@live@gt_lrc.html
> 
>   
>   [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
>   [i915#9500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9500
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7942 -> IGTPW_11488
> 
>   CI-20190529: 20190529
>   CI_DRM_15151: b6f9528c7fffc2f65c8e4969d35d9346fd503c9b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11488: 11488
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11488/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
