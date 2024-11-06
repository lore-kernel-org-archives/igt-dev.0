Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA9D59F55
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 17:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27B910E73F;
	Wed,  6 Nov 2024 17:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWuFyMkE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C256810E744
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 17:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730913111; x=1762449111;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=fpSv3mE83BnRvZFSJDRhgJC807ZTTuKCe4Au6lL9AEw=;
 b=MWuFyMkE4kHTnEC+EebGwnmz1btoWtUHRz4V6x3dWmOGg5R3M9g9MHO3
 JaTA1u7EK/TlnH6bmzQy/dCBKYpSziKjUqIADAU8Q13nkrBDPe3vltXK5
 03IlmhtJEzthRWPz1rJyd9QzpVDLgrYN4nck4MfUDSc7idyyG9dFgliLo
 jkBsFLB3x5VrAJcj5WZvbpE0TYwB8V4/ehe7pLVSQJNAWhgQm3nGogEpb
 aowxlDC24lUobSklNPkvF5nfs/PjdLXh6dGQj/HHlyVRGR4kDyBoUIqDY
 FZZoRsPOoY526lES3mOGJOYeegxAHa18lD7EaGDMQHCbdgk5vLYWImao0 w==;
X-CSE-ConnectionGUID: AY5/oLpDSre3YaUO6c9Hwg==
X-CSE-MsgGUID: que5/Vl7S5GYmMmebe17BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30683686"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30683686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 09:11:51 -0800
X-CSE-ConnectionGUID: +ibU3/FvSYS289AtZJxjTA==
X-CSE-MsgGUID: 197NDviyRXiNR+W13b6N+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="89763613"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 09:11:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 09:11:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 09:11:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 09:11:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9b7kBEy7/L6tkTrvtUfh2Nd6/JpQ1KOvRAjTK6jcwK0I/4W5L9mfZDjGWLwvzYsRaQ8nv5eknnHp9vda4czll/SkfFqEu7V0AlrA7tyA6GPNsozQhcrOJrZzJEkS+N3Ud/+crYKfavF0mWWjl5fGXHbTONxoYxPXJCgO5BPxBU+2OE5XXH7pN7rRR2jz46IrDmlvjHFlRF6XdEucX3icKASh5nQaxX+PmyPd0NVWHj4Ed3LlJpj2y3mVbhGi1tK2TsXHDGnnElDahGLWQCu521B7lAFxsSkhEGgdKVqPrWelg2GsxtZiXTiMCiF8tj6xYyVk+ZjPmdPL95ErMrwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc+YmfU3MPhL8ov7N84rRthLiu3OV8mQENP2mQ52/WI=;
 b=KpVQr6buVfFqkd/te/S1XmwTfDDPrOA9Q5JB5zUhB0rTT0QrrujP2N41PfdHV+UMK3y4w7cRtUbnmmem10WDzO01ofbMH++09mfFO4nwzx4zbL7fSF/HuK8Fxr2pU/D0JT0T97xioIlaSvcoQ7waqgdmVBSg7S5boVvW9Fi31ia6H5vWAsrAQGjHC3/OJIMXVvr6tdKePvtdU5JgmgIkigs0+9s4eazcEn4SR0ELRRUTF0dm4fy8Ge1jVTd1JPZbi2cxi9KU2aS/iNrHFzGiFTgEp07lypMz+q0esXmMTRZVUz9VxrNbF+RLO2G2fr9QyFEenHNrWwOz8HfKbenxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 17:11:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 17:11:47 +0000
Date: Wed, 6 Nov 2024 11:11:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyX?= CI.xeFULL: failure for i915: unload refactors
Message-ID: <tygnjtdnqfjkpw6gldbp6cp363e2kbfpmlbwjg2rbieq5wshnv@xmxfqwmo77g2>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
 <173088595667.1415735.17467512759244110375@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <173088595667.1415735.17467512759244110375@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:303:6a::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: dea51eeb-45e4-4fd8-9ec3-08dcfe861861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MfCA1OJ2bD/qe4Mq2BMbnk3E56T6S5/MEZuG01z0s3RFQ+TmT7ge4zng4+o/?=
 =?us-ascii?Q?I+lLCPHZ6FPB1twGNyo/ryPjL8dDKDt++wd3rj2XG2VNOqSTozQjRHZYHXxY?=
 =?us-ascii?Q?QnjUiJfIHD+wUJHSvpLI9Ir1jIvKcc9rmSY0wxtrGy2YtP9WA8K5ZyUbP4Kc?=
 =?us-ascii?Q?6zZb/o0CDkPd6zRn10D/ZLD/gnfvKnLzl9pnPt99gob5rWMML2zk8rcgt9zq?=
 =?us-ascii?Q?5uqwEIZcIAaLWypTPOrMJho74+3RAIC+F6osSPc6WBt2s0X+IUzHZWiJr3EJ?=
 =?us-ascii?Q?94QAEbjq2u4VttAob0oVRKXR80jpjVJ8sPnuBx/dLmstSrevUzYWekfQRw34?=
 =?us-ascii?Q?p/Lm750umQd2/mOPeUPxru7JCBd2Bweo443qzRXlaAQYrud24qTrOV4Sy7MP?=
 =?us-ascii?Q?yiiokoyKUXyMNiTLyIR1rGhR1nL0ikLbGdj+29iXA06wnD3UfAggOFUWSELA?=
 =?us-ascii?Q?Z5bMSCoZ15NbLr7p+q80syDckf3HI4W80A7SrphbnonNWjGh2fc1f+/wyxaV?=
 =?us-ascii?Q?DAYA4okVO5IbecFWpAkLozQDOKZ6+4XTkCtrckWdMGvdgi4uBt6aLjrwyxVQ?=
 =?us-ascii?Q?ve3PBNcowltGzQCNr5laFbz5F5UvBG0V4I87Td1NDXUd+4ZYJknPxov1OcUt?=
 =?us-ascii?Q?BB2+/UlprXpXqMqkDv2z4w+0P6ouChUaslDIQGTAHzUFb8aejLY6nPEN/o8A?=
 =?us-ascii?Q?66B6eQ0N1txxA/ZxngHv3OPY3HkeNJYOirMxy6IOZdEuqdut2o/6gDA0Tdfe?=
 =?us-ascii?Q?11UEODVNJj5njXuUW0OgWbfhUW4lAG2Dk6s17S8YSrhnUtweqHf7/WAuGYO4?=
 =?us-ascii?Q?JJNr2U+VX2IIwiw+LRN163J2i9f+KQHCS1ibyFd8ZjepA9ZvmsU1uOYhIIJu?=
 =?us-ascii?Q?XvS9tFzyMcSM0FPvA6wLeZh8nC+r5vKZrZ6zlDZdtnkr2x/NJfCbVv51BlIY?=
 =?us-ascii?Q?lclIo2A5+IFMWsChZ+McYC4rnyxkVXKWTLCRQBQ+DomY3yIvD38fU1HLb6xo?=
 =?us-ascii?Q?zg0oT7Se7r/J8+FHleoncRyhvZeJNXOJjeogfarAjM11SryC90dguISPdYxP?=
 =?us-ascii?Q?f4Wc+DkPkmG/0Eb1Q2V49GjUj5TqGNGuEL7RVg3ZDnoU7BT+aecD6LsH3iJE?=
 =?us-ascii?Q?ZhVdsMP2T3wS2S17xei9xxL1YOTQXK3grp+VOoeHBZ01eX7md6iti99ZU9Nj?=
 =?us-ascii?Q?xtxQSE5uzNmjv6tfvn99kF3MQvUtIeJSJNsGj7bxVGd8OVf9gXfrF4zXmkei?=
 =?us-ascii?Q?kCQFHZh873T1EpPcjU0lKhWZQR2PVzq6xZhJdEBxmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rVc8dJHqyLylCJR/nP9d7pkopihIdEJ+EW/SsvXh1Mmt9Yh+c5b0cuPrIynS?=
 =?us-ascii?Q?ALZRrb/tZvH5UcE5TYCAMraxOHcRK7QdYmAeKKcSXyvy+t2KCo0JVwWGCOhL?=
 =?us-ascii?Q?VYoZZrykswERMjgmgNvKINUi7W61D1vz1EIG3Z59lfetdt3Y4iYGhT9NV5SD?=
 =?us-ascii?Q?jXiP87ibFTaDJimIHrFmo+nwG4DQpxljvbGdEC/znMZSwPFcOMfUjklGUe+b?=
 =?us-ascii?Q?xCXTrLKg++mjwei7YVP3Hr6EJeefFgZeBjG7LCue7/YGXuVUHElak7D3CSIr?=
 =?us-ascii?Q?06CGgYF0+TcFw9BEYaHkwRdrypcwBn02mvoCBhyoKfW7frvkOeSURqdmuHhk?=
 =?us-ascii?Q?gWk+bT4WDBrZ67fObvkOriqFpNQjyRqaioA5V1jMWexU1SFX9S3wmKG2cy6k?=
 =?us-ascii?Q?kdX/enl+VBIXAQYnO97r5GT46bo/EZiIde7l5Lu2AJJoSDx/4fj4vZxiEaKY?=
 =?us-ascii?Q?EOg3pnN31fvrcmjvDnnlOCAVvFvk5qPze0A03z3duiZvpwPssZnhKNi+XG+T?=
 =?us-ascii?Q?EHqnG0gUQgS4c6NZJjfLIueb9rukWPC3fBLq49ohW413yQKZffqFPm4nd6iE?=
 =?us-ascii?Q?3m4EO0D4iwG/FpggyA9+xv1zWl8yKyttFKJFo0TMalqJNOKQJTKC06xoXWPH?=
 =?us-ascii?Q?SqmntFOsKAsvb9cly3/L4/vTSsx4VQTtn74U0ueZimCMd9NVbI6I8m2Zeb/6?=
 =?us-ascii?Q?SQxkdR/EzWdEjXo/1d6FWrWTA3NYsa/BiKTH3ptwehcUmnAln5MxrsQQRcO9?=
 =?us-ascii?Q?f38Salgemsw1eyFZh3k/P9MqA3sZ1ruy1cxTCmpnMq/FFDrng1LGNQphrmn+?=
 =?us-ascii?Q?nBDXc0wuh+5NOtIYqz3xBzXcMzCRbTWgC7PQQqhOT/TvREbzBfBVJcD2UVAN?=
 =?us-ascii?Q?d83cBx4MmxJ8JNPdtWvlfpGHeybsQQggBeeqlo5P/isMK9CUeFeTGFOSi9tS?=
 =?us-ascii?Q?65bwsX07hMuWXEmazAamXWTlviCYySbH/6ST2j/2Lchhe/+3mtYFTqeGaiQH?=
 =?us-ascii?Q?v+KDIdzEwvKjm0Np2a66zICkPl3VFkLfmtsetNHjZj9jjAuZjOLf6Tm9Vt2n?=
 =?us-ascii?Q?iuSnr/7qhGuNuep0drwy/NA/eUgl4BAYG9H5915rGlnWo3/bTk46inH4+d5a?=
 =?us-ascii?Q?vA8cY9yXw4cGVBdcakYg3zsgnagL/wHZ7tsId1NqJXdNTtfzFWFLP2+U47q7?=
 =?us-ascii?Q?6cEm8frVElVqtK4Miv2RLVnSvPXyvJdSKiuar98yTGVh/CAoi9M4pcLEa953?=
 =?us-ascii?Q?NsU8gG6rx8ABkhq029tShlU0Fmq9jp3zAeaEcJmI7/DAaKKTPqCddB5qULdQ?=
 =?us-ascii?Q?8+yFWtfopCDetyukAloIlwHPmaWZR36Y76fpLUGI9LTfu2wNZww3SFchQYQ7?=
 =?us-ascii?Q?CJuvhtdn/DGWnEWo8GdtBJBQR9chdJ0BM2cfLqqMu/8BjVVuj4gI0VR7gvNZ?=
 =?us-ascii?Q?76+LGpD4WQkcMSBVI9a5l902HMthUu+pgJosuD8CBNuGjzNgRAyYjALOhXbx?=
 =?us-ascii?Q?JvIrraiLQw+v7jywJeLP1Junrk8jGe7iOgLaTza1jBkmfv8BhwaCFy8aIRs7?=
 =?us-ascii?Q?HB8q/AGzf3+/21Wr0ntggbcVBy1Hph/SHX3B/nzrRs4P0q4E8e67yw2ZJTan?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dea51eeb-45e4-4fd8-9ec3-08dcfe861861
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 17:11:46.9532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6+EOm8t3A9l4yrl1269U4hFPLnh7oQYO9J8DG9MNqql9sen4CcRrAsmCY3+h51mQEvkPWehrr4sg8OBSvWGV1L1Zo/i9hmeT+PrQ3ZfsTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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

On Wed, Nov 06, 2024 at 09:39:16AM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: i915: unload refactors
>URL   : https://patchwork.freedesktop.org/series/140920/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from XEIGT_8097_full -> XEIGTPW_12031_full
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with XEIGTPW_12031_full absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in XEIGTPW_12031_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in XEIGTPW_12031_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1:
>    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8097/shard-lnl-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12031/shard-lnl-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-edp-1.html
>
>  * igt@kms_hdr@brightness-with-hdr:
>    - shard-lnl:          NOTRUN -> [SKIP][3]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12031/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html

unrelated failures - this series changes the behavior when
unloading/unbinding.

Lucas De Marchi
