Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6264C3ABDD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9577710E40A;
	Mon, 19 May 2025 15:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnGIRFxi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11A10E3FC
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747670307; x=1779206307;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3upOsBJDzXIH1BqAsFA/sNFbsxxZGFu0UehIk0k/QH8=;
 b=ZnGIRFxi06WZUPrwX+8T5qihyvytxi3yLilPFoxTkjHr/JWTU9ABkusD
 DYXkXLHzGwvvRgtt57UOwWG2+PIQCp2cTMIEdQPy3NqmdkWZCL5xIa4TT
 9Z8rW8ZSXf5YkXNrHLP25IgSX7UKyVHfO8UMMaKeEBZd7ABjcZidp7ROv
 Xpsn/+bcXBrVQimgFA4XmVG9CtMuGxa/Q5ahkKpdKp+tSoB3bufmHc0o+
 kdR3G9H4N+i8obncj0pDU1Bs3j7FqAIWIjJWxSfZJe0xA4LwYwfw5xBCP
 8LiDcpfJW0A0E7E/vANpsKTbWP6w7kNdJywEO+DwAxMmOiFfrJxDpY0Vf w==;
X-CSE-ConnectionGUID: IHiD+znOSfCKm6Jnp/JRQA==
X-CSE-MsgGUID: FfC1ZcvXS3q0ZRox/Es+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="53249148"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="53249148"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:58:26 -0700
X-CSE-ConnectionGUID: ygKGBxYJQn+UZokqKwTunA==
X-CSE-MsgGUID: /8QnKvFcRB2NvRNrYWefTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="144287700"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:58:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 08:58:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 08:58:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 08:58:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BzxFCuQf/+MsMPrX24z1mRfXrFW2nI6INnGpYWCGDNJkWrbxix9nd9VAI+xuLAr0f6S9C0kDVkUae1tvth1Y71wIE9URrYqOV79Z+MOlBlmpupFrNMSwZ6hcA2YjzjRIsEQJhsnE24za8rGIoJD/l0qf7wV3jFlr3CnzYOiNvfCwQRSZb9Qvt9IQa3QQMjGMv2Idl6aNjskEaboYMHyaVZVmuS8UIo43h7MmIBoOqIUVp5Xgx4k6xk+RcbJxsm1z2X5lthv2p7gQ+42Jkd6MR/MPOw4J/WZp0vURm01kTIHfq/Doyr6mixFTSujAJlCLM3ldtmDFREUbqqEyOW5bnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K5mXmdKAUCj53BRGAvIY6aANNYM0wsGEa59lKEMknE=;
 b=pm34ZUZ8pbnpdD2LJpV6AfqlcFVpALzAgFyccMTzf8UW3kEoTekb6zBUWFK7dublWMQzVzAQGIKGWhdYdOQINR4qAcLEqYvuLQLYbNCrXz65DGC0avzNAL+k+68k0B6hTinsw5feyc8LX3GoYM1aBEgJwPRbWLy8VmJSEwGCCmgioppypYdT/OnrDYOBYmZuvmXbHuJYZb0ai9lTx1cM50TrWv+83XdfqMeQZiVbX1k4O8yrKWK4F4dNS0I0xPWr/iQONuSVAOmOj0i52ED7PfpIrqCo4pV/mejm29HTgtv87KIt4fpkzyfYYttuo6FWpCxRN4qEWSCknLLkq5ikrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 15:58:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 15:58:17 +0000
Date: Mon, 19 May 2025 08:58:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t] lib/pciids: Add one BMG pci id
Message-ID: <20250519155814.GO5080@mdroper-desk1.amr.corp.intel.com>
References: <20250519155323.154398-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250519155323.154398-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:334::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1850aa4c-0d17-45ad-32a8-08dd96edf7eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Js7mr0wgiloSFNp+/+yt7xzuCFlCJ/N8nKkHE62u8K1BshCrFrd8W+cdPC1l?=
 =?us-ascii?Q?MJCrah0I3330Lc61beaDr0lyqapUmvjJvcwl537sNgJqtwDDWbgL1yeiVNNK?=
 =?us-ascii?Q?0yccOEbOo6ZulPkzIbFIOgXJaixiBzwHxCgmoS6YXJoag7Bj+o979nZTfVAy?=
 =?us-ascii?Q?J7uE8G2WE5W4G6VL1MyMRJuUV5QyHNeNVQryD5HxbWiqEsmpxrkvFAyGLOFz?=
 =?us-ascii?Q?fany4QpJasWAd2BmFPWqvdtRjG6UY/gb1rRMNcAFsYUSez0UO4At2ysJyeqo?=
 =?us-ascii?Q?9IallOTPhWXxZEo6IgOQeNGWy3nz0myqfZde11AP09EOfs4kKtRT6UkYgCZg?=
 =?us-ascii?Q?8K1aScrA3FHDkbTUKisXsGA9afQYUtuIbmjVW9J/tEkOrtAvcqRAGtv5rNvn?=
 =?us-ascii?Q?PHrLMlWa3ovDYwFiDXA0dginSAFMzFCcbxZRMsQCY8fJOXIY5CKwLP7sZuvO?=
 =?us-ascii?Q?sDhCbY3PQNGvIZI0h/H4CKWIj3uKyaW9v1YYaEasSpHERXKHTl170sl99TrO?=
 =?us-ascii?Q?CgdskPIuSJ0iXk2vQZBljfuI431Ax7iRbCeEFZXFzwFoju0c31Nn/ynGihvA?=
 =?us-ascii?Q?0iX/ZV5Ncd3K0we0K+pfRiNpxuB91us3YVu0N3OhvJdd59Szjfsgv1Ww0qk+?=
 =?us-ascii?Q?MHOzg/i4PJvVFW+m4h+eRqB+W+zhIJF7ntIgKOF/6bSoLQdeyjzFfE+KWonL?=
 =?us-ascii?Q?HeftMzrJZa9sAHCfCYVq8b4NVvnWebPbQKVWggI0ccxae/6WiZwoXdYOioBy?=
 =?us-ascii?Q?Rkm0oG3hmyEXudjOP+DpkYCGz2yTLMNdX8WkXubxVn6POP/cSMIm8qC/2/jo?=
 =?us-ascii?Q?xQrw1Ny/S7PAQezGCyd5UH/2cRiHYaQn2H1b6Rd21AND714eWkjHDHPeeTPr?=
 =?us-ascii?Q?Sy8hbVbDvczeM3vKj9A53vfEaJSCZ3t4aA9DN0TTa0IgM0A8RGjb/vO5S5Pd?=
 =?us-ascii?Q?zB1DOQzry6XzkzrbZUDlUTImWx3oRfZ6iu3a12Es5v/IwKVAd7GGv7DpDuDU?=
 =?us-ascii?Q?UafWwH3uYv7I1uShK9Ig5nbGYiKBk0+1WkIOvO5h5D2o6Ud+eFSY2CrOEESB?=
 =?us-ascii?Q?tkeHXAR8p+tTWdtSXtfhHxpqRqntTOsHzZaitoQf2ddxtEc6WbP+XyorX/1V?=
 =?us-ascii?Q?2CBZSeW5YjKcH56sbhEGcQys7Vsr2Ywk78u5BQYUrB2Hs13iJ5UyiUG7Qaal?=
 =?us-ascii?Q?PQYzEEXCtFng8jYnCCrA5JP2Fa/ANKuQzE21MWGf2rF8sewrmhoZ+yp8+a1T?=
 =?us-ascii?Q?9OW5ULBe2EAIZ7ILrOxrWX7vJjX0LarlBwjaI0SRNeOfeu15f9RqI9VujucR?=
 =?us-ascii?Q?QsR/o3GlYKsqJXD6n6ZNk9cJZPFldfcEv9YL4o3RKbr9ck3HpS4jtrTWEMtk?=
 =?us-ascii?Q?5WlPAG8/xQ9qr8Pw7exj7wwg3FAhFQxhkYiULxTb4sByYJvtA9F5qm9N2l1w?=
 =?us-ascii?Q?sNiijEOR3x0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgsHXHDc/6L0OvTXs3LVfUSH+8pcxUnE28m+udJAZkB43BxVDEDz9i48KZtC?=
 =?us-ascii?Q?8EE70mfHnktx4455FO2Biz9KBj0Ay0k/bvhHQFEGTrAYN3NPF4hq4IUmpxsw?=
 =?us-ascii?Q?FZM6dYc1maCPFQVRwwsLmmD3JQmc0wZu/6lfIoSsJyNVYdCdQQKG5IZJfzm8?=
 =?us-ascii?Q?wlm4+sN+XSGHnFsHntmtY6cYU6/Jwfupg855G7yL/Cwe5isUwcMs34qGfb+U?=
 =?us-ascii?Q?YYicqIjCKP8fduP2P4OS9ZkUeHHfjfXOKRjfZO86yjTHPpAS7TBPaMB/hdg6?=
 =?us-ascii?Q?ZB+hRJYe+Z4Yy9v2ofF7J8vkF0GdnrGQHzSVc5L/LHC6HjdFTIY8kxlc7czY?=
 =?us-ascii?Q?xTIZxoRCNJDnpowsY0DsIOd2MwWGXQVriPthKFSGJC8+ADF1KigSSGKSfw79?=
 =?us-ascii?Q?H3doEqkYLmUtC+/dExcLmOpIBdX+8KZ+rafPjWDSJH4MkqihUleM8b1ibtu8?=
 =?us-ascii?Q?fBN3y36Bt/rG9pLJPU5xUta6ZRzYVy1Wxu8XJYaibqra64VrNc6QIyEcQU5k?=
 =?us-ascii?Q?xWCrIVkYf3yIEDYo02nOtnU0k9gP0gdPQPOyQv3HkIBrdEIDskPsCLdtUNeW?=
 =?us-ascii?Q?CYi+WfNSvokgqgrKAMaZDv0W5WRvdYgVyACON2l91zffRMEj6dNp61JEVrMW?=
 =?us-ascii?Q?KeWxOrpUJbR3JtJ6fLxRI5HHZK1tZZlWDjgw1W4xxGc2ngU6038NMKUNRWty?=
 =?us-ascii?Q?Z2Hx2k37enaY6+yCtcrazWXemNpl/3rIGh05Szy349rSw/XSgUcyIgBKnqli?=
 =?us-ascii?Q?rWwdZV/mPvORJqnWUwkWYQ5MlJIFcZDMoT10aN1ZBak/rq4lWvnlQeJz5f30?=
 =?us-ascii?Q?bR0a89/RYa7vhN1TersazyUngopfzbHA3aTZYVHlmCQejArI+vOT1rSZYGVx?=
 =?us-ascii?Q?3QBmWR1SvLGWDD/POj/bTIPIn49cGQp9GRLmg8onEq9JE0TzFY7lE5Baanlv?=
 =?us-ascii?Q?A0/cxBRfk0zJ/DEoAgAADHuYDIRcB0IFG1BURANOQrbzYj2FhMIRvLhPJ6m7?=
 =?us-ascii?Q?39LXs58tTuDSGzqtvD+7y8X0RMqM1236u5eadG5sspyKgX4wZjwY9UDQJnmL?=
 =?us-ascii?Q?WPMZVrUEvnQ7BIZJ8d9Rglw8R+KPCNQr9drrND0LYYfaytCYAd088/WzqbGM?=
 =?us-ascii?Q?HJU9abETVISgjLfDdVTRCgDR/v5EVPCsXD+pRYCTiEDnyv/8RrEjbavnfQZP?=
 =?us-ascii?Q?D482EeZvvRirDwmWdoO72c15RATrppBJ1yEhy/gk9abTBwcub5IpBIWJMSKt?=
 =?us-ascii?Q?p/7vh1ACIEgP612TYgGzfUYRreLuOI+bhImdAY8CDXRMdPwE716UbWastxZY?=
 =?us-ascii?Q?0Ke/VH4ckNTpnLOItzTb+n4K4Vr969bAu2ZPfILRZl5keduBz214U+BCenAI?=
 =?us-ascii?Q?Nlro5Zq+Tnnnv9dfkODKiBphUXTIS75H8QZCF85SwstOrh2kFcUlmholrlxi?=
 =?us-ascii?Q?3pgnETgZP+1xJJZfd2K42aeLVtTI4kiOFZtP8iO6qw0QAQKCrJrkCYILEMqK?=
 =?us-ascii?Q?Zll2fEJf2kdnZmyB6KzKcr5t+ZNlram7a1OzexfLGCNY5yftwApv8OMjW9Vy?=
 =?us-ascii?Q?0c4ZrRMyfYrbAOS7AxO4Rw0i6Ycg7Gyy4+cavWyT+cXeaIkOV3S71AZrmJ/I?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1850aa4c-0d17-45ad-32a8-08dd96edf7eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 15:58:16.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMgokVorSjUDHvBgydvqkPxu5RneAAgXoQNIjfX3AAzDzqQIrwG3XPZvMpRQU95CZnEgPsAgRx3APQZB0dKEuSr9VBOGgmtlgEoxVd3XH2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
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

On Mon, May 19, 2025 at 05:53:23PM +0200, Kamil Konieczny wrote:
> Align with kernel commit cca9734ebe55 ("drm/xe/bmg: Add one additional PCI ID")
> 
> It adds 0xE211 BattleMage PCI id.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Link: https://lore.kernel.org/all/20250325224709.4073080-2-matthew.d.roper@intel.com/
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/pciids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 4736ea525..d212848d0 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -850,6 +850,7 @@
>  	MACRO__(0xE20C, ## __VA_ARGS__), \
>  	MACRO__(0xE20D, ## __VA_ARGS__), \
>  	MACRO__(0xE210, ## __VA_ARGS__), \
> +	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
>  	MACRO__(0xE215, ## __VA_ARGS__), \
>  	MACRO__(0xE216, ## __VA_ARGS__)
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
