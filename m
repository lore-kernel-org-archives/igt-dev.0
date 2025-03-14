Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F26C35FF1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0003110EA00;
	Fri, 14 Mar 2025 14:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfHSIZOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417B910EA00
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741963577; x=1773499577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h+GlBOyIOhTQzI5Qt4VNUJgFVvEiSaWHEvXppf/h8Wg=;
 b=HfHSIZOx5oToLnuPVd6z/dNWh3AlVT/40sverecdB4cmJM4blhaNfmlS
 HwYQIrGcG3JVb08Lx6VvrQtYtIU2b0w9PM309+BFurPAkVO/hUTa2gHqk
 zRvr5A2gpfRFtW59FkW+99/71o5GbbjxhLqjdXhkbaoJObtfP0hwaf2qt
 QvhKJ3GXhE5gmsT2KNETSuNJlIBM2T1tAjZAlRFpcWYBu9F0hO5iLfx1m
 NFmObGuulfRRXNVCwShZl3wZ7mTx/3s08SJrhA5AfOurlVJ4UvsvgULtI
 M+x98MbOr13x96BFKwFivJlapSfEZNSMNysDs0gH7Pdu4aLc/rJ/spKzT w==;
X-CSE-ConnectionGUID: 8+2UkJO3TGSi+RcUyBOvXQ==
X-CSE-MsgGUID: 276CMBJPSy27vnjmaEb2kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="42981339"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="42981339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:46:16 -0700
X-CSE-ConnectionGUID: GCx5HZHDSVy3xXRqwd3oqg==
X-CSE-MsgGUID: fy1U4cD3RSqK4CKJf37XfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="158452910"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:46:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 07:46:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 07:46:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 07:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiF61x58//Fsff/dNkh7sSWxkSBIx9PmLqQv3MzI1Rxi8HuuIOUBrcGKdKwxl2T30p7R9XQVL86LXEGiQ0ezlaLSlz+mbIpJHQBbcnmlaE0fHAEWDcksCXMiBzU+XNkKTL395EE0U3qHJk7KgV3wksYpNcFhkHkeX0XzDaMXvnD+pBTGAdRfmZCH8pYxae4DYVAUIRQWsWcd8pV/46PUwG84DgYwzJekZGcrPkNDrdUIHtz9lTwVXgLDmEnzLHach2ob2WQmTiuyscjhcXw4jvT64ttJnBrZvMbNGd4yxUjib00XGLs1kz9a4T+1voS6jQ7bYAF+0NZUI0nGf+HGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eONSv8OPoiGclTRepbj4TxSURCDwLTeyMWwDzGyx34w=;
 b=aa95xw0t47ruopIhfDsFsrRfWiDHFf10Fg1tLBKUhPgPLm7vrReY1UG7jnYR/J07iw/OBuNnLh15/FV5UOELcainFO6tjD4A4ZYiaFcC3CE/4kcgzwlRP9HYuoIEbEWP+ItV5lgBzlR5ZyDTdhuaimR8RrBvvyZmAG8Bl8Bs2TAyL97Rt+0GG90w8Tl2DcJ5iLtV9NsyZq8rL780WGME+FSxn64lDslk0C8KAQk3CoX4eVwkKcOG0+kk+jc2mBqbzn8BCMtQGrbdR5jwNom51pvHXZJzIN55bs/s/0hz+ruCl67pGIt6Bhptg5CV/RdSr3eB/0oZI9JdDXP54oGFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 14:46:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 14:46:14 +0000
Date: Fri, 14 Mar 2025 09:46:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/igt_sysfs: Remove XE_SYSFS_DRIVER_UNBIND
Message-ID: <ymljpacghshws4qbudrqmpp55sssjxggqevubeavimavqzgshn@575dnsxfj5d3>
X-Patchwork-Hint: comment
References: <20250314095701.581686-1-francois.dugast@intel.com>
 <20250314095701.581686-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250314095701.581686-3-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aeedd5b-2c63-4ab0-6392-08dd6306f820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EsS5TWiA7wn1+IiE3OfAMZ17VKpBWPW6WhrS/7dvn4xnlkKp7w5Kn8u//dQb?=
 =?us-ascii?Q?qYB8D8to7uKRrMJr20FDFp81241XJpn4Jxd7q3lsGGmbTTLiO2hg+4OPVLTG?=
 =?us-ascii?Q?Acc+7PQVOiTMd2bBs9zpjtI3lRKxcRkdHw9jhCa3fE0O6gE5ge5KX9wdVOXL?=
 =?us-ascii?Q?azo1TZNCuBnOBxZqvYjsmEdG/mojRjQ1JfXQw8E1qk3qDDe6nZxvutMSJZIT?=
 =?us-ascii?Q?OYJYndtncU0BBu670dZBgy1M3SMFOi4KBOD4ACRuKPGsrWTXGAte8vAv7gKE?=
 =?us-ascii?Q?RGo9/NPkuBiBUQtlTPM2nVXaC06ZhbJdstGFdGLfVjZs73EnrkHYFUc371mY?=
 =?us-ascii?Q?JD2pPqYsJmSlEmZGkPeIsRqrwEnmP7O00ziexFnfbPVjIuPdwORwCLiydecG?=
 =?us-ascii?Q?pFkpiEuQcMbXDUh3B3rxsJFJ8a6Z/ot5WtzloBXJhfGEc3D1k+6SeEtiGflA?=
 =?us-ascii?Q?TWEBpE9zDhwDN7e1+b6cACdWfJAg2O7U/nUxgu96gEDWF0zFBsLSFDuYgmjW?=
 =?us-ascii?Q?DVI3oMKfAs1WVmdcrbXR6t4x57U8FtEm9xRB6J10B8XHQLoZC5qugtty0PF3?=
 =?us-ascii?Q?6fQinvY94jn/2XLXAYXjsYiqCOzPrwOeC8aDBTf3YMuc+MZgsj9Bejku+Y+r?=
 =?us-ascii?Q?eB4+BtiKJvDBSIY9jvAdRF8nfuAr3jGtFR5hyd3nL2o8j66SZlVznaZIXPJ6?=
 =?us-ascii?Q?smq4pZWag0FxOdKj7ILad72sgqpA/nB6kNHFF9FRKosv9dhblWjxdOn/YvBF?=
 =?us-ascii?Q?FCUQBRgYgL/7dUSywQwmSoCCCPZHpoEhS02zt8r3LL/1vKeCNjXTlQgzSbmd?=
 =?us-ascii?Q?MbEntq5P7lF5PAHf05kgrGK/L/nu3Yg5sw7Buz6o1WOCX36ZILqPzPrQkACz?=
 =?us-ascii?Q?gLEmaPfADSra3CGvRY9cLGUEIuMqd+v711aIZYyh2ZDoNrFz0aeqEBuHlw1Z?=
 =?us-ascii?Q?3Fe0rFAjKH3Qd0pfA7h9lmHhE+MZZ3WOJLsCQ9jdjir7FEZcHB5WE58+pUWX?=
 =?us-ascii?Q?fZQXfxcPE4lHsD6QsN5SjL10mqpaUYTbo1pL9/JNpDIck+f5lw1+7BE9mAKG?=
 =?us-ascii?Q?zKwaCCfvHTMT/td+kPbgiYuLrFfLmzVZt1o0Cx3WEmR64CmiFpi1AbGcGVls?=
 =?us-ascii?Q?r7wKwxWCIcZkU7YX7Vy54lTWnPBP4ij2txQ5EagPanyktX14wCGaEPYKPVF8?=
 =?us-ascii?Q?Eq68Gn8kWc3Lagmr6g3XnuYxdoM2EDONFXsIF1K94linRQ02wz3Kk4wLYVxh?=
 =?us-ascii?Q?SI9Alo58/UKKZn8tjliBJ1ulVsiKPrvds7YV8cSE6aKF60WkoXhU5zuPt1wq?=
 =?us-ascii?Q?v4lhbF6Ni1CGl68VsouyG0xdR0CNkV3OCuxuhsCWZkPqjhOVaChNWD9/KUpo?=
 =?us-ascii?Q?KnXJ/cCr5zY25clPMjXSr2Wwh2oT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mYxxFI8eqZZCNqeiP4Oc+W9RTQhEpILx+lxkmQHmXruqNPFRR2L17lGSqVdn?=
 =?us-ascii?Q?/xpZ3AiKv8xMfoNu3M9bahq+iC/xVPqu0CH+Ki1N++ASaYI8dMMNh/2BvEqD?=
 =?us-ascii?Q?x+kCGKr+G664pgD8XgVAryvclbyyagNFv8nVMbcWyN7rX4RuGoRsT49rPgLw?=
 =?us-ascii?Q?zw48PGn8n7hcJffHPk5NpqgMwqpu0i+G74RrsjwLWnX3wvofzuEn4mvxOAgl?=
 =?us-ascii?Q?D8vTi7OYJJmqbLRMiBReSJfA44D3vmX5gjOgMWHng1aD6DmXrixiSBpBIVYO?=
 =?us-ascii?Q?a/GRgCTRgKQvijRnaFsZJhEcN9IHKG3nrpeUH2QkKSXfW5LNcVYTDtF1nbc9?=
 =?us-ascii?Q?vURfm03ALjMf4WDzSEHVdmoh3O8qOvIiUiTostZfu1lOOyn/q/fAOJB2F+Km?=
 =?us-ascii?Q?LdEdOkD8OCy0GuwXQEQ6T2M/zs5bf9hxvCeDBomfyPxVMJ4oX0q4AmWb5IcB?=
 =?us-ascii?Q?u/HuaSrwU8E+3Ni+YULde+it/E5/CnXWLL0OmOKm/3MC3lQsF18zmcc78MZy?=
 =?us-ascii?Q?9pY0PIkgKP5x6OxGuk/t+ixRsCpKUqLgBtH9EFIJrTdWUsu389dvEcaP2642?=
 =?us-ascii?Q?BJPNZhFhEGBYnFnw5TgkPYxkHm33zBCoaIY6RP5pxrCfDJdinMI67j+wByRM?=
 =?us-ascii?Q?zGM3AwphSPQxRb1cbfl9cgVWoCYFZsQV1AaPgJJdnaeXvGXCHKwVe79jMJaY?=
 =?us-ascii?Q?AOxa2kH8nNALtdF8o5XUdsq/o4gb03Cc4XJR6d0vVE9SVoaW1NaxX4jy6leC?=
 =?us-ascii?Q?dzvtoYLfaWEIWbOK/c9oirJ9V6uXsF89YA/tNbs93aVA4CzYsWWs9EkFY+V9?=
 =?us-ascii?Q?MimTCy881PCdrEowBn6DH+guQQ7klmbZcMy0UM+Xdtb91he9t52LREM6HWuq?=
 =?us-ascii?Q?btAVFn0BTEYi+WruKFmm+Odk+ya8BHMPCLrO1Jrn4o6T3c3D1BHoic1DLQqT?=
 =?us-ascii?Q?8ZDQtEZrAaFWOm7iwGURAliwVF5EugKB2SaDJAC2g9Mrkf2YlEliCvN/yVar?=
 =?us-ascii?Q?d7wHGJ/GJllzbwkO78fUPxh0DoKy9xn9j7LrsYw3CFH155f4MHqyRbuRKiaj?=
 =?us-ascii?Q?tVofgjKNaJSP2EsLOf8k+Z80pTqo8dfuAgb6h9lJs8VGRHlTBpMqtRNTo8i9?=
 =?us-ascii?Q?FpAXKXKnqUu/DF66fqi26RH19+2Gx7FxZ22HAtheMXE/eL6mogXCwqjMd5VS?=
 =?us-ascii?Q?/8mWYhGVfLpvG03HQ1jQehV1Z85MDHBgTmKk+ODyVZTqnq9jold1a0MKC87z?=
 =?us-ascii?Q?6nw8HWggYshkeAlrp3oL33BOX3GSioP+3nGY2/op0+AtPtsx7KKzY78Ww8bE?=
 =?us-ascii?Q?Wpgd6MzTO6QMEy02w/WhDa/Uy9KG1ogALI3WhvPXE9ZKh8ryEzL+FS4ikrvw?=
 =?us-ascii?Q?ipCgbyPhhabrAWpEY1BHeDjpyO2iYXIRGtwQOrJwXF9G4J/UGlCSWp8YIrtb?=
 =?us-ascii?Q?MRUc0TSXJt6yYefiywBo8ZR69LfFGoX2i4Qe+Jh/sOX6nkOb69EjZzDzj1z2?=
 =?us-ascii?Q?p26bo5ncDKwn9XqOxBslwatcELcWTqrohwpM7Bvvu/Ea4ngViENFoiOKrUyZ?=
 =?us-ascii?Q?tOBNJSiwbcTpkA98YF+edr5Oll99vTBoUwoU6nTp4OfgoM5V4v/0EAD7j4rf?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeedd5b-2c63-4ab0-6392-08dd6306f820
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 14:46:14.2451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJSCU8sd1FgYlkrKBAqeOJUl9Quw1m7sKZZaS6EoFtB9TjjPmpFw0vb82mvdaGnVT5iW1qJ3Z8KbdRjAI275Y/m1zQE/W/uzAON8fBXvjcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
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

On Fri, Mar 14, 2025 at 10:55:05AM +0100, Francois Dugast wrote:
>xe_sysfs_driver_do() will be removed. The XE_SYSFS_DRIVER_UNBIND can
>already be removed because a proper alternative is already in place,
>so use it.
>
>Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> lib/igt_sysfs.c                  | 4 ----
> lib/igt_sysfs.h                  | 1 -
> tests/intel/xe_fault_injection.c | 2 +-
> 3 files changed, 1 insertion(+), 6 deletions(-)
>
>diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>index 2e4c2ee63..a76af54eb 100644
>--- a/lib/igt_sysfs.c
>+++ b/lib/igt_sysfs.c
>@@ -1505,10 +1505,6 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
> 		igt_sysfs_set(sysfs, "bind", pci_slot);
> 		close(sysfs);
> 		break;
>-	case XE_SYSFS_DRIVER_UNBIND:
>-		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
>-		close(sysfs);
>-		break;
> 	case XE_SYSFS_DRIVER_REBIND:
> 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
>
>diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
>index 86345f3d1..5bc733168 100644
>--- a/lib/igt_sysfs.h
>+++ b/lib/igt_sysfs.h
>@@ -186,7 +186,6 @@ int xe_sysfs_engine_open(int xe_device, int gt, int class);
> enum xe_sysfs_driver_action {
> 	XE_SYSFS_DRIVER_BIND,
> 	XE_SYSFS_DRIVER_TRY_BIND,
>-	XE_SYSFS_DRIVER_UNBIND,
> 	XE_SYSFS_DRIVER_REBIND,
> };
>
>diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>index 5409d19a6..6307e0277 100644
>--- a/tests/intel/xe_fault_injection.c
>+++ b/tests/intel/xe_fault_injection.c
>@@ -394,7 +394,7 @@ igt_main
> 					exec_queue_create_fail(fd, hwe, s->name, s->flags);
>
> 	igt_fixture {
>-		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>+		igt_kmod_unbind("xe", pci_slot);

I think this was wrong before... for this test we don't want to unbind
with the fd still open. So this should be:

		drm_close_driver(fd);
		igt_kmod_unbind("xe", pci_slot);

But also, I'm not sure what happens with these 3 fixtures we
have in this test. When are they executed?

Lucas De Marchi
