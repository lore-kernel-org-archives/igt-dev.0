Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C824606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ap3jasKA;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=AdR1O+cz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61510E7CF;
	Tue, 24 Nov 2026 06:53:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BED610E7CF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 06:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795503114; x=1827039114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o0epjaGXU0eLN56VLzUoakbYcTBRVYnFjGVeyQe3Jjo=;
 b=Ap3jasKAwBnxAL28SG8NRy1IGzvfbk6uq+EhQb3iIg9TDvdpbA1mZN6A
 27kKdy8Mxp5Elgr4xUrDuJSwmpWfwzHQyjVVDHdGqBwS9DV6bL3yvApAp
 52shwXOzb5mgavUQ+6VDELCPU4NQdYMt1Yb8tByFBTSK+5nJWcMYCDpuJ
 Qyr7pi3yMed4ePs0R7XuSrNcsNY6jMoXqlJ/LY/4SSiWClD9h9TQKYxXr
 7sdOpPb/ZyQM1Nc0CHWC5xPqGIt5wiWvgus28G6o8MiCKv4ozg7cQH4HK
 Amg5gzZkjhAJ1oNU5dZcrxjdzsuSq4I5GAFHSij5ETkbpNWZWHsVYEQne w==;
X-CSE-ConnectionGUID: RhEN5n9XRrOywt8ZnaZBkg==
X-CSE-MsgGUID: xX5Zb90wQ/e7r2eQ2/0kUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4304920"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4304920"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:51:05 -0800
X-CSE-ConnectionGUID: rUcUNtT9SfK0j/tsiRZOlg==
X-CSE-MsgGUID: 1XMXd9gkTjKr70hjt0kX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11782532"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:50:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:50:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 22:50:04 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:50:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE1Zvu1o9PFK4aq+49zWP5GP+dOK1vZ3raUlaow8pBtWKkjbyN1VluP98yondT8vTrf+vopMRHORr4rAJtwZqwqOQkq3F3d74LF5LIq7TguzcyMs9xd0nw/eoR/RMMt+hYAcBLPlZwPHWnhWJ327kpdqk4sX7/zEmdtEi/R4UY4/MRHT2nw6TDZ0GidhsAHOIqTDTPlKkRstKql3ulbb80WvfNa9saFFubEk94bN7jiyfvJK357Hk30OZGhB0cLU1ZJ956IwZ5QRonCwZvFYImgjYHTUdmW0Vm23uFMdmjp2+cbZTent45sV1zEFoDuj9jB70qpWYVB1d/8w5znnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0epjaGXU0eLN56VLzUoakbYcTBRVYnFjGVeyQe3Jjo=;
 b=vHzt5yTtFOiVpeD9QFfOta9dB4NXgjK5vydaT/ThpOOkJszk6p1BH2+S8WdFpQ4mtKN1cKXU5eKEbJ1gKRBFoFJovcA+Lv7Wj6m12NEHDDgfTwf1zYC9np31FAqvrZIro36l4G0/yNEkwHpy2okAi8EXmK0UVxYtLU8Ty3czHMn/JGlkFw5NGy30ad/SqXyM7TBh+oiNJ8m7MOKqed1m8+2qEVit/AzG3HXek9c7falcY/3VNLn2GsYZnv+hgir85eRxSKT0jwsehQLt9Kt9lj+AfW0LtJhzj76ADZXC3uOh0qsGweudCOXqap3duGiUVxglhhCKuttIUbg7O78+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0epjaGXU0eLN56VLzUoakbYcTBRVYnFjGVeyQe3Jjo=;
 b=AdR1O+czYRc6QRRzhKa2B1BVw1jbDx1tr3UdoMSZ3zdyBQndLCxYaT08QUNp+vvt3b39MSmaWMGrx+Sno+Wx0EeJIVj3QVYhUl01576e6w7DDuo/A2H0YzUAWVzLeqgUww+OyyCq/1HBJjIe/LsOVh5eFBhNieLAjRgl0cZKVY8=
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by LV2PR11MB480600.namprd11.prod.outlook.com (2603:10b6:408:40f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 06:49:56 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:49:56 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "B S, Karthik" <karthik.b.s@intel.com>, 
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_compute: Use monotonic clock in
 loop-duration-2s
Thread-Topic: [PATCH i-g-t] tests/intel/xe_compute: Use monotonic clock in
 loop-duration-2s
Thread-Index: AQHdd8L3WNnGi0vYKE+LX+mBkrshybc0u/2AgAgTSJA=
Date: Tue, 24 Nov 2026 06:49:55 +0000
Message-ID: <DM4PR11MB5456E36DF756A3F92A13C26FEA442@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20261119010857.377785-2-shuicheng.lin@intel.com>
 <bdae5fbd-eb7c-4d18-96f2-2bd53aed2e4a@intel.com>
In-Reply-To: <bdae5fbd-eb7c-4d18-96f2-2bd53aed2e4a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|LV2PR11MB480600:EE_
x-ms-office365-filtering-correlation-id: e25dbac9-6bed-4e3a-fa0b-08df49f7269e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|23010399003|38070700021|10067099003|261022075727099003|4143699003|11063799006|56012099006|261009223027099003|261021123027099003|261102123227099003|261021121427099003|261026140227099003|261028144727099003|261022105027099003|261021135927099003|261026121527099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 8m+Lo98i+AlnWxcZvgQ4YEF2zLJ/iZu8faIrYtvZgUuZDaqFhQCboSiP2bECyOqhvBc7GEh3QG0SnC3qpkTeUFU36qyfCG7sldAPfV3knm/xKMDZKwU7VOJ28/aVIngtBRvLgN021Sdq8RCGEbGhVs178rFmKotHeqKczN+eWAjS5y/rS+VOy9IMykUo9i2Zw0wd7OZ6jIaCIUZgCl2A+MtWQFKAiw8Y1xNgJ+gw8mx6fmuGXw83f/GOuIWD7o8l+84pCqxJUCH/UIVnLTbChFwMe2VYnWdDu6u2EAlp73MpW3EUCXU3RUY3ArgqNYNkj+sU7Zp0mWXpWoCyJdJzGKkP4MefgbzSgO+kFPExowEqwRhLgU/JZp+UTngjbAYvR7Y2HgKZVFvR/WTNWiPSVdntIAoVkjtfYF++7EDvExdG9zbt3TY5Da5V13BYbV+9EYbh5RWBd0KeoKy2FBwMuXYM2cCy/INKLcMGCGdHw+xPjYbBbi6dwmgSsrhcxR4+VQ0cS0vut7kcQnV2WKVr8/Ffd6uh6r6AnNwhzy9zTF8GIoj7FlQJJvpegYtGzIaddByK7UlriKDBl5eybl8M1rdEg01eaXCcSihHNteKOQv74tYYVOMG80EVxPG9Twhh+KjTjNvOGQ4jDCKTxVJkVMvzu3hJdyVkaHzyAz2IKVk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(38070700021)(10067099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021135927099003)(261026121527099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUtHaTVIL0lwblBaZ3F6T1BoYkFTTzU5NXpBQkRGcDh1ZWdTZDh0RWhlaEd3?=
 =?utf-8?B?WWgzcmxham1GUFdheVpoTGxiZTVubFNja1ZuQzE4YStyWVBLaHNsaFRQRHVK?=
 =?utf-8?B?ZTErRmlYcHdUTGtEY3RSQjFhWGcxMkV4K0twZCsvZnB0eTZEbW55bTRNbDhs?=
 =?utf-8?B?ZjByNk5EL2taZWRyWGNFRkJMMXhIemxzMlpqWS9naUY0MERRODNoWG9pYmMz?=
 =?utf-8?B?VTJqVjV3SnFBRDVFdXFrdDNRQ2tDMkVWL3BOc0l6K1FLWG1hbE1sQ2lCMmZN?=
 =?utf-8?B?RWpoZXE4UE5CVmtrVk9MV0dVZHgvbllXMDliWjZ5U0Vub0drVVVlcE91aUVj?=
 =?utf-8?B?Q1dsY2dWTlhUMHZNMW5CZ2VQMTRERng0Qjh0QVZ4TmtyeE4zUy9HOHc3RUhv?=
 =?utf-8?B?REZBUit3T1Iyc1krSUV2WHdTa1lic1RMY1FnbDdhdnJIaVFHS1VxaDJBSDl2?=
 =?utf-8?B?VERBaFl1RFovR0VNcS9wVDZJWVhpVUNCNVJhK1NIUzNHZkEreUxWcURSdlJO?=
 =?utf-8?B?UVVXdkxLYUdTRWIvd3RrVUpES1hrSlYzdmFjNWsvTHVMTks0RkFlSkJsMEc0?=
 =?utf-8?B?dEJZNEdSZlE1eC92SDlBc1JZdnp1Y0RmUUQwRnFBUUE2L3RVTkgwSlpoV0JG?=
 =?utf-8?B?dThLMGhFNmdER0MxLzgrclBXUTJEQ1J5dHhyQmNXWERkTnExQllqWm5CSnlL?=
 =?utf-8?B?dmZkSEFQc005VHNJQU1odk5sbkw5Y1poZG9waXRrZHRIaGRCQmU5ZnU0QXZL?=
 =?utf-8?B?azBrejhSL2NRKzRBRGh1SERVWWM2S1NzNElBc0RXQVVKSmdoRFkrQkpLWkRJ?=
 =?utf-8?B?TW9oUVkwM0ZNL3diU3IrcjNENEkwL1lVYndWWE4zWHk5SHdBbkUxZGxONkJt?=
 =?utf-8?B?Z2JXSHpIWjJKR1pMVC9hTzVFMW5IU20zQlpqWWdQcEN5SHZMRkY2dm5XeUFu?=
 =?utf-8?B?YlY3NFBhU09SSnpSalFWbHVmTmwreFIxaTA5RlQ0SkE2WUcwOEpQT1l3Zm9I?=
 =?utf-8?B?cFJJY0U5UXF1YlNUWG85bnBXcmVZVk03bWRIYnJBWHFIRWV4bEFmMDAwbWlO?=
 =?utf-8?B?Rk41N2ZRZnk2T284OGFMa2dYNTl2elV0UklLdlduWDVTZkZwN0w5a09CNGdB?=
 =?utf-8?B?aXRDbS90R05SbXFUM2dESjFGK0hvODFoYmN1dTBsR0lyVEQxMjNEQ0dsZXJt?=
 =?utf-8?B?bWU1RG9zU1lLdkwvQ0ZTQzg5WWNZcUNNbW90TTFjckhBUGlxNjJZRHhhUzVL?=
 =?utf-8?B?b3dUZVliUGo3aTB1ZmRRZGNhNzIxZ0owTW9zamt5d0R4MTlYTzJHa1ZJUjFG?=
 =?utf-8?B?Sjk2UFhGMWovZ3lybjRMZm94emN5YXZBVkRoN3BDcUJnZ01lZ3IySis3Nzhz?=
 =?utf-8?B?bkcvd0V3ZWdOWW9zN2NIdU9PdHRMdFcyQU80WStob3dsL1VJZE5zZFg1QmQ2?=
 =?utf-8?B?Y2FXajd5ZTBHaEZJS1pnb0RIVXNhd2c4Nm5LWGJTMnZ3dDBqV0FXU0RzTjV5?=
 =?utf-8?B?cFJsTjgrMTJuV25OVHlGVzNwQ2k0VkVjRi8yOEcyczN6dWU3blo2Vnl6dGx5?=
 =?utf-8?B?YzBhSXFLNEtCYThCTVpWa0VNb205K3BOSWViNEtGODU5bmJlSnpiVmtrMkx0?=
 =?utf-8?B?OGpYN1JLTHA0RWZPclZXVlluWHNrUEh0Y0VnTGowTEhkek4rOGpDMndIcUpK?=
 =?utf-8?B?SFJadTJnTHFFd3FhWW1NQkZBT2F3SVQ4TVp4eW1KRFZIaThTaUIzdVBTMW5D?=
 =?utf-8?B?aktCaGszRjh2TzZsQi9BNEZxekpyei9pMlZ2SDZ3Y0QrYlU5UDVvb09lV2dj?=
 =?utf-8?B?MlE0WGdubnZxUkRGUFpxZXlWMHZDRmNuLy81TWFhcEU2U094TjNuSGZPY2p1?=
 =?utf-8?B?T2c4czY3TmRuWTBDYWhBL2hQdmZWeDc0d3hLTGNjM0FqdTE4b1VQYXRxL1NS?=
 =?utf-8?B?eHJSaUNNNVVpb3ZKMWYyNktUUnlETTFqUWFjYlF6MFRqZ2NlaVhlN1ZhYVQ3?=
 =?utf-8?B?QjJ0WUQ4cW1nazJYMUVYVlQzazZoazE3dzdBZGRLaEZzWkluRjZmTnY2NEsy?=
 =?utf-8?B?K2F3dFRpaDZsNUxPZ1BtMmJXNGxVdVFFVjd0eVJrVXliNm9SQUM2QnE0Y0Vo?=
 =?utf-8?B?TzlWUFdUck90dk9Wb20zWllId0tzWkgzUDFoL2FHaVVCampEZEpUYkNSc2Mx?=
 =?utf-8?B?Z3FybC9ta0ZQS1NEVlU5VUtueTBtM0NjaUxNaWlXbVQ2SUVLQXMxSndrRWhY?=
 =?utf-8?B?NlRqUjBJOFRVQ0NHdmY5ZDdJc3d1c0ZNQ3dsS2Z2QU8wTHo0VFd3MXU1Rjgr?=
 =?utf-8?B?YmZaaE9rSm5lNXpxV1U1c2VoZUY4dEROMWwrZ3V1dGF3VGtDa3g4UjZxR3g4?=
 =?utf-8?Q?FiExSjYWAnrP011otaOIiE0AHuMzWfueBneM7WoaRmR95?=
x-ms-exchange-antispam-messagedata-1: 06mlRysDgGbk/g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G+uHaUsXA0+PnHecTykeBBqyX8vZt/10es90qG+rlmMyk+4xy2DwfI8ve1ks/VuUNHxiSc3kL6cT74y4Q4aFpWYdxjMMP8VqhjvhdT4xXkHFPvfV5PBmz8N+xlayXv/P+gbM62fZxvqb/tHIeeORI8jIp88csbzyvwdOY5hMKXQDtI6j6KBzTRZPvwBY47gch8N4gzXMMpBxocbw5DCMiRb/WBNHbYk78uqwdem6NodgBqmhmVB0/Nwn7a06zn0V48iw9y9wktNGOrq/H8S/kdHhSxD9iINQdTbRZVzFQTYaMR61wwmDDm/V6i91s8URFI2VutsWQ+3W/ttXDmNWvg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e25dbac9-6bed-4e3a-fa0b-08df49f7269e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 06:49:56.2895 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3pb75rDfkE9Hy7H+ebWnxal7JiAqJOJsiXvhWlW1y3B11u7G3mPtyuGTYIdRJR+f+W/8qJNXkmK9I8qDa/Hug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB480600
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmtzIE5pc2hpdCBmb3IgdGhlIHJldmlldy4NCg0KSGkgYWxsLA0KQ291bGQgeW91IHBsZWFz
ZSBoZWxwIG1lIHJldmlldyBhbmQgbWVyZ2UgaXQ/DQpUaGFua3MuDQoNClNodWljaGVuZw0KDQpP
biBUaHUsIE5vdiAxOSwgMjAyNiAxMToyNiBBTSBOaXNoaXQgU2hhcm1hIHdyb3RlOg0KPiBPbiAx
MS8xOS8yMDI2IDY6MzggQU0sIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gVGhlIHN1YnRlc3Qg
dGltZXMgdGhlIGxvb3Aga2VybmVsIHdpdGggZ2V0dGltZW9mZGF5KCksIHdoaWNoIGZvbGxvd3MN
Cj4gPiBDTE9DS19SRUFMVElNRS4gSWYgdGhlIHN5c3RlbSB0aW1lIGlzIHN0ZXBwZWQgKGUuZy4g
YnkgTlRQKSBkdXJpbmcgdGhlDQo+ID4gcnVuLCB0aGUgbWVhc3VyZWQgdGltZSBmYWxscyBvdXRz
aWRlICgxLjhzLCAyLjJzKSBhbmQgdGhlIHRlc3QgZmFpbHMsDQo+ID4gZXZlbiB0aG91Z2ggdGhl
IGtlcm5lbCByYW4gZm9yIGFib3V0IDJzLg0KPiA+DQo+ID4gVXNlIGlndF9uc2VjX2VsYXBzZWQo
KSwgd2hpY2ggaXMgbW9ub3RvbmljLCBhbmQgcHJpbnQgdGhlIG1lYXN1cmVkDQo+ID4gdGltZSBh
bmQgYm91bmRzIG9uIGZhaWx1cmUuDQo+ID4NCj4gPiBSZXByb2R1Y2VkIG9uIFBUTCBieSBzdGVw
cGluZyB0aGUgY2xvY2sgd2l0aCBkYXRlIC1zIGR1cmluZyB0aGUgdGVzdDoNCj4gPiB0aGUgb2xk
IGNvZGUgZmFpbHMgZXZlcnkgdGltZSwgdGhlIGZpeGVkIGNvZGUgcGFzc2VzLg0KPiA+DQo+ID4g
Q2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC9pc3N1
ZXMvOTc5NQ0KPiA+IENjOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4N
Cj4gPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC94ZV9jb21wdXRlLmMgfCAxOCAr
KysrKysrLS0tLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDExIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2Nv
bXB1dGUuYyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyBpbmRleA0KPiA+IGU3MzhjOWRhYi4u
ZWUzNzZmZDg4IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYw0KPiA+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYw0KPiA+IEBAIC0yMDcsMTIgKzIwNyw2IEBA
IHRlc3RfY29tcHV0ZV9rZXJuZWxfd2l0aF9jY3NfbW9kZSh2b2lkKQ0KPiA+ICAgCWlndF9yZXF1
aXJlKG51bV9ndF93aXRoX2Njc19tb2RlID4gMCk7DQo+ID4gICB9DQo+ID4NCj4gPiAtc3RhdGlj
IGRvdWJsZSBlbGFwc2VkKGNvbnN0IHN0cnVjdCB0aW1ldmFsICpzdGFydCwNCj4gPiAtCQkgICAg
ICBjb25zdCBzdHJ1Y3QgdGltZXZhbCAqZW5kKQ0KPiA+IC17DQo+ID4gLQlyZXR1cm4gKGVuZC0+
dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAxZS02KihlbmQtPnR2X3VzZWMgLSBzdGFydC0NCj4g
PnR2X3VzZWMpOw0KPiA+IC19DQo+ID4gLQ0KPiA+ICAgLyoqDQo+ID4gICAgKiBTVUJURVNUOiBs
b29wLWR1cmF0aW9uLTJzDQo+ID4gICAgKiBGdW5jdGlvbmFsaXR5OiBPcGVuQ0wga2VybmVsDQo+
ID4gQEAgLTIyOCw3ICsyMjIsNiBAQCB0ZXN0X2NvbXB1dGVfa2VybmVsX2xvb3AodWludDY0X3Qg
bG9vcF9kdXJhdGlvbikNCj4gPiAgIAljb25zdCBzdHJ1Y3QgaW50ZWxfY29tcHV0ZV9rZXJuZWxz
ICprZXJuZWxzOw0KPiA+ICAgCXN0cnVjdCB1c2VyX2V4ZWNlbnYgZXhlY2VudiA9IHsgMCB9Ow0K
PiA+ICAgCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7DQo+ID4gLQlz
dHJ1Y3QgdGltZXZhbCBzdGFydCwgZW5kOw0KPiA+ICAgCWRvdWJsZSBlbGFwc2VfdGltZSwgbG93
ZXJfYm91bmQsIHVwcGVyX2JvdW5kOw0KPiA+DQo+ID4gICAJZmQgPSBkcm1fb3Blbl9kcml2ZXIo
RFJJVkVSX1hFKTsNCj4gPiBAQCAtMjQ3LDIwICsyNDAsMjMgQEAgdGVzdF9jb21wdXRlX2tlcm5l
bF9sb29wKHVpbnQ2NF90DQo+IGxvb3BfZHVyYXRpb24pDQo+ID4gICAJZXhlY2Vudi5rZXJuZWxf
c2l6ZSA9IGtlcm5lbHMtPmxvb3Bfa2VybmVsX3NpemU7DQo+ID4NCj4gPiAgIAl4ZV9mb3JfZWFj
aF9lbmdpbmUoZmQsIGh3ZSkgew0KPiA+ICsJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCA9IHt9Ow0K
PiA+ICsNCj4gPiAgIAkJaWYgKGh3ZS0+ZW5naW5lX2NsYXNzICE9IERSTV9YRV9FTkdJTkVfQ0xB
U1NfQ09NUFVURSkNCj4gPiAgIAkJCWNvbnRpbnVlOw0KPiA+DQo+ID4gICAJCWlndF9pbmZvKCJS
dW5uaW5nIGxvb3Bfa2VybmVsIG9uIGNjcyBlbmdpbmUgJWRcbiIsIGh3ZS0NCj4gPmVuZ2luZV9p
bnN0YW5jZSk7DQo+ID4gLQkJZ2V0dGltZW9mZGF5KCZzdGFydCwgTlVMTCk7DQo+ID4gKwkJaWd0
X25zZWNfZWxhcHNlZCgmc3RhcnQpOw0KPiA+ICAgCQlpZ3RfYXNzZXJ0X2YoeGVfcnVuX2ludGVs
X2NvbXB1dGVfa2VybmVsX29uX2VuZ2luZShmZCwNCj4gaHdlLCAmZXhlY2VudiwNCj4gPg0KPiBF
WEVDRU5WX1BSRUZfU1lTVEVNKSwNCj4gPiAgIAkJCSAgICAgIlVuYWJsZSB0byBydW4gY29tcHV0
ZSBrZXJuZWwgc3VjY2Vzc2Z1bGx5XG4iKTsNCj4gPiAtCQlnZXR0aW1lb2ZkYXkoJmVuZCwgTlVM
TCk7DQo+ID4gLQkJZWxhcHNlX3RpbWUgPSBlbGFwc2VkKCZzdGFydCwgJmVuZCk7DQo+ID4gKwkJ
ZWxhcHNlX3RpbWUgPSBpZ3RfbnNlY19lbGFwc2VkKCZzdGFydCkgLyAxZTk7DQo+ID4gICAJCWxv
d2VyX2JvdW5kID0gbG9vcF9kdXJhdGlvbiAvIDFlNiAtIERVUkFUSU9OX01BUkdJTjsNCj4gPiAg
IAkJdXBwZXJfYm91bmQgPSBsb29wX2R1cmF0aW9uIC8gMWU2ICsgRFVSQVRJT05fTUFSR0lOOw0K
PiA+DQo+ID4gLQkJaWd0X2Fzc2VydChsb3dlcl9ib3VuZCA8IGVsYXBzZV90aW1lICYmIGVsYXBz
ZV90aW1lIDwNCj4gdXBwZXJfYm91bmQpOw0KPiA+ICsJCWlndF9hc3NlcnRfZihsb3dlcl9ib3Vu
ZCA8IGVsYXBzZV90aW1lICYmIGVsYXBzZV90aW1lIDwNCj4gdXBwZXJfYm91bmQsDQo+ID4gKwkJ
CSAgICAgIkVsYXBzZWQgdGltZSAlLjNmcyBvdXQgb2YgcmFuZ2UgKCUuM2ZzLCAlLjNmcylcbiIs
DQo+ID4gKwkJCSAgICAgZWxhcHNlX3RpbWUsIGxvd2VyX2JvdW5kLCB1cHBlcl9ib3VuZCk7DQo+
ID4gICAJfQ0KPiA+ICAgCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiA+ICAgfQ0KPiANCj4gDQo+
IExHVE06DQo+IA0KPiBSZXZpZXdlZC1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBp
bnRlbC5jb20+DQoNCg==
