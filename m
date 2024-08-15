Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3935C3DA7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 15:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B7D10E43B;
	Thu, 15 Aug 2024 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTnHSunH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46D010E43B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723735272; x=1755271272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rE57c3O56CjDgJt9HrpqbubXJBXUE8A7G26gk+242p8=;
 b=mTnHSunHR/fomBAq8HIKld2PZ1+WQzvr+IVkMB1w1FjJS29H+hQm/YjR
 DM9Bg8bEafJ2wx7hMlicy1IS6jbZndVsZahqm2GMoFslf1Fth3kPZvvTv
 GQsrN48hkqFisQiwooMNtV3BzPEd5qCqQsOt2qEqgiw5BNYY11riO7J3I
 1drMJ2JRIpZTdAMpD6qK2FOUk6nMtjQkrpKsnPWKiIZmqsm6+yafq0vhS
 6CZDxX3AI0v5SuFFQ8uI3sTUyabC2w1Qb/Zw6BowKjjR8M41q8UhdXToZ
 WxxS8aPf21tGhUsnN44SRmxykZyW9F3hs/4hyIu7+MuzR27GWhVo3l8VJ Q==;
X-CSE-ConnectionGUID: i6K9MGAJSwGgyPMpRtghkA==
X-CSE-MsgGUID: slQaIpQxQRiZysMV7JhLmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="39512774"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="39512774"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 08:21:11 -0700
X-CSE-ConnectionGUID: sJ2HkpufQSKuP00XLpt/IA==
X-CSE-MsgGUID: UtpoVIINT3GYLAmX01rXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59410923"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 08:21:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 08:21:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 08:21:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 08:21:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 08:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRFCgGEBL/Swx/CELzmw+z5XNbErkEXPH3tNFjnDBJavCRfjEi3UhwY4DUIg++q1vNLfyP9nXsuoA5AzgH5GCMJjOqg/fPWlct7IQpXgAUZlzwicthIdzYFO3dmbk6W/ElxrPCnX42GXIrtV74lbG7zCY0WNvCn6MPS10CnqzlLs6mKbzqdFXp+FK0CeCKp2XRP5c9+97Wa3jeWj1YwdUfiNFGu9mwkaEHHHN+/h5M8uTuieF3PNsa30c80AsaHmKqNJDG66aQO8o7I1sv1xzcNO0D4uh95bSS6QUpa2gMDesVBiYA40rEuUkio8pK2u3ZtDYQ7LcW6OAwdWk/GR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPsD6/Q+BCoXRrBwzchdTwdaX5ArMyrjBoCRKnR0028=;
 b=drHlODzEWLakIBWMQS7dJpb7mMpyhmlPV9ESAi4bXGGktR5MwnYMqf1F5ZITU9aYVivPKCdUPlUalbF7+qoH6HgRwEVSDX1RzIwtDvHD0JxHfmSmClHW6f1ESJ4sHqpThL/dtFr7FiaN/6rkoJ3kQAvKiKT0Ih4Vnh0bPIAB+nLALB5OaaoCti0Ttq2IOs2K4hCseCVA5JuwW9R+QJHM6KZun6iAdlq+ELOj4ClAwRM62DKvaTGOoL3HA/VKxmfTWoBbQxaAGdttx3UJQChRSpND14xM2Z6oskC/x8/A0ThiYOpCvQycItS7S4CzzsD9ZQyUYBzAZYOTe3ZO77DIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 15:20:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 15:20:59 +0000
Date: Thu, 15 Aug 2024 10:20:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Unload/Reload the mei Modules Before
 Unloading/Reloading the i915/xe Driver
Message-ID: <hg3qro3dxili6n3dggarg75abttxeuzsqkibzviogpdvmylq4u@qan2mer3fh3l>
References: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cad498-534a-4af0-0fba-08dcbd3ddd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OsS0oQzpdFoQZfUMn4yxAwojjRi9Z0ZLmMdTu3gsKy859w9Tt1FqQUc8RpsV?=
 =?us-ascii?Q?xvdhhpYYMhliVzWUxyrJcHMDhKJ+egpHDxKDJt5DYY2MXd7kRgkX4uNeo7fo?=
 =?us-ascii?Q?BxjNYsLxUKSsuCKFZKEG0XRTgi/3feObIeLz8maOnI7mkJsMKHDwOgB+jWSc?=
 =?us-ascii?Q?aKZKcgdPjfvvU0B/l5GNrHjz6iIPbyMmNu/EzOGT/FM4OuKBFrBxDEaDOxkO?=
 =?us-ascii?Q?ENdceZdqKbk0cLtjYyZeZPlcIc4korIeRfvnu/UrEyRm6T+ZkBWE35ZEG/l/?=
 =?us-ascii?Q?9woY8CueDcg5WEDeqdhB/v3xT9bxRjBj3KYRucyXVM1yY/AVKdUEdMuVr7kC?=
 =?us-ascii?Q?LVcABEd1s+1V2Mmd2KmEyJQajctqNSu1Z9Jji4yFJt2EY0M4C/CnN0PZvRg2?=
 =?us-ascii?Q?WSoDnC/FKXZH20n99T73uhBB0HqzcDkOzmy8WiEktftNdlNifMNj6AeoFPJt?=
 =?us-ascii?Q?5okZNGxgo+ovJnItOCHB5rjQrobOfrlVk4YQ8AnPoFrZuWMduuhBLiGf1OAi?=
 =?us-ascii?Q?+6TPhMnpBhYU3vUz4QjRH0txj4Jc1QowUcjpHK8eOnrQFc4HnZhCZatLIOe5?=
 =?us-ascii?Q?viPN8vYYplM2iGOIew9PDEraymQ8puGjTSf+L3dwqmL4iFzJgtrn31d+/ZB3?=
 =?us-ascii?Q?Iu5j+dRUY9MkiJYheMHvZUAL8RPWcMGcq9uU5aayaJVjioKKk4QlPiRfu4Mo?=
 =?us-ascii?Q?qqr9m/IKuowC55PZRYQeI1Cqn7tEBf7jGnKeEzq4/s6qLZlQCEUIsv6X8ggX?=
 =?us-ascii?Q?TYjiyKJVx9GRd8XFo/cH6G5n0kfearNXF7X3yY1D1zbUuk4K8TJ2irZB3dUz?=
 =?us-ascii?Q?AFNU+17sQW1GUD/G1vmZIePO/J33kGAYuqRdMu4seej3kZ5P1dOePM891qwM?=
 =?us-ascii?Q?cmgSeUuQwH09ya8Ba+c5o10o2vD1BcJX4LOwDTiA+oWXNhhIFyiCAfsBmkS1?=
 =?us-ascii?Q?7S9kzcI63vTovSgZAtxpR/wKyPvjOdjx8omSlnUH07xJg4qENOREmK0joHSf?=
 =?us-ascii?Q?6lJyN0o0uug/XZAYHPJLdCswwUk/FFYvu8S9GpoKEguiga/WQqW5gssl+fYG?=
 =?us-ascii?Q?7FHjYaW5Y6bVzcce0bOE5g/wcDfoBxDB2XYUKgZ7UIffn630ASXQzBqQifn4?=
 =?us-ascii?Q?x+gMy4EhVuk4nHqrEOtiWPxsHDwp+r5yCGHgPo4SOKjdVEzFgKiHM71z/QmT?=
 =?us-ascii?Q?OXMG7VP+MLchJCEGAA43vh4nYjCWgy7PCy6H14KW+jQbLM/1ZtwfgZvyG/XT?=
 =?us-ascii?Q?ZemvEzjYTlNsIvdNYCIUe+6vk0JbJJPY+vqI64W11S0a//o2bOeWZqN8nEWc?=
 =?us-ascii?Q?3e0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RFvWfJaUk/Qpl85fT2EUtNcQbopPTsqBuj4JVgvxAYIKV4eig2u3P/aahquG?=
 =?us-ascii?Q?0id7++ngEoUFRyvby2ZGxuanS8hM8PKjbSE+L9mLy+e8EWQXZMOJCJER7Jl0?=
 =?us-ascii?Q?SCtX2EZiyeV9MTjZLbSqJOU5riduCYi6xPM3vBCrF8F52Z0zDJNYLFoKmH8g?=
 =?us-ascii?Q?C7WFn2KO0VlFBgRAKXJ0rwsn43l6nTimQjIdtv9xm8z9B7LB9YG/k2t1QIXy?=
 =?us-ascii?Q?eFZbiIA4b3I2hDyrt6FD0hWDAHbDvJfFKI+sQoZvGjWhQPSbG0kdKtu52U9/?=
 =?us-ascii?Q?COrcu9/I8RyCiBMv7/pe9fR21tYgq5EululEq0N4nGoLatjHw7zgyJSjObG/?=
 =?us-ascii?Q?eTdG6JNBchlJzlqyybz/m1VbZMX7TCz/9fqxKBtGIhmFE0dgwIzr8+7Q+1pj?=
 =?us-ascii?Q?aaRct8oelU3VrDnoeed9kE4uGJSO05k8WhEU4Capcu2HA93ZlVrQpQ/vYpyP?=
 =?us-ascii?Q?sjGeogQfLQALGu1rjoMJN0iWsCNaj8idntdbIVE/fvsCrj1vGPMtTehF45H1?=
 =?us-ascii?Q?tgv2TKpPbTsNVapr8sfozG0lOBjoLcBLFfrMS0IAJmVFrfEIalZ2v6WWf8xc?=
 =?us-ascii?Q?VmR8sWD9E4GEUEEkXBcuFFXFZc/ZguXOHTtSmGkT1Oo7vh0bzJwbo+QIQlRL?=
 =?us-ascii?Q?XDl/pialk0jGHctDj2OR+/g2HCPjvJvU/TzyBxBAxWEHk4YFX6g5R/PiLZfg?=
 =?us-ascii?Q?5ZgiY2rR0xgugh9cpuDMMgObV5F6XsNTHrakFXhpW/QoiZhlRk9MMQ6RZW/7?=
 =?us-ascii?Q?Z1JObIQw2tZX0TLZcstgoxI/Eh2Br1uYNlrT09mRLOQ1Gbi4fakSjI3aL3qt?=
 =?us-ascii?Q?BgP31Twe9v8bJU9Pk6vKkkFawf6K7KnTdMGIyGIFE/g+6o2wke53qEkZVjOX?=
 =?us-ascii?Q?3wyoy30jcSxUBBEgtZlM7tdO1omET9BmguoLhkU75mTv/+FpX9+ZDF6ZxKAT?=
 =?us-ascii?Q?NCdg0sIx+Kiea/42KGWdj8x7rK+BousS2/Y01f4blQtAMEkB9ehqp0yCClil?=
 =?us-ascii?Q?uOAmb+hGsuSxTF9+cK3T/kF2DEQDrXTNq/q/3ZpwVJonxYKxIUZEZT/Qt+5k?=
 =?us-ascii?Q?aqlU//Zs9xbJaUgbu5y9giH8GhVUI6u8UvuH1MTKh7YmhlGOe0VjpohD1KaZ?=
 =?us-ascii?Q?knvyDM2U2Rr1QS7fQOPCMcUrgqojU5FeVhgT8cPuLYcoz3c/5NQhEuRtXJwl?=
 =?us-ascii?Q?Ou01OfcUGH9UVS8ZAtA6oq9ZkEnJ4nlOdgBPFzlZrWkg1yl1BBA5N1N1l+bG?=
 =?us-ascii?Q?XklhaT8WxjNpM6HR8mAHCUQ/JystwuhDFdXCaRqPAJOxucpXgzqBan8976XH?=
 =?us-ascii?Q?M8oLFVBcDx6+r5nxYnOhRO6zWF0ahBc+9krg8qZtlqGVtf6cyYmkrnBQs84w?=
 =?us-ascii?Q?cbDxjIZqhTiOLeJ1CbkYJ1RksWGYu5hv23opIWV3G6mZad2ZLfvnnCMVh9WW?=
 =?us-ascii?Q?zbiJ8h+WpVBsm+jhHK6G3BKPn8RjEen4bqL+gxuUG0ir3teXsFDVqWUYVIh+?=
 =?us-ascii?Q?JgcT0bILFDV/gavb9oTUxQkprxnmhx6cXdNDP8QuRwHUSG0yuyeQwlv6urEl?=
 =?us-ascii?Q?s6kzemceWXmAGmZkgUKWZz7f/wBUXTd3OHSickDhDJjZ7uGjzb9EbN4sW2pN?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cad498-534a-4af0-0fba-08dcbd3ddd8d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:20:58.9828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpyzVJM4KCEq1488o/Zcr6u53p/a6hnIZ7cb4SVwebpz83LSR4gAwnVgpLHPx4oLueWDk+PVHmioxTHv1ShkeXvzlgWiiQs38zjOEqdshFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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

On Thu, Aug 15, 2024 at 06:34:23PM GMT, Bommu Krishnaiah wrote:
>To ensure stability and proper module management, this update introduces
>changes to the handling of MEI modules when loading or unloading
>the Intel i915 or Xe drivers.
>
>Key Changes:
>- Unload Order: The `mei_gsc_proxy` module is now unloaded before `mei_gsc`,
>preventing potential failures during the unloading process.
>- Platform-Specific Handling: On platforms where the MEI hardware is integrated
>with the graphics device (e.g., DG2/BMG), the MEI modules depend on the i915/Xe driver.
>Conversely, on newer platforms like CLS, where MEI hardware is separate,
>this dependency does not exist. This update ensures that MEI modules are
>unloaded/reloaded in the correct order based on platform-specific dependencies.
>
>These changes address the need for a more robust handling of MEI modules across
>different hardware platforms, ensuring that the i915/Xe driver can be
>cleanly unloaded and reloaded without issues.
>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>---
> lib/igt_kmod.c | 38 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 38 insertions(+)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 464c0dcf4..6ee2b7afe 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -480,9 +480,29 @@ igt_intel_driver_load(const char *opts, const char *driver)
> {
> 	int ret;
>
>+	const char *mei[] = {
>+		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
>+		"mei_pxp",
>+		"mei_hdcp",
>+		"mei_gsc_proxy",
>+		"mei_gsc",
>+		NULL,

all this manual approach we have for module unloading should be gone
IMO. Replace that with 1) unbind the driver; 2) unload the module.
There's no need afaict to keep tracking what the module uses.

as for loading, why exactly do we have to do the kernels/depmod
manually?  If we have to do anything manually like that, it means
real users won't have that and we are actually missing the proper
integration. I typed something on the different types of
dependencies (harddep, softdep, weakdep):
https://politreco.com/2024/08/linux-module-dependencies/

Lucas De Marchi

>+	};
>+
> 	if (opts)
> 		igt_info("Reloading %s with %s\n\n", driver, opts);
>
>+	for (const char **m = mei; *m; m++) {
>+		if (igt_kmod_is_loaded(*m))
>+			continue;
>+
>+		ret = igt_kmod_load(*m, NULL);
>+		if (ret) {
>+			igt_debug("Could not load %s\n", *m);
>+			return ret;
>+		}
>+	}
>+
> 	ret = igt_kmod_load(driver, opts);
> 	if (ret) {
> 		igt_debug("Could not load %s\n", driver);
>@@ -620,9 +640,14 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> 	const char *aux[] = {
> 		/* gen5: ips uses symbol_get() so only a soft module dependency */
> 		"intel_ips",
>+		NULL,
>+	};
>+
>+	const char *mei[] = {
> 		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
> 		"mei_pxp",
> 		"mei_hdcp",
>+		"mei_gsc_proxy",
> 		"mei_gsc",
> 		NULL,
> 	};
>@@ -647,6 +672,19 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> 		}
> 	}
>
>+	for (const char **m = mei; *m; m++) {
>+		if (!igt_kmod_is_loaded(*m))
>+			continue;
>+
>+		ret = igt_kmod_unload(*m);
>+		if (ret) {
>+			if (who)
>+				*who = strdup_realloc(*who, *m);
>+
>+			return ret;
>+		}
>+	}
>+
> 	if (igt_kmod_is_loaded(driver)) {
> 		ret = igt_kmod_unload(driver);
> 		if (ret) {
>-- 
>2.25.1
>
