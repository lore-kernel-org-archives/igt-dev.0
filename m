Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E9FCAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 13:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BC710E722;
	Wed, 24 Sep 2025 13:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGnjhm7V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874D10E722
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758719008; x=1790255008;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=YFld3qBA6gMBTd01jw6x9ed++t54fL/8Uxjp4E340Tw=;
 b=FGnjhm7VinerikOXzNmzEO8ufig3iiremWjv6uAtNjSYlum7mhr87se4
 N4vxfQUqAZFRGiy6YYLiSgXjXV58O+xa1veOBgiDGi6HUafbWyT+204/O
 tdLZKWaML5A/x9b7PmxkJN1tNnMg7MI/Y5CXsMehKarJj5orfaE8Ker/v
 F2kwBh/Xr9mJk2yISvd3Q3z7+HioMAGx+tZjIbQFNK7t4MlJyvmIEXULq
 HdZXfxGKpVO+XL0Jj5GZz3FqKtGROq+xauCP/Uo4QLQbiCvtWWT9U5Ugv
 HkVw4WfJMGcmkxs8NZ9rUAUa/FXorNgs//MMwaO/x571IxwUdnqMDVdha A==;
X-CSE-ConnectionGUID: b11vtXABR8Wu4VtulUNXNw==
X-CSE-MsgGUID: 6Mw0vdyJT52tfc1KpNpNfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61066155"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61066155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:03:27 -0700
X-CSE-ConnectionGUID: fyd4HRGLSF2C/39tWbR6lg==
X-CSE-MsgGUID: kIzUM+qxT0uZuUE+YNwO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176617329"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 06:03:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 06:03:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 06:03:26 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 06:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRqq7HBKOQg7yJHjnfWx06Ce7EqoT7ruHWtmVzDD17EApTOlztYhnFv7rIL85uk67fVfp8NMYgRXdd/mz0hnK3zHaRxoMo+cQkdyQ1UUqzvI7cmImaeVeYTro7zq+7r/5AmEEu1nhizstB2U2Fcy0B4iNSj0in31OQ7jqGtoFEiMAuebKwRz4/asODMq7yx+EIxgcemHWIB4louqxj87gkDeW40+N9PG81K4qahqBW1DVDHdHRXXrA8xJtVGktlzO4Rz+pI/An8zd9EvxuNxu38Ur0ak5YfiZkHsYRKt4hL9KHQIk0pjalO8vt66GM1W1nItHTcG4OHBYaIyW6CeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4UNQYGVsD9cL/3l02glDFT+4k8VPntrBet3iIzUrZ4=;
 b=vyrmmpuCyQNpGWKOE5DawUpwLeRkki5j5TKj+jpSb2bH3jkwCDFp0x0iTDJxree8hPQ6cooT7zwOCW0oY6Rk5M2ADqPbZBM7cIZJEd9FGss0tGMsae/oBM2+qR4mbQ+UrgOVVOy71w+7Z66m2glJUw7kV1yRb+g9q6ypKVCM8ngR1kIP2TEKKdlDmkVXdVUmEFa7pymHI3ARuuZrN5CtZonK1/WZ2oP5Rr1pBqTVpVhLVaMs+irMbwMtWP+kZN7VGC45frEly+HcEu/ej6MDjX2EwrSF2YkDAmXAmVBNWoUyNi1CA5G0yPy1voLe7BLidQao/gBTfzJ0fJo11Q1rQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Wed, 24 Sep
 2025 13:03:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 13:03:22 +0000
Date: Wed, 24 Sep 2025 08:03:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Check
 ctx_restore_post_bb
Message-ID: <rbevwrmmmqhcivygqrmwazwcpw66hexvhr5nihzacg5rrqip63@ggkpga4ffy3r>
References: <20250918-configfs-ctx-restore-v2-0-5df035e27e42@intel.com>
 <20250918-configfs-ctx-restore-v2-2-5df035e27e42@intel.com>
 <20250924110334.pxdqtw3qvjfmcq7a@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250924110334.pxdqtw3qvjfmcq7a@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a5a4dc-3077-4daa-2dd0-08ddfb6abd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S1xi/uJF98nk9HuxZAjuCtZGDTH6d6UHVPMjDojGkQraupfs6W53mw2EgQSx?=
 =?us-ascii?Q?gUIa+pHOnih1f9sGKO1b6CfpopuSqWByBsBVf5yNYWKl5oHYqcEUgl7EsNgC?=
 =?us-ascii?Q?J7XJPXznfRGrPrCzf9EKvM8uUzXI4tsFf+f1MwR907MoitVPfv7NiLgparIl?=
 =?us-ascii?Q?4qo7BNk2xuPXgISRH9IsWj0eeXpoL9mYoQLyxZrnxid6w2wpPh27n2tOAxOs?=
 =?us-ascii?Q?OLkuxXdt1r0brPFGWH1lFvV9qlB00e2u0epnEnOCheLbyNOx8RjUR9rB3XKz?=
 =?us-ascii?Q?76ez+WyJJ5C4xYjknIfG+gTNlqGKAUXpOFj7B45G0la8PEPDHu7MElxdeLO5?=
 =?us-ascii?Q?xoX4O2sEnAkvU5j8tNLiMhy8ZalWNJGOnfdjgbJAzCctXWc4IPCvCAOX0Xkm?=
 =?us-ascii?Q?tn46zSohgQgWUZRyCUArdR5xlpCWIFShx6TT5HIR3t6robacA02oWIQM2quH?=
 =?us-ascii?Q?od0SONZR6IF+BgXRIuW6jGufDN1AkndYOVwY0Mc0NmhzZc3E7P/ujeax6IVL?=
 =?us-ascii?Q?DcYaCGtHmn1xpibXZUg2FZqbYrMMMHvANOdMKDP6sgTApIHZ+Ahr0NklOA15?=
 =?us-ascii?Q?gfn3Z9zYoQoXW44rembefkTYIG6Rr9urp0Z8W2me3OzKmLE/IFcRUW5Q1izv?=
 =?us-ascii?Q?xKtPAfxUMxQ1SGV/wUcHNr0SQrXQAm8Ygmfd1/OKs+I2Q939WjFL5C0IieQE?=
 =?us-ascii?Q?9dOE9n+Pn3CH3eJInThnhICP7zTz8qigIcW/sXbThrt7gFVa5ZjjxMqSaay+?=
 =?us-ascii?Q?8R526VbW78DYzSBIpoUSwjGj3GRQKxGSRA9zMm0SQcjRwTAUzpDs3vyTxW1O?=
 =?us-ascii?Q?KZ419mKbK6DmkFSyea1UbwBWRZUOaUwgRxjSRCndMnYkg0X22ti7DMx7S8EH?=
 =?us-ascii?Q?kq4zEK+tJS0ujW0y6YrCgjCbKnGCgfEdWP6WdrUZ+r2YFWcEwPLgIdfb3bKh?=
 =?us-ascii?Q?bhM9TkP+R4Hbq1E7ccilu/ceWlAlZcR2gKs1UuM4V6Zmj1k/ipEKxgF3ocrW?=
 =?us-ascii?Q?PdNjpHza2iqR4jZuIjcrpziHLW0IvwRMboScy+msqSs8ZCwRzPaBPpxTmOu4?=
 =?us-ascii?Q?zv/znS+zt1rM3alYdJPY3/e/2wcINwA0eybWk7S2V8clOGRl+HyT5+Gwnqyw?=
 =?us-ascii?Q?7GtcdAUW/hvFP/95UBhMHr9nMuyFDMC1XYzgj80hkhwL1ly2d2RZZ/xdw/w3?=
 =?us-ascii?Q?b4s6+na8a2IuBfZNb/hYN8e/GVzKutH6zBrZ7QI3uXXBKwA7gIxtccxjVtG5?=
 =?us-ascii?Q?LTHcdqeNyjCH9trVBwhfg3SRMFm71rMhx7gTrghwsFEL7IWw/AOSxMw4hu46?=
 =?us-ascii?Q?55lgfQOjX7VeoamLMrvRvVZmnEX+N5s/+yADBO+STzzjuWopl9rNienLLSca?=
 =?us-ascii?Q?Maz8B+S+Qx4BzrYZEP+UT7Mtfp570JpcqY16V4ougDYzqgN6jqiuQeTiT2qj?=
 =?us-ascii?Q?xe1FcjtIkak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kytF1yqKToxOWKvDZkYv5D5m7jUHa7pdbHE3J8m5D28x/PUYThrXa6IKJW+U?=
 =?us-ascii?Q?McIxRYNX0up146FXjWlNcSjMX2TtnpZivctohLNSdBjD65nsVgAoBoPHvK94?=
 =?us-ascii?Q?7Y0TbXNrUY94h1nzgTrEP8/8rcDldHX7yc58arNWxuMokPQF3QWNP2dLXOd+?=
 =?us-ascii?Q?H5tKroIVpSYGyUff9/rkTTeV/FPWfrrLUG+qzwVRoVOnbxyBcpjJaXG4Nje2?=
 =?us-ascii?Q?ryYRMCebt4BlHQUkvaK5xjsu64HX0Ff2Qtrc9sPkaiQt1wTnJYgLdgm8ptik?=
 =?us-ascii?Q?WIMtoZHeEUpL6bc/Ogg/cU7kmmxUYT5FjDEcvPZjM7iSL3x+AsXokBrXKfDW?=
 =?us-ascii?Q?AXrySoklg+SuKKTMgvUJvtJZbh8JuziuyIIF/7XqH8b55nuyX8nwEe0KQTwE?=
 =?us-ascii?Q?gd+jiliv5f7BCQl8HcgHV4sxJN8vg4M7GMOJaaCjaCTLggHBakEgnYyLzvJ/?=
 =?us-ascii?Q?VCgHMOz55nu3i5lcVwixiWGL/xhZW9BWRzl+y2Iht3J1FMFKIik+DZDzGyNH?=
 =?us-ascii?Q?s3XXLZYMF+qntS0Z/zAqjrIHFTTNfpyHEt4H9yvBghd2/iSCs6h8VZ0YyyqN?=
 =?us-ascii?Q?v+m5k3nep3eziqwH7fn0D0MmCyWzSFFdDD9rpwB3nDxiAtfMY4rhLcq6VB6F?=
 =?us-ascii?Q?3vU8AzrL/cYiL9T0mUEy2aWgrCLJaARuoPZ7gxvsW0dCbZ2QIOVruTeDulxH?=
 =?us-ascii?Q?gl7pJZLxObyTl+Q8ro2WODaFXCaHt8h2OAn5FNagCYTloO21KtSEDy16nMP2?=
 =?us-ascii?Q?LvpCuASiodIdE76UNpURvxordtA/rvM5gvWYbsMCCAdV5iRgl9EDHjZ8sgpf?=
 =?us-ascii?Q?UFgyF53HiITaIdPjNV3d8ZLweChYyTb0JgoRSlYjHuV7qWa/zCzhKVM5hmDQ?=
 =?us-ascii?Q?QTf5DSHdyPLSv52RaPtSW+OJ6hD8HCWig+zBj1a9KnnyvvmcPvfCnEmBl057?=
 =?us-ascii?Q?ptqkQU8TUOPCA+mnTHw9sQqU48O9gOWKO0m8tlxpw72pIMH1fQzoP69VYe6z?=
 =?us-ascii?Q?1IcxQw01gt+zLPzcd8yErq4gfEJm0Bi/2anf0K/aCGmP3zISlQiNmu0YwLf+?=
 =?us-ascii?Q?gvzG7WGUGL8+MLdbffsFn7YSdrAfNqOnkxlt/rKm/hLzwzv30OysAcGrYcVn?=
 =?us-ascii?Q?QZGWYnknmwMrzxLxapAycGpM7FprSylqI1s22IKQIWLv0mJb+ho3ZZ0xmWzd?=
 =?us-ascii?Q?y0gKKJmlzA0oHvNNMJW6BhRQXJ3goUkxsOq0kA7Sw/aKAwzINeQdFGxeXTC+?=
 =?us-ascii?Q?ydXHVrM+N+7ayMtvwOcI+GkhWVxRB0HRbk2+N77yRtzfj7WVR+J/T+zJ4DaD?=
 =?us-ascii?Q?X5EnZgGfXCLUP1pu7goTBxAjBmqiFV7B9Eh2GclswacfR0M/Z3aWDVzmYGhT?=
 =?us-ascii?Q?EpuBoUKP5kVm5iuRtM7aGEITDxYut7a+LpJ1KvgEQh5amQEEAAi1+itlkQgS?=
 =?us-ascii?Q?C1f5ueuARywGUgrkyMV5VUecQyOU0/mixaQqShSUWAzGi2VfKyX6w63cpyle?=
 =?us-ascii?Q?to+utBuYM41TGhgEUjzDHqX9RvCFyBmGGcTtoZDVCJDnGvawQ996wT6VvS/+?=
 =?us-ascii?Q?XfCoXl2BAY+SX16TLqy3h3Ye4gIPDdegkI9HURoa/WjH5aLNtMChCxN2hG+e?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a5a4dc-3077-4daa-2dd0-08ddfb6abd76
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 13:03:22.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWd2ZXosbg5lfHYTI0KrorlKq/8oxT0lqc/lFxjgg6MI3DU222IrEiCfIlC3idpgasy5N1U91Y+r08s6RRuiHrTIGOheJXaMCbvSjOFCld4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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

On Wed, Sep 24, 2025 at 01:03:34PM +0200, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-09-18 at 21:50:21 -0700, Lucas De Marchi wrote:
>> Add sanity checks for some bb written to ctx_restore_post_bb and
>> ctx_restore_mid_bb. For invalid values, it validates the xe configfs
>> implementation correctly rejects them. For valid values, it checks the
>> values are written correctly and that later when we driver binds that
>> the HW register contains the expected value.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tests/intel/xe_configfs.c | 177 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 177 insertions(+)
>>
>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>> index 794c76132..7a7a7edf4 100644
>> --- a/tests/intel/xe_configfs.c
>> +++ b/tests/intel/xe_configfs.c
>> @@ -26,6 +26,31 @@
>>  static char bus_addr[NAME_MAX];
>>  static struct pci_device *pci_dev;
>>
>> +static bool check_registers(const uint32_t reg[], const uint32_t val[],
>> +			    size_t max)
>> +{
>> +	struct intel_mmio_data mmio_data = { };
>> +	bool ret = false;
>> +
>> +	intel_register_access_init(&mmio_data, pci_dev, 0);
>> +
>> +	for (int i = 0; i < max && reg[i]; i++) {
>> +		uint32_t v = intel_register_read(&mmio_data, reg[i]);
>> +
>> +		if (v != val[i]) {
>> +			igt_debug("Expecting [%x]=%x but found %x\n",
>> +				  reg[i], val[i], v);
>> +			goto out;
>> +		}
>> +	}
>> +
>> +	ret = true;
>> +
>> +out:
>> +	intel_register_access_fini(&mmio_data);
>> +	return ret;
>> +}
>> +
>>  static void restore(int sig)
>>  {
>>  	int configfs_fd;
>> @@ -124,6 +149,142 @@ static void test_engines_allowed(int configfs_device_fd)
>>  	}
>>  }
>>
>> +/**
>> + * SUBTEST: ctx-restore-post-bb-invalid
>> + * Description: Validate ctx_restore_post_bb attribute for invalid values
>> + *
>> + * SUBTEST: ctx-restore-mid-bb-invalid
>> + * Description: Validate ctx_restore_mid_bb attribute for invalid values
>> + */
>> +static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>> +{
>> +	static const struct value {
>> +		const char *test;
>> +		const char *in;
>> +	} values[] = {
>> +		{ .test = "invalid-engine",
>> +		  .in = "foobar cmd 11000001 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-type",
>> +		  .in = "rcs 11000001 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-number",
>> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>> +		},
>> +		{ .test = "invalid-number",
>> +		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>
>This is repeated, is it intended?

thanks, no. Likely this would be better:

| diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
| index ecba69dbd..ea98b9f81 100644
| --- a/tests/intel/xe_configfs.c
| +++ b/tests/intel/xe_configfs.c
| @@ -168,11 +168,11 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
|                 { .test = "invalid-type",
|                   .in = "rcs 11000001 4F100 DEADBEEF",
|                 },
| -               { .test = "invalid-number",
| +               { .test = "invalid-number-end
|                   .in = "rcs cmd 1100000g 4F100 DEADBEEF",
|                 },
| -               { .test = "invalid-number",
| -                 .in = "rcs cmd 1100000g 4F100 DEADBEEF",
| +               { .test = "invalid-number-start",
| +                 .in = "rcs cmd g1100000 4F100 DEADBEEF",
|                 },
|                 { .test = "invalid-reg-addr-only",
|                   .in = "rcs reg 4F100",

I will add that later today

Lucas De Marchi

>
>Regards,
>Kamil
>
>[cut]
