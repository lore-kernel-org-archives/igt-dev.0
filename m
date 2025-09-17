Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD7CAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 09:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DEF10E43A;
	Wed, 17 Sep 2025 09:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXyHYgSb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81A210E43A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758099985; x=1789635985;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MfSYYIzboE15nfb8ElUP4pOAup9s464YEaZyaLQMKq8=;
 b=CXyHYgSbWU5I87QA+rJzETXgcISycucc/cWcLMpUFacKVPCrLhrIBd6n
 RaEDCWH1lWVU85bOHMfpjvevNZwpuLYq0zHHiyhDtNBF4LJB94GPA1fva
 SWh9hIsgXMZsBxpoDWTmeayh8jkmqr7t4stDVQWwoYEBldBXK7B0TGdCv
 WVyYJiqDzYN0QhJq+lAjgjLoPHkz2ibtM7r85SpjRZvQGRl8yaJ/vRsJd
 kyu5bSD/wk64FnGV+Seck9YJ7Ofp5HtcaWZl/q43TihAkLx/pI2OvMd80
 k28YEUOrJoHns0fpC4ic7N/hGBk7Aruq7VIdJkEBdargXpwdYyy7LUCOF w==;
X-CSE-ConnectionGUID: R1GTvbMsQg6r5gJfFt2PXA==
X-CSE-MsgGUID: Y9z7p3TRTOqybm23976gxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60092493"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="60092493"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 02:06:18 -0700
X-CSE-ConnectionGUID: z4pT2yUKStqx98/mJM4IRw==
X-CSE-MsgGUID: ygfdUvcnTk+/XIWkvA1DsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="180330160"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 02:06:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 02:06:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 02:06:17 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 02:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVP1OXrRafQI/UdRSTzm88k9hObagOHZDPJuy0ndVZqfLywAYsBczPk+/qZn4BxTQ0tb7o/sOngVDzxQAJIfWP6pOdx8QRa2R9RWlMT5edrAY9mVF4yQ0/YyPLSIndirKKeZxkED5zwj1m8QPFdYn6yyX4okQTnqzwdSfyPARAmwUoEpxahuvgYau0LMGKOcc9UJpY77j+X/BNydXXJSAkQfiLlWwID8OzN9yQMZeDDBupQgjc/KS7MF9RxWUW2E5Eieu+OR5I7IPfjRstqj4YRG68LR5oeqDYmIetcfJRgxWiXI7kJmS0KUTz3RRhpFrUsRKaJBJMy4gCoxDMBKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEk2oZJXQIph3cdfmd9vblkpAwcjp+oPQJWY5GbyzDo=;
 b=XPEaofKB9Cot9bIKOCnIaZSgRba6xUdgRGnUP4EOx0A5oiL5b536qPlEFVI4Rlw4AOeRSL9kSP8C4lRE6NpSzmbCJoKhUGHT6KXD44FH7Bg7D+9c+aQhcG3qmRUrOoArqSqGJX99nzlPQeXh2Jp+Lo9a7zvD3hRRlaVsWQMiQXxHjAy/oVlQgIdZ+/TKU4rrEXuf9afP00gWFznDJmty9l9VwVqAo+wYBsarg9E9k10t3hQ2e374jNpHE22HvjgWSGp/5GmW8utmbobyIaTdkgjcAlp4sHeBxUnknjtfNMvLMctp3narhQhC6Nx3JPHIAVXeDL18isizd007fRBbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 09:06:14 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%5]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:06:14 +0000
Message-ID: <d5844204-82d9-452e-8283-d121655f5624@intel.com>
Date: Wed, 17 Sep 2025 14:36:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250916091800.1348207-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250916091800.1348207-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf09242-5e70-442a-1b8d-08ddf5c97418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWFmdGlrVm1VZk8zVXdScldHL2JnUFpTZUJTOUlyYUEvYjdPV2tVT0x0dWFq?=
 =?utf-8?B?akVvenpCejVzZURaZ1oxeExqRFNVamhZbEt5Z1VoVXJQdkxoWCtNT2ZzL0Yy?=
 =?utf-8?B?REQvdHRuSXNhNU9KdGZ4bEt3d2JzRmVUVE9ESC8vSEpJc0J3R2l2bWhEeElz?=
 =?utf-8?B?V2N3Y3oyZjcxT1NxdDNZQzFsSjh4VEJJN293VnlTbHFTUSs0UW4rVnRqTEg3?=
 =?utf-8?B?eW83RURseFdsYmdkV3VpOTJVUlFZYlYrMEg4ZWc1dU54QW1PVE12dkJVcm5i?=
 =?utf-8?B?WjNkVG40bk5vR2ZqZlZBV25UK1VsRDdNbUlOZmphS1NLMnRsbmJvekpxTmh6?=
 =?utf-8?B?NGxRUng5WlZ5U1ZicVpWWnFWeWpiakNoenhySWhvZWlMZXZ6ZjlsZ2Q5V20x?=
 =?utf-8?B?NkhiMmQ4RUJ2Rk1ETVRWTDROd0FZOEpqUWRIRnNVODNQUTByT050dEdndjF5?=
 =?utf-8?B?RzRQODVuUXFtSk1yWlF6cDJCWW8reCtveC84OHVFVDRpaTk5R0Z4MVY0WlBD?=
 =?utf-8?B?ejhkNkN5VEdaVEREQnI0cXUySkNxSUJDZ2ovNTQvcmhLaDdQMGkwVWNwclo4?=
 =?utf-8?B?TFFQYTJiZXhPR2prK0FISjluMEtEQ1NZOVNsZ3k5SVhCR1dRaUdIc3h2RmNB?=
 =?utf-8?B?MlNJNXV0OG9RLzhuVjNlSlRjSTluaGpBd2ZLTld6T0M1eTRLVTQ1blA3bDVW?=
 =?utf-8?B?MG5vdzJmKzhwQTZZT0d2aHA3VEl2TWpLbnhEUzFzNzIyUXd4Sms1OGQ3Slkz?=
 =?utf-8?B?NU5mQ1V5RHloeGNpWHNQRGp6MTZUV3Rqd0doTDNrbE1kNEJiVXRRVmNmZElk?=
 =?utf-8?B?U1ZRNWdxcUlYUW43cVVVRjJCekJWSmVUQzRzSVNIWXNVck40WmhDVkhXdmFS?=
 =?utf-8?B?Vk5xTW5FQnVidTAzaklva0NwdG1vcWF2STI2UTJaRU94VitLUGkybis1aHJj?=
 =?utf-8?B?OU9Fczd2VGdtbEVod1J4RUo0NGNoU2llU0tlWlJPMGVFakRITXFZSjJUS0lz?=
 =?utf-8?B?U1daeG5yb2NndEROU2N2OVJucFZWMzBqaWFpcUJLL1piYzEyTDEveGZKcVZz?=
 =?utf-8?B?Qy9hYTI1UkI2d2xKOEdmWExKUGh6dVJydzY2clhHRkd0eHhGMjJwZ3psMnhI?=
 =?utf-8?B?YXFsQWRhSHRuZitMMDlkbWpoZzJkclh5ZStWU3U4Yml1THJ1UVNscW1RYzJ1?=
 =?utf-8?B?QUNpdytWTzBhcERmTDFrMDhFSVhuZkRKTHdaejM5TExGNXAvSXZCdjZjQTIv?=
 =?utf-8?B?ZC9rejVxR044YVZHazZVdHBwZGVqajluZmFHaytRNmo4aTNkNnpQZTNxLzRW?=
 =?utf-8?B?RTRnZTc1dWIxZGNxc3UwNGF1ZTN5WFBIOHZkeEF3Skp3UkQxTmRaYS9ITmZY?=
 =?utf-8?B?bUw4dVlpK3ZnWmNLRTFlcTNqWUxGWUhTazc5MHNZdnV1Umpoa0V5RzJSYUpo?=
 =?utf-8?B?L2ZwSnpYYTV5UTFSSUlGWkhuSXVQcjh0ejhVSmdwOVpNTmYyQWIwUU9sQkVO?=
 =?utf-8?B?OC9Kd05BRTVmK2lKQlpmM2VPaU43VlJQTWFXenAxbFlzaTIxSU5kcmlmYm1h?=
 =?utf-8?B?cXk3amR6eEZUK2Q0bVZOVHRJRWhTZnFxbmVOckoyTkJzdm55UHBQK2hjL0VU?=
 =?utf-8?B?c0dMZEJkL1llL1VjeFlpOUtRaExEaXpnaFBjZUh0TVVpYWVTS3AxUkNpaFoy?=
 =?utf-8?B?TllDU1RrMXVDbW5mWVdodWNqL24yQlZlRDNnSmxQTWh5YVRjZVQvZFR6WVB5?=
 =?utf-8?B?TG5zSFJSTFFiWTZrVHZrdEV5RDJqYWpGcXhyNVdMT3k1NHRxQnpLNisvYWFU?=
 =?utf-8?B?L0V5WExZWldDakM3Rk54cS80L0J6OHJPNjh1cThLb0Jvc2h3Qy9kL0pYUDhB?=
 =?utf-8?B?VXlMR2ZGOGNMZU1vQ2lNZURndjh5ZytFVHE2QVUxeEhEQ0U1cmEreE1qZjNp?=
 =?utf-8?Q?u2fZ2jmBbVU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVpicXo2TGM4Q3V4ei9Ra3BPVldnVFZqR2Nmd1NuSHEwNEVKNFRRL3JnWXBw?=
 =?utf-8?B?SnVTQUhacENpZXFtRHZxaTVxeFVWeiszYUNMazNoT2h0bE5wSEJ3TXdJQ0lq?=
 =?utf-8?B?YmFrNkg3R0xvMnQycmJRYkFNTmdlaUd3bjVxdEkwemVUTStLUU1CaFpwaUhT?=
 =?utf-8?B?L2liSjFaQXlNd3F1M0ZIS1lRNHY1TWs1bytJMDlnaXJXNGp3WGZwUmlBNHFt?=
 =?utf-8?B?QTZ2ZENOUVNkdUtqdjZiL3N1eWJubXp0MDBrUkM2cUtwdDFQSG5FQVRJa3ht?=
 =?utf-8?B?WmdKY0doOUlvNVZ6cHZtUEE0dXZ4NzFmM2V1ODBYSjdOTmdWdVY0RWQ5UHZ4?=
 =?utf-8?B?QURlbzNvNGVISm1heWptbmdUMHlOSkQ4Q2c1My9lei9ldXBWVFEwbkpiN2N5?=
 =?utf-8?B?OVFnaysvL2p3bXVYWUNyc3ZWSTRtTlBMTmRUYzBTczhhRUhPSENOS3RTVDIx?=
 =?utf-8?B?M253Y0VDOHZram1TZ3c4WUhqYUhzTEpzV002SitBdFkzQ2xybzluMVhwSytn?=
 =?utf-8?B?YkNCN3R5TExyYStBL1dQbHpycFFLeGE5UUc2R1lISWhpMGVvL3c0VGlEOHd3?=
 =?utf-8?B?Um84WWhxUSs0NHY0b1ovVldkVzBsck1PNmhZRXI0QUdROEptTzV2Nml3SXBJ?=
 =?utf-8?B?aDhBaWMra0R4ZEJLRldyTHdKa3M5U0NMcHZvaGNUQVJYZ0RHQ3I4Vm0xSFMy?=
 =?utf-8?B?S200bEN0OXVVdVhsd3AwcS8zKzczSUZqWDZPbGVxU3UvZnRtZldoa1BNZjZC?=
 =?utf-8?B?Z3pEYUQvZnUvSjBTK2IxUG45WFNWTEh3OW5vUkJuT3YxWFJpRWhMNjl0aGNn?=
 =?utf-8?B?dFR5aGZCcW50ZmpPcFZVWkFPaVFIYm16ek1jTXJVOWJON1BiNlc1c1c2bERq?=
 =?utf-8?B?WU0yVlJvaHV3TmZUUG1ZVGswUDFWdVUyU2Z1QzdMV2VLckdhMFJ3bWRtQXB1?=
 =?utf-8?B?MVFRaDE5QklTK0hQbHhGUExZUmRQK3JWUlZNNFJSNzNQdDVicjZXdXNBUjhm?=
 =?utf-8?B?MVA2d2wyNmhhV0NhSGd6NDIrT0xIc1krWG9DZXA5YWFZN1pjdm41cnh1Wisz?=
 =?utf-8?B?aFZFS1dNcTRrc0Mwb1lrUk9BVjd1RHFhSElsNlZJQ0luYUpld21GQ1UyNjdu?=
 =?utf-8?B?Y0pRSTh1NVBkZjZXNzBPVVIyYUhWcjc4LzhJZlVtbnZMcVk3ME13bTdxdXBW?=
 =?utf-8?B?bzhyL1ZrMlJ2dXFqTFBFMVowTWhtNDNteko4Y24yVGdBcVVNR1dHWjl0d0RZ?=
 =?utf-8?B?Q3l1eUdkWmhZUzR1aHYzVE9vMW9aOWhNRklKZmZLVE9iVkdOMGlralg0NU9Y?=
 =?utf-8?B?bnZNcEJWYjZUcmJDajdGVUVwM1ZLcXd3RHM2czIyMHNVb3ZhTlF6d09NbmpO?=
 =?utf-8?B?a3pjMlBkczhkVHF1V0JKZU5tK3pIcmhjc1V5bW12UjdHYXJBUWRPSWNxcW4y?=
 =?utf-8?B?U2FWaFVGRzlQOGxrL1NGU3VQdHJ6SWM4bnFseHVFcjI4bVVaV0JyZzBKNVRa?=
 =?utf-8?B?ejB2MjFmSkJKSGhscGRKazg3bmpZVWlSc3RVbWlPbnNKRXV0V3A0WjZnd0FZ?=
 =?utf-8?B?OVpwNm1zejVEWHo2amRsUHlROWVlL2dZK0xGWWRYbU1CaCtUMHR3S1E5Nllq?=
 =?utf-8?B?WHliZGt3QUV0Y0lVdy8rdXd3NXgyN0pJMDdmbGVDR1ZjWUVZQ0xhM1B6WitR?=
 =?utf-8?B?ME4wS1JoVlZmRE5MVlVHQnlURXV2Rkl6ZzNnRm5Qd083azE3LzdQdmdrT28x?=
 =?utf-8?B?L2VPSGNRRGZLVFNLTEkvYXBrSjRJc0JUQmFaREdleTZ4WEEwcUxmelRXTzB2?=
 =?utf-8?B?cGI0RVhhbk1BbHg5Sjg0Z2FIaVl3WXhnT3JkSW5SUld1UWN4bWVRUzFZY1Rq?=
 =?utf-8?B?bHRtUGQ3MDhuVTlTeUhzVnJHVjExbGhiRk40SFdwYXF0SEdJYUE5S3JpMDN3?=
 =?utf-8?B?WXlSNHpKZEFObXdqU1FDM0pCeUUxeUx0OXF5R2ZBZkVFNFcxZlNOMUZSR1Zi?=
 =?utf-8?B?TG5wRElEcjVYK2VqYmNiRlhzN3UyV0UvNTdaK0kzM3lEbUxaMWlvVGN1eVRE?=
 =?utf-8?B?ZjlwTVhZTEpTKzIrWDd4OE44VG1mWnhOSDFlV3FZN2pJblU5dXpEUEhJUk54?=
 =?utf-8?B?RXVwTkgwQzlidGtzY2hkTEhqdytpbnlQQk14V1VvdnlqV3lzSkZCVnpWeFRi?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf09242-5e70-442a-1b8d-08ddf5c97418
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:06:14.6210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj1RMqKAcnemkOJ7IziLQHVd+DeGVGMuk7GYpYZibNg2WYn8cUsHxNRYkxQteRlA51PjoSAqxFCQOzDyP82QrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

On 16-09-2025 02:48 pm, Jeevan B wrote:
> If an eDP connector is present, prefer selecting its default mode for
> cloning. Some eDP panels support only high refresh rate (HRR) modes,
> which may not be compatible with external displays. To avoid invalid
> clone configurations and test failures, we choose the default mode
> from the eDP connector when available.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..c901490ed 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -252,6 +252,21 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>   			goto found;
>   	}
>   
> +	/* If an eDP connector is present, prefer selecting its default mode
> +	 * for cloning, since internal panels typically dictate the clone mode
> +	 * and may have HRR support, making them incompatible with modes
> +	 * supported by external displays.
> +	 */
> +	for (i = 1; i < crtc->connector_count; i++) {
> +		drmModeConnector *conn = crtc->cconfs[i].connector;
> +
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			if (crtc->cconfs[i].default_mode.clock < mode->clock)
> +				mode = &crtc->cconfs[i].default_mode;
> +		}
> +		goto found;
Please check Kamil's comments in rev#1
Braces seems to be misaligned.
> +	}
> +
>   	/*
>   	 * If none is found then just pick the default mode from all connectors
>   	 * with the smallest clock, hope the other connectors can support it by

