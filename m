Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAE2C3064D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 14:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C6B10E03C;
	Thu, 27 Jun 2024 14:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9wmQ2Rt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40E10E03C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719498229; x=1751034229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=3Pn3TTkUpvEuxYQQ8gBhg3sRgEyqkyKM0spiRuuTeEM=;
 b=e9wmQ2RtfFfIJbquWx5vHkvBsEs0L+QcSolSmCWBOuNc6xEKka50gzWM
 qjsLstM7iE1E58evqk5CYVi4aJhFLDt/pcqb7cGLYqcs+ftYoJDRkzRoZ
 jOkd1kdb3LR7oJsMPrYgxMx6aYIxH7/VAfcoVfcYu2G1XPNTOtgHq4v36
 OEylyyzjq40oGvE/To9rQlhtlmlA/SjCwa5G5mGb8EqAgQSlER8fFQxfI
 u4DEeV9ojXYECaAStVitrtW65hITy1GdMfkx2YPU/RWkSqIViSM3XC/4t
 qts4gCrzYgj1b6Jz0JSuROFw5QxKnCBeAfo/dDNyssUWNP6VEDpBk6HXt w==;
X-CSE-ConnectionGUID: vcCW77u9SyOpXIIaMnP7dA==
X-CSE-MsgGUID: ySePS5GOSyWvhMWwjiTCKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19522527"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="19522527"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 07:23:49 -0700
X-CSE-ConnectionGUID: Z5LziE/dTI+sySM0Vw3Tow==
X-CSE-MsgGUID: j34q8VgURpuEdV0JoZ5Mdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="49561716"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 07:23:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 07:23:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 07:23:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 07:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE+OBq7IT/PMjP4Mg7oqxEEvc82vWxk678+kWcXxmzReKN5Nc2HCa7ecnR4VF+mJas0BS73HHMPGl/Ybf4QlkgH9XxRUJY258tukpQSLwYMILEzMu1zeATkFgS9ktofhsumoj3n+vz5e70/ZMoFJcDhoLTWFeVVa8b9YgE6bICRl+l1MtCGvhTKzyJIqsE88ulrjIxSZSGQwtUlvRpPy0ow8Skuf0VvoO9mh8kk4zMenM57RSlx7a7udlYZgUihRwDr+Oc6Puaje/nfrGb1YrX6ldkjkM8xq4dMtglmWjG+ph05wJyFerVcRa/aNpsZDIKgnAl8uiUafWXR3caeytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ5/08nZpmnnfHneS4J+YOs+5rdGCESbfABK+UEjpDg=;
 b=FNQ/MNPNGJ1UWcboqAvycmUUBzfnnyj3dGivYMdVSp5A6bD3tqHOa5El06K1qstI+/BZlnWcbTwExtHLNsYnAMS9w/jXzJAD0l0T5kT80SgcZLXFE+R3AAazbs0OQJGV+bLekUaBobRA4pynWQAeog5bfpEFqC8Bn5eVRVBv8YdxmH5WmzKSSQGSGUTLj/WmZARxFtwW1en8+/o6L2MTaR+oEm/k37cl/nDemvm8TSMgLp4FBL3cgafiGABYUS2d/0Pu1vAAmyOzx+oe6T6osKW5t4OmBZSIBpYplz0OjefkbPWIb7+F443T1jZ3ap/A21rqE1zwi6vuLFiMsZKnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Thu, 27 Jun
 2024 14:23:45 +0000
Received: from IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147]) by IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147%6]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 14:23:45 +0000
From: "Senna Tschudin, Peter" <peter.senna.tschudin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kmod: unload mei_gsc_proxy for Intel drivers
Thread-Topic: [PATCH i-g-t] lib/igt_kmod: unload mei_gsc_proxy for Intel
 drivers
Thread-Index: AQHax9DqWmn5B90g3kqpcJPX6T+sILHbqw5A
Date: Thu, 27 Jun 2024 14:23:45 +0000
Message-ID: <IA1PR11MB78240E35C5E94BB8FAF3ADE2D4D72@IA1PR11MB7824.namprd11.prod.outlook.com>
References: <20240626135755.48042-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240626135755.48042-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, en-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7824:EE_|SN7PR11MB7468:EE_
x-ms-office365-filtering-correlation-id: 3f6226f5-127a-4fb0-f3f4-08dc96b4c0ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dmlPeGh3aERVQ1dpN3IvQWM4VkY4UnE0RnRvMGtaODJodDJjY2xmSi8wTHFQ?=
 =?utf-8?B?YktZcnp0Ni84ZU5hcFc5SzFrU0xhRmxFUnlwUDh6eEJGSkN1Qk9XQU9jWTFs?=
 =?utf-8?B?eHdDV1J2SVY0K09nRlMzWHpXRmRIbkg5YkJ3Wk1DVldwem5DbHF2ZHhKUjNV?=
 =?utf-8?B?SGhRLzNvMUh0bnY4ZWIra3NTWXhNSy9WMDl5VHZVV1ZFQmlRZnd6V0lpV09V?=
 =?utf-8?B?VW5KdmFxbmxHajR6UzErUWhnQVlGYktVbStBdHdIWXdZeW1WZFNnQ0hpQ0Ry?=
 =?utf-8?B?VXU1WWlnQTFRaWdPVld1TkVlOC9lbDlReVV5bGdNRUdjOE5qNFAzbUtGcTd2?=
 =?utf-8?B?VHplOUF6ZGNaYjd4Z2R4NEd5L0FLaTRJWG54dmxZK2VOYldSWTQyaWFFbHZ6?=
 =?utf-8?B?UjJmZjdtMXNGeVpqM2tOSU85UDNiNHRLZ0JGWWdMRHJuU0oyUmpUS0J0Wmhu?=
 =?utf-8?B?STFLZjBHQ3IyZzFXNW56REZZR2pkTkNxM3ByUFJQQXhkZXd3dUQwRTVJQk5U?=
 =?utf-8?B?a3dmMnR6bVd0QTNoQmx2YXlLcUFVTmxSa2w2VkwrV3NGL3BvYnlCS1dBeVdy?=
 =?utf-8?B?cnJIUE9XcVB2TExqMWRlbXJSSEpGazUwT1VLQmxvbXk0MGl1TEpFcGZYZU95?=
 =?utf-8?B?eWcxSXlVL29uODB5VnV2YjVZcWozU2J0aGRHaWRvYWRhdjlWL0NGbTZURUtw?=
 =?utf-8?B?LytJN3JFQ2ViL0NpT3JtQ3pjOXk4UWN0MHFvN0I2L1pWYUpKd0V6U2NvZVY2?=
 =?utf-8?B?aVZLZS9aK1RMODVRTkFBZmIxWnczOXJrUHloZTJjeThhNTZFUjFWNkVwTUlY?=
 =?utf-8?B?N1lVK0pGNVFuZE9sTmlFK0ZXT3dvbmlaNTgyUG1BOS8zNnZaZU1NOStzbUVG?=
 =?utf-8?B?QUgwYVRFRCtvZzJIWnFvMzFHTHNaaHJDQ29yYmFTaUJTK1h3VW1rS1h6RzA2?=
 =?utf-8?B?cThOTmJMdGx1NWcydUh1dmhEL0ZqOCtpbVJLUmo4dGZqMy9ka3g3U2l6LzZ5?=
 =?utf-8?B?MERNVmlEYkY1b2U2bXoxTTd1RzNnU0JFaktYVUhwbWpFcW5xNVZPcTdVMHEz?=
 =?utf-8?B?ZzhGUUp5dTRqNFk5alJTZlM1SkQ0Y2U1K0I2a25GbnJDMmpmVUZXQkJVUGpa?=
 =?utf-8?B?dGZxSHMvTStyd0dsTTJBT3MxV0lybDVvSVZMbTFYZURVVXc1Si9ibksybFBY?=
 =?utf-8?B?NXdVM0FNWkJWVjA0Qk1zUTF4QkttcXZidDl0cUZwSUltSi95UXpEMnoxSXpN?=
 =?utf-8?B?SEIzYWgzUmlSU3JJN1I3QlQwckFmdTZDZ3JpdUIxd2VNL3V4Q0FWdHpLQlZt?=
 =?utf-8?B?YkhFUWRZY0NmaGNlb3lTbkFsRWRHVTBGYWNEbGUyWTQzUElOK2JaOGs4VE9P?=
 =?utf-8?B?U3UreW5paEdrOCt0YnoyaDl1Rm13UU1RLzdDTU1KZmo1TnU0RWQ1TDFEMThr?=
 =?utf-8?B?dGlvVDBBTEtwZDdFQWUwOHVtSU0yVmhEWUVDRFhDZ2s3THB5SUJkVmNncXU1?=
 =?utf-8?B?UlZHY3BNZi9DRTZGdE14cEVrT3A4NW9KZ0xpdnpwVFpiVTAyTG5QS3N6RG0w?=
 =?utf-8?B?YTMwUnkvaVZNRHJ1dWJYQ0dNSENYT1Q0QVJSWVo0M1FtdzVOeWxVM3NYTEZi?=
 =?utf-8?B?cTNGRnVBd3pZVnZhOGNZcjcxVC9nU25ET3ZBWnRWbVNJbUNHbEU2czhvUE9r?=
 =?utf-8?B?WFVacGo4SlowdWtMR0g3UHp2Rjk1bS8wOTV4RElmdGtMai84QnptTUhRYm9V?=
 =?utf-8?B?WklFb1VYeWV6WGg4ZW9MNW9QMFlzN2lrQis4NVVER2dnRTBzdUt5MjNSeGlo?=
 =?utf-8?B?MXI5VkNVbEFVMmlKNG5LRmdEV1M3LzB0TmNZcXJCRDJYYk9GQ3VXSURNSjZZ?=
 =?utf-8?B?ZVpiRXVQSTRWN1ZpOEF0eHNXdlVEdmNSa2JnYUNmNkRKTXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2d6bEc2c1JiUldUUHFvUDVxN3MrMnVVTmJpQlFTbm5aK2lWWG5HME9xWUZq?=
 =?utf-8?B?MTRaVC9jTnp5S1kyZnNZd0NidEtTWktOS0pLeFVZL1Rrdm5SZUNwVG9ibjll?=
 =?utf-8?B?WjVDZEl1M3BKWjJ3UU5MV1hiVzVvRkNTVXRQN2FZVnpZN2FoUk1ndGRkQnlR?=
 =?utf-8?B?a2E5L25JcUMxdDlYeE9PTjZ2NTNxK3M0YVhLaTRveWQrQzRBbGdxTTR0bFVi?=
 =?utf-8?B?UzZBRGZ6UnQwQWh1R1BMbndtaDlqU0cyQk0vUGQ5SjgzSUltQkFabWllUTBu?=
 =?utf-8?B?dTNNR3kwODRqd1llU016WlZjdXdsbEFQTW4xZkIzREJsWnlRemxoUitsY3hj?=
 =?utf-8?B?ZnEzL0V4UXlHNldSMFNtNXJjb3Y0Q3RBRjRnNmV0TW9HcVB3Rk9vVjY2ajBR?=
 =?utf-8?B?eW0wY2Z2Q3FqRGFUMG5sdnRMVm1DTE9IYXN4eHpLRDNEdmNZM1NUZm0vZ1B5?=
 =?utf-8?B?TFo3Z0tYd1J3N3UybnZwZVkyMGFJNmd4R0Z6ZFdLQnY4MS9vOVhicmxtdmhW?=
 =?utf-8?B?SXpVVFlObHVpUExhVkJ0cWNFN3k0R21zeERzUHlYOVlHZWVXdXY5b2ZUTjdo?=
 =?utf-8?B?bjhodVM0aFJESzZQOHFPbnd0cmNJcEMzLzIyQXhuNmNYRjcyZnhMVlVGSGQv?=
 =?utf-8?B?dDJ3YzdXQlh5UEpaVGZ6ZFExSDJYYWRoN2N4a2tPSnFJbld5NHo3L0RCcUZk?=
 =?utf-8?B?Y1ovUG9DYktlVUgybXFKRUlCNEMrQ3BaNmppVkg2aVZZSHpTMjlwU2xWQTBp?=
 =?utf-8?B?L1ZRNS9CdjUvczBaMXBmUER4d0p5TkFVTGFibm1aY0RsdXV3RHdvVWRUbGo4?=
 =?utf-8?B?eHpYNjFSRWlIaUxCY25EamU3ZU5nWmxUMTlhOE91UGNlWHBxcmJWbkR0Snl1?=
 =?utf-8?B?RlVsWmxnaHIya1h3UVcyQ2cybzRHVExYSUc1ZmxvVHhTZ1JyazhnUExZY3BH?=
 =?utf-8?B?V3A4RWd1WnVVVmI3ejBycEhmSWs1YkZ0dVNDbU5GcU1aMmlCUnUyLzk3M3lF?=
 =?utf-8?B?d2FCWEVsVXpQbVZyUVVsYnh5VzhpaHdpOXo5UzdCcjhBOG9LZ0tELzVjclpD?=
 =?utf-8?B?dVdmYzl4MmRkQ3JpdHhjSStiVlMzQnNYeHV2WG9jTU9CSTJNOWx2MWtmbWxD?=
 =?utf-8?B?TjBGSjJoN3B5bVIzS0cwV3ZrLzc2dTBjWlFhRHFHbDFpV3VJQU9KMG9nNFJ3?=
 =?utf-8?B?VWtuRGwwV0FybFdNQUFIWDJPcFpuMm5ucm9LR2FKVllmQ2pxUWZxSmQ2em5F?=
 =?utf-8?B?NHJOcWpWdndjZzAzMGJpNkZOUGZibjdPNVU4L1FyMzh3VnFJaEhqTDIrSFIv?=
 =?utf-8?B?S1lmczZXcXp4RWcrMVJzN3VRUUF3VGxXei9LUkhEdXNlWGs5M05qZEtaSG9t?=
 =?utf-8?B?NWc5RG8yKytxTVlndFJXQmxnV0RwUmRSSEw0cGIxYnhwS3hGNW5yM1NRdm5Y?=
 =?utf-8?B?ZWlhNHRkK1Qwb0Vrb3lycWZCN0E2VGpHdDdlcjB3YzI4NzQ5MG1TbHVsK2pO?=
 =?utf-8?B?RlRidHd5akowUFoyalFZY2QyZjhGYXl3Wi9MZktQcXQwZ2VHQWwyN3VDZ1ZI?=
 =?utf-8?B?WS9HU1RSUjNLZXVwNnYrUDBZL2xZekozaDZtc0RGZEVQaUk2MEhEbDF0bm9U?=
 =?utf-8?B?cXdNTU5DT0Q1VWdzRFlWVjVUVGE4RFJjcmpXRmYxTjJpS0hLcHlQTmExYW5y?=
 =?utf-8?B?M0NDdXBaSHhUSHZvb0dXNW9TdGswRTZOaTNLVjFYQkFobWN5YURXaVBRVWZM?=
 =?utf-8?B?amtLZk0ya25yQ2R1U1pBdkJ0WC8rd1lJUnJUTGNxWFBVb0J0b1lPbnhDNitO?=
 =?utf-8?B?YnFCUUZjL1BVTnMzUGpDQ3NlVHFPMVlvbUJ2ZnhTbUZ6Q3BJcFhpcWkrN1po?=
 =?utf-8?B?K0YvZllUdGtHMDZjMTdrbXIrY3MzeWQwb0Q1LzNwOG5SaUNqSEtvSEcwVGdm?=
 =?utf-8?B?Ni94YnFWcER0ZGF5bUlzVUlMaUdISVJxVCs5NEV3WnpKeWNLR0lXRmwrYkpQ?=
 =?utf-8?B?K0R2ck9scjNpck5SUmVKdDdtTmNXcFowZng4V29jTTVEbEMzLys2aFdSM3hl?=
 =?utf-8?B?bEV1eDhFQU5BVDRuZktDZnZTa0QrSDF4dU1XMnNvOW5zK29VRmh5b25OMUh4?=
 =?utf-8?B?cUhicHFjMzZOMzdZaTczQjMvV0ZJbVdtbjUzMXJjSG9mNG9uOGt6d29XMkYr?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6226f5-127a-4fb0-f3f4-08dc96b4c0ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 14:23:45.4346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IRAyMAvUCu/drX2w0fe1lJSj0T+/YC1ZPc9V0JMWpt7DBPq9qkB6DjBgfyn543qIK0NHR8ViNhWFlCt/FdXMxKJ4t/I5jX4p67Ufr6INdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsDQo+IEtv
bmllY3pueQ0KPiBTZW50OiBNaXR0d3VjaCwgMjYuIEp1bmkgMjAyNCAxNTo1OA0KPiBUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IFVzeXNraW4sIEFsZXhhbmRlcg0KPiA8YWxleGFu
ZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pZ3Rf
a21vZDogdW5sb2FkIG1laV9nc2NfcHJveHkgZm9yIEludGVsIGRyaXZlcnMNCj4gDQo+IEZvciBJ
bnRlbCBpOTE1IG9yIFhlIGRyaXZlcnMgd2Ugc2hvdWxkIHVubG9hZCBtZWlfZ3NjX3Byb3h5IGJl
Zm9yZSBtZWlfZ3NjLA0KPiBvdGhlcndpc2UgdW5sb2FkaW5nIG1laV9nc2MgY291bGQgZmFpbC4N
Cj4gDQo+IENjOiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51
eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGliL2lndF9rbW9kLmMgfCAyICsrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbW9k
LmMgYi9saWIvaWd0X2ttb2QuYyBpbmRleCAzM2YwNTkxOTkuLmNhMTQxODZhOA0KPiAxMDA2NDQN
Cj4gLS0tIGEvbGliL2lndF9rbW9kLmMNCj4gKysrIGIvbGliL2lndF9rbW9kLmMNCj4gQEAgLTYy
Myw2ICs2MjMsOCBAQCBpbnQgX19pZ3RfaW50ZWxfZHJpdmVyX3VubG9hZChjaGFyICoqd2hvLCBj
b25zdCBjaGFyDQo+ICpkcml2ZXIpDQo+ICAJCS8qIG1laV9nc2MgdXNlcyBhbiBpOTE1IGF1eCBk
ZXYgYW5kIHRoZSBvdGhlciBtZWkgbW9kcw0KPiBkZXBlbmQgb24gaXQgKi8NCj4gIAkJIm1laV9w
eHAiLA0KPiAgCQkibWVpX2hkY3AiLA0KPiArCQkvKiBtZWlfZ3NjX3Byb3h5IHNob3VsZCBiZSB1
bmxvYWRlZCBiZWZvcmUgbWVpX2dzYyAqLw0KPiArCQkibWVpX2dzY19wcm94eSIsDQo+ICAJCSJt
ZWlfZ3NjIiwNCj4gIAkJTlVMTCwNCj4gIAl9Ow0KPiAtLQ0KPiAyLjQzLjANCg0KUmV2aWV3ZWQt
Ynk6IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxwZXRlci5zZW5uYS50c2NodWRpbkBpbnRlbC5jb20+
DQpJbnRlbCBTZW1pY29uZHVjdG9yIEFHDQpSZWdpc3RlcmVkIE5vLiAwMjAuMzAuOTEzLjc4Ni03
DQpSZWdpc3RlcmVkIE9mZmljZTogRHVmb3Vyc3RyYXNzZSAxMDEgLCA4MDA4IFp1cmljaCwgU3dp
dHplcmxhbmQK

