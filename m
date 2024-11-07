Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86656D5D69D
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 22:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD0910E328;
	Thu,  7 Nov 2024 22:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXDPt7YJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA5B10E328
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 22:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019979; x=1762555979;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AgGUTnOY8VbOGGcCObj7KWhGwDWRXCswf1Q4MVocCOM=;
 b=kXDPt7YJY6PqeKI6reY+fusiQmyrW148t+qWol36NeAda7uj+C++Fyri
 1QJp41DqTS/E2gHIauCk5eHt9ha8IjbUfF1OdIS57V50os/diGnjwAMp6
 sx0PFGTe1sE1vIt04nhKR9/fHCThxtItlM/ammTbLxhAk4ERuhdHQu7bC
 TeuQOs/Z6Qok+yXPwdPrVXq6Ru9TX1IiMs5S6/A+ysMRZx+IIpvnlRbMg
 NDgQGewFYKxBcaVKhbvODnjp0bUYtaBY6A8/w0CPCp0re/9K5g/Tqe4Sl
 s0oSiC58pw12VgGC1eNWbcPa/7ct9M5cvEAEoJ2wjABFwoI39fT/zqMLZ g==;
X-CSE-ConnectionGUID: 5rMzUH3VS8uBBJuI5JFkxg==
X-CSE-MsgGUID: ARTe7h5wR2GV3b8GMVicuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42265324"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="42265324"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:58 -0800
X-CSE-ConnectionGUID: BHRVnuP2Q3e8GW3QR+mg9A==
X-CSE-MsgGUID: 1U0uurMTTySaIfafoCYGkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="116124870"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 14:52:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 14:52:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 14:52:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 14:52:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HooPOeXSerXQ756+IaXmYnZrs6M1I5NeOc8M3ObH23Spq+UlIgMpTHaSDGULfyvuKIK/a+0MxLdarEy9JU4HUYEdH/NTFfdzgoU3VtI6ZKyRwrP3b12cY7yMd7kDa+f24VgBDR1lleHY3GYO3FXigBG5bNgwKCv59osGX/NrFqxlablmoSwpFY+2Am5ArQpjLNIb2iDPIvgzf16Tvh91CFWMuBy1FOPxU3Geto1HrjYF6dgTKipawAWW8dtFDc2qQHvwHpnU5W/4ncVjjPgDhoKmFHKsnF0i/T/2l0ZVilJjo4Sxko1JR5BJkYRj63AJD52sDKDgMLl7hu5CP9XlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgGUTnOY8VbOGGcCObj7KWhGwDWRXCswf1Q4MVocCOM=;
 b=C2rLcG+XImhJpLszzwf9QeqDacUMxSIkLeyy3dMiPxcIrpTTZvvK8lYv3eEDo18eyYW/K6XcY9BL2GRo2z+yhNP4WddPymvkJzcUsDEHiaU0YUz/6UqCfTtRAAiQwYkER2Lk8TB61L5tzYjpdsHbuG3hvEikTx2dtzVUlxPzufw53RMaMXE4yPPbWpKnDCOGOZycx2RZNsJinkeqhCGUG78EPPQm+migRYpiqfNUXr6gTfQrC2vZUkMNsJL6+rxOgrZydwLCY5AsWdHdHTEuQ74M0QBXuouZ2crzogNBMivUA0We8hQMM3ixEwes13TDQxXrfHvrqNhO0kCrRTao8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Thu, 7 Nov
 2024 22:52:51 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 22:52:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 1/2] tests/intel/xe_sysfs*: Restore values on test
 failure
Thread-Topic: [PATCH v4 1/2] tests/intel/xe_sysfs*: Restore values on test
 failure
Thread-Index: AQHbL78CccnK9AxREEWZCmZCDRry+LKsHzUAgABPorA=
Date: Thu, 7 Nov 2024 22:52:51 +0000
Message-ID: <CH0PR11MB54446DA594578D8357C649B2E55C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241105201143.159491-1-jonathan.cavitt@intel.com>
 <20241105201143.159491-2-jonathan.cavitt@intel.com>
 <20241107180330.kekb3usn5br7yxxl@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241107180330.kekb3usn5br7yxxl@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CO1PR11MB5027:EE_
x-ms-office365-filtering-correlation-id: 4daae093-4ecc-458b-0c5b-08dcff7ee8e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVc5czJMNkJaODJqM0pwZ2xoYWdVSG8vQWc5U25YdENYRDJIWmJFRm96L1JK?=
 =?utf-8?B?aFExWUhlNmdxaStZZzFBOVJMNTAvWERLUlJwd1liQVBEOFpKckw5UkNtNm0z?=
 =?utf-8?B?bGdYSzhJT2xDMlMzK1hxV3RrY0hzN0NhZGMyd2NwQzNWNXhGUG5lUmZWcjBP?=
 =?utf-8?B?Tkt3UCtSQk9Vcjd3SGVnaVhMTzJPMmhpRDM1OStBOHJ4ZU9wby9ReHducGVY?=
 =?utf-8?B?QW5KR2dDZTEvcnA3amFwZXRsZHJYUWJLMkZWV2hnbDdlKzEvc0o2enN6MnpP?=
 =?utf-8?B?V2VIamtTS3ljeWJBcldVQkVPNzcxM3dkWFUzSU10MDJyOGNoV21jSFVSUGFV?=
 =?utf-8?B?TGltc2Z2dlMzS2VNVW1FT2M1eU9sSnZwUlNoQnh0Sm8wNkRLV1o2U1YvTUEw?=
 =?utf-8?B?SEN4TDJKQURiRk82eGx4cDdvbFpPK2s2SEVJMzNGZnBHKytTcTVMcC9JVm1G?=
 =?utf-8?B?VzZQcWpKcC8yNWhadjJVUmc5eWhLWVFlVzZTNHNjNHVPTVpoNXNmNlNRU2Fy?=
 =?utf-8?B?MlA2R3VRdVdTR1BCUGp2bWkrQ051bW5Sdld3VHU2bTlCOWNPcE1JWDVRVVVh?=
 =?utf-8?B?NnZYRkNCNytVTFdFckpTWDJnSXlFMkJYMnlkV29LdWVhYUlJKy81L2VoN3Rz?=
 =?utf-8?B?TGtVVG5KNHp5VlBnaUIybHNSdkhFYkF2WG1EUjcvUDQ5MkpWSjVPdi93ZXBu?=
 =?utf-8?B?cEU0TC9HQWR5L3gwTkNqZjFGd0VkQUVjWE5Ud2Vva0oxd0NSd3NXQ1R1alFO?=
 =?utf-8?B?dHNYTkJEdm9TOHF6NG0vcHVOVk1DN1lYVjlNRjhCczBJdmx5eWRWbkdSdXlN?=
 =?utf-8?B?VXdzWGhkbW9lWXJualJHNDV4MkUrVng2Yk03R1B6RUU2Mko2eEEyM09KbkVJ?=
 =?utf-8?B?cHRoaFdyNDhEQit1RGhYd3dPakd4T3ZIdWdDYVludUpVNUlFY092cXdFdXRP?=
 =?utf-8?B?WnI2QVovWXBsdjJJanl0bTVoaURlTE1PakZYL3lpc3lvUGxoMFBXTkpTMlc5?=
 =?utf-8?B?REEwNlA1VHozeTVmRnUyeU05WmwvZWg3ekUvWmFuY0IyK0ZrWWtSWHNtQU5I?=
 =?utf-8?B?bG9XbFl3N2VmRjh1UStCZjFCeW01RTc2YzB2QjBMR0s1WEY3dWlrS1B6amo1?=
 =?utf-8?B?Vzg3QVVXckJMaWwrcnFXNWhvTGQwOThXWWJsVGYwcWtMcGpua1VFU0VTQUIw?=
 =?utf-8?B?bUdEa2pOZStKMXVKaHdNOWFyZUluREpvdTNnZmZ0UzZzcG5heDVvM0phUCty?=
 =?utf-8?B?TzhRQWxhRC9nV0x3VHB5aUJJNWNPTTdMdk5QQUFNbENQSHR1M3Q0bmY2aENF?=
 =?utf-8?B?QTJ3RFVCTGhycnRDaXFVdWtnQktyZjErN08yYmdYQzVSZCtFSnBMSUZSK0c3?=
 =?utf-8?B?TFd0OENKVzRXQndzWk5pemxvNmZwLzJuTUxnRUl0R3RzU1N0Qlcrckp4cCtp?=
 =?utf-8?B?ZnJGRXZmY2xFQ1dhMnFzZ1RqQ0Z3TU8yZHFZdmR2VmJCdy9uZzk2bzJxOURQ?=
 =?utf-8?B?UTZRZnB2cEJrWFVsWjdhMHpwTGJwS3J1SlAwcWpXeG1sN2xHdHAxOWIxOVBr?=
 =?utf-8?B?dERLMkRMcncya0xTZFp2NnFmdVEyRmorOTdkT3czdi9WTEdHQktOQXQyODF2?=
 =?utf-8?B?QU1IOXp1bC9ySVdDb0tIV0liTUkyZVNqYklkNWxCMEdVMXhOWXFWSSt6UWwr?=
 =?utf-8?B?ODB1Qnd3SjBrWlJ4ekNLMldSQlVyQm9qOHBMQ1pYOVhpUFhLZGtXalMzRnMw?=
 =?utf-8?B?TmFRSjJ1V2R5VzhLTGVUYmI4SFhjdkNyaGt2ZjFCM20zek9TQVNwTllVRFZO?=
 =?utf-8?Q?CGeYFAdgLuRGotHtMo5ngL1ntway2SfkZLZb4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azRoakRoMERSV01nY3NBeGtWT2xmNlJYOEpzdG42bkR6Z1J6RWo0b2xhZG53?=
 =?utf-8?B?SkFmNGRrZGQxWnczZllwSGNxR2xwM2V4ZDRUQ2NxNUdmMzFzSlB6bWI1YjZr?=
 =?utf-8?B?SU00M2FhdmpYQ1FMYlhyOGdVQzBtSHZnRmJETlo3STUvUVVRZk1ZU2dpd09w?=
 =?utf-8?B?S3UrbmtYckMrU2x0Ly9YTGtNMmZYNmt6MTNmVDV4eTVCSDBVUDk3L1hDMTNj?=
 =?utf-8?B?NUo2OHdmaHhtSFpQa1kxUnpHMXE5UVJob1VMcGpJSVFlalRvMG04WWpvM2FC?=
 =?utf-8?B?ai9aWlFqNy9jMmhRQVAvQlFtTCtvZjJvMCtSVzlSWWFDcUFDRU84MCtid1lu?=
 =?utf-8?B?M1pXTXlNSnh1QUtjTjFYWmFsZFJIVkgwZWlEb1lEdWtZY2tEdHNURGt6WTU2?=
 =?utf-8?B?R09hUU5ISUZyTnVFbm9Zd3dpNVpqMnZJZHZ0M1FraWNkRzIrdGRrMnpiSDdm?=
 =?utf-8?B?R2pFNThhOEdzSVlDRzdoSXM4UEdFcHBGRTZyc2p5Vkp0WDBYdEN5YnpLZGd2?=
 =?utf-8?B?c2luNUM2Y0RrMzBFMHQyaVMrdXQwcU8xRUQ1RDdkZklEOWFsb21jREcreFVH?=
 =?utf-8?B?MlFzMUtuOTRBYzRHL3c4NGlvNmRoRm4yenRlaXNwdzl3b2M1WTI5aEVYNVhP?=
 =?utf-8?B?QnVTVUI1YkRwdktRbE9DLzRqektWaWRMU2d1NmJOOENaWGtqK3FOY1kxOENp?=
 =?utf-8?B?QU91OVEwbEEyMjVpclJYN3I5N2JLdHBHSnlROTVwTmh5TDdCWkhOTWRpeUhJ?=
 =?utf-8?B?RjVRckp5QktlNDRTS1ZkMEV6WWVBSEl4T3c5UGh3cHFkcXQ2cXA4a0hYS1lS?=
 =?utf-8?B?MWdKUDUrQVlwM1cwdVBJSDJybXRrSjBHNnYzS1BiNWFrdjlYTW5wVXdZUnp2?=
 =?utf-8?B?dCs0VTkrU3NyVWEvTzVScElOS2FjMW1vRWFYR3l1S1dNWS91azdwTXJMS1Fu?=
 =?utf-8?B?akFXZ0RRMk9xQmU0aUIxczZtOFJNZFJTbUlnV1ljbDY3SDZMZE9kdFZrSFRa?=
 =?utf-8?B?MWVydUpEU1RlUmhQbS9UMlRDc1dvaHdtcU5wKzdOMWhHOWZ4OC9FeE5pVDNB?=
 =?utf-8?B?RGo5UVd4QytueWVuZnBlZkF3cWpJdDhsMXQ4eFZ5ckNYV3QrZTNEOU1YQkta?=
 =?utf-8?B?N2ZCbDdsQUM5Mm5LVjlWV1ZPR1NwUlVrSm1OdVltcVhzUzBTMWg1MHZPaWVu?=
 =?utf-8?B?MHV6RDNqVER0M0d3RXVRMlRqb0pRRDgySG9OWjJuZVVmZk8rWGR5cjU5Q3VS?=
 =?utf-8?B?TGlveEdsVUtzUUh3cUhORHlnZWFRYVpNRCthWC9adDNYTi90d2FGdnRsb1Uy?=
 =?utf-8?B?SU1jdmdaOSsrSlgzSzJYdDBLWGxKbVllL0lXV3dZQytlUjREWldWa1N1UTBa?=
 =?utf-8?B?MEM5bTc1Zmhudmp1blhFdFZaOHFNWmtvaG03ZTVaNFZ3YS9JMjg4M2c5TEY0?=
 =?utf-8?B?REJLMzVCS0l2clBYd3daekduc1NIMWlwMnpOdjNzTU9zaDdQOTc2VWU1U3Jh?=
 =?utf-8?B?N2R5N0FqUnpQT1UxNlRyUWNsMzJpU0pwRklQdVBxU25lUEIxOWpZRHlseTZC?=
 =?utf-8?B?MmptMFppRlp1ODZBQ1BkWFBOeVJTUjJOOTFuVlhteUdzVmp4WXZnelJ6RGt1?=
 =?utf-8?B?d3V1ajhka0xydFZ3STBRNVB2UzBmODJ2NFJYVmVlUWxpZ2pDVW1TSGhVcFRh?=
 =?utf-8?B?VzZMd1N2OElocVptbEp5QWhFRHVTamZ1bW9wdGptdnQxQTdiREJYUktvcmVh?=
 =?utf-8?B?TXVBbnFsTWlvS1NLdDMxdGRneEMzZlZITTdHdlNrckhxQWdRS1NTL3BtVktz?=
 =?utf-8?B?dkxnYzhqZ2dSdERqNnpoaFpPenpJam1NY2lldG9JOStHNzF3TFlldEJwRGRS?=
 =?utf-8?B?TE90YXowekFXUjgyQ0Q4TGJIL1Z0eUtMVElEUVVNcnlVbmJacGVHc2llZ0Iy?=
 =?utf-8?B?OWkxenNxd3JBZm93bC9PRXJmNGl6Ti80UnNiR0pNdzNJQy8vc3hvRTduQkNH?=
 =?utf-8?B?aDhWYjVLTVpDQkliWWxTblRXdDFrbzRySU9nQlBCQm05NmNGV2lzMWFkT0sy?=
 =?utf-8?B?NHdQZk85WkZzeXpEVFpIS3k2SjZPU2tQdzFwcWYvbWwwT01mNVV5RXk4UTNj?=
 =?utf-8?Q?DLqkE8PzH2e6CoQnoC2+4Z97+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daae093-4ecc-458b-0c5b-08dcff7ee8e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 22:52:51.7739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAtpCPsYQAgUjWu9o6qCATVu9yKE0KJcIK0OW+b0SGQoQ8UAtpJYnoX+tOpq6lHTMvcGWGy2ghxSoWH0IDWGnbR/nt/Tj9Vz82XMM2CfZBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNywg
MjAyNCAxMDowNCBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRl
bC5jb20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEd1cHRhLCBzYXVyYWJo
ZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5j
b20+OyBCZWxnYXVta2FyLCBWaW5heSA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDEvMl0gdGVzdHMvaW50ZWwveGVfc3lzZnMqOiBSZXN0b3JlIHZh
bHVlcyBvbiB0ZXN0IGZhaWx1cmUNCj4gDQo+IEhpIEpvbmF0aGFuLA0KPiBPbiAyMDI0LTExLTA1
IGF0IDIwOjExOjQyICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4gVGhlIHRlc3Rz
IHhlX3N5c2ZzX3ByZWVtcHRfdGltZW91dCBhbmQgeGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9u
DQo+ID4gbW9kaWZ5IHRoZSB2YWx1ZXMgb2YgcHJlZW1wdF90aW1lb3V0X3VzIGFuZCB0aW1lc2xp
Y2VfZHVyYXRpb25fdXMsDQo+ID4gcmVzcGVjdGl2ZWx5LiAgSG93ZXZlciwgb24gYSB0ZXN0IGZh
aWx1cmUsIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlc2UNCj4gPiB2YWx1ZXMgbWF5IHJlbWFpbiBp
biB0aGVpciBtb2RpZmllZCBzdGF0ZXMsIHJlc3VsdGluZyBpbiB0aGUgdmFsdWVzDQo+ID4gYmVp
bmcgdXNlZCBpbiBmdXR1cmUgdGVzdHMgYW5kIGNhdXNpbmcgdW5leHBlY3RlZCBiZWhhdmlvci4N
Cj4gPiANCj4gPiBTYXZlIHRoZSByZXNwZWN0aXZlIG1vZGlmaWVkIHZhbHVlcyBiZWZvcmUgc3Rh
cnRpbmcgdGhlIHRlc3QgYW5kIGF0dGVtcHQNCj4gPiB0byByZXN0b3JlIHRoZSB2YWx1ZXMgb24g
dGVzdCBleGl0Lg0KPiA+IA0KPiA+IHYyOg0KPiA+IC0gRml4IHNvbWUgZm9ybWF0dGluZyBpc3N1
ZXMgKEthbWlsKQ0KPiA+IC0gQWJvcnQgaWYgdmFsdWUgcmVzdG9yZSBmYWlscyAoS2FtaWwpDQo+
ID4gLSBEaXJlY3RseSBjYWxsIGlndF9zeXNmc19wcmludGYgb24gZXhpdCB0byBhdm9pZCBkdXBs
aWNhdGluZyBvbiBoZWxwZXINCj4gPiAgIChLYW1pbCkNCj4gPiANCj4gPiB2MzoNCj4gPiAtIERv
IG5vdCBjb21wYXJlIHBvdGVudGlhbGx5IHVuYXNzaWduZWQgdmFyaWFibGUgKEthbWlsKQ0KPiA+
IC0gV2hpdGVzcGFjZSBhbmQgY29tbWl0IG5hbWUgZml4ZXMgKEthbWlsKQ0KPiA+IA0KPiA+IFN1
Z2dlc3RlZC1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0
QGludGVsLmNvbT4NCj4gPiBDQzogVmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBp
bnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVj
em55QGxpbnV4LmludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfc3lzZnNf
cHJlZW1wdF90aW1lb3V0LmMgICAgfCA0NCArKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiANCj4g
UGxlYXNlIGxvb2sgYXQgWGVGVUxMIHJlc3VsdHMsIHRlc3RzIG5vdyBza2lwczoNCj4gDQo+IHhl
X3N5c2ZzX3ByZWVtcHRfdGltZW91dEBwcmVlbXB0X3RpbWVvdXRfdXMtdGltZW91dA0KPiANCj4g
SXQgbG9va3MgbGlrZSB0aGVyZSBpcyBhbm90aGVyIGxldmVsIG9mIGRpcnMgaW4gJ2VuZ2luZXMn
LA0KPiBmb3IgZXhhbXBsZSBvbiBMdW5hciBMYWtlOg0KPiANCj4gJCBscyAvc3lzL2RldmljZXMv
cGNpMDAwMDowMC8wMDAwOjAwOjAyLjAvdGlsZTAvZ3QwL2VuZ2luZXMNCj4gYmNzICBjY3MgIHJj
cw0KPiANCj4gU28gaXQgaXMgbW9yZSBjb21wbGljYXRlZC4NCg0KVW5kZXJzdG9vZC4gIEkgd2Vu
dCBiYWNrIGFuZCByZWFkIHRocm91Z2ggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24NCmFuZCBj
b21wYXJlZCBpdCB0byB3aGF0J3MgYmVpbmcgZG9uZSBpbnRlcm5hbGx5LCBhbmQgaXQgdHVybnMg
b3V0IHRoZQ0KaW5kaXZpZHVhbCBlbmdpbmVzIGFyZSBiZWluZyBzY3JhcGVkIGluIGlndF9zeXNm
c19lbmdpbmVzIGJlZm9yZSBiZWluZw0KcGFzc2VkIHRvIHRoZSB0ZXN0cy4gIEkgaGFkIG1pc3Nl
ZCB0aGlzIHBhcnQgYW5kIGhhZCB0aG91Z2h0DQppZ3Rfc3lzZnNfZW5naW5lcyB3YXMganVzdCB0
aGUgdGVzdCBmdW5jdGlvbiBuYW1lLCBhcHBhcmVudGx5LiAgU28sIGluDQpvcmRlciB0byBnZXQg
dGhlIHRlc3QgdG8gd29yaywgd2UnbGwgbmVlZCB0byBpdGVyYXRlIG92ZXIgdGhlIGxpc3Qgb2YN
CmVuZ2luZXMgYW5kIHVzZSBzYWlkIGVuZ2luZXMgaW5zdGVhZCBvZiB0aGUgZW5naW5lX2ZkIGFz
IHdlIGFyZQ0KY3VycmVudGx5Lg0KDQpVbmZvcnR1bmF0ZWx5LCBpdCBzZWVtcyB0aGF0IHRoZXJl
J3Mgbm8gaW50ZXJmYWNlIHRvIGl0ZXJhdGUgb3ZlciB0aGUNCmVuZ2luZXMgaW4gdGhlIHN5c2Zz
L2VuZ2luZXMgZGlyZWN0b3J5IHlldCwgc28gSSdsbCBuZWVkIHRvIGNyZWF0ZSB0aGF0DQpmaXJz
dC4gIEkgaGF2ZSBhbHJlYWR5IGNyZWF0ZWQgdGhlIHBhdGNoIHNlcmllcyB3aXRoIHNhaWQgaW50
ZXJmYWNlIGFuZA0KYWxsIHJlbGF0ZWQgbmVjZXNzYXJ5IGNoYW5nZXMsIGFuZCBJIHdpbGwgYmUg
cG9zdGluZyBpdCBzaG9ydGx5Lg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgZWZmb3J0
Lg0KLUpvbmF0aGFuIENhdml0dA0KDQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiAg
dGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMgfCA0MyArKysrKysrKysr
KysrKysrKy0tLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMTkg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3N5c2Zz
X3ByZWVtcHRfdGltZW91dC5jIGIvdGVzdHMvaW50ZWwveGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0
LmMNCj4gPiBpbmRleCA3ZmEwZGZjZGY3Li5jY2E3ZTE5Nzk2IDEwMDY0NA0KPiA+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dC5jDQo+ID4gKysrIGIvdGVzdHMvaW50
ZWwveGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0LmMNCj4gPiBAQCAtMTcwLDYgKzE3MCw3IEBAIHN0
YXRpYyB2b2lkIHRlc3RfdGltZW91dChpbnQgZmQsIGludCBlbmdpbmUsIGNvbnN0IGNoYXIgKipw
cm9wZXJ0eSwgdWludDE2X3QgY2xhDQo+ID4gIAlzZXRfcHJlZW1wdF90aW1lb3V0KGVuZ2luZSwg
c2F2ZWQpOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICsjZGVmaW5lCU1BWF9HVFMJOA0KPiA+ICBpZ3Rf
bWFpbg0KPiA+ICB7DQo+ID4gIAlzdGF0aWMgY29uc3Qgc3RydWN0IHsNCj4gPiBAQCAtMTgzLDgg
KzE4NCwxMCBAQCBpZ3RfbWFpbg0KPiA+ICAJCQkJICAgICAgICJwcmVlbXB0X3RpbWVvdXRfbWlu
IiwNCj4gPiAgCQkJCSAgICAgICAicHJlZW1wdF90aW1lb3V0X21heCJ9LCB9Ow0KPiA+ICAJaW50
IGNvdW50ID0gc2l6ZW9mKHByb3BlcnR5KSAvIHNpemVvZihwcm9wZXJ0eVswXSk7DQo+ID4gKwlp
bnQgZ3RfY291bnQgPSAwOw0KPiA+ICAJaW50IGZkID0gLTEsIHN5c19mZCwgZ3Q7DQo+ID4gLQlp
bnQgZW5naW5lc19mZCA9IC0xLCBndF9mZCA9IC0xOw0KPiA+ICsJaW50IGVuZ2luZXNfZmRbTUFY
X0dUU10sIGd0X2ZkW01BWF9HVFNdOw0KPiA+ICsJdW5zaWduZWQgaW50IHB0c1tNQVhfR1RTXTsN
Cj4gPiAgDQo+ID4gIAlpZ3RfZml4dHVyZSB7DQo+ID4gIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIo
RFJJVkVSX1hFKTsNCj4gPiBAQCAtMTkyLDI2ICsxOTUsNDcgQEAgaWd0X21haW4NCj4gPiAgCQlz
eXNfZmQgPSBpZ3Rfc3lzZnNfb3BlbihmZCk7DQo+ID4gIAkJaWd0X3JlcXVpcmUoc3lzX2ZkICE9
IC0xKTsNCj4gPiAgCQljbG9zZShzeXNfZmQpOw0KPiA+ICsNCj4gPiArCQl4ZV9mb3JfZWFjaF9n
dChmZCwgZ3QpIHsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZ3RfY291bnQgPCBNQVhfR1RTKTsNCj4g
PiArDQo+ID4gKwkJCWd0X2ZkW2d0X2NvdW50XSA9IHhlX3N5c2ZzX2d0X29wZW4oZmQsIGd0KTsN
Cj4gPiArCQkJaWd0X3JlcXVpcmUoZ3RfZmRbZ3RfY291bnRdICE9IC0xKTsNCj4gPiArCQkJZW5n
aW5lc19mZFtndF9jb3VudF0gPSBvcGVuYXQoZ3RfZmRbZ3RfY291bnRdLCAiZW5naW5lcyIsIE9f
UkRPTkxZKTsNCj4gPiArCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZFtndF9jb3VudF0gIT0gLTEp
Ow0KPiA+ICsJCQlpZ3RfcmVxdWlyZShpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lc19mZFtndF9jb3Vu
dF0sDQo+ID4gKwkJCQkJCSAgICAicHJlZW1wdF90aW1lb3V0X3VzIiwNCj4gPiArCQkJCQkJICAg
ICIldSIsICZwdHNbZ3RfY291bnRdKSA9PSAxKTsNCj4gPiArCQkJZ3RfY291bnQrKzsNCj4gPiAr
CQl9DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAJZm9yIChpbnQgaSA9IDA7IGkgPCBjb3VudDsgaSsr
KSB7DQo+ID4gIAkJZm9yICh0eXBlb2YoKnRlc3RzKSAqdCA9IHRlc3RzOyB0LT5uYW1lOyB0Kysp
IHsNCj4gPiAgCQkJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX2YoIiVzLSVzIiwgcHJvcGVydHlb
aV1bMF0sIHQtPm5hbWUpIHsNCj4gPiArCQkJCWludCBqID0gMDsNCj4gPiAgCQkJCXhlX2Zvcl9l
YWNoX2d0KGZkLCBndCkgew0KPiA+IC0JCQkJCWd0X2ZkID0geGVfc3lzZnNfZ3Rfb3BlbihmZCwg
Z3QpOw0KPiA+IC0JCQkJCWlndF9yZXF1aXJlKGd0X2ZkICE9IC0xKTsNCj4gPiAtCQkJCQllbmdp
bmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcyIsIE9fUkRPTkxZKTsNCj4gPiAtCQkJCQlp
Z3RfcmVxdWlyZShlbmdpbmVzX2ZkICE9IC0xKTsNCj4gPiAtDQo+ID4gLQkJCQkJaWd0X3N5c2Zz
X2VuZ2luZXMoZmQsIGVuZ2luZXNfZmQsIGd0LCAxLCBwcm9wZXJ0eVtpXSwNCj4gPiAtCQkJCQkJ
CQkJICB0LT5mbik7DQo+ID4gLQkJCQkJY2xvc2UoZW5naW5lc19mZCk7DQo+ID4gLQkJCQkJY2xv
c2UoZ3RfZmQpOw0KPiA+ICsJCQkJCWludCBlID0gZW5naW5lc19mZFtqXTsNCj4gPiArDQo+ID4g
KwkJCQkJaWd0X3N5c2ZzX2VuZ2luZXMoZmQsIGUsIGd0LCAxLCBwcm9wZXJ0eVtpXSwgdC0+Zm4p
Ow0KPiA+ICsJCQkJCWorKzsNCj4gPiAgCQkJCX0NCj4gPiAgCQkJfQ0KPiA+ICAJCX0NCj4gPiAg
CX0NCj4gPiAgCWlndF9maXh0dXJlIHsNCj4gPiArCQlmb3IgKGludCBpID0gZ3RfY291bnQgLSAx
OyBpID49IDA7IGktLSkgew0KPiA+ICsJCQl1bnNpZ25lZCBpbnQgc3RvcmUgPSBVSU5UX01BWDsN
Cj4gPiArDQo+ID4gKwkJCWlndF9hc3NlcnRfbHRlKDAsIGlndF9zeXNmc19wcmludGYoZW5naW5l
c19mZFtpXSwgInByZWVtcHRfdGltZW91dF91cyIsDQo+ID4gKwkJCQkJCQkgICAiJXUiLCBwdHNb
aV0pKTsNCj4gPiArCQkJaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZXNfZmRbaV0sICJwcmVlbXB0X3Rp
bWVvdXRfdXMiLCAiJXUiLCAmc3RvcmUpOw0KPiA+ICsJCQlpZ3RfYWJvcnRfb25fZihzdG9yZSAh
PSBwdHNbaV0sICJwcmVlbXB0X3RpbWVvdXRfdXMgbm90IHJlc3RvcmVkIVxuIik7DQo+ID4gKw0K
PiA+ICsJCQljbG9zZShlbmdpbmVzX2ZkW2ldKTsNCj4gPiArCQkJY2xvc2UoZ3RfZmRbaV0pOw0K
PiA+ICsJCX0NCj4gPiArDQo+ID4gIAkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ID4gIAl9DQo+
ID4gIH0NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1
cmF0aW9uLmMgYi90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24uYw0KPiA+
IGluZGV4IGNmOTVhM2FjMWMuLmRmY2RkNzMzNWYgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50
ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94
ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24uYw0KPiA+IEBAIC0xNDIsNiArMTQyLDcgQEAgc3Rh
dGljIHZvaWQgdGVzdF90aW1lb3V0KGludCBmZCwgaW50IGVuZ2luZSwgY29uc3QgY2hhciAqKnBy
b3BlcnR5LCB1aW50MTZfdCBjbGENCj4gPiAgCXNldF90aW1lc2xpY2VfZHVyYXRpb24oZW5naW5l
LCBzYXZlZCk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gKyNkZWZpbmUJTUFYX0dUUwk4DQo+ID4gIGln
dF9tYWluDQo+ID4gIHsNCj4gPiAgCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiA+IEBAIC0xNTUs
OCArMTU2LDEwIEBAIGlndF9tYWluDQo+ID4gIAkJCQkgICAgICAgInRpbWVzbGljZV9kdXJhdGlv
bl9taW4iLA0KPiA+ICAJCQkJICAgICAgICJ0aW1lc2xpY2VfZHVyYXRpb25fbWF4In0sIH07DQo+
ID4gIAlpbnQgY291bnQgPSBzaXplb2YocHJvcGVydHkpIC8gc2l6ZW9mKHByb3BlcnR5WzBdKTsN
Cj4gPiArCWludCBndF9jb3VudCA9IDA7DQo+ID4gIAlpbnQgZmQgPSAtMSwgc3lzX2ZkLCBndDsN
Cj4gPiAtCWludCBlbmdpbmVzX2ZkID0gLTEsIGd0X2ZkID0gLTE7DQo+ID4gKwlpbnQgZW5naW5l
c19mZFtNQVhfR1RTXSwgZ3RfZmRbTUFYX0dUU107DQo+ID4gKwl1bnNpZ25lZCBpbnQgdGRzW01B
WF9HVFNdOw0KPiA+ICANCj4gPiAgCWlndF9maXh0dXJlIHsNCj4gPiAgCQlmZCA9IGRybV9vcGVu
X2RyaXZlcihEUklWRVJfWEUpOw0KPiA+IEBAIC0xNjQsMjUgKzE2Nyw0NyBAQCBpZ3RfbWFpbg0K
PiA+ICAJCXN5c19mZCA9IGlndF9zeXNmc19vcGVuKGZkKTsNCj4gPiAgCQlpZ3RfcmVxdWlyZShz
eXNfZmQgIT0gLTEpOw0KPiA+ICAJCWNsb3NlKHN5c19mZCk7DQo+ID4gKw0KPiA+ICsJCXhlX2Zv
cl9lYWNoX2d0KGZkLCBndCkgew0KPiA+ICsJCQlpZ3RfcmVxdWlyZShndF9jb3VudCA8IE1BWF9H
VFMpOw0KPiA+ICsNCj4gPiArCQkJZ3RfZmRbZ3RfY291bnRdID0geGVfc3lzZnNfZ3Rfb3Blbihm
ZCwgZ3QpOw0KPiA+ICsJCQlpZ3RfcmVxdWlyZShndF9mZFtndF9jb3VudF0gIT0gLTEpOw0KPiA+
ICsJCQllbmdpbmVzX2ZkW2d0X2NvdW50XSA9IG9wZW5hdChndF9mZFtndF9jb3VudF0sICJlbmdp
bmVzIiwgT19SRE9OTFkpOw0KPiA+ICsJCQlpZ3RfcmVxdWlyZShlbmdpbmVzX2ZkW2d0X2NvdW50
XSAhPSAtMSk7DQo+ID4gKwkJCWlndF9yZXF1aXJlKGlndF9zeXNmc19zY2FuZihlbmdpbmVzX2Zk
W2d0X2NvdW50XSwNCj4gPiArCQkJCQkJICAgICJ0aW1lc2xpY2VfZHVyYXRpb25fdXMiLA0KPiA+
ICsJCQkJCQkgICAgIiV1IiwgJnRkc1tndF9jb3VudF0pID09IDEpOw0KPiA+ICsJCQlndF9jb3Vu
dCsrOw0KPiA+ICsJCX0NCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAlmb3IgKGludCBpID0gMDsgaSA8
IGNvdW50OyBpKyspIHsNCj4gPiAgCQlmb3IgKHR5cGVvZigqdGVzdHMpICp0ID0gdGVzdHM7IHQt
Pm5hbWU7IHQrKykgew0KPiA+ICAJCQlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWNfZigiJXMtJXMi
LCBwcm9wZXJ0eVtpXVswXSwgdC0+bmFtZSkgew0KPiA+ICsJCQkJaW50IGogPSAwOw0KPiA+ICAJ
CQkJeGVfZm9yX2VhY2hfZ3QoZmQsIGd0KSB7DQo+ID4gLQkJCQkJZ3RfZmQgPSB4ZV9zeXNmc19n
dF9vcGVuKGZkLCBndCk7DQo+ID4gLQkJCQkJaWd0X3JlcXVpcmUoZ3RfZmQgIT0gLTEpOw0KPiA+
IC0JCQkJCWVuZ2luZXNfZmQgPSBvcGVuYXQoZ3RfZmQsICJlbmdpbmVzIiwgT19SRE9OTFkpOw0K
PiA+IC0JCQkJCWlndF9yZXF1aXJlKGVuZ2luZXNfZmQgIT0gLTEpOw0KPiA+IC0JCQkJCWlndF9z
eXNmc19lbmdpbmVzKGZkLCBlbmdpbmVzX2ZkLCBndCwgMSwgcHJvcGVydHlbaV0sDQo+ID4gLQkJ
CQkJCQkJCQkgdC0+Zm4pOw0KPiA+IC0JCQkJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiA+IC0JCQkJ
CWNsb3NlKGd0X2ZkKTsNCj4gPiArCQkJCQlpbnQgZSA9IGVuZ2luZXNfZmRbal07DQo+ID4gKw0K
PiA+ICsJCQkJCWlndF9zeXNmc19lbmdpbmVzKGZkLCBlLCBndCwgMSwgcHJvcGVydHlbaV0sIHQt
PmZuKTsNCj4gPiArCQkJCQlqKys7DQo+ID4gIAkJCQl9DQo+ID4gIAkJCX0NCj4gPiAgCQl9DQo+
ID4gIAl9DQo+ID4gIAlpZ3RfZml4dHVyZSB7DQo+ID4gKwkJZm9yIChpbnQgaSA9IGd0X2NvdW50
IC0gMTsgaSA+PSAwOyBpLS0pIHsNCj4gPiArCQkJdW5zaWduZWQgaW50IHN0b3JlID0gVUlOVF9N
QVg7DQo+ID4gKw0KPiA+ICsJCQlpZ3RfYXNzZXJ0X2x0ZSgwLCBpZ3Rfc3lzZnNfcHJpbnRmKGVu
Z2luZXNfZmRbaV0sICJ0aW1lc2xpY2VfZHVyYXRpb25fdXMiLA0KPiA+ICsJCQkJCQkJICAgIiV1
IiwgdGRzW2ldKSk7DQo+ID4gKwkJCWlndF9zeXNmc19zY2FuZihlbmdpbmVzX2ZkW2ldLCAidGlt
ZXNsaWNlX2R1cmF0aW9uX3VzIiwgIiV1IiwgJnN0b3JlKTsNCj4gPiArCQkJaWd0X2Fib3J0X29u
X2Yoc3RvcmUgIT0gdGRzW2ldLCAidGltZXNsaWNlX2R1cmF0aW9uX3VzIG5vdCByZXN0b3JlZCFc
biIpOw0KPiA+ICsNCj4gPiArCQkJY2xvc2UoZW5naW5lc19mZFtpXSk7DQo+ID4gKwkJCWNsb3Nl
KGd0X2ZkW2ldKTsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICAJCWRybV9jbG9zZV9kcml2ZXIoZmQp
Ow0KPiA+ICAJfQ0KPiA+ICB9DQo+ID4gLS0gDQo+ID4gMi40My4wDQo+ID4gDQo+IA0K
