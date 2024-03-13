Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A190C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 04:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D575910E0FD;
	Wed, 13 Mar 2024 04:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLO1pqR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E1410E0FD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 04:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710302643; x=1741838643;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aZyLXExbxrNlTxe3A5DlgR0v2ABzO2Ou0KVDqTu6qqU=;
 b=CLO1pqR0ewpo3mcN7XtJdRIDaL8B+ASWIQQl6IAaTTnrpy+G+8pXFuYm
 +8W7s5VrX9wGN367XVOcvBcVJcRCODbbiIWLws4OUHU4XLchMMZKx8FiR
 BeBYmIoZzv3pw3QZ5GzhXkr041uGh7cVMDBfX6CYLTmz+7Tll5VbQIqCX
 GHu031vLswvvJhNf1eJXlfcRmntupEeF/HVpyIceYasln35izBiAE9IR8
 g1ZIGamdLL+ZExFRKhIkmjJc0PmrRkBwUtpmHzMFi10BOkWyr/CIPcgwP
 P8S62+QAmM3Coxic3V7JLwsrDelwWG/4KWtkO9Q8/YUgsjTxbkBnNuRbJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="7990542"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7990542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 21:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12192040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 21:04:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 21:04:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 21:04:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 21:04:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvAJZVl3GPVWyqvGSjweiHJSwLeB8KHbEWGFWO1eubBEVLLvz29MOutLwJMb8kxwtvyi2do6hj5Yy2uM4qs0drIMfcLPIfk2m/V70ISBjYjyDgKnclW//wOGFsSWOmtaXgt40caIPNgyjInk5JkPKmuo3Hc38yXF2JjDrizzFd95ezfAV8u1LbWO9XBQU/FFqcM9ugnxH0xCWhpz/dZgwzA8uzuf/8qwgUHxJnhAa0Nz6o0AhxSRXYiJQ3Lra6MpSIf39E7SxmzWTaqYGRM5z5fmRDSKhdwNZTr5D3ghg2ikfIt4p0PuvA4gTXYrAvvBDbl8qEdgcQ3gb6YMlGLBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYUHR8e5eJSn7E3j/9wN17Qg0I2IBMlzmHmpiso+xtc=;
 b=BGamGa6X0+l+umsLTfBCIJxRfxjd1EvFC6n7F7EqgPDVaIlzjPmeZaBxtG6VtHst4VL1QCh9Or3rWyu7xo7+sM/BQhjU+61z7vPRrUmq4QQ6Gjrqj8/MXxThDOvbqujAXdjGQqdXqAZHcCeIuOZl+YUIZjSTYchq81Zv6t+Lbb9uP+aGnvxOayp8xH/veWEloKOYh+HFdwqzW/3qmU16pc/i/YnzqrFpxbLbnRQT8U9EA/WYlR0FMy8cFQWEaqLnnw0JXXuUAorXqn7+WtxiT0i08AdBMqovp3RO8YVBAfXyJ7oFQNEYN+svSaSF3D36ZPH9oP/HF9lMuLTfCMYvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 04:03:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 04:03:57 +0000
Date: Wed, 13 Mar 2024 04:03:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <venkata.ramana.nayana@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_evict: Skip test if smem less than
 lmem
Message-ID: <ZfEldQt9qH1lLuTp@DUT025-TGLU.fm.intel.com>
References: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240312071502.2188325-1-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 36c56497-e4f9-4ae0-e904-08dc43129b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpJNF/RwGPSBSpADkulsGXNBxdMTvDEHDDGqCQ4h7yeZNmo035WTd6Yuf/PACM2GPRbZTfWXFCRa2G3qsny8uz25LALumzS75fue0CvaZieHVOFdkn8NxoeuhbGoI3FNdEDier/A3TO70D20un0Jgx7n2aJTNQI8Z5S+K/IVUrD/XHlZzRvFFNXx9QCAN56lC/M0mEVnkS6/c10izHBr8rdAz8wLTO4m05NUpWy5ReG50kJtooE6BpfLF5ARmKG8+p3zUq8v9oglM6rM9hNeaGD62AZJuqNyOOvloSItuvMzAslIEwPW6jxW9/mlMVE2RmXm0ee/gg9JmukApZqnICjlkVBvBx2UyvUwg1TEaeY7rypDSjF64E2Kyqkb9hioy0msldOxxwwg2GqLMOZGhfut5UO2QtVLojzPpXNvNGByXyLGR6hL2aQLbTg7EqxejXWTxshLaS+cELqyw2RjfOJblrLn3DlHka9pQOssomps4rPZmbRu87byc4Z/pIOeYmi0C+Uw4m4qiHtrNXw+fhzRliuJXk/NqSjVlaiXQS/YZcvg+tyNKNNMtRsBxhFb3dGNlF7LPofSJfXEBBi7DwqiiofjdOVtujGLC6gXASKDoKPkPEZvSvQbHPnD545RgYaspkhWtxnW2dIAeNq3oOEE8NQwYxKNDIjnS6NlF3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oi1vW2nfcdi5NRV2tkrigR5ea229jXDX/e9NFM+hW880ZfSkc3vHGwlZsMNh?=
 =?us-ascii?Q?vOuut/ILEdd1iFMI8rEcKF5nqLdADDb0QNzOwz0QjUC9CRKt0V/PRP9RireO?=
 =?us-ascii?Q?Bc3s3h4YXsQgndgzaSFEQwoD6MTcfG6RUq9CiRDp2W3970Xpj2HRGidwy4NW?=
 =?us-ascii?Q?r6l/E1c7y4IgufJLmQbwkNKBaeKP1nEW/H2Ssbvq+tONWzrnyh2RxDJZH3q3?=
 =?us-ascii?Q?cW14rpWWxeyUkPjfHi69gxAYFPT/zveBhsi/M9bV1wbCCMUhfYwZOrkTjWlH?=
 =?us-ascii?Q?lWkZ6Y1eJier4pwm5uhW+Fp56vAnXiNTRbCP+zZqFuC0SBMKb7j2zyu9FJNT?=
 =?us-ascii?Q?ST35OJTMIEesfSnmIRuWoqd0fLRtDAQYWknkjmiozM/NjOtCPVmRVoTjSaU1?=
 =?us-ascii?Q?1Z5OMn7+JyImvHAPWJVbkVGTYt+IrNFbaaGvIthtVChjYnh0PzKbciV608t6?=
 =?us-ascii?Q?gLdXUP2HLSo3cuVrVydIleb0Fd+CRBOwJRIem12/SKuI6gfubKJv+7kvFlYi?=
 =?us-ascii?Q?GnqweZbYDlyfkCePhM65azstA6c6Ycmt4s8i1PNscVZTWvjruT6ni8jq4Xmv?=
 =?us-ascii?Q?gubYV+xI55zkwYJzi85Wv3XJvD6BusihDCCFUk84vb1zUv9E3Ud600jdR+uP?=
 =?us-ascii?Q?HvHdis2SOyfRe+bNgfVQkcqTpll1C/P7yyZOl4AXhhRTj1zJ8DMS2w8EJK9F?=
 =?us-ascii?Q?NV0pWcXS3oshQxXkYqbEX0DDh70Nculcks1C+HSgYlezpuDZWzBQd3WdCrsJ?=
 =?us-ascii?Q?A9djJgQrSgWtxPBaRwb3KFEnLowbPbcSUGekFg3rrVpusq07VeV7I0vna2I7?=
 =?us-ascii?Q?vm64zNmQ6+/73iIHSlsXlr4298WlpfpLboC4Z0AJb1Y8g+R28WtbrkOSemEc?=
 =?us-ascii?Q?3DRsAanZjPZT8+c+a/hOk+5oFa+brn/SCqxZzTNF+CPRgi0qjGFRpqV5V8Dz?=
 =?us-ascii?Q?eaLYpuVpn+XqSdb4+Aa2Ywmj9hdFngftnBB92YRrjI3QR8b9Zo6C+Kvgq6+a?=
 =?us-ascii?Q?zUgxo7HhsGSNbLQFggUFm/x6yTLVGK9qzXu2FC3K4LeMmCuTB3oY+TVMKpny?=
 =?us-ascii?Q?pM9OzROWOzYS3conmDPnPs2G78HebtbEF8BLdKNZoeou/PYxOMalUG/e3FtZ?=
 =?us-ascii?Q?u0VWh4VbIDQjfNxR9107dexGePODFtpNuPIgCO5/yJXnBjHNiGGSXH+45BdD?=
 =?us-ascii?Q?bPR6hh4UyuNnkHABINKUYdaDZgtGZX20+Vim5paSWAlC9baN1HETAwtJFKJg?=
 =?us-ascii?Q?9tqx7Lpkr/Q8qMFgAZgJcih5yeoXw76PnS1o7r0ER2gcU5xkjPYvi+AiEs+9?=
 =?us-ascii?Q?YBfOHzfgw/v94I9Nb2bEniCaxKyTH1QOK9MZ/hwkZJAjWW0FUNamwaLJEO5/?=
 =?us-ascii?Q?lIO73fEf9YDyXBHOBTxUGswPDFGCjL3mtUdEfssQJQOqyjk3QpIOCGZrMojF?=
 =?us-ascii?Q?RvO9BW3EO+AiBh5rgvw3jga3zbIYzGWPckGShmcAOUv+BSDeVVVUBGN0d9sq?=
 =?us-ascii?Q?SdVickXXvsf76lCsAa4j0zhsv67VbdV7Co5Bykkz4X8hQwWgWlp7oQq6NSF2?=
 =?us-ascii?Q?oBvHSLSspEbuxVoXLhNthtlePfXIpaWUGXguAL7oNxAoTj88B7+NWNSEe8D8?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c56497-e4f9-4ae0-e904-08dc43129b46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 04:03:57.4583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIIf3j492IXSpnPbKxh9n2jnvrOQfubSjrwg8NGMMO20HWSqIavgbSkzHrKe6gh/rtSpq8A/XIDalHuEvxcWtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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

On Tue, Mar 12, 2024 at 12:45:02PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Currently the tests are failing with OOO memory error.
> Added code to skip the test if the system memory size is less than local
> memory size.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_evict.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
> index 4de82c3bd..2dc3fe542 100644
> --- a/tests/intel/xe_evict.c
> +++ b/tests/intel/xe_evict.c
> @@ -753,6 +753,8 @@ igt_main
>  		igt_require(xe_has_vram(fd));
>  		vram_size = xe_visible_vram_size(fd, 0);
>  		igt_assert(vram_size);

I'd add a comment here explaining why we are skipping.

Test requires SRAM to about as big as VRAM. For example, small-cm creates
(448 / 2) BOs with a size (1 / 128) of the total VRAM size. For
simplicity ensure the SRAM size >= VRAM before running this test.

Matt

> +		igt_skip_on_f(igt_get_avail_ram_mb() < (vram_size >> 20),
> +			      "System memory is less than local memory \n");
>  
>  		xe_for_each_engine(fd, hwe)
>  			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
> -- 
> 2.25.1
> 
