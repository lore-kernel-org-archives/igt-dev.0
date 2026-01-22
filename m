Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A619DD625E0
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 03:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5352410E124;
	Thu, 22 Jan 2026 03:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nv0AMDJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F219410E8CA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769051323; x=1800587323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=ZV0/Ry1o7aURgMQfQNGeRQrEbAJl0s7tHStp/UZLrwc=;
 b=nv0AMDJKEyXyz4siFkdJkcYo1jawQpBrIeOqoWtsxRf4nP1uTM5beJf0
 AmLzSt+lqYFwrwz7wzPs3AuUDj0pRyI//SCRPfrngGhW8y6XkrrzbgDwW
 uKBZL895TizzE1841APoNJTZTmyYeH23Ut+ODTvMr1HZKGvoiI+vm07gR
 9ucParMjej/1HzWO+JHM7PRWYMNBFLotV978zG5A4J5jNyan8XDnzm4p0
 LWfOG2eozvevITVDalOI5iSBTu+Zs4iY81Yb8CT84FvFgNUl8w8wUnR5O
 bVmLgv65QIvGqnrYqnOhZftFKm7xA36cWGdQG9ThhVfqi0ZbE9KUw3T1G Q==;
X-CSE-ConnectionGUID: VdqJMzmiTRSAdhflKi8yqg==
X-CSE-MsgGUID: vSBFgdElTYiWxEw743d+TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70189508"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208,217";a="70189508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 19:08:43 -0800
X-CSE-ConnectionGUID: NMvUGKjUSmirvs15sHSWcA==
X-CSE-MsgGUID: gbDv5DG3Q9S6IEBXgp+sFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
 d="scan'208,217";a="244209214"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 19:08:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 19:08:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 19:08:41 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 19:08:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdSXINM+U0peC911XWqcSBI8ZGZQw+R4IEeYTapfqymC0vO1ddDxjVoMY75PabolyZOZKZ8eL6RBX0n0/Yb/vClHgRe3M4JOiByD6ARHMK7+RdZWvPOMm6gslNmyTs5U5glwn9OyCP7y9DaATHIrDiULZVMW8+Evi8BsiKWVSpN5aMm6AwsLyN2hTnxOs7QGrq5posMmnOT9AUtmi5H+qfyZLGyIOGriyIUlcrmlktjyKLww0La+eztcJWe48By1VxPRnYfSio4o2yHRW4FOl0RWuqTl6OVcWewdrtKf+UitkRwA0Cm16Sy0qYA5g/sOk9/RQvM75rktRDP1lDyS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV0/Ry1o7aURgMQfQNGeRQrEbAJl0s7tHStp/UZLrwc=;
 b=sr0nZ2fA9QinvjnLKd1LWSh5tsoY7nOIUtlnZNcR7m3+cngQfFYX7UGrrpTgBYiZGEYkpByiENsr3vDXhaSF7PP6EL+wyonUG7nel4JasDmkCqzREr0k1CCh/+mo8nekwiuLnb3LGXJilzp6tyl96rN5L/y506e7QuNAj4R5mt+S1wTrpG0M80JsNNZ7prrm9YvVY4K8Ik3aqJ0VpDOp21fmaRU1/7qyj/KKtVO+n5Eu8NVAV/iU5T+IzHUBpr0aPOpoL+dw5YLexHMevSvl25TO2gdSka75iJ7fawF52+vwzwroQQuF4h341wrkfPq8L9Pnk4wXycn3ABntfV10eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by CO1PR11MB4961.namprd11.prod.outlook.com (2603:10b6:303:93::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Thu, 22 Jan
 2026 03:08:33 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 03:08:33 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Karas,
 Krzysztof" <krzysztof.karas@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v5] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Topic: [PATCH i-g-t v5] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Index: AQHcirH1+vb8IhPiiUGNsnorQ4P0kbVcv+AAgADBrbU=
Date: Thu, 22 Jan 2026 03:08:33 +0000
Message-ID: <CH0PR11MB54272A5C584269304388BC589897A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260121083424.99006-1-s.sebinraj@intel.com>
 <20260121152846.cag7mv7go3anufsa@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260121152846.cag7mv7go3anufsa@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kamil.konieczny@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|CO1PR11MB4961:EE_
x-ms-office365-filtering-correlation-id: 44111c58-6160-4eb9-7746-08de59638721
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: =?big5?B?VnVSTHQvN0RWeXlQcklTWTFxZkNqOCtFTHlVSVZmVVpxam51dFE4YU9BZ3dxb0ZN?=
 =?big5?B?MmcvNjZvUzY4REY2dzM1a0ovV09OWElacGJBbW0veVFUdjByMUFIUzBmNHk3V3kr?=
 =?big5?B?NzFtTyt2Tnc3WmdFMEE5RVBKVVVIdGdZNWZFamlWMjd2U29WSGFhRGw0bWpoMHdU?=
 =?big5?B?VE9RdU9xNElveURXbUJFMG4zZHE0Q20vWWlWMFQrMjVDRnhUcyswVzNZTk82ZE9w?=
 =?big5?B?STRhQWZib09QRmRoK3VPelRrMGw2R3JWb2pmMFpKclhzK2FzTzVBS3dnbFRVYmtv?=
 =?big5?B?TzJtaGQ5endTMjIwOFhjd2w5d0w4c3VNUHh0d2dLcERQUEZORSs0RGZxTDF1R3dv?=
 =?big5?B?QUwwZndwNms2NlA2cG5sYkd6U0ltazNLSDBkLzVBdUMrUnpqRHBaelg0S0ErQk9y?=
 =?big5?B?N3hRTG1zb3JvaFJLblA1YzBkTFNzNU1Fak00cnVkeEVRMWdNRnNsMXdkcVFna3Vm?=
 =?big5?B?L1F2cDdMbmhLb1dYZGdhWHRTaGxiMUczb2xUK0dIS0NMRHgvTXlRVmxEY1l1TEtw?=
 =?big5?B?bzk1SkpwajIyZDlVZGo5emFHcUgyOTRqSTVrNkNaWlhtdlkxemVzejhPWUlyRUs0?=
 =?big5?B?dWRlTFcxZ1Rvai9ZSlBkaUZCQ3pnVHE2NnNqZmN2c0JTU3lBa09TVk11SW9mTTBi?=
 =?big5?B?OWppZXQ5YzhlNXZKbWhXSU91RnVHV0tMMStyL3UzNk5pWXcwVWpsWDZoK0xud1Jt?=
 =?big5?B?RVVIaEc1ZkcyMXNKeUxvK0l0eXRMQ2x4V1V5YjdIZDBKSUkvcktueDk0WW5NZWZQ?=
 =?big5?B?eGNIWi90UXlKWDJWdE56WlZzVDRTSlhPcTB0cHZSdHZwWmF2aXhXUHQ3QU1kMWEr?=
 =?big5?B?ai9ycTg4L2ljMW16OUdEaE9xR1BCcjJWVFVOVDFHQnRmSUpJbnRkdXRkQmRHRHpM?=
 =?big5?B?SGhQeFlmUll2dlg0eHQwQklHakpPU2F1eklrVEx5aElMYzhPN1RiS2lOSzNPZytX?=
 =?big5?B?dG96QTg5TjZLclRWSlZMME94RGIwV0JCYW9KbkhpalNKREZGZkhFN0lTKy9HSy9h?=
 =?big5?B?RDhSNlB4MC9GVDNOSGVGOTFnRE9RbUluRUZQUkZzNlRvWTdLV1VDbzhnSGc5OTFs?=
 =?big5?B?UkxDSEpuRGZwRXhqZUlQVkxLZDB4QlJFNGd1QnAxWnpIUTM4OTQ5NGJ0S2M2RmNa?=
 =?big5?B?eUxNWCszTjBabzdsbTNwNFhVdlJTUHdBeEt3OUJXdmRyalhmV0lIVllxdlhtNkZn?=
 =?big5?B?eFBYNURNaDR5SFdRK3NUc3Q4Q1hRdHhLTEdjWWsvcjZaSys4TjhMVEpuQjR3NXlH?=
 =?big5?B?RHVzajgwVWZ0alphM0hnaCtqQk55TjUxa2xYWkkxOXFWb3FaeUhQSUxrMS96OGJ4?=
 =?big5?B?ZDJRc0k5VzZQQ2t6OG50WUZ4b3laTFlZZWtERGJBYnQxZnM4VDY0UUZhMVREK1RJ?=
 =?big5?B?d0JuTTl4U01VVUdNdWFnT0dRd1NqNkVkSytaMW5PaGpldDRoTkhab0picTNpeDBC?=
 =?big5?B?VTB4c3I0azM4N2RHb3JDR01HTEJwTnE5eituSklSb3RNbUphSXhEVFRKTWhwQ1Jp?=
 =?big5?B?QWZjOXptWllXMiszdFhsa3FYYjBSZnFLMExGbk5xdGlBNzEyaS9PY04xSFJMVjAr?=
 =?big5?B?eGV5c3hIV3lIV1kzMFJJNEsyMlQ4bkY2cHJKMHJzK0ZzNjQwaERVOHNTSlJaMENP?=
 =?big5?B?V0tGRXFxS21jd0Q1ck9vdk9MLzVHUXNKbkdpR2Y4NzJ5S1FoREU3MXVrZ2taWHd5?=
 =?big5?B?M0FMWEFvaU45dURqRmlyNUg1QVM1YWRGSkZiTUxZcjUyazFpZmN3N3l6eFBvN3R0?=
 =?big5?B?UUhIQVEvbGpLNjFkcGJYd2hMZEZuSWxMOVhoMHAxZTd1OHdPdUdKd0RodnZobmdS?=
 =?big5?B?L013N2xBSUZ6aXd2SVFxUGx0dWhRYkFaUWhHMFpqdzdsbkdpcGU2VjJsakpvVXF4?=
 =?big5?B?ODNYWHRpMnRkTktoekhwVUN6anNZeERuSXFIZWs3b2lyS3BKVjF5TGoxcVRncnBV?=
 =?big5?B?ZEw4N1JCdFMzODI0K2R5NE9CakkvZytRbVNGWmF2TzE0dHF5dDcxcmRvOW1XUXhh?=
 =?big5?Q?/527LqAmmvBiz/Ta?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?dE5qNGR1WmoweVBSQUljYitzK016U0tOZkxSbnRHd0llbE9YblR5cVhZVlZCZHRF?=
 =?big5?B?eVpQK1N3ZVIwUWprSWlSdEpleEttNmdaVGJQM2kxRkJxK0t1S2ZQUDY1RWdzdHdR?=
 =?big5?B?SlVpR1VmWVpqeFdrcDJYdkMzTE1Ta0l1Zm1rYllSL0hWVDF2L25VRzlTSHJlRk9n?=
 =?big5?B?elBwL2R1M3IyNnRXV2FhNkJmN1BGNDZYcjNkTFJOZ29TQmpXeTRvUW9PS0NRQ24v?=
 =?big5?B?VFRIUThvaXBrVUVHQktvNmN2WmNaNGRLcFlzZ0pOUi82Rm5qeHAyeFYyQitCZmRW?=
 =?big5?B?N1NITTdaMSs4ZnJsL0MxQzJUMUdJYk16a3FVRkFUc2RkMXFjUWtZYlBRenFpSDVH?=
 =?big5?B?YzJUcFZTN1ZVS2dycTl1SldlS3pUblBiamc2b1hubURTSkdYSC80bmk5VTg3cXRJ?=
 =?big5?B?KzlaYUdwekZzWFJIcEZjQTZ3bXZKODZOc3ZiQUVlK0l5VlYwaWFvRlI1b0wzcUtX?=
 =?big5?B?T3dTWFhlelpvWW45NWs0VStFRGdBSlQxZ253ZDZIbk1NTkcvK3NFQ2MyanRudGVJ?=
 =?big5?B?THU4WCtVSlhKdHMvQ1ZyVXRvUXNNbXRkV05kanFNMk1nWkNJSWtuSGZ0SzVYRzBV?=
 =?big5?B?NkZ2K1ZiU01iRzAydkQvOWdtelZqaEdyYUVGby9VcURMMmRVVmN6T2FNcjBNODBq?=
 =?big5?B?YnhqcHlLcXppaWluSXVDaU9Ib2pkVVVzYjFRRGdBdDV0b2pnK09FK3JIOHpSUnN0?=
 =?big5?B?M2ZmS00wUVdPYTJlZHh0d0xmcGt3Zys0Y1VVazZSM3plSFo4Z3locnY1VXh1VFVa?=
 =?big5?B?WU1TeTV5LytabEJHSURLaEFyOEdWY1JOdDFHdWFPdmxodWV5V2NLVFJsbEh1czdM?=
 =?big5?B?aVRIeUpMVkR3OFlwWU5vVm9ibmRWS29ydjRYNC9JOGFhWG9tRjA3Q2hjNVYwVHVF?=
 =?big5?B?azNmNUJWQnR1OGE0eGtoVlRuY3lTZ3NIRC9oUlFteHU3WlFGTll3Y1VsUXNpOE51?=
 =?big5?B?dnZzZkxGbVFJS2EwVUtTdHFWcUY5ejdiQjJUSDUvQ253T0FOTjk0WG9iWHllN3Zq?=
 =?big5?B?WTloWW44eEJSTnA3WUUvdEJPQjlaSHQvbU5HWEhzWjhkUzFPUXdjOU1Dc29QTnBz?=
 =?big5?B?dEFuQmFPUGVyZkdUZkhYWGtkNWRSc2tLRzJ2eTQxM01ybjZON3BQZm9oUnEwd0ov?=
 =?big5?B?MUdQUnpaVXdmQlpMTVhGK2lJckJIQmdTcnY0RHpaajVHaXFQWUppRWRGWm9sTUpq?=
 =?big5?B?QlY5WkEvQnU3NC9COXRvMGcxZjlHOEo1STB0NExvc2czMndzczFrYzZ0M3N6b0Yr?=
 =?big5?B?Yi9ZUTZ3TEF0RVcvY1dXTnpVRHZUR25vSDQxRWFuVkJKd0E3VXpYWWZ5ajMveHFP?=
 =?big5?B?U1cxVDNqR09zUlJJTm9mSHpNdXNRbWkrVG5jZVZ5MW8rSkxjK1hxN204RFplRXYw?=
 =?big5?B?clRueTdSV1ZFQjB2WXlVT1dtd1dsbFZFejhFd1o4cWdLSUdhZk1PTUViMGRvdVFH?=
 =?big5?B?S3pOc0EvT2RvdC9vUjhlckFHY295bHNlWENTemsvNHFIVXEzeStWSHVIWEUwM1E0?=
 =?big5?B?RzIySjhic2EvQ1ZDUWc2SDZ5YWRGNFQwSTB5VFVJQXdHeERiSzA2WnQyOHlycmZK?=
 =?big5?B?SGtKTFlFQ1RDdUt5bmtFYnZyUWxDeE1IOTVwY2pxcGlER1NjVVNDNFZzY05kWFB0?=
 =?big5?B?cmhISXBuQXVIQzMzNURTV2FTM0NmMU5Wcm1pVEpZTWl3ckZIcDZTQUF1RmVZUzhz?=
 =?big5?B?ZFBocXdVWnBPRFlKckNuNFRWZUIrVXg3b0NMYS9BZk5HcWIyR3RpTmZGd20yTlN5?=
 =?big5?B?Vm1UMFVKanFVK0I2b1drMUczR3VrQmZsdlBjRExvME1xbkoxOE4zWm05TUR2YUpO?=
 =?big5?B?UmkvdjRZWXVCVHUrMzE0UXNaeGpYOEIvRzh0QVFmaEVhd3JOM2EyUXU2YW5YYTdN?=
 =?big5?B?c3UzSzR1R1FIeHc0SFJBS3JCT001dFBzVmZibVY3aEJIK1VJN2lzeThrSE5MMHB4?=
 =?big5?B?RGFWMWVxT2NJRGtFU0ZxTnZoeTNMa2JUSWI5Z0dWVmlraWMzdlkvTGR2R1FrMFFt?=
 =?big5?B?RmhmMmxTNVFQUk5uVmVwMzZua2JuQTN1WENNWGpJSU9jRUJ5anJYU0gzTHIveE9p?=
 =?big5?B?VU5IVUl5Y3lUZzdtMDIzTlVteGVuZXE4UjM4MEFxVEh1Znh5WW5uQ2VzbkVnNTVz?=
 =?big5?Q?bgPeA+xDfH4xEsbXzZfwQ8s9iCkdVVY+JYSCS0qEt+0BbSPY?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54272A5C584269304388BC589897ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44111c58-6160-4eb9-7746-08de59638721
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 03:08:33.6156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wBsCa7bRbShdRwWW0rUmvWrb/DBNNIc6vfe2JuSjWJjfgT9NdQgFYrPHSBrB6kzN4Z6DpAVHCKg6DbyLcQIy1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4961
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

--_000_CH0PR11MB54272A5C584269304388BC589897ACH0PR11MB5427namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwg
SmFudWFyeSAyMSwgMjAyNiA4OjU4IFBNDQpUbzogU2ViaW5yYWosIFMgPHMuc2ViaW5yYWpAaW50
ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz47IEthcmFzLCBLcnp5c3p0b2YgPGtyenlzenRvZi5rYXJhc0BpbnRl
bC5jb20+OyBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBQdXJr
YWl0LCBTb2hhbSA8c29oYW0ucHVya2FpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IGktZy10IHY1XSB0b29scy9ncHV0b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVu
dCBoZWFkZXJzDQoNCkhpLA0KT24gMjAyNi0wMS0yMSBhdCAxNDowNDoyNCArMDUzMCwgUyBTZWJp
bnJhaiB3cm90ZToNCj4gRW5oYW5jZSBncHV0b3AgdG8gZGlzcGxheSBHUFUgZnJlcXVlbmN5IGlu
Zm9ybWF0aW9uIChjdXJyZW50L2FjdHVhbCkNCj4gZm9yIGVhY2ggR1QgaW4gdGhlIGNsaWVudCBo
ZWFkZXIgbGluZSBhbG9uZ3NpZGUgdGhlIERSTSBtaW5vciBudW1iZXIuDQo+DQo+IEtleSBjaGFu
Z2VzOg0KPiAtIEFkZCBnZXRfZ3RfZnJlcXVlbmNpZXMoKSBmdW5jdGlvbiB0byByZWFkIEdUIGZy
ZXF1ZW5jeSB2YWx1ZXMNCj4gLSBTdXBwb3J0IGJvdGggaTkxNSBhbmQgWGUgZHJpdmVycyB1c2lu
ZyBhcHByb3ByaWF0ZSBzeXNmcyBwYXRocw0KPiAtIERpc3BsYXkgZm9ybWF0OiAiRFJNIG1pbm9y
IFggIEZyZXEoY3VyL2FjdCkgR1QwLWZyZXEvZnJlcSBHVDEtZnJlcS9mcmVxIg0KPiAtIERyaXZl
ci1hZ25vc3RpYyBzeXNmcyBhY2Nlc3MNCj4NCj4gVGhlIGZyZXF1ZW5jeSBpbmZvcm1hdGlvbiBo
ZWxwcyB1c2VycyBtb25pdG9yIEdQVSBwZXJmb3JtYW5jZSBzdGF0ZXMNCj4gaW4gcmVhbC10aW1l
IHdoaWxlIG9ic2VydmluZyBjbGllbnQgd29ya2xvYWQgdXRpbGl6YXRpb24uDQo+DQo+IEV4YW1w
bGUgb3V0cHV0Og0KPiAgIERSTSBtaW5vciAwICAgICAgICAgIEZyZXEoY3VyL2FjdCkgR1QwLTE4
MDAvMTgwMCBHVDEtNDAwLzQwMA0KPiAgIERSTSBtaW5vciAxMjggICAgICAgIEZyZXEoY3VyL2Fj
dCkgR1QwLTQwMC80MDAgR1QxLTQwMC80MDANCj4NCj4gdjI6DQo+IC0gVG8gdXNlIG1hY3JvIHRv
IHN1ZmZpeCBzdHJpbmdzDQo+IC0gVG8gc2tpcCBmYWlsdXJlIGxvb3BzDQo+DQo+IHYzOg0KPiAt
IFRvIGtlZXAgZXJyb3IgbG9ncw0KPg0KPiB2NDoNCj4gLSBSZW1vdmVkIFJGQyBmcm9tIFN1Ympl
Y3QNCj4NCj4gdjU6DQo+IC0gRmFsbGJhY2sgdG8gbm9ybWFsIHN5c2ZzIHJlYWQgaW5zdGVhZCBv
ZiB1c2luZyBsaWIgYXBpJ3MNCj4gICBhcyBpdCBpbmNyZWFzZWQgdGhlIGRlcGVuZGVuY2llcyBo
aWdobHkNCg0KVGhhbmsgeW91IGZvciB0aGlzIGNoYW5nZS4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTIFNlYmlucmFqIDxzLnNlYmlucmFqQGludGVsLmNvbT4NCj4gVGVzdGVkLWJ5OiBLYXJhcyBL
cnp5c3p0b2YgPGtyenlzenRvZi5rYXJhc0BpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBLYXJh
cyBLcnp5c3p0b2YgPGtyenlzenRvZi5rYXJhc0BpbnRlbC5jb20+DQoNCj4gV2hlbiB5b3UgbWFk
ZSBhIGJpZyBjaGFuZ2Ugd2hpY2ggd2FzIG5vdCBhZ3JlZWQgYnkgcmV2aWV3ZXIsDQp5b3Ugc2hv
dWxkIHJlbW92ZSBpdHMgJ1Jldmlld2VkLWJ5JyBmcm9tIG5ldyB2ZXJzaW9uLiBTYW1lDQphcHBs
eSBmb3IgdGhlIFRlc3RlZC1ieS4NCg0KU3VyZSwgSSBsZWZ0IHRoaXMgb3V0LiBJJ2xsIGNvcnJl
Y3QgdGhlIHNhbWUuDQoNCj4gLS0tDQo+ICB0b29scy9ncHV0b3AuYyB8IDE0NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTQzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS90
b29scy9ncHV0b3AuYyBiL3Rvb2xzL2dwdXRvcC5jDQo+IGluZGV4IGY1NzdhMTc1MC4uZmI2Yzll
MTNjIDEwMDY0NA0KPiAtLS0gYS90b29scy9ncHV0b3AuYw0KPiArKysgYi90b29scy9ncHV0b3Au
Yw0KPiBAQCAtMzAsMTMgKzMwLDIwIEBADQo+ICAjaW5jbHVkZSAiaWd0X2RybV9jbGllbnRzLmgi
DQo+ICAjaW5jbHVkZSAiaWd0X2RybV9mZGluZm8uaCINCj4gICNpbmNsdWRlICJpZ3RfcHJvZmls
aW5nLmgiDQo+IC0jaW5jbHVkZSAiZHJtdGVzdC5oIg0KPg0KPiAgZW51bSB1dGlsaXphdGlvbl90
eXBlIHsNCj4gICAgICAgIFVUSUxJWkFUSU9OX1RZUEVfRU5HSU5FX1RJTUUsDQo+ICAgICAgICBV
VElMSVpBVElPTl9UWVBFX1RPVEFMX0NZQ0xFUywNCj4gIH07DQo+DQo+ICsjZGVmaW5lIFhFX0ZS
RVFfQ1VSX1NVRkZJWCAiL2ZyZXEwL2N1cl9mcmVxIg0KPiArI2RlZmluZSBYRV9GUkVRX0FDVF9T
VUZGSVggIi9mcmVxMC9hY3RfZnJlcSINCj4gKyNkZWZpbmUgSTkxNV9GUkVRX0NVUl9TVUZGSVgg
Ii9ycHNfY3VyX2ZyZXFfbWh6Ig0KPiArI2RlZmluZSBJOTE1X0ZSRVFfQUNUX1NVRkZJWCAiL3Jw
c19hY3RfZnJlcV9taHoiDQo+ICsNCj4gKyNkZWZpbmUgTUFYX0dUUyA4DQo+ICsjZGVmaW5lIEFS
UkFZX1NJWkUoYXJyKSAoc2l6ZW9mKGFycikgLyBzaXplb2YoKGFycilbMF0pKQ0KPiArDQoNCj5U
aGVzZSBhcmUgZHJpdmVyLXNwZWNpZmljIGFuZCBzaG91bGQgZ28gaW50byB4ZV9ncHV0b3AuYw0K
aW4gYSBwYXRjaHNlcmllcyBzZW50IGJ5IFNvaGFtLCBzZWUNCmh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU4MTYxLw0KQ2xvc2UgYW55IG9wZW4gZHJtIGRldmljZSBh
ZnRlciBlbmdpbmUgaW5pdGlhbGl6YXRpb24gaW4gR1BVVE9QDQoNCitjYyBTb2hhbSBQdXJrYWl0
IDxzb2hhbS5wdXJrYWl0QGludGVsLmNvbT4NCg0KSGkgQEthbWlsIEtvbmllY3pueTxtYWlsdG86
a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gSSB3YXMgbG9va2luZyB0byBtYWtlIHRo
aXMgYXMgbGlnaHdlaWdodCBhcyBwb3NzaWJsZSwgaGVyZSB3aGVuIGNoZWNrZWQgeGVfZ3B1dG9w
IGluY2x1ZGVzIGhlYXZ5IGxpYnJhcmllcyBzdWNoIGFzIGdsaWIgd2hpY2ggYXJlIG5vdCBjb21w
YXRpYmxlIHdpdGggQW5kcm9pZC4NCkFsc28gbW92aW5nIHRoZXNlIGRlZmluaXRpb25zIGFuZCB0
aGVyZSB0aGVuIGluY2x1ZGluZyB0aGUgaGVhZGVyICh4ZV9ncHV0b3ApIGZvciB0aGlzIHJlYXNv
biBhbG9uZSBpbmNyZWFzZXMgdGhlIGRlcGVuZGVuY3kuDQpBbHNvIEkgYmVsaWV2ZSB0aGlzIHBh
dGNoIGJ5IFB1cmthaXQgaXMgc3RpbGwgYSBXSVAuDQoNCj4gIHN0YXRpYyBjb25zdCBjaGFyICpi
YXJzW10gPSB7ICIgIiwgIqJqIiwgIqJrIiwgIqJsIiwgIqJtIiwgIqJuIiwgIqJvIiwgIqJwIiwg
IqJpIiB9Ow0KPg0KPiAgI2RlZmluZSBBTlNJX0hFQURFUiAiXDAzM1s3bSINCj4gQEAgLTc2LDE3
ICs4MywxNTEgQEAgc3RhdGljIHZvaWQgcHJpbnRfcGVyY2VudGFnZV9iYXIoZG91YmxlIHBlcmNl
bnQsIGludCBtYXhfbGVuKQ0KPiAgICAgICAgcHV0Y2hhcignfCcpOw0KPiAgfQ0KPg0KPiArLyog
RGV0ZWN0IGlmIHRoaXMgaXMgYSBYZSBkcml2ZXIgYnkgY2hlY2tpbmcgZm9yIFhlLXNwZWNpZmlj
IHN5c2ZzIHN0cnVjdHVyZSAqLw0KPiArc3RhdGljIGJvb2wgZGV0ZWN0X3hlX2RyaXZlcih1bnNp
Z25lZCBpbnQgZHJtX21pbm9yKQ0KPiArew0KPiArICAgICBjaGFyIHBhdGhbMjU2XTsNCj4gKyAg
ICAgc3RydWN0IHN0YXQgc3Q7DQo+ICsNCj4gKyAgICAgLyogWGUgZHJpdmVyIGhhcyBkZXZpY2Uv
dGlsZTAgZGlyZWN0b3J5ICovDQo+ICsgICAgIHNucHJpbnRmKHBhdGgsIHNpemVvZihwYXRoKSwg
Ii9zeXMvY2xhc3MvZHJtL2NhcmQldS9kZXZpY2UvdGlsZTAiLCBkcm1fbWlub3IpOw0KPiArICAg
ICByZXR1cm4gKHN0YXQocGF0aCwgJnN0KSA9PSAwICYmIFNfSVNESVIoc3Quc3RfbW9kZSkpOw0K
PiArfQ0KPiArDQo+ICsvKiBDb3VudCB0aGUgbnVtYmVyIG9mIEdUcyBieSBjaGVja2luZyB3aGlj
aCBndCogZGlyZWN0b3JpZXMgZXhpc3QgKi8NCj4gK3N0YXRpYyBpbnQgZ2V0X251bV9ndHModW5z
aWduZWQgaW50IGRybV9taW5vciwgYm9vbCBpc194ZSkNCj4gK3sNCj4gKyAgICAgY2hhciBwYXRo
WzI1Nl07DQo+ICsgICAgIHN0cnVjdCBzdGF0IHN0Ow0KPiArICAgICBpbnQgZ3RfY291bnQgPSAw
Ow0KPiArDQo+ICsgICAgIC8qIENoZWNrIGZvciBndDAsIGd0MSwgZ3QyLCBldGMuIHVwIHRvIGEg
cmVhc29uYWJsZSBtYXhpbXVtICovDQo+ICsgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgTUFYX0dU
UzsgaSsrKSB7DQo+ICsgICAgICAgICAgICAgaWYgKGlzX3hlKQ0KPiArICAgICAgICAgICAgICAg
ICAgICAgLyogRm9yIFhlLCBhbGwgR1RzIGFyZSB1bmRlciB0aWxlMCAqLw0KPiArICAgICAgICAg
ICAgICAgICAgICAgc25wcmludGYocGF0aCwgc2l6ZW9mKHBhdGgpLCAiL3N5cy9jbGFzcy9kcm0v
Y2FyZCV1L2RldmljZS90aWxlMC9ndCVkIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRybV9taW5vciwgaSk7DQo+ICsgICAgICAgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgc25wcmludGYocGF0aCwgc2l6ZW9mKHBhdGgpLCAiL3N5cy9jbGFzcy9kcm0vY2Fy
ZCV1L2d0L2d0JWQiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX21pbm9y
LCBpKTsNCj4gKw0KPiArICAgICAgICAgICAgIGlmIChzdGF0KHBhdGgsICZzdCkgPT0gMCAmJiBT
X0lTRElSKHN0LnN0X21vZGUpKQ0KPiArICAgICAgICAgICAgICAgICAgICAgZ3RfY291bnQrKzsN
Cj4gKyAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsgIC8q
IEFzc3VtZSBHVHMgYXJlIG51bWJlcmVkIHNlcXVlbnRpYWxseSAqLw0KPiArICAgICB9DQo+ICsN
Cj4gKyAgICAgcmV0dXJuIGd0X2NvdW50ID4gMCA/IGd0X2NvdW50IDogMTsgIC8qIEF0IGxlYXN0
IDEgR1Qgc2hvdWxkIGV4aXN0ICovDQo+ICt9DQo+ICsNCj4gKy8qIFJlYWQgYSBzaW5nbGUgZnJl
cXVlbmN5IHZhbHVlIGZyb20gc3lzZnMgKi8NCj4gK3N0YXRpYyBib29sIHJlYWRfZnJlcV92YWx1
ZShjb25zdCBjaGFyICpwYXRoLCB1bnNpZ25lZCBpbnQgKmZyZXEpDQo+ICt7DQo+ICsgICAgIEZJ
TEUgKmZwOw0KPiArICAgICBjaGFyIGJ1ZlszMl07DQo+ICsgICAgIGJvb2wgc3VjY2VzcyA9IGZh
bHNlOw0KPiArDQo+ICsgICAgIGZwID0gZm9wZW4ocGF0aCwgInIiKTsNCj4gKyAgICAgaWYgKGZw
KSB7DQo+ICsgICAgICAgICAgICAgaWYgKGZnZXRzKGJ1Ziwgc2l6ZW9mKGJ1ZiksIGZwKSkgew0K
PiArICAgICAgICAgICAgICAgICAgICAgKmZyZXEgPSBhdG9pKGJ1Zik7DQo+ICsgICAgICAgICAg
ICAgICAgICAgICBzdWNjZXNzID0gdHJ1ZTsNCj4gKyAgICAgICAgICAgICB9DQo+ICsgICAgICAg
ICAgICAgZmNsb3NlKGZwKTsNCj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIHJldHVybiBzdWNjZXNz
Ow0KPiArfQ0KPiArDQo+ICtzdGF0aWMgY2hhciAqZ2V0X2d0X2ZyZXF1ZW5jaWVzKHVuc2lnbmVk
IGludCBkcm1fbWlub3IpDQo+ICt7DQo+ICsgICAgIGNoYXIgZnJlcV9zdHJbNTEyXSA9ICIiOw0K
PiArICAgICBjaGFyIGd0X2luZm9bNjRdOw0KPiArICAgICBpbnQgbnVtX2d0czsNCj4gKyAgICAg
aW50IGd0Ow0KPiArICAgICBib29sIGlzX3hlOw0KPiArICAgICBib29sIGZpcnN0ID0gdHJ1ZTsN
Cj4gKw0KPiArICAgICAvKiBEZXRlY3QgZHJpdmVyIHR5cGUgZnJvbSBzeXNmcyBzdHJ1Y3R1cmUg
Ki8NCj4gKyAgICAgaXNfeGUgPSBkZXRlY3RfeGVfZHJpdmVyKGRybV9taW5vcik7DQo+ICsNCj4g
KyAgICAgLyogR2V0IEdUIGNvdW50IGZyb20gc3lzZnMgKi8NCj4gKyAgICAgbnVtX2d0cyA9IGdl
dF9udW1fZ3RzKGRybV9taW5vciwgaXNfeGUpOw0KPiArICAgICBpZiAobnVtX2d0cyA8PSAwKQ0K
PiArICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiArDQo+ICsgICAgIC8qIFJlYWQgZnJlcXVl
bmNpZXMgZm9yIGVhY2ggR1QgKi8NCj4gKyAgICAgZm9yIChndCA9IDA7IGd0IDwgbnVtX2d0czsg
Z3QrKykgew0KPiArICAgICAgICAgICAgIGNoYXIgZnJlcV9wYXRoWzI1Nl07DQo+ICsgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGN1cl9mcmVxID0gMCwgYWN0X2ZyZXEgPSAwOw0KPiArICAgICAg
ICAgICAgIGJvb2wgaGFzX2N1ciA9IGZhbHNlLCBoYXNfYWN0ID0gZmFsc2U7DQo+ICsNCj4gKyAg
ICAgICAgICAgICAvKiBSZWFkIGN1cnJlbnQvcmVxdWVzdGVkIGZyZXF1ZW5jeSAqLw0KPiArICAg
ICAgICAgICAgIGlmIChpc194ZSkNCj4gKyAgICAgICAgICAgICAgICAgICAgIHNucHJpbnRmKGZy
ZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0aCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiL3N5cy9jbGFzcy9kcm0vY2FyZCV1L2RldmljZS90aWxlMC9ndCVkJXMiLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX21pbm9yLCBndCwgWEVfRlJFUV9DVVJfU1VG
RklYKTsNCj4gKyAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgICBzbnBy
aW50ZihmcmVxX3BhdGgsIHNpemVvZihmcmVxX3BhdGgpLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIi9zeXMvY2xhc3MvZHJtL2NhcmQldS9ndC9ndCVkJXMiLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZHJtX21pbm9yLCBndCwgSTkxNV9GUkVRX0NVUl9TVUZG
SVgpOw0KPiArDQo+ICsgICAgICAgICAgICAgaGFzX2N1ciA9IHJlYWRfZnJlcV92YWx1ZShmcmVx
X3BhdGgsICZjdXJfZnJlcSk7DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBSZWFkIGFjdHVhbCBm
cmVxdWVuY3kgKi8NCj4gKyAgICAgICAgICAgICBpZiAoaXNfeGUpDQo+ICsgICAgICAgICAgICAg
ICAgICAgICBzbnByaW50ZihmcmVxX3BhdGgsIHNpemVvZihmcmVxX3BhdGgpLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIi9zeXMvY2xhc3MvZHJtL2NhcmQldS9kZXZpY2UvdGls
ZTAvZ3QlZCVzIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9taW5vciwg
Z3QsIFhFX0ZSRVFfQUNUX1NVRkZJWCk7DQo+ICsgICAgICAgICAgICAgZWxzZQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgc25wcmludGYoZnJlcV9wYXRoLCBzaXplb2YoZnJlcV9wYXRoKSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIvc3lzL2NsYXNzL2RybS9jYXJkJXUvZ3Qv
Z3QlZCVzIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9taW5vciwgZ3Qs
IEk5MTVfRlJFUV9BQ1RfU1VGRklYKTsNCj4gKw0KPiArICAgICAgICAgICAgIGhhc19hY3QgPSBy
ZWFkX2ZyZXFfdmFsdWUoZnJlcV9wYXRoLCAmYWN0X2ZyZXEpOw0KPiArDQo+ICsgICAgICAgICAg
ICAgLyogU2tpcCB0aGlzIEdUIGlmIHdlIGNvdWxkbid0IHJlYWQgYW55IGZyZXF1ZW5jeSAqLw0K
PiArICAgICAgICAgICAgIGlmICghaGFzX2N1ciAmJiAhaGFzX2FjdCkNCj4gKyAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOw0KPiArDQo+ICsgICAgICAgICAgICAgLyogQXBwZW5kIHRvIGZy
ZXF1ZW5jeSBzdHJpbmcgKi8NCj4gKyAgICAgICAgICAgICBpZiAoIWZpcnN0KQ0KPiArICAgICAg
ICAgICAgICAgICAgICAgc3RyY2F0KGZyZXFfc3RyLCAiICIpOw0KPiArICAgICAgICAgICAgIGVs
c2UNCj4gKyAgICAgICAgICAgICAgICAgICAgIGZpcnN0ID0gZmFsc2U7DQo+ICsNCj4gKyAgICAg
ICAgICAgICBzbnByaW50ZihndF9pbmZvLCBzaXplb2YoZ3RfaW5mbyksICJHVCVkLSV1LyV1Iiwg
Z3QsIGN1cl9mcmVxLCBhY3RfZnJlcSk7DQo+ICsgICAgICAgICAgICAgc3RyY2F0KGZyZXFfc3Ry
LCBndF9pbmZvKTsNCj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIGlmIChzdHJsZW4oZnJlcV9zdHIp
ID4gMCkNCj4gKyAgICAgICAgICAgICByZXR1cm4gc3RyZHVwKGZyZXFfc3RyKTsNCj4gKw0KPiAr
ICAgICByZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludA0KPiAgcHJpbnRfY2xp
ZW50X2hlYWRlcihzdHJ1Y3QgaWd0X2RybV9jbGllbnQgKmMsIGludCBsaW5lcywgaW50IGNvbl93
LCBpbnQgY29uX2gsDQo+ICAgICAgICAgICAgICAgICAgICBpbnQgKmVuZ2luZV93KQ0KPiAgew0K
PiAgICAgICAgaW50IHJldCwgbGVuOw0KPiArICAgICBjaGFyICpmcmVxX2luZm8gPSBOVUxMOw0K
Pg0KPiAgICAgICAgaWYgKGxpbmVzKysgPj0gY29uX2gpDQo+ICAgICAgICAgICAgICAgIHJldHVy
biBsaW5lczsNCj4NCj4gICAgICAgIHByaW50ZihBTlNJX0hFQURFUik7DQo+IC0gICAgIHJldCA9
IHByaW50ZigiRFJNIG1pbm9yICV1IiwgYy0+ZHJtX21pbm9yKTsNCj4gKw0KPiArICAgICAvKiBH
ZXQgZnJlcXVlbmN5IGluZm9ybWF0aW9uICovDQo+ICsgICAgIGZyZXFfaW5mbyA9IGdldF9ndF9m
cmVxdWVuY2llcyhjLT5kcm1fbWlub3IpOw0KDQo+QmV0dGVyOg0KICAgICAgICBmcmVxX2luZm8g
PSBnZXRfZnJlcXVlbmNpZXMoYy0+ZHJtX21pbm9yKTsNCg0KSSBoYXZlIGNoYW5nZWQgdGhpcy4N
Cg0KPiArDQo+ICsgICAgIGlmIChmcmVxX2luZm8pIHsNCj4gKyAgICAgICAgICAgICByZXQgPSBw
cmludGYoIkRSTSBtaW5vciAldSAgICAgICAgICBGcmVxKGN1ci9hY3QpICVzIiwgYy0+ZHJtX21p
bm9yLCBmcmVxX2luZm8pOw0KDQo+SXQgbG9va3MgZHJpdmVyIGRlcGVuZGVudCwgaW1obyBiZXR0
ZXI6DQpPa2F5IGdvdCBpdCwgSSBoYXZlIHVwZGF0ZWQgdGhlIHNhbWUNCg0KcmV0ID0gcHJpbnRm
KCJEUk0gbWlub3IgJXUgIEZyZXF1ZW5jeShNSHopICVzIiwgYy0+ZHJtX21pbm9yLCBmcmVxX2lu
Zm8pOw0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiArICAgICAgICAgICAgIGZyZWUoZnJlcV9pbmZv
KTsNCj4gKyAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgICByZXQgPSBwcmludGYoIkRSTSBt
aW5vciAldSIsIGMtPmRybV9taW5vcik7DQo+ICsgICAgIH0NCj4gKw0KPiAgICAgICAgbl9zcGFj
ZXMoY29uX3cgLSByZXQpOw0KPg0KPiAgICAgICAgaWYgKGxpbmVzKysgPj0gY29uX2gpDQo+IC0t
DQo+IDIuNDMuMA0KPg0K

--_000_CH0PR11MB54272A5C584269304388BC589897ACH0PR11MB5427namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Wednesday, January 21, 2026 8:58 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;; Konieczny, Ka=
mil &lt;kamil.konieczny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.k=
empczynski@intel.com&gt;; Purkait, Soham &lt;soham.purkait@intel.com&gt;<br=
>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v5] tools/gputop: Add GPU frequencies=
 to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi,<br>
On 2026-01-21 at 14:04:24 +0530, S Sebinraj wrote:<br>
&gt; Enhance gputop to display GPU frequency information (current/actual)<b=
r>
&gt; for each GT in the client header line alongside the DRM minor number.<=
br>
&gt;<br>
&gt; Key changes:<br>
&gt; - Add get_gt_frequencies() function to read GT frequency values<br>
&gt; - Support both i915 and Xe drivers using appropriate sysfs paths<br>
&gt; - Display format: &quot;DRM minor X&nbsp; Freq(cur/act) GT0-freq/freq =
GT1-freq/freq&quot;<br>
&gt; - Driver-agnostic sysfs access<br>
&gt;<br>
&gt; The frequency information helps users monitor GPU performance states<b=
r>
&gt; in real-time while observing client workload utilization.<br>
&gt;<br>
&gt; Example output:<br>
&gt;&nbsp;&nbsp; DRM minor 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Freq(cur/act) GT0-1800/1800 GT1-400/400<br>
&gt;&nbsp;&nbsp; DRM minor 128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fr=
eq(cur/act) GT0-400/400 GT1-400/400<br>
&gt;<br>
&gt; v2:<br>
&gt; - To use macro to suffix strings<br>
&gt; - To skip failure loops<br>
&gt;<br>
&gt; v3:<br>
&gt; - To keep error logs<br>
&gt;<br>
&gt; v4:<br>
&gt; - Removed RFC from Subject<br>
&gt;<br>
&gt; v5:<br>
&gt; - Fallback to normal sysfs read instead of using lib api's<br>
&gt;&nbsp;&nbsp; as it increased the dependencies highly<br>
<br>
Thank you for this change.<br>
<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; Tested-by: Karas Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
&gt; Reviewed-by: Karas Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<br>
&gt; When you made a big change which was not agreed by reviewer,<br>
you should remove its 'Reviewed-by' from new version. Same<br>
apply for the Tested-by.<br>
<br>
Sure, I left this out. I'll correct the same.<br>
<br>
&gt; ---<br>
&gt;&nbsp; tools/gputop.c | 145 +++++++++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;&nbsp; 1 file changed, 143 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/gputop.c b/tools/gputop.c<br>
&gt; index f577a1750..fb6c9e13c 100644<br>
&gt; --- a/tools/gputop.c<br>
&gt; +++ b/tools/gputop.c<br>
&gt; @@ -30,13 +30,20 @@<br>
&gt;&nbsp; #include &quot;igt_drm_clients.h&quot;<br>
&gt;&nbsp; #include &quot;igt_drm_fdinfo.h&quot;<br>
&gt;&nbsp; #include &quot;igt_profiling.h&quot;<br>
&gt; -#include &quot;drmtest.h&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; enum utilization_type {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_ENGINE_TIME=
,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_TOTAL_CYCLE=
S,<br>
&gt;&nbsp; };<br>
&gt;&nbsp;<br>
&gt; +#define XE_FREQ_CUR_SUFFIX &quot;/freq0/cur_freq&quot;<br>
&gt; +#define XE_FREQ_ACT_SUFFIX &quot;/freq0/act_freq&quot;<br>
&gt; +#define I915_FREQ_CUR_SUFFIX &quot;/rps_cur_freq_mhz&quot;<br>
&gt; +#define I915_FREQ_ACT_SUFFIX &quot;/rps_act_freq_mhz&quot;<br>
&gt; +<br>
&gt; +#define MAX_GTS 8<br>
&gt; +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))<br>
&gt; +<br>
<br>
&gt;These are driver-specific and should go into xe_gputop.c<br>
in a patchseries sent by Soham, see<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAd305eb8a-9c3e=
-2fbe-e8b8-b21306e43d18" href=3D"https://patchwork.freedesktop.org/series/1=
58161/">https://patchwork.freedesktop.org/series/158161/</a><br>
Close any open drm device after engine initialization in GPUTOP<br>
<br>
+cc Soham Purkait &lt;soham.purkait@intel.com&gt;</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi <a class=3D"tWK=
Ou mention ms-bgc-nlr ms-fcl-b" id=3D"OWAAM5656" href=3D"mailto:kamil.konie=
czny@linux.intel.com">
@Kamil Konieczny</a>&nbsp;I was looking to make this as lighweight as possi=
ble, here when checked xe_gputop includes heavy libraries such as glib whic=
h are not compatible with Android.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Also moving these =
definitions and there then including the header (xe_gputop) for this reason=
 alone increases the dependency.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Also I believe thi=
s patch by Purkait is still a WIP.<br>
<br>
&gt;&nbsp; static const char *bars[] =3D { &quot; &quot;, &quot;=A2j&quot;,=
 &quot;=A2k&quot;, &quot;=A2l&quot;, &quot;=A2m&quot;, &quot;=A2n&quot;, &q=
uot;=A2o&quot;, &quot;=A2p&quot;, &quot;=A2i&quot; };<br>
&gt;&nbsp;<br>
&gt;&nbsp; #define ANSI_HEADER &quot;\033[7m&quot;<br>
&gt; @@ -76,17 +83,151 @@ static void print_percentage_bar(double percent, =
int max_len)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; putchar('|');<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +/* Detect if this is a Xe driver by checking for Xe-specific sysfs st=
ructure */<br>
&gt; +static bool detect_xe_driver(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Xe driver has device/tile0 directory */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;/sys/clas=
s/drm/card%u/device/tile0&quot;, drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (stat(path, &amp;st) =3D=3D 0 &amp;&a=
mp; S_ISDIR(st.st_mode));<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Count the number of GTs by checking which gt* directories exist */=
<br>
&gt; +static int get_num_gts(unsigned int drm_minor, bool is_xe)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt_count =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check for gt0, gt1, gt2, etc. up to a rea=
sonable maximum */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; MAX_GTS; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For Xe, all GTs are =
under tile0 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;/sys/class/drm/card%u/device/tile0/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;/sys/class/drm/card%u/gt/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, i);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (stat(path, &amp;st) =3D=3D 0 &amp;&amp; S_ISDIR(st.st_mode))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt_count++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;&nbsp; /* Assume =
GTs are numbered sequentially */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return gt_count &gt; 0 ? gt_count : 1;&nbsp;=
 /* At least 1 GT should exist */<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Read a single frequency value from sysfs */<br>
&gt; +static bool read_freq_value(const char *path, unsigned int *freq)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char buf[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool success =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fp =3D fopen(path, &quot;r&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fgets(buf, sizeof(buf), fp)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *freq =3D atoi(buf);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; success =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fclose(fp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return success;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static char *get_gt_frequencies(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char freq_str[512] =3D &quot;&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char gt_info[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_gts;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool is_xe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool first =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Detect driver type from sysfs structure *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; is_xe =3D detect_xe_driver(drm_minor);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get GT count from sysfs */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; num_gts =3D get_num_gts(drm_minor, is_xe);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_gts &lt;=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read frequencies for each GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (gt =3D 0; gt &lt; num_gts; gt++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char freq_path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; unsigned int cur_freq =3D 0, act_freq =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool has_cur =3D false, has_act =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read current/requested frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/device/tile0/gt%=
d%s&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt, XE_FREQ_CUR_SUFFIX);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/gt/gt%d%s&quot;,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt, I915_FREQ_CUR_SUFFIX);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; has_cur =3D read_freq_value(freq_path, &amp;cur_freq);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read actual frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (is_xe)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/device/tile0/gt%=
d%s&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt, XE_FREQ_ACT_SUFFIX);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/gt/gt%d%s&quot;,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt, I915_FREQ_ACT_SUFFIX);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; has_act =3D read_freq_value(freq_path, &amp;act_freq);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Skip this GT if we couldn't read any frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!has_cur &amp;&amp; !has_act)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Append to frequency string */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!first)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(freq_str, &quot;=
 &quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; snprintf(gt_info, sizeof(gt_info), &quot;GT%d-%u/%u&quot;, gt, cur_freq=
, act_freq);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; strcat(freq_str, gt_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (strlen(freq_str) &gt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return strdup(freq_str);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static int<br>
&gt;&nbsp; print_client_header(struct igt_drm_client *c, int lines, int con=
_w, int con_h,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *engine_w)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, len;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *freq_info =3D NULL;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return lines;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(ANSI_HEADER);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D printf(&quot;DRM minor %u&quot;, c-&=
gt;drm_minor);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get frequency information */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; freq_info =3D get_gt_frequencies(c-&gt;drm_m=
inor);<br>
<br>
&gt;Better:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_info =3D get_frequencies(c-=
&gt;drm_minor);</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">I have changed thi=
s.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; Freq(cur/act) %s&quot;, c-&gt;drm_minor, freq_info);<br>
<br>
&gt;It looks driver dependent, imho better:</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Okay got it, I hav=
e updated the same<br>
<br>
ret =3D printf(&quot;DRM minor %u&nbsp; Frequency(MHz) %s&quot;, c-&gt;drm_=
minor, freq_info);<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; free(freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&quot;, c-&gt;drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_spaces(con_w - ret);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB54272A5C584269304388BC589897ACH0PR11MB5427namp_--
