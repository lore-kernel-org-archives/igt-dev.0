Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E8CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 07:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34910E431;
	Wed,  3 Sep 2025 07:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9rjVNCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DDE10E11A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756885417; x=1788421417;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tDrUVyBi3ZFVhNpl6lkCvTmw6ag/lCCno9QMKlkvW0s=;
 b=O9rjVNCXuUXk19s4risrqXYo9+efg9KjsuXyhCnzYG7lqY17Rz0PkyYl
 QCauYK8qnh/Y3zdd7bjQZ9hQgVuC5o7Oxkl1KSXsXIRBUQG2/xkKJcSAa
 7MKeXW+oXkABwoRGLqjRycqyacyhruYsUqogEmFsKulVd9ctQI6fj/O4H
 cLnTaRDHJCTCKLdgSh1b/Z4DPSEBah8O10xQYgqG8yKNJRmXoUdc8Khgx
 OzIKHJadGMlYIx23v+eS61IJdZYI6MpwCkF30aEliFrPSz7F20vkiAqgS
 Y9FYzSTWjlsNNR461Bfm56HABGJfEKvRk1tiZgKVzrol/sWLOV0dP0rl2 g==;
X-CSE-ConnectionGUID: QGjDJip2SAyy75Iw2A4bGw==
X-CSE-MsgGUID: 4RpgtqrOQkKbLgZBB6MjCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59125309"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59125309"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:43:36 -0700
X-CSE-ConnectionGUID: hQK2TdgFQcyklIHrE/i4SA==
X-CSE-MsgGUID: CsIwpBf4TVmcGcPdODAqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171393045"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 00:43:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 00:43:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 00:43:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 00:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yH0R/eCw0nXqYARZ3hmhe27wmo0j4OUOvcobq9AlPNQStiICWzpZmUC0tRN3ka36dqR7RltKURGEpDPURtXrYZuXMAolxVEnsvrcb+LOtzNGrY9EY6HrmlEMVAWB8/523LuASAjOfFlixXRSjeDiFwxKpj9JPZDizdmdbOCb7Nz4ZtXYiJNoZwyI3tj8j3MDG9URDYWf4knzhRrCFgBj9cjSNu6EgTnp+WyxtqK8mb6p+78A0qjjss8AfrFsuhPS8zXff25PtiJD65uEBt1jNnRjAgnuJbMHBeMMRKmRCLUsA+1Qmb+qjWQTvXz+OZ9I5eckXEdfygUNBEERcGerxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3uAL+Imc9xvcBU+vmaL6cBDyERl3NXlrtn+CpmbEDw=;
 b=bXNwTawxtr4Ua740ch+2uS/fLjymh9q9lVE6fLKWHxImo8J/TpTh8GdWdTmVaWvXzhGjEGqdMPGdVMgcvjbmFmLmQKEuY9FtPlzY5HCghrAYsHosN7aR00lvx8tZNWxH01nKWmpE/v8HEP0ISf7LjO8JCrl+vk/5vOfjpcNhPdm9Xrwu66hFUtcryWxXt/QDaFHbyziUAOz4qiSJO43HFKUDx6xUz2nFrQda5YYHAsqf7pusyJ8vFEaYFLvdpKFWraB/2i1VS/vxzezKZsbjocGt02Ot8NifFaNOzs4DV6BBigGZO/r2rvE32FxFhQQEg6LcZLp9hIzXcuXwb+OxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 07:43:32 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 07:43:32 +0000
Message-ID: <7ac4928d-2bfa-406c-81c9-a57d9fd19514@intel.com>
Date: Wed, 3 Sep 2025 13:13:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: reduce exec. time for sim
 env
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250901063616.1231617-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250901063616.1231617-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::33) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c138ca-40f7-4793-2664-08ddeabd9481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnJiSzRjRUlhKzY5ait1YmwwMk1ockR3elVBOTd0NHJVOWRoTUJrYjdRL1JQ?=
 =?utf-8?B?RnIxaUVROVdobWZ6MGo5Y1hsenNmdjM1ZzdXaUdodmg5aEFJYkh1b3Z0dEtr?=
 =?utf-8?B?cFB0bkVmMkN1TFFSVlNpczhNaVJBS3hQZFUrM1RmWGptSHRTMVg3UXlOOXNu?=
 =?utf-8?B?RENqSHAyZ2FwQkxFUEFOTzFSSHlkY0RHRFJOM00xMFZyVVNpYVRvM2M3a3FL?=
 =?utf-8?B?WjBpMUdlWm1RRUg0czF4encyUzAyeXlFNjYvV3hScjBHSVVlbVZ4V3plOWtQ?=
 =?utf-8?B?MkR6NDJEZHBSeHB1SHczcG83clhOR1FvNmd4SXQ2S3BGSXpjZkprR2doT1hB?=
 =?utf-8?B?ckkxWjdOV0x6NXlIZFMvVWlSVVBJVTFEaGdqRUEwbzBvQzZGYnZLVWtWR0dw?=
 =?utf-8?B?Z1RkRURucU14YUVydngvQ1R6Z29oajdyQlUrV2NRTjd6eGRjYitaT2k3OS8w?=
 =?utf-8?B?RGxzZUp0TVk5WjNWQXJmMll2WkcvNTA4VUNvalQ5QWc4b3BvaCtlSFYxQ3Nq?=
 =?utf-8?B?ZDJncnB0MjE4SHZ1QStiV09MVUJlMjRCUGsvZGhBenJ6QlpRK091TFZ6cnRr?=
 =?utf-8?B?OEpwV1VJRTV5Y003RlN2ekcxSTNJaHdXV0hTY09zYjQ1dEJWcDRjSTFoRXRz?=
 =?utf-8?B?ZGNMUno3dWpzYjdEVU9xMTZmdE5TRVE4emVHcmRvMUR3cFh5b2phci82aG9P?=
 =?utf-8?B?a0FTUE82N3owb3Q3WThCWGt4SnU2TDVmcVhnQlJNc1hORGRpS3pUR2NjOWUr?=
 =?utf-8?B?UDNibGx4U3RDSlRMWjhUOVJ2OTNsSFRGWEtMcUR0TTI2UE40Ym0zN2I5aVgv?=
 =?utf-8?B?N3hFUCt4SHg2bVdvblhLWjBKZXo5ODFLK3MzWVlRQWYyd21ERTd1Sy9yZVB1?=
 =?utf-8?B?N2psU01GbDNwb1NUQUNsZ0JmNGtPZVJzcDBIMDRCSUgvNnB3cFB6aXFocFdP?=
 =?utf-8?B?QVdabGRadTRqQ2lBVU80c09tVElRMGJRNnNReThDRWJTaVoxV3pKRmdWbVFr?=
 =?utf-8?B?NENxc1M3OXNrVE9XNXgyaS9lUyt3dW5ndDZMdUdkNnBNNkdNK3VsTXBSb1VB?=
 =?utf-8?B?YUMwOUlsR2toWGh1Y0NnNmkrQU9XSmIxV3lNMjN1VS9OYXJubzg0ZG1Da2Vq?=
 =?utf-8?B?TG9SRXQxd0RWZUdhUjEyZGJ6aGRnZ01nMkxPSVVuVlhlUjlQbzRQbFE1VVBu?=
 =?utf-8?B?bEFUOE4xQVo1eEowMGdTemIrcmdYRTRwTTZMWW9yVDFaajJSV05SZVl2dmgy?=
 =?utf-8?B?dDNYc3FMNEJXUWRLT1F3WnR0eS9EVmFDcnRrVkF6ZEpWZThrclBCaDZhR3cr?=
 =?utf-8?B?UWYrUXRGRXVrWFJSSENwV0VhWS9UbGFKcEZuRldnSTVXUXVjMW1FR1dzM256?=
 =?utf-8?B?cTc1cXB6cmJZN0l3TENuakd4MzlETFNOaXI5cEVGQlRIcXpiWFFML0lBL3Bj?=
 =?utf-8?B?RGtKQ1ZGMkxQbnNTUlpVQlljeHdqOUtTbHJqZkEyNStkYm9WbG5tSlVGaEhR?=
 =?utf-8?B?Ymkvem50MXBuKzRxMXZlSWZQd0pKSlhoelJEUWIxMU5sVzA1aWNTUVNhbzMr?=
 =?utf-8?B?eHdaemZLUXloSmNZQkRnNzBTRnh0bTR5WFQ2bmNuQWUrcVByUS9qSVA1Yzhh?=
 =?utf-8?B?NE1MZnlxTkI1dU1TZkFNb1N6WExlTlR5MFNRaVZmNmhEME9wOVBzMzhjdjhj?=
 =?utf-8?B?bWRybVBFWlBIUjZOeUdzRmVSNmZNZ3FicTl3RGZ6SkdvR2k4VnFsdGxTQW5q?=
 =?utf-8?B?WkxMOHArMEY2MVRWVHZGZFlpUDJJbmZUTE90K2ZEdFZPenNqYkl3ZWdvY0Za?=
 =?utf-8?B?U1VxMDNxeHNSTkI3aktLZVgrMnltM3dQTDdSK2gzWWpDbDBBZG9zQVo4Zmlh?=
 =?utf-8?B?eDJHZWRDK2NFSG5GUlRHTnp4NVFvY2h2bWs3L1YzZ3JKQk5FeURGbmxwcEl5?=
 =?utf-8?Q?lktdR+Go2/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0RGUXNzVE8zRjc3dzJicjRFMVFYRTlrT1gwSUE3UDhwbk1TOTJJTnl0VmFk?=
 =?utf-8?B?ODh2ZHpCQ0VLYUZ4QmliYVFFaFBNbWdDMVp6MS9QRjdldCtIZG5kSHhSbHNI?=
 =?utf-8?B?ZGtuS29VZDBUbTJVVlR0TitoblVJNHgxNzZ4SEVBTENrZWhCRUhRbFY2WEZX?=
 =?utf-8?B?Q0tSZldVdFdQbDVxUjJuVlNYczZabnRJNmRTbzhtMXQ1MzdBekI1T0NYOWF1?=
 =?utf-8?B?bk8zRG9GQWhZd2ROZUI4VW4wS2xNSWl1Sk81T0t2dDRzdzhmYW1EYzRjOG9G?=
 =?utf-8?B?YnB3WGExU2s5bFJtUStJR1ZXeDczbmZadTlSbGlNL1RtNWhrL3NrTldJQjRo?=
 =?utf-8?B?WExWbXhiMzFSbGxKVzRkQ0V1M2ZwSFhsZWRDTStGSGh5VU1PMFZoTURMSlYx?=
 =?utf-8?B?dUk2U2poa3RSUUJGS081bXl6Z2xlSzJCbC93ODV3K21pZHZMQlczZWxHZkc2?=
 =?utf-8?B?ZzJPZFJ4SjRrMlF6SnVVYyswOUhLdy9mMGtOM3lZNi9HNWhJLzlFaUtLcVMr?=
 =?utf-8?B?Njl5TkI4VFVIQml4eXNrMVRENGlack1qaUZ6R05yakFNelNKUWUwMkEwN3VW?=
 =?utf-8?B?UG9GN1ROSzU2SGQ0ZGV5TU9QaHpCc1AxcXpZdHI0VEFWWWFsQjkvU3ZHTzRh?=
 =?utf-8?B?d3NITDM4MUpaakllTU1DRUZoUWw5aEs5NS8wUGMzMWZNWGJPdlczVENEN0Z6?=
 =?utf-8?B?N1ZMeWIwaWRGVGJkVVYydE1UVVJmVUlNT1lZSlBpb1Mwd0xXWTFpdXV1eGh3?=
 =?utf-8?B?WUpVZXJEM0NsUFJURlR3UWxsZUdFbVZiY0g4UVpta0JSLy9KVWdBaHpoaEFT?=
 =?utf-8?B?ZmN4WStyOC93aVFDK3JEKzc2UURkK2xNc3Y2ZGpESFVtZ2F2QXZqYkZoUWcz?=
 =?utf-8?B?aVQvUzI3cGl6a2loNjNkYk1GdTdsTVgwT0J4MzRrbXBGdHZxelpsR0pEb3BH?=
 =?utf-8?B?Q2lXZ3ZEQUU2S1FvSXI1OVVFY1FZOTNnNVJBTE44dlpsRW9OemV2bkhKdjln?=
 =?utf-8?B?SUREaDBVZjByRFRybkRQSWg0TWNHY2lMUC94VVlRZjRPOFNKTEIrdVMvRXcz?=
 =?utf-8?B?RnNZVDlnbDdGTXhvdGwzMGNFU1ZrOXdHMWp0MktZN3UrR0ZWQ3JsU1ZwbEVW?=
 =?utf-8?B?UGh6bzZaeFRCVnlBd3ZpZVJrRWhpblFxMFhzd2pvbjRBWjE2Rkt6T3krK01n?=
 =?utf-8?B?NGxOaGNTNXRBQk9VTlBzTzN4Y29LRFpnUXAvTk44VzZ0c1dwdmYxYTYxTHFi?=
 =?utf-8?B?VTh0WjJ5aURLaEQ2WThaVVlzSGdVSVdodkgvSGdINVBhMFFTaDNZNEx4YkZ4?=
 =?utf-8?B?dkMwMy9iY1YybWRjQnpBb3FZcUZzakRwUXNYTXBCZkpXNjJzYURlaXJwTjkw?=
 =?utf-8?B?QmRIZW96TFlVZE9sOGhkWURhUTVKSXF1M253bUFZUko1T0hoOWFSeUFIQVNY?=
 =?utf-8?B?NVpVL0VmM3FsM0lVcnFzZlE2bWEwck04Ny82VlQ5alN6NHF3ZEJHNVBLUG5n?=
 =?utf-8?B?NExCSG83c2dzU3c5TTk3V1F1NXgzRjFMTGF4c0UvUWtJemttRjhsZTZLSjFl?=
 =?utf-8?B?YWlZYUU0bmVIUU5GVlN6aHhnVFJzUlowM1l5YXBWZ3Q3RlNOMXkyRlBGWC83?=
 =?utf-8?B?dk9MUHI5eWpOb0VxdHlZdkNkNis2azQ1aGxBa3lYOEU5a3AvN3luL3k0aUl4?=
 =?utf-8?B?V0JEV2FVRmY0SEtKaXQzSnpJQTIvZk9KQ3lFWHFRNEVOdW9oY1lZT2ZoTStT?=
 =?utf-8?B?YmVaVFZtUk1YY010UTBvbGlsZ2d0UGc1TTNjZUtxYU9oUkVVNEZheTVNWWRR?=
 =?utf-8?B?RXpyd2tHTTk5V0lmM25aV2d2YXZmZ0JCbVQvK09WTW53ZXBqOWxaWmkwNWly?=
 =?utf-8?B?SnN1M0htZXFUZlVHV0ljYXo0ejlBTkVhSC9Vb3hlanIzVXZkcWxIUHpKWW0x?=
 =?utf-8?B?bTJHUXExY2RibGsyTCtJY0lwQk5FWHpWZkh4ZUk4dW1BRTBnREFZV2dlWFhI?=
 =?utf-8?B?bklsVGpEbnhLVkh1WHhva0hZcFQ5U1VWWTdRNC9yVkxyb3FzY3V4elBlb1dD?=
 =?utf-8?B?UkIyM1hjZHBDMWsyQTVMTERhbkhDeTZDLzVmdjVtTGVneTd2QlViWkZpNW9p?=
 =?utf-8?B?M1hPTFprRFdMWThhL04yT0hNZGhxMkkydXRjczN5RytROXh5c1BjNWdOSXpL?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c138ca-40f7-4793-2664-08ddeabd9481
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:43:32.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/hJV/HOInvnsaVh6Be9J26rP8IEa6fDSPc8FECPbEVexVnOJGVUedyfjf0hafVzOnLq6HndbeCydrEY3jyxDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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

Hi Jeevan,

On 01-09-2025 12:06 pm, Jeevan B wrote:
> For simulation environment, we can reduce execution time
> by running test only with one combination.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_display_modes.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index c93195b3c..97e12eb30 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -221,6 +221,8 @@ static void run_extendedmode_test(data_t *data) {
>   			if (igt_run_in_simulation())
>   				break;
>   		}
> +		if (igt_run_in_simulation())
Calling igt_run_in_sim() looks redundant. Lets set a flag after calling 
it for first time and use that to break second loop.
> +			break;
>   	}
>   }
>   

