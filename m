Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659AAEB64C5
	for <igt-dev@archiver.kernel.org>; Sat,  7 Sep 2024 11:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C3E10E220;
	Sat,  7 Sep 2024 11:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P50V1f2e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D9110E220
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Sep 2024 11:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725709685; x=1757245685;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yI+UEDT6ovVdlbydPycGM0hhHHpU+z64AV2T5url530=;
 b=P50V1f2eOVFasAXbVF4ZyNPywhFG0eRYomQQX1wxO0vAYamgNGmPX5m/
 T9e6aamm055gH2vZKrR1d+wXK/LAn4oOGZi7DW1YC96hC7C8rOqD6NWvJ
 IwxzXOkKUOAjH/pA7j2o4AcHtphX6nT7e5gOA+YQA8zUE8h4BpUBsSF6I
 3WodwrcI9ectIZPbYH4njejcMzvRxUx2ustLVl/9gpIcUC2J7a2xRIsow
 KVFjDgd5Z+2Xf6z886Hr2OFNLI7vnHSUorxq1ifPabfNif0myJHGq7ZQ9
 3KhVZ9Tx77BvaLG0rJ5gpgyXCI6OYE9o1MKL2WU/ZCWrlU3yzW59ExCp9 g==;
X-CSE-ConnectionGUID: ipjPkKVqQ7i328D9B1k+0A==
X-CSE-MsgGUID: rDR1sSxsQbSUFYHPhJngNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24256670"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="24256670"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 04:48:05 -0700
X-CSE-ConnectionGUID: OoKh82cfR+6YtFZQoQZHmA==
X-CSE-MsgGUID: jjHXsC1OQHGH5iPQFH1bHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="96992425"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2024 04:48:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:48:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 04:48:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 04:48:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 04:48:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZPaDZlctJBR8vawmbAw+rONqY99HyTvLJnZYIx7Id2fzEYdh7kIo0ksP1OqYdj+tAGsqhRNTJq/BOBEWugyw8heVs2za1kupfCTc3pC3LScALDsW71R6EFD/wmOXaF9mSDkvuPj2yEl7CSduyLjskh1tmMjMutVPOB6r4k+YYaQ6rWGaycQjF2AuAM8OBvLsOXpoNpiacTzwBnu140cwrIq1dgRCLAciLZq1lb/4SX2FXh/3KUkDzCmDdfDdbWBt8igJJBaqUzH/USTSfL24Rj4a9yGnHS/waCWgoiIKCP1ABblKuE1kw+8qgh0YI46Ru/fLFMqTA0neQOrV+qR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6xFY1fjsqk7pRwxqshoqxL377pB7+TQt6jYTvlGuT4=;
 b=kSZIIO2850SlchU3cxTKLCeQKRM3gydIkSgUIsqFSeFhBN9Zc099s2kikIQTR4SKzZyJdKJYdtcshqv12KvC+z81QSKunbfP1I6DKNJFK4/fXZVB0CHDFx8n3Iixa0C4Fl0SeI5OjIUGbb1pWWSZJEziCjlAPoQle8QnZpRZQ8EjobxYdnV+hP1N3HEn6kN1oUdFSRON1ixYUT574dMi7nMw5sg2s1jl/FocxM57lvj5sCR2+5T67XqOxkLgWSyJPXOf5UqI6HtcEf8xZPry3mTil1rWNtXmt1RpL2ncP12MqvtV93TGsbKNHTTUIXOKjLInLCVLZkn6P7mLfN+eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Sat, 7 Sep
 2024 11:48:00 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 11:48:00 +0000
Message-ID: <7b5f64b7-acae-4fba-98ea-a49c788433de@intel.com>
Date: Sat, 7 Sep 2024 17:17:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_psr*: Add psr_sink_error_check
 to PSR tests
To: <igt-dev@lists.freedesktop.org>
References: <20240701051301.3344927-1-jouni.hogander@intel.com>
 <20240701051301.3344927-3-jouni.hogander@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240701051301.3344927-3-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::16) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8c5063-7622-4ac2-3420-08dccf32ec3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hiNVJ6TXhDcFF4RUxMMGlFemU3eTZSVUR6T2VDMm0wOWwyR2EzZC9GN2Rz?=
 =?utf-8?B?M0plbW8yZVFmVkdpYUJaczJTczdoZCs4Y05GRDJmanhuMUw1WnRWQ0JqR1da?=
 =?utf-8?B?WUdUam9OTmdvNjRjc3l5WE1ZYkp5ekdHVUs0WThBR25EckJQSmNwbjVqS0lm?=
 =?utf-8?B?dFBFaEJPbi91R0xIOFFNMHZCYkROSFJyVDZuWjNCRUF2SS9QSGJkVWxzY2Z6?=
 =?utf-8?B?RkRIRUk5WVFTUGx2SXhvUGxtV2lUUTY0L016dnlXdUUwVzBqenkyWHhzR2tn?=
 =?utf-8?B?VjRSdGlUSXNxOGg5V2JlZHFsU0JhemJmTE9tNDhVMnhZWG00M1E2UnZhZlhh?=
 =?utf-8?B?Y0hqYW4vc2ZjTitEMjlTMnpUWEY1aEhuN2RDMFR2bnpuWmovVzJScGRsOUVS?=
 =?utf-8?B?YXZ0SU1zZVpMdEsxSWtMQzlHaGxVcEZLUDloQ0pib2lla3E5TEdJWWVTakxv?=
 =?utf-8?B?ZDRwZ1l4MHU1bThWcEkxODNqcmlUNzcyUlJvV2E4SFptdDVqc1dsWEhkUWhr?=
 =?utf-8?B?OTA1OUFPZ0Q5RXVtMFVSUWpBanVVd245ZkpwRGVJUExPdlcyUHJWR3BOQlMx?=
 =?utf-8?B?Uy9hbHZhb0U0K0NMVXpQNDlkQ3pRd3VqNXdSdjJCU3kxUjEwZGpmTXZDSlo3?=
 =?utf-8?B?dm5vU29vYXY1cGZOT25MOVNRak5GZ3FoZTBETlo1U21EWDg1Z3k2NXFlNk9m?=
 =?utf-8?B?M3JXR0FCd1NwTFgwWHFjejBIdTVnS0tJaUwwaGkzK2twaFk3TlFmRVY5K1Iy?=
 =?utf-8?B?TzFxTU9IQmNJSysvU202MDlwQ2xYb0U4Q0FvS2ptdUZtRWwxVTNDSDlhTmpO?=
 =?utf-8?B?bVZPdk1tdDlwajREdU55U3V4ZkF6UmNZUGNKb2pWeHptNWtkZmRqYUp0Nkxx?=
 =?utf-8?B?Ymg3Yk9XanZtTUJaclpBV0xPL3dGejRPNlRyRlZzR3RmVUpTa05MaS9QdHgz?=
 =?utf-8?B?cVJ3b1d2WFhRN25wSDhpVURDaEZGQVkxdktjZDZCcDVSc3NaMTl2OHlMb0RQ?=
 =?utf-8?B?WGcrY0dNVWFyNnp2T2l1dWM2bk4wYnEwMWltMXV2UEZKY3RwTCt5bGQ4U2o5?=
 =?utf-8?B?NlZYM2lOMldzRmRvdFpSalJjTnU0WU5mOWVxUjY4cUxIRm10VDF4SVpHa1VN?=
 =?utf-8?B?cFdwVTNlR1pyclZNblNLMW5yZHYreHBjNjFiTFh6aS8wSm5mcERZb2UwMWpx?=
 =?utf-8?B?VUF1dmlyd1VRQnpzelU2Nk5IMzFpZXQreWxTQlloYnlDSG95V3NKRDZOaG43?=
 =?utf-8?B?OG9GV01ZTFNXWnVobmNnK01jT1J4bVo4ckFjOUVRTjJYdDRVTThoRE9seUZz?=
 =?utf-8?B?SGM5UlRJcTRZaDNCcnNUMWsrZzd0c1YwQmhobEl4c09NVjUyNHJQYlIyT1hv?=
 =?utf-8?B?bU9KVmdDb3dreDdIUVVYK2hnK3BDblZoWVA1K2VqTUllQ2ZXMkozRDAxQTJE?=
 =?utf-8?B?bWNPZ3JYUkVFdXdueWcrSm5uWVBhWE5TMUE3cUsyODBDYlpadFBLeFlPU2Jx?=
 =?utf-8?B?Z2dXd1pVRFBUcVBnMCtCd2p0OEN1UzZUNWZUQW9zWUdvTkE2OVQ1bi9sdEZE?=
 =?utf-8?B?NHpQOXZLQlpXamw5NnpabHRJenZNUGVpQ1ZISGE4clpNc1JMT1hoRUxwaDcw?=
 =?utf-8?B?b1NWKzJQOWRQbitpS0FXR1c1ZjlWOTJ3M01WRUJCNm1OSmZqQ3hnbmZ1eXpx?=
 =?utf-8?B?RDgwM1R3WXY4YWNDSHBiSXFtREp3aXg1V2xKWmtDcXFHckQzMytHbWxpQnRp?=
 =?utf-8?B?Q1V3MS9EZ0dacUt4VVR4ZFZ3VlJMNDRxRjVXd0VGNytkT3FseGRyajZpMmN6?=
 =?utf-8?B?c0svVnhITmhaRlM2ZmdRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTYzVUl4OFJLUU9pdVVBRjk5QU51dG5QSW9rZ2o0WWIvT3lvdVNQWXZDdEE0?=
 =?utf-8?B?ZGJkWWVabUNOV1JuMjdxY09ydi9HbEJmZmlHUXNCbnRXYzZJaXd4VGM2YWp5?=
 =?utf-8?B?MGpoZG9ISC93U0ZtT2JhWEFmdVVyVDlmMTMrUnFndUdkMG9HaWhZV2hFdHdS?=
 =?utf-8?B?d0FBc2JLUTg2cWlBZ0hMMjVZUVQrN2c4cDB4Uk15T0pJN0M3TDhDY0dMR0Nv?=
 =?utf-8?B?UjJpRmVDaERPN3RadnJtYjFCZWJ2dzV4bDhzQnVleUJYcXpZcVIxSC9BTTRw?=
 =?utf-8?B?WHZ2ZXN4UTRoZCs1citCVUlZK3lzLzJwTW8rZ2JmRklPWXlSZ3ZoMUNDVEJ3?=
 =?utf-8?B?VTBSazRBQU9MQzJBWCtqbTJhcXRXeS96eDBzZ0tPT1YwTDNDem94eHk2TUJS?=
 =?utf-8?B?R3Z6dlI3SEhuY3lQZVViOUsyMW9oY0xtVzRBOGxpei9RbXNPMVpxR0FyckhC?=
 =?utf-8?B?OU4zaTZ5ZkRmTy8yb09vNUIzcGd2WFJzOWlXK1h6U0VkUXQ3UXB0YUN6ZTc4?=
 =?utf-8?B?QVlaaXZuOFV5R041VkthQkIvUGhXbXRWY1ZMdjZwM2ZlcDFTVk9oNFc2Mkhu?=
 =?utf-8?B?WjRNUk90WmJFYnVYUjNncjIvRzJJZ0tPbVhVRW5PNUI1UkJDbmVWU05iUHAv?=
 =?utf-8?B?ZGZwSmcyQkw0TTFUV0M1eWxlTXlIQUo2YW80LzNZYUN1SlJPdlN6cWlSOWhx?=
 =?utf-8?B?TzFLelhtcVBCbXo3VjREUDZtMngzQ1BYcnZ6RWpXdkJEZ0RNc2dpU3lteVoy?=
 =?utf-8?B?SUEvRWZHS1pkcGZaOU9ZNi9IVkh4UlVOUGsxUGNqVk5DcGV0em4vdzA0czFQ?=
 =?utf-8?B?Snh3L09HV0ZZeGVGUGM3WFpLbllDaWFZSHZ0MklGMDN1bmc2SlNnblRzZmRy?=
 =?utf-8?B?V0Z5emx4b1F5R3AxNm1ZZHRzN3h0U29lK3ZqRTg1dEtxdGVjUERyaHJxRUQy?=
 =?utf-8?B?Zmc5dkROQ2hBemZlQlM4dEdaUnRsN2NHTXdUM1c4S2hXZmdMbjVNK0xPTWMx?=
 =?utf-8?B?Wmdqc3Y4Yy9SdW96eHhPdmFNd1QxQXFpbjQwRUpHam41YkhXUTFSMUhVZzNL?=
 =?utf-8?B?Qyt1M0EvSUZtaXhkUkZ0aUpuVFQ0VlBiQklYRkZNT1NQWUFvRXJNQU1BZGQ5?=
 =?utf-8?B?T2JlUDVPVnZ5QUJjZE1pSzV4VXBvNmV0ZHl4ZmlIZWIyQWZiQzQwQkRoRzM4?=
 =?utf-8?B?ZUNLMDYrN0xSZVZuZjhvQlZzZWNsZm1BTHdBeW9pZGNVTDRjUzZnbGRFOFlX?=
 =?utf-8?B?SElDcmR6cnRUc3VPUWkrQk9NN1BmaXlSTk5QUytuQVdjUDd6MFJyTW5Ud2J6?=
 =?utf-8?B?ZDJPdnpJYlZBZUtrenpXOFYwdHdudTlyQ1l2cHdUYXVkL2RzZTladG83VFlK?=
 =?utf-8?B?V2kyZk02NDNzVUkyZEFUa3NCZEt0U3Nza0M0SUUzM3RrSG9HZmFRU29IOHpw?=
 =?utf-8?B?enNDMXRJNFE3cThpdjB2ZmpiWEdNU3FjeWRFOWdONVVvNWFPQXozcmtFS1Vw?=
 =?utf-8?B?UDJ5KzY0bFpDcmJOUG94aEZrVkQxNmFzL2FRcTBrTE50dkZSSXlkYWlEZldr?=
 =?utf-8?B?Ky9abGZBOCtxL3lraTBJTUZ4eG9iekJmakl5ZTAxdFlYU3V0T0w0akYxSUVw?=
 =?utf-8?B?VjlGNjZrUTVhQjRuMnZHOFMzQ1JPaGlpL3VvMTVuczNiRHNzbVp1WmV4bVpN?=
 =?utf-8?B?Nnord2pNSnNCV2c0R3B4eFFTcDlRWTRtN21DY1ZpbEVnODJwbExwY2ZtaS96?=
 =?utf-8?B?RnJMWkJmRm5GNXZhZ2VoMUVxU2dPTnhQNDhwZzVLQVpZZ1F6U0NXbStlOHpn?=
 =?utf-8?B?MHNHUTV1V0V2NTZYYlQveUFhci91Y1p6SlBHb2F6WFRBWTVOU1JmOTFXQlpM?=
 =?utf-8?B?Qzl6eWxRY3lWc04xNTNncDlRZjkraDYyRC9uQnEyYVhwRnZMY0plRk16MTd6?=
 =?utf-8?B?eFUrcnhtdEUwRjZDbDd3SmZRbDRmTDd4Skd1NEthdG5qVXV4V0hMeWJwaUFP?=
 =?utf-8?B?TUx4V1E4RDhrK0Vtc0tWYXQzTlhDSHM3YzdoN1ZLUithQ2VYdFM2c2VqbUJ6?=
 =?utf-8?B?c1ROenRqdzZXYWx5NkViY0U1OUdVSzh6Q0xCMDVrY2JYQ2tZMVkxdkNrN2JX?=
 =?utf-8?B?M0RPT0U5bWNJZmRDdDlZeENkMUxjUXdIc1BGRmNzeEpxYWNWT21Ra0NkZjlY?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8c5063-7622-4ac2-3420-08dccf32ec3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 11:48:00.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3fucvcQ8NZ2FECefcA4gHXiz7OWyYTtBn2I++KLRE4AP44NR5CsQzUkGxGpJ5SCCdIMMntCqt9W0W65mEktZIbM6y5MZcqCNgLI3tz/6fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

Hello Jouni,

On 7/1/2024 10:43 AM, Jouni Högander wrote:
> Currently we are ignoring possible errors detected by the sink in our PSR
> testcases. Fix this by add psr_sink_error_check to each of them.
> 
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 5 +++--
>   tests/intel/kms_pm_dc.c                | 2 ++
>   tests/intel/kms_psr.c                  | 2 ++
>   tests/intel/kms_psr2_sf.c              | 2 ++
>   tests/intel/kms_psr2_su.c              | 2 ++
>   tests/intel/kms_psr_stress_test.c      | 1 +
>   6 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e45d17dd6..913c7b234 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
The file changes are not matching the file name mentioned in the Git 
commit subject. Move this into separate patch.
> @@ -2722,10 +2722,11 @@ static void do_status_assertions(int flags)
>   						   prim_mode_params.pipe));
>   	}
>   
> -	if (flags & ASSERT_PSR_ENABLED)
> +	if (flags & ASSERT_PSR_ENABLED) {
>   		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
>   			     "PSR still disabled\n");
> -	else if (flags & ASSERT_PSR_DISABLED)
> +		psr_sink_error_check(drm.debugfs, PSR_MODE_1, prim_mode_params.output);
> +	} else if (flags & ASSERT_PSR_DISABLED)
>   		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
>   			     "PSR still enabled\n");
>   }
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index e1318bfa6..d5753ad32 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
the file changes are not matching the file name mentioned in the Git 
commit subject. Move this into separate patch.
> @@ -407,6 +407,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
>   	igt_require(!psr_disabled_check(data->debugfs_fd));
>   	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
>   	check_dc_counter(data, dc_flag, dc_counter_before_psr);
> +	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
>   	cleanup_dc_psr(data);
>   }
>   
> @@ -675,6 +676,7 @@ static void test_pkgc_state_psr(data_t *data)
>   	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
>   		  timeout_sec * 1000, 100);
>   	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
> +	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
>   	psr_dpms(data, DRM_MODE_DPMS_ON);
>   	cleanup_dc_psr(data);
>   }
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index f3caa9ecc..c59476137 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -650,6 +650,8 @@ static void test_cleanup(data_t *data)
>   {
>   	igt_plane_t *primary;
>   
> +	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
> +
>   	igt_output_override_mode(data->output, NULL);
>   
>   	primary = igt_output_get_plane_type(data->output,
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 03ff1cddb..a9be1a1ec 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -972,6 +972,8 @@ static void run(data_t *data)
>   	default:
>   		igt_assert(false);
>   	}
> +
> +	psr_sink_error_check(data->debugfs_fd, data->psr_mode, data->output);
>   }
>   
>   static void cleanup(data_t *data)
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index 437ee36f6..0099daf1d 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -273,6 +273,8 @@ static void run(data_t *data, igt_output_t *output)
>   
>   	igt_assert_f(result,
>   		     "No matching selective update blocks read from debugfs\n");
> +
> +	psr_sink_error_check(data->debugfs_fd, PSR_MODE_2, output);
>   }
>   
>   static void cleanup(data_t *data, igt_output_t *output)
> diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
> index d6e2340b8..73a6eb56d 100644
> --- a/tests/intel/kms_psr_stress_test.c
> +++ b/tests/intel/kms_psr_stress_test.c
> @@ -344,6 +344,7 @@ static void run(data_t *data)
>   
>   	/* Check if after all this stress the PSR is still in the same state */
>   	igt_assert(psr_get_mode(data->debugfs_fd, NULL) == data->initial_state);
> +	psr_sink_error_check(data->debugfs_fd, data->initial_state, data->output);
>   }
>   
>   igt_main

