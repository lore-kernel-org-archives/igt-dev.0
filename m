Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA83C36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 06:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E739210E2B6;
	Mon,  7 Apr 2025 06:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTLBEYBX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B010E2B6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744008033; x=1775544033;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yatqaJ32Wlm3ahNp0+Am2Kjdywp1/AHQAwZbBFnsNn4=;
 b=jTLBEYBXYhhNjvZ5IOgvJy1uwYMt98w2rKfANgfIk2bqLo9dd8qvaQzE
 HZWvKBOiKvZsRItoDwlvdy32fMLm6y31a4kBeV347a+4U4UggBuD/ys7f
 FkOMBsY9CBYRd0bbKLCKdvX9Rm/uk0La7RwJd+4i+dAd+DL0yQYrcNQpY
 49+LsVI7rXBf23kAUiSWeS6zuEUx4ob2LY+y4ZIwVfepYFSyUCOTQzXKO
 1cEYyArA5/uauAeVlz2bIiVN+3DX1gw2uWOzw2Y0AdBKiO37k6Bhw4c9X
 sWtl1hj+1wfxff9E5qJTyCwTv0UxAVt93eUyucVnSC9DTwSdFyeIiXNxR g==;
X-CSE-ConnectionGUID: IBvU8BU6RPCeCSpSyqSBUQ==
X-CSE-MsgGUID: Wsn4XUidR92yXeHBoi38YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56355729"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56355729"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:40:33 -0700
X-CSE-ConnectionGUID: Ag/PKZQHRJOtPfZfiGSvuQ==
X-CSE-MsgGUID: Zkgge9eQSduEyJRGnS6YQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128361089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 23:40:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 6 Apr 2025 23:40:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 6 Apr 2025 23:40:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 23:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePH01OomW74vzTnnuBdfB+wK1+VHhGUEVJ5OZ9LMJi+cn66ZvcBZFVZIlI7rsF4gWClUdugqyg89VpgG/QLfhqytt5oczCCsHkqCh5MvDkt59FbAfebjQZfjeIcThRFLVU40wo936MMwKuDVIPQ8L3gsSrWCdEaqZH+9bogDt5g3EfBMI3jJ9MX+ClEXnJ7jg5OF/t66iiKcD3bYe/OQSj6nSMhRhegelLuKhI95t612pJSR+yMMny+Uoma6dyXYk+9o2smX/gtFWvpwo0XlzEYcx0eOLapfWkdE8Pp5goX6BiyW4Gp0dsJ0Dps87i7Ye0GD9EcNihLSC6EzbBOmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMtppV/iHo8BftVDdmx8hiIGjjIrxyOzsVL+CWrvGlg=;
 b=HpJmnxVEEicH4wJOLftgRvm2f+a9NLgq4Bgwej9GkfdPtX/QLN2qaJZCra3Ycr5hCk+1HtH/U1DzS1JL3ZKB7+lS2tIws9ER1h431iS2pPp53cBzeUcRrYKyLMSpfojwHi/ZFT9DB8rozbkSt/Bk8WT5J9cneTB9cVcTgzLIKqgSJDpNbC3vAFhmAp/sfOcB4UC9GpKjso7M7KkCf+ePdDJ+A/2y2dcLrKAjV+ezQUilxaHDL30JQLc68xWu08mGLX/bgnCbG0jw08FkWO/Mles1g19pyKdbFINPp2KjY06zL2S/QdmAO3NWKIwvi87kenunjx9odMeWGVDl81658Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 06:40:15 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 06:40:14 +0000
Message-ID: <f93e9aa1-4aa5-48b4-9e3b-68fb6febc6d1@intel.com>
Date: Mon, 7 Apr 2025 12:10:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_universal_plane: Fix fb count mismatch
To: Nemesa Garg <nemesa.garg@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250405101807.980810-1-nemesa.garg@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250405101807.980810-1-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff0b3e1-5ffa-4678-83a4-08dd759f0da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ymo4eVhacmQ3aXBaTkxXdjdySmZkbWp4alpsbWZMUXVmd0NaZy9yOUJuekVY?=
 =?utf-8?B?VWZqQWlRUzdIckFmWk1VRWk3ZEI1K1MxYkRlMWo5OGRPQUxnbTljL0pZZzUx?=
 =?utf-8?B?UTlsdXJselNFeVF2clc2WFkvZi85MjdtejFqaEJremtXckFwbVdqMmduNCt1?=
 =?utf-8?B?YXd4RWdlRDdmeEJkWkZTZFMxeGl3MzZJVGZHT0JMeXg3REZqTmppTkdJeCtt?=
 =?utf-8?B?NFJvaVErYVZpeEtsNkdvT01GTW5KU0JVNmpEZVBwYXpOZUM2U0VXZlZ0TDNj?=
 =?utf-8?B?UVJkRjJYejZ2WWVjdmY2aTY3QjV5MkFkQUN6Q2tKWjBGb0tPT1lVM3kwNnk3?=
 =?utf-8?B?eVVlOTVpK0toNnFrQjZPMVNlQjhjNzIxdFNXb3U2UmFtbFhkVnFLNVRzZ1VZ?=
 =?utf-8?B?aGlGUnZjMkdSM2dRNjJJV2h6UWIvQW1FWnhDNUUwWEs4TldicitVZVBkVGhj?=
 =?utf-8?B?dU8vdnVFbmt0czNHZEh4RUhrN1ZuYzF0bFQvMkwxZU12a0M0ZzlMcWxmS2Mz?=
 =?utf-8?B?dy8zMEhLcDBuYittMksvSlQ4V1plMytDQVJOZFh6d3dVUVlzV3AzTkxpYWFr?=
 =?utf-8?B?aXlBTURlYnFDcVF5ZWtuY2dFTk9xQ2Zqbm1DaHppdnhIREZ4YTZqS0dpRWpE?=
 =?utf-8?B?UGl2eWhaVHdGaG1MNE5YZTEzZjgxdFNFdjdBSUNISm1XRWRzQXNJaVZRYTVi?=
 =?utf-8?B?Si9IR1QxV3hEZGNCdWo4ZG5PQ25kZWFYRHdPUTFLZUZvekIrT3lQSnJWYU9J?=
 =?utf-8?B?blQrS3ZZVFJTc2xpMS9GQmV3a3hmaG9lWkYrZmZvcHJwYnMrRnJIajljRWFI?=
 =?utf-8?B?ZGM2bndTeDRhSCs0TjVZR09zOFd0SThXSHVhZ3hxR1pyRmxHTUorVktFYVR5?=
 =?utf-8?B?Zzg5d2UzclRSNkdBajZKdGloMUcwUTZFQ255RGw2dFB3SnFIYkU5eVp2V25T?=
 =?utf-8?B?VHRLUURDOE9uUDFrbmM1QlZWSWE2NUI4Vk8zM3pva0VzOFVHNHZWekpFTGJK?=
 =?utf-8?B?cWVscGlLUXhOT2lCV1owMWd0endtbTdPWGhCOXRLREM4QmpXMGRGaloyUkJZ?=
 =?utf-8?B?MG5qWDd3WW9VZmZoaC9OYkxSbFBoNXVNQlRSYVFNV3JFcUVvVlpSSVlFMHpw?=
 =?utf-8?B?SnYvOVM3dzI2VzJYSzZpUmJZVTlLZWE2cm5ZRnZmcVB4S0xiSXJ6NXhWYnRz?=
 =?utf-8?B?YnNqdVVROTlJcVVoelB1RXg0NWZtRU8wMFduSENHaDB2WkF5ajhyaHZ3bFBZ?=
 =?utf-8?B?Rk9EbzNIN2s3NkFlby9GZlhOSDg0ci9MbWJaalE4MXZTejl2bWV1SVZBLzNZ?=
 =?utf-8?B?a0VteEpNdlAyZ0ltZHh5aVJPenpycmpKR0NwZlgrZEdDMHh1eW5oNzdLa0xh?=
 =?utf-8?B?RlFoTGtRbFE5TXhLcDZscGJkVW82SzB0R0FJRzkrNXBsZEJGd3ZFZXV1ejJY?=
 =?utf-8?B?eVhuTVRYeHE4UlNGU2w4V2x5M3V1YVRwcDlIUVR0NDhpZ0E2TnpWeHBCbU1r?=
 =?utf-8?B?YmMyZW1mRjFJeDhqakJQQXNLYVlwYUZ1bE1rbHZHNkw4UzRoY3FJOUt0ZnVL?=
 =?utf-8?B?WElrK2JueFIvS0hvdEhwdW96SnZBU3FZSkU0akg1aVF1Z3JaZmVBUjU1OU1x?=
 =?utf-8?B?V1BkUmgwaUp3REErMGhPZUM1SUFzdnUveE5HVTBiUjJKV3NYZkFNQkp5V2to?=
 =?utf-8?B?YXpTNmRyQlZML0FCZFY5U3kxMzFIczF3NllaTnQwRkRZY2dOWFFIaFgzUXRv?=
 =?utf-8?B?Y2ZTTGRDbEJJS3ErNVkzeDhhU1hxM3VxL3loaVRDMWFOREJhYUNtNnFpWW5P?=
 =?utf-8?B?ZnpjbjB0WHo4b2hqRkdmRFhlclE5QmRIMWtOZFM0R09NR0xPMWtJMzR5ejZL?=
 =?utf-8?B?QitmZHEwOHBpcmdvdTRKajYyUC9SSlpZWFhGbWZrdmRBd0lLQklWV2ZaVVBL?=
 =?utf-8?Q?R0TXkwHDVRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDQ5NWFRdnk5ZDZoOXY5SUhEL0c2a1d1dGNJaVlLcjI0V0VTVmtPVWE5dXA0?=
 =?utf-8?B?RStLQ1RFYmVzSDdOcjNhSDdGR1FPT0FnZUVDNGhhUXhmYmdacnR1WUcwNFlm?=
 =?utf-8?B?bU9xTnRmS080d3N6Z3hodHB4QktIdk42dzd3cmVCZWdRdmUrNTczYURlK2th?=
 =?utf-8?B?cFhHbTNvWldRUkxMRnl2Z2R3L0d2R2VRd2RnakIyUFBYRzBVUkZvdEQ2S2h1?=
 =?utf-8?B?NmJMZ2lXR1lJWjdKTkU2VVpvbklYV29QU0tYSHNhUW5mamRYZ3EvMWJ5ME51?=
 =?utf-8?B?MWRDejk3RXptbzMvdGVFV3NpK1BleXJDSUtmOThrTHlxb3lDRzFYMlBhVDRQ?=
 =?utf-8?B?NWJMNWtFRG9WbTJUb211SnJXUFhxM1g1V09jLzZSSzNKZTArY3U0ZGNMZFZn?=
 =?utf-8?B?NTUxMVZCeHJ4MHNqeU9tTkh5dm9RcHhvL01VY0tzbTRvVWowYUlzQm50aUJK?=
 =?utf-8?B?ZDdoODNJRGtFOEhaeTc3d3czVW1yZjhYNTh2K2hma1BtUDJKYTJUekRWZE9z?=
 =?utf-8?B?SkF1dGM1Wkg0VmM5Y0tWdUE3aUR2dXIxSDVYRkt6WUtHdmJ5OUJqYkRwcU5s?=
 =?utf-8?B?NXVEQ0drWklzakxDWEswc3QrRkpkdHpyWDdYVmdNQmNFdWs0WE9TdGI2ZE5D?=
 =?utf-8?B?Rzl2TXNVdlA3QktHWFVJUmJrMzJSdlNHQmxxS0VDaGdMRTdRY0UvdjNDT0F2?=
 =?utf-8?B?S2d1TzAwcVBlVWw1QVpjR2w3NHJiWUlsWnFQNVRTT1lna0dzYjM0T3lJMkN4?=
 =?utf-8?B?aWF1cGI5SDlGR1dtNW9OcjZvSjY4V2xlWHkzSXZrQjIxQzlhTEErMzVONXFK?=
 =?utf-8?B?TTBXdXI5TW5oVXF3cnVhQ0prdTNEUmZXQkk0K1ZzenFOd2FqcjdVUEpELzI2?=
 =?utf-8?B?ZmpvTFhBWWhxRVJLYzJLZnlzNkZrU3JYZTE5SGdrMDE4S1lyeS9HdUZQdXJX?=
 =?utf-8?B?NmYxWEhBTEpIV3Bzb2M3NUY2N3RRWGJycW16MzQyOGZrZDk0cDliNVRSV3lj?=
 =?utf-8?B?dWxKVXJKN3NiN1NEbExJMW1DS1VZKzF3cDBVRWlZK2V4UUhVSDZYVXE5bGpi?=
 =?utf-8?B?NEVReGhmRVpDUkJOVmR2VU1DWEpDTEE5cjhucnVySE5Lb0wrdk96QU9iMzAz?=
 =?utf-8?B?N3hsVG8xSDBLRUV3ejIvdU1sTnNVaTJFRXA5UU0yY3NCbVlxVG1QemxITkZY?=
 =?utf-8?B?QWlZa2NuMXlBTHpGaG9jUE93cytpcDNvQWRocVVGeHQ2OGkxVGNQcGt5MDFr?=
 =?utf-8?B?clUrak80T2dTUGs4eTZJNUF2SzJIOHdiVzFGdllUYkgvbXZWTXF1Tmp4UXdC?=
 =?utf-8?B?bFpOMlhld2JnQXZ4QkYvazZVZXNhcVFwTHdvMmR3OHpzK0JJMzZWMnptWU83?=
 =?utf-8?B?SGZnM21iMjQ4NGxaei9Sanc4bDg3Z3JUbHB0V3FDaXI4amRpY2VBblpQelFR?=
 =?utf-8?B?SFQ4WjBEeGNMUnVoanI5KzVEeDFqVXZSMyswOUE1cTNXdHBYeEpxR0tWck9Y?=
 =?utf-8?B?SzR2UDBDYXh0QURjbE9NdkVqLytFc0RBd1pRTFhsNUN5RXFidjR4RHk3M2RR?=
 =?utf-8?B?UDZLN3JnUGo5NlQ5L1QwQ0taeXpUWnNmR09ZVnZNQ3FsRmlpMkdHZDQ2dXQ1?=
 =?utf-8?B?cHBxMktlNThCSTJlMmpXRlBXTStkM0RDcC8yOFJGREhLUW9FdW9iYXU2aVBE?=
 =?utf-8?B?U3VUWGYvRk1YdnNzNVFTbm1ieGx2M2wzNDRIQUtDREFIT1g4NHdaZWNyRCtS?=
 =?utf-8?B?SjFxQkpiZmpNYkk0YytCeVk2QU9XZ3dZNXhMcVpYRHVjaUxMQTFJYzFoOEJM?=
 =?utf-8?B?bE1iOWJVNkM0QWphNjNNQUJxT2owb0N2NEdPZThPTnpzN21qYm1Ta2I2VUZS?=
 =?utf-8?B?Z0J4aHBVQ21pMDNXNG5RREFKRFlnMGkxa1JDV0tNRkFubXZmYlhJUnZDQmZu?=
 =?utf-8?B?ZGhQamFtR3JEb2RwTDJrM0tJay9CRVdkWjRmTU4xRHB6SE9Uc3BQVDl6NFg3?=
 =?utf-8?B?YjN1Yk4zc3BZMklucFdrL1A2UU5zYWpJSkQ3TVhmclBkaFdUM1FvdzhIRG9r?=
 =?utf-8?B?MEROUXFPK2dDMGEzbXhXZ1hjSEF6cHBLdGlGRVNwcUlmdWc0T2l0bWtIRFNM?=
 =?utf-8?B?OUdUZ1NORFlrZkpUL1JuWXMza1VqSkJ1S3dIWkdhNzhsQmlaMVZFdzNQTGg0?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff0b3e1-5ffa-4678-83a4-08dd759f0da3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:40:14.8873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa5JgwVeSWK5dtg9Bc+TrXFeDtIyJRoWwdwzSSi64oUyNq6iWwqHSLsayCdHvcUSfGQ62i3J+gxYO59TB457xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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

Hi Nemesa,

If its fixing an existing bug, please add "Closes" tag with the
gitlab#

On 05-04-2025 03:48 pm, Nemesa Garg wrote:
> There is a mismatch in the count of fb before
> start and end of the test. This is because cursor
> fbs still not removed and we are counting the fbs.
> Add a 2 vblank wait before counting the fbs so that
> all cursors fbs gets removed.
> Since unpinning of cursor fb occurs during vblank in xe,
> we need to wait atleast 1 vblank for driver to remove
> cursor fb. We need 1 additional vblank because vblank
> event is scheduled before unpinning.
>
> v2: Use is_xe_device[Chaitanya]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   tests/kms_universal_plane.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 8e0b4dda0..2d9716575 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,6 +703,16 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   			    COMMIT_ATOMIC : COMMIT_LEGACY);
>   	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>   
> +	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> +	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
> +	 * 1 additional vblank because vblank event is scheduled before
> +	 * unpinning. Therefore add 2 vblank wait to ensure that all
> +	 * cursor-related framebuffers can be removed before counting the
> +	 * framebuffer.
> +	 */
> +	if (is_xe_device(data->drm_fd))
> +		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 2);
> +
>   	/* We should be back to the same framebuffer count as when we started */
>   	count2 = intel_gem_fb_count(data);
>   

