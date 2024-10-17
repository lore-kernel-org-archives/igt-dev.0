Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E831D3C534
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 21:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F29210E21B;
	Thu, 17 Oct 2024 21:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UI6yT5qa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7EE10E21B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729199195; x=1760735195;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=+xaRneJ9Y6WWtHQueIYB+TiQ4NpcmM3I+lh3Z2UsrYU=;
 b=UI6yT5qatQrZHHj0casaEaxjdJ9Hq00jKjTh6GaoOX+PGVsC/afWXHki
 OeCo0vYHN+TqKCj6WYal8uWiR9Muxy8a1PiIygvZK2OG83BOAWZarTDFH
 5epIB+7bL85+aiqikX+mrspYYygGYrEopky6r/9f8SwYh4UhTMbdsCVR7
 uh9riwk+PKbRsBvlc2VvA19Dl988xRNXcqQYQ6XWNpblVPQgDPz3KJSxE
 P4E1X4tgJ8IaJfNpsNPXj7kqcLpOIfaJ3vTlxfT7Uq81XCTiZW6KTsI3F
 jt0EHe9xi8ML0HGUbSYUKxTHpvYg7CuHzQBfdYF43DfXkqvzQJHiZl2+p g==;
X-CSE-ConnectionGUID: 5mQDd3bBQXaHnHD5ohzyLQ==
X-CSE-MsgGUID: h886xjNlSryzykQKUrnL7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28848667"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208,217";a="28848667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 14:06:34 -0700
X-CSE-ConnectionGUID: QC8qBkNNRI+wxaOBubXG9g==
X-CSE-MsgGUID: OnuUAuQ4SiO5ltF9sjYOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208,217";a="78571238"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 14:06:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 14:06:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 14:06:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 14:06:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 14:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJCRSveCqCk1P/eO1eOb830RB8G5yeW3fadYbCKNSfCyCCgRtpSiHYzzA6rLjI1kw8Am25kjHfBAdeOA3WqFLxpTuFIN8PlB2Y7XF4HJrJ/9PpeAsQbifwPB+QXWA43QdbAwM11vHF3w/lppXw+NZ29YpdDzQdoOMAdQ7aO3k366EBJHXm9ypUg0ywM/B2UdQewiOF0fTljrfS1Rv4m5GRo/plypHno5FKsJZjDF4Q+6/EtZVupZlMXFL9H5Rb6fipaKza320t4kW0lFMBTPCXiVdOq0pRv3dfgd/yeaAfKp4gN0mJw1xe85usvCckgQKoEVMmJEnt2fR5F99cHMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQt9Gu5btcd9ZW5V+yXrmBS/LmNz0qxi09AIOK2LYyU=;
 b=luup+qAAXRGDWeojNt/SSpfZRBdyUl+HYeciziKvMQJSHsKTZf2BldC7zHCRS198zEy3gD9KEa1oh/GcnLsu9GRGR3lDmkSP+KHEYEs2jkZLuuKaujCYM2cZpHm4xZgp8lKa1iaN245VyKYu4xjz2C2fDffUPWpC5sy4PCjYIegeVEqLpucjz4NKX5EN67EjzICG0Nx8zSrXbC9YrIwOl4g64MWBo72bujs2K1AXPaG03wC7tw3SFugmB2MSPm9uYJPSGeKdjpNxRKmByt9HgL9zSX/JHumcml2q5z3AONv+M7qoEGvbNaHYfHFuhzrQvvzetroeAXh0E+mXLn3Hqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CH0PR11MB8214.namprd11.prod.outlook.com (2603:10b6:610:18e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 21:06:29 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%5]) with mapi id 15.20.8069.020; Thu, 17 Oct 2024
 21:06:29 +0000
Content-Type: multipart/alternative;
 boundary="------------eeF6TGxNHJ5CIpOXXyCpo0cC"
Message-ID: <e301f56b-4d7d-448f-98f2-b04fa3102609@intel.com>
Date: Fri, 18 Oct 2024 02:36:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Intel Xe2 cannot do hflip
 with tile4
To: <igt-dev@lists.freedesktop.org>
References: <20240912144645.862462-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20240912144645.862462-1-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::35) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CH0PR11MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 752c0c0f-0a77-4bca-4163-08dceeef91bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTg5cm1tV3h4d3BNczV3d0JxbVBacTIwZWdaRnJHMm1ZRld6MG9uNDNRU1ZL?=
 =?utf-8?B?WUJzcG9iUm5mMTlZY25RMjdlY0drZC9BaUljT09iL2NWMDk5NVZ6UlVvSnVY?=
 =?utf-8?B?SVVvWnZTVE02TG1RSUQrSzg1eER5NXU5UTZsOEZ2V2txdFlnakRySDNVQy95?=
 =?utf-8?B?MWpneEg3SGd6VjVEOW8xUXo2WWgxMHlBV2pLNWg1a2d0bTVvMmFuQlo5UWY1?=
 =?utf-8?B?ZEhmSlRyNGZtNVVPRUNZaU15RzVDYmpYTGZadkNDeDVzcXEwajZzZmZnd1kx?=
 =?utf-8?B?azJJMzVsblZWKzVIOVhoT014QkFwS2hlYU9LS2hDdzJISTZYcDlUVHFJMzhz?=
 =?utf-8?B?OFptMFpQWTduNDBpMnN4ZUVoVEVaWHRDREppaCs2T3g2ODlCRWNuRDIzNGk2?=
 =?utf-8?B?eVBVTERuVEdieGhCV0RoY1pQaG01V0hIcS9MT0oyczJzajNBUEJseDRrMmJC?=
 =?utf-8?B?dDNDRTZHN3RQU2NGdVUzNFlUNVR4RFlpZnRJcUk4ck4yeGpiYzFVd013MjVq?=
 =?utf-8?B?N0JQbXk1cjhxZnN4SmZ3UHdvWlk4RXllMzlodlU5b2ZVY3hMSWdKYlVGa3Fp?=
 =?utf-8?B?RzB3YnNHY09vRlVJMDk3OWpRakQwejl6MlNKdXhxUkh3VEhSZHpNRDY2SDZn?=
 =?utf-8?B?cU9hOE43TTE1aFRXNCtOQm50YUdFTm4wSmNtOUUrMEZxRlpHY0ZpRHkzL1hX?=
 =?utf-8?B?cWZyUTdWN0orM0hBMGdJeTlnOW5HQ2s5SHN1UjJxVmxIYjdVUjU4ZS9HaFlp?=
 =?utf-8?B?MjJOcXdmMFNTdXA3YWJjbVEyejExT1ZTUkFzemkrWlRxQjJ5RWl0MG1McDFp?=
 =?utf-8?B?NklDOTVhRDhMam5hcXJ2SkgzaTFMY0lyUmRxeHF0OHdDcnJwYzl0eG5EUnRU?=
 =?utf-8?B?b1ZDazk0eFJaV21LWEEvU1hwZkxOWTEvd0J4OEU3VWpwNEs0V01qQ2Flclpl?=
 =?utf-8?B?OVZVbGRRY2lQMk5XZnkxV2xCRCtQanBhb0pJcXp1Nm1aU1JLTnBZRmZMRXla?=
 =?utf-8?B?VVdVemNuNk9WSHRRMEk0YVcxOTl4SEU0RlB2OFdReWVHV0xZTWtFSjN0anNu?=
 =?utf-8?B?ZXVXOS9wOTc2djZWYXNCUkEvMGxvRmwrUnA2cmdweUZZaE5ERjZoQ3VYSTVQ?=
 =?utf-8?B?ekdsZE9lQ2lmdWZISFh3RXZGbGFaK0lWTTlXai91bmZqSDRXREVidjU3QTYr?=
 =?utf-8?B?WkhCYnJvQ1hoalFTTkkyWlZzOWpuNU9qUUZKTVB4dTBJZ2d6U2pyY1JraEZi?=
 =?utf-8?B?NTM0ZDd1VjdIWDVHRjRKZmdTWHpteit4cEFDUlVmUzFTb3ZxOUpxU0ZKV1Ru?=
 =?utf-8?B?Z21pMG1PbWlXOEFvY0lDMG9Celp3SFYyb1hLQVl0K2RSYkxhQmNQeHJROVpB?=
 =?utf-8?B?WkpqM3Y3YWFqV0YwZFVqR2VtTmlVZ1NERFVUK3pVWjZLZm5jTCswcWI1VUxw?=
 =?utf-8?B?TDgxWk13VmQ3d3o0YmZURGp0TU9hZVJnL3pmZi9ZMStaclhZMkhKdXV4ZzhN?=
 =?utf-8?B?eW5nZEpSbHhiYyt0di8wVHBkV3dDTjMwbEVLZFgyTW1MMWNaNThhN0twc0xh?=
 =?utf-8?B?S1JteG5HTll5NHcveGsrdnRBS3dXQnd4YldiL1hBc3lraDlZUFkzQXNqM2lm?=
 =?utf-8?B?NHMzREVrRWhqNmdaWmpGanRFRXVzZ1Q0RDh0clRTTm5JeGV3QVJhOWpreTly?=
 =?utf-8?B?TGtia2sydDFhU2FuYWtic1QxM0s4UlJpZjI5UW1yRmVRQVhENDdwUFdrMmE3?=
 =?utf-8?Q?Wr0XOpBKbz6pw2d7GORDf3Z/QuRI3lIQRZsF7Vu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmRrV3lHaVAyY3VwbFh1NXBUbXU5cnJjNUFqMWtxZWh4UzFsS3o4L3lxcCs3?=
 =?utf-8?B?MHpWbEkyUUlyY2swQlFSaFBacXB0Zkx4Ky9JSDkzdlNFelNKOVNtVmdYWGNq?=
 =?utf-8?B?eEVPdWpkQk04b28yOXBVVkJMbDRJU3I3YlpJeVRIMWQxdkJudzVsWXQ5K3ZC?=
 =?utf-8?B?czZydGVEL3JQOWwzM0h4TE1ieUFQaUkzaXBqNVRJdE5LUzh2VTNRM25uL1Jh?=
 =?utf-8?B?TTBnbnF1em80ZStXZjQ4b1oyMGVFckcyN0loVDJ3QkE4d0s1SzV2bndmL1N0?=
 =?utf-8?B?Zk1pQjdjN2NtMFV0czJibkt1Qmo4R0dCbGE4MXI3ZkVqeE1HOXFVWGhRM0Vm?=
 =?utf-8?B?clF6T2owZzVQVGFuaGJIcEZRV09VY3RYbVRzSVl5djhDUUowblVvb2NBanlh?=
 =?utf-8?B?NS9QUWRjU3AwbGtCZHBYK2hKZzE3c3VRVFREdEt6dXBpVk9jMDVDQ3I1VmNG?=
 =?utf-8?B?QWpvdUVhazk2enJ4YjJXMll5S0IwdmVyZGxrOGhJVVVUaXlHNW9YRE53cktD?=
 =?utf-8?B?M1hkV3RKWlpGNFJUMVJNTjFWNy9nSFhwK0VpcmlPL3gzdWJHT2VHOTMrYUJt?=
 =?utf-8?B?MmpOVXhaaDNGWUN6TVFoaTJrSGFvYm1yVk5PeDJxRGZNcjhzMHBGYUcrckZY?=
 =?utf-8?B?aVRXTXArYS83VFZOMTBrQVFlMHJmektMZTBDdFBBdE1RSUdRbEFiMzZjM0dX?=
 =?utf-8?B?VDlEdmFOdGFmRkhYR3A3ODZEa09PN0ptdC9vZTU4dnkxa0xBQk5FRndkNnpR?=
 =?utf-8?B?TXhSVnNScndLYUFkbExwSktpdjhPb3EyR29kMXFDbTJac0hjTVduZXhmNXFw?=
 =?utf-8?B?aUFsZFVra05La2VrVG9sU2YyMGZUK1dMdVVNMTQwUnZ1TUpjbEZKZS9JamJl?=
 =?utf-8?B?Zzc2Z2ZjQVlPT2JpTkRjRWZYR0ExUGZrb3NUTENETm9BQTIya0M1NVJhOFYx?=
 =?utf-8?B?cnJGdVp0M3cySmQ5TWsvbERSSWFBR1drMWdzbVF0R2Z4aHRYbE4zRVBwMXJa?=
 =?utf-8?B?Wk5MR1hvbjd4UUFvVWlBekt2OWhkTDhEbnRjVkcyVTkrRlhwNGRjUm9STTg3?=
 =?utf-8?B?a1NuVlJzc3lzd21lc0FRTFVsc05sU2VvN1E2ZEJjVHdtTTFCckRGL3BtV1BB?=
 =?utf-8?B?VGJCdi94YnJHQ25kZ2VkbVZoWlRtbERteksvdG9Rb3RFSUNDNjJaWWROa0Mv?=
 =?utf-8?B?cEMzWXNtL202ajJPdlMrKzA1ZUdwL3NjdUIwQ0orckR6NVRKVWUreEFoSmNV?=
 =?utf-8?B?UFNBVWFQSmNydUxzQ3E4SVNJN1RKNmtrNFRwQ203aXpuM2pKWS9JVjRpSkFI?=
 =?utf-8?B?T1ZLeUF3UjJzejFjcFhUWlZ2S3lFTlVLYWVyVXFLdTE3MUUvUStFQzFuQm1k?=
 =?utf-8?B?OW93VjJrd3JYTW9kQmlBbURRRDBwdVBYdU02UDRmRHhUTkF1L29NS3hVZFk3?=
 =?utf-8?B?cHpzcEZzUGhHdW0wL1Byckh1dnVhVkovbUgwNFdNUGE4WEwxTU1FNW5KZUtE?=
 =?utf-8?B?Unk1MlozU3dIR2U0a3kySC9OQjBWRkZtbXdEK1hkZFFPcTUwUklaVmFqZHdp?=
 =?utf-8?B?ay9DMFpKWExOV0pCQlQ5KzQzMU5ZUFRWMDhGbVNsSFlKTzlMT0UrTWR5dmVn?=
 =?utf-8?B?Mk5vUjgrWHZXV2pyMVRlT0t0NnBuWFA1d0p6TWtlODlPRlAzR1JMZC9jWDdZ?=
 =?utf-8?B?N25LUHU1dnZNc1NNM2FIQnUxU1p0T25BYjRaT0dxUVB6VnUxQlBvalJ4V3ZS?=
 =?utf-8?B?eGxPUVFTSGdMdHFqaDdaNnlkcno2Y3ZGUWFORlNadi8yRTdwclVpUzZNWEdY?=
 =?utf-8?B?ZmtnUnl6bi92eGFUaXlNSHplUGFBR0hMcHBCTFVuYXlRL0JwZHAxYnoxWG9h?=
 =?utf-8?B?NVplcDdScDBzbndkbS94MkN5TTZlY0JjbGtUMmt2VzQ3ZlV6VkYweEVMdFF0?=
 =?utf-8?B?L3NVeHZPUnJyTFprUFptQTlMQThTZE0rM2Vhc3U1VTFodkc0MzZseERXTTF1?=
 =?utf-8?B?a0V5b0dBSnpGeTJGdTVwZmMyTFJ3NGVwMHVlVWs4V0N3alRWc1BpOW1zYnlo?=
 =?utf-8?B?V3ZYWU1EbTUzL2FaVHN2bVBqZm9qZUcrbms2d2QwN0xWbERncVMvUlVTQlZw?=
 =?utf-8?B?MVN5Q0E2aXFOM0NFWjArWFErV1ppWTVheHRCVTVrWXQ2WUIzbTlDWnQzUUZD?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 752c0c0f-0a77-4bca-4163-08dceeef91bb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 21:06:29.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9c10qVQ0tE+xZymJ+RLj1vDm1duzmbcKLxAkkB1wKyzh+JAOxEXtfwzn7W9pGZ2L9z002ovN7Xqz1hAb6RGG70IfFfi1duC/Wt1p5x1sa2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8214
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

--------------eeF6TGxNHJ5CIpOXXyCpo0cC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi JP,

On 9/12/2024 8:16 PM, Juha-Pekka Heikkila wrote:
> On Intel Xe2 hw Tile4 no longer can be used with horizontal flip on display.
> bspec 69853
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   tests/kms_rotation_crc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 8d8c53b5f..3e9190590 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -639,6 +639,12 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>   			    !IS_CHERRYVIEW(data->devid) ||
>   			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
>   
> +		/* Intel Xe2 onwards cannot do reflect tile4 */
> +		igt_require(!is_intel_device(data->gfx_fd) ||
> +			    intel_gen(data->devid) < 20 ||
> +			    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
> +			    data->rotation&IGT_REFLECT_X));
> +
As per BSpec (69853) up to XE2, horizontal flip is not supported with 
linear surface formats. If it is valid to add that check, please do so.
>   		prepare_crtc(data, output, pipe, plane, true);
>   
>   		for (i = 0; i < num_rectangle_types; i++) {
--------------eeF6TGxNHJ5CIpOXXyCpo0cC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP,<br>
    </p>
    <div class="moz-cite-prefix">On 9/12/2024 8:16 PM, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240912144645.862462-1-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">On Intel Xe2 hw Tile4 no longer can be used with horizontal flip on display.
bspec 69853

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 tests/kms_rotation_crc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8d8c53b5f..3e9190590 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -639,6 +639,12 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			    !IS_CHERRYVIEW(data-&gt;devid) ||
 			    data-&gt;rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
 
+		/* Intel Xe2 onwards cannot do reflect tile4 */
+		igt_require(!is_intel_device(data-&gt;gfx_fd) ||
+			    intel_gen(data-&gt;devid) &lt; 20 ||
+			    !(data-&gt;override_modifier == I915_FORMAT_MOD_4_TILED &amp;&amp;
+			    data-&gt;rotation&amp;IGT_REFLECT_X));
+</pre>
    </blockquote>
    <span style="color: rgb(17, 17, 17); font-family: -apple-system, Roboto, SegoeUI, &quot;Segoe UI&quot;, &quot;Helvetica Neue&quot;, Helvetica, &quot;Microsoft YaHei&quot;, &quot;Meiryo UI&quot;, Meiryo, &quot;Arial Unicode MS&quot;, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">As
      per BSpec (69853) up to XE2, horizontal flip is not supported with
      linear surface formats. If it is valid to add that check, please
      do so.</span><span style="color: rgb(35, 35, 35); font-family: Arial, sans-serif; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">&nbsp;
    </span>
    <blockquote type="cite" cite="mid:20240912144645.862462-1-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
 		prepare_crtc(data, output, pipe, plane, true);
 
 		for (i = 0; i &lt; num_rectangle_types; i++) {
</pre>
    </blockquote>
  </body>
</html>

--------------eeF6TGxNHJ5CIpOXXyCpo0cC--
