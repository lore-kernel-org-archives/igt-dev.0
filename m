Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D0FD3B994
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCDA10E4E1;
	Tue,  9 Dec 2025 21:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0R2st0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF110E4E1
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315575; x=1796851575;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kbDKQujBGFoBj5eszWncz1cwKEB0CF6amiIBcs6+dDE=;
 b=Q0R2st0OISqaKYULTcmiCwg+bq0hI6bEDOMUR/naRqe4TwJ8ucRRS6rL
 k38S4QRlTT1LdYkLeewdYzDf1gHGX5CKQoy+QELtSiIjvvQBMKipfhQLR
 jAEE3RMRG8PulrY5hUkTMsWz3Cpqb2CPwbWk0qfQ8LzPbPS4UKYps4HLk
 JaqC1G4vjmiRdsuVKj/Iw1nz5hFdnvPIt0NEMiewCPThwh1cch6ZbAM9Q
 NIP2yajxaCmHSmkCvHXxNP7OLmzQlzzk6hK7MIiZUxBEXc7uhy9Xb878L
 tHKdj/LYqnZG0UyjItupN38Tw5M6HuqxvnLCzABFThsYVOmPhXlhsN7wQ A==;
X-CSE-ConnectionGUID: zd3bc2F4TBWAUArHTvCqiw==
X-CSE-MsgGUID: K2ZiBZhoQvOkyv68l2bMeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67333233"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67333233"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:26:15 -0800
X-CSE-ConnectionGUID: H+yGRYbRQumDcS3NzBqvSg==
X-CSE-MsgGUID: P4LyvdDrRMyZ/R7sOdRBGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="195408533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:26:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:26:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:26:14 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:26:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlfhutTJSvfUqOpUOb2tkXn4kLIANfkdw/QL7v5jcFgzYsnwgNgdaDiLs3gmZrDO42VrXbd9FxCfQLekNRYAqfnWI2X7JNEweAGvJhn2tyUMJB4vobzKPP7CYYyIvIuVWnjkjl0CKzkncjlfAeqq+QYK6Ra9h7evefX03/mJjO+OeJbF+YkHwb8kaD7D597ocmpZ+KiFDrn6t0XQoLsLh6yuNj6HJdXLpRh36mUBMTicr9h82o7yNV1uaDgnX6/Ohl+URSe+qu8oRkPa84ur03BdpNodBs3UC3RdFYrpRTorREFgJDA+GMq2HP3zE6BUMXenAP6+TM0fpIRLK1UjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbDKQujBGFoBj5eszWncz1cwKEB0CF6amiIBcs6+dDE=;
 b=xQRpxD+wkJqnTmBkDhh0/6pUEzwcEhP/7j2wO26rg6fXOumObB3fC4Kzy11QOh06yXg13pUJzHd6iplQbHwttyzDEWtUUQuhlh4VRyqdM7A7fYwM6OXl7XXf8uMNSx3Pc4YvHf2nTlapPgq1f33TUGIezcjGzLYM5Ra+lj8UaikPMnEiGJCQcJH2aqdf/n76sBATd1OyUtk7AVm0bVSznOADD9oPLT8VmpS5j2tiahRcdT0uX99+D6swrc7dYJIgvXWivtF1cGIx2i8qIk/ECuldRb9lQpRPIP75K9fwaVX98BaUJIHAuVHDmzszCUnI8w2DZDMKc7d0VHMknTblog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 21:26:12 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:26:12 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 18/18] tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity
Thread-Topic: [PATCH v3 18/18] tests/intel/xe_exec_multi_queue: Keep group
 active in exec-sanity
Thread-Index: AQHcaLsRxx3ohw38U02cF8gQonm2OLUZ02kA
Date: Tue, 9 Dec 2025 21:26:12 +0000
Message-ID: <6788af07bbc97e1c2ef560cf4b1b1e561a13afc5.camel@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-38-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-38-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN0PR11MB5986:EE_
x-ms-office365-filtering-correlation-id: 16e93520-bbab-49a4-1e9c-08de376993e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SnJjVjBsWVJ6bmZOMFk0Zk13bWlWbnZ2RG0zakNpRVFCWkphTldqYVNvZnJT?=
 =?utf-8?B?THpHY080VTF1dzlucDE2Qy9JamQwd2RmREJScE9xdkxQK3ExWk8xS1YrZkpl?=
 =?utf-8?B?YlFjcmEwUEMvZG90VG1hK0ZOU0ZxZmw3SkdJT3IvZnlPRHFRYUc5M1RjRFRt?=
 =?utf-8?B?SkxZTjBieng0MzFKc1FKNEZtWEFISzhvemJRMXIwV1hJNzZmMVpQd21GZHZV?=
 =?utf-8?B?L0lGWFROTGZQb1o0M1NuVmJjZXUrOE0xY3dKb1I3YTBCNDFrTlpBM2pRMDRQ?=
 =?utf-8?B?MmMybGl2aXBLQU9NZG9tNXdUZ2lYblcxNUNWdXllTUdYZFNLYU0ydk5PR3FZ?=
 =?utf-8?B?ZFlFWktvWkFwZE1md0VDaUFtTU9IOExZNFFrekVUOTM2ZTFjWW9kbkZCdTV4?=
 =?utf-8?B?cklkYU12Q3lNYkpIWXJZMDFCTmxMZDlhOGhwSm5teE92eXR5K0ZQSnB0eUpk?=
 =?utf-8?B?QmJrK2N2WkpXWGs2YjZ0Tk1sOTZKajhOL2JGUHg1dklJcmh5VWpJak85Z0g3?=
 =?utf-8?B?UVo1ekJjV0RqbGxxOU11ZVgzWVBJejFjazBOeE12VHBDcXFOY1Bha3cyYUF1?=
 =?utf-8?B?V1FFVkdiTkpIVDVNZHRoOWUrS2Iwc3VyeDV4Y1QwK2srQjF6Y1dTY3Mrc1VK?=
 =?utf-8?B?Q2JYZXc3b0xCaVNlYVgwWkJYY2huRDJXdkJ4NFdUTW5QUGJQZmNaazJRdnA2?=
 =?utf-8?B?ZVFSMHZFOXhxaGozQ1pZNWlJUGtJNm0zSUJtbktGcElIbXBYYUpKSm83aHZO?=
 =?utf-8?B?NnY0NVBSV1RnT0tkUDNaSUZrSHJNeWRJdm5sSit5R1FaZU0yNjZmWTBRSU1S?=
 =?utf-8?B?WlEzRjZUUHZwUHY0WTBoN2dmUWpELzlVZzB6WkZUYi9hcmVzWmJScnpnNG83?=
 =?utf-8?B?TkV5a2NTclVUQ1NuQk9QL1pJRFgvRXlhV242R3VxK04yTjdCM0t1c0hyWlhB?=
 =?utf-8?B?L2xtMklmbGFxOXhWVmU0L3hRVkt0eWVRanE2QjFlYzZBK1ppYTRRYWRhVEVw?=
 =?utf-8?B?Z0tXVUJkY01GOCtscFFydm8vcGNjUXZGbVNIWW5haVFNWmd4VThiL3JQZ1NQ?=
 =?utf-8?B?MzFnQ2R3L3JXcXdPaWNvZzFSaDBzbUhFWEIyazBleWJOM0YyTkVOa01oU3FW?=
 =?utf-8?B?RE9aSitqWDM1Smc0STg0d0RtaVNVSTl2V1NIdlJJbFF0cjZrOWZiWnl0ZzN0?=
 =?utf-8?B?YTdKcjdieGE5eWtKWFQzSEZuOGlMcEtaKzBCMTdheGZpcmZnOU9rbjV1Z294?=
 =?utf-8?B?UzcwTk1nL2RudG83TzQ4YnNnaTNPQzJNY3JaeUtHdU9pNFNFeTI4M3pYOVMz?=
 =?utf-8?B?SFVNMnE4dksrMkNaU1JXSjFaUUN1MFJwdTh0TTk5aFE1QnVvcXB3ZWt3MTJh?=
 =?utf-8?B?cXY1emJqVkh6U3hOM2pYWE05MHZmVzdIMElhc0VGQld6bEIwNFVsV0pudXFJ?=
 =?utf-8?B?Zi9ZdWJ5NmU1Skova3Rja2NmbG9ZMUlLbVd4QkFGeTRwTGdZNXgwZ3Y3dWZz?=
 =?utf-8?B?MFdVNGFkcmVQazN2UWlzK0dWS1UvaGtHditIb2luRFB6VWpXLzBrMTdwVGYy?=
 =?utf-8?B?MGFBT0dWbUFhWitSSXRnTktaSUV4SG9HdnVudkFmNUFnTDZnd0huTzZmS3dS?=
 =?utf-8?B?U2o1clZNRGRyaGJmSVFqWEQ1RjhUMmR3WWcvTG1HUkNJdDRNS1ZnSm13NU1Z?=
 =?utf-8?B?QnZ0RmVzZVdqRURIclB3c2JyQUZ5QWYzN2oweGJ2eEp1ZGF3cm9HRUpyOFlH?=
 =?utf-8?B?NEk0YWpzcGJNbTZTRzNNZjZBYXJXc01FWHZ6M3JIVVBhR3VnYWNqV0RYWnFV?=
 =?utf-8?B?bWR6TEs4ZDZ0bVJBdE5YdVpyV01JMkdLMEZNSTBRTWswU1NlbWJNTVd3SHZo?=
 =?utf-8?B?Qk9BU1NoMWVyY1J0MlROdHJHVHR0TEtiU1lzUzA3OHJGSmc0QnVpbGVBbnFY?=
 =?utf-8?B?dXY2LzZrdUpIR3FkOUVEYzh6bjhLekRLQWNubWFRdkpFMFpJOFBnNGdGT0lt?=
 =?utf-8?B?Smkyck9pM0xDcjNNNk02NzkxZVNqdTlOV05hSG82c01vdDZrTlBuNHN4MjNN?=
 =?utf-8?Q?Dknsu5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFJ2dlUvUUhJdDJDT2xwY1dMMWhiMEpFdFBEOW1Xb2taOWFweXJTdnEwSFh1?=
 =?utf-8?B?NXRLWFQremJXL0xoTkxZZXphR1dQUDRHV1ZPZjdhVGtvVzBoVmx1bks5aGZU?=
 =?utf-8?B?dkNaQVl2RVRCUDM4bUVHc3lXaWRIZEZFL21KQmJvaFJ1bi80Z05yM2QzeHN6?=
 =?utf-8?B?UUZSUEtwQjlTRjQza3NVMFN3SkRFZ0JxN0pOcm9ySXl6UjNUWENLLzg3ODVZ?=
 =?utf-8?B?aTFIa1FNU2lWMld5SWJhSW9WS1VWekRaMlJOVURld2UwWmI2M3VaSjFoMmo5?=
 =?utf-8?B?VWZBdVY3ejg3WWtPRjFTajdJTFh3bERsWXg0cjhKU0gxYm4vOGZYbXFNbzdZ?=
 =?utf-8?B?a3h0MWI4WE4va0pvSm8wWXVRZ05jL0FqelBaNGxnaFpZTGtDTnpsYmZkaHpi?=
 =?utf-8?B?WjFLeEZhalpzYk5NVG5xeXRvamR6T0cwVmdFYndLcTdEWFRRSXFyZDdJMmtW?=
 =?utf-8?B?bTVtMVBrUUw0Q2hBL3VIY3N2SGZrWjl0VWdHSThjVW1mazd2bk1kUEJXcThL?=
 =?utf-8?B?TitlM3J5Y2g1SkMwUDZ6YVZmSXpobmJTOGFpd3dpYTZnaTc3SXFhbXE5QnpV?=
 =?utf-8?B?dGswUGRyU2cwWUZITDVkV3VUcEpnazI4cnJESld6MDBNdXZOUmorSHVLcTJP?=
 =?utf-8?B?cWRsODVmTVNRWHc5UC9VQUxnRHk1L01uaDB2RmFGYzJMY3l2THkxT2MzcEls?=
 =?utf-8?B?TWZJQnFBSS9RNzdXNHBCekUwMDVNNjBScnl2Z3draWRObmttWjQ2em1hZ3Zu?=
 =?utf-8?B?R0NxUzdWT0VDYisvd3ROU1gzV0FtdWFRL1gwZ054Ykp2QUdrWlVaZ0tGN2g2?=
 =?utf-8?B?ZEkray9HMGRaazBoSkZNb3RDMWs4cEJkTFJSY1NDbmV4SlYxU3ZIY0Y4YWFk?=
 =?utf-8?B?WHR6UjdyWXhKN1lHY1UvTHJOYTdBRmx3WUxodithV1FxM2MwRmViWTVMV2NK?=
 =?utf-8?B?bEE4dkg1bTR3ZWR1cUZqT2hERDVlVVRrdUp3ZGJ3RjErUGVzc29mSXdHaVdR?=
 =?utf-8?B?TU5TbG40RVhpM3Y3ZXhRZGM5TWtZSllUMEx2NDZFdFB3TDJ1K2NYd2J1d1JO?=
 =?utf-8?B?U2Q4cStnSnZucVZqcERaS2VwRzlNMzZ0Z3J0WWkvRUJGTWR1K25BRFllSGlV?=
 =?utf-8?B?RjhFeEdJb3owRVoyWVQ5RWZXdDV5c0JMdmhhdjhlR3cyaHhLQ2ZGUDlGSnl1?=
 =?utf-8?B?UHhCMjhXRXRJb0RhNEFCY1NtUXdZY1plRkZ5RHJSbTd3UUV4NFBHRzNGNC9D?=
 =?utf-8?B?QVA5K3BxSjc2L2I2UmxrdVo3aWNOTlVhNTZRQ3dQZzEyV0ZkQXhkQ2dQbS9P?=
 =?utf-8?B?akZDL2JZT2ZZL2sybVNWbnFsK1dDejZRYnlMYUxkcVhpS3h2ZVluTFhZUUJ3?=
 =?utf-8?B?K0djdDFRTi9zcy9pWjZJTEJ2OHB5QS9iWHQxbHpRVFNUdGp5SUpsYVVwNGk5?=
 =?utf-8?B?TkNwS2NXSTNzVGM0d01XYzRzTHdsV203MEFBK25JbGpJRTNaR2FvL0NIVGVQ?=
 =?utf-8?B?WURGSzllSG1RQU5LMnlYWUp2TlJhQTJUOUNKREY2a0xJQ0o1cW92NDQzcGlL?=
 =?utf-8?B?Tm9OeHBpd1pObHZ2NStLRXFDaXA5WmhVYit5aldUUFcvZHJ4RGwwS2hVSWZZ?=
 =?utf-8?B?M080a3llS3NXVFFIelFPL0pvalN1SktzRmgrUjFMcS9DaGZ3amFQRXgybTN6?=
 =?utf-8?B?V1JQaFdIQWtaZkhYMUFPaHlHajlaNmdXbEZ4Qm9vM2FpRTJTbDY5eFdacDJp?=
 =?utf-8?B?WkdKS2pJU21zL2JTbVJEVkhrTzgxSnFobVMxZFlDZ0pWMEhPMnMzUWI1dlVX?=
 =?utf-8?B?WXBLTTJsaXB1SUZBR3JWbExLVGxCaVlKMWNDcjNJNWEyWlorcThZZVFqK1ZV?=
 =?utf-8?B?ekdBbUpzUTU2aFlPTE9Vamx1Z0dwS0FBdEpoYmxVdSttRkRYMEpHQ3ljMmdk?=
 =?utf-8?B?QWcyQi82MC9uWGVjTjRqZkY3dHFJU3NHa3NtU2NYMDBuK281VnkzZ1VyVk5x?=
 =?utf-8?B?L2ozNU80eWpFMi9yV21MdE9vZk12RnFWNEYzRlNCcHJybHZ6SXhkTHlaSDZw?=
 =?utf-8?B?OUtiUEpBR2xDLzBsUTZZZ3VRWFpiZVYrQkFNMzh3ZUxDQmhOUDFjdzFzSzYy?=
 =?utf-8?B?TWNDUVpxUFVRRnN6aWNZVjlFM3Z1Q0M0RERYQ3o5L2xZRW8raUdnWE4weFZS?=
 =?utf-8?B?TVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46ECF486CA703D4FBFE9AFC1992ED1D2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e93520-bbab-49a4-1e9c-08de376993e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 21:26:12.5266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uYYwZ3H1ozQkxDDaoHI1xzozYmQXN+mggP8dJMWVZs6BXEpp1aF6dCE3nHiRJqEHZnIAGj/N17jO8phehBKC7JxbEmYO1wnMuPIZHdK+NLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE5OjIyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEluIGV4ZWMtc2FuaXR5IHN1YnRlc3QsIHZhbGlkYXRlIHRoYXQgam9iIGNh
biBiZSBzdWJtaXR0ZWQKPiBvbiBzZWNvbmRhcnkgcXVldWUgYWZ0ZXIgY2xvc2luZyB0aGUgcHJp
bWFyeSBxdWV1ZSBpZiB0aGUKPiB1c2VyIHNwZWNpZmllcyB0aGUgS0VFUF9BQ1RJVkUgZmxhZyB3
aGlsZSBjcmVhdGluZyB0aGUgZ3JvdXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZp
c2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KPiBS
ZXZpZXdlZC1ieTogU2FpIEdvd3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4KClJl
dmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAt
LS0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9x
dWV1ZS5jCj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBpbmRleCA4M2Y3
ODQwMjEuLmRlZjI4MmZhZiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRp
X3F1ZXVlLmMKPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBAQCAt
MjgyLDYgKzI4Miw3IEBAIF9fdGVzdF9leGVjX3Nhbml0eShpbnQgZmQsIHN0cnVjdAo+IGRybV94
ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgdW5zaWduZWQgaW4KPiDCoMKgwqDCoMKgwqDC
oMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3QgZXh0ID0gdG9fdXNlcl9wb2ludGVyKCZt
dWx0aV9xdWV1ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoGJvb2wgcHJlZW1wdF9tb2RlID0gZmxhZ3Mg
JiBQUkVFTVBUX01PREU7Cj4gK8KgwqDCoMKgwqDCoMKgYm9vbCBrZWVwX2FjdGl2ZSA9IGZsYWdz
ICYgS0VFUF9BQ1RJVkU7Cj4gwqDCoMKgwqDCoMKgwqDCoGludCBpOwo+IMKgCj4gwqDCoMKgwqDC
oMKgwqDCoHN5bmMuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTDsKPiBAQCAtMjkzLDkg
KzI5NCwxMyBAQCBfX3Rlc3RfZXhlY19zYW5pdHkoaW50IGZkLCBzdHJ1Y3QKPiBkcm1feGVfZW5n
aW5lX2NsYXNzX2luc3RhbmNlICplY2ksIHVuc2lnbmVkIGluCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBzeW5jLmhhbmRsZSA9IHN5bmNvYmpfY3JlYXRlKGZkLCAwKTsKPiDCoMKg
wqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgdm0gPSB4ZV92bV9jcmVhdGUoZmQs
IHByZWVtcHRfbW9kZSA/Cj4gRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUgOiAwLCAwKTsK
PiArwqDCoMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgcHJlZW1wdF9tb2RlID8KPiBE
Uk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9E
RSA6IDAsIDApOwo+IMKgwqDCoMKgwqDCoMKgwqBib19zaXplID0geGVfYmJfc2l6ZShmZCwgc2l6
ZW9mKHN0cnVjdCB4ZV9zcGluKSk7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBpZiAoa2VlcF9hY3Rp
dmUpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLnZhbHVlIHw9
IERSTV9YRV9NVUxUSV9HUk9VUF9LRUVQX0FDVElWRTsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoGZv
ciAoaSA9IDA7IGkgPCBOVU1fUVVFVUVTOyBpKyspIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGJvW2ldID0geGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwKPiB2cmFtX2lm
X3Bvc3NpYmxlKGZkLCBlY2lbMF0uZ3RfaWQpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IERSTV9YRV9H
RU1fQ1JFQVRFX0ZMQUdfTkVFRFNfVklTSUJMRV9WUkFNKTsKPiBAQCAtMzQzLDE0ICszNDgsMjcg
QEAgX190ZXN0X2V4ZWNfc2FuaXR5KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSAqZWNpLCB1bnNpZ25lZCBpbgo+IMKgwqDCoMKgwqDCoMKgwqAvKiBEZXN0cm95
IHByaW1hcnkgcXVldWUgKi8KPiDCoMKgwqDCoMKgwqDCoMKgeGVfZXhlY19xdWV1ZV9kZXN0cm95
KGZkLCBleGVjX3F1ZXVlc1swXSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqAvKiBWYWxpZGF0ZSBz
dWJtaXNzaW9uIG9uIHNlY29uZGFyeSBxdWV1ZXMgZmFpbCBhZnRlcgo+IGRlc3Ryb3lpbmcgdGhl
IHByaW1hcnkgKi8KPiArwqDCoMKgwqDCoMKgwqAvKiBWYWxpZGF0ZSBzdWJtaXNzaW9uIG9uIHNl
Y29uZGFyeSBxdWV1ZXMgYWZ0ZXIgZGVzdHJveWluZwo+IHRoZSBwcmltYXJ5ICovCj4gwqDCoMKg
wqDCoMKgwqDCoHhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMV0sIC5hZGRyID0gYWRkclsxXSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoGlmIChwcmVlbXB0X21vZGUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzeW5jLmFkZHIgPSBhZGRyWzFdICsgKGNoYXIgKikmc3BpblsxXS0+ZXhlY19z
eW5jIC0KPiAoY2hhciAqKXNwaW5bMV07Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgZXhlYy5leGVj
X3F1ZXVlX2lkID0gZXhlY19xdWV1ZXNbMV07Cj4gwqDCoMKgwqDCoMKgwqDCoGV4ZWMuYWRkcmVz
cyA9IGFkZHJbMV07Cj4gLcKgwqDCoMKgwqDCoMKgaWd0X2Fzc2VydF9lcShfX3hlX2V4ZWMoZmQs
ICZleGVjKSwgLUVDQU5DRUxFRCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmIChrZWVwX2FjdGl2
ZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9leGVjKGZkLCAmZXhlYyk7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3NwaW5fd2FpdF9zdGFydGVkKHNw
aW5bMV0pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2VuZChzcGlu
WzFdKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHByZWVtcHRfbW9kZSkg
ewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfd2Fp
dF91ZmVuY2UoZmQsICZzcGluWzFdLT5leGVjX3N5bmMsCj4gVVNFUl9GRU5DRV9WQUxVRSwgZXhl
Y19xdWV1ZXNbMV0sIGZlbmNlX3RpbWVvdXQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB9IGVsc2Ugewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWd0X2Fzc2VydChzeW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwKPiBJTlQ2
NF9NQVgsIDAsIE5VTEwpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHN5bmNvYmpfcmVzZXQoZmQsICZzeW5jLmhhbmRsZSwgMSk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArwqDCoMKgwqDCoMKgwqB9IGVsc2Ugewo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlYyhmZCwgJmV4
ZWMpLCAtRUNBTkNFTEVEKTsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKHByZWVtcHRfbW9kZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN5
bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1fc3luYyk7Cj4gQEAgLTM5MCw2ICs0MDgsOCBA
QCB0ZXN0X2V4ZWNfc2FuaXR5KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqZWNpKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBfX3Rlc3RfZXhlY19zYW5pdHko
ZmQsIGVjaSwgMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoF9fdGVzdF9leGVjX3Nhbml0eShmZCwgZWNp
LCBQUkVFTVBUX01PREUpOwo+ICvCoMKgwqDCoMKgwqDCoF9fdGVzdF9leGVjX3Nhbml0eShmZCwg
ZWNpLCBLRUVQX0FDVElWRSk7Cj4gK8KgwqDCoMKgwqDCoMKgX190ZXN0X2V4ZWNfc2FuaXR5KGZk
LCBlY2ksIFBSRUVNUFRfTU9ERSB8IEtFRVBfQUNUSVZFKTsKPiDCoH0KPiDCoAo+IMKgc3RhdGlj
IHZvaWQKCg==
