Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2345AC27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 12:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB92A10E36B;
	Mon, 10 Jun 2024 12:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eposDWZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF5C10E36B
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718021140; x=1749557140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5uOVikyuwr+f+besEwN/3Lak7c2rs7rMSG+A26SytFY=;
 b=eposDWZWAMr/R3Vg0JyifuYhQKkMDcen3i8gWeJ6CJmaOEjkaXx2P2Ro
 Twi3QCEl/ytrKwMOKX6FuHpBDqRQ2lkzBM9TXPGMoGFB3MXJ9ehhnZfua
 7+3isK5Ap4gunO8UloBCLZ9bZsf0DbsM6e8Ai/DjS6mQbtpq9ykWLaxLB
 VRnKqJxmp2GdKYbkDkYCHb0FWBRx4LassqzStF+eXmcL3ralK2AdR08sB
 B4w7hvzbFO2yZBmafC2kOUlrzYLlzAWbcCNQelT1UvqZJAu9CV3Zxfgo0
 iUpHUTnaOcNaFEvuyvNZwaqeGKO8MhDv9cEsB2XScnRYG3R6NY588pYxv w==;
X-CSE-ConnectionGUID: QGVfqHXXS6OOpr6gNdItiQ==
X-CSE-MsgGUID: rtZ4YAbITZuQe32lbFe7VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14850012"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14850012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:05:39 -0700
X-CSE-ConnectionGUID: fx1G01hmQTOf7s+mTO9HUg==
X-CSE-MsgGUID: yJu9EoDeSCKvGfl5JslaJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="38961334"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 05:05:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 05:05:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 05:05:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 05:05:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI1s2e3y/6RepZIq4xWURk763wvX4yNYFwSfDQihNzKWpsRxpcNMIldY6vtuaM9SEJlVpgMZhQWdMx7tFuwX6dp6gJeWWrRA4Cftp8GwcDy38CbxxAXqgYfbqspdTwHITrgc6/V2AyH7WDa+UXrLh+iXrNVK670PsHRsWsRfri1IZrFB74hvF+T6C7DU/vNJzrPmeYcWqp5KsgBZNfFaERaxZu6mxnxPfi0VDXUWHzKkAIlB44xUVvnHeqJMGpTe0V9OQwFnLUndhVuHNmfOdIgkwoDZ+K3owfJLGLxSDhooAXTPm/16hPpmK9LFPx/ow6P2q8wCdJO1qyKxzQsefQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uOVikyuwr+f+besEwN/3Lak7c2rs7rMSG+A26SytFY=;
 b=QBKW0qjePv1jWkW6t8s0iJXR/R3yWJTOnh75ZgzNv/ZwuqSv5naRaEvDi3EYlc9dHBCyUelqY3/WPAg+gsYTn5hBHcDK7UaUdRhtDy8dDtbwCMDFnfoGT/IdpLgZhpPbx1Z6EE9xTxPv1blS9C7b8XoXe6cv/ng+OklFF6/TlxMLuRt/yXs7m02EE6tqaU7vosj0AKsOi1YXQ+SbIrkmx8Bz/Tz5KMndOgpowCF0SpYDOo4pw9mNCVl19Tt8yPHxnsQp1Umt3tPSYAv2AY83cupVCPkr6arRaGJDVCvJ/Q+ohQ1qtqLhHFQP5WW245tNjBdEhPKWuofCfDBHswz0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:05:36 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:05:36 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Cavitt, 
 Jonathan" <jonathan.cavitt@intel.com>
CC: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: Re: [PATCH i-g-t 2/4] lib/i915/fbc: add fbc frame size check helper
Thread-Topic: [PATCH i-g-t 2/4] lib/i915/fbc: add fbc frame size check helper
Thread-Index: AQHauOsZ3sqpNW6FUUGllXFgA6fq4bG8xJSAgAQmlYA=
Date: Mon, 10 Jun 2024 12:05:35 +0000
Message-ID: <68a3dac62e8845c69a82fbae0fea515e865524ce.camel@intel.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
 <20240607145732.285557-3-vinod.govindapillai@intel.com>
 <CH0PR11MB54444335CA4C7A68D324DE32E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54444335CA4C7A68D324DE32E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|PH8PR11MB6705:EE_
x-ms-office365-filtering-correlation-id: 3fb23905-9ccb-4679-1fa0-08dc8945a301
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Nk5Fd0JiZDgxVEh0TEo5TllVa21OVlVvNkJSR1M4aERrRytlQXQ2Mk5wSUZq?=
 =?utf-8?B?VUQ1NnYzK2dRck1sNWpRM1FGVjdwYk9YcW93VnZDYS8vTWthSjZGNEZzNmdC?=
 =?utf-8?B?bm0zdFpuZENhekhwUXVYMVFYbVBCOVFmV092V2I3VnU2cjYyRExWZzY0Mkp5?=
 =?utf-8?B?T09VeXd1eUd5WVJ4bHR4ZnJSeTF3dGNYVnhYUnoyZFJxNXdlcm9nNkR4ZXY2?=
 =?utf-8?B?QjRUTms4ZjJLQXF0OXZRZmpiWmx5MmRLRThac2crWXdLa0RrajJ2eStlQng2?=
 =?utf-8?B?N2pDbFVjcTdwUGUyVld3YW92SEExT2tzcWpXQ1E0TVRzMGNQMzcxRHhNUTcy?=
 =?utf-8?B?TVdheTlYQTI0aSttTVFObDJwTk85YjZDZ0RqNFptZlFnd1JDT1dURmh3RWlE?=
 =?utf-8?B?SGQzekxUdEhWVnNhSU9MKzZQN2ROcnRnYjNQU3c1VGdhbTBIdER6V1pTV2d0?=
 =?utf-8?B?RHZGL3A1WXowOUgwVFdFQ1ZWUndVM2xUMkNLTXZUcDBLUFFvclcxeUVVMXVY?=
 =?utf-8?B?akpmSi9IVEgrOWplMHFhYjRtdHFQYWE4Mnl1TFRPS0RmNXBRcEJjYVFJTXIx?=
 =?utf-8?B?bzhJK1o4QnpKY2xkVUh0bTZwYWhNUU9wanRVdUlraHdaWE5sQjFudGkvNTRF?=
 =?utf-8?B?M254ZkdaVVUzYTl4TUZRVkl2YjI0eFg1bmJQT0Fub1FQRUQzbndKYW1VM210?=
 =?utf-8?B?UjZhQ0xVdE91SW1iQVEzMHg2bnppV0Rwd1BUYWxVYkhlZDY3NTRyMGNzWmdE?=
 =?utf-8?B?ZnRhd0JuRmhuOCtESkU3bCtuWnJTTHQ1bHlEQW1YOXZxS28vWnhLU3QzNlY0?=
 =?utf-8?B?c2dNZHNVSjJGTC9uajhYZWIrV0g2UHp5NmtEbDZZa1VsN08yTWM4V2tUNnBE?=
 =?utf-8?B?MmczaHZtWjRieHUzalBjVmp3RFpndVVsd1ZwNGJkNmtZZ2Rqa3owQjJ5RFpN?=
 =?utf-8?B?OUdmTVE5R3M3Rk5zK2d4TGlvNmtSYXRSNTZ2SGZROEhEald3Sk1QZ3hWamFp?=
 =?utf-8?B?dGpkcVBKT1ZyZDMvYXpMTXVIVW04WldaVk9Md3QwbGlTTVNLV2RULzU3NWYr?=
 =?utf-8?B?NU9IVCtsN3pvWVpvdVpLZnZKN29JSksxWS85UUZmSDZ3S0JyL3dTVlhMZ2NO?=
 =?utf-8?B?MnZjeFFnOWZMaGpKQllXV2VwL2hGMzc1QURJeTduYU9EM21oOURieENBaUlB?=
 =?utf-8?B?NkttaXAzOG5TZkJ0ZThQSWFPMUJmUVIzbENrRmQxeUJYc2p6WUVGeW1iQzNs?=
 =?utf-8?B?SFFFemhGRXdNRTJqRnNkcWVtQ2kxcWF4Ukt6SXN0ajRtY1hzWndBdy9hY0M4?=
 =?utf-8?B?ZFhIeHZXUmozMzVaT0pmd01GeEtUQ3dBaElwZ1hyM0hKZjR3TWVvVk9oYlRR?=
 =?utf-8?B?bDA5aHk4WkQyUGllVTBxU0NhbmpOUXMxdDBSbDdUSGtqek9peDlUeHJkSTJ0?=
 =?utf-8?B?SjZ3QTh1NEc1SlhjMjNNMmpDUDIwNHhPblhZQmRVVVBYZ1pKM0YrUGdpOU9o?=
 =?utf-8?B?aEFUWVM3dWhBaEc2d0RHQ3pYb25TR1g5VlRjZDRFcjhjZk9WOFZadWpycDgv?=
 =?utf-8?B?Q3pEUktCaUxUN2xsUXZBWnNIUy9rK1F2L3Q5TFRUMXc0Rzc1Ykl5OFFRdkVJ?=
 =?utf-8?B?NG13NUJNWXZLcFRUZHRRODhNS2JKa0FvMHRodFZTUDNuUTduWld1Mi9zZGhK?=
 =?utf-8?B?ZnN5SXRYeld0cW5FcHVWQUdJV3AvRDljczRpTnZyR3l5ajAvTVlCdXhqSkRK?=
 =?utf-8?B?SDdxVmROMFovak5RVWgvejNkZTBLdkp0OEZzQjQ1MkZ2ak1vUTZIakVIS1ZU?=
 =?utf-8?Q?PXnGCDudyAis7Zm4lJR7aTso7zj09l99HB+ks=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUtpalI5M1AzNHVkQkc5b25EbmZpUTlGR1ZaSmx3Smp1T1ZLa1NQSk5vaFVr?=
 =?utf-8?B?a1RvSmdBc0pJbVhVUEMvUWt4RHhnL2pjRzBOcnR0SXlxZ2hKWStkWWM4VGc5?=
 =?utf-8?B?WklSUXJHS1JtMnNsMVBhdjQvL0x4NWhzMVJmNzQ0VUJWN3NyYXd1MDZzOFdM?=
 =?utf-8?B?ZTVHMnFxcHoveWxHZEFBRzczbmpJRW4vZklwUjUvTXFkZkI1Z3I4Y3RZRFp5?=
 =?utf-8?B?Mzd4RTVsZHc4aFRPa0hIN1lmQTg4Y0RVVWhPdjlJakgveFQ3b3g4bGlJb2dj?=
 =?utf-8?B?K0NwUjZFa3hXKzNCa1lUOWNwNGpTbmVIZ0ZUUFh5dDE0SURsSmlRbXRyOHBr?=
 =?utf-8?B?bDQxYTVSakZrSVA1Wi9idlE4bC9oYUprN2tkQSt0emhncG81UmdoUTdDMVhk?=
 =?utf-8?B?SzlXbTI3TWlweXNKR2tVaDU0MUJuL1NUcjd4bGUwTkd3SGZXR3AwUHpzUEdO?=
 =?utf-8?B?eVozdTR4bnhoR0xnU0ZaWnRhbUhWOUw2Z2ZtUHJUVGhiMG9GZkFCeFd5QlEw?=
 =?utf-8?B?djZBOTFDMlFRcWV5bkF0ZFlmN2p6SWpvYWl6MjJQYkQ1SGZ6S3RJSytWZDU2?=
 =?utf-8?B?L1AwRGREWTAzY2xwbVFvUXdpeFVsOVV0UXhhMWFGMnRkMDhjd0xNZGEyQnRy?=
 =?utf-8?B?aDR1UWZNWjRMQUttd3NPZE96YmZ5OHJya2xPc25HUUNxUTl1eTZQYlJqdmJq?=
 =?utf-8?B?OXluTDR2amRtNmJwcDk3ck5WclZMS3FtcG40bGl2aDVMRlBoam1OY3BKZXF6?=
 =?utf-8?B?SER0bCthNXNiTlBtMnVoWWYveHpOTXQ3UEVGUDR3MFUvNWxKRitXRjJURGJX?=
 =?utf-8?B?aVZuMzFEVURDRlpVYlJrL0xjZ2g4dXk5anViL1grdEtLVmhmRmJleUhVM2pv?=
 =?utf-8?B?YUVYdmZIN3BiK2pRdzR3aDYvWkJ2QU92N21vOVdQV1BxL1FBMGhrOWtkZDZs?=
 =?utf-8?B?RmZ2anRHbzZQKzJHZXBzOCtFYXUrUXRtb0hNcndQRXplR2F4b0hBVzlvSjM1?=
 =?utf-8?B?WW40ZHJpakZtOVhOenF3cmZkU05lUm1YbTRVRzhwbzlOeUxQVHpnWG5mZTdJ?=
 =?utf-8?B?L3I1dSswSUp2azhpN3BzNjZwekNHeG1GdnpiSExxa2N5MWk3S0NRcjJIdzdK?=
 =?utf-8?B?b0NsY0huSkhmZk5IeWk5YVYxWXcwUENSMWhxUjRNdi9UbE5JbjVQeTQ4bjMw?=
 =?utf-8?B?Yit3S2tlcldMdG5VUkVPTTg5MjhldnRlMlp4eHRtVVFiTzNDcmx1QWc4UXJC?=
 =?utf-8?B?aUVlWHJKQ2dtMkZXVk1zV0xaeFhGR3lGMncrbXp3SURvOTQ5MEVxZFNNbnd6?=
 =?utf-8?B?RmFIQTlaNDhQTG5JVDR1K0pyNEw5dDF5SFQ0V01BQWNRbEFHVGh5ME55ZUhN?=
 =?utf-8?B?NXdhYjdqWEgzejY4ZmZER2Q0dkhjb245eFZEM1c5bHNMbWI3TkczbldCV3JW?=
 =?utf-8?B?OUU3ektWckNjSExiYkF5elp6VGllbEpxbE1CRXNNUmZzSGFVT0VIc0JJeGFO?=
 =?utf-8?B?Nk9kM2dqYUIvaGZsZFlMUHk2TCs3b2xJNjVyL29vY09yaE1nSkR5V3JDR3Zq?=
 =?utf-8?B?Z2RCaHB2aFZsZ09vYnJjOFo4eTg5SHIxSFJzMzNkek56YmhkeHNxbVlyWHd4?=
 =?utf-8?B?aTFQcHBjVnNYQXYxZ2pXN3pPRTM5ZFJmMlBoMGpVc0s3d0JRMGpia0N2bzRJ?=
 =?utf-8?B?NlpJcUFpVDhWQm84Z3FObmdnL3VLaUpQM2tYc3Nsam1qdXdxaENtaGxrS0N2?=
 =?utf-8?B?QWlBV0ZBeUEwS1NmM0JxL3ZxSFlnWG10K1d4RlUwTTNXdjgxcXRsUHd0TGMy?=
 =?utf-8?B?Vkc1U2cvQUtkelY5ei8xKzlLdTFMLzRvZVE4UXVZRG5BNWlrWTFiczRTMmxG?=
 =?utf-8?B?VzNkVVJUY1lPTmxuL2VFaU83bllSTXRoY2V2OGNTT0VNSXg4ZnNYY2huNjdJ?=
 =?utf-8?B?VS8vY1dLK1Z6QTVpQXh5aVIxUmowcEpqektMV1c1WXNIdlJ5bUJGWUFYb0l1?=
 =?utf-8?B?Qmw2WjVaV2tjNW9RMHpSVUs1UU5maUlQUlpXS0FUTnpBaXNteHRSUXNLVWFG?=
 =?utf-8?B?L3lhSUQrY0h4MnFkL2ZUbGVjSGRQM0hWeGdlYlM1bzJoa0ZFKytjcmJZYUlC?=
 =?utf-8?B?c3d6dkhvTHpDQVMvMlp6ZXA5dEhra2VuTFE0MjdKaW95cC8rcVVUT2JTd1hU?=
 =?utf-8?Q?kfaVnxQ/GmDTTTi5Ka42t5o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C00F8810129B7F4481A76910E8BDADDA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb23905-9ccb-4679-1fa0-08dc8945a301
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 12:05:35.9971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5U6hOT5Dc/H92dMnuIoP+2l+gY6vUIHLUvB5SWsyhPwnCol00Ku09tbiKFfPnGfjPuNG3y9w+GVE+r+2Ihy7YHV4tp+GLojporCXBF+s0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
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

T24gRnJpLCAyMDI0LTA2LTA3IGF0IDIwOjQyICswMDAwLCBDYXZpdHQsIEpvbmF0aGFuIHdyb3Rl
Og0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlub2QgR292aW5k
YXBpbGxhaQ0KPiBTZW50OiBGcmlkYXksIEp1bmUgNywgMjAyNCA3OjU4IEFNDQo+IFRvOiBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR292aW5kYXBpbGxhaSwgVmlub2QgPHZp
bm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPjsgSGVpa2tpbGEsIEp1aGEtcGVra2ENCj4gPGp1
aGEtcGVra2EuaGVpa2tpbGFAaW50ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAyLzRdIGxpYi9pOTE1L2Zi
YzogYWRkIGZiYyBmcmFtZSBzaXplIGNoZWNrIGhlbHBlcg0KPiA+IA0KPiA+IEFkZCBhIGhlbHBl
ciBmdW5jdGlvbiB0byBjaGVjayBtYXhpbXVtIHBsYW5lIHNpemUgZmJjIGNhbiBiZQ0KPiA+IHN1
cHBvcnRlZCBpbiBhIGRpc3BsYXkgdmVyc2lvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBW
aW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiDCoGxpYi9pOTE1L2ludGVsX2ZiYy5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gwqBsaWIvaTkxNS9pbnRlbF9mYmMuaCB8wqAgMSArDQo+ID4g
wqAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvbGliL2k5MTUvaW50ZWxfZmJjLmMgYi9saWIvaTkxNS9pbnRlbF9mYmMuYw0KPiA+IGluZGV4
IDA3ZWQ3ZjQ2OS4uOTkyZTljNGRlIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pOTE1L2ludGVsX2Zi
Yy5jDQo+ID4gKysrIGIvbGliL2k5MTUvaW50ZWxfZmJjLmMNCj4gPiBAQCAtOTksMyArOTksMzkg
QEAgYm9vbCBpbnRlbF9mYmNfd2FpdF91bnRpbF9lbmFibGVkKGludCBkZXZpY2UsIGVudW0gcGlw
ZSBwaXBlKQ0KPiA+IMKgDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlbmFibGVkOw0KPiA+
IMKgfQ0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIGludGVsX2ZiY19wbGFuZV9zaXplX3N1cHBv
cnRlZA0KPiA+ICsgKg0KPiA+ICsgKiBAZmQ6IGZkIG9mIHRoZSBkZXZpY2UNCj4gPiArICogQHdp
ZHRoOiB3aWR0aCBvZiB0aGUgcGxhbmUNCj4gPiArICogQGhlaWdodDogaGVpZ2h0IG9mIHRoZSBw
bGFuZQ0KPiA+ICsgKg0KPiA+ICsgKiBDaGVja3MgaWYgdGhlIHBsYW5lIHNpemUgc3VwcG9ydGVk
IGZvciBGQkMNCj4gPiArICoNCj4gPiArICogUmV0dXJuczoNCj4gPiArICogdHJ1ZSBpZiBwbGFu
ZSBzaXplIGlzIHdpdGhpbiB0aGUgcmFuZ2UgYXMgcGVyIHRoZSBGQkMgc3VwcG9ydGVkIHNpemUg
cmVzdHJpY3Rpb25zIHBlcg0KPiA+IHBsYXRmb3JtDQo+ID4gKyAqLw0KPiA+ICtib29sIGludGVs
X2ZiY19wbGFuZV9zaXplX3N1cHBvcnRlZChpbnQgZmQsIHVpbnQzMl90IHdpZHRoLCB1aW50MzJf
dCBoZWlnaHQpDQo+ID4gK3sNCj4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCB1aW50MzJfdCBkZXZf
aWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGZkKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBz
dHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gKmluZm8gPSBpbnRlbF9nZXRfZGV2aWNlX2luZm8oZGV2
X2lkKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgdmVyID0gaW5mby0+Z3JhcGhpY3NfdmVyOw0K
PiA+ICvCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBtYXhfdywgbWF4X2g7DQo+ID4gKw0KPiA+
ICvCoMKgwqDCoMKgwqDCoGlmICh2ZXIgPj0gMTApIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbWF4X3cgPSA1MTIwOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBtYXhfaCA9IDQwOTY7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfSBlbHNlIGlmICh2ZXIgPj0g
OCB8fCBJU19IQVNXRUxMKGZkKSkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBtYXhfdyA9IDQwOTY7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1heF9o
ID0gNDA5NjsNCj4gPiArwqDCoMKgwqDCoMKgwqB9IGVsc2UgaWYgKElTX0c0WChmZCkgfHwgdmVy
ID49IDUpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWF4X3cgPSA0MDk2
Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtYXhfaCA9IDIwNDg7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgfSBlbHNlIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbWF4X3cgPSAyMDQ4Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtYXhf
aCA9IDE1MzY7DQo+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKg
wqByZXR1cm4gd2lkdGggPD0gbWF4X3cgJiYgaGVpZ2h0IDw9IG1heF9oOw0KPiA+ICt9DQo+IA0K
PiBJdCBtaWdodCBhbHNvIGJlIGhlbHBmdWwgdG8gaGF2ZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIHRo
YXQgcmV0dXJucyB0aGUgbWF4IGZjYg0KPiBwbGFuZSBzaXplIHN1cHBvcnRlZCBhcyBhIHJhdyB2
YWx1ZSBpbiBjYXNlIGFueSB0ZXN0cyB3YW50ZWQgdG8gb3BlcmF0ZSBvbiB0aGUNCj4gZnVsbCBm
Y2IgcGxhbmUuwqAgU2F5Og0KPiANCj4gaW50IGludGVsX2ZiY19tYXhfcGxhbmVfc2l6ZShpbnQg
ZGV2aWNlLCB1aW50MzJfdCAqd2lkdGgsIHVpbnQzMl90ICpoZWlnaHQpDQo+IA0KPiBUaGlzIGNv
dWxkIHN0b3JlIHRoZSB3aWR0aCBhbmQgaGVpZ2h0IGdlbmVyYXRlZCBhYm92ZSBhbmQgYmUgdXNl
ZCBhcyBhIGhlbHBlcg0KPiBmdW5jdGlvbiBmb3IgaW50ZWxfZmJjX3BsYW5lX3NpemVfc3VwcG9y
dGVkLsKgIEkgYWxzbyBkb24ndCBrbm93IGlmIGZjYiBjb3VsZCBiZQ0KPiB1bnN1cHBvcnRlZCBh
dCBzb21lIHBvaW50LCBidXQgdGhlIGludCByZXR1cm4gdmFsdWUgY291bGQgYmUgdXNlZCBmb3Ig
YW55IGVycm9ycy4NCg0KVGhhbmtzIGZvciB0aGUgZ29vZCBzdWdnZXN0aW9uISBJIGhhdmUgbm93
IHVwZGF0ZWQgdGhlIHBhdGNoIHNlcmllcy4gVGhlcmUgd2FzIGEgYnVpbGQgaXNzdWUgYXMgd2Vs
bA0KcmVsYXRlZCB0byBhbm90aGVyIHBhdGNoIGluIHRoZSBwcmV2IHNlcmllcy4NCg0KSSBjYW50
IHRoaW5rIG9mIGEgZXJyb3IgY2FzZSB3aGVuIHRoZSBzaXplIGNoZWNrIGlzIHBlcmZvcm1lZCEg
U28gcmlnaHQgbm93IG5vdCByZXR1cm5pbmcgYW55IGVycm9yDQpjb2RlISBBbnkgRkJDIHN1cHBv
cnQgcmVsYXRlZCBlcnJvciBzY2VuYXJpbyBzaG91bGQgYmUgaGFuZGxlZCBvdXRzaWRlIG9mIHRo
aXMgc2l6ZSBjaGVjayBJIHRoaW5rLg0KDQpCUg0KVmlub2QNCj4gDQo+IFRoaXMgaXMganVzdCBz
b21ldGhpbmcgdG8gY29uc2lkZXIuwqAgSSB3b24ndCBibG9jayBvbiBpdDoNCj4gUmV2aWV3ZWQt
Ynk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gLUpvbmF0
aGFuIENhdml0dA0KPiANCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pOTE1L2ludGVsX2ZiYy5o
IGIvbGliL2k5MTUvaW50ZWxfZmJjLmgNCj4gPiBpbmRleCA5OTVkYzdmMWUuLmYwNWIzNTFmNiAx
MDA2NDQNCj4gPiAtLS0gYS9saWIvaTkxNS9pbnRlbF9mYmMuaA0KPiA+ICsrKyBiL2xpYi9pOTE1
L2ludGVsX2ZiYy5oDQo+ID4gQEAgLTE0LDUgKzE0LDYgQEANCj4gPiDCoGJvb2wgaW50ZWxfZmJj
X3N1cHBvcnRlZF9vbl9jaGlwc2V0KGludCBkZXZpY2UsIGVudW0gcGlwZSBwaXBlKTsNCj4gPiDC
oGJvb2wgaW50ZWxfZmJjX3dhaXRfdW50aWxfZW5hYmxlZChpbnQgZGV2aWNlLCBlbnVtIHBpcGUg
cGlwZSk7DQo+ID4gwqBib29sIGludGVsX2ZiY19pc19lbmFibGVkKGludCBkZXZpY2UsIGVudW0g
cGlwZSBwaXBlLCBpbnQgbG9nX2xldmVsKTsNCj4gPiArYm9vbCBpbnRlbF9mYmNfcGxhbmVfc2l6
ZV9zdXBwb3J0ZWQoaW50IGRldmljZSwgdWludDMyX3Qgd2lkdGgsIHVpbnQzMl90IGhlaWdodCk7
DQo+ID4gwqANCj4gPiDCoCNlbmRpZg0KPiA+IC0tIA0KPiA+IDIuMzQuMQ0KPiA+IA0KPiA+IA0K
DQo=
