Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB06C2A075
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03F10E332;
	Mon,  5 Jan 2026 08:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1VXyyIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F5510E2AF
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767603054; x=1799139054;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=fX2feVSYaPIinZWFspQb9o1U9ipYZ6vNDvghDEtP1Po=;
 b=d1VXyyISPGplEENakwtgSYK1l4xtBhcD5l3uh9gwYV2peqXFgHbURSYE
 THj1cdfpm5gOC+l5VhQBJe9GUbwXkPxFg17LcZ04q5lm/xkFvwyvTAb/R
 8O/2skpz3x8ZOtYlLwZPtPA5Nj1F71N90uUNgzrApqdcD12HHalCDgxpA
 /e176CTDnMBI8RUqPBbN8n4Zbub0jamreeqdyc/5c9I5caBM2IuR0A8ja
 OFuV6I+xpgUnLcPthyjYYxsVTINvbyEfZ2Jfcvb7y7LxLeog0oREDkxRD
 TjQFelzYTUaQOHPwXuM2N0vTTnZfxx0kg7zVbyarXxCwtP0tG0CtzOlli A==;
X-CSE-ConnectionGUID: AFZTSIedQfCBCt7fN2SIyA==
X-CSE-MsgGUID: D6jhvLuFQ7GwD1IoQm6Wdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="86386039"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="86386039"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:50:53 -0800
X-CSE-ConnectionGUID: b03mFQh5Rq2hFmhIA7Y18Q==
X-CSE-MsgGUID: W8l7CklrSbWOBasCVVgLzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202238724"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:50:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:50:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 00:50:52 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:50:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9E5IDWG2fvBi2eEqE22O7EDivD5tXGGWvaAQSknK7m2om4m07519SWZaLhNXgYtTmiVwnegbujrWMnjgu4xAbA898KCjFnLSCqJdMda13IWh4KqXfbd4+/rpXa4LhfdjzUwvig52KuYLhz2EM3HPhHBSwZSsTPH/9E+OnkGsgv87DbJFtLnyD03pUouQsNu/NAXMKyaKSogL0szyluuJdc6DQftHpHbKhqn2xcINPK75XJI2KENocGFYlgLaUqcWUvn6+VrGzUwbFJ3i5PmnSylGJkXqrlNuHk9eXTNHtoRlT2iZNBBJ3unfSUD8RePAE+81XWqYdqXHNhPVmqO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+t2X5QalVU+X8I2MVK5q80gyQcqDrnHrtJ/zLPIpDQ=;
 b=So9C3EASUnPP0TL3H2jeeWiYuhS00vTPnmVnV8JNRVUsEgKo+4n52k9am0277MW09z8inbOS0fABASqYAsnZOGToRNTirwJqNkZrR2Znhy+kstqJwOUd9gNFrOj14htGVZv5duLXSt93lb2s4uCemCHfoUtTq8fljcL3XFkVmbEOB1uFFPuqLLwc6Y8CNze6UUpKhqx33XwQ/Oz92jkqptj4SrhZQQPLFSzb89MehZpU+rjYtrO1ZI4UIDWWQK485rSjk4GHYmGK65t7L0uBiiVDZr/nzXkKLSwyWTHV1XY2YCjSpo1hYYYwNhjV/1z/6PiJ4vqRMFC1tSNm1Byo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:50:47 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:50:46 +0000
Date: Mon, 5 Jan 2026 14:20:40 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 Discard wait_for_lmem_ready from fault injection test
Message-ID: <aVt7YGTkz-ulsD6Y@bvivekan-mob1>
References: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
 <176608313455.102714.11893719502770702629@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176608313455.102714.11893719502770702629@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::14) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: a612991c-5c03-4533-e59d-08de4c378467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjBXRTljOExKNkM4amh4YTBBbUMvaEJUczZGcFhqbnZCYSs4aCtlaXBUM2ZW?=
 =?utf-8?B?aVB1dEsrdC9LZFR1bHNDZFZ2WncrOEpmRXVHWHA3UXI3MklLVzJna2RIZi90?=
 =?utf-8?B?UnFoUXpnM2Q5M3JqdmxBS2tYOGpiYW93b05Gam4yU296YnVDVXlvWnYvT0dJ?=
 =?utf-8?B?VlVXL0t6cm03bGh6cDlZdUNmUE1OdXFFOGZ4bDhYY0hpYnBoa090QTJ3dSsv?=
 =?utf-8?B?UmdBaXkrcnlObWVPelBNZ2lyTDhpMlhFSThZOElXR283ZXA4L1liZ0FPQWV4?=
 =?utf-8?B?UUNqSWpudnlqVGdQellDT0hWemxmQXVTS004SlZGRGFnalV4djNLaExFQ0RN?=
 =?utf-8?B?SlV1Zy90WEQxZlBHRUFjZ0hWcXZ3VzJYT0lCN3R4UGQvVWdRcVlwWlEwNHBi?=
 =?utf-8?B?QzdPL2V6clluQ0Uzd2JsQk9jd1ZkUi8xcUw5dzZHeVhFSHFGRVl3QmR1Qm51?=
 =?utf-8?B?VU1uNkplazBldHZRcnVmMVFBU3Nka1dSdksvUnp3ejlQSmROZjcyT2xSL2Qr?=
 =?utf-8?B?alloL3lqYmJ3NnFDeEhHR1NSL3gzUHVNa3k2U1gvVG1WTHZBOFNFOEp4R2hk?=
 =?utf-8?B?QVhEZDlNS01pc3lZcmoxZnBEQXB3VTZJbXRUNzZyQit0dVZpcFVPSlJHSkRK?=
 =?utf-8?B?cjdiOGhGM2hQZlVYMGQ3MmY1bklPaGxHMGw4VnIrLzFXUlZsam44TG1RZFVG?=
 =?utf-8?B?RnJ4cDVTWWZwRE1SNDQzMk9wYnBUeGhkcStZcEFadWp5WWNqQ0ZWVThQVDZl?=
 =?utf-8?B?M24yNG52Tzg4eGo5bzNoRVRzOEptWEdtbzZ6TmNxZUpuOXM2Q0JOQm1YcXRL?=
 =?utf-8?B?ODEzMVk1MG9QalJTeHo3cTdXQVBxaDNiSHpXeUl1TFdadFpRUzNiNlpZUGo3?=
 =?utf-8?B?NnZUa3dDMjVGQk91VUhBTkJXUWpoMCsvMUFueWlDTFRLOHpyM3puMmpXUyty?=
 =?utf-8?B?Szd3V2VaWkN4aWR6amY1ZER6cms4WmdnS2pNMzQzdzg0WHZWS0RqaXI4ZWI0?=
 =?utf-8?B?QUJCaUx4RUs2TkZMT0lVQThmQ3NrWHdtNVZGalRUKzJ2RzJzeWZKOVBLTHVy?=
 =?utf-8?B?cnNXZ1pyTTlzZkVpL2NnbGhiN0FTM29SZUYwNFhBeFZyMWlkYzZQSnRtcVE5?=
 =?utf-8?B?VWYvTmNvcTNJaStxb1VWV01xRDlEbFhPcVdSeUhSODM5OTYvUGQzOHovc21v?=
 =?utf-8?B?NWZEWnF3bEkzUFdZcGh2NUhTUXJJZUVQZE9Yek5vaHU3M2phZGlNb1cyZlN2?=
 =?utf-8?B?MVZLL2dQWVZldHBXaTBvQWJtOXUvY3hrU3FwSFNyUitwQ1VDQUF5K3hrQzlZ?=
 =?utf-8?B?cnBKNW90RWY1THNZVUdBUi9jV2lHSnVkNEpWblNMUlF2V1hwR3hjajhLb0ZZ?=
 =?utf-8?B?cXlvVzdYZjA5QzZUdzcvT1dZcDFURUVmN2k5MzhOeWlwejRFWnlnalFJM00x?=
 =?utf-8?B?eEx0VnhnRkg3VFRUL3VYOFhLYVhCa09VaXdqMGJlak5WMWw3NmsvN1E0bXZy?=
 =?utf-8?B?T3UxVnNQK0wxK0dDSlQyQ0ltazVWNjU4dXJ5U1RSZS9LeGNXUXQxM1RHMVZE?=
 =?utf-8?B?SGVrR0duNXVEdnBBSnBLcnEwaUJPb1plMzVYdU9iTWlOdVlPU3ZPRUE4RHNZ?=
 =?utf-8?B?YW1rQk9iUnMwRmV0MlR4Q3R1a3VjR25GTVV4VFZObldLb1pWUFhZK0RGZEV3?=
 =?utf-8?B?QWp5cnhSdE5taWpjbkYwY2t0UFJzMFhjZnBFSHByc1h3THl2ZEFaWXAvU1ky?=
 =?utf-8?B?bzdpeTd3bjVMeitNaTVYR1pucXk5UDhsL3ExeUpyaU13eHVQVHk4dnRyeSts?=
 =?utf-8?B?QmFJU3JCeFJGQk8zVTZnU2trUEtibWYrNEtwclBESTIwWnNOYWFDRyt2TXIw?=
 =?utf-8?B?Z1JPZzQxU0NxZ3NobU9ydFEwWFY2VWhPbzhSL2tBaFUreHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21LSFNxanVSTE55V2NnQzFybDVrOUY1OXhQcHYwUHQ5UWxKbmUycGFjcmJq?=
 =?utf-8?B?ZDJDYUpQU2x2Y1pkQWtDV0UyYjFkd0Z3UWF3dW9iVk5XblB6RHlLTTNDUFlv?=
 =?utf-8?B?djQ5dGRoQkdBeEdoUHh6SE9mT1NoZS82S1N3a3pPb1IxYkpvNTcvTHVFdWFY?=
 =?utf-8?B?bHo4TUhmcUhHWHAzc1ZPeG92bTZNNG10M0Y5Z0lubXExSGt1LzBWUWtsazlB?=
 =?utf-8?B?SDVvUXEvaHRkZ1RHbDhJRkN3Nnhnczh3Vm9TVkIxa0ZYZ2Z5RjZBV2RHZFN5?=
 =?utf-8?B?cHYzVVZJYVhVcnVuSmtSZi9HT2lCSDFYdEgyQjRVNkNnN0o4OFI4Z2s3cDVj?=
 =?utf-8?B?Wkd6TUQ3M0xMUTdORVZ6aVg0bUVIMERhZTUwdFZmanlPZC9vQ3NWZDVDRmND?=
 =?utf-8?B?NHV4c1BFT2ZOQk0rNWFXS216bGJQNFgrS3h3Njhpc0pjbzlUUTFidVBKeG5H?=
 =?utf-8?B?aVNYbHdGRVdMR3lFbjNDSmNwM3ZlRFgyWkUvRFNIN0pzY1FmNFlpVjVNdmhJ?=
 =?utf-8?B?ZDJpS3RibXJoUXNkRTZzQkdtRk5aZ2pjZ0FvWXFSN3FVOVpBV2h0eklJaCsx?=
 =?utf-8?B?OTZlTXlUVlhTbVdUOUtMRjlVaFVzbzRQb1RwOSsrcDJGM3NtczN1b0hlZjFI?=
 =?utf-8?B?UEJDSXY4VldCMy9NcHJsN0JxNXdCOTltWmVGVWZGbFpSOTczOXpsNkhFMWJs?=
 =?utf-8?B?V2NISEpEQUpseVh0RFlYUTdRcGg4T2FodExKNElzYXNBV0xDeHBUUUpnV3Zr?=
 =?utf-8?B?MVRhTXg4QzZOM3hDTUtaMUJGc1lUL0tPR3lnODJvMVF5alYyQXJsdGp5anNz?=
 =?utf-8?B?M25mK2wvVUJQOXQ0emdqVE85M0Vuc3UzMVdNZ0xsUk1qYTBQRnJndFV6RTRt?=
 =?utf-8?B?ZWlETWNjVnFMTVRIdXg2b0lXTWdOcTF2aks4Q0M5eFloZm13UHBHZHJIWUgy?=
 =?utf-8?B?VEV5R08wL1RLOEFpYkdwRm9uaHEvZ25uTnVKdDM1MFNiUGRCVXBYYXlncUpD?=
 =?utf-8?B?VVZuSDJqN1gzakcrN0NtSEYyanlCckZNWEQvN3RNNm4wcHl2bHlTOFdJdXps?=
 =?utf-8?B?QnhYUjNvUjl5T1ZSR0NmZzdXdy9adUs5NSs0cU92TVFjMjZjM203R0NKd2pF?=
 =?utf-8?B?N1RIaTR3cXZvS1NqSnJzUEh5Q2NXZWx4L2h3eXZ5UFdpQTF3N0tpS0pGUWlU?=
 =?utf-8?B?MUNpYW1OR01UWWFDQTA2M3Uyc1FDYTk4NjNNS1F1czVTSGdwS2REMGtPdmFX?=
 =?utf-8?B?aDAvbVZZY0t2czM1RW9nWFg2cG0rQmh0enE4Yjk0d2c2VTFNNXdlRFJ6cHVE?=
 =?utf-8?B?R3J1eC84Z0wramxtcFlUeTVPd29ZcTcvNlJLOVE3WHpJaXFpRkIrenVXeGFN?=
 =?utf-8?B?NzhaSkl4bi9tQzZ6SGs3aUVRL1dvY09nZnpiWkNKOW5sNlM5TGFPN0dtRHd4?=
 =?utf-8?B?L2VmK1Q1VWlNcnBMUVlOOFdGUDBnazFYRkZ4a0hnazVya1pWVmJnSWtWUzNP?=
 =?utf-8?B?bXZVWXRkTkI0dmpCa0lsM0dWL3pnbTczUEkzb0xSMCtkRHlmTnptc0pjYnVH?=
 =?utf-8?B?Nll1VW40aWJ4bHN6eEx6TUpOcGFkKzh2ZlVKbnNyN01ERnNpckFLWE1oTlQv?=
 =?utf-8?B?Vk5vNzJhaHpNVEJ5bzMzanlKODFyaWNrNWtxU0cyL3hYUHkrcmNLV3VFY3pP?=
 =?utf-8?B?bzFZckJJbFNDTDFIQlJacUNpUTZFWkVCaWpXaHlMbHJlNmw2U0FFUXFjWFRq?=
 =?utf-8?B?ajgrMHJ1R09NR21SSXFKQWJ3VWdDME5BOE1VUHpibjZBTzl6YzNOWi9lT3R0?=
 =?utf-8?B?dVF4b3htTFdnQzMwRzJGdFdBQUFtL0dWMWlBbkZkbkJOaUR1Wnl2dGl0TFkx?=
 =?utf-8?B?b1FxYWIwaXJQUXZrRmppVlg2akZmMjBkOU5rN0szcnZ3UXBwZmFtUms2Zlh5?=
 =?utf-8?B?ZFFyVXZ6R0VqTUgvanRlcldyNmZEUVYxUEZGeDhmN0E1VjdMcG5Hd093RUMy?=
 =?utf-8?B?UUx5UEVGRkNKRTVzc0RsQmVvOU9zbExNdzZSYTJTellkbXNFVEQ0YSs5Y3hH?=
 =?utf-8?B?Y3o0dGVqWUJKbFMxMXVIMHpvZUZPQmV3YUdtdk5JYVpuS0Ftdy95YXRPTWNq?=
 =?utf-8?B?OG41VlRPV0w3NWpvN3JkZmJEQ3llckp6SlJjWjZVYjBmWm5XWDV2SUhCaGZJ?=
 =?utf-8?B?Mkh2RlBKVEZuSzQzeCswYjBKOUVEZnZERXA1ZFlIWWQxTVdkb3FaZ3dMOGZE?=
 =?utf-8?B?UVoreUVVeHBVY2xraXpaMGJuMTQ0RkNlMFFrNHllWGgyOHJvS0Jyc2NZY3FL?=
 =?utf-8?B?NkJaU2huVXlhQVdsa1pkMzd3aE52dE0zSk9uRHJWQ0dKRjRlSm1SZ3NCamxN?=
 =?utf-8?Q?s/w27Fb97OQgvxiBRbOtqu5XJDXMvqPJ6ke22?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a612991c-5c03-4533-e59d-08de4c378467
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 08:50:46.7563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ9YD1lKrlaUAkalSOO7Uuqwvd/snmPNqRs32IE3Zg1UAfiP1VKxaDACHLgqcbXCF+BNqyy6CPh+8z/CkjjyXMvxCtUnCcm3GlHXGgcXREjDnWabuXxYh0TGHEkAuAZE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

On 18.12.2025 18:38, Patchwork wrote:
> == Series Details ==
> 
> Series: Discard wait_for_lmem_ready from fault injection test
> URL   : https://patchwork.freedesktop.org/series/159151/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8670_FULL -> XEIGTPW_14227_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14227_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14227_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_14227_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-1.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][2] +25 other tests dmesg-fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html
> 
>   * igt@xe_exec_system_allocator@many-new-bo-map:
>     - shard-bmg:          [PASS][3] -> [TIMEOUT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@many-new-bo-map.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@xe_exec_system_allocator@many-new-bo-map.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][5] ([Intel XE#6703]) -> [SKIP][6] +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

No test other than xe_fault_injection is affected by this patch. So all
the above failures can be ignored.

Regards,
Bala

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14227_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#6815])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@device_reset@unbind-reset-rebind.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@fbdev@unaligned-read:
>     - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@fbdev@unaligned-read.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@fbdev@unaligned-read.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1125])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#5177] / [Intel XE#6703])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@intel_hwmon@hwmon-write.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2:
>     - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#4912]) +1 other test incomplete
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-dp-2.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          [PASS][17] -> [DMESG-WARN][18] ([Intel XE#6766])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2191])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#367])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2887]) +4 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +9 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#3432]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#4416]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#306])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-planes-random:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2341]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#3278]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2320]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1424]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2321])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1508])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4302])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1340])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4331])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2244])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@kms_dsc@dsc-with-bpc.html
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2244])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2316]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293]) +6 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [FAIL][52] ([Intel XE#3106] / [Intel XE#4683]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2293] / [Intel XE#2380])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#656]) +15 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +8 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6557] / [Intel XE#6703]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#651]) +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2312]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2311]) +8 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2313]) +11 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [ABORT][63] ([Intel XE#6740]) +1 other test abort
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#356])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#599])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@kms_plane_lowres@tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2393])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#5021])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6886]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6886]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1439] / [Intel XE#836])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#6693]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1406] / [Intel XE#2893]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@pr-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_psr@pr-primary-render.html
> 
>   * igt@kms_psr@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1406] / [Intel XE#6703]) +7 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_psr@psr-suspend.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1406] / [Intel XE#2414])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#3414] / [Intel XE#3904])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1435])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-scaler:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#6503]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2426])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1091] / [Intel XE#2849])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1447])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#6010])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-7/igt@xe_configfs@survivability-mode.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4837]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug@basic-vm-access-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#4837]) +3 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@xe_eudebug@basic-vm-access-faultable.html
> 
>   * igt@xe_eudebug_online@interrupt-all:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@xe_eudebug_online@interrupt-all.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#688]) +4 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
>     - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#6557] / [Intel XE#6703]) +4 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2322]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1392]) +3 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#6703]) +534 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#6874]) +13 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#6874]) +14 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#5007])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-new-busy:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#6703]) +155 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-new-busy.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4943]) +6 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4943]) +13 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2833])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2833])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2248])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-5/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2284] / [Intel XE#366])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
>     - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#6251])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4650])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
>     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#4733])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#944]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#944])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#4130])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-1/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          [PASS][116] -> [FAIL][117] ([Intel XE#6569])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4273])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_vram@vf-access-beyond:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#6376])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@unaligned-write:
>     - shard-bmg:          [SKIP][120] ([Intel XE#2134]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@fbdev@unaligned-write.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@fbdev@unaligned-write.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-bmg:          [SKIP][122] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@intel_hwmon@hwmon-read.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][124] ([Intel XE#6054]) -> [PASS][125] +3 other tests pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][126] ([Intel XE#3862]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-bmg:          [SKIP][128] ([Intel XE#2316]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][130] ([Intel XE#301]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][132] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][133] +1 other test pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check:
>     - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [PASS][135] +530 other tests pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][136] ([Intel XE#718]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-bmg:          [SKIP][138] ([Intel XE#6693]) -> [PASS][139] +1 other test pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_rpm@i2c.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][140] ([Intel XE#6361]) -> [PASS][141] +2 other tests pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][142] ([Intel XE#2142]) -> [PASS][143] +1 other test pass
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
>     - shard-bmg:          [SKIP][144] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][145] +6 other tests pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
> 
>   * igt@xe_module_load@reload:
>     - shard-bmg:          [FAIL][146] -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_module_load@reload.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_module_load@reload.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][148] ([Intel XE#6251]) -> [PASS][149] +1 other test pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          [SKIP][150] ([Intel XE#6703]) -> [SKIP][151] ([Intel XE#2233])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          [SKIP][152] ([Intel XE#6703]) -> [SKIP][153] ([Intel XE#2327]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-bmg:          [SKIP][154] ([Intel XE#2327]) -> [SKIP][155] ([Intel XE#6703]) +2 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>     - shard-bmg:          [SKIP][156] ([Intel XE#6703]) -> [SKIP][157] ([Intel XE#1124]) +9 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          [SKIP][158] ([Intel XE#2328]) -> [SKIP][159] ([Intel XE#6703])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          [SKIP][160] ([Intel XE#1124]) -> [SKIP][161] ([Intel XE#6703]) +10 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [SKIP][162] ([Intel XE#6703]) -> [SKIP][163] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          [SKIP][164] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][165] ([Intel XE#6703]) +2 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-bmg:          [SKIP][166] ([Intel XE#6703]) -> [SKIP][167] ([Intel XE#367]) +2 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          [SKIP][168] ([Intel XE#367]) -> [SKIP][169] ([Intel XE#6703])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          [SKIP][170] ([Intel XE#6703]) -> [SKIP][171] ([Intel XE#2887]) +11 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][172] ([Intel XE#6703]) -> [SKIP][173] ([Intel XE#2652] / [Intel XE#787])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          [SKIP][174] ([Intel XE#6703]) -> [SKIP][175] ([Intel XE#3432])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          [SKIP][176] ([Intel XE#2887]) -> [SKIP][177] ([Intel XE#6703]) +11 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][178] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][179] ([Intel XE#6703]) +1 other test skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          [SKIP][180] ([Intel XE#2724]) -> [SKIP][181] ([Intel XE#6703]) +1 other test skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#2724])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          [SKIP][184] ([Intel XE#6703]) -> [SKIP][185] ([Intel XE#2325]) +4 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          [SKIP][186] ([Intel XE#2325]) -> [SKIP][187] ([Intel XE#6703])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_chamelium_color@degamma.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          [SKIP][188] ([Intel XE#2252]) -> [SKIP][189] ([Intel XE#6703]) +7 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-bmg:          [SKIP][190] ([Intel XE#6703]) -> [SKIP][191] ([Intel XE#2252]) +6 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_content_protection@dp-mst-suspend-resume:
>     - shard-bmg:          [SKIP][192] ([Intel XE#6743]) -> [SKIP][193] ([Intel XE#6703])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][194] ([Intel XE#1178]) -> [SKIP][195] ([Intel XE#6703])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_content_protection@legacy.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [FAIL][196] ([Intel XE#6707]) -> [SKIP][197] ([Intel XE#6703])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_content_protection@uevent.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-bmg:          [SKIP][198] ([Intel XE#6703]) -> [SKIP][199] ([Intel XE#2321])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-max-size:
>     - shard-bmg:          [SKIP][200] ([Intel XE#6703]) -> [SKIP][201] ([Intel XE#2320]) +4 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-max-size.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          [SKIP][202] ([Intel XE#2320]) -> [SKIP][203] ([Intel XE#6703]) +11 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-bmg:          [SKIP][204] ([Intel XE#2321]) -> [SKIP][205] ([Intel XE#6703])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][206] ([Intel XE#2286]) -> [SKIP][207] ([Intel XE#6703]) +1 other test skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          [SKIP][208] ([Intel XE#6703]) -> [SKIP][209] ([Intel XE#1508])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          [SKIP][210] ([Intel XE#6703]) -> [SKIP][211] ([Intel XE#4354])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          [SKIP][212] ([Intel XE#6703]) -> [SKIP][213] ([Intel XE#4331])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-bmg:          [SKIP][214] ([Intel XE#6703]) -> [SKIP][215] ([Intel XE#2244])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          [SKIP][216] ([Intel XE#2372]) -> [SKIP][217] ([Intel XE#6703])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_feature_discovery@chamelium.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          [SKIP][218] ([Intel XE#1138]) -> [SKIP][219] ([Intel XE#6703])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_feature_discovery@display-4x.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          [SKIP][220] ([Intel XE#6703]) -> [SKIP][221] ([Intel XE#2374])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_feature_discovery@psr2.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-bmg:          [SKIP][222] ([Intel XE#6703]) -> [SKIP][223] ([Intel XE#2316]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][224] ([Intel XE#2316]) -> [SKIP][225] ([Intel XE#6703]) +1 other test skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-bmg:          [SKIP][226] ([Intel XE#6703]) -> [SKIP][227] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          [SKIP][228] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][229] ([Intel XE#6703]) +3 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][230] ([Intel XE#6703]) -> [SKIP][231] ([Intel XE#2311]) +22 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][232] ([Intel XE#2311]) -> [SKIP][233] ([Intel XE#6703]) +22 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          [SKIP][234] ([Intel XE#4141]) -> [SKIP][235] ([Intel XE#6703]) +14 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][236] ([Intel XE#2312]) -> [SKIP][237] ([Intel XE#4141]) +5 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][238] ([Intel XE#4141]) -> [SKIP][239] ([Intel XE#2312]) +1 other test skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][240] ([Intel XE#6703]) -> [SKIP][241] ([Intel XE#4141]) +12 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][242] ([Intel XE#2312]) -> [SKIP][243] ([Intel XE#6703]) +4 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-bmg:          [SKIP][244] ([Intel XE#2312]) -> [SKIP][245] ([Intel XE#2311]) +6 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][246] ([Intel XE#2311]) -> [SKIP][247] ([Intel XE#2312]) +2 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-bmg:          [SKIP][248] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][249] ([Intel XE#2311])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
>     - shard-bmg:          [SKIP][250] ([Intel XE#2312]) -> [SKIP][251] ([Intel XE#2313]) +8 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][252] ([Intel XE#6703]) -> [SKIP][253] ([Intel XE#2312]) +8 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>     - shard-bmg:          [SKIP][254] ([Intel XE#6703]) -> [SKIP][255] ([Intel XE#2313]) +23 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          [SKIP][256] ([Intel XE#2350]) -> [SKIP][257] ([Intel XE#6703])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][258] ([Intel XE#2313]) -> [SKIP][259] ([Intel XE#6703]) +25 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][260] ([Intel XE#2313]) -> [SKIP][261] ([Intel XE#2312]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-bmg:          [SKIP][262] ([Intel XE#6703]) -> [ABORT][263] ([Intel XE#6740]) +1 other test abort
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][264] ([Intel XE#3544]) -> [SKIP][265] ([Intel XE#3374] / [Intel XE#3544])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [ABORT][266] ([Intel XE#6740]) -> [SKIP][267] ([Intel XE#1503])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-bmg:          [ABORT][268] ([Intel XE#6740]) -> [SKIP][269] ([Intel XE#6703])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_hdr@invalid-metadata-sizes.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-bmg:          [SKIP][270] -> [SKIP][271] ([Intel XE#6703]) +2 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          [SKIP][272] ([Intel XE#6703]) -> [SKIP][273] ([Intel XE#4329])
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          [SKIP][274] ([Intel XE#6703]) -> [SKIP][275] ([Intel XE#2393])
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75:
>     - shard-bmg:          [SKIP][276] ([Intel XE#6703]) -> [SKIP][277] ([Intel XE#6886])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
>     - shard-bmg:          [SKIP][278] ([Intel XE#6886]) -> [SKIP][279] ([Intel XE#6703])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          [SKIP][280] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][281] ([Intel XE#6693])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          [SKIP][282] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][283] ([Intel XE#6693])
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-bmg:          [SKIP][284] ([Intel XE#6693]) -> [SKIP][285] ([Intel XE#6814])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_pm_rpm@package-g7.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          [SKIP][286] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][287] ([Intel XE#1406] / [Intel XE#6703]) +3 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          [SKIP][288] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][289] ([Intel XE#1406] / [Intel XE#1489]) +9 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          [SKIP][290] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][291] ([Intel XE#1406] / [Intel XE#6703]) +10 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@kms_psr@fbc-pr-primary-page-flip.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-bmg:          [SKIP][292] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][293] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          [SKIP][294] ([Intel XE#6703]) -> [SKIP][295] ([Intel XE#2330])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-bmg:          [SKIP][296] ([Intel XE#6703]) -> [SKIP][297] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          [SKIP][298] ([Intel XE#2330]) -> [SKIP][299] ([Intel XE#6703])
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          [SKIP][300] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][301] ([Intel XE#6703]) +5 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          [SKIP][302] ([Intel XE#6703]) -> [SKIP][303] ([Intel XE#1435])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][304] ([Intel XE#1435]) -> [SKIP][305] ([Intel XE#6703])
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-basic:
>     - shard-bmg:          [SKIP][306] ([Intel XE#6503]) -> [SKIP][307] ([Intel XE#6703]) +1 other test skip
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@kms_sharpness_filter@filter-basic.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter:
>     - shard-bmg:          [SKIP][308] ([Intel XE#6703]) -> [SKIP][309] ([Intel XE#6503]) +1 other test skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_sharpness_filter@invalid-plane-with-filter.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@kms_sharpness_filter@invalid-plane-with-filter.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][310] ([Intel XE#2426]) -> [SKIP][311] ([Intel XE#6703])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-bmg:          [SKIP][312] ([Intel XE#6703]) -> [SKIP][313] ([Intel XE#1499]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@kms_vrr@flip-basic.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-bmg:          [SKIP][314] ([Intel XE#1499]) -> [SKIP][315] ([Intel XE#6703]) +1 other test skip
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          [SKIP][316] ([Intel XE#6703]) -> [SKIP][317] ([Intel XE#6599])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>     - shard-bmg:          [SKIP][318] ([Intel XE#4837]) -> [SKIP][319] ([Intel XE#6557] / [Intel XE#6703])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>   * igt@xe_eudebug@vm-bind-clear:
>     - shard-bmg:          [SKIP][320] ([Intel XE#4837]) -> [SKIP][321] ([Intel XE#6703]) +8 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_eudebug@vm-bind-clear.html
> 
>   * igt@xe_eudebug@vma-ufence:
>     - shard-bmg:          [SKIP][322] ([Intel XE#6703]) -> [SKIP][323] ([Intel XE#4837]) +9 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug@vma-ufence.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-9/igt@xe_eudebug@vma-ufence.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-bmg:          [SKIP][324] ([Intel XE#6665] / [Intel XE#6681]) -> [SKIP][325] ([Intel XE#6703])
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_eudebug_online@pagefault-read-stress.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_online@pagefault-write:
>     - shard-bmg:          [SKIP][326] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][327] ([Intel XE#6703]) +3 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@xe_eudebug_online@pagefault-write.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_eudebug_online@pagefault-write.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-bmg:          [SKIP][328] ([Intel XE#6703]) -> [SKIP][329] ([Intel XE#4837] / [Intel XE#6665]) +6 other tests skip
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          [SKIP][330] ([Intel XE#6703]) -> [SKIP][331] ([Intel XE#2322]) +6 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>     - shard-bmg:          [SKIP][332] ([Intel XE#2322]) -> [SKIP][333] ([Intel XE#6703]) +8 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>   * igt@xe_exec_multi_queue@many-queues-basic-smem:
>     - shard-bmg:          [SKIP][334] ([Intel XE#6703]) -> [SKIP][335] ([Intel XE#6874]) +26 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-basic-smem.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
> 
>   * igt@xe_exec_multi_queue@one-queue-priority-smem:
>     - shard-bmg:          [SKIP][336] ([Intel XE#6874]) -> [SKIP][337] ([Intel XE#6703]) +30 other tests skip
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-priority-smem.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
>     - shard-bmg:          [SKIP][338] ([Intel XE#6703]) -> [SKIP][339] ([Intel XE#5007])
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-dontunmap:
>     - shard-bmg:          [SKIP][340] ([Intel XE#6703]) -> [FAIL][341] ([Intel XE#5625])
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-dontunmap.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-dontunmap.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset:
>     - shard-bmg:          [SKIP][342] ([Intel XE#6703]) -> [SKIP][343] ([Intel XE#4943]) +19 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
>     - shard-bmg:          [SKIP][344] ([Intel XE#4943]) -> [SKIP][345] ([Intel XE#6703]) +19 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-bmg:          [SKIP][346] ([Intel XE#6703]) -> [SKIP][347] ([Intel XE#586])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_mmap@small-bar.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          [SKIP][348] ([Intel XE#6703]) -> [SKIP][349] ([Intel XE#2248])
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-bmg:          [SKIP][350] ([Intel XE#6703]) -> [SKIP][351] ([Intel XE#5694])
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          [SKIP][352] ([Intel XE#6703]) -> [SKIP][353] ([Intel XE#2284]) +1 other test skip
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pxp@display-black-pxp-fb:
>     - shard-bmg:          [SKIP][354] ([Intel XE#6703]) -> [SKIP][355] ([Intel XE#4733])
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_pxp@display-black-pxp-fb.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-bmg:          [SKIP][356] ([Intel XE#4733]) -> [SKIP][357] ([Intel XE#6703]) +2 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          [SKIP][358] ([Intel XE#6703]) -> [SKIP][359] ([Intel XE#944]) +2 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          [SKIP][360] ([Intel XE#944]) -> [SKIP][361] ([Intel XE#6703]) +2 other tests skip
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          [SKIP][362] ([Intel XE#6557] / [Intel XE#6703]) -> [FAIL][363] ([Intel XE#6569])
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          [FAIL][364] ([Intel XE#6569]) -> [FAIL][365] ([Intel XE#5937])
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/shard-bmg-9/igt@xe_sriov_flr@flr-vf1-clear.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
>   [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
>   [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
>   [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
>   [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8670 -> IGTPW_14227
> 
>   IGTPW_14227: 13b6d583b5c4295ae214e9134601e8205292c134 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8670: 8670
>   xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/index.html
