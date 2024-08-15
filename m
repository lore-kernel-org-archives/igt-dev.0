Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48FFC52D7F
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 20:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E70010E53E;
	Thu, 15 Aug 2024 20:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhf0lArc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AA910E53E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723753333; x=1755289333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plLut1Ph5NCRTCVgKhuP0SxXDHZThRypAhOuAFgoXVA=;
 b=lhf0lArc1e4YKAAVYzFUjJD6vc6Erk9nXCuKqkV+tk/ynGMJGJwI9/13
 UMK7SupOHVTmTBHecEpRdX72rqGipGD5psvNPNbCj4r9gqaJAvf+vdknb
 QiAW63hzpEzm/qZ7tHy3vMuQYATyyPKqsieaz5pKz3/yNp000UqkiY1hc
 LFYzL+wtQUp4rcdaEoaOqsZ39Qagy8ErD4LASfAvWww/1naewjOZTYOQq
 Y6TCsX/oV7AmS38FMgoNgsOeq0ypcGjgX+754l71lBeYxPU0/6r6N4znr
 uajhFh9XA++xPhXjz54cfYGP8IuLjDt3j/IMtYiW28cgvU44hhV+NRPBx w==;
X-CSE-ConnectionGUID: iq3W+EgoTAW5+/0i/qHPxQ==
X-CSE-MsgGUID: uKGN+/qASMy1lLcWilEuBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="47438572"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="47438572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 13:22:13 -0700
X-CSE-ConnectionGUID: PA1GMzrHREutfNkLaEFAxQ==
X-CSE-MsgGUID: lWwwPLLKTUKz8XvVxVqEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="90192670"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 13:22:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 13:22:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 13:22:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 13:22:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 13:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSWnbaHllFcopx6oboxR1xEEXILxoLN3/cNZB2tsDpgkIbb/EUWvb8GP5pexBKxmk4fB+JZBrDz9va4k3L/pdQPCeZyOaH2y2eVDeMb69Kj9TBYl9uVbDCWHrxRia0GzgscwRBXZh6nmJeh8jx6BbhZErO200DfeBPeGvW09e2nWV36kLlp8+OXgH83CGU2hmM3AKxtc2KFucjYhoXwPt3fzzME+IUThiA5mqL3i6Dox5uL8SS8w4d0P/Icrn+7p9vhwAE1RjjpNfsQ4hwXUmn40B6BaKEuYcMsTBHXXdjIGC/W1E5j0tGOfD+ZXkVRNWG7XyB+MtfwmfL6sj0R/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plLut1Ph5NCRTCVgKhuP0SxXDHZThRypAhOuAFgoXVA=;
 b=WeNOgb9LunAP++SJFRya7PJUzZ0SLw/xeIwoipL+vlOyl1Yzeznii0kU6VR/jXq71YaBc0GFOtuXWrOcYLnS6xw9qZyjA7kJYJzN9tiybE37H3QmvwcA20KsfgLkyid6UIU+HrHzZdq/WGw1Ngfsm/M/J9U53LGf0VQ+4+iDaBqvmHateAVK61pqH/0bDPcwleNZvgpiho9r6rUagrobpYnCw2chNLX/lr05Bic9WYEPANHD4D2k5NQwwcXwp2REyCyImcdXjEm1oPxGTIpA2a00Vq8s/ETxbh3RKi/xEq29+MdWRYv1i/wGB64XcBo+EMU21UUNukRBRBAktQGiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 20:22:08 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%6]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 20:22:08 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Subject: RE: [PATCH i-g-t,v6 1/2] tests/intel/xe_sysfs_preempt_timeout:
 Porting sysfs preempt test in xe
Thread-Topic: [PATCH i-g-t,v6 1/2] tests/intel/xe_sysfs_preempt_timeout:
 Porting sysfs preempt test in xe
Thread-Index: AQHa7kV5NCXUt1I3UUe2M7lVuDi46LIowddA
Date: Thu, 15 Aug 2024 20:22:08 +0000
Message-ID: <BL3PR11MB57476DF69DB5843C3B849DE3D0802@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240814122829.3878605-1-nakshtra.goyal@intel.com>
 <20240814122829.3878605-2-nakshtra.goyal@intel.com>
In-Reply-To: <20240814122829.3878605-2-nakshtra.goyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|CH0PR11MB8189:EE_
x-ms-office365-filtering-correlation-id: 27fe4794-749c-4e17-826e-08dcbd67f00b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZE9rQTV1MklTRGZRUlBSdlhmZVdFNXRuRCtCeUJZTWdjMFFHZmVEZ2l0b0hr?=
 =?utf-8?B?VVp1VTEzYnNMcXNXanJvT3FrRys3REdFRzR4a0dKQldIRVM4YjY0RStTWTZm?=
 =?utf-8?B?ZlhONDkzcEUxQnRRYU9lcmp2MTRSN3V3R3lzM2hYMDNjN2tOMXRXeHJRbko2?=
 =?utf-8?B?ZmFSVWtoSGd3V0pmKzBhMnFYdDVQUm5nbWJNeUk0QXJleG1YS3Bheld2Q3dI?=
 =?utf-8?B?d3NTck9oaEJRLzdZUWk5S3h6d0lNTVhZd3R2NEs4S1RaTXZ1WFIwd0tFc1dW?=
 =?utf-8?B?azNBTVNjbkk0c3lrVWFLYjV2dkdDWXBSRFpvbTFrVWlEcnErSXhWdUxjMVpq?=
 =?utf-8?B?aHc3WmpXN1RIaUZVMWViRHdsaVpQRS9XYXFQTjJES3A2RUo2eGFnSkg3N3FQ?=
 =?utf-8?B?eDhtK0tQbEk3eEFUZi9uRnBSa1NMbTdpM1N3V1dlb3FXakRSSTBCQ0xiK0c4?=
 =?utf-8?B?YXkvYlh1VG5vU0I5TDBRdVhURERlZVh0TUZJck1TWmh6N3p2QlhWR1IybzFL?=
 =?utf-8?B?dWNsY1BsNGJ3TFAvWVB1ZFhqczlXWktVWVpJSXZkZHZKVTlXWFFtWkNXNDB4?=
 =?utf-8?B?a3Q1bDhZejZSQ3NsTWNpU3YxYmpmUzlERjF2SXNoV2hXRDZoVGR5UHpGUXpY?=
 =?utf-8?B?akY3NGxmejZzNmJLbk1nMHJ6aG9QWVoweWxEUVZvMGRYRVdmd2YwQXVlbDFN?=
 =?utf-8?B?SDZIcG1BWnJLM0RoVVg1R2twOFpNSlpRS2FOT2U0N3M1bmlRay8zU1k5d2NJ?=
 =?utf-8?B?eS83WWlJd3VmUkxtMi8wM1h1ZmVScjIrdXR0eWZ0Rm9pakU3eWRYSGV3TGsv?=
 =?utf-8?B?QzlaSlhRM0cyL1pyTkJxRE9sbWVVY1QxQmtSVU4vVExld1JyME0wT3J5d0I2?=
 =?utf-8?B?cWhySExKbG5xTnpuSVdJdWREY29vN3c4Qk40QUtEWTRvL2FDbmdJTFhEMGhx?=
 =?utf-8?B?ckp1Nlh2dHJhVjNyT3pzS1NkVFB1Y1FFOHEvbDZDalJSK2xYK0M3dHhqMWl0?=
 =?utf-8?B?TlRtV2VQZzZ3djJ6OXF1L0hFcjFscThOdzJDczVlcHFCalFyS3EyRGZzWlhE?=
 =?utf-8?B?dEZKY2JDN2s5Z2ZoKzZIWmlkQ2xZQ0YzN3BVMUMweWpFUFdNd01HVEdlM3B3?=
 =?utf-8?B?NDU3aVlqL3o0ckJwWjREdCtIK3V4U3kvNTBma3hQbnR6ZXY2ajl4eE5KUWM0?=
 =?utf-8?B?dWpqV2h0dDlaWEZaOWdwRzB3MUEzbmI3NEtVT3krbmtiSS8zYXVWTCtuSy9O?=
 =?utf-8?B?TDBPRmw1ZmhYVENnRUFxdDZZZ3Rtb1ZYZkZQTS9Pa2ZBbmlDLzVEV25uWnRF?=
 =?utf-8?B?dTljanY4SWdQemNkdWtKYjhKd0RKSDdFbm5kYy8rejN5T01TdHNzSjZpNFpJ?=
 =?utf-8?B?ai9qdGpXVFJDbVhSRDlsazNqTkxEcEY3ajVjUlNrdFhTN2RZSWs1WUJBYTdw?=
 =?utf-8?B?UG5BZENSNUJMVHNwdnIyT2trTUh4VFdxVXVvUHlVTEI2bUVzT0JZeGVLSFZ4?=
 =?utf-8?B?VEZFOUxmM3JMekZZY1grYmdvSkxWNVRLK3o2dTRZR1hJL2Y2eTlqMy8ybHdj?=
 =?utf-8?B?MmhMcDY5akttQ1BjbytZL1NuZnR3dzFHYnM4b0JsV1gvaVVqUWRBd3FyUi9v?=
 =?utf-8?B?SEV6dGlXa3NwY3RKWUJnQ01uaGV5akF2U2wzT05kTFc2MUFqa003ejBKaHlW?=
 =?utf-8?B?MHBGWkV0TUk2UmRGUUc0anBFM29XUGNYRGVEeDdiWHZja29DQzBScWcyWTZN?=
 =?utf-8?B?Y20vKzAvT1BRaWZ6WWwrRHB5QnNmYzFxTy90OHA4QTVoeTZjZlRKNkNPaEVS?=
 =?utf-8?B?Zmh3K0o2R0tKK2xIS2o3VTJkd1Q5T0d3b3JVQmxUYktFNm9LWkx1dnZ2ODF1?=
 =?utf-8?B?N2F6Q1F6ZzVuYVR5TDNodG03L2RnMFV2YWlTNys2UG1KTUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b09xQ3R3cS9UTytZL0pnS1d4RGVFZmptdDZmZTNSYWNOTkllazFFMk0vQnlp?=
 =?utf-8?B?MC9kYit2QWJwZDBrb0hka0lsN0dTWTdGdEh4bzVpazJXbU1CSEdGVlViWU1v?=
 =?utf-8?B?K3hyN3pXajdIbVJWdnZOdFBWalFySjNyOEFDRGhmRHJ6cXhKSExkK1RmeW9D?=
 =?utf-8?B?SzNBVUJ3N0p1WmtjNFN0RmRuWlN4bWJZT1lhZGpNd3FyaVM1akNuRkQrcXhj?=
 =?utf-8?B?SnVIZG5yUUtNRnp3aXFpQSttckk2UVNQaU9lanFNU3FiT1lYWVJJd093S0cz?=
 =?utf-8?B?YU5lYmxrd29VMnJTMHc1S2xnbEZWbGxRODZWM3FmcnI5cDQ4cVZUVHZENUsw?=
 =?utf-8?B?cDByVm5HWUVsTk13ZFVKY2thazNJZG5VaGlVSmh0VHdHRmFwWmF2RU85OVd4?=
 =?utf-8?B?RHZxRkU5cndIaUtXR09tMUhXNVdTZ1RyYVJBbldHejJrcjNndDRISGh4MnlG?=
 =?utf-8?B?NmdZRnEzSXpSdXlPWFMvSmhib2ZGSWVmNGVjaVpTcTU3L3VyZHE0TnBkWFBR?=
 =?utf-8?B?ejByTXRrU2R2dThXcnhRM1RjcVZ5SzF5a3Y5bzdoWXVrblBNSC9kbVVQZ1Uw?=
 =?utf-8?B?b01pOGdrT1RsczdEL251SDRGeEFXSmNCdEMwTHVKaitHYXlTRGovWnU5c01i?=
 =?utf-8?B?V2NJYjdWVmJualR5b0pGQUFPLzhLSnc5cDN2TlRvMTVaN2NqY3pFdXVXb05a?=
 =?utf-8?B?Ryt3cndJNjlzM1VsTGkvRFc4V3dKVFRvS0x0YlhUMW1td3RmTzZSNE8zNlgv?=
 =?utf-8?B?enFpZkZNTEJLUzJ2dVlpUURJUUhoSW5jZWRjcWw4cWhISDdHSHR4V2N6VEx2?=
 =?utf-8?B?aEk2Sno3SWRHdzhxbGNjQkd2a0daNnVvc3hWSUNjclZmTXUwZUlQWmk4SmlL?=
 =?utf-8?B?M1BhbzFwZEhQVjBUL05tekhhOGFJTWxIQVQ5M2pENlJOa1BrR1J0K0JOcWVo?=
 =?utf-8?B?bzZEMDR2dWVmSm1CbUFFbzQzWUNhakRqRVBXZ1MxNGw3M0wrUFpua1J5bjls?=
 =?utf-8?B?cTI4VmpQdkx2S1M4K3JmQkxKdW9pL2RnSjdVWTcvdzFrdTFPanJydUh0dklx?=
 =?utf-8?B?VmQzYXpybktybTl1L2JSTld0enZFbDE3TzNtc1hwMUlOWG1XVzBPRTAxZ3Iv?=
 =?utf-8?B?WDVkcWJwb0UrOENhdmN1bTJTK3FyODFRbHV2eWszd1lIcTkyaUJaNFd2S1B6?=
 =?utf-8?B?QUNvTzZkMHNzZ0h3cDJ5ZkJVcDZwaDUwNzZaVVhNZ1E4M2dBZU9ZdTNVRVRH?=
 =?utf-8?B?VUYrTEVudkdXVGRia29RSjk4aGJiK3NkOHEvZEZJT3htaWJTcUlWRWpmYThu?=
 =?utf-8?B?cVFUSTJIZjY0RXVLUjZhOWUrajNrN2xpUkR2dUU1UFRDOTBvVlhIN2lLVXl5?=
 =?utf-8?B?d3NvcVlJREwrdng5M2x5clVZRExRV0M4dmRsNy9pTGIrLzAzbXZ4Wlg1QUM5?=
 =?utf-8?B?OGZXOWdaR2J1OHZveDE1aXQySHJlZnVrZW1wZVRza3JPWXMrMUYzeVByRmE1?=
 =?utf-8?B?N1g0amxoRnZySU5QQVBRRHREM2ZSUGMzbm5sMC8wQTMrMytaWVNpQWljSFpZ?=
 =?utf-8?B?YXJwenVoTWVFRllwYkU1Y3VBeUI3OFNvdDFWa2RTTGxMZVluZktQVkp6Qjc5?=
 =?utf-8?B?WUhTQ0UvNmFlOXpxV2dpZ1ZubG9UMFRPb01PMms4Y0duR2lxK2xnNG5JUyt0?=
 =?utf-8?B?cmJwb3FXNGxNa2tGeU9vTzE3c3VyUERSV0ZpcDNoeTVDMDUrUU9VS0dISXVW?=
 =?utf-8?B?MGdUZEYzQnd6NWVyN2c0T25BbmJGWmFaajBzYzVMbDhXK1Z1SUFWV1IxZ01Y?=
 =?utf-8?B?OUhGVFYrQTJGSEJiNERKdmhuOWw4NGszU2g0TU5CYVF5ZVNFN0N2MXlkdUI4?=
 =?utf-8?B?dDlFaitPMjdZbUZBZ0JEckZzalcxYnhuOTRZNFZHOFlhZjJCMXViM09haXRm?=
 =?utf-8?B?NGlaYU5ITnVKQjJ1a1FFVEFlM3dLNzdVSEpPa05VSEVlK1JmaDNsYUdlZWtX?=
 =?utf-8?B?ZkJMeFJvMzNsYkVCNCtvVUdWOEE3ekV6VG5Fb1QyVnBxMlJXUy80N1VhYjFC?=
 =?utf-8?B?K0JWMWs3dXRCdCtZaU96RjFVcEtDb2hoYXJCY2lpTkcvSFZWTFRLRXBLSVlC?=
 =?utf-8?Q?LeoG6Kl6S1OsyKODg+PTqAAty?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fe4794-749c-4e17-826e-08dcbd67f00b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 20:22:08.6243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OuMJuJnJwE5MiFm9gu37hxce68I6ain/YgeqjMGYVyQQ2ZUGNK/efl6F/H8sQ4NAgcp7DcWyPh5g36tB0s4xdMA4lt9GSEkSrlhjaqBDZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEdveWFsLCBOYWtzaHRyYSA8
bmFrc2h0cmEuZ295YWxAaW50ZWwuY29tPg0KPlNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDE0LCAy
MDI0IDU6NTggUE0NCj5UbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEdhbmRpLCBS
YW1hZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29tPg0KPkNjOiBLdW1hciwgSmFuZ2EgUmFo
dWwgPGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT47IENoLCBTYWkgR293dGhhbQ0KPjxzYWku
Z293dGhhbS5jaEBpbnRlbC5jb20+OyBrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tOyBH
aXJvdHJhLA0KPkhpbWFuc2h1IDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNvbT47IFRhdXJvLCBS
aWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCBpLWctdCx2NiAx
LzJdIHRlc3RzL2ludGVsL3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dDogUG9ydGluZyBzeXNmcw0K
PnByZWVtcHQgdGVzdCBpbiB4ZQ0KPg0KPkZyb206IE5ha3NodHJhIEdveWFsIDxuYWtzaHRyYS5n
b3lhbEBpbnRlbC5jb20+DQo+DQo+QWRkaW5nIHByZWVtcHRfdGltZW91dCB0ZXN0IGluIHhlIHNp
bWlsYXIgdG8gaTkxNSB0byBjaGVjayBwcmVlbXB0aW9uIGZvcg0KPmRpZmZlcmVudCBwcmVlbXB0
aW9uX3RpbWVvdXQgbGlrZSA1MCBtcywgMTAwIG1zDQo+DQo+djU6IHJlbW92aW5nIHJhbmRvbSBl
bmdpbmVzIHVzaW5nIGh3ZSBmcm9tIGd0IGFuZCBjbGFzcyBhY2NvcmRpbmcgdG8gbGliIGNoYW5n
ZXMNCj5pbiBpZ3Rfc3lzZnNfZW5naW5lcyBpbiBpZ3Rfc3lzZnMgZmlsZSwgY29ycmVjdGluZyBj
b21tZW50cyxpbmNsdWRpbmcgYW5kIHNvcnRpbmcNCj5zeXN0ZW0gaGVhZGVycw0KPg0KPlNpZ25l
ZC1vZmYtYnk6IE5ha3NodHJhIEdveWFsIDxuYWtzaHRyYS5nb3lhbEBpbnRlbC5jb20+DQo+LS0t
DQo+IHRlc3RzL2ludGVsL3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dC5jIHwgMjE5ICsrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gdGVzdHMvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KPiAyIGZpbGVzIGNoYW5nZWQsIDIyMCBpbnNlcnRpb25zKCspDQo+IGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQuYw0KPg0K
PmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQuYw0KPmIv
dGVzdHMvaW50ZWwveGVfc3lzZnNfcHJlZW1wdF90aW1lb3V0LmMNCj5uZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPmluZGV4IDAwMDAwMDAwMC4uOTBkNWY5MzJkDQo+LS0tIC9kZXYvbnVsbA0KPisrKyBi
L3Rlc3RzL2ludGVsL3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dC5jDQo+QEAgLTAsMCArMSwyMTkg
QEANCj4rLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPisvKg0KPisgKiBDb3B5cmln
aHQgwqkgMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0KPisgKi8NCj4rDQo+Ky8qKg0KPisgKiBURVNU
OiBzeXNmcyBwcmVlbXB0IHRpbWVvdXQNCj4rICogQ2F0ZWdvcnk6IENvcmUNCj4rICogTWVnYSBm
ZWF0dXJlOiBTeXNNYW4NCj4rICogU3ViLWNhdGVnb3J5OiBTeXNNYW4gdGVzdHMNCj4rICogRnVu
Y3Rpb25hbGl0eTogc3lzZnMgcHJlZW1wdCB0aW1lb3V0DQo+KyAqIEZlYXR1cmU6IFNNSSwgY29u
dGV4dA0KPisgKiBUZXN0IGNhdGVnb3J5OiBTeXNNYW4NCkNhbiB5b3UgY3Jvc3MgY2hlY2sgaWYg
dGhlIGRvY3VtZW50YXRpb24gaXMgY29ycmVjdCA/DQo+KyAqDQo+KyAqIFNVQlRFU1Q6ICVzLXRp
bWVvdXQNCj4rICogRGVzY3JpcHRpb246IFRlc3QgdG8gbWVhc3VyZSB0aGUgZGVsYXkgZnJvbSBy
ZXF1ZXN0aW5nIHRoZSBwcmVlbXB0aW9uIHRvIGl0cw0KPisgKiAgICAgIGNvbXBsZXRpb24uIFNl
bmQgZG93biBzb21lIG5vbi1wcmVlbXB0YWJsZSB3b3JrbG9hZHMgYW5kIHRoZW4NCj4rICogICAg
ICByZXF1ZXN0IGEgc3dpdGNoIHRvIGEgaGlnaGVyIHByaW9yaXR5IGNvbnRleHQuIFRoZSBIVyB3
aWxsIG5vdA0KPisgKiAgICAgIGJlIGFibGUgdG8gcmVzcG9uZCwgc28gdGhlIGtlcm5lbCB3aWxs
IGJlIGZvcmNlZCB0byByZXNldCB0aGUgaG9nLg0KUGxlYXNlIGNoZWNrIHRoZSBhbGlnbm1lbnQu
IA0KPisgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4rICoNCj4rICogYXJn
WzFdOg0KPisgKg0KPisgKiBAcHJlZW1wdF90aW1lb3V0X3VzOgkJcHJlZW1wdCB0aW1lb3V0IHVz
DQo+KyAqLw0KPisNCj4rI2luY2x1ZGUgPGZjbnRsLmg+DQo+Kw0KPisjaW5jbHVkZSAiaWd0Lmgi
DQo+KyNpbmNsdWRlICJpZ3Rfc3luY29iai5oIg0KPisjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiDQo+
KyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPisjaW5jbHVkZSAieGUveGVfc3Bpbi5oIg0KPisN
Cj4rI2RlZmluZSBBVFRSICJwcmVlbXB0X3RpbWVvdXRfdXMiDQo+Kw0KPitzdGF0aWMgdm9pZCBz
ZXRfcHJlZW1wdF90aW1lb3V0KGludCBlbmdpbmUsIHVuc2lnbmVkIGludCB2YWx1ZSkgew0KPisJ
dW5zaWduZWQgaW50IGRlbGF5Ow0KPisNCj4rCWlndF9hc3NlcnRfbHRlKDAsIGlndF9zeXNmc19w
cmludGYoZW5naW5lLCBBVFRSLCAiJXUiLCB2YWx1ZSkpOw0KPisJaWd0X3N5c2ZzX3NjYW5mKGVu
Z2luZSwgQVRUUiwgIiV1IiwgJmRlbGF5KTsNCj4rCWlndF9hc3NlcnRfZXEoZGVsYXksIHZhbHVl
KTsNCj4rfQ0KPisNCj4rc3RhdGljIHVpbnQ2NF90IF9fdGVzdF90aW1lb3V0KGludCBmZCwgaW50
IGVuZ2luZSwgdW5zaWduZWQgaW50DQo+K3RpbWVvdXQsIHVpbnQxNl90IGd0LCBpbnQgY2xhc3Mp
IHsNCj4rCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jID0gew0KPisJCS5oYW5kbGUgPSBzeW5jb2Jq
X2NyZWF0ZShmZCwgMCksDQo+KwkJLnR5cGUgPSBEUk1fWEVfU1lOQ19UWVBFX1NZTkNPQkosDQo+
KwkJLmZsYWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+Kwl9Ow0KPisNCj4rCXN0cnVj
dCBkcm1feGVfZXhlYyBleGVjID0gew0KPisJCS5udW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4rCQku
bnVtX3N5bmNzID0gMSwNCj4rCQkuc3luY3MgPSB0b191c2VyX3BvaW50ZXIoJnN5bmMpLA0KPisJ
fTsNCj4rLyogaGlnaCBwcmlvcml0eSBwcm9wZXJ0eSAqLw0KPisJc3RydWN0IGRybV94ZV9leHRf
c2V0X3Byb3BlcnR5IGV4dCA9IHsNCj4rCQkuYmFzZS5uZXh0X2V4dGVuc2lvbiA9IDAsDQo+KwkJ
LmJhc2UubmFtZSA9DQo+RFJNX1hFX0VYRUNfUVVFVUVfRVhURU5TSU9OX1NFVF9QUk9QRVJUWSwN
Cj4rCQkucHJvcGVydHkgPSBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlfUFJJT1JJVFks
DQo+KwkJLnZhbHVlID0gMiwgLyogSGlnaCBwcmlvcml0eSAqLw0KPisJfTsNCj4rCXN0cnVjdCBk
cm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UgPSBOVUxMLCAqX2h3ZTsNCj4rCXVpbnQ2
NF90IGFobmRbMl07DQo+Kwl1aW50MzJfdCBleGVjX3F1ZXVlc1syXTsNCj4rCXVpbnQzMl90IHZt
WzJdOw0KPisJdWludDMyX3QgYm9bMl07DQo+KwlzaXplX3QgYm9fc2l6ZTsNCj4rCXN0cnVjdCB4
ZV9zcGluICpzcGluWzJdOw0KPisJc3RydWN0IHRpbWVzcGVjIHRzID0ge307DQo+Kwlkb3VibGUg
ZWxhcHNlZDsNCj4rCXVpbnQ2NF90IGFkZHIxID0gMHgxYTAwMDAsIGFkZHIyID0gMHgxMDAwMDA7
DQo+Kw0KPisJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBfaHdlKQ0KPisJCWlmIChfaHdlLT5lbmdp
bmVfY2xhc3MgPT0gY2xhc3MgJiYgX2h3ZS0+Z3RfaWQgPT0gZ3QpDQo+KwkJCWh3ZSA9IF9od2U7
DQo+Kw0KPisJaWYgKCFod2UpDQo+KwkJcmV0dXJuIC0xOw0KPisNCj4rCS8qIHNldCBwcmVlbXB0
IHRpbWVvdXQqLw0KPisJc2V0X3ByZWVtcHRfdGltZW91dChlbmdpbmUsIHRpbWVvdXQpOw0KPisJ
dm1bMF0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPisJdm1bMV0gPSB4ZV92bV9jcmVhdGUo
ZmQsIDAsIDApOw0KPisJZXhlY19xdWV1ZXNbMF0gPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwg
dm1bMF0sIGh3ZSwgMCk7DQo+KwlleGVjX3F1ZXVlc1sxXSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRl
KGZkLCB2bVsxXSwgaHdlLA0KPnRvX3VzZXJfcG9pbnRlcigmZXh0KSk7DQo+KwlhaG5kWzBdID0g
aW50ZWxfYWxsb2NhdG9yX29wZW4oZmQsIDAsIElOVEVMX0FMTE9DQVRPUl9SRUxPQyk7DQo+Kwli
b19zaXplID0geGVfYmJfc2l6ZShmZCwgc2l6ZW9mKCpzcGluKSk7DQo+Kwlib1swXSA9IHhlX2Jv
X2NyZWF0ZShmZCwgdm1bMF0sIGJvX3NpemUsIHZyYW1faWZfcG9zc2libGUoZmQsIDApLCAwKTsN
Cj4rCXNwaW5bMF0gPSB4ZV9ib19tYXAoZmQsIGJvWzBdLCBib19zaXplKTsNCj4rCXhlX3ZtX2Jp
bmRfYXN5bmMoZmQsIHZtWzBdLCAwLCBib1swXSwgMCwgYWRkcjEsIGJvX3NpemUsICZzeW5jLCAx
KTsNCj4rCXhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMF0sIC5hZGRyID0gYWRkcjEsDQo+KwkJCQku
cHJlZW1wdCA9IGZhbHNlKTsNCj4rCWV4ZWMuYWRkcmVzcyA9IGFkZHIxOw0KPisJZXhlYy5leGVj
X3F1ZXVlX2lkID0gZXhlY19xdWV1ZXNbMF07DQo+Kwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+Kwl4
ZV9zcGluX3dhaXRfc3RhcnRlZChzcGluWzBdKTsNCj4rDQo+KwlpZ3RfbnNlY19lbGFwc2VkKCZ0
cyk7DQo+KwlhaG5kWzFdID0gaW50ZWxfYWxsb2NhdG9yX29wZW4oZmQsIDAsIElOVEVMX0FMTE9D
QVRPUl9SRUxPQyk7DQo+Kwlib1sxXSA9IHhlX2JvX2NyZWF0ZShmZCwgdm1bMV0sIGJvX3NpemUs
IHZyYW1faWZfcG9zc2libGUoZmQsIDApLCAwKTsNCj4rCXNwaW5bMV0gPSB4ZV9ib19tYXAoZmQs
IGJvWzFdLCBib19zaXplKTsNCj4rCXhlX3ZtX2JpbmRfc3luYyhmZCwgdm1bMV0sIGJvWzFdLCAw
LCBhZGRyMiwgYm9fc2l6ZSk7DQo+Kwl4ZV9zcGluX2luaXRfb3B0cyhzcGluWzFdLCAuYWRkciA9
IGFkZHIyKTsNCj4rCWV4ZWMuYWRkcmVzcyA9IGFkZHIyOw0KPisJZXhlYy5leGVjX3F1ZXVlX2lk
ID0gZXhlY19xdWV1ZXNbMV07DQo+Kwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+Kwl4ZV9zcGluX3dh
aXRfc3RhcnRlZChzcGluWzFdKTsNCj4rCWVsYXBzZWQgPSBpZ3RfbnNlY19lbGFwc2VkKCZ0cyk7
DQo+Kwl4ZV9zcGluX2VuZChzcGluWzFdKTsNCj4rDQo+Kwl4ZV92bV91bmJpbmRfYXN5bmMoZmQs
IHZtWzBdLCAwLCAwLCBhZGRyMSwgYm9fc2l6ZSwgJnN5bmMsIDEpOw0KPisJaWd0X2Fzc2VydChz
eW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7DQo+
Kw0KPisJeGVfc3Bpbl9lbmQoc3BpblswXSk7DQo+Kwl4ZV92bV91bmJpbmRfc3luYyhmZCwgdm1b
MV0sIDAsIGFkZHIyLCBib19zaXplKTsNCj4rCXN5bmNvYmpfZGVzdHJveShmZCwgc3luYy5oYW5k
bGUpOw0KPisNCj4rCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZXNbMF0pOw0K
PisJeGVfdm1fZGVzdHJveShmZCwgdm1bMF0pOw0KPisJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZk
LCBleGVjX3F1ZXVlc1sxXSk7DQo+Kwl4ZV92bV9kZXN0cm95KGZkLCB2bVsxXSk7DQo+Kw0KPisJ
cHV0X2FobmQoYWhuZFsxXSk7DQo+KwlwdXRfYWhuZChhaG5kWzBdKTsNCj4rDQo+KwlyZXR1cm4g
ZWxhcHNlZDsNCj4rfQ0KPisNCj4rc3RhdGljIHZvaWQgdGVzdF90aW1lb3V0KGludCBmZCwgaW50
IGVuZ2luZSwgY29uc3QgY2hhciAqKnByb3BlcnR5LA0KPit1aW50MTZfdCBjbGFzcywgaW50IGd0
KSB7DQo+Kwl1aW50NjRfdCBkZWxheXNbXSA9IHsgMTAwMCwgNTAwMDAsIDEwMDAwMCwgNTAwMDAw
IH07DQo+Kwl1bnNpZ25lZCBpbnQgc2F2ZWQ7DQo+Kwl1aW50NjRfdCBlbGFwc2VkOw0KPisJdWlu
dDY0X3QgZXBzaWxvbjsNCj4rDQo+KyAgICAvKg0KPisgICAgICogU2VuZCBkb3duIHNvbWUgbm9u
LXByZWVtcHRhYmxlIHdvcmtsb2FkcyBhbmQgdGhlbiByZXF1ZXN0IGENCj4rICAgICAqIHN3aXRj
aCB0byBhIGhpZ2hlciBwcmlvcml0eSBjb250ZXh0LiBUaGUgSFcgd2lsbCBub3QgYmUgYWJsZSB0
bw0KPisgICAgICogcmVzcG9uZCwgc28gdGhlIGtlcm5lbCB3aWxsIGJlIGZvcmNlZCB0byByZXNl
dCB0aGUgaG9nLiBUaGlzDQo+KyAgICAgKiB0aW1lb3V0IHNob3VsZCBtYXRjaCBvdXIgc3BlY2lm
aWNhdGlvbiwgYW5kIHNvIHdlIGNhbiBtZWFzdXJlDQo+KyAgICAgKiB0aGUgZGVsYXkgZnJvbSBy
ZXF1ZXN0aW5nIHRoZSBwcmVlbXB0aW9uIHRvIGl0cyBjb21wbGV0aW9uLg0KPisgICAgICovDQo+
Kw0KPisJaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lLCBwcm9wZXJ0eVswXSwgIiV1
IiwgJnNhdmVkKSA9PSAxKTsNCj4rCWlndF9kZWJ1ZygiSW5pdGlhbCAlczoldVxuIiwgcHJvcGVy
dHlbMF0sIHNhdmVkKTsNCj4rDQo+KwllbGFwc2VkID0gX190ZXN0X3RpbWVvdXQoZmQsIGVuZ2lu
ZSwgMTAwMCwgZ3QsIGNsYXNzKTsNCj4rCWVwc2lsb24gPSAyICogZWxhcHNlZCAvIDEwMDA7DQo+
KwlpZiAoZXBzaWxvbiA8IDUwMDAwKQ0KPisJCWVwc2lsb24gPSA1MDAwMDsNCj4rCWlndF9pbmZv
KCJNaW5pbXVtIHRpbWVvdXQgbWVhc3VyZWQgYXMgJS4zZnVzOyBzZXR0aW5nIGVycm9yIHRocmVz
aG9sZCB0bw0KPiUiIFBSSWQ2NCAidXNcbiIsDQo+KwkJCSBlbGFwc2VkICogMWUtMywgZXBzaWxv
bik7DQo+KwlpZ3RfcmVxdWlyZShlcHNpbG9uIDwgMTAwMDAwMDApOw0KPisNCj4rCWZvciAoaW50
IGkgPSAwOyBpIDwgQVJSQVlfU0laRShkZWxheXMpOyBpKyspIHsNCj4rCQllbGFwc2VkID0gX190
ZXN0X3RpbWVvdXQoZmQsIGVuZ2luZSwgZGVsYXlzW2ldLCBndCwgY2xhc3MpOw0KPisJCWlndF9p
bmZvKCIlczolbGQsIGVsYXBzZWQ9JS4zZnVzXG4iLA0KPisJCQlwcm9wZXJ0eVswXSwgZGVsYXlz
W2ldLCBlbGFwc2VkICogMWUtMyk7DQo+Kw0KPisJCS8qDQo+KwkJICogV2UgbmVlZCB0byBnaXZl
IGEgY291cGxlIG9mIGppZmZpZXMgc2xhY2sgZm9yIHRoZSBzY2hlZHVsZXINCj4rCQkgKiB0aW1l
b3V0cyBhbmQgdGhlbiBhIGxpdHRsZSBtb3JlIHNsYWNrIGZvciB0aGUgb3ZlcmhlYWQgaW4NCj4r
CQkgKiBzdWJtaXR0aW5nIGFuZCBtZWFzdXJpbmcuDQo+KwkJICovDQo+KwkJCWlndF9hc3NlcnRf
ZihlbGFwc2VkIC8gMTAwMCAgPCBkZWxheXNbaV0gKyBlcHNpbG9uLA0KPisJCQkJICJGb3JjZWQg
cHJlZW1wdGlvbiB0aW1lb3V0IGV4Y2VlZGVkDQo+cmVxdWVzdCFcbiIpOw0KPisJfQ0KPisNCj4r
CXNldF9wcmVlbXB0X3RpbWVvdXQoZW5naW5lLCBzYXZlZCk7DQo+K30NCj4rDQo+K2lndF9tYWlu
DQo+K3sNCj4rCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPisJCWNvbnN0IGNoYXIgKm5hbWU7DQo+
KwkJdm9pZCAoKmZuKShpbnQsIGludCwgY29uc3QgY2hhciAqKiwgdWludDE2X3QsIGludCk7DQo+
Kwl9IHRlc3RzW10gPSB7DQo+KwkJeyAidGltZW91dCIsIHRlc3RfdGltZW91dCB9LA0KPisJCXsg
fQ0KPisJfTsNCj4rCWNvbnN0IGNoYXIgKnByb3BlcnR5W11bM10gPSB7IHsicHJlZW1wdF90aW1l
b3V0X3VzIiwNCj4rDQo+InByZWVtcHRfdGltZW91dF9taW4iLA0KPisNCj4icHJlZW1wdF90aW1l
b3V0X21heCJ9LCB9Ow0KU2FtZSBoZXJlLg0KPisJaW50IGNvdW50ID0gc2l6ZW9mKHByb3BlcnR5
KSAvIHNpemVvZihwcm9wZXJ0eVswXSk7DQo+KwlpbnQgZmQgPSAtMSwgc3lzX2ZkLCBndDsNCj4r
CWludCBlbmdpbmVzX2ZkID0gLTEsIGd0X2ZkID0gLTE7DQo+Kw0KPisJaWd0X2ZpeHR1cmUgew0K
PisJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+Kw0KPisJCXN5c19mZCA9IGln
dF9zeXNmc19vcGVuKGZkKTsNCj4rCQlpZ3RfcmVxdWlyZShzeXNfZmQgIT0gLTEpOw0KPisJCWNs
b3NlKHN5c19mZCk7DQo+Kwl9DQo+Kw0KPisJZm9yIChpbnQgaSA9IDA7IGkgPCBjb3VudDsgaSsr
KSB7DQo+KwkJZm9yICh0eXBlb2YoKnRlc3RzKSAqdCA9IHRlc3RzOyB0LT5uYW1lOyB0KyspIHsN
Cj4rCQkJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljX2YoIiVzLSVzIiwgcHJvcGVydHlbaV1bMF0s
IHQtDQo+Pm5hbWUpIHsNCj4rCQkJCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkgew0KPisJCQkJCWd0
X2ZkID0geGVfc3lzZnNfZ3Rfb3BlbihmZCwgZ3QpOw0KPisJCQkJCWlndF9yZXF1aXJlKGd0X2Zk
ICE9IC0xKTsNCj4rCQkJCQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcyIsDQo+
T19SRE9OTFkpOw0KPisJCQkJCWlndF9yZXF1aXJlKGVuZ2luZXNfZmQgIT0gLTEpOw0KPisNCj4r
CQkJCQlpZ3Rfc3lzZnNfZW5naW5lcyhmZCwgZW5naW5lc19mZCwgZ3QsIDEsDQo+cHJvcGVydHlb
aV0sIHQtPmZuKTsNCj4rCQkJCQljbG9zZShlbmdpbmVzX2ZkKTsNCj4rCQkJCQljbG9zZShndF9m
ZCk7DQo+KwkJCQl9DQo+KwkJCX0NCj4rCQl9DQo+Kwl9DQo+KwlpZ3RfZml4dHVyZSB7DQo+KwkJ
ZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+Kwl9DQo+K30NCj5kaWZmIC0tZ2l0IGEvdGVzdHMvbWVz
b24uYnVpbGQgYi90ZXN0cy9tZXNvbi5idWlsZCBpbmRleCBlNjQ5NDY2YmUuLjAwNTU2YzlkNg0K
PjEwMDY0NA0KPi0tLSBhL3Rlc3RzL21lc29uLmJ1aWxkDQo+KysrIGIvdGVzdHMvbWVzb24uYnVp
bGQNCj5AQCAtMzE0LDYgKzMxNCw3IEBAIGludGVsX3hlX3Byb2dzID0gWw0KPiAJJ3hlX3dhaXRm
ZW5jZScsDQo+IAkneGVfc3Bpbl9iYXRjaCcsDQo+IAkneGVfc3lzZnNfZGVmYXVsdHMnLA0KPisJ
J3hlX3N5c2ZzX3ByZWVtcHRfdGltZW91dCcsDQo+IAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCj4g
XQ0KRmV3IGFsaWdubWVudHMgbmVlZCB0byBiZSBjb3JyZWN0ZWQsIENvZGUgbG9va3MgZmluZSB0
byBtZS4gDQpDb25zaWRlciBteSByLWIgYWZ0ZXIgZml4aW5nIGFib3ZlIGNvbW1lbnRzLiANClJl
dmlld2VkLWJ5OiBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPg0K
Pi0tDQo+Mi4zNC4xDQoNCg==
