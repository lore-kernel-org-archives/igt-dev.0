Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2416AD2F02A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 13:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24E110E008;
	Tue, 27 Jan 2026 13:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsdHUvRg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76C010E008
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769520340; x=1801056340;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P+xE83t8Exhd/z3UxWtQ+vqBbzOG3x0mF6F70IPVhpw=;
 b=AsdHUvRgSmXYQHJhXPKOi3DZynhxoMgGo9sv6YIoDYGGp98QRKI9vxKH
 LsTExyeElLufslacNJ4hVDdeSSJYotpLpavKrE7hCbVif5uwr3ja2rxbB
 Rui07fDKa8+4HdRCjT+zkQwusjzFkKLYz0EwvxnvJJrAA4geZz6+lq1ew
 225dQcn1VbvAtY4ZHmrH6MxlFrqTNOhFIqfhcX0ugWYRRTV7mq1Zh/3FH
 qhdPSfRukt9umhULhFtZ6E6KLeVl57TRaoAEPkcMpWj3tEUuq7agbflzE
 wbdTr00KcaRqU+EIPsid2Mbm0N+UhfY1ZgKz3g4aEO+SPb5jfXXjyTqUW A==;
X-CSE-ConnectionGUID: /9jBQNEHRoetx0zFKwGz0Q==
X-CSE-MsgGUID: mhnXBKMTQsuS016h79D36A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="74337136"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="74337136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 05:25:39 -0800
X-CSE-ConnectionGUID: v9xF+6GgSKyGDSVOft7TZA==
X-CSE-MsgGUID: XHQdpkUqTjODsJIj5aMLTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207593428"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 05:25:38 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 05:25:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 05:25:38 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 05:25:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWq2dYgGneFU4+GuEymr603EOq5vW63/YX8YepQkhdIMET590WT6U6beJyKKcd2xSlz2sTl5/t5hktJFWgU9ZxAv/FzPmg1KvSYk3qQAAwQVdnM4x/5y5DHy7IBTts13ABbHBnGRPc5pRjUlpofelRGvG7WS4NhsXAsmsnsqNdvsPJYg4o5axF9qsSs6x4a9GNjsASMJNekI3YMup0+GQ5NfL2VFflm6OmyPx0chPGkawZokVLH3uEDzjO6s5CJppF4dewVBRsyTTCAyuBdy/A8xzUltHb85tvZpIEqVaWLe5tyJ9omtDwI0PSbvFKbMZQarGItvNc036kVDIjcoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwYHmd4cVPslpG4mjG3sNnF7g0PB0m/tfVTSWCW/nDs=;
 b=QmGnwlST5M5r+KTAUWC2ADg4NENH747uDhlbPZDOD+aW2Z3Kav5wdQepf1BNN122hJvbHVz6iLXGgND4msbIoopYULUbfeM36y6QSW7Bwv+KyfHov8Uh+niBVXLS8Z2pR+Od/CtuoLbE4C5qnLAghwQO+zjLGDj1S7q9LFheuVqMxK4QnNr558V4Bag2/VknudDVLt/R8jVWS3uz96aJWV+g9sHH6VEJBMa+o0N++6pywcL9LZylU3u+H3zoX4dUzW6mx7+NvJe2ZVuhAJx0Xjoh5PBq15AV0dTHxbtvPD/M4m+qJZHJ93bmQGq9eltx78Ay6oh7+G6eBPuld0s2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 13:25:35 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:25:35 +0000
Message-ID: <8c0a066a-5b89-4233-a578-54f073a7621c@intel.com>
Date: Tue, 27 Jan 2026 14:25:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_sriov_device: Add helper to get VF PCI
 slot address
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.winiarski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
 <20260115131812.256678-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260115131812.256678-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0032.eurprd08.prod.outlook.com
 (2603:10a6:803:104::45) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MW4PR11MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc7e41d-13ff-4e3b-eef4-08de5da78d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3RWZjZ5cmcrOHROWDhiQzcwZVZwWTBYYXl0TVNlbXRIeEt4TXgxeVJLZUgw?=
 =?utf-8?B?c2I5NmF1bTFURXB6Y2c1OS9QYnZ1d2VYaysrUHphOHJVYVgvR212bHR4eTZJ?=
 =?utf-8?B?QlhwM2JxNXlURTNHUWI4UTk0cGVBQzVpODkyaTNMcS95OVVzcjhTMEdoQkVw?=
 =?utf-8?B?TVlaSU5iL0g2cmhqeGk2QkJEdHBJTDZUd3p0QVIyY1pnT3RLU2QwaExWaDZ1?=
 =?utf-8?B?R3EzTVlYaUJSQkhrZDFKcUxKTGZEQk45dUk0bjdZc0pkR21xOGNKbWVYTzdv?=
 =?utf-8?B?VlFtRUVGeGp3TWJxRU01UkQyY0tDZ3hMKzVwRW1MZC9GaHRKOU9oc0M4STRn?=
 =?utf-8?B?c2VDbkpwM3F6Yk1Yd0FQWkJWaU9nVFVEV1pnOXFZZDc4K1VPYmg1L1BnVmto?=
 =?utf-8?B?bmNNSmJhZjgxRHl2L3BkdUExVGpKUlhOVXgzR1VNcWdPZVFmQnl3WlZUbExl?=
 =?utf-8?B?b3Z3aUtRRmErL1ByaU5hWHRjOUgvN3h3cGZCT2VCSGN6cVRIMHV4allEMDZP?=
 =?utf-8?B?Qm9BdHQwbTR6ZTZwYk0vUzkzL1U1S2NzYXFZZXhPRjNzMTBqTHg4WXNtckx0?=
 =?utf-8?B?SVFDbkp0SUdtS05nZk1UQTBXK28wWjNOOE5udjNjemdoUHZyZGwxVTNOY0p0?=
 =?utf-8?B?bS8xZERIY3BKN2tTY1dCWkJhSGdCQ2lPeEtXL09XUnE2d1l3RFliQUZrUkwr?=
 =?utf-8?B?ZWwvTy8xVENJOEZ0b05iaXJSMElFRERCa2V2QUt0M2l1VFpnVWhkUWdrWkRk?=
 =?utf-8?B?VXI4QTdLcHR4b1hWMVAxZDBFazJBN3VlN0U1N2JGNVFwTmV0THNwVldPYlBv?=
 =?utf-8?B?VUUzTWt4Q3FLbkk4N2VHL2ZBYXNiSWZCTm8zTHorQkJVNzJQNW9RNUQrQTY4?=
 =?utf-8?B?M0t1cXFEZHUrbi9CbnRGanVjV1BzRjE4eDNVdURER1lxV0YyUkxMc0dLN0cz?=
 =?utf-8?B?VGRXNnpuVHo4RCtVT2htTW5pT2wrb3hZTVVoZVN1eXUzMmZYb2ZRRTlhaTQ5?=
 =?utf-8?B?SU10VzdnZlM4VTA3SzluQWZjQTRjaHR0U05kdlJzcW5LaG9uQmhIbitIVnpO?=
 =?utf-8?B?K2wxUFdSdzE5TkhwOVg3RnZpRldyTGt1ZmhvNlNBd2lhM3k1bSs0OVdubCtz?=
 =?utf-8?B?MWc3SEtCcGNDbVM4Q2lSelpzc1lpQjFXMnZrUnZxaFhXZEJOVDVuMkhQWGFE?=
 =?utf-8?B?UVVCbDFZa29yYUJEVEZuWVJxTzRGeC9TZFZQcStJTUtnZWxFK2NhcUVWRGo0?=
 =?utf-8?B?dzUza1A0WFY3ZjNGQitpdWdpK2VjVWRvczgwcGxVRlV3NXptRXpnSnlRRnRF?=
 =?utf-8?B?UDVrZWNIRmt3NUptTFFPeElWelQzRk43LzFtSkpuSWdnNDRjRFJCREE3QjBY?=
 =?utf-8?B?cytoODJ0d3Q5T1Y4OFNkU0VKZzh2UlhLa0tFUUNhRC8wV1lMM281WUtyd2g5?=
 =?utf-8?B?RWN3QXY3SnNnNFRUenBLTFFmUmYwMmJnRVB1RFBab0hVZFNuNHpLQXJQWnd2?=
 =?utf-8?B?MUdzZFJyZm5CS0k4WkNvc3hJbE5UN1l2d1BSaUk5ckNqMzlBem1ncmp6clN3?=
 =?utf-8?B?OXFzMTEyTjhBTHRMS0VkQ3RGbUpRcjk5NmxONWthZHNpQnFCM0phUm5zN1N6?=
 =?utf-8?B?Y3VocG5oTUdQZjdvanUzODBwUW43ZlRuNGp6U255M1ZraXJGZmd5d3NXZlN6?=
 =?utf-8?B?ekxwUndJNDFRdnNUZ1I0ckg2Q3lZemE2V0lLd1RHWFJDYmNPUkdNYnZabEFJ?=
 =?utf-8?B?dVhJRWNTeC9xS0ZnOEJUWDdZaEFJMm5IZ2duQjVYaSs0RkFOYm5iVDliK0FC?=
 =?utf-8?B?THZpdjVIZTF4MVRJS2ZBOXVmbzl3Wmw1Y2cva1RQc1NXRUh3TmQvemFXMjdN?=
 =?utf-8?B?ZFN4cGc4ckxOTEdVZnNUTmtCMWVrUC9uVzR4cmt1djZMRjNqQU55dGpNK2hr?=
 =?utf-8?B?VEllYzI4eVRPS2lqVjhpSCtnOC96N1JwaFcxWFVZUE96K2pqZVdUZ0xlVm5Z?=
 =?utf-8?B?d1l2SDFIOC9pSENTb2I1YzJlT2U1SUJjeTFLNzhUZllNRGpBWS9rV3FlSVZQ?=
 =?utf-8?B?VThuZmUxL3BsSWdma2VzQUdwYXhEaHZuSVN5YmQ1QkFuTDdZaktHbVIxUjVh?=
 =?utf-8?Q?Y0sY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpXUW9NVWRoQldFcFlLVFExWXJBaWFwMVFENkVhRG9YTW00dm5rYWJ5NXlt?=
 =?utf-8?B?c3BSaTc0Znh4WTFSRUFlRTI2VVVUTGF4TFRTWUdwaGxCT01STTdtb1dzeWQr?=
 =?utf-8?B?QlJxOElVdWtMdkNSNXlWeVNmZXlhMjFiQlVPeXNGVHVOWVJ0Q3dWbTFKSDZl?=
 =?utf-8?B?eGNwSWtrNHVwZXBuaENHUXlla0U0c21lWk1SNHNNMHpubnJlMHVMdDNkWnNL?=
 =?utf-8?B?K045VWVNcUErcW80aGV2SStRL01PS0h0cHRESEoxazJwa1pRa2FTZXEzU25X?=
 =?utf-8?B?T0NVUGp0TDJEUXVUT2MwV1liSzFIZUhqanBwZDVhY2JBc0dIcE05S1F1ZHZs?=
 =?utf-8?B?eWhaSWRpUkc1ZTV2aldtS2JqNDRzRExHTkJtZkZWS21MQUJSV3J1WTRoZ2Yv?=
 =?utf-8?B?RFFCR2FYeVpBc1VMK2tha3RzUEFwSnVUT3VmaE45LzVJMElSVXRKK0tkVVd4?=
 =?utf-8?B?djRyOTczY1J6bnJNVTlUQUlOWkF4REkrZVduQmhtUXBrOWRWeC93ckhGbjJr?=
 =?utf-8?B?WGR5NnAwQ042S2xidTgrdGdoNysxSnVsSzdkbkU4K24rYjZDREVLdWRGa1Ni?=
 =?utf-8?B?REUzZzlMMWdTeXRjTVc5d0oxOVh4aWMvNzdmbllUaUlRZEF4YnU4QkxSeEJF?=
 =?utf-8?B?TkJUSXB6ekoxSER0dGtJKzlzc0tGeWlMOWVmdkFYd2NiT1JKV3ZNOVNEaXRJ?=
 =?utf-8?B?aU9aeWdMTUFxUGM3MCs3U1piMkpjOGtNZjh5eWZUaFRJZ1Z5RU9kN2VnUVBv?=
 =?utf-8?B?aFZUWExFLzFJeUlOWktQSE9paGdrQUJzdDlNNjNCMEs2aVM4ZThHTTFtQjY0?=
 =?utf-8?B?MWg3N010QnVSMEp1bkt5NERNclF3UnRvcTZWM2IzaUxZV2ZxQ2NDejJUYzVO?=
 =?utf-8?B?Z1dpMlcyRkhFOHg4TSt2SldQT1crUlZxYldLcUp5WUFnd1ZTcmFTUDZZY0Rh?=
 =?utf-8?B?Y1J1VWdGSDk0ODlubkNZYVFQTTdpbkNBUnFmMERmamtVajRjdENjN2t2ZGJv?=
 =?utf-8?B?dm96ak55L2QycU92ZXphZUl5b21PWVNnRXlOQW9WTGRSdDl3R1RHb05Wd01Z?=
 =?utf-8?B?N1Nqa0RtVE0yRTdSUmdibC9mdSt2YXVQNmJ1Ti8vb2VvWVExVHduRWtDT2Ix?=
 =?utf-8?B?QWdFZ1kwS0VLemlPQjgwbHRuOEhpdHhQamc4OEY1dzRVd2lwdTJMcEJGWFQv?=
 =?utf-8?B?c25sdzlRRjZLTkVuWUpPNlp3MUY4Y3lYSUQvRnEzaDVUdmFwSTk1elY4cGEx?=
 =?utf-8?B?TzlUQnpJNzl0cCtLUUlYN2Z1VFlKS3BFTUVYWHhaMWc4Y1RacVg1MDUvMGlC?=
 =?utf-8?B?Wi9qWEJpRkhJSTFKYkFic0c3eWV3cmpPbWhUeldhdGtzb3hrbk1acXZ3S1Rz?=
 =?utf-8?B?Rmg3dzZwR2VYak5TRDNkT3ZyMTJTQnlvUldMa3NXNmZxRnBrMGVxazEzS3hP?=
 =?utf-8?B?WWYyandmOWE3MFVnUkVyeXhpVjlLSTJiRUl5dndYVDhpcTFrYWNJcWxKNTZy?=
 =?utf-8?B?L1Vvem5xSzBVeTVHL2tlNmFSM25WWVhXSmt3d0loN29uWDl0cWNwTkVwSG5h?=
 =?utf-8?B?djFhTG5UWlZlMHo5YytnbHBZQjFPMVA5TnZzdkJhQnpSQnRGaVdnUmcxajRD?=
 =?utf-8?B?OGZWWjdTYnN5WTF5SWlvYlFqUnVqeHIyT21XV2cyVlY1dktZbmN3ejhINGs3?=
 =?utf-8?B?bzNFTEFBZHM3bk5WbUJOSklCSFhra2dHNDJybzF6RHlZeHNOZEluQi9JNm52?=
 =?utf-8?B?UHJTNHR0RlkyY2VBYU1GZ2RBMlRwWU82V1loS3F6OHk4QzVPSWJpdFpnQ1Nm?=
 =?utf-8?B?RzlrSHBaMEZoQnpNT2g3MlJrT3BPR1YweDBoL21CbldtYWppcFFRUU8yWFM0?=
 =?utf-8?B?YnJVamV1Rk1ESHV4cHJyQnZMWFM3VU0rM1A0NnRQMUpFdHpRRjhZSEtZTHpR?=
 =?utf-8?B?anVZWGJXSWJid3p0T1RWOTBsYldkUzVKU3BXS0s0c1dQZlBsZDV6blFzakp5?=
 =?utf-8?B?dUVlOXVMVWxqdHRYcmZxUEhIRVpSRi96d3JzUis4NDRPN01tUU1UdmIxUnBT?=
 =?utf-8?B?dElBdnBzNk4zYndZOURja3FpcDRZQzQvZkRMMnBNOGZ4QWwxRzl1VUtKRGdS?=
 =?utf-8?B?TytSeFdxZWFVRDZkcndObjR5c0pncGpMSjRFRDhhWS9DczduVk9DU3NkdW4v?=
 =?utf-8?B?eW5HY0wyNHBsZ05BbG0vOTlvb0JwMkRmY2ZhbW85ejNSVGQ4RmN3OC9PMTVK?=
 =?utf-8?B?UFFkbmVmRUt6cUU2NUxEOXppWGdMd2dHTnpqQmQwbGk0T1FybXVraHBNUXJQ?=
 =?utf-8?B?QTJXWjR0eHhaOExIemMwZllIMzM5OTY0RllRK01YWjY2MUQ3RFBDUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc7e41d-13ff-4e3b-eef4-08de5da78d97
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:25:35.1801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+nWATAtecs3/aw0scKBABglaDtk2sK0XKl9Jac42jIYj59Sy7jIB8UoGaCA4rsrxzvN8XMz+lDb9xy2XNuQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6909
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


On 1/15/2026 14:18, Marcin Bernatowicz wrote:
> Add igt_sriov_get_vf_pci_slot_alloc() to resolve the PCI slot address
> of a VF by following the device/virtfnX symlink in the PF sysfs
> directory, returning a newly allocated string or NULL on failure.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   lib/igt_sriov_device.c | 25 +++++++++++++++++++++++++
>   lib/igt_sriov_device.h |  1 +
>   2 files changed, 26 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index ffa996d6b..712d3b8ad 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -335,6 +335,31 @@ static char *__igt_sriov_get_vf_pci_slot_alloc(int pf_sysfs, unsigned int vf_num
>   	return pci_slot_addr ? strdup(pci_slot_addr) : NULL;
>   }
>   
> +/**
> + * igt_sriov_get_vf_pci_slot_alloc:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based); 0 means PF
> + *
> + * Resolves the symlink under the PF sysfs directory (device/virtfnX) to obtain
> + * the PCI slot address of the VF (or PF if @vf_num is 0).
> + *
> + * Returns: newly allocated PCI slot address string (e.g. "0000:3b:00.4"),
> + * or NULL on failure. Caller must free().
> + */
> +char *igt_sriov_get_vf_pci_slot_alloc(int pf, unsigned int vf_num)
> +{
> +	char *pci_slot;
> +	int sysfs;
> +
> +	sysfs = igt_sysfs_open(pf);
> +	igt_assert_fd(sysfs);
> +
> +	pci_slot = __igt_sriov_get_vf_pci_slot_alloc(sysfs, vf_num);
> +	close(sysfs);
> +
> +	return pci_slot;
> +}
> +
>   static bool __igt_sriov_bind_vf_drm_driver(int pf, unsigned int vf_num, bool bind)
>   {
>   	char *pci_slot;
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index 930e97982..38bfd7560 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -34,6 +34,7 @@ int igt_sriov_device_sysfs_open(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   bool intel_is_vf_device(int device);
> +char *igt_sriov_get_vf_pci_slot_alloc(int pf, unsigned int vf_num);

nit: to follow the order from igt_sriov_device.c it could be placed 
after igt_sriov_is_vf_drm_driver_probed().

Overall LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

>   
>   /**
>    * __is_valid_range - Helper to check VF range is valid
