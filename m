Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13EDD1F9DE
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 12:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BC810E8E5;
	Thu,  4 Dec 2025 12:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oF9K+bTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767D710E8E5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764853023; x=1796389023;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HwKUNPvM0Mggc7wdgrau9p54K2ZPb+TzV02LayZn/Rs=;
 b=oF9K+bTzHyLgRvO5+OSI1O4PGiUttW861r+isoyVbLi5CC7kZOENqMho
 NzoWsj+E1OyZZcZW17VPi8RGCCwB1UVY/PyMJkckFRcFSl6HgOqK/XVme
 JPiD7QXwQcDhmvJuNC+NbpA5d1PpgkMMRHHXOAObiBDjE3EM0jI6bZZmz
 uFJgOK7aKbYcVY3bSK5F82llzQvWr1rfHe3oVn6W5VZ4gVNfuuJCQqcD/
 /q3NYd0BtwUj83DRhnVM7kivbjmOdFE78vCIKm16F9Rv3v7CSQ+3RtMgc
 PL/bg1joxLWyog9VuiGLa1sz2ef61hHKDSxxZv8HzGDcGzeNdWFenGQJw w==;
X-CSE-ConnectionGUID: +iVYwpnaTIymS0sdTAIdbw==
X-CSE-MsgGUID: ujAEpaJTTJ6Cw1uuWFAofw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70721006"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70721006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:57:03 -0800
X-CSE-ConnectionGUID: BUF16735QS+Z1H+w9hQp7Q==
X-CSE-MsgGUID: AFXQryLRQY6vfPyBBfsO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195005761"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:57:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 04:57:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 04:57:02 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 04:57:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikvz4vAQrkTRoAnH30rJ4rEZA9q+T0EoiofvAwB/b8LvzqreY36483U16FcyBMlK3oaOfmEwJTRB6KdTU6Cl13jF7A9BjCm/uKcLG1qt9Je3zfdVu9Is73UjoJMrwyj2lTPzN4G5zJyfz8UHct4/Yw4sOuUabL9AfD/FQXYXvBsDVayBGM4VxiewKzOwapZx9bmNE9s4gxxnPBijZRk237q81R2XdI3iX4TnI2zR5q49F2MAeoXDEfwYrTgew3l5oPwKTZOWL9YPDEX8hNWbSlD2/ua7DNjhF+YjftotGMWcoRyIAkPSODMa1qEONBrIEijj2qdJY1XttV9/PUMMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSQrSzdC0URdn1Do6ENvXaJhEQYdB2gNdehZfZ+KNAY=;
 b=oSeTiApmba9UFFZ13eQKVSjXwiX3Qui7asjvB5Yk5AloMOSfzSOpkqN7viDt14mva+r351nC7UcEXyuFEDvs2GgwL+qEmBSoP8CQ1ar7qs2fACP9sxbxUbmhBJb3xwfvzq682m4r4z0B3N4J5CbOWuu9OoeLUbBjKWbyHzZdcZC1yhRJCpdLKQs0WD2VzjEVtNlnf+fSC4rd9iPI7WR6Fc5Na2eWiRql85dMflNhzvXvDREVQcgHI1DvKE+5dNY/V7iU2EsozYY7GYSoGoT0EmYxVWv8B3OGYwo4MZPzZFNUflqvc2aPH4CF3bW3A+UM1s7on8XUmlCGsZUjtCqnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by PH3PPF740777B0C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d2f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 12:56:55 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::e17c:d0f4:db8b:d7e6%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 12:56:54 +0000
Message-ID: <4526e3a0-fa44-4200-8f87-eb1e84217c63@intel.com>
Date: Thu, 4 Dec 2025 13:56:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/7] scripts/cocci: Add iterators.cocci
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20251120191415.4236-1-ville.syrjala@linux.intel.com>
 <20251120191415.4236-8-ville.syrjala@linux.intel.com>
 <aSTS9ENX7KARW9lb@intel.com> <aSTezLxIt39WVdQK@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aSTezLxIt39WVdQK@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0034.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::47) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f5a957-cdd4-43f6-1e57-08de333499dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjBpMnZnWkdYVmIyelZKdGlsOFY3TTg1KzN2QW5iejBvL0FzdnltbHY0aFN5?=
 =?utf-8?B?dTlIem1ncGc5cWZheWQyWEEzM1VwbHhxSDNUOE0yUFNmSEhhd0g0d1FQVVdt?=
 =?utf-8?B?YXJ5Y2xCYU02TFFOMkRoZzlEbVZPdVFKZ1hvWE43MDQwRERVQnFub2FaWDls?=
 =?utf-8?B?a2VHRUQraDhaU0h5eGlsOFRXUFJIVXc5UUJCMkZxTlMyNEhFVDVvT1Voc1dh?=
 =?utf-8?B?ZWFyc3N3WHYvTE5JT3NBTzlnQzJWa2ZPdC85Yk44WmkxQk5KOWQwMDEwYWh4?=
 =?utf-8?B?c2VYWE1VMXRYejVvNTByUUV3S290WjA2RHN0bUdGWjFFNWJ6VUxRMm4vRmN0?=
 =?utf-8?B?V3gyakhHS1lZNHh3ZXRZTktVRGJhc1g1YWNiWWFGdy9qR3p1ZWRmNkZ1bUcy?=
 =?utf-8?B?S3A2VXlWNHZyRmh6aWRmQ29SQ2lvL0FkekQzOFB6RlBFUlVhRExJaERwdXli?=
 =?utf-8?B?UTZJU0RITmpHVWxyZm5XdWZGaEhSa282TmhXYk9Sb3JBK2hTV3FzTlRCN01H?=
 =?utf-8?B?UHdIUUZ1Ui84UmRodC9zWnZKamRPVE5MTEpOVTJQcXprSFY3dGZZWGtNRU9x?=
 =?utf-8?B?S1NDYVR3S21rVmc0dmF6WGZwcEJnN3g4SjhRWlBVYTdDbG04NWdlT2hjd0NO?=
 =?utf-8?B?ZkFXdTRiT21YR3gvYTlRYTlaRjI0L1Q3QnRHblk3cGcwaGg2UE9Ncy8rYito?=
 =?utf-8?B?eVVNeGhtVVRLbitxK1pnWG9icVVCT0FXbkxRUVMzdjRIcHhKOEh5VjVBMHpQ?=
 =?utf-8?B?cm83RE54Rm03Ni9LdXJIajJWMTY0cGRDOFN1TVo5Z0lRYUtpVmQ0SUNuaE5w?=
 =?utf-8?B?dG5BNHYyTndkZmtVTVBXSXBveU81Y0gxaTdVM0Y1Wnd3OGxIT21CcWNzRW9E?=
 =?utf-8?B?U3lPTGZrK0plakxNbGtjdmZhL0JsOU1RTGdXbmZGa0lrNTBTVmdrQnVJVElI?=
 =?utf-8?B?alBPb3JuekR0U3NxYmZENVpHQ3Z5WVlaQ0g1cTBWam5SMXJ0YzNGdWEwYURW?=
 =?utf-8?B?c1p3Z01USW5LbC9sUDhxbFJlQkFTZCtqNTkyOFFjMmxjL0M4NGJZZGg4WXA2?=
 =?utf-8?B?TWVTWFRjNWw4QSswUmE2L1ZsZzQ3WnZrVzhiYjhjeXlpRGtzWXR0RndkSzNH?=
 =?utf-8?B?RjdqcHFvUEFybWc0QlhqSVlQVThjd3ZGWk1pSExuY3MrU0l0eStnai9aRklK?=
 =?utf-8?B?S3h3Z0gwT3UvSytJeUpxQlF3Rk1lbHBUL2E1OTJZODFjZnU2ZXpRSUhWUi9F?=
 =?utf-8?B?WDZHUUh2eGdvd2IyK0VNSkNaWXhUSGFSZmFaeUVWUjZwRFYrSFNERmFoN3B5?=
 =?utf-8?B?VHZlZWdVS0xGN2orcDlMQk90TTRhTVVQM3R4YXg5NzZIUUc2ZlVXNHlzQm5n?=
 =?utf-8?B?bGpYM2ZTazFJbWVLbVg2bVQxS3FZWENqOXFxUDgzZ3dXWHhrNlVJS3F4YlU0?=
 =?utf-8?B?VXU0elFzc0o0R08wdzlaeTFVWlNMcEFWaFZpTHFXTFd0S0pjVklsZWtTUGUv?=
 =?utf-8?B?YmN4Y2FiZ0JyanlQZlhEZkZmYStDQXg5d0xvclZJck5JN1NhVTl1VHUwMXVN?=
 =?utf-8?B?VCs5MkxFVmM5MlhYS1Z2RFBjNnBvbXNrNEl0UkNRYU5JWFBESm1JYml5Z0Z5?=
 =?utf-8?B?aURhbHVCblAwY3VvS1pGVUJpL3duTHMyaTF6SGZYcFFsSHZaQ3pmNXdZblJK?=
 =?utf-8?B?c3N1R0FDRTdPUkNSYVErZXBIcTgvSW85VkdFam95NGVTYTYxcWtWMHVLY0NH?=
 =?utf-8?B?Y3BmQktMeFgzNDI5SURsSDZRMzlXdEx0REtCWHFCQm9DcFFSYmQ4eEVHbStG?=
 =?utf-8?B?OG9FZ1ZDWDZaUHh1c2RQdjVwMktKdlE5b0JJdjhoQUZNQUt2QkFBMStjdStw?=
 =?utf-8?B?NTdMczV1RGwvcFhuUkJzektSWVJVeWdTY3FVem93d3VSMFN5UkZJWGlzYVVT?=
 =?utf-8?B?T3Bld3FyOXJUeWtQdDRMZWozWDFSejczd0JYYVU5RTI4T0NrSzhVMVRxTWFW?=
 =?utf-8?B?dWdud0RUUmZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZMVGZBMDJBUHlJMUdSdDZxUkhqT3BtWnJveG50blViQ0ZmZUl2cUFPdVRp?=
 =?utf-8?B?SlpPbCtiZ0V2MFZIZU1ZSHhBUm9WZE9vWXlsa0dZbmYwWmFTK2RFMlBOM3hm?=
 =?utf-8?B?OFc1amQ4SmxQRHdmZ0t0NVB4R1lRVXY4ZGY4VHdrSk9KVmx0VXhkUy9Yb1RJ?=
 =?utf-8?B?dGRqeUtReml4RHJaazkzbWRsVVN1N0hKcEpocyswb3hWL29ZNW5ESE5pcW9i?=
 =?utf-8?B?YXYzL20ybHQxWkIvYjdSZ1F5VlY1dWFIcTY1RHF6YVRST0pqOEdweEJTSmxI?=
 =?utf-8?B?YlFUMml0M0RONUxhMlBRVXEzT3VjanJINGpVNS96RXZsQ3p5R3VoMnlnd3kr?=
 =?utf-8?B?aHRVZVoyMEJGc1BwdndTcUdBN2FlQkhQR3pUZVdHSXZ3T3FhZHFsckdzR05T?=
 =?utf-8?B?TVJkbDF5emdWQXdjeHpCNmh4U2c0SmVubkFkQUJVcS8raGhLeVhRei9lR1Q2?=
 =?utf-8?B?d0NhbmdHdDRIUFhlekgrTFdYSllBelZ0cXBZT0pOM1FlRzBJRFVnUHoxTFlF?=
 =?utf-8?B?c0JBVGhKaU83aFdNUDFrL1F4T1VzSmMxdDVQbXNJUkJTL1dwTlZPZW5naTBz?=
 =?utf-8?B?OStPRE9KOWUreHdHRFlFRG01ZW9WZ1EwZG52dHFSejFrbGtTR3Q5NkJ3TVp1?=
 =?utf-8?B?Q21GUzZvRWRtUXhyKzlwTzdDNlpqR0F0ZGNvTG5uZmZXVk1ad0hlTEduQkxV?=
 =?utf-8?B?ZTFlSkk2Q0JLWEFEZml5VXhPK1FlY2lZbHN5bFF5a1RnZDdTUUJLUHhrSGla?=
 =?utf-8?B?WWpWTUV0VUZGV01ibjFXeEdFbGU5bWs1Ymw1cEtzVlV6VmFVSVN3R2lFcjNx?=
 =?utf-8?B?QlhsNjVsNldPVFU4RUQvMm9idElJS2JBMDdpTm1weHdVTjZXSXp1amJNRVp0?=
 =?utf-8?B?ZmdwcllpY0U1dXRhU0ZzMUZGNzl0Q042aENNNm95eitIRE5pOWpVNVFHN3dS?=
 =?utf-8?B?WFIwZmVERGhLbDZHcHBCTVFJd01Jblc5UXBuaS9lTS82NEEwZjJrcGgyLytB?=
 =?utf-8?B?TjZITjZIU2ZGMzBOaHVTbFZyQWVBQTFDU0UvS1FKaE8wQW9kTndDT3cwSW1L?=
 =?utf-8?B?eVowR0trVDhycDJ2TDhMa0wybWpKTGI2UjFwaDZlTkRpNXNXbnpNVGV1MGRi?=
 =?utf-8?B?TGhTbXI2eGhxR1JGTnFGYTNtMVluUWJiQXRKbzNRZlZuTjJqem5ZWlIvWk0y?=
 =?utf-8?B?SFc2dVlaejBGSFRaSE5NSEpJeXVac2lQRGVUU0lmdEZXa1gya25WdFVSczNp?=
 =?utf-8?B?cXVqU1ZXUXliT092NVduYzFSR0U5Y3BHRUR1dCtnOXRsaGdXdUo2OTlNLyty?=
 =?utf-8?B?SllaY2NScjl6S1BKRnhIVXRmREhQdy9lR25YSC9tTWpNZ2R2cjRYZUgwLzN5?=
 =?utf-8?B?RTl0MVIrMlU5NWVwbFBlTlc5MTlwWFdUc0dOclZHZXF3eTl2ZzhLWTMwdGNC?=
 =?utf-8?B?TkZwWWFHZzhCZVRxbk5wZHBqYS9uanM5M01nQm9rV3doT0JCQ1pGZ1J3SVRQ?=
 =?utf-8?B?UE4zKzBoV0lTdVd0NWVRTWFwZnBMbkV1VURiNzdRZHR2bU5EdEV1cS9VTWFB?=
 =?utf-8?B?YzNCa3BValhzVTJBay9ZL3hHYktvTHkrbnlBR0J2UDBDU0VmZC92ZWgyRVE3?=
 =?utf-8?B?bCtMV0ZxMWhJRzNic0s0YnM3R0dhcVhHOEl0cXNxRzdOeG5YMUYrT0lhLzBy?=
 =?utf-8?B?bEJwMWdobnZBUUFvYThnTlZ2U05IQVRNSE9hQXNrS0EwUG53UjdQeWx5dElq?=
 =?utf-8?B?QU9YL3dENFVVSjQwKzVVTlBxUjJzOTlhM2N5enpnY2czcmxEa3ZJcWpITkVE?=
 =?utf-8?B?ZUJjQUkzM2hZeEtHYzZFRUFiNTVrcndGdjZWb1RjWGtyQjUwQjZnakpWT29a?=
 =?utf-8?B?em5WZU9DbHU3UTV6d3lINCt4a0pheUNha3VncjFaemhvNGRqbW5YaVdKR0ZZ?=
 =?utf-8?B?Q0o5REw0WW1rck9DakJheHhnRDluaGxKMWRtWEp4dXlwWVhjaGVVVUtIL3ND?=
 =?utf-8?B?V3cyRU55MFZVdy94VzNsYmpreU13UitiQ1JGMm5Wc3RRQTFXTVkzdklZWEhC?=
 =?utf-8?B?WG5sb1Y3RGtyRzN3R01uNVNqTFl6SEpBVXFodUJheVo4eENQSUpJOW1zSzhs?=
 =?utf-8?Q?8D6eKihbohIQrzPh5vzKv/E/W?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f5a957-cdd4-43f6-1e57-08de333499dd
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:56:54.8515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Dlq3o8xmdyxDrYe42JdDUN2Oul5JbqbHaX3hHkl+IkNxINyUlx1KrW1OeAOOH1vkYo98kWOnd7A+iwMVHYOxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
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

W dniu 24.11.2025 o 23:40, Ville SyrjÃ¤lÃ¤ pisze:
> On Mon, Nov 24, 2025 at 11:49:40PM +0200, Ville Syrjälä wrote:
>> On Thu, Nov 20, 2025 at 09:14:15PM +0200, Ville Syrjala wrote:
>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>
>>> Coccinelle often chokes on magic iterator macros. We
>>> can lend it a hand by explicitly declaring those macros
>>> as iterators. Start collecting them in
>>> scripts/iterators.cocci which people can easily include
>>> in their cocci scripts.
>>>
>>> The "struct dummy" is there because coccinelle doesn't
>>> like an empty script. Dunno if there's a cleaner way
>>> around that?
>>>
>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> ---
>>>   scripts/iterators.cocci | 53 +++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 53 insertions(+)
>>>   create mode 100644 scripts/iterators.cocci
>>>
>>> diff --git a/scripts/iterators.cocci b/scripts/iterators.cocci
>>> new file mode 100644
>>> index 000000000000..90d3ae437a15
>>> --- /dev/null
>>> +++ b/scripts/iterators.cocci
>>> @@ -0,0 +1,53 @@
>>> +// SPDX-License-Identifier: MIT
>>> +//
>>> +// Use with
>>> +// #include "scripts/iterators.cocci"
>>> +// at the start of your cocci script
>>> +
>>> +@@
>>> +iterator name for_each_collection_data;
>>> +iterator name for_each_combination;
>>> +iterator name for_each_connected_output;
>>> +iterator name for_each_connector_mode;
>>> +iterator name for_each_ctx_engine;
>>> +iterator name for_each_disconnected_output;
>>> +iterator name for_each_format;
>>> +iterator name for_each_if;
>>> +iterator name for_each_output;
>>> +iterator name for_each_pipe;
>>> +iterator name for_each_pipe_static;
>>> +iterator name for_each_pipe_with_single_output;
>>> +iterator name for_each_pipe_with_valid_output;
>>> +iterator name for_each_plane_on_pipe;
>>> +iterator name for_each_prime_number;
>>> +iterator name for_each_sriov_enabled_vf;
>>> +iterator name for_each_sriov_num_vfsfor_each_sriov_vf;
>>> +iterator name for_each_sriov_num_vfs_in_rangefor_each_sriov_vf_in_range;
>>> +iterator name for_each_sriov_vf;
>>> +iterator name for_each_sriov_vf_in_range;
>>> +iterator name for_each_subset;
>>> +iterator name for_each_subset;
>>> +iterator name for_each_sysfs_gt_dirfd;
>>> +iterator name for_each_sysfs_gt_path;
>>> +iterator name for_each_sysfs_tile_dirfd;
>>> +iterator name for_each_tiling;
>>> +iterator name for_each_valid_output_on_pipe;
>>> +iterator name for_each_variation_nr;
>>> +iterator name for_each_variation_r;
> 
>>> +iterator name igt_for_each_drm_client;
>>> +iterator name igt_list_for_each_entry;
>>> +iterator name igt_list_for_each_entry_reverse;
>>> +iterator name igt_list_for_each_entry_safe;
>>> +iterator name igt_list_for_each_entry_safe_reverse;
> 
> And now that I think about it, I seem to recall cocci having
> some kind of builtin heuristic for this...
> 
> Indeed, parsing_c/parsing_hacks.ml says:
> let regexp_foreach = Str.regexp_case_fold
>    ".*\\(for_?each\\|for_?all\\|iterate\\|loop\\|walk\\|scan\\|each\\|for\\)"
> 
> So I guess we don't actually need to declare any of the
> iterators above. IIRC I generated that list with a simple
> 'grep for_each', more or less just in case.
> 
>>> +iterator name igt_dynamic;
>>> +iterator name igt_dynamic_f;
>>> +iterator name igt_fixture;
>>> +iterator name igt_fork;
>>> +iterator name igt_require;
>>> +iterator name igt_subtest;
>>> +iterator name igt_subtest_f;
>>> +iterator name igt_subtest_group;
>>> +iterator name igt_subtest_with_dynamic;
>>> +iterator name igt_subtest_with_dynamic_f;
>>
>> Couple of other needed iterators I apparently forgot to include here:
>>
>> +iterator name igt_until_timeout;
>> +iterator name igt_while_interruptible;
> 
> All of this stuff I had to add manually to actually make
> cocci parse the code succesfully. And we can see none of it
> will match that heuristic regexp.
> 
>>
>> I should also check if cocci supports regexp with iterator names since
>> that could reduce this list quite a bit...
> 
> Doesn't seem to be the case. But at least I can reduce
> the list due to the builtin heuristic.

Nice work. What cocci coverage in percents do you achieve with this?

I have asked once cocci author about the same issue some time ago, she 
proposed different solution [1] - to provide --macro-file-builtins with
defines for problematic macros.
Not sure which approach better solves IGT issues, defines seems for me 
more flexible, but I do not feel an expert in this area.

Anyway adding parenthesis to igt macros makes them look more 'c like' :)

Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>

[1]: 
https://lore.kernel.org/cocci/4aed4763-9b3c-c21f-693a-e7d4281f8384@inria.fr/

Regards
Andrzej

> 
>>
>>> +@@
>>> +struct dummy
>>> -- 
>>> 2.49.1
>>
>> -- 
>> Ville Syrjälä
>> Intel
> 

