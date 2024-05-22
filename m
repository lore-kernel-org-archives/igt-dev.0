Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE335C25B78
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 16:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0B710E855;
	Wed, 22 May 2024 16:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dF+08TrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E8110E1A7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394393; x=1747930393;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jk0fjuncPZ2g7xYxqFM9tRNn4mz91N+oxOFD+qyoTsw=;
 b=dF+08TrBOQsHJQFxUx+FTZZmLLfztcUiz3ZLhwZTKXEeegoNITBoYs4s
 sastaPRVQffrZjWxVWAZxrLQPeVLpqyEqU0hOCAeOFEI++VWZDqnU4RJP
 CgnI4FR2aBGl+IoE353ku9IrP3N1F98AsZKwpHd+He7AyHXDU74hsU5/2
 pcGwnKuLS4vEkk3rzHarerEI6LTE7CxGBwyyL8RB1yqgFA46tQye0A+6R
 U8M654nzwd4TIKvGVPfUIsfuzjGClL4JjRkGKqL/1ixh1VLxD2U/pqUQO
 UvPSwUjMjzxlQ3bLS11wJ0tfoHlFJg106tn8Wf8Ba/TihMp1OaQuH61eK g==;
X-CSE-ConnectionGUID: z7ROIfMRQJOAo115FjHDtQ==
X-CSE-MsgGUID: k6zJKHK4Rhy725eRHaPLTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12599248"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12599248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:13:11 -0700
X-CSE-ConnectionGUID: RXFm6OguSOSr1wVYm8oXbg==
X-CSE-MsgGUID: b6OBNltvSwSIpGgOkUmChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38315370"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:13:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:13:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:13:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:13:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZ/WV5/oimAt17RDw6NkuHjtq4jFqe3VqvQmcWHgAa//h1BIVEbjaa3puBIVRY28FHvNR+MI604MjrObdIHd1PyBLcvZ8GdgccGadwIda3Y/zXK5hnLGGKu9v3HKBoFUViSvQMAHFhWT8x/0nHLM92nDXtroBY/FPPDzztlNo0Rf+bKOxKQt/jajNZFvR+y/ba5HpFa1QoYi4LoPaiuoyVmexrUJUGJ2mpep8F9XJD2xrMb5WweiFm3nUx8V4/gYjH9/3NRzSR6KFdjoYmi+MspSzP78Z9Asrk66eGmdGYzvmjuZnUEl7K9pPYzyLcfZiu/dMDcslGddLx46T6Yu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYhEbkJA0qvA/F0508PbC03K3bahRoCwIM7dnVWn7Uk=;
 b=V6jufBzhvbmcKXKPy/VS99W+OQjU8HbfZfhk4HyuVBrq+fmXYH52tRsETeFsq5lFcyQrbRCnU88rEIwWdcLMBGDh4mfPo2ZRy4nfs9OoVKtdb4ZlzJ9C/W8ZvFI1vObkg9wd0O5qHTPeg35erQmFlS67B45/53QMqy0WZaS29eX6gLwVBAQMO0/kl/Z9KFIftyJYDZipL+XjO3OKzBtAjYlvNyYYT58VgWeQbN3pOzyODNt+ek/3nAYbX8WjK7ui7JN6gap4gRBw/DDM/H9hVJVqJcrH+meP1ZAbHlHdye6NsPxQVkozyIvLuQuoOmY69SI5T8aBUkZAXOxEKE2p0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8474.namprd11.prod.outlook.com (2603:10b6:806:3ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 16:13:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:13:07 +0000
Date: Wed, 22 May 2024 12:13:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/10] lib: sync i915_pciids.h with kernel commit
 d2c4b1db1c4f
Message-ID: <Zk4ZjzUhNiWyB92G@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
 <6ea627c9d1184654f728edaa304087fa9bc51247.1716373923.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6ea627c9d1184654f728edaa304087fa9bc51247.1716373923.git.jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR05CA0191.namprd05.prod.outlook.com
 (2603:10b6:a03:330::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ea0fee-0758-4b35-80be-08dc7a7a111e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q05dFHx81V0nXV4SQprpekx20qDZStgdc3dY9C8C6auLN5yDFPEZ7fPJLLDI?=
 =?us-ascii?Q?PUZy/OosxB5bm2f/nxHu4iFrwwdFwfZk7fiX8ZliRjXbMxekKZ0Mvy/QVWFC?=
 =?us-ascii?Q?v4n425Sr/Oy47Hp3HOjvMfa0PDaTX/FFuKQ/9eh+x1kohHhT5aF5KC/u2ThJ?=
 =?us-ascii?Q?jq5dlDwURcjGk9/JZ8y+e10/viQxThOgXwFDaZdAgX/mVCWx0h5N3HBOBGY6?=
 =?us-ascii?Q?y6DTd5EajtX4BBoqCaOtlpkp6aFykubexpftv+1W9MVpD076yIlC4fUYvybM?=
 =?us-ascii?Q?CBPHJdzR7Y5PKOMmoIUFNG4oPKRtHr5BXpENxpjLg15Vt+AjpWQUySmZvE1V?=
 =?us-ascii?Q?MhQFEqXMhyVz40fKgYVkmEz+QrFOkH+w+5i3I8opaxIRXug39Gr95BRiZb3r?=
 =?us-ascii?Q?9GGKvOdNIUrqez8MMo8vIgImWWBTpIsQqJKlHWVEQ1g8XbZXuYGWV+0P6L6j?=
 =?us-ascii?Q?t6dOKY7ndz/7mRG1kQAA/Em0JbCKwTg6d0AZG0NjCSDUCdiLKY9FJZqYJUI/?=
 =?us-ascii?Q?6SOQ3TVoNrfx28YLWuxcwvnjXPQSvDbS39cEDkYrGlN1KKckLAxxi6pnN7d/?=
 =?us-ascii?Q?gO9QOvATfuMjKAGTwITfWpq6+QjNYfuiaWsveKhMqPTTXJX5mepKyl3zheNY?=
 =?us-ascii?Q?QzBH1V4dNJ5H6ps1e9WMVIajXybmDf+vNtoAL9sr1JJNPNMULLvheFx/MKCl?=
 =?us-ascii?Q?aTwWRYndWdlYUrZG5kHcNU6aCWgOJVuLTb6/dmCn1UbgvkGpHbuDf0Tvn1NF?=
 =?us-ascii?Q?w0M9XdC20j/rGi9WsPAg3wXOM84fGTde/0UihGYY8ZislYduzR68rLlMWO0w?=
 =?us-ascii?Q?xkk8ee9CXhiUC2L/SeYdxt5dK5aNG2K89x0SGwRFvfVpQv429L4h+bAenSDZ?=
 =?us-ascii?Q?rsSrRLkblsablox8Ziq+SfuxoCEOQXYjKXucidBcN3+WbMv1zmdZHrOSGwrR?=
 =?us-ascii?Q?TmBYs71Thyb4+opa/5TkyW1opIrZG5xFBgvR57ZW8j1yf1xiFutHIetl262l?=
 =?us-ascii?Q?pjKHPtkFNYHfYIYyDyr671L50E5KG7EOq27dPdD5Ra6rkLVZe3A7lxBXrgeL?=
 =?us-ascii?Q?ttnnF9dsin1IkAvhV/tQSwixVOmXx0mZseX7Ffb1fNNhchXOpMTQAQO2EH2V?=
 =?us-ascii?Q?dHI6fb1/VanSAlzUteFDxfvcD4zfbO0zN1poQaOGV44gDxMCsukaumbb/yrO?=
 =?us-ascii?Q?Rfu2cLcHX9y9cdIndoZdzP5ikHzGq2L49GeLcxYUo6L1aHjU5/eSp7sgSM5n?=
 =?us-ascii?Q?V1B6inbEkhcynhPfq4Nx/GTG5R2rmq3szbEIK4ntBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6jSqh0eTxEortBy0OkQC6RjhJscSN4sz6f5Vs7y5HI6sQnI4+WQkzwH1OMI?=
 =?us-ascii?Q?vxeMllpwfzNivo4fB1EhN84x+ReiiMguHev/wB2t/PD1y8iSy+aVF88WVTWo?=
 =?us-ascii?Q?cKXHVUzz0ueIygET0KMfaezCZ3PP/OeL1qxTFG0QZy3ZIS1/tiJfLSjRZmQx?=
 =?us-ascii?Q?8VMXyPmiGOfwyllsXGCGvj84GQVV3Bizie9XCR5kYabCWpvcPD9XGMJtQaZ5?=
 =?us-ascii?Q?NqoAewJR8Hg5QcsF+w5S2sJ9NUP5a/IbONrlGXg3AKk58nvnwOGTr2+2Wy1N?=
 =?us-ascii?Q?8UdG9CVMBotm/qj4C7mDwmpfCieRyfyMvPyrlCX9ocRkxf+6mlMuWlxFCvM3?=
 =?us-ascii?Q?0RqkGwwULXLjnKNiD70Pcmc4Nmv2G7LsH2IQ1RrYFKlj694wdIETkWGW4Bim?=
 =?us-ascii?Q?KrLJvLiGbVxq2r2o6L8vHZjq5I69nr75WCAucRd4+Jx5ASYl+Wjn61JQ53os?=
 =?us-ascii?Q?evOgC3+kCwa25WuSiR7ia/q7KXhtTH5HVyluBNgLbvey7hunkWfyuSKUb8qs?=
 =?us-ascii?Q?d2O0mWK0NymtylWE24jew9JEmCOBnyQl27kaNPd4v2nBTiggsLHra/cNxQz0?=
 =?us-ascii?Q?BKZY0ePUTdor0dyV27x9NfNSHt6G38RJ+8jTEkczjN5bf/Ff+nIl38SvDEDO?=
 =?us-ascii?Q?atvOvaDIUKkYQJp8Xsh28bEAYwVCC/p5uKZcasHW2xxGAmRNdxOTBVnIQvxw?=
 =?us-ascii?Q?8Suvgw7J45CU35JAtWQyJg23WbrUQxKY/tHpveg8Il5ke42SaVUAgNrxhKzw?=
 =?us-ascii?Q?fhz6DgKJrljpuxdE+wVVpsnj+oZkjy/NkfsAY0yOHv4tDe5L5NfmfgpUvaIH?=
 =?us-ascii?Q?EizTUp6bGwDGS5/NeaWgsShI2gMwbb5V0HKrh65BeCXwvVQBJQFpYyiD9vQS?=
 =?us-ascii?Q?42jGDrhm3C8WMR/FDG4wG8g4dq3cIthK7gYR583Drydq65TMPVNocnYC//g5?=
 =?us-ascii?Q?wTYBMkbcegMGIDny+2seJfUy3u4PQE1ob6DXBsCvMQiN5HwOaGbAVx+sBAzS?=
 =?us-ascii?Q?bBg6uhcqtsZQPAMglm9APe7piup/RJ1bDqZefwXaMBDo7W4Vo22KKNCx8CyG?=
 =?us-ascii?Q?6mm0m9Eam5j6Z/WzOJIzx7Ze4DZfsIR1/QgR4fVSegz2t4up/UlXvcpmMwTO?=
 =?us-ascii?Q?y+D2Ub6JkhALG+6tLDTZ8aTLfmYNEpzNNfOUqcGgRkO+RfixjuYq4PJC+Msq?=
 =?us-ascii?Q?qUYN1U6yEkLJ55DS6zjPfEIqFcotelh22tdUa/Qegrs/5v64p35mk9BHCugW?=
 =?us-ascii?Q?kiF8qdq+3xysj0JZ+KMgYlo1hIQoVSJBF7MFpbJ+PVR/RwfSNHO0fkXqFHWU?=
 =?us-ascii?Q?5eV2E05/X3hQ88RQ46Yh9LGcQeXjjWs8NDup0W3LsRw52PA/tkyonN9KlNal?=
 =?us-ascii?Q?grHRrVpT6pfTCgVHwi38oKHtfhAItL7UnCn3sIf4A7oTfXiuFoTF9hEXVzFy?=
 =?us-ascii?Q?uIdbUFUhva1nwHRRCXi7yTkKF/wDNFq82o9CHtuDtq8Q4U0lQt4T+YskHEvR?=
 =?us-ascii?Q?W33bLo2eKSYUfM3F9UjhyrQ25QL56oVw0z1wDdNIzHGaNXpGIHofMIXq4y/d?=
 =?us-ascii?Q?kgzS5N15/QqQ1F48ZGd9tIIl2dzWwlcIZXVHv9fWmB3uqrJHS3mzSrHUhjzu?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ea0fee-0758-4b35-80be-08dc7a7a111e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:13:07.5016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTbawrH6M9767xhsXJrpZ0dxP/VQ6HReK7hsvJehXNy2XNw3OMjQ5LbsRl3LDRJ5/5o29Z622prmqbB26tstXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8474
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

On Wed, May 22, 2024 at 01:35:21PM +0300, Jani Nikula wrote:
> Synchronize i915_pciids.h with kernel commit:
> 
> d2c4b1db1c4f ("drm/i915/pciids: don't include RPL-U PCI IDs in RPL-P")
> 
> and handle RPL-U separately in intel_device_info.c.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915_pciids.h       | 1 -
>  lib/intel_device_info.c | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
> index 42913d2eb655..04f6ca3dc5c1 100644
> --- a/lib/i915_pciids.h
> +++ b/lib/i915_pciids.h
> @@ -717,7 +717,6 @@
>  
>  /* RPL-P */
>  #define INTEL_RPLP_IDS(info) \
> -	INTEL_RPLU_IDS(info), \
>  	INTEL_VGA_DEVICE(0xA720, info), \
>  	INTEL_VGA_DEVICE(0xA7A0, info), \
>  	INTEL_VGA_DEVICE(0xA7A8, info), \
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index b1eec572dd82..4d05307ce3d7 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -609,6 +609,7 @@ static const struct pci_id_match intel_device_match[] = {
>  	INTEL_ADLS_IDS(&intel_alderlake_s_info),
>  	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
>  	INTEL_ADLP_IDS(&intel_alderlake_p_info),
> +	INTEL_RPLU_IDS(&intel_alderlake_p_info),
>  	INTEL_RPLP_IDS(&intel_alderlake_p_info),
>  	INTEL_ADLN_IDS(&intel_alderlake_n_info),
>  
> -- 
> 2.39.2
> 
