Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CED116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 20:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2F110E483;
	Mon,  1 Dec 2025 20:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEK6IfN9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331910E483
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764619694; x=1796155694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xVmix4am+0PCuiLUg1YcynQS3349qS2AYkTr4UCnnJw=;
 b=BEK6IfN98u84NPUsc3iyALC9Gk3fZUim9iHR6hQrvHqx+rlChibFouAf
 h6B7VjefsV3BOlResH+mV5yW7BBL3ql1Oky+FoaftndkVrMx2KQC2xcyo
 hcjyqS9aa8tRKwqWS1kMducZ1+PiJpDEU1edEUHntmV++f1PxulZBqOxj
 Dv0IMJ5bSqs9gJ7pODjtYeEfrYLOOztTGd4N5TxoJov2qkZR9eDcJnFGV
 3tZfM/DRFzfgBzCDnjKLY286dFJEY94KJkysB7qG4xxevfnmwRMBCMU3d
 A2NOkG6KHd5fqce4HWSQBLdGmL6jsU7KeJj/eTZNr0xTbir4J8I2jxvWz A==;
X-CSE-ConnectionGUID: mA5ipdk/Qr2HyqWKx7LlVg==
X-CSE-MsgGUID: hKXb2JiKSQSzp/6DlENBrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66609268"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66609268"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:08:14 -0800
X-CSE-ConnectionGUID: 5GohoesoSj6UmgL0xvP0Ug==
X-CSE-MsgGUID: OTj7nE7TSEev6gSj3OaHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199099034"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:08:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:08:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 12:08:13 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 12:08:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jPMHdJ1XbTPlhHUzbgP7sm1fXKNXT2K7XISGv83ZX2gaZf2l/79pdkVz39S7fqYW/0DTKKJvZkU1cWkIZk/V8iipGgr4y6dkbBSWIMAu4UveS/0DYT9ikrSiQtRwiN3Mz0THfc2TUJSFDAzDOAhUw47ybm451FlzuMtQrQS0um6KdJ2P7EOR/9hO4w3ljGbNUYam1zx9mB1z3ccR02svohCt9AC+Cn2x5h5lum2M7hyP5+KZN8Fzspq6SZcfN1wlHnOyJI75mYqwEnl+CfIDDKPruwkQCSPznLrlnlipSOXsV1iN2x358oYoUTZRXA1L/xgnOC4B+zDbNsPlh/dNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMJZdaL3VnOo1QWUsMAm2RoDEUMoTiBABUJc3xna+PQ=;
 b=itecomNZ2mhpSo5myg278KeJPOcKHQnNJ3c7HE7Ggf84JPqp+FRRoGHw8UDIl0mi2D6u2agjETwvvR/mrVvccg8D+rUijD/SPhFiYNPsl7V/wfhQcLEoXp6N1LBBD62fruiM9aO0Ki/jYvT9cbubV432AF1BaCkgIQKTN408NUOrnsS7pGnntaHNy2jaHztPe5HTCgn6j6FUipIxRrsJ2s9Be7WfL6anIyMMHbNzJkETr+p5FGvomcapTk3kp6pNbNW8wUoEnjhx7GvT54op0r2sholhOrbg7+NBpWjG0/k3dV96IOTt6MFgoK2VKARTo99YLDmd9bCSzc/DTgIbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 20:08:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 20:08:09 +0000
Date: Mon, 1 Dec 2025 12:08:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_queue_property: Sync to latest
 KMD properties
Message-ID: <20251201200807.GH4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251201182114.851967-1-matthew.brost@intel.com>
 <20251201182114.851967-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201182114.851967-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ec43a5-7187-41ea-c624-08de31155927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SzB/7/xRbbbke+OQtNCZ3IN0x8tJ4pbBHOM+6Zd9fIKtwILkkzJygDgW6V63?=
 =?us-ascii?Q?ixOmIr56b1F0M0iBpXKddnZ7lc0LSh5wK07CATuA4ymahnMayZRLQYe5Nr8X?=
 =?us-ascii?Q?NWtd1zuFJ8HAiJzBLcDJM8hN7gRkC9jeUK4tGfPYU3ryCe728Sm++yx3lbAn?=
 =?us-ascii?Q?Y8DdxVyiJ0buWuOYfgHBPrlyZ1KRgw024OQrXoWXY1huBu6yY1qpT6xWj+7z?=
 =?us-ascii?Q?mkJ50f1tKPfDUC5/ACr91Q6wTHakOR+DTMxZkhs8vKjZPh1/eDaMIwCRwgpa?=
 =?us-ascii?Q?M3BkZ8E9Cb5m/nMQgPyTnZlVMoOZW/Asarz8h8AnrpVgQ1U3mJErPE2R1yw4?=
 =?us-ascii?Q?vgVB0SFXx7aR+TfprhDMzjDxBoEFpUxD+32YhpuSf0ZEBSkGWqocMlAqA3qq?=
 =?us-ascii?Q?NnxBoZR9mAqmodnDCw6bACqUnsoOLUkS15QA+L/dBpUri9k8edGkPbPFh0kz?=
 =?us-ascii?Q?NSb8orCQDAmnbZQUolD1Wr9Kb/4LafdcwmCEnLwUuvvgTWJX9fm6SZ9rMLtk?=
 =?us-ascii?Q?pM8xADcSFplsBLDnXlZRQk/05hvCyHtndfLjbnQwi22zRfOG0CxgT1dQaeku?=
 =?us-ascii?Q?QWCb3QWJp/9ZYLjUxMGeSISZOU6CPT/T34MU3C2dT6e5F2zhHF/n3zgBS9o9?=
 =?us-ascii?Q?fWI4xX5BPntD45r0A/fUwugdxq9XOTo2TM/HqRfbJMElGrsDYayf8AkgJQn1?=
 =?us-ascii?Q?jkt9Uwo/3nUyKzDv2aO8hCCrWje199w//yHYAYBjapaUjGppDHi7jDC0oyEm?=
 =?us-ascii?Q?npA8BT5Qj5HKaYN3U6VC0/vyJ6JAG6u7R8H9H12ZBRcMfpjFrwxxy/9wshVp?=
 =?us-ascii?Q?jjwFUcR7V5OjzkFgWees7xvuNSB5a7t53Xs90D0BmlJeU3PrJW6H1iDPWenK?=
 =?us-ascii?Q?2wjMhdenR+PyZHVCdB2VfzqGFJA23zRfUFdEjbNt1uS35FC64tve6zew/wCU?=
 =?us-ascii?Q?IblN6zONIwmEHFXK0maqdCjb9YOCb30OnnnhHsVTIpKOT80G7cx9KYtErbFt?=
 =?us-ascii?Q?pNR6OXOEzjBdnslukyCLCWk2di8l4boMNiINdtNM8BlG4uz46O/s9NUTgVhW?=
 =?us-ascii?Q?79wnM9ac7uANfmChWnkU16Dov4iZl9Pa6kPiJA1L5TzXWE5hDvy85EZpZa54?=
 =?us-ascii?Q?CvDt6Q9uVKbkDcYXdu0Y76tqQ5H+RT1eHEbbYRPj4PYcleUsDzOshJAcOelT?=
 =?us-ascii?Q?ceM7UJfWnIMCWukNLR1LUrTnT35wpFUGX/VORft7MsajkkHs/69067VhXB6a?=
 =?us-ascii?Q?o6A9AA0GTB6f6VlFXqdRC8iqS4NGQP7zompUgWo4Uz4vAyMLsa9i8Eh7IMau?=
 =?us-ascii?Q?X9FLmHYE/b1n2oWTf/dd0MyK8jWWstdrtz2QmD1YuFNmBGadS5OIf4N1B5cn?=
 =?us-ascii?Q?Cf4N2VZkBQkxj7V0J2HxqWyKuXxxhuIBnYy5TYseLfBmBnzhqlNV47SjKjx7?=
 =?us-ascii?Q?E4ShAphx90aQAXdCl6+53jQsBahfzOYn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YjUPdhkcj4Ug8SB5ecg+3lo/xlp9artvWeKwUcl4fKWTywLEdaSEin0H0rP9?=
 =?us-ascii?Q?XbatY3PMLQC/J56HsDO1j2YGSC25caqUslgVgQBke3UQk1K/LMdCreZnVR2G?=
 =?us-ascii?Q?XuLlr6IRcsw+zAJ1gCAJsqnrPoL9T+iztVtuWMfzxv6KaHHsxuYjNQyYwU7U?=
 =?us-ascii?Q?I+7sgAXakPTAgr/PZhYAaXPmBstrxQjmTB4MH/mN/xQe0LIj1r7fsoJ9uVeF?=
 =?us-ascii?Q?LbnYqPVT21TMKUEsIhg2n+jbJlvC83eZYu1H6owe0U/Udg//qeP0z8BbrIQu?=
 =?us-ascii?Q?0Knu8PzZ9qKv9oL5w7K4bep7kBck8YvKdO7n2ioDaqHZA9dftQ564s+e56mp?=
 =?us-ascii?Q?MLakUBz25XHHvlhwQbBi/fXZR/8BbuNuu3PC4IdiVl+IAdex5zF0ej6+ZZXO?=
 =?us-ascii?Q?JW7fEwNZ1imREqvt2LLNlJZ4QnfCqdokLtfutDJ7x5LZXdtT/KdpZ23oOcYv?=
 =?us-ascii?Q?+SyXsb3DDBkzUMR5LQdga+jCYawR6SpsWvHMpUqeBm4MaEYlq5gVqhBJfsqp?=
 =?us-ascii?Q?g0TXBHNcCxcEEUT4i6e9WbClnprXpPDV9+c36MURc9t82ooXYhCmYHVZIh49?=
 =?us-ascii?Q?aRR5Q+np5LvffgqHz0rj1bLhUx+GA+Xcn1LNGVryQGbe7o8AFofsJqrHyQ6R?=
 =?us-ascii?Q?ikwNaAiu/IFUnRcHl2LzH5/K+GAIcYyqPwimWOnSkNVgibHGYess6t55mGXy?=
 =?us-ascii?Q?nFYwRC4VKsVeJkPbkKtNP4jq1PLIz05UzAu4I7IRzh+dRzm56nL66O9rDLFb?=
 =?us-ascii?Q?K/vLsfX1wOUxwpNvcJjqyI23i9t3HRLoezucPEmfXsxNBRNu88vYGVQeiODL?=
 =?us-ascii?Q?ZByMRxwUZ3XBQkDD4oCSvBJpASrE5cA88+rJJHoJqoFqRXP+0jqzaRg1iHyH?=
 =?us-ascii?Q?ZNg2YKWzcbEQvKjxFUlCUjvkknRYLBMdH1zcWRxpzGVX1iImnDK/cr/WZsND?=
 =?us-ascii?Q?TTv44byysAnepzH7sZIaUkLXOQc050C9pIRcEiAD0ny1op+2awDtGdLThIKP?=
 =?us-ascii?Q?tDHLo4lonwzHBlFmn7o77FcR5pQwFUi5yWmCWCwP/K39SxDikRfeDdhn2ZLm?=
 =?us-ascii?Q?uifv/X5/acQ4/aZHaE5ex19fIVkRLSvrSrb4gL3k0AqYTWtk3Z8ypjXv/lIw?=
 =?us-ascii?Q?lM3zAo9SQr35xqRdfuJFLjJrRVQ8YDGx69aYJguC3duYb9jE9Mmfb1qoIh3A?=
 =?us-ascii?Q?2qeXrafbrnqTBsOlaTQaVwKc7h7kIB4qfDRkkVBQmGdHkZSOpZYM9ovS0F+H?=
 =?us-ascii?Q?rjbekLRA7wmc22BYrhxwA8q1U3quH18omag1n8H87fzI+1agG/Nu0n4p/qQ1?=
 =?us-ascii?Q?L+ntMKK21FXhGff68i12Ew5DRS25/0QqwL4bT4nVPLBAxq3/RVfD8d2/aGLF?=
 =?us-ascii?Q?6w0KL66zAmUiRkdGa4Y/kf+FlJReG0vrOXVUOcNCgwb6P6Qp1J6mDElgF8gT?=
 =?us-ascii?Q?EK75SZGAbFzlYwWG6dhoUxYcvJC3C6kWXcT86eaVOBmtNvw97INv2Ddy9mHz?=
 =?us-ascii?Q?7dZIXXWV1bRtAxqf4euoAiMrlv5Y6M9zMi24Cn5hFfTxcL48Se35sh7COYZA?=
 =?us-ascii?Q?jIsIPduK0xWWCIMNgEdbE3RAFwM/1IOZBKjG937j/y1U1bcvbZjOFs2Uxr9o?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ec43a5-7187-41ea-c624-08de31155927
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 20:08:09.4367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyWR0pS9dnh9suK7vdo6GQZCd+/+dw1CoHqlZ3Od2h8Tf2uoYldTNrd1C6aJtay5d5mgqsY9QIyMmYM1oG8huA2Ckwl4PTgnQZs2o0dWBEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

On Mon, Dec 01, 2025 at 10:21:14AM -0800, Matthew Brost wrote:
> DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE was added in b80961a86b40
> ("drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"), update
> invalidate property test to reflect latest KMD exec queue properties.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_queue_property.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
> index 4dfcf09e26..7a2fbdeec8 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -172,6 +172,7 @@ static void basic_get_property(int xe)
>  static void invalid_property(int xe)
>  {
>  	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
> +	uint32_t max_property = DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE;
>  	struct drm_xe_engine_class_instance instance = {
>  			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
>  	};
> @@ -189,7 +190,7 @@ static void invalid_property(int xe)
>  
>  	/* This will fail as soon as a new property is introduced. It is
>  	 * expected and the test will have to be updated. */
> -	for (int i = 3; i < 16; i++ ) {
> +	for (int i = max_property + 1; i < 16; i++ ) {

Is this loop actually providing us any value?  It seems the main thing
we're trying to check is that the error value for invalid properties
comes back as EINVAL instead of something else, and that setting a valid
property after an invalid one stil works; it doesn't seem like a loop is
really necessary to check either of those things.  Would we lose
anything if we dropped the loop and instead just checked a single
(really high, more future-proof) property ID?


Matt

>  		ext.property = i;
>  		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
>  						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
