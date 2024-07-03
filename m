Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455DAC30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 11:55:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FBB10E7BC;
	Wed,  3 Jul 2024 11:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR157FTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E0310E7B9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720007746; x=1751543746;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DZmAdFo+km6cfhp/+wpoaOsi99FCliLpg4/MpWk3Yx0=;
 b=mR157FTpusx9PSD/1DdjHuQ0tXIW9BsbLqI9pNczhq0w2HNB02WdOyfm
 7gddwclNBBhlsKgkR8lKX7dyTsMju3hfc1ETY6ds5/hliC0gAzSQ7dS5S
 tzqkTF6Mxzvj9LP8vBLxS0BqagF3jTe9gobwSuqiTczfIX9sPNSCELbMq
 4AmMJ77U6Tm6cDO4v0Yb7EXZ0GdShwYcOo9SUDK0zQ4qr3JyyYlXX51sP
 WvbF96iC8epanVibCdJGW3aMDVcoeqLfHLQwV9XfPpD2CQQihAIy+wQN/
 PRJPmCJrW3eUKaQOZVuhKPJ7i3wV7StXsPaqoa9h1vGi4H3hMw3V3GENn g==;
X-CSE-ConnectionGUID: 5yAi1JFBSmeoRWbrWBXttw==
X-CSE-MsgGUID: Cdst17iyR6qopN0AiI+1/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17364374"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17364374"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 04:55:45 -0700
X-CSE-ConnectionGUID: pzee0qHMSnqoIvL2WuyH4w==
X-CSE-MsgGUID: VMZc2i3YTuKiAny6AzZ7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46011113"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 04:55:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 04:55:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 04:55:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 04:55:43 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 04:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuOEGwr/uaCLpKIjKfyCxeiAPLtqtKX7rhk+1g+HI6o3NUnOqW7paR61u/qqpuUPOz9N/aW3n+9F09XdUMFD4DD+OpsCgXkA8T81h4rgbV/IQar4C+2B/v6/bJOd0mUjhySo22MxRLOyurs5Ra+LkC7R1HxnrChT4+L0i3dRYOFqlZoSd88KOxmaPtLvc0KpvOj5UaJpF8bcP5/1V4PjVemEotSwyLkr7RcKlAeCjFvifXcCkkQQAM1NXbMV0+FZalher8XAfh3UkST8tUlo0UcW94BiEOeuxVdqwoRgSGmG6lpllZ8ZjOoPnwuOBV2xaPiKT0z7EGp/wX33aQrbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZmAdFo+km6cfhp/+wpoaOsi99FCliLpg4/MpWk3Yx0=;
 b=JHz2QFgA2Q5R6S10kmAmUGDnLB/S8p+U0gWUdorJGUVGYI5q3mGBkdtpLBoDft777Bp/3QO5Qxn6YqrX7li3fDXzvR4lYhjUb548EF9Cy8sqJ+aS1PE+9QnASMfQooAxynPZVZBuIRl9j9ByEIn0I1IN6eWviQag/zD+uDrW9eLVd5pNgHvMnxUnW/s6s9ryDEpXnL8MPmoM0eENGfczeN4UYhQm2O3eDicJ+PKqGN2LJ6QKGTzAt6U2fhOm27EPILP3KpmeXrNoRRRFzNy5RmaIX+slc0i7aYcw4QKSdSd/i8R0lpI2uH+VwxpUtq8N5xGTgB2sXwdA3VrRjKLl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 11:55:41 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 11:55:41 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t,2/2] RFC: tests/kms_vrr: Add new test to validate LOBF
Thread-Topic: [i-g-t,2/2] RFC: tests/kms_vrr: Add new test to validate LOBF
Thread-Index: AQHazTIMOXtfnjTWYEyn7hVGBLD6nLHkyq4AgAAaAAA=
Date: Wed, 3 Jul 2024 11:55:41 +0000
Message-ID: <PH7PR11MB5981B91A6A32284DBD4F812CF9DD2@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240626191537.1507452-3-jeevan.b@intel.com>
 <c7df35c7-d641-414d-b032-2cd3d8a47401@intel.com>
 <DM4PR11MB63121E9063B885B08E722FC690DD2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63121E9063B885B08E722FC690DD2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|IA0PR11MB8418:EE_
x-ms-office365-filtering-correlation-id: a88cc0a1-678e-4bdd-1934-08dc9b571054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QzhDOFNGVmtDb3ZncHRuS2tNbWdKaXI5eTFtOUd5Mmo1cEJVU3ZUUytRZzV3?=
 =?utf-8?B?RUMzM0E4cjNVMWFuVG5nckwzNUJrcWVhbjY2bHBkTVQrakRUNWhxdmVQUDMy?=
 =?utf-8?B?bGpURTJFZGlsam5XTVdUdmNRUlhVYXRyR2krUzJKaEEvbjJaMTlKQjRyQzVR?=
 =?utf-8?B?ME84VjNELzRrRTZPay9LTFJ3RjlsSE51QnRGdHdlUjdVakU3RkZYNFZlcEIz?=
 =?utf-8?B?bFFlcTJsRVFyVHRKNDViK0NkUmtYT0FpK3poSW9JVE9BNDQ3V1paRGJyZmVw?=
 =?utf-8?B?SmhlajZ5WmVhcjRvVGY5SXJIS3VHV0tSMmMvQ2NiaXQzdmZSckZjbDdENk01?=
 =?utf-8?B?L1M2cTYzT2RPMUVOa2Y4QlR5M2RlcTF0OFUrS25VcGl4UzRmekRFM3BTZU1O?=
 =?utf-8?B?YmNCWU5sdmcvVFFTRmhGVUI4SFRjcHlvT3JMQU13UzJORW5ldkgrOHlKS09a?=
 =?utf-8?B?ajN4R1lDRWpULzcwZ0VsWHNzMUJxdXRaYm1scFNwcHpoZ2N4ZFRMelZxYTdv?=
 =?utf-8?B?ajRvbnFydHgvMi92YlFkWC9VK0lPUEU1cEN3SlJXM2RmaURaenBIZHdaWXo5?=
 =?utf-8?B?UDlISkRKbVU3ekZQTWVQWnIvbkplZEVXSTA1Y21tZXhUeG03MTl5ZjR2TjlZ?=
 =?utf-8?B?OEQvZzUyNHhwZDJ6RGRFNGl3c3RFMjZDRlBmT2pCaVllK1VRc3FzYlFyTjlR?=
 =?utf-8?B?NnRrQjJZd1E2aEc1cWxkaGFoM3lNZndnYjBybzAyMTZTSXA1dUxHOE95cGVn?=
 =?utf-8?B?aUVlclNPSk9jNHM1VGhJOXJIT2p1RzNwVXFVelZQVklySVBDMDdqQlI0c21i?=
 =?utf-8?B?cElkOUdNcmxtMnk3Kzk5MG9pN0Z0WGJoRnNERDlBRGdtbW5Md1dLak84L2d4?=
 =?utf-8?B?eVJYUmxkNW0wcEhlTk1BUlY0b3ZpYVVKL3JEOUh3K3FwWE1VSzJWVmtmSVFh?=
 =?utf-8?B?ZmtvWSs2c0ROZnZ6VEVjaTVHWVpMZVBybmhBK3ZIcnRtRHU1Q3h1VjJVbnRi?=
 =?utf-8?B?ek85OExmYlJzZ3QzdUdzYUxJMXhIU2xCOCtNNkowUURxSEJyT0pJQVBNVDRU?=
 =?utf-8?B?RFB3Y1QrTmhmQ01QbER0UTFvZVcrMWlQOUhraE11b2VUL1BrOFNDUWFxSmhq?=
 =?utf-8?B?d0QzaFNVdWlGWDh6bGNGUUptT0lMc1NXMjc1blk2b2Y4Wk9uUTFRNU5EZUJm?=
 =?utf-8?B?NXdpYmpHbnBBZitNMUJDSzJHbFNOUEo3VG9mOVBuZW9Qamx3VDZYVWs5T3NP?=
 =?utf-8?B?cDNHbnJ0YjZ4am5LRkRmanc5ck9teTFZVVFJc2FncktMVG10dmZPNjFYdlQv?=
 =?utf-8?B?bWMzUFRucVBENCtVVTFXTVk4azM1RmNheSszMU9LMXRvZGhvVTJHQlpscldB?=
 =?utf-8?B?NnNadDdQOVRINUNFMXNUNWsrOWFOVFNsMWFVWENKcHF0dTYyTmduTENEQklH?=
 =?utf-8?B?eWZZRSs2a0xkVW1TYXFXb2NpR0RuK0I4MG1rdmRjb1NhNDgzd3NPUkpoUUhB?=
 =?utf-8?B?TTNmYXFVbnMrbmZCaDFqQzFibmVZKzRSZ0p6UXJrV3kyNCtGRzRwczRVZk9C?=
 =?utf-8?B?MGhYY2lBN3BjVThmNzZRUDFmazhsei9oWjlmZUZ4TisxOGdRYWJRbnlkWkh4?=
 =?utf-8?B?RnVzVUl3cENMcUxFQ3hBZk03WEN2aUs4Z1BVZXYyeGpiRnl6RHFLaTQ4alBr?=
 =?utf-8?B?K0pBWG1lWndoV0hlckswTUNSR3psK2VnTTZkbTQ1L1VMb2NpZkRkdk5GTnZK?=
 =?utf-8?B?KzAwUVFnUUNTZnpqYUxaV1QxZ0JGeVNWTDZycEFTYjUyb2RLaEhPN1l0ekdE?=
 =?utf-8?B?bHZBcXVBeldsdzg2Rngrc3VocHMzRlR1bm1XSG1MRHFoMHV3Tmt0dlhMNnY3?=
 =?utf-8?B?eDRnMjJNTUhxVlNXaW0vY2pLUVJ0R3pFU3NYdHNSVFBSZmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2dkMDRjRlg3ZHNwczhxdlJadHRFeXNVYzU2V0NFVTFkUFdZdzQwVlhLbmpl?=
 =?utf-8?B?d202Ti81ZTIxVEZVeCtDRjNxbU9IcUlGZzJ6YVYwUWhKeUJNSU1td0p6d25t?=
 =?utf-8?B?ZlczZXJkbjM3bnMyRnp6cWdNZGowQUxTMG5KSGVUd3NYWFBWNWtOdU9UMkMx?=
 =?utf-8?B?azBYU3VGdGZONVRJS1E5ZUpuTjhWVERGbTJBa1pHUnZFVWdpaXdMdS9kTVpn?=
 =?utf-8?B?SUs4V2JSOEU1RHdlb1JTdGkvTVlWSkZidURpcmQ5UEVxeC83eVB4UVRMUXBC?=
 =?utf-8?B?RmdGaG54dkRVRGMvb0IrcWF0Q1YwNlcrV1BnVVh5TFhyQ0YvUmJmQUFQS3Zm?=
 =?utf-8?B?ZUxFbGtmcE81V0xuVEtvSmI2MERnT3JrdFJUODgzdnBvckRTSWVoSWJCYlVn?=
 =?utf-8?B?dVllWms3dDlvSU9KREo2SkljRnU3K2VYY3c0OWlsbUhNR0NSUVppWG55dlFT?=
 =?utf-8?B?eFFueW1nYlg5NXBER05tOGo2a1JBN1JMVE5aQlhQVGhOUmRja1Y4MUFBRGhy?=
 =?utf-8?B?VStvYStYcjZvbDY4c29aYnJYc3pNdlFEMzVkZzNmL1ovbmtUem1xOTNVVVBo?=
 =?utf-8?B?Vk1DS0JxTUg2OGNuQkpUMW4rR1dKM2JMUHU0MGhGOWp4eEN0c1lVR2toS3FV?=
 =?utf-8?B?U3dZUWFNN1QzQU42aTFHM25FOUhkbU1QajZLZnUxd1NpTjR4bmt5alZudjgw?=
 =?utf-8?B?NjA3UGpMeHZ6MkthczRpTS9VMEVzK0YwY3VWZ1FSVXI4UmQ0RGZGN0dmYXRj?=
 =?utf-8?B?Q3BkVWloQ1FKNUw4aVlQWGl2bExDdlZHdUxrWTN4bWhBeVN4L3BvdjFLaW1i?=
 =?utf-8?B?MEZ5YVBCWDNxeGRnNFVsdTRtaW5Nb1JkM3M1RFlWSGZzdXlPNDFqa3JMYkFS?=
 =?utf-8?B?SzlGTVl0ZWhKYm5FT1VrM2w3V2RaUi9xUk4xS21sbW9zMzVxbFZkU012MG5l?=
 =?utf-8?B?WUZxNGJrSWZwc0ltSEVsalRWUjQ0MGZnVjNDd2NZMG43VFF4Uk5TTlNXYk1q?=
 =?utf-8?B?S3NSNGhCc1U0OE4rcjdURm1BYW8vRWZTT2JWSTBuVXRJZzROUkpXeVZpTlIy?=
 =?utf-8?B?V1o0TkVQTml1WGZuRmpDWExwaGROQWxwS0o3bFQwTVk2aG11S1BxVDFVYzI2?=
 =?utf-8?B?ZnUvWUk0SG5nSGdKNG9FQ0REemo3Q2lXOVpWQkt6MkNKUW14aHE3TWkxUnNB?=
 =?utf-8?B?cjQ0K0gxb2YyK0ZDODVHMWNnblJUVDYzWE02MXgvQm10SXZ2bXdsektzempZ?=
 =?utf-8?B?UTJVQWN5amUzaGVVQzJHY2hJcDNiTkpBc3BhbWVrTGZyeHhacUlZV3JhZlJD?=
 =?utf-8?B?c0xYdjBRb3FFN0tuaU5vUmNSRXgxNTBlRFQrSDNsQmVuN0NUbnVVUzNrZGFj?=
 =?utf-8?B?TUxiQ1BHdHkwVzM3VG5ZNHJ1MzNtQ1RQZDRtTlU2dE1ITFFxOVJMSWY2RFRE?=
 =?utf-8?B?OVQyb0UwOTRIa1NDUEk4aC80dWNITENVdENTWkNGSExiM3AwL3R3V29sT0Z5?=
 =?utf-8?B?WVlNd0w3TlpzOXY1Wk9jQnNyTlBBc1loVG50SDVXQmpuZ1h0V2tDU0ZIb1lF?=
 =?utf-8?B?V3ZWajVNNlg0QmJmQVVMc1U1OVpkQ0o0Tksyd1BtSGxiUGN5cVFUbEphM3Jk?=
 =?utf-8?B?NUd5SnFHVXZwWkVzK1o5aG5qWERzYmxJQk9OME0rRGJYZ1ZkWGRHV1NZMzdv?=
 =?utf-8?B?RDQrR2FCMUVSYUxzRlJqMjgvaXRTbXVybUQ2UnJEWUZWcWltSVNheUZPTUNL?=
 =?utf-8?B?bnFhaG15ZkpUMXJwT3Zia0IzbEJoSDRuMkFjZGtscGxzdGE5TUZaOWpSN25u?=
 =?utf-8?B?VGpucG8ybVFGbi90Z1NyNi80MzdkVnVleWxjNyswNjdWcW1mQnd3akhBNnQy?=
 =?utf-8?B?dlB5SlVLNnhvY2xRd0RQZklCV2x0TktZRFFwalZ3cGJyTnhHTER6cGMrY1NK?=
 =?utf-8?B?K1JvbXluVG9YcTVWdWdiMkZpVnFGczM0R3lJc3FHanpWTTV1dmx5VEhkYy81?=
 =?utf-8?B?U0tGL0dSS2k0SVd2bFFKcGV3Q3RLd1NNUlBaT2x0OVRrdThGR3FqOUFyMEFZ?=
 =?utf-8?B?MHpvc2cvc2ZOcm5ERC9QN2ZDL0lmd09Jc2d3Mk9kUzZMcFl4UWJpUmpKZ04v?=
 =?utf-8?Q?UMcKbaTzkCihGeX5B5ta/YnDh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88cc0a1-678e-4bdd-1934-08dc9b571054
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 11:55:41.7958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3CTZU0OTdBdpA5JUIH+V0WPFYekHGoevJPYblK2w1jMQAOfEK+wkA647WeXFHQQ1qWu46B630S5nCMHDzencw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

TE9CRiBoYXMgZGVwZW5kZW5jeSBvbiBhZGFwdGl2ZSBzeW5jIGZpeGVkIHJlZnJlc2ggcmF0ZSBt
b2RlIGFuZCBrZXJuZWwgZGV2ZWxvcG1lbnQgaXMgb25nb2luZy4gDQpQYXRjaGVzIGFyZSBwb3N0
ZWQgaW4gbWFpbGluZyBsaXN0LiANCg0KUmVnYXJkcywNCkFuaW1lc2gNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCLCBKZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT4N
Cj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDMsIDIwMjQgMzo1MCBQTQ0KPiBUbzogSm9zaGksIEt1
bmFsMSA8a3VuYWwxLmpvc2hpQGludGVsLmNvbT47IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOw0KPiBNYW5uYSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJFOiBbaS1nLXQsMi8yXSBSRkM6IHRlc3RzL2ttc192cnI6IEFkZCBuZXcgdGVzdCB0byB2
YWxpZGF0ZSBMT0JGDQo+IA0KPiBATWFubmEsIEFuaW1lc2ggSSB0aGluayB0aGlzIGNhbm5vdCBi
ZSB0ZXN0ZWQgYXMgVlJSIGNoYW5nZXMgYXJlIHlldCB0byBiZQ0KPiBtZXJnZWQgQW5pbWVzaCBw
bGVhc2UgY29uZmlybS4NCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBKb3NoaSwgS3VuYWwxIDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVseSAzLCAyMDI0IDM6NDYgUE0NCj4gPiBUbzogQiwgSmVldmFuIDxqZWV2YW4u
YkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBNYW5u
YSwgQW5pbWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtp
LWctdCwyLzJdIFJGQzogdGVzdHMva21zX3ZycjogQWRkIG5ldyB0ZXN0IHRvIHZhbGlkYXRlDQo+
ID4gTE9CRg0KPiA+DQo+ID4NCj4gPiBPbiA2LzI3LzIwMjQgMTI6NDUgQU0sIEplZXZhbiBCIHdy
b3RlOg0KPiA+ID4gVmFsaWRhdGUgcHNldWRvIHN0YXRpYyByZWZyZXNoIHJhdGUgY2hhbmdlcyBp
biB0aGUgVlJSIHdpdGggZml4ZWQNCj4gPiA+IHJlZnJlc2ggcmF0ZSBmcmFtZXdvcmsuDQo+ID4g
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4NCj4g
PiBIZWxsbyBKZWV2YW4sDQo+ID4NCj4gPiBDYW4geW91IGFkZCBhIEhBWCBwYXRjaCBpbmNsdWRp
bmcgdGhpcyB0ZXN0IGluIGZhc3QtZmVlZGJhY2sgZm9yIGJvdGgNCj4gPiB4ZSBhbmQgaTkxNSwg
U28gd2UgY2FuIGdldCByZXN1bHRzIGZyb20gQ0kuDQo+ID4NCj4gPg0KPiA+IFRoYW5rcyBhbmQg
UmVnYXJkcw0KPiA+IEt1bmFsIEpvc2hpDQo=
