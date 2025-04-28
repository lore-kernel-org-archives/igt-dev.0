Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCDAC369DC
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 16:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D57E10E618;
	Mon, 28 Apr 2025 16:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dua3tmRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434A10E618
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 16:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745857631; x=1777393631;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mWyGmAoX07P+CP2E+NDcr8NPLSFU07VF0J9bczoek9o=;
 b=dua3tmRx6Jc63crQv9qkI6Swof4MtAqIZWD99u9XkFZbCSiBIUJv+DGs
 1yMeK52GRjXKKDnOvrmPp58+EOCUGEDISFdrEgYTyHFwXo0aJuDDzdeop
 9l0Kxhdv3rdvLLsnaWTJvVMttvN2W0Ozq3Um5gmHK9eLoSSfbOFVULKR4
 lu03+TRilf77QBMMkgvxe4WizB+VllEz22KsBxfU4Jhcg9eXMzB/N6aJ6
 W2hk48HjchgFNWoj1OHGMuwLnSpfDUYfye8A6bakgYxg4yIetiF1LKDVT
 vUpAzI9O+LgElyjurnkASA3BVDiqgVIb0AhcxnHFHt7nZLGaPfR8d30ay A==;
X-CSE-ConnectionGUID: 0Whr2jo8QxScOQ8L04bQlQ==
X-CSE-MsgGUID: gRrbWf9zSr6OxUMhJJcgow==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47469637"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="47469637"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:27:11 -0700
X-CSE-ConnectionGUID: UiuaALabRvSUjNfk2EvCGQ==
X-CSE-MsgGUID: SZdE0QoTSWKHgT2epvj8EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="134548113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:27:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 09:27:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 09:27:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 09:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpLCl/N9u0P+OcYoMA84KrV6Bokju0ub8Bl9PrjyvAAZNXKMZntUGJuZiuqjjoLuwJkBpjGyjVFluh1hSf78gM69P+IEXixmtbMO2lHprd7Lzits8U0cda2QGC1qCZj2/1OfcgVuP5X1rrOsJlN9vhYsfNvClGyTdRx/8+sYNaeBRlQ5tNegyaL+KuB4xSLNa/1rEUYjCk5G11TVmFHKeLQPdKImROHspa+KHSnbUNQ8Mmi/3gKeS7+rJeh/xsAZG+qoAGbyotVvG2vk8YqtOMxx25M+i0zK3Ot4KWa+7xrueYDdpWet6Oaxv0VGBMvsuDcC6dUhXF1qrdibSgkMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3taeBi43oKLJ6lbKdT3G7V05i43Psvo+gruMeubgeTk=;
 b=dDutSaQ85m0a2WGA4b78Jf6BpnGiY/lQjGh8v3JpOvq39rQuaN6b0AsRih4LGSKJXBmMeKAPV/lkZXwxI8PL0FVq9P2yBybDIZQ7A0jQrCsTisHZdexqWtFbfvaKNNudcwu2wORBgPzEEcuegAXbWNCIZzduO9Ax+q9Bnp5wam1noHHX4Q/3EmiWVX5js85JxcgU/cWIRQCyH0XYfa/l72gtVdywLoQRIqdiPX1Qr0cLEzxKLnGlEgCeZDys2NSIYlhsoHc7S3WOS3+6rBtJWFxI4/bDsXbnx0yLeANTszivZf/VRbSxo8V1CehEL//C2t4fmniAeLv6rZCayVsSjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by LV3PR11MB8556.namprd11.prod.outlook.com (2603:10b6:408:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Mon, 28 Apr
 2025 16:27:08 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:27:07 +0000
Date: Mon, 28 Apr 2025 18:26:57 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe/xe_ioctl: Fix compilation on 32-bit armhf
Message-ID: <aA-sUTROMev9m5zK@fdugast-desk>
References: <20250428162122.152829-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428162122.152829-1-kamil.konieczny@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR0102CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|LV3PR11MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: 92869667-aadc-4189-bbc7-08dd86718454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YGdYbdHcU82G/5uZGEezRFigV/IZJa2+kbOqf2zNZqHxz5GvbqQCOQVsH9at?=
 =?us-ascii?Q?25+3/PKNuFC9a9rxT5YTTJjailZ+ORdtA4uENNFcik0Vyvb8w7xmRkpeE1fq?=
 =?us-ascii?Q?pNKmRcyk8m7ZxWyOqrt4U0s5YuN0hRBuOUW9AURBS9367UCkq3OotzXctMuI?=
 =?us-ascii?Q?zH1A0wNo7TZ+2l8jhfP/BJ96qEfmEJLFGvxkNmcUk+ePA0PSlrQUXgVxV/tA?=
 =?us-ascii?Q?f0HgvTCUkd5oKsZva5wu+n1NRsc+TdqLaEKi76vh8FpXoTFVyEt9G/+8/03f?=
 =?us-ascii?Q?hLFT7buTDrKdh2vaUvzTQCZwFQcSiEkfrAT0UtehYsOHtrpQEF39Pu0kJ3Yn?=
 =?us-ascii?Q?GMWhMpI4M2sctIRUvF8ET5RGFmfv/xZX47c5nAzrze4jiURkXArVHhGTMKxT?=
 =?us-ascii?Q?vSGbojTK2Oi8c3rZPdwVAE5z/nH9mQcBgQNPxgOnHewUtnL/a30BWbyzbFHB?=
 =?us-ascii?Q?9x1XsYQkhImW2I6dDkaCpLRJDN0MEA32ac5Grq74cY/VOJO7GjmNB/4AxP35?=
 =?us-ascii?Q?fQWpCyX2/PgsSHQjMD3CYDRbKpKzbVEXegdZpabBjuda/KNY525Ovot2bUPN?=
 =?us-ascii?Q?/E4Rhpei6fi8Xm2SHVlAmbxEcUJghZseT7hJTnTGwCCo80VBSEURohOZNJEB?=
 =?us-ascii?Q?Mq5ROFnuPm4P7RIpNLtjISfkEfXJcoZQ4LQIemP6WpDCzm1xviFCAJBJ3RN7?=
 =?us-ascii?Q?n0YHROrCi3j++4/4T5wTeQc8LGlP9zjDfPMB6wX+ffnooLYpM/FY18EiZsQV?=
 =?us-ascii?Q?dz/qgX056xlJhoy1POp09/2t5eMLvQfEGgXMLkF36fEKba+B2ffgZC5ZFbZo?=
 =?us-ascii?Q?wcoODTiFCHqzAVo1gT9eiMU2mtA0GLjaZVTL44s/8CenH8wvwtL43AJnP3F8?=
 =?us-ascii?Q?zODZ5RgOyqD4nIxR6LztxwO4gxSlDKXlO5G+0Z6LzlGDdIdPT1n2Y0kiFeWY?=
 =?us-ascii?Q?B3e+5XBjjF944VfRZ2RM7U0ww4m0idpMvP0ilDrwRbYM2fUrx3nOLYpr7mM+?=
 =?us-ascii?Q?zVlJY2ufBMCPkJT+dED5RMTzLykx9xPkrc9qLqD8wjxF93ejYA/3V3VcrSEO?=
 =?us-ascii?Q?eRtbizznKGj0XxFB4AcTvrLCT6Fna0lhT54G+iT/nOP5WmRzz7QlL2JOPYEJ?=
 =?us-ascii?Q?Cad5i6wN9TDrFXz04SD1nwgaKsoqxLrqDpXvth46K8E2+Rrf5PR82lKpEwzA?=
 =?us-ascii?Q?CKZ/AjPoXpVD3nBrctgjhkKqzOGYzC34enfXVz58+NcW1wvCNW1YCNnd234e?=
 =?us-ascii?Q?OQA7nmSfolGK3ZayKaL1BTrMEAmHqGLVnVEeqdP8rE1ZmtOupw8IaKYlQTIM?=
 =?us-ascii?Q?BNYcbrODK1U/+AyV1gKicQOvEIBLyuAa/B76WsXnzppVLtl1meoxyq934Cgl?=
 =?us-ascii?Q?alcQN5rP+FxuoDaVz25G5TYV4kH8qpSRDVQXcT7n843XuIqRExsoCzUKSNBN?=
 =?us-ascii?Q?BZskaGogHvI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/sFG9JePqk/enrfJzfxGPBA1atlMoWZER+m5Bk6ZGRHbj9NphqfML/glfENN?=
 =?us-ascii?Q?OiV52rswPCAP+aaysjyl9H0SdFYR1usCBgp82gfNww3FnQTGC4B6REJ4srcL?=
 =?us-ascii?Q?ZKL7PH2fH+WjSvCPWN++OOkuMbvIlgWjQOJdyKA7EWEk5OeAFWxjs4v0JA5i?=
 =?us-ascii?Q?qAvWHv03UDh80Pq22ENAs/9Egv2MHlr9bQlCWFfHAqS167zN3rXHKfDZPmmr?=
 =?us-ascii?Q?ICrbdl1ISRDYNjNsx5gCW2bJR3C/6Jczc4CBTSDCe4oo/xiLunLIXIrTckeW?=
 =?us-ascii?Q?pGqiwi1KqErMFkD7FjKCUuWSlAGBjEa5dF4pNkpvJ8Cuf7uWiGMKi6KZgRaU?=
 =?us-ascii?Q?3zjO5rYHxcPA49rJRZwpuG7Q1BOZNVgrWVqIyeF0BXz3XccnYOF1naG3lIYp?=
 =?us-ascii?Q?MnNP3JJOanAVrwVgtTgzVHR5kX+oHx9A2F+MDH8MhcuL19OtLC81bV/zQMQE?=
 =?us-ascii?Q?9OntKyHe4WoGAuRKswcusTtLWrU15jCvf2WNSvniMPsuYFyFX8fysIF/p8JW?=
 =?us-ascii?Q?LHfOvOghJz8YMp+eM5rM9UIIsPwgxSWS06fVBICmj7vCZoAB0vSoHHFUO8k5?=
 =?us-ascii?Q?5hdpz1eJxKRaVVnR9nx1g9DEA3zXqopbamV8tKADufs/CU/k2PMMj9GG91x9?=
 =?us-ascii?Q?pV4B2PA6Ezdj8PrzBnWSj7KGMkg62kIKfXstOwq+myjtnfQZTK3UHw9eFsQM?=
 =?us-ascii?Q?qmswwTHpMZj/frEn9Dv6rRLvod0ZsYirTpjyykCM4LHbqUTZ0QYS6g9HBfXe?=
 =?us-ascii?Q?978SOIYG302JMIPtY5em5Ynl68W7iAesDm4lRownFNpbr2IR0sk6vycGNGnt?=
 =?us-ascii?Q?uUhAsc4FnvxwXSyzDzvtlfaL2tmw5gVOg7550Sv5yyOHoNDjWGn7e3031BDI?=
 =?us-ascii?Q?gJN+ipB6uL1Bdo1knchXn17LOfmZs+mPZIJOcdTqRC6MN6IDgWmNXYYBRaHJ?=
 =?us-ascii?Q?84L+3xDI5Ix72Yqme4oI/Cfr3qaloAKDDn2Vncfq6dpstiuLBQzCkZFo2IEy?=
 =?us-ascii?Q?8DLLkYUIJbnXFeQRS4hGZuKNHSH+BITjdfViaKv+tqX+phVzKXQeKCPqIcAt?=
 =?us-ascii?Q?kiisfs+JOaKej5QuvcueDS1WQxQm37tbd+mVEpirNsC9G+f4YPpYDt/aeMqL?=
 =?us-ascii?Q?zcLyoaTO9mFXiCGZSkIN2RwWMluTNM56i/KSvM8TKMPucRyd8HtHXtk893aE?=
 =?us-ascii?Q?aa5uRHGR8EgOexQUaPpVbB89/TURLpbQzEYyvcxXciAGgKSuLn4HZJB2exzP?=
 =?us-ascii?Q?HTnoBqokhI+90rh+NI2bpPby0EjrgQs+j2bUnIN6wmKDcGDqnHt18tfexhCW?=
 =?us-ascii?Q?lO66y7ZZM+vQHkYmHnUfcGOvIvE8VBCxOOCTBiRvFneN6heRFJeTgbYLZJmj?=
 =?us-ascii?Q?j/d0ozy+xR+wdGQXvrS0+3EZN8F6Mtyk8Fdpf5PdPyyylxwqWSdRx8UaV3r7?=
 =?us-ascii?Q?MEMRCha/yLkSEzMXb8pSQAa58DGhCCJwkC3EHLEsP4KyTx/W0HI6bgbKPbG0?=
 =?us-ascii?Q?4GIvJTokf2Wbc7Mm85hBnuGZtKxQeHV3RUHF5oTTDQWM9xN7YeyYLBclx0Bl?=
 =?us-ascii?Q?xEoTl2xOhAFpBuqhESb46CUsJd50X6b0k8KzX3mgTPwd6zmITrwoage+WkXY?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92869667-aadc-4189-bbc7-08dd86718454
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:27:06.9075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jHmKvfccuxhedGKj1fjymVBfJVbMpwQIhMR6pISE8ZubpqXUj5xHFF2IkA0sojAluG6QmWTwGZA3QaY75mdgPLgxsU43gb0FQUv63pHboY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8556
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

Hi,

On Mon, Apr 28, 2025 at 06:21:22PM +0200, Kamil Konieczny wrote:
> Fix some compilation eerors on 32-bit platforms like armhf:

s/eerors/errors/

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
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I recently came across the same error and the same solution for commit 18f9cc22
"lib/intel_compute: Allow the user to override input and output addresses", so:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

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
