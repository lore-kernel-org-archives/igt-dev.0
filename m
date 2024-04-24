Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13D2C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 22:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A76113E4B;
	Wed, 24 Apr 2024 22:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvrJUyvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F15113E4B
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 22:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713997607; x=1745533607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zFsMCiPzr/5kAr6CE9QCKRN1NvVjP4uDyY/LVarlTkI=;
 b=UvrJUyvwuMmxeF1zmCv2OFSWHTcexG+upvqcrcxdetFG4o//40ZgyH6N
 eWXvrRuG3oyQcMSTnFMkBQloYcz5LpPZQ9+/jn7sG6/Ynl78/Yq2KXPoj
 ICchK4RJgpInsKtB+e9bUDgoFf2DKRGsyu0hB/rkqFxfb7yriYEZDUlrD
 HKVbp/pc7phrWw3y96iW2FXzwjt63lf5zBDhbG6BMxcIG/Nb1PDgd8cmb
 Rmcuxia97ncJ+wYEEydSIl0DM8+qz5tlnRaS8ywClZH5q22kSf0TVjA1m
 vX6+kOt2hxLKcYf5dAi+EG9z2w32MJQfvzc9F1EJoTIzgQOG4lkQ6Oj3T A==;
X-CSE-ConnectionGUID: +JzpDisDR6KRCbO2uI/Thw==
X-CSE-MsgGUID: 3mmKjo2ESmy+MpNVrfrzEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="10191869"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="10191869"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 15:26:44 -0700
X-CSE-ConnectionGUID: O/PXg7GdT6OWXY3xqLMkWw==
X-CSE-MsgGUID: HbXcDrhFTtGOgPzT/A3/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="25474202"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 15:26:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 15:26:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 15:26:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 15:26:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 15:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdTBG2ggMdorSTh64nr8FCb9OXxhPZHtB9GnZB1DikwaWSPuRl7qJGAbM5xlcXJ+JcIMj9Yx6n35JiAFeupGPoJZbjwTfYxfAARRL6kFf8TWOah+vAJhXMQ4Tvp5L6aNT5HFzKHiZgTPd5ejmjKt6mrvhzO5x+Khgp2gbN9slX5cU1/8cHIlbCZYjQ0BUIvmiaXMi+GlusZqVVP9/gSRFkugnE2YEiKgnnYKxKFzOw30VzvHvfBnopfAzxGMLTawQ67QlFc4rmO6IHzDp3TbYgJOw5qoz8p2M15ekdMU+4Kgku4Q6RdmwxWQFOdeaw7uHXtrKdX9em0V+aU9AcN+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Icff0aw6+Tf/wyHPnXBqovW7GuwLSxV2/O+R9LQ4ylg=;
 b=FZu+Hftlc1BcJ7K+d1umahCicOhTbky4WCNPGHoCIEhvq6udpzZw6dp1L/KoGJnRT5UXKdfOeZ0RA4JTYRF2FvtJz50fqGKOfG6a86akkJkXa/9s2q0U0O6hglhVnTXcN9AHGYqrc2SfnUQU5A35Y1hhqrPZk9/96inwTo3Ch3ARVSCds1fCzjNs/2UOcmVI/kJ02BXmMXCwh8t+cK/Be9ntyvjBmSW2jYQrXsvgbuGqzUf5Pyup6WuJh72AYF1ZC0erJeBugaIz4blsquG/4JVXFBCVsORMtP7O6Mh46Y8qxUxHOoU3HHQwWS+/V080qNY3rGnL6dnGnZJ9B37W4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6552.namprd11.prod.outlook.com (2603:10b6:8:8f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.21; Wed, 24 Apr 2024 22:26:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 22:26:39 +0000
Date: Wed, 24 Apr 2024 22:26:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t, v2] tests/intel/xe_vm: Always have at least 2
 pages bound in mmap hammer sections
Message-ID: <ZimHFv0cSFA1GiT0@DUT025-TGLU.fm.intel.com>
References: <f64507be1d789da9c6a22ece15e88d0f7d4a147c.1713994566.git.jagmeet.randhawa@intel.com>
 <CH0PR11MB54449BB50CE7F774B3A9395CE5102@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54449BB50CE7F774B3A9395CE5102@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b50ee2-4741-469d-c8af-08dc64ad9bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tEB1eGIaaqGzIIoyPHO1iZIWwd6eyFmssqBX9KYNfL9vWNzdqBq8aXkXRmSH?=
 =?us-ascii?Q?fES7Nmn4EIQce3uawO7O6uXMXFUDZCZN2gARuX/6K7YudZ31ADG7ycCOE5rn?=
 =?us-ascii?Q?zlhBNVuVW9LmbTMSRx/gvKotSZoqYviPoYUA0RV6VBGPgshkPsR3+ESlsHi/?=
 =?us-ascii?Q?1rvCzTxwHsgtk8bwMI7aPBRNTJ4pSMpA4ky657MofWMXusZpoRIRFYueW+FV?=
 =?us-ascii?Q?Xs2w5hYIYMWK/RPs9Ate0/UyKhxEghdIgk6rZSlCUnp3Ki7dNdhJCKRKHcqI?=
 =?us-ascii?Q?KF+InenFUPPDuCmF6R4J7/k3y8VV3abpkKFoJx5UwW6hHariyDiC1GxdP8qA?=
 =?us-ascii?Q?K5AptqxM+VQ98oK224+JEjZWa0pWV41Y5Hoqk65E22QQjOMuUuzrTFw/+GL0?=
 =?us-ascii?Q?eHoLmnzLLM5bWnWF/tGoQGuTB9MJYghvADBfQbS5UHWl1otd4KrHTQhUMI81?=
 =?us-ascii?Q?8q3hbqlKOXVmIQGSue3WEQDm8400DwrxJF66koaot+4vpDBoZWpPBWoDqCK1?=
 =?us-ascii?Q?UB1p5caiAdNjv9Qey/g8K7FSipVajGrwxZIpFUT7oKaJ/W2dUNZcpewhy3E7?=
 =?us-ascii?Q?b3vaIUJgiTU7ixnWbp+4ajcerIGdzaJUD0t12lQcjp2WiQbn/DBH6LS3ARrJ?=
 =?us-ascii?Q?Ok9RA4rsauvAarS75gvOYsXLu1E9hc12WW16kwPAUp06D5cmZ9DVEDIf5xit?=
 =?us-ascii?Q?NICfxjyag0IsyKHXBEsYAgItapY5z/wgxNHoskm7gFLGgRN/b9jAL8ZyrwSE?=
 =?us-ascii?Q?R10cZzGZQKjMNPdXXvLBp6VAyKMuPCOvhBteXwvioY5uGwKVvu83aqzqa2dy?=
 =?us-ascii?Q?VratGpYKM4rvX2sFtyI89frJrf8LPydDwoYVDMDYaGJmcT5TQ5fj/gmkM0WD?=
 =?us-ascii?Q?I8OKBjpfF5Zmze1oaXFe43rCLDTXzedUPG0mwRcGKZdP8ccEh0R0MvbJyEAE?=
 =?us-ascii?Q?1yb+ApJTxZHGuvm5lIyJxxv/sU5qoKX/N9zuveS667vRdg88+Sd6+6NSRKhU?=
 =?us-ascii?Q?QCVu8ggkAW/iyX0EVnPoF9GDAmTfyg5OvOzx0cLfzYMEpc0m4ZeEEgL+Jf+/?=
 =?us-ascii?Q?uZpwEIh2eFv4k3rmjGG3YrpKd1a9uV+GVtmllFpKVTlrkcNCKCVOVpYq4woF?=
 =?us-ascii?Q?W7MmkKlevZbLwP3s+QWw242VVdOOmlNzcetc5ps3lSG2Z7gU/EdZEaEi/5Eh?=
 =?us-ascii?Q?unKv7MeQVOzPufqsFEsfBYli00Ju7BuVP22PVKpRNEca2DH2D2ZJxBH/kMmx?=
 =?us-ascii?Q?OO/aLB2JKhoM9Vy4HZR1n+L0VYrRRw+ltSDJaj++kA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hp6OEXIqIdbisOagFwzYM73L1V3mZURazSNvSkP3PZprYAEekpcJG2LT6HS0?=
 =?us-ascii?Q?eocDaSwRMNSashPWNaFAxNceZRbwbQzN+Xyr1sJ9JVz1slqP8lfEpzVc2tGP?=
 =?us-ascii?Q?P4FNtWPrMH6EZr/X+baul7i1fy7OVLryY8M0BcrkUpH+75Pw/80XkQEVYpeg?=
 =?us-ascii?Q?WSRdBH+TlCgS5Wr4MDfdqeFLkhBxYylBtqYsE3H5Sk5Ugs96OkGaghG4gFQL?=
 =?us-ascii?Q?gKi5ytBnHyVTFa2SPbabutP8I8ci0l8vIpMMF7b4wOrm0pUtQVbZp8VzGxXK?=
 =?us-ascii?Q?uofYCuyQwuTlI74b1fus1WUyUGPcSu/DpRW0IKkjCQPAVMtUK4rMeef3FW9Q?=
 =?us-ascii?Q?VmMPJhXmwNO+T/wn6cvJZ8ic6sWkAXBX+jVoZb4Fqkj08Qsdj0cx9t8oHSWs?=
 =?us-ascii?Q?afT4sJh6yjEJ8wFvKvxJBDnHJmfHmHGhIzxfMj7UPI9GnM3RZQYgyF2woM/5?=
 =?us-ascii?Q?cRdi/cYCa60D/H+aKI0y1g+S/MU1CAua+jW9Ku0v1BiyrQqi+LvrhjzwNlHv?=
 =?us-ascii?Q?YzOu2+z5FmJ3kw1V8sdFQaIFVyzp6PBjlJfnhqMgmdnIwRCWYV0rvEJ3Hd+J?=
 =?us-ascii?Q?kDCn0b51RZ+xE7Cwb2Kof0Jhe+aFVdXnyBDeJAx5QZ3dGDnOmRRXcwP8qeHu?=
 =?us-ascii?Q?lXCo5ZCSyCvVheZX1d8jGrgwSed1EKrus8Q+PbF96h5sn62MmwNTDlaAHWGT?=
 =?us-ascii?Q?mUeOQDOe/RjEHMSVOpwc8UrDg8YcZ5ACMI/D363YTLhLFnedfO4sfmZlg5cg?=
 =?us-ascii?Q?KbMjWvW+OgEW4hp826jq/nj0LSbjVcK8cOxXNqACb6tuGrXXL/3EvchRErTK?=
 =?us-ascii?Q?XoCEjmIiIIEjELVMOi2jvGcaadmPZh67X7+V8nYpO9xEzPP0uGTxAfQ+9/69?=
 =?us-ascii?Q?H8oqjkDsh0QVz/iU3xPMCKqMNexwthdd7nvgqq6ojYMPxN8fp9uQiR3urDY1?=
 =?us-ascii?Q?nvZIk50NUuBYmBewzj1gWsONplVLbRgvfERXpRbwF5R7YK56lPZr0ukqGLYY?=
 =?us-ascii?Q?kOWrVDWsRr/h6B4yF95TyHKm6r7FBFxkiH0fOxG/9aRSzcvqtCzxiSQ1b8bR?=
 =?us-ascii?Q?uihGqbZtLJ2C8VMa7/ATgq39qSa17yGdva+WZD438R41INLrsohfeZ4oeUWT?=
 =?us-ascii?Q?ZQzGdRKStSF1iOaUrfKkyHvl8yRckOxn9Xq6Vxony9beGw60rHKUtAua4EOP?=
 =?us-ascii?Q?shmJSCiW+cbqEtB39bK5cU69k1aB3yaBxmwhh2+fkEM+BdW3o20opb4pCfsE?=
 =?us-ascii?Q?CJyVolWxd7PAshRjCkolddzJ5HvcGMBGuM6uWe72jfC9/aOWoijFsiqDd/Td?=
 =?us-ascii?Q?cikAykIS6Frcd7F2SAmba2bogLG0qWWPOYnSoPjLrp5AXefeqz/re8vSX/sa?=
 =?us-ascii?Q?uT/5HjDJDjlYp4LJT/Os7ela7Bh6Dt/EeUHt5KjqKdVknVILSQ3nBvNFXNut?=
 =?us-ascii?Q?g82BxoYogavU5mJEXhh3QuuSjqstmOFcuvEgvdJfiCULplmHRb+JQ8s2Yh3l?=
 =?us-ascii?Q?gHO//AIs/uBgtOjSMVSfcDGKF7SJ53NFzKMvDR3VPe2N4f+Xn3GedJTsLdFL?=
 =?us-ascii?Q?uCALWuYFrmg3CQIFnBSoWWNnU/87FbmdldePrnnU7QYbo8sZ2PrYSQeUaPBl?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b50ee2-4741-469d-c8af-08dc64ad9bed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 22:26:38.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqGYo6HQX5t8s0KqSmm/wvK2peJmo/L4zg7b0EJeMTrCGlY/Eo0uS+6XjtAkfdOUA2IasARYBVovYGej0P6RWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6552
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

On Wed, Apr 24, 2024 at 03:56:32PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Randhawa, Jagmeet <jagmeet.randhawa@intel.com> 
> Sent: Wednesday, April 24, 2024 2:42 PM
> Cc: igt-dev@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Randhawa, Jagmeet <jagmeet.randhawa@intel.com>
> Subject: [PATCH i-g-t, v2] tests/intel/xe_vm: Always have at least 2 pages bound in mmap hammer sections
> > 
> > Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always
> > have at least 2 pages bound in munmap hammer sections")
> 
> This goes above the Cc: Jonathan Cavitt line.  I.E.:
> 
> Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at least 2 pages bound in munmap hammer sections")
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> 
> Also, and I don't know if this matters, but the newline added automatically by vim should probably be removed.
> 
> > 
> > This patch extends the recent improvements made
> > to the munmap hammer sections by applying a similar
> > fix to the mmap hammer sections.
> > 
> > If the prefetch buffer is 2k or larger the munmap hammer sections will
> > prefetch the next page, if the page is unbound a fault will occur.
> > Account for larger prefetchs by always having at least 2 pages bound for
> > the hammer thread.
> 
> I'm not certain copying the commit message verbatim here is preferred.  If you want
> to denote that the two patches are related, the Fixes tag should do that, but to be more
> direct, you could say something like...
> 
> """
> Extend ee0a9c8e30f6 ("tests/intel/xe_vm: Always have at least 2 pages
> bound in munmap hammer sections") to apply a similar fix to the mmap
> hammer sections.
> """
> 
> Just something to consider.  I won't block on it.
> 
> > 
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index de2b1a813..9872df832 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> 
> The original patch (tests/intel/xe_vm: Always have at least 2 pages bound in munmap hammer sections)
> also had the following change applied:
> 
> """
> @@ -1263,6 +1263,11 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>  	int exit = 0;
>  	int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
>  
> +	/* Ensure prefetch will not fetch an unmapped page */
> +	if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
> +		igt_assert(unbind_n_page_offset * 0x1000 >
> +			   xe_cs_prefetch_size(fd));
> +
>  	if (flags & MAP_FLAG_LARGE_PAGE) {
>  		bo_n_pages *= n_page_per_2mb;
>  		unbind_n_pages *= n_page_per_2mb;
> """
> 
> I think something similar needs to be added to test_mmap_style_bind (for consistency, if nothing else):
> 
> """
> @@ -1568,6 +1568,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
>         int exit = 0;
>         int n_page_per_2mb = 0x200000 / xe_get_default_alignment(fd);
> 
> +       /* Ensure prefetch will not fetch an unmapped page */
> +       if (flags & MAP_FLAG_HAMMER_FIRST_PAGE)
> +               igt_assert(unbind_n_page_offset * 0x1000 >
> +                          xe_cs_prefetch_size(fd));
> +
>         if (flags & MAP_FLAG_LARGE_PAGE) {
>                 bo_n_pages *= n_page_per_2mb;
>                 unbind_n_pages *= n_page_per_2mb;
> """
> 
> > @@ -1913,12 +1913,12 @@ igt_main
> >  		{ "one-partial", 4, 1, 1, 2, 0 },
> >  		{ "either-side-partial", 4, 2, 1, 2, 0 },
> >  		{ "either-side-full", 4, 4, 1, 2, 0 },
> > -		{ "either-side-partial-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-hammer", 6, 2, 2, 2,
> >  			MAP_FLAG_HAMMER_FIRST_PAGE },
> > -		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
> >  			MAP_FLAG_HAMMER_FIRST_PAGE |
> >  			MAP_FLAG_LARGE_PAGE },
> > -		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
> > +		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
> >  			MAP_FLAG_HAMMER_FIRST_PAGE |
> >  			MAP_FLAG_LARGE_PAGE |
> >  			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
> > @@ -1926,7 +1926,7 @@ igt_main
> >  		{ "front", 4, 2, 1, 3, 0 },
> >  		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
> >  		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
> > -		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
> > +		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
> >  			MAP_FLAG_HAMMER_FIRST_PAGE },
> >  		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
> >  		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
> > -- 
> > 2.25.1
> > 
> 
> Move the Fixes tag, and add the missing change to test_mmap_style_bind, and this is
> Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Please don't merge this, I think I've convinced myself this is actually
exposing a KMD bug. I'll have to dig into this on machine a bit to
confirm. It might be a week or so before I can fully dig in.

Matt

> 
> > 
