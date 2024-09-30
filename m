Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75D5CE835B
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 15:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B27D10E04D;
	Mon, 30 Sep 2024 15:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b81ZG1Yu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D303910E04D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727709136; x=1759245136;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QpaE47bXUzviAlx50Yc4yc+u7hWT8gYwNasloqmNsxQ=;
 b=b81ZG1YuOZUiqQordDF9UZaSvL1NKUcH025TXsfj59MG42DUhkXDVeKs
 7V9MXIgGdX//fcugA9wpMUQSR+GyTqDzk2k+IrqZP/9pHop2HwKewQDhm
 +rJAOEcXVHfYRQA20XSVdKrjGujr69sMbVtSyW4yimpW/mrIm4C4nBRy+
 aFBjzGAuPzWmSKr53R9Cmn6QIOdBAac/oqZ5xlOmjkbGFv5b1ofRnHCxu
 86qoJgW6UyFSQ8oyOWbYO+3OU+jY3lAjnB+7XLQBysCZfXCJ/25bTGqFw
 pu1ZQGDRrZke8wfbzE7QgtI7qR46lFiMWaupnE8iq6T04wDbmgfcTz/Wy g==;
X-CSE-ConnectionGUID: TWzRBLoQTLO5LMH/RBUjwA==
X-CSE-MsgGUID: gzZweHTSStuL1qcTXHCWPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26313771"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26313771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:12:14 -0700
X-CSE-ConnectionGUID: 8tJaGazdSGC+5t7pZgHNNA==
X-CSE-MsgGUID: ebm4t0+dQniPtDmEmXJUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="104137788"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 08:12:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:12:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 08:12:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 08:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ra+Ag0aShBfUY2EOXF92+c8cX9HCk8q6MTsgPkxJLjUuzocrWQ9L+BsGbh5APTwXrVPrGXhrim8nHlZR0JgqHao+tMOFRMMbbYBEPlWQZBCpeLMpRgB9Auo6LjZhEcA8Mkju2zcY6dNQWfTqOj0NzzCa0Wlt5Q4YmIF9bRl30mkZ5CXRiBwhRDbRuXmC/9ej2DJsYBKQjQSzkotMflHlEmkRbRa72PYTpE1Glv4kJIX6O5umjLgwQNZIc3R5OLF+Lzczm5Wvuuj8acqLZoh6LY2EuxW5jOL2vsJcs0fzwRBk6rDDq3cchU18Jwdu6pgvVfRSMmpmJzRkGWyZazqJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1E7bZfaqD+IyxtXylig9SX0Ut6FwgGoW+iB91WPtVTY=;
 b=bfDoCBqohu2P8mKtgEbKa948FlzYX9eDVt5HrJWCS9S0wkI+I0X9ur/XSVMKMbC5qr6qvSEESrNHCeTPoey7jcAAwJlfCAlakDVEGwYMl2MqgOFfX3uqKUysyL3pdptqIk5OaGA25Zz5oiA6jxZgmqwWzYoA+5h5i6HDcizLr1tr6689PC5jZV+SrvTBdLsV+aZ84IJW/J+VwcgkPdW6o2VrJ+GhDzw4SWzEU1V/ZOVOThdnafZp5tvt1NgGoLv7REm91PRTJlQEIn75Po7Le5lEgFgBTq15rAxXpYI+OYJG0c+l1Ffryq4ZXQNb/BEfyvcFdjBb1zTmJXiYZ8zmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 15:12:10 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 15:12:10 +0000
Date: Mon, 30 Sep 2024 11:12:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t, v4 2/2] tests/intel/xe_fault_injection: Add new
 test for fault injection
Message-ID: <Zvq_xd6A9Jueh-g1@intel.com>
References: <20240930141248.810483-1-francois.dugast@intel.com>
 <20240930141248.810483-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930141248.810483-3-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN0PR11MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: e77805d3-c870-42ef-ad95-08dce16240f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5np/R/INhFgznUvZIMetlcrg6qSmTun7siXVCl3o6v+qivebMGQcCWzXZO?=
 =?iso-8859-1?Q?tYHAThmB/UJqjQR5454RVBkAiaSrmL+qKiu/kvL2luTIQJPtVgWlORcPEP?=
 =?iso-8859-1?Q?+N11UDV7EqEnJVkWNSuVzFGQ8qWGCxZUb2MjjN0wjl8+qf7+OE8ZH+GBZW?=
 =?iso-8859-1?Q?KFDk3uKuTWIO1dvqE6yerDxyVnBw+dOE0aMqdtAh9m6m34Sm1ipQsx3UD5?=
 =?iso-8859-1?Q?kyPBLkGVdEJ04sTYPJhbS34OT4sGt5Yj89xbU2pPlBBmneNjni6dcojaTj?=
 =?iso-8859-1?Q?IUa77DqkxU5Q+I8hsCHc1SbAo87/30Frx31gTstuKWRBNBk1K5AwFrPe/J?=
 =?iso-8859-1?Q?T+o42Jxa+Qbd6okzAG8It/wJtI7h1YOYpPNv9LKkdoapGEqClv9c/gFLgd?=
 =?iso-8859-1?Q?S/I5B45hrkBdCKsRoBGV676VIphxdL69vtxiZolMwrP0sYZn/yafEjGLPj?=
 =?iso-8859-1?Q?0GgA7KtvAOHO0ORSrpR6k7CyS6/qMdmlg0u5F5wgwnhU/LZfHn19JfUisx?=
 =?iso-8859-1?Q?359NNbmTjkNgM9fN3FR4APHcxLpSnY49qdHth6PFjmukgAikbpJIwfYKfu?=
 =?iso-8859-1?Q?Glz5b5pWvZcPK+RGn3RcPtRO8uBKvehQwwtIv+8fjEcYON4Lsb9R8egixT?=
 =?iso-8859-1?Q?Y1f5CorkXu33sqhewx5Kefw127FtHKbSQLELBwtaUFOIF64sa4CwTcTk0D?=
 =?iso-8859-1?Q?6KozUjTqFNL5QYxWBr3HAXAUmaFne/ZWCmwmfCKNFBF+EDnHUTjf6U9Tiz?=
 =?iso-8859-1?Q?qYNpFfj9xyelph4v26TatcLzsOHnmu6o2iZAm0i9Bnj+0jqnyI2IEWIJgq?=
 =?iso-8859-1?Q?AeTvLT9+3P+9oIyKHvun44japnFvQOR7AeHf3R0mr5RqKnNFagnkFQPxlB?=
 =?iso-8859-1?Q?W0XF4+Oy4FxTz6PEkhwooAcVJJx3Pi0wE5In1SddPHIW9UHjck33LY7Qx4?=
 =?iso-8859-1?Q?GDLDmOHJL6at/eQX3d4hdcoqYsCEuXcJEBoVkNnF7I0ftrqdpJNXPTKtHt?=
 =?iso-8859-1?Q?Ct2C/xLij+TtB16YGi39u1ew8XYHKbFeOyJHYS0zCkn6hWGwQ168MfbbM+?=
 =?iso-8859-1?Q?b7pFD604Ywjr8xvoneY98j7yE3PBtVE//3o6Iiw0Ss+XQ0m3qsYfHOKdM+?=
 =?iso-8859-1?Q?G27kwYXYnOHpzZcNeVsFTINkROtw3DsvhkPgPjG2AWlu2M/LV5AKfG0F3b?=
 =?iso-8859-1?Q?j/iQR9gl7kPIg0CDxWB37UZLhjysTH6bNWw/1PO3nc3zzoo5RtCkYFJby+?=
 =?iso-8859-1?Q?uMiMnGzzkWAJDIHGYv8/FSVGe9eiyZ69SG/QinmuUkhQhPFPH5uytjitVR?=
 =?iso-8859-1?Q?DgfpAYP6VGO1hDav23lySSUWUfKnbcXtwjlEjvPYjF5FZ9/3XlB1YMT32h?=
 =?iso-8859-1?Q?e8q8GAagFnoaef5bcVDZynzrgYOh582eYabP+HW9wN+QHM1PY/vcg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZxwGNsTWnAtSZqFm6/U24DwW1A+G+zGQhh0CfTejCfd5eHaebiwKWv0Olv?=
 =?iso-8859-1?Q?5Qo8KR4DmxXOslbLr2EjhJfNB0pLNlSpWDRDlfV4NO9BnZCs252I97alV2?=
 =?iso-8859-1?Q?h2YmRVvJFFQfuLhLOsztDoOtImoDZ8pD68MWyjeDpzF2xncnIlcclvV1JI?=
 =?iso-8859-1?Q?gplj2IskzRgQkjsbH6sjYo4z+OxBx1drLU2gd9v2jaN5KFU58II1ePlv0u?=
 =?iso-8859-1?Q?xoBcjzWoEOeZJMVd4C/YuK4NGbnudeGU4pxfTbu6Dn0JyNmEv+akud9xwt?=
 =?iso-8859-1?Q?LbDfuEo0aVfbQMQ62sGjJIgf9OUDxJU8dnArSbVGqt/pBczmwHDrFS+2N/?=
 =?iso-8859-1?Q?j9KHKi0IhzoXwUJMT+goUjEwBKmJH+KM6dv3mnXGbjGJIsVgfyGWWxE7rr?=
 =?iso-8859-1?Q?igNiVkjduncCkXukzWiaaIb199CMhlo8EWhhfBvvc2xpIiT2oroW4NgsKT?=
 =?iso-8859-1?Q?6H/rA3CR+GJZnZ5jSByahvCl0wBFUp8iwpJpwKRIBkAvdWORFWZhp/suLa?=
 =?iso-8859-1?Q?A4pY9NAkd/yqia3mJ0YZMOJiGWh9ZBcxOLl0/1aIw9NsBTxXU1Til0j9p/?=
 =?iso-8859-1?Q?fOqHO7g0LbK77/9f86v49/CfHPREudCP26K1x78ttQ5IvxM7cB+xVEYwHE?=
 =?iso-8859-1?Q?RzXklKgnCNfqDabX3DQ6s46G6wAHR9aH6YADY+VtHN9pq2y26CTKuw1sNY?=
 =?iso-8859-1?Q?E7Ib2NgV7RN5LOJ9JrfMWQMz3Gxuq24T+Avv20NjIE8qucyKoEKAKi5Auk?=
 =?iso-8859-1?Q?CiZo3VwF+hBWR0fSbdJ4xDtLPu6AVo3h0H/v9QFLRkFhDl+w7SJBuM6aXX?=
 =?iso-8859-1?Q?fQXiUYrsaXsSV3yySScHCQAEPW+w3re/VRfkPVutFHjdhqJQOesizUlQqK?=
 =?iso-8859-1?Q?Ia0wTqDPDAmX712D0BZxtXGHNSgKsYI/OiCJxdY9nRWAj6cVdGUv8BxFAO?=
 =?iso-8859-1?Q?zBo5WwxLQVijfxhSnkRIvsqsz2F3v6Lo2RkygaHI1rM14Z4urERUk7I2LU?=
 =?iso-8859-1?Q?5YKqwvlsjtoSjkEap7MRMLXWBuuTMtFi6LjLerp2VbLbYDbV29Bz9glVN2?=
 =?iso-8859-1?Q?FQYVbJamOtIOm9Lga4tu9LZhnXIUHx6k5MIEjwC4w8N1vhkfth+dASPnGO?=
 =?iso-8859-1?Q?4ikKWNdkyfDK7Hu6aRNiEgBJCsZmyYTNfCZ8Rn6oFg/fdnsBRXv87KBT73?=
 =?iso-8859-1?Q?reuOf6iI98DqlJUr+tliiIZKcdQaaHpyUD3Z4TWVXCAkmhF92p4N7HQx4j?=
 =?iso-8859-1?Q?wv+WEonR1cg27UgZg3mAR/QhlG4p3OJeARarCNNISFZquS/qJyI+D6Zdka?=
 =?iso-8859-1?Q?MxTHhHL2++0fpFUXBmw5/b+Es+JvjZ3QYIKqW6cFlIEMKxWLsi9nrkaBzi?=
 =?iso-8859-1?Q?1Nn4Xt0NGDTPRGtsrIsOaLHwE22lgjIbFywJrr5Ph3rldjKq12ZDsJEVgo?=
 =?iso-8859-1?Q?8ohyUU0oAD2s68hZ9494F8vbUCJXMKnOTu0PPewbgtnokObPUjQW33orTz?=
 =?iso-8859-1?Q?6fWy6p1mfjfSjnsB1kjEefmIdRuHtP+iG08c30WzPIidVtOXFyeF+16ZV/?=
 =?iso-8859-1?Q?P7aMlrh2q+oQeEu2B6+zOtkh28MKj3Qfp0de6fl+SFfYlkqaPtSiC5JRug?=
 =?iso-8859-1?Q?ta8EkFAOqMZ1sYUZA9gw9H4hEIla/SMUDUUCb2llytR34GG7n6/PHtMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e77805d3-c870-42ef-ad95-08dce16240f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 15:12:10.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkDu5mYZCnTSuSmeRooIs5YguBkyy1CPg6XVdbIb+iYPPiffF0JJ6oFiUqSwrze/nIDO2D89QMw5oRt+EjK7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
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

On Mon, Sep 30, 2024 at 04:08:24PM +0200, Francois Dugast wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at probe time.
> 
> Add the following test:
>     * "function-fault-injection"
> 
> v2: Fix mismatch between test name and documentation
> 
> v3: Use promoted function for bind, rework structure
> 
> v4: Use igt_dynamic_f to have one subtest per tested function instead
>     of a single test for all (Rodrigo Vivi)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 191 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 192 insertions(+)
>  create mode 100644 tests/intel/xe_fault_injection.c
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> new file mode 100644
> index 000000000..d1c8b2530
> --- /dev/null
> +++ b/tests/intel/xe_fault_injection.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Check fault injection
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: driver
> + * Test category: fault injection
> + */
> +
> +#include <regex.h>
> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +
> +#define MAX_LINE_SIZE			1024
> +#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
> +#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
> +#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
> +#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
> +#define INJECT_ERRNO			-ENOMEM
> +
> +enum injection_list_action {
> +	INJECTION_LIST_ADD,
> +	INJECTION_LIST_REMOVE,
> +};
> +
> +/*
> + * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
> + */
> +static bool function_error_injection_enabled(void)
> +{
> +	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
> +
> +	if (file) {
> +		fclose(file);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void injection_list_do(enum injection_list_action action, char function_name[])
> +{
> +	FILE *file_inject;
> +
> +	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
> +	igt_assert(file_inject);
> +
> +	switch(action) {
> +	case INJECTION_LIST_ADD:
> +		fprintf(file_inject, "%s", function_name);
> +		break;
> +	case INJECTION_LIST_REMOVE:
> +		fprintf(file_inject, "!%s", function_name);
> +		break;
> +	default:
> +		igt_assert(!"missing");
> +	}
> +
> +	fclose(file_inject);
> +}
> +
> +/*
> + * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
> + */
> +static void setup_injection_fault(void)
> +{
> +	FILE *file;
> +
> +	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
> +	igt_assert(file);
> +	fprintf(file, "N");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
> +	igt_assert(file);
> +	fprintf(file, "100");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
> +	igt_assert(file);
> +	fprintf(file, "0");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/times", "w");
> +	igt_assert(file);
> +	fprintf(file, "-1");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/space", "w");
> +	igt_assert(file);
> +	fprintf(file, "0");
> +	fclose(file);
> +
> +	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
> +	igt_assert(file);
> +	fprintf(file, "1");
> +	fclose(file);
> +}
> +
> +static void cleanup_injection_fault(void)
> +{
> +	FILE *file;
> +
> +	file = fopen(PATH_FUNCTIONS_INJECT, "w");
> +	igt_assert(file);
> +	fprintf(file, "\n");
> +	fclose(file);
> +}
> +
> +static void set_retval(char function_name[], long long retval)
> +{
> +	FILE *file_retval;
> +	char file_path[MAX_LINE_SIZE];
> +
> +	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
> +
> +	file_retval = fopen(file_path, "w");
> +	igt_assert(file_retval);
> +
> +	fprintf(file_retval, "%#016llx", retval);
> +	fclose(file_retval);
> +}
> +
> +/**
> + * SUBTEST: inject-fault-probe
> + * Description: inject an error in the injectable function then reprobe driver
> + * Functionality: fault
> + */
> +static void
> +inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
> +{
> +	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> +		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> +
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +	FILE *file_injectable;
> +	char line[MAX_LINE_SIZE];
> +	char function_name[64];
> +	char pci_slot[MAX_LINE_SIZE];
> +	regex_t regex;
> +	regmatch_t pmatch[2];
> +
> +	igt_fixture {
> +		igt_require(function_error_injection_enabled());
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_device_get_pci_slot_name(fd, pci_slot);
> +		setup_injection_fault();
> +		file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
> +		igt_assert(file_injectable);
> +		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
> +		igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
> +	}
> +
> +	/*
> +	 * Iterate over each error injectable function of the xe module
> +	 */
> +	igt_subtest_with_dynamic("inject-fault-probe") {
> +		while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
> +			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
> +				strcpy(function_name, line);
> +				function_name[pmatch[1].rm_eo - 1] = '\0';
> +				igt_dynamic_f("function-%s", function_name)
> +					inject_fault_try_bind(fd, pci_slot, function_name);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		regfree(&regex);
> +		fclose(file_injectable);
> +		cleanup_injection_fault();
> +		drm_close_driver(fd);
> +		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 62bde353b..3ca62ff9b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -293,6 +293,7 @@ intel_xe_progs = [
>  	'xe_exec_store',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
> +	'xe_fault_injection',
>  	'xe_gpgpu_fill',
>  	'xe_gt_freq',
>  	'xe_huc_copy',
> -- 
> 2.43.0
> 
