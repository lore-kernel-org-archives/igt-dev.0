Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6FFC5320E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 09:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034A10E820;
	Thu, 22 Aug 2024 09:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bn4GnsS2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CDC10E820
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724319103; x=1755855103;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hZWxaEvHyHxR4H/JnaoiyXygsGO4TOeQUbXeJaD6w/o=;
 b=bn4GnsS2WCLLkGXM2jhlzyuTY21HVUZAGLrdTjMd0Dg4ygVp3kEPqQB/
 q53UmzibQUZ+w4z1FNOoGytGz42DjiosG24GHQn/E8b+slWSUGFgKXscV
 4XwHpz48SF6nXSQPnZDXUElh+sBfQnep2LM3Uqd/yoXnp0NIv7z8Rpjly
 WNhqyiUUNuy17nFz3CdwX0A29kujlKLVIbFRn8lALKK6vcOMxGj35RzP0
 tgYGwz5JOS4Tyrt6k2w/+ym9zfrIHOTHbble9onhvzCGTE+0HQaosCVcW
 2qu+VXzh6MsNsk27HsxNIDlWGLx2RNvA//osBUz17KAganSjdFwvkgLYY w==;
X-CSE-ConnectionGUID: D2WIo5OKQW+jkyZUXC2nPg==
X-CSE-MsgGUID: RPf0Qp55QC6a+99LCEEqpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13150122"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="13150122"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 02:31:43 -0700
X-CSE-ConnectionGUID: ZhAPLDu+TAao3iOVXgMoYw==
X-CSE-MsgGUID: BNRDjPFfSUOU9vcqPRmf3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="62110283"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 02:31:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 02:31:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 02:31:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 02:31:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 02:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzSC8FGwcceIJy/gIBL01/L0sEQ0qhHk+wg+ZZy8S5I33geeiAdVYpUUtRm19iu++KpfMWryU83MKCfpqHUlGMKHYrYu1bT65l2Hn/RZYO9CYOLyU3ue39EQXcX0PESEZOF6QAAySPgPLhci6eMuvbgDXj6xY77r/x5YtgFO0wCtW6m017GGaB2ol71MjlLuAYrcSjdNhPXKobYeURSlrtC1YYq0jRejcYdh9tixZRbGzOgFyg6vNZQhHWp5b5PCwb9DPp+Qb1ll+BQS+bKDUM0xbR2Jo9S+FuuTxzCaZf2WgGCVH8cc76wV8craW5+KES5rih0zeqpjBbhXVj4RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rwd0Qg5+JVXfg/QSDsHlDCJ+JZoKfx1V8/Xaa8ah6+8=;
 b=vT6i+g9lNU0uGCVNfi9psbxPidP+RnW741f+IuNbh0eUogtHMqTCDWvIgXbzLzIKOAegUGdiOUvuWDB+jEmMqPfOxYmJH0t9EI9du7j4qdRp85KXU8Nt/qWWOSTb+TeVj2QlYBXA2OM6Q4uAoKhh2kw/Rt/FbHBmCaREjR00/YjJAGMw4VCpfdGjkKudCg0fn4lKcHxRbnD5pW6xJpZD6UV3ZwHgRDx7NTds3lyy5Kv4HEURuBvWpPgiI6bQg0QZznHqxyBsFFSy5V9h2tmZGZAvZRwn13I7vdXKTBbw7hmp3nODVudqMgTzPgAJmPnfoWXStnmvwukbhfjNxvjfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CH3PR11MB8155.namprd11.prod.outlook.com (2603:10b6:610:164::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 09:31:39 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 09:31:39 +0000
Message-ID: <d77c9f49-ec62-4bd5-aaed-e7ef4bc21e4c@intel.com>
Date: Thu, 22 Aug 2024 15:01:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/4] tests/intel/kms_pm_dc: Update test duration
 to 4 seconds
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
References: <20240811200359.1086166-1-ramanaidu.naladala@intel.com>
 <20240811200359.1086166-3-ramanaidu.naladala@intel.com>
 <MW4PR11MB67614EC56036B26700FCCCF7E3862@MW4PR11MB6761.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <MW4PR11MB67614EC56036B26700FCCCF7E3862@MW4PR11MB6761.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CH3PR11MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 815cb6ee-7ac2-4095-93bf-08dcc28d3972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNrM3A5dTB6NWhHck5yd2Rkd09aYzlwNFY4OTBaL2VCbXNxNXpYc2JXRGVz?=
 =?utf-8?B?N3BMOUhGQzEzUldiQzhJcERSc3BJajhhckVqd0tCVytEYmF2aVhDdTlISjhW?=
 =?utf-8?B?TWZ4Ui9SNmlJeTNpdmJSNlJ1K0czZnhYTDN4d1dKMVpCZUxZcEtmZWxMbTVv?=
 =?utf-8?B?ZEJldkdyL2EzdjU3T0pNMVdvR3I1cEJBdk1VLzNVL0JWWTBNbGhLWktkRVBm?=
 =?utf-8?B?Q25UZ2lONm5EcVFQUzk0VWJEWk5GVTBWVDRSWXd1MmdHR2tHQ1JmUEx0Qk9P?=
 =?utf-8?B?TFRjdDcvVEptMngwS1d2QmdUK0FJb3RsN3B6eEY0bC91cGp2RTU3TEVZV0sx?=
 =?utf-8?B?YjBCQ2t5RlNIODFDbUVCZExFMGhtN0NPSkJXRGIrMXh3TFZibU83NFJPOXly?=
 =?utf-8?B?OStnUzR4ZXZ6eDdJTGNxbG5mci85ZVdjWWxIWnEyMVZleFU1emwyT3BFVWgy?=
 =?utf-8?B?WEd3N3BuZm1XOHJ5UG9GeTB2UyttSDZJcUR4RUxMY1RiQnVNMmx1MzVXUm91?=
 =?utf-8?B?K1lCdklYUEFvc0RJZDgzbTJxZTVBd2ttNlVuTVFGc2NrNGlFMzB5SXIwU0VN?=
 =?utf-8?B?R2tSQmE2RTg2NDBvWUhydkNXdXpDcWR2aG42enY4aW5sZ3N6TXdHU2dDa0pJ?=
 =?utf-8?B?NklIcTZTN2FQYjdmV2NJaXpWM2krTnEvd0pLR1ZQV2xjSDdvRk4yUzlpckY1?=
 =?utf-8?B?WUorWHhpclBpR0kvcmQ0VExFMmR2NzR5UmI5UXIyeExDYURCcElEaHc3Ym9j?=
 =?utf-8?B?Y3g3bXRYRWJPU2ViMjVuZ3dzaEhGSE1YaFdVVmRqZGk4Q3A1MWNpMXdoaVZS?=
 =?utf-8?B?STZzUkZQa1ljaE9VNlJQQ1dZOFp3KzZjWVlYZEs0ck9pSjY5elFZVE9lWkZD?=
 =?utf-8?B?blNCQW1aK3luZlhyWWdUWkRDTHYwQ0JyNDdNdi9Md0JsengzSTk1T3NWaFov?=
 =?utf-8?B?eE1VN0tEdVlLdm8vREFxNG5HRk93cGhSd0MrUmVYeEQwNFdCenFLYVByQTFY?=
 =?utf-8?B?N2FQTTdZRWhxVnBSZHl1dDhvVGtoV1BMTG5Kd01PbFIzMU1mTGpNWVBQTkZj?=
 =?utf-8?B?d2xtdG8zUjdmZXB2Y3I3VmloR2ZHVkhhSzBuR2NPRDZ2N2h6SlhTK2crZ0RK?=
 =?utf-8?B?UVdYdE9VWDR5cFVieEE4TnVOa25TRFBtYjhyYlhZQ2l4RnpWUWlMdVkrNWlT?=
 =?utf-8?B?elcwVzQxN2VGUks1cG93emc4Mzc5dTkwMGE1eG01ckFaQ2YrYUhlUHNENEx5?=
 =?utf-8?B?d1ZwL3loTmJOVlprQjRVOGcyc3MrZ29mb3d4TkIraFM5OTVEK2tIL3duMy8y?=
 =?utf-8?B?Q2R1OXVSeVV2TFRwNE56VUgrVExEanNWQVZzNVNNYnVtL1RwTnpCbDlXUExC?=
 =?utf-8?B?TGFVaU81S0RiQ2pobkVzRGNRTTUrTEhaUlBzbHpvQk9zTHRidmIwVzgySlVa?=
 =?utf-8?B?eHU5anZKdUpJeUU5eWpKRlllKzNxd0lMVm9FZlZ0Ky9BeDlZMnRSK1J1a0NG?=
 =?utf-8?B?bVE5OFJyTzFqMG9ZVEkxREFtdVhDaHhmeWNPUFhvSjRDWlpzN3p6TmZPL2hY?=
 =?utf-8?B?VERLRUZibFJuM2o1RURsYzI3ZXREOG80S1d4RXNKRHZyTCtLOW8vZTdOc1oz?=
 =?utf-8?B?NXVNODkvOERjY21PU3BPSVUvdXo0Vi9KZFpRVURMM24xYk1MZG5IbDhCamR5?=
 =?utf-8?B?MjU2RHF1QTZRekptVkVNNUoreVVyRERWQitrckI3Z0Qzc1hPeVlpSi83ME9q?=
 =?utf-8?B?RVJUWTkyWnFMbGYwemhOMU9KVHFVYlhKTVFVcXAvcE1VSDUzVytKV2x2TEJM?=
 =?utf-8?B?aThvdnMzT3NmcFFhTGo1QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmJBRzVlWkJSaVhoeHRMcnNsS1NHaTBlL0JuMHdaMklDSUtKaTZWNGZpMGdC?=
 =?utf-8?B?TDhVd1lsaXdaNzdRYlFNQkxxdmhGcUlRdEZwdThEa3N5TVB2QWFkZlo1MWJi?=
 =?utf-8?B?cVh6MjE0YzhWZXVXbkZsbGdWVDhKTGJNc0tRWUFSOTBIb0ozanZnVG40cnVH?=
 =?utf-8?B?Kzd1S0xuUTdIWnJpVFBlcVNvUGJQQ3g4YlR4cFYrZnVmTWFaYlFld0toelpl?=
 =?utf-8?B?aEVUVGlLYW54RXc0SnlMOVM3WWRweE1JRkFEd0tWOFhUVGtOSGhUTHl5NGNX?=
 =?utf-8?B?aXlLT3YyNERoTFFoakhYbDNLMnB1TExQNS9KeTU3QU5YQnp6Y3dFNjh0NlVo?=
 =?utf-8?B?aTR4N1BkcHFzd0dtMlNUMm1KeXFsNHZtdW1yYUd1OG9UMGNiaGcwREpMdGpw?=
 =?utf-8?B?Mm9Dbk55TWF3dHBIKzVYZUN5T29uUW9kVmcwUGVIUDl4WmxwVXFBSWZhQUVQ?=
 =?utf-8?B?dHlBL1ZpOHIzUVdHRUJGREhwUjJjWWMxaHBSSEExVVBFeG1FVGNsSzJyeWxl?=
 =?utf-8?B?QnZnaFVoM3lPR1RDMXkzOW1rM1pxMU9kbmoySnhQQkYyQStnSTV4aS8yRE9r?=
 =?utf-8?B?b1NlMmg4cFoxUVd3Vk9BVG9LOXE3WkE1cjdOdDJSVVhGQWNKbFhVNlBTWU1Y?=
 =?utf-8?B?bFVHdHk1MUdyWkpXSERmQjlsQkp6eklGaEI4empqRG56a2hMSmUzaE9lTkZK?=
 =?utf-8?B?NVMxamZLalFOQW84RHBBb1QyZVJ4c2NHTnNOVWo0YXR1dXJJeFB1d2JsVUQz?=
 =?utf-8?B?V3BXN1JqTzNQclpudEZYUjFUQ2F4cnRxWUZGbHFheWRZalhaOUtHOXc0OGZk?=
 =?utf-8?B?T2QyM2VDTEloNGNVNHdBbVJIVm1LS1pFRDh4NHArandLbHVhV25PR0ZVMkNo?=
 =?utf-8?B?YkU5VUhLbzlpaUtPK29VdTlUWEtuM1V1OWJTODNRQUJpbmM2RkpNNVFVaWNt?=
 =?utf-8?B?Qm5OdEZSUVNlazF4TzluS1gwRnd3YUFBRzlJclE2QVFPUDhySzVHcm5FZ21V?=
 =?utf-8?B?M0tUYTZJWkVoUkhuRkhzb1U1bE9VRDE5cmRNbGF0ZFQrbnV4bnpsN1ArRjgw?=
 =?utf-8?B?eTFhL3NoU2d3ZEFzNnNLb1JxZEJrWnhCSVRMNk9xVlp2Y1l2SFJTWDZSQUNQ?=
 =?utf-8?B?ZWMyUHB6UENxSjVuSTgwc1RiaEJraHlxWW13akNMNmMrN2FkMGE5WE4rclky?=
 =?utf-8?B?SWlKVzFzN2NUMktwT0ZMVFdQQ1p5REdLenJKM1BydEJLbEFSNmh4RmMzZ3dz?=
 =?utf-8?B?L2h1U3IrRDkxd3FZZTZQQSsvN0lmTmRYcmlZemdXNnpTbmNwWkNFM0pvTmtx?=
 =?utf-8?B?MGl1amc2Zks2OWJ1YWY4Si9Yd2xjU0tRSmJhM252UThDcE1vbVEralRSSDM4?=
 =?utf-8?B?K0w1bDlJbXNobnRVME9HdmFGZzR1bTczMG9HUUdxZkNVdmxwREVNU1czelRP?=
 =?utf-8?B?NkRTK1NnT3ZyZmNIeWVXV3FVTUhXTXlpcVFsbVVyMWpIUXhYRXh6QndDRlZH?=
 =?utf-8?B?U21BVjQxTHp6V0NpRnRFYi85Rk4wN3BXdTJFSjJRSDJZRW1kQjVJSkZCZWIy?=
 =?utf-8?B?bS8ydkQyVmZKTmM2TXl4MmJKdHRKOWpYZ21CMjBmM0JBV0JxempneDVVVnVv?=
 =?utf-8?B?ZlVVZ3g0aWhaSEJQNVhQT3o1VjJMR3R4K1hOSVN4ZVZRTmRoMTBGV0dIank2?=
 =?utf-8?B?dTljNElNSE50dGxxK0JYNXBqUFNabEJTblUxeVpFQ2RNRXhRdkFFeUZyVEJy?=
 =?utf-8?B?MklyaWdkdmlqUVE5VXYxemkvOEd6RlgzQTROVnpNNnNrRXZuampqVDdmUThs?=
 =?utf-8?B?NWJWcU9hdWxMbzJXYTEvSmtCVzV6QUhlOTVHTUhFNzh2SkY5VTEwc2pxQ0Nw?=
 =?utf-8?B?NWJiWDQ0Y3V5SlppYXhUYXJWTzA3NlV0NXQ4V3d3UzVDb3hvYTlMMndJZm5T?=
 =?utf-8?B?MXlWTjBpQ0ErMEZ0MnRhSmpndmEzYVQrRTU0L05zejZTUU9FREU0S0FiOWI5?=
 =?utf-8?B?amR2V3dpYmZvb1kyNnJxNW9udHZtRUlUSWtpbnJ4a0NrZjRzUjR6d1BZSkhq?=
 =?utf-8?B?VlFRZ2lwY1FoUlh1ckQzWXAxOTFsV2tWcjBKb0tFdXFIRml5eFF0aDR5a0hx?=
 =?utf-8?B?VlVlQUtkKzlYcnZjWVN4RDV4RkZnNXcwMHFxS0tzOEZqVTBzMXRnd2xQRUE5?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 815cb6ee-7ac2-4095-93bf-08dcc28d3972
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:31:39.3312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7U4Og2t8fruElGGBdR9/Lj0WGhpFQ+k5CgIakQGKskW7UFEF4j8K0iEKndPlScigfOKNO3KJAldbHT1c0D1i5E21XITLWNbn14gA0CzkEhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8155
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

Hi Suraj,

We need to simulate the scenario of extended vblank. Keeping CI 
execution time in mind, we have set the sequence for 4 seconds. For the 
first 2-3 seconds, we run at X refresh rate and then change the refresh 
rate in between to emulate extended vblank for the remaining 4 seconds.

On 8/13/2024 2:53 PM, Kandpal, Suraj wrote:
> Why is the duration 4  or how did you come to this number explain , if in ms don't we have a define for that use that its
> not good to use magic number.
