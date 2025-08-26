Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A1CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 12:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A591D10E65C;
	Tue, 26 Aug 2025 12:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyGzJGCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0910E64F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756211555; x=1787747555;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yk53jfj6iGwS3R5d2qoXQVwWBAUxO7XPItEOf2j43Mk=;
 b=eyGzJGCyf+8c0JdUuqAW+62hOrkhYnIChqAsFqCZzjhV03DIqYr5nVzp
 MX4e0yCFufG437HCmM9wdbdo6qI3yc58tNvmaHyQs6ZsNH0RS+e8VALoz
 uxO+d2udv82ZFkah51mMovL0dndACxnBeRCfdY+dECbCW/hPG3yKY30n4
 x0Ic7YeXMFIncgrJULWQdLrF3g3vCg+e7o7DHMRCK4rOzu9j7OEVc7eqw
 OZ/JyBPbqnKiorMyZkNQcWZ2SMV+oagZuZRderODnlaA/g/SmovbRFKAm
 btwLfUn9tP5N525Lv6klCGK8vf/9ZStQNmewSZcg3cEayyK86sXhOTng9 A==;
X-CSE-ConnectionGUID: 0KJ3JWIdQEefiAKQnc5OFQ==
X-CSE-MsgGUID: tIpzO2zXRamPZTGYdKsBOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69813015"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69813015"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:32:34 -0700
X-CSE-ConnectionGUID: uU6HAwDHQvqiJ55/ITRFJQ==
X-CSE-MsgGUID: ZAxu4xPZTjC0ZTL7MaC3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="206728423"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 05:32:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 05:32:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 05:32:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.88)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 05:32:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfTkZ/yAmj6CKuWRcFXgJX75fradBv6QdJqxSjXrJw5zchMhlrte2rtw9pak4wV6FUpaP7aimqqdv61C5LR2BgAqPXQCeX9vF7qgfZ9P8hrU5IDtUDdSi/4na6F6+nXd/gSBqdRp3PtFzMPFFml2Vlz6ak38w0wb6jLNY1z7vn54mJ5UCx6/1JXDTUSJzbBm0CuxaffwAROlivYC46L+lK4WNSrKvna8GEXoVy61QUdahoIcTL0J3dx8BuLjirYr52lGHHTt8ot2Z9AC6uAzGfMZhhhCCvCvaz5oX0brWl7sXcWwJ11l0b6Cx7/Jjosibc13iNhAMm7+AuCaleuhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anQ4J6p/1+G5Moe4xmxK2hf7a2C7gImxpXRNm/JG1wY=;
 b=d9KVAcgugtjRdNuwI7p18OdeitXw8Hc8ogQdblO9md2SAimDlAN/gThL0nLdYZIX3r9CbB9GVxw5BEKS5TXQ28kPec0Kp9H3rniYMgL+Y4CPiTCi0zToyqY5RiQIuzHNd2rWZzcdgQYVU2r7EVBidmNqna5JxkrhH2l7pHmCsoFT0jlOXEvPnr4krRY+TaGP7YAazMJ3KdQI2tuCQuhdtweVP7BXnpVz6lWuh7wphl2gohJr4I6BqjkRGKdN5V1te7TP+L4Ma2g3ctpSji19IYF2z8ubNkkV04AQVw3n58NTRcrMARnQu853vICz8pec25edAlm8ShbPizOiMqFZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) by
 PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Tue, 26 Aug 2025 12:32:31 +0000
Received: from DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::ee65:895f:bcc5:8521]) by DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::ee65:895f:bcc5:8521%5]) with mapi id 15.20.9052.021; Tue, 26 Aug 2025
 12:32:31 +0000
Message-ID: <a17c328d-ba76-49d0-b408-3d3b9ab7fb8c@intel.com>
Date: Tue, 26 Aug 2025 18:02:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Test to validate vram-sr through
 Mods during host s2idle
To: "Anirban, Sk" <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>
References: <20250602110300.1324145-1-soham.purkait@intel.com>
 <141d9d4f-d718-4df4-9ac9-ea0a222919a1@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <141d9d4f-d718-4df4-9ac9-ea0a222919a1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To DM3PR11MB8716.namprd11.prod.outlook.com
 (2603:10b6:0:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8716:EE_|PH7PR11MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf2044a-83de-4095-bb09-08dde49c9ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXpSQ0ErWDRlWHVGWjlLZHMzRFZEQkpQVVViNTEzZHBKS3FKUHp2Z1BPcjVR?=
 =?utf-8?B?WHFGYXJ4eXZ3d0kwc2JRRE9nVUQ1WVNOWVRSRDBwQkl4OG8xWHBkME5QOGQw?=
 =?utf-8?B?eWdJdVNUdmt1NWNiR3hzRW9rY1BYRGlmdVlTSk9CNGRpMnNqQ3d6S252cXBp?=
 =?utf-8?B?Uk4rWS9SQVlHKzlsQmRTVG9ubnRiMlhNZEl4N0Y0WEhnYzhwODhtYkJNcjlP?=
 =?utf-8?B?clRpWEtFemJVVGdYdlMzVTFBMGw5TGI5alZiZ0c2YXRyQnR1NFRtODBnRVRG?=
 =?utf-8?B?U2dqNlFuYkNEcHJTVGdkSlZ5MExLY1J2dHo0SGR0WEZBRzM3Z050QTRidDl2?=
 =?utf-8?B?NFNjVzZFdWNwMnIwRFFsRkRwalJXeXBTUDdFOFdKS0dROGxkSnVOaU1QWFo0?=
 =?utf-8?B?dTkzL2JQQ0JHNG9ncEV1Uk9Qb0VkWU1DTmhheThMc3l3d1NxeUVhY0lCMVBT?=
 =?utf-8?B?dEF3MTVFZWY4b2I0RGJhQkVNOWZVT2ZUTytPU0hidEZnR3JtUkV3V21HckZa?=
 =?utf-8?B?a1kxTDhCSnFzd3d1N0MrSFFFclpacEJuOElBT2x2RE4yUTM1NWdrbnIzL09i?=
 =?utf-8?B?QjdnMm5hZ1R2SkhQbkZ6SEZPb1hKN2tkL3NSR2hGazRlVHcxZ1JqSTBnWitu?=
 =?utf-8?B?aTA0amtDem1DZDZKVVJ0czZaN2hyeGJneFhhWFJGWXlndDcyMGc1Y04ybExw?=
 =?utf-8?B?NHpVLzI1TVdWRk5Tb3VGMG82dWtiblJ1alRPVUxFRjdJVVdzb0s3bExiZ05z?=
 =?utf-8?B?VkZwUlpSaWNRTHN1WUoyRGRERzNXZ2pYMjFaM3JjNnpCbVY4TUZLa1ZJdmJG?=
 =?utf-8?B?T1Jza1lBT2JRYnUxR2xXbldBZDQ5ekNocU55Q1N4TW1rT2duYmJJTjY3Q1hu?=
 =?utf-8?B?ODBCTC9DU0l4dmJ5OEl6KzdlcEkwb3hUU0RlcVdqTDdNWXlSNmtEZ0RzV2p4?=
 =?utf-8?B?aHVSdjZTdTlMQ3RyeStPZllqVnAxL1pvVzYwQkl3TWhVYlM0d0lXL1NMOEpW?=
 =?utf-8?B?NWhqdC9OMFhjNmdhZlZWNkdUbEtxQ1lZTm5jWkd5cmNGODJ5ZDQ3dTZqaCtp?=
 =?utf-8?B?UHNSMkJzYUhHS1JVNDlNeFpKZTRRM1FSZU5nbjRJTTJvNnRpTSsyV0NnK25R?=
 =?utf-8?B?cjkrZlB6cCtWQ1l4UGxTSTBLSU0vTkV5a3RFWUZqMXdrVGJ5TXBrakpLRU8y?=
 =?utf-8?B?K1l6Y0tBNFNSdDBpdlZLMTY2MUI4Q0NlOFNkMXA3UVI2NGJRNm5tWUlkV1Jx?=
 =?utf-8?B?WWtSODk4U29RcHB3SngrUHlRbGZGL0xNWDRhQ1haS3h3SkJlUDhJS3FYNFk3?=
 =?utf-8?B?NzJMQm5BbndDRDlvMnZIMENWUGVUc2VwbEtHQ2V1MndpNFdyRkljTFdUdnQ2?=
 =?utf-8?B?NzA4YVdJUStEMVBCelROOHhMa2FuOG9DWTFXczNxWTFxMjgwSDRnTmgyMHJ2?=
 =?utf-8?B?TFJzTGcvSXhrNlRqUXplLzZGL1ZnbFpjNDZzMDZVaEx6NG1mUW1wcU01b05p?=
 =?utf-8?B?K2RndEROSkZ4QWZrbW9ZRWxUUVdJS3A2ZldManRMREZPS1k4OEpaVlpCVEhD?=
 =?utf-8?B?SXA4dFFYOCtaNXpvSXFBbUdsN3hjbE5WMDFUMTF1N25FWnpjbzZCb3dzTHph?=
 =?utf-8?B?OEw1OVVrbVNvU2MrVW5IOHIzTlBDaHhWeXZjTDh0d3pHUENnY0JoUjZVWGk1?=
 =?utf-8?B?M3dqM3FRcjQ5WEh1MkRLSjNKWllFK2dicEc0RDUwb09Qa3ZOYytBOHpQVVNh?=
 =?utf-8?B?UGwrRENGWWp4VWYxTVJCN0wrNHJ1cStkcW8rVDEwWmMrMlBMNFNpRjZOY0N2?=
 =?utf-8?Q?LDCH6/4UYuWhB9pIHq5gEeyo8DRcQpVjSxV3E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8716.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3V2bmhyTituYzlnUUlUSkczcjU4aTRTVnIxNmppMG5yUUxQTFdXUjRCdXRG?=
 =?utf-8?B?dXZrZnZyZGIwVXdLUG4wcEEvamhYVE1VU0wrY0pMcjJiMk1saHJjdERaN0pl?=
 =?utf-8?B?VDNmVW1nQnNwdy8xWEg4STB6cEJyM0pZWTJEQ1A0M29WOHBhODdXY0dlemp3?=
 =?utf-8?B?ZUhERGpKMXlYamNZZ0NOZlR2cjFiOGxFcEtxb0Q4NUh4VC82bEQ2NXVOb0th?=
 =?utf-8?B?N0trR0dBTXJqOWlERFJ3TUhxV2lCVVpiMzZ0Q0dJVGtyelNwaDF1cHdOc0No?=
 =?utf-8?B?ZU1PNkNvd0wwYzlGNEZTeVFybmo0eVdaWUxxWTdYUU1xZjdFalVBMFdDSzBS?=
 =?utf-8?B?VXE2M1F6TDFGYkZ4Q0RoZlMrS3RBb0RlOEIzZTFGNkZBUFlMY1FVd08rRE8y?=
 =?utf-8?B?YmFSZUVoNldMODBNZVp2VXpWanhTa2t3emZZMHVqb1A4OFBGLzFJYWYrbiti?=
 =?utf-8?B?Q1ZLTllPL08yWGJXdW1KN05jamlCV0lrVXBKRnIzU1VVKzg4RG82aTZyUVhG?=
 =?utf-8?B?eGJFR1cxUVFnWm1JMVYyUC9aM1E3QnRwdmEzVTZPZE1rczJGWWNhaW9WRW1Y?=
 =?utf-8?B?TkllRkxreGh6b0JWaE9SZSt6Q3lmcTlYVVlSTXV4NlJIckJGZ1Myb1BJeXZ1?=
 =?utf-8?B?NWY4RHRlNklKM3hiUS9uZG1kUitwY3NOUjRxd3l1cm95RGUxaGQzem50azJi?=
 =?utf-8?B?WVNMQVZKZzg3dktXVklBWUtPQk8yRmdTbWQ3dG0vVjBDajF0bUVCeHpFZGZu?=
 =?utf-8?B?MVZvaEtvYkhpandxeC9YOTZWWVViT3VqdHJIRjVEcm9Ob3oyNUZUK1pGWnNy?=
 =?utf-8?B?RklpVUpUZW9LMkU4cHhMSHJGMzF1QURnb1NmU1Q2NFZPNU5XMGtORWl3R1hw?=
 =?utf-8?B?MjRaZzc5MzBQamZ4R2QyUyt5TzIxeElnVXJtNTQwMENJUkRkWldFVUpUZGJk?=
 =?utf-8?B?OU5aY3ZFejNLWlR5MEFUZzVDdG5zb1dMSjJNaGlVVGJVTUYxNXg4d00yN3JO?=
 =?utf-8?B?SjRXT2d6QXE0SDdKTks5YWhTcTVuV0kvY0l5ekpMWjlOL1BNSi9SR2pPd3ZL?=
 =?utf-8?B?SW4razdsVVphRkw2Zzl4ZEs0MWtlUzcxekVoRjhOYmFHOXVtQzVNZzRCSkpk?=
 =?utf-8?B?K0tkdUkzV3JxYlpmZklNM1hmaWlGRUFBcHBEdEc4cDQ1Z3dNS3BnRXAyRWpM?=
 =?utf-8?B?eUgxODBaUWxuVm5uL2F6RmlaZzgrYzFMd1pPVE8xQzROeXJvUGx2TmtrTjl3?=
 =?utf-8?B?MzBqNHVMU1NuN1h0RkxoblFnNjFUbFc1VDlxZ3R0LzNoTTN3bllUdTBicERp?=
 =?utf-8?B?UmxRS2k5bXNxTHFyYkhzd2RPeGhHZXU0WGN5Y0FQSHM2bkN3dndNRHVvVWhX?=
 =?utf-8?B?dXVaTnVqQjcxdjNVb1lEcm0wVGhBS3RIbVJ2WnFnOVUycW9Jd1NZczlyVGhN?=
 =?utf-8?B?M3ovcUZQZkROVzMzdmFtcXdUc3pSRFlhWW9qSkhQcENGc3FEZ0lEamRLYUJo?=
 =?utf-8?B?dThiM1pKUnFjWUR3TE9nRjBCS0dubnpoaEZ0bE5vNmhSY1hEc2p6UXFGb3ZO?=
 =?utf-8?B?MkRKK1F6UjNWNUhKSlhpZ09XRjBJQzNBVW43NjBBSkRQalRZSHF6U05RRXRx?=
 =?utf-8?B?NkpkTTlMT2ZDWEIxTnRxNXVOQ0RZcmdnV0lYaW9XQkN6VnlEZXpURjB2Wnl6?=
 =?utf-8?B?eE1oOEowQ3lNYXloL0xhZXJGYUExamlCTGdxdDFGajlsT1IxRkRwRFh2TkQw?=
 =?utf-8?B?aDl5KzNycWl4QWZ5a1NrQzg1K0xzL2FSY2J5NEUxRUlKS0dKTmpaWGErS3JN?=
 =?utf-8?B?R2FQTjRlQjBENDduUlZKdG85K3p4MDhQdS82aVkrMFJldEpjcFplYTVHTUJK?=
 =?utf-8?B?NVdQaWVRakVSbTYzMXFmOXQ5aG1PdU0rZjc1WHBuQUFFQ2pKdmMwRmJxMnEy?=
 =?utf-8?B?ZDYrVnliaytsZEdpME1EQTY4cVRHQ3kyTS9FNXpQSFAyUnZ2QW5xRkZ1dkw0?=
 =?utf-8?B?R1h4VGw1V3UzeGdtY28vRFdSa3A3b2llMUJEUkZuWlZ6ZkpZckZLckhvcFJE?=
 =?utf-8?B?VzV3MCtkTzRaQ2k1TkpKNGcwQkJHZzRaSGM2QTJ6ZGR5QmhqSnhkT3lzZGZk?=
 =?utf-8?B?WVhEK0RwdnBLYzJmN0NDSzRZUDNlYUplb0RQbys3QnFhQkllRmE2ck9tb21w?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf2044a-83de-4095-bb09-08dde49c9ffd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8716.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 12:32:31.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lakHwjc12paov0Wz+up25u8z31K0EIGG30NBDVMR7xpH8SMqm0cMu6mPFPTS4fuDUFfSApAxhdhcxrZ0/YYaIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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

Hi Anirban,

On 24-06-2025 00:28, Anirban, Sk wrote:
> Hi Soham,
>
> On 02-06-2025 16:33, Soham Purkait wrote:
>>      Add test to validate vram-sr through Mods during host s2idle. It 
>> checks
>> whether vram self refresh capability is supported through debugfs 
>> node and
>> then introduce host s2idle to check ModS residency to confirm vram self
>> refresh capability upon success.
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 99 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 98 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 6eb21d5ec..322b22eb0 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -10,9 +10,10 @@
>>    * Sub-category: Suspend-resume tests
>>    * Test category: functionality test
>>    */
>> -
>> +#include <ctype.h>
>>   #include <limits.h>
>>   #include <fcntl.h>
>> +#include <stddef.h>
>>   #include <string.h>
>>     #include "igt.h"
>> @@ -413,6 +414,46 @@ child_exec(void *arguments)
>>       return NULL;
>>   }
>>   +static char *read_content_line(const char *content, const char 
>> *prefix)
>> +{
>> +    const char *line_start = content;
>> +    char line[1024];
>> +    char *result;
>> +    size_t len;
>> +
>> +    while (*line_start) {
>> +        const char *line_end = strchr(line_start, '\n');
>> +        size_t line_len = line_end ? (size_t)(line_end - line_start) 
>> : strlen(line_start);
>> +
>> +        if (line_len >= sizeof(line))
>> +            line_len = sizeof(line) - 1;
>> +
>> +        memcpy(line, line_start, line_len);
>> +        line[line_len] = '\0';
>> +
>> +        if (strstr(line, prefix)) {
>> +            char *colon = strchr(line, ':');
>> +
>> +            if (colon) {
>> +                colon++;
>> +                while (isspace((unsigned char)*colon))
>> +                    colon++;
>> +
>> +                result = strdup(colon);
>> +                len = strlen(result);
>> +                if (len > 0 && result[len - 1] == '\n')
>> +                    result[len - 1] = '\0';
>> +
>> +                return result;
>> +            }
>> +        }
>> +        line_start = line_end ? line_end + 1 : NULL;
>> +        if (!line_start)
>> +            break;
>> +    }
>> +    return NULL;
>> +}
> imho this function is not required, explained below.

I guess a generic read function is more appropriate and it could be 
reusable for other residencies as well.

Thanks,
Soham

>> +
>>   /**
>>    * SUBTEST: %s-basic
>>    * Description: test CPU/GPU in and out of s/d state from %arg[1]
>> @@ -777,6 +818,57 @@ static void test_mocs_suspend_resume(device_t 
>> device, enum igt_suspend_state s_s
>>       }
>>   }
>>   +/**
>> + * SUBTEST: vrsr-capability-during-host-s2idle
>> + * Functionality: pm - vram-sr
>> + * Description: Test to validate vram self refresh through
>> + * ModS residency counter during host s2idle
>> + */
>> +
>> +static void test_vrsr_capability_during_host_s2idle(device_t device)
>> +{
>> +    u32 bo, placement;
>> +    u64 s2idle_start_mods, s2idle_end_mods;
>> +    int dir, ret;
>> +    char buf[4096] = {0};
> You can reduce the side, buf[256] should be enough to store data.
>> +    char *result;
>> +    void *map;
>> +
>> +    dir = igt_debugfs_dir(device.fd_xe);
>> +    ret = igt_debugfs_simple_read(dir, "vrsr_capable",
>> +                      buf, sizeof(buf));
>> +    igt_assert_f(ret >= 0, "vrsr_capable node is not present in 
>> debugfs.\n");
>> +    igt_assert_f(strstr(buf, "true"), "VRSR capability is not 
>> supported.");
>> +
>> +    placement = vram_memory(device.fd_xe, 0);
>> +#define XE_BO_SIZE (350 * 1024 * 1024)
> define these macros at the top.
>> +    bo = xe_bo_create(device.fd_xe, 0, XE_BO_SIZE, placement, 0);
>> +    map = xe_bo_map(device.fd_xe, bo, XE_BO_SIZE);
>> +    memset(map, 0, XE_BO_SIZE);
>> +
>> +    ret = igt_debugfs_simple_read(dir, 
>> "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
>> +    igt_assert_f(ret >= 0, "dgfx_pkg_residencies node is not present 
>> in debugfs.\n");
>> +
>> +#define MODS_PREFIX "ModS"
> same as above.
>> +    result = read_content_line(buf, MODS_PREFIX);
> Just to read the package residency here, you can use sscanf. For more 
> details please refer to the function read_mods here:
> https://patchwork.freedesktop.org/patch/660150/?series=149557&rev=2
>> +    igt_assert(result);
>> +    s2idle_start_mods = (uint64_t)strtoull(result, NULL, 10);
>> +    free(result);
>> +
>> +    igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, 
>> SUSPEND_TEST_NONE);
>> +    munmap(map, XE_BO_SIZE);
>> +    memset(buf, 0, sizeof(buf));
>> +    ret = igt_debugfs_simple_read(dir, 
>> "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
>> +
>> +    result = read_content_line(buf, MODS_PREFIX);
> same as above.
>> +    igt_assert(result);
>> +
>> +    s2idle_end_mods = (uint64_t)strtoull(result, NULL, 10);
>> +    free(result);
>> +
>> +    igt_assert(s2idle_start_mods != s2idle_end_mods);
> Maybe we can check if the end counter is greater than the first one or 
> not.
>
> Regards,
> Anirban
>> +}
>> +
>>   igt_main
>>   {
>>       device_t device;
>> @@ -936,6 +1028,11 @@ igt_main
>>           test_vram_d3cold_threshold(device, sysfs_fd);
>>       }
>>   +    igt_describe("Validate VRAM self refresh capability during 
>> host s2idle");
>> +    igt_subtest("vrsr-capability-during-host-s2idle") {
>> +        test_vrsr_capability_during_host_s2idle(device);
>> +    }
>> +
>>       igt_fixture {
>>           close(sysfs_fd);
>>           igt_pm_set_d3cold_allowed(device.pci_slot_name, 
>> d3cold_allowed);
>
