Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21ED606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/UXNYO1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673610F7CB;
	Tue,  3 Nov 2026 19:35:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765D710F7DE
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793734498; x=1825270498;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z6rluR/YUiXz7IC7zAA4CeNMX2sY7aDvzQdUFiSjZxQ=;
 b=I/UXNYO1e+UqiFXbmWxsDGzBezprVkMRZheTk1DDBMbWsCwE2ElsKVK9
 cKr9+0A+ybcRDcvVmZEcif6RrAdk7tvykOVQ/nD91kQ6zJPM2i/fP9ag1
 MLtNQFkGfVFxNKB5p49a/8VXYmmo78cZvdZY5JtEKtMb9FkNDFlvbnT1n
 mzkQTqOn0uVMknCi1UbLJkC/4TlHeh5+b4+5GLMa3aJRa1Yvvuy5guH4g
 97aaEZZNGwC634zhVeAdgy2YtFjj1NgSRynu4+9dlp6omxpu6sG8rpWc2
 REplO1ekYQdu7AF0UdsIfE8RDEjQmktcmJJgQ2d2KG3m1VIzaDgCimxqM w==;
X-CSE-ConnectionGUID: EgY2rSBUQDWkQ7MADe02Jg==
X-CSE-MsgGUID: ZHK3LXmYRBa/qUbooy0dIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2364046"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2364046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:34:57 -0800
X-CSE-ConnectionGUID: FDutkAG6SGOxio6BFn5KjQ==
X-CSE-MsgGUID: r4pfIaF/SFKMAtDOBaF5QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="7037376"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:34:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:34:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 11:34:54 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 11:34:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TS8pCnLYchV3cDecyfohKXo+wfdB6crqhdQuwu1FWVIVkI2mis6nostN4KwxlCNF9jwwuJebj+76BtSxKGrWJ9/ZbI3kUWtbncofGemTnmiVWW53FeeLCEU0Wkak+fG6WrSwiEhDCcw/4oL/5POqpUyK0calI2+JrJ1Dm3XVWKMfJHmdefSnOJYq1n5jck6tGEqm655JC7BRyIPPuQ59BJ43ZHgHMJui2hkwmmjqh/y91k+oNU9G8AGLrThu4jvdmF6nabHmXH4vCO/B81zyRGRD8wmrfV+eyuFLky9FIZw/tJw/uO07DZOtxAxucHAMX89nynk2FUUJEXdw2rd5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgaG/h1xxq6UhEM3M+9yDrpgKRGxZt0O5LuMFSWI1/Q=;
 b=R/Q6AX4Yab9G2C9RC+ugvaDrd3JyRPGcHV5TXu40jiFu+hCMftsTxv5l2ilQNOUsnu2/ekcWhPWhxRHV90Tsa877dzcu7aWkICXKf/XOxO0PCf2E5W/yzg/ritv0Z3882WGVBTrR4waA6kiVx6djiNKqC5ccwuVmMfEpqf4y7yq89uw0tI90dSV2HEOeHwlAg0LhJQ2WYzd/UK19IXrwVatiVCV6NC8m/X5Y2l80ut45dndbIl2xUbQA8J3xPHekHXOjCvJr+CxGU3103ZzJ3/qWUCxfER2x6uJLgeOmmIcfcAVQbovd1VK6vg+KiNpc8l9sAdGt25gi4reIh9D0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 19:34:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 19:34:42 +0000
Date: Tue, 3 Nov 2026 11:34:39 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <harish.chegondi@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/3] tests/intel/xe_oa: Move device setup and teardown
 into helpers
Message-ID: <auo3T8eLvH+clygE@soc-5CG1426VCC.clients.intel.com>
References: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
 <20261030224011.2268663-6-umesh.nerlige.ramappa@intel.com>
 <d341857e-ba9e-4aad-8f63-71df5e151cf5@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d341857e-ba9e-4aad-8f63-71df5e151cf5@intel.com>
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 861e5b9d-d9f9-4f51-9f97-08df39e181cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|261021123027099003|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261022075727099003|261026140227099003|261021121427099003|261026121527099003|261022113327099003|261022105027099003|10067099003|18002099003|22082099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: W3PBJpvTusAncjMQo2MEQmuNBb0eVQ0DR9dTnWjPNVcnFt6SHR41zr7cGHnaWTvTP7EJ3yE/vB59Km1qEz0alNKlPum7EVUFQ/hJocfZQHqs+5A5BkWZI7f+RPB8wjk+BC+CyYx371OYYCID7wQ6rRF8YDlDl1+RZ91QCB9FADiO9OSPCIldDYt4HgT0T9XF45PlCUEV3QWdXMe2kunLT/GIfUw3+pH9gmWxSM+XoAVglzFcI9MwdZmD+PAfOtcyjgxzcSdSgXXt18jWN+k0D7jiSMmjlg7fTuJ7G8xmHuCpzafRaMm0cQmJIKynhlVzVrDddqtkJnhb/PCMRaaYk26glVuxAsFRLSNLcol3rrWcVz73QuTkx/La58itdpd5JB0Et7xs2q9Mm6VQk1XANW+Q+H849ZdxWiU9uWZ1rCKXqMUgrnYUc+SH1bCjNUaylLUVdPKD6qtfZZF3SFm6gK4CQM/wD7pV9aU7EAAs7jzhDYM5cvKR+kFzqU/WzLdIy2LMgsZ/XpJzGdGtpsuEVric1bPJ++USdNQGS73F40ohIDyFX8q/z5QvJqX3WXtRrn2EixOGh3ebwWPz6/WHHpZHt9fL1VH0cJXI7osRiBh4Kllc6+AcBe/UdbyF0DbiG8RxWTIoxuu5j8yqs789grv+J9MUCZgji6EwxrAEdGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(261021123027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(261021121427099003)(261026121527099003)(261022113327099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldoNzBMekxyVjVlY0daYm1zM3o3S1ZnbGs1ZWY3OGF2WVk4Tjh1V3RESGZJ?=
 =?utf-8?B?WkxTMDVDYXVHZElNVFJNYW94dDJLZXZ3UUNEZnhEeDAzZm1MSzkzMm5RbERH?=
 =?utf-8?B?SWVBWHRiVEdEcGdTZVkzOUsxZk12UTlEeU1XaXV5V3FRODdsSDE3UWlNTERP?=
 =?utf-8?B?bkxLeGJTdmM4TzJ6VUZrUUxlRnZpS1pnVm41MUhNbDhLUGt6UnZucFpQYkVx?=
 =?utf-8?B?Mk1hQTVNd29UUHN0YWlmbE1iaWtFdnNSbXZobkdCTytJM0ZKeTNJeVE2RFNR?=
 =?utf-8?B?NlRmTTRyWit4a0xmcVpPWDJkb2dJazhxTzl0TE81Sm9ERFRZMk9LMDlua0J3?=
 =?utf-8?B?dVBIeEsrOTBIMDZ3WEY2YWVuZy90ZE00VjZTcDJhcUlFcW1uUVFvcnAvT1hl?=
 =?utf-8?B?Q1ZOZHJGdkMrWXBHYXJVRzBLRXhQQjNDVVNDSXpRMFBaQlNqeTZQS05sWnd0?=
 =?utf-8?B?RWxub2tiSU5uYmZoYkVRUHUvUWp4NGxYVHdpM3ZMVGFkeFNFSnNhTWUySnFP?=
 =?utf-8?B?TEhlOFB2WGRJWjRyVysyOU05VUtHWk1yc0RiM3luNno4ZU1yOUNmYmd6cWRn?=
 =?utf-8?B?b05ZT0grbDhXMlpFU3ZBSHlyNzFXMWFrZVk4Vm13eUxpRmprdXc4UHNFRHNO?=
 =?utf-8?B?ZzlJMUk1SzEzdjF4TE1jNEF2V0Z0R0g5UW0wN204aFJlRmpxcGoxS0M0UUN0?=
 =?utf-8?B?VjhacDBpbDJtVUxqa1UzVUd5aWxCbGdFNTROZU5Od3o2UlNWMjYvcmVpSG1J?=
 =?utf-8?B?YmErOS9qSTRzZWlPYTh5djEzYUxBbk51Z21MTmQ2Rm9DM3cyQUhucEZPK29P?=
 =?utf-8?B?SjhrYXhwajV0TERDQW5hamhEczg5TmI4eHFJMlBCV0xkQkdpMlNZVkVGVWpq?=
 =?utf-8?B?ZmdLZldUaStRS2dPZFlERzZmaERVTFhta3NReWZkREpNcXE3K21nTXNkeFI0?=
 =?utf-8?B?UXNCZlZ0TE4rTDd4Qzg0d3Q2ekYvNmRzaGJOcFNkdDF6ZEkvNnpwMzF4Uld4?=
 =?utf-8?B?cEpmZkhLbTRraDR5UmNmOC9Pa251ZUYzdEdFQ0o1clV6azhvSlhhZFhEd2Rq?=
 =?utf-8?B?WFlyZXl4bGxHeHRKL0FWNGVPOHVGdTZBb3gwanVVUUNWTGh1MitrTEZMZ2VC?=
 =?utf-8?B?aXZXSGJUd2p4TXYxdXltMGw3bnN3dDJYZGNSQUR6eUhZRTdiV1kxcTlYNmtk?=
 =?utf-8?B?ZlM2K3FWTDdLS1A3aHdKdXJVdWNYdGtRMmhycUd1by8xbDVDRDRHbE52Vnpr?=
 =?utf-8?B?N2s4M0lCRGxpUVgrbGFXbE1laGRGLzBPRmdHV1hLSnAzL3ljeTFINW40WU8z?=
 =?utf-8?B?ajFzSm9WKzE3SG1HNCtGaEZyRmtxZzZGWkJ5bHM3Skd2SmF0VUoxUXk4bHMv?=
 =?utf-8?B?ZWxSc2l4eDNBWU5MeFRUZk5qbHhxdndGaVd5bWk5OFZWaXhmSzBVZldHYW1n?=
 =?utf-8?B?SGJpU0ZHcmh5VlBleGZnc3R3c2xXOTJGZlhUOEEySHBYZmtWSnd3YUVGc2V2?=
 =?utf-8?B?cGtCeXA4V0t6clkyaER2djRCVnpJRm1VTmxXT1JlNGJaYUlieDk4M3dwRFg1?=
 =?utf-8?B?UlZ6aVc2S05QdEpaSC9ZNHg0Ty9NU1RtaFNNc3hYdWptV28veFBmS2drOXhY?=
 =?utf-8?B?UkFBNm1OQnVvVGxTc21GRUhJdlVBekF1UEx2R2UzQTI1bGN3RVI0WGJSck9D?=
 =?utf-8?B?eXc1cjcwVllKekF5M1VOYkFjTFV4c1dCVUxVcktOUWMvV2ZtZVJSWkdsMjFq?=
 =?utf-8?B?ZEp6anJicTN4UWU2SDNxV2l2L3IyQVdyRzhzUGJXS1NtdHdRMXNpYjdzNTFr?=
 =?utf-8?B?dHVDY2lXcEJ3TUU1bEM3MW5xK2NOY1FpdyszQ2w2S1JORWYxbVJrVnZOdzZj?=
 =?utf-8?B?cnRHZldEM1NxeU0yU1dsTVpQMzlNaW9vdGEzVUNHd2R5SG9OOE11NFJCa2xq?=
 =?utf-8?B?NXJ1OHo5bGt1TzUxYUxQNmp6UUorTGVNa05qd01OOTVhWXlnajFDY0xIVlY2?=
 =?utf-8?B?Y1JXUUUxZ2tKOXZOa0xwNnpheTZtbytUaTlXbHdLYUtpZjNDK2lyNHpLd1Ft?=
 =?utf-8?B?aWZacUVvSDZSZjlaVTJmVmlCbUNWc2NoMUFINXZtdHFzbGRuS3lLRlFPVG1U?=
 =?utf-8?B?c3J5ZUU2RTF5bDltZFNhcWFRZmROUmU0UXBCUmdlMWFKWFhCUlZLekZVQWZV?=
 =?utf-8?B?aXJYNGdQS0JaSm1qVnFvT3BCY3FRVDQxSnMvNlZEUUZkS0p2RXBYS2RNNFJZ?=
 =?utf-8?B?R1hDWVJRYWVOeUFZcnJVUjF6TXBpeG94WDBHUDdtZk9ISXBNdTVYck1YclNl?=
 =?utf-8?B?N1lhb1pCaXFzcjkyeVYxS2hLQ0J0ZzJrN3psVmZpSWRiVFVtOGhnbFpCTWs4?=
 =?utf-8?Q?yq7L+ijDvwSgExSvnw4co+A8k8TNMAskz2aRU?=
X-Exchange-RoutingPolicyChecked: gxjfhkdGlyzNnONSDACucAWC79BM77KCiGCNKk8yj8vLWNNkDgW6rAFjY53Q1Or+bY9GnwWvUyTEIIuXVDyMBANUgqeHRcpPCPM0n3KxrCIfJO2SIUOqF8nfIngusloDrrn8F7293L87bLXkcZ7BeL56Iv8f72w25RU+H7Feqx2D4+AJ0GrKTt7TYlkA1AzGbuyn3Vm3KbqhwVFd4pkwBhpIuYI23yKn/h9zcBTCMf1Z2XjLTL69SSBI5ImREBnPizR7HW7j3TDm5n/HoXxsyOO61I0Ke7MiRHNfP35vih/83B/FcZRUOYgjvalWv3l5hrADTfFzrHMQq41atC1GXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 861e5b9d-d9f9-4f51-9f97-08df39e181cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 19:34:41.9651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThTofx8Kg+DLQW8bZKhI8idzTLJ34c/+GfZ4mFzivOp8YHG+SwX44eZrdrvUSEXA56iwcn8rKAA2vlQdYNZFYySnXMxD41UupgZ/9XQBuRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

On Tue, Nov 03, 2026 at 08:00:39AM +0530, Shekhar Chauhan wrote:
>
>On 10/31/2026 4:10, Umesh Nerlige Ramappa wrote:
>>Move the device dependent setup from the main fixture into
>>oa_device_init() and the teardown from the final fixture into
>>oa_device_fini(), so that the same state can be rebuilt by tests that
>>unbind and rebind the device.
>>
>>oa_device_fini() also closes the sysfs fd, drops the xe device cache
>>entry and resets the state, so oa_device_init() can be called again.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>  tests/intel/xe_oa.c | 81 ++++++++++++++++++++++++++++++---------------
>>  1 file changed, 55 insertions(+), 26 deletions(-)
>>
>>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>index 91d0ad9c4023..07571eeb7e55 100644
>>--- a/tests/intel/xe_oa.c
>>+++ b/tests/intel/xe_oa.c
>>@@ -1332,6 +1332,59 @@ init_sys_info(void)
>>  	return true;
>>  }
>>+/*
>>+ * Open the xe device and set up all device dependent state. Also used to restore that
>>+ * state after the device has been unbound and rebound.
>>+ */
>>+static void oa_device_init(void)
>>+{
>>+	struct xe_device *xe_dev;
>>+
>>+	igt_assert_eq(drm_fd, -1);
>In main(), right before calling oa_device_init(), we already have an 
>assert to check if the device is already open or not.  Having both of 
>them seems to be redundant to me, maybe since we're moving everything 
>init() related to here, might as well remove that call from there?  
>Will point the call below in the review itself.

Sure, I will drop the check from main.

>>+
>>+	drm_fd = drm_open_driver(DRIVER_XE);
>>+	xe_dev = xe_device_get(drm_fd);
>>+
>>+	/* See xe_query_oa_units_new() */
>>+	igt_require(xe_dev->oa_units);
>>+	igt_require(xe_dev->oa_units->num_oa_units);
>>+
>>+	devid = intel_get_drm_devid(drm_fd);
>>+	sysfs = igt_sysfs_open(drm_fd);
>>+
>>+	/* Currently only run on Xe2+ */
>>+	igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
>>+
>>+	igt_require(init_sys_info());
>>+
>>+	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>>+
>>+	render_copy = igt_get_render_copyfunc(drm_fd);
>>+}
>>+
>>+/* Release all device dependent state set up by oa_device_init() */
>>+static void oa_device_fini(void)
>>+{
>>+	/* leave sysctl options in their default state... */
>>+	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>>+
>>+	if (intel_xe_perf) {
>>+		intel_xe_perf_free(intel_xe_perf);
>>+		intel_xe_perf = NULL;
>>+	}
>>+
>>+	if (sysfs >= 0) {
>>+		close(sysfs);
>>+		sysfs = -1;
>>+	}
>>+
>>+	if (drm_fd >= 0) {
>>+		xe_device_put(drm_fd);
>>+		drm_close_driver(drm_fd);
>>+		drm_fd = -1;
>>+	}
>>+}
>>+
>>  /**
>>   * SUBTEST: non-system-wide-paranoid
>>   * Description: CAP_SYS_ADMIN is required to open system wide metrics, unless
>>@@ -4970,7 +5023,6 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>>  		{ NULL },
>>  	};
>>  	const struct drm_xe_oa_unit *oau0, *oau;
>>-	struct xe_device *xe_dev;
>>  	igt_fixture() {
>>  		struct stat sb;
>>@@ -4995,25 +5047,8 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>>  		igt_assert_eq(drm_fd, -1);
>
>This call above ^ is the one I talked about in comment at the start.
>
>Apart from this,
>
>the patch LGTM, and with that,
>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

thanks,
Umesh
>
>>  		enable_trace_log();
>>-		drm_fd = drm_open_driver(DRIVER_XE);
>>-		xe_dev = xe_device_get(drm_fd);
>>-
>>-		/* See xe_query_oa_units_new() */
>>-		igt_require(xe_dev->oa_units);
>>-		igt_require(xe_dev->oa_units->num_oa_units);
>>+		oa_device_init();
>>  		oau0 = oa_unit_by_id(drm_fd, 0);
>>-
>>-		devid = intel_get_drm_devid(drm_fd);
>>-		sysfs = igt_sysfs_open(drm_fd);
>>-
>>-		/* Currently only run on Xe2+ */
>>-		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
>>-
>>-		igt_require(init_sys_info());
>>-
>>-		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>>-
>>-		render_copy = igt_get_render_copyfunc(drm_fd);
>>  	}
>>  	igt_subtest("non-system-wide-paranoid")
>>@@ -5222,13 +5257,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
>>  	}
>>  	igt_fixture() {
>>-		/* leave sysctl options in their default state... */
>>-		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
>>-
>>-		if (intel_xe_perf)
>>-			intel_xe_perf_free(intel_xe_perf);
>>-
>>-		drm_close_driver(drm_fd);
>>+		oa_device_fini();
>>  		disable_trace_log();
>>  	}
>>  }
>
>-- 
>Shekhar Chauhan
>Linux Graphics Software Engineer
>Intel Corporation
>
