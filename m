Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B585C369DC
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 16:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983AE10E224;
	Mon, 28 Apr 2025 16:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdvyQfu4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98A010E219
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745859454; x=1777395454;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kSpIyFyawCBRgcW8Pb0BYCMm9QCofsHVVBPnc6wGAig=;
 b=YdvyQfu4/VVUM2FKVoicozYonwVtVIIgHHTBhLlgOUnKin5h5VIdNxyH
 iTaZ1zjoBwnmDiR/IAPdPRcLdBU7ovGIgf7DpBPrHPQ61q3u6xdLTZFPV
 ShLnbHwUzsZhkyj1cFcslYQRbSGzDhgWEkNrhFcR7FpMD0VC2Br1IpJVM
 8wJ8Z+XsG1Ir7jaazP7c2AiqyjT6f5aSJb6OHtFzPbtYr4e/+02Oc1c/a
 7EO6kEhnQrQCKZXjEAVwzBdNwyQIfpXen8a7G3TE4avCH/VPoM71v+CqU
 GQtyM5/efT7LQJTQi9Y2anVHBR9568Ut6D+m0+CdtFr13Z/22/uLTpIQs g==;
X-CSE-ConnectionGUID: sIXD5jfgSjy0jiuJYrO2zA==
X-CSE-MsgGUID: JZBdFaW8RNiqs+FbSLKTxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58110095"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="58110095"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:57:33 -0700
X-CSE-ConnectionGUID: nTKUxnIVTJSZlznnI65aWA==
X-CSE-MsgGUID: MI1OdBzmRiiS6yGQwSs/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="133305773"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:57:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 09:57:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 09:57:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 09:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UunQESYcBkZI3ysDzIcNzjec8VikRMDC+TVRsk3oHNAFzQ0vmzrO998bylHHDzLzCcr3SZQ5U+Q/8rN6eP06pVBll/sli/0gfSwy43KstYE7C/NaZ66eGTSkjAAgN8SQnZHOavpX5w+JDbJyklu5Nu6eUEYK+FFRly8861caPk30mRe0ZhpbjiisF2os5Q06a6ma31DkgsPjCkZEUvXu8XClDAx7UQ52itKQXpsm734CyZDNLfpoCZ4DMRW527O9AQKxekuhQ7NyXoFCwV0J+PyfmaKUl+Ej3iQWhWlT/dxLyIgUdi7aD6Mkm5KL2IK4IDVYVXWoMvifUFqal8HKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGJoPVI5Ow0nLLh5phB+Q4qKawqGtaoPEWbfllxE0Ow=;
 b=GlIsy/B3YpE0LsRdb9SujqWduiai7cfOt9dtIz0lkRm9Gzt4MEZvHyMK2x4V5H9AIBwiXLZaRQQSapDnoigDD0+TK/J2MzK21UGOsbzVy7L3SABlEI9bRVdr6r/EQrjoGm8Xz5nJfI09hjNhd17z2FWMB/OMD+w4tBVg2KNrs5xVgila0+yo80gNKOVdvHj1UaiFNEGjfZDI83VjaH1j7n7+U5eTJG8WAS38Era76NwLD/lw9JsraARNgiWSDih2lM38Nml+8bD/eH/Dht52HnDYTbpZFD6rzvcS2UQiL8gVzUPblGP0o4xYXTIlF2sXk+9ZldPehm6mQTsSbTjbxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 16:57:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:57:30 +0000
Date: Mon, 28 Apr 2025 09:58:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe/xe_ioctl: Fix compilation on 32-bit armhf
Message-ID: <aA+zzMI9VMJ3REJS@lstrano-desk.jf.intel.com>
References: <20250428162122.152829-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428162122.152829-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: f690d0fe-7f81-4ccb-e6f0-08dd8675c332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9P/Ii/HnprU5FIDrDEPczBYUV+/5vFq4pMt4Bgcn3w2b7aqHcJ98TUB4AMNz?=
 =?us-ascii?Q?NjYWBlmAUvpgsI83tagyLcYma1ThTSmsjXwgZCAf/rodCrrtl09JiumUry76?=
 =?us-ascii?Q?yYtufy1s99Iwixw7z+63SGZBJNSgDeGibMr9wWKPVXLHUInWJdk7CJbD7mus?=
 =?us-ascii?Q?irtlaViYnGr1ebVO7tzQsIVpdLywodjgN4UT5mzu9J4EiEtWshozX4SndfBd?=
 =?us-ascii?Q?A5pzNQMILxi2f0kTWdrwtRmDfK7CHaRhJAKeTXt+K8PUSYFKNCWX9IATVX6k?=
 =?us-ascii?Q?raMzH0owK68Op3JuBwFTIslDo2rZ1+SNyhOQmDTK2d3goNCE5d42Ft+tWWsT?=
 =?us-ascii?Q?y3pno1xJjx0l5OFKA9xB3HEaq550RKnRfS5TlmeWbGB6sndfUJfjyRYdPQL9?=
 =?us-ascii?Q?eAfw9jPHf0VHJ9xzfe2cgXNPAZgz+2FUG8zKpJ/c7H8iJAID3WxDHSpJI6OM?=
 =?us-ascii?Q?ESLrMY6i3Ofya0twnTzuNa7HlwmZK9Ov3wMPTzlwWjWVn/qy+0YPKIZ7bj2+?=
 =?us-ascii?Q?yI0nk2LiQdJmxMSjUuWrkaVjijZUtLE2CqjOgCOjsSdokUeqjXU/hitD8TnT?=
 =?us-ascii?Q?dBLVf7a8SfzwTa90hcnUMdyWR6uXK0wGv4Y0dRWgZ8c0xFAMLcO48LKU2+hr?=
 =?us-ascii?Q?wXrTHgq5Oyg2lR4u3KsceVDYnf97Qzz1mnKR8B7Q95HDMvf6Z57lFNl5ab6I?=
 =?us-ascii?Q?bJaSyWIUJRnzS8uGYO78GBFGZcMV34EN880xqDJzTXl7Oy2oKlRgDfclDLqH?=
 =?us-ascii?Q?krg9X+tf5snnMSlE+6PDqiCINhn5s/IhQfy7cuO3YicQNWNCLjPC0+CLXnW0?=
 =?us-ascii?Q?iI8T9vpovHBLoUXlh3LmRCfHWxlMwxGjY2R1e0c/Ll7MoAgSwY67qdFn3750?=
 =?us-ascii?Q?OoTWWlWr8NlJEnrgpQQygBmO+JdntyJMsG97msjYEkAJvxO6Q2HUsCBYJyIx?=
 =?us-ascii?Q?Muc8yUKIdNbEqjBV+MS2tKFedmc3rTArMY9BIkAAQJUpHu1+/uinCwpNmEtc?=
 =?us-ascii?Q?lZORl9fI/4Hv5BBknnzgvQ7stcO0cXVtTBtM0o8EWAaza5JVFV2fh+K7kXnU?=
 =?us-ascii?Q?JLw6Pja+eC2hxx0rSoIKn8DB/3UkQD4u2aB2Cknq1blR9z0b/G1gosSoZYyK?=
 =?us-ascii?Q?Zk70RcNmD28mhqJfHsMFX0h+prQE24NGXmX6J5TsycaSzysBQ/O5+eM9CLZg?=
 =?us-ascii?Q?0a41e0zwuh2wdrjB/HC4MmYdyWsHXF6BRf9M62e7/4JyW3gpKnFvwLc3Cxjh?=
 =?us-ascii?Q?PxV+shbVxLbD8Ohs4PPt3mPfyRoq5wlW/iFKs6fMtO0V2IAJcoKS4uA6jSR8?=
 =?us-ascii?Q?nILSZAYwH66W335p843Wbc6PjRYS36FEPQTescimLFWNNaCvreJ7pHICHMNF?=
 =?us-ascii?Q?S6CbNt56Glb89fhM8MUBURfek0qNhEglJ25X7NER6kd/RynPXdSDJ+A9gmoh?=
 =?us-ascii?Q?bKFH57EE13U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqvopMWwM/+C59iDT0fxo+xY/8nLYqrZFJz2kiVuVPB4tcZUIqTYPMze+OLk?=
 =?us-ascii?Q?IfPv0VRRwkqKxjlXqJaJGxv4iU09TUPKYMdpUcvkj32tNOPygOg7gYFjRqX/?=
 =?us-ascii?Q?i+5Qm70dKA4ko2QCMNJs0wfngO7YeK8PBhnAGyTsqIykXaT/sNTB8gfYEiY5?=
 =?us-ascii?Q?bgj58llPY7EtwuT/1G5oBcVWHY83yNlaolcZq7k3jqNkolkokV0cIp5ryI+u?=
 =?us-ascii?Q?mQeCCKhVFUv0muGZgdeAjzu5NEIznDJ4MmNvVYyovMWk99ZwGDBz3zmAgk32?=
 =?us-ascii?Q?dTMno8MyGtqihBhjfX+fSk845/EmDpXDKjFELiWzUmzRUam7G2NmuiCBK/j9?=
 =?us-ascii?Q?sW0EnXprwFRaTxq/t9uErQWp5OS+iq00D01vDWkhYoTABVg8kArU69RXEnmj?=
 =?us-ascii?Q?cuusEbSNegnBbvD5LvgSPD9qmU6XEpZyHNCs2LzdzhjLz0Kdx3KTjnhUqVf/?=
 =?us-ascii?Q?8D4NHgPOeG9xNZbYI88J/jxXxCgBjZJpIyjMLKsV3Wu/FD024LvTQFoLZcS4?=
 =?us-ascii?Q?YAB3otr5mH0hYYIc/zSY1snqAnxgtqG5TydX/l5eqfxytqJHIbR5ZXn2x2bE?=
 =?us-ascii?Q?w8yaRO7XJq2UZaptb0Rkr6ptaL8+X7RTLJ66Isx1H1UWXUjj9aTucuYz/Tr6?=
 =?us-ascii?Q?kdWQSYm2V/z47H3/ZnZnWoyyzZdiqIDHtw3oKGHUHhJcquyOAkWSOoZOe/yC?=
 =?us-ascii?Q?8fEeT9OZEz5bXVMbVQ3DJe1fs+kLA+MFDpURZHqUHQ+AUbdBh8ZdaV+Amp8I?=
 =?us-ascii?Q?UNY3m6tVgmYOAriWI8vGikDOs6qf7vz3hN0PHkEcaxNkTmUMaGCaXH5lLDqe?=
 =?us-ascii?Q?L2LxMHCvnA9RTMZxYTAJYwlwiu015qCHs2NzWsG+rcFz0yVh5tq4JMbA+yiC?=
 =?us-ascii?Q?Q+1AM1RIZzBqUQW5rXa7ohScSUCrDMUvODwV/u5SOAZFUJiVQL8gMdoLSHip?=
 =?us-ascii?Q?BmbW+OEJr87LTsOTMJH2gFo9u4R3V96skZ6Sa0mWPoeYKIucpRcNw6QacHP7?=
 =?us-ascii?Q?mtVhYF/mK/J9HNoUNJQz787XSykq4wmMte14JcOFKUfl+tjphggCXBM4dN3r?=
 =?us-ascii?Q?gNogfIS4xMKGNxlG15gd89w0frS5OxaYDVb+T0OxA5Err8i/wyIn2PZ8rXBJ?=
 =?us-ascii?Q?u6v7t0N26Gj3trqsHx7w6m79Q7yphTA2sPAr/4kY8xbh7SQd0nP7y+gXHeTo?=
 =?us-ascii?Q?TxsSAwXLqTOqNan4Snk6YVgMhM8VZIdsAmKmfFd3p6CtM3wwNlddSnHhswER?=
 =?us-ascii?Q?m3Y0IG2p/cu3KWX7JzecPY4IIoqB4QzpW1QvFjcHHzg4kTIec5uTSWv1xWZr?=
 =?us-ascii?Q?lFjGbyveJZcLK38DajX9+2Eb6Ert3LwMY+WG44Nsz//1t3YtZ6zkShPkryV6?=
 =?us-ascii?Q?p96TvkHcttr3Un2ELF4PY5ktLfBprYfYEKGWfw22i4l+D8yDvgHDe6gRWB+t?=
 =?us-ascii?Q?wYtBRDi34t1PkdwQVQe6oGMWwatrFNZtQBGjC5uDu28kyh28lnuEZc+mPGzG?=
 =?us-ascii?Q?WzjDt4/WW9pEHq+mnHd1lW8kouS2uCC3qcIWgdx+9l2eupaFf2aZhTWJPbc/?=
 =?us-ascii?Q?jz/PdFjOkRF5n+FJfxr3p20JlKtO3WDnMuZA4xU433qahvjGNZHCE/IYDmHP?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f690d0fe-7f81-4ccb-e6f0-08dd8675c332
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:57:30.2193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbOSzZG6XqdVUYcwlmQXfFaoiv1+wawiUu++0kqCSJ1RWJFzDdsq9UFDla7pMzhUhQjIl0DhM8nY0ocaW4Jmmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

On Mon, Apr 28, 2025 at 06:21:22PM +0200, Kamil Konieczny wrote:
> Fix some compilation eerors on 32-bit platforms like armhf:
> 
> ../lib/xe/xe_ioctl.c:443:7: error: conflicting types for xe_bo_map_fixed void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
>        ^~~~~~~~~~~~~~~
> In file included from ../lib/xe/xe_ioctl.c:46:
> ../lib/xe/xe_ioctl.h:89:7: note: previous declaration of xe_bo_map_fixed was here
>  void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
>        ^~~~~~~~~~~~~~~
> ../lib/xe/xe_ioctl.c: In function xe_bo_map_fixed:
> ../lib/xe/xe_ioctl.c:449:13: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
>              ^
> cc1: some warnings being treated as errors
> 
> Fixes: 9eda33fedff7 ("tests/xe: Add system_allocator test")
> Cc: Matthew Brost <matthew.brost@intel.com>

Thanks for the fix:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/xe/xe_ioctl.c | 2 +-
>  lib/xe/xe_ioctl.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 785fc9184..53a53cd0d 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -446,7 +446,7 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
>  	void *map;
>  
>  	mmo = xe_bo_mmap_offset(fd, bo);
> -	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
> +	map = mmap(from_user_pointer(addr), size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
>  	igt_assert(map != MAP_FAILED);
>  
>  	return map;
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 554a33c9c..522094ae2 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -86,7 +86,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
>  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>  void *xe_bo_map(int fd, uint32_t bo, size_t size);
> -void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
> +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr);
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
>  int __xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec(int fd, struct drm_xe_exec *exec);
> -- 
> 2.49.0
> 
