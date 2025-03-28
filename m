Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6E1C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 11:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FDB10E9EE;
	Fri, 28 Mar 2025 11:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld7EEQQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7599910E9EE
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743162247; x=1774698247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UPg8CoFjobm36R6xc2n/PNyi8Q9MDM4dy3fkBX/SGd8=;
 b=Ld7EEQQMtyCxUfitgIDELWZPFWChvv5NZGgMDHriM7HE35gxowRbGbjL
 cDOwlBQLzfQZM7xPYMASloY4p5BeTP1CZHEJnLzPCdtfuSpNV+tpRWxks
 570evcDocCb6EzPA6mTldWHoGUbr+teu5zy2C84DzXbyZkTcVSv620hg4
 kSUFRjEIpALPS9UaK0pawz3ckxqVoDskg0eVKCiiLePB0xUvsW14VnxnP
 yFARDbPMxD1JyOuw8v+X3n7gNSKE3D+VFg8w4OKTuxMx7NVI+PLiLDBV+
 aL+fsL9jJQLNx4PF1RIBUB+7nom2VoERpkA4XFFZ1jp40aBEDmQRnvxjR g==;
X-CSE-ConnectionGUID: uQTH0drKTPylrz9I74/qrw==
X-CSE-MsgGUID: 60CVN4jfSZCclRQX2lOpOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61915756"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="61915756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:44:06 -0700
X-CSE-ConnectionGUID: DWIOo3NnQ6quLhtSD1VgHw==
X-CSE-MsgGUID: 7PbsFESTRE6vw+UjoVKZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125653138"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 04:44:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 04:44:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 04:44:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 04:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oByKO74t7OHt/1yEF0uYOLxj7bFN0D+HYNS49xbkHnTk2aRtt0Zdaz1teeGFDkv7G0HcrcNIYlFKoLqgLQyqspBSqLl6s52W4TU4YpTS5Nauqjzrz0E3uYEozCIfF3xTzh6oR7AFw0znUzXDV7SdMqK3ojLZRuV7d1MTdQR0M7pa8TTd0IDvcd7Pv05Qoopj1EfYIe9kpIlMntrzE7gcBdFeiA1Y8XR666OCMrHgTHT0AtOPz5hR9d/iTB30S8wh8qZjcQQ7DC0f+q6a80Hyo4x2zubnFSnDwB8QI7ZHwX7O+tiLFEfNRSziOK0qfTzXiIudPpP3HrdNNIvcHNKLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apsRMQOgQP4BMTUdIoOggEkYFCmef150hV/JDVOVX2o=;
 b=ya2HnZqaItGqQX0WSzrn1gFrZdAxMY8OUKEfDbSjIWW+pmxBa3X0EdVF1V0kbuEeXqYYKa3HlmKo1QoaHdIg3Rjc7IXZ/V62XI6f2RaAPf0YgJ+5XRVRyQnAkcYIEWfIrBkpMJetvkZB4e43DyyGpixb4eyCC0A2vhGzTOOV9bv5OCYGW4ySCQs2TfM3x07JXxCJqUAYJcEWlPetgszx9Nf1VfOahSnayL9ZAvLvH16cMYA3fq9XRVwvHA6WC8RAG/pbbYi7Q2yGoyPZn5oO/Hg0Cgcftsl4fKolO4cFzJmLtcbaIji/Q27i1e5j192wjrfeB5PazFi3MJ3sFFCikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Fri, 28 Mar 2025 11:44:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 11:44:02 +0000
Message-ID: <43254476-6848-4176-bc44-8994d6a6806c@intel.com>
Date: Fri, 28 Mar 2025 17:13:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_device_scan: Add driver field to
 igt_device_card struct
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250328065553.1843028-1-soham.purkait@intel.com>
 <20250328065553.1843028-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250328065553.1843028-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV2PR11MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8c504a-80ca-4405-4734-08dd6dedd62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGJ0Y0puZ0UyMy9nM1pQcTFYN2EyV01XT2ZjV3FMbVJyb2VTUkNOejBYRmh2?=
 =?utf-8?B?WUt2b2dkbXZsa0JTdTY5UElpWEhMSjZENTR1K05KcDFiTVQzSkpJclI2UVoz?=
 =?utf-8?B?MUx3UjFaTE96RDJiREV0SHNXTGpPaTJ4ak1jMjlnTzJDbjg2QXI0bWZIM0JR?=
 =?utf-8?B?dW9kVjJjMDVLN1pqR3c2NC9qczUzK25aU1VOdVBaOVBrYW5xVDFna3BmVEY1?=
 =?utf-8?B?Ynh3dC83bnFtUERJSDFtUDFCQ0xiei9CZzlGbWVGakdKRTIyaE1EUHB5NWZ1?=
 =?utf-8?B?bFJJM1d4U2tLcndDYkhuQWkxbWVhano2K01sUEhmYVowL0N1WW9KQmgzcnZR?=
 =?utf-8?B?T25aaHduUDJWTGxyLzBxOUp3d1loK2xkOE9JaHYraG9Sa25DNWNCNW9ic1dX?=
 =?utf-8?B?UDJBRDJQLzJDMnZQWUN3L0lmaU9HOHh3SU83QjBmNDFYdkZTcUlzeXhVTjZn?=
 =?utf-8?B?dnhBTDFhVXFCYVRBMmdJSzJtRTFpME1IdVl1RWRGM29Zci9iczFEMldZUEhn?=
 =?utf-8?B?TmloNEI3UVpSbStwb0h5YnpndXlsejlGU0ozNkhBZTZrNlgyMXBMSFpSZnhv?=
 =?utf-8?B?M2FzUXkyRFRvcUUzRjZUMzFCclp0RVdwUG9ZbVpRM29OWU41bWRDMG1Sc0ZR?=
 =?utf-8?B?YVRMVkFaNGdUUStpL3VtMVVhUmgrTjhUdHJDb2l3aFBWaGZtb24vN0JZTjVR?=
 =?utf-8?B?RCtoMkMwYjJma2Nwek1jMDB6WnpzQ0xvQ2RBT05mZzRNNWxVc2JMRHR5SnBm?=
 =?utf-8?B?MDhiZXlGRkRzVVJ1NCtJRUpENTN2S2dHbXZJQkowakx2aHVhUzY0UEhSQnFL?=
 =?utf-8?B?YlJRNFRKOWU2QkVoQWM3UWN4T2QzeTJsemIzaXV5U2ZhUUczM3BpUnBoVGFq?=
 =?utf-8?B?cndxSjZEWnBZVENwUDcvclVySFR1MFN2eE9OWVNrMXc4T2dBRmRqdWk1Nmhi?=
 =?utf-8?B?Mmxobk9ucXFSRTVUM0owckQ5enNzNVNnbzBSK2RSTkxBZzdEeGpCMXdTNlo3?=
 =?utf-8?B?ZnRoU1I1ZldqRTg3N0c5cXhyRjlJMmM5MTMyTk1SWE1BQzVqRklnSTBzMTFI?=
 =?utf-8?B?aTV3cGtCS2NEMkp1NlNtMjY4WEU5SEpnVndhL2k1bVlpV3luNkt0T1VEc1VE?=
 =?utf-8?B?MVI5R0FvU0FYNS9reXZJbDVKeDdVZmNMWW44VGh5OVdUSDVQV1NZb2h0VEtM?=
 =?utf-8?B?eE9aM1Z2WGhSZXI4UmE3QzlpOFZ0dW40Y3JMeUFrbXZ0MUwrVFBHRXZRK0tn?=
 =?utf-8?B?WVpJNmpBYzdoYzhibVVGM3dPMTZzK1NYK0JHUk5sVE9BN2EvVXhGa09PbitL?=
 =?utf-8?B?YU9WMlNJcFBjVFVqUERUdmtZRURFSHVLYXhrdXRoQXlDZ3hVOWVtSUJUaXMv?=
 =?utf-8?B?R25sYzR0aWR6bXowUy94MEZndmtLVUxFNWkyc29ROGpXaDhhV2drdGxWZXVN?=
 =?utf-8?B?b2RDaFhlZC9qRnp4ODU1T1V0RnlxZi9NWm1rcXMzOEMwVkUrT09SL1hDNUov?=
 =?utf-8?B?d1EyT0JIWHhlRGU5bVBGS0UxbkVUY3BKRHRXaFlQSUpjZ3RYUk1nOHcxSHlI?=
 =?utf-8?B?K1ZxemwxemZnMTdoVnRBaGhJOXNBVExJcGhtOVo1SkFTcmRyWHF0Rm5JR1Y4?=
 =?utf-8?B?RDgyQXFLRHJCMllITVZ4bGhEalFISlFCZlhLNWh2QXl1Zmxuc2hQaW80Qld6?=
 =?utf-8?B?amxHdXdIZVFOdElnMzViKzY2dGxkTW56WExCM09GZDY5eUJpZjJ1bDFxTVJu?=
 =?utf-8?B?T1YzR01OVncwR0hqRTBYaU9SalE0NENnQjNnR0NiSGduVUlhQXZzL0RYdk9h?=
 =?utf-8?B?NGdaRDZTUTMwZkgzRzhBYXdrWFZPeW94WFVaUU9kcXhUdUlaandGbGNCRU5N?=
 =?utf-8?Q?BOrjRxZ5b/iiH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlM5b2dwbEFaSU5TOHpjeFlTOFhZQ1R4MWp0UkNMY05IdHl6UEh3dXhiTUE2?=
 =?utf-8?B?M1kyc1FFNVR2TFJic2VZOXZESzR1MXVHYW1pYWVQblNUZk9VZHRkaG5OOFJ1?=
 =?utf-8?B?d2VlZndjMEFxTkMzalZudHpEWW04SkhnWU43SEd3b0Y0ck5NRTN4M3NTOURt?=
 =?utf-8?B?aVBjci8wTS96cmE3Wjd2bjh5YlBmdFEwcm1xTmwycDRtSWhUek8za0pqWURJ?=
 =?utf-8?B?V0UyTzVFbWhyTDN0NURiYUwzK2ZQRWl0RVN3aTV1TlphaFZnRm9iQjBtbllx?=
 =?utf-8?B?WjZJb2prOTd6UzJWaEhtcGVoY2FhbUhnc2ljWGp5VGZwL1B6bTY4MEFFUjRo?=
 =?utf-8?B?NmFnVjFTeFpLQmtnYXBKZVFoUDMrMTBRalAvaDIwNE5hQy84TmFSS2RpREdQ?=
 =?utf-8?B?ekRsS3pxNXJTUkVMYnlBT3ZCOG81elplOUJROGxLMVVnRnZEejYwRzJTM2NI?=
 =?utf-8?B?THBPZUFidDlLa2VteFB5Q0xBekl4MXFUNTdoZGtLd2k2VElPQmFzV08rWFpM?=
 =?utf-8?B?UUlKNFBqOHhSSUlIOVl4T3JkREp5ZCtRYnNpM1pnNXRkOXRlSXRyY05PakMw?=
 =?utf-8?B?VUVtSG01SmNoZXpRTnRTRkZHdVNaLy9BWHU3Y0E2K3ErSW03R1RoYlpPd0Rv?=
 =?utf-8?B?Q2JsL2R2VmVNRnZqVW5ZTDBOSTEyb0VtRmczdTJuMUlBMWJBTTRnRmZ5NXE3?=
 =?utf-8?B?TmhQc1ZNNEpzUndvbmppdytnbVp3eklXTWplMHpUV2p3UlZqSzMrZURkMGRE?=
 =?utf-8?B?ME1XWU1oS1ZzVnVuWnZSNmJlYVpQMWRQaC9TTTdiM0V1VXM2bmJlKytpdml1?=
 =?utf-8?B?TnppWmN1WXhEWUdvS29pNndaT0pOZERFUTd6Z0RkRFo0WUI0MG16aThBVFll?=
 =?utf-8?B?MnF6SWQrYk5IRVdmVTNLQUJrajBxeVZSbEQ3UER2OHZzbGZFamx1amZOWEEx?=
 =?utf-8?B?cDBCNVpCbjF5RWdZdGxyQUF2WFJwRWJ0LzlDL0Z1ZlE3R0JLM0RhY3h1SGwy?=
 =?utf-8?B?ZklZNmRpMEJOa2RGaCtpWEl4bHFrUXpXNkZCVUxLSHNzZzBhU1ZzRFhtcEdn?=
 =?utf-8?B?YzVRTUdMc3ZGeksvU3JkSkQyOUFaVEpzUStyS1FGblhwVnd6YVUxNTVTeWRQ?=
 =?utf-8?B?bmt5MUpnY0phWno1a3JQZkpyVVVONkxxc0NSOCtKYkE2cVA3ejN3SmVQYzdv?=
 =?utf-8?B?RWhUU1ZkU0YyUktNb2x6aW9sTjU5MkZhWWh0VlNwaXFKTDZDNXpLSzR4d08v?=
 =?utf-8?B?dG9JK1EzZkZkTmJDYlNIT3RjeVNwWndpRlJpWjVQQVVKYVN3SmlaVHdiWElz?=
 =?utf-8?B?TWV1UUlFVUoyMzRzcC9Ra002L0R2ejlFL1V6cWl1TVJyMkJTRnlXSFFUdElO?=
 =?utf-8?B?WkQvYWlWM1hBdTRkUC9Dc3k1UWVwcVJmZVF6MndESEF1SmVmcTk4eUxaSjNS?=
 =?utf-8?B?STUxbGtEbk5kODF6WWFRaXVQSFdVY1kzN09NdzFEaG16UWdRT1p1dnlYazg5?=
 =?utf-8?B?REU4Y2hFb1pUSlV1ZDRjRjgxQ1hrREJSNThCcTlWRmthUy9URk1kUVp6WlhM?=
 =?utf-8?B?dndlUWhFTWhRL3pSelVkeDYwNGVwU1V3NHk5aUlRaGs3cy9JNTdPTVpxa3lJ?=
 =?utf-8?B?QnZGWTdhemxaTEJ0VFNlRDF6Ri9reXNtbzZHZ2pDUDVxc1ZGT3F5TzBDcmJw?=
 =?utf-8?B?d3FUQTRqR2lBSDA2bW5pVDRwNzBsbjMzb1JQbitUUHZOVE1WanIwWWk5Uzd6?=
 =?utf-8?B?emxJZTRDNDFtQ1JVUExHZDlERXcvL2kwOFhVZllZd1M0eS9uTjFCL0g5Rmth?=
 =?utf-8?B?cDJLTFh0MjRoSlExbmZ0T2hFNlhVMkZpR1J2UEVJSW1aMzJuWnM5cDIyRWJM?=
 =?utf-8?B?N0Z0ZFcvSFFCdFRER0h3NTJIRnZ1R3hYN1dqNW9JY0ZYbFRtUStpbHFTeEVq?=
 =?utf-8?B?ZGNyTTU5allQcVpYUGtkYkp4dWZmdytLUTJTcjkyN0M1UjNKazVjMFArbVhp?=
 =?utf-8?B?dWRjcmFpUTFadjllSHlxbHNwd2RGTGFkRkNJdmlPR0xNSWFBZldEYmRUa01k?=
 =?utf-8?B?emNnT2o1a3Q4N1EyQXhDOEVKT0xkVW5CR2VwaGw0RTJHcGczSW5oQmw3TGhS?=
 =?utf-8?Q?LpCCVAsCXr+clI9Vu7A/4Ry/j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8c504a-80ca-4405-4734-08dd6dedd62b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 11:44:02.7919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHKQfKwbgS4uNmcdZ+O0+cWUiRxOyZzsR0F5RTYqzgIPag11zdCm13tmmyswwl4DHUXy+SlsFHKdg1O650nzXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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



On 3/28/2025 12:25 PM, Soham Purkait wrote:
> Add driver field to igt_device_card structure
> for storing driver names.
> 
> v1 : Add driver field to igt_device_card struct
> 
> v2 : Reorder commit sequence (Riana)
>       Include sign-off
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   lib/igt_device_scan.c | 4 ++++
>   lib/igt_device_scan.h | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 711bedc5c..3f26a1737 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -774,6 +774,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
>   		safe_strncpy(card->render, dev->drm_render,
>   			     sizeof(card->render));
>   
> +	if (dev->driver != NULL)
> +		safe_strncpy(card->driver, dev->driver,
> +			     sizeof(card->driver));
> +
>   	if (dev->pci_slot_name != NULL)
>   		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
>   			     sizeof(card->pci_slot_name));
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 92741fe3c..f1cd3b1e9 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -59,6 +59,7 @@ struct igt_device_card {
>   	char subsystem[NAME_MAX];
>   	char card[NAME_MAX];
>   	char render[NAME_MAX];
> +	char driver[NAME_MAX];
>   	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
>   	uint16_t pci_vendor, pci_device;
>   };

