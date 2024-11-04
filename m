Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F21ED1BDF3
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 20:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEEE10E0E3;
	Mon,  4 Nov 2024 20:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAau3nlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7672B10E0E3
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 20:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730753509; x=1762289509;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b0A2kTe4PDi8ZNwUJnP/i7Q6mQa+vmn1VmFPlKWa+lc=;
 b=NAau3nlw5sLwA7yiiEO4MlpPMHOtlx8SQnVx51RR5SlIiG4oQHZopltX
 8th3/JZuyjryeBs+/vvCeSbP9djsz0B+MQ5MzZzkvp82TF+RfwOHfxg0C
 VPZMINtnw4ZzNAEzFtwHG44vIBcjwc0coIXJ2OLe8VGA8RulRl2iOwORz
 ot4Vto0mvoXky6hm0UuWFq7ZvczXOL39JNtN0ReELoEoOsoSawHNQJE43
 jun1OM0UH6hHOg8A8/+GtED9WUI9IcYT31VPGOdPFdubq0AV58+p8/Sfl
 bpEe1XvygG3yI4dRZAiiuERU+bfqDEc2TI0kycx3QxLPO5Pyw1PCmCHO9 g==;
X-CSE-ConnectionGUID: PIEBKk49R9iW6ZobaSK/NQ==
X-CSE-MsgGUID: s9RTMHnKRx2j2pFRK8/tWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30323643"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30323643"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:51:48 -0800
X-CSE-ConnectionGUID: Kp1Cq9rwQGuA7ur9IE3ChQ==
X-CSE-MsgGUID: XloIg6JYRh66MPUZh7p2jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="84587485"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 12:51:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 12:51:47 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 12:51:47 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 12:51:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOLj6EVXDjkjXQlbK/6Wmq1fTc1l/QY5wNK29ZkY7VnkwHMq+lUXgxqVEqxv5BN5DLg0oTpnZzgwMOV6G8XyFVYLYwPeNGtb56IUtg4af3Rzs0DydgJL756MVOd4iuFSViP8e961WYOK/rHS/aDEbpbVEHn9ipq4MbThIp//9E2r4JIi2qFKLMXBriwa3hZnPESB+20aFWsFQ8HEZX+Db84jHLY7+K97huheaN0li8sv1oWsal3NCF5YD/9BBxanxUrDwBdfo/+HlxMmxa+Z9E7AgG3ZVJ903JVx4/5Zlvjyk2NU9hpUbBgFcEC3Qd6h+RgW4ASXbMN6Hg8iWSmvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpLi6FWKNzif1yxBXxwzdxNtsjB7TIBsEFjMCCb7+m0=;
 b=iHw7CBzbSgL5vlwMZ+kaKpHaca3y2kag+hP8zcE6fADmgb3M04nli6TiqYsJw8dUFso6T4jjE008yQWx19tUaJfhgg6AoLNl0Y2Jyjdgm6knVE2sWGMzM2qeyZf1l3Sh+gjDd9KXJBb0PcJHieFPiVOWJtN0WGGarYMxugcl1fTW0anff85QBPz7XUWM59TqcDbJGXcv8n4OxqVPX1Cv8CCvXSODg8fWtu9iv171bkYFZHa/fbU22bcvZHn/HMZ3/QyJ6B0nxEEOSz16qVKG11UzqfI52pSgQ8nQpvFbs1z3d3PXGtH0Rfb0eeSLLhDkM7yqqZ+4JNOyFJNpiSoZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 20:51:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 20:51:45 +0000
Date: Mon, 4 Nov 2024 14:51:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Export igt_kmod_unbind()
Message-ID: <uxrmseiyuevm5tillzmfiocvzoy2gfouqoysps7uom6vfrw45s@z7vowathzkcz>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-2-lucas.demarchi@intel.com>
 <Zykfe7D05TPf/wwG@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zykfe7D05TPf/wwG@orsosgc001>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b950876-0fc5-49c9-4c4e-08dcfd127e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CsqEs+K6gwfNKr0XE3fAIf1R+AFvpryWqvkZaUNfR3pmp9sK0ADE1VJlgIiy?=
 =?us-ascii?Q?+6zoa4fKcXa2TDy1T/zznBiQ1TObiYTPZvBGXxW68Yc/nIOUMbStQOUjDChx?=
 =?us-ascii?Q?mZjKjFumlo/Cn7i67rzMGaF4YFrgsH6xp0NCQsxAiAGU+EOdKcpSPqA5XhoT?=
 =?us-ascii?Q?6/JckmHPsLc38cOE4XEbGfNEcBWDnopmjlzvnbvdAp+r76/xy05oNvz8E8RR?=
 =?us-ascii?Q?y+orww93tsSJAx/Lf4f7AUgzkIc9ayyKVt7hQsBaMlFTN+XBgbr2s+LOQi9d?=
 =?us-ascii?Q?+H3tFXe67FJk5IlPGZhtyL08vwH8RomfKVKa48kA9QRXF7kHKMDvxlicAgM9?=
 =?us-ascii?Q?zM6op9uhBpIMHaTe/t3AxrTaM/uXbGGkMCA6P0n5q8G4FDpAa5ZMBSuUCiSC?=
 =?us-ascii?Q?wuXHSG+/Ao1qOJxi81lzneXy4x6YhZBmHGWdiq7a5GCaZCJ6lssWeL7FFgqB?=
 =?us-ascii?Q?1CLnbJH8jySO3Ih1lpKhhD7bF5L2i8fLOfWO1LsmJQBP1aj/qMDUb8xfJsc0?=
 =?us-ascii?Q?vZCq7HybDdI/fxB3xAyiosDy/LlSourDWIt/rEQWjLOc0dMXFJgQh8af8CjH?=
 =?us-ascii?Q?7CtJJYbV2TByxAG9xsGuEeEsWF93lOc3EYASVvn/yzhjitXDo9792yw++Eww?=
 =?us-ascii?Q?m4N/F5nk7+tTjkdDIrLZUY4mC9GB1RiZFc2SFd4EQaXvhIi48F0tzBPVVWWc?=
 =?us-ascii?Q?+FqD3c8J0OHh37e5eD2ypGY6sZ03JNHFvpEQuHRJfD7awRCmFfx2rVw3QVNd?=
 =?us-ascii?Q?A7NWDdOg1zjDaHQxWzLzISirFChiis1/iT90O8dbP2rf2CT+lJYIVWJ6PlXX?=
 =?us-ascii?Q?hkbyzHLn0vOu4yrzPWiGKXiaz0gpGfKJtj+YWTqrrBahddllAW54sVEylDn+?=
 =?us-ascii?Q?1PXSroLGa4+pHh6d17WnFunGXcFHMcaFAMVamRzvCqcFU1dzpHJbtPoMvr9/?=
 =?us-ascii?Q?hOFfOUFVRCPSLrjgRwaEhjADCdoORxCAy4TMK8eoRAPFqOs43B5hMD4xskTV?=
 =?us-ascii?Q?FOfJl3bJUwEBRQuetG7PM1rD1VyU6eg33Wkfx+tdW7dWWt825UkQwmlGkoOv?=
 =?us-ascii?Q?NRgJENd/ZHWSGA19XqJ0tCWrmxVTH76odg4HQ0IgM3/AfDwckWbhR2IvHRZU?=
 =?us-ascii?Q?Qsf33q2zS1yzXdf5ZIRoQUjk5/PIZ0DGJ4kBb8P1ea1y44QC4gsseeXtq9r1?=
 =?us-ascii?Q?Y3bxM6rj/FnuOpOGPGiDsbbmQJRRMtugX+0jeDbmEAyGhZOQB8tW3goTqCeT?=
 =?us-ascii?Q?S2ID1dM4Mci/XN8oyZhien6ZerCfEy6fMRHmBvU46bYSgTewL1s9CxtmZeMd?=
 =?us-ascii?Q?EtC+PLcB7KFdla4lLLZl2Qkb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycilJG99Ky7EDQysbdk18Bdo80KSvJBkBZptSos9w5F5TQUbSTAIU7sVOgw7?=
 =?us-ascii?Q?8wXfXPJ8DMo/jnvagYXXwRnO9Hb+C/jlEA9Kk2iTq+pubHPaGxciMOmlAObm?=
 =?us-ascii?Q?q7inorarchwj9vJYpjQZKFO3MUfkkgs4Z9Fd9RH9gYhL3ukJP6WV+5lB2LYr?=
 =?us-ascii?Q?ZHrzZ2ZELzgaw1hcdscicmALZJr8Y8dgCprANZz4WSErZpsliX0gvvUsGAja?=
 =?us-ascii?Q?CAJ37FXlGaCMoQCK8FRLQZOnRTM12XeM2E94FtfpqE1vSQ9xWLj0XaLYkdNZ?=
 =?us-ascii?Q?70ZOgSoB8LlM+MKbRC/+M59WJFXvLeTjM2XojPEFoMEep6pFDR37n+/ZWGSv?=
 =?us-ascii?Q?Cd2/EgBuj7p3F8zKEHG0BF775VQXAuBkuBukxxn2ouguW2HG+CmOyxBwiNd0?=
 =?us-ascii?Q?IvdRVWBpOKYFWrw999cTMtthikSkZlcEYjq0/93JbxrJtv+ITmXDxyNrBEmh?=
 =?us-ascii?Q?HCHxJ5VVLc31KxyoAyBmf+/FJ//+gZLbd2WopF2rHR8g15hEa1IHOzuAb5sh?=
 =?us-ascii?Q?JgSEqdcuGzxYWsnYoVV8dUkcGrkKb7vZFY/mWewdGB0Gl70/WxhPX27aYqGK?=
 =?us-ascii?Q?scmYXc207yRC9hjgfP7guKdfzv2MS/jGcviWX0YyBAKDV8M8Dq1nM5yInpmN?=
 =?us-ascii?Q?EymkS38+anl52++MBI8wyXYa/uyNO5dzwVrIIeQdeZSR062cGaVVggpNQTcS?=
 =?us-ascii?Q?iBVMMFzBeUyNREBoCrIMo+OboYNk1yyZ6mTM9eTZS21yIu/iP5Kof5J5qRtL?=
 =?us-ascii?Q?VqFj+V/rj2saDd0S4mhNcX2qEL3f+uEsjK6qPv4k7QaU2+mX7fmHy7fQ50Mo?=
 =?us-ascii?Q?jfsVa03dpFMj5PvBeOjEkO20a2Y5SXydHyO7bpvPDLL9vRtCaxc6zcCUJeUz?=
 =?us-ascii?Q?zoiPhCZP1kq351RFIHaj9Iyj0r0x5ylOObmmsxvay2I+ZMIViprISWjCvs1D?=
 =?us-ascii?Q?BWLGYdo+iXeolrWcAeXFW0eXFD5XASGvHFsd55DleJMYZ1q2u/z+K1lmsbxY?=
 =?us-ascii?Q?jYZ+56zoVKbyPtL7ryU1/L7YT4B5K01Qz+fqDe2SxjFeO2i0CMSUSxx6Y8hG?=
 =?us-ascii?Q?sRumnhKRpzh4mHHKvL4oj9UqtahoJU/CiYO/XE0kJhuYw9bzIlRoSwnbQIQz?=
 =?us-ascii?Q?hmMqP7noVnoi6HQG8g3MmaCNt0FzQ81Mxua6m2WQnkAfJonbOk+JykUvQVC2?=
 =?us-ascii?Q?AVDzPtg0c2ece02OYfhcg5hN4uDTWWhm+V3WZnZ8QZ7oOfQ7wAVvUqhZArJV?=
 =?us-ascii?Q?pWEvUekloTLw71M3OOzJCSdrbwHLZqEKu/pAUZxqQhKm5lCZNLNzCJaKVGdc?=
 =?us-ascii?Q?VOISYBvW3F0B2321D4Sy6glGBsxpBJ8McNROpLbC6JTcBx9+nBMkhVFXnIiO?=
 =?us-ascii?Q?MMhQAtgaLP4OSBxUyam1UuxpFIQdRsPjU2FzewoIgABAHYjzcyndGK7c7/E8?=
 =?us-ascii?Q?Oz9AAdx6byQjfVpHdePIZBRaV7dv2xODVkAyi5HG153YcdaLwu/wfdfrqLlu?=
 =?us-ascii?Q?PKsJOcz+gJVTb8toDwfdlr8tBzY1ggdGiqD77NNceiIWk7chBNgfAWFYteET?=
 =?us-ascii?Q?7R02ILXTPF4ncLsRfLciPxsQxdBBdB0PCVjP1OH/n5Cvs3+5A9sETEKfTuNI?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b950876-0fc5-49c9-4c4e-08dcfd127e55
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 20:51:45.1441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Al0sCemDlYVrg0/HlVu6geqS5uiI34t6mzX9XurhD56xfGQkKZPcvPO/MDut0uTDOfVCmlDa1f+WTVJ/ADaFofyOKlbwcn+R/mg9IfPkYoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

On Mon, Nov 04, 2024 at 11:24:43AM -0800, Umesh Nerlige Ramappa wrote:
>On Tue, Oct 22, 2024 at 10:05:01PM -0700, Lucas De Marchi wrote:
>>So it can be used directly by tests and other libs.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Tried it with Peter's patches and seems to work fine. Ran into the 
>CONFIG_PM case, but you have addressed that in another patch, so this 
>is
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

applied this first patch. Second patch will have to wait.

Lucas De Marchi
