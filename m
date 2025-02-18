Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB62C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 14:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3730B10E0A3;
	Tue, 18 Feb 2025 14:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPqtqo/x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1EE10E0A3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739889293; x=1771425293;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4dt9zG4PlN0bEjWvNWcxJTDtvhCK9Ily4NjCl8R6xks=;
 b=EPqtqo/xSOyEYUvJ3jHqdTgEtR1QALcpP+OswhUowo1yTnrANS3rEBVR
 1CTMcekIplAEy7EBGham7NmrxrnJW7dcBJZKhViNvRnUXb8RdgsqA5hDv
 Fixi+/C7SQwoevovEibaYhtNoYjvJ6Ht/+gBinK+owBXFbzs9yqrZKyb/
 s+nBOaJFbo7KaSETOpk4BwaZZnArH5p/LVpJXVzYmt8iUbloTMH5aaeMe
 Zeb5F1EXPpMe9wKNIQEqLhg2LTaVkKR0Rc6dzlSk7EW2Cz4cbCZqY/GVp
 uQX9mWhi7FpJL8pKkYpEQVW1kjJAJz+Jk5RvkvhhpDDlXvQl1poNKIN+y Q==;
X-CSE-ConnectionGUID: hTWllnSYSbikX4++YG9IvA==
X-CSE-MsgGUID: Ei4zsPZ5RPSUUkJxmwekJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51993505"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="51993505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 06:34:53 -0800
X-CSE-ConnectionGUID: NNH3fd3dQOqLqB3Xw3iQOA==
X-CSE-MsgGUID: wBEFJPKbQqG7kVIfhUx4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="145265947"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 06:34:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 06:34:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 06:34:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 06:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkOTCHH3g8CAtLUf1gUrX89jc6E33kIOTYygFimyLi8u7e/KU6hjyXPoZdDI5ob7RfVjZE8XRcMMOfXvt70z86dYAAPhCDmuUfBinYUzYgpqCVhtIsxsx6FX6o9KA01kXdr4wQrdREmJ/zmnNwX8paOGTziacuBVJPzpN3vG0F2UOMSMGotZVX569RuyxozUtzKMPkBsGxqm/7IfTSPAw/u9+vl1vaoDaMG9Mk6vNoF6dIIN0rIuissbspr4FNgpVlckFyfFACKUm6htQOGsiy7gWs2twElEdsKuoYOKgeoq0CdFbRGZaGBpDgRK0NJHIFnDl/UDUd3MXNwWADSjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dt9zG4PlN0bEjWvNWcxJTDtvhCK9Ily4NjCl8R6xks=;
 b=ndP3ry3W1T2+TcmJoNzmAtvOW2BX7M8zhC6toTSkzNyXs3bNBcbsrw1bnGCtwQKqY0v14EomxYmXdQYtIu3XqQyMQaEett4MbfDdEKpEaGII8H8ojG25c7BI/w2vaoHaO2om4GFDurRE7aRKCK3DoYiPTZAjh4V/AoW8n/bNTWiMxtLPgQh13QRYAfCz9YKzW2eZri0RvyeTAYJ8LabdHgRyCc11V6705CtyUowlabfM2MuOQdUbU9irzqZKP5XtkYGzExBYQS8bYcUJVXO25LPRus2ZFSPWr+bcnqTD1JYPx1HaJIq/qkmZlCjOUvClJ8f9TLb3hvoYZsd9Dtj2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 14:34:46 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:34:46 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_odd_pan: Add test to validate odd
 panning
Thread-Topic: [PATCH i-g-t] tests/intel/kms_odd_pan: Add test to validate odd
 panning
Thread-Index: AQHbgU9BvEcEDmwIlU60Zj/bsb1gRbNMop+AgAB+1cA=
Date: Tue, 18 Feb 2025 14:34:45 +0000
Message-ID: <IA1PR11MB6467283BBA9716AF953D4F07E3FA2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250217151444.2019299-1-nemesa.garg@intel.com>
 <fb071eb9-fc2a-4bfc-ac5f-d2aad2c0e2b3@intel.com>
In-Reply-To: <fb071eb9-fc2a-4bfc-ac5f-d2aad2c0e2b3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SA2PR11MB4828:EE_
x-ms-office365-filtering-correlation-id: 45f3ff8f-a408-4805-3733-08dd50296427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dWZocTQyUExFWHdXRk9PQUpWdlV5TlFITzVkdzVldXJ6QW5QVEhxZnJOeTFi?=
 =?utf-8?B?bm1CSFd6MURpc0FJbWNMQ3R1dUNmdUhZNnFwcWFQVmxFcEsvOCtteFk1a2V1?=
 =?utf-8?B?U1BvM2hQRTRKamVXeTAxLzB2R3VTdGFyOUFGVnZNd2FGUW9sdUhsdWR1L1R0?=
 =?utf-8?B?czlGVUtKVEc2UmMreUQ5b3JleWk5ekRlYUNvOGtWR3MxamtGWFZnNWp3MmVY?=
 =?utf-8?B?Q1FkYVpOMEpvci81N2dHdzN5dXhieFVORy92b0l2djNWcDkvZE9mQmRuTWtW?=
 =?utf-8?B?Zmh2VkRoZWp3WHNGS3Z0ZEh4TmRVNnJkTk5ueWhlS2lQTG4yMUFCTFRITkE3?=
 =?utf-8?B?bFFlODVCenVYU0VJd3FWSm51bXFxcVBSeGVPSGJORnI5YWdxWE1wUDVVMkds?=
 =?utf-8?B?V2Y1d3JmUzZxaGRLYUxFN1drQ0U4a3RsaTY2amRHL3Vjc0FTS1pPUVZ6V0ZM?=
 =?utf-8?B?NHRlZnlyRXd2VmwzbDZ0eUdsSVVKTThsaXlidElvNyt3U2hUaXdEQmdLRTd2?=
 =?utf-8?B?QmVtb2hLUURTUDAxMjdFZWFQM0w3QTN2ampFNVhlTkNvY0QxZkNRSzZYcE53?=
 =?utf-8?B?a1NBNkptSFJtbTByRXNRb3pzQWNreXcvMHprbVJkMTNTNFZNdDY2Vk9RNzk4?=
 =?utf-8?B?RTVnQjhLSHBRblJpc0c4NWVrYm41NlRwaHZCZU5VSUpXWkFBOTU0UXhMT2h3?=
 =?utf-8?B?T2NrSDUybkZyV1VxdU82ajZMb0k2QmJOTG5hV3RyMTFiTHpQMkNPdFQzUmU4?=
 =?utf-8?B?WXR3NUpjWkZSQWMwQnprTjhnVnlmRk9hNnRRTC8xbEdOSkNodnlWK1pRbjdR?=
 =?utf-8?B?RFZxWDhhYTBnVGdIYks3bG5JY0ltMXF1T2YxcWJCVVhwTmpTSTdhc2dZdVFN?=
 =?utf-8?B?eGlncDlpaytXWEdqNm9WMzJSWU53eENrb3B0eURTbmtmL2FYL3gxckg0TDdj?=
 =?utf-8?B?bzdQYW1iZGpEdWxObWtlVklpeHYxQWtOUVFtNCtPWWJVVXFoR1E4UEpYY1RZ?=
 =?utf-8?B?K1VveXNWS244emZrYk1lMTkyd3BXc1VOM1F6Q2xJL2Jib2NVTHVkM0l4UmxH?=
 =?utf-8?B?ZXpJdVAzQmZhU0JEV294Nkx5aFIzZ0U5Rnh2SUp2OXRwOU5rdEhrNW9KMFRC?=
 =?utf-8?B?MjRHMHdsZ3JrbUpCcFJ2cSsyZFo2REQxblQ4OE95R1pucnJWRlBxOXpUOUo0?=
 =?utf-8?B?dWFTMkgzWUs5VHZxbDlOTVl5ZjF2dXhRSkp5YWtDUE9XR0dVS2xuanZPR0pP?=
 =?utf-8?B?LzdzcWVGUE5Jc0lnV3FUWm5GbXBMQzVESXZxOTczUDFIejRvOENNdHJEOEtx?=
 =?utf-8?B?V2ZyU0FpZU1iQkZxNEUzWXZrOFZULzB0WG5Qclp0V3Z6V3ZaVVE2QWxML0Zp?=
 =?utf-8?B?U20rbU1CaFJ0RmY3WGpDTkJzc082NmZUMHdjWDMwdTBJQW9YV01RWHN2MDZS?=
 =?utf-8?B?RGVZV25zbjdOUlNzWEdsUGZrZC93UDRmZmgyd3J3R3g0MWs0NG1sR2lxVzNo?=
 =?utf-8?B?NkE5czUrNTNzOVc0aGZnc2E3ajBKZzUxUFVDZ1hjakJobzBqVXNuNVNHSFE1?=
 =?utf-8?B?OGlyM3JKbldkSnFnUVQ0ai9Xb3BuQVdDVGxzQWtsNEo4T1BySXg1TWVpb2Q5?=
 =?utf-8?B?eFQzbE1zOU5uZG1YUHpSN0t4bURuQ1YxQlVVNDlTWUIxbDlWdDZXWnU4WjdR?=
 =?utf-8?B?MUJVQUlacXk2YnNMOGQzU0p0M0liaDJIZnYvZ0FnYVFpUHhuaHluOFR3cTR6?=
 =?utf-8?B?MjFoWjl5enAxemZPa0xPeWJ5Y3BuNTlCSW9ScUlsa1RMZU1MMXRwOU4waTMv?=
 =?utf-8?B?cVhrcCtFeEZ3eXpVaTU2d003WVA0VnkwMUpwclk1WC9kMzN2L2k5TWdFYlR2?=
 =?utf-8?B?OU5vVGZCL3FJK25ZSk4wWE01RG9FMDA5Y2JBbXNsSEpwMUJlVWdCTVhYU3Jh?=
 =?utf-8?Q?DMg6lhJaP/LESrUiKHiZfdR9O1r5y0r4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnRnV1FnTEp4Y1prR3BKSzg0SHlJelZoU2FpQWFwaTY2TmRpNnlySVBKZUtv?=
 =?utf-8?B?T3JLemwxZ25acTZXc1FFKzZWT2V5c3lXVWZPYmo2REhweTRLSDF2OHNtTDI4?=
 =?utf-8?B?WGlmeXM5TC9XU1Frc1RBN0JzZngyc2dOQmtZNDJSYlJ0bkFkUTZJbTVLbGho?=
 =?utf-8?B?QlU4cEJjVlpmUXVGZUdITnppSjdHc2ZIZHMwSlRoV05ldUdvK2hJSk5wZ0R0?=
 =?utf-8?B?T2VFVzZzRUZCYUhtS1V1dWd2MW5xQ1ovVVVHM3MrdUJiMFh6SCtteGd5Tmhs?=
 =?utf-8?B?d3Z1cTU0cUVYN0tJZG1QZ1JjS1NRUnI2TzN1ODhKV3lkTDZZeHYrT01mS3ZO?=
 =?utf-8?B?YllTb0p6V3UxOHRPZi9GOUI3RWR2Mi9FOFhnbjVrcUNucjZabUR3U3BRM3Fo?=
 =?utf-8?B?bE43VkVnVFVhaTNWQzhoNU9nRUhTZXhuS3hCUUtLbnY0NGxWMUExK2diZWJK?=
 =?utf-8?B?aU9vM2JQV29odTRIQllHWGZyZlV3a0prUzViRWlJaUpJWVpJMmF1MFNiNkpP?=
 =?utf-8?B?OUNnSUo3dmZiMWxhUTZ4TWt3RHpHdGpPNkExd2pIVElSbE9HeHg1ZCtTTEdn?=
 =?utf-8?B?dDMrNEJtZXNHWFE2UjUzZkNTaFhHazhKQ2N5bm1zTWxYKzRmdnB1dklTYXVm?=
 =?utf-8?B?VU1SUkRwZWNSYnVaZGVzVWZnOUEvVzBOWEF0TGNNaUhKVlRqU0VSZ0IwMVha?=
 =?utf-8?B?cUUyZHdPT0x2b0dQb21jc01ITktrSTlNenZoVEZtTHdFWFpZeFI0aDNnYXhM?=
 =?utf-8?B?ZWxaUkc1ZDlEcWFXWHB1ZTc5cFd2Z1ppYndiMWM0Y2JIMGNNUFRiM0NQdHVG?=
 =?utf-8?B?eVM2b0x5dkROTjU4Q1VqWDJScGxlejlUc0ZNZDBmY3BLZkN3em9yWm9Jc1p4?=
 =?utf-8?B?akNnbXh3cWpZOWxsa0ROb2c4bFZ5bDViaEU4YmZId1BpcXpid0JXTWxaRlFi?=
 =?utf-8?B?WVJidytqdnVjNHRaajVRRnlJakVIbXN2d2N1NUF5ZGVsSWxqSXJ1QmVOYnhz?=
 =?utf-8?B?Q3UxUWdwZ2dJc294Wi92TnBtSmViWTNTbnJXM09BdVhEKzFuVXUvVTVHR3BY?=
 =?utf-8?B?OGZuV3BrY1dVNlVxWjNEalBYL0w0b29ORkhuRlpEREJicDlheGNnQWlYc00x?=
 =?utf-8?B?aUlIWkFDcGRJTkxaSnZzdEJMS1gxQjdXd0hKK3MyTUlTdGN4cGhVNTdUWE9S?=
 =?utf-8?B?ZHlTSjFvRUxzWmRreFZ3NnhPelNFbDZyczcxV3BvVjVZckRUelFLS3Q4d2tV?=
 =?utf-8?B?ck1Qb0xMa0h6bTlnMFJDUzBScnQrVGZ5QXAwZW9XcTlzaEZEejJJeisvQU56?=
 =?utf-8?B?MGVObHJZc3RITE1NaGgwNnB4SDMzRXdsL3VTbEl3L2w2aGJhTlhnT0cxM1Fv?=
 =?utf-8?B?dkwrZDJpaE1pOE5PY1g4M2h4N2s5blNLcDlzOUFuVXQ3SlR6LzNxb3FXZWZV?=
 =?utf-8?B?ZEhjS0RjY3VkUXVOSFpXTjZuaVRiNlNXWDZTdmVITVlNQlRUQm1FZCs3Tkwy?=
 =?utf-8?B?blZvdGtwZHpUb1ZrcUh6SkVvaGhGUVdxQ2ZWYk1sNWZoWkpWSjdOOWluOWF4?=
 =?utf-8?B?QU1XSTJHUjFTbDk1SmJvdzdud1BsRXRaSDdKL1NNOExYR0tjNW4rbUp3R0h2?=
 =?utf-8?B?bFBNdlI1Rmw4TkpieTZhelYydlFmZ2pYWTlGUmJRcTNnSzc3SlUydS9BalJt?=
 =?utf-8?B?aEpaZVI0K1FZMHMvUm5Nenpia1Z0R0NzOWd4NGVFSS91SVlEam4rRGJER2Za?=
 =?utf-8?B?Ry9tQXN3MDBiVTgwQUVmUWZRMkNUYS94aXhmTDZhUFRJVEtBclduUzNEY1NN?=
 =?utf-8?B?UEc5WWUrRWM5YURVRWNZaWhoWVV6UkpjN2tGTkRYeEtUbS9vYzVOZk5Eem14?=
 =?utf-8?B?VHlWMXRUYTN2eElpVjlHc3dGSERYanI5Y25FY1YwWnlITFU3Zjk3ZVI0clFn?=
 =?utf-8?B?aDZUSDg0ZG5vYXNWSHRYNGUwbSs3SkhMa2RWSU82UnB5RXdLMUxraXV6OG5G?=
 =?utf-8?B?TWN4eTZjcUVNcDFSaEZKWU9CMnZpMHhVOWRUbDRvbGIyWUNNbEFONnR4djYx?=
 =?utf-8?B?cVB3UzJ1TXdmaVp1a3lNVFVmcm9qTFBMUm9pUnBxbmNsRVozczVJVk5yVXFI?=
 =?utf-8?Q?IIYxf4DK2RVsY15vJqVd2w/y5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f3ff8f-a408-4805-3733-08dd50296427
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 14:34:46.0098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLRa07fbc7aj6QaLHxdSnem9i7qzoiyIgFMjuXIyKwSi/8dqtQhmMxAjcPyMSrkB7/fnUx6PtDFE4pBhkrXZgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBTd2F0aTIg
PHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxOCwg
MjAyNSAxMjoyOSBQTQ0KPiBUbzogR2FyZywgTmVtZXNhIDxuZW1lc2EuZ2FyZ0BpbnRlbC5jb20+
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGkt
Zy10XSB0ZXN0cy9pbnRlbC9rbXNfb2RkX3BhbjogQWRkIHRlc3QgdG8gdmFsaWRhdGUgb2RkDQo+
IHBhbm5pbmcNCj4gDQo+IEhpIE5lbWVzYSwNCj4gDQo+IE9uIDE3LTAyLTIwMjUgMDg6NDQgcG0s
IE5lbWVzYSBHYXJnIHdyb3RlOg0KPiA+IEFkZCBhIG5ldyB0ZXN0IHRvIGNoZWNrIHdoZXRoZXIg
b2RkIHBhbiBpcyBzdXBwb3J0ZWQgb3Igbm90Lg0KPiBQbGVhc2UgZWxhYm9yYXRlIG1vcmUgaW4g
dGhlIGRlc2NyaXB0aW9uIHdoYXRzIHRoZSBpbnRlbnRpb24gb2YgdGhpcyB0ZXN0LCB3aGF0DQo+
IGlzIHRoaXMgZmVhdHVyZSBhbGwgYWJvdXQ/DQo+IEFsc28sIHdoeSBkbyB3ZSBuZWVkIHRvIGNy
ZWF0ZSBhIG5ldyBiaW5hcnkgdG8gdmFsaWRhdGUgdGhpcyBmZWF0dXJlPw0KPiBXaHkgY2FuJ3QN
Cj4gd2UgYWRkIHN1YnRlc3QgaW4gZXhpc3RpbmcgYmluYXJpZXMgbGlrZSBrbXNfcGxhbmU/DQo+
ID4NCkhpIFN3YXRpLA0KDQpJIGNhbiBhZGQgdGhpcyB0ZXN0IGFzIGEgcGFydCBvZiB0aGUga21z
X3BsYW5lLiBUaGlzIHRlc3QgaWYgZm9yIGNoZWNraW5nIHdoZXRoZXIgdGhlIG9kZCBwYW5uaW5n
IGlzDQpzdXBwb3J0ZWQgb3Igbm90LiBJJ2xsIGFkZCBtb3JlIGluIHRoZSBkZXNjcmlwdGlvbi4N
Cg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTmVtZXNhDQo+ID4gU2lnbmVkLW9mZi1ieTogTmVtZXNh
IEdhcmcgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHRlc3RzL2ludGVs
L2ttc19vZGRfcGFuLmMgfCAxNTUNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gPiAgIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgfCAgIDEgKw0KPiA+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAxNTYgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RzL2ludGVsL2ttc19vZGRfcGFuLmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC9rbXNfb2RkX3Bhbi5jIGIvdGVzdHMvaW50ZWwva21zX29kZF9wYW4uYyBuZXcNCj4gPiBm
aWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMC4uNDZmOWM4ZmUyDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19vZGRfcGFuLmMNCj4gPiBAQCAtMCwwICsx
LDE1NSBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ID4gKy8q
DQo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uICAqLw0KPiA+ICsN
Cj4gPiArLyoqDQo+ID4gKyAqIFRFU1Q6IGttcyBvZGQgcGFuDQo+ID4gKyAqIENhdGVnb3J5OiBE
aXNwbGF5DQo+ID4gKyAqIERlc2NyaXB0aW9uOiBUZXN0IHRvIHZhbGlkYXRlIG9kZCBwYW5uaW5n
IGZvciBwbGFuYXIgZm9ybWF0DQo+ID4gKyAqIERyaXZlciByZXF1aXJlbWVudDogeGUNCj4gPiAr
ICogTWVnYSBmZWF0dXJlOiBHZW5lcmFsIERpc3BsYXkgRmVhdHVyZXMNCj4gPiArICogVGVzdCBj
YXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0DQo+ID4gKyAqIEZ1bmN0aW9uYWxpdHk6IHBhbm5p
bmcNCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ID4gKyNpbmNsdWRl
ICJpZ3RfdmVjLmgiDQo+ID4gKyNpbmNsdWRlIDxlcnJuby5oPg0KPiA+ICsjaW5jbHVkZSA8c3Rk
Ym9vbC5oPg0KPiA+ICsjaW5jbHVkZSA8c3RkaW8uaD4NCj4gPiArI2luY2x1ZGUgPHN0cmluZy5o
Pg0KPiA+ICsjaW5jbHVkZSAieGUveGVfcXVlcnkuaCINCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsg
KiBTVUJURVNUOiBvZGQtcGFubmluZw0KPiA+ICsgKiBEZXNjcmlwdGlvbjogVmVyaWZ5IHRoYXQg
b2RkIHBhbm5pbmcgaW4gaG9yaXpvbnRhbCBkaXJlY3Rpb24gZm9yDQo+ID4gK3BsYW5hciBmb3Jt
YXQNCj4gPiArICogRHJpdmVyIHJlcXVpcmVtZW50OiBpOTE1LCB4ZQ0KPiA+ICsgKiBGdW5jdGlv
bmFsaXR5OiBrbXNfb2RkX3Bhbg0KPiA+ICsgKiBNZWdhIGZlYXR1cmU6IEdlbmVyYWwgRGlzcGxh
eSBGZWF0dXJlcw0KPiA+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4g
PiArICovDQo+ID4gKw0KPiA+ICtJR1RfVEVTVF9ERVNDUklQVElPTigiVGVzdCB0byB2YWxpZGF0
ZSBvZGQgcGFubmluZyBmb3IgcGxhbmFyDQo+ID4gK2Zvcm1hdCIpOw0KPiA+ICsNCj4gPiArdHlw
ZWRlZiBzdHJ1Y3Qgew0KPiA+ICsJaW50IGRybV9mZDsNCj4gPiArCWlndF9kaXNwbGF5X3QgZGlz
cGxheTsNCj4gPiArCWlndF9vdXRwdXRfdCAqb3V0cHV0Ow0KPiA+ICsJaWd0X3BsYW5lX3QgKipw
bGFuZTsNCj4gPiArCXN0cnVjdCBpZ3RfZmIgKmZiOw0KPiA+ICt9IGRhdGFfdDsNCj4gPiArDQo+
ID4gKyNkZWZpbmUgUExBTkVfV0lEVEggODEwDQo+ID4gKyNkZWZpbmUgUExBTkVfSEVJR0hUIDU5
MA0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQNCj4gPiArcHJlcGFyZV9wbGFuZXMoaWd0X2Rpc3Bs
YXlfdCAqZGlzcGxheSwgY29uc3QgZW51bSBwaXBlIHBpcGVfaWQsDQo+ID4gKwkgICAgICAgaWd0
X291dHB1dF90ICpvdXRwdXQpDQo+ID4gK3sNCj4gPiArCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0K
PiA+ICsJc3RydWN0IGlndF9mYiBwcmltYXJ5X2ZiXzEsIHByaW1hcnlfZmJfMjsNCj4gPiArCXVu
c2lnbmVkIGludCBmYl9pZF8xLCBmYl9pZF8yOw0KPiA+ICsJaW50IGogPSAwLCByZXQ7DQo+ID4g
Kw0KPiA+ICsJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIHBpcGVfaWQpOw0KPiA+ICsNCj4g
PiArCXByaW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKG91dHB1dCwNCj4gRFJNX1BM
QU5FX1RZUEVfUFJJTUFSWSk7DQo+ID4gKw0KPiA+ICsJZmJfaWRfMSA9IGlndF9jcmVhdGVfcGF0
dGVybl9mYihkaXNwbGF5LT5kcm1fZmQsDQo+ID4gKwkJCQkJODAwLCA1OTAsDQo+ID4gKwkJCQkJ
RFJNX0ZPUk1BVF9OVjEyLA0KPiA+ICsJCQkJCURSTV9GT1JNQVRfTU9EX0xJTkVBUiwNCj4gPiAr
CQkJCQkmcHJpbWFyeV9mYl8xKTsNCj4gPiArDQo+ID4gKwlmYl9pZF8yID0gaWd0X2NyZWF0ZV9w
YXR0ZXJuX2ZiKGRpc3BsYXktPmRybV9mZCwNCj4gPiArCQkJCQk4MDAsIDU5MCwNCj4gPiArCQkJ
CQlEUk1fRk9STUFUX05WMTIsDQo+ID4gKwkJCQkJRFJNX0ZPUk1BVF9NT0RfTElORUFSLA0KPiA+
ICsJCQkJCSZwcmltYXJ5X2ZiXzIpOw0KPiA+ICsNCj4gPiArCWlndF9hc3NlcnQoZmJfaWRfMSk7
DQo+ID4gKwlpZ3RfYXNzZXJ0KGZiX2lkXzIpOw0KPiA+ICsNCj4gPiArCWlndF9wbGFuZV9zZXRf
ZmIocHJpbWFyeSwgJnByaW1hcnlfZmJfMSk7DQo+ID4gKw0KPiA+ICsJaWd0X3BsYW5lX3NldF9z
aXplKHByaW1hcnksIFBMQU5FX1dJRFRILCBQTEFORV9IRUlHSFQpOw0KPiA+ICsJaWd0X3BsYW5l
X3NldF9wb3NpdGlvbihwcmltYXJ5LCAtNTAxLCAyMDApOw0KPiA+ICsNCj4gPiArCXJldCA9IGln
dF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWljKGRpc3BsYXksDQo+ID4gK0RSTV9NT0RFX0FUT01J
Q19BTExPV19NT0RFU0VULCBOVUxMKTsNCj4gPiArDQo+ID4gKwlkbyB7DQo+ID4gKwkJaWYgKGog
JSAyID09IDApIHsNCj4gPiArCQkJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmcHJpbWFyeV9m
Yl8xKTsNCj4gPiArCQkJaWd0X3BsYW5lX3NldF9zaXplKHByaW1hcnksIFBMQU5FX1dJRFRIIC0g
aiwNCj4gUExBTkVfSEVJR0hUKTsNCj4gPiArCQkJcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1p
dF9hdG9taWMoZGlzcGxheSwgMCwgTlVMTCk7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJaWd0
X3BsYW5lX3NldF9mYihwcmltYXJ5LCAmcHJpbWFyeV9mYl8yKTsNCj4gPiArCQkJaWd0X3BsYW5l
X3NldF9zaXplKHByaW1hcnksIFBMQU5FX1dJRFRIIC0gaiwNCj4gUExBTkVfSEVJR0hUKTsNCj4g
PiArCQkJcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwgMCwgTlVM
TCk7DQo+ID4gKwkJfQ0KPiA+ICsJCWorKzsNCj4gPiArCX0gd2hpbGUgKGogPCAyMCk7DQo+ID4g
Kw0KPiA+ICsJaWd0X2Fzc2VydF9lcShyZXQsIC0yMik7DQo+ID4gKw0KPiA+ICsJaWd0X3BsYW5l
X3NldF9mYihwcmltYXJ5LCBOVUxMKTsNCj4gPiArCWlndF9vdXRwdXRfc2V0X3BpcGUob3V0cHV0
LCBQSVBFX05PTkUpOw0KPiA+ICsJaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdDIoZGlzcGxheSwgQ09N
TUlUX0FUT01JQyk7DQo+ID4gKw0KPiA+ICsJaWd0X3JlbW92ZV9mYihkaXNwbGF5LT5kcm1fZmQs
ICZwcmltYXJ5X2ZiXzEpOw0KPiA+ICsJaWd0X3JlbW92ZV9mYihkaXNwbGF5LT5kcm1fZmQsICZw
cmltYXJ5X2ZiXzIpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBydW5fdGVzdF9wYW4oaWd0
X2Rpc3BsYXlfdCAqZGlzcGxheSwgY29uc3QgZW51bSBwaXBlIHBpcGVfaWQsDQo+ID4gKwkJCSBp
Z3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gPiArew0KPiA+ICsJcHJlcGFyZV9wbGFuZXMoZGlzcGxh
eSwgcGlwZV9pZCwgb3V0cHV0KTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgcnVuX3Rlc3Rf
b2RkX3BhbihkYXRhX3QgKmRhdGEpIHsNCj4gPiArCWlndF9kaXNwbGF5X3QgKmRpc3BsYXkgPSAm
ZGF0YS0+ZGlzcGxheTsNCj4gPiArCWVudW0gcGlwZSBwaXBlOw0KPiA+ICsJaWd0X291dHB1dF90
ICpvdXRwdXQ7DQo+ID4gKw0KPiA+ICsJZm9yX2VhY2hfcGlwZV93aXRoX3ZhbGlkX291dHB1dChk
aXNwbGF5LCBwaXBlLCBvdXRwdXQpIHsNCj4gPiArCQlpZ3RfZGlzcGxheV9yZXNldChkaXNwbGF5
KTsNCj4gPiArDQo+ID4gKwkJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIHBpcGUpOw0KPiA+
ICsJCWlmICghaW50ZWxfcGlwZV9vdXRwdXRfY29tYm9fdmFsaWQoZGlzcGxheSkpDQo+ID4gKwkJ
CWNvbnRpbnVlOw0KPiA+ICsNCj4gPiArCQlpZ3RfZHluYW1pY19mKCJwaXBlLSVzLSVzIiwga21z
dGVzdF9waXBlX25hbWUocGlwZSksDQo+IGlndF9vdXRwdXRfbmFtZShvdXRwdXQpKQ0KPiA+ICsJ
CQlydW5fdGVzdF9wYW4oZGlzcGxheSwgcGlwZSwgb3V0cHV0KTsNCj4gPiArDQo+ID4gKwkJaWYg
KHBpcGUgPT0gMCkNCj4gPiArCQkJYnJlYWs7DQo+ID4gKwl9DQo+ID4gK30NCj4gPiArDQo+ID4g
K2lndF9tYWluDQo+ID4gK3sNCj4gPiArCWRhdGFfdCBkYXRhID0ge307DQo+ID4gKw0KPiA+ICsJ
aWd0X2ZpeHR1cmUgew0KPiA+ICsJCWRhdGEuZHJtX2ZkID0gZHJtX29wZW5fZHJpdmVyX21hc3Rl
cihEUklWRVJfQU5ZKTsNCj4gPiArCQlpZ3RfcmVxdWlyZShkYXRhLmRybV9mZCA+PSAwKTsNCj4g
PiArDQo+ID4gKwkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOw0KPiA+ICsNCj4gPiAr
CQlpZ3RfZGlzcGxheV9yZXF1aXJlKCZkYXRhLmRpc3BsYXksIGRhdGEuZHJtX2ZkKTsNCj4gPiAr
CQlpZ3RfcmVxdWlyZShkYXRhLmRpc3BsYXkuaXNfYXRvbWljKTsNCj4gPiArDQo+ID4gKwkJaWd0
X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXQoJmRhdGEuZGlzcGxheSk7DQo+ID4gKwl9DQo+ID4gKw0K
PiA+ICsJaWd0X2Rlc2NyaWJlKCJUZXN0cyBvZGQgIHBhbm5pbmciKTsNCj4gPiArCWlndF9zdWJ0
ZXN0X3dpdGhfZHluYW1pYygib2RkLXBhbm5pbmciKQ0KPiA+ICsJCXJ1bl90ZXN0X29kZF9wYW4o
JmRhdGEpOw0KPiA+ICsNCj4gPiArCWlndF9maXh0dXJlIHsNCj4gPiArCQlpZ3RfZGlzcGxheV9m
aW5pKCZkYXRhLmRpc3BsYXkpOw0KPiA+ICsJCWRybV9jbG9zZV9kcml2ZXIoZGF0YS5kcm1fZmQp
Ow0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIv
dGVzdHMvbWVzb24uYnVpbGQgaW5kZXgNCj4gPiBmOGEwYWI4MzYuLjk3ZWZmYjI5MCAxMDA2NDQN
Cj4gPiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZA0KPiA+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxk
DQo+ID4gQEAgLTI1Nyw2ICsyNTcsNyBAQCBpbnRlbF9rbXNfcHJvZ3MgPSBbDQo+ID4gICAJJ2tt
c19qb2luZXInLA0KPiA+ICAgCSdrbXNfbGVnYWN5X2NvbG9ya2V5JywNCj4gPiAgIAkna21zX21t
YXBfd3JpdGVfY3JjJywNCj4gPiArCSdrbXNfb2RkX3BhbicsDQo+ID4gICAJJ2ttc19waXBlX2Jf
Y19pdmInLA0KPiA+ICAgCSdrbXNfcGlwZV9zdHJlc3MnLA0KPiA+ICAgCSdrbXNfcG1fYmFja2xp
Z2h0JywNCg0K
