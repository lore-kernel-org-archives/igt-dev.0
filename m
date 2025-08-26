Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5768ACA0FE9
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 08:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC010E60D;
	Tue, 26 Aug 2025 08:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wui3Urah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D010E60D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756195351; x=1787731351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Kqz+IIsGe+c8kmEvaeWAl+YksZA5xW2QT0CJusneKk4=;
 b=Wui3UrahAS9+LCcqT4Jcpb+50MboKv8RNThnAPOssGWBnjMhnd88ER/3
 ojQwObsBzJTTtHl5nSM2qUdhQT3IU+m8L1yMVstvfWg/r5BErJBW4Pati
 ZWrEsnRnjz1q1ZBKvfABGr5XuNlYk5WDAFDvUC5oEBjTjCbmSPBsl93ld
 A2h1utn0YXJbsySE9KjcT3lBq7PhCrhQEwiDG4mwG6UqLuXyteB0bfelO
 YP+29cK9Q9YOCaTEVDvpBkMrZsU0mIrQdfrLVXLTyHk1z495e3lUFfJz4
 nkf36VJx6nUw80idxE1QUC8rNlf/VG/ITkZ0SXv3L/ROy30cnLZh8LKgD A==;
X-CSE-ConnectionGUID: RCk+3EFZTZybcUOLrzPv4A==
X-CSE-MsgGUID: kFOQXN1tSMGL+mNa7aZIKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58478643"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58478643"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 01:02:31 -0700
X-CSE-ConnectionGUID: 80p2VJ4nSkSXekg/a6WZjg==
X-CSE-MsgGUID: yecVfetzTLKp0aUpZkfhOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="206664968"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 01:02:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 01:02:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 01:02:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 01:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL79m2I7LxynjrzitSWsoe367K2Cn5YgLrvhmK/Cs7Wf48FG0R6wCn9GTzQPspvx73dIeY8cmDoSyPcRtAwYSFX3AKBE6mmo3kSDtUpYl14545If8shTOjL9PELC2tWzU3KvNhezJ+VNd3kSeuFnfwY2+3orDcTAY8ZWuu6BlzdMPaFycr6OmpUgu66oV7ux3kK1Mw5LCAgnpTjgpS07rp7FiiW5TJbQsVcHQiWI6ZkuSxC7WofX+D0y8UepVHWdiq45lLYs6OdQBfUg86DNoIDXCzhos/VesO/qGlry+KTgeRwYNmTeQ27vhzw7m1n/5vgxiZ0LJrqELJ/NAswbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZJd1B2Cdy1DJ50yK++DUtRGPon8P/l8ZwALOPckg1Y=;
 b=DJ90svAnqa93DsF6uPJgIyoVHckoF5nHZMTHzfUNbU2r2NE9G1zD3peh+dj6ECUkVT1eA8SAz12JY81eyvd0YEcUBv5eUKld2vDDIN8yUVkoeiM6xFcfl5DWbEMP88qt+/+UYF8FK+9jWDfgvP01UQ00NmYWsyn+fXLyHL1mbn9ovBm52C4xYb1AyOo6ZKcS7oJeW2a7MfQdUxUmWP7jhnvM2jFzenEMovG+albPR3kJZA+BdvP+IQHHovmzgTwosOwQgzRtcpjqDwMdHdA1GKW5177WEg623WbfVJPhGKWXfn/4mIxTeR88GvTqkvKuH7X5CNHCd6H6z8wBqVpb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 08:02:27 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 08:02:27 +0000
Message-ID: <2b2d3216-96ac-4af7-9a21-612562aff6c9@intel.com>
Date: Tue, 26 Aug 2025 13:32:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] tests/kms_3d: Add resources cleanup
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
 <20250819155058.129794-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250819155058.129794-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: b49154e2-a757-4d2c-0459-08dde476e5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QURQRmh1b0dvMlZOM05jZWJDd0JxZ1FLUTExRnYzS09mQ0g0NGRCWHMrUUFC?=
 =?utf-8?B?dDZhbXVrTnYrK2hScko5V29ELzJ3b1JtN3Fad0luNUhIRUUrSmU5c285MWh5?=
 =?utf-8?B?L2dWMkdvcU4vUE5XTTc1SEhodFoxQ08va0x4ZEpCbDhWNlZJVjIwNU50dXdM?=
 =?utf-8?B?RE1IekdTWlBNUmhDZEZUTE00c3EzM2lmY25mWkZXaUoxdnpSZG9KVVRpd3hY?=
 =?utf-8?B?WGN1RUZjQzQzMEZ4ZUVUenEwWjBsemNvZXJpckRheno4WkxZTDVZNi9JNmFI?=
 =?utf-8?B?VXlySHlOM2JhZFRlZ0NYekdTb0JxZmdtUjlZaURSNzdRZTVFNFV6cGIyVVNQ?=
 =?utf-8?B?Y2p0QnJ5UXpLemhkYUFDSTVsZG9IQzltemVVL3RlYVRBeU9kNGZtY0tlUmZS?=
 =?utf-8?B?eXZxUjI1OFNJTlpGOCt3dVhCYWlvMXVHYWJUL0FmLzBXQm1kVGVVOUh2THpl?=
 =?utf-8?B?NGFQK2tXK2hFak0vNC9SdmJIN0NINTBSN09aZFE1WWQ2YzZQUExSUkljV05S?=
 =?utf-8?B?VVFXZnJOeUU1TzV4b1U0M24wY1dTRXFjR3o5RGhWUm1QZmtrcGR4SFloRlI1?=
 =?utf-8?B?QXBudmpBSjQ0aGc5Wi9uT1ZyYnNxQ1JjdHk1bUlQR21MVkViZjR2U3ZwV1Fu?=
 =?utf-8?B?RVRJOEtRVCs0ZkNhSk1ucUpSbnNIQjl6UldZZ0dwR0pvaVFsVzErcE5HS1RM?=
 =?utf-8?B?VlZ6ZW43VVB2dFo2TEk1RVVEb21EdEZ5TkxNQzJISTQ5MEM3UWZIOFI1Vnhh?=
 =?utf-8?B?SmIzTHhsa0F4QkdvTEcyUzNRUm5NSG1naWhJRENSYmxBSWUweFhZMEFqT2lG?=
 =?utf-8?B?Z2JSTW5UYTFSa2wvRGlsK1ljRmM5RFhZOVU1YWhkanIrT1lUVWMxbFZrbGJK?=
 =?utf-8?B?VjJBcGZoQk5UZytoSzZVeEcrWG9nV0lJT0JFclcybWE4MEVXMGQ3MENWbG95?=
 =?utf-8?B?STJpTFR6NnBVbW84c2NpWTRZdHhSbjViS2ZHczVaTEdOTTJpWlFRN01mR09S?=
 =?utf-8?B?YTI4WVZHSmtHRXkxaEpreDNhbHNtVDZ3RDBpc0k2OWEzalU5a0RoUnhUdVdy?=
 =?utf-8?B?TnlxbCtPOEt2bEw5M2E5QnQra3o5NVo2SUpaLzIzUjVwak8wdHQ3Y0cxak5u?=
 =?utf-8?B?cld2MWhodnB2azc1a0Q3OHdsUlNMMlpoZ2pkU0tZZ1JvVUxpYXR3RUtGK3Jq?=
 =?utf-8?B?MHEvUURZcHRRcGhJNll6OUI5LzU5cVNhRjUvamxyNzMyMVZTOFE0dHFQdm1K?=
 =?utf-8?B?OEpVTm1BNmlwbkxLMnpCQkQ3OEovS1AxVW9vNzhsRG5ZWlAwSzI4T0Q0RU5p?=
 =?utf-8?B?cW9keWVHdGVtcEs3S3p1Zkc4Z1I3dGhTRm13VUdaZXg5VWVjbi9uMHpZTUdu?=
 =?utf-8?B?aDBINXBEN2FQczlTMk5nR3kyTW1FbzNZanUwbjRCa3htZFpJWGpuVCtTL1dG?=
 =?utf-8?B?MXNhTkVmcEJFSC82TmwrNFNyOHhrQk4raVBwbDB2bkdjQktaNWMxbUNPK1hR?=
 =?utf-8?B?STZtMGRnQTRyVWJmQ1k4K2Z0UkFPZmlITExYVnQ1eS9YRXY4cjZtanh3bVE5?=
 =?utf-8?B?SHJuZVdTOXRLQkdEVU1XMHllWGNyR2R1S2ZzV2tDWEtiRUkzNlVZakh5UlBz?=
 =?utf-8?B?NVRLZ241MHVIM1dSM1JyWWFTSWVDM29WNlZ6U0Vpd0UrdklzbmRzTVh5cjZP?=
 =?utf-8?B?WEVYVlp4UnEveFBOZW9DNnM4Z05HamNRR053eUJ5T2g2MjJLY1lpY3FwZU9S?=
 =?utf-8?B?T1lvOGpNUU5kYUxyWm9vSnpUYmYvcTUybVlwMWNZalZmN2poYkpJSkFvcmxp?=
 =?utf-8?B?dnZ5TTM2Q01mUGVKWjJKc012QmlncEFjVVdXbEM4NzBKdVJBekQvTUUwcTZs?=
 =?utf-8?B?cW8yMERaZG0rZytKK0QxUFpvek5nR3hlNTdSWFlEanl4UWRwSGYzN0NDNGYr?=
 =?utf-8?Q?rO2fAukimkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ZaeUJJQUdGRnd2emRBY2FDQm5wc1FON0IwRDVlb3BPQnR1TFZuRVFCZXNw?=
 =?utf-8?B?WU1Db09SZkF4WFlVQ3FoQ1VhQmFJVjk3eFozVmRaZ0FrS3NiYmpNVldGckVu?=
 =?utf-8?B?c1lnUmhvUFdTYjVGNFArVG85MmpXRk9tRU5xTE03S3BDZVdpNW9idENrdW5a?=
 =?utf-8?B?S1ArdEQwb3hQRm1qa2x1UU9jL3NpbnNrcysrcUoxVm1nOTZtOUVFa3lFbGdD?=
 =?utf-8?B?RGUwdVQ4T2o0VS9KdEZobUk5L2RVUExLRXVtdGJmZklMaXE0Y2g2T2lUZ3ht?=
 =?utf-8?B?Qm4rektZRGN3YmQwQkNOZ29sV0xwVFRCcjdkRS9vZmp2cUdlZXVldlFsQUZ4?=
 =?utf-8?B?aEpNT0t5c3E5UlNHL1JDd2huRVFMZEhuWjAveVVZbkVYRjJoU3dpSVc2aVRT?=
 =?utf-8?B?UFM1RkwzR1Yxd2dsZEs1YkdsMWFpMnBFbEV6c3dKU0FYa0V1UkxPS2ZuS1Q5?=
 =?utf-8?B?SmZUalNSaXNmaUpuNE9wdHFWZVBwSTJ0eWFwTXFQZTdNTndWUDRIWWVLZG5C?=
 =?utf-8?B?L3ZrQnhDNDVBaEZUL3FpUHVhMDR1QzVQck5wTzgyeEM5WUM0VnlvQ0IwNXlh?=
 =?utf-8?B?RnNHUzI5UnhkbXkyYjF5Z1ZnVS9ROERoVEZjRG5FbGVBckJSK2JwM1BOYjFL?=
 =?utf-8?B?d01UUFZZbUJRRTFRR2d6SWxaOHhhc1g0SGhYTDFGbjRaZ0dhSk9sKzd0SDl6?=
 =?utf-8?B?anJVNDBRMUhKWXZIUk1mUGg4ZkpGeHVOVWZ5UGtxSUNNSXpjSk0zUVZqMWkr?=
 =?utf-8?B?U2FOT2xIdUhjdnBweEdxMHVJT3R4NUVjZjljaHhRYmQrWEc2aWRvYUUwb0kr?=
 =?utf-8?B?dmE4S2xJM1ROSytNQXJ2cFdPRUw4MGs2OXhxL0w5SUZDRzJtcXpJUVJJWjJn?=
 =?utf-8?B?azgwb1krYnIxNkhjYURRem1sb3o0M0hlMW5YM3VZa2JBVEZCbG53aVl3WGtv?=
 =?utf-8?B?TUtwUGR4WU9rVjdJb1E1MXFsaHFqT3g0Y1lTZzR3UlFHSDFSa2hhSzJ1L2Ri?=
 =?utf-8?B?V0pobU5iT2FyOE4yV2VReGs5SGJWdTRRSlJ6SS9ROVJFczdlRW1XV0s3Vkh3?=
 =?utf-8?B?cWJuMW4vdkFjbldnWURXbHlpUlBhUVhwWEkvV1hIVnRSSldTUkxhU0MwVXV6?=
 =?utf-8?B?NHR1RERiRnJOZGQ2YzYvNzBOMUFsaHlHU2ExaGMrT1BWSnhTeWhwN1VqU3ZL?=
 =?utf-8?B?VWl0d3FtdG80MFhzaEM1eDlWeWd2emNOOG53LzNSN25veUFiV3VxK085R0Uy?=
 =?utf-8?B?MVpYZmtBWVFHZXJOemNmMmRlYXBqQk1WTmtJTWtFMWJJamtkQW52M1lqS0Nn?=
 =?utf-8?B?MmtFbzRVbDVnS3lYeEppcm9PaG5pVWlrS2h4VGxIaHZxNFZYWm1ZYnFzaW5q?=
 =?utf-8?B?VDFJcnB6L3hXa2pSSFpHRVg5ZGdMbkpWVGhGTDYzaHZVVHFmc3hXNENHN3c4?=
 =?utf-8?B?d1lUQ0RXVE9FUGFXS1Z0SHJ0UDdPK3prOFh5ZTAvaUd0M0RaNHVlTlc2Qy9G?=
 =?utf-8?B?bjljeXpONllIbnloSXpBNXNZMzhod3BkQkRhN2kySTVvZmZuUG9SWGRjSklj?=
 =?utf-8?B?TVpSdkRST3hsYXpsUml2NXJwb09JOGhZd1JVT1h4emM5VWtqb0M0NEFmWG5L?=
 =?utf-8?B?TmhUOFUrekxmTk5nVGRURTg1Qk5ER1JaOUlEYXJDZFpmemhsMi84cnQrdXpC?=
 =?utf-8?B?Rk5zRzcxWUE1SjFwM0Q1SWZvVnRLN2J1ZlhYSFpydUxqUHJ1alVlQmFOazU1?=
 =?utf-8?B?dDl1LytkT0JheWdxUzczYXFqdERlQitpd0dQbFFIdjhYUlkzNVQ3RjV2dHZx?=
 =?utf-8?B?cVJrOHN6RnNYMStKanpBanFLVEx1d3hOazZTNXcwNVN6T0pyTTlnT2F1RFJi?=
 =?utf-8?B?bWk2NUFOZnAyUHBuUE9GZUhxUTRLUFFVRWpidGFnT1V3TFY1d2pPdVpqV3lD?=
 =?utf-8?B?RW1sRHJiNU1JY2VESjhOTXZJWjVJVk9JSmJmNmNMdjFnYzRtc1ErdFJFREgw?=
 =?utf-8?B?cC9LVW5aSWtSdmM3dVlBbElkUElsQ3VmYUhJSDY1VTE2YndFQnErdEZRUkdN?=
 =?utf-8?B?cWZUQTV3Q0lNaEZNcFFoUCtpM3hmNFZaVXp0c1R6OEhScEtCcW9EQmdIWUk2?=
 =?utf-8?Q?awKImi6c+g1sTpSkYJxQSNBCc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b49154e2-a757-4d2c-0459-08dde476e5be
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:02:27.2271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FakaFNG+8uG0eu/GDIBXBKrs8cAmz4vOszHrkzmwQ1BFRHBZYzekxW8/AtVi7Yc1cSGex3fBIyuGOJ90sJyaVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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


On 8/19/2025 9:20 PM, Kamil Konieczny wrote:
> Add resources cleanup at test end.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_3d.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index f9734ba38..86254cdcb 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -135,6 +135,9 @@ igt_main
>   			drmModeFreeConnector(connector);
>   		}
>   
> +		if (res)
> +			drmModeFreeResources(res);
> +
>   		drm_close_driver(drm_fd);
>   	}
>   }
