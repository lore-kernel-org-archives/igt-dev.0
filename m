Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5EDC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628CD10E4EC;
	Mon, 14 Apr 2025 11:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHhshuQy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDB710E4EC
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744628616; x=1776164616;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NqH31i4bKKAdke1wT4CXKK0zduKhxDm7xNa7q7NJw1g=;
 b=WHhshuQym96okksfEpECyrmbUHPMl1+uTnmsYjiXJp6w+tBNNk7vY4WS
 iD9vLz0w8WfZmWA0h46zmK/wyvHDy2yTyKdJh5VWpGu9zGhpGqE/sshlK
 My1blkQegd8lhKXpij1KfaYcW+feSvOkvdWLnHSZVQb+6XWwuQPq+Trr8
 opf8NR0kkD5FYgcB/nEbH7TcZjpxZH2kyL00aIBriX1vk/nSYZ7BqrvPv
 sXeTW0ORymPm73i1T8p6YZkWqzKFC8LEkRzFE7ehJIW2X8Sthcaj444he
 isRgdLn2zsEaBxejkIeax2ITVeB/3a9e6Btjdwq/a2y1eDqBv+0gq/8Gr Q==;
X-CSE-ConnectionGUID: CCi/02v5QaqEEEAhH6VK0A==
X-CSE-MsgGUID: 1U0KD7Z2Q6CoQD1sKA/XzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="68582279"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="68582279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:03:29 -0700
X-CSE-ConnectionGUID: 78rM0/VZQASNY8KAUJ9jaw==
X-CSE-MsgGUID: JqQchx6eTRKsD+XlsT++xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134629675"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:03:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 04:03:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 04:03:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 04:03:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8rYhaHc2hXr8XQs7anvxIzziMp34c54BVvSvrCnuCXTn7Lj4eEg4CaTv84tt0LDuz6xmZBsLxNhb0E+2lXL0rYRoWAXp8NLRf3sLjLiAgcZAY9EMg5dAJ+P/BNYLWY9hWvczXTbhcCW5OcoBO96QVwbXIU6svybB+Ck8qibuAT5kukQTFEsX+5+fYOkAtZc/neox3LvfBVPtrhdderPNJiBrtpIPEHQoPmMw6phTp5fWU5V0BxY63ANWgda+Tcyh44zp/KOERTzZZHgk2pkvUBpD4bmhwB4ohTBD8o3VwxaKHuLlc4pknx0SK932Qeme4mNO+P5folRs1YAyjk+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYwabb5/0KbWyNCs9/7iMoORMATtABra/DiUNhyFTRA=;
 b=VEBKaVkzCbgrtLNPx5elwhP1jaXFkqDCmbW1/RO+/VOtVDetUpwnw5fLbnswZecfXOtZenEXMMZFCzbMoOPHTRyhHFUbBJ5a0aFbbb9MOx62fJMDNKf9hcL0ArA0taEX5MI970/p/tx8Zq7RveRiwPiY14S4hhI5abqSaXUd1wBPXa4xGbSd8kzsqK3HejPS/fjUuHMuX+H7alR4TorZoBWzrFzKgGT9uyKsyyt1hopD0ijegpUCJbsaVgRHALxO8SmLLi9KMJIqJYOoheW2Go9Pwm0F/NT8aTWjqal9gI4e5l10FbYL2mgQWddoAR2zxpDkEN2F1pBTsD0VRR+n+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 11:03:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:03:24 +0000
Date: Mon, 14 Apr 2025 13:03:20 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/10] lib/igt_sysfs: Drop xe_sysfs_driver_do()
Message-ID: <Z_zreDFPZ0UnxYP0@fdugast-desk>
References: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
 <20250410-lib-kmod-v1-10-84b1ad0b8075@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250410-lib-kmod-v1-10-84b1ad0b8075@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR03CA0066.eurprd03.prod.outlook.com
 (2603:10a6:803:50::37) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1dc4bf-f7fe-46ec-6747-08dd7b43fa30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zImcevjMF9D0OOcT8DgvA1yDjhTjoml5GQsQLjprrqeJoRYl6zFIbbVA8wj4?=
 =?us-ascii?Q?rPfQ1AS4D9/ddwyrMDzDqrpwLnYF0haMZU747xEEmC90Xyq7FqDn/iC6s4Q3?=
 =?us-ascii?Q?dbSZ4YjiTQ9KBiggfMTD68VhRhlspKHPQ3rvbLFTNl303EhP4ZDvC+pGcx8F?=
 =?us-ascii?Q?AHUQO2bxw7cCfbDUPOVXc0HaULyHWmMwCtkZV2/eu5CFgX/RXXPfCgaDRmte?=
 =?us-ascii?Q?4DO5qg5MKdlfvpWgAuY2yTh8JopHQriWUFWhYrZDTX3bS81eWIx3N3HvCXuy?=
 =?us-ascii?Q?jCcKv5mvuisOFH68Oj97pRUXme4rXqF/cQARcKPxSf/67TgVZxcvcaDiTD1p?=
 =?us-ascii?Q?e6z7Y6L2Xxt6LCNd7zcE0ox/rvpXSOGPCA+0GPXvVZiMPV5s+bQ3qd5+E01R?=
 =?us-ascii?Q?UnUwu51Gwpj7+QzMe6EUlFc5jUyc8OhBwLdVcSox77q9Qs544bFoW8YBDvvN?=
 =?us-ascii?Q?TNUIkYzfGT4Hl7M51L4/AW3N0/9DGfCu4izg7A56NbKwtjdrEXUPAmYKuqyZ?=
 =?us-ascii?Q?e4B59JYKUlkob8fe9+NTQBK6jRdcca+Rf6xodE8Mle6aWUG8cKaipMBk69Oy?=
 =?us-ascii?Q?KgqaSR22J/mRKjRQF8hcik1/Ygo5Jtncx+YpPdouofVQ9Y+6bK3SwoDtU7/e?=
 =?us-ascii?Q?WM4sMRRjzpu8XTX5ttO8Li0MdYY+Te4bvxhhn2abBuMygO5mOvEOsuQMa/Px?=
 =?us-ascii?Q?Rt2cgkQp6gYAmhfOZU3igtIwsPnfQIZcfdAp1UeKLe3scYJmy8cA4CRs6BTL?=
 =?us-ascii?Q?VSMUBxctPc2PLqMqa4oJvTfz/VuUXc7+LwKQCdUSyf9ZGUWE+4wIJL63a0An?=
 =?us-ascii?Q?ekKS8WQB+lGKbYd5g/GlMkOfKeytzEjCNzfX9CimAtAr7PKTNh87SSTwSOcY?=
 =?us-ascii?Q?Rge48OfVPKI4fDBvVYl0RBOpMqShz0VCsbYp3EMTZ5sTbVOlsxTRcL7Iza7V?=
 =?us-ascii?Q?JW2w5cJszSuA6IHDCDMasV4E2QLLqpn//z/QYnuRFPv6vaFIqEWXR+sU1v/n?=
 =?us-ascii?Q?jEzZ5y2btIX9tl+J0ext3iZGE/BAOXyCt2XFogtEnzzyDRLSot+8ziOOPWPD?=
 =?us-ascii?Q?t8TVP8xzNyvLMOdeU6ij5e/EFJC6Qq43Co+Tb2Z65nHSp3DubS1BQy2tmIPG?=
 =?us-ascii?Q?Sz7z652HwJfWw6FIJCHjxvFeeTbEU+f6YoYA4U19lwrAGpxGmkrHTQL4QDcQ?=
 =?us-ascii?Q?oDD7azZHzs8L5CrjZ0Q7WGVI1Ackz1hiYG1+DP0nBASy/sJ+VN1iV+x1mIs1?=
 =?us-ascii?Q?xcheVlhFaLr0pjefZveYWPNdZ59U9BbVIkNcJ83GklsJVH43/NOptillxSMe?=
 =?us-ascii?Q?bZP3JROZ9rpwtwtyyv1IwOPzEzRjcT4hAsrqkbwx4WWuMDqr9eJ2hLRAHtQU?=
 =?us-ascii?Q?BVVRgPRl3If0j+rZUp8DKBUmZOCUWOG06UlAPnuXoY23L9HQccJsgpO1W9W7?=
 =?us-ascii?Q?Qj2HeE/ZbPc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rniS5ztrxhafdP3i4zT8/u72ehtxo5lMprrMk+fCTGvasIQ6dwpwyK2xLbBF?=
 =?us-ascii?Q?RzmJ1U3Pc/Z2OqtqBllZwpJQ0NjYrcntrVxLFHhWI9r3hcHV/IkVLQLDd4pn?=
 =?us-ascii?Q?53Bty2yb9CA9xdgIWyAOSCiK12+aKGadTaP6v0sy+hzp3uT63lYdVKdWOWyG?=
 =?us-ascii?Q?dyy1ormU/O+UJXQ1AWWMTiZBb0/kmjBv73s4lDTKnVDKje304M0g+5uLUczc?=
 =?us-ascii?Q?LKmU8GSY+EpdawBFgvabMeliEsN7Wbafl3/323oWbUHZ8cRtAmaW2FXnRaA2?=
 =?us-ascii?Q?dZ3LQdtMy07Jiz+YDe8beIXicymOuM6IeU/xpxcLLmID50LTw82qLfUxXTve?=
 =?us-ascii?Q?vzur4mpf6TZc8Bysu4wT4Ka6Sm+1ojg6YRzHAlS5Y/koGcGSlwmFDjSsLDOh?=
 =?us-ascii?Q?PFvoz08jXBXyGhGNNg1fSXJgIvbf7mlidfmVjlJ9zi/sterNNezAvRIbXbQe?=
 =?us-ascii?Q?DOzxrG+UDUY8VQQWa2pZr3bun+m2FAn3aHGr+93s/wzv/LTBxdv+VOYtFGxC?=
 =?us-ascii?Q?5VL6LDQFoaWqmI7ZxHjv8CPVOj29/3FBcNfzuxQQIPHTQbqUMzsbCHrrOnjp?=
 =?us-ascii?Q?G3kEv/Yqnc1ndszDty2iJcGFrJH+fALGTeHxW4fY9oW32qYBDBjL/junqVo0?=
 =?us-ascii?Q?7wIZKJxalUoDCGfVs88Pzu8P1cyphJdiZP4m7MOiRHxBt0/dJhuSZLUovRg3?=
 =?us-ascii?Q?Q3BTT47bkPhUN/tN7eirMBXwvypGp6u5mkOBAFiSVWpiEzZQeZ7VI/Y/+Xa+?=
 =?us-ascii?Q?n9vPv/4soJR76FwH++4hDCXeAsSyKzY2K3SHxWte9t4ve0EbYMxTwZSbFLjO?=
 =?us-ascii?Q?xcnmMm8QRTh7CN3dj3Q0Bo8dhL5hgUcvp/rhvem/YTZ/P8hsUjIPKgs5P12d?=
 =?us-ascii?Q?LPMMKb8rnJ5V/6gRg2v6sgGGECNKEI6cwUjlSQUtp59PcDL3XQ9QGweLc9fB?=
 =?us-ascii?Q?a9ysnFectzmIbJPbpNSgjCZph8XYKxqRtw/fBY/itXHyEUObuFWt7Tm1nUvi?=
 =?us-ascii?Q?8mouio+ZwEMBqHs9ijyTkO8FGdr5q3OdjhNE1zJqzaa8yNkFTWUvNQmBdaOf?=
 =?us-ascii?Q?bLZhyLkbg+uvw0a7sK9s3rWynQy7LNUiqOn/2FCP2KDsbq/jKmeP3qewV5eD?=
 =?us-ascii?Q?9cw2GLmaTWF2rVXfoQS3qvpDZ31ZecWDul52BHinDAJvSOKKEIrQ0sc683AX?=
 =?us-ascii?Q?VXp61t44WsQ0BErISL+2/dYw0AFX9o3t0ShcCIqCO8adDf900GyAFS5VYtuh?=
 =?us-ascii?Q?4NS10Su+p3Li2TdrfaMtyXflohbyEeI3duNeaJpqgRb36U0Jqi1CUrdZTgMB?=
 =?us-ascii?Q?nCAbOkIGOHQzR2NsgxwNTgY5z069x7Mm2B041RuKsp/G6/0h1dqwv5x5xqb6?=
 =?us-ascii?Q?hOSExA1UXH0O8mgL4D0PbuwxnlAI0/Izq5U9B+kS+Cz/63meqRi8FjSpRVMa?=
 =?us-ascii?Q?9RXgIaK06ysHgxhDc9USZIwVjPDebI0px+sFxvMJ4jmU8kvohnzlJiObUCzm?=
 =?us-ascii?Q?WsHp3kyML8auUuFKdjWJEVT4qxMRLKiBcUEiNhzVI+OkqgsuXKX8TCVU5JmC?=
 =?us-ascii?Q?byn3GC1oK/GOZvLGCPWdJ4QkawLO871CRrAuTX74SnRnlW4o0LxjeUD34vZu?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1dc4bf-f7fe-46ec-6747-08dd7b43fa30
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:03:24.8621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q02ml7fSnb1NU5C8URAilnBJ8HFt7f48bIdZR4QojKbOvKXuXWj1+slrEa5HBDNSrNKS1dUzKDOJW08toArWLE8XDdb92/wvpelEWZMbiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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

On Thu, Apr 10, 2025 at 03:49:00PM -0700, Lucas De Marchi wrote:
> All users are converted to igt_kmod_{unbind,bind,rebind}, so drop this
> implementation.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/igt_sysfs.c | 50 --------------------------------------------------
>  lib/igt_sysfs.h |  8 --------
>  2 files changed, 58 deletions(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index a76af54eb..bc68cf61b 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1479,56 +1479,6 @@ int xe_sysfs_get_num_tiles(int xe_device)
>  	return num_tiles;
>  }
>  
> -/**
> - * xe_sysfs_driver_do:
> - * @xe_device: fd of the device
> - * @pci_slot: PCI slot of the device
> - * @action: the action to perform through sysfs on the driver
> - *
> - * Use sysfs to perform an action on the driver.
> - *
> - * Returns: fd of the device, which renewed if needed
> - */
> -int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action)
> -{
> -	int sysfs;
> -
> -	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
> -	igt_assert(sysfs);
> -
> -	switch(action) {
> -	case XE_SYSFS_DRIVER_BIND:
> -		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> -		close(sysfs);
> -		break;
> -	case XE_SYSFS_DRIVER_TRY_BIND:
> -		igt_sysfs_set(sysfs, "bind", pci_slot);
> -		close(sysfs);
> -		break;
> -	case XE_SYSFS_DRIVER_REBIND:
> -		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
> -
> -		/*
> -		 * We need to close the client for a proper release, before
> -		 * binding back again.
> -		 */
> -		close(xe_device);
> -
> -		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
> -		close(sysfs);
> -
> -		/* Renew the client connection */
> -		xe_device = drm_open_driver(DRIVER_XE);
> -		igt_assert(xe_device);
> -
> -		break;
> -	default:
> -		igt_assert(!"missing");
> -	}
> -
> -	return xe_device;
> -}
> -
>  /**
>   * xe_sysfs_engine_class_get_property
>   * @xe_device: fd of the device
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 5bc733168..265f77d4d 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -183,14 +183,6 @@ int xe_sysfs_get_num_tiles(int xe_device);
>  char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
>  int xe_sysfs_engine_open(int xe_device, int gt, int class);
>  
> -enum xe_sysfs_driver_action {
> -	XE_SYSFS_DRIVER_BIND,
> -	XE_SYSFS_DRIVER_TRY_BIND,
> -	XE_SYSFS_DRIVER_REBIND,
> -};
> -
> -int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action);
> -
>  bool xe_sysfs_engine_class_get_property(int xe_device, int gt, uint16_t class, const char *property,
>  					uint32_t *value);
>  bool xe_sysfs_engine_class_set_property(int xe_device, int gt, uint16_t class, const char *property,
> 
> -- 
> 2.49.0
> 
