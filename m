Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A356D2A532
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 20:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB8410E02C;
	Thu,  4 Dec 2025 20:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3KCCll0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204B910E02C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 20:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881167; x=1796417167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VH5A0Dh3vR7usUK0NAHHpGONi2/Cd4Xt3b1PWSuR6uQ=;
 b=i3KCCll0691FU9kw3B59VOs7biXg5RA4hsBL8uT8I5m5SMOMnSHHlR3S
 6Re7nCpeNhQqSMaqgkfhTYYAdzkYL3zPK3luV4fttfTDiOdSL/oL8NoqS
 zGzZNbRJbcw4CrXwQhv7t0kpKZqTZxJSrpgB21MPSl40fskLLpJmzaaoU
 a7JuOzpv6EkUwZylA26SeWzU3Dg34IRvxO3xDHqqvKznJoCe6dwZ+vHMK
 fmMsespuS9WOr7UuJoucSQ0yGHtzaTtnmn/lHiTe7tBgHwZDD8FD6MRo9
 KyZ/ROkQtWQ8Z5C2I5I1nc4qb4MTUWgJqYBAWfHZU5AdW1jio+lOvhKUB g==;
X-CSE-ConnectionGUID: ucbLvzLKQr20ZTUoA+dbUw==
X-CSE-MsgGUID: vrQ72YjHQb6DjE+wDJDGXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="69510200"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="69510200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:46:02 -0800
X-CSE-ConnectionGUID: zUrVnrbJTwyFPU9gJoMtsQ==
X-CSE-MsgGUID: 3X2wdZKITRiH2x1eZGXaVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="225749160"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:46:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:46:01 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:46:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:45:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYQhcqzxbqgI10wPlbAzaGDNml58Ud6SkjJCHQ8Q/8LIM6KfPfGGqBoenfG0joAr8XJ/bBOc11Qgs0czW9Kl8TigKMAb1mIPCr95rwo8dVOkalRNTq/uCQChUMtvTVoymoo/T/H03j7iOyVA4vR/IeTFfKrlAnFiGvwyr1t01K4SFL/4uFvmYJNzaqOa1BojeD8CfliijzJwoKbywxOqCZFzTpyGIr/4dM6KO9bTT+wbqt53L/MchFuk34wNIToRol1kFK/WCNMvm212huIy7O1+gxYyoyCt9ekLmUtriV7aYk1bDoUlGBHYWUkqApff7/ef6Jxb4BNBuF8B5WxflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VH5A0Dh3vR7usUK0NAHHpGONi2/Cd4Xt3b1PWSuR6uQ=;
 b=mapmlILUgdJse6oHbty1miim3BGoCWe5bPlaOE4AkSBwbgdl7p5O9/S94mY8WEOq5p4KYaqetGzMOLxnN5bZcZQCZ1w4mYVvlGWMX88++qlKSAXkBaGYSCtJwh131XMV1AFH1f9fVSRox1SuBx7Lv8fkUYQP18EDeK6zusSlrHqGUplJcULK+Sd374omuD4rWWNgiqeMWQTa6qZOSy6hkrQLASE4mZFKsGw2QrcWYgvuBliztIrs2qZAqZSnYQIjP4pTEe1M3ekFGYzOlwJLag1zHyt1FXWPdH/ZBR+iTuuqRIJwqBNWtnS/COdVQ1Y2ZtGcKfPiXqXqt5YQxjIQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 20:45:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 20:45:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 05/19] tests/intel/xe_exec_multi_queue: Validate queue
 priority setting
Thread-Topic: [PATCH v2 05/19] tests/intel/xe_exec_multi_queue: Validate queue
 priority setting
Thread-Index: AQHcWpwAOBUjK4pppUS28U4fJ+6sRLUSCMCA
Date: Thu, 4 Dec 2025 20:45:56 +0000
Message-ID: <be58876f8e297c0aa41705828f3605f8ed17f00a.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-26-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-26-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB5166:EE_
x-ms-office365-filtering-correlation-id: e208a6b4-5cd8-4cf5-6a33-08de33761fda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T3ZIcDFkd3NNcDdja2NCNGhOd0RlL1NCdnhXL3JmM0NPSWwwVno0VENxWlJP?=
 =?utf-8?B?RnVwMlRUMlNzYW0yK3FlWllHeE9Ba0JOQWMzR3NTQjNFRjZqT2xWQmJkTEZm?=
 =?utf-8?B?M0EvbVJGeG9CbFlCY3VoOG9JOFVmdVRxMm5lVTFmMmYwcGFPR1JabnBvcUhE?=
 =?utf-8?B?K2R5ZGZQaExlbm02WEN3VlFGZ1RyUDI2VzBkSlJuVlVCODF1b0ZmQ0ZUUEUz?=
 =?utf-8?B?d0VyMVU3bWUyNnpyTlV6d0dnTnB3MFpSdFJoLy9KOHFZQTdhMmtteGNhQ29F?=
 =?utf-8?B?aVZ6SG8wSXY5SktnSUttU2JhQ0x4WTRMaE96OU8xT1RBdXNXVGEyWFYyMmJE?=
 =?utf-8?B?bjZnVDNxOHQreXVxdkRMek1ta2pvYjVTalpKMjhSQ3RoQnd4a0lHTTFHZ2NU?=
 =?utf-8?B?ZDd3UlBiZFk3YjJaWEdPYllnamVEb2J2bU1iempFSDhIeWMzSGsySmxldWpv?=
 =?utf-8?B?N0trY0xNVnZqTEc2WnlMMVZPY0QvTEp2L2w2OXdaMHRqbTFnL3RCVTBmem12?=
 =?utf-8?B?cXJIc1ArU1EyTG1Pc05SS1RhREwzRVo5NGM1akpvZC9mOCtWZFY5TVhVdEJ5?=
 =?utf-8?B?VUpRb05MMi96V3lSNXZ4Q3NZL3REK0p4VlErV29qVU0wSm5ERFhBZkN0Y291?=
 =?utf-8?B?NkFZazlDTlNVUTZqb1FyRDhjdVhsMWFVK0x2VmkvRm9qRjZ2anBqNEFkTHRt?=
 =?utf-8?B?OUxENVNBS1ZYNjAwT1huQ2daU293U3RITDFUTllCM2hBTGZMSWtIbnErWnNl?=
 =?utf-8?B?VitwQkY4dUM4UlVVRzA2UHJRaVYvUzl3Slg0RzNNVHNEUkd1M3cyajZCaU1U?=
 =?utf-8?B?clhzN0QxL29lM3Z4Y2tNbWM3djhDRTBpY09vMlZINWN6RDJhRUxvbDBVb2V5?=
 =?utf-8?B?QUtId1JYNTNEV1daeHVKTmpSQW9nZnVtOWg0SlFDeEdIQ1RpZ3ZaSDFqUVhv?=
 =?utf-8?B?M1JUWjdNa1NDaFpwcTdzOEZUSUEwU1d1dENNK1IvaUhDeHVKYStXMi9kUmlJ?=
 =?utf-8?B?UG5kL0JwNXpMZmFuMzd3Y2QyeVZveWt3K3BNbVREZndjb2d5aE92VSsrZ3dw?=
 =?utf-8?B?d2hnNEpKQ3lQa005dEJuT2poT05HZlNoSTEzT3RHUk1uRWhpY3V2WXFDbFEr?=
 =?utf-8?B?ZFVvdEIxdllaLzBBcUR0ZmprQmpLUXovdVZKdjUxWktPY0Rzc3VDcW5NRmJT?=
 =?utf-8?B?TzE5TGkzMzhMUTVEb2oycHp6V2tMOHFHNUMwTFU1M1NVc1NnUWRsSHBUZmJ6?=
 =?utf-8?B?bXVEdWIvRXRWNkRjTVFWaW16NCtEQXVleDFIMzlVY1BwbUlkU1FPTXU0Sktz?=
 =?utf-8?B?a2pCaXZhVVVoRFRFZU9GbVJ3TzE1eklQcTM1WXdxRm93blVZT2JHaCtsbUd2?=
 =?utf-8?B?UnRaQ0d1WDRlYkxGcjdJR05iMi9yVnFtcjJSangzZXIraTl1ejhKaG5Ycm9W?=
 =?utf-8?B?b0ZaQ2VQWU9ia1lKMVZJZ3o4bS8zNTlncnFVUGgrcisvSytuNmh1bVE2SEli?=
 =?utf-8?B?MmwxTG5jaGlwRVZHbjBMaHFsaFFXRkltVHhWM2VybUNIQjJGTnNoYUtvOUpF?=
 =?utf-8?B?bjcyQWo1eW94MVFDMXpxNDdHTE9uUzYvcmRZN29BemR4c203OXFVUFRYR2sx?=
 =?utf-8?B?T3lzVGRhUDloYStkN2FLUGNGN3lLaFMwZjE1YjVaVkwxNU5zRUpJcTV6aUha?=
 =?utf-8?B?T01rUCtzUnZPZ1dyank0Vnc3SVZaSXZNbUxYMHppaGJhK1lCMGRtc0FSNnVJ?=
 =?utf-8?B?bzNFOVA1Z2lLVnI2TVB2VG44dGVLandibTVxL0I3ejlkSEt1ZjNOS3JOTUN5?=
 =?utf-8?B?NEtuVmdkOVQzR0hBWnlCcUpXV2tTL2ZLaUs0NmlXa1R2eXZPak1sU1R5RmpW?=
 =?utf-8?B?WmZGdmEzNzRFZGhRWSswZXoyNmkvZVdVejJuck9tSlhTc2dOSUxCVkllSVZK?=
 =?utf-8?B?OWV4bTU1eEFzNWxNYlFhanpCaURXZUU0bVNocGFqdElmMStEZWNDQ2Z6TE1R?=
 =?utf-8?B?Y1NnOUlLbUh2WndVV0F6WkJvdituK2Y4QTM0RGFaei91RVNVSlAzUTdSZ1Jw?=
 =?utf-8?Q?ayEvyR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkMzTzI0WlRWRmVWcWR0WVZtWXkyQVMvUmoxMTAwUDBwU3BVR2dqbTgvemFo?=
 =?utf-8?B?VDNqL2xNS3lZbkVzT083Q2ROYzlzTFpJQWFTakF4eUg1VVptOSt5RTl2WjRI?=
 =?utf-8?B?MkxudTZZaEoydDVqdUR5LytOenlMekM0ak1GUDdFK0VlNVFpNGhoKy9YYXVh?=
 =?utf-8?B?L3V6NlI5VGFzYWxQZ3lOWUJKeW02bXp3Mit6OGs3bGlFQUM5VFd0bllVZUhU?=
 =?utf-8?B?RFVzVTNLbzdXZVRETDVWUEU0cmVyTVl3VklwcURiU2s2Q2RlUjRORDg3QWlH?=
 =?utf-8?B?N2hsWWI3My9jNEtGbWlZakRrMmVERjZTa0F5emttUkNqRWxZcG5vVTdYeDZl?=
 =?utf-8?B?eEg5eTJyTXVjMTF6K0FaVGRYMWJTdTFHTUk1RUVVS1RVelEydVdvcVlyT1BG?=
 =?utf-8?B?OVVYU05JVUVPUGcyS2M3T1ZlVEtCMDh2RWtTQnA5b0hpWGdVcmNkdkhMQzBv?=
 =?utf-8?B?SHRML3Y4U3YzNWNRbkdKUXZib3pqZlA2SDdPN3JjaTNwdDNYSkFQeGNCSUNN?=
 =?utf-8?B?MkVKTjZFa0JNWHpWb09XQ3JkdnVxL3RkNjRVbE5NNVRPeUJFVnFIWFlDOTRN?=
 =?utf-8?B?cUdDRXkwSnZRWUpVbGg3NWszZUVkVDVha0xpQ2M4NmoxZVhsODNxWXVjNEx2?=
 =?utf-8?B?VmtqYTVEZEpjS2VDdjJUWWEvRWtvalVRTnp0Rk1LMCtFQjRHRWUwdnQzd08r?=
 =?utf-8?B?aG9LcTJ0STJBZmRoY0pqWGpwWU9WRXRMcG5pQVhHMXpUTVpRRmc4QXR0UUhB?=
 =?utf-8?B?S0lSdVB2cXlIOXc0bVdhV1orK1NYT0ZOTGJnRWdGMkJPbVRXeCt0TGxROXdo?=
 =?utf-8?B?cUZIRFhUR3YvSkNIdm56aWtlZHZhU0NNTldBT2N2NjRMbGlWb1pxN1lINnNs?=
 =?utf-8?B?d2xwTTRpWkN5dzI2QnJ1SUNxWW9rRnhnV0MwcG0xZW5CbHo3bTFFMmNTb2VL?=
 =?utf-8?B?MXlhMnA3bGU4VkQvNEROWTBvUXZtMFRJcFpKTkhjY0NPY1FRaEkyTFU0NEFI?=
 =?utf-8?B?VERQRWRWbWVyUHpRcnp1aUhLRmMxckVldGNzWGlWNHlNbXpDWUJqUWNXbkVL?=
 =?utf-8?B?N3BhYStLc2gxWW9XZzhjOFhuVFVTTFNlRVVpSGhJdDVqYllCVHVmUnd3cndY?=
 =?utf-8?B?VFNCNy9YS3V4bTNnNVBxZVlBL0E3V0dFN2pVSmpqUjhtcHJlVGhGakh3TzhC?=
 =?utf-8?B?VUtxN3dpL0YzT3M1WEdvOXdtMHFOUHRUanJrZ20wUEl6UkdXOWtXUTRrd3cy?=
 =?utf-8?B?MDZHcVpDbDR4VkJqR29QZ29QUWhwb2VXeThtc21vT0FMN21nQzI4VFB1VmZS?=
 =?utf-8?B?WUpGeEQ4azdUNGEva2FGd1JUNmF3WnFrL3ZVRm9OSSthS0lUS1RWWWhXQ3c1?=
 =?utf-8?B?QzVHS2l2Q25jRVVDV25vVkh4YVMwS0d2Tkl2bUw4djc5b0VFWE0yYldXREZp?=
 =?utf-8?B?Wk5MdDN3cDQ0Z0kyU2FsTnFXekdDd1ovUHF0TWh6Y0V5dmJsMEd5MXhDaUdx?=
 =?utf-8?B?dGkxdjZOQTlldUlaMU8xTXVjcWdkRU5TUEhSVFNwbFBHYjVkV01qSndpMFBh?=
 =?utf-8?B?Y0IwVWRpTU9sZlN5VEs1M2tKVThRdjJDRG81ckEzMTZhMFlPQkRjSStNS0lN?=
 =?utf-8?B?S1V3WGV6T3ZtSk1IdHZpM2Jqc25keUk4bE9LL3phazJpN2V3UGhzRXBmYis5?=
 =?utf-8?B?SG5NTVVnTWxoVmt2enNkZTI0Yjg2bkU0aWt1RHQ5Q3JDemQvUWhDUks3ajFv?=
 =?utf-8?B?aDZPdmpGOGV5VW5BRUcwY1ptRHJlRTdDcUFtY3hUdXl0MzRlT29BRHljcmM3?=
 =?utf-8?B?NldBNkVmQkNrU0RiTjlTV3hHMTRheW9NcUNyZXNwVU85SUZUTlc3bk1yWVNS?=
 =?utf-8?B?blB5MFhtYWFXQ3B0ZnNiSmRFSDhqQzlCSnRDZ1NjOWwzejMvamlHemNGTUR5?=
 =?utf-8?B?d3p6QXM5UTgwdVdRMUV5akNHLzlrYzlQRitHcElZdUNhWHZkZW9tSDZFOVVi?=
 =?utf-8?B?UmFVeFdIeUYyOGhrc0FpRXF4QlpKUWl4bEVCZmkxdDBhSTBBZm5MTW1xcjE5?=
 =?utf-8?B?T2dTdFAwcVdjcTJ3cXZKNXIyU3JENnZMak5iSDhrNklwUXJGaTc0TzFuZFdB?=
 =?utf-8?B?K3Qvb2t0ZWZjMDFjd3FucGRlREMxUHI3djg4Tmx3Ujd5ZjdBa2w2TkhrVzM5?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03DDD31FAAD2DE44B8C66C350696F4B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e208a6b4-5cd8-4cf5-6a33-08de33761fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 20:45:56.6604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JlPFSSt/XrRRwGf2rMqBjQHG+y5oZs8eyHkZ8bk3nZy7SoK9zDEy8gtLEO7XekTo5vNkaBrTQLXJFKOAuyjBTSPpUbni5E1IM76GOLw+lpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFZhbGlkYXRlIHNldHRpbmcgcHJpb3JpdHkgb2YgcXVldWVzIHdpdGhpbiB0
aGUgbXVsdGkgcXVldWUKPiBncm91cC4KPiAKPiB2MjogQWRkIGFuZCB1c2UgWEVfRVhFQ19RVUVV
RV9OVU1fUFJJT1JJVElFUyAocHJpeWFua2EpCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5h
IFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4K
ClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoK
PiAtLS0KPiDCoHRlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYyB8IDY3Cj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDY3IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5j
Cj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBpbmRleCA5NzdiNGU3YTAu
LjNiYmNmNzk3NSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVl
LmMKPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBAQCAtMTgsOSAr
MTgsMTUgQEAKPiDCoCNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIgo+IMKgI2luY2x1ZGUgInhlL3hl
X3F1ZXJ5LmgiCj4gwqAKPiArI2RlZmluZSBYRV9FWEVDX1FVRVVFX1BSSU9SSVRZX0xPV8KgwqDC
oMKgwqAwCj4gKyNkZWZpbmUgWEVfRVhFQ19RVUVVRV9QUklPUklUWV9OT1JNQUzCoMKgMQo+ICsj
ZGVmaW5lIFhFX0VYRUNfUVVFVUVfUFJJT1JJVFlfSElHSMKgwqDCoMKgMgo+ICsjZGVmaW5lIFhF
X0VYRUNfUVVFVUVfTlVNX1BSSU9SSVRJRVPCoMKgwqAzCj4gKwo+IMKgI2RlZmluZSBNQVhfTl9F
WEVDX1FVRVVFU8KgwqDCoMKgwqDCoDY0Cj4gwqAKPiDCoCNkZWZpbmUgVVNFUlBUUsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgMCkKPiArI2Rl
ZmluZSBQUklPUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgMSkKPiDC
oAo+IMKgI2RlZmluZSBNQVhfSU5TVEFOQ0UgOQo+IMKgCj4gQEAgLTM3LDYgKzQzLDE1IEBAIF9f
dGVzdF9zYW5pdHkoaW50IGZkLCBpbnQgZ3QsIGludCBjbGFzcykKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC5wcm9wZXJ0eSA9Cj4gRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BF
UlRZX01VTFRJX0dST1VQLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnZhbHVl
ID0gRFJNX1hFX01VTFRJX0dST1VQX0NSRUFURSwKPiDCoMKgwqDCoMKgwqDCoMKgfTsKPiArwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3hlX2V4dF9zZXRfcHJvcGVydHkgbXFfcHJpb3JpdHkgPSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5iYXNlLm5hbWUgPQo+IERSTV9YRV9F
WEVDX1FVRVVFX0VYVEVOU0lPTl9TRVRfUFJPUEVSVFksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC5wcm9wZXJ0eSA9Cj4gRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX01V
TFRJX1FVRVVFX1BSSU9SSVRZLAo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gK8KgwqDCoMKgwqDCoMKg
c3RydWN0IGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IHByaW9yaXR5ID0gewo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAuYmFzZS5uYW1lID0KPiBEUk1fWEVfRVhFQ19RVUVVRV9FWFRF
TlNJT05fU0VUX1BST1BFUlRZLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAucHJv
cGVydHkgPSBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlfUFJJT1JJVFksCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC52YWx1ZSA9IFhFX0VYRUNfUVVFVUVfUFJJT1JJVFlf
Tk9STUFMLAo+ICvCoMKgwqDCoMKgwqDCoH07Cj4gwqDCoMKgwqDCoMKgwqDCoHVpbnQ2NF90IGlu
dmFsaWRfZmxhZyA9IDAsIGV4dCA9Cj4gdG9fdXNlcl9wb2ludGVyKCZtdWx0aV9xdWV1ZSk7Cj4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGVjaVtN
QVhfSU5TVEFOQ0VdOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFz
c19pbnN0YW5jZSAqaHdlOwo+IEBAIC03Nyw2ICs5MiwxMSBAQCBfX3Rlc3Rfc2FuaXR5KGludCBm
ZCwgaW50IGd0LCBpbnQgY2xhc3MpCj4gwqDCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLmJhc2Uu
bmV4dF9leHRlbnNpb24gPQo+IHRvX3VzZXJfcG9pbnRlcigmbXVsdGlfcXVldWUpOwo+IMKgwqDC
oMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAx
LCAxLCBlY2ksIGV4dCwKPiAmdmFsKSwgLUVJTlZBTCk7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqAv
KiBTZXR0aW5nIG90aGVyIHF1ZXVlIHByb3BlcnRpZXMgYXJlIHZhbGlkIGZvciBRMCAqLwo+ICvC
oMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLmJhc2UubmV4dF9leHRlbnNpb24gPSB0b191c2VyX3Bv
aW50ZXIoJnByaW9yaXR5KTsKPiArwqDCoMKgwqDCoMKgwqBleGVjX3F1ZXVlc1swXSA9IHhlX2V4
ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgZWNpLCBleHQpOwo+ICvCoMKgwqDCoMKgwqDCoHhlX2V4
ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZXNbMF0pOwo+ICsKPiDCoMKgwqDCoMKgwqDC
oMKgLyogQWRkaW5nIHF1ZXVlcyB0byBncm91cCBhZnRlciBwcmltYXJ5IGlzIGRlc3Ryb3llZCBp
cwo+IGludmFsaWQgKi8KPiDCoMKgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUuYmFzZS5uZXh0X2V4
dGVuc2lvbiA9IDA7Cj4gwqDCoMKgwqDCoMKgwqDCoGV4ZWNfcXVldWVzWzBdID0geGVfZXhlY19x
dWV1ZV9jcmVhdGUoZmQsIHZtLCBlY2ksIGV4dCk7Cj4gQEAgLTEwNSw2ICsxMjUsMTEgQEAgX190
ZXN0X3Nhbml0eShpbnQgZmQsIGludCBndCwgaW50IGNsYXNzKQo+IMKgwqDCoMKgwqDCoMKgwqBp
ZiAobiA+IDEpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0X2Vx
KF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCBuLAo+IGVjaSwgZXh0LCAmdmFsKSwg
LUVJTlZBTCk7Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqAvKiBTZXR0aW5nIHByb3BlcnRpZXMgKG90
aGVyIHRoYW4gTVVMVElfUVVFVUVfUFJJT1JJVFkpIGlzCj4gaW52YWxpZCBmb3Igc2Vjb25kYXJ5
IHF1ZXVlcyAqLwo+ICvCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLmJhc2UubmV4dF9leHRlbnNp
b24gPSB0b191c2VyX3BvaW50ZXIoJnByaW9yaXR5KTsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfYXNz
ZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBlY2ksIGV4dCwKPiAm
dmFsKSwgLUVJTlZBTCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLmJhc2UubmV4
dF9leHRlbnNpb24gPSAwOwo+IMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAxOyBpIDwgTUFYX05f
RVhFQ19RVUVVRVM7IGkrKykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGV4ZWNf
cXVldWVzW2ldID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBlY2ksCj4gZXh0KTsKPiDC
oAo+IEBAIC0xMzUsNiArMTYwLDM3IEBAIF9fdGVzdF9zYW5pdHkoaW50IGZkLCBpbnQgZ3QsIGlu
dCBjbGFzcykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzW2ldKTsKPiDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgLyogTVEgcHJpb3JpdHkgaXMgbm90IHZhbGlk
IGZvciByZWd1bGFyIHF1ZXVlcyAqLwo+ICvCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRfZXEoX194
ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIDEsIDEsIGVjaSwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAKPiB0b191c2VyX3BvaW50ZXIoJm1xX3ByaW9yaXR5KSwgJnZhbCksIC1F
SU5WQUwpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiBNUSBwcmlvcml0eSB2YWxpZGF0aW9uICov
Cj4gK8KgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUudmFsdWUgPSBEUk1fWEVfTVVMVElfR1JPVVBf
Q1JFQVRFOwo+ICvCoMKgwqDCoMKgwqDCoG11bHRpX3F1ZXVlLmJhc2UubmV4dF9leHRlbnNpb24g
PQo+IHRvX3VzZXJfcG9pbnRlcigmbXFfcHJpb3JpdHkpOwo+ICvCoMKgwqDCoMKgwqDCoG1xX3By
aW9yaXR5LnZhbHVlID0gWEVfRVhFQ19RVUVVRV9OVU1fUFJJT1JJVElFUzsKPiArwqDCoMKgwqDC
oMKgwqBpZ3RfYXNzZXJ0X2VxKF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBl
Y2ksIGV4dCwKPiAmdmFsKSwgLUVJTlZBTCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoG1xX3ByaW9y
aXR5LnZhbHVlID0gWEVfRVhFQ19RVUVVRV9QUklPUklUWV9ISUdIOwo+ICvCoMKgwqDCoMKgwqDC
oGV4ZWNfcXVldWVzWzBdID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCBlY2ksIGV4dCk7
Cj4gK8KgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUudmFsdWUgPSBleGVjX3F1ZXVlc1swXTsKPiAr
wqDCoMKgwqDCoMKgwqBleGVjX3F1ZXVlc1sxXSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2
bSwgZWNpLCBleHQpOwo+ICvCoMKgwqDCoMKgwqDCoHhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwg
ZXhlY19xdWV1ZXNbMV0pOwo+ICvCoMKgwqDCoMKgwqDCoHhlX2V4ZWNfcXVldWVfZGVzdHJveShm
ZCwgZXhlY19xdWV1ZXNbMF0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfZm9yayhjaGlsZCwg
MSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfZHJvcF9yb290KCk7Cj4g
Kwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBUZXN0cyBNVUxUSV9RVUVVRV9Q
UklPUklUWSBwcm9wZXJ0eSBieSBkcm9wcGluZwo+IHJvb3QgcGVybWlzc2lvbnMgKi8KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUudmFsdWUgPSBEUk1fWEVfTVVM
VElfR1JPVVBfQ1JFQVRFOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtcV9wcmlv
cml0eS52YWx1ZSA9IFhFX0VYRUNfUVVFVUVfUFJJT1JJVFlfSElHSDsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZXhlY19xdWV1ZXNbMF0gPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShm
ZCwgdm0sIGVjaSwKPiBleHQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtdWx0
aV9xdWV1ZS52YWx1ZSA9IGV4ZWNfcXVldWVzWzBdOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBleGVjX3F1ZXVlc1sxXSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgZWNp
LAo+IGV4dCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2V4ZWNfcXVldWVf
ZGVzdHJveShmZCwgZXhlY19xdWV1ZXNbMV0pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzWzBdKTsKPiArwqDCoMKg
wqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3dhaXRjaGlsZHJlbigpOwo+ICsKPiDCoMKg
wqDCoMKgwqDCoMKgeGVfdm1fZGVzdHJveShmZCwgdm0pOwo+IMKgfQo+IMKgCj4gQEAgLTE5Nyw4
ICsyNTMsMTcgQEAgdGVzdF9sZWdhY3lfbW9kZShpbnQgZmQsIHN0cnVjdAo+IGRybV94ZV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgaW50IG51bV9wbGFjZQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5iYXNlLm5hbWUgPQo+IERSTV9YRV9FWEVD
X1FVRVVFX0VYVEVOU0lPTl9TRVRfUFJPUEVSVFksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnByb3BlcnR5ID0KPiBEUk1fWEVfRVhFQ19RVUVVRV9T
RVRfUFJPUEVSVFlfTVVMVElfR1JPVVAsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX3hlX2V4dF9z
ZXRfcHJvcGVydHkgbXFfcHJpb3JpdHkgPSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAuYmFzZS5uYW1lID0KPiBEUk1fWEVfRVhFQ19RVUVVRV9FWFRF
TlNJT05fU0VUX1BST1BFUlRZLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgLnByb3BlcnR5ID0KPiBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlf
TVVMVElfUVVFVUVfUFJJT1JJVFksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1aW50NjRfdCBleHQgPSB0b191c2Vy
X3BvaW50ZXIoJm11bHRpX3F1ZXVlKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAoZmxhZ3MgJiBQUklPUklUWSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgbXVsdGlfcXVldWUuYmFzZS5uZXh0X2V4dGVuc2lvbiA9Cj4g
dG9fdXNlcl9wb2ludGVyKCZtcV9wcmlvcml0eSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtcV9wcmlvcml0eS52YWx1ZSA9Cj4gWEVfRVhFQ19RVUVV
RV9QUklPUklUWV9OT1JNQUwgKyAocmFuZCgpICUgMik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtdWx0aV9x
dWV1ZS52YWx1ZSA9IGkgPyBleGVjX3F1ZXVlc1swXSA6Cj4gRFJNX1hFX01VTFRJX0dST1VQX0NS
RUFURTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnRfZXEoX194
ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIDEsCj4gbnVtX3BsYWNlbWVudCwgZWNpLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4dCwKPiAmZXhl
Y19xdWV1ZXNbaV0pLCAwKTsKPiBAQCAtMjk5LDYgKzM2NCw3IEBAIHRlc3RfbGVnYWN5X21vZGUo
aW50IGZkLCBzdHJ1Y3QKPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludCBu
dW1fcGxhY2UKPiDCoCAqCj4gwqAgKiBAYmFzaWM6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBiYXNpYwo+IMKg
ICogQHVzZXJwdHI6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVzZXJwdHIKPiArICogQHByaW9yaXR5OsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcHJpb3JpdHkKPiDCoCAqLwo+IMKgc3RhdGljIHZvaWQKPiDCoHRlc3RfZXhlYyhpbnQgZmQs
IHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludAo+IG51bV9wbGFj
ZW1lbnQsCj4gQEAgLTMxNiw2ICszODIsNyBAQCBpZ3RfbWFpbgo+IMKgwqDCoMKgwqDCoMKgwqB9
IHNlY3Rpb25zW10gPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJiYXNp
YyIsIDAgfSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInVzZXJwdHIiLCBV
U0VSUFRSIH0sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByaW9yaXR5Iiwg
UFJJT1JJVFkgfSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgTlVMTCB9LAo+
IMKgwqDCoMKgwqDCoMKgwqB9Owo+IMKgwqDCoMKgwqDCoMKgwqBpbnQgZmQsIGd0LCBjbGFzczsK
Cg==
