Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B18C36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 19:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9F010E72A;
	Wed,  9 Apr 2025 19:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMgESBTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1993F10E700
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744226561; x=1775762561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X5b2VyNEp+U3qlKWmS3+SvNcsok07cZ7d/WQB6ghxLg=;
 b=VMgESBTJERkyAqE+OT8q61qtHrNRkW8ZjamMnRFnn6sV0lKW9W0u/3Em
 z2kGm3BncaEWCChSBLSnKs/ZS3Q3KfXYbiqxtVGiRPk6D312AGRBzs2I4
 TjH/bV1pMq6vk1aYrinR5gcjvsZWE7XkK7cs/uIpfgm6/Uv92qWlhVFpx
 oMJUSNEvLDPH9x/jypHDCqAGzqXqAkX1WLNTazR4nsK1cFRD/Y/Igh6D9
 9/vfUhwMmAXNZa2w9XG4gRXaIsejN1KjQT64PSKoQLbkJHpy6bOA82p3b
 9rtGY8DILOzlvkbEfwYMjbuoAFHgisezokgjiUDtXTH7iVyRbfDc9waTe g==;
X-CSE-ConnectionGUID: owe77K+3RR+qkKCnoBCSdQ==
X-CSE-MsgGUID: BAsZfsvHRVa37GnYm029Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49564463"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="49564463"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 12:22:40 -0700
X-CSE-ConnectionGUID: PcEmqFbQRqqU18qf2D6NrQ==
X-CSE-MsgGUID: +DiJMBPrTA2oXQSGczSIig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="133881812"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 12:22:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 12:22:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 12:22:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 12:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBlVHrF1CPjsgdPa4jOTn+w7kminqLAR6WYZwsZ1fntiexREw9zW/WzFhUyO0zoOJwYOoz9lsRvMQ55dN7VLqZrHssy9DBGBJMfQjXTIdeSRv+HWTiz3UHLmnkDnHmBIUvIF2175UbInIhzuAcBornp26M/gEy6a4+y8d0mODQYh9xS/2GS79b/MRkSEadI38ds060B9UGCsp9MPrx/d0VPrevwmcXzfbdTKjm1vg00fjIwtlM4z7cfFyS3znk8E5YB+0tEwMBnAel2LVdbsnrWLOGNB6PiA8jDDcM7uTG9PDhrDcoBmLy6jRgVo5dKhfurfuNKoknKZNUWndjRMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDle7q7KDqdXq8hWGwDyUkaZfxpKMcSeDnIetHoEolw=;
 b=rxHeiLPC3CWcrbTPoMbt2p5a8xNkO+LECexTvUa8F/7p2qgl5xKEnz4/7WT8JlTw+bagD30FXy3ChGrt9JNAFWlQZsM3vY6IZuLAGTjC9Jfal44hvfqGosVYLcs0SuO5wzW9nafvzbkzxcHOP0fHIOmF2nPZ88RksjJhkQqzIUjv+juzj5g2iykFSkRAcZLlzr4iwObn7yMAXLCuvc8oVQvHNxmNGac+ToeEpTkcviT+86e8FxePRNIErOLvUT5ISfR9qk7iRFhHBqjoVoQMi+rENANkStM2a6hmn3g86+z1E6G8c5o0Q4O2roO8hwqMz8LrON9cl4QfGAXB2rhgig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 19:22:37 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%4]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 19:22:37 +0000
Message-ID: <d1994629-4d53-43ca-ace9-e5f25eb97362@intel.com>
Date: Thu, 10 Apr 2025 00:52:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] tests/kms_vrr: Bucketize refresh rate tolerance
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <ankit.k.nautiyal@intel.com>
References: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
 <20250404043709.955109-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250404043709.955109-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: f327e739-c1f3-419c-a266-08dd779be2da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEwxRFJ3SzdlWGlCRWZMeTlUVHZiK0FHaFlPMmlieHFsWlh4MDNia3p6RVBB?=
 =?utf-8?B?ZDJzNFdEL2ZXQ3FJQWw3UlI4WWdJYm9lVEhiK3VNTnVKTEVvUDZEbklNWi92?=
 =?utf-8?B?MDdnMXZkMTdjNUFLbmtLODV5SlJYbUtyWVlkNWpyRW05QkVMUmVqYXdFYUdr?=
 =?utf-8?B?S3JYaTk3TVRITGE4eHoxQ3liZDhSVW9vVE54RmpzT2RLNVNNTWNaZzRxcE83?=
 =?utf-8?B?ZStLYkxIMTM2bFNCdU5qRWNaS2hJTTlGVzY4eDE3TzhkNThaU0pyNUc3Zk93?=
 =?utf-8?B?RFJoQ01GRHdKWWZSbnA1L0tEdkI1Nkx0cW5aYmtGSDZ6aUdmYWk4M2UwU3kr?=
 =?utf-8?B?eTh4Q0JCTWVIdk42d0xWd3lnMVdFRzk4NjdmOTZZanBRYUE1R1E0V0ZPemtz?=
 =?utf-8?B?QUpGeGpHM1ZaY05Ub3Q3UDE1VXJkREdLMENDejZDVG80aEJRMzZKVjNXVy9P?=
 =?utf-8?B?dzMzVlJtYmVIVkpJellLWE95V0lYc3FOWVY3eDJDbUd1VEY4cmxpcHZVZ0E3?=
 =?utf-8?B?M3dlNGpSanh5enNjK1ZjRWFsQXlLUy8xRGJjMVNRK2MvblE2MTROdnVFSzI0?=
 =?utf-8?B?TFJUNzZQbEFGbC91ZG9sUzE5TDZXYjRtK21DMHVzdDM3RDNIL2pwQkhpRGZz?=
 =?utf-8?B?ek90eUhwaER4SEY1bEdqZUFJZkh3RzBEb0xhWFZTQkdGTFVXNjlXNlRlSEEv?=
 =?utf-8?B?c1Uvamp1NmFxdlRvSUdyUWRsSnFhbSs0QXlEUXpGRWFMMFRhOFNuSlRoK1Vw?=
 =?utf-8?B?U3hQVmp1V2NxQmErb0JLVFlqYjZDNTJmb25iK0JBVG9WY04wQmpIM2RDaUdH?=
 =?utf-8?B?dzFtTmZpWEtLSUYwV00ybFh5Z1RWNTJGdG1lT0J3eTFSVXZEcStVaUZyc3NS?=
 =?utf-8?B?N1FpdklORkVmR2crbFhBK21hUWkraXZlNVlMMTFMWFl3dDRsL0N4OEsyTlJF?=
 =?utf-8?B?OXBVc3kxb0diY1hQZTh2SGZBL3poWjZEWXZXUjd1SVQyUklMTDRuUkEvSVNN?=
 =?utf-8?B?cm4rdm9IM2JkbzJSUHFEbnJadTdUNDE2WFFYNWlUSlYvcEhBdVQvY2FvTzdJ?=
 =?utf-8?B?dGRONzg1bTZENEMzaWxPV1lyWks2R3J4L1Jxb09SbStUNVUrckFuM2pkbkcx?=
 =?utf-8?B?T2hPSXIxeWxieHc4bXAza1ViWXBUdEJreDBTa1hIcUVHaGNseW1xWHdkNjBH?=
 =?utf-8?B?OEtJVHZmbEtuYXJwSkppNGtpK1NkMkZSSlNZdVpOcGRwc3RoS3kxOW1vVEda?=
 =?utf-8?B?VS9udTFuT1U1OUdzQUdRNnpVOEt0VG0xeXA2Qis5b2NwT0VrajdmZFhnQjA2?=
 =?utf-8?B?anh0dnJLNWpQRlVheS81dGV2MFVjM0dtODlweTJGVWc3TWR3WEtvbjZ6d0Fu?=
 =?utf-8?B?aExVOTBlMXlWdzMwWTJYeUliUGc3UlFkbWdGYWc4Z1RxYU9vS2hnSlV2aGFS?=
 =?utf-8?B?ak45SnJHd3ZLK3hWZ1owUGZBaDYzUjV5eWJFaXgxTFdJOTI0eGpPZnh0UTFC?=
 =?utf-8?B?MkpFUldoNHNtRUx2S0xLdlMyMzlWbzhzUEh0M2FGRmRaQ3lqdWVBdFdMTEpl?=
 =?utf-8?B?VmFBZHpybkk4QTFjTEgxVmVsUzkrd0ZnNUNYTkgxZzErdkpOWnVCZ2FmTm5S?=
 =?utf-8?B?QjUxY0ZjZ05yeHp5S2F6MXpoZ01zY1h0d0lDOEw0V2J4Tk5DOVo3RFNVNWk5?=
 =?utf-8?B?QXBacDFPbVdRQjBxdDg3MElKcE1QdFhjTlR0MFhaVzc5ZTFLRFp3bVdoU3Fq?=
 =?utf-8?B?aGxEYXNFWDNtNy9POW9VR1BZenpoNHh0QkZvZXI4RmZIdHB6bTVyemk3Zko4?=
 =?utf-8?B?dFBXWnJHc2tnbW00eHpCVUdHNG9sTysvNUpNSm9NMjlydjBWVmRyOGEwZmoy?=
 =?utf-8?Q?F4qDcLffb3Bng?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anFLY1ZtNklUdkVoNlc0ZlN3NnBsQy9DUW1PZjVCZXcyQVF0Z2N5VVhjWldo?=
 =?utf-8?B?dXdGUERCMVFnS2NzMGJrb2NpdGM1V1duUjhValJFcDZHNkdvUmRqOE5LZUVR?=
 =?utf-8?B?SXQwaC9QK2o3UnRRZzR4VE55SWJtS2xJYjhNaGFYV3Q3aDU5NkxJN2doNmFT?=
 =?utf-8?B?U2tMcDd1aGUwN2w3ZjNaQ0FYNUdIZkxXRk1FcUtuaUg5OFg5cDU2bkF0MHor?=
 =?utf-8?B?WUFIV2lKV1U4dHBReEtxNlV0UE1lMjZqblNhd1VsQWdqaVF0V2E5QWlqcWpv?=
 =?utf-8?B?UWprbjZSZTR2VVNoZmpxNHV3M2V2UzgzSk1kU25qaDJJTlZKV0dtVUc2T3hq?=
 =?utf-8?B?MmVVZ1BMQ3B4a210YzRRL2hacDg2UDVTRHNrMFVidExzWUxFMWZwU3cvVTdG?=
 =?utf-8?B?cmtHZFpuY1NXTEdOL2FQSXgwbThRb2phd0lFVXAwL1MxWVVQN00zeTBlOUhk?=
 =?utf-8?B?d2R1WVBxaUVaelhFRkM0NHg1WC9ueTZyQ0tLeVpOWm02UDVCaFRpRHJQMmp6?=
 =?utf-8?B?Q3l0eG1KM1Jhdk1ZY3JHZE01bk9SWnpSeVBaZlFZSjNMdU9tZVo0bUxmd2lK?=
 =?utf-8?B?aWJjQVQ4VytDamdBai9NeFNra25GKy9QYXhveHd2OGNhYjhJWGw1VFJheWxY?=
 =?utf-8?B?SlhqY0RSSUZlOVlNdDhPbXh3S3NrOVQyN1JQbUFZbFgydDJ0UFNnd0ZBSnI0?=
 =?utf-8?B?bndJajVZak1TQkJDa1U3Qk9Bc1BiZ0J1ZUxHZWVwN2s4VUpRMVBlTHBtTnUr?=
 =?utf-8?B?MjYxNjJmWXhrUm9kcll5YUs2LzZEK1FPeDJQU00zK3FYZkQxRFp5M253bjIz?=
 =?utf-8?B?b05ZbFdGWTJiU2hMdGp4dnlTeFNtVWRqMytHYWxIbzNKTHVNQ2M0YWp2WGM0?=
 =?utf-8?B?UllqbXZKWklSc09DQ29hRFVYZFYxZFlCdlN6cEtHSERHSUVWdlF0WUlkNTR4?=
 =?utf-8?B?M3NoejlXclNjUTFZajNCOFRFWUhQRUt0bi9sNFpYdm9PckwzL244TlB5SGxP?=
 =?utf-8?B?Zm03bXNZcEhVT2s3QTVXcCt3TEdYUGoyZnNtdHhUc2pxR1dHY3dYR2V3ZW80?=
 =?utf-8?B?T29sZTFua3VuS0lOZDhYdGYwc0Z5VlkxenNHNnB6V2NYMmRDQXZmQkJPQUV6?=
 =?utf-8?B?dStXUjkzQWhaY09KNHNxblA0UDJhcTNyZ1NMRHFEazlydzZPZ3BRZjRFNExs?=
 =?utf-8?B?WXJGWGVIWERPMHVSaXRKUHNEODMwSkw0V05CR05VcEtHaisxMEhjVWJuS2E1?=
 =?utf-8?B?cC82WEMzZDhTY0NQTmNTaGZ4bDJiQ2pGYkZwSjRZZVlKdVlOT0cyZkpwZmhu?=
 =?utf-8?B?UUx5MGw5RDJ2QUlPcTJNQWh2N1RPTEcvU01pSzVZUVdGUytaZjBsQ0tBY1JR?=
 =?utf-8?B?MEYzYmxqT1hySHplVk9aazd5NnFBYWpSZmg1NmpiNTdUWHg2NG4wOFErMVYy?=
 =?utf-8?B?a1FMc2p6c1haRkVLNFVkeEpiVG5NOGFDT2gwbWVuMWpGZDJ6RXE0MWJkT0tX?=
 =?utf-8?B?RTN0SHF5cWxNaWN0ZUZkc2diTE9qTG9QR0dNVXl4c2lRelVrQTh2eXJ2Ym5Y?=
 =?utf-8?B?RVdRUmNyR2huMGZ1ZWFoWm9hRHUveDY4TllhcXFRdUxkVE9DSHNQVDRZMU0w?=
 =?utf-8?B?WVhqRmdFN1huWHBuYndVWjZHYkRqSHRxa2tTTGIyRVJZaHNhRTZZcmpxZ2R4?=
 =?utf-8?B?c3B2blVHSWFkby92a2loSlZrTFdSNDl1Ulo2SDZKRllWOU9CUFRtbm9xdVYy?=
 =?utf-8?B?STU2SW5iSzZpdFpQSGtBSzEvNVB1andUT2xqd1N2WHN6R0JOY2pkMEcveERM?=
 =?utf-8?B?VUJoQW5Oc0N0NHhJUU91TmJmeWVzNG0vWitmczd6VUFkMlZEMDRMMlBERDRl?=
 =?utf-8?B?VkxHNTZjOEZCNncxclhBM1Q5MGg0T3JJN1ZBZ0lCTURKbzFua1ZablZaemdr?=
 =?utf-8?B?V0NBclBSU0p0QTZZeFJoZ01PZXh4QVFsR0l1bllPcVhqR1VLRkhjVk4yZzBh?=
 =?utf-8?B?OEsySkh0K05Bb3FWVDYvK0djV1FzQmJtRDFkcWRySFF2V3Z0OVJxb1IzQ29S?=
 =?utf-8?B?LzhrTnNHTlIzRzBRNHNDOUsxemduSWVVYjZHbGRlZnJtNXpzVTZFa3hObG9R?=
 =?utf-8?B?SkZPU1pHTGhtUUlEVUdTOC9hR0srRWtRL1loanlubUZlTC9PZHdqSWY5UExt?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f327e739-c1f3-419c-a266-08dd779be2da
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 19:22:37.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krgEPMEEFmeuWvW7DOc1lhvLravhJSo46AHsD7gjAKr7TZEY6tLO4JOlWg4aJGu5aslyZ4KT3e4ag8LFbrvJxCxKCPLCGtLgOZZLamy8Za0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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

Hi Mitul,

On 4/4/2025 10:07 AM, Mitul Golani wrote:
> Reduce false failures while preserving timing accuracy. Introduce
> a small tolerance buffer based on refresh rate which accounts for
> HW/SW latency without compromising validation on HRR panel.
> Although an imperical number but already IGT is living with that.
> This also ensures that asked refresh rate is not too off and always
> catch the real HW/software issues.
>
> --v2:
> - Refresh rate criteria changes.
>
> --v3:
> - Comment changes (Uma).
> - Add FIXME
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index c4bb30f6a..ccf32f453 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -410,6 +410,52 @@ do_flip(data_t *data, igt_fb_t *fb)
>   	igt_reset_timeout();
>   }
>   
> +static void
> +calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
> +{
> +	uint32_t refresh_rate = NSECS_PER_SEC / rates_ns;
> +
> +	if (refresh_rate < 0)
> +		return;
> +
> +	/*
> +	 * Current IGT implementation follows this sequence:
> +	 * 1. Perform a page flip (`do_flip`).
> +	 * 2. Wait for the flip completion event.
> +	 * 3. Compare the timestamp of the flip completion event with the previous frame’s
> +	 *    completion timestamp.
> +	 * 4. Adjust CPU cycle burning based on the relative frame time.
> +	 *
> +	 * If a flip completes too early or too late, it is marked as out of tolerance.
> +	 * As a result, additional CPU cycles are burned to match the `target_ns`.
> +	 * Even if the next frame is on time, the total frame time now includes:
> +	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
> +	 * This leads to miscalculation, causing **false out-of-range detections**.
> +	 * The impact is more significant on High Refresh Rate (HRR) panels, where:
> +	 * The allowed tolerance window is smaller and more correction time is required.
> +	 * i.e. for 210hz (4.762ms), allowed range is 209hz(4.784ms) to 211hz(4.739ms).
> +	 * This comes just 23 microsecond tolerance, which is much lesser
> +	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic
> +	 * applied in igt for validation.
> +	 *
> +	 * To address this implement a Bucketing Strategy:
> +	 * Provide a small tolerance buffer to allow IGT tests to account for correction.
> +	 * Based on range of asked refresh rate. This prevents excessive failures due to minor
> +	 * timing adjustments.
> +	 */
> +
> +	if (refresh_rate <= 120) {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 1);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 1);
> +	} else if (refresh_rate >= 120 && refresh_rate <= 240) {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 5);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 5);
> +	} else {
> +		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 10);
> +		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 10);
> +	}
> +}

As discussed offline, the Bucketize refresh rate tolerance is required 
in terms of hardware and software delay.

We are still observing test failures with certain refresh rates, and we 
have noted that CPU burn cycles may be

contributing to these issues. As we both agreed, we can merge this patch 
and continue debugging further on
below FIXME. Thank you.

LGTM,
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

> +
>   /*
>    * Flips at the given rate and measures against the expected value.
>    * Returns the pass rate as a percentage from 0 - 100.
> @@ -439,9 +485,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		else
>   			exp_rate_ns = vtest_ns.max;
>   
> -		/* Allow ~1 Hz deviation for different reasons causing delay. */
> -		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
> -		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
> +		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
>   
>   		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
>   				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
> @@ -497,6 +541,15 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		wait_ns -= diff_ns;
>   		target_ns = event_ns + wait_ns;
>   
> +		/*
> +		 * FIXME: This logic makes next immediate frame time calculation
> +		 * in inconsistent state, even if next flip comes on correct time,
> +		 * it will be marked as fail due to time difference from previous
> +		 * flip. Needs to reset at every cycle for correct measurement.
> +		 * Once this is corrected, igt can ask for more stricter pass
> +		 * criteria.
> +		 */
> +
>   		while (get_time_ns() < target_ns - 10);
>   	}
>   
