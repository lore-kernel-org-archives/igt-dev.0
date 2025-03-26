Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2311EC28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 04:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BBD10E102;
	Wed, 26 Mar 2025 04:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3d1pHeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0B210E102
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742962740; x=1774498740;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x6eRImHFgCyXZmgGVICGzIRKBMe0+sMhixgnHb7Cchg=;
 b=a3d1pHeO99JyaCV85P+JHB6VqiDFgeJuwB3k7/U6QxvRWPAKX6Qna/UM
 ykSLE0Y3mNrPAFH1b3GgMZc77a5rGLjT97V0YTJFboVN8xBEfSyFceolg
 vcNk1aAzXmxhL5P6E8m9XcDlELfe/Umo1hb2oYnPZLeRPHkgr17NTDCSV
 EZ8oYlU21Ay/L5oHWGk3ETOr1K6MLU5d3DFQB9ynN6/A3rNEoiPdHlZ9t
 aWDi7RYPp8F6AFzT2nm+R1Zq+aF7ScBsK6T5H2sugwn7h8iW9pwmZ5i07
 b1RAJ+FnKfxbNIfaa/eBK48NmbzMcBfbupHpeQlnkMkRYKbVFRAi/Bycv w==;
X-CSE-ConnectionGUID: Pl+ulU3FR/WsfNfYCs1lIw==
X-CSE-MsgGUID: jHKAamVBRrKYhXE7rCOM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43964401"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="43964401"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:19:00 -0700
X-CSE-ConnectionGUID: jePZQzMTSwqtHd2Yz2PIAg==
X-CSE-MsgGUID: cnVyJn5MQWecOsOOD1IdGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124565968"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 21:18:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 21:18:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 21:18:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 21:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg1ZPl83iU+dMw1psd/O9m6GHCXOWQKPcd9mAN3qKSHDld998Ww3CwCnBgYpFxP/+N/1ytb+4cHpeFMdPwnKSAvCz+yndVCVhhW3/ZgCHUw/jG78P05qTPC4XdGehHiW+SAUO8lxCliAj+Qe4tcYOM6hXcpyHvCVIaw133u4tTtmqb86VXXt7LK7UmhVk5jVFnDhRcP0yZdCbLg64aozhSYDCZRnhdnTl6j1G5qqG/UALRB6zF7D/bEJ7RIoypnUU/yAik6Ux/o+ZgROlCEej3jhvq9GUuVFupwccf2CFuCteGLG9U2JXdiQ/ZhVU8isf3tC1w3q9vnWtbt0EOnXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWu+MCOhFanPJg8UUVjvuXj+IMn7IB+7oagcw8Mij04=;
 b=uFk799f2IQAhnEDF3smqG6zxEjsF/jUIMt5NVyepUGCrOaxXWEZw/QNixNHQPc2HsvBda4TumAAPVj+QuQ0hMklxj7ZoDenfJbY1zU3eIM2/ftW8hVgf2zhmZZzPE6qERQJcYzf4Ih8YnutcuX1Oe9uVxn/hYHhYqEREmgrSYvqSnQLW2slcC3mNz5usqSIjWEmJIXVRZ5QQIgg7Q3aHqW/dCOTSYQf5jJ10aSNrTA8Pgy5yUFJTG1MK38AWcYVAjLLzL4ikzLLYXSK7eN1pIBs8g4VbsjbvM1xpdRl0F68NjgbNkO6fcPK0KsR5PPePhOQ+0vQEwETqMqmIf+Wq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN7PR11MB2691.namprd11.prod.outlook.com (2603:10b6:406:b3::12)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 04:18:56 +0000
Received: from BN7PR11MB2691.namprd11.prod.outlook.com
 ([fe80::1b22:8ff7:ef00:803b]) by BN7PR11MB2691.namprd11.prod.outlook.com
 ([fe80::1b22:8ff7:ef00:803b%3]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 04:18:55 +0000
Message-ID: <2373f350-4c68-41f5-bdc9-ed7c61455e35@intel.com>
Date: Wed, 26 Mar 2025 09:48:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB61291F7642B213E82128C89CB9A72@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SJ1PR11MB61291F7642B213E82128C89CB9A72@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2691:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: bf1146f9-6b1e-4ead-5a54-08dd6c1d45dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2Z0YnRwY3dzYmczd3E5NEcxWmJhRTVDT2cwM3ROUk5hdkxuVStUazJlTE5w?=
 =?utf-8?B?ZXF4VGtlTHFERTB0U2FUZllkM1Rud21XaHRJaGxKODg1d0s0cDlxMFJSMGZX?=
 =?utf-8?B?OWVzRGlpdDkwVDdzT3BmbXA4TWp2cWNqck5NNUJaeGs2THVDdVYyc2ltR0pk?=
 =?utf-8?B?akJHY3lHTW5mYUxFWkFIUmNLWW0xWHJGODQraXdrWXNSK0tvYW5lS2U0VFI4?=
 =?utf-8?B?emFTNFZiQ1l6WXVva3hMRUJ4ZFUxenFrT3d5ZEdPME4ranY4blpyZk52RHNz?=
 =?utf-8?B?aW80ZmhXcER2Tm1RQnFTNW53WlFOenE4OW9JbHNXcGRCb0VqdFpYT0FkcEd4?=
 =?utf-8?B?NDN1MmNXeXZpUk1ndGpibGE4aEoyUDBsa1ptUW5PSkpOTHU0SDlrYTZOM3dn?=
 =?utf-8?B?YlJTYnRqa3VCL2dqeDlnaHo4Z2VuUGxPME5HUHlZeWNZNnVFK1dkazBtcklB?=
 =?utf-8?B?Ym5oZEFCbFBoN0JlRlpiU3ArZFdFSFpWTEI5eklUdWNLS3lKT3hyTHNtYTlk?=
 =?utf-8?B?Mm14UDJaS0xHNTd2dHBPOTIwZCtmU1dxamFNV2QrTTFoRkZEcEg5OHBXRGJi?=
 =?utf-8?B?YXI2ODhEbjZOK0I5VWpjS2JSR2k5Z09TdklJd0dUQW9Rc2ZKclErK21KWnRk?=
 =?utf-8?B?ajNpamlQSHZTRGZXZGhuWHp1U0dwN2VhS002T21QZTBadEVzNVphK3NwZm1k?=
 =?utf-8?B?U0dyRDJwLy9uTkxudmp5OHF6NzJpMDlOT1UwR3RLb21mbE50Z2dUWGRrcGpr?=
 =?utf-8?B?dW9VclRCakttWG1neXRSeHpsakNaRERlVGNxSHI4RVhFN3ZTbkRIUENjem13?=
 =?utf-8?B?Wm1qb0p1eEx2R01PUThyMjZHTUxjcTh5bVFnSEdOYWJlN3o4ZEVoUWZCb2h5?=
 =?utf-8?B?NWVWdmJvOTZvOHkvWkcvb25QaURibmZmbTRpdUVPUjZZR3JKTTVWclc0VHNS?=
 =?utf-8?B?dWdqYVZGTUZvSTVuZk9TTFZ5eldkNi9UL0FWRi9pdWk0Vll5TGd1d2daSnVi?=
 =?utf-8?B?MFhsb21TVmtTZmhBU0lYZzJOUmJhQmJGaUsrR0RTMjJCQWIyVWs0dmYrT3J1?=
 =?utf-8?B?N0ZXWEZ2V201Z1pJRkhVYkZUbFBLNVJXRlJtQ044TWI3VlViQ2d6Vi8vWGV5?=
 =?utf-8?B?SzFXZE1xVks2YStlZWEwZUJ0Qk1GL0FtcUNiaW1Ic3BVclNJWTZuMllLSDdo?=
 =?utf-8?B?Y012YkpSc2tRZzQ2NjlIWEVvNHVlVW1ud05MMVZxblJEQi9GYk1PU0ZBaUly?=
 =?utf-8?B?MzlKQ2FKbWRnd09XT0pJWk83QTg4bDlZdVcwYmdQR1hNR1lvWFdwYmcyREdE?=
 =?utf-8?B?ZmNyWG1WbnNDdnh6VCtoa0Frdmk4alBRUFp5anF3d0dFYzJmbDh1Y3FDRWFW?=
 =?utf-8?B?NmZIbm9Ud2QyWWtjUVprZW1BeHJNL0swMFhtT1ZFd1I1S3R4ZC9aVzlZTEVH?=
 =?utf-8?B?REI0MWdhbEVBcThkRy85ckJ3UUl3S0ExZ2grOXVlSGdONjNVa0pEbkNFS2dh?=
 =?utf-8?B?M0FXcEZjUGdlS0VqR0dHRTZjTzY2blBvTVlHb2VkNnF6UC9tb3E3dkRoQnBY?=
 =?utf-8?B?OFIvOXdsVmVUK3BQQ2dvVTdPM0VsZTRObFJUelRCc0NVQlUvS1JRbVpNM0VN?=
 =?utf-8?B?WG5oY0RmVHFxeFlGSTdXVkU5Qkk2MzRNZGFHT3FaZ084RGVVUysxTTRkSjFt?=
 =?utf-8?B?YnY3UUlsM2lZRlVzcGRkSVYvUVhPWWZDb25UcXcwc0VIWnhwTU9Fbm1DcjA2?=
 =?utf-8?B?NGdkMGFkKzVBYi9YWkdyNjJESFBxb2RXeUc4M1BOYnkxSjFCY1pSTkZMT1JT?=
 =?utf-8?B?NUtNa1ZnaEQwZUVyaExQQ1VLVGZpa0V3b3BOcTRFSkNmMGUzdzFJTXBGYjRs?=
 =?utf-8?Q?HdS1maCd0Ury7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2691.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEkycENUTW9RelFteE5HVDA3dEFkOE51aTdQbERlOU9zRStBOThUd0FoOWY0?=
 =?utf-8?B?ODVXVEU2aU83czd4RkdmRkkyNUhuWG1yZW1QdmU3MnBvbXpYQnlicDg0OEtR?=
 =?utf-8?B?UVVJNHBlSW5QR1V3TDcybWRJMTNHMHFZemVEazZwRWhMWVZsV29oQ2RnVXhu?=
 =?utf-8?B?SlN1T09qVFY0c0ZuMVhHT2pHUytxelpGeUJadFNrYkdyeDV3Q0g1WHE1QVo4?=
 =?utf-8?B?WExVTk5SMXQzUXd3eHV3QjFJa3phNHVXaWt0WFE4RzJwVGRwek5PYXZMVEpu?=
 =?utf-8?B?eWZvWTlub1ZkWFN6bU00MXZSc2llSFMramxia0ZmM054OWRzQWM0Q3hIZkM5?=
 =?utf-8?B?YUZqZGRHeVF4cXlVeUJhWElWMFRMamU5YlJ0Z0VYdzBlNWZraHJOY1dHTDVE?=
 =?utf-8?B?RkR4d0hiZUdlY25OdFVnbmF3djFJWHluQUthMVhRbFcwMzJYS1hMS2ptZUNK?=
 =?utf-8?B?VGswQlp2ODVZQXNoa3BNVW1QNjhJSUcyZEJJdzlncm9vK09pNTdDUHZmbVBY?=
 =?utf-8?B?NU5oK1dGdHE4ZXFFbEhlSjJWR0dZUCt0ZDVBRDdyNGsxVnV5N0JFNFhaVStj?=
 =?utf-8?B?dE9UVXFlaThqYlpRUW1CRGcyblNuZ08wMitNWE5ML1Q4aG9nbnB0YnhmZUtF?=
 =?utf-8?B?TUdjOWw3RW5RdXZ3NjlrdXdDQ21NdW1PeDluTWVzNnZkejZ1UVB4UmdQL1Br?=
 =?utf-8?B?WEl0MXV2SEVjc2xnMTlUT0JBVlFSOWEwWXJ1blZTbDlQbnFGWE4vMWtwMm04?=
 =?utf-8?B?MG1kdkdiUHlabFpERWZzQ0hnVVhWSkIyd0l3dTR0YmlqM0gvQmw5YmkyV3Zr?=
 =?utf-8?B?dHREcEEzOUhUZFl0V0Ztalh4cmJIRnBXRW95R3d1ZExpNVBjR3VUY0JSU1ZR?=
 =?utf-8?B?YzRpOWhJd2pXRFZjR1A3TWV0V3RQc3l6elFLbzBZd3dBa3RKS213N3RSOEUw?=
 =?utf-8?B?WU5hL3NuTVEwd2paeWMwT2oyRlBUaTdkK2JjdFFZZy9ldkR2d1NaQ0MvVTRq?=
 =?utf-8?B?c0ZhMEluWkMwTEhzdlpLWm1iVllYeUN3MW1jdFVGN2hVS2YyaXJLUGs0ZHMv?=
 =?utf-8?B?Y2hDekZ4dUt5bkNVeGU0WVZiR3pFVHhRSGJrTG9DUlFlV1Z0ZmoyUDM2UmZY?=
 =?utf-8?B?YlJMK3NBZWVDSjhYNVdQRmhQOVZzSTBsTU42SFZnYzZoVlVQSjl3VW9pRVZ3?=
 =?utf-8?B?ODU2aHYwckZ0cmtqN2JLREJCam5pSG9vNVZQOU5pMUdkUE1sMmRJbnpFcU9I?=
 =?utf-8?B?VjYwZExGL3dsNFBuNHVNT1JnSzYwSmFhMWNhVzBpcTAyMWN4cVRhYWQ1UFhy?=
 =?utf-8?B?S3BjQ1gwVENYMDB3VE5uRmlqQ3YwU2xhaXlzYjJpMWZlUktkSDB5UzhlMWdB?=
 =?utf-8?B?ZW5UVHVCTDBKaTB6K08rOUtOT0pUZkNZckp3U3k4Q3RVbzJ4bFJwQWh5NzdX?=
 =?utf-8?B?QzlWVk1RRll0dHJlYjk5dEwvWGFtdzZROVpWenhRWG5LODNSRE5KN3lOWE5D?=
 =?utf-8?B?M3hNeDcvNTcxQi91R1RPdjlOYlE1b3lkY1A0eklQMnJvVm9KdEZ4VGZXUXo2?=
 =?utf-8?B?Szk4T2R6VVBreE1hSkVMek1ZQUVsUGFxVmJxM1ZIZWF0NEpDNU1aUFpFSHkv?=
 =?utf-8?B?MzZRdWsySUx3VUIvY3dZM3NybjUzUGdRUnZDbE94bUtydmExN05aMldZbDlO?=
 =?utf-8?B?ZCtITGN5RDA2RU0yVjh3TEJaUE1uN2JQcFZ4NjZFeEtsRzByT2FhbEtwYTV0?=
 =?utf-8?B?ZVRwdjk3R010Z3pkS1JodVI5T3VRckZOaXFoZmFTSmhNQmpIYXJaY29hekpn?=
 =?utf-8?B?dGw0VmhEWUV4L2JyVFM0RjNIUnNpa0Z2VTVJWkpZOU12V1NGT0dVR2NpRTJz?=
 =?utf-8?B?bUswbkZJaGZZeXJyMUZTRlcvUTIyeDlEOVN1b29DOUpCTEZwM25sb0hheUhz?=
 =?utf-8?B?Zjl1ZWM2eTlkYXFEdkdOYkM3SlpiM24yUkJON2tXYlRITGpUZXVGV3lZTUVY?=
 =?utf-8?B?aGVoQmU5Nkk2VEZvVjdwR3p2V2YrN3duc3EybEZBdlV6TkYrYk5ZY29icUpu?=
 =?utf-8?B?bThHYytsVCtnTCsyNUk4SENsdlY4SmE1QVlDeFpiOStqdVMwZFdZanoxeEJY?=
 =?utf-8?B?UFVoRlFycnRHZVJiWWpsVFRGcjk2UTlqaGdmQ3RwVmFnemNQMi9Rcmd3dWR6?=
 =?utf-8?Q?nEE9hYYTZFUSdBCnhCAWFlw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1146f9-6b1e-4ead-5a54-08dd6c1d45dc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 04:18:55.4517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xun5DmFj6D5QTLor5DtdBXBxdQ6MSp0X0Sex6oyq6BlC6oUUJwBNJEONLfSHkzjUcVIBRHN/slsVoX7bR/JNzllQiD525PH0OF9PYJzp2Su5rVlD2srO0af62bQW0S+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

Hi Chaitanya,

Thanks for the review. Please find comment inline

On 25-03-2025 15:09, Borah, Chaitanya Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Monday, March 24, 2025 9:43 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
>>
>> Add a new subtest to verify async flips does not cause PSR exit.
>> Enable PSR and execute async flips to verify system remains in PSR mode after
>> async flips.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> da426f753..cf6b63b3e 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -85,6 +85,9 @@
>>    *
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend and resume
>> cycle
>> + *
>> + * SUBTEST: psr-async-flip
>> + * Description: Verify that async flips do not cause PSR exit
>>    */
>>
>>   #define CURSOR_POS 128
>> @@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page
>> flips.");
>>
>>   typedef struct {
>>   	int drm_fd;
>> +	int debugfs_fd;
>>   	uint32_t crtc_id;
>>   	uint32_t refresh_rate;
>>   	struct igt_fb bufs[NUM_FBS];
>> @@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data,
>> void (*test)(data_t *))
>>   	}
>>   }
>>
>> +static bool psr_wait_entry_if_enabled(data_t *data) {
>> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
>> +		      "enable_psr modparam doesn't allow PSR mode 1\n");
>> +
>> +	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data-
>>> output); }
>> +
>> +static void test_psr_async_flip(data_t *data) {
>> +	if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
>> data->output))
>> +		igt_skip("PSR mode 1 is not supported on this output\n");
>> +
>> +	psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
>> +	igt_display_commit(&data->display);
> 
> Why only PSR_MODE_1?

The intent of this subtest is to add basic PSR concurrent with Async 
flip tests. I will be adding other subtests to validate additional modes 
in follow-up patches. Please let me know if this approach is acceptable

Thanks,
Santhosh>
>> +
>> +	/* Confirm PSR entry before starting async flips */
>> +	igt_assert_f(psr_wait_entry_if_enabled(data),
>> +			 "PSR is not enabled before async flip test\n");
>> +
>> +	test_async_flip(data);
> 
> This will still do the performance check
> 
>          if (!data->alternate_sync_async) {
>                  fps = frame * 1000 / RUN_TIME;
>                  igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
>                               "FPS should be significantly higher than the refresh rate\n");
>          }
> 
> I think there is no harm in it but something to be aware of.
> 
Agreed ! But It would be good to have this to be consistent with other 
tests.

Thanks,
Santhosh> Regards
> 
> Chaitanya
> 
>> +
>> +	/* Confirm PSR is still active after async flips */
>> +	igt_assert_f(psr_wait_entry_if_enabled(data),
>> +			 "PSR is not enabled after async flip test\n"); }
>> +
>>   static data_t data;
>>
>>   igt_main
>> @@ -748,6 +779,7 @@ igt_main
>>
>>   	igt_fixture {
>>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>>   		kmstest_set_vt_graphics_mode();
>>   		igt_display_require(&data.display, data.drm_fd);
>>   		igt_display_require_output(&data.display);
>> @@ -896,6 +928,12 @@ igt_main
>>   		run_test(&data, test_async_flip);
>>   	}
>>
>> +	igt_describe("Verify that async flips do not cause PSR exit");
>> +	igt_subtest_with_dynamic("psr-async-flip") {
>> +		data.atomic_path = false;
>> +		run_test(&data, test_psr_async_flip);
>> +	}
>> +
>>   	igt_fixture {
>>   		for (i = 0; i < NUM_FBS; i++)
>>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
>> --
>> 2.34.1
> 

