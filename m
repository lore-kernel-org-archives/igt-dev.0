Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781AED2504D
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE2C10E305;
	Mon, 12 Jan 2026 08:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzsWkIap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C8210E305
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768206274; x=1799742274;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zrgrJLai0WYAAmxvPkLz2aq7M0Rp7rGhvl7tx91oElc=;
 b=dzsWkIapZsm3BXG4zwXtzFx656tntK2N5TjQWw5gu1WDhYCN7k6h/DNw
 i01UvRYgstB1aLs5hcLZSb6lwRQLRGKmogQEwGYXnQuLmlmZQsekHpxDr
 9vQEHeKt3queBDwIuYkOx/BdQ3S0kd/77my6BOBe5I6BLDc87/9wfaBZJ
 Hu+guvAvE4SKQyGVxTcQUVg42zWbw33zMFAP3vSPj1FssyFvpMm5dLJOJ
 tFNhmb8a/5NxBDsrkenVQYZTWIvqETje2/hTlo1dQu2becvA/cdXprRtx
 uARxaHbOypUNETjsAvTIYNKgdzRh+7fd+6cW/F3osGOLOOrkrL0xvsmJS A==;
X-CSE-ConnectionGUID: O1Vpa+1TRw+bII2TP+fx4A==
X-CSE-MsgGUID: 2gNzDk4rTKGlJe/1+TucOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80582964"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208,217";a="80582964"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:24:34 -0800
X-CSE-ConnectionGUID: MAmncOTZSKCu+UDjXPBK1A==
X-CSE-MsgGUID: Il62oAp8TBuAlwEyi+iKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
 d="scan'208,217";a="204446049"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:24:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:24:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:24:32 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:24:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQfCyJfI42KYK+FVIDQecgpZskPPIiH2cveLLRWT/VWiBz0WV7epuu1mrACkgwhwUNcE7k206IOyBH3gZ9Vx8Kv8UdHXIJuhaIZTw6Hp8gP5AlAf6IXmpI53bO2+Gggxx2QPAKT14ui3SuGRjdnETbB1g4MDgOrT8EIf55/3D8irFHh+fKQamRBY4M+uQ4ct8q4IGesvUw6FXBISQeD7bcqEcuT5LYf2VpA9p+shURYvIkk7AxIoFUiMH/XXvoKoIfvhQaF5px9NXy5wxSxHrmqJBZF10cyf96bYXtQZ+ejsmcIYZgS27JmLle+PUC2x428KRpQ1npkofZAANBixEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUzfHuZPipCTlzIL/PYQ0CYcpsMV/TaJ3HhF8vrdUig=;
 b=gyKRnb1WK5DzJlSIe/Y/gwH4VUjWrJKHq+WUqVeZcA4uiwYHOoNZeeEw6N0c5i/bNFmtHUd617SZ5Izt+wv9kYZ1Cfwolq4BdOE+MhYYDapba2cQJ+bwYtgCegdGE5cNj+oc848KvYjFQqS5a/jGqdrgXsPEgBdE/rxoj3LkMSWi+xCkP3ilZCtMMzXbYtGb/vbmmc6gaxjnQpWMjWPOQyAGocbzTr0nuVGatR6//KivZCiWvkZ3D+z/rozPxk7t9po6v+kKt2oDpTZIt/SzVx8351U59ccF7AnKtvcjHTXXNtOtcJGaYXjD1prXdtiaxxe6kkaP5U1mrtk2BjZvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:24:30 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::13d7:d295:64e0:273c%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:24:30 +0000
Content-Type: multipart/alternative;
 boundary="------------ozdd7QPpv3DJwYLuWPSrwGsj"
Message-ID: <8e8ec962-5fb9-4b0c-8f7c-8a6dd01496c6@intel.com>
Date: Mon, 12 Jan 2026 13:54:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Content-Language: en-GB
To: <igt-dev@lists.freedesktop.org>
References: <20251208083951.2279254-1-jeevan.b@intel.com>
 <PH0PR11MB480634D39748D5BC84AE2458E4A2A@PH0PR11MB4806.namprd11.prod.outlook.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <PH0PR11MB480634D39748D5BC84AE2458E4A2A@PH0PR11MB4806.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::19) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SN7PR11MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f7b0f2-9783-467d-f439-08de51b401df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVAyU01RQ3ZORFBGSERXZmJuZW5LS0V3dmZ1K05MRktkTVZKRFU3YzM2K0tR?=
 =?utf-8?B?QVlUUTdPRG4yWEFqam1teDhGYXJ1MjZiSUF6Y1JZTVVOTFJiQzlDbmU1ZXZ2?=
 =?utf-8?B?S1REUkJxalNWK0djb1YyZ0lQMHY0WTVUYUVzSWZCb2VFN3Zid3FOWG9zd1VU?=
 =?utf-8?B?aGpkU0FGaEpmM3MvWmJ5cUdEajFITjhjNnpPempKL090dVMrWitLN3gyQTFL?=
 =?utf-8?B?amZnR0VZL3pqSHRjV0NFd2o5d0dGOVRFdE1QY2VaM3QxMTdpWm9ZaGdJYk5j?=
 =?utf-8?B?eVA0K0FsVURLUFJiQmM2WnlLeTZNOEY4TkhHd0ZzOUxlc3pLVUlSNnM5Zk5N?=
 =?utf-8?B?YU1pK3NqV2ljQjNBK0E3YThYNkdLT1UwamRueTAwZlVJWXVScDdCbWFGYUg2?=
 =?utf-8?B?a0xwN3NkUzJNMGlhS01OYThzdWVWMWtxQnpNcUJOaEczRTY2eXZ5NlhJMkda?=
 =?utf-8?B?bkNrMnJ4ak9PT2hNZ1pJZ2QxbUh5VGt0RWxFU2JPZVh1ZVg5NFJzTm4vOVVK?=
 =?utf-8?B?YTNkSmhBWFhoQUxkNlJCa0liOGxaajdkU3gvdGhJRnE2ck03VVRDM0F1SGZl?=
 =?utf-8?B?bWRuSW0xeFdxOGNaNCtPVXZRSlBJT2duMWNTUmVTVmxLL3hraHBkdytmSXNa?=
 =?utf-8?B?NHEzcWF1TGJVMFJuNmhGYi96UFM5eTBPcENsRHRjYldiNVBxemtjUzZsVTFR?=
 =?utf-8?B?cHVKKzkzZllCODZDcVNzRWZTWE5NbmxZUVFVb3BUZGhXVG9mQ1VrRlhMY1FK?=
 =?utf-8?B?Rm1tSnFtc0tVMys2WEVhNjFmcHZOYVFXNGVnSFhUVGthMEJuT0pUU2pZRTBq?=
 =?utf-8?B?SERycHBlL3VnZFZ2VTgzdXFQUGZzYW1VaEc4dGZiSEM4enJxV2x6aFVLRUpu?=
 =?utf-8?B?SUdOWmFFRDN6eE9KZkZabXBFcUlDbEh2UDc3NzkwVkk0S3MxSUJMRFpLdWN3?=
 =?utf-8?B?blhKNUVVVWNDMVZLYWlTbnJhOHBRQjZhK1lsZWZKWE53bXRqVVZUaldCZ25J?=
 =?utf-8?B?TkNLcDI4OTFZM0ZIMFhESzZoN3l2cFdiQUFWNGFLS2d1SkwvbWMzVXhuTFJt?=
 =?utf-8?B?RGJQbGlWYjFVV0NvZU10c0trbmNDTnp2UzRPcmZXRG1lOVM4OVpwTU9LZmFU?=
 =?utf-8?B?N0NxRHI3S0pvSGwvZVpKd1MxTGhZNm5BYVI2ODI1QjZOK1BUVDhTeWxyZnds?=
 =?utf-8?B?bTdIaFJ6YUdDKzduMmxibTRNeFE4VEVJUEE2ajNQUWdhWjJRZmlWRTg1cnZV?=
 =?utf-8?B?SVcraWFhNlBuR1Z0OW04YnZMaXBraDJKKzNRMEtNN293RWRIcHVKSzZLdkJP?=
 =?utf-8?B?M2oxZklvYko5bHk5b2lPMnRPUWJmTVVoSmVVRmMxWFh6RnFTREZXamZnWExo?=
 =?utf-8?B?SlZUem15Nm4rQ1gxUUNlZzlzMW1oaGkwOEZxMkNsczBUdDFWWE5YQkEwSDNl?=
 =?utf-8?B?ZDBjOHVHcjRLR2tUMmp0aEF4RmZMMHZrRnc2NStGWWZVbWNyM2svREVxZHhs?=
 =?utf-8?B?WkJsSzZPNU1pRnJseGtVa1FsbzY4RjVtVkN4aklmdk1ENEI5Q3FRV2pyQnpR?=
 =?utf-8?B?U2RtelQ3UXdjbkNHUXhiby9QN1BxUHVtV1l6d3I4bHFmY3VuMXprYjVDMm15?=
 =?utf-8?B?YW1WZjIyMVpKcENZNE9FbWN0Z0NXUlBPMzNtaEVUV2gvOFEzeUJpdnJRMUNZ?=
 =?utf-8?B?bGJNMlE3aTBseWNLNWFTcnhJUHBIM1c3dWJrVFloc0s0LzhKalRXVnoxcGpZ?=
 =?utf-8?B?U293bWVLQ1JIQlRoeVZaUUpxYy8yNUVxUWV5RzJBNVM0UjZFL3ZWbmFEbU9Z?=
 =?utf-8?B?ME1SSlhOTDA5T1YwbHlGcU1yeWtrTzF0eU1DdDFreEtBU0g3Y0piWHRhdUsw?=
 =?utf-8?B?bERYMDBmOGNlK1F4cmxSTm1ucjJ6cmUxQkNKd3VOS2dzcXhqZVBaNGtuMVlX?=
 =?utf-8?Q?mzbKfH71EdxdPetkT5Dg5CfxSKFM0qSu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlU0ajNFLy9hQUpWTElFNG1UcGhCWlBMaHBKSnJWdjh2bEwzOG94aFJKc0xz?=
 =?utf-8?B?WnFGVFJRL2hHN0x6WTVJejA2UEZSZjhUajJUaXcyNWFsZDZLMzVaRmJyNWdi?=
 =?utf-8?B?czhNUnZCWFF0Zis3RnNscmpoU00yOExQVDdrbThsUkpSYzhvdloxM0h6TUlt?=
 =?utf-8?B?MXdlK1h6N1Ayd0pET1czcHpuRFozbUsvcFNEa3pKWnl2enpvTmlURUN2V0Ir?=
 =?utf-8?B?WEJkcXQvVVRFeHE4VHFoOXMzWnJPL1BRWm9wUDRvQmpYaU55aHFKa2VVSzN6?=
 =?utf-8?B?TkhRbE55aFJONmZWZWRNb2VtVWc1ZlNYU2VsczU3Wmt4VXlyUmVZUmRWUWFG?=
 =?utf-8?B?NmtLMTF2bUpoMXI4VkpkQ1prVzJzQ292RUhxZ3JoOVZHakxPZmswRmEyZ2hU?=
 =?utf-8?B?WnlaNllFMHBXMEJieHhJYVhCeCtGZXRjQ1h3a0NVbFRpcEw3Wm1qM1hEb2Ez?=
 =?utf-8?B?aDF0RHdzOW1EK3hJRzVOUWxjRkptVU8ybzBVZ0ZGNEVBblNVdGNZelBiVEFT?=
 =?utf-8?B?d3FoVUxuMEpDUVRtWXJ0VGM0VWhMelk0WUZQNTB1UWdjRVdBVW9KT0lHTDNZ?=
 =?utf-8?B?QUd3K2prL21hUHNhcXpOWFRUcFR0WHFNYUM2YlRPRW5qYkxGTStXN2JqU0g4?=
 =?utf-8?B?VENWVng1bzJSeFdUczMxRWZJOHJuVEVxdnpuY3hlTTN5dG5Kby9KOHpxZXJ0?=
 =?utf-8?B?dktoWVFUclZDYlp4RExDVWZUdnFBNy82aTVRMWY4aEllOGtiL0Q0MDZHb2JW?=
 =?utf-8?B?aDltbktxanhUUkFGVUM3eWJ5ZzFqT202V3pPeE1HdXo2NksvVmRtWDRSVXNk?=
 =?utf-8?B?SFJVUGFoZUNQUEdHZ0RPVTdiRjhaTTIrWnQrMXlqdUlIWVdjN2hHNFJNNFpx?=
 =?utf-8?B?T0JtbkJXM05CZXREQ3FEY0J2VUtLRDhiTG95UXA5STVuZ3dRcjk5Nk53WkJR?=
 =?utf-8?B?Tlg5bVBsRzdJYXN3YUVxdFZzLy9jVmlaSUwzWUYySEtpZ0IzcitWbWM1dmxE?=
 =?utf-8?B?TmxYQWlGbEF6TDk0VVNhaElBMjhNa0ZSa3hEVERwRCtoUnZQaXJLV3Uxc3BH?=
 =?utf-8?B?blBNMUdycVRQYUpWcWdYTnJZNnowVVUrQjFlN1lIeitDQ3pWRGRxUTRhSDlW?=
 =?utf-8?B?SDhoTzZ1cXR1TStta2ZLclg3aU1ydXNMRmtvYTU2cGVTNWFqT3JydlExQ0lj?=
 =?utf-8?B?eEYwNXM5M3p0c3huaFBGeGNqc1RYV2g0WmtMN0txZmM5V0IwL1cxalo2MWxz?=
 =?utf-8?B?dGlWNW9TZ0s3VDFFQWJZL0c2WjNkNmZBZ2FCYzNBUHVCKzhtYTE3VFEvM1h5?=
 =?utf-8?B?Z0cwUUpEaVpTWHlsQ1diSGdaQnhKMDlsUFpUakxiK295aXVZbWxqMW1pWVpM?=
 =?utf-8?B?SUhBTXlPd1JKWDBCNVhpWWNVeCtoTDQxaWFKWVJwNHIzNWtjM01UZElkQ1do?=
 =?utf-8?B?Wjg2SGRwNVZSZm02VmhibjNaQ3Q0MzJwbnQxUG42Y1pwNWVQVXh2Z2lTRWZH?=
 =?utf-8?B?ZUN1TnVGQlhleFEydFBaMEx1NXFaTkFXUWZuMkppYzNrUy9wMmlXMitLOXFo?=
 =?utf-8?B?MlJ6dnpqb2YzRFRtendHL2ptYzZ4amZWbXN6emswamkxa2orZVFDL0Q4Tzgy?=
 =?utf-8?B?Yi9RRVdLRmcxdDYzU1JTQndieGVzRjc1UGpTVW5zQjdnbWI0SVZURjZjbk84?=
 =?utf-8?B?enIyL2dUckVlbHR5Zlc3OWhKZEFxMlFSQ01TQy9RdG5vN1JiVWJrMWFJUUw4?=
 =?utf-8?B?R1hOaUdKTFR0eTV5Vmg2UEs4clBKdysrRW9UdzhsSS8vZnpKUXl3T1I3VUE5?=
 =?utf-8?B?cmVvRE1sRXVLWDZUYjgzZVJaYm5TUE4yNjk5WWVuRTJCYnp2SWs2SnIzNGxh?=
 =?utf-8?B?ZVdDaGRtKzBoRkhRb3JuZ2ZWZmdhcFAremljZU1iMkdBc243c1J1NHIzRzEy?=
 =?utf-8?B?VW4zSDcyWC9aSk13eHgrTkNiakJhNXc5ckh0U3N3cmRMN3YzUEVFeWNlMHVI?=
 =?utf-8?B?d2ZmNUprK1kxamRGelZqdStsSEY5T0J6WUFjeWIzZFlXTWY1WDRzNTVNWnFS?=
 =?utf-8?B?a1FQYmxGTEtFeU5kNkdjd21ZL1E2OVNXUmpKWlZRekdvcFduWmhuV2h2Mmg0?=
 =?utf-8?B?TXBFSzVmUFhuNyswUW5sKzZTUFZEMnVQMFoyK0lYSnVpNGVVZXc0cnkwK21k?=
 =?utf-8?B?QTI4SWdFeGlTdUJoNkZEQjdOOTNRSkljYmpRRjdrU3ZMRWlmOFNQVlpLODVp?=
 =?utf-8?B?Szh2cEh0Y0VXZEtyZDczQkZlbUVDTVZxWUZWYmVwYmRLZ0ZidmxkTHIxamxj?=
 =?utf-8?B?Nk1zc0lNeHlseFJ3aHFILzd1cFBWQTBrekhnWXNzSDZubEtZa3Ird1RsRFFk?=
 =?utf-8?Q?EIY5P57VCpJ2Gqcc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f7b0f2-9783-467d-f439-08de51b401df
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:24:30.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9agIow6OstUhZ1Dl3kTA1cyDdvRyCHd0cX0XOJDfC3+IYz2PqcY+U1ejSbrmkJ/mw/y7KwgDrslalNAYfKUi23tBfTQkCvePqvu+ynuZcxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
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

--------------ozdd7QPpv3DJwYLuWPSrwGsj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-12-2025 04:01 pm, Thasleem, Mohammed wrote:
>
> -----Original Message-----
> From: B, Jeevan<jeevan.b@intel.com> 
> Sent: 08 December 2025 02:10 PM
> To:igt-dev@lists.freedesktop.org
> Cc: B S, Karthik<karthik.b.s@intel.com>; Thasleem, Mohammed<mohammed.thasleem@intel.com>; B, Jeevan<jeevan.b@intel.com>
> Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to common library
>
> Move DC counter utility functions from tests/intel/kms_pm_dc.c to lib/igt_pm.c for reuse across other tests.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   lib/igt_pm.c            | 169 ++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pm.h            |  15 ++++
>   tests/intel/kms_pm_dc.c | 121 ----------------------------
>   3 files changed, 184 insertions(+), 121 deletions(-)
>
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 1ffcdcef3..7873c68a4 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1543,3 +1543,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
>   				   DRM_MODE_DPMS_ON);
>   	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
>   }
> +
> +/**
> + * get_dc_counter:
> + * @dc_data: String containing DC counter data in format
> + *
> + * Returns the counter value as uint32_t  */ uint32_t
> +get_dc_counter(char *dc_data) {

*-->Use the 'igt_' prefix before all lib.c/h functions.*


> +	char *e;
> +	long ret;
> +	char *s = strchr(dc_data, ':');
> +
> +	igt_assert(s);
> +	s++;
> +	ret = strtol(s, &e, 10);
> +	igt_assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) &&
> +		   e > s && *e == '\n' && ret >= 0);
> +	return ret;
> +}
> +
> +/**
> + * support_dc6:
> + * @debugfs_fd: DRM file descriptor
> + *
> + * Returns true if DC6 is supported.
> + */
> +bool support_dc6(int debugfs_fd)
> +{
> +	char buf[4096];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> +				buf, sizeof(buf));
> +	return strstr(buf, "DC5 -> DC6 count"); }
> +
> +/**
> + * get_dc6_counter:Locate DC6 counter string in debugfs buffer
> + * @buf: Buffer containing i915_dmc_info debugfs output
> + *
> + * Searches for DC6 counter information in the DMC info buffer.
> + */
> +char *get_dc6_counter(const char *buf)
> +{
> +	char *str;
> +
> +	str = strstr(buf, "DC5 -> DC6 count");
> +	if (!str)
> +		str = strstr(buf, "DC5 -> DC6 allowed count");
> +
> +	return str;
> +}
> +
> +/**
> + * read_dc_counter:
> + * @debugfs_fd: DRM file descriptor
> + * @dc_flag: DC state flag (CHECK_DC5, CHECK_DC6, or CHECK_DC3CO)
> + *
> + * Returns current counter value for the specified DC state  */
> +uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) {
> +	char buf[4096];
> +	char *str;
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf,
> +sizeof(buf));
> +
> +	if (dc_flag & CHECK_DC5) {
> +		str = strstr(buf, "DC3 -> DC5 count");
> +		igt_assert_f(str, "DC5 counter is not available\n");
> +	} else if (dc_flag & CHECK_DC6) {
> +		str = get_dc6_counter(buf);
> +		igt_assert_f(str, "No DC6 counter available\n");
> +	} else if (dc_flag & CHECK_DC3CO) {
> +		str = strstr(buf, "DC3CO count");
> +		igt_assert_f(str, "DC3CO counter is not available\n");
> +	} else {
> +		igt_assert(!"reached");
> +		str = NULL;
> +	}
> +
> +	return get_dc_counter(str);
> +}
> +
> +/**
> + * dc_state_wait_entry:
> + * @debugfs_fd: DRM file descriptor
> + * @dc_flag: DC state flag
> + * @prev_dc_count: Previous counter value to compare against
> + *
> + * Returns true if DC state entry detected within timeout, false
> +otherwise  */ bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int
> +prev_dc_count) {
> +	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
> +			prev_dc_count, 3000, 100);
> +}
> +
> +/**
> + * dc_state_name:
> + * @dc_flag: DC state flag
> + *
> + * Converts DC state flag constants to readable string names  */ const
> +char *dc_state_name(int dc_flag) {
> +	if (dc_flag & CHECK_DC3CO)
> +		return "DC3CO";
> +	else if (dc_flag & CHECK_DC5)
> +		return "DC5";
> +	else
> +		return "DC6";
> +}
> +
> +/**
> + * require_dc_counter:
> + * @debugfs_fd: File descriptor for the debugfs
> + * @dc_flag: DC counter type to check (CHECK_DC3CO, CHECK_DC5,
> + * or CHECK_DC6)
> + *
> + * Skips the current test if the requested DC counter is not available
> + * on the system.
> + */
> +void require_dc_counter(int debugfs_fd, int dc_flag) {
> +	char *str;
> +	char buf[4096];
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> +				buf, sizeof(buf));
> +
> +	switch (dc_flag) {
> +	case CHECK_DC3CO:
> +		igt_skip_on_f(!strstr(buf, "DC3CO count"),
> +			      "DC3CO counter is not available\n");
> +		break;
> +	case CHECK_DC5:
> +		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
> +			      "DC5 counter is not available\n");
> +		break;
> +	case CHECK_DC6:
> +		str = get_dc6_counter(buf);
> +		igt_skip_on_f(!str, "No DC6 counter available\n");
> +		break;
> +	default:
> +		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> +	}
> +}
> +
> +/**
> + * read_pkgc_counter:
> + * @debugfs_root_fd: File descriptor for the debugfs
> + *
> + * Returns PC10 counter value.
> + */
> +unsigned int read_pkgc_counter(int debugfs_root_fd) {
> +	char buf[4096];
> +	char *str;
> +	int len;
> +
> +	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
> +	igt_skip_on_f(len < 0, "PKGC state file not found\n");
> +	buf[len] = '\0';
> +	str = strstr(buf, "Package C10");
> +	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
> +
> +	return get_dc_counter(str);
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h index e931e51af..2db71e826 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -29,6 +29,13 @@
>   
>   #include "igt_kms.h"
>   
> +#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
> +
> +/* DC State Flags */
> +#define CHECK_DC5       (1 << 0)
> +#define CHECK_DC6       (1 << 1)
> +#define CHECK_DC3CO     (1 << 2)
> +
>   void igt_pm_enable_audio_runtime_pm(void);
>   void igt_pm_enable_sata_link_power_management(void);
>   void igt_pm_restore_sata_link_power_management(void);
> @@ -99,5 +106,13 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev);  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  bool igt_has_pci_pm_capability(struct pci_device *pci_dev);  void igt_pm_dpms_toggle(igt_output_t *output);
> +uint32_t get_dc_counter(char *dc_data); bool support_dc6(int
> +debugfs_fd); char *get_dc6_counter(const char *buf); uint32_t
> +read_dc_counter(uint32_t debugfs_fd, int dc_flag); bool
> +dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
> +const char *dc_state_name(int dc_flag); void require_dc_counter(int
> +debugfs_fd, int dc_flag); unsigned int read_pkgc_counter(int
> +debugfs_root_fd);
>   
>   #endif /* IGT_PM_H */
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index 8cdf312f6..226bb753d 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -79,15 +79,9 @@
>    * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
>    */
>   
> -/* DC State Flags */
> -#define CHECK_DC5	(1 << 0)
> -#define CHECK_DC6	(1 << 1)
> -#define CHECK_DC3CO	(1 << 2)
> -
>   #define PWR_DOMAIN_INFO "i915_power_domain_info"
>   #define RPM_STATUS "i915_runtime_pm_status"
>   #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
> -#define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
>   #define KMS_POLL_DISABLE 0
>   #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) >= 14))  #define SEC 1 @@ -116,7 +110,6 @@ typedef struct {
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> -static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);  static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data) @@ -260,70 +253,6 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
>   	paint_rectangles(data, data->mode, fb_color, fb);  }
>   
> -static uint32_t get_dc_counter(char *dc_data) -{
> -	char *e;
> -	long ret;
> -	char *s = strchr(dc_data, ':');
> -
> -	igt_assert(s);
> -	s++;
> -	ret = strtol(s, &e, 10);
> -	igt_assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) && e > s && *e == '\n' && ret >= 0);
> -	return ret;
> -}
> -
> -static char *get_dc6_counter(const char *buf) -{
> -	char *str;
> -
> -	str = strstr(buf, "DC5 -> DC6 count");
> -	if (!str)
> -		str = strstr(buf, "DC5 -> DC6 allowed count");
> -
> -	return str;
> -}
> -
> -static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) -{
> -	char buf[4096];
> -	char *str;
> -
> -	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
> -
> -	if (dc_flag & CHECK_DC5) {
> -		str = strstr(buf, "DC3 -> DC5 count");
> -		igt_assert_f(str, "DC5 counter is not available\n");
> -	} else if (dc_flag & CHECK_DC6) {
> -		str = get_dc6_counter(buf);
> -		igt_assert_f(str, "No DC6 counter available\n");
> -	} else if (dc_flag & CHECK_DC3CO) {
> -		str = strstr(buf, "DC3CO count");
> -		igt_assert_f(str, "DC3CO counter is not available\n");
> -	} else {
> -		igt_assert(!"reached");
> -		str = NULL;
> -	}
> -
> -	return get_dc_counter(str);
> -}
> -
> -static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count) -{
> -	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) >
> -			prev_dc_count, 3000, 100);
> -}
> -
> -static const char *dc_state_name(int dc_flag) -{
> -	if (dc_flag & CHECK_DC3CO)
> -		return "DC3CO";
> -	else if (dc_flag & CHECK_DC5)
> -		return "DC5";
> -	else
> -		return "DC6";
> -}
> -
>   static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)  {
>   	igt_assert_f(dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count), @@ -385,32 +314,6 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>   		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");  }
>   
> -static void require_dc_counter(int debugfs_fd, int dc_flag) -{
> -	char *str;
> -	char buf[4096];
> -
> -	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> -				buf, sizeof(buf));
> -
> -	switch (dc_flag) {
> -	case CHECK_DC3CO:
> -		igt_skip_on_f(!strstr(buf, "DC3CO count"),
> -			      "DC3CO counter is not available\n");
> -		break;
> -	case CHECK_DC5:
> -		igt_skip_on_f(!strstr(buf, "DC3 -> DC5 count"),
> -			      "DC5 counter is not available\n");
> -		break;
> -	case CHECK_DC6:
> -		str = get_dc6_counter(buf);
> -		igt_skip_on_f(!str, "No DC6 counter available\n");
> -		break;
> -	default:
> -		igt_assert_f(0, "Unknown DC counter %d\n", dc_flag);
> -	}
> -}
> -
>   static void setup_dc3co(data_t *data)
>   {
>   	data->op_psr_mode = PSR_MODE_2;
> @@ -531,15 +434,6 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
>   	cleanup_dc_dpms(data);
>   }
>   
> -static bool support_dc6(int debugfs_fd) -{
> -	char buf[4096];
> -
> -	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> -				buf, sizeof(buf));
> -	return strstr(buf, "DC5 -> DC6 count");
> -}
> -
>   static uint64_t read_runtime_suspended_time(int drm_fd)  {
>   	struct pci_device *i915;
> @@ -621,21 +515,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
>   	return external_panel;
>   }
>   
> -static unsigned int read_pkgc_counter(int debugfs_root_fd) -{
> -	char buf[4096];
> -	char *str;
> -	int len;
> -
> -	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
> -	igt_skip_on_f(len < 0, "PKGC state file not found\n");
> -	buf[len] = '\0';
> -	str = strstr(buf, "Package C10");
> -	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
> -
> -	return get_dc_counter(str);
> -}
> -
>   static void test_deep_pkgc_state(data_t *data)  {
>   	unsigned int pre_val = 0, cur_val = 0;
> --
> 2.43.0
>
--------------ozdd7QPpv3DJwYLuWPSrwGsj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-12-2025 04:01 pm, Thasleem,
      Mohammed wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:PH0PR11MB480634D39748D5BC84AE2458E4A2A@PH0PR11MB4806.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

-----Original Message-----
From: B, Jeevan <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a> 
Sent: 08 December 2025 02:10 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: B S, Karthik <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>; Thasleem, Mohammed <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>; B, Jeevan <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
Subject: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to common library

Move DC counter utility functions from tests/intel/kms_pm_dc.c to lib/igt_pm.c for reuse across other tests.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 lib/igt_pm.c            | 169 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h            |  15 ++++
 tests/intel/kms_pm_dc.c | 121 ----------------------------
 3 files changed, 184 insertions(+), 121 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c index 1ffcdcef3..7873c68a4 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1543,3 +1543,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
 				   DRM_MODE_DPMS_ON);
 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
 }
+
+/**
+ * get_dc_counter:
+ * @dc_data: String containing DC counter data in format
+ *
+ * Returns the counter value as uint32_t  */ uint32_t 
+get_dc_counter(char *dc_data) {</pre>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
</style>
<![endif]-->
    <p class="MsoPlainText"><b><span style="color: rgb(0, 0, 0); font-family: IntelOneTextNormal, system-ui, &quot;Segoe UI&quot;, Helvetica, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">--&gt;Use
          the 'igt_' prefix before all lib.c/h functions.</span></b></p>
    <br>
    <blockquote type="cite" cite="mid:PH0PR11MB480634D39748D5BC84AE2458E4A2A@PH0PR11MB4806.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
+	char *e;
+	long ret;
+	char *s = strchr(dc_data, ':');
+
+	igt_assert(s);
+	s++;
+	ret = strtol(s, &amp;e, 10);
+	igt_assert(((ret != LONG_MIN &amp;&amp; ret != LONG_MAX) || errno != ERANGE) &amp;&amp;
+		   e &gt; s &amp;&amp; *e == '\n' &amp;&amp; ret &gt;= 0);
+	return ret;
+}
+
+/**
+ * support_dc6:
+ * @debugfs_fd: DRM file descriptor
+ *
+ * Returns true if DC6 is supported.
+ */
+bool support_dc6(int debugfs_fd)
+{
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, &quot;i915_dmc_info&quot;,
+				buf, sizeof(buf));
+	return strstr(buf, &quot;DC5 -&gt; DC6 count&quot;); }
+
+/**
+ * get_dc6_counter:Locate DC6 counter string in debugfs buffer
+ * @buf: Buffer containing i915_dmc_info debugfs output
+ *
+ * Searches for DC6 counter information in the DMC info buffer.
+ */
+char *get_dc6_counter(const char *buf)
+{
+	char *str;
+
+	str = strstr(buf, &quot;DC5 -&gt; DC6 count&quot;);
+	if (!str)
+		str = strstr(buf, &quot;DC5 -&gt; DC6 allowed count&quot;);
+
+	return str;
+}
+
+/**
+ * read_dc_counter:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag (CHECK_DC5, CHECK_DC6, or CHECK_DC3CO)
+ *
+ * Returns current counter value for the specified DC state  */ 
+uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) {
+	char buf[4096];
+	char *str;
+
+	igt_debugfs_simple_read(debugfs_fd, &quot;i915_dmc_info&quot;, buf, 
+sizeof(buf));
+
+	if (dc_flag &amp; CHECK_DC5) {
+		str = strstr(buf, &quot;DC3 -&gt; DC5 count&quot;);
+		igt_assert_f(str, &quot;DC5 counter is not available\n&quot;);
+	} else if (dc_flag &amp; CHECK_DC6) {
+		str = get_dc6_counter(buf);
+		igt_assert_f(str, &quot;No DC6 counter available\n&quot;);
+	} else if (dc_flag &amp; CHECK_DC3CO) {
+		str = strstr(buf, &quot;DC3CO count&quot;);
+		igt_assert_f(str, &quot;DC3CO counter is not available\n&quot;);
+	} else {
+		igt_assert(!&quot;reached&quot;);
+		str = NULL;
+	}
+
+	return get_dc_counter(str);
+}
+
+/**
+ * dc_state_wait_entry:
+ * @debugfs_fd: DRM file descriptor
+ * @dc_flag: DC state flag
+ * @prev_dc_count: Previous counter value to compare against
+ *
+ * Returns true if DC state entry detected within timeout, false 
+otherwise  */ bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int 
+prev_dc_count) {
+	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) &gt;
+			prev_dc_count, 3000, 100);
+}
+
+/**
+ * dc_state_name:
+ * @dc_flag: DC state flag
+ *
+ * Converts DC state flag constants to readable string names  */ const 
+char *dc_state_name(int dc_flag) {
+	if (dc_flag &amp; CHECK_DC3CO)
+		return &quot;DC3CO&quot;;
+	else if (dc_flag &amp; CHECK_DC5)
+		return &quot;DC5&quot;;
+	else
+		return &quot;DC6&quot;;
+}
+
+/**
+ * require_dc_counter:
+ * @debugfs_fd: File descriptor for the debugfs
+ * @dc_flag: DC counter type to check (CHECK_DC3CO, CHECK_DC5,
+ * or CHECK_DC6)
+ *
+ * Skips the current test if the requested DC counter is not available
+ * on the system.
+ */
+void require_dc_counter(int debugfs_fd, int dc_flag) {
+	char *str;
+	char buf[4096];
+
+	igt_debugfs_simple_read(debugfs_fd, &quot;i915_dmc_info&quot;,
+				buf, sizeof(buf));
+
+	switch (dc_flag) {
+	case CHECK_DC3CO:
+		igt_skip_on_f(!strstr(buf, &quot;DC3CO count&quot;),
+			      &quot;DC3CO counter is not available\n&quot;);
+		break;
+	case CHECK_DC5:
+		igt_skip_on_f(!strstr(buf, &quot;DC3 -&gt; DC5 count&quot;),
+			      &quot;DC5 counter is not available\n&quot;);
+		break;
+	case CHECK_DC6:
+		str = get_dc6_counter(buf);
+		igt_skip_on_f(!str, &quot;No DC6 counter available\n&quot;);
+		break;
+	default:
+		igt_assert_f(0, &quot;Unknown DC counter %d\n&quot;, dc_flag);
+	}
+}
+
+/**
+ * read_pkgc_counter:
+ * @debugfs_root_fd: File descriptor for the debugfs
+ *
+ * Returns PC10 counter value.
+ */
+unsigned int read_pkgc_counter(int debugfs_root_fd) {
+	char buf[4096];
+	char *str;
+	int len;
+
+	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
+	igt_skip_on_f(len &lt; 0, &quot;PKGC state file not found\n&quot;);
+	buf[len] = '\0';
+	str = strstr(buf, &quot;Package C10&quot;);
+	igt_skip_on_f(!str, &quot;PKGC10 is not supported.\n&quot;);
+
+	return get_dc_counter(str);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h index e931e51af..2db71e826 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -29,6 +29,13 @@
 
 #include &quot;igt_kms.h&quot;
 
+#define PACKAGE_CSTATE_PATH  &quot;pmc_core/package_cstate_show&quot;
+
+/* DC State Flags */
+#define CHECK_DC5       (1 &lt;&lt; 0)
+#define CHECK_DC6       (1 &lt;&lt; 1)
+#define CHECK_DC3CO     (1 &lt;&lt; 2)
+
 void igt_pm_enable_audio_runtime_pm(void);
 void igt_pm_enable_sata_link_power_management(void);
 void igt_pm_restore_sata_link_power_management(void);
@@ -99,5 +106,13 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev);  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);  bool igt_has_pci_pm_capability(struct pci_device *pci_dev);  void igt_pm_dpms_toggle(igt_output_t *output);
+uint32_t get_dc_counter(char *dc_data); bool support_dc6(int 
+debugfs_fd); char *get_dc6_counter(const char *buf); uint32_t 
+read_dc_counter(uint32_t debugfs_fd, int dc_flag); bool 
+dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count); 
+const char *dc_state_name(int dc_flag); void require_dc_counter(int 
+debugfs_fd, int dc_flag); unsigned int read_pkgc_counter(int 
+debugfs_root_fd);
 
 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index 8cdf312f6..226bb753d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -79,15 +79,9 @@
  * Description: This test validates display engine entry to DC5 state while PSR is active on Pipe B
  */
 
-/* DC State Flags */
-#define CHECK_DC5	(1 &lt;&lt; 0)
-#define CHECK_DC6	(1 &lt;&lt; 1)
-#define CHECK_DC3CO	(1 &lt;&lt; 2)
-
 #define PWR_DOMAIN_INFO &quot;i915_power_domain_info&quot;
 #define RPM_STATUS &quot;i915_runtime_pm_status&quot;
 #define KMS_HELPER &quot;/sys/module/drm_kms_helper/parameters/&quot;
-#define PACKAGE_CSTATE_PATH  &quot;pmc_core/package_cstate_show&quot;
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || intel_display_ver(devid) &gt;= 14))  #define SEC 1 @@ -116,7 +110,6 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
-static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);  static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data) @@ -260,70 +253,6 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	paint_rectangles(data, data-&gt;mode, fb_color, fb);  }
 
-static uint32_t get_dc_counter(char *dc_data) -{
-	char *e;
-	long ret;
-	char *s = strchr(dc_data, ':');
-
-	igt_assert(s);
-	s++;
-	ret = strtol(s, &amp;e, 10);
-	igt_assert(((ret != LONG_MIN &amp;&amp; ret != LONG_MAX) || errno != ERANGE) &amp;&amp; e &gt; s &amp;&amp; *e == '\n' &amp;&amp; ret &gt;= 0);
-	return ret;
-}
-
-static char *get_dc6_counter(const char *buf) -{
-	char *str;
-
-	str = strstr(buf, &quot;DC5 -&gt; DC6 count&quot;);
-	if (!str)
-		str = strstr(buf, &quot;DC5 -&gt; DC6 allowed count&quot;);
-
-	return str;
-}
-
-static uint32_t read_dc_counter(uint32_t debugfs_fd, int dc_flag) -{
-	char buf[4096];
-	char *str;
-
-	igt_debugfs_simple_read(debugfs_fd, &quot;i915_dmc_info&quot;, buf, sizeof(buf));
-
-	if (dc_flag &amp; CHECK_DC5) {
-		str = strstr(buf, &quot;DC3 -&gt; DC5 count&quot;);
-		igt_assert_f(str, &quot;DC5 counter is not available\n&quot;);
-	} else if (dc_flag &amp; CHECK_DC6) {
-		str = get_dc6_counter(buf);
-		igt_assert_f(str, &quot;No DC6 counter available\n&quot;);
-	} else if (dc_flag &amp; CHECK_DC3CO) {
-		str = strstr(buf, &quot;DC3CO count&quot;);
-		igt_assert_f(str, &quot;DC3CO counter is not available\n&quot;);
-	} else {
-		igt_assert(!&quot;reached&quot;);
-		str = NULL;
-	}
-
-	return get_dc_counter(str);
-}
-
-static bool dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count) -{
-	return igt_wait(read_dc_counter(debugfs_fd, dc_flag) &gt;
-			prev_dc_count, 3000, 100);
-}
-
-static const char *dc_state_name(int dc_flag) -{
-	if (dc_flag &amp; CHECK_DC3CO)
-		return &quot;DC3CO&quot;;
-	else if (dc_flag &amp; CHECK_DC5)
-		return &quot;DC5&quot;;
-	else
-		return &quot;DC6&quot;;
-}
-
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)  {
 	igt_assert_f(dc_state_wait_entry(data-&gt;debugfs_fd, dc_flag, prev_dc_count), @@ -385,32 +314,6 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		      CHECK_DC3CO, dc3co_prev_cnt), &quot;dc3co-vpb-simulation not enabled\n&quot;);  }
 
-static void require_dc_counter(int debugfs_fd, int dc_flag) -{
-	char *str;
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, &quot;i915_dmc_info&quot;,
-				buf, sizeof(buf));
-
-	switch (dc_flag) {
-	case CHECK_DC3CO:
-		igt_skip_on_f(!strstr(buf, &quot;DC3CO count&quot;),
-			      &quot;DC3CO counter is not available\n&quot;);
-		break;
-	case CHECK_DC5:
-		igt_skip_on_f(!strstr(buf, &quot;DC3 -&gt; DC5 count&quot;),
-			      &quot;DC5 counter is not available\n&quot;);
-		break;
-	case CHECK_DC6:
-		str = get_dc6_counter(buf);
-		igt_skip_on_f(!str, &quot;No DC6 counter available\n&quot;);
-		break;
-	default:
-		igt_assert_f(0, &quot;Unknown DC counter %d\n&quot;, dc_flag);
-	}
-}
-
 static void setup_dc3co(data_t *data)
 {
 	data-&gt;op_psr_mode = PSR_MODE_2;
@@ -531,15 +434,6 @@ static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
 	cleanup_dc_dpms(data);
 }
 
-static bool support_dc6(int debugfs_fd) -{
-	char buf[4096];
-
-	igt_debugfs_simple_read(debugfs_fd, &quot;i915_dmc_info&quot;,
-				buf, sizeof(buf));
-	return strstr(buf, &quot;DC5 -&gt; DC6 count&quot;);
-}
-
 static uint64_t read_runtime_suspended_time(int drm_fd)  {
 	struct pci_device *i915;
@@ -621,21 +515,6 @@ static int has_panels_without_dc_support(igt_display_t *display)
 	return external_panel;
 }
 
-static unsigned int read_pkgc_counter(int debugfs_root_fd) -{
-	char buf[4096];
-	char *str;
-	int len;
-
-	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
-	igt_skip_on_f(len &lt; 0, &quot;PKGC state file not found\n&quot;);
-	buf[len] = '\0';
-	str = strstr(buf, &quot;Package C10&quot;);
-	igt_skip_on_f(!str, &quot;PKGC10 is not supported.\n&quot;);
-
-	return get_dc_counter(str);
-}
-
 static void test_deep_pkgc_state(data_t *data)  {
 	unsigned int pre_val = 0, cur_val = 0;
--
2.43.0

</pre>
    </blockquote>
  </body>
</html>

--------------ozdd7QPpv3DJwYLuWPSrwGsj--
