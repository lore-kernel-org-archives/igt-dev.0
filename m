Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D188EA4E09
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 14:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2FF10E518;
	Mon,  2 Mar 2026 14:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyTJ7SVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE86A10E518
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772462159; x=1803998159;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qs2i7a4i8Mdi1ulo1XX9M1WSh+o67HW+r769p2joTho=;
 b=nyTJ7SVprFrGQ94CHhXhRF2hPFXkZA507bKvlCkTqtuO74NFX9GXHiLJ
 lqtkczHiV1ynL7dhEXEYyOgFXbWXItbiIBWEhK3yj0QBegHD9XXDwjv2y
 A+Z4qGOyVEovEzaTknDCEZ+e8nC9Tv7NTUSpLYiAmlc4Pr+78qG3USXC3
 BsA35Vc9sTArA4t0HFC+eqfQwbZUrXi4w8UHLojgPfIH6BP5ShYUcL8Nh
 CLWeTISE4OCB+Icdupgt03foJT4ytZhmgj2bPlUpe5NKNphpCydDghI9I
 parKhc3Khu+/yr0BZWICRtsB7dnkvFCJCDrzVvbK3TNqEmlmdP742cCK7 w==;
X-CSE-ConnectionGUID: SDU0VwYPQfiaahk+o1CFqw==
X-CSE-MsgGUID: PARj0kyPQ7KRndrO/jjsaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77082576"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77082576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:35:58 -0800
X-CSE-ConnectionGUID: QrpMgEmEQ8Ch7HJokuAe/w==
X-CSE-MsgGUID: eX20s/RDSD6rkAJoxXMiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="216123132"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:35:58 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 06:35:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 06:35:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 06:35:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un4CiZBphQ5Eh4M0ku800pQk6ozYSiTLOf+qx1ewt29eOIzKFZaobbQ4qbBllGDchyxQyOftw/gv3/+a48jGy2r1kYyj1afI0e+Y2gM0e2EOjElNVjbvgNlLa6vx5QymOJUpzRK8mfc2RBTujth9i5BJOBU7Rcd78es0dx4Gxb7n6sSeeR2QJA/RDAYOTyWDxnf13/C5/U7uoknR6NDGcOuPE0yAv/TKHEy6gHJVZcryI5y719Evom0RzQeWRXmnd8hwZbkaASSgN14qcuAczVrNBdbHy0uBYGTiZT9ut77h/s0eR/6qOhemv7ww9H+FUGHGc7ivcrv+Ba2aKWSAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilB07fnpgjv00pi9hDWVl44bbPH6FpB9jEmIjs/2cuc=;
 b=ha8Aq8adlDpHQK17vHTreiIfVz/4vTWbg9qBDeHcyyGW5LPlOUM6QsCpS626rcOavp+T0t7MJqixDzdg8dKO7F2PHzOq/xaZHn//k/XrdPqGR7KRtfobxduYQSEyDXO2eoG/oSuacv4rFFutKaeLWh1GsclwND7jbE0m2i40SQv6fCeEWbIY+M31Mf+jEZUMGpWA2nmwtn1waNDsisEEVJTtjXbrbu2w4t81hipzAI2V5E79H80z7kUX4tnfeeQmE8vXEPem8JcyZkqA0I0wpODaxyjPsnAndx+VL2VmITt4F8Wnnqq6398WJ4DZAbkIckaMZjv7rfj2AZYhoHf8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA3PR11MB8023.namprd11.prod.outlook.com (2603:10b6:806:2ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:35:51 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 14:35:51 +0000
Message-ID: <6fc6270d-9bb9-4a8f-ac10-3ea440fb6f54@intel.com>
Date: Mon, 2 Mar 2026 20:05:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_pat: Cache PAT config for unprivileged
 processes
To: "himanshu.girotra@intel.com" <himanshu.girotra@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>, "Wang, X" <x.wang@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260301153553.23708-1-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260301153553.23708-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0180.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::12) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SA3PR11MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff0bc44-3ba3-4795-0e28-08de7869007b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 1dSIsiyKgBDKCTmPZnyCoLoJSeRQ3oiQSlHJ5oFO/7Z3oW2US7hQFN5tLwlh0+DRebUSRzOLW40CRSVTL4ChHftIpRzErrPeLTZ1gBIQKGA7jQA2Ges9GBdZtCBevFLCNtRlGXFqFvQbwlU5o3xmkWBPh/m6xexfcinpgwXCj+BmZrsckQ4N9lugc++ZrqpTt4cVQuz5coyRAAjU/OEmitN+GnHVs4YutW57aFK7b431P2KFQV/sgQwe5MGu46dht34robWD+K9c/PDm0pqoPkpBQF6mpiodkQ02nfGYHk0kGJFZFGqkleXvrCYiZoclmhP4rscjiX21Z0ByvmUd0w59AsJHI5kuTb61gAd+C74cC1zj6HpBRyO0/7mKUYu4xQrdLCW7Nu88Ys7XgZe/8bVuw0I2LHhIM4TxOUqOdhtT/6Q3cShXo+8qjZsO2kAqA6/6COx5qcqFpyZIG4ifHq4AkGrikBWCpkzCw6jqTRoI9Tc7khaiY1wox+zK9PowmYoOhgTdLzKEWZPr0ZHLvsUN3JfhWf9JLvvpI/QvEWXKeRdDAve2kB08jhM/5Ry3QTTtuIM8cdvIvV59PQoSanHBKbPwT894sg1oevrhvJjiDrUDa5UoTQskaV6+jzc8szTkHVSbZjW5hlCO+Z3/+DVGbp5bcIkDp7ZfUXmXZQuT5jLl7N/uO/tPoffm47G7YByH1NVzGY6So3s/lxo7MfCri4qYMr5K+ZF7nCCD03Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHdtUzZJVC9QK0RSRWRkTkxTTnNuUVpDVzU2NUZDTGpESGcvRkdPV0oxWCtT?=
 =?utf-8?B?UXBtWXlQd1hkSjV3Rzh3YkUrc2VTYW13ZUlQTURHR0o5cWxWeW5qWi91RzVv?=
 =?utf-8?B?ME1vMmtPTnNHK01Oemp2T05YZE5zWXM3TWU4WThBdjNTNnhOZ0xLNnlDZmJH?=
 =?utf-8?B?NXRBMjFWSmR6dGhCQjZ3N2gvYnpNUEhYRjlyZkFnY0pKZ1dqU1FCVUhDTWhY?=
 =?utf-8?B?T08zNlNrVk9wVTZyVVVQK3hLQUZCczlrajZ3T3ozTTdZUFlSbXllTG5heGsr?=
 =?utf-8?B?bVJHMmRUbkpjRjh1WW5rSTdyV1VPZ0l1cFV5NEc4aGNrSS9xdEcyQjROM1Bo?=
 =?utf-8?B?THY3ZUVsZ2N2Ukh1YXY1c3J6NGZDaW5KTGd3allLR0dHQzAwMjRUaVVxU2Np?=
 =?utf-8?B?OEphS3UxVXQvemtOQjA2R1ZQTURvamdySkswQThHK3o5TGd1bFQwUHhub3hQ?=
 =?utf-8?B?Zk8renlDblJmQVZHWUpVRXRlcXordDhBZVQzSjVmQlhMR1g3V21mVFR6RW1w?=
 =?utf-8?B?QTl3VjJna0xjTzNrTE42RS9PeEpjZ1UzNTVRQ2I1d1ZOV0tiMFRtdVZlRDQ3?=
 =?utf-8?B?cndJTHVxaC9lWjlnamJQOXF3S2kyU0hWeDBNbS9xY21RUHU3Q2RKYVhZSFhx?=
 =?utf-8?B?NUsyVmtFbjg0bWVPVGlwd05rcFdCN3J5V0gwNzlJRVNoS0MwNDdjUWFJTUc3?=
 =?utf-8?B?WnFwbnRuYUlHdHlQNCt1cDdPcmhBODQxNTZwOGlQZDUzVWdTK29XZW4vS0dY?=
 =?utf-8?B?ZTdlaGxYSC9zWjNSc0ZsOEhncjZ1YnNlVUwyUUNYc1Z1QkRSYTFTQ2JzdnVY?=
 =?utf-8?B?d2Zndk9yTzhWaXhFOGtKd0ZWOVpETXNadmdrWHpLeU51YWVyV2RldzBqZXFB?=
 =?utf-8?B?UldEZW1CTkdHM1kvZDBISXVKaktwcmJOa2Y4cUZ6V0xBMCtuTXdMRytETUJW?=
 =?utf-8?B?Y1dPVnQ5R2hwNlNVa0llaVVhMWFwYzhZK25qdXdzbDdtcysya3lnKzBFam82?=
 =?utf-8?B?REc4cEpFRlZCNHltYlU3dUtIVW9aUnF4K1FsL3NobmhMeEpBemdHcUdONEU5?=
 =?utf-8?B?S2YxSERnaVZERFRFQWx2c2lmRmhIKzQyS0hZMk9LcldkK3RiODBCTVY5aWEr?=
 =?utf-8?B?TE5XQTNNbWo2a3dpVWNvQkFiZzd1RjQvbk8yNDlQVTd2OTg0NGw3bEJYNVRH?=
 =?utf-8?B?Z0NxRGJZcGNrT01kaU8vOWlCOENvZ3lneWd0ejFzd01qSXVmc0pOSGt2MUN1?=
 =?utf-8?B?ZkJUL1R1RThPYm1CQm8wNm04ZWRxblZzKy80S0xHbHFoTFc5V051WmxBaDlZ?=
 =?utf-8?B?TUZZWkp5dFpxVFNzOXllRGJ6RW5YcGppVzJQKzNBbUhPMHgwam1KQ3JmOWNy?=
 =?utf-8?B?T3VVejVYN0VYd05DM3J2TnBYVUpCRWR3c0pwWTFMeDg5SDJRRWZWYXJSN05G?=
 =?utf-8?B?MkhQZHh3S0hzNm9ZR0RUMzZjWjZhTWRKS05wSko4aFUvMUVzZnA3Z1d5b1Zl?=
 =?utf-8?B?Mm1CMUJFMjBWVmEzOHVucGR4RzRqcHcyQ0Evb09jYkFMQXBUZDJ0Ymxabnlu?=
 =?utf-8?B?dmhmOThtZ1ZZSUhyc20vN0xweS9IZmZwT3JzdWVYRC9ZTUZWOGgrVFJKR0ox?=
 =?utf-8?B?cVRzdFFWL0pvYTFpak13LzBFeDVhdFloSDJFbnBmN1h5U29pdFRVdDhqdHlN?=
 =?utf-8?B?a2RJRlVxUDdQU01GZ0xqQVprNDVwUmNMRE1GdXRPbjd4cnBBdDhQaGl5ajZO?=
 =?utf-8?B?Vm1WSmZvSUl1UEZPMGRPYkhSWmRVL1VFY0NkcnN4M20xejNETmVaS0lLc3hN?=
 =?utf-8?B?b1hCT0lQTVM2Z214MERZSk9MV3RBOW9SM2Y0SjdMTG9ZY0RaK2hHNWozazJ1?=
 =?utf-8?B?Mi9lWTdyaVE3QUNSamRzV1BVNVlkZ3NyZXRSc3VJSG5lR2hCWEFXM29VL0Jl?=
 =?utf-8?B?a3lpby9INUJJS2JQbmRKZHNDVFRDcTJOK3VyYnM0ckY2eXViUXR2NmViWmhk?=
 =?utf-8?B?ZU45UXNBWU51c1hNS0V1dlRkZjd1eVAyRGovWml0Q0c0djBpczhtQVg5ZEtl?=
 =?utf-8?B?YTJ4N3htVTFDVDdzT3lGZnBnUU00UWx0UWpVQ3dmSDFQaTVROEVRM2ZXbXhS?=
 =?utf-8?B?N1oxQnc0NDl6cENNbmNrMnhVL2h3RTNETCthb2dkMlN6M0lyQytFYVlZdHBk?=
 =?utf-8?B?a2YvTWk4OWdpcUY4bWlGdVNxWkRxMGw4QTRCSW1MdS9mUEEvMXhzVnJzV29X?=
 =?utf-8?B?ejJCOUFhdDFIKzlKK3NzSWIwOWdVWWJvOERXMFJ6OEJ3dDNMUGdvT1E1cFdO?=
 =?utf-8?B?UGdCdFl0alZXWkhiVlA0R05zcWZIQ1lZRjRqKzMzVHhhbGJnSjRIZ1hCRkx6?=
 =?utf-8?Q?tE+s69HABDM5Nbn8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff0bc44-3ba3-4795-0e28-08de7869007b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:35:51.2963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kze4Q/XMc05DQOiShbJJTmduPycYjbsn3fP+c5Qvl2GhM8qbVa3SOBgOnHWUqjVFnwQ5gzwcB4UuTc8iIr982Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8023
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


On 3/1/2026 9:05 PM, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> Commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
> authoritative PAT source for Xe") changed the Xe PAT lookup to
> read from debugfs, which requires root access. Some xe_oa subtests
> fork a child process that drops root privileges before performing
> GPU operations that internally need the PAT write-back index.
> After dropping root, the debugfs read fails.
>
> Fix this by caching the PAT configuration on first access. A new
> precache helper lets tests populate the cache while still running
> as root, so later lookups succeed without debugfs.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   lib/intel_pat.c     | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/intel_pat.h     |  2 ++
>   tests/intel/xe_oa.c | 10 ++++++++++
>   3 files changed, 51 insertions(+)
>
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 8660a2515..16dfc0217 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -7,6 +7,16 @@
>   #include "igt.h"
>   #include "intel_pat.h"
>   
> +/*
> + * Global PAT cache.  PAT configuration is a hardware/driver property that
> + * does not change over the lifetime of a device, so we cache the result of
> + * the first successful query.  This allows unprivileged processes (e.g.
> + * after igt_drop_root()) to use the cached values without needing debugfs
> + * access.
> + */
> +static struct intel_pat_cache pat_cache;
> +static bool pat_cached;
Instead declaring global structures declare own structure and use above 
as their member
> +
>   /**
>    * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
>    * from debugfs
> @@ -98,6 +108,11 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   {
>   	uint16_t dev_id;
>   
> +	if (pat_cached) {
> +		*pat = pat_cache;
> +		return;
> +	}
> +
>   	/*
>   	 * For Xe driver, query the kernel's PAT software configuration
>   	 * via debugfs. The kernel is the authoritative source for PAT
> @@ -110,6 +125,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   		igt_assert_f(parsed > 0,
>   			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
>   			     parsed);
> +		pat_cache = *pat;
> +		pat_cached = true;
>   		return;
>   	}
>   
> @@ -134,6 +151,28 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   	} else {
>   		igt_critical("Platform is missing PAT settings for uc/wt/wb\n");
>   	}
> +
> +	pat_cache = *pat;
> +	pat_cached = true;
> +}
> +
> +/**
> + * intel_pat_precache:
> + * @fd: DRM file descriptor
> + *
> + * Pre-populate the global PAT cache while the process still has sufficient
> + * privileges (e.g. root) to read debugfs.  After calling this function,
> + * subsequent intel_get_pat_idx_*() calls will return cached values even if
> + * the process has dropped privileges via igt_drop_root().
> + *
> + * Tests that fork a child and drop root before using bufops/intel_bb
> + * should call this in their fixture or before the fork.
> + */
> +void intel_pat_precache(int fd)
> +{
> +	struct intel_pat_cache pat = {};
> +
> +	intel_get_pat_idx(fd, &pat);
>   }
>   
>   uint8_t intel_get_max_pat_index(int fd)
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index e9ade2e2e..c204eeac7 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -28,6 +28,8 @@ struct intel_pat_cache {
>   	uint32_t pat_ats;
>   };
>   
> +void intel_pat_precache(int fd);
> +
>   uint8_t intel_get_max_pat_index(int fd);
>   
>   uint8_t intel_get_pat_idx_uc(int fd);
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 927f3f4f2..37449c87c 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -27,6 +27,7 @@
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_oa.h"
> +#include "intel_pat.h"
>   
>   /**
>    * TEST: perf
> @@ -5094,6 +5095,15 @@ int igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>   		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>   
>   		render_copy = igt_get_render_copyfunc(drm_fd);
> +
> +		/*
> +		 * Pre-cache PAT configuration while we still have root
> +		 * privileges.  Several subtests fork a child that drops
> +		 * root before using bufops/intel_bb, which internally
> +		 * needs the PAT WB index.  Without this, the child would
> +		 * fail to read debugfs after dropping privileges.
> +		 */
> +		intel_pat_precache(drm_fd);
>   	}
>   
>   	igt_subtest("non-system-wide-paranoid")

Rest LGTM

Acked-by: Nishit Sharma <nishit.sharma@intel.com>

