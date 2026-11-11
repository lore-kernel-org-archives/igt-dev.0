Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB55606A339
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fasHjwx7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898CC10FC0E;
	Wed, 11 Nov 2026 19:25:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4799510E32D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794425039; x=1825961039;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fahMEf+H6d4dHOhryK8QE4TJJnth9ag0H0OfyEPegHY=;
 b=fasHjwx7fp4Npd1E5pKRmUMTK1sY1T2f+7Fue+ra3S3E3qz4uDspaiAR
 fRTf6dVYWDxYVAGrfEyWk6evsCV5kKuYPmMSE3UJwKDhpcxnRnG64WpWB
 fJWmS6Ee29ZDesYXsp+ElgHXXns4Isyjij8JF/IkJT18U96j0nxyekQko
 OSe8JBnekJ0cExNlJ0uXx5mc52eViH9D6A1VA493ZrSIpyt7RrO4QYwHH
 zQcEnoAQpNSKJO02nMqA9Ij0lIAWr3+iUl2RagB1qPDeKm3Z60gyxl9aa
 y+ohLgzlZn9EXPQJHAFD0nJHn5yk91aalhGHw0AEApyExX0x0Gv7sduKn Q==;
X-CSE-ConnectionGUID: zLH8DHXARxOGO7/hj7F7iQ==
X-CSE-MsgGUID: jOQfLwx1QgeCsAcUAZTCSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3198013"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3198013"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:23:59 -0800
X-CSE-ConnectionGUID: Qye94fS6Q4KHFVZkNpbOEA==
X-CSE-MsgGUID: v3qdiuNDSRKYT/zRIwPjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8564950"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 11:23:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:23:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 11:23:57 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 11:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvK7IDOU2FoLhEfCoHWWGM0G+213CTCaBlxe3hHPt5x56OFj1UzrCeVOCFzM5LFLRJlJ8GuCarz0BA5IPu24tu64ulAhQQF/wBXIzwOKnteLUWQTbdcGiM53RAyU6rysJGvB11sLDtX/4u03spUNTwSFIR3CtQsWUIaI+rH7cWR1F661DCSySU/ro4EcQ9VY4POZI/Nd2piDPLJDgrVdfO4fQcLL+czdpRWvqdaxeLt/F4IzV+PSWwx4745mxSjwZIka3fFmHQTNzZfdX/bNX83VW+BWVC3/Eu4PJQbOW6+7RAFNXovUf48SiiZaW31griGBgqj5Tz8HaDo+MA4YYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8YtJCULnoczHq7zys53PaG1cxFGkvqzF1x6niqpqBc=;
 b=Vgj0HJzDViqq6oI/eH31u2Wqyym14Anz0nIw01qOZMOoKEfl3K+MJF9Q2CqLlOWgcB8PKHRq8QH3T3V7tPUtJHEAK8YDOeELW72fNKhV1ndi0sSKL0Waps7hJf1KJppbvHrTOjC20uI5HTG7bhFklc0YFFRy/M+7IMY5K9VA0ngf2gwyEIR8EaB7JDIeP7Jq1KWOXv0asj9qNe7CjLQ7NRmAuI6GDK4zKZWS3dbukABJ/GeWkmuV6bsxIYcS3W6jc54vLXi0kk/2qbp/RDdDaxbTZ1AkOV74nnvM+XUo7pFuYczzkcCqutQ4Exl1cE/K9AhK4As7xGo5WIHaDc4kCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:23:55 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 19:23:53 +0000
Date: Wed, 11 Nov 2026 14:23:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <frank.scarbrough@intel.com>,
 <david.e.box@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] test/intel/xe_pmt: Support CRI PMT
Message-ID: <avTAwlIEjX8DgDDS@intel.com>
References: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
 <20261028200500.4005780-6-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261028200500.4005780-6-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b2df1a-f7d1-4dec-b726-08df40295244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|261009223027099003|4143699003|261021121427099003|11063799006|261102123227099003|56012099006|261028144727099003|261022105027099003|261022075727099003|10067099003|261026140227099003|261026121527099003|261022115727099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: Y/eKvlndr6aig+zI8v35d8nrr70lOqueHEOJU9/LkOpPkQ7QSldVcJwtTHka0BXKw8fzrr6nZOJrUAUd72sUI7reXFBSF0mDXXIaPiZEQl9w3Y4JMlB+3zzMjTIQFGJVDljifsYxXiG4E3O4Fyqo7dCFABuMed/Dt3pwSQpQ3JKYiRWTI43H7ZnG4pH/be90Kf29F2aerBONadvt1dh6DqPHnOn7DApuodQhFXo4DpohWCfpO6FFsbyhbDHWMXfMGvW0fDiFbW9bHQR5xlwoQ9Ts8q75bTP89FZM1F3R3vAvvjTw+UeBHMLzfLzUYCgv5h2tQf5PwBmE9Gg0WFYn/e6RcVvtL3OLNaSVYCoRdXmezo0IN47JLllO5uaOuCAG4cDcknYLor1VflgPgsknhJ2E/EDqJD/Wh+3We/YPugVSYUuGcY8LU0LFkjkqZOfvPZn8ptnSVyKa78uQsf3kDhP7l4d2k+pC1Q3JxmXHd6T1HzWkZwbktxWH8M4Yqjg48GOdTEWbwvPw8a/NkSdlByrGn3HM81gM2oLg996BnCeQ73LP3FWRiylSxpGXrB4rBjVA2uRkTlsqJHm4eMJCGy2L28QJg/TVdBHwBJXNKJAM2MQngrBBS0fuoH4mcBW3l0G+T+d605zPbM/9PJGpFTFQVwoJtEHz2CU6amUMyPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(261021121427099003)(11063799006)(261102123227099003)(56012099006)(261028144727099003)(261022105027099003)(261022075727099003)(10067099003)(261026140227099003)(261026121527099003)(261022115727099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHrTQ2V0l8XbVOd/cUl37LF/1bYvBTfKYBOAN4/jgN1QJuCDzPIUI+wgzX3M?=
 =?us-ascii?Q?lsAI+SlQImn1RhuGeiJOt/TuBCwjnaQ2FnhYdydSXfU3cZzuvsyfSGg5bgGr?=
 =?us-ascii?Q?zq4dxMfaSAsWbdo1EikPCGXp9nfxssLyQo5Rw2ZBbnbcENVn2Criq8TXAiNe?=
 =?us-ascii?Q?jQJ1zoSGHD6ErWgio0djrbrpp5W3wrllf1uOlWtPJCE8O4DjsnP77EPaxlUf?=
 =?us-ascii?Q?R85XtQ/S2aqXeoXi7+UnDOXRWSF/hnMG7YDQx7Eo1aPpkwNHB3Btiqc+05NS?=
 =?us-ascii?Q?ECQ7j15h0Fwh3ngBX+JrVvCe+GHWI1pvv4rSMg0SwwDEYyyL5aPICRBNTVKV?=
 =?us-ascii?Q?PUgUBfeouK5AM5lA0/8pdn4GR6jpLYX9iV27KkQjdf8LwKJ2ZOLWdQHstEl1?=
 =?us-ascii?Q?QfahA+vs9yVT3w5Mo/cqU1YRQHLiKexnghkI2+m9TOAuXW5Y+Vpw7oMedsWC?=
 =?us-ascii?Q?qKZVk4sHR4i4EufK4ZrszDZYjfflqe231Il6q4T73an1Zt/s+SDuC4kfumlZ?=
 =?us-ascii?Q?DQ1nEcdtsZNC6dR/APGlqyHKoRt2uH2atT+n5yrKmfXh5wJJNv4KVENuQnrJ?=
 =?us-ascii?Q?Ex5vzTGVmqArZQziPULbv/nGBcRJOvzKYOTKWP0XyYJDk7P0OqMlMlXOCDFQ?=
 =?us-ascii?Q?M4pqlb9DOpM4R7YBPmqJP4cwsRIMwVO7YEyQDAW5FOwqkC4vJjKxe0Nr4CEm?=
 =?us-ascii?Q?HFuHNPdyMez9tsw9KHat9HrVSezS50vajsrQ84YbWeSj7jqcig7MOb8kY6RA?=
 =?us-ascii?Q?5+LtfDG3mxbhZ2VdAv7xY4V3s1ZLmXzyJg+uAd8wffL2eVw3MExy90OxYLdW?=
 =?us-ascii?Q?/o6ZhGmN75L1YjnFkiD7xDvwb1Qre6GP6wyYZzHp8R0XoRByoWflsgOW15n4?=
 =?us-ascii?Q?jOWCObTGwjrQIKdGH5iTtvySZbGdwVTjJ1wVKJql01dylNwK5a9AexbCVzDP?=
 =?us-ascii?Q?PnYU/W9bbhDJX+0soV2Bo9nwey05VkK2fYolzfZofAZ6bKfoydHSDiz2LM6B?=
 =?us-ascii?Q?zCQ2/8iI/zOuBbXZwdFaYgkYF4tgn/fpMiQeTuNbdf2GQakXK3FYAper3BG3?=
 =?us-ascii?Q?gBMnIFNUwsyydQ9WiGF8TVUkK0+KHO400WWiIbl75OfMWGEoYYH3N2FLwlMP?=
 =?us-ascii?Q?PeAmQgyWt/lwiPRfsLSdrE6s8k0IERCFGw1nDkMOXL3s3cgmz/lDqybSo5DM?=
 =?us-ascii?Q?MeCs7gFhSqIH2ORioCIszCbbqkvGKFva6ybkq5MqVGDiAiHG9+xaAnwETiMv?=
 =?us-ascii?Q?IBJa8qqcHgpoaF32ksQt5LKOJ978q7WKb1K0+un00fYp2XpWKbEIuku3j06p?=
 =?us-ascii?Q?dHskFqxJHwN9ZtvRE3tSbYAFjLDb6Dg9ZpaPH6/sBc1Ig+ZemVgGOkwLeaWz?=
 =?us-ascii?Q?Xp7i3MpR0b7J85Hb7gzo2MrU3GTwa/3py0Lz69/mSkRmDi/9+OBw5Y3LPfIZ?=
 =?us-ascii?Q?/YJD/9ajkg8i1vwRcUbaTiqy8pmTaBhm7NwDzf+0LLwFxCcymOwPUWE6NhGW?=
 =?us-ascii?Q?hU6hsd0cTWwJufeixhVRMMcfpDvPW941oBNYenaH/PaHcK36jD+/aGhZ8Tb1?=
 =?us-ascii?Q?WivAExGSRD7pqJdVW1SHpad/wib/aU8ZVw2ubjUrmKNMweHW30E/Q11bBALy?=
 =?us-ascii?Q?bgClFIatby2QluREQ9uFXbbV/91GbQjPPnhXV/gVb0QF0VVGCMY096Nc7nAc?=
 =?us-ascii?Q?9FPh7XNStVGDtE1ApH79e4ixK0ob7RcctK8R84xK2W7l9fOn11MzJPHSeSzM?=
 =?us-ascii?Q?5NzMuISeKA=3D=3D?=
X-Exchange-RoutingPolicyChecked: ivelNnk4jBtKD1pQfjwnJRyB/MNtStnYj19j0ItWelFfmerAByw5Y4IvKK3X9Tk6prXEvtACJQIBDQbnwDyxze+xkF2yd5ycHbPWPBmf0lywdssbGHvJvaP5BLZIK8XzA7FEt3tfikp8Th0Zl28UKeNEYSi6rRs4tgz3HAP/LYum1Pn5HrWfyzwU4eCwT6SX8aqdKHQIYkkNUbbg8pazz9RX14dqu4KrhKIYLBFpcp4reOdg2vmet6a2RL5rE33WPBoXE4ZFi9B/PeZnc3yAViFaG+sFNu1+KymSkjFx8HEvL3QTVrs2ZxZpuncFYHfk0it6R5V9nxVIWm4pRG+1mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b2df1a-f7d1-4dec-b726-08df40295244
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:23:53.4808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vccl67UIrp5ryS1Id5Rvh8S4MV+faVGgMkDQeEseA0PVugbj94yLoX7ZtCcOexuBqIxaV+hFQcm4+uUVJaT5Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:05:02PM -0700, Michael J. Ruhl wrote:
> Crescent Island (CRI) devices have the Platform Monitoring
> Technology (PMT) support for the telemetry and crashlog
> (type 1/version2) functions.
> 
> Add test support for the device.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  tests/intel/xe_pmt.c | 259 ++++++++++++++++++++++++++++---------------
>  1 file changed, 171 insertions(+), 88 deletions(-)
> 
> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
> index af5d470b5..ebd3fe3f6 100644
> --- a/tests/intel/xe_pmt.c
> +++ b/tests/intel/xe_pmt.c
> @@ -8,6 +8,7 @@
>  #include <fcntl.h>
>  #include <limits.h>
>  #include <string.h>
> +#include <linux/limits.h>
>  
>  #include "igt.h"
>  #include "igt_sysfs.h"
> @@ -25,9 +26,9 @@
>   * Description: Verify that the available PMT files (crashlog and telemetry)
>   *   are created, are accessable, and respond as per design.
>   *
> - * SUBTEST: pmt-bmg-all
> + * SUBTEST: pmt-api
>   * Description:
> - *   Exercise the BMG PMT feature
> + *   Verify that the correct PMT sysfs file exist and verify access
>   *
>   */
>  
> @@ -40,16 +41,34 @@ IGT_TEST_DESCRIPTION("Verify Platform Monitoring Technology (PMT) files operatio
>  #define TELEMETRY_DIR "telem"
>  
>  /* itemize the available instances for the specific device */
> -enum bmg_crashlog_instances {
> -	bmg_crashlog_punit = 0,
> -	bmg_crashlog_oobmsm,
> -	bmg_crashlog_max
> +enum pmt_device {
> +	PMT_DEVICE_BMG,
> +	PMT_DEVICE_CRI,
>  };
>  
> -enum bmg_telemety_instances {
> -	bmg_telemetry_punit = 0,
> -	bmg_telemetry_oobmsm,
> -	bmg_telemetry_max
> +struct pmt_device_info {
> +	uint32_t max_crashlog;
> +	uint32_t max_telem;
> +};
> +
> +#define BMG_CRASHLOG_MAX	(2)
> +#define BMG_TELEM_MAX		(2)
> +
> +#define CRI_CRASHLOG_MAX	(2)
> +#define CRI_TELEM_MAX		(3)
> +
> +#define CRASHLOG_MAX		CRI_CRASHLOG_MAX
> +#define TELEM_MAX		CRI_TELEM_MAX
> +
> +struct pmt_device_info device_info[] = {
> +	[PMT_DEVICE_BMG] = {
> +		.max_crashlog = BMG_CRASHLOG_MAX,
> +		.max_telem = BMG_TELEM_MAX,
> +	},
> +	[PMT_DEVICE_CRI] = {
> +		.max_crashlog = CRI_CRASHLOG_MAX,
> +		.max_telem = CRI_TELEM_MAX,
> +	},
>  };
>  
>  static char dev_path[PATH_MAX];
> @@ -59,13 +78,18 @@ static char work_path[PATH_MAX * 2];
>   * In most case there should be a single instance of the crashlog and telemetry
>   * directories. If DVSEC entries are not contiguous the structure will be different,
>   * and the code will need to reflect the structure.
> + * vsec directory string size is sizeof(xxx_DIR) + idx.  For instance:
> + *    intel_vsec.crashlog.3
> + *    intel_vsec.telemetry.23
>   */
> -static char crashlog_vsec_dir[32];
> -static char telemetry_vsec_dir[32];
> +#define MAX_VSEC_DIR (32)
> +
> +static char crashlog_vsec_dir[MAX_VSEC_DIR];
> +static char telemetry_vsec_dir[MAX_VSEC_DIR];
>  
>  /* This needs to be specific for each supported device */
> -static char crashlog_dir[bmg_crashlog_max][32];
> -static char telemetry_dir[bmg_telemetry_max][32];
> +static char crashlog_dir[CRASHLOG_MAX][MAX_VSEC_DIR];
> +static char telemetry_dir[TELEM_MAX][MAX_VSEC_DIR];
>  
>  /* telemetry file names */
>  static const char *telem = "telem";
> @@ -90,7 +114,7 @@ struct crashlog_v2_info {
>  	int rearm_fd;
>  	int trigger_fd;
>  	u_int32_t guid;
> -} bmg_info[bmg_crashlog_max];
> +} crashlog_info[CRASHLOG_MAX];
>  
>  #define DEV_PATH_LEN 80
>  
> @@ -121,17 +145,22 @@ static char *device_sysfs_path(int fd, char *path)
>  /*
>   * Verify the PMT directory structure
>   *
> - * BMG PMT directory structure:
> + * BMG/CRI PMT directory structure:
>   *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>   *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>   *
>   * Note: different platforms could have a different pattern
>   */
> -static void test_pmt_directories(int dev_fd)
> +static void test_pmt_directories(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	struct dirent *ent;
> -	int index;
> +	uint32_t index;
>  	DIR *dir;
> +	uint32_t max_crashlog;
> +	uint32_t max_telem;
> +
> +	max_crashlog = device_info[pmt_dev].max_crashlog;
> +	max_telem = device_info[pmt_dev].max_telem;
>  
>  	igt_assert(device_sysfs_path(dev_fd, dev_path));
>  
> @@ -161,7 +190,7 @@ static void test_pmt_directories(int dev_fd)
>  	/* find the crashlog<x> directory instances */
>  	while ((ent = readdir(dir)) != NULL) {
>  		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
> -			if (index < bmg_crashlog_max)
> +			if (index < max_crashlog)
>  				strcpy(crashlog_dir[index], ent->d_name);
>  			index++;
>  		}
> @@ -169,8 +198,9 @@ static void test_pmt_directories(int dev_fd)
>  
>  	closedir(dir);
>  
> -	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
> -	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
> +	igt_assert_f(index == max_crashlog, "unexpected crashlog entries: %d  vs expected: %d\n",
> +		     index, max_crashlog);
> +	for (int i = 0; i < max_crashlog && i < ARRAY_SIZE(crashlog_dir); i++)
>  		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
>  
>  	/* verify telemetry directory structure */
> @@ -182,7 +212,7 @@ static void test_pmt_directories(int dev_fd)
>  	index = 0;
>  	while ((ent = readdir(dir)) != NULL) {
>  		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
> -			if (index < bmg_telemetry_max)
> +			if (index < max_telem)
>  				strcpy(telemetry_dir[index], ent->d_name);
>  			index++;
>  		}
> @@ -190,8 +220,9 @@ static void test_pmt_directories(int dev_fd)
>  
>  	closedir(dir);
>  
> -	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
> -	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
> +	igt_assert_f(index == max_telem, "unexpected telemetry entries: %d  vs expected: %d\n",
> +		     index, max_telem);
> +	for (int i = 0; i < max_telem && i < ARRAY_SIZE(telemetry_dir); i++)
>  		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
>  
>  }
> @@ -227,11 +258,11 @@ static void open_pmt_file(const char *path, const char *file, int *fd, int flags
>  /*
>   * verify that the expected telemetry file(s) are in place
>   */
> -static void test_pmt_telemetry_files(int dev_fd)
> +static void test_pmt_telemetry_files(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	int i;
>  
> -	for (i = 0; i < bmg_telemetry_max; i++) {
> +	for (i = 0; i < device_info[pmt_dev].max_telem; i++) {
>  		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
>  			"intel_pmt", telemetry_dir[i]);
>  		find_pmt_file(work_path, telem);
> @@ -241,7 +272,7 @@ static void test_pmt_telemetry_files(int dev_fd)
>  /*
>   * verify that a read will be successful
>   */
> -static void test_pmt_telemetry_read_data(int dev_fd)
> +static void test_pmt_telemetry_read_data(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	char buf[64] = {};
>  	u_int32_t *val;
> @@ -252,7 +283,7 @@ static void test_pmt_telemetry_read_data(int dev_fd)
>  	int len;
>  	int i;
>  
> -	for (i = 0; i < bmg_telemetry_max; i++) {
> +	for (i = 0; i < device_info[pmt_dev].max_telem; i++) {
>  		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
>  			"intel_pmt", telemetry_dir[i]);
>  		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
> @@ -278,29 +309,29 @@ static void test_pmt_telemetry_read_data(int dev_fd)
>  /*
>   * verify that the expected crashlog files are in place
>   */
> -static void test_pmt_crashlog_files(int dev_fd)
> +static void test_pmt_crashlog_files(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	char buf[64] = {};
>  	int ret;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
>  		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
>  			crashlog_dir[i]);
>  
> -		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
> -		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
> -		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
> -		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
> -		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
> -		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
> -		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
> -		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
> +		open_pmt_file(work_path, clear, &crashlog_info[i].clear_fd, O_RDONLY);
> +		open_pmt_file(work_path, consumed, &crashlog_info[i].consumed_fd, O_RDWR);
> +		open_pmt_file(work_path, crashlog, &crashlog_info[i].crashlog_fd, O_RDONLY);
> +		open_pmt_file(work_path, enable, &crashlog_info[i].enable_fd, O_RDWR);
> +		open_pmt_file(work_path, error, &crashlog_info[i].error_fd, O_RDONLY);
> +		open_pmt_file(work_path, dev_guid, &crashlog_info[i].guid_fd, O_RDONLY);
> +		open_pmt_file(work_path, rearm, &crashlog_info[i].rearm_fd, O_RDWR);
> +		open_pmt_file(work_path, trigger, &crashlog_info[i].trigger_fd, O_RDWR);
>  
> -		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
> +		ret = pread(crashlog_info[i].guid_fd, buf, sizeof(buf), 0);
>  		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
> -		bmg_info[i].guid = strtol(buf, NULL, 16);
> -		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
> +		crashlog_info[i].guid = strtol(buf, NULL, 16);
> +		igt_assert_f(crashlog_info[i].guid > 0, "failed to set guid for device %d\n", i);
>  	}
>  }
>  
> @@ -336,15 +367,15 @@ static bool verify_msg(int fd, const char *msg, const char *file) {
>  /*
>   * Set enable enable/disable bit and verify usage
>   */
> -static void test_pmt_crashlog_enable(int dev_fd)
> +static void test_pmt_crashlog_enable(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	u_int32_t guid;
>  	int fd;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		fd = bmg_info[i].enable_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		fd = crashlog_info[i].enable_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* force enable so we are in a known state */
>  		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
> @@ -365,14 +396,14 @@ static void test_pmt_crashlog_enable(int dev_fd)
>   * The error bit is set when a crashlog fails in HW.  It is read only so only
>   * need to verify that it is "0".
>   */
> -static void test_pmt_crashlog_error(int dev_fd)
> +static void test_pmt_crashlog_error(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	uint32_t guid;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		guid = bmg_info[i].guid;
> -		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error),
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		guid = crashlog_info[i].guid;
> +		igt_assert_f(verify_msg(crashlog_info[i].error_fd, DISABLE_MSG, error),
>  			     "0x%x: error clear\n", guid);
>  	}
>  }
> @@ -381,24 +412,65 @@ static void test_pmt_crashlog_error(int dev_fd)
>   * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
>   * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
>   */
> -static void test_pmt_crashlog_rearm(int dev_fd)
> +static void test_pmt_crashlog_rearm(int dev_fd, size_t pmt_dev)
>  {
>  	uint32_t guid;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		guid = bmg_info[i].guid;
> -		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm),
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		guid = crashlog_info[i].guid;
> +		igt_assert_f(verify_msg(crashlog_info[i].rearm_fd, ENABLE_MSG, rearm),
>  			     "0x%x: rearm set\n", guid);
>  	}
>  }
>  
> +/*
> + * Verify the crashlog data is in the initialized state
> + * 0xdeadbeef BMG PUINT/OOBMSM default, CRI PUNIT default
> + * 0xba0b6afe CRI OOBMSM default
> + */
> +static void test_pmt_crashlog_inited(int dev_fd, enum pmt_device pmt_dev)
> +{
> +	char buf[64] = {};
> +	u_int32_t guid;
> +	int crashlog_fd;
> +	int clear_fd;
> +	int *val;
> +	int len;
> +	int i;
> +
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		clear_fd = crashlog_info[i].clear_fd;
> +		crashlog_fd = crashlog_info[i].crashlog_fd;
> +		guid = crashlog_info[i].guid;
> +
> +		/* make sure the bit is clear */
> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> +
> +		len = read(crashlog_fd, buf, sizeof(buf));
> +		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
> +
> +		val = (int *)buf;
> +		igt_assert_f(*val == 0xdeadbeef || *val == 0xba0b6afe,
> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);

perhaps here it should be a igt_skip instead?

> +	}
> +}
> +
>  //#define PMT_CRASHLOG_TRIGGER_ENABLE 1
>  #if PMT_CRASHLOG_TRIGGER_ENABLE
> +/*
> + * Triggering a Crashlog requires a power cycle to return the device to a usable
> + * state.
> + * This is very disruptive and doesn't necessarily verify much more than the
> + * current set of tests.
> + * Commentting out the trigger, consumed, clear path for "normal" testing.
> + * Compile flag so these tests can be done expclity.
> + */
> +
>  /*
>   * Set the manual trigger bit and make sure the data is not 0xdeadbeef
>   */
> -static void test_pmt_crashlog_trigger(int dev_fd)
> +static void test_pmt_crashlog_trigger(int dev_fd, size_t pmt_dev)
>  {
>  	char buf[64] = {};
>  	u_int32_t *val;
> @@ -408,10 +480,10 @@ static void test_pmt_crashlog_trigger(int dev_fd)
>  	int len;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		crashlog_fd = bmg_info[i].crashlog_fd;
> -		trigger_fd = bmg_info[i].trigger_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		crashlog_fd = crashlog_info[i].crashlog_fd;
> +		trigger_fd = crashlog_info[i].trigger_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* make sure the bit is clear */
>  		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
> @@ -431,7 +503,8 @@ static void test_pmt_crashlog_trigger(int dev_fd)
>  
>  		val = (u_int32_t *)buf;
>  
> -		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
> +		igt_assert_f(*val != 0xdeadbeef && *val != 0xba0b6afe,
> +			     "0x%x: invalid trigger value: : 0x%x\n", guid, *val);
>  	}
>  }
>  
> @@ -439,15 +512,15 @@ static void test_pmt_crashlog_trigger(int dev_fd)
>   * After a crashlog has been "consumed" (read), setting this bit can be done.
>   * Verify that it is set correctly.
>   */
> -static void test_pmt_crashlog_consumed(int dev_fd)
> +static void test_pmt_crashlog_consumed(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	uint32_t guid;
>  	int fd;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		fd = bmg_info[i].consumed_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		fd = crashlog_info[i].consumed_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* check, set, verify */
>  		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
> @@ -460,12 +533,12 @@ static void test_pmt_crashlog_consumed(int dev_fd)
>  
>  /*
>   * Test the clear crashlog bit. After setting the crashlog data buffer should be
> - * set to 0xdeadbeef.
> + * set to 0xdeadbeef or 0xba0b6afe.
>   * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
>   * file is the "standard" usage, so test that usage.
>   * This bit cannot be cleared by software (i.e. reboot required).
>   */
> -static void test_pmt_crashlog_clear(int dev_fd)
> +static void test_pmt_crashlog_clear(int dev_fd, enum pmt_device pmt_dev)
>  {
>  	char buf[64] = {};
>  	u_int32_t guid;
> @@ -476,11 +549,11 @@ static void test_pmt_crashlog_clear(int dev_fd)
>  	int len;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
> -		clear_fd = bmg_info[i].clear_fd;
> -		crashlog_fd = bmg_info[i].crashlog_fd;
> -		trigger_fd = bmg_info[i].trigger_fd;
> -		guid = bmg_info[i].guid;
> +	for (i = 0; i < device_info[pmt_dev].max_crashlog; i++) {
> +		clear_fd = crashlog_info[i].clear_fd;
> +		crashlog_fd = crashlog_info[i].crashlog_fd;
> +		trigger_fd = crashlog_info[i].trigger_fd;
> +		guid = crashlog_info[i].guid;
>  
>  		/* make sure the bit is clear */
>  		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
> @@ -496,39 +569,45 @@ static void test_pmt_crashlog_clear(int dev_fd)
>  		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
>  
>  		val = (int *)buf;
> -		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
> +		igt_assert_f(*val == 0xdeadbeef || *val == 0xba0b6afe,
> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>  	}
>  }
>  #endif
>  
>  /**
> - * SUBTEST: pmt-bmg-all
> + * SUBTEST: pmt-api
>   * Description:
>   *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
>   *   individually unless you understand the underlying HW behavior.  Because of this behavior,
> - *   all of the test will be done in order in one step.
> + *   all of the test will be done in order in one sub-test.
> + *
> + *   Crashlog will cause the GPU to be in an un-useful state.  Reseting to recover
> + *   is not yet fully defined.
>   *   NOTE:
> + *     o PMT file info is accumulated from successful tests and is used in sequence
>   *     o Testing MUST be done after a cold reset
>   *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
>   *
>   *  Test category: functionality test
>   */
> -static void test_pmt_bmg(int fd)
> +static void test_pmt_api(int fd, enum pmt_device pmt_dev)
>  {
> -	test_pmt_directories(fd);
> +	test_pmt_directories(fd, pmt_dev);
>  
> -	test_pmt_telemetry_files(fd);
> -	test_pmt_telemetry_read_data(fd);
> +	test_pmt_telemetry_files(fd, pmt_dev);
> +	test_pmt_telemetry_read_data(fd, pmt_dev);
>  
> -	test_pmt_crashlog_files(fd);
> -	test_pmt_crashlog_error(fd);
> -	test_pmt_crashlog_enable(fd);
> -	test_pmt_crashlog_rearm(fd);
> +	test_pmt_crashlog_files(fd, pmt_dev);
> +	test_pmt_crashlog_error(fd, pmt_dev);
> +	test_pmt_crashlog_enable(fd, pmt_dev);
> +	test_pmt_crashlog_rearm(fd, pmt_dev);
> +	test_pmt_crashlog_inited(fd, pmt_dev);
>  
>  #if PMT_CRASHLOG_TRIGGER_ENABLE
> -	test_pmt_crashlog_trigger(fd);
> -	test_pmt_crashlog_consumed(fd);
> -	test_pmt_crashlog_clear(fd);
> +	test_pmt_crashlog_trigger(fd, pmt_dev);
> +	test_pmt_crashlog_consumed(fd, pmt_dev);
> +	test_pmt_crashlog_clear(fd, pmt_dev);
>  #endif
>  }
>  
> @@ -536,25 +615,29 @@ int igt_main()
>  {
>  	const struct {
>  		const char *name;
> -		void (*func)(int);
> +		void (*func)(int, enum pmt_device);
>  	} funcs[] = {
> -		{ "pmt-bmg-all", test_pmt_bmg },
> +		{ "pmt-api", test_pmt_api },
>  		{ }
>  	}, *f;
>  	int dev_fd;
> +	enum pmt_device pmt_dev;
>  
>  	igt_fixture() {
>  		uint16_t dev_id;
>  
>  		dev_fd = drm_open_driver(DRIVER_XE);
>  		dev_id = intel_get_drm_devid(dev_fd);
> -		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
> +		igt_require_f(IS_BATTLEMAGE(dev_id) || IS_CRESCENTISLAND(dev_id),
> +			      "PMT supported on BMG or CRI GPUs\n");
> +
> +		pmt_dev = IS_BATTLEMAGE(dev_id) ? PMT_DEVICE_BMG : PMT_DEVICE_CRI;
>  	}
>  
>  	igt_describe("PMT access and API testing");
>  	for (f = funcs; f->name; f++) {
>  		igt_subtest_f("%s", f->name)
> -			f->func(dev_fd);
> +			f->func(dev_fd, pmt_dev);
>  	}
>  
>  	igt_fixture()
> -- 
> 2.43.0
> 
